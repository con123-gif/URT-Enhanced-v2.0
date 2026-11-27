import Mathlib

/-!
OEIS A081670: a(n)=3^n-1+binomial(2n,n), offset zero.
Source: https://oeis.org/A081670
R. J. Mathar's November12,2012 conjectured recurrence is stated for n>=3,
so all four terms lie in the source domain. Integer arithmetic preserves
its signed coefficients. The sequence is due to Paul Barry.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/
namespace OMA.S_oeis_a081670

def a (n : ℕ) : ℤ := (3 : ℤ) ^ n - 1 + (n.centralBinom : ℤ)

theorem main : ∀ n : ℕ, 3 ≤ n →
    (n : ℤ) * (3 * (n : ℤ) ^ 2 - 17 * (n : ℤ) + 26) * a n +
      2 * (-12 * (n : ℤ) ^ 3 + 71 * (n : ℤ) ^ 2 - 131 * (n : ℤ) + 60) * a (n - 1) +
      (57 * (n : ℤ) ^ 3 - 347 * (n : ℤ) ^ 2 + 710 * (n : ℤ) - 480) * a (n - 2) -
      6 * (2 * (n : ℤ) - 5) * (3 * (n : ℤ) ^ 2 - 11 * (n : ℤ) + 12) * a (n - 3) = 0 := by
  sorry

end OMA.S_oeis_a081670
