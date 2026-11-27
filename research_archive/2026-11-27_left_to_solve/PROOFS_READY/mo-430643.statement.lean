import Mathlib

/-
Source: Pablo Spiga, MathOverflow question 430643, September 17, 2022.
https://mathoverflow.net/questions/430643
Question text licensed CC BY-SA 4.0.
Adaptation: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).

A finite set encodes the distinct primes p_1,...,p_ell; its cardinality
is ell. The natural number a p is the prime-factor multiplicity, at least
two at each prime in the set. The product defining r uses natural powers.
Both powers displayed in the inequality use real exponents, including
the division by four. The logarithm has base two. No bound on the number
or sizes of the distinct primes or their multiplicities is imposed.
The empty set gives r=1 and the valid inequality 1<=1.
-/

namespace OMA.S_mo_430643

open scoped BigOperators

def number (s : Finset ℕ) (a : ℕ → ℕ) : ℕ := ∏ p ∈ s, p ^ a p

theorem main : ∀ s : Finset ℕ, ∀ a : ℕ → ℕ,
    (∀ p ∈ s, Nat.Prime p ∧ 2 ≤ a p) →
    number s a ≠ 36 → number s a ≠ 72 → number s a ≠ 900 →
    (∏ p ∈ s, (p : ℝ) ^ ((a p : ℝ) ^ 2 / 4)) ≤
      (number s a : ℝ) ^
        (Real.logb 2 (number s a : ℝ) / 4 + 1 - (s.card : ℝ)) := by
  sorry

end OMA.S_mo_430643
