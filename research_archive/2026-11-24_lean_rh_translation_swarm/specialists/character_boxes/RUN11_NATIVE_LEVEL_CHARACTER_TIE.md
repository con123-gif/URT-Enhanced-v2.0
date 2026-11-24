# RUN11 — Native level-character pair compatibility: actual PsiPPTie producer located
2026-11-24. SOURCE-MATCHED human derivation, finite explanatory regression; NOT kernel replay, not full RH reconstruction.

## Preflight / selection
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol and continuity, latest physics CI #383 (not RH validation), RUN10, StableIffCarrierEq, and recent handoffs from all nine other specialists, integration, dependencies, structure, math and audit. External blueprint not reread. The dependency lane's 1712 report binds seven different targets, not our requested reverse edges. Connector default-branch code search for PsiPPTie, ReadL, MjHIds yielded no hits, which is not negative dependency evidence. Instead fetched the pinned nonrecursive Git tree of IwasawaDecomposition (7501f7939fae16a6d24ad8f55ec8c9857c483a4d; 7769 entries; not truncated); the ordinary contents listing is incomplete. Located actual PsiPPTie producer through ExistsFiniteGroupGoodSetLevelsCharacters imports. This is the fallback specified by RUN10, not a repeat of its cardinality argument. ReadPk and ExistsReadOfDivDef3 are not the required ReadL constructor (the latter assumes DivDef3 and produces GlobalTheory.Mem.SJ.Read, a different record). ReadL/MjHTie/IdxDefs initial suppliers remain open.

## 1. Exact source-level dependency chain
Pinned leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
- GlobalTheory.Mem.R3.Grp.grp_levels_exist calls GlobalTheory.T.psiLevelPairCompatible_of_columnLevels.
- The wrapper delegates to GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf.
- This calls baseLevel_character_preserved_placewiseIdentity, sym_tie, psiC_of_mem and absNorm_eq_of_res.
- sym_tie uses symPos_entries_iff, HPsymF_eq_comap_unipSym, chiSym_eq_symHom, piChar_apply' and ofLocal_chi_apply.
- Formalism.L2.DIV.PsiPPTie is an existential with SAME five witnesses for LvlTie and PsiWeil. RUN10's pins_card_index_ranks consumes h.keep.psi, destructures these witnesses and uses LvlTie; this proves a real source-level producer of the type, not that this particular grp_levels_exist invocation is the provenance of every h.keep.psi on the Main kernel DAG. Need authenticated reverse edges for that stronger claim.

## 2. All quantifiers and five hypotheses of the producer
For every stage X, px:PreX X.B.toPre, I:Col2.ColIn X.B px, subset U of I.ι, L:LevCh X.toD7 (TupU I U), group equivalences eG:Gc X.B px ≃* G0 L.Pg X.toD7.R.r and cG:G0 L.Pg X.toD7.R.r ≃* G0g X.toD7.nd, place bijection plg:(Σ k:Fin 2,X.toD7.nd.PlG k)≃L.Pg and residue equivalences iso(kv):ZMod(X.toD7.host.g kv.1)≃+*kP(plg kv).1, assume:
1. I.Ok.
2. LevOf X I U L.
3. IsPlacewiseIdentity X eG.
4. For every kv, underlying place of plg kv equals X.toD7.naut.plGw kv.1 kv.2.
5. For every g and kv, eG(g)(plg kv)=Formalism.UG.bc (iso kv) ((eG.trans cG)(g)(kv)).
Then PsiPPTie X.toD7 (lev0 I) (chr0 I) (lev1 I) (chr1 I) (eG.trans cG).
No arbitrary new roots chosen: the actual witness family is psiC I, already specified by I. Take Pg=L.Pg, pl=plg, res(kv)=iso(kv)^(-1), ψ=psiC I, eC=eG. The conclusion is existential, but the proof supplies these exact witnesses. Retain all original types/instances and guards.

