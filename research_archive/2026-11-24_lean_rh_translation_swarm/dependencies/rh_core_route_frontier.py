import collections as C, hashlib, json, pathlib, resource, subprocess, sys, time, zipfile
P='40e56bab026552e089d7afcfeff08d2defb9c005'; D='5ea74b912147c5c93cc2b6d70cc727cf908df2f62ac6a20480a3fa02f6be244e'; M='45d4b2d1c1456b92474163c6a6f8db69db35ec9d50feb531283f16a0eb9fe7cf'; ROOT=14065054
A=[(14937732176,'direct_roles',6,'2b775ec5100e19711b40fa9852607b876524a91283432cfeb12a99c22a2ec3f8'),(14952948474,'frontier_roles',47,'9d9f461a5afebec9f020e2349a8bc359fcfdcbd7fe3e667b92c6b64a95660ad6'),(14962058506,'next_root_roles',18,'beef81685baec5816525e9fe23974ba1541acc10beec0648140a156f62f83831'),(14966122558,'literature_theta_frontier',71,'6d2752fde5949c14eb18d61b54d7c5d8a4593fc623efb61ba83853ce0e447964'),(14973774950,'34_producer_frontier',34,'3bed0b78f4f379e8721e3c9e855d335ddc04cba283f86744c11511e0e1bc0acd'),(14981552949,'post34_frontier',151,'2cd911a88341ad57d0e85090af4e4f58748046d9e49e2b2cb26945ea526230ff'),(14991121039,'post151_frontier',300,'80176159514e76b57d402bb716f09fed7a13c3855dfea2eda6ffc54763e110ce'),(14995746690,'arithmetic_frontier',106,'41950b86cf8aa7138a2849220d433b8afbccf961d24c120f973b9ba0cb488737')]
ROUTE='riemannHypothesis rhOfAll allChi UpperTheory.FinalTheorems.everyCharacter UpperTheory.FinalTheorems.everyCharacter_of_row UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin UpperTheory.Lit.every_character_of_theta_integrals_local_matching UpperTheory.Top.every_character_of_green_v_win UpperTheory.Top.zero_free_all_of_green_v_win UpperTheory.Top.zeroFreeAll_of_topG UpperTheory.Comparison₂.formB Deduction.zeroFree_of_rpow_window'.split()
EXTRA='UpperTheory.Top.shape_closed_link_n_of_green GlobalTheory.Fc.goal_of_shape_of_hyps GlobalTheory.Fc.forall_goal_of_shape_of_hyps UpperTheory.One.vwin_of_row UpperTheory.V.v_window_of_literal_automorphy_n count_i_of_printed_bound_k_kato_automorphy corGK countI propGK_of_numberU3U_of_oneCharU numberU3U_of_prints oneCharU_of_katoTwoW_rig_admI_automorphy level_gm_le_on_family_scales'.split()
PEER='GlobalTheory.TraceIso.exists_equiv_of_trace_eq jacobson_density ReciprocityTheory.MultiplicativeHeights.Closed.sphere_height_lower_bound ReciprocityTheory.MultiplicativeHeights.heightLowerBound_of_sj_of_sphereLogIntegrable ReciprocityTheory.MultiplicativeHeights.Closed.gauss_height_additivity FubiniStudyChowHeightFormula₂.Adr.crystallineDeRham GlobalTheory.Published.AbelianDeRham.rigid_of_free_of_crystallineDeRham'.split()
PATCH=[13173638,13056733,13056965,13173398,13056908,13173967]
def ck(x):
 if not x: raise ValueError('certificate mismatch')
