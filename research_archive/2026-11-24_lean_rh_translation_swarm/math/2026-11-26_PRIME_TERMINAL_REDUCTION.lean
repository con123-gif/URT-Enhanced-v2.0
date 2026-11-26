import Mathlib
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 2, 26 November 2026. PREPARED / NOT COMPILED locally.

Scalar certificate for the prime-terminal reduction.  The companion note
proves the analytic monotonicity between prime arrivals.  This file records
the exact terminal suffix cancellation, normalized positive aggregation, and
the generic monotone endpoint transfer.  It imports no RH theorem.
-/

namespace RHMathPrimeTerminal

/-- Exact cancellation converting a terminal-excluded weighted suffix into a
difference of two Chebyshev errors. -/
theorem suffix_cancel
    (p q thetaLtP thetaQ : ℝ) :
    (p - q) - (thetaLtP - thetaQ) =
      (thetaQ - q) - (thetaLtP - p) := by
  ring

/-- A normalized nonnegative finite aggregation is bounded by the pointwise
maximum without taking separate absolute values. -/
theorem normalized_kernel_bound
    {ι : Type} [Fintype ι] (w a : ι → ℝ) (M : ℝ)
    (hw : ∀ i, 0 ≤ w i) (hsum : ∑ i, w i = 1)
    (ha : ∀ i, a i ≤ M) :
    ∑ i, w i * a i ≤ M := by
  calc
    ∑ i, w i * a i ≤ ∑ i, w i * M := by
      apply Finset.sum_le_sum
      intro i hi
      exact mul_le_mul_of_nonneg_left (ha i) (hw i)
    _ = M := by
      rw [← Finset.sum_mul, hsum, one_mul]

/-- Once the corrected deficit is monotone between arrivals, its left limit
at the next arrival controls every earlier endpoint in that interval. -/
theorem terminal_transfer
    (F : ℝ → ℝ) (x p : ℝ) (hxp : x ≤ p)
    (hmono : MonotoneOn F (Set.Icc x p)) (hp : F p ≤ 0) :
    F x ≤ 0 := by
  have hx : x ∈ Set.Icc x p := ⟨le_rfl, hxp⟩
  have hpend : p ∈ Set.Icc x p := ⟨hxp, le_rfl⟩
  exact (hmono hx hpend hxp).trans hp

/-- The terminal maximum closes the left-limit shell by transitivity. -/
theorem terminal_shell_of_drawdown
    (deficit terminalMax bound : ℝ)
    (havg : deficit ≤ terminalMax) (hmax : terminalMax ≤ bound) :
    deficit ≤ bound := by
  linarith

example
    (p q thetaLtP thetaQ : ℝ) :
    (p - q) - (thetaLtP - thetaQ) =
      (thetaQ - q) - (thetaLtP - p) := by
  first
  | (rh_reduce 2 using [suffix_cancel]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact suffix_cancel p q thetaLtP thetaQ

end RHMathPrimeTerminal

rh_scan RHMathPrimeTerminal.suffix_cancel limit 2000
rh_scan RHMathPrimeTerminal.normalized_kernel_bound limit 2000
rh_scan RHMathPrimeTerminal.terminal_transfer limit 2000
rh_scan RHMathPrimeTerminal.terminal_shell_of_drawdown limit 2000
rh_prune RHMathPrimeTerminal.suffix_cancel as RHPrimeTerminalSuffixPruned
rh_prune RHMathPrimeTerminal.terminal_transfer as RHPrimeTerminalTransferPruned
#print axioms RHMathPrimeTerminal.suffix_cancel
#print axioms RHMathPrimeTerminal.normalized_kernel_bound
#print axioms RHMathPrimeTerminal.terminal_transfer
#print axioms RHMathPrimeTerminal.terminal_shell_of_drawdown