## 3. The seven LvlTie fields, with the reason for each
place: hypothesis 4.
comp: apply inverse residue map entrywise to hypothesis 5; iso inverse cancels iso. The GL equality follows from matrix extensionality and units extensionality.
gen: hLev.Pg identifies the level place set with (X.B.primes px).vGs; psiC_of_mem identifies ψ with I.Ch.psi0 there. I.Ok.ch_ok.psi_zero_nontrivial_character establishes each selected ψ is nontrivial. No assertion at places outside Pg.
p0 and chi0: after using hLev.Pg to identify the two index sets, eG is the identity on every component by hypothesis 3. Thus it preserves membership of the base unipotent subgroup and its character; the second equality is on subgroup elements with membership proof, not on arbitrary G.
ps and chis: use sym_tie, which requires the same place-set equality, placewise identity and ψ equality at every selected place. For r=R.r, a=R.rS, k=R.k, source rank equality r=k+2a+1 implies a+k≤r. Define p(i)=k+i if i<a, i-a if a≤i<a+k, i otherwise. This is inverse of symPerm; it exchanges adjacent blocks of sizes k and a. For each local matrix M, define Y_ij=M_{p(i),p(j)}. Both indices must be permuted. The inverse formula q(i)=a+i if i<k, i-k if k≤i<k+a, i otherwise establishes bijectivity.
HPsymF_eq_comap_unipSym identifies membership in the original symmetric subgroup with membership of Y in unipSym. Hence every member supplies the witness family Y; conversely existence of any Y with these entrywise equalities forces the same matrices, and gives membership. For the character, both global characters are finite products of local characters. At each place, chiSym_eq_symHom identifies the local characters after the coordinate change and hψ identifies their additive characters. Equality of underlying scalar values gives equality in the unit group. Finset.prod_congr then proves chis for EVERY g in Ps and EVERY y in the symmetric subgroup satisfying the full entrywise relation, not merely for one selected y.

The local scalar mechanism is exact. Define E(i,j) iff (j=i+1 and j≠a and j≠a+k) or (i+1=a and j=a+k). For matrices in the column-restricted unipotent subgroup, let S(M)=sum_{E(i,j)} M_ij. The first part of E is the adjacent superdiagonal with two edges removed, and the second is the bridging entry (a-1,a+k) when a>0. sym_sum_split proves the old supSum+offSum equals S. Since ψ is additive as a character, ψ(s+t)=ψ(s)ψ(t), so the product of the two old scalar character factors is ψ(S). For any two subgroup matrices A,B, S(AB)=S(A)+S(B): for each adjacent edge no intermediate index exists; for the bridging edge every intermediate l is in [a,a+k), where B_{l,a+k}=0 by the column restriction. Thus no cross term remains. This is exactly why symHom is a homomorphism (DefGroup). Removing the column restriction breaks this identity in general. No claim that ψ is additive as an ordinary field-valued linear map.

## 4. PsiWeil field and full assembly
For every kv, every residue c at plg kv, and integer b such that xiBar(X.toD7,plg kv)*c=b in that residue ring, I.Ok.weil gives the prescribed embedded value exp(2π i b/qOf(place)). Since res is a ring equivalence onto ZMod(g_k), the quotient-cardinality formula for absolute norm gives qOf(place)=g_k. Replace qOf by g_k, and use psiC_of_mem to get the exact PsiWeil equation. No appeal to asymptotics or numerical approximation of the exponential. I.Ok supplies both Weil normalization and nontriviality; this theorem is NOT their unconditional proof. In particular the separate exists_psiWeil construction from roots is NOT called here.
All seven LvlTie fields and the eighth PsiWeil obligation use the same place map, residue maps, group map and character family.

## 5. Immediate outer producer and frontier
grp_levels_exist assumes I.Ok, GrpAt X I, LevOf X I U L plus the dependent hX:X.B.fields.Ok. It obtains eG,cG,plg,iso,hid,hpl,hdiv,hbc from exists_finiteGroupIdentification_fixedPlaces. It obtains Xg and its idempotent coefficient properties from exists_goodCharacterSet_idempotent_coeff_coefficientField. It applies the just-explained wrapper with hI,hL,hid,hpl,hbc; it also separately invokes upperUnipotentGenericCharacter_mem_integralField and columnFaceLevels_baseLevel_symmetricLevel. The remaining universally quantified tr block preserves the SAME Xg and maps; IdemClass is obtained from centrality hG.cen and idemOf_coeff_conj. None of these adjacent suppliers is discharged merely by the level-character tie theorem. This is an exact conditional proof and a newly located source-level producer of PsiPPTie.

