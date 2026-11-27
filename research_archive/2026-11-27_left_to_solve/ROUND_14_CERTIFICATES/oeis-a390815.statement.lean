import Mathlib

/-!
# A390815: reduced denominators of factorial divided by divisor sum

Source: https://oeis.org/A390815, Claude H. R. Dequatre, February 17, 2026.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).

The first assertion includes every positive input, retaining only denominators
greater than one exactly as in the sequence definition. For a positive divisor
sum, sigma/gcd(sigma,n!) is the reduced positive denominator of n!/sigma(n).
The second assertion is the separate conjecture for n>=4, with the source's
ordinary positive-divisor sum and an integer square in the natural numbers.
-/

namespace OMA.S_oeis_a390815

def reducedDen (n : ℕ) : ℕ :=
  ArithmeticFunction.sigma 1 n /
    Nat.gcd (ArithmeticFunction.sigma 1 n) n.factorial

theorem main :
    (∀ n : ℕ, 0 < n → 1 < reducedDen n → (reducedDen n).Prime) ∧
    (∀ n : ℕ, 4 ≤ n → ¬ ArithmeticFunction.sigma 1 n ∣ n.factorial →
      ∃ k : ℕ, n = k ^ 2) := by
  sorry

end OMA.S_oeis_a390815
