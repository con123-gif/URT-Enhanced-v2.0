import C2ExactReciprocalBudget
import New.Rows.LiftVolumeHeight
import Lean

/-!
RUN98 character boxes — 28 November 2026. SOURCE-MATCHED / PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
Source LiftVolumeHeight 87938141d4103b485fd5a7125721798f65f973f1, ComparisonForms
14ef893c54f5db837ea7e4f143b2b1a444b89b5a, HeckeValueHeight
f61d2e3c521863d4f814e3338e37c4e2c2fd1f84, FitTwists
c62935a73ccbef6c7fc42f45c83f111e811a5825, LongForms
9eff36cf003ac398fbd24361e80e95a03d0b0e05.
Use existing C2ExactReciprocalBudget blob daa6714e88afb7277734fda3dc09f4f037286e2a.
Peer acceleration RUN98 265ffc21 and prime RUN100 5bde193f already connect
the rank-free reciprocal C to selected and fixed-pair endpoints. Do not
duplicate their transports.

This addresses a distinct earlier rounding at the actual single-lift
height supplier. The native comparison-form archimedean cost is 2rB0,
the summed denominator cost is rB0, and the inverse Hecke value
cost is 10m x^999 + k(6B0-dirCost). Before the native HasLogBound
weakening these give d*(2rB0+rB0+10m x^999+6kB0-k dirCost).
Define J=m*(3rB0+10m x^999+6kB0). Keep the same fit family, same
nonzero determinant and comparison-form witnesses; do not independently
minimize local embeddings or replace the Hecke supplier.
The proposed sum over the m lift indices is d*(J-H); as in RUN96,
normalization of the same chain costs 2dE, E=m^2*t*x^999.
Thus C is d(H-J-E)<=V+2delta+(d-n)U, U=x1^2*b^2+x^99+4E.
With V=n(H-S+L), S=m*remainder, L=logB*budget, cancel H:
    n*(S-L) <= d*(J+E)+(d-n)*(U-H)+2delta.
This retains L in the A height: it must NOT be replaced by J there.
The previous RUN96 cap minus this cap is d*(L-J)/n, assuming n>0.
Do not claim uniform strict gain without proving J<L on actual D.
No selected-record or fixed-pair existence, rank bound, or new
weighted prime lower bound has been proved. The old native
HasLogBound weakening remains the fallback; its comparison to J
requires an explicit aggregate scale guard before declaring dominance.

Executed here: connector extracted the complete exact upstream lemma,
three unique replacements, reverse byte-for-byte round-trip. Exact
small integer scalar regression 198450 cases, 0 failures,
119070 strict cap differences. No numerical prime or Lean test.
RUN97 actual Actions run 46122658976: completed/cancelled, no jobs
returned; status and proof receipt paths both 404. Latest shared
compute queue 46125697285 in_progress at query; no proof result
inferred. Do not start another cold build or change protected workflows.
No local native rh_scan/prune/reduce/auto/frontier or graph PASS.
All earlier obligations, old/reduced graphs and axioms retained.

RESUME HERE: once the existing C2 native workspace is authenticated,
compile this as C2ExactLiftBudget following the RUN96 module; inspect
first actual diagnostic and compare the original/new lift, ratio and C
constructor-inclusive dependency roots (including comparison form,
denominator, inverse Hecke, fit family, index and product formula).
Only after actual verification supply the J-aware cap to integration.
RH OPEN. HANDOFF integration / acceleration / audit / kernel.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

open Module ComplexConjugate Finset Function PolyRep IsAlgClosed LinearMap Matrix NumberField
  AuxPair Real Space LevelPlaces.LevelForm Submodule

namespace Data
variable {P} {D : Data P}

noncomputable def run98PerLiftBudget (D : Data P) : ℝ :=
  2 * (D.r * D.B₀) + D.r * D.B₀ + 10 * D.m * D.x ^ 999 + 6 * D.k * D.B₀

noncomputable def run98ChainBudget (D : Data P) : ℝ :=
  D.m * D.run98PerLiftBudget

