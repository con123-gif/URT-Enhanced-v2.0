"""STRUCTURE: native isolated scheduler benchmark on seven authenticated role exports.
Run: python rh_structure_300.py ZIP_DIRECTORY
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, src/Main.lean.
Role exports are not kernel replay; package edges are retained but not precedence edges.
"""
import collections as C, hashlib, heapq, json, math, pathlib, resource, statistics, subprocess, sys, tempfile, time, zipfile
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'; ROOT=14065054
DIGEST='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e'
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
    ids={}; names={}; owners=set(); records={}; adj=C.defaultdict(set); new=set()
    def ident(i,p,k):
        p=tuple(p); v=(p,k); ck(type(i) is int and i>=0 and p and ids.get(i,v)==v and names.get(p,i)==i,'identity'); ids[i]=v; names[p]=i
    def reach():
        s={ROOT}; q=[ROOT]
        for a in q:
            for b in adj[a]-s: s.add(b); q.append(b)
        return s
    for f,label,count,sha in SPECS:
        if count==300: old=reach(); oldowners=owners.copy()
        with zipfile.ZipFile(folder/f'github-actions-artifact-{f}.zip') as z: b=z.read(f'job/outputs/solution_{label}.json')
        ck(hashlib.sha256(b).hexdigest()==sha,'SHA256'); d=json.loads(b)
        ck((d['digest'],d['bytes'],d['n'],d['root'],d['indexedDeclarations'])==(DIGEST,61570595788,1065214335,ROOT,1484733),'archive')
        ck(len(d['reports'])==count and d.get('pin',d['reports'][0].get('source',{}).get('pin'))==PIN,'pin/count')
        for r in d['reports']:
            i=r['id']; q=r.get('request',r.get('source')); k=r['kind']; ck(i not in owners and q.get('id',i)==i and q.get('kind',k)==k and r['status']=='EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK','owner'); owners.add(i); ident(i,q['name'].split('.'),k)
            if count==300: new.add(i)
            def add(role,slot,j,x,root):
                key=(i,role,slot,j); ck(key not in records,'duplicate role key'); records[key]=(x['target'],i,role,root,x); adj[i].add(x['target'])
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
    mixed=reach(); census=C.Counter(e[2] for e in records.values()); ck((len(ids),len(owners),len(mixed),len(records))==(7493,627,5474,53140),'census'); ck(census==dict(type=11241,value=41673,package=100,rhs=126),'roles'); ck(len(new)==300 and new<=old and not new&oldowners,'new targets')
    return ids,mixed,records

def graph(nodes,records):
    ix={v:i for i,v in enumerate(sorted(nodes))}; a=[set() for _ in ix]; rows=[]
    for src,dst,role,root,x in records.values():
        if dst not in ix: continue
        u,v=ix[src],ix[dst]; rows.append((u,v,role,x.get('distinctExpressionRecords',1)))
        if role!='package': ck(u!=v,'self expression'); a[u].add(v)
    return [sorted(s) for s in a],rows

def run(a,mode,grouped):
    n=len(a); groups={}; of=[]; targets=[]; left=[]; deg=[0]*n
    for i,ss in enumerate(a):
        key=tuple(ss) if grouped else (i,)
        if key not in groups:
            groups[key]=len(left); left.append(0); targets.append(ss)
            for v in ss: deg[v]+=1
        c=groups[key]; left[c]+=1; of.append(c)
    ck(all(targets[of[i]]==ss for i,ss in enumerate(a)),'roundtrip')
    phi=(1+math.sqrt(5))/2; kappa=math.pi/math.e; theta=2*math.pi/phi**2
    score=[0 if mode=='ordinary' else len(ss)+(kappa*math.cos((i+1)*theta) if mode=='urt' else 0) for i,ss in enumerate(a)]
    heap=[(-score[i],i) for i in range(n) if deg[i]==0]; heapq.heapify(heap); out=[]; updates=0
    while heap:
        _,i=heapq.heappop(heap); out.append(i); c=of[i]; left[c]-=1
        if left[c]==0:
            for v in targets[c]:
                updates+=1; deg[v]-=1
                if deg[v]==0: heapq.heappush(heap,(-score[v],v))
    ck(len(out)==n,'expression cycle'); ck(updates==sum(map(len,targets)),'update count'); return out,updates,len(left)

