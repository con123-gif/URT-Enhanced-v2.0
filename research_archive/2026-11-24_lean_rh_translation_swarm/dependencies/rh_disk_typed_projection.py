import collections, hashlib, json, os, struct, sys, tempfile, time, resource
K='bvar sort const app lam forallE letE proj natVal strVal mdata'.split()
U=struct.Struct('<I'); R=struct.Struct('<4I')

def pack(x,i):
    assert x['ie']==i and len(x)==2
    k=next(k for k in x if k!='ie'); v=x[k]; op=K.index(k)+1
    a={'const':('name',),'app':('fn','arg'),'lam':('type','body'),'forallE':('type','body'),'letE':('type','value','body'),'proj':('typeName','struct'),'mdata':('expr',)}.get(k,())
    rec=(op,*(v[f] for f in a),*([0]*(3-len(a))))
    decode(rec,i); return rec

def decode(rec,i):
    k,a,b,c=rec
    if not 1<=k<=11: raise ValueError('opcode')
    child={4:(a,b),5:(a,b),6:(a,b),7:(a,b,c),8:(b,),11:(a,)}.get(k,())
    if any(not 0<=j<i for j in child): raise ValueError('forward child')
    refs={3:(('explicit_const',a),),8:(('projection_carrier',a),),9:(('literal_primitive','Nat'),),10:(('literal_primitive','Char.ofNat'),('literal_primitive','String.ofList'))}.get(k,())
    return child,refs

class Masks:
    def __init__(self,f,n,page,capacity):
        if page<1 or capacity<1: raise ValueError('cache config')
        self.f=f; self.n=n; self.page=page; self.cap=capacity; self.cache=collections.OrderedDict(); self.loads=0; self.writes=0; self.peak=0
        f.truncate(4*n)
    def block(self,i):
        if not 0<=i<self.n: raise ValueError('mask ID')
        p,j=divmod(i,self.page)
        if p not in self.cache:
            if len(self.cache)==self.cap:
                q,(b,d)=self.cache.popitem(last=False)
                if d: self.save(q,b)
            self.f.seek(p*self.page*4); size=min(self.page,self.n-p*self.page)*4; b=bytearray(self.f.read(size))
            if len(b)!=size: raise IOError('short mask read')
            self.cache[p]=(b,False); self.loads+=1; self.peak=max(self.peak,sum(len(x[0]) for x in self.cache.values()))
        self.cache.move_to_end(p); return p,j*4
    def save(self,p,b):
        self.f.seek(p*self.page*4)
        if self.f.write(b)!=len(b): raise IOError('short mask write')
        self.writes+=1
    def get(self,i):
        p,j=self.block(i); return U.unpack_from(self.cache[p][0],j)[0]
    def add(self,i,m):
        p,j=self.block(i); b,d=self.cache[p]; old=U.unpack_from(b,j)[0]
        if old|m!=old: U.pack_into(b,j,old|m); self.cache[p]=(b,True)
    def flush(self):
        for p,(b,d) in self.cache.items():
            if d: self.save(p,b)
        self.cache.clear(); self.f.flush()

def project(f,n,seeds,page=4096,capacity=8):
    if not 1<=len(seeds)<=32 or len({(a,b) for a,b,c in seeds})!=len(seeds): raise ValueError('seed roles')
    if os.fstat(f.fileno()).st_size!=16*n: raise ValueError('index size')
    out=[set() for _ in seeds]; seen=edges=reads=0
    with tempfile.TemporaryFile() as mfile:
        m=Masks(mfile,n,page,capacity)
        for bit,(_,_,root) in enumerate(seeds): m.add(root,1<<bit)
        hi=max(s[2] for s in seeds)
        for end in range(hi+1,0,-page):
            start=max(0,end-page); f.seek(start*16); buf=f.read((end-start)*16); reads+=1
            if len(buf)!=(end-start)*16: raise IOError('short index read')
            for i in range(end-1,start-1,-1):
                mask=m.get(i)
                if not mask: continue
                seen+=1; children,refs=decode(R.unpack_from(buf,(i-start)*16),i)
                for j in children: m.add(j,mask); edges+=1
                while mask and refs:
                    bit=mask&-mask; out[bit.bit_length()-1].update(refs); mask^=bit
        m.flush(); stats=dict(scanned=hi+1,reached=seen,child_edges=edges,index_reads=reads,mask_reads=m.loads,mask_writes=m.writes,cache_bytes=m.peak,expression_buffer_bytes=page*16,disk_bytes=20*n)
    return out,stats