lemma run98_heightLe_liftVolume_ratio_exact {θ} (O : D.IsFitFamily θ) (j : D.LiftIndex) :
  HeightLe (D.rowDim * (D.run98PerLiftBudget - D.k * D.dirCost)) fun ι ↦
  D.liftVolume 1 j / D.liftVolume (θ ι) j := (O.denominator_le j).elim fun β ⟨g, g'⟩ ↦ by
  rw [D.finrank_rows_eq_finrank_goodForms j, liftVolume, show TameChar.pow _ j =
    .one by rw [TameChar.pow]; congr <;> apply one_pow]
  obtain ⟨γ, A, gl, H, ad, sur, tst, int, S⟩ := exists_comparison_forms j
  have d ϑ := finrank_range_of_inj (f := D.goodLift ϑ j) (by simp [auxLift_injective])
  replace tst ϑ y :=
    (A.adjoint.map_smul ..).trans congr($(adjoint_comp_eq_conj_smul (ad ϑ)) y).symm ▸ tst ϑ _
  let u (ϑ : D.Twist) := (compressedGramOp (smallHookNumber j) (D.goodLift ϑ j).range (gl ϑ)).det
  have V ϑ : _ * u ϑ = _ := adjoint_comp_eq_conj_smul (ad ϑ) ▸ d ϑ ▸ det_compressedGramOp _
  have T ϑ := right_ne_zero_of_mul ((V ϑ).trans_ne (by simp [H,
    normDet_eq_zero_iff_ker_ne_bot, ← orthogonal_range, range_eq_top.2 sur]))
  have sep ϑ z (h : (gl ϑ).adjoint z.1 = 0) :=
    ker_eq_bot'.1 (equivOfDetNeZero _ (T ϑ)).ker z (by simp [compressedGramOp, h])
  refine O.heightLe_of_eq_zpow_mul (.mul (y := fun ι ↦ u ((θ ι).powTwist j) / u 1) ⟨_, _,
    (_ : ℕ) * (D.r * β), T 1, d _ ▸ norm_det_compressedGramOp_arch_le (sep 1)
    (fun | ⟨_, y, rfl⟩ => tst 1 y) rfl S, fun ι ↦ ?_, .of_forall
    fun _ ↦ by simp [← mul_sum]; grw [g]; simp⟩ ((heightLe_inv_heckeValueProd_div O j).pow _))
    (by rw [← mul_add, ← mul_add]; unfold run98PerLiftBudget; apply le_of_eq; ring) fun ι
    n ↦ ⟨0, by
    have := div_ne_zero_iff.1 n; simp [← (H _).2, field, div_pow, V 1, *]
    erw [V ((θ ι).powTwist j)]; simp; ring⟩
  exact mul_div_cancel₀ _ (T 1) ▸ d _ ▸ norm_det_compressedGramOp_padic_le (sep _)
    (fun | ⟨_, y, rfl⟩ => tst _ y) ι (int _ · _ · (O.1 ι)) (g' ι).1


lemma run98_heightLe_volume_ratio_sq_exact {θ} (o : D.IsFitFamily θ) :
    HeightLe (2 * D.rowDim *
      (D.run98ChainBudget - D.mainHeight + (D.m : ℝ)^2 * D.t * D.x^999))
      (fun ι ↦ D.𝔷 (1 : D.MFoldTwist)^2 / D.𝔷 (θ ι)^2) := by
  choose c const _ vol using D.volume_iota_eq_prod_liftVolume
  have lifts : HeightLe (D.rowDim * (D.run98ChainBudget - D.mainHeight))
      (∏ j ∈ Icc 1 D.m, fun ι ↦ D.liftVolume 1 j / D.liftVolume (θ ι) j) :=
    (HeightLe.prod fun j h ↦ by exact run98_heightLe_liftVolume_ratio_exact o ⟨j, mem_Icc.1 h⟩).mono
      (by apply le_of_eq; simp [run98ChainBudget, mainHeight, Nat.card_Icc] <;> ring)
      (fun _ ↦ le_rfl)
  have consts : HeightLe (2 * (D.m : ℝ)^2 * D.t * D.x^999)
      (fun ι ↦ (‖c (θ ι) / c 1‖ ^ 2 :)⁻¹) :=
    by simpa only [Nat.cast_mul, pow_two, mul_assoc, mul_left_comm, mul_comm] using const θ o
  exact ((lifts.pow 2).mul (consts.pow D.rowDim)).mono (by apply le_of_eq; ring) fun ι ↦
    (congrArg (‖ι.2 ·‖) (by simp [vol, mul_pow, div_pow, ← pow_mul]; ring)).le

variable {n} {y : Fin n → _} {δ V}
  (i : LinearIndependent ℂ y) (I : D.IndexLe y δ)
  (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

include i I hV in
lemma run98_integral_forms_long_exact_lifts :
    D.rowDim * (D.mainHeight - D.run98ChainBudget -
      (D.m : ℝ)^2 * D.t * D.x^999) ≤
      V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x₁ ^ 2 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ)^2 * D.t * D.x^999) := by
  obtain ⟨⟨θ, o⟩, _, -, Z⟩ := c2_exists_isFitFamily D, D.volume_iota_eq_prod_liftVolume
  have formula : 0 ≤ 2 * (V + 2 * δ + ((D.rowDim : ℝ) - (n : ℝ)) *
      (D.x₁ ^ 2 * D.b ^ 2 + D.x ^ 99 + 4 * (D.m : ℝ)^2 * D.t * D.x^999)) +
      2 * D.rowDim * (D.run98ChainBudget - D.mainHeight +
        (D.m : ℝ)^2 * D.t * D.x^999) :=
    c2_heightLe_nonneg_arch ((((Data.audit_heightLe_volume_rows_exact i I hV o).pow 2).mul
      (Data.run98_heightLe_volume_ratio_sq_exact o)).mono le_rfl
      (by simp [field]; simp [(Z _).1]))
  linarith only [formula]

