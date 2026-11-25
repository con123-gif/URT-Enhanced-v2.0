#!/usr/bin/env python3
"""Native audit of four pinned RH export projections; not a Lean kernel check.
Run: python run18_native_certificate.py direct.json frontier.json next.json literature.json
Inputs can be recovered from Actions artifacts listed in RUN18_RESUME.md.
"""
import hashlib, json, resource, sqlite3, statistics, subprocess, sys, tempfile, time
from collections import Counter
from pathlib import Path
import durable_roles as dr
import stream_reverse as sr

HASHES = ['64b935e4ef309f6c555912a377012c7708eda510',
          'd49fbcc22a2382039986b09ff91dd11af2ef2e7b',
          'd04e0fb24160d3ee1be54cd50082f59526864d4e',
          'd823c364f446f5066dbbc61f7e9cf9c891fcbdb2']
SEEDS = [61,4101,4074,4098,80,2055,5660,1,3820,4078,22503,25327,550020,2083,273]
MODES = ['independent','shared','golden','periodic']

def check(ok, message):
    if not ok: raise RuntimeError(message)

def canonical(x):
    return json.dumps(x, sort_keys=True, separators=(',',':'), ensure_ascii=False)

def independent_rows(r):
    # Deliberately independent of durable_roles.decode; retain role, order,
    # payload and structural-vs-RHS slots, not only unique target sets.
    rows = [('type',0,x) for x in r['type']['references']]
    if r['value'] is not None:
        rows += [('value',1,x) for x in r['value']['references']]
    for s in r.get('structural',[]):
        if s['encoded'] < 0:
            rows.append(('structural',s['edgeIndex'],s))
        else:
            rows.extend(('rhs',s['edgeIndex'],x) for x in s['expression']['references'])
    return [(r['id'],i,role,slot,x['target'],canonical(x)) for i,(role,slot,x) in enumerate(rows)]

def oracle(edges):
    # Independent full-scan fixed point, not timed in traversal benchmark.
    seen=set(SEEDS)
    while True:
        old=len(seen)
        for o,_,_,_,t,_ in edges:
            if t in seen: seen.add(o)
        if len(seen)==old: return b''.join(f'{x}\n'.encode() for x in sorted(seen))

def read_only(db):
    c=sqlite3.connect(Path(db).resolve().as_uri()+'?mode=ro',uri=True,isolation_level=None)
    c.execute('PRAGMA cache_size=-8192')
    return c

def linux_metrics():
    # VmHWM is the current executable's resident high-water mark; getrusage
    # can inherit the pre-exec parent's high-water mark on Linux.
    hwm=next(int(x.split()[1]) for x in Path('/proc/self/status').read_text().splitlines() if x.startswith('VmHWM:'))
    io={k:int(v) for k,v in (x.split(':') for x in Path('/proc/self/io').read_text().splitlines())}
    return hwm,io

def worker(db, out, mode, count, digest):
    _,before=linux_metrics(); cold=[]; warm=[]
    for _ in range(7):
        t=time.perf_counter_ns(); c=read_only(db)
        for i in range(2):
            if i: t=time.perf_counter_ns()
            got=sr.output_atomic(c,SEEDS,out,mode)
            ms=(time.perf_counter_ns()-t)/1e6
            check(got=={'count':count,'sha256':digest},'closure summary')
            check(hashlib.sha256(Path(out).read_bytes()).hexdigest()==digest,'output bytes')
            (warm if i else cold).append(ms)
        c.close()
    hwm,after=linux_metrics()
    return dict(reopened_ms=cold,warm_ms=warm,reopened_median_ms=statistics.median(cold),warm_median_ms=statistics.median(warm),peak_rss_kib=hwm,io_bytes={k:after[k]-before[k] for k in ('rchar','wchar','read_bytes','write_bytes')},checks=28)

