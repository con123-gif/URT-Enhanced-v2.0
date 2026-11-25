"""STRUCTURE: bare Kahn control vs signature grouping. See end for receipt.
Run: python 2026-11-25_0524_bare_kahn_benchmark.py ZIP_DIRECTORY
"""
import collections as C, hashlib, heapq, json, math, pathlib, random, statistics, subprocess, sys, tempfile, time, zipfile
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'; ROOT=14065054
SPECS=[
(14937732176,'direct_roles',6,'2b775ec5100e19711b40fa9852607b876524a91283432cfeb12a99c22a2ec3f8'),
(14952948474,'frontier_roles',47,'9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6'),
(14962058506,'next_root_roles',18,'beef81685baec5816525e9fe23974ba1541acc10beec0648140a156f62f83831'),
(14966122558,'literature_theta_frontier',71,'6d2752fde5949c14eb18d61b54d7c5d8a4593fc623efb61ba83853ce0e447964'),
(14973774950,'34_producer_frontier',34,'3bed0b78f4f379e8721e3c9e855d335ddc04cba283f86744c11511e0e1bc0acd'),
(14981552949,'post34_frontier',151,'2cd911a88341ad57d0e85090af4e4f58748046d9e49e2b2cb26945ea526230ff'),
(14991121039,'post151_frontier',300,'80176159514e76b57d402bb716f09fed7a13c3855dfea2eda6ffc54763e110ce')]
def ck(x,msg):
    if not x: raise ValueError(msg)
def load(folder):
    ids={}; names={}; owners=set(); ledger=[]; adj=C.defaultdict(set); receipt=hashlib.sha256()
    def ident(i,p,k):
        p=tuple(p); v=(p,k); ck(type(i) is int and i>=0 and p and ids.get(i,v)==v and names.get(p,i)==i,'identity'); ids[i]=v; names[p]=i
    for f,label,count,sha in SPECS:
        with zipfile.ZipFile(folder/f'github-actions-artifact-{f}.zip') as z: b=z.read(f'job/outputs/solution_{label}.json')
        ck(hashlib.sha256(b).hexdigest()==sha,'digest'); receipt.update(b); d=json.loads(b)
        ck((d['digest'],d['bytes'],d['n'],d['root'],d['indexedDeclarations'])==('5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e',61570595788,1065214335,ROOT,1484733),'archive')
        ck(len(d['reports'])==count and d.get('pin',d['reports'][0].get('source',{}).get('pin'))==PIN,'pin/count')
        for r in d['reports']:
            i=r['id']; q=r.get('request',r.get('source')); k=r['kind']; ck(i not in owners and q.get('id',i)==i and q.get('kind',k)==k and r['status']=='EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK','owner'); owners.add(i); ident(i,q['name'].split('.'),k)
            def add(role,slot,j,x,root):
                ledger.append((i,role,slot,j,root,x)); adj[i].add(x['target'])
            def role(z,label,slot):
                root=z['expressionRoot']; seen=set(); total=0; ck(0<=root<d['n'],'root')
                for j,x in enumerate(z['references']):
                    ident(x['target'],x['nameParts'],x['targetKind']); key=(x['kind'],x['target']); w=x['distinctExpressionRecords']; ck(key not in seen and key[0] in ('explicit_const','projection_carrier','literal_primitive') and 0<=x['witnessExpression']<=root and type(w) is int and w>0,'reference'); seen.add(key); total+=w; add(label,slot,j,x,root)
                ck(total==z['referenceOccurrences'],'occurrences')
            role(r['type'],'type',0)
            if r.get('value') is not None: role(r['value'],'value',1)
            for x in r.get('structural',[]):
                s=x['edgeIndex']; v=x['encoded']; ck(r['encodedRootsAndStructuralEdges'][s]==v,'slot')
                if v<0:
                    ident(x['target'],x['nameParts'],x['kind']); ck(v==-x['target']-1,'package'); add('package',s,0,x,None)
                else:
                    ck(k=='rec' and x['kind']=='recursor_rule_rhs' and x['expression']['expressionRoot']+1==v,'rhs'); role(x['expression'],'rhs',s)
    mixed={ROOT}; todo=[ROOT]
    for i in todo:
        for j in adj[i]-mixed: mixed.add(j); todo.append(j)
    ck((len(ids),len(owners),len(mixed),len(ledger))==(7493,627,5474,53140),'census')
    ck(len(set(e[:4] for e in ledger))==len(ledger),'unique roles'); ck(C.Counter(e[1] for e in ledger)==dict(type=11241,value=41673,package=100,rhs=126),'role census')
    return ids,mixed,ledger,receipt.hexdigest()
def graph(nodes,ledger):
    ix={v:i for i,v in enumerate(sorted(nodes))}; a=[set() for _ in ix]; rows=[]
    for dst,role,slot,j,root,x in ledger:
        if dst not in ix: continue
        u,v=ix[x['target']],ix[dst]; rows.append((u,v,role,x.get('distinctExpressionRecords',1)))
        if role!='package': ck(u!=v,'self expression'); a[u].add(v)
    return [sorted(s) for s in a],rows
