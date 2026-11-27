import Mathlib

/-!
OEIS A079269, offset one. Leroy Quet's numerator recurrence.
Source: https://oeis.org/A079269/internal
The rational iteration below begins at index zero; a n shifts it by one
to retain the source indexing a 1 = 1. Rat.num is the reduced numerator.
The two divisions by 2 in the conjecture are rational divisions: the
separate summands need not be integers. No recurrence is used to define a.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/
namespace OMA.S_oeis_a079269

def iterate : ℕ → ℚ
  | 0 => 1
  | n + 1 => iterate n + 1 / (1 + 1 / iterate n)

def a (n : ℕ) : ℤ := (iterate (n - 1)).num

theorem main : ∀ m : ℕ, 2 ≤ m →
    (a (m + 1) : ℚ) = (a m : ℚ) ^ 2 +
      (a m : ℚ) ^ 3 / (2 * (a (m - 1) : ℚ) ^ 2) -
      (a m : ℚ) * (a (m - 1) : ℚ) ^ 2 / 2 := by
  sorry

end OMA.S_oeis_a079269
