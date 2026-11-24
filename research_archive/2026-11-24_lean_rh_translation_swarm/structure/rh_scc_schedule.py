"""STRUCTURE 2026-11-24: actual exported Nat.add_succ graph SCC scheduling control.
RESULT PARTIAL: lossless pair-level condensation and matched scheduling on an
actual published Lean export fixture, NOT RH kernel coverage or proof checking.
Replay: python rh_scc_schedule.py [sample.ndjson]
Source: leanprover/lean4export 15f6055e299ad5b89345e533cc2192f4cc00f659
examples/Nat.add_succ.ndjson, blob d3cd35f1313b4e78b5fded9886e450112aa75def.
RH target pin 40e56bab026552e089d7afcfeff08d2defb9c005 (not used as fixture);
src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc uses rhOfAll.
Current upstream c9883164b0b3d762cee21f889d03d59a53b3ba3b, Main blob
67c65badc15f80a1db65df1c84dc7a4928fc410f uses Claim.zeta; keep separate.
Snapshot independently projected in connector V8 from original raw fixture;
compare optional raw fixture to snapshot. Edges owner -> referenced declaration.
Peer ccefc7376b8201061060adf09452ab7a61ab9cac verified 116 typed role rows,
46 structural rows; our distinct owner-role-target rows 114 (kind collapsed),
75 direct pairs, 107 package pairs match peer. Do not replace original role
ledger, witnesses, source terms, premises or axiom information with pair graph.
Package membership is structural, not a proof implication. Self and mutual
edges retained in ledger; SCC only changes presentation. No equivalence of
declarations inferred. Every path projects to a component path; conversely
each intercomponent edge lifts via internal SCC paths. All original pairs
recoverable from internal/crossing ledger; all reached-pair reachability checked.
Current pre-write branch 8ede98a259bcfe7b21fdb49e27f30e2cc960442e. Read swarm,
handoff, AGENTS, state/log/protocol, continuity, latest peer dependency, prior
structure, audit, integration, theta and proof-editor checkpoints. Physical CI
checkpoint 358 PASS run 45360853226, commit 1cb5008, unrelated.
Local Python run (snapshot path) exit 0. Raw source fetched and projection run
in V8; local raw_check replay not executed because curl DNS resolution failed.
Lean unavailable. No RH export 3.1.0 or kernel check performed.
Results: 27 reached direct nodes, 65 pairs, 27 components, 1 internal self-pair,
64 crossing pairs; 32 package nodes, 107 pairs, 19 components (6 nontrivial),
53 internal pairs, 54 crossing pairs in 36 component arcs. 1753 ordered-pair
reachability assertions passed; 4 reversed/missing schedule controls rejected.
Matched heap scheduling, fixed fan + (pi/e)*cos((rank+1)*2pi/phi^2), precomputed
scores. Five batches of 1000 schedules, median microseconds and incremental
tracemalloc bytes (graph/interpreter/score setup excluded; not total RSS).
Direct area/peak/time/bytes: lexical 612/35/10.647/1440;
centrality 715/40/12.478/1440; critical-depth 532/30/11.386/1440;
URT 688/40/10.609/1440.
Package: lexical 420/35/6.790/840; centrality 474/39/6.647/840;
critical-depth 329/28/6.456/840; URT 459/37/6.619/840.
Area and peak count original distinct crossing pairs at component boundaries,
not typed obligation multiplicities or within-block effort. Compare policies
only within same graph, not direct vs package as a readability gain. No human
panel; structural proxies only. URT worse than lexical and critical-depth on
locality on both graphs; no measured RAM advantage. Timings not decisive.
Oracle all-pairs traversal is intentionally small-fixture O(V*(V+E)), not a
scalable SCC algorithm. Heap schedule O((V+E)log V) upper bound. No universal
O(N) optimizer or URT advantage claim.
RESUME HERE: on authenticated RH 3.1.0 typed export, build iterative SCC
condensation and validate against this oracle on small induced graphs; preserve
typed witness rows and compare matched heap schedulers on reached RH components.
HANDOFF TO: dependencies, integration, audit, proof editor.
"""
import sys,json,hashlib,math,time,statistics,tracemalloc,heapq
G=[[1,2,3,5],[12,20,21],[23],[24,29,31],[33],[35,36,38],[39],[40],[50,51,52],[54,55,58],[59],[61],[60],[64],[66],[65],[100],[101],[102]]
D={int(k):list(map(int,v.split(','))) for k,v in (s.split(':') for s in '2:1 3:1 5:1,2,3,5 20:12 21:12,20 24:23 29:23,24 31:24,29 33:23,24 36:35 38:35,36 39:35 40:24,29,35,39 51:50 52:50,51 55:54 58:54,55 59:1,5,50,54 60:1,54,59,61 61:1,2,3,5,50,51,54,55,59 64:1,2,3,5 65:1,2,3,54,59,60,66 66:1,2,3,64 100:1,35,36,65 101:12,20 102:1,3,12,33,40,100,101'.split())}
V=set(sum(G,[])); direct={(a,b) for a,bs in D.items() for b in bs}
# Additional package/metadata pairs from original source projection (not premises).
extra={(a,a) for a in [1,12,23,24,33,35,39,40,50,54,59,60,61,64,65,66,100,101,102]}
extra|={(g[0],b) for g in G for b in g[1:]}|{(b,g[0]) for g in G for b in g[1:]}
pkg=direct|extra
assert (len(V),len(direct),len(pkg))==(32,75,107)

