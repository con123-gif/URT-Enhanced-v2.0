import Mathlib
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 2, 26 November 2026. PREPARED / NOT COMPILED locally.

Scalar certificate for the positive mean-square prime-terminal criterion.
The companion note proves the continuous probability-kernel version and the
prime-terminal transfer.  This file records the algebraic positive-part and
weighted mean-square steps.  It imports no RH theorem.
-/

namespace RHMathPositiveMeanSquareTerminal

/-- Discarding a negative contribution is one-sided and always safe. -/
theorem le_positive_part (x : ℝ) : x ≤ max x 0 := by
  exact le_max_left _ _

/-- The exact two-cell weighted Cauchy inequality, including all positivity
guards.  Finite partitions iterate this identity; the analytic note uses its
probability-measure limit. -/
theorem two_cell_mean_le_rms
    (w a b R : ℝ)
    (hw0 : 0 ≤ w) (hw1 : w ≤ 1)
    (ha : 0 ≤ a) (hb : 0 ≤ b) (hR : 0 ≤ R)
    (hvar : w * a^2 + (1-w) * b^2 ≤ R^2) :
    w*a + (1-w)*b ≤ R := by
  have hwc : 0 ≤ 1-w := sub_nonneg.mpr hw1
  have hmean : 0 ≤ w*a + (1-w)*b :=
    add_nonneg (mul_nonneg hw0 ha) (mul_nonneg hwc hb)
  have hprod : 0 ≤ w * (1-w) * (a-b)^2 :=
    mul_nonneg (mul_nonneg hw0 hwc) (sq_nonneg (a-b))
  have hjensen : (w*a + (1-w)*b)^2 ≤ w*a^2 + (1-w)*b^2 := by
    nlinarith
  nlinarith

/-- Scalar form of signed mean <= positive mean <= positive RMS <= bound. -/
theorem terminal_chain
    (deficit positiveMean variance bound : ℝ)
    (hpositive : 0 ≤ positiveMean) (hbound : 0 ≤ bound)
    (hsigned : deficit ≤ positiveMean)
    (hcauchy : positiveMean^2 ≤ variance)
    (hvariance : variance ≤ bound^2) :
    deficit ≤ bound := by
  have hsq : positiveMean^2 ≤ bound^2 := hcauchy.trans hvariance
  have hpb : positiveMean ≤ bound := by
    nlinarith
  exact hsigned.trans hpb

example
    (deficit positiveMean variance bound : ℝ)
    (hpositive : 0 ≤ positiveMean) (hbound : 0 ≤ bound)
    (hsigned : deficit ≤ positiveMean)
    (hcauchy : positiveMean^2 ≤ variance)
    (hvariance : variance ≤ bound^2) :
    deficit ≤ bound := by
  first
  | (rh_reduce 2 using [terminal_chain]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact terminal_chain deficit positiveMean variance bound
      hpositive hbound hsigned hcauchy hvariance

end RHMathPositiveMeanSquareTerminal

rh_scan RHMathPositiveMeanSquareTerminal.le_positive_part limit 2000
rh_scan RHMathPositiveMeanSquareTerminal.two_cell_mean_le_rms limit 2000
rh_scan RHMathPositiveMeanSquareTerminal.terminal_chain limit 2000
rh_prune RHMathPositiveMeanSquareTerminal.two_cell_mean_le_rms as RHPositiveL2TwoCellPruned
rh_prune RHMathPositiveMeanSquareTerminal.terminal_chain as RHPositiveL2TerminalPruned
#print axioms RHMathPositiveMeanSquareTerminal.le_positive_part
#print axioms RHMathPositiveMeanSquareTerminal.two_cell_mean_le_rms
#print axioms RHMathPositiveMeanSquareTerminal.terminal_chain
