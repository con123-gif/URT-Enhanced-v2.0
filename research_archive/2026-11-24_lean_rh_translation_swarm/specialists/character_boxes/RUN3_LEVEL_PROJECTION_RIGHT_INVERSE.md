# Run 3 — all small-level projections have explicit right inverses

2026-11-24. RESULT: SOURCE-MATCHED conditional reconstruction of the actual SlotZeroLocusCondition producer, including the elementary proof of surjectivity. This discharges the local implication left open by Run 2. It is not an independent Lean kernel check, a proof of native bundle existence, or a completion claim.

## Continuity
Read the swarm protocol, handoff queue, expansion plan, AGENTS, research state, runner log/protocol, continuity, prior lane Run 2, peer Galois/theta/Landau/prime/kernel/acceleration Run 3, positivity/literature Run 2, math rank and size chapters, native-family handoff and integration spine. Physical CI 45364009178 PASS (09:39 UTC) is unrelated to RH. This work is separate from the native rank envelope and the adjoint/rank implication already in Run 2.

All sources below pinned to leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005. Main at check: c9883164b0b3d762cee21f889d03d59a53b3ba3b (changed since Run 2 observation b37b32c236352418f6edf1ed85dd2e4b14420686). At current main, the old LPrjSurjAt and LPrjSurjective paths returned 404, LinkROfIsLinked changed to 270b3593ab7e2158aa34c05c8b609a03de0bd033 and LiftLatLemmas to b1264c460338c8eabcd167d0bae33c71e99d164c. No equivalence to migrated sources asserted.

## 1. Exact source route — the surprising simplification

HypothesesNonemptyOfUnramifiedExponents.lean lines 54–61 calls allRows_of_open0_alt, then nonempty_hyps_of_allRows_alt. The actual producer is LinkROfIsLinked.lean line 77:
```lean
zL := eventually_coreProperty_mono o.hPA fun Q h => _root_.GlobalTheory.Fc.R1.ZLAt.zL_of_hPA Q _ h
```
LPrjSurjAt.lean lines 18–22 shows that zL_of_hPA **does not inspect the primitivity hypothesis**: its first line is intro Q Lk _. It invokes Row.of_sel, supplies constants 1 (positive), the zero tuple in the source, and xr=0, then applies lPrj_surj_at_alt to the actual selected bundle sigma(Fm,d3_a(hc),x,hx,i), for the arbitrary level k. Thus the eventual surjectivity property is actually inherited from *every already-typed bundle* at each selected point. It is not an additional open-orbit nonvanishing theorem. Do NOT remove o.hPA from the original AllRowsAlt pipeline: the original application uses it for this monotonicity adapter and other arguments genuinely consume primitivity. No source proof has been rewritten.

## 2. Typed bundle assumptions

Fix D, O, c, b : BundleCondition D O c, k : Fin D.R.m. The type t used by the theorem is the selected base type b.P.A3.A.mu0. With the exact selected group, subgroup P0, character psi0, and subspace family Zs=b.P.A3.fam3.toSub2 b.P.Zs, lPrj_surj_at_alt calls LiftProjOnto.lPrj_surjective. It supplies:
- b.C.ok1.ok2, the required A.fam.Ok 1 proof;
- b.P.tied.div.mt.forms k b.P.A3.A.mu0, the FormsTie proof for the actual lift.

The latter is present in the original signature even though the proof body ignores it (final intro binder _). Preserve both in the manuscript statement. The former supplies BlockHyp for the specific block B=A.fam.L k t and level ell=A.fam.lvlA P0 psi0:
hB=(hOk.conj, hOk.irr, hOk.lifts k t).
BlockHyp requires IsConjAt(v0), absolute irreducibility of each character in ell.X, and B.Ok 1; RowLat.B.Ok includes good lattice data, rational Hermitian entries, positive definiteness at every infinite embedding, group-action goodness and rationality. This is conditional on these typed fields, NOT generic surjectivity for an arbitrary matrix. The theorem is over the coefficient number field K=D.what₂.LL, not an unproved assertion about integral lattice surjectivity.

## 3. Human mathematical proof of the projection theorem

Work over K. Suppress fixed B, ell, Z=Zs.Zl(k,t). Let E be the level-coordinate inclusion B.S.lvlE and R its projection B.S.lvlPr. Let V=B.vE include the good-part coordinates into the ambient space and S=B.vPr project to them. Let U=B.zE include the subspace coordinates into the good-part coordinates and Q=B.Pq project back. All sizes come from the native definitions; maps are rectangular. This Q denotes a matrix, not the slot Q in section 1.

