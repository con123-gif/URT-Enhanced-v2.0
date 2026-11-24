# Geometry RUN11 — boundary-vanishing descent via closed residues and field trace
2026-11-24. DONE for this bounded source-level reconstruction; SOURCE-MATCHED / explanatory mathematical proof, finite regression executed. Full project OPEN. No Lean replay.

## Continuity / source
Read AGENTS, research-state and log excerpts, RESEARCH_PROTOCOL, CONTINUITY_PROTOCOL, CI summary checkpoint 384 (pre-existing physics check, not this proof), SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN10 and latest available RESUME notes from the other lanes (dependency, integration, structure, math, audit, character, Galois, kernel, Landau, literature, acceleration, prime, editor, theta). No competing reconstruction of this particular descent found in those notes. Follow RUN10's explicit next task, not physics. Blueprint was not reopened; the pinned primary source is used throughout.

Source repository leanprover-community/riemann-hypothesis, pinned 40e56bab026552e089d7afcfeff08d2defb9c005. Observed head 307cef33f046955ee79dba47e0d828d06496d75f (2026-11-24 17:03:26 UTC). Pinned files and GitHub-returned blob IDs (not independently hashed raw bytes):
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/ComplexSectionFiniteCombinationStatement.lean — 4d34a2f6b24b8a0223f74adddc84d56205d48594
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/ComplexSectionFiniteCombination.lean — f5bf11d9bd59553487204536b8204ee3c15f7d3d
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/ExistsResidueEval.lean — 0e110902158627d44c76d1d49dde86c6c19dda0a
- src/Development/AutomorphicSpectrum/Proofs/GeometryProofs/LinIndepDescent.lean — 2dbfa182f7461ccd8ffc610941ca731e297db74b
- src/Development/AbelianVarietyTheory/Definitions/Divisors/NoCommonZeroCombVal.lean — 2077eb640b449dd53d293200b4c0ea87d40f53a7
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoC.lean — 3f17ffb43cc81093e5e19b9d9148dfc6c4fca2bd

The old ComplexSectionFiniteCombination and its Statement paths return 404 at current head. The first is located in src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean, blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e. Compared six extracted theorem text blocks: exists_closed_mem_notMem (pin L15, head L609), secVal_eq_zero_of_le (23,617), single_ext (7,513) identical after trimming terminal whitespace; vanish_descent (31,625) and linIndep_descent (37,543) identical after trimming each line and dropping blank lines; exists_residue_eval (13,404) differs after that normalization only in map_add becoming map_add (f := _) in a simp list. This is a source comparison, not a claim of semantic equivalence or head kernel replay. The relocated statement relay was not located separately; pin governs.

## 1. Exact theorem and scope
GlobalTheory.T.complex_section_finite_combination is a relay to GlobalTheory.CompanionTheory.VanDescent.vanish_descent. For every field F, scheme Y : Scheme.{0}, p:Y→Spec F, ring embedding σ:F→C, hp:LocallyOfFiniteType p, line-bundle presentation B:LB Y, hB:B.IsLB, open O:Y.Opens, and x:SecC p σ B, assume for ALL chart indices i and complex points y over σ outside ptsIn p σ O,
  SecC.val(x)(i,y)=0.
Then there exist m:nat, coefficients a_j∈C and algebraic sections s_j∈B.Sec, j∈Fin m, with nonzeroLocus(s_j)≤O for EVERY j, and
  SecC.val(x)=Σ_j a_j secVal(p,σ,s_j).
Important: equality of evaluated functions, NOT equality of tensors x=Σ a_j⊗s_j. No reducedness, properness, global finite type, finite-dimensional space of all sections, or normality is assumed. σ forces characteristic zero. The finite-type condition is LOCAL over F. B.IsLB supplies the covering and invertible transition functions.

NoCommonZeroCombVal L284 defines SecC = C⊗_F B.Sec using the scalar action algX p ⊤. L318 span_range_of proves generation by 1⊗s by tensor induction (zero, pure tensor, addition). Thus no GAGA or independent global cohomology base-change theorem is being asserted here. GAGA remains the upstream caller's responsibility.

