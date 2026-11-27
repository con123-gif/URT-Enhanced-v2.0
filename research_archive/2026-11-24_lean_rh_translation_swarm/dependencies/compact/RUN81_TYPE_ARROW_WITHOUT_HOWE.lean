import New.Seesaw.GradingsOfY
import Lean

/-!
# RUN81 — type preservation bypasses Howe polynomial witnesses at row-arrow caller
27 November 2026. SOURCE-MATCHED CANDIDATE, native replay outstanding. RH OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Exact source blobs:
 Edge.lean 5e5f40a06dd7a9a358e92987277eca74705f8f57
 Arrow.lean 7531d562070099180a4e8b2227b7e629a0c2afdd
 GradingsOfY.lean 9a0ce95531f7ef503b23167e9d90ef3d417f1bf8
Read current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
4878ea106b791c42b5f5a45810162de59701c4d9, 01fa22a6b12abad5ccf580d2621f82be3bf70c13;
SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS and continuity. Recent peer B4, A2,
C2 and B2 fusion commits checked by title. No duplicate row-arrow candidate
found by commit search. Preserve RUN79 db8bb7e2e8a6a347b2ac82df0742d9f22627da44
and RUN80 aaed007d342546441f949ba8b7ebe62f7c62440a as historical alternatives.

RESULT: IsEdge.isArrow asks the general half-edge property only at
v = polyVector(0), then discards its convolution equality (.1 L or .1 K).
It never uses inner_ne_zero. In the pinned half-edge proof the type
conclusion is already supplied by the R₀ identity (integrated projector
at B), before the separate finite monomial sum using Q. For fixed y,
F = S.lift Θ (V.integrated Φ f) y. The source establishes the equality
of F with the B-projector expression by R₀. The existing cusp-kernel
form criterion then gives T.IsForm e' F for each K with HasLevel F K.
No arbitrary-v smoothing witness is needed for this consequence.
Both directions need their own R₀ argument; preserve the swap, signs,
conjugate kernels, finite datum and both hΩ laws. All convergence,
rapidness, existence of continuous lift, projector idempotence, integrated
representation and level hypotheses are retained. No premise of the
original Data.isArrow_datumY statement is removed or added.

Candidate new route:
 Data.isArrow_datumY_run81 -> ParamsCorrespond.isTypeEdge_jointHarmonic_run81
 -> isTypeEdge_of_isJointHarmonic_run81 -> isTypeHalfEdge_of_oscillatorPair_run81
 plus RHTypeEdgeRun81.isArrow.
Unlike RUN79's helper extraction, this route does not need the old
arbitrary-polynomial Howe theorem at this consumer. Other consumers may
still require full IsEdge and the old theorem; never claim global deletion
before complete constructor-inclusive reachability. In particular row
equivariance, descent and norm consumers remain in the original graph.

Source checks executed in JS on authenticated reads: 23
anchor/substitution/absence checks (not Lean). Each renamed block is
reversible; the original R₀ first-component expression is retained
exactly apart from use -> exact, with its preceding derivation copied
from the original. The Q branch, choose α e, nonzero coefficient proof,
and final convolution sum were omitted because the new conclusion has
no such component. Source review caught the lost local cusp-kernel binder h from the original
fun h => constructor; it is now retained explicitly before refine.
The initial checkpoint is preserved in Git history (5cd6077caeb5).
No local lean/lake installed. No native proof or
dependency elimination claimed. Shared CI 46006832164 job wrappers
completed; its recorded graph ERROR remains distinct from B2 proof
replays. This file is not a receipt for that job or for RUN79.

Native replay in existing shared workspace, no cold Main build:
 lake env lean --tstack=400000 RUN81_TYPE_ARROW_WITHOUT_HOWE.lean
Require exact row-arrow type and all direct guards below, standard
axioms. If elaboration fails, repair in place in disposable scratch
copy and retain log; do not silently fall back to the old IsEdge.
Then run rh_scan/rh_prune on the actual two row roots and compare their
complete structural graphs using the strict 4.35 projection-aware
exporter and RUN80 verifier. Search for residual paths to
OscillatorPair.exists_bump_integratedRep_eq in both full and collector
closures, not just direct edges; a residual path is not a failed proof.
Use rh_reduce/rh_auto/frontier if a genuinely unresolved native goal
appears. No URT advantage claimed. Preserve original/reduced graphs,
axioms, source pins and all missing obligations.
RESUME HERE: replay this exact pure-type row-arrow candidate in the
shared compact environment and inspect its two rooted closures for
the old Howe theorem. HANDOFF TO kernel/integration/audit.
-/

noncomputable section

section

open NumberField MeasureTheory Matrix ComplexConjugate MvPolynomial Fintype Norms.L2Operator
  Classical Complex CompactlySupported Set Heisenberg.IsVacuum
