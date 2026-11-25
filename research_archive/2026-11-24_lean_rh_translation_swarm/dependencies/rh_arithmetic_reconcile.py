import collections as C, hashlib, json, pathlib, resource, sys, time, zipfile
PIN='40e56bab026552e089d7afcfeff08d2defb9c005'; DIGEST='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e'; N=1065214335; ROOT=14065054
INPUTS=[(14937732176,'direct_roles',6,'2b775ec5100e19711b40fa9852607b876524a91283432cfeb12a99c22a2ec3f8'),(14952948474,'frontier_roles',47,'9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6'),(14962058506,'next_root_roles',18,'beef81685baec5816525e9fe23974ba1541acc10beec0648140a156f62f83831'),(14966122558,'literature_theta_frontier',71,'6d2752fde5949c14eb18d61b54d7c5d8a4593fc623efb61ba83853ce0e447964'),(14973774950,'34_producer_frontier',34,'3bed0b78f4f379e8721e3c9e855d335ddc04cba283f86744c11511e0e1bc0acd'),(14981552949,'post34_frontier',151,'2cd911a88341ad57d0e85090af4e4f58748046d9e49e2b2cb26945ea526230ff'),(14991121039,'post151_frontier',300,'80176159514e76b57d402bb716f09fed7a13c3855dfea2eda6ffc54763e110ce'),(14995746690,'arithmetic_frontier',106,'41950b86cf8aa7138a2849220d433b8afbccf961d24c120f973b9ba0cb488737')]
REQUEST_SHA='9b98ff91a61fdbf09266761e21f80460e8b85ec7f977d8504618208afffed28e'
PEER_IDS=[13173638,13056733,13056965,13173398,13056908,13173967]
NEXT=[(6674680,'GlobalTheory.TraceIso.exists_equiv_of_trace_eq',514997827,515004413),(1800736,'jacobson_density',101690570,101691894),(4403566,'ReciprocityTheory.MultiplicativeHeights.Closed.sphere_height_lower_bound',319020184,319021814),(4403544,'ReciprocityTheory.MultiplicativeHeights.heightLowerBound_of_sj_of_sphereLogIntegrable',319020186,319021811),(4398915,'ReciprocityTheory.MultiplicativeHeights.Closed.gauss_height_additivity',318602766,318603125),(11224217,'FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham',883657118,887455967),(11221518,'GlobalTheory.Published.AbelianDeRham.rigid_of_free_of_crystallineDeRham',887222824,887224726)]
SUPPLIERS={13175074,13140146,13172409,13129148}
checks=0
def ck(x,msg):
 global checks
 if not x: raise ValueError(msg)
 checks+=1

def load(folder,s):
 aid,tag,count,h=s
 with zipfile.ZipFile(folder/f'github-actions-artifact-{aid}.zip') as z:b=z.read(f'job/outputs/solution_{tag}.json')
 ck(hashlib.sha256(b).hexdigest()==h,'receipt'); d=json.loads(b)
 ck((d['digest'],d['bytes'],d['n'],d['root'],d['indexedDeclarations'])==(DIGEST,61570595788,N,ROOT,1484733),'archive')
 ck(len(d['reports'])==count and d.get('pin',d['reports'][0].get('source',{}).get('pin'))==PIN,'pin/count');return d

def build(docs):
 ids={}; names={}; owners={}; adj={}; edges=set(); census=C.Counter()
 def ident(i,p,k):
  p=tuple(p);v=(p,k);ck(type(i) is int and i>=0 and p and all(type(x) in (str,int) for x in p),'identity shape');ck(ids.get(i,v)==v and names.get(p,i)==i,'identity conflict');ids[i]=v;names[p]=i
 def add(e):
  ck(e not in edges,'duplicate edge');edges.add(e);adj[e[0]].append(e);census[e[2]]+=1
 for d in docs:
  for r in d['reports']:
   i=r['id'];q=r.get('request',r.get('source'));k=r['kind'];ck(i not in owners and q.get('id',i)==i and q.get('kind',k)==k and r['status']=='EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK','owner');ident(i,q['name'].split('.'),k);owners[i]=r;adj[i]=[]
   def role(z,label,slot=None):
    root=z['expressionRoot'];ck(type(root) is int and 0<=root<N,'root');seen=set();total=0
    for x in z['references']:
     j=x['target'];kind=x['kind'];w=x['witnessExpression'];n=x['distinctExpressionRecords'];key=(kind,j);ident(j,x['nameParts'],x['targetKind']);ck(key not in seen and kind in ('explicit_const','projection_carrier','literal_primitive'),'reference');seen.add(key);ck(type(w) is int and 0<=w<=root and type(n) is int and n>0,'witness');total+=n;add((i,j,label,kind,w,root,slot,n))
    ck(total==z['referenceOccurrences'],'occurrences')
   role(r['type'],'type')
   if r.get('value') is not None:role(r['value'],'value')
   for x in r.get('structural',[]):
    s=x['edgeIndex'];v=x['encoded'];ck(r['encodedRootsAndStructuralEdges'][s]==v,'slot')
    if v<0:
     j=x['target'];ck(v==-j-1,'package');ident(j,x['nameParts'],x['kind']);add((i,j,'package','package_member',None,None,s,v))
    else:
     ck(k=='rec' and x['kind']=='recursor_rule_rhs' and x['expression']['expressionRoot']+1==v,'rhs');role(x['expression'],'rhs',s)
 return ids,owners,adj,edges,census