def main(folder,out):
 t=time.perf_counter(); ids={}; owners=set(); adj=C.defaultdict(list); all_edges=set(); names={}
 def ident(i,n,k):
  n=tuple(n);ck(ids.get(i,(n,k))==(n,k) and names.get(n,i)==i);ids[i]=(n,k);names[n]=i
 def add(e):ck(e not in all_edges);all_edges.add(e);adj[e[0]].append(e)
 for aid,tag,n,h in A:
  with zipfile.ZipFile(folder/f'github-actions-artifact-{aid}.zip') as z:b=z.read(f'job/outputs/solution_{tag}.json')
  ck(hashlib.sha256(b).hexdigest()==h);d=json.loads(b);ck((d['digest'],d['root'],d['n'],len(d['reports']))==(D,ROOT,1065214335,n));ck(d.get('pin',d['reports'][0].get('source',{}).get('pin'))==P)
  for r in d['reports']:
   i=r['id'];q=r.get('request',r.get('source'));ck(i not in owners and r['status']=='EXPORTED_DIRECT_ROLE_REFERENCES_NOT_KERNEL_RECHECK');owners.add(i);ident(i,q['name'].split('.'),r['kind'])
   def role(z,label,slot=None):
    root=z['expressionRoot'];ck(0<=root<1065214335);seen=set()
    for x in z['references']:
     j=x['target'];k=x['kind'];w=x['witnessExpression'];c=x['distinctExpressionRecords'];ident(j,x['nameParts'],x['targetKind']);ck(k in ('explicit_const','projection_carrier','literal_primitive') and 0<=w<=root and c>0 and (j,k) not in seen);seen.add((j,k));add((i,j,label,k,w,root,slot,c))
   role(r['type'],'type')
   if r.get('value') is not None:role(r['value'],'value')
   for x in r.get('structural',[]):
    slot=x['edgeIndex'];v=x['encoded'];ck(r['encodedRootsAndStructuralEdges'][slot]==v)
    if v<0:
     j=x['target'];ck(v==-j-1);ident(j,x['nameParts'],x['kind']);add((i,j,'package','package_member',None,None,slot,v))
    else:ck(r['kind']=='rec' and x['expression']['expressionRoot']+1==v);role(x['expression'],'rhs',slot)
 ck((len(owners),len(ids),len(all_edges))==(733,8291,63638))
 def walk(mode):
  prev={ROOT:None};queue=C.deque([ROOT])
  while queue:
   for e in adj[queue.popleft()]:
    if mode=='value' and e[2:4]!=('value','explicit_const'):continue
    if e[1] not in prev:prev[e[1]]=e;queue.append(e[1])
  return prev
 prev=walk('value');mixed=walk('mixed');ck((len(prev),len(mixed))==(6063,6328))
 def path(i):
  if i not in prev:return None
  p=[]
  while prev[i] is not None:e=prev[i];p.append(e);i=e[0]
  return p[::-1]
 def show(i):return '.'.join(map(str,ids[i][0]))
 patch={e[1] for i in PATCH for e in adj[i] if e[2:4]==('value','explicit_const') and e[1] not in owners and ids[e[1]][1]=='thm' and ids[e[1]][0][0] in ('GlobalTheory','UpperTheory','GalTw')}
 graph_s=time.perf_counter()-t;t=time.perf_counter();wanted=set(ROUTE+EXTRA+PEER);found=C.defaultdict(list);rows=0
 with zipfile.ZipFile(folder/'github-actions-artifact-14931267327.zip') as z:b=z.read('job/outputs/reachable_declarations.jsonl.zst')
 ck(hashlib.sha256(b).hexdigest()==M);temp=out.with_suffix('.zst');temp.write_bytes(b);del b
 proc=subprocess.Popen(['zstd','-dc',str(temp)],stdout=subprocess.PIPE)
 for line in proc.stdout:
  r=json.loads(line);rows+=1;n='.'.join(map(str,r['nameParts']));i=r['id'];keys={k for k in (n,n.rsplit('.',1)[-1]) if k in wanted}
  if i in patch:keys.add('patch')
  if not keys:continue
  if i in ids:ck(ids[i]==(tuple(r['nameParts']),r['kind']))
  x=dict(id=i,nameParts=r['nameParts'],kind=r['kind'],refs=r['refs'],row=rows,rowSHA256=hashlib.sha256(line).hexdigest(),expanded=i in owners,valuePath=path(i),mixedReach=i in mixed)
  for k in keys:found[k].append(x)
 ck(proc.wait()==0 and rows==1484705);temp.unlink();ck({x['id'] for x in found['patch']}==patch)
 direct=[]
 for a,b in zip(ROUTE,ROUTE[1:]):
  aa=found[a];bb=found[b];ck(len(aa)==len(bb)==1);i,j=aa[0]['id'],bb[0]['id'];es=[e for e in adj[i] if e[1]==j and e[2:4]==('value','explicit_const')];direct.append(dict(source=a,target=b,ownerExpanded=i in owners,witnesses=es,status='EXPORTED_VALUE_CONST' if es else 'NOT_OBSERVED' if i in owners else 'OWNER_UNEXPANDED'))
 # Explicitly test that type-only evidence and metadata cannot satisfy value-only selection.
 ck(all(e[2:4]==('value','explicit_const') for p in prev.values() if p is not None for e in [p]));ck(not any(e[2:4]==('value','explicit_const') for e in all_edges if e[2]=='package'));ck(len(found['jacobson_density'])==1 and found['jacobson_density'][0]['id']==1800736)
 stats=dict(owners=len(owners),identities=len(ids),edges=len(all_edges),manifestRows=rows,graphSeconds=graph_s,manifestSeconds=time.perf_counter()-t,peakRSSKiB=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,patchTheorems=len(patch),directVerified=sum(bool(x['witnesses']) for x in direct));out.write_text(json.dumps(dict(pin=P,archive=D,manifest=M,stats=stats,direct=direct,requests=found),ensure_ascii=False,indent=2)+'\n');print(json.dumps(stats));print(json.dumps(direct,ensure_ascii=False));print('REQUESTS',[(k,[(x['id'],'.'.join(map(str,x['nameParts'])),x['refs'],x['expanded'],x['valuePath'] is not None) for x in v]) for k,v in found.items() if k!='patch']);print('PATCH',[(x['id'],'.'.join(map(str,x['nameParts']))) for x in found['patch']])
