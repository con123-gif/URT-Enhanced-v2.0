/-
  RH_ZeroFreeCompanion.lean. NOT EXECUTED: not typechecked; needs Mathlib and the pinned upstream
  project (leanprover-community/riemann-hypothesis @ 40e56ba). Intended checks only.
-/
import Mathlib
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.LFunctionConjEqZero
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ZeroFreePrincipal
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.DirichletLZerosEqPrimitiveCharacterZerosStatement

open Complex DirichletCharacter GlobalTheory.Lin

-- T-1c (chapter Part C)
example : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ), χ ≠ 1 → LFunction χ s = 0 → (χ ^ 2 ≠ 1 ∨ s.im ≠ 0) → s.re < 1 - c / Real.log (q * (|s.im| + 2)) :=
  GlobalTheory.ZeroFreeComplex.zero_free_region

-- T-1b (chapter Part D)
example : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (s : ℂ), s ≠ 1 → LFunction (1 : DirichletCharacter ℂ q) s = 0 → s.re < 1 - c / Real.log (q * (|s.im| + 2)) :=
  GlobalTheory.ZeroFreePrincipal.zero_free

-- T-1e (chapter Part E)
example : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ), 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) → haveI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩; (LFunction χ s = 0 ↔ LFunction χ.primitiveCharacter s = 0) ∧ ord χ s = ord χ.primitiveCharacter s :=
  GlobalTheory.T.dirichletL_zeros_eq_primitiveCharacter_zeros

#check @GlobalTheory.ZeroFreeComplex.inv_le_log
#check @GlobalTheory.ZeroFreeComplex.LFunction_conj_eq_zero
#check @GlobalTheory.logDerivativeThreeFourOne.three_four_one
#check @GlobalTheory.ZetaLocal.logDeriv_riemannZeta_local
#print axioms GlobalTheory.ZeroFreeComplex.zero_free_region
#print axioms GlobalTheory.ZeroFreePrincipal.zero_free
#print axioms GlobalTheory.Lin.zeros_eq_zeros_primitiveCharacter
