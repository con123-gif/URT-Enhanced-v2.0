import Mathlib

/-!
OEIS A052204: a(n)=(5n+1)*binomial(4n,n)/(3n+1), offset zero.
Source: https://oeis.org/A052204
R. J. Mathar's September29,2012 conjectured recurrence is stated for n>=2,
so all three terms lie in the source domain. Rational arithmetic makes
the source quotient exact. The closed form and sequence of Barry E.
Williams are prior mathematics.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/
namespace OMA.S_oeis_a052204

def a (n : ℕ) : ℚ :=
  (5 * (n : ℚ) + 1) * ((4 * n).choose n : ℚ) / (3 * (n : ℚ) + 1)

theorem main : ∀ n : ℕ, 2 ≤ n →
    6 * (n : ℚ) * (3 * (n : ℚ) - 1) * (3 * (n : ℚ) + 1) * a n +
      (-809 * (n : ℚ) ^ 3 + 1444 * (n : ℚ) ^ 2 - 1505 * (n : ℚ) + 582) * a (n - 1) +
      88 * (4 * (n : ℚ) - 5) * (4 * (n : ℚ) - 7) * (2 * (n : ℚ) - 3) * a (n - 2) = 0 := by
  sorry

end OMA.S_oeis_a052204
