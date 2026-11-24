#!/usr/bin/env python3
"""Append-only role evidence. SQLite WAL/FULL, single archive, exact receipts.
Not a Lean kernel check. CLI accepts Git-blob-pinned JSON envelopes.
"""
import hashlib, json, math, os, resource, sqlite3, subprocess, sys, tempfile, time
from pathlib import Path
from collections import deque

PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
DIGEST='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e'
N=1065214335

def need(ok,msg):
    if not ok: raise ValueError(msg)
def canon(x): return json.dumps(x,sort_keys=True,separators=(',',':'),ensure_ascii=False)
def blob(b): return hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()
def integer(x): return type(x) is int and x>=0

def decode(r):
    k=r['kind']; q=r.get('request') or r['source']; oid=r['id']; slots=r.get('encodedRootsAndStructuralEdges'); edges=[]
    need(r['status']=='EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK' and integer(oid) and q.get('id',oid)==oid and q.get('kind',k)==k and isinstance(q['name'],str),'owner')
    need(k in ('thm','def','ctor','inductive','rec'),'unsupported owner')
    need(slots is not None or (k in ('thm','def') and not r.get('structural')),'missing structural slot evidence')
    def tagged(e,kind):
        p=e['nameParts']; need(integer(e['target']) and isinstance(kind,str) and isinstance(p,list) and p and all(isinstance(x,str) or integer(x) for x in p),'tagged identity')
        return canon([kind,p])
    def expr(x,role,slot):
        root=x['expressionRoot']; need(integer(root) and root<N and (slots is None or slots[slot]==root+1),'expression slot')
        for e in x['references']:
            need(e['kind'] in ('explicit_const','projection_carrier','literal_primitive') and integer(e['witnessExpression']) and e['witnessExpression']<N and integer(e['distinctExpressionRecords']) and e['distinctExpressionRecords']>0,'expression witness')
            edges.append((role,slot,e['target'],tagged(e,e['targetKind']),canon(e)))
    expr(r['type'],'type',0); start=1
    if k in ('thm','def'): expr(r['value'],'value',1); start=2
    else: need(r['value'] is None,'invented value')
    s=r.get('structural',[]); need(slots is None or len(slots)==start+len(s),'slot count')
    for i,e in enumerate(s,start):
        need(e['edgeIndex']==i and e['encoded']==slots[i] and type(slots[i]) is int and slots[i]!=0,'slot order')
        if slots[i]>0:
            need(k=='rec' and e['kind']=='recursor_rule_rhs','unsupported positive slot'); expr(e['expression'],'rhs',i)
        else:
            need(e['target']==-slots[i]-1,'structural target'); edges.append(('structural',i,e['target'],tagged(e,e['kind']),canon(e)))
    # Core preserves expression roots, record counters, slots, duplicates and metadata.
    core=canon({key:r.get(key) for key in ('id','kind','type','value','structural','encodedRootsAndStructuralEdges','mutualBlock')})
    return oid,k,core,edges

def connect(p):
    c=sqlite3.connect(p,timeout=30,isolation_level=None); c.execute('PRAGMA journal_mode=WAL'); c.execute('PRAGMA synchronous=FULL'); c.execute('PRAGMA cache_size=-8192'); c.execute('PRAGMA temp_store=FILE')
    c.executescript('CREATE TABLE IF NOT EXISTS owner(id INTEGER PRIMARY KEY,kind TEXT,core TEXT); CREATE TABLE IF NOT EXISTS identity(id INTEGER PRIMARY KEY,tag TEXT); CREATE TABLE IF NOT EXISTS edge(owner INTEGER,ord INTEGER,role TEXT,slot INTEGER,target INTEGER,payload TEXT,PRIMARY KEY(owner,ord)); CREATE INDEX IF NOT EXISTS reverse_edge ON edge(target,owner); CREATE TABLE IF NOT EXISTS receipt(blob TEXT,owner INTEGER,raw TEXT,PRIMARY KEY(blob,owner)); CREATE TABLE IF NOT EXISTS batch(blob TEXT PRIMARY KEY);')
    return c