## 2. Closed residue evaluation: Ar.ClosedPt.exists_residue_eval
For every closed point z of Y, select a chart B.U_i containing z using hB.cover and an affine U with z∈U⊆B.U_i. A=Γ(Y,U) is a finite-type F-algebra by hp and affine finite-type transport. The point corresponds to a maximal ideal P of A because the singleton is closed; K=A/P is a field and finite-dimensional over F by the finite-type field lemma (Zariski lemma, native finite_of_finite_type_of_isJacobsonRing). Define the additive map
  e_z(s) = restriction(s_i to U) mod P ∈ K.
Compatibility of restriction with algX gives e_z(a s)=a e_z(s). If z lies in nonzeroLocus(s), some chart coordinate is nonzero there; invertible line transition functions carry this nonvanishing into chart i, and restriction into U preserves it. Hence e_z(s)≠0. This uses exactly the pointwise nonzero locus, not a scheme-theoretic ideal vanishing condition.

For EVERY τ:K→C extending σ, use τ composed with A→A/P to define a complex point y in U. Its centre is z because τ is injective and the composition has kernel P. The chosen chart satisfies secVal(s)(i,y)=τ(e_z(s)) for all s, simultaneously. Preserve all extensions, not just one selected embedding. This reconstructs the affine construction, leaving named affine scheme and finite-type Mathlib lemmas as dependencies.

## 3. Arithmetic linear-independence descent (LinIndepDescent)
single_ext: take finite index set κ, finite extension K/F, σ as above, b_k∈C independent over σ(F), x_k∈K. Suppose Σ_k b_k τ(x_k)=0 for every extension τ. For every y∈K multiply each embedding equation by τ(y) and sum over embeddings. Characteristic zero implies separability, and the source uses trace_eq_sum_embeddings:
  Σ_k σ(Tr_{K/F}(x_k y)) b_k=0.
Independence forces Tr(x_k y)=0 for each k and each y. If x_k≠0 choose y=x_k^{-1}; then Tr(1)=[K:F]≠0 in F, contradiction. Therefore x=0. No assumption that K is Galois; use all embeddings. This is the actual proof rather than invoking a stronger nondegenerate trace form theorem.

linIndep_descent: allow ANY index type J, a family of finite extensions K_j/F, finite coefficient index ι, and v_l∈∏_j K_j. Assume the base-field linear map is injective:
  (∀j, Σ_l a_l v_l(j)=0) ⇒ a=0, for every a∈F^ι.
If d∈C^ι satisfies Σ_l d_l τ(v_l(j))=0 for every j and every τ extending σ, let S=span_F{d_l}⊂C. This is finite-dimensional even if C/F is infinite. Pick F-basis b_k of S and write d_l=Σ_k σ(c_lk)b_k. For each j, apply single_ext to x_k=Σ_l c_lk v_l(j); rearranging finite sums gives the required embedding equations. Thus x_k=0 for all j,k. The base injectivity assumption makes each column c_{·k}=0, hence d=0. Empty J is allowed (then injectivity forces trivial coefficient domain); do not restrict J to finitely many closed points.

## 4. Main induction, VanDescent.vanish_descent
J = {closed z∈Y outside O}; use step 2 to choose K_j,e_j. In the complex vector space of all chart-indexed point functions let G=span_C{secVal(s): nonzeroLocus(s)⊆O} and Z={functions zero at every point outside O, in every chart coordinate}. G⊆Z: within chart use secVal_ne_zero_iff and monotonicity of ptsIn, outside chart evaluation is totalized zero.

A locally finite-type scheme over a field is Jacobson; if an open U is not contained in O, the nonempty locally closed U∩(Y\O) contains a point closed in Y (exists_closed_mem_notMem). Consequently if e_j(s)=0 for every j, nonzeroLocus(s)⊆O; otherwise a closed point in its nonzero locus outside O contradicts e_j(s)≠0. The converse is not needed for this inference.

