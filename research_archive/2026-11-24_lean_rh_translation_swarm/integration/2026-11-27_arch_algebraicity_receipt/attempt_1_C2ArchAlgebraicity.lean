import Lib.General.LinearAlgebra.CommonEigenvectors
import Mathlib.Tactic

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
  grind [by simpa using
    (exists_ringEquiv_extend rfl _ _ t k).choose_spec .X]

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
