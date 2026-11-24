#!/usr/bin/env python3
"""Pinned Alpoge RH Lean O(B+V+E) source-import map + cached URT rank-2 priorities.

The output is NOT a Lean proof-term dependency graph or a human proof.
With network, use a sparse-history partial clone of the pinned upstream commit.
The runner deliberately retains all source-import edges and their provenance.
"""
import argparse, collections, gzip, hashlib, json, math, pathlib, re
import resource, subprocess, tempfile, time, sys

PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
URL='https://github.com/leanprover-community/riemann-hypothesis.git'
PHI=(1+math.sqrt(5))/2
ANGLE=2*math.pi/PHI**2
SCALE=math.pi/math.e
IMP=re.compile(r'^\s*import\s+(.*)$')


def imports_and_hash(p):
    h=hashlib.sha256(); deps=[];depth=0;lines=0;bytes_read=0
    with p.open('rb') as fh:
        for b in fh:
            lines+=1;bytes_read+=len(b);h.update(b)
            s=b.decode('utf8','replace');visible=[];i=0;quote=False
            while i<len(s):
                two=s[i:i+2]
                if depth:
                    if two=='/-':depth+=1;i+=2;continue
                    if two=='-/':depth-=1;i+=2;continue
                    i+=1;continue
                if quote:
                    if s[i]=='\\':i+=2;continue
                    if s[i]=='"':quote=False
                    i+=1;continue
                if two=='--':break
                if two=='/-':depth+=1;i+=2;continue
                if s[i]=='"':quote=True;i+=1;continue
                visible.append(s[i]);i+=1
            m=IMP.match(''.join(visible))
            if m:deps.extend(m.group(1).strip().split())
    return {'imports':list(dict.fromkeys(deps)),'sha256':h.hexdigest(),
            'lines':lines,'size':bytes_read}


def index(root,cache,force=False):
    try:
        prev=json.loads(cache.read_text()) if cache.is_file() else {}
        if prev.get('format')!=2:prev={}
    except (OSError,ValueError):prev={}
    old=prev.get('modules',{});current={};changed=[];read=0;hits=0
    for p in root.rglob('*.lean'):
        if '.lake' in p.parts or '.git' in p.parts:continue
        key=p.relative_to(root).with_suffix('').as_posix().replace('/','.')
        st=p.stat();rec=old.get(key)
        if not force and rec and rec['size']==st.st_size and rec['mtime_ns']==st.st_mtime_ns:
            current[key]=rec;hits+=1;continue
        new=imports_and_hash(p);read+=new['size'];new['mtime_ns']=st.st_mtime_ns
        current[key]=new
        if not rec or rec['sha256']!=new['sha256']:changed.append(key)
    removed=list(set(old)-set(current));reverse=collections.defaultdict(list)
    for key,rec in current.items():
        for d in rec['imports']:reverse[d].append(key)
    for key,rec in old.items():
        for d in rec['imports']:reverse[d].append(key)
    invalid=set(changed+removed);q=collections.deque(invalid)
    while q:
        for dep in reverse[q.popleft()]:
            if dep not in invalid:invalid.add(dep);q.append(dep)
    cache.parent.mkdir(parents=True,exist_ok=True)
    tmp=cache.with_suffix('.tmp');tmp.write_text(json.dumps({'format':2,'modules':current}))
    tmp.replace(cache)
    return current,{'cache_hits':hits,'reparsed':len(current)-hits,'source_bytes_reopened':read,
                    'changed_modules':len(changed),'deleted_modules':len(removed),
                    'reverse_invalidations':len(invalid)}


def closure(nodes):
    if 'Main' not in nodes:raise ValueError('Full source tree must contain Main.lean')
    q=collections.deque(['Main']);seen={'Main'};order=[];edges=[];external=set()
    while q:
        v=q.popleft();order.append(v)
        for u in nodes[v]['imports']:
            if u not in nodes:external.add(u);continue
            edges.append((v,u))
            if u not in seen:seen.add(u);q.append(u)
    return order,edges,external


