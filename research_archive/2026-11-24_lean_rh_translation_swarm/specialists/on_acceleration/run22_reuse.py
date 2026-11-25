#!/usr/bin/env python3
"""Receipt-keyed reuse of Run21 compact indexes; not kernel dependency extraction.
Trusted immutable cache directory required; not a hostile same-UID writer defense.
"""
import argparse, hashlib, json, math, os, sqlite3, statistics, tempfile, time, resource
from collections import defaultdict
from pathlib import Path
from contextlib import contextmanager

PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
MANIFEST='45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf'
DIGEST={'append':'6967b534c57a38bdec7deced48f8b2756c0bfade7f1454c5f1f0fe6c38e3403d','clustered':'9dbb0b3ba02e2aecce024c5ca8d123e30c6525c425f22c652f42d052045a96bf'}

def ck(ok,msg):
    if not ok: raise ValueError(msg)

def canon(x): return json.dumps(x,ensure_ascii=False,separators=(',',':'))
def receipt(mode): return dict(pin=PIN,manifest=MANIFEST,count='1484705',layout=mode,schema='compact-v1')
def digest(path):
    with open(path,'rb') as f: return hashlib.file_digest(f,'sha256').hexdigest()
def stamp(path):
    s=path.stat(); return (s.st_dev,s.st_ino,s.st_size,s.st_mtime_ns,s.st_ctime_ns)
def clean(path):
    ck(path.is_file() and not path.is_symlink(),'not a regular cache file')
    ck(not any(Path(str(path)+s).exists() for s in ('-wal','-shm','-journal')),'sidecar present')

@contextmanager
def authenticated(path,expected,sha):
    # Expected digest must come from trusted out-of-band publication, NOT the DB.
    path=Path(path).absolute(); clean(path); before=stamp(path)
    t=time.perf_counter(); ck(digest(path)==sha,'whole-file digest mismatch'); elapsed=time.perf_counter()-t
    ck(stamp(path)==before,'changed during digest'); clean(path)
    c=sqlite3.connect(path.as_uri()+'?mode=ro&immutable=1',uri=True)
    try:
        c.execute('PRAGMA cache_size=-8192'); c.execute('PRAGMA query_only=ON')
        ck(dict(c.execute('SELECT k,v FROM receipt'))==expected,'receipt mismatch')
        ck(stamp(path)==before,'changed during open')
        yield c,elapsed
        clean(path); ck(stamp(path)==before,'changed during use')
    finally: c.close()

def key(r):
    ck(type(r) is dict and set(r)=={'kind','query'},'request schema')
    k,q=r['kind'],r['query']
    if k=='id': ck(type(q) is int and q>=0,'id'); return k,q
    if k=='name': ck(type(q) is list and q and all(type(x) in (str,int) for x in q),'tagged name')
    elif k=='terminal': ck(type(q) in (str,int),'tagged terminal')
    else: raise ValueError('unknown lookup kind')
    return k,canon(q)

def ordered(keys,mode):
    ks=list(keys)
    if mode=='shared': return ks
    ck(mode in ('golden','periodic'),'schedule')
    a=2*math.pi/((1+math.sqrt(5))/2)**2 if mode=='golden' else 2*math.pi/24
    return [x for j,x in sorted(enumerate(ks),key=lambda p:(-math.cos(a*(p[0]+1)),p[0]))]

def rows_for(c,k):
    col,q=k; ck(col in ('id','name','terminal'),'column')
    yield from c.execute('SELECT * FROM decl WHERE '+col+'=? ORDER BY seq',(q,))

def batch(c,requests,mode='shared'):
    # Stream each unique result once; consumers retain all request indices.
    groups=defaultdict(list)
    for j,r in enumerate(requests): groups[key(r)].append(j)
    for k in ordered(groups,mode):
        n=0
        for row in rows_for(c,k):
            n+=1; yield ('row',tuple(groups[k]),row)
        yield ('status',tuple(groups[k]),('missing' if n==0 else 'unique' if n==1 else 'ambiguous',n))

def collect(events):
    out={}
    for typ,ids,row in events:
        for i in ids:
            slot=out.setdefault(i,[[],None]); ck(slot[1] is None,'after status')
            if typ=='row': slot[0].append(row)
            else: slot[1]=row
    return out

def independent(c,requests):
    out={}
    for i,r in enumerate(requests):
        a=list(rows_for(c,key(r))); n=len(a); out[i]=[a,('missing' if not n else 'unique' if n==1 else 'ambiguous',n)]
    return out

def scan(c,requests):
    # Independent scan oracle: preserve each occurrence and exact typed name parts.
    wanted=defaultdict(list); out={i:[[],None] for i in range(len(requests))}
    for i,r in enumerate(requests): wanted[key(r)].append(i)
    for row in c.execute('SELECT * FROM decl ORDER BY seq'):
        for k in (('id',row[0]),('name',row[2]),('terminal',row[3])):
            for i in wanted.get(k,()): out[i][0].append(row)
    for a in out.values():
        n=len(a[0]); a[1]=('missing' if not n else 'unique' if n==1 else 'ambiguous',n)
    return out