# Exact connector-transcribed root-reachable subgraph from the authenticated fixture;
# other expression IDs are padded solely for this disk test, not claimed as original.
FIX=[[1,3,1],[5,1],[11,3,3],[12,1],[307,4,11,5],[410,3,12],[411,4,410,1],[412,3,33],[413,4,412,1],[414,4,413,1],[415,4,414,1],[416,3,40],[417,4,416,1],[418,3,100],[419,4,417,418],[420,4,415,419],[421,4,420,12],[422,4,421,307],[423,4,411,422],[424,4,421,5],[425,4,11,424],[426,4,423,425],[427,6,1,426],[428,6,1,427],[429,3,101],[430,4,429,1],[431,4,430,422],[432,5,1,431],[433,5,1,432]]
SEEDS=[(102,'type',428),(102,'value',433)]
EXPECTED=[{('explicit_const',i) for i in [1,100,12,3,33,40]},{('explicit_const',i) for i in [1,100,101,3,33,40]}]

def write(f,rows):
    for i,r in enumerate(rows): decode(r,i); f.write(R.pack(*r))
    f.flush()

def tests(raw=None):
    results=[]; neg=0; checks=0
    with tempfile.TemporaryFile() as f:
        if raw:
            b=open(raw,'rb').read(); assert hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()=='d3cd35f1313b4e78b5fded9886e450112aa75def'
            rows=[x for x in map(json.loads,b.splitlines()) if 'ie' in x]; write(f,(pack(x,i) for i,x in enumerate(rows)))
        else:
            a={r[0]:tuple((r[1:]+[0,0,0])[:4]) for r in FIX}; write(f,(a.get(i,(2,0,0,0)) for i in range(434)))
        for p,c in [(1,1),(7,2),(64,3),(512,1)]:
            out,s=project(f,434,SEEDS,p,c); assert out==EXPECTED and s['reached']==29; checks+=2; results.append(s)
        for seeds,n in [([(1,'x',434)],434),([(1,'x',0),(1,'x',1)],434),(SEEDS,433)]:
            try: project(f,n,seeds)
            except ValueError: neg+=1
            else: raise AssertionError('accepted invalid input')
    for row,i in [((99,0,0,0),0),((4,1,0,0),1)]:
        try: decode(row,i)
        except ValueError: neg+=1
        else: raise AssertionError('accepted invalid record')
    with tempfile.TemporaryFile() as f:
        n=12; rows=[(2,0,0,0),(3,42,0,0),(1,0,0,0),(4,1,2,0),(5,0,3,0),(6,0,4,0),(7,0,3,5),(8,43,6,0),(9,0,0,0),(10,0,0,0),(11,7,0,0),(4,8,9,0)]; write(f,rows)
        out,s=project(f,n,[(1,'x',10),(1,'y',11)],2,1); assert out==[{('explicit_const',42),('projection_carrier',43)},{('literal_primitive','Nat'),('literal_primitive','Char.ofNat'),('literal_primitive','String.ofList')}]; checks+=1
    bench=[]
    for n in [50000,100000,200000,400000]:
        with tempfile.TemporaryFile() as f:
            t=time.perf_counter(); write(f,((3,1,0,0) if i==0 else (4,i-1,i-1,0) for i in range(n))); build=time.perf_counter()-t
            t=time.perf_counter(); out,s=project(f,n,[(i,'value',n-1) for i in range(32)]); elapsed=time.perf_counter()-t
            assert out==[{('explicit_const',1)}]*32 and s['reached']==n and s['child_edges']==2*(n-1); checks+=1
            bench.append(dict(n=n,build_s=build,scan_s=elapsed,**s))
    return dict(raw_blob_verified=bool(raw),fixture=results,checks=checks,negative_controls=neg,bench=bench,max_rss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)

if __name__=='__main__': print(json.dumps(tests(sys.argv[1] if len(sys.argv)>1 else None),indent=2))