def walk(adj,mode,roots=(ROOT,)):
 prev={i:None for i in roots};q=C.deque(roots)
 while q:
  for e in adj.get(q.popleft(),[]):
   if mode=='value' and e[2:4]!=('value','explicit_const'):continue
   if mode=='expression' and e[2]=='package':continue
   if e[1] not in prev:prev[e[1]]=e;q.append(e[1])
 return prev

def path(prev,i):
 if i not in prev:return None
 a=[]
 while prev[i] is not None:e=prev[i];a.append(e);i=e[0]
 return a[::-1]

def request_receipt(reports):
 rows=[]
 for r in reports:
  q=r['request'];roots=r['encodedRootsAndStructuralEdges'];ck(q['id']==r['id'] and q['kind']==r['kind'] and roots==[q['type'],q['value']],'request roots');ck(r['type']['expressionRoot']+1==roots[0] and r['value']['expressionRoot']+1==roots[1],'decoded roots');rows.append(f"{q['id']} {q['name']} {q['kind']} {roots[0]},{roots[1]} {q['mode']}\n")
 ck(hashlib.sha256(''.join(rows).encode()).hexdigest()==REQUEST_SHA,'request receipt')

def main(folder,out):
 t=time.perf_counter();docs=[load(folder,s) for s in INPUTS];load_s=time.perf_counter()-t;t=time.perf_counter();old=build(docs[:-1]);ids,owners,adj,edges,census=build(docs);request_receipt(docs[-1]['reports']);before=walk(old[2],'mixed');prev={m:walk(adj,m) for m in ('mixed','expression','value')};ck((len(old[1]),len(old[0]),len(old[3]),len(before))==(627,7493,53140,5474),'old census')
 new={r['id'] for r in docs[-1]['reports']};ck(len(new)==106 and not new&old[1].keys(),'disjoint');ck(new-before.keys()==set(PEER_IDS),'prior classifications')
 oldval=walk(old[2],'value');ck(all((r['id'] in oldval)==(r['request']['mode']=='value') for r in docs[-1]['reports']),'prior value labels')
 direct={e[1] for i in SUPPLIERS for e in old[2][i] if e[1] not in old[1] and old[0][e[1]][0][0] in ('UpperTheory','GlobalTheory','GalTw')};ck(len(direct)==14 and direct<=new,'direct 14');via={m:walk(adj,m,tuple(sorted(direct))) for m in prev}
 closure={ROOT}
 while True:
  nxt=closure|{e[1] for e in edges if e[0] in closure}
  if nxt==closure:break
  closure=nxt
 ck(closure==prev['mixed'].keys(),'closure oracle')
 def detail(i):return dict(id=i,nameParts=ids[i][0],kind=ids[i][1],expanded=i in owners,paths={m:path(v,i) for m,v in prev.items()},via14={m:path(v,i) for m,v in via.items()})
 peers=[detail(i) for i in PEER_IDS];special=[]
 for i,n,a,b in NEXT:
  if i in ids:ck('.'.join(map(str,ids[i][0]))==n,'special identity')
  special.append(dict(id=i,name=n,rawRefs=[a,b],observed=detail(i) if i in ids else None,provenance='acceleration RUN24 manifest receipt, not independently rescanned here'))
 negative=0
 def reject(fn):
  nonlocal negative
  try:fn()
  except ValueError:negative+=1;return
  raise RuntimeError('negative accepted')
 r=docs[-1]['reports'][0];x=r['value']['references'][0]
 for obj,key,bad,fn in [(x,'witnessExpression',N,lambda:build(docs[-1:])),(x,'kind','source_match',lambda:build(docs[-1:])),(r['request'],'value',r['request']['value']+1,lambda:request_receipt(docs[-1]['reports'])),(r['request'],'mode','manifest_only',lambda:request_receipt(docs[-1]['reports']))]:
  save=obj[key];obj[key]=bad;reject(fn);obj[key]=save
 reject(lambda:build([docs[-1],docs[-1]]))
 frontier=prev['mixed'].keys()-owners.keys();stats=dict(owners=len(owners),identities=len(ids),edges=len(edges),roles=dict(census),reach={m:dict(observed=len(v),expanded=len(v.keys()&owners.keys())) for m,v in prev.items()},frontier=len(frontier),namespaceFrontier=dict(C.Counter(str(ids[i][0][0]) for i in frontier).most_common(15)),latest=docs[-1]['summary'],latestProjectionMs=docs[-1]['projectionMs'],latestMaxRssKiB=docs[-1]['maxRssKiB'],peers=[dict(id=x['id'],name='.'.join(x['nameParts']),paths={m:None if p is None else len(p) for m,p in x['paths'].items()},via14={m:None if p is None else len(p) for m,p in x['via14'].items()}) for x in peers],special=[dict(id=x['id'],name=x['name'],paths=None if x['observed'] is None else {m:None if p is None else len(p) for m,p in x['observed']['paths'].items()}) for x in special],checks=checks,negative=negative,loadSeconds=load_s,analysisSeconds=time.perf_counter()-t,peakRssKiB=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)
 out.write_text(json.dumps(dict(pin=PIN,archiveDigest=DIGEST,stats=stats,peers=peers,special=special),separators=(',',':'))+'\n');print(json.dumps(stats,indent=2))