if __name__=='__main__':main(pathlib.Path(sys.argv[1]),pathlib.Path(sys.argv[2]))

# RESULT PARTIAL — 2026-11-25, dependencies lane. Starting branch observed
# 7c4c328c6ca800107a95fa9d2c314eb0bea7996e, previous dependency f6b396aa7e3d1df7106aeb6b4ada8bd076e2d9d3.
# Read SWARM then AGENTS, handoff, expansion, state/log/protocol/continuity,
# general CI #425 PASS at 06:53 UTC (not RH kernel), latest integration 0700,
# structure 0624, audit 0648, math CountIV, kernel RUN24, Landau RUN24 and
# acceleration RUN24. External blueprint not reopened; no premises taken from it.
# Confirmed pinned Main blob dbd5db70bc11b35f18fa5751216ab335321e7bfc (rhOfAll).
# Current upstream head a18a350c3e5aad997766cff2670b292313e46574, not mixed.
# Actual local CPython/zstd replay: eight role JSON receipts and one manifest.
# 733 owners, 8291 identities, 63638 typed rows, mixed reach 6328, explicit value reach 6063.
# 1,484,705 manifest rows; graph 0.396 s, manifest 8.234 s, peak process RSS
# 259924 KiB; no scan of raw 61.57 GB export. Hash map/BFS expected O(B+V+E)
# excluding repeated path materialization; manifest reads all records once,
# compressed member buffered for hashing. No speed claim over prior methods.
# Nine of eleven direct core route edges verified by exact value/const witnesses.
# Last authenticated edge 1550745 -> 869378, witness 80597582, root 80597606.
# First missing OWNER: UpperTheory.Top.zeroFreeAll_of_topG (869378),
# raw refs [27189941,27190503]; next Comparison₂.formB (869367)
# [27188992,27189348]; next Deduction.zeroFree_of_rpow_window (869366)
# [27188967,27188990]. Last two not observed root-linked in prior role graph.
# Pinned route uses forall_goal_of_shape_of_hyps (869789) directly in value
# of 1550745, not goal_of_shape_of_hyps (869658) as a presumed direct edge.
# shape_closed_link_n_of_green (1413196) also explicitly value-linked.
# CountI suppliers exact manifest IDs, not yet observed value paths:
# 12812061 UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy
# 12739763 UpperTheory.V.U3.corGK, 12739267 UpperTheory.V.U3.countI
# 12740255 UpperTheory.V.Z.J.propGK_of_numberU3U_of_oneCharU
# 12743328 UpperTheory.GalN.V.Win.N.numberU3U_of_prints
# 12806368 UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy
# Peer source: LinkedUnlE.lean (01ff1f8cd56f56488e044a35443a8eda3d5d0e3e)
# lines 49–54, integration 0700 checkpoint; not silently equated to legacy CorG.
# 42 immediate unexpanded theorem suppliers of six patching declarations
# also recovered (including TraceConj.conj_of_trace_eq 6873242).
# Overall 62 unique unexpanded requests, 45 observed explicit value paths,
# 17 manifest-only. Seven earlier acceleration requests included, not duplicated.
# Exact paths, signed refs, typed names, raw row hashes and row indices emitted
# by script. Output also includes already expanded owners for provenance.
# Reproduce: python rh_core_route_frontier.py ZIP_DIRECTORY out.json
# Download nine artifacts by IDs in A and 14931267327. Output SHA256 may vary
# due to timing and set iteration. No mutation tests or independent kernel
# replay executed this run; checks enforce identity, role, roots and receipts.
# RESUME HERE: acceleration/kernel/dependencies coordinate one shared
# cached role projection for these 62 targets, prioritizing 869378, 869367,
# 869366, 1413196 and 869789; verify actual direct edges and CountI supplier
# paths before upgrading manifest labels. No new full raw scan scheduled here.
# HANDOFF TO integration, Landau, prime, Galois, kernel, acceleration, editor.
# Full RH human proof and axiom closure OPEN. No URT-specific speedup.
