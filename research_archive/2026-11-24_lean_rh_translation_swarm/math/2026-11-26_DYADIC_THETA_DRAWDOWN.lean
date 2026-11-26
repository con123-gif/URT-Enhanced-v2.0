import Mathlib
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 2, 26 November 2026.  PREPARED / NOT COMPILED locally.

Scalar kernel for the dyadic Chebyshev-error drawdown criterion.  The companion
note proves the actual finite-sum/Tonelli identity for the prime shell.  This
file checks the exact positive normalized-weight aggregation and the final
scalar transfer.  It imports no RH theorem and does not prove the drawdown
premise.
-/

namespace RHMathDyadicThetaDrawdown

/-- A pointwise upper bound survives averaging against nonnegative weights of
total mass one, with no loss in the constant. -/
theorem normalized_drawdown_average
    {ι : Type} [DecidableEq ι]
    (s : Finset ι) (weight deficit : ι → ℝ) (C E : ℝ)
    (hweight : ∀ i ∈ s, 0 ≤ weight i)
    (hmass : ∑ i ∈ s, weight i = 1)
    (hdeficit : ∀ i ∈ s, deficit i ≤ C * E) :
    ∑ i ∈ s, weight i * deficit i ≤ C * E := by
  calc
    ∑ i ∈ s, weight i * deficit i
        ≤ ∑ i ∈ s, weight i * (C * E) :=
      Finset.sum_le_sum fun i hi =>
        mul_le_mul_of_nonneg_left (hdeficit i hi) (hweight i hi)
    _ = (∑ i ∈ s, weight i) * (C * E) := by
      rw [Finset.sum_mul]
    _ = C * E := by rw [hmass, one_mul]

/-- Once the exact shell deficit is bounded by the drawdown average, the
mission's prime lower bound is immediate. -/
theorem drawdown_implies_prime_lower
    (primeShell main drawdown C E : ℝ)
    (hidentity : main - primeShell = drawdown)
    (hdrawdown : drawdown ≤ C * E) :
    main - C * E ≤ primeShell := by
  linarith

/-- Increasing common bias has no downward drawdown.  This is the scalar
negative control showing why the criterion does not require absolute error
control. -/
theorem increasing_bias_no_drawdown
    (bias : ℝ → ℝ) (hmono : Monotone bias) (t x : ℝ) (htx : t ≤ x) :
    bias t - bias x ≤ 0 := by
  exact sub_nonpos.mpr (hmono htx)

example
    (primeShell main drawdown C E : ℝ)
    (hidentity : main - primeShell = drawdown)
    (hdrawdown : drawdown ≤ C * E) :
    main - C * E ≤ primeShell := by
  first
  | (rh_reduce 2 using [drawdown_implies_prime_lower]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact drawdown_implies_prime_lower primeShell main drawdown C E
      hidentity hdrawdown

end RHMathDyadicThetaDrawdown

rh_scan RHMathDyadicThetaDrawdown.normalized_drawdown_average limit 2000
rh_scan RHMathDyadicThetaDrawdown.drawdown_implies_prime_lower limit 2000
rh_scan RHMathDyadicThetaDrawdown.increasing_bias_no_drawdown limit 2000
rh_prune RHMathDyadicThetaDrawdown.normalized_drawdown_average as RHDrawdownAveragePruned
rh_prune RHMathDyadicThetaDrawdown.drawdown_implies_prime_lower as RHDrawdownPrimePruned
#print axioms RHMathDyadicThetaDrawdown.normalized_drawdown_average
#print axioms RHMathDyadicThetaDrawdown.drawdown_implies_prime_lower
#print axioms RHMathDyadicThetaDrawdown.increasing_bias_no_drawdown