The required identities are:
1. S V=I, from lf_v_proj hB. Its second part identifies V S with the matrix representation of goodAt.
2. Q U=I, from lf_z_proj hB. Here U is injective by lf_zE_inj and the restricted Hermitian form HV is positive by lf_HV_pos. The orthogonal-projection existence result gives the required left inverse; no new positivity assumption is added.
3. E R V=V, from lf_lvl_vE hB. This is the nontrivial nesting property: the good-part image lies in the level image. Source proof: level idempotent e=levelIdem and good-part idempotent g=goodAt satisfy e g=g (lf_lvl_mul_good, using idempotent_spec centrality/commutation and e²=e). The group-action matrix homomorphism therefore satisfies M(e)M(g)=M(g). Because E R=M(e), V S=M(g), S V=I, we get E R V=E R V S V=M(e)M(g)V=M(g)V=V S V=V.

The source definitions RowLat.lean lines 146–149 and LiftLat.lean line 130 are
F=B.fE=V U,
J=B.lE=R F,
L=B.lPr=Q S E.
Consequently
    L J = Q S E R V U
        = Q S V U
        = Q U
        = I.
This is exactly lf_lPr_lE, using lf_lvlE_lE and the two left-inverse identities. For each target y, choose the explicit preimage J y. Then L(J y)=y, which proves lf_lPr_surj. RowSideTie.lean lines 92–98 identifies the original lPrj with L and lZ0 with J. Note that the distinct name Formalism.L2.DIV.lE at line 84 denotes a level operator, NOT the inclusion J. Use the native BlockDat.lE or lZ0 for the right inverse.

This removes a conceptual bottleneck: the selected projection is onto because its inclusion is a section. No determinant search, asymptotic estimate, or additional induction is needed. The proof is exact; it does not claim that a representation satisfying BlockHyp always exists.

## 4. Quantifiers and common selection

SelectionZeroLocus (CountsIrreducibilityConstants.lean 105–111) is:
Closed(D3 3 A) of the property that for each Fm in D3 3 A there exists a real xr such that for all x>Fm.x1 with selected threshold <=x and xr<=x, for ALL i in Fm.Ix(x) and ALL k in Fin(Fm.D(x,i).R.m), the lPrj constructed from the same baseLevelChoiceOfRawSelection sigma is onto at its mu0.
The source proof takes xr=0, before x,i,k, so the bound is uniform in the family indices and levels. No choice of new sigma or of a new t per k. The proof applies for every typed selected point satisfying the original guards; it does not assert the existence of such points merely by surjectivity. Row.of_sel also supplies the Closed witnesses as in the literal source (positive 1 and zero tuple); do not replace Closed by an unguarded universal claim.
AllRowsAlt.zL is passed as RowL in NonemptyHypsOfAllRows lines 44,49–51,97 with the same A and sigma. Run 2 may now use the local result as the zL producer. The other row hypotheses there (divisor conditions, base count, bijective row transform, primitivity/type separation) remain separate.

## 5. Source inventory and evidence
T = src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/
F = src/Formalism/LocalToGlobal/Divisibility/
A = src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/
Blob IDs returned by connector:
- T/HypothesesNonemptyOfUnramifiedExponents.lean c0ce994aa86f737b707b5617fb10bcfb35c0117e — 54–61.
- T/LinkROfIsLinked.lean 66e5fddcb389f78669cef5787ef2c648d537bf4d — 50–86, particularly 77.
- T/LPrjSurjAt.lean 9f1742e4e5d59d606c1cfeea0781cec6e51e5216 — 14–22.
- T/CountsIrreducibilityConstants.lean 1e6d9219a64c3d573bbd3c0a442570caeb553089 — 105–111.
- T/NonemptyHypsOfAllRows.lean 6a09205dfc3e57486ecbc27517072f3c27f09a51 — 44,49–51,97.
- A/LPrjSurjective.lean 2393ceb239e799365dc6eddd8b6c2a28254aa709 — 9–12.
- F/LiftLatLemmas.lean df553462d74f2ffd6c1790f8c9fe12f2df7a74e7 — 151–217, 284–287.
- F/RowLat.lean 0e9a96babee33b5034bf913f6a25ac6389daa83e — 105–107,138–149,176 onward.
- F/LiftLat.lean 5b2e6117f6419179774eabe36f62d908522f977e — 130,184–191.
- F/RowSideTie.lean 7df7c6ad2f56fcc728ecf0f1424dbbf8661f2cfa — 61–62,84–98.

