#!/usr/bin/env python3
"""Pinned Git blob cache + transitive import context keys (not Lean elaboration).
Use: python git_context_cache.py REPO REV CACHE_DB --environment DIGEST --out manifest.json
The cache is shared across revisions and workers. Only immutable Git objects
are trusted, not working-tree size/mtime. Unknown source syntax is flagged.
"""
import argparse, collections, hashlib, json, pathlib, re, sqlite3, subprocess, time, resource
SCHEMA='lex-context-v2'
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
NAME=r'(?:[^\W\d][\w\'₀-₉]*|«[^»\n]+»)(?:\.(?:[^\W\d][\w\'₀-₉]*|«[^»\n]+»))*'
IMPORT=re.compile(r'^\s*(?:(?:public|private|meta)\s+)*import\s+(.*)$')
DECL=re.compile(r'^\s*(?:(?:private|protected|noncomputable|unsafe|partial|public|meta)\s+)*(theorem|lemma|def|abbrev|opaque|axiom|structure|inductive|class)\s+('+NAME+r')')
TOKEN=re.compile(NAME)

def lex(raw):
    s=raw.decode('utf-8',errors='strict'); buf=[]; i=0; depth=0; quote=False; flags=[]
    while i<len(s):
        c=s[i]; pair=s[i:i+2]
        if depth:
            if pair=='/-': depth+=1; buf.append('  '); i+=2; continue
            if pair=='-/': depth-=1; buf.append('  '); i+=2; continue
            buf.append('\n' if c=='\n' else ' '); i+=1; continue
        if quote:
            if c=='\\' and i+1<len(s): buf.append('  '); i+=2; continue
            if c=='"': quote=False
            buf.append('\n' if c=='\n' else ' '); i+=1; continue
        if pair=='/-': depth=1; buf.append('  '); i+=2; continue
        if pair=='--':
            end=s.find('\n',i); end=len(s) if end<0 else end
            buf.append(' '*(end-i)); i=end; continue
        if c=='"': quote=True; buf.append(' '); i+=1; continue
        if c=='«':
            end=s.find('»',i+1)
            if end<0: flags.append('unterminated_quoted_name'); end=len(s)-1
            buf.append(s[i:end+1]); i=end+1; continue
        buf.append(c); i+=1
    if depth or quote: flags.append('unfinished_comment_or_string')
    if re.search(r'\br#*"|\bs!"|\bm!"|\bsyntax\b|\bmacro\b',s): flags.append('raw_interpolated_or_macro_syntax_review')
    imports=[]; decls=[]; header=True; prev_import=False
    for line_no,line in enumerate(''.join(buf).splitlines(),1):
        x=line.strip()
        if not x: continue
        if x in ('module','prelude'): continue
        m=IMPORT.match(line)
        if m:
            rest=m.group(1).strip(); mode='ordinary'
            if rest.startswith('all '): mode='all'; rest=rest[4:]
            if not re.fullmatch(NAME,rest): flags.append(f'import_syntax_review:{line_no}')
            # Lean imports normally one module per command; keep every candidate.
            imports.extend(TOKEN.findall(rest)); prev_import=True
            if not header: flags.append(f'late_import:{line_no}')
            continue
        if re.match(r'(?:(?:public|private|meta)\s+)*import\b',x): flags.append(f'import_syntax_review:{line_no}')
        if header and prev_import and line[:1].isspace(): flags.append(f'possible_import_continuation:{line_no}')
        header=False; prev_import=False
        d=DECL.match(line)
        if d: decls.append([d.group(1),d.group(2),line_no])
        elif re.search(r'\b(theorem|lemma|def|abbrev|opaque|axiom|structure|inductive|class)\s+',x) and x.startswith(('@[','private ','protected ','noncomputable ','mutual')): flags.append(f'declaration_syntax_review:{line_no}')
    return {'imports':list(dict.fromkeys(imports)), 'declarations':decls,'flags':list(dict.fromkeys(flags))}

def digest(x): return hashlib.sha256(json.dumps(x,ensure_ascii=False,separators=(',',':')).encode()).hexdigest()
def git(repo,*args): return subprocess.check_output(['git','-C',str(repo),*args])
def inventory(repo,rev):
    commit=git(repo,'rev-parse','--verify',rev+'^{commit}').decode().strip()
    data=git(repo,'ls-tree','-r','-z',commit,'--','src')
    files={}
    for entry in data.split(b'\0'):
        if not entry: continue
        meta,p=entry.split(b'\t',1); mode,kind,oid=meta.decode().split(); path=p.decode('utf8')
        if not path.endswith('.lean'): continue
        if kind!='blob' or mode not in ('100644','100755'): raise ValueError('non-regular Lean source '+path)
        key=path[4:-5].replace('/','.')
        if key in files: raise ValueError('module path collision '+key)
        files[key]=(path,oid)
    if 'Main' not in files: raise ValueError('missing src/Main.lean')
    return commit,files