if __name__=='__main__':main(pathlib.Path(sys.argv[1]),pathlib.Path(sys.argv[2]))

# RESULT: PARTIAL, 2026-11-25. Base observed bf2888a7ba6ab6c0b70a7181feb8c1200b4d617d.
# Prior dependency bd222c6780470673af6e0b65202471f6c5661a50. Source Main blob
# dbd5db70bc11b35f18fa5751216ab335321e7bfc (rhOfAll) at PIN. Upstream head
# a18a350c3e5aad997766cff2670b292313e46574 Main eb95ca808793dd61984cc853ab5630f54a74490c
# uses Claim.zeta; do not mix. SWARM/HANDOFF, AGENTS, state, runner log/protocol,
# continuity, latest CI #422 PASS general only, peer commit list and latest
# integration/structure/math/audit/acceleration checkpoints consulted.
# Blueprint not reopened; some specialist files not read.
# Compute run 45551828370 PASS wall 1812.37 s; output Contents endpoint returned
# 404, recovered authentic artifact 14995746690. All 106 ordered request rows
# including raw signed roots reproduced against prior trusted SHA256.
# Local CPython replay on eight actual ZIPs: 647034 successful checks, 5 rejected
# mutations. 733 owners, 8291 identities, 63638 distinct typed edges; 13920 type,
# 49492 value, 100 package, 126 RHS. Mixed reach 6328 (684 expanded), expression
# reach 6310 (681 expanded), explicit value reach 6063 (677 expanded).
# 5644 mixed frontier. Read/authenticate 0.166 s; analysis incl two builds,
# three BFS modes, independent fixed-point oracle and controls 0.629 s;
# local whole-process peak RSS 182044 KiB. No raw archive scan locally.
# Hash-map build/BFS expected O(input+V+E); fixed-point oracle and repeated
# path output not covered by that bound. No URT-specific speedup.
# All six previously manifest-only theorem IDs now explicit-value-root linked:
# ex_all_of_good -> CMBasePatch.main -> SatSysPatch.patch -> IndexTwoPatch.main
# -> T.exists_extension_rep_index_two_of_trace_invariant -> IndexTwoExt.main.
# Main-root distances 11,12,13,14,15,16; via the 14 direct suppliers 1..6.
# The prefix ends at UpperTheory.Gal.Int.Inp.coreAll_of_core_inp (13175057).
# Full witness tuples (owner,target,role,kind,witness,root,slot,count) emitted
# in output JSON. Names and IDs distinct even when type roots are shared.
# Seven new specialist requests in NEXT from acceleration RUN24 have no
# observed path or owner in this merged graph. Preserve as peer-manifest-only.
# Reproduce: python rh_arithmetic_reconcile.py ZIP_DIRECTORY output.json
# (download eight named artifacts by IDs in INPUTS).
# RESUME HERE: coordinate one shared cached extraction for seven NEXT requests,
# then select exact direct unexpanded suppliers of the newly connected six
# patching theorems; establish observed incoming paths before upgrading labels.
# HANDOFF TO integration, Galois, kernel, acceleration, audit, all specialists.
# No independent Lean kernel replay, complete proof, or axiom closure claimed.