end Data

theorem run98_exact_lift_signed_scalar (d n H L J E U S δ M : ℝ)
    (hn : 0 < n)
    (hC : d*(H-J-E) ≤ n*(H-S+L)+2*δ+(d-n)*U)
    (hcost : d*(J+E)+(d-n)*(U-H)+2*δ ≤ n*M) :
    S ≤ L+M := by
  apply le_of_mul_le_mul_left _ hn
  nlinarith only [hC,hcost]

#print axioms Data.run98_heightLe_liftVolume_ratio_exact
#print axioms Data.run98_heightLe_volume_ratio_sq_exact
#print axioms Data.run98_integral_forms_long_exact_lifts
#print axioms run98_exact_lift_signed_scalar

open Lean in
run_cmd do
  for (root, required, forbidden) in #[
    (``Data.run98_heightLe_liftVolume_ratio_exact,
      #[``Data.heightLe_inv_heckeValueProd_div, ``Data.norm_det_compressedGramOp_arch_le,
        ``Data.norm_det_compressedGramOp_padic_le, ``Data.exists_comparison_forms],
      #[``Data.heightLe_liftVolume_ratio]),
    (``Data.run98_heightLe_volume_ratio_sq_exact,
      #[``Data.run98_heightLe_liftVolume_ratio_exact, ``Data.volume_iota_eq_prod_liftVolume],
      #[``Data.heightLe_volume_ratio_sq]),
    (``Data.run98_integral_forms_long_exact_lifts,
      #[``Data.run98_heightLe_volume_ratio_sq_exact, ``Data.audit_heightLe_volume_rows_exact,
        ``c2_exists_isFitFamily, ``c2_heightLe_nonneg_arch],
      #[``Data.integral_forms_long, ``Data.run96_integral_forms_long_exact_reciprocal])] do
    let .thmInfo info ← getConstInfo root | throwError "RUN98 missing theorem {root}"
    for a in required do
      unless info.value.getUsedConstants.contains a do
        throwError "RUN98 missing direct supplier {a} at {root}"
    for a in forbidden do
      if info.value.getUsedConstants.contains a then
        throwError "RUN98 stale direct supplier {a} at {root}"
    let axs ← collectAxioms root
    unless axs.all (fun a => #[``propext,``Classical.choice,``Quot.sound].contains a) do
      throwError "RUN98 nonstandard axiom {root}: {axs}"
  logInfo "RUN98_EXACT_LIFT_BUDGET_GUARDS_OK"