# CHECKPOINT 2026-11-24 11:12 UTC — RESULT PARTIAL (executed disk-projection prototype).
# Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; current upstream
# cb4dc6e23a6187db392c96664295415c55b6b01e. Pinned src/Main.lean blob
# dbd5db70bc11b35f18fa5751216ab335321e7bfc uses rhOfAll; current blob
# 67c65badc15f80a1db65df1c84dc7a4928fc410f uses Claim.zeta. Do not mix.
# Cathedral branch pre-write SHA 077be24d94afd521532b76f9c83e8bcad0cd7262.
# Read protocol, handoff, expansion, AGENTS, state/log/protocol and continuity,
# integration 1100 ParEx, structure 1024, audit pole, math depth-zero, acceleration RUN5.
# Latest physical CI #363 PASS (45376159246), unrelated to RH.
# Corrected stream retry and native Lean fixture v2 status still absent (404).
# Prior challenge status error, hash matched, byte-count mismatch in prior revision.
# No duplicate archive fetch or job. Local Lean absent, raw GitHub DNS failed.
# Prior typed in-memory codec and direct projection retained per-reached-node state.
# This prototype uses a descending ID scan: since every validated child ID is smaller
# than its parent, each node's mask contains exactly the seed roles that reach it
# when the node is visited (induction downwards); OR propagation preserves all
# reference kinds and role separation. No constant's declaration is followed here.
# For at most 32 roles, fixed page/cache sizes: O(H+E+K) operations, H=max root+1,
# E=reached child edges, K=attributed reference occurrences; cache misses bounded
# by mask operations, not guaranteed sequential on arbitrary DAGs. Disk logical
# payload 20N bytes (16N typed index + 4N masks). Working buffers bounded by
# 16P+4PC bytes (P=page records,C=cache pages), excluding output sets, Python
# objects, OS page cache and raw-export/name/declaration metadata. Whole index scan
# can be inferior to sparse traversal; no claim of URT advantage or universal O(N)
# for arbitrary numbers of owner roles. No source hypothesis or raw proof term
# can be reconstructed from this index. No replacement for raw authenticated data.
# Actual fixture source leanprover/lean4export @15f6055e299ad5b89345e533cc2192f4cc00f659,
# examples/Nat.add_succ.ndjson, Git blob d3cd35f1313b4e78b5fded9886e450112aa75def.
# Connector returned all 434 expressions; independent V8 traversal found root
# declaration ID 102, type ID 428 (24 expressions), value ID 433 (21 expressions),
# union 29 expressions. Exact tagged name IDs: 1 Nat, 3 Nat.succ, 12 Eq,
# 33 HAdd.hAdd, 40 instHAdd, 100 instAddNat, 101 rfl.
# Both roles have 6 references; Eq type-only, rfl value-only. Python test uses
# exactly these 29 transcribed rows, padded unreachable IDs; raw SHA verification
# is optional replay only and was not executed locally (network DNS blocked).
# Synthetic all-opcode test covers projections and literal primitive references.
# Python 3.13.5 actual temporary-file tests, not a mock: 13/13 checks, 5/5 rejected
# controls, four cache configurations, 40 reached child edges on fixture.
# Synthetic chain 32 roles: N/build_s/scan_s/index blocks/mask blocks:
# 50000/.047729/.103030/13/13; 100000/.095229/.211346/25/25;
# 200000/.193999/.466514/49/49; 400000/.373641/.986011/98/98.
# 400000 expressions: 799998 child edges, 8000000 logical disk bytes,
# 131072 mask-cache payload + 65536 expression buffer = 196608 bytes.
# Process high-water RSS 96652 KiB includes runtime and tests; not isolated cache.
# Replay python rh_disk_typed_projection.py [path/to/Nat.add_succ.ndjson].
# Local executed code body Git blob 1d9890e5aa790798bc0751e155c09f808a2090a4
# (before this appended checkpoint); Python raw fixture replay not yet executed.
# Production integration still pending: old 12-byte stream file is incompatible;
# need authenticated 3.1 typed writer, preserved name/level/declaration metadata,
# structural package closure, exact raw proof evidence and independent validation.
# RESUME HERE: check retry status, then wire the validated typed index writer
# into authenticated streaming export and project the pinned root type/value
# roles with exact tagged name resolution. Do not run duplicate fetches.
# HANDOFF TO: integration, kernel extraction, acceleration, audit.
