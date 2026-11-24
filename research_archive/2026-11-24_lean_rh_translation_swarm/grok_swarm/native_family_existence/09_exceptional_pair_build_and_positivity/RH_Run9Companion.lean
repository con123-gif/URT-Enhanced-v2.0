/-
  RH_Run9Companion.lean: run-9 targets of the native_family_existence lane (folder 09_).
  Typechecked in run 9 against the pinned upstream source modules compiled by build_closure.py
  (leanprover-community/riemann-hypothesis@40e56ba src/, Mathlib 0df444a); output in run_logs.txt (section companion_run.log).
-/
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ExceptionalDirichletZeroUniqueZeroFreeRegionStatement
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.OrderNeTop
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.LogDerivativeBound
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.NegSumLogDerivNonneg

open Complex DirichletCharacter ArithmeticFunction

-- Statements as quoted in CHAPTER_EXCEPTIONAL_PAIR_BUILD_AND_POSITIVITY.md, closed by the upstream terms.
example : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
    χ ≠ 1 → ∀ σ : ℝ, 1 < σ → σ ≤ 2 → ∀ T : Finset ℝ,
    (∀ β ∈ T, 2 / 3 ≤ β ∧ LFunction χ β = 0) →
    -(deriv (LFunction χ) σ / LFunction χ σ).re ≤ C * Real.log (2 * q)
      - ∑ β ∈ T, (analyticOrderNatAt (LFunction χ) β : ℝ) / (σ - β) :=
  GlobalTheory.RealZeroNearOne.exists_bound

example (z : ℂ) (hz : ‖z‖ = 1) : 0 ≤ 3 + 4 * z.re + (z ^ 2).re :=
  GlobalTheory.logDerivativeThreeFourOne.comb_nonneg hz

#check @GlobalTheory.TwoRealCharacters.neg_sum_logDeriv_nonneg
#check @GlobalTheory.TwoRealCharacters.re_sum_nonneg
#check @GlobalTheory.logDerivativeThreeFourOne.three_four_one
#check @GlobalTheory.ExceptionalPair.main

#print axioms GlobalTheory.RealZeroNearOne.exists_bound
#print axioms GlobalTheory.TwoRealCharacters.neg_sum_logDeriv_nonneg
#print axioms GlobalTheory.logDerivativeThreeFourOne.three_four_one
#print axioms GlobalTheory.ExceptionalPair.main
#print axioms GlobalTheory.T.exceptionalDirichletZero_unique_zeroFreeRegion