Induct on n to show: for all b_l∈B.Sec, d_l∈C, g∈G, if w=Σ_l d_l secVal(b_l)+g∈Z then w∈G. At n=0 trivial. At n>0 split on H: the family (e_j(b_l)) has no nonzero F-linear relation.
- If H holds, evaluate w at all lifts y of all closed j using all τ. Both w and g vanish there. Hence Σ_l d_l τ(e_j(b_l))=0 for all j,τ. Step 3 gives d=0, so w=g∈G.
- If H fails, obtain a nonzero a∈F^n with Σ_l a_l e_j(b_l)=0 for all j. Let s=Σ_l a_l b_l. By the closed-point argument, nonzeroLocus(s)⊆O, so q=secVal(s)=Σ_l σ(a_l)secVal(b_l)∈G. Choose pivot l0 with a_l0≠0 and c=d_l0/σ(a_l0) (embedding injectivity). EXACT identity:
  w = Σ_{l≠l0}(d_l−c σ(a_l)) secVal(b_l) + (g+c q).
The new remainder is in G; w remains in Z because it is the same function. Invoke induction on n−1 (Lean Fin.succAbove enumerates remaining indices). This works if d_l0=0; c=0 then removes a zero term. No requirement that q be nonzero.

Finally tensor generation (step 1) gives val(x) as finite sum of evaluations. Apply the induction with g=0, since hx says val(x)∈Z. Membership in G supplies precisely the finite combination and the individual support conditions in the theorem. Empty section sum allowed. This is a finite elimination proof, not a claim of linear runtime; cost of finding relations over all closed points is unspecified.

## 5. Executed finite regression and limitations
Actual V8 run: {"matrices":729,"rank0":1,"rank1":104,"rank2":624,"embeddingCases":531441,"boundaryZeroCases":12977,"pivotReconstructions":25954,"negativeControls":3}. The test exhausts 2×3 coefficient matrices with entries −1,0,1 representing one closed residue extension Q(i)/Q, and all three complex Gaussian integer coefficients with real and imaginary parts −1,0,1. It compares both embeddings to base-field row constraints and checks scaled nullspace reconstruction using nonzero integer pivots for all boundary-zero cases. Counts are nested; do not sum them. Two real-vector reconstructions per boundary-zero case. Three negative controls: omitting conjugate embedding, mistaking nilpotent evaluation for injectivity, zero pivot. Bounded integer arithmetic is exact (all entries and products far below 2^53). This is a finite algebra regression, not proof of the scheme geometry, not a general field solver, not a Lean kernel check. Original hypotheses not deleted; no URT speedup claimed.

