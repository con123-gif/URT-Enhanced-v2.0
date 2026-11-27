import New.Seesaw.GradingsOfY
import Lean

/-!
# RUN79 — propagate actual Howe caller to the row-chain arrow
27 November 2026. PREPARED, source-matched; native replay NOT performed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Source blobs:
  Lib/DiscreteSeries/Theta/LocalThetaCorrespondence.lean 2a5c865a64dcbd1a9c75218fcc4d93ee4b4c6bf8
  Lib/Weil/Lift/Edge.lean 5e5f40a06dd7a9a358e92987277eca74705f8f57
  New/Seesaw/GradingsOfY.lean 9a0ce95531f7ef503b23167e9d90ef3d417f1bf8
RUN78 input commit bb24dd5269cbf2fa2b0ef56fc63ad2f9fd2acbb4,
blob 5ecc11b5c1440367b763352bccf5a8baf1aa8dfb. Mission/spine/ledger read at blobs
3adc76221a978016e3505cdf3e36ad688354d7d7,
33861bf3d18e22477f4f64693b91993fbf06b97b,
d9a79b815446e5de21e207f6149432d9b478f7f7.
Read SWARM_PROTOCOL, HANDOFF_QUEUE, expansion, AGENTS and continuity.
Peer commits f8e95752 (A1 native replay), 06486f1e (opaque audit),
97bc2912 (B2 energy), cd306c11 (A2 replay) checked by title.
This is V1/V2 dependency integration, not a new C arithmetic lemma.

RESULT: the original local Howe replacement has exactly one source-visible
consumer in the compact Edge file: the half-edge witness is requested only
on monomials, with a separate alpha(a,w) at each infinite place w and exponent
vector a. The global compactly supported function is the finite sum
sum_{a in support(P)} coeff(P,a) * bumpProduct(alpha(a)).
Thus the global proof requires neither uniform bump support across all a
nor a stronger arbitrary-vector/topological-density premise. This is a
description of the existing finite-sum argument, not a novel theorem.
The source has two separate half-edge calls in the full edge: BOTH are
redirected, with the same swapped/conjugated data and negative signs.
Then the corresponding-parameter edge and actual row-arrow proof are
redirected. Preserve all original theorem statements and contexts, including
hOmega, cusp kernel normalization, hPhi, j<D.m, and the finite datum.

Original source-visible path:
 Data.isArrow_datumY -> ParamsCorrespond.isEdge_jointHarmonic
 -> isEdge_of_isJointHarmonic -> isHalfEdge_of_oscillatorPair
 -> OscillatorPair.exists_bump_integratedRep_eq -> inline smoothing stability.
Candidate path: each arrow is redirected to a fresh theorem in the same
context; final local theorem calls RHDependencyRun77.smoothing_preimage_invariant.
No claim that other branches of the graph no longer reach old theorems.
Other consumers found by source search include TriangleArrows, SharpData,
EvenRank/ThetaLift and CompactLift/RallisFormula, not altered here.
Data.algFormRep_iota uses Data.isArrow_datumY; not patched in this run.

Executed source tests (authenticated GitHub UTF-8 reads and JS):
four downstream blocks extracted with exact anchors; nine reversible
replacement operations (4 declaration renames + 5 call occurrences),
each with exact occurrence count and inverse restoration. Original and
reduced source path recorded above. RUN78 candidate proof text copied
verbatim. No native Lean/lake present locally. No new graph or axiom result
claimed. Existing RUN78 graph plan retained, not replaced by a guess.

B2 run 45998845682 status blob c2bedaa5acd2a8d68d42a49a461675d3f3ed417b
actually read: ERROR despite source build success. Peer repaired opaque
inspection and full names; not a receipt for these C candidates.
Prior full union graph resource-blocked run 45781154005 retained.
No Main import; no claimed RH theorem used as proof.

Native replay: in the shared authenticated workspace, build
New.Seesaw.GradingsOfY (or reuse its exact cached module) and run
  lake env lean --tstack=400000 RUN79_COMPACT_HOWE_ROW_ARROW.lean
