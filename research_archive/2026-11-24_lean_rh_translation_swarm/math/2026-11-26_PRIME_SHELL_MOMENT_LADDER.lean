import Mathlib
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 2, 26 November 2026. PREPARED / NOT COMPILED locally.

Exact exponent arithmetic for the positive-moment prime-shell ladder.  The
analytic affine-envelope argument is in the companion note.  No RH theorem is
imported.
-/

namespace RHMathPrimeShellMomentLadder

/-- The exponent delivered by an r-th moment of square-root scale is exactly
one half plus 1/(2(r+1)). -/
theorem moment_exponent_identity (r : ℝ) (hr : r + 1 ≠ 0) :
    (1 + r / 2) / (r + 1) = 1 / 2 + 1 / (2 * (r + 1)) := by
  field_simp
  ring

/-- The exact condition under which the residual moment exponent lies below
the requested epsilon. -/
theorem moment_gap_below_epsilon
    (r epsilon eta : ℝ)
    (hr : 0 < r + 1)
    (hgap : 1 / 2 + eta < epsilon * (r + 1)) :
    1 / 2 + (1 / 2 + eta) / (r + 1) < 1 / 2 + epsilon := by
  have hdiv : (1 / 2 + eta) / (r + 1) < epsilon :=
    (div_lt_iff₀ hr).2 hgap
  linarith

/-- Scalar caller bridge.  `hroot` is the standard monotonicity of the
(r+1)-st power on nonnegative reals, kept explicit until the generic
natural-power declaration is replayed in the native toolchain. -/
theorem moment_host_closure
    (h B hostMoment : ℝ) (r : ℕ)
    (hspike : h ^ (r + 1) ≤ hostMoment)
    (hhost : hostMoment ≤ B ^ (r + 1))
    (hroot : h ^ (r + 1) ≤ B ^ (r + 1) → h ≤ B) :
    h ≤ B := by
  exact hroot (hspike.trans hhost)

example
    (h B hostMoment : ℝ) (r : ℕ)
    (hspike : h ^ (r + 1) ≤ hostMoment)
    (hhost : hostMoment ≤ B ^ (r + 1))
    (hroot : h ^ (r + 1) ≤ B ^ (r + 1) → h ≤ B) :
    h ≤ B := by
  first
  | (rh_reduce 2 using [moment_host_closure]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact moment_host_closure h B hostMoment r hspike hhost hroot

end RHMathPrimeShellMomentLadder

rh_scan RHMathPrimeShellMomentLadder.moment_exponent_identity limit 2000
rh_scan RHMathPrimeShellMomentLadder.moment_gap_below_epsilon limit 2000
rh_scan RHMathPrimeShellMomentLadder.moment_host_closure limit 2000
rh_prune RHMathPrimeShellMomentLadder.moment_exponent_identity as RHPrimeMomentExponentPruned
rh_prune RHMathPrimeShellMomentLadder.moment_gap_below_epsilon as RHPrimeMomentGapPruned
rh_prune RHMathPrimeShellMomentLadder.moment_host_closure as RHPrimeMomentHostPruned
#print axioms RHMathPrimeShellMomentLadder.moment_exponent_identity
#print axioms RHMathPrimeShellMomentLadder.moment_gap_below_epsilon
#print axioms RHMathPrimeShellMomentLadder.moment_host_closure
