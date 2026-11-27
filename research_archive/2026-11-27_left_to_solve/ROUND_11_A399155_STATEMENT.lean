import Mathlib

/-!
OEIS A399155, conjectured by Jaylen Dilkhush in 2026.
Source: https://oeis.org/A399155
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.

For an input at least two, count the subtractions needed to reach zero,
using either the smallest or greatest prime factor of the current value.
The conjecture says that the greatest-factor rule takes no more steps.
The auxiliary fuel is the starting value: every nonterminal subtraction
decreases the value by at least one, so this covers the entire trajectory.
The unused convention at one subtracts one. A trajectory starting above
one cannot reach one, because its subtracted prime divides its input.
-/

namespace OMA.S_oeis_a399155

def greatestPrimeFactor (n : ℕ) : ℕ :=
  if n = 1 then 1 else n.primeFactorsList.getLastI

def steps (factor : ℕ → ℕ) : ℕ → ℕ → ℕ
  | 0, _ => 0
  | fuel + 1, n => if n = 0 then 0 else 1 + steps factor fuel (n - factor n)

def smallestSteps (n : ℕ) : ℕ := steps Nat.minFac n n
def largestSteps (n : ℕ) : ℕ := steps greatestPrimeFactor n n

theorem main : ∀ n : ℕ, 2 ≤ n → largestSteps n ≤ smallestSteps n := by
  sorry

end OMA.S_oeis_a399155
