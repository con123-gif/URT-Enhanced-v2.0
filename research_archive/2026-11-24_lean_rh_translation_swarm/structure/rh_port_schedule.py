"""STRUCTURE 2026-11-24 — exact small-graph explanation scheduling control.
RESULT: selected source port tree, not kernel proof or physical derivation.
Input: integration/2026-11-24_0800_TYPED_ROOT_OBLIGATION_GRAPH.json
blob 1823f58b56baf53d1db6a5ce7b781cd24707a1f5; original paths and exact source
spans, binder scopes, ports and unresolved dependencies retained in that artifact.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; current upstream
observed 0e40c084e27c44a3584e271cb14e7dd3bce9aa63 (CI merge, not used).
Replay: python rh_port_schedule.py /path/to/2026-11-24_0800_TYPED_ROOT_OBLIGATION_GRAPH.json
Without argument uses frozen projection; replay with JSON independently checks it.
Connector separately compared all 16 projected records with live peer blob.
First projection omitted one plug unexpanded note: rejected by comparison, corrected,
rerun locally. git ls-remote DNS failure; lean executable absent. No local kernel test.
Prior full-export and full-pool state status paths 404, no completed result claimed.
Prior physical CI checkpoint 355 PASS run 45352595797, unrelated to this result.
Executed locally Python: 16 nodes, 15 mapped ports, 23 null ports, 13 unexpanded
notes, 36 scope entries. All schedules preserve 16 IDs/15 mapped port order; unresolved
records are NOT discharged or removed from original source ledger.
Measured (area, peak live mapped ports, median us, peak incremental traced Python bytes):
lexical (58,7,18.503,480); centrality (58,7,18.891,480);
locality (58,7,67.425,1024); URT (45,5,20.107,480);
size-ordered tree postorder (23,3,6.955,872);
exact ideal DP (23,3,2699.679,42544), 374 reachable ideal states.
Cumulative process max RSS 96408 KiB, not per-policy RSS. Tracemalloc excludes
pre-existing graph and interpreter; times include schedule only, 5 batches.
Reversed and missing-node controls rejected. No human panel; live-port area is
a structural proxy, not comprehension. Tree postorder faster and better locality
than URT here, though larger incremental Python allocation. URT beats lexical
on locality but not best conventional control. Prior 33-node URT loss retained.
Proof of exact control: every topological prefix is an ideal S. Every possible
next node is enumerated by ready(S). Future total live-port area depends only on
S; F(S)=min over ready i of live(S+i)+F(S+i), F(all)=0. Backward induction proves
the computed minimum, not an optimum on a larger unknown graph. Sum of live-port
counts equals sum of position gaps, counting mapped port occurrences separately.
Tree postorder is tested only on this actual selected tree, no universal DAG claim.
DP exponential worst case; not a general O(N) Lean optimizer.
RESUME HERE: use a larger actual direct declaration multigraph from export projection
when available; compare matched ready-heap/critical-depth priorities and exact small
subgraph controls; retain all port scopes and do not mark frontier as complete.
HANDOFF TO: integration, dependency, audit, proof editor.
"""
import functools, json, math, sys, time, tracemalloc, statistics, resource
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'
# owner: (mapped producers, number of null ports, count of unresolved notes, binder count)
P={
'root': (['rh'],0,1,0),'rh':(['allChi','reflect'],0,0,0),'allChi':(['final'],0,0,0),
'reflect':(['right'],0,1,1),'right':([],0,1,1),'final':(['row','ofRow'],0,0,0),
'row':([],0,1,0),'ofRow':(['recT','vwin','lit'],0,1,1),'recT':([],0,1,0),
'vwin':([],0,1,1),'lit':(['adapter','covol'],6,1,2),'covol':([],15,1,15),
'adapter':(['hyps','plug'],1,1,7),'hyps':([],0,1,2),'plug':(['zero'],1,1,3),
'zero':([],0,1,3)}
if len(sys.argv)>1:
    with open(sys.argv[1]) as f: g=json.load(f)
    assert g['upstream_pin']==PIN
    assert {k:([p['producer'] for p in n['ports'] if p['producer'] is not None],sum(p['producer'] is None for p in n['ports']),len(n['unexpanded']),len(n['scope'])) for k,n in g['nodes'].items()}==P
