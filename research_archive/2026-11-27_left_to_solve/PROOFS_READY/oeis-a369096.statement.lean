import Mathlib

/-!
OEIS A369096, Claude H. R. Dequatre (2024), revision19.
Source: https://oeis.org/A369096 .
The sequence consists of integers k>=2 whose number of DISTINCT prime
divisors divides T(k)+T(k+1), with T(k)=k(k+1)/2.
The source conjecture concerns the proportion of primes among its terms
with value at most N, as in its displayed counting table, not the density
of all primes among all integers. Both counts below use this same cutoff.
Classical Chebyshev estimates, Euler's divergent prime-reciprocal sum and
Landau's semiprime counting theorem are prior mathematical background.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

namespace OMA.S_oeis_a369096

def triangular (k : ℕ) : ℕ := k * (k + 1) / 2

def member (k : ℕ) : Prop :=
  2 ≤ k ∧ k.primeFactors.card ∣ triangular k + triangular (k + 1)

noncomputable def count (N : ℕ) : ℕ := by
  classical
  exact ((Finset.Icc 2 N).filter member).card

theorem main :
    Filter.Tendsto (fun N : ℕ =>
      (Nat.primeCounting N : ℝ) / (count N : ℝ))
      Filter.atTop (nhds 0) := by
  sorry

end OMA.S_oeis_a369096
