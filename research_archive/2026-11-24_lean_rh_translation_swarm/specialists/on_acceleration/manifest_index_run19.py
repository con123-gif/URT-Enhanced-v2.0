#!/usr/bin/env python3
"""Authenticated declaration manifest index, not proof-term extraction."""
import hashlib,json,math,os,sqlite3,statistics,subprocess,sys,tempfile,time
from pathlib import Path
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
SHA='45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf'
N=1484705; MAXID=14065150; MAXEX=1065214335; ROOT=14065054
FRONTIER=[8477096,11274889,11148669,11134501,11090272,11080156,10951735,10575871,10575034,10523616,10419805,10383261,10381888,9013533,8797770,8728574,14065047,14019846,14009156,13967295,13235288,13125906,13125938,13125937,13125939,13125896,13125895,13125894,13125892,13125891,13096374,13096369,13096371,13096367]
IDS=[ROOT,14065053,14065052,14065051,13125901,341189]+FRONTIER
def ck(x,m):
    if not x: raise ValueError(m)
def canon(x): return json.dumps(x,ensure_ascii=False,separators=(',',':'))
def auth(p):
    with open(p,'rb') as f: ck(Path(p).stat().st_size==38823812 and hashlib.file_digest(f,'sha256').hexdigest()==SHA,'manifest identity')
