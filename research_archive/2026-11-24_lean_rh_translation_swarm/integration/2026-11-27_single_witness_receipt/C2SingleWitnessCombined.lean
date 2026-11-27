import New.Heights.Heights
import Mathlib.Tactic
import Lib.General.LinearAlgebra.CommonEigenvectors
import Lean

/-! Assembled source; preparation is not native proof acceptance. -/

-- Exact body from C2_SIGNED_HEIGHT_ROOT.lean

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

-- Exact body from C2_ARCHIMEDEAN_ALGEBRAICITY.lean

/-! Algebraicity of the common determinant witness from its actual uniform
archimedean bound. This is the archimedean counterpart of the pinned
source's isAlgebraic_of_padic argument, using the same countable-ring
extension theorem. It adds no separate algebraicity hypothesis.
Proposed until the named normal-kernel replay passes.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

lemma c2_isAlgebraic_of_arch {x : ℂ} {c : ℝ}
    (h : ∀ σ : ℂ ≃+* ℂ, ‖σ x‖ ≤ c) : IsAlgebraic ℚ x := by
  obtain ⟨_, _, ⟨k⟩⟩ := (Polynomial.basisMonomials ℚ).1.injective.countable,
    ((Algebraic.countable ℚ ℂ).dense_compl ℂ).exists_mem_open
    (continuous_norm.1 _ isOpen_Ioi) (NormedField.exists_lt_norm ℂ c)
  simp [isAlgebraic_iff_not_injective] at *
  intro t
  obtain ⟨σ, hσ⟩ := exists_ringEquiv_extend (L := ℂ) rfl _ _ t k
  grind [by simpa using hσ .X]

#print axioms c2_isAlgebraic_of_arch

run_cmd do
  let info ← Lean.getConstInfo ``c2_isAlgebraic_of_arch
  let some body := info.value? (allowOpaque := true) |
    Lean.throwError "Missing archimedean algebraicity proof"
  unless body.getUsedConstants.contains ``exists_ringEquiv_extend do
    Lean.throwError "Archimedean algebraicity lost the actual extension theorem"
  if body.getUsedConstants.contains `isAlgebraic_of_padic then
    Lean.throwError "Archimedean algebraicity retained the p-adic premise"
  Lean.logInfo "C2_ARCH_ALGEBRAICITY: algebraicity from all complex automorphisms; no independent algebraicity premise"

-- Exact body from C2_SINGLE_WITNESS_PRODUCT_FORMULA.lean

/-! Proposed native product-formula junction for the common determinant
witness. The same actual HeightLe predicate and every local embedding are
retained. Algebraicity is derived from the witness's uniform archimedean
bound, and the reciprocal cancellation uses one globally chosen square root.
No comparison-form, filling, Selmer or RH closure is claimed by this file.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

open Filter Finset IntermediateField Module Real AdjoinSimple

lemma c2_heightLe_nonneg_arch {c : ℝ} (h : HeightLe c 1) : 0 ≤ c := by
  choose H _ _ d _ f _ g using by simpa [HeightLe] using h
  have := @NumberField.mk _ _ _ (adjoin.finiteDimensional
    (c2_isAlgebraic_of_arch d).isIntegral)
  have k {F c} [NormedField F] [CharZero F] [IsAlgClosed F] (e : _ = _)
      (h : ∀ ι : _ ≃+* F, ‖ι H‖ ≤ exp c) :=
      show ‖algebraMap ℚ F (Algebra.norm ℚ (gen ℚ H))‖.log / finrank ℚ ℚ⟮H⟯ ≤ c by
    grw [Algebra.norm_eq_prod_embeddings, norm_prod, prod_le_prod₀ _ fun σ _ ↦
      (exists_ringEquiv_extend e ℚ⟮H⟯.val σ.1).choose_spec ⟨H, _⟩ ▸ h _] <;>
      simp_all [finrank_pos.ne', prod_pos, Subtype.ext_iff]
  grw [← g _ le_self_add, ← k rfl d, ← sum_le_sum fun l h ↦ @Padic.eq_padicNorm l .. ▸
    @PadicAlgCl.norm_extends .. ▸ k (@mk_complex_eq_mk_padicAlgCl ..)
    (f ⟨⟨l, (mem_filter.1 h).2⟩, ·⟩)]
  simp [← sum_div, field]
  rw [log_product_formula (Nat.le_add_left ..), zero_div]

lemma c2_heightLe_single_witness_budget {a b : ℝ} {y : PrimePadicIso → ℂ}
    (h : HeightLe a y) (hi : HeightLe (2 * b) (y⁻¹ ^ 2))
    (hn : ∀ ι, y ι ≠ 0) : 0 ≤ a + b := by
  apply c2_heightLe_nonneg_arch
  exact (h.mul (c2_heightLe_of_sq hi)).mono le_rfl (by
    intro ι
    simp only [Pi.mul_apply, Pi.inv_apply, Pi.one_apply, mul_inv_cancel₀ (hn ι), le_refl])

#print axioms c2_heightLe_nonneg_arch
#print axioms c2_heightLe_single_witness_budget

run_cmd do
  let original ← Lean.getConstInfo ``HeightLe.nonneg
  let replacement ← Lean.getConstInfo ``c2_heightLe_nonneg_arch
  unless original.levelParams == replacement.levelParams do
    Lean.throwError "Product-formula universes changed"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq original.type replacement.type
  unless same do Lean.throwError "Product-formula complete original statement changed"
  let earlierBudget ← Lean.getConstInfo ``c2_heightLe_reciprocal_budget
  let joinedBudget ← Lean.getConstInfo ``c2_heightLe_single_witness_budget
  let sameBudget ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq earlierBudget.type joinedBudget.type
  unless earlierBudget.levelParams == joinedBudget.levelParams && sameBudget do
    Lean.throwError "Single-witness budget changed a signed or nonzero-family premise"
  let some body := replacement.value? (allowOpaque := true) |
    Lean.throwError "Missing single-witness product-formula proof"
  for name in #[``c2_isAlgebraic_of_arch, ``log_product_formula] do
    unless body.getUsedConstants.contains name do
      Lean.throwError "Product formula lost an actual required supplier"
  for name in #[``HeightLe.nonneg, `isAlgebraic_of_padic] do
    if body.getUsedConstants.contains name then
      Lean.throwError "Product formula retained a replaced algebraicity/nonnegativity alias"
  Lean.logInfo "C2_SINGLE_WITNESS: complete native product-formula statement; archimedean algebraicity and one global root"
