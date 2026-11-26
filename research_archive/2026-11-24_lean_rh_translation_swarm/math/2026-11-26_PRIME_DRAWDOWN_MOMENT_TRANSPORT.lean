import Mathlib
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 2, 26 November 2026. PREPARED / NOT COMPILED locally.

Scalar pieces of the Chebyshev-drawdown moment transport.  The companion note
proves the Stieltjes/layer-cake identity and the continuous Fubini estimate.
No RH theorem is imported.
-/

namespace RHMathPrimeDrawdownMomentTransport

/-- Two-stage Jensen: a probability-weighted signed mean costs no more than
the same positive r-moment. -/
theorem two_cell_positive_moment
    (a b w : ℝ) (r : ℕ)
    (hr : 1 ≤ r) (hw0 : 0 ≤ w) (hw1 : w ≤ 1) :
    max (w * a + (1 - w) * b) 0 ^ r
      ≤ w * (max a 0) ^ r + (1 - w) * (max b 0) ^ r := by
  have hconvex : ConvexOn ℝ (Set.Ici 0) (fun x : ℝ => x ^ r) :=
    convexOn_pow hr
  have hpos :
      max (w * a + (1 - w) * b) 0
        ≤ w * max a 0 + (1 - w) * max b 0 := by
    rcases le_total (w * a + (1 - w) * b) 0 with h | h
    · simp [max_eq_right h, mul_nonneg hw0 (le_max_right _ _),
        mul_nonneg (sub_nonneg.mpr hw1) (le_max_right _ _)]
    · rw [max_eq_left h]
      exact add_le_add (mul_le_mul_of_nonneg_left (le_max_left _ _) hw0)
        (mul_le_mul_of_nonneg_left (le_max_left _ _) (sub_nonneg.mpr hw1))
  have hmono := pow_le_pow_left₀ (by positivity) hpos r
  calc
    max (w * a + (1 - w) * b) 0 ^ r
        ≤ (w * max a 0 + (1 - w) * max b 0) ^ r := hmono
    _ ≤ w * (max a 0) ^ r + (1 - w) * (max b 0) ^ r := by
      simpa [add_comm] using
        hconvex (le_max_right _ _) (le_max_right _ _) hw0 hw1

/-- The elementary absolute-moment transport coefficient obtained after
Jensen and Fubini. -/
theorem absolute_transport_coefficient (r : ℕ) :
    (2 : ℝ) ^ (r - 1) * (1 + 3 / 2)
      = (5 / 2 : ℝ) * (2 : ℝ) ^ (r - 1) := by
  ring

/-- Caller composition with the moment-maximal inequality. -/
theorem drawdown_to_terminal
    (h L shellMoment drawdownMoment : ℝ) (r : ℕ)
    (hL : 0 ≤ L)
    (hmax : h ^ (r + 1) ≤ (r + 1) * L * shellMoment)
    (htransport : shellMoment ≤ drawdownMoment) :
    h ^ (r + 1) ≤ (r + 1) * L * drawdownMoment := by
  exact hmax.trans (mul_le_mul_of_nonneg_left htransport
    (mul_nonneg (Nat.cast_nonneg _) hL))

end RHMathPrimeDrawdownMomentTransport

rh_scan RHMathPrimeDrawdownMomentTransport.two_cell_positive_moment limit 2000
rh_scan RHMathPrimeDrawdownMomentTransport.absolute_transport_coefficient limit 2000
rh_scan RHMathPrimeDrawdownMomentTransport.drawdown_to_terminal limit 2000
rh_prune RHMathPrimeDrawdownMomentTransport.two_cell_positive_moment as RHPrimeDrawdownJensenPruned
rh_prune RHMathPrimeDrawdownMomentTransport.drawdown_to_terminal as RHPrimeDrawdownTerminalPruned
#print axioms RHMathPrimeDrawdownMomentTransport.two_cell_positive_moment
#print axioms RHMathPrimeDrawdownMomentTransport.absolute_transport_coefficient
#print axioms RHMathPrimeDrawdownMomentTransport.drawdown_to_terminal