def metrics(a,rows,out):
    n=len(a); ck(len(out)==n and set(out)==set(range(n)),'permutation'); rank=[0]*n
    for i,v in enumerate(out): rank[v]=i
    diff=[0]*(n+1); span=weighted=0; count=0
    for u,v,role,w in rows:
        if role=='package': continue
        s=rank[v]-rank[u]; ck(s>0,'precedence'); count+=1; span+=s; weighted+=w*s; diff[rank[u]]+=1; diff[rank[v]]-=1
    return dict(span=span,weighted=weighted,peak=max(Cumulate(diff)),checked_expression_records=count,retained_package_records=len(rows)-count)
def Cumulate(xs):
    s=0
    for x in xs: s+=x; yield s

def proc_mem():
    return {line.split(":")[0]:int(line.split()[1]) for line in pathlib.Path("/proc/self/status").read_text().splitlines() if line.startswith(("VmRSS:","VmHWM:"))}

def worker(path,mode,grouped):
    a,rows=json.loads(pathlib.Path(path).read_text()); before=proc_mem()
    for _ in range(3): run(a,mode,grouped)
    times=[]
    for _ in range(15):
        t=time.perf_counter_ns(); out,updates,groups=run(a,mode,grouped); times.append((time.perf_counter_ns()-t)/1e6)
    m=metrics(a,rows,out); m.update(order=out,updates=updates,groups=groups,median_ms=statistics.median(times),pre_run_rss_kib=before["VmRSS"],pre_run_peak_kib=before["VmHWM"],peak_rss_kib=proc_mem()["VmHWM"]); print(json.dumps(m))

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
                    x=run(a,mode,False)[0]; y=run(a,mode,True)[0]; ck(x==y,'small equivalence'); comparisons+=1
    for group in (False,True):
        try: run([[1],[0]],'ordinary',group)
        except ValueError as e: ck(str(e)=='expression cycle','negative reason')
        else: raise ValueError('cycle accepted')
    return comparisons

def main(folder):
    ids,mixed,records=load(folder); digest=lambda:hashlib.sha256(json.dumps(list(records.items()),sort_keys=True,separators=(',',':')).encode()).hexdigest(); receipt=digest(); results={}
    with tempfile.TemporaryDirectory() as tmp:
        p=pathlib.Path(tmp)/'graph.json'
        for scope,nodes in [('all',ids),('mixed',mixed)]:
            a,rows=graph(nodes,records); p.write_text(json.dumps([a,rows])); result={}
            for mode in ('ordinary','centrality','urt'):
                pair=[]
                for grouped in (False,True):
                    r=json.loads(subprocess.check_output([sys.executable,__file__,'--worker',str(p),mode,str(int(grouped))])); pair.append(r); result[mode+('_group' if grouped else '_raw')]=r
                ck(pair[0]['order']==pair[1]['order'],'real exact order'); ck(pair[0]['checked_expression_records']+pair[0]['retained_package_records']==len(rows),'record count')
            for r in result.values(): r.pop('order')
            results[scope]=dict(nodes=len(a),records=len(rows),rows=result)
    ck(receipt==digest(),'evidence mutation'); print(json.dumps(dict(pin=PIN,ledger_sha256=receipt,records=len(records),controls=controls(),cycle_rejections=2,results=results),indent=2))
if __name__=='__main__':
    if sys.argv[1]=='--worker': worker(sys.argv[2],sys.argv[3],bool(int(sys.argv[4])))
    else: main(pathlib.Path(sys.argv[1]))

