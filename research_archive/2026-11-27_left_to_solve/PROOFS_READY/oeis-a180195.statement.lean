import Mathlib

/-!
OEIS A180195, recurrence conjectured by R. J. Mathar on July 24, 2022.
Source: https://oeis.org/A180195
The sequence has offset one. Its defining alternating sum is indexed
from one through n; the range sum below uses j+1 for that input.
The recurrence applies for n >= 4, so every referenced sequence term
is inside that offset. The same defining sum extends a(0) to zero.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/

namespace OMA.S_oeis_a180195

def b (n : ℕ) : ℤ :=
  (Nat.factorial (n - 1) : ℤ) * ((n : ℤ)^2 - (n : ℤ) + 1)

def a (n : ℕ) : ℤ :=
  (-1 : ℤ)^n * ∑ j ∈ Finset.range n, (-1 : ℤ)^(j + 1) * b (j + 1)

theorem main : ∀ n : ℕ, 4 ≤ n →
    a n + (-(n : ℤ) - 1) * a (n - 1) - 4 * a (n - 2) +
      ((n : ℤ) - 2) * a (n - 3) = 0 := by
  sorry

end OMA.S_oeis_a180195
