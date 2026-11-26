import Mathlib
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 2, 26 November 2026. PREPARED / NOT COMPILED locally.

Scalar certificate for the logarithmic-gap negative control.  The companion
note supplies the recursive pseudo-prime construction and analytic shell
integration.  This file checks the one-step signed drift and the exact
two-region aggregation.  It imports no RH theorem.
-/

namespace RHMathLogGapNoGo

/-- A gap exceeding the current log-weight by two still produces at least
three-halves downward error drift when the next log grows by at most one-half.
-/
theorem one_step_error_drift
    (gap logCurrent logNext : ℝ)
    (hgap : logCurrent + 2 ≤ gap)
    (hlog : logNext ≤ logCurrent + 1 / 2) :
    3 / 2 ≤ gap - logNext := by
  linarith

/-- Lower bounds on a region of kernel mass `A`, together with a global lower
bound on the complement, combine before any absolute value is taken. -/
theorem two_region_kernel_lower
    (D A L G : ℝ)
    (hD : A * L + (1 - A) * (-G) ≤ D) :
    A * L - (1 - A) * G ≤ D := by
  nlinarith

/-- The constants from the dyadic subinterval `[x/2,3x/4]`. -/
theorem dyadic_chunk_constants (x logx : ℝ) :
    (2 / 3 : ℝ) * (x / (8 * logx) - 3 * logx) +
        (1 / 3 : ℝ) * (-logx) =
      x / (12 * logx) - (7 / 3 : ℝ) * logx := by
  by_cases h : logx = 0
  · simp [h]
  · field_simp [h]
    <;> ring

example
    (gap logCurrent logNext : ℝ)
    (hgap : logCurrent + 2 ≤ gap)
    (hlog : logNext ≤ logCurrent + 1 / 2) :
    3 / 2 ≤ gap - logNext := by
  first
  | (rh_reduce 2 using [one_step_error_drift]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact one_step_error_drift gap logCurrent logNext hgap hlog

end RHMathLogGapNoGo

rh_scan RHMathLogGapNoGo.one_step_error_drift limit 2000
rh_scan RHMathLogGapNoGo.two_region_kernel_lower limit 2000
rh_scan RHMathLogGapNoGo.dyadic_chunk_constants limit 2000
rh_prune RHMathLogGapNoGo.one_step_error_drift as RHLogGapDriftPruned
rh_prune RHMathLogGapNoGo.two_region_kernel_lower as RHLogGapKernelPruned
#print axioms RHMathLogGapNoGo.one_step_error_drift
#print axioms RHMathLogGapNoGo.two_region_kernel_lower
#print axioms RHMathLogGapNoGo.dyadic_chunk_constants
