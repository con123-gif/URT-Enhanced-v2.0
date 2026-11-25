#!/usr/bin/env python3
"""Real Run22 request replay; declaration roots are not outgoing edges."""
import hashlib,json,math,os,resource,sqlite3,statistics,subprocess,sys,time
from collections import defaultdict,Counter
from pathlib import Path
SHA='45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf'
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
N=1484705
EXTRA=['CMBasePatch','SatSysPatch','IndexTwoPatch']
def ck(ok,msg):
    if not ok: raise ValueError(msg)
def canon(v): return json.dumps(v,ensure_ascii=False,separators=(',',':'))
def sha(p):
    with open(p,'rb') as f: return hashlib.file_digest(f,'sha256').hexdigest()
def rows(p):
    ck(sha(p)==SHA,'manifest hash'); n=refs=0
    with subprocess.Popen(['zstd','-dc','--',str(p)],stdout=subprocess.PIPE) as proc:
        for n,raw in enumerate(proc.stdout,1):
            d=json.loads(raw); name=d['nameParts']; refs+=len(d['refs'])
            yield (d['id'],n,canon(name),canon(name[-1]),d['kind'],canon(d['refs']),hashlib.sha256(raw).digest())
        ck(proc.wait()==0,'decompression')
    ck((n,refs)==(N,3035045) and sha(p)==SHA,'manifest census/hash')
def key(r):
    k,q=r['kind'],r['query']; ck(k in ('id','name','terminal'),'request kind')
    ck(type(q) is int if k=='id' else type(q) is list if k=='name' else type(q) in (str,int),'request type')
    return k,q if k=='id' else canon(q)
def build(p,db):
    ck(not db.exists(),'existing DB'); c=sqlite3.connect(db)
    try:
        c.execute('PRAGMA cache_size=-65536'); c.execute('PRAGMA temp_store=FILE'); c.execute('PRAGMA synchronous=FULL')
        c.executescript('CREATE TABLE decl(id INTEGER NOT NULL,seq INTEGER PRIMARY KEY,name TEXT NOT NULL,terminal TEXT NOT NULL,kind TEXT NOT NULL,refs TEXT NOT NULL,digest BLOB NOT NULL);CREATE TABLE receipt(k TEXT PRIMARY KEY,v TEXT NOT NULL);')
        c.executemany('INSERT INTO decl VALUES(?,?,?,?,?,?,?)',rows(p))
        c.executescript('CREATE UNIQUE INDEX alternate ON decl(id);CREATE UNIQUE INDEX exact_name ON decl(name);CREATE INDEX terminal_name ON decl(terminal);')
        c.executemany('INSERT INTO receipt VALUES(?,?)',dict(pin=PIN,manifest=SHA,count=str(N),layout='append',schema='compact-v1').items()); c.commit()
        ck(c.execute('PRAGMA integrity_check').fetchone()==('ok',),'integrity')
    finally: c.close()
def oracle(p,keys,c):
    groups=defaultdict(list); out={i:[] for i in range(len(keys))}; extra=[]
    for i,k in enumerate(keys): groups[k].append(i)
    cur=c.execute('SELECT * FROM decl ORDER BY seq')
    for row in rows(p):
        ck(cur.fetchone()==row,'full projection mismatch')
        for k in [('id',row[0]),('name',row[2]),('terminal',row[3])]:
            for i in groups.get(k,()): out[i].append(row)
        name=json.loads(row[2])
        if any(x in name for x in EXTRA) and name[-1] in ('main','patch'): extra.append(row)
    ck(cur.fetchone() is None,'extra projection row')
    return out,extra
def lookup(c,keys,mode):
    groups=defaultdict(list)
    for i,k in enumerate(keys): groups[k if mode!='independent' else (i,k)].append(i)
    ks=list(groups)
    if mode in ('golden','periodic'):
        a=2*math.pi/((1+math.sqrt(5))/2)**2 if mode=='golden' else 2*math.pi/24
        ks=[k for _,k in sorted(enumerate(ks),key=lambda z:(-math.cos(a*(z[0]+1)),z[0]))]
    out={}
    for k in ks:
        col,q=k[1] if mode=='independent' else k
        found=list(c.execute('SELECT * FROM decl WHERE '+col+'=? ORDER BY seq',(q,)))
        for i in groups[k]: out[i]=found
    return out
def encode(row): return [*row[:-1],row[-1].hex()]
def main(p,req,db,out):
    keys=[key(r) for r in json.loads(req.read_text())]; ck(len(keys)==331,'request count')
    start=time.perf_counter(); build_s=None
    if not db.exists(): build(p,db); build_s=time.perf_counter()-start
    t=time.perf_counter(); dbsha=sha(db); hash_ms=1000*(time.perf_counter()-t)
    start=time.perf_counter()
    with sqlite3.connect(db.resolve().as_uri()+'?mode=ro&immutable=1',uri=True) as c: truth,extra=oracle(p,keys,c)
    c.close(); scan_s=time.perf_counter()-start
    results={}; comparisons=0
    for mode in ('independent','shared','golden','periodic'):
        cold=[]; warm=[]; hashes=[]
        for _ in range(3):
            t=time.perf_counter(); hashes.append(hash_ms/1000)
            with sqlite3.connect(db.resolve().as_uri()+'?mode=ro&immutable=1',uri=True) as c:
                c.execute('PRAGMA cache_size=-8192')
                got=lookup(c,keys,mode); cold.append(time.perf_counter()-t); ck(got==truth,'cold mismatch'); comparisons+=1
                t=time.perf_counter(); got=lookup(c,keys,mode); warm.append(time.perf_counter()-t); ck(got==truth,'warm mismatch'); comparisons+=1
            c.close()
        results[mode]=[1000*statistics.median(x) for x in (cold,warm,hashes)]
    ck(sha(db)==dbsha,'post-run DB changed')
    statuses=Counter('missing' if not v else 'unique' if len(v)==1 else 'ambiguous' for v in truth.values())
    summary=dict(pin=PIN,manifest=SHA,db_sha=dbsha,db_bytes=db.stat().st_size,build_s=build_s,scan_s=scan_s,requests=len(keys),distinct=len(set(keys)),statuses=dict(statuses),candidate_occurrences=sum(map(len,truth.values())),comparisons=comparisons,median_ms=results,hash_ms=hash_ms,verified_rows=N,peak_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)
    data=dict(summary=summary,rows={i:[encode(r) for r in v] for i,v in truth.items()},extra=[encode(r) for r in extra])
    stage=out.with_suffix('.stage'); ck(not out.exists(),'output exists')
    with stage.open('x') as f: json.dump(data,f,ensure_ascii=False); f.flush(); os.fsync(f.fileno())
    os.replace(stage,out); print(json.dumps(summary),flush=True)
if __name__=='__main__': main(*map(Path,sys.argv[1:]))
