# RUN13 — Original suppliers of GrpAt and uniform LevOf
2026-11-24. SOURCE-MATCHED; DONE for the conditional prerequisite construction, OPEN for native antecedents and authenticated Main reachability. No Lean kernel execution or URT speed claim.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, continuity and research-state/log/protocol excerpts, current CI summary #390 (not an RH check), RUN12 and recent peer handoffs (Galois, theta, Landau, prime, speed, math, integration, geometry, literature; other recent commit metadata checked, not every peer document). RUN12 proved the finite-group identification from GrpAt and LevOf. This note supplies actual upstream constructors of those premises, not a repeat of the identification. The direct caller of the outer wrapper remains unlocated: current GitHub code search for the wrapper and statement import returned zero results; this is not evidence of absence at P. Pinned IwasawaDecomposition directory tree 7501f7939fae16a6d24ad8f55ec8c9857c483a4d has 7769 entries, not truncated, and supplied ExistsLevOfAll. No physics queue/gate change. External blueprint not reread.

## Source and exact quantifiers
P = 40e56bab026552e089d7afcfeff08d2defb9c005, repo leanprover-community/riemann-hypothesis.
1. GlobalTheory.Mem.R3.Model.grpAt_iff (MemLevelOfLocalDepth.lean:130–159): for every X : Stages, px : PreX X.B.toPre, I : ColIn X.B px, with I.Ok, GrpAt X I iff for EVERY k : Fin 2 and v : X.toD7.nd.PlG k, I.C.P.Div k (X.toD7.naut.plGw k v).
2. grpAt_of_grpTrue (161): additionally Top.GrpTrue X.N I.C implies GrpAt X I. It uses hN.pl, not an independent assumption that GrpAt exists.
3. GlobalTheory.MtIn.LevAll.exists_levOf_all (ExistsLevOfAll.lean:17–53): for every X,px,I, given I.Ok and SelHalf I, for every initial subset U₀ and L₀ : LevCh X.toD7 (TupU I U₀) satisfying LevOf X I U₀ L₀, for EVERY subset U of I.ι there EXISTS L : LevCh X.toD7 (TupU I U) satisfying LevOf X I U L. The initial witness is fixed before U is supplied. Not a universal claim without SelHalf. In particular L may depend on U, and L itself is not asserted independent of U.
4. LevOf is a six-field proposition (IsAbsIrrCharCompIff.lean:206–218): L.Is at reference mu0F, exact C, exact xiH indexed by ixOf I U, exact Pg, exact Q indexed by ixOf I U, and beta=(all βV=1 and βX=1). GrpAt (248–255) requires place bijection with division condition, idempotence and centrality of the same e0. Preserve every dependent type and instance.

