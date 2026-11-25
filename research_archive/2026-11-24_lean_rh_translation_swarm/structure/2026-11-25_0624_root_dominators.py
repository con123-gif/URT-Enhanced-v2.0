"""Root dominators on authenticated observed roles, not Lean kernel dependencies.
Run: python 2026-11-25_0624_root_dominators.py ZIP_DIRECTORY
Uses sibling 0524 certificate for authenticated loading and matched baseline.
"""
import collections as C, hashlib, heapq, json, pathlib, random, runpy, statistics, subprocess, sys, tempfile, time
B=runpy.run_path(str(pathlib.Path(__file__).with_name('2026-11-25_0524_bare_kahn_benchmark.py')))
ck=B['ck']

def reverse_post(g,r):
    seen={r}; post=[]; stack=[(r,iter(g[r]))]
    while stack:
        v,it=stack[-1]; w=next(it,None)
        if w is None: post.append(v); stack.pop()
        elif w not in seen: seen.add(w); stack.append((w,iter(g[w])))
    return post[::-1]

def dominators(g,r):
    # Cooper-Harvey-Kennedy fixed point on reverse postorder, including cycles.
    order=reverse_post(g,r); rank={v:i for i,v in enumerate(order)}; pred=[[] for _ in g]
    for u in order:
        for v in g[u]: pred[v].append(u)
    parent={r:r}; passes=0
    def intersect(u,v):
        while u!=v:
            while rank[u]>rank[v]: u=parent[u]
            while rank[v]>rank[u]: v=parent[v]
        return u
    while True:
        passes+=1; changed=False
        for v in order[1:]:
            ps=[u for u in pred[v] if u in parent]; ck(bool(ps),'reachable predecessor')
            p=ps[0]
            for u in ps[1:]: p=intersect(p,u)
            if parent.get(v)!=p: parent[v]=p; changed=True
        if not changed: break
    return parent,passes

def oracle(g,r,dom):
    # Independent greatest fixed point of path-intersection sets; no idom code.
    order=reverse_post(g,r); pred=[[] for _ in g]
    for u in order:
        for v in g[u]: pred[v].append(u)
    universe=sum(1<<v for v in order); d={v:universe for v in order}; d[r]=1<<r
    while True:
        changed=False
        for v in order[1:]:
            z=universe
            for u in pred[v]: z&=d[u]
            z|=1<<v
            if z!=d[v]: d[v]=z; changed=True
        if not changed: break
    ck(set(d)==set(dom),'domain'); pairs=0
    for v in order:
        p=v; bits=1<<p
        while p!=r:
            p=dom[p]; ck(not bits>>p&1,'parent cycle'); bits|=1<<p
        ck(bits==d[v],'all ancestor pairs'); pairs+=len(order)
    return pairs

def forward(n,rows,package):
    g=[set() for _ in range(n)]
    for u,v,role,w in rows:
        if package or role!='package': g[v].add(u)
    return [sorted(s) for s in g]

def priority(g,r):
    p,_=dominators(g,r); child=[[] for _ in g]; reuse=[0]*len(g)
    for u in p:
        for v in g[u]: reuse[v]+=1
        if u!=r: child[p[u]].append(u)
    # Deterministic tree postorder: visit lower-reuse sibling roots first;
    # shared roots later, near subsequent consumers. Heap still enforces edges.
    for c in child: c.sort(key=lambda v:(reuse[v],v))
    post=reverse_post(child,r)[::-1]; ck(len(post)==len(p),'tree coverage')
    return {v:i for i,v in enumerate(post)}

def schedule(a,rows,r,mode):
    if mode!='dom': return B['schedule'](a,mode,False)[0]
    rank=priority(forward(len(a),rows,True),r); ck(len(rank)==len(a),'mixed reach')
    deg=[0]*len(a)
    for s in a:
        for v in s: deg[v]+=1
    h=[(rank[v],v) for v,d in enumerate(deg) if not d]; heapq.heapify(h); out=[]
    while h:
        _,u=heapq.heappop(h); out.append(u)
        for v in a[u]:
            deg[v]-=1
            if not deg[v]: heapq.heappush(h,(rank[v],v))
    ck(len(out)==len(a),'cycle'); return out

def controls():
    # Exhaust all directed non-self edges on 4 labelled vertices, including cycles.
    pairs=0; cases=0
    edges=[(u,v) for u in range(4) for v in range(4) if u!=v]
    for mask in range(1<<len(edges)):
        g=[[] for _ in range(4)]
        for i,(u,v) in enumerate(edges):
            if mask>>i&1: g[u].append(v)
        p,_=dominators(g,0); pairs+=oracle(g,0,p); cases+=1
    # Diamond: sharing is not ownership; adding an alternate path changes idom.
    g=[[1,2],[3],[3],[]]; ck(dominators(g,0)[0][3]==0,'diamond')
    g[2]=[]; ck(dominators(g,0)[0][3]==1,'missing edge changes domination')
    # Metadata cycles may be in the mixed graph, but not in scheduling precedence.
    g=[[1],[0,2],[]]; ck(dominators(g,0)[0]=={0:0,1:0,2:1},'metadata cycle')
    return dict(graphs=cases,ancestor_pairs=pairs,specific_controls=3)