def fixture(path,n):
    c=sqlite3.connect(path)
    c.executescript('CREATE TABLE decl(id INTEGER NOT NULL,seq INTEGER PRIMARY KEY,name TEXT NOT NULL,terminal TEXT NOT NULL,kind TEXT NOT NULL,refs TEXT NOT NULL,digest BLOB NOT NULL);CREATE TABLE receipt(k TEXT PRIMARY KEY,v TEXT NOT NULL);')
    def rows():
        for i in range(n):
            name=['Fixture',i//5,'common'] if i%5==0 else ['Fixture',i,'x'] if i%5==1 else ['Fixture',i,'x.y'] if i%5==2 else ['Fixture',i,3 if i%5==3 else '3']
            yield i,i+1,canon(name),canon(name[-1]),'thm',canon([i+1,-i-1]),hashlib.sha256(str(i).encode()).digest()
    c.executemany('INSERT INTO decl VALUES(?,?,?,?,?,?,?)',rows()); c.executescript('CREATE UNIQUE INDEX alternate ON decl(id);CREATE UNIQUE INDEX exact_name ON decl(name);CREATE INDEX terminal_name ON decl(terminal);')
    expected=dict(receipt('append'),count=str(n),manifest='SYNTHETIC'); c.executemany('INSERT INTO receipt VALUES(?,?)',expected.items()); c.commit(); c.close(); return expected,digest(path)

def tests(n):
    with tempfile.TemporaryDirectory() as tmp:
        p=Path(tmp)/'fixture.sqlite'; expected,sha=fixture(p,n)
        base=[{'kind':'id','query':i} for i in range(50,150)]+[{'kind':'name','query':['Fixture',52,'x.y']},{'kind':'name','query':['Fixture',52,'x','y']},{'kind':'name','query':['Fixture',53,3]},{'kind':'name','query':['Fixture',53,'3']},{'kind':'terminal','query':'absent'},{'kind':'id','query':n+1}]
        requests=base*15
        with authenticated(p,expected,sha) as (c,h):
            truth=scan(c,requests); ck(truth[100][1]==('unique',1) and truth[101][1]==('missing',0) and truth[102][1]==('unique',1) and truth[103][1]==('missing',0),'typed name controls')
            ambiguous=[{'kind':'terminal','query':3},{'kind':'terminal','query':'3'}]; a=collect(batch(c,ambiguous)); ck(a==scan(c,ambiguous) and all(v[1][0]=='ambiguous' for v in a.values()),'ambiguous complete')
        out={'fixture_rows':n,'bytes':p.stat().st_size,'requests':len(requests),'unique':len(base),'ambiguous_rows':sum(x[1][1] for x in a.values()),'trials':7,'times':{}}
        for mode in ('independent','scan','shared','golden','periodic'):
            cold=[]; warm=[]; hashes=[]
            for _ in range(7):
                start=time.perf_counter()
                with authenticated(p,expected,sha) as (c,h):
                    hashes.append(h)
                    for times in (cold,warm):
                        t=start if times is cold else time.perf_counter()
                        got=independent(c,requests) if mode=='independent' else scan(c,requests) if mode=='scan' else collect(batch(c,requests,mode))
                        times.append(time.perf_counter()-t); ck(got==truth,'lost or changed row')
            out['times'][mode]={'reopened_auth_ms':1000*statistics.median(cold),'warm_ms':1000*statistics.median(warm),'hash_ms':1000*statistics.median(hashes)}
        def reject(fn):
            try: fn()
            except ValueError: return
            raise RuntimeError('negative accepted')
        def open_test(e,s):
            with authenticated(p,e,s): pass
        reject(lambda:open_test(expected,'0'*64)); reject(lambda:open_test(dict(expected,pin='wrong'),sha)); reject(lambda:key({'kind':'id','query':True}))
        side=Path(str(p)+'-wal'); side.write_bytes(b'bad'); reject(lambda:open_test(expected,sha)); side.unlink()
        with p.open('r+b') as f: f.seek(-1,2); b=f.read(1); f.seek(-1,2); f.write(bytes([b[0]^1]))
        reject(lambda:open_test(expected,sha))
        out.update(comparisons=70,negative_controls=5,peak_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss); return out

if __name__=='__main__':
    ap=argparse.ArgumentParser(); ap.add_argument('--selftest',type=int); ap.add_argument('--db'); ap.add_argument('--layout',choices=list(DIGEST),default='append'); ap.add_argument('--requests'); ap.add_argument('--schedule',choices=['shared','golden','periodic'],default='shared'); args=ap.parse_args()
    if args.selftest is not None:
        ck(args.selftest>=1000,'fixture size'); print(canon(tests(args.selftest)))
    else:
        ck(args.db and args.requests,'need db and request JSON array')
        requests=json.loads(Path(args.requests).read_text()); ck(type(requests) is list,'request list')
        # Output is provisional until successful process exit; caller must stage output.
        with authenticated(args.db,receipt(args.layout),DIGEST[args.layout]) as (c,h):
            for event in batch(c,requests,args.schedule):
                if event[0]=='row': event=(event[0],event[1],(*event[2][:-1],event[2][-1].hex()))
                print(canon(event))
