#!/usr/bin/env python3
"""Staged, locked compact manifest index. Requires compact_run20.py beside it."""
import fcntl, json, math, os, sqlite3, statistics, sys, tempfile, time
from pathlib import Path
import compact_run20 as base

def syncdir(p):
    fd=os.open(p,os.O_DIRECTORY)
    try: os.fsync(fd)
    finally: os.close(fd)

def run(op,p,dest,mode):
    dest=Path(dest).resolve(); stage=dest.with_name(dest.name+'.stage')
    base.ck(mode in ('append','clustered'),'layout')
    with open(str(dest)+'.lock','a+b') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        t=time.perf_counter()
        base.ck(not dest.exists(),'already published')
        if op=='load':
            # Do not reuse an interrupted stage, even if it contains a receipt.
            fd=os.open(stage,os.O_CREAT|os.O_EXCL|os.O_WRONLY,0o600); os.close(fd)
            c=sqlite3.connect(stage)
            try:
                c.execute('PRAGMA cache_size=-65536'); c.execute('PRAGMA temp_store=FILE'); c.execute('PRAGMA synchronous=FULL')
                key='id INTEGER PRIMARY KEY,seq INTEGER NOT NULL' if mode=='clustered' else 'id INTEGER NOT NULL,seq INTEGER PRIMARY KEY'
                c.executescript('CREATE TABLE decl('+key+',name TEXT NOT NULL,terminal TEXT NOT NULL,kind TEXT NOT NULL,refs TEXT NOT NULL,digest BLOB NOT NULL);CREATE TABLE receipt(k TEXT PRIMARY KEY,v TEXT NOT NULL);')
                c.executemany('INSERT INTO decl VALUES(?,?,?,?,?,?,?)',base.rows(p)); load=time.perf_counter()-t
                c.execute('CREATE UNIQUE INDEX alternate ON decl('+('seq' if mode=='clustered' else 'id')+')'); c.execute('CREATE UNIQUE INDEX exact_name ON decl(name)'); c.execute('CREATE INDEX terminal_name ON decl(terminal)')
                c.executemany('INSERT INTO receipt VALUES(?,?)',base.receipt(mode).items()); c.commit()
            finally: c.close()
            syncdir(dest.parent)
            return dict(load_s=load,index_commit_close_s=time.perf_counter()-t-load,bytes=stage.stat().st_size,peak_kib=base.rss())
        if op=='publish':
            c=sqlite3.connect(stage.as_uri()+'?mode=ro',uri=True)
            try:
                c.execute('PRAGMA cache_size=-65536'); c.execute('PRAGMA temp_store=FILE')
                base.ck(list(c.execute('PRAGMA integrity_check'))==[('ok',)],'integrity'); integrity=time.perf_counter()-t
                base.verify(p,c,mode); verify=time.perf_counter()-t-integrity
            finally: c.close()
            # Atomic no-overwrite publication, even against a noncooperating creator.
            with open(stage,'rb') as f: os.fsync(f.fileno())
            os.link(stage,dest); syncdir(dest.parent); stage.unlink(); syncdir(dest.parent)
            return dict(integrity_s=integrity,verify_s=verify,total_s=time.perf_counter()-t,bytes=dest.stat().st_size,peak_kib=base.rss(),verified=base.N)
        raise ValueError('operation')

def lookup_bench(p,dbs):
    t=time.perf_counter(); truth={r[0]:r for r in base.rows(p) if r[0] in base.IDS}; scan=time.perf_counter()-t
    base.ck(set(truth)==set(base.IDS),'missing truth')
    result=dict(scan_s=scan,requests=len(truth),trials=21,layouts={})
    for mode,db in zip(('append','clustered'),dbs):
        c=base.connect(db,mode)
        for row in truth.values(): base.ck(c.execute('SELECT * FROM decl WHERE name=?',(row[2],)).fetchone()==row,'name')
        base.ck(c.execute('SELECT id FROM decl WHERE name=?',(base.canon(['missing_run21_control']),)).fetchone() is None,'false positive')
        base.ck(len(c.execute('SELECT id FROM decl WHERE terminal=? LIMIT 2',(base.canon('_proof_1'),)).fetchall())==2,'ambiguity'); c.close()
        result['layouts'][mode]={}
        for label,a in [('shared',None),('golden',2*math.pi/((1+math.sqrt(5))/2)**2),('periodic',2*math.pi/24)]:
            reopened=[]; warm=[]
            for _ in range(21):
                t=time.perf_counter(); c=base.connect(db,mode)
                for times in (reopened,warm):
                    ids=base.IDS if a is None else [x for j,x in sorted(enumerate(base.IDS),key=lambda z:(-math.cos(a*(z[0]+1)),z[0]))]
                    got={i:c.execute('SELECT * FROM decl WHERE id=?',(i,)).fetchone() for i in ids}; times.append(time.perf_counter()-t); base.ck(got==truth,'lookup mismatch'); t=time.perf_counter()
                c.close()
            result['layouts'][mode][label]=dict(reopened_s=statistics.median(reopened),warm_s=statistics.median(warm))
    result['peak_kib']=base.rss(); return result

def controls(p):
    with tempfile.TemporaryDirectory() as tmp:
        dest=Path(tmp)/'control.sqlite'; stage=Path(str(dest)+'.stage')
        def reject(fn, exc):
            try: fn()
            except exc: return
            raise ValueError('negative control accepted')
        with open(str(dest)+'.lock','a+b') as lock:
            fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
            reject(lambda:run('load',p,dest,'append'),BlockingIOError)
        base.ck(not dest.exists() and not stage.exists(),'lock side effect')
        stage.write_bytes(b'interrupted stage')
        reject(lambda:run('load',p,dest,'append'),FileExistsError)
        reject(lambda:run('publish',p,dest,'append'),sqlite3.DatabaseError)
        base.ck(not dest.exists() and stage.read_bytes()==b'interrupted stage','bad stage published')
        dest.write_bytes(b'published sentinel')
        reject(lambda:run('publish',p,dest,'append'),ValueError)
        base.ck(dest.read_bytes()==b'published sentinel','overwritten publication')
    return {'negative_controls':4}

if __name__=='__main__':
    op,p,*args=sys.argv[1:]
    result=lookup_bench(p,args) if op=='bench' else controls(p) if op=='controls' else run(op,p,*args)
    print(json.dumps(result,sort_keys=True),flush=True)