Exact type, direct replacement edge, no old direct supplier and standard
axiom guards below are fail-closed; full graph exclusion is separate.
Then adapt existing KernelGraphExport_v3.lean (blob ee4efebb066f6775fa551ae9104cfa973e585071)
driver only: concatenate this candidate with exporter definitions after
stripping imports and the old run_cmd; export rooted original and candidate
Data.isArrow_datumY separately or with the existing union audit driver
RUN26_COMPACT_GRAPH.py. Preserve all node/role records, missing nodes and
root axioms, compare actual old/new reachability; use verify_graph_v2.mjs.
Use RHProofTermPrune.lean (blob f6d3e7f6047a7895ecf183be3fb54c203f4fc46a)
in the same disposable combined file, imports first, rh_scan both roots
limit 2000 and rh_prune candidate at each level with fresh names.
Do not infer binder elimination or global dependency pruning from a source
rename. rh_reduce/rh_auto/frontier and backtracking appropriate only if a
native proof fails; there is no search gap in these exact substitutions.
Context cache key = compact pin, exact declaration, caller, role, same
parameters (T, eta, pi, pi', hPhi, hOmega, D, theta, j). Keep source and
proof-term edges distinct.

RESUME HERE: replay the complete five-caller chain in this file in the
shared compact environment, preserving the native log, exact type and
axiom checks before comparing original/new row-arrow root graphs.
HANDOFF TO kernel/integration/audit. No full RH proof claimed.
-/

namespace RHDependencyRun77

open Finset MeasureTheory Fintype GlModule Matrix.Norms.L2Operator

variable {R C I} [Fintype R] [Fintype C] [Fintype I] {η} {ε ε' l l' Φ}
  {T : @FockDualPair R C ε ε' I} {π π'}
  (hp : OscillatorPair (η := η) T π π') [Nonempty R] [Nonempty C]
  (hΦ : IsJointHarmonic T l l' Φ)

/-- Extract the actual stability premise from the native local theta caller.
Prepared source-context certificate; needs compact native replay. -/
lemma smoothing_preimage_invariant :
    let ι := (integratedRep π l.dsKernel).1 ∘ₗ polyVector η
    let G := .proj 1 ∘ₗ smear _ (hp.column_rep.unitary_rep.1 (ι Φ))
    ∀ Y y, y ∈ G.range.comap ι → T.swap.oscRows Y y ∈ G.range.comap ι := by
  intro ι G Y y hy
  have d := hp.isDerivedAction_integratedRep hΦ
  have v := hp.column_rep.unitary_rep
  have a (α : Bumps ε') : integratedRep π' (α.1.1 ·⁻¹) (ι Φ) = G α :=
    (map_integratedRep v (integrable_bump_inv_smul _ α) 1 (ι Φ)).trans (by aesop)
  rcases hy with ⟨β, e⟩
  exact ⟨bumpDeriv Y β, eq_unitaryLiePart_add_I_smul ε' Y ▸ by
    simp [G, map_add, fun Y ↦
      (d Y y).unique (by simpa [map_integratedRep v (integrable_bump_inv_smul ..) (π' _),
        ← e, ← a] using (hasDerivAt_smear _ β (v.1 _) (hasDerivAt_expU Y 1 0)))]⟩

end RHDependencyRun77

namespace OscillatorPair

variable {R C I} [Fintype R] [Fintype C] [Fintype I] {η} {ε ε' l l' Φ}
  {T : @FockDualPair R C ε ε' I} {π π'}
  (hp : OscillatorPair (η := η) T π π') [Nonempty R]
  (hΦ : IsJointHarmonic T l l' Φ)
open Finset MeasureTheory Fintype GlModule Matrix.Norms.L2Operator
include hp hΦ
variable [Nonempty C]

lemma exists_bump_integratedRep_eq_run78 P : ∃ α : Bumps ε', integratedRep π l.dsKernel (polyVector η P) =
  integratedRep π' (α.1.1 ·⁻¹) (integratedRep π l.dsKernel Φ) := by
  obtain ⟨d, v, ⟨⟩, ⟨⟩⟩ := hp.isDerivedAction_integratedRep hΦ, hp.column_rep.unitary_rep,
    exists_integration_by_parts hΦ.hasLargeGap hp.unitary_rep hp.derives,
    isKHighest_dsGenerator hΦ.gap.neg, hΦ.gap
  set ι := (integratedRep π _).1 ∘ₗ polyVector η
  let G := .proj 1 ∘ₗ smear _ (v.1 (ι Φ))
  have a α : _ = G α :=
    (map_integratedRep v (integrable_bump_inv_smul _ α) 1 (ι Φ)).trans (by aesop)
  refine ((hΦ.howe_argument (G.range.comap ι) (RHDependencyRun77.smoothing_preimage_invariant hp hΦ) ((hΦ.swap.hasLargeGap
    le_rfl).exists_bump_conv_dsKernel.imp (a · ▸ hp.integratedRep_fix hΦ
    (integrable_bump_inv_smul ..) ·)) (fun Q Y h k ↦ eq_unitaryLiePart_add_I_smul ε Y ▸
    by simp [ι, integratedRep_eq_zero_of_notMem_rootCone hΦ.hasLargeGap hp.unitary_rep hp.derives h
    k, ← ((hp.derives ..).map_clm _).deriv]) ?_
    ?_).ge (x := P) ⟨⟩).imp (a · ▸ symm) <;> simp +contextual [ι, *]

end OscillatorPair

noncomputable section

section
open NumberField MeasureTheory Matrix ComplexConjugate MvPolynomial Fintype Norms.L2Operator
  Classical Complex CompactlySupported Set Heisenberg.IsVacuum
variable {E n n' ι : Type} [Field E] [CMType E] [WeilData E]
  [Fintype n] [Fintype n'] [Fintype ι] {s : n → _} {t : n' → _} (γ γ' : InfinitePlace E → ℤ)
  (l : _ → n → ℤ) (l' : _ → n' → ℤ) {η : ι → _}
  (Ω : GInf E s × GInf E t → fockSpace (realSigns E η) →L[ℂ] fockSpace (realSigns E η))
  (e : GInf E s → ℂ) (e' : GInf E t → ℂ) (Φ : fockSpace (realSigns E η))

variable {γ γ' l l' Ω} {π π' Φ : _ → _} [Nonempty n] [Nonempty n']
attribute [local simp] realConv rep_apply_apply realPairWeil pairHomInf realWeil_piTensor mul_assoc
  ContinuousMultilinearMap.map_smul_univ

lemma isHalfEdge_of_oscillatorPair_run79 {T : _ → _} (hp : ∀ w, OscillatorPair (T w) (π w) (π' w))
    (hΦ : ∀ w, IsJointHarmonic (T w) (l w) (l' w) (Φ w)) (hΩ : ∀ v, (∀ x, Ω (x, 1) (piTensor v)
    = piTensor fun w ↦ π w (x w) (v w)) ∧ ∀ y, Ω (1, y) (piTensor v) = piTensor fun w ↦ π' w (y w)
  (v w)) : IsHalfEdge Ω (typeKernel (-l) s) (typeKernel l' t) (piTensor (polyVector η <| Φ ·)) := by
  have A := integral_piTensor_eq_integratedRep (hp · |>.unitary_rep) _ (by fun_prop)
    (hΦ · |>.hasLargeGap.integrable_norm_pow_smul_dsKernel)
  simp [← hΩ] at A
  choose α e using fun a w ↦ (hp w).exists_bump_integratedRep_eq_run78 (hΦ w) (monomial (.curry a w) 1)
  refine (fun h ↦ ⟨h, by simpa [h.apply_one_ne_zero, conj_dsKernel_neg (hΦ _).gap, ↓mul_div,
    mul_comm, integral_div] using (A _ (realInner _)).2.trans_ne (by simp [realInner_piTensor,
    Finset.prod_eq_zero_iff, ne_zero_of_re_pos
    ((hp _).re_inner_integratedRep_pos (hΦ _))]), fun _ ⟨P, o⟩ ↦ o ▸ ⟨∑ a ∈ P.support, P.coeff a •
    bumpProduct (α a), ?_⟩⟩) (isCuspKernel_typeKernel (l := -l) (hΦ · |>.hasLargeGap.neg))
  introv W hy
  obtain ⟨⟨L, hL⟩, ⟨_, _, hC⟩, B, ⟨⟩⟩ := Θ.exists_clm_lift (hy.mem_rapidFunctions h),
    Θ.exists_norm_theta_mul_le (hy.mem_rapidFunctions h), (hΦ · |>.swap.hasLargeGap le_rfl), hy.1
  have M v g : _ = S.lift Θ (V.integrated (piTensor v) f) y g := (hL (V.integrated _ f) g).trans (by
    erw [← (A v (_ ∘L V.integrated.flip f)).2, ← hy.3 h.1.2]
    simp [← W, ← hL, ↓Θ.lift_omega_left hy.1, Space.lift, ← integral_const_mul]
    rw [← integral_inv_eq_self, integral_integral_swap]
    simp [-integral_const_mul, typeKernel, ((hΦ _).hasLargeGap
      le_rfl).isIdempotentKernel_dsKernel.3, ← conj_dsKernel_neg (hΦ _).gap]; ac_rfl
    exact (((A v (V.integrated.flip f)).1.norm.comp_inv.const_mul _).comp_fst _).mono'
      (by fun_prop) (.of_forall fun ⟨x, a⟩ ↦ (hC _ (a * (x, 1)) g).trans' (by simp [← W])))
  have R {k} b (a := by fun_prop) g :=
    integral_piTensor_eq_integratedRep (hp · |>.column_rep.unitary_rep) k a b
    (fun w ↦ integratedRep (π w) (dsKernel (l w)) (Φ w)) (L g ∘L V.integrated.flip f)
  obtain ⟨R₀, Q⟩ := R (B · |>.integrable_norm_pow_smul_dsKernel), fun a ↦
    R (integrable_bump_inv_smul _ <| α a ·)
  simp [(hp _).integratedRep_fix (hΦ _) (B _).integrable_norm_pow_smul_dsKernel
    (B _).isIdempotentKernel_dsKernel.convolution_self, M, ← e, ← hΩ, ← W, ← hL, ← lift_mul_right,
    -Prod.forall] at R₀ Q
  use (funext (R₀ · |>.2) ▸ T.isForm_realConv (isCuspKernel_typeKernel B) ⟨.congr (by fun_prop)
    (one_mul · ▸ ((lift_mul_right Θ 1 _).trans (hL ..)).symm), Θ.fixesLeft_lift, ·, ·⟩ (R₀ · |>.1))
  ext; simp [bumpProduct, Finset.sum_mul, Q, integral_finsetSum, Integrable.const_mul]
  nth_rw 1 [P.as_sum]; simp [hL, piTensor_polyVector, monomial_eq, C_mul', prod_prod_type]

lemma isEdge_of_isJointHarmonic_run79 (hΦ : ∀ w, IsJointHarmonic (.std t s (γ w) (-γ' w)) (l' w) (-l w) (Φ
  w)) : IsEdge (realPairWeil γ γ') (typeKernel l s) (typeKernel l' t) ↑(∏ w, rename (w, ·) (Φ w)) :=
  piTensor_polyVector Φ ▸ ⟨neg_neg l ▸ isHalfEdge_of_oscillatorPair_run79 (fun _ ↦ .swap
  oscillatorPair_detTwist) (hΦ · |>.swap)
  (by simp), by simpa +unfoldPartialApp [typeKernel, ← conj_dsKernel_neg (hΦ _).gap',
  ← (conj_dsKernel_neg (hΦ _).gap), Pi.star_def] using
  isHalfEdge_of_oscillatorPair_run79 (fun x ↦ oscillatorPair_detTwist) hΦ (by simp)⟩

lemma ParamsCorrespond.isEdge_jointHarmonic_run79 (h : ParamsCorrespond γ γ' l l' s t) :
  IsEdge (realPairWeil γ γ') (typeKernel l s) (typeKernel l' t) (jointHarmonic γ γ' l l' s t) :=
  isEdge_of_isJointHarmonic_run79 (epsilon_spec <| h · |>.exists_isJointHarmonic)

end

open Fin Kf MatMul Matrix NeZero

section

variable {P} {D : Data P} (ϑ : D.TameChar) (j) (s : D.G) (N T : Type) [Fintype N] [Fintype T] {E}
  [Field E] [CMType E] (X : LevelPlaces E)

lemma Data.isArrow_datumY_run79 {j} (hj : j < D.m) : IsArrow (thetaKernelY ϑ j) (typeKernel (D.paramY j)
  _) (typeKernel (D.paramY _) _) (datumY ϑ j) ∧ IsArrow (thetaKernelY ϑ j).swap
  (star (typeKernel (D.paramY _) _)) (star (typeKernel (D.paramY j) _)) (datumY ϑ j) :=
  (D.paramsCorrespond_grid false _ _ _ _ rfl).isEdge_jointHarmonic_run79.isArrow _ _ (upsilonY ..).2

end

set_option pp.fullNames true in
open Lean in
run_cmd do
  let env := (← getEnv).setExporting false
  let rows : Array (Name × Name × Name) := #[
    (``OscillatorPair.exists_bump_integratedRep_eq, ``OscillatorPair.exists_bump_integratedRep_eq_run78, ``RHDependencyRun77.smoothing_preimage_invariant),
    (``isHalfEdge_of_oscillatorPair, ``isHalfEdge_of_oscillatorPair_run79, ``OscillatorPair.exists_bump_integratedRep_eq_run78),
    (``isEdge_of_isJointHarmonic, ``isEdge_of_isJointHarmonic_run79, ``isHalfEdge_of_oscillatorPair_run79),
    (``ParamsCorrespond.isEdge_jointHarmonic, ``ParamsCorrespond.isEdge_jointHarmonic_run79, ``isEdge_of_isJointHarmonic_run79),
    (``Data.isArrow_datumY, ``Data.isArrow_datumY_run79, ``ParamsCorrespond.isEdge_jointHarmonic_run79)]
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for (original, reduced, supplier) in rows do
    let some (.thmInfo a) := env.find? original | throwError m!"Missing original {original}"
    let some (.thmInfo b) := env.find? reduced | throwError m!"Missing candidate {reduced}"
    unless a.levelParams == b.levelParams && a.type == b.type do
      throwError m!"Original statement differs: {original}"
    let refs := b.value.getUsedConstants
    unless refs.contains supplier do
      throwError m!"Intended supplier missing: {reduced} -> {supplier}"
    if refs.contains original then
      throwError m!"Circular fallback to {original}"
    for (oldSupplier, newSupplier, _) in rows do
      if supplier == newSupplier && refs.contains oldSupplier then
        throwError m!"Old direct supplier retained: {reduced} -> {oldSupplier}"
    let oldAx ← Lean.collectAxioms original
    let newAx ← Lean.collectAxioms reduced
    unless oldAx.all (fun n => allowed.contains n) && newAx.all (fun n => allowed.contains n && oldAx.contains n) do
      throwError m!"Unexpected trust dependency: {original} / {reduced}"
    logInfo m!"Original value constants {original}: {a.value.getUsedConstants}"
    logInfo m!"Candidate value constants {reduced}: {refs}"
    logInfo m!"Original type constants: {a.type.getUsedConstants}"
    logInfo m!"Candidate type constants: {b.type.getUsedConstants}"
    logInfo m!"Axioms original={oldAx} candidate={newAx}"
    logInfo m!"Caller guards checked: {reduced}"

set_option pp.fullNames true in
#print axioms OscillatorPair.exists_bump_integratedRep_eq
set_option pp.fullNames true in
#print axioms OscillatorPair.exists_bump_integratedRep_eq_run78
set_option pp.fullNames true in
#print axioms isHalfEdge_of_oscillatorPair
set_option pp.fullNames true in
#print axioms isHalfEdge_of_oscillatorPair_run79
set_option pp.fullNames true in
#print axioms isEdge_of_isJointHarmonic
set_option pp.fullNames true in
#print axioms isEdge_of_isJointHarmonic_run79
set_option pp.fullNames true in
#print axioms ParamsCorrespond.isEdge_jointHarmonic
set_option pp.fullNames true in
#print axioms ParamsCorrespond.isEdge_jointHarmonic_run79
set_option pp.fullNames true in
#print axioms Data.isArrow_datumY
set_option pp.fullNames true in
#print axioms Data.isArrow_datumY_run79
