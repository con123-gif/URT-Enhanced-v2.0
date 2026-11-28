#!/usr/bin/env python3
"""Audit exact saved B2/B3 kernel graph compatibility, not Lean replay.
Usage: python rh_cross_frontier_audit.py B2_graph_dir B3_outputs_dir
Input directories are extracted GitHub Actions artifacts 15215757161 and 15242593348.
"""
import sys,json,hashlib
from pathlib import Path
from collections import Counter
from array import array

EXPECTED=[('local_b2_graph.jsonl','912867f64de833937b485856c47be15f261b23e542b004ba6ecebb025edb44b6',94382,2857836,8),('four_roots.jsonl','6bed97c0d0ab3a08963f9f3f875015973cc704a82ec5901e1acd0de178f24912',73765,2088097,4)]
ROLES=('constructors','group','mutual_block','quotient_package','type_constants','type_literals','type_projections','value_constants','value_literals','value_projections')
RULE_ROLES=('constants','literals','projections')
def name(x): return tuple(tuple(i) for i in x)
def display(x): return '.'.join(str(i[1]) for i in x)
def check(x,msg):
 if not x: raise ValueError(msg)
def digest_file(p):
 with p.open('rb') as f: return hashlib.file_digest(f,'sha256').hexdigest()

def main(paths):
 names={}; keys=[]; adj=[]; records=[]; flags=[]; declared=[]; owner=[]; modules=[]; provenance_deltas=[]; overlap=0; mismatches=[]; roots=[]; local_masks=[]; totals=[]
 def intern(n):
  k=name(n)
  if k not in names:
   names[k]=len(keys);keys.append(k);adj.append(None);records.append(None);flags.append(None);declared.append(0);owner.append(None);modules.append(None)
  return names[k]
 for j,(directory,(file,sha,nn,ee,nr)) in enumerate(zip(paths,EXPECTED)):
  p=directory/file
  check(digest_file(p)==sha,'graph hash mismatch '+file)
  source_nodes=0; edge_count=0; root_ids=None; foot=None
  with p.open() as f:
   for line in f:
    x=json.loads(line); t=x['record']
    if t=='header':
     check(root_ids is None,'duplicate header');root_ids=[intern(z) for z in x['roots']];check(len(root_ids)==nr,'root count')
     check(x['schema']=='compact-kernel-union-v1','unexpected graph schema');roots.extend(root_ids)
    elif t=='node':
     i=intern(x['id']); check(not declared[i]&(1<<j),'duplicate declaration in same graph');declared[i]|=1<<j;source_nodes+=1
     sets={r:sorted(set(intern(z) for z in x[r])) for r in ROLES}
     # Preserve role separation in the fingerprint. Recursor rule order is retained.
     parent=tuple(sorted(set(intern(z) for z in x['parent'])))
     rules=[(intern(rule['constructor']),tuple((r,tuple(sorted(set(intern(z) for z in rule[r])))) for r in RULE_ROLES),rule['nat_literal'],rule['str_literal']) for rule in x['rules']]
     refs=set(z for xs in sets.values() for z in xs)
     refs.update(parent)
     for c,rs,_,_ in rules:
      refs.add(c)
      for _,zs in rs: refs.update(zs)
     # Graph uses a unique target per node, including self edges if present.
     edge_count+=len(refs)
     metadata=tuple((k,x[k]) for k in ('kind','has_value','partial','unsafe','type_nat_literal','type_str_literal','value_nat_literal','value_str_literal'))
     sig=hashlib.sha256(repr((metadata,sets,parent,rules)).encode()).digest()
     if records[i] is None:
      records[i]=sig;adj[i]=array('I',sorted(refs));flags[i]=(x['kind'],x['unsafe'],x['partial']);owner[i]=j;modules[i]=x['module']
     else:
      overlap+=1
      if modules[i]!=x['module']:
       provenance_deltas.append({'declaration':display(keys[i]),'b2_module':display(name(modules[i])),'b3_module':display(name(x['module']))})
      if records[i]!=sig:
       mismatches.append(display(keys[i]))
    elif t=='footer': check(foot is None,'duplicate footer');foot=x
    else: raise ValueError('unexpected record '+t)
  check(source_nodes==nn and foot and foot['nodes']==nn and foot['missing']==0,'node or footer mismatch')
  check(not mismatches,'shared role mismatch '+repr(mismatches[:10]))
  # Stored membership is independently produced by the existing audit. Recompute
  # from the combined role graph below rather than trusting its masks.
  memberships={}
  with (directory/'root_membership.jsonl').open() as f:
   for line in f:
    x=json.loads(line);i=names[name(x['id'])];check(i not in memberships,'duplicate membership');memberships[i]=x['root_mask']
  check(len(memberships)==nn,'membership count')
  local_masks.append(memberships);totals.append({'nodes':source_nodes,'edges_computed':edge_count,'edges_receipt':ee})
  check(edge_count==ee,'role union edge count differs from receipt')
  print('loaded',file,source_nodes,edge_count,file=sys.stderr,flush=True)
 check(all(x is not None for x in adj),'unresolved node in merged graph')
 # Reachability on shared graph, each root compared to saved membership.
 masks=array('H',[0])*len(keys)
 per_root=[]
 for bit,r in enumerate(roots):
  flag=1<<bit;todo=[r];masks[r]|=flag; count=0;axioms=[]
  while todo:
   v=todo.pop();count+=1
   kind,unsafe,partial=flags[v];check(not unsafe and not partial,'unsafe/partial reached')
   if kind=='axiom': axioms.append(display(keys[v]))
   for w in adj[v]:
    if not masks[w]&flag: masks[w]|=flag;todo.append(w)
  check(set(axioms)=={'propext','Classical.choice','Quot.sound'},'axiom disagreement '+repr(axioms))
  per_root.append({'root':display(keys[r]),'nodes':count,'axioms':sorted(axioms)})
 for j,old in enumerate(local_masks):
  shift=0 if j==0 else 8; mask=(1<<(8 if j==0 else 4))-1
  for i,v in enumerate(masks):
   check(((v>>shift)&mask)==old.get(i,0),'root membership disagreement '+display(keys[i]))
 def at(n):
  k=tuple(('s',x) for x in n.split('.')); i=names.get(k)
  return 0 if i is None else masks[i]
 watch=['IsCutBessel.formConst_mul_lintegral_le','IsCutBessel.formConst_mul_lintegral_le_via_directChart','IntegralPlace.IsStdLevel.lintegral_shells_le','IntegralPlace.IsStdLevel.lintegral_shells_le_via_directChart','Gauge.lintegral_floorWeight_le','Gauge.lintegral_selfNorm_le','Gauge.lintegral_positions_le','Gauge.com','Gauge.parseval_heisenbergMeasure_of_box','Filling.energy_le_of_linkEnergy_le','Filling.b2_fused_energy_le_of_linkEnergy_le']
 pairs=[]
 for k in range(0,len(roots),2):
  a,b=1<<k,1<<(k+1);shared=sum(bool(v&a and v&b) for v in masks); old=sum(bool(v&a and not v&b) for v in masks);new=sum(bool(v&b and not v&a) for v in masks)
  pairs.append({'old':display(keys[roots[k]]),'new':display(keys[roots[k+1]]),'shared':shared,'old_only':old,'new_only':new,'net':new-old})
 # The local B2 supplier is exactly the selected full-link replacement. If
 # shell dependencies occurred in that accepted closure, a finite-only patch
 # would need to account for the path there too. Zero is only local evidence.
 b2flag=1<<5
 check(not any(at(n)&b2flag for n in watch[:7]),'shell dependency present in selected B2 full-link root')
 check(at(watch[0])&((1<<10)|(1<<11))==0,'real shell is present in finite shell closure')
 result={'scope':'saved local kernel graph compatibility and reachability, not proof-term identity or full RH replay','artifacts':[15215757161,15242593348],'inputs':totals,'shared_declarations':overlap,'shared_role_fingerprints_equal':overlap,'role_mismatches':mismatches,'module_provenance_deltas':provenance_deltas,'merge_scope':'reference graph only; do not equate module origins or proof terms','union_nodes':len(keys),'union_edges':sum(map(len,adj)),'root_mask_histogram':dict(sorted(Counter(masks).items())),'root_memberships_recomputed_and_equal':True,'roots':per_root,'pair_deltas':pairs,'watch_masks':{n:at(n) for n in watch},'full_RH_replay':False}
 print(json.dumps(result,indent=2))
