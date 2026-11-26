import Mathlib
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 2, 26 November 2026. PREPARED / NOT COMPILED locally.

Scalar certificate for extracting a fixed multiplicative good block from a
bounded number of bad prime terminals.  The companion note supplies the finite
pigeonhole and Bertrand steps.  This file records the exact relative-gap and
subinterval logic.  It imports no RH theorem.
-/

namespace RHMathAggregateBadBlock

/-- Convert the logarithmic gap obtained in the source interval into a gap
relative to its (possibly later) left endpoint. -/
theorem relative_gap_from_source
    (A M logX logY gap : ℝ)
    (hA : 1 ≤ A) (hM : 0 ≤ M)
    (hY : logY ≤ A * logX)
    (hgap : (A-1) * logX / (M+1) ≤ gap) :
    ((A-1) / (A*(M+1))) * logY ≤ gap := by
  have hApos : 0 < A := lt_of_lt_of_le zero_lt_one hA
  have hMpos : 0 < M+1 := by linarith
  have hden : 0 < A*(M+1) := mul_pos hApos hMpos
  have hcoef : 0 ≤ (A-1) / (A*(M+1)) :=
    div_nonneg (sub_nonneg.mpr hA) hden.le
  calc
    ((A-1) / (A*(M+1))) * logY
        ≤ ((A-1) / (A*(M+1))) * (A*logX) :=
          mul_le_mul_of_nonneg_left hY hcoef
    _ = (A-1) * logX / (M+1) := by
          field_simp [ne_of_gt hApos, ne_of_gt hMpos]
          <;> ring
    _ ≤ gap := hgap

/-- Reserving half of the relative logarithmic gap leaves an equal half for
the final-prime buffer. -/
theorem half_gap_reserve
    (eta delta logY logR : ℝ)
    (hdelta : eta = 2*delta)
    (hgap : eta*logY ≤ logR-logY) :
    (1+2*delta)*logY ≤ logR := by
  rw [hdelta] at hgap
  linarith

/-- A factor-three reserve places the Bertrand prime strictly before the next
bad terminal. -/
theorem three_factor_reserve
    (Ydelta Z R : ℝ)
    (hY : 3 < Ydelta) (hZ : 0 < Z)
    (hpow : Ydelta*Z ≤ R) :
    3*Z < R := by
  exact (mul_lt_mul_of_pos_right hY hZ).trans_le hpow

/-- If the next prime after the target endpoint lies in a bad-free interval,
then every earlier terminal needed by the transfer is good. -/
theorem bad_free_terminal_subinterval
    (bad : ℝ → Prop) (Y R pplus : ℝ)
    (hnone : ∀ p, Y < p → p < R → ¬ bad p)
    (hpY : Y < pplus) (hpR : pplus < R) :
    ∀ p, Y < p → p ≤ pplus → ¬ bad p := by
  intro p hYp hpp
  exact hnone p hYp (lt_of_le_of_lt hpp hpR)

example
    (eta delta logY logR : ℝ)
    (hdelta : eta = 2*delta)
    (hgap : eta*logY ≤ logR-logY) :
    (1+2*delta)*logY ≤ logR := by
  first
  | (rh_reduce 2 using [half_gap_reserve]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact half_gap_reserve eta delta logY logR hdelta hgap

end RHMathAggregateBadBlock

rh_scan RHMathAggregateBadBlock.relative_gap_from_source limit 2000
rh_scan RHMathAggregateBadBlock.half_gap_reserve limit 2000
rh_scan RHMathAggregateBadBlock.three_factor_reserve limit 2000
rh_scan RHMathAggregateBadBlock.bad_free_terminal_subinterval limit 2000
rh_prune RHMathAggregateBadBlock.relative_gap_from_source as RHAggregateRelativeGapPruned
rh_prune RHMathAggregateBadBlock.bad_free_terminal_subinterval as RHAggregateBadFreePruned
#print axioms RHMathAggregateBadBlock.relative_gap_from_source
#print axioms RHMathAggregateBadBlock.half_gap_reserve
#print axioms RHMathAggregateBadBlock.three_factor_reserve
#print axioms RHMathAggregateBadBlock.bad_free_terminal_subinterval
