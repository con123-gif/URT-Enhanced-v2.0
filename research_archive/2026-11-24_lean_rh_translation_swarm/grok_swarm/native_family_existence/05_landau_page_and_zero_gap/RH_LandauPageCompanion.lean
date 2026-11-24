/-
  RH_LandauPageCompanion.lean. NOT EXECUTED: not typechecked; needs Mathlib and the pinned upstream
  project (leanprover-community/riemann-hypothesis @ 40e56ba). Intended checks only.
-/
import Mathlib
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.OrderNeTop
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ExistsDirichletLFunctionZeroGapNearOneStatement

open Complex DirichletCharacter

-- T-1a, statement as in the chapter (A.1).
example : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ ψ : DirichletCharacter ℂ q) (β β' : ℝ), χ ≠ 1 → ψ ≠ 1 → χ ^ 2 = 1 → ψ ^ 2 = 1 → 1 - c / Real.log (2 * q) ≤ β → 1 - c / Real.log (2 * q) ≤ β' → LFunction χ β = 0 → LFunction ψ β' = 0 → χ = ψ ∧ β = β' ∧ deriv (LFunction χ) β ≠ 0 :=
  GlobalTheory.RealZeroNearOne.main

-- T-1d, statement as in the chapter (B.1).
example : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (ρ : ℂ), (χ ≠ 1 ∨ ρ ≠ 1) → LFunction χ ρ = 0 → |ρ.im| ≤ 1 → c / ((q : ℝ) ^ 2 * Real.log (3 * q)) ≤ 1 - ρ.re :=
  GlobalTheory.ZeroGapNearOne.exists_gap

#check @GlobalTheory.RealZeroNearOne.exists_bound
#check @GlobalTheory.TwoRealCharacters.neg_sum_logDeriv_nonneg
#check @GlobalTheory.T.neg_re_logDeriv_principalLFunction_le
#check @GlobalTheory.T.logDeriv_dirichletLFunction_local_zero_sum
#check @GlobalTheory.LOneLower.exists_le_norm_LFunction_one
#check @GlobalTheory.DirichletDeriv.exists_norm_deriv_LFunction_le
#print axioms GlobalTheory.RealZeroNearOne.main
#print axioms GlobalTheory.ZeroGapNearOne.exists_gap