if __name__=='__main__':
 if len(sys.argv)!=3: raise SystemExit(__doc__)
 main([Path(p) for p in sys.argv[1:]])

# INTEGRATION CHECKPOINT 2026-11-28: actual cross-frontier graph audit.
# Mission 3adc76221a978016e3505cdf3e36ad688354d7d7; spine 1c4608f2190154fd4bc4b38fc77db10ec5e60e64;
# obligations 579ecc1cafdb28eae7d1c97565700c571dfa7484. Prior integration 77afc7926f81d488ba5347977c7211a0bf5c571b.
# Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src.
# Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
# B2 run 46031745113 artifact 15215757161; state receipt blob 5e9302267e23080e877795aab89c5bdec47d481d.
# B3 run 46092592569 artifact 15242593348; receipt blob ced03da74831bbc7ae37622698002e8dcedb03cd.
# Downloaded both actual ZIPs, rehashed graph bytes and compiled objects locally:
# B2 active_b2_fused.olean 52614067b3c0e78be3e74eccf8b782619af4e6439b3a367cb2c3a0984b758e80
# B3 RHRun85.olean 902f57571e47bc7c2a78e1de44514f4d7a59122238ca6728472fdf62803f10c3
# B3 RHRun90Shells.olean ff60aeb9ba8de9a11f291e8f0384182c2b56330ed52e901ede6e8c4035bcfa7b
# Executed: python /mnt/data/rh_cross_frontier_audit.py /mnt/data/b2audit/job/outputs/graph /mnt/data/b3audit/job/outputs
# Actual stdout summary: 71,375 common declarations; 71,375 matching role fingerprints; 0 role mismatches.
# Deduplicated union 96,772 nodes and 3,016,601 edges, zero unresolved.
# All 12 recomputed root memberships match saved masks node by node, all 12 standard axiom sets.
# Paired counts (shared, old-only, new-only, net): pair weight (81854,37,44,7);
# level energy (94079,58,66,8); full link (94212,81,89,8); weighted count (78124,17,22,5);
# real shell (73005,9,14,5); finite shell (44945,9,14,5).
# These are not proof-term identities or a global reduction/complexity benchmark.
# First attempt failed TypeError on parent array; corrected to typed identifiers.
# Second attempt included module origins in fingerprints and exposed five provenance differences.
# Independent raw-field comparison: only module differs for the following five generated simp declarations:
# sum_mem._simp_2 and funext_iff._simp_3: Lib.Adelic.Reduction.FirstMinimum / New.Filling.StandardLevel.
# Fin.forall_fin_succ'._simp_3: New.Filling.Setup / Lib.DiscreteSeries.Bessel.RealMeasures.
# ne_of_gt._simp_1: New.RealPlace.VolumeKernel / New.RealPlace.Size.
# ite_mem._simp_1: New.Filling.LatticeChart / New.RealPlace.Size.
# Both origins must be preserved. Graph-role coalescing does not justify binary .olean interchange.
# Negative control: altered first line of graph artifact; exit 1, hash mismatch, as required.
# Watch masks B2 bits 0..7, B3 bits 8..11: old/new real shell 256/512;
# old/new finite shell 1024/2048; old floor/self/position each 1280; Gauge.com and Parseval 3840;
# old/new full link 16/32. No shell dependency in selected B2 full-link closure.
# Neither audited finite-shell closure contains the original real shell; no inference about complete star.
# Source anchors (compact src): New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444
# lines 51,143,317; New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7
# lines 253,263,285; New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111 lines 340,374,398.
# New/RealPlace/ComplexShells.lean 351cfdf7fa54238f79b1b950c3532feef1f74f53 lines 108,133:
# two direct real-shell consumers, actual root membership still requires common-star graph.
# Read C2 family accepted graph receipt 413058eacfda8683f5fb28c68148fd45d1bf1770;
# C1 budget split rejected, separate from accepted C2; retained C1 cache artifact 15234434421.
# Prime endpoint run 46092027436 receipt 0b2bcdbd7e7988f607b8d4dbbc1c0a27ef2fb58b:
# analytic adapter and principal bridge accepted, original-definition junction and arithmetic/PNT tail not checked.
# No new Lean compiler execution; lean/lake/elan unavailable locally. No claimed RH theorem imported.
# Governing inequality mR <= fa(log b)^5 remains an open human reconstruction obligation.
# Existing original/reduced graphs, premises, failed routes and axiom evidence retained in their artifacts.
# RESUME HERE: replay existing integration/2026-11-28_MINIMAL_SIGNED_COMMON_STAR.lean in one
# authenticated compatible compact workspace with its five stated module prerequisites, requiring
# all 17 transport markers, then export original control and integration_minimal_signed_star.
# Specifically audit actual real-shell and finite-shell callers, both energy/trace paths and signed C
# at that root; preserve context/module origins and compare role-sensitive graph inventories.
# Do not rebuild accepted local components when compatible, or promote this saved-graph audit to native replay.