def merge(c,a,h,kill=None):
    need(a['digest']==DIGEST and a.get('pin') in (None,PIN) and a['n']==N and a['root']==14065054 and a['bytes']==61570595788 and a['indexedDeclarations']==1484733 and a['meta']['lean']['githash']=='819816b2e0a3bf405af45ae5c7af2491d8f5bee6' and a['meta']['format']['version']=='3.1.0' and a['status']=='AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK','archive scope')
    c.execute('BEGIN IMMEDIATE'); added=0; count=0
    try:
        for r in a['reports']:
            oid,k,core,edges=decode(r); old=c.execute('SELECT kind,core FROM owner WHERE id=?',(oid,)).fetchone()
            need(old is None or old==(k,core),'conflicting owner')
            own=c.execute('SELECT tag FROM identity WHERE id=?',(oid,)).fetchone(); need(own is None or json.loads(own[0])[0]==k,'owner kind')
            if old is None:
                c.execute('INSERT INTO owner VALUES(?,?,?)',(oid,k,core)); added+=1
                for j,(role,slot,t,tag,payload) in enumerate(edges):
                    prev=c.execute('SELECT tag FROM identity WHERE id=?',(t,)).fetchone(); need(prev is None or prev[0]==tag,'identity conflict')
                    tk=c.execute('SELECT kind FROM owner WHERE id=?',(t,)).fetchone(); need(tk is None or tk[0]==json.loads(tag)[0],'target kind')
                    c.execute('INSERT OR IGNORE INTO identity VALUES(?,?)',(t,tag)); c.execute('INSERT INTO edge VALUES(?,?,?,?,?,?)',(oid,j,role,slot,t,payload)); count+=1
            raw=canon(r); prev=c.execute('SELECT raw FROM receipt WHERE blob=? AND owner=?',(h,oid)).fetchone(); need(prev is None or prev[0]==raw,'receipt conflict')
            c.execute('INSERT OR IGNORE INTO receipt VALUES(?,?,?)',(h,oid,raw))
        c.execute('INSERT OR IGNORE INTO batch VALUES(?)',(h,))
        if kill=='before': os._exit(91)
        c.execute('COMMIT')
        if kill=='after': os._exit(92)
        return added,count
    except BaseException:
        if c.in_transaction: c.execute('ROLLBACK')
        raise

def reverse(c,seeds):
    # Spill visited and queue to SQLite TEMP, not a Python set of the whole closure.
    c.executescript('CREATE TEMP TABLE IF NOT EXISTS seen(id INTEGER PRIMARY KEY); DELETE FROM seen; CREATE TEMP TABLE IF NOT EXISTS todo(seq INTEGER PRIMARY KEY,id INTEGER); DELETE FROM todo;')
    def add(x):
        if c.execute('INSERT OR IGNORE INTO seen VALUES(?)',(x,)).rowcount: c.execute('INSERT INTO todo(id) VALUES(?)',(x,))
    for x in seeds: add(x)
    seq=0
    while True:
        row=c.execute('SELECT seq,id FROM todo WHERE seq>? ORDER BY seq LIMIT 1',(seq,)).fetchone()
        if row is None: break
        seq,x=row
        for (o,) in c.execute('SELECT owner FROM edge WHERE target=?',(x,)): add(o)
    return tuple(x for (x,) in c.execute('SELECT id FROM seen ORDER BY id'))

def read(p,h):
    b=Path(p).read_bytes(); need(blob(b)==h,'Git blob mismatch'); return json.loads(b)
