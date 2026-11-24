"""Numeric CSR query layer; not a Lean parser, proof checker or receipt authenticator."""
import array, collections, hashlib, json, math, os, random, resource, struct, sys, tempfile, time
from pathlib import Path


def require(ok, msg):
    if not ok:
        raise ValueError(msg)


def digest(path):
    h=hashlib.sha256()
    with open(path,'rb') as f:
        for b in iter(lambda:f.read(1<<20),b''): h.update(b)
    return h.hexdigest()


class Reader:
    """CSR files: little-endian uint64 offsets, uint32 neighbors; bounded LRU."""
    def __init__(self, root, n, e, hashes, blocks=64, page=4096):
        require(0<=n<=2**32 and e>=0 and blocks>0 and page>=8 and page%8==0,'bad dimensions/cache')
        self.n,self.e,self.page,self.blocks=n,e,page,blocks
        self.cache=collections.OrderedDict(); self.reads=self.hits=0; self.fds=[]
        try:
            for name,size in [('off',8*(n+1)),('adj',4*e)]:
                p=Path(root)/name
                require(p.stat().st_size==size and digest(p)==hashes[name],'size or digest mismatch')
                self.fds.append(os.open(p,os.O_RDONLY))
            prev=0
            for i in range(n+1):
                v=self.get(0,i,8); require(prev<=v<=e and (i!=0 or v==0),'invalid offsets'); prev=v
            require(prev==e,'bad final offset')
            for i in range(e): require(self.get(1,i,4)<n,'bad neighbor')
            self.cache.clear(); self.reads=self.hits=0
        except BaseException:
            self.close(); raise
    def close(self):
        for fd in self.fds: os.close(fd)
        self.fds=[]; self.cache.clear()
    def get(self,f,i,w):
        p,j=divmod(i*w,self.page); k=(f,p)
        if k in self.cache:
            self.hits+=1; self.cache.move_to_end(k)
        else:
            self.reads+=1; self.cache[k]=os.pread(self.fds[f],self.page,p*self.page)
            if len(self.cache)>self.blocks: self.cache.popitem(last=False)
        b=self.cache[k]; require(j+w<=len(b),'short read')
        return struct.unpack_from('<Q' if w==8 else '<I',b,j)[0]
    def neighbors(self,u):
        require(type(u) is int and 0<=u<self.n,'bad node')
        for i in range(self.get(0,u,8),self.get(0,u+1,8)): yield self.get(1,i,4)


def closure(n, groups, neighbors, order=None):
    """Delta propagation. Sparse masks; every bit crosses each edge <= once."""
    require(len(groups)<=32,'too many lanes')
    order=list(range(len(groups))) if order is None else order
    require(sorted(order)==list(range(len(groups))),'bad order')
    masks={}; pending={}; q=collections.deque(); visits=0
    def add(v,b):
        require(type(v) is int and 0<=v<n,'bad seed/neighbor')
        new=b&~masks.get(v,0)
        if new:
            masks[v]=masks.get(v,0)|new
            if v not in pending: q.append(v); pending[v]=0
            pending[v]|=new
    for k in order:
        for v in groups[k]: add(v,1<<k)
    while q:
        u=q.popleft(); b=pending.pop(u)
        for v in neighbors(u): visits+=1; add(v,b)
    return masks,visits


def baseline(groups,neighbors):
    out={}; visits=0
    for k,ss in enumerate(groups):
        seen=set(ss); q=list(seen)
        while q:
            u=q.pop(); out[u]=out.get(u,0)|(1<<k)
            for v in neighbors(u):
                visits+=1
                if v not in seen: seen.add(v); q.append(v)
    return out,visits


def phase(k,theta):
    buckets=[[] for _ in range(64)]
    for i in range(k): buckets[int(64*((i*theta)%1))].append(i)
    return [i for b in buckets for i in b]


def write_fixture(root,rows):
    """Test writer only; production conversion must preserve exact tagged ID sidecar."""
    root=Path(root); root.mkdir(); e=0
    with open(root/'off','wb') as f,open(root/'adj','wb') as g:
        f.write(struct.pack('<Q',0))
        for ds in rows:
            for v in ds: g.write(struct.pack('<I',v)); e+=1
            f.write(struct.pack('<Q',e))
    return e,{p:digest(root/p) for p in ('off','adj')}


def transpose(rows):
    r=[[] for _ in rows]
    for u,ds in enumerate(rows):
        for v in ds: r[v].append(u)
    return r

