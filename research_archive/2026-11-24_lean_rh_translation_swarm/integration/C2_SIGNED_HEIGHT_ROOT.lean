import New.Heights.Heights
import Mathlib.Tactic

/-! One global square root in the actual signed height definition.
The root is chosen in C before any complex or p-adic embedding. No
nonnegative-budget premise is added. This is a proposed native extension,
not a receipt for the comparison forms or the full RH assembly.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

open Filter Finset Real

lemma c2_norm_map_le_exp_half {F : Type*} [NormedField F]
    (φ : ℂ →+* F) {v : ℂ} {b : ℝ} (h : ‖φ (v ^ 2)‖ ≤ exp b) :
    ‖φ v‖ ≤ exp (b / 2) := by
  have he : exp b = exp (b / 2) ^ 2 := by
    rw [← exp_nat_mul]
    congr 1
    ring
  rw [map_pow, norm_pow, he] at h
  nlinarith [norm_nonneg (φ v), exp_pos (b / 2)]

lemma c2_heightLe_of_sq {c : ℝ} {y : PrimePadicIso → ℂ}
    (h : HeightLe (2 * c) (y ^ 2)) : HeightLe c y := by
  obtain ⟨H, α, e, hH, hA, hP, hT⟩ := h
  obtain ⟨K, hK⟩ := IsAlgClosed.exists_pow_nat_eq H (by decide : 0 < 2)
  refine ⟨K, α / 2, (fun p ↦ e p / 2), ?_, ?_, ?_, ?_⟩
  · intro hz
    apply hH
    rw [← hK, hz]
    simp
  · intro σ
    apply c2_norm_map_le_exp_half σ.toRingHom
    rw [hK]
    exact hA σ
  · intro ι
    apply c2_norm_map_le_exp_half ι.2.toRingHom
    simpa only [mul_pow, hK, Pi.pow_apply, RingEquiv.toRingHom_eq_coe,
      RingEquiv.coe_toRingHom] using hP ι
  · filter_upwards [hT] with M hM
    rw [← sum_div]
    linarith

lemma c2_heightLe_reciprocal_budget {a b : ℝ} {y : PrimePadicIso → ℂ}
    (h : HeightLe a y) (hi : HeightLe (2 * b) (y⁻¹ ^ 2))
    (hn : ∀ ι, y ι ≠ 0) : 0 ≤ a + b := by
  apply HeightLe.nonneg
  exact (h.mul (c2_heightLe_of_sq hi)).mono le_rfl (by
    intro ι
    simp only [Pi.mul_apply, Pi.inv_apply, Pi.one_apply, mul_inv_cancel₀ (hn ι), le_refl])

lemma c2_heightLe_squared_one_no_negative {c : ℝ} (hc : c < 0) :
    ¬ HeightLe (2 * c) ((1 : PrimePadicIso → ℂ) ^ 2) := by
  intro h
  exact (not_le_of_gt hc) (c2_heightLe_of_sq h).nonneg

#print axioms c2_norm_map_le_exp_half
#print axioms c2_heightLe_of_sq
#print axioms c2_heightLe_reciprocal_budget
#print axioms c2_heightLe_squared_one_no_negative
#print axioms HeightLe.nonneg

run_cmd do
  let root ← Lean.getConstInfo ``c2_heightLe_of_sq
  let some body := root.value? (allowOpaque := true) |
    Lean.throwError "Missing global height-root proof"
  unless root.type.getUsedConstants.contains ``HeightLe do
    Lean.throwError "Height-root statement lost the actual native height definition"
  unless body.getUsedConstants.contains ``IsAlgClosed.exists_pow_nat_eq do
    Lean.throwError "Height-root proof lost its one globally chosen root"
  if root.type.hasFVar || root.type.hasMVar || body.hasFVar || body.hasMVar then
    Lean.throwError "Height-root proof left an open variable"
  Lean.logInfo "C2_SIGNED_HEIGHT_ROOT: actual HeightLe; one global root; signed reciprocal budget; negative constant-one budget excluded"