Executed V8 source checks: all 10 blob IDs matched and 47 literal source/body assertions passed (57 total). Replay using git show PIN:path, git hash-object --stdin, compare the above declarations and their actual calls: allRows_of_open0_alt -> eventually_coreProperty_mono o.hPA -> ZLAt.zL_of_hPA -> Row.of_sel -> lPrj_surj_at_alt -> LiftProjOnto.lPrj_surjective -> BlockDat.lf_lPr_surj -> lf_lPr_lE -> lf_lvlE_lE / lf_lvl_vE / lf_v_proj / lf_z_proj. These are static source references, not the full elaborated DAG. Connector blob IDs were compared, not independently recomputed.

## 6. Executed exact elementary regression

All entries below are small exact integers (safe JavaScript integer arithmetic), not native geometry. Test 116 pairs of one-dimensional split maps in dimension 2, conjugated by 125 invertible 3D integer shear bases and both orientations of target; 29,000 projection identities, 319,000 explicit preimage checks, and 14,500 negative controls lacking nesting. All passed. In the negative control both level and good maps separately split, but the good image is outside the level image, so L J=0. This verifies why nesting cannot be omitted. The universal algebra proof is section 3, not the bounded test.

Replay with Node or any JS engine; this is the actual executed test:
```js
const mul=(a,b)=>a.map(row=>b[0].map((_,j)=>row.reduce((s,x,k)=>s+x*b[k][j],0)));
const id=n=>Array.from({length:n},(_,i)=>Array.from({length:n},(_,j)=>i===j?1:0));
const eq=(a,b)=>JSON.stringify(a)===JSON.stringify(b);
function shear(i,j,s){const a=id(3);a[i][j]=s;return a;}
let pairs=0,cases=0,vecs=0,neg=0;
for(let a=-3;a<=3;a++)for(let b=-3;b<=3;b++)for(let c=-3;c<=3;c++)for(let d=-3;d<=3;d++){
 if(c*a+d*b!==1)continue;pairs++;
 const U=[[a],[b]],V=[[c,d]];
 for(let s=-2;s<=2;s++)for(let t=-2;t<=2;t++)for(let h=-2;h<=2;h++){
  const A=mul(mul(shear(0,2,s),shear(2,1,t)),shear(1,0,h));
  const Ai=mul(mul(shear(1,0,-h),shear(2,1,-t)),shear(0,2,-s));
  if(!eq(mul(A,Ai),id(3)))throw Error("inverse");
  const E=A.map(r=>r.slice(0,2)), R=Ai.slice(0,2);
  const W=mul(E,U), S=mul(V,R);
  for(const q of [-1,1]){
   const F=mul(W,[[q]]),I=mul(R,F),P=mul(mul([[q]],S),E);
   if(!eq(mul(R,E),id(2))||!eq(mul(S,W),id(1))||!eq(mul(mul(E,R),W),W)||!eq(mul(P,I),id(1)))throw Error("tower");
   cases++;
   for(let y=-5;y<=5;y++){if(!eq(mul(P,mul(I,[[y]])),[[y]]))throw Error("section");vecs++;}
  }
  const Wbad=A.map(r=>[r[2]]), Sbad=[Ai[2]];
  if(!eq(mul(Sbad,Wbad),id(1))||!eq(mul(R,E),id(2)))throw Error("negative input");
  if(!eq(mul(mul(Sbad,E),mul(R,Wbad)),[[0]]))throw Error("negative");
  neg++;
 }
}
if(pairs!==116||cases!==29000||vecs!==319000||neg!==14500)throw Error("counts");
console.log({pairs,cases,vecs,neg});
```
No original hypotheses removed; two signature premises found unused locally, with scopes explicitly preserved. No independent Lean run; no full-proof denominator or measured URT speedup. No physical files changed.

RESUME HERE: trace the other indispensable inputs of Run 2, starting with the actual producer of o.hDivG in OpenOrbitOfUnramifiedExponents.lean lines 54–55 and its bk_law_entries_alt call; locate the exact DivRows3G -> DivRows3.thTheta theorem giving the commutative coordinate identity for the same bundle. If peer theta/Galois lanes have already claimed that producer, instead trace the exact A.fam.Ok 1 producer through the BundleCondition column compatibility construction, preserving all group representation and positivity conditions. Do not repeat the projection right-inverse or adjoint/range proofs.
HANDOFF TO: integration, proof editor, formal audit, theta, Galois, math. Replace the previously open zL local implication with this source-matched proof; keep native bundle/Ok and remaining row producer obligations OPEN.
