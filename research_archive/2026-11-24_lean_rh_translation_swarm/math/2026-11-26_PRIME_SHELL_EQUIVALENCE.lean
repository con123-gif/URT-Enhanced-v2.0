import Mathlib
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 2, 26 November 2026.  Scalar certificate for the exact equivalence
between the prime-only dyadic lower bound and the centered von Mangoldt shell
at exponent `1/2 + epsilon`.

The number-theoretic grouping and monotone-sum arguments are recorded in the
companion note.  This file kernel-checks the final cancellation/constant
transfer once those two elementary bounds are supplied.  It imports no RH
theorem and proves neither shell bound.

PREPARED / NOT COMPILED locally.
-/

namespace RHMathPrimeShellEquivalence

/-- If the deterministic shell is at most its main term plus one and the
higher-prime-power correction is nonnegative, the prime lower bound implies
the centered von Mangoldt-shell lower bound. -/
theorem prime_lower_implies_shell_lower
    (P Q S B main C E : ℝ)
    (hB : B = P + Q - S)
    (hQ : 0 ≤ Q)
    (hS : S ≤ main + 1)
    (hP : main - C * E ≤ P) :
    -C * E - 1 ≤ B := by
  rw [hB]
  linarith

/-- The reverse transfer.  If the correction is at most `A*E` and `E≥1`,
then the shell lower bound implies a prime-only bound with the explicit
constant `C+A+1`. -/
theorem shell_lower_implies_prime_lower
    (P Q S B main C A E : ℝ)
    (hB : B = P + Q - S)
    (hS : main - 1 ≤ S)
    (hQ : Q ≤ A * E)
    (hE : 1 ≤ E)
    (hShell : -C * E ≤ B) :
    main - (C + A + 1) * E ≤ P := by
  rw [hB] at hShell
  nlinarith

/-- Aggregation used for higher prime powers: if each prime's entire tower
contributes at most `L` and at most `X` primes occur, the total is at most
`X*L`. -/
theorem grouped_correction_bound
    {I : Type} [DecidableEq I]
    (s : Finset I) (tower : I → ℝ) (L X : ℝ)
    (hL : 0 ≤ L)
    (htower : ∀ i ∈ s, tower i ≤ L)
    (hcard : (s.card : ℝ) ≤ X) :
    ∑ i ∈ s, tower i ≤ X * L := by
  calc
    ∑ i ∈ s, tower i ≤ ∑ _i ∈ s, L :=
      Finset.sum_le_sum fun i hi ⇒ htower i hi
    _ = (s.card : ℝ) * L := by simp
    _ ≤ X * L := mul_le_mul_of_nonneg_right hcard hL

example
    (P Q S B main C E : ℝ)
    (hB : B = P + Q - S) (hQ : 0 ≤ Q)
    (hS : S ≤ main + 1) (hP : main - C * E ≤ P) :
    -C * E - 1 ≤ B := by
  first
  | (rh_reduce 2 using [prime_lower_implies_shell_lower]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact prime_lower_implies_shell_lower P Q S B main C E hB hQ hS hP

end RHMathPrimeShellEquivalence

rh_scan RHMathPrimeShellEquivalence.prime_lower_implies_shell_lower limit 2000
rh_scan RHMathPrimeShellEquivalence.shell_lower_implies_prime_lower limit 2000
rh_scan RHMathPrimeShellEquivalence.grouped_correction_bound limit 2000
rh_prune RHMathPrimeShellEquivalence.prime_lower_implies_shell_lower as RHMathPrimeShellForwardPruned
rh_prune RHMathPrimeShellEquivalence.shell_lower_implies_prime_lower as RHMathPrimeShellReversePruned
#print axioms RHMathPrimeShellEquivalence.prime_lower_implies_shell_lower
#print axioms RHMathPrimeShellEquivalence.shell_lower_implies_prime_lower
#print axioms RHMathPrimeShellEquivalence.grouped_correction_bound