def worker(path,mode):
    a,rows,r=json.loads(pathlib.Path(path).read_text()); before=B['mem'](); times=[]
    for _ in range(2): schedule(a,rows,r,mode)
    for _ in range(5):
        t=time.perf_counter_ns(); out=schedule(a,rows,r,mode); times.append((time.perf_counter_ns()-t)/1e6)
    after=B['mem'](); print(json.dumps(dict(order=out,ms=statistics.median(times),before=before,after=after,metrics=B['metrics'](a,rows,out))))

def main(folder):
    ids,mixed,ledger,receipt=B['load'](folder); keys=sorted(mixed); a,rows=B['graph'](mixed,ledger); r=keys.index(B['ROOT']); n=len(a)
    fingerprint=lambda:hashlib.sha256(json.dumps(ledger,sort_keys=True,separators=(',',':')).encode()).hexdigest(); before=fingerprint(); ds={}; census={}
    for label,package in [('expression',False),('mixed',True)]:
        g=forward(n,rows,package); p,k=dominators(g,r); pairs=oracle(g,r,p); ds[label]=p; child=C.Counter(v for u,v in p.items() if u!=r)
        census[label]=dict(nodes=len(p),edges=sum(len(g[u]) for u in p),passes=k,ancestor_pairs=pairs,root_children=child[r],nonroot_internal=sum(u!=r for u in child),max_children=max(child.values()))
    both=set(ds['expression'])&set(ds['mixed']); changes=[u for u in both if ds['expression'][u]!=ds['mixed'][u]]
    examples=[dict(id=keys[u],name='.'.join(ids[keys[u]][0]),expression_parent=keys[ds['expression'][u]],mixed_parent=keys[ds['mixed'][u]]) for u in sorted(changes)[:8]]
    # Hash all exact immediate-dominator rows for reproducible provenance.
    domrows={k:[[keys[u],keys[v]] for u,v in sorted(p.items())] for k,p in ds.items()}; digest=hashlib.sha256(json.dumps(domrows,separators=(',',':'),sort_keys=True).encode()).hexdigest()
    modes=['ordinary','centrality','urt','dom']; results={m:[] for m in modes}; orders={}; rng=random.Random(20261125)
    with tempfile.TemporaryDirectory() as tmp:
        path=pathlib.Path(tmp)/'graph.json'; path.write_text(json.dumps([a,rows,r]))
        for _ in range(3):
            rng.shuffle(modes)
            for m in modes:
                z=json.loads(subprocess.check_output([sys.executable,__file__,'--worker',str(path),m])); order=z.pop('order'); ck(order==orders.setdefault(m,order),'repeat order'); results[m].append(z)
    ck(before==fingerprint(),'ledger mutation')
    print(json.dumps(dict(pin=B['PIN'],receipt=receipt,ledger_sha256=before,dom_sha256=digest,rows=len(rows),census=census,parent_changes=len(changes),examples=examples,controls=controls(),results=results),indent=2))

if __name__=='__main__':
    if sys.argv[1]=='--worker': worker(sys.argv[2],sys.argv[3])
    else: main(pathlib.Path(sys.argv[1]))