## Proof A: supply GrpAt without choosing an arbitrary place bijection
Let A_k=nd.PlG k and B_k=(X.B.primes px).vG k; B=B_0∪B_1. mem_vGs_iff follows directly from Finset.mem_union, h.pibar for both k, and Fin.exists_fin_two. The reverse implication assumes H(k,v): Div k (plGw k v). Define φ(k,v)=plGw(k,v) as a point of B, whose membership follows from H. By h.pibar it lies in B_k. If φ(k,v)=φ(k',v'), apply absolute norm. hPr.vG_norm identifies the two norms with g(k),g(k'). hPr.g_ne forces k=k' (Fin 2 case analysis); then native plGw_inj gives v=v'. For surjectivity, for any P∈B use mem_vGs_iff to choose k with Div k P. The restricted map A_k→B_k is injective; card_PlG, vG_card, card_Tau show equal finite cardinalities. Hence it is surjective and P has a preimage. Equiv.ofBijective gives the required bijection and retains the original place identity and division proof. Forward implication simply substitutes the place identity in GrpAt.pl. This constructs the *same* plg required by RUN12, with no extra premises. hPr comes from base_fields_primes_ok; its proof delegates to BasePrimes.primes_ok.

The other two fields are not supplied by the bijection. The original theorem GoodLatCompare.goodSeriesIdempotent_central_idempotent (IsCentralIdempotentOfGoodSeriesIdempotent.lean:342–367) uses good_sum with the indexed local eSer family, eSer_idem, eSer_central, eSer_orth, and injectivity of the monic polynomial coefficient encoding. In ordinary algebra: for a finite product of groups, let E_a be the tensor of local central pairwise orthogonal idempotents selected by tuple a. Then E_a E_b=0 for distinct tuples and E_a²=E_a. The coefficient expansion in lines 354–361 identifies e0 with the sum over goodTuple a of E_a. Each term is central; multiplying the sum by itself retains exactly its diagonal terms, proving e0²=e0. The Lean proof obtains centrality hc and the selected-term identity hm from good_sum, then uses Finset.mul_sum and hm on selected terms, zero on others. The local idempotent and orthogonality suppliers and the good_sum implementation are retained as dependencies, not claimed proved here. Finally grpAt_of_grpTrue obtains H from hN.pl.

## Proof B: from one admissible level to every selected subset
SelHalf I (IsAbsIrrCharCompIff:84–86) says: for every a,b and P∈I.Q a, P'∈I.Q b, if both lie over the same rational prime p, their ideals have identical contraction to O_K. It is an implication, not existence of a ramified place. The helper exists_under_of_selHalf (MemLevelOfLocalDepth:58–64) fixes p prime and splits on existence of a ramified occurrence over p. If present, choose one P' and use SelHalf plus HeightOneSpectrum.ext to make its contraction the common lower prime for all occurrences. If absent choose I.C.P.pb 0; the required universal implication is vacuous. This preserves the empty case and the order ∀p ∃ lower prime ∀ occurrences. It does not assert the same lower prime for different p.

Fix arbitrary U. From I.Ok obtain htw via isTwist_of_reads, hram via RamQ.ram_iff, and hQr (every P in I.Q a is ramified); twistPlaces supplies the requisite place conditions. Apply LevelChoices.exists_levCh to the frame, TupU I U, reference mu0F, the functions t↦I.xi(ixOf I U t) and t↦I.Q(ixOf I U t). Its inputs are injectivity from xi_inj and ixOf_injective, reference character one from ixOf_mu0F, the three htw conditions, both hpl conditions, the common lower prime for each of the two designated primes pde,pde' (primality is explicit), and hram. Obtain new provisional L0 with h1,h2,h3,h4 (the unused returned component is not a new assumption). h4.Pg identifies its place set with the designated division places. Rewrite by h1 and use mem_vGs_iff to get hPg: L0.Pg=B.

The final L is the new L0, except that all eight frame/adelic fields ΛY,ΛW,ΛX,ΛV,βY,βW,βX,βV are copied from the original L₀. Its character and level-set fields remain the new ones. The proof explicitly reconstructs the L.Is record: the 15 non-frame fields h4.mu0,eta,xi,xi_inj,xi_base,xi_fin,xi_triv,xi_tame,Pg,Q_pl,Q_off,Q_de,Q_ram,chi,xiR from new h4; four frame fields from hL₀.is.βY,βX,βV,βW. Then C=h1, xiH=congrFun h2, Pg=hPg, Q=congrFun h3, beta=hL₀.beta. This exact field-by-field split explains why the new character selection need not alter the existing coordinate frames. No induction over subsets is needed: direct universal construction. No claim that every arbitrary twist has an admissible level without the original hypotheses.

Initial level: MemLevelOfLocalDepth:96–128 contains exists_levOf_of and exists_levOf_empty (I.Ok alone gives a LevOf for U=∅). The latter uses ixOf_empty, reference character one, empty twist primes, vacuous place conditions, and LevelChoices.exists_levCh; the former normalizes βX,βV to identity and constructs the two coordinate lattices using stdLat_diag and isSDFrame_std. This is a real source producer, not an extra premise, but the imported LevelChoices.exists_levCh and standard-frame proofs still need expansion. Combining these named theorems, for fixed X,px,I with I.Ok and SelHalf I, one may obtain ∀U,∃L,LevOf X I U L by choosing the empty-subset witness first. This composition is a human consequence of the two source theorems, not an asserted separately named Lean declaration or root edge.

## Source checks and upstream comparison
Checked 72 source/hash assertions in connector V8 (five pinned blobs + literal anchors, one current-head blob check). Four complete theorem texts (4/4) are byte-identical after trim in current H=9282d3a102c4aff0e6026746db2a8990f5d9cddd: mem_vGs_iff, exists_under_of_selHalf, grpAt_iff, grpAt_of_grpTrue. H is unchanged from RUN12. Current MemLevelOfLocalDepth blob 54c6ca369a5a57139d8d9e86f427d4988f5db026, changed from P: original exists_levOf_of and exists_levOf_empty no longer in this file; ExistsLevOfAll original H path returned 404. Relocation versus removal unresolved; do not assert semantic equivalence or proof failure.
Reproduce the exact pinned anchor checks in a local upstream clone using Python (git show and rev-parse). This wrapper was not run in the connector; equivalent literal tests above were.
```python
import subprocess
P="40e56bab026552e089d7afcfeff08d2defb9c005"
B="src/Development/AbelianVarietyTheory/"
rows=[["Definitions/AutomorphicMembership/MemLevelOfLocalDepth.lean","647ed4afd9b496566827be96b8f60b38e1121ed2",["theorem mem_vGs_iff","rw [Finset.mem_union, h.pibar, h.pibar, Fin.exists_fin_two]","theorem exists_under_of_selHalf","HeightOneSpectrum.ext (h a b P ha P' hb","I.C.P.pb 0","theorem exists_levOf_empty","theorem grpAt_iff","goodSeriesIdempotent_central_idempotent","hPr.vG_norm","hPr.g_ne","X.toD7.naut.plGw_inj","Fintype.bijective_iff_injective_and_card","hPr.vG_card","X.toD7.what₂.card_Tau","Equiv.ofBijective φ","theorem grpAt_of_grpTrue","hN.pl"]],["Definitions/AutomorphicMembership/IsAbsIrrCharCompIff.lean","01f74a4d9556ee699e36255b4ab59491e35ecd23",["def SelHalf","p.Prime","P.asIdeal.comap","structure LevOf","is : L.Is","C : L.C","xiH : ∀ t","Pg : L.Pg","Q : ∀ t","beta : (∀ i","structure GrpAt","pl : ∃ plg","idem : IsIdempotentElem","cen : X.toD7.ntypes.e0"]],["Proofs/IwasawaDecomposition/ExistsLevOfAll.lean","05a79753fd361dd3c71c966f8c67c974ac4e0d74",["theorem exists_levOf_all","I.Ok → SelHalf I","LevOf X I U₀ L₀ → ∀ U","isTwist_of_reads","RamQ.ram_iff","TwistPlaces.twistPlaces","GlobalTheory.LevelChoices.exists_levCh","ixOf_injective I U","exists_under_of_selHalf","X.B.host.pde_prime","X.B.host.pde'_prime","have hPg","Model.mem_vGs_iff","ΛY := L₀.ΛY","ΛW := L₀.ΛW","ΛX := L₀.ΛX","ΛV := L₀.ΛV","βY := L₀.βY","βW := L₀.βW","βX := L₀.βX","βV := L₀.βV","hL₀.is.βY","hL₀.is.βX","hL₀.is.βV","hL₀.is.βW","hL₀.beta"]],["Proofs/DivisorProofs/IsCentralIdempotentOfGoodSeriesIdempotent.lean","6b6aeb66f1163fde535a29312c20333b8aef1798",["theorem goodSeriesIdempotent_central_idempotent","good_sum","D.ntypes.eSer_idem","D.ntypes.eSer_central","D.ntypes.eSer_orth","Finset.mul_sum","rw [hm, if_pos ha]"]],["Proofs/IwasawaDecomposition/BaseFieldsPrimesOk.lean","352c685ba0759677354be0a2628666a2fb268dcb",["theorem base_fields_primes_ok","(GlobalTheory.BasePrimes.primes_ok B X).1"]]]
for p,h,anchors in rows:
    path=B+p
    assert subprocess.check_output(["git","rev-parse",P+":"+path]).decode().strip()==h
    s=subprocess.check_output(["git","show",P+":"+path]).decode()
    for a in anchors:
        assert a in s,(p,a)
print("pinned source anchors checked")
```
Finite logical regression executed in connector V8: {"maps":154,"half":27,"neg":3}. These are finite set models of injectivity/cardinality and the common-contraction guard, NOT native number-field calculations or a Lean replay. No assumptions removed, no runtime acceleration claimed. Reproduce in Node:
```js
function regress(){
 const assert=(v,m)=>{if(!v)throw Error(m)};
 let maps=0,half=0,neg=0;
 // enumerate all functions between equal-cardinality labelled finite sets; use only injective ones.
 for(let n=0;n<=5;n++){
  let accepted=0;const lim=n===0?1:n**n;
  for(let code=0;code<lim;code++){
   let x=code;const a=[];for(let i=0;i<n;i++){a.push(x%n);x=Math.floor(x/n)}
   if(new Set(a).size!==n)continue;
   accepted++; const b=a.map(v=>n+v);
   const all=[...a,...b];assert(new Set(all).size===2*n,"union injection");
   assert(Array.from({length:2*n},(_,i)=>i).every(i=>all.includes(i)),"union surjection");
   maps++;
  }
  let fact=1;for(let i=2;i<=n;i++)fact*=i;assert(accepted===fact,"permutation count");
 }
 // two possible contractions, 3 labelled potential occurrences; absent, under 0, under 1.
 for(let c=0;c<27;c++){let x=c,ys=[];for(let j=0;j<3;j++){ys.push(x%3-1);x=Math.floor(x/3)}
  let present=ys.filter(y=>y>=0);let pair=present.every(y=>present.every(z=>y===z));
  let ex=[0,1].some(z=>present.every(y=>y===z));assert(pair===ex,"SelHalf equivalence");
  if(pair){let w=present[0]??0;assert(present.every(y=>y===w),"witness")}
  half++;
 }
 assert(new Set([0,0]).size!==2,"drop family distinctness");neg++;
 assert(new Set([0]).size!==2,"drop equal cardinality");neg++;
 assert(![0,1].some(z=>[0,1].every(y=>y===z)),"drop SelHalf");neg++;
 return {maps,half,neg};
}
console.log(regress())
```

RESUME HERE: follow the actual import/declaration of GlobalTheory.LevelChoices.exists_levCh from the pinned ExistsLevOfAll and MemLevelOfLocalDepth chain, reconstruct the level construction's two designated-prime cases and standard-frame conditions; locate original caller of exists_finite_group_goodSet_levels_characters when reverse import index available. Request authenticated role-labelled edges for GlobalTheory.Mem.R3.Model.grpAt_iff, grpAt_of_grpTrue, exists_under_of_selHalf, exists_levOf_empty, exists_levOf_of, GlobalTheory.MtIn.LevAll.exists_levOf_all, GlobalTheory.GoodLatCompare.goodSeriesIdempotent_central_idempotent, LevelChoices.exists_levCh, plus RUN12 wrapper. Keep initial Top.GrpTrue, SelHalf, ReadL, MjHTie, IdxDefs suppliers and Keep/Pins connection open. HANDOFF TO dependencies, kernel, integration, editor, theta, Galois, audit. Project OPEN.