def schedule(a,mode,grouped):
    n=len(a); deg=[0]*n; phi=(1+math.sqrt(5))/2; kappa=math.pi/math.e; theta=2*math.pi/phi**2
    score=[0 if mode=='ordinary' else len(ss)+(kappa*math.cos((i+1)*theta) if mode=='urt' else 0) for i,ss in enumerate(a)]
    if grouped:
        keys={}; of=[]; targets=[]; left=[]
        for ss in a:
            key=tuple(ss)
            if key not in keys:
                keys[key]=len(left); left.append(0); targets.append(ss)
                for v in ss: deg[v]+=1
            c=keys[key]; of.append(c); left[c]+=1
        ck(all(targets[of[i]]==ss for i,ss in enumerate(a)),'roundtrip')
    else:
        for ss in a:
            for v in ss: deg[v]+=1
    h=[(-score[i],i) for i in range(n) if deg[i]==0]; heapq.heapify(h); out=[]; updates=0
    while h:
        _,i=heapq.heappop(h); out.append(i)
        if grouped:
            c=of[i]; left[c]-=1
            if left[c]: continue
            ss=targets[c]
        else: ss=a[i]
        for v in ss:
            updates+=1; deg[v]-=1
            if deg[v]==0: heapq.heappush(h,(-score[v],v))
    ck(len(out)==n,'cycle'); return out,updates
def metrics(a,rows,out):
    ck(len(out)==len(a) and set(out)==set(range(len(a))),'permutation'); rank=[0]*len(a); diff=[0]*(len(a)+1); span=weighted=0
    for i,v in enumerate(out): rank[v]=i
    for u,v,role,w in rows:
        if role=='package': continue
        s=rank[v]-rank[u]; ck(s>0,'precedence'); span+=s; weighted+=w*s; diff[rank[u]]+=1; diff[rank[v]]-=1
    import itertools
    return [span,weighted,max(itertools.accumulate(diff))]
def mem():
    return {line.split(':')[0]:int(line.split()[1]) for line in pathlib.Path('/proc/self/status').read_text().splitlines() if line.startswith(('VmRSS:','VmHWM:'))}
def worker(p,mode,grouped):
    a,rows=json.loads(pathlib.Path(p).read_text()); before=mem()
    for _ in range(3): schedule(a,mode,grouped)
    times=[]
    for _ in range(7):
        t=time.perf_counter_ns(); out,updates=schedule(a,mode,grouped); times.append((time.perf_counter_ns()-t)/1e6)
    after=mem(); m=metrics(a,rows,out)
    print(json.dumps(dict(order=out,updates=updates,metrics=m,ms=statistics.median(times),before=before,after=after)))
def controls():
    comparisons=0
    for n in range(1,6):
        edges=[(i,j) for i in range(n) for j in range(i+1,n)]
        for mask in range(1<<len(edges)):
            for rev in (False,True):
                a=[[] for _ in range(n)]
                for k,(i,j) in enumerate(edges):
                    if mask>>k&1:
                        if rev: i,j=n-1-i,n-1-j
                        a[i].append(j)
                a=[sorted(s) for s in a]
                for mode in ('ordinary','centrality','urt'):
                    ck(schedule(a,mode,False)[0]==schedule(a,mode,True)[0],'small order'); comparisons+=1
    for grouped in (False,True):
        try: schedule([[1],[0]],'ordinary',grouped)
        except ValueError as e: ck(str(e)=='cycle','negative reason')
        else: raise ValueError('cycle accepted')
    return comparisons
def main(folder):
    ids,mixed,ledger,receipt=load(folder); fingerprint=lambda:hashlib.sha256(json.dumps(ledger,sort_keys=True,separators=(',',':')).encode()).hexdigest(); before=fingerprint(); rng=random.Random(20261125); results={}; comparisons=0
    with tempfile.TemporaryDirectory() as tmp:
        p=pathlib.Path(tmp)/'graph.json'
        for scope,nodes in [('all',ids),('mixed',mixed)]:
            a,rows=graph(nodes,ledger); p.write_text(json.dumps([a,rows])); modes=[(m,g) for m in ('ordinary','centrality','urt') for g in (False,True)]; runs={k:[] for k in modes}; orders={}
            for _ in range(3):
                rng.shuffle(modes)
                for m,g in modes:
                    r=json.loads(subprocess.check_output([sys.executable,__file__,'--worker',str(p),m,str(int(g))])); order=r.pop('order'); expected=orders.setdefault(m,order); ck(expected==order,'real exact order'); comparisons+=1; runs[m,g].append(r)
            results[scope]={m+('_group' if g else '_bare'):dict(ms=[r['ms'] for r in rs],peak=[r['after']['VmHWM'] for r in rs],pre=[r['before']['VmHWM'] for r in rs],metrics=rs[0]['metrics'],updates=rs[0]['updates']) for (m,g),rs in runs.items()}
    ck(before==fingerprint(),'ledger mutation'); print(json.dumps(dict(pin=PIN,input_receipt=receipt,ledger_sha256=before,controls=controls(),cycle_rejections=2,real_orders_checked=comparisons,results=results),indent=2))