# Package-aware projection reproduced by peer projector from actual lean4export sample.
# Original numerical IDs, NOT display names. Sidecar is derived from these exact IDs.
SAMPLE=[[1,[1,2,3,5]],[2,[1]],[3,[1]],[5,[3,2,1,5]],[12,[12,20,21]],[20,[12]],[21,[20,12]],[23,[23]],[24,[23,24,29,31]],[29,[24,23]],[31,[29,24]],[33,[24,23,33]],[35,[35,36,38]],[36,[35]],[38,[36,35]],[39,[35,39]],[40,[24,35,39,29,40]],[50,[50,51,52]],[51,[50]],[52,[51,50]],[54,[54,55,58]],[55,[54]],[58,[55,54]],[59,[1,54,50,5,59]],[61,[59,54,1,3,51,2,55,5,50,61]],[60,[59,1,54,61,60]],[64,[3,2,1,5,64]],[66,[3,2,1,64,66]],[65,[1,54,66,59,60,3,2,65]],[100,[35,1,65,36,100]],[101,[12,20,101]],[102,[100,40,33,12,3,1,101,102]]]


def selftest():
    ids={u:i for i,(u,_) in enumerate(SAMPLE)}; sample=[[ids[v] for v in ds] for _,ds in SAMPLE]
    checks=0; rng=random.Random(1124)
    with tempfile.TemporaryDirectory() as d:
        for j in range(41):
            rows=sample if j==0 else [[rng.randrange(40) for _ in range(rng.randrange(5))] for _ in range(40)]
            for rev in (False,True):
                a=transpose(rows) if rev else rows; p=Path(d)/f'{j}-{rev}'; e,h=write_fixture(p,a)
                r=Reader(p,len(a),e,h,blocks=2,page=64)
                try:
                    for groups in ([[i] for i in range(32)],[[rng.randrange(len(a)) for _ in range(3)] for _ in range(15)],[]):
                        want,_=baseline(groups,a.__getitem__)
                        for order in (None,phase(len(groups),4/(1+math.sqrt(5))**2),phase(len(groups),1/7)):
                            got,_=closure(len(a),groups,r.neighbors,order); require(got==want,'mask mismatch'); checks+=1
                    if j==0 and not rev: require(len(closure(len(a),[[ids[102]]],r.neighbors)[0])==32,'sample root closure'); checks+=1
                finally: r.close()
        p=Path(d)/'0-False'; h={k:digest(p/k) for k in ('off','adj')}
        for action in (lambda:Reader(p,32,107,{**h,'adj':'0'*64}),lambda:closure(32,[[32]],lambda _:[]),lambda:closure(32,[[]]*33,lambda _:[]),lambda:closure(32,[[]],lambda _:[],[1])):
            try: action()
            except ValueError: checks+=1
            else: raise RuntimeError('negative control accepted')
    return {'checks':checks,'sample_nodes':32,'sample_edges':107}


def bench(kind,n=100000):
    # Separate process per scenario for peak RSS (Linux ru_maxrss KiB).
    rows=[[i+1] if i+1<n else [] for i in range(n)] if kind=='overlap' else [[i+1] if i%100!=99 and i+1<n else [] for i in range(n)]
    groups=[[i] for i in range(15)] if kind=='overlap' else [[i*1000] for i in range(15)]
    with tempfile.TemporaryDirectory() as d:
        p=Path(d)/'graph'; e,h=write_fixture(p,rows); t=time.perf_counter(); r=Reader(p,n,e,h); cold=time.perf_counter()-t
        want,_=baseline(groups,rows.__getitem__); del rows
        out={'scenario':kind,'nodes':n,'edges':e,'cold_verify_s':cold,'reachable':len(want),'cache_payload_limit_bytes':r.page*r.blocks}
        for name,order in [('independent',None),('shared',None),('golden',phase(15,1/((1+math.sqrt(5))/2)**2)),('periodic',phase(15,1/7))]:
            trials=[]
            for _ in range(3):
                r.cache.clear(); r.reads=r.hits=0; t=time.perf_counter()
                got,v=baseline(groups,r.neighbors) if name=='independent' else closure(n,groups,r.neighbors,order)
                trials.append((time.perf_counter()-t,r.reads,v)); require(got==want,'benchmark mismatch')
            out[name]={'trials_s_reads_visits':trials}
        r.close(); out['process_peak_rss_kib']=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
        return out


if __name__=='__main__':
    print(json.dumps(selftest() if len(sys.argv)==1 else bench(sys.argv[1]),indent=2))