def census(c): return tuple(c.execute('SELECT count(*) FROM '+t).fetchone()[0] for t in ('owner','edge','receipt','batch'))
def fixture(lo,hi):
    def ref(t,w): return dict(kind='explicit_const',target=t,nameParts=['F',t],targetKind='thm',witnessExpression=w,distinctExpressionRecords=1)
    rows=[]
    for i in range(lo,hi):
        e=[ref(i//2,i),ref(0,i)] if i else []
        rows.append(dict(id=i,kind='thm',request=dict(id=i,name='F.'+str(i)),status='EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK',encodedRootsAndStructuralEdges=[i+1,i+1],type=dict(expressionRoot=i,references=[]),value=dict(expressionRoot=i,references=e),structural=[],mutualBlock=[]))
    return dict(digest=DIGEST,pin=PIN,n=N,root=14065054,bytes=61570595788,indexedDeclarations=1484733,meta=dict(lean=dict(githash='819816b2e0a3bf405af45ae5c7af2491d8f5bee6'),format=dict(version='3.1.0')),status='AUTHENTICATED_EXPORT_DIRECT_ROLE_WITNESSES_NOT_KERNEL_RECHECK',reports=rows)

def certificate():
    with tempfile.TemporaryDirectory() as d:
        p=d+'/index.db'; a=fixture(0,3000); b=fixture(3000,3300); f=d+'/delta.json'; raw=canon(b).encode(); Path(f).write_bytes(raw); h=blob(raw)
        c=connect(p); merge(c,a,'fixture-A'); before=census(c); c.close()
        for stage,code,expect in [('before',91,before),('after',92,(3300,6598,3300,2))]:
            r=subprocess.run([sys.executable,__file__,'ingest',p,f,h,stage]); need(r.returncode==code,'fault did not execute'); c=connect(p); need(census(c)==expect,'crash atomicity'); need(c.execute('PRAGMA integrity_check').fetchone()==('ok',),'integrity'); c.close()
        c=connect(p); need(merge(c,b,h)==(0,0),'idempotence'); need(census(c)==(3300,6598,3300,2),'counts')
        bad=fixture(3000,3300); bad['reports'][-1]['value']['references'].pop()
        try: merge(c,bad,'bad')
        except ValueError: pass
        else: raise ValueError('conflict accepted')
        need(census(c)==(3300,6598,3300,2),'rollback'); need(c.execute("SELECT count(*) FROM receipt WHERE blob='bad'").fetchone()==(0,),'partial receipt')
        seeds=list(range(15)); rows=a['reports']+b['reports']; adj={}
        for r in rows:
            for e in r['value']['references']: adj.setdefault(e['target'],[]).append(r['id'])
        def oracle(ss):
            seen=set(ss); q=deque(ss)
            while q:
                for x in adj.get(q.popleft(),[]):
                    if x not in seen: seen.add(x); q.append(x)
            return tuple(sorted(seen))
        truth=oracle(seeds); times={}
        for label,fn in [('independent',lambda:tuple(sorted(set().union(*(reverse(c,[x]) for x in seeds))))),('shared',lambda:reverse(c,seeds)),('golden',lambda:reverse(c,sorted(seeds,key=lambda i:(i*2/(3+math.sqrt(5)))%1))),('periodic',lambda:reverse(c,sorted(seeds,key=lambda i:(i%24,i))))]:
            t=time.perf_counter(); actual=fn(); times[label]=round(1000*(time.perf_counter()-t),3); need(actual==truth,'missed dependency')
        c.close(); t=time.perf_counter(); c=connect(p); need(reverse(c,seeds)==truth,'reopen'); times['reopened_shared_ms']=round(1000*(time.perf_counter()-t),3); c.close()
        samples={}
        for mode in ('incremental','rebuild'):
            q=connect(d+'/'+mode+'.db')
            if mode=='incremental': merge(q,a,'fixture-A')
            t=time.perf_counter()
            if mode=='rebuild': merge(q,a,'fixture-A')
            merge(q,b,h); samples[mode]=round(1000*(time.perf_counter()-t),3); need(census(q)==(3300,6598,3300,2),'rebuild'); q.close()
        rec=fixture(1,2)['reports'][0]; rec.update(kind='rec',value=None,encodedRootsAndStructuralEdges=[2,-1,3],structural=[dict(edgeIndex=1,encoded=-1,target=0,nameParts=['F',0],kind='thm'),dict(edgeIndex=2,encoded=3,kind='recursor_rule_rhs',expression=dict(expressionRoot=2,references=[dict(kind='explicit_const',target=0,nameParts=['F',0],targetKind='thm',witnessExpression=2,distinctExpressionRecords=1)]))]); need([e[:3] for e in decode(rec)[3]]==[('structural',1,0),('rhs',2,0)],'positive RHS slot')
        old=fixture(1,2)['reports'][0]; del old['encodedRootsAndStructuralEdges']; need(len(decode(old)[3])==2,'legacy expression only')
        try: read(f,'0'*40)
        except ValueError: pass
        else: raise ValueError('bad blob accepted')
        print(canon(dict(status='PASS_SYNTHETIC_NOT_KERNEL',owners=3300,edges=6598,missed=0,crash_controls=2,conflict_controls=1,query_ms=times,write_ms=samples,peak_rss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)))

if __name__=='__main__':
    if sys.argv[1:]==['test']: certificate()
    elif len(sys.argv) in (5,6) and sys.argv[1]=='ingest':
        _,_,db,p,h,*stage=sys.argv; c=connect(db); print(merge(c,read(p,h),h,stage[0] if stage else None),census(c)); c.close()
    else: raise SystemExit('usage: durable_roles.py test | ingest DB JSON GIT_BLOB_SHA [before|after]')