def main(paths):
    check(len(paths)==4,'exactly four input files required')
    paths=list(map(Path,paths)); docs=[dr.read(p,h) for p,h in zip(paths,HASHES)]
    all_rows=[]; receipts=[]
    for h,d in zip(HASHES,docs):
        for r in d['reports']:
            all_rows.extend(independent_rows(r)); receipts.append((h,r['id'],canonical(r)))
    all_rows.sort(key=lambda x:(x[0],x[1])); receipts.sort(key=lambda x:(x[0],x[1]))
    roles=Counter(r[2] for r in all_rows)
    check(roles=={'type':4048,'value':14011,'structural':37,'rhs':4},'role census')
    check(len(receipts)==142 and len(all_rows)==18100,'projection census')
    truth=oracle(all_rows); digest=hashlib.sha256(truth).hexdigest(); count=len(truth.splitlines()); check(count==143,'reverse census')
    with tempfile.TemporaryDirectory() as tmp:
        root=Path(tmp); db=root/'roles.db'; c=dr.connect(db); batches=[]
        for d,h,p in zip(docs,HASHES,paths):
            t=time.perf_counter_ns(); added=dr.merge(c,d,h); ms=(time.perf_counter_ns()-t)/1e6
            batches.append(dict(blob=h,bytes=p.stat().st_size,owners=added[0],edges=added[1],ms=ms))
        check(dr.census(c)==(142,18100,142,4),'database census')
        for d,h in zip(docs,HASHES): check(dr.merge(c,d,h)==(0,0),'idempotence')
        c.close(); c=dr.connect(db)
        actual=c.execute('SELECT owner,ord,role,slot,target,payload FROM edge ORDER BY owner,ord').fetchall()
        check(actual==all_rows,'exact ordered edge audit')
        check(c.execute('SELECT blob,owner,raw FROM receipt ORDER BY blob,owner').fetchall()==receipts,'exact receipt audit')
        check(c.execute('PRAGMA integrity_check').fetchone()==('ok',),'integrity')
        # Changed role payload must not be accepted as an idempotent update.
        bad=json.loads(json.dumps(docs[-1])); bad['reports'][0]['type']['expressionRoot']=-1
        try: dr.merge(c,bad,'invalid')
        except ValueError: pass
        else: raise RuntimeError('bad update accepted')
        check(dr.census(c)==(142,18100,142,4) and not c.in_transaction,'rollback')
        try: dr.read(paths[0],'0'*40)
        except ValueError: pass
        else: raise RuntimeError('bad hash accepted')
        # Negative role omission with unchanged owner and correct envelope.
        bad=json.loads(json.dumps(docs[-1])); r=next(r for r in bad['reports'] if r['type']['references']); r['type']['references'].pop()
        try: dr.merge(c,bad,'invalid2')
        except ValueError: pass
        else: raise RuntimeError('role deletion accepted')
        check(dr.census(c)==(142,18100,142,4),'role deletion rollback')
        c.close()
        # Native process-kill tests using last real report on separate database.
        crash=root/'crash.db'; c=dr.connect(crash)
        for d,h in zip(docs[:-1],HASHES): dr.merge(c,d,h)
        before=dr.census(c); c.close()
        for stage,code,expected in [('before',91,before),('after',92,(142,18100,142,4))]:
            r=subprocess.run([sys.executable,__file__,'--kill',str(crash),str(paths[-1]),HASHES[-1],stage])
            check(r.returncode==code,'crash process exit'); c=dr.connect(crash)
            check(dr.census(c)==expected,'crash recovery census'); check(c.execute('PRAGMA integrity_check').fetchone()==('ok',),'crash integrity'); c.close()
        c=dr.connect(crash); check(c.execute('SELECT owner,ord,role,slot,target,payload FROM edge ORDER BY owner,ord').fetchall()==all_rows,'crash exact edges'); c.close()
        results={}
        for mode in MODES:
            result=subprocess.check_output([sys.executable,__file__,'--worker',str(db),str(root/(mode+'.txt')),mode,str(count),digest])
            results[mode]=json.loads(result)
            check((root/(mode+'.txt')).read_bytes()==truth,'independent oracle bytes')
        print(json.dumps(dict(status='PASS_NATIVE_PARTIAL_EXPORT_NOT_KERNEL_RECHECK',pin=dr.PIN,archive_digest=dr.DIGEST,owners=142,edges=18100,roles=roles,missing_supplied_edges=0,receipts=142,batches=batches,reverse_count=count,sha256=digest,benchmark=results,negative_controls=5,peak_audit_rss_kib=linux_metrics()[0],db_bytes=db.stat().st_size),indent=2))

if __name__=='__main__':
    a=sys.argv[1:]
    if a and a[0]=='--worker': print(json.dumps(worker(a[1],a[2],a[3],int(a[4]),a[5])))
    elif a and a[0]=='--kill':
        c=dr.connect(a[1]); dr.merge(c,dr.read(a[2],a[3]),a[3],a[4]); raise RuntimeError('fault not executed')
    else: main(a)
