"""Verified-input CSR builder. Requires externally trusted manifest digest; not a Lean checker."""
import hashlib, json, os, sqlite3, struct, tempfile, shutil, sys
from pathlib import Path
from contextlib import ExitStack

LIMIT=1<<20
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'

def need(ok,msg):
    if not ok: raise ValueError(msg)

def unique(pairs):
    d={}
    for k,v in pairs:
        need(k not in d,'duplicate JSON key'); d[k]=v
    return d

def decode(b):
    return json.loads(b.decode('utf-8'),object_pairs_hook=unique)

def sha(p):
    with open(p,'rb') as f: return hashlib.file_digest(f,'sha256').hexdigest()

def rows(p, expected, copy=None):
    h=hashlib.sha256()
    with open(p,'rb') as f:
        while True:
            b=f.readline(LIMIT+1)
            if not b: break
            need(len(b)<=LIMIT and b.endswith(b'\n'),'oversized/unterminated row')
            h.update(b)
            if copy is not None: copy.write(b)
            yield decode(b)
    need(h.hexdigest()==expected,'input digest mismatch')

def read64(fd,i):
    b=os.pread(fd,8,8*i); need(len(b)==8,'short counter read')
    return struct.unpack('<Q',b)[0]

def write(fd,i,w,x):
    b=struct.pack('<Q' if w==8 else '<I',x)
    need(os.pwrite(fd,b,i*w)==w,'short write')

def edge(r,n):
    need(isinstance(r,dict) and {'u','v','role','kind'}<=r.keys(),'edge schema')
    u,v=r['u'],r['v']
    need(type(u) is int and type(v) is int and 0<=u<n and 0<=v<n,'edge endpoint')
    need(all(type(r[k]) is str and r[k] for k in ('role','kind')),'missing edge evidence')
    return u,v

def build(src,dst,expected):
    src,dst=Path(src),Path(dst)
    need(len(expected)==64,'manifest digest required')
    with open(src/'manifest.json','rb') as f: raw=f.read(LIMIT+1)
    need(len(raw)<=LIMIT and hashlib.sha256(raw).hexdigest()==expected,'manifest digest mismatch')
    m=decode(raw); n,e=m['nodes'],m['edges']
    need(m['schema']=='typed-csr-input-v1' and type(n) is int and 0<=n<=2**32 and type(e) is int and 0<=e<2**60,'manifest dimensions/schema')
    need(all(type(m.get(k)) is str and m[k] for k in ('source_repo','source_commit','graph_kind','provenance')),'missing provenance')
    need(m['graph_kind'] in ('synthetic','export-fixture-package-projection','static-source','elaborated-projection'),'unknown graph kind')
    if m['graph_kind']=='elaborated-projection':
        need(m['source_repo']=='leanprover-community/riemann-hypothesis' and m['source_commit']==PIN,'wrong RH pin')
    for k in ('names.ndjson','edges.ndjson'):
        need(type(m['sha256'][k]) is str and len(m['sha256'][k])==64,'missing digest')
    dst.parent.mkdir(parents=True,exist_ok=True)
    lock=dst.with_name(dst.name+'.lock'); fd=os.open(lock,os.O_CREAT|os.O_EXCL|os.O_WRONLY,0o600); os.close(fd)
    stage=None
    try:
        need(not dst.exists(),'destination exists')
        stage=Path(tempfile.mkdtemp(prefix='.csr-',dir=dst.parent))
        # B-tree is deliberate: exact tagged-name uniqueness costs O(V log V), not linear.
        with ExitStack() as stack:
            db=sqlite3.connect(stage/'names.sqlite'); stack.callback(db.close)
            db.execute('PRAGMA cache_size=-1024'); db.execute('PRAGMA temp_store=FILE')
            db.execute('CREATE TABLE names (tag BLOB PRIMARY KEY) WITHOUT ROWID')
            copy=stack.enter_context(open(stage/'names.ndjson','wb'))
            prev=-1; count=0
            for r in rows(src/'names.ndjson',m['sha256']['names.ndjson'],copy):
                need(isinstance(r,dict) and set(r)=={'id','name'},'name schema')
                i,t=r['id'],r['name']
                need(type(i) is int and i>prev and isinstance(t,list) and t and all(type(x) is str or type(x) is int and x>=0 for x in t),'tag or original id')
                tag=json.dumps(t,ensure_ascii=True,separators=(',',':')).encode('ascii')
                try: db.execute('INSERT INTO names VALUES (?)',(tag,))
                except sqlite3.IntegrityError as ex: raise ValueError('duplicate tagged name') from ex
                prev=i; count+=1; need(count<=n,'too many names')
            need(count==n,'name count'); db.commit()
        (stage/'names.sqlite').unlink()
        with ExitStack() as stack:
            def file(path,size):
                f=os.open(path,os.O_CREAT|os.O_EXCL|os.O_RDWR,0o600); stack.callback(os.close,f); os.ftruncate(f,size); return f
            cur=[file(stage/('cursor'+str(k)),8*n) for k in range(2)]
            with open(stage/'edges.ndjson','wb') as copy:
                count=0
                for r in rows(src/'edges.ndjson',m['sha256']['edges.ndjson'],copy):
                    for f,i in zip(cur,edge(r,n)): write(f,i,8,read64(f,i)+1)
                    count+=1; need(count<=e,'too many edges')
            need(count==e,'edge count')
            adj=[]; off=[]
            for k,folder in enumerate(('forward','reverse')):
                p=stage/folder; p.mkdir(); o=file(p/'off',8*(n+1)); a=file(p/'adj',4*e); off.append(o); adj.append(a)
                total=0
                for i in range(n):
                    d=read64(cur[k],i); write(o,i,8,total); write(cur[k],i,8,total); total+=d
                need(total==e,'degree sum'); write(o,n,8,total)
            for r in rows(stage/'edges.ndjson',m['sha256']['edges.ndjson']):
                u,v=edge(r,n)
                for k,(i,j) in enumerate(((u,v),(v,u))):
                    pos=read64(cur[k],i); need(pos<read64(off[k],i+1),'cursor overflow'); write(adj[k],pos,4,j); write(cur[k],i,8,pos+1)
            for k in range(2):
                for i in range(n): need(read64(cur[k],i)==read64(off[k],i+1),'unfilled row')
        for k in range(2): (stage/('cursor'+str(k))).unlink()
        (stage/'input_manifest.json').write_bytes(raw)
        files=['names.ndjson','edges.ndjson','input_manifest.json']+[f'{k}/{p}' for k in ('forward','reverse') for p in ('off','adj')]
        receipt={'schema':'typed-csr-output-v1','input_manifest_sha256':expected,'nodes':n,'edges':e,'graph_kind':m['graph_kind'],'sha256':{p:sha(stage/p) for p in files}}
        (stage/'receipt.json').write_text(json.dumps(receipt,sort_keys=True)+'\n')
        # Cooperative exclusive writer; no power-loss durability guarantee.
        os.rename(stage,dst); stage=None
        return receipt
    finally:
        if stage is not None: shutil.rmtree(stage)
        lock.unlink()

if __name__=='__main__':
    print(json.dumps(build(*sys.argv[1:]),indent=2))