def integer(x,m): return type(x) is int and 0<=x<=m
def parts(x): return isinstance(x,list) and bool(x) and all(isinstance(a,str) or integer(a,2**53-1) for a in x)
def validated(p):
    auth(p); count=nr=nm=0; seen=bytearray((MAXID+8)//8); targets=bytearray(len(seen))
    proc=subprocess.Popen(['zstd','-dc','--',str(p)],stdout=subprocess.PIPE)
    try:
        for raw in proc.stdout:
            r=json.loads(raw); i=r['id']; n=r['nameParts']; refs=r['refs']; meta=r['mutualBlock']
            ck(integer(i,MAXID) and parts(n) and isinstance(r['kind'],str) and r['kind'],'row identity')
            ck(isinstance(refs,list) and all(type(x) is int and x!=0 and -MAXID-1<=x<=MAXEX for x in refs),'hard roots')
            ck(isinstance(meta,list) and all(integer(x['id'],MAXID) and parts(x['nameParts']) and type(x['exported']) is bool for x in meta),'metadata')
            b=1<<(i%8); k=i//8; ck(not seen[k]&b,'duplicate ID'); seen[k]|=b
            count+=1; nr+=len(refs); nm+=len(meta)
            for x in refs:
                if x<0:
                    j=-x-1; targets[j//8]|=1<<(j%8)
            yield i,n,raw
        ck(proc.wait()==0,'zstd exit')
    finally:
        if proc.poll() is None: proc.kill(); proc.wait()
        proc.stdout.close()
    ck((count,nr,nm)==(N,3035045,1460414) and seen[ROOT//8]&(1<<(ROOT%8)),'census')
    ck(all(not (a&~b) for a,b in zip(targets,seen)),'missing hard structural target'); auth(p)
def build(p,db):
    db=Path(db); ck(not db.exists(),'refuse overwrite'); t=time.perf_counter()
    fd,tmp=tempfile.mkstemp(prefix=db.name+'.',dir=db.parent); os.close(fd)
    try:
        c=sqlite3.connect(tmp); c.execute('PRAGMA cache_size=-16384'); c.execute('PRAGMA temp_store=FILE'); c.execute('PRAGMA synchronous=FULL')
        c.executescript('CREATE TABLE decl(id INTEGER PRIMARY KEY,name TEXT NOT NULL,terminal TEXT NOT NULL,raw BLOB NOT NULL); CREATE TABLE receipt(k TEXT PRIMARY KEY,v TEXT NOT NULL);')
        batch=[]
        for i,n,raw in validated(p):
            batch.append((i,canon(n),canon(n[-1]),raw))
            if len(batch)>=4096: c.executemany('INSERT INTO decl VALUES(?,?,?,?)',batch); batch.clear()
        c.executemany('INSERT INTO decl VALUES(?,?,?,?)',batch)
        c.execute('CREATE UNIQUE INDEX exact_name ON decl(name)'); c.execute('CREATE INDEX terminal_name ON decl(terminal)')
        c.executemany('INSERT INTO receipt VALUES(?,?)',[('pin',PIN),('manifest',SHA),('count',str(N))]); c.commit()
        ck(c.execute('PRAGMA integrity_check').fetchone()==('ok',),'integrity'); c.close()
        os.replace(tmp,db); fd=os.open(db.parent,os.O_DIRECTORY); os.fsync(fd); os.close(fd)
        return dict(seconds=time.perf_counter()-t,rows=N,db_bytes=db.stat().st_size)
    finally:
        if os.path.exists(tmp): os.unlink(tmp)
def connect(db):
    c=sqlite3.connect(Path(db).resolve().as_uri()+'?mode=ro',uri=True); c.execute('PRAGMA cache_size=-8192'); ck(dict(c.execute('SELECT k,v FROM receipt'))=={'pin':PIN,'manifest':SHA,'count':str(N)},'receipt'); return c
def lookup(c,ids,mode):
    if mode!='shared':
        a=2*math.pi/((1+math.sqrt(5))/2)**2 if mode=='golden' else 2*math.pi/24
        ids=[x for _,x in sorted(enumerate(ids),key=lambda z:(-math.cos(a*(z[0]+1)),z[0]))]
    out={}
    for i in ids:
        r=c.execute('SELECT raw FROM decl WHERE id=?',(i,)).fetchone(); ck(r is not None,'absent ID'); out[i]=r[0]
    return out
def metrics(): return int(next(x.split()[1] for x in Path('/proc/self/status').read_text().splitlines() if x.startswith('VmHWM:')))
def main(p,db):
    if not Path(db).exists(): print('BUILD',json.dumps(build(p,db)),'RSS',metrics(),flush=True)
    else: print('REUSE',Path(db).stat().st_size,flush=True)
    wanted=set(IDS); t=time.perf_counter(); truth={i:raw for i,_,raw in validated(p) if i in wanted}; seconds=time.perf_counter()-t
    ck(set(truth)==wanted and len(truth)==40,'missing query'); print('SCAN',seconds,'RSS',metrics(),flush=True)
    c=connect(db)
    for i,raw in truth.items():
        r=json.loads(raw); ck(c.execute('SELECT raw FROM decl WHERE name=?',(canon(r['nameParts']),)).fetchone()==(raw,),'exact name lookup')
    ck(c.execute('SELECT raw FROM decl WHERE name=?',(canon(['absent_run19_negative']),)).fetchone() is None,'false positive')
    ambiguous=list(c.execute('SELECT name FROM decl WHERE terminal=? LIMIT 3',(canon('_proof_1'),))); ck(len(ambiguous)>1,'ambiguity fixture'); c.close()
    for mode in ['shared','golden','periodic']:
        cold=[]; warm=[]
        for _ in range(11):
            t=time.perf_counter(); c=connect(db); got=lookup(c,IDS,mode); cold.append(time.perf_counter()-t); ck(got==truth,'cold mismatch')
            t=time.perf_counter(); got=lookup(c,IDS,mode); warm.append(time.perf_counter()-t); ck(got==truth,'warm mismatch'); c.close()
        print('BENCH',mode,statistics.median(cold),statistics.median(warm),flush=True)
    for i in FRONTIER:
        r=json.loads(truth[i]); ck(r['kind']=='thm' and len(r['refs'])==2 and min(r['refs'])>0,'frontier role roots'); print('FRONTIER',i,'.'.join(map(str,r['nameParts'])),*r['refs'])
    print('PASS',metrics(),'KiB; 66 exact lookup comparisons; 40 exact name comparisons; 34 frontier role checks',flush=True)
if __name__=='__main__': main(*sys.argv[1:])