variable {E n n' ι : Type} [Field E] [CMType E] [WeilData E]
  [Fintype n] [Fintype n'] [Fintype ι] {s : n → _} {t : n' → _} (γ γ' : InfinitePlace E → ℤ)
  (l : _ → n → ℤ) (l' : _ → n' → ℤ) {η : ι → _}
  (Ω : GInf E s × GInf E t → fockSpace (realSigns E η) →L[ℂ] fockSpace (realSigns E η))
  (e : GInf E s → ℂ) (e' : GInf E t → ℂ) (Φ : fockSpace (realSigns E η))

/-- Keep only the type-preservation property actually consumed by IsArrow.
No matrix-coefficient nonvanishing or arbitrary-polynomial smoothing witnesses. -/
structure RHTypeHalfEdgeRun81 where
  isCuspKernel_source : IsCuspKernel 0 e
  lift_isForm : ∀ {V : Space E ι η} {S T y f} (Θ : ThetaKernel _ S T),
    (∀ x y v f, Θ.ω ((x, 1), y, 1) (V.integrated v f) =
      V.integrated (Ω (x, y) v) f) → S.IsForm e y →
    let F := S.lift Θ (V.integrated Φ f) y
    ∀ K : OpenSubgroup _, HasLevel F K → T.IsForm e' F

structure RHTypeEdgeRun81 extends RHTypeHalfEdgeRun81 Ω e e' Φ where
  swapped : RHTypeHalfEdgeRun81 (Ω ·.swap) (star e') (star e) Φ

variable {γ γ' l l' Ω} {π π' Φ : _ → _} [Nonempty n] [Nonempty n']
attribute [local simp] realConv rep_apply_apply realPairWeil pairHomInf realWeil_piTensor mul_assoc
  ContinuousMultilinearMap.map_smul_univ

lemma isTypeHalfEdge_of_oscillatorPair_run81 {T : _ → _} (hp : ∀ w, OscillatorPair (T w) (π w) (π' w))
    (hΦ : ∀ w, IsJointHarmonic (T w) (l w) (l' w) (Φ w)) (hΩ : ∀ v, (∀ x, Ω (x, 1) (piTensor v)
    = piTensor fun w ↦ π w (x w) (v w)) ∧ ∀ y, Ω (1, y) (piTensor v) = piTensor fun w ↦ π' w (y w)
  (v w)) : RHTypeHalfEdgeRun81 Ω (typeKernel (-l) s) (typeKernel l' t) (piTensor (polyVector η <| Φ ·)) := by
  have A := integral_piTensor_eq_integratedRep (hp · |>.unitary_rep) _ (by fun_prop)
    (hΦ · |>.hasLargeGap.integrable_norm_pow_smul_dsKernel)
  simp [← hΩ] at A
  have h := isCuspKernel_typeKernel (l := -l) (hΦ · |>.hasLargeGap.neg)
  refine ⟨h, ?_⟩
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
  have R₀ := R (B · |>.integrable_norm_pow_smul_dsKernel)
  simp [(hp _).integratedRep_fix (hΦ _) (B _).integrable_norm_pow_smul_dsKernel
    (B _).isIdempotentKernel_dsKernel.convolution_self, M, ← hΩ, ← W, ← hL, ← lift_mul_right,
    -Prod.forall] at R₀
  exact (funext (R₀ · |>.2) ▸ T.isForm_realConv (isCuspKernel_typeKernel B) ⟨.congr (by fun_prop)
    (one_mul · ▸ ((lift_mul_right Θ 1 _).trans (hL ..)).symm), Θ.fixesLeft_lift, ·, ·⟩ (R₀ · |>.1))

lemma isTypeEdge_of_isJointHarmonic_run81 (hΦ : ∀ w, IsJointHarmonic (.std t s (γ w) (-γ' w)) (l' w) (-l w) (Φ
  w)) : RHTypeEdgeRun81 (realPairWeil γ γ') (typeKernel l s) (typeKernel l' t) ↑(∏ w, rename (w, ·) (Φ w)) :=
  piTensor_polyVector Φ ▸ ⟨neg_neg l ▸ isTypeHalfEdge_of_oscillatorPair_run81 (fun _ ↦ .swap
  oscillatorPair_detTwist) (hΦ · |>.swap)
  (by simp), by simpa +unfoldPartialApp [typeKernel, ← conj_dsKernel_neg (hΦ _).gap',
  ← (conj_dsKernel_neg (hΦ _).gap), Pi.star_def] using
  isTypeHalfEdge_of_oscillatorPair_run81 (fun x ↦ oscillatorPair_detTwist) hΦ (by simp)⟩

lemma ParamsCorrespond.isTypeEdge_jointHarmonic_run81 (h : ParamsCorrespond γ γ' l l' s t) :
  RHTypeEdgeRun81 (realPairWeil γ γ') (typeKernel l s) (typeKernel l' t) (jointHarmonic γ γ' l l' s t) :=
  isTypeEdge_of_isJointHarmonic_run81 (epsilon_spec <| h · |>.exists_isJointHarmonic)

end

section

open ComplexConjugate Space InnerProductSpace Submodule LinearMap
variable {E n n'} [Field E] [CMType E] [Fintype n] [Fintype n'] {s t X} [NormedAddCommGroup X]
  [NormedSpace ℂ X] [CompleteSpace X] {S : Space E n s} {T : Space E n' t} (K : ThetaKernel X S T)
  (e e') {φ φ'}

variable {K e e'}

lemma RHTypeEdgeRun81.isArrow [WeilData E] {γ γ' Φ ψ ψ' f} (h : RHTypeEdgeRun81 (realPairWeil γ γ') e e' Φ) (a b :
  AutChar E) [a.HasWeight γ ψ] [b.HasWeight γ' ψ'] (hf : f ∈ (S.hom T).finitePart) :
  IsArrow (pairThetaKer S T a b) e e' (integrated _ Φ f) ∧ IsArrow (pairThetaKer S T a b).swap
  (star e') (star e) (integrated _ Φ f) := (exists_level_pairWeil a b hf).elim fun K ⟨L,
  _⟩ ↦ by use fun y ↦ ⟨y.2.mem_rapidFunctions h.isCuspKernel_source,
  h.lift_isForm _ ?_ y.2 L ?_⟩, fun y ↦
  ⟨y.2.mem_rapidFunctions h.swapped.isCuspKernel_source, h.swapped.lift_isForm _ ?_ y.2 K ?_⟩ <;>
  simp_all [lift_mul_right, ← Prod.mk_one_one, pairWeil_integrated]

end

section
open Fin Kf MatMul Matrix NeZero

variable {P} {D : Data P} (ϑ : D.TameChar) (j) (s : D.G) (N T : Type) [Fintype N] [Fintype T] {E}
  [Field E] [CMType E] (X : LevelPlaces E)

lemma Data.isArrow_datumY_run81 {j} (hj : j < D.m) : IsArrow (thetaKernelY ϑ j) (typeKernel (D.paramY j)
  _) (typeKernel (D.paramY _) _) (datumY ϑ j) ∧ IsArrow (thetaKernelY ϑ j).swap
  (star (typeKernel (D.paramY _) _)) (star (typeKernel (D.paramY j) _)) (datumY ϑ j) :=
  (D.paramsCorrespond_grid false _ _ _ _ rfl).isTypeEdge_jointHarmonic_run81.isArrow _ _ (upsilonY ..).2

end

set_option pp.fullNames true in
open Lean in
run_cmd do
  let env := (← getEnv).setExporting false
  let old := ``Data.isArrow_datumY
  let new := ``Data.isArrow_datumY_run81
  let some (.thmInfo a) := env.find? old | throwError "missing original row arrow"
  let some (.thmInfo b) := env.find? new | throwError "missing candidate row arrow"
  unless a.levelParams == b.levelParams && a.type == b.type do
    throwError "row-arrow original statement differs"
  let forbidden := #[old, ``OscillatorPair.exists_bump_integratedRep_eq,
    ``isHalfEdge_of_oscillatorPair, ``isEdge_of_isJointHarmonic,
    ``ParamsCorrespond.isEdge_jointHarmonic, ``IsEdge.isArrow]
  let rows := #[
    (``isTypeHalfEdge_of_oscillatorPair_run81, #[]),
    (``isTypeEdge_of_isJointHarmonic_run81, #[``isTypeHalfEdge_of_oscillatorPair_run81]),
    (``ParamsCorrespond.isTypeEdge_jointHarmonic_run81, #[``isTypeEdge_of_isJointHarmonic_run81]),
    (``RHTypeEdgeRun81.isArrow, #[]),
    (new, #[``ParamsCorrespond.isTypeEdge_jointHarmonic_run81, ``RHTypeEdgeRun81.isArrow])]
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  let oldAx ← Lean.collectAxioms old
  unless oldAx.all (fun n => allowed.contains n) do
    throwError "unexpected original axiom"
  for (n, required) in rows do
    let some (.thmInfo t) := env.find? n | throwError m!"missing theorem {n}"
    let refs := t.value.getUsedConstants
    unless required.all (fun x => refs.contains x) do
      throwError m!"missing direct replacement edge at {n}"
    if forbidden.any (fun x => refs.contains x) then
      throwError m!"old direct supplier retained at {n}"
    let ax ← Lean.collectAxioms n
    unless ax.all (fun x => allowed.contains x) do
      throwError m!"unexpected axiom at {n}"
    if n == new && !(ax.all (fun x => oldAx.contains x)) then
      throwError "new row-arrow axiom not in original"
    logInfo m!"{n}: direct refs={refs}; axioms={ax}"
  logInfo m!"Original row-arrow axioms: {oldAx}"

#print axioms Data.isArrow_datumY
#print axioms Data.isArrow_datumY_run81