if __name__=='__main__':
    if sys.argv[1]=='--worker': worker(sys.argv[2],sys.argv[3],bool(int(sys.argv[4])))
    else: main(pathlib.Path(sys.argv[1]))

# RESULT: PARTIAL, 2026-11-25. Bare Kahn heap baseline supersedes singleton-group
# control for one-shot scheduling performance; grouping remains exact but loses.
# Prior structure 592d045e78be19b6188913aee49cb677de8b46cb, file
# structure/2026-11-25_0424_native_300_benchmark.py. Source src/Main.lean pinned
# blob dbd5db70bc11b35f18fa5751216ab335321e7bfc, rhOfAll; default-branch blob
# eb95ca808793dd61984cc853ab5630f54a74490c uses Claim.zeta, not mixed.
# Peer checkpoints read: dependencies bd222c6 (106 arithmetic requests, not
# outgoing projections); audit 1aa4d3f, math d5e71f8, integration 1870539,
# latest branch commit list incl specialist lanes. SWARM first, AGENTS, state
# and log excerpts, runner protocol, continuity, handoff. Root-level log/
# protocol paths 404 corrected to runner paths. Blueprint not reopened.
# CI #420 PASS 2026-11-25 05:18:22Z, 729cf4e, run 45549913981; general
# repository not this certificate. Native shell GitHub DNS failed; seven
# artifact ZIPs downloaded with connector. Lean/Lake unavailable.
# Executed native CPython on actual ZIPs as above. First five-block,
# 15-repeat attempt timed out without output; reduced to 3 blocks, 7 repeats,
# 3 warmups; shuffled method order with fixed seed. 36 worker processes,
# 252 timed schedules. 6594 small-graph comparisons, 2 cycle rejections,
# 36 real-order checks (30 noninitial equality checks). Each worker checks
# every typed expression record's precedence. Package rows not precedence,
# raw typed ledger unchanged, exact inputs authenticated.
# Input receipt 006b21e312ca31ce8d30a2929d1fb2ca6d8b00740ccf71b0fbe9647a518736c8
# Ledger SHA256 e3ac9878d89dd5c2ebf51f908638ff04848522c2cd9d238f806d3ec4dffb83b4
# All: 7493 identities, 627 owners, 53140 typed rows; mixed reach 5474.
# Times (3 worker medians, ms), VmHWM (3 worker readings, KiB):
# all ordinary bare [7.607832,7.595074,7.736196] [111068,111088,111068]
# all ordinary group [9.387613,9.383701,9.488775] [111640,111640,111640]
# all centrality bare [8.564971,8.654248,8.493401] [111092,111080,111064]
# all centrality group [10.395156,11.0837,10.80957] [111664,111688,111668]
# all urt bare [9.891155,9.486619,10.327039] [111424,111452,111432]
# all urt group [11.711583,11.346507,11.44249] [112084,112100,112144]
# mixed ordinary bare [5.535186,5.479904,7.503333] [108628,108632,108632]
# mixed ordinary group [7.00516,6.854457,7.126437] [108936,108928,108928]
# mixed centrality bare [6.691664,6.147317,6.172705] [108664,108656,108652]
# mixed centrality group [7.554058,7.896811,7.519487] [108948,108948,108944]
# mixed urt bare [7.373025,7.897212,7.226524] [108972,108976,108968]
# mixed urt group [8.014454,8.390137,8.302128] [109280,109276,109272]
# All span / weighted / peak live typed rows:
# ordinary 235231239 / 238402585 / 45538
# centrality 292038430 / 295456821 / 46616
# urt 307213099 / 310734329 / 47127
# Mixed: 126331021/128034584/32466; 149468838/151210562/33212;
# 162386299/164215700/33098 respectively.
# Updates 44046->34495 all, 32459->25295 mixed. Preparation-inclusive
# scheduling only (input validation, common graph build and postmetrics excluded).
# RAM before metrics includes worker input load and warmups; high-water floor
# conceals smaller allocations. No statistically general RAM claim.
# Bare wins all six matched comparisons of worker medians. Grouping ordinary
# is about 23% slower despite 22% fewer updates. URT bare about 30% slower and
# 31% greater edge span vs ordinary bare. No human comprehension test, no
# universal O(N) Lean optimizer or axiom/kernel verification. Ordinary uses
# constant priority and heap rather than linear FIFO to preserve exact order.
# RESUME HERE: compute exact immediate dominators on root-connected
# dependency projection with explicit typed edges; compare reuse-aware priority
# to this bare baseline, preserve package roles and incomplete-frontier labels.
# HANDOFF TO dependencies, integration, audit. Full RH reconstruction OPEN.