# RESULT: PARTIAL, 2026-11-25 04:24 UTC. One contribution: expand matched scheduling
# benchmark to authenticated post151 extraction and execute isolated native RAM tests.
# Previous structure 898c3d49a1c39ca858bf5c34bbb091a267304c56 (early-map release).
# Dependency 3df7d31187ce2844914f72a056cd96146c231111, dependencies/rh_300_reconcile.py
# and dependencies/2026-11-25_0412_300_RECONCILIATION.md. Seven Actions artifact ZIPs
# downloaded and locally mounted; exact JSON paths and SHA256 above. No raw rescan.
# Pinned src/Main.lean blob dbd5db70bc11b35f18fa5751216ab335321e7bfc (rhOfAll).
# Current default branch Main blob eb95ca808793dd61984cc853ab5630f54a74490c differs
# (Claim.zeta); NOT mixed, current commit SHA not independently resolved.
# Read SWARM first, AGENTS, state, runner log/protocol, continuity, handoff.
# Peer checkpoints: integration acb84a8 (CMBasePatch), math 8d5179d (conductor),
# audit efc75c8 (kept weights), dependencies 3df7d31, acceleration c807cca,
# kernel 967021e, geometry 82a32e4, literature 4e3c4bf, prime 398a176,
# Landau 7e82d0a. Other specialist checkpoints and blueprint not reopened.
# CI summary #417 PASS, d647ebb, run 45543803770, prior general checks not this run.
# Actual execution: python rh_structure_300.py /mnt/data, Linux native CPython.
# 7493 identities, 627 expanded owners, 5474 root-mixed, 53140 typed records
# (11241 type,41673 value,100 package,126 rhs). All 300 new owners reachable before
# expansion; disjoint old owners. Ledger SHA256 before and after:
# 909c5289b1fd072716f5019058d683eed1bf30a1c13e1166abb7e3a7961419e1
# 6594 small graph exact comparisons, six real exact order comparisons, 2 cycle
# rejections. Every expression record precedence checked (53040 all,38512 mixed)
# for all six methods. All package records retained in ledger, not precedence.
# Schedule grouping theorem: identical successor sets make each consumer wait for
# every member of that class. Release one class arc only on last member, preserving
# readiness and hence exact heap order for any fixed priority. No merged propositions.
# Raw control uses singleton classes in same implementation, not optimal bare Kahn.
# Metrics: order separation (sum of typed expression edge rank distances), weighted
# separation, peak live typed records; none constitutes human comprehension.
# Measured times include grouping, roundtrip check, priorities, and heap; exclude
# common validated input graph construction and post-schedule metrics. 3 warmups,
# 15 timed repetitions per separate worker, one worker per method/scope.
# First execution using getrusage ru_maxrss reported identical inherited parent
# high-water marks 189920/193248 KiB. Rejected as uninformative; reran Linux
# /proc/self/status VmHWM and VmRSS, includes worker input and metrics, not full
# extraction/parent. Absolute differences small, one process sample/method, no
# robust memory superiority claim. Python version change vs old V8 timings means
# no across-run speed comparison. No Lean available; no kernel/axiom replay.
# Executed final results (mode, rep: median ms, peak VmHWM KiB, pre-run VmHWM KiB):
# ALL: ordinary raw 10.307290,113816,111100; group 9.679791,112840,111108
# centrality raw 11.264869,113796,111104; group 10.492214,112912,111132
# URT raw 13.010725,113880,111112; group 11.606675,113204,111104
# Groups 7493 -> 2563; distinct updates 44046 -> 34495.
# Span ordinary 235231239,centrality 292038430,URT 307213099.
# Weighted 238402585,295456821,310734329; live peak 45538,46616,47127.
# MIXED: ordinary raw 7.641821,109280,108072; group 7.260986,108980,108064
# centrality raw 8.324722,109296,108076; group 7.450397,108996,108076
# URT raw 8.991240,109756,108064; group 8.029125,109308,108060
# Groups 5474 -> 2027; updates 32459 -> 25295; typed records 38612.
# Span 126331021,149468838,162386299; weighted 128034584,151210562,164215700;
# live peak 32466,33212,33098 respectively. URT worse on span and timing in
# this matched Python benchmark. No physical analogy or URT superiority claimed.
# Original source ZIPs untouched; full proof terms, premises and axiom dependencies
# not reconstructed by scheduling projection. No actual human reader study.
# RESUME HERE: compare bare Kahn heap (no singleton-class preparation) against
# grouped scheduler using same 7 artifacts, with randomized method-run order and
# repeated isolated VmHWM measures; then test dominance/reuse prioritization.
# HANDOFF TO dependency, integration, audit, acceleration. Full RH OPEN.