def urt_priorities(order,edges):
    """Woodbury 2x2 (D+UU^T)x=b in O(V+E). Not an RH proof theorem."""
    indeg=collections.Counter(b for _,b in edges)
    outdeg=collections.Counter(a for a,_ in edges)
    n=len(order);scale=math.sqrt(SCALE/n)
    d=[1+indeg[v] for v in order]
    b=[1+outdeg[v] for v in order]
    uv=[(scale*math.cos(i*ANGLE),scale*math.sin(i*ANGLE)) for i in range(n)]
    a00=a11=1.;a01=z0=z1=0.
    for (u,v),di,bi in zip(uv,d,b):
        a00+=u*u/di;a01+=u*v/di;a11+=v*v/di
        z0+=u*bi/di;z1+=v*bi/di
    det=a00*a11-a01*a01
    if det<=0:raise ArithmeticError('2x2 Schur matrix singular')
    c0=(a11*z0-a01*z1)/det;c1=(a00*z1-a01*z0)/det
    x=[(bi-u*c0-v*c1)/di for (u,v),di,bi in zip(uv,d,b)]
    w0=sum(t[0]*val for t,val in zip(uv,x))
    w1=sum(t[1]*val for t,val in zip(uv,x))
    resid=max(abs(di*val+u*w0+v*w1-bi) for (u,v),di,bi,val in zip(uv,d,b,x))
    if resid>1e-8:raise AssertionError('URT rank-2 model residual too large')
    return x,resid


def report(root,out,pinned):
    out.mkdir(parents=True,exist_ok=True)
    cache=out/'source_import_cache.json'
    t=time.perf_counter();files,cold=index(root,cache,force=True);cold_t=time.perf_counter()-t
    t=time.perf_counter();again,warm=index(root,cache);warm_t=time.perf_counter()-t
    assert cold_t>=0 and warm['reparsed']==0 and warm['source_bytes_reopened']==0
    assert all(files[k]['sha256']==again[k]['sha256'] for k in files)
    t=time.perf_counter();order,edges,missing=closure(files);weights,res=urt_priorities(order,edges)
    graph_t=time.perf_counter()-t
    if pinned and len(files)<10000:raise AssertionError('Pinned upstream is incomplete (<10k files)')
    manifest=hashlib.sha256()
    for k in sorted(files):manifest.update((k+'\0'+files[k]['sha256']+'\n').encode())
    g=out/'root_import_dag.json.gz'
    with gzip.open(g,'wt',encoding='utf8') as f:
        json.dump({'kind':'SOURCE_IMPORT_DAG_NOT_KERNEL_PROOF','sha':pinned,
                   'modules':order,'edges':edges,'outside_imports':sorted(missing),
                   'urt_scores':dict(zip(order,weights))},f)
    c=out/'source_file_shas.json.gz'
    with gzip.open(c,'wt',encoding='utf8') as f:
        json.dump({k:r['sha256'] for k,r in files.items()},f)
    summary={'status':'SOURCE_IMPORT_DAG_ONLY_NOT_KERNEL_VERIFIED',
             'upstream_repo':URL,'upstream_commit_verified':pinned or 'LOCAL_FIXTURE_NOT_VERIFIED',
             'total_lean_modules':len(files),'total_lean_lines':sum(v['lines'] for v in files.values()),
             'total_lean_bytes':sum(v['size'] for v in files.values()),
             'reachable_import_modules':len(order),'reachable_import_edges':len(edges),
             'external_import_count':len(missing),'manifest_sha256':manifest.hexdigest(),
             'cold_full_scan_s':cold_t,'warm_cached_scan_s':warm_t,'graph_urt_s':graph_t,
             'warm_source_bytes_reopened':warm['source_bytes_reopened'],
             'urt_rank2_max_residual':res,'max_rss_kib':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,
             'limits':['Module imports only, not elaborated Lean theorem dependencies',
                       'Warm cache trusts mtime + file size; strict mode rehashes entire source',
                       'No evidence that golden phase accelerates proof translation',
                       'O(B+V+E) for core scan/traversal; sorting manifest is O(V log V)']}
    (out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    cache.unlink(missing_ok=True)
    return summary


def git(*a,cwd=None):
    return subprocess.run(['git',*a],cwd=cwd,check=True,text=True,
                          stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=3300).stdout.strip()


def main():
    p=argparse.ArgumentParser();p.add_argument('--out',type=pathlib.Path,required=True)
    p.add_argument('--source-dir',type=pathlib.Path)
    args=p.parse_args()
    if args.source_dir:
        result=report(args.source_dir,args.out,None)
    else:
        with tempfile.TemporaryDirectory(prefix='rh_pinned_upstream_') as td:
            dest=pathlib.Path(td)/'source';git('init','-q',str(dest))
            git('remote','add','origin',URL,cwd=dest)
            git('-c','protocol.version=2','fetch','-q','--depth=1','--filter=blob:none','origin',PIN,cwd=dest)
            git('checkout','-q','--detach','FETCH_HEAD',cwd=dest)
            head=git('rev-parse','HEAD',cwd=dest)
            if head!=PIN:raise AssertionError('Pinned upstream SHA mismatch: '+head)
            result=report(dest/'src',args.out,head)
    print(json.dumps({k:v for k,v in result.items() if k!='limits'},indent=2))


if __name__=='__main__':
    if len(sys.argv)==1:
        print('Dedicated RH compute job: call with --out; skipped by generic archive sweep')
    else:
        main()
