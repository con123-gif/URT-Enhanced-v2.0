import Mathlib

/-!
# An arithmetic inequality

Source: https://mathoverflow.net/questions/430643/an-arithmetic-inequality
Asked by Pablo Spiga, 17 September 2022.
Formalization: @AminAhantab.

The finite set `s` consists of the distinct prime factors; `a p` is the
natural-number exponent of `p`. Thus `s.card` is the source's `ℓ`.
Both displayed powers in the inequality are real powers. The three excluded
integers and the lower bound of two on every exponent are exactly as in the source.
-/

namespace OMA.S_mo_430643

theorem main : ∀ (s : Finset ℕ) (a : ℕ → ℕ) (r : ℕ),
    (∀ p ∈ s, Nat.Prime p) →
    (∀ p ∈ s, 2 ≤ a p) →
    r = (∏ p ∈ s, p ^ a p) →
    r ∉ ({36, 72, 900} : Finset ℕ) →
    (∏ p ∈ s, (p : ℝ) ^ ((a p : ℝ) ^ 2 / 4)) ≤
      (r : ℝ) ^ (Real.logb 2 (r : ℝ) / 4 + 1 - (s.card : ℝ)) := by
  sorry

end OMA.S_mo_430643