ids=sorted(P); ix={x:i for i,x in enumerate(ids)}; N=len(ids); full=(1<<N)-1
edges=[(ix[d],ix[n]) for n,(ds,*_) in P.items() for d in ds]
need=[sum(1<<ix[d] for d in set(P[n][0])) for n in ids]
fan=[sum(a==i for a,b in edges) for i in range(N)]
phi=(1+math.sqrt(5))/2; kappa=math.pi/math.e; angle=2*math.pi/phi**2
priority=[fan[i]+kappa*math.cos((i+1)*angle) for i in range(N)]
def ready(m): return [i for i in range(N) if not m>>i&1 and need[i]&m==need[i]]
def live(m): return sum(bool(m>>a&1) and not bool(m>>b&1) for a,b in edges)
def greedy(mode):
    m=0; order=[]
    while m!=full:
        r=ready(m); assert r
        i=min(r,key=lambda i: (live(m|1<<i) if mode=='locality' else -(priority[i] if mode=='urt' else fan[i] if mode=='centrality' else 0),i))
        order.append(i);m|=1<<i
    return order

def tree_order():
    assert len(edges)==N-1 and all(fan[i]==(ids[i]!='root') for i in range(N))
    def visit(i):
        sub=[visit(ix[d]) for d in P[ids[i]][0]]
        sub.sort(key=lambda a:(-len(a),a[-1]))
        return [j for a in sub for j in a]+[i]
    return visit(ix['root'])

def exact():
    @functools.lru_cache(None)
    def f(m):
        if m==full:return (0,())
        return min((live(m|1<<i)+v,(i,)+tail) for i in ready(m) for v,tail in [f(m|1<<i)])
    cost,order=f(0);states=f.cache_info().currsize;f.cache_clear();return list(order),cost,states

def metrics(order):
    assert sorted(order)==list(range(N));pos={i:j for j,i in enumerate(order)}
    assert all(pos[a]<pos[b] for a,b in edges)
    m=0;counts=[]
    for i in order:
        m|=1<<i;counts.append(live(m))
    area=sum(counts);assert area==sum(pos[b]-pos[a] for a,b in edges)
    return dict(area=area,peak=max(counts),order=[ids[i] for i in order])

def measure(fn,reps):
    samples=[]
    for _ in range(5):
        t=time.perf_counter_ns()
        for _ in range(reps):fn()
        samples.append((time.perf_counter_ns()-t)/reps/1e3)
    tracemalloc.start();fn();_,peak=tracemalloc.get_traced_memory();tracemalloc.stop()
    return dict(median_us=round(statistics.median(samples),3),peak_traced_python_bytes=peak)

def main():
    assert N==16 and len(edges)==15 and sum(x[1] for x in P.values())==23
    results={mode:metrics(greedy(mode))|measure(lambda:greedy(mode),1000) for mode in ('lexical','centrality','locality','urt')}
    results['tree']=metrics(tree_order())|measure(tree_order,1000)
    order,opt,states=exact();results['exact']=metrics(order)|measure(exact,2)|dict(ideal_states=states)
    assert results['exact']['area']==opt and all(v['area']>=opt for v in results.values())
    for bad in (order[::-1],order[:-1]):
        try:metrics(bad)
        except AssertionError:pass
        else:raise AssertionError('negative control survived')
    print(json.dumps(dict(pin=PIN,nodes=N,mapped_ports=len(edges),null_ports=sum(x[1] for x in P.values()),unexpanded_notes=sum(x[2] for x in P.values()),scope_entries=sum(x[3] for x in P.values()),results=results,negative_controls=2,process_maxrss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss),indent=2))
if __name__=='__main__':main()