## 6. Provenance and actual source checks
P=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/; F=src/Formalism/LocalToGlobal/.
- P/PsiLevelPairCompatibleOfColumnLevels.lean 0e39e161c954e76eb867d33ed4ae430b5744b013
- P/PsiLevelPairCompatibleOfColumnLevelsStatement.lean 2a9bc1bc147d4a1fdfed82279c34f3a9e885c10c
- P/ExistsFiniteGroupGoodSetLevelsCharacters.lean f6e42ebeed75fceae0c6f0365051c3342cfa9d24
- F/Columns/RecLevelSym.lean b17e259e820676383aa066cb4736fab1e545f7c8
- F/Divisibility/RowSideTie.lean 7df7c6ad2f56fcc728ecf0f1424dbbf8661f2cfa
- F/Divisibility/PsiWeilOfAbsNorm.lean faaeff58e5c914aaea2ae6b11b4c7e0d61893a63
- F/Divisibility/DefGroup.lean 7497d665269c3ddeca251b145595ac7a3d53d617
- P/PinsCardIndexRanks.lean 04985046149dee04230630862a68aa6cc8b9fa29

Executed 58 assertions in connector V8: eight returned blob SHA comparisons and 50 source substring matches. Source anchors for replay (in manifest order):
1. theorem symPos_eq_symm; theorem symPos_entries_iff; theorem baseLevel_character_preserved_placewiseIdentity; theorem sym_tie; HPsymF_eq_comap_unipSym; chiSym_eq_symHom; Finset.prod_congr; theorem psiPPTie_of_levOf; I.Ok → LevOf; IsPlacewiseIdentity; ⟨L.Pg, plg, fun kv => (iso kv).symm, psiC I, eG; hP0.1, hP0.2, hS.1, hS.2; hOk.ch_ok.psi_zero_nontrivial_character; hOk.weil; absNorm_eq_of_res.
2. theorem _root_.GlobalTheory.T.psiLevelPairCompatible_of_columnLevels; exact @GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf.
3. theorem grp_levels_exist; I.Ok → GrpAt X I → LevOf; GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces; GlobalTheory.T.psiLevelPairCompatible_of_columnLevels; GlobalTheory.T.columnFaceLevels_baseLevel_symmetricLevel; idemOf_coeff_conj.
4. theorem HPsymF_eq_comap_unipSym; theorem sym_sum_split; theorem chiSym_eq_symHom; AddChar.map_add_eq_mul; theorem symEdge_symPerm_iff; theorem chiSymF_val; theorem r_eq_sym.
5. def symPos; structure LvlTie; place :; comp :; gen : IsGenericPsi; p0 :; chi0 :; ps :; chis :.
6. def PsiWeil; theorem absNorm_eq_of_res; theorem exists_psiWeil; def PsiPPTie; LvlTie D P0 ψ0 Ps ψs eG Pg pl res ψ eC ∧ PsiWeil.
7. def symEdge; def symHom; hy.2 l j; def IsGenericPsi.
8. theorem pins_card_index_ranks; h.keep.psi.
Reproduce with git rev-parse PIN:path and git show PIN:path. These are textual assertions, not elaborated dependency tests.

Observed upstream main 307cef33f046955ee79dba47e0d828d06496d75f, distinct from RUN10's 1da818b50f1e18808db2792b9dc735bda8cb84d8. At observed head all three P producer/wrapper/outer paths above returned HTTP 404. RowSideTie still exists (a49b52b6eb68027e64b511c0cd3c85874112b706), as does PsiWeilOfAbsNorm (f339097a162c41c17bdab662a55e21e00f9b944d), but declarations have changed. No assertion of deletion vs relocation or proof equivalence; keep the original snapshot.