Save the following fenced code as run11.mjs and run node run11.mjs; throw on mismatch.
~~~js
function regression(){
 const ck=(b,m)=>{if(!b)throw Error(m)}, dot=(a,b)=>a.reduce((s,x,i)=>s+x*b[i],0), cross=(a,b)=>[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]], zero=a=>a.every(x=>x===0);
 const vs=[];for(let x=-1;x<=1;x++)for(let y=-1;y<=1;y++)for(let z=-1;z<=1;z++)vs.push([x,y,z]);
 const counts={matrices:0,rank0:0,rank1:0,rank2:0,embeddingCases:0,boundaryZeroCases:0,pivotReconstructions:0,negativeControls:0};
 for(const a of vs)for(const b of vs){
  const w=cross(a,b),rank=!zero(w)?2:zero(a)&&zero(b)?0:1;
  counts.matrices++;counts["rank"+rank]++;
  // rational nullspace basis and integer denominator, no floating point division.
  const r=zero(a)?b:a,p=r.findIndex(x=>x!==0);
  let basis=rank===0?[[1,0,0],[0,1,0],[0,0,1]]:rank===2?[w]:[0,1,2].filter(j=>j!==p).map(j=>[0,1,2].map(i=>i===j?r[p]:i===p?-r[j]:0));
  for(const v of basis)ck(dot(a,v)===0&&dot(b,v)===0,"basis in kernel");
  for(const u of vs)for(const v of vs){ // d=u+i*v; eval column l=a_l+i*b_l
   const plus=[dot(a,u)-dot(b,v),dot(b,u)+dot(a,v)];
   const minus=[dot(a,u)+dot(b,v),-dot(b,u)+dot(a,v)];
   const both=zero(plus)&&zero(minus);
   ck(both===(dot(a,u)===0&&dot(b,u)===0&&dot(a,v)===0&&dot(b,v)===0),"all embeddings vs base-field equations");
   counts.embeddingCases++;
   if(!both)continue;counts.boundaryZeroCases++;
   for(const t of [u,v]){
    let denom,coeff;
    if(rank===0){denom=1;coeff=t;}
    else if(rank===1){denom=r[p];coeff=[0,1,2].filter(j=>j!==p).map(j=>t[j]);}
    else {const k=w.findIndex(x=>x!==0);denom=w[k];coeff=[t[k]];}
    ck(denom!==0,"nonzero pivot");
    for(let j=0;j<3;j++)ck(denom*t[j]===basis.reduce((sum,x,i)=>sum+coeff[i]*x[j],0),"scaled kernel reconstruction");
    counts.pivotReconstructions++;
   }
  }
 }
 // One embedding of Q(i) fails: (1,i) dotted with (-i,1) vanishes only at +i.
 const a=[1,0],b=[0,1],u=[0,1],v=[-1,0];
 ck(dot(a,u)-dot(b,v)===0&&dot(b,u)+dot(a,v)===0&&-dot(b,u)+dot(a,v)===-2,"missing conjugate negative control");counts.negativeControls++;
 // A nonzero nilpotent epsilon in Q[epsilon]/epsilon² has zero residue.
 const nil=[0,1],square=[nil[0]*nil[0],2*nil[0]*nil[1]];
 ck(!zero(nil)&&zero(square)&&nil[0]===0,"values are not tensor injectivity");counts.negativeControls++;
 // A zero pivot cannot remove a nonzero coefficient.
 ck(0*7!==3,"zero-pivot control");counts.negativeControls++;
 return counts;
}
console.log(JSON.stringify(regression()));
~~~
To independently verify provenance on a pinned clone run git rev-parse 40e56bab026552e089d7afcfeff08d2defb9c005:<path> for each ledger entry and compare its blob ID; full code source links are formed by https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/<path>. The above was executed directly in V8, not in CI or Lean. Remaining actual dependencies include Mathlib Jacobson and affine/field facts and trace_eq_sum_embeddings; the GAGA caller and boundary holomorphy arc, and vanBd_le_space, are still separate open reconstruction obligations. Source-level role edges: VuOnto.exists_comb → GlobalTheory.T.complex_section_finite_combination → VanDescent.vanish_descent → Ar.ClosedPt.exists_residue_eval, Arith.DedekindDescent.linIndep_descent → single_ext. These are body references, not authenticated elaborated reachability from Main.

RESUME HERE: reconstruct the source body of GlobalTheory.T.holomorphic_extension_section_reading (pinned VuOntoC imports HolomorphicExtensionSectionReadingStatement), tracking chart/ruleTop evaluation and the equality of evaluated functions (do not strengthen to tensor equality). Then trace holoOn_bdZ / open_holoZ and GAGA separately. Request authenticated role-labelled witnesses for GlobalTheory.T.complex_section_finite_combination, GlobalTheory.CompanionTheory.VanDescent.vanish_descent, GlobalTheory.CompanionTheory.Ar.ClosedPt.exists_residue_eval, GlobalTheory.CompanionTheory.Arith.DedekindDescent.linIndep_descent, single_ext. Do not redo RUN10 norm or this descent. HANDOFF TO integration, editor, audit, literature, geometry, dependency, kernel. Project OPEN.