# RESULT: PARTIAL, 2026-11-25. Root-connected dominator-local explanation
# scheduling reduces total dependency span, but worsens runtime, peak live
# reference count and measured process high-water memory. Not a URT advantage.
# Prior certificate 93f6005c8650b0519e0eb116c828f81edf4bd50c,
# structure/2026-11-25_0524_bare_kahn_benchmark.py. Prior ParDual-only dominator
# experiment 2026-11-24_1224_pardual_postdominators.mjs was a smaller presentation
# graph; this run is the full currently authenticated mixed-root projection.
# Pinned src/Main.lean at 40e56bab026552e089d7afcfeff08d2defb9c005:
# theorem riemannHypothesis := rhOfAll (blob dbd5db70bc11b35f18fa5751216ab335321e7bfc).
# Latest upstream observed a18a350c3e5aad997766cff2670b292313e46574, 05:32:50 UTC:
# src/Main.lean now uses Claim.zeta; fetched both pinned and current source,
# no repin or assumed equivalence. Main metadata API fetch returned raw text
# instead of JSON, corrected by raw file retrieval.
# Read SWARM first, AGENTS, state/log excerpts, runner protocol, continuity,
# HANDOFF_QUEUE; latest dependency 0512, integration 0600, audit 0548, math
# mem_conductor_set_iff and preceding structure 0424/0524. External blueprint
# and remaining specialist checkpoint files not reopened. General CI #423 PASS
# 2026-11-25 06:14:38Z, 86bdbcc, run 45556824120, not new certificate.
# Base observed before commit 88a2c85158985a693331f4ad1c467f9dbb384066.
# Root-level log/protocol 404 corrected to runner paths. Native GitHub DNS
# failed; seven artifact requests initially against upstream returned 404,
# corrected to Cathedral repo, all seven ZIPs downloaded to native sandbox.
# Lean/Lake unavailable. New arithmetic requests not merged (dependency 0512
# records 106 request identities, integration 0600 reports solution 404).
# Local CPython py_compile and execution with actual ZIP_DIRECTORY succeeded.
# Previous loader/graph/baseline functions transcribed into sandbox from
# connector-retrieved sibling certificate; committed program imports sibling.
# Authentic report SHA256s, exact archive pin, typed identity/role guards as
# in sibling SPECS/load. Input receipt:
# 006b21e312ca31ce8d30a2929d1fb2ca6d8b00740ccf71b0fbe9647a518736c8
# Ledger SHA256 unchanged:
# e3ac9878d89dd5c2ebf51f908638ff04848522c2cd9d238f806d3ec4dffb83b4
# Dominator rows SHA256:
# 933c688c3b878a5d44c7e1e5cd0bcf23d193cff327f28e0245ccd150cb025b82
# 7493 observed identities, 627 expanded owners, 53140 typed evidence rows.
# Mixed scope 5474 nodes / 38612 typed rows; package roles kept, not precedence.
# Expression-only root reach 5456, 32333 distinct pairs, 364 nonroot internal
# dominators; mixed reach 5474, 32504 pairs, 379 nonroot internal. Both converge
# in 2 passes including no-change pass. Root has exactly two children:
# rhOfAll (14065053) and RiemannHypothesis (326825). Largest immediate child
# group is everyCharacter (14065051): 607 expression / 659 mixed children.
# 85 common identities change immediate parent when metadata paths admitted;
# e.g. Sigma.fst (90918) changes from UpperTheory.Zero.LLC.recTExists (11307205)
# to UpperTheory.FinalTheorems.everyCharacter (14065051). This is not a
# logical dependency change: it is sensitivity to typed graph projection.
# Observed reachable axiom-kind identity propext (2661), NOT a complete axiom
# ledger. Incomplete outgoing frontier means dominator claims provisional.
# Exact bitset set-equality checks represent 29,767,936 expression and
# 29,964,676 mixed ancestor pairs (not individual assertion calls).
# Exhaustive 4096 labelled directed four-vertex graphs, 47872 represented
# pairs, plus diamond, missing-edge and metadata-cycle controls. 12 isolated
# workers, 60 timed schedules, 2 warmups each. Orders repeat; all typed
# nonpackage precedence and full vertex permutations validated.
# Worker medians ms / VmHWM KiB (3 readings):
# ordinary [8.873338,5.766180,5.805298] [109048,108972,108972]
# centrality [9.344617,7.576940,6.745764] [109004,109068,109036]
# urt [10.949247,7.097208,7.506507] [109360,109292,109368]
# dom [44.220757,45.495031,46.546000] [111652,111404,111652]
# Metrics span / weighted span / peak live typed expression rows:
# ordinary 126331021 / 128034584 / 32466
# centrality 149468838 / 151210562 / 33212
# urt 162386299 / 164215700 / 33098
# dom 35882966 / 36064732 / 34844
# Dom priority includes mixed graph construction + CHK + tree ordering and
# Kahn; baselines include score and Kahn, exclude common loaded inputs and
# postmetrics. CHK fixed-point method not claimed O(N). Oracle not timed.
# Dom span reduction 71.6% vs bare ordinary, weighted 71.8%; peak live grows
# 7.3%, runtime ~7.8x. Process HWM includes loaded input; no robust RAM law.
# Baseline fixed URT pi/e*cos((i+1)*2pi/phi^2) + outdegree still loses.
# No human comprehension study, kernel replay, full proof or axiom closure.
# No premise removed; dominators indicate all observed paths, not theorem
# equivalence, ownership, necessity, or sufficient conditions in Lean.
# RESUME HERE: cache the authenticated mixed dominator tree and benchmark a
# live-reference-aware ready-heap tie-break inside each dominator block
# against this exact span and peak-live baseline, retaining every role.
# HANDOFF TO dependencies, integration, audit, acceleration. Full RH OPEN.
