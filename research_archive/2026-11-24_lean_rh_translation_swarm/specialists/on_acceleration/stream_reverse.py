#!/usr/bin/env python3
"""Disk-backed reverse closure and streamed canonical output; not a kernel check."""
# Native test run 17, 2026-11-24: 18000 synthetic nodes, 35998 edges.
# 24 output trials, zero mismatches; cycle, duplicate, boundary, empty and
# rollback controls passed. SHA256 2435b46a5ce76bae98d99f2581dbe8af34efbd54141ac4726a433caee4a1dd59.
# Median reopened/warm ms: independent 445.965/441.682, shared 117.061/118.560,
# golden 116.565/116.609, periodic 116.954/116.992. Parent maxRSS 100748 KiB
# includes synthetic oracle and all modes. Reopened != OS cold. No native
# actual data test: network unavailable to native container. Actual 4-blob
# code-mode audit is in run17_union.mjs / RUN17_RESUME.md.
# TEMP disk-backed B-trees imply logarithmic operations, not strict O(V+E)
# CPU. Output is streamed in numeric order, no closure-sized Python tuple.
# Seed sorting for ablations materializes seeds; CLI seed count is small.
# Atomic rename replaces output path; choose an output path separate from DB.
import argparse, hashlib, json, math, os, resource, sqlite3, tempfile, time
from pathlib import Path


def require(ok, msg):
    if not ok:
        raise ValueError(msg)


def stream_reverse(c, seeds, sink, mode='shared'):
    # Connection must not be shared concurrently; TEMP writes do not alter the evidence store.
    require(not c.in_transaction, 'unexpected open transaction')
    c.execute('PRAGMA temp_store=FILE')
    c.execute('PRAGMA temp.cache_size=-2048')
    c.executescript('CREATE TEMP TABLE IF NOT EXISTS seen(id INTEGER PRIMARY KEY); CREATE TEMP TABLE IF NOT EXISTS todo(seq INTEGER PRIMARY KEY,id INTEGER); CREATE TEMP TABLE IF NOT EXISTS union_seen(id INTEGER PRIMARY KEY);')
    c.execute('BEGIN')
    try:
        c.execute('DELETE FROM union_seen')
        def walk(ss):
            c.execute('DELETE FROM seen'); c.execute('DELETE FROM todo')
            def add(x):
                require(type(x) is int and 0 <= x < 2**63, 'bad id')
                if c.execute('INSERT OR IGNORE INTO seen VALUES(?)',(x,)).rowcount:
                    c.execute('INSERT INTO todo(id) VALUES(?)',(x,))
            for x in ss: add(x)
            seq=0
            while True:
                row=c.execute('SELECT seq,id FROM todo WHERE seq>? ORDER BY seq LIMIT 1',(seq,)).fetchone()
                if row is None: break
                seq,x=row
                for (owner,) in c.execute('SELECT owner FROM edge WHERE target=?',(x,)):
                    add(owner)
        if mode=='independent':
            for x in seeds:
                walk((x,)); c.execute('INSERT OR IGNORE INTO union_seen SELECT id FROM seen')
            table='union_seen'
        else:
            require(mode in ('shared','golden','periodic'),'bad mode')
            if mode=='golden': seeds=sorted(seeds,key=lambda x:(x*2/(3+math.sqrt(5)))%1)
            elif mode=='periodic': seeds=sorted(seeds,key=lambda x:(x%24,x))
            walk(seeds); table='seen'
        h=hashlib.sha256(); count=0
        for (x,) in c.execute('SELECT id FROM '+table+' ORDER BY id'):
            line=(str(x)+'\n').encode('ascii'); sink.write(line); h.update(line); count+=1
        c.execute('COMMIT')
        return {'count':count,'sha256':h.hexdigest()}
    except BaseException:
        if c.in_transaction: c.execute('ROLLBACK')
        raise


def output_atomic(c,seeds,path,mode):
    path=Path(path); tmp=None
    try:
        with tempfile.NamedTemporaryFile(dir=path.parent,prefix='.'+path.name+'.',delete=False) as f:
            tmp=f.name; result=stream_reverse(c,seeds,f,mode); f.flush(); os.fsync(f.fileno())
        os.replace(tmp,path); tmp=None
        fd=os.open(path.parent,os.O_RDONLY)
        try: os.fsync(fd)
        finally: os.close(fd)
        return result
    finally:
        if tmp is not None: os.unlink(tmp)


def test():
    with tempfile.TemporaryDirectory() as d:
        db=Path(d)/'g.db'; c=sqlite3.connect(db,isolation_level=None)
        c.executescript('CREATE TABLE edge(owner INTEGER,target INTEGER); CREATE INDEX reverse_edge ON edge(target,owner);')
        n=18000; c.execute('BEGIN'); c.executemany('INSERT INTO edge VALUES(?,?)',((i,j) for i in range(1,n) for j in (i//2,0))); c.execute('COMMIT')
        truth=hashlib.sha256(b''.join((str(i)+'\n').encode() for i in range(n))).hexdigest()
        results={}
        for mode in ('independent','shared','golden','periodic'):
            times=[]
            for trial in range(3):
                c.close(); c=sqlite3.connect(db,isolation_level=None); c.execute('PRAGMA cache_size=-8192')
                if trial==0: label='reopened'
                else: label='reopened_again'
                t=time.perf_counter(); a=output_atomic(c,list(range(15)),Path(d)/'out',mode); times.append(1000*(time.perf_counter()-t))
                require(a=={'count':n,'sha256':truth},'closure mismatch'); require(hashlib.file_digest(open(Path(d)/'out','rb'),'sha256').hexdigest()==truth,'output mismatch')
                t=time.perf_counter(); a=output_atomic(c,list(range(15)),Path(d)/'out',mode); times.append(1000*(time.perf_counter()-t)); require(a['sha256']==truth,'warm mismatch')
            results[mode]={'reopened_ms':times[::2],'warm_ms':times[1::2]}
        # Cycle, duplicate edges, missing boundary, empty seeds and rollback on sink failure.
        c.execute('INSERT INTO edge VALUES(0,1)'); c.execute('INSERT INTO edge VALUES(0,1)')
        p=Path(d)/'out'; require(output_atomic(c,[0,0],p,'shared')['sha256']==truth,'cycle/duplicate')
        require(output_atomic(c,[n+1],p,'shared')['count']==1,'boundary'); require(output_atomic(c,[],p,'shared')['count']==0,'empty')
        old=p.read_bytes()
        try: output_atomic(c,[-1],p,'shared')
        except ValueError: pass
        else: raise ValueError('bad seed accepted')
        require(p.read_bytes()==old and not c.in_transaction,'rollback/atomic output')
        c.close()
        print(json.dumps({'status':'PASS_SYNTHETIC_NOT_KERNEL','nodes':n,'edges':2*(n-1),'missed':0,'sha256':truth,'timings':results,'peak_parent_rss_kib':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}))


if __name__=='__main__':
    p=argparse.ArgumentParser(); p.add_argument('--test',action='store_true'); p.add_argument('--db'); p.add_argument('--out'); p.add_argument('--mode',default='shared'); p.add_argument('seeds',nargs='*',type=int); a=p.parse_args()
    if a.test: test()
    else:
        require(a.db and a.out,'--db and --out required'); c=sqlite3.connect(Path(a.db).resolve().as_uri()+'?mode=ro',uri=True,isolation_level=None); c.execute('PRAGMA cache_size=-8192'); print(json.dumps(output_atomic(c,a.seeds,a.out,a.mode))); c.close()
