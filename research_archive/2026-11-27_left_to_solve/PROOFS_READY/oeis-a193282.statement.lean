import Mathlib

/-!
OEIS A193282: a(n)=(n!/floor(n/2)!)^2, offset zero.
Source: https://oeis.org/A193282
R. J. Mathar's October3,2014 conjectured recurrence is stated for n>=4,
so all five sequence terms lie in the source domain. The quotient is
computed exactly in the rationals. The sequence is due to Peter Luschny.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/
namespace OMA.S_oeis_a193282

def a (n : ℕ) : ℚ := ((n.factorial : ℚ) / ((n / 2).factorial : ℚ)) ^ 2

theorem main : ∀ n : ℕ, 4 ≤ n →
    a n + 8 * a (n - 1) - 4 * ((n : ℚ) - 2) * ((n : ℚ) + 2) * a (n - 2) +
      16 * (-2 * (n : ℚ) ^ 2 + 6 * (n : ℚ) - 3) * a (n - 3) -
      64 * ((n : ℚ) - 3) ^ 2 * a (n - 4) = 0 := by
  sorry

end OMA.S_oeis_a193282
