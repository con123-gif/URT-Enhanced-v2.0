#!/usr/bin/env python3
"""Authenticated compact declaration projection; not proof-term extraction."""
import hashlib,json,math,os,sqlite3,statistics,subprocess,sys,tempfile,time
from pathlib import Path
SHA='45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf'
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
N=1484705; MAX=14065150; ROOT=14065054
IDS=[ROOT,14065053,14065052,14065051,341189,13125901,13125905,13208115,13172410,13962369,8996470,8996093]
def ck(v,m):
    if not v: raise ValueError(m)
def canon(x): return json.dumps(x,ensure_ascii=False,separators=(',',':'))
def auth(p):
    with open(p,'rb') as f: ck(hashlib.file_digest(f,'sha256').hexdigest()==SHA,'input hash')
def rows(p):
    auth(p); seen=bytearray((MAX+8)//8); target=bytearray(len(seen)); nr=nm=0
    with subprocess.Popen(['zstd','-dc','--',p],stdout=subprocess.PIPE) as proc:
        for seq,raw in enumerate(proc.stdout,1):
            r=json.loads(raw); i=r['id']; n=r['nameParts']; refs=r['refs']; meta=r['mutualBlock']
            ck(type(i) is int and 0<=i<=MAX and n and all(type(x) in (str,int) for x in n),'identity')
            ck(not seen[i//8]&(1<<(i%8)),'duplicate id'); seen[i//8]|=1<<(i%8)
            nr+=len(refs); nm+=len(meta)
            for x in refs:
                ck(type(x) is int and x!=0 and -MAX-1<=x<=1065214335,'reference range')
                if x<0:
                    j=-x-1; target[j//8]|=1<<(j%8)
            yield i,seq,canon(n),canon(n[-1]),r['kind'],canon(refs),hashlib.sha256(raw).digest()
        ck(proc.wait()==0,'decompress')
    ck((seq,nr,nm)==(N,3035045,1460414) and seen[ROOT//8]&(1<<(ROOT%8)),'census')
    ck(all(not a&~b for a,b in zip(target,seen)),'missing structural target'); auth(p)
def rss(): return int(next(x.split()[1] for x in Path('/proc/self/status').read_text().splitlines() if x.startswith('VmHWM:')))
def receipt(mode): return dict(pin=PIN,manifest=SHA,count=str(N),layout=mode,schema='compact-v1')
def verify(p,c,mode):
    ck(dict(c.execute('SELECT k,v FROM receipt'))==receipt(mode),'receipt')
    cur=c.execute('SELECT * FROM decl ORDER BY seq')
    for row in rows(p): ck(cur.fetchone()==row,'roundtrip mismatch at '+str(row[1]))
    ck(cur.fetchone() is None,'extra row')
def build(p,dest,mode):
    dest=Path(dest); ck(not dest.exists(),'refuse overwrite'); fd,tmp=tempfile.mkstemp(dir=dest.parent); os.close(fd)
    t=time.perf_counter(); c=sqlite3.connect(tmp)
    try:
        c.execute('PRAGMA cache_size=-65536'); c.execute('PRAGMA temp_store=FILE'); c.execute('PRAGMA synchronous=FULL')
        key='id INTEGER PRIMARY KEY,seq INTEGER NOT NULL' if mode=='clustered' else 'id INTEGER NOT NULL,seq INTEGER PRIMARY KEY'
        c.executescript('CREATE TABLE decl('+key+',name TEXT NOT NULL,terminal TEXT NOT NULL,kind TEXT NOT NULL,refs TEXT NOT NULL,digest BLOB NOT NULL);CREATE TABLE receipt(k TEXT PRIMARY KEY,v TEXT NOT NULL);')
        c.executemany('INSERT INTO decl VALUES(?,?,?,?,?,?,?)',rows(p)); load=time.perf_counter()-t
        c.execute('CREATE UNIQUE INDEX alternate ON decl('+('seq' if mode=='clustered' else 'id')+')'); c.execute('CREATE UNIQUE INDEX exact_name ON decl(name)'); c.execute('CREATE INDEX terminal_name ON decl(terminal)')
        c.executemany('INSERT INTO receipt VALUES(?,?)',receipt(mode).items()); c.commit(); indexed=time.perf_counter()-t
        ck(c.execute('PRAGMA integrity_check').fetchone()==('ok',),'integrity'); integrity=time.perf_counter()-t
        verify(p,c,mode); c.close(); os.replace(tmp,dest); fd=os.open(dest.parent,os.O_DIRECTORY); os.fsync(fd); os.close(fd)
        return dict(load_s=load,indexed_s=indexed,integrity_s=integrity,total_s=time.perf_counter()-t,bytes=dest.stat().st_size,peak_kib=rss())
    finally:
        c.close()
        if os.path.exists(tmp): os.unlink(tmp)
def connect(db,mode):
    c=sqlite3.connect(Path(db).resolve().as_uri()+'?mode=ro',uri=True); c.execute('PRAGMA cache_size=-8192'); ck(dict(c.execute('SELECT k,v FROM receipt'))==receipt(mode),'receipt'); return c
def bench(p,db,mode):
    t=time.perf_counter(); truth={r[0]:r for r in rows(p) if r[0] in IDS}; scan=time.perf_counter()-t; ck(set(truth)==set(IDS),'missing id')
    c=connect(db,mode)
    for r in truth.values(): ck(c.execute('SELECT * FROM decl WHERE name=?',(r[2],)).fetchone()==r,'name mismatch')
    ck(c.execute('SELECT id FROM decl WHERE name=?',(canon(['missing_run20_control']),)).fetchone() is None,'false positive')
    ck(len(c.execute('SELECT id FROM decl WHERE terminal=? LIMIT 2',(canon('_proof_1'),)).fetchall())==2,'ambiguity'); c.close()
    out=dict(scan_s=scan,requests=len(IDS))
    for label,a in [('shared',None),('golden',2*math.pi/((1+math.sqrt(5))/2)**2),('periodic',2*math.pi/24)]:
        cold=[]; warm=[]
        for _ in range(11):
            t=time.perf_counter(); c=connect(db,mode)
            for times in (cold,warm):
                ids=IDS if a is None else [x for j,x in sorted(enumerate(IDS),key=lambda z:(-math.cos(a*(z[0]+1)),z[0]))]
                got={i:c.execute('SELECT * FROM decl WHERE id=?',(i,)).fetchone() for i in ids}; times.append(time.perf_counter()-t); ck(got==truth,'lookup mismatch'); t=time.perf_counter()
            c.close()
        out[label]=[statistics.median(cold),statistics.median(warm)]
    out['peak_kib']=rss(); out['extra']={i:list(truth[i][2:6]) for i in IDS[6:]}; return out
if __name__=='__main__':
    op,p,db,mode=sys.argv[1:]; ck(mode in ('clustered','append'),'mode')
    if op=='build': result=build(p,db,mode)
    elif op=='bench': result=bench(p,db,mode)
    elif op=='verify':
        with connect(db,mode) as c: verify(p,c,mode)
        result={'verified':N}
    else: raise ValueError('operation')
    print(json.dumps(result,sort_keys=True),flush=True)
