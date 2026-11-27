import Mathlib

/-!
OEIS A396949, Hinako Tsutsumi (June 2026).  The source conjectures that the
number of positive integers n <= N satisfying omega(n) + Omega(n) = sopf(n)
is Theta((log N)^3).  All three arithmetic functions below are read directly
from the unique prime factorization: support cardinality, sum of exponents,
and sum of the distinct primes, respectively.  In particular, 1 is included.

Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
Source: https://oeis.org/A396949
-/

namespace OMA.S_oeis_a396949

def member (n : ℕ) : Prop :=
  n.factorization.support.card +
    (∑ p ∈ n.factorization.support, n.factorization p) =
    ∑ p ∈ n.factorization.support, p

noncomputable def count (N : ℕ) : ℕ := by
  classical
  exact ((Finset.range (N + 1)).filter fun n => 0 < n ∧ member n).card

def conjecture : Prop :=
  Asymptotics.IsTheta Filter.atTop (fun N : ℕ => (count N : ℝ))
    (fun N : ℕ => (Real.log N) ^ 3)

theorem main : conjecture := by
  sorry

end OMA.S_oeis_a396949