## 7. Reproducible regression, executed
Actual connector V8 output: permutation=72, edge=15420, matrices=2592, products=2592, negative=3. Deterministic finite residue-matrix models only; not native automorphic data or kernel validation. Copy to Node to reproduce:
```js
function regress(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 let permutation=0,edge=0,matrices=0,products=0,negative=0;
 const seq=r=>Array.from({length:r},(_,i)=>i);
 const mod=(x,q)=>(x%q+q)%q;
 const sy=(i,a,k)=>i<a?k+i:i<a+k?i-a:i;
 const E=(i,j,a,k)=>(j===i+1&&j!==a&&j!==a+k)||(i+1===a&&j===a+k);
 const sum=(M,pred)=>M.reduce((s,row,i)=>s+row.reduce((t,v,j)=>t+(pred(i,j)?v:0),0),0);
 for(let a=0;a<=8;a++)for(let k=1;k<=8;k++){
  const r=k+2*a+1,I=seq(r),p=I.map(i=>sy(i,a,k)),inv=I.map(i=>i<k?a+i:i<k+a?i-k:i);
  ck(new Set(p).size===r&&I.every(i=>p[inv[i]]===i&&inv[p[i]]===i),"perm");permutation++;
  for(let i of I)for(let j of I){ck(E(inv[i],inv[j],a,k)===(j===i+1&&j!==k),"edge");edge++}
  for(let q of [2,3,5])for(let seed=0;seed<12;seed++){
   const make=s=>I.map(i=>I.map(j=>j<i?0:j===i?1:j===a+k&&i>=a?0:mod((i+1)*(j+2)+s*(i+j+1),q)));
   const A=make(seed),B=make(seed+1),C=I.map(i=>I.map(j=>mod(I.reduce((s,l)=>s+A[i][l]*B[l][j],0),q)));
   const old=I.map(i=>I.map(j=>A[inv[i]][inv[j]])),newM=I.map(i=>I.map(j=>old[p[i]][p[j]]));
   ck(I.every(i=>I.every(j=>newM[i][j]===A[i][j])),"matrix");
   ck(mod(sum(old,(i,j)=>j===i+1&&j!==k),q)===mod(sum(A,(i,j)=>E(i,j,a,k)),q),"sum");
   matrices++;
   ck(I.every(i=>I.every(j=>!(j===a+k&&i>=a&&i<j)||C[i][j]===0)),"closure");
   ck(mod(sum(C,(i,j)=>E(i,j,a,k)),q)===mod(sum(A,(i,j)=>E(i,j,a,k))+sum(B,(i,j)=>E(i,j,a,k)),q),"hom");products++;
  }
 }
 const a=1,k=2,r=5,q=3,I=seq(r);
 const A=I.map(i=>I.map(j=>+(i===j||i===0&&j===1))),B=I.map(i=>I.map(j=>+(i===j||i===1&&j===3)));
 const C=I.map(i=>I.map(j=>mod(I.reduce((s,l)=>s+A[i][l]*B[l][j],0),q)));
 ck(mod(sum(C,(i,j)=>E(i,j,a,k)),q)!==mod(sum(A,(i,j)=>E(i,j,a,k))+sum(B,(i,j)=>E(i,j,a,k)),q),"column guard");negative++;
 ck(E(0,3,a,k)&&!E(0,1,a,k),"bridge not ordinary");negative++;
 ck(new Set([0,1,2].map(i=>sy(i,2,2)%3)).size<3,"rank guard");negative++;
 return {permutation,edge,matrices,products,negative}
}
console.log(regress())
```
The first negative control deliberately violates the column restriction, the second checks the bridging edge replaces the ordinary adjacent edge, and the third violates the rank bound. No original hypotheses removed. No speed benchmark, no Lean run, no physical work.

RESUME HERE: trace actual GlobalTheory.T.exists_finiteGroupIdentification_fixedPlaces producer (import in grp_levels_exist) and its dependent place/residue equivalences, then follow the caller of grp_levels_exist into Keep/Pins. Use nonrecursive git trees instead of truncated directory listings. Request authenticated role edges for GlobalTheory.Mem.PsiTie.psiPPTie_of_levOf, GlobalTheory.T.psiLevelPairCompatible_of_columnLevels, GlobalTheory.Mem.R3.Grp.grp_levels_exist and GlobalTheory.Mem.R3.pins_card_index_ranks. Keep ReadL/MjHTie/IdxDefs original producers open; do not substitute SJ.Read or rerun previous cardinality. HANDOFF TO dependency, kernel, integration, editor, Galois, theta, audit. Project OPEN.