class Batch:
    def __init__(self,repo):
        self.p=subprocess.Popen(['git','-C',str(repo),'cat-file','--batch'],stdin=subprocess.PIPE,stdout=subprocess.PIPE)
    def get(self,oid):
        self.p.stdin.write((oid+'\n').encode()); self.p.stdin.flush()
        fields=self.p.stdout.readline().decode().split()
        if len(fields)!=3 or fields[0]!=oid or fields[1]!='blob': raise ValueError('wrong object '+str(fields))
        size=int(fields[2]); b=self.p.stdout.read(size)
        if len(b)!=size or self.p.stdout.read(1)!=b'\n': raise ValueError('truncated cat-file response')
        h=hashlib.new('sha1' if len(oid)==40 else 'sha256'); h.update(f'blob {size}\0'.encode()); h.update(b)
        if h.hexdigest()!=oid: raise ValueError('Git object digest mismatch')
        return b
    def close(self):
        self.p.stdin.close(); self.p.stdout.close()
        if self.p.wait()!=0: raise RuntimeError('cat-file failed')

def parse_cache(repo,files,dbpath):
    db=sqlite3.connect(dbpath,timeout=120); db.execute('PRAGMA journal_mode=WAL'); db.execute('PRAGMA busy_timeout=120000')
    db.execute('CREATE TABLE IF NOT EXISTS parsed (schema TEXT, oid TEXT, record TEXT, PRIMARY KEY(schema,oid))'); db.commit()
    records={}; misses=hits=bytes_read=0; batch=Batch(repo); pending=[]
    try:
        for m,(path,oid) in files.items():
            r=db.execute('SELECT record FROM parsed WHERE schema=? AND oid=?',(SCHEMA,oid)).fetchone()
            if r: rec=json.loads(r[0]); hits+=1
            else:
                b=batch.get(oid); bytes_read+=len(b); misses+=1; rec=lex(b)
                db.execute('INSERT OR IGNORE INTO parsed VALUES (?,?,?)',(SCHEMA,oid,json.dumps(rec,ensure_ascii=False,separators=(',',':'))))
                if misses%512==0: db.commit()
            records[m]={'path':path,'oid':oid,**rec}
        db.commit()
    finally:
        batch.close(); db.close()
    return records,{'hits':hits,'misses':misses,'source_bytes_read':bytes_read}

def graph(records,environment):
    # All local import edges retained, all unmatched names retained as boundaries.
    reverse=collections.defaultdict(list); indeg={}; edge_count=0; boundary=[]
    for m,r in records.items():
        indeg[m]=0
        for d in r['imports']:
            reverse[d].append(m)
            if d in records: indeg[m]+=1; edge_count+=1
            else: boundary.append((m,d))
    q=collections.deque(m for m,n in indeg.items() if n==0); context={}; eligible={}; order=[]
    while q:
        m=q.popleft(); r=records[m]; order.append(m)
        local=[(d,context[d] if d in records else 'BOUNDARY:'+environment) for d in r['imports']]
        context[m]=digest([SCHEMA,environment,m,r['oid'],local])
        # Not a semantic certificate. Flagged source or unresolved environment invalidates eligibility.
        eligible[m]=not r['flags'] and all(eligible[d] if d in records else False for d in r['imports'])
        for p in reverse[m]:
            indeg[p]-=1
            if indeg[p]==0: q.append(p)
    if len(order)!=len(records): raise ValueError('local import graph cycle; refuse context keys')
    seen={'Main'}; q=collections.deque(seen)
    while q:
        for d in records[q.popleft()]['imports']:
            if d in records and d not in seen: seen.add(d); q.append(d)
    return {'local_edges':edge_count,'boundary_edges':boundary,'reachable':len(seen),'topological_order':order,'context_keys':context,'lexically_clean_closed_context':eligible}

def changed(old,new):
    return [m for m in old.keys()|new.keys() if old.get(m)!=new.get(m)]

def run(repo,rev,cache,environment):
    t=time.perf_counter(); commit,files=inventory(repo,rev); tree_s=time.perf_counter()-t
    t=time.perf_counter(); records,stats=parse_cache(repo,files,cache); parse_s=time.perf_counter()-t
    t=time.perf_counter(); g=graph(records,environment); graph_s=time.perf_counter()-t
    # Candidate declaration inverted index: all colliding short names retained.
    candidates=collections.defaultdict(list)
    for m,r in records.items():
        for kind,name,line in r['declarations']:
            candidates[name.rsplit('.',1)[-1]].append([m,name,kind,line,r['oid']])
    return {'kind':'STATIC_LEXICAL_ONLY_NOT_KERNEL_GRAPH','revision':commit,'schema':SCHEMA,'environment':environment,'modules':len(records),'declaration_candidates':sum(map(len,candidates.values())),'ambiguous_short_names':sum(len(v)>1 for v in candidates.values()),'flagged_modules':sum(bool(r['flags']) for r in records.values()),'stats':stats,'tree_s':tree_s,'parse_s':parse_s,'graph_s':graph_s,'max_rss_kib':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'graph':g,'records':records,'candidate_index':dict(candidates)}

if __name__=='__main__':
    p=argparse.ArgumentParser(); p.add_argument('repo',type=pathlib.Path);p.add_argument('revision');p.add_argument('cache',type=pathlib.Path);p.add_argument('--environment',required=True,help='immutable toolchain + external environment digest; not a claim of kernel validation');p.add_argument('--out',type=pathlib.Path,required=True);a=p.parse_args()
    r=run(a.repo,a.revision,a.cache,a.environment)
    a.out.write_text(json.dumps(r,ensure_ascii=False,separators=(',',':')))
    print(json.dumps({k:v for k,v in r.items() if k not in ('graph','records','candidate_index')},indent=2))