def raw_check(path):
    b=open(path,'rb').read(); assert hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()=='d3cd35f1313b4e78b5fded9886e450112aa75def'
    rows=list(map(json.loads,b.splitlines())); ex={r['ie']:r for r in rows if 'ie' in r}; groups=[]; decl=[]
    for r in rows:
        if any(k in r for k in ('ie','in','il','meta')): continue
        k,v=next(iter(r.items())); m=sum([v[x] for x in ('inductiveVals','constructorVals','recursorVals')],[]) if k=='inductive' else v
        groups.append([d['name'] for d in m]); decl+=m
    a=set(); s=set()
    for d in decl:
        owner=d['name']; roots=[d['type']]+([d['value']] if 'value' in d else [])+[r['rhs'] for r in d.get('rules',[])]
        for root in roots:
            q=[root]; seen=set()
            while q:
                i=q.pop()
                if i in seen: continue
                seen.add(i); r=ex[i]; k=next(k for k in r if k!='ie'); z=r[k]
                if k=='const': a.add((owner,z['name']))
                elif k=='proj': a.add((owner,z['typeName'])); q.append(z['struct'])
                elif k=='app': q.extend([z['fn'],z['arg']])
                elif k in ('lam','forallE'): q.extend([z['type'],z['body']])
                elif k=='letE': q.extend([z['type'],z['value'],z['body']])
                elif k=='mdata': q.append(z['expr'])
                else: assert k in ('bvar','sort'),k
        s|={(owner,t) for t in d.get('all',[])+d.get('ctors',[])+([d['induct']] if 'induct' in d else [])+[r['ctor'] for r in d.get('rules',[])]}
    for g in groups:
        for x in g[1:]: s|={(g[0],x),(x,g[0])}
    assert groups==G and a==direct and a|s==pkg

def closure(v,E):
    adj={x:set() for x in v}
    for a,b in E: adj[a].add(b)
    out={}
    for a in v:
        q=[a]; seen={a}
        while q:
            for b in adj[q.pop()]-seen: seen.add(b);q.append(b)
        out[a]=seen
    return out

def quotient(E):
    # Small fixture independent reachability-based SCC oracle, NOT linear SCC implementation.
    r=closure(V,E); reached=r[102]; E={(a,b) for a,b in E if a in reached}; c={a:min(b for b in r[a] if a in r[b]) for a in reached}
    groups={i:sorted(a for a in reached if c[a]==i) for i in set(c.values())}
    ledger={}; internal=[]
    for a,b in sorted(E):
        if c[a]==c[b]: internal.append((a,b))
        else: ledger.setdefault((c[b],c[a]),[]).append((a,b)) # prerequisite -> consumer
    assert set(internal)|{e for es in ledger.values() for e in es}==E
    assert len(internal)+sum(map(len,ledger.values()))==len(E)
    qr=closure(set(groups),{(b,a) for a,b in ledger})
    assert all((b in r[a])==(c[b] in qr[c[a]]) for a in reached for b in reached)
    return groups,ledger,internal,len(reached),len(E)

def benchmark(E):
    groups,ledger,internal,n,m=quotient(E); ids=sorted(groups); adj={i:[] for i in ids}; deg=dict.fromkeys(ids,0)
    for a,b in ledger: adj[a].append(b);deg[b]+=1
    fan={i:len(adj[i]) for i in ids}; phi=(1+math.sqrt(5))/2; angle=2*math.pi/phi**2
    def schedule(score):
        d=deg.copy(); h=[(-score[i],i) for i in ids if d[i]==0];heapq.heapify(h);o=[]
        while h:
            _,a=heapq.heappop(h);o.append(a)
            for b in adj[a]:
                d[b]-=1
                if d[b]==0: heapq.heappush(h,(-score[b],b))
        assert len(o)==len(ids);return o
    depth={}
    for i in reversed(schedule(dict.fromkeys(ids,0))): depth[i]=1+max([depth[b] for b in adj[i]],default=0)
    scores={'lexical':dict.fromkeys(ids,0),'centrality':fan,'critical_depth':depth,'urt':{i:fan[i]+math.pi/math.e*math.cos((j+1)*angle) for j,i in enumerate(ids)}}
    def metrics(o):
        assert len(o)==len(ids) and set(o)==set(ids);p={a:i for i,a in enumerate(o)}
        assert all(p[a]<p[b] for a,b in ledger)
        live=[sum(len(es) for (a,b),es in ledger.items() if p[a]<=j<p[b]) for j in range(len(o))]
        assert sum(live)==sum(len(es)*(p[b]-p[a]) for (a,b),es in ledger.items())
        return [sum(live),max(live,default=0)]
    result={}
    for k,s in scores.items():
        o=schedule(s);ts=[]
        for _ in range(5):
            t=time.perf_counter_ns()
            for _ in range(1000): schedule(s)
            ts.append((time.perf_counter_ns()-t)/1e6)
        tracemalloc.start();schedule(s);_,peak=tracemalloc.get_traced_memory();tracemalloc.stop()
        result[k]=dict(area_peak=metrics(o),median_us=round(statistics.median(ts),3),incremental_python_bytes=peak,order=o)
    for bad in [o[::-1],o[:-1]]:
        try: metrics(bad)
        except AssertionError: pass
        else: raise AssertionError('bad schedule accepted')
    return dict(reached=n,original_pairs=m,components=len(ids),nontrivial=[g for g in groups.values() if len(g)>1],internal_pairs=len(internal),quotient_pairs=len(ledger),crossing_pairs=sum(map(len,ledger.values())),reachability_assertions=n*n,negative_controls=2,results=result)

if __name__=='__main__':
    if len(sys.argv)>1:raw_check(sys.argv[1])
    print(json.dumps({'direct':benchmark(direct),'package':benchmark(pkg)},indent=2))
