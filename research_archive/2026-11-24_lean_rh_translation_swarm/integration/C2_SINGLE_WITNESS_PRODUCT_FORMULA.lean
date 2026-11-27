import C2SignedHeightRoot
import C2ArchAlgebraicity
import Lean

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
