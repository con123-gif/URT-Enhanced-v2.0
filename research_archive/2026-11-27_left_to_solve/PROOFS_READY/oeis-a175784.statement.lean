import Mathlib

/-!
OEIS A175784, conjectures by R. J. Mathar, December7,2010.
Source: https://oeis.org/A175784
The offset is one. Numerator means the reduced rational numerator.
A060791(m) is m/gcd(m,5). The series begins at n=1, so its constant
coefficient is zero despite the natural rational-formula extension a(0)=8.
The recurrence starts at11 so that all terms respect the source offset.
All three asserted components, including the complete generating
function, are stated below. Credit: Cornelius Lytollis (@con123-gif),
assisted by ChatGPT.
-/

namespace OMA.S_oeis_a175784

def q (n : ℕ) : ℚ := (2 * (n : ℚ) - 1) / (2 * (n : ℚ) + 9) + 1

def a (n : ℕ) : ℤ := (q n).num

noncomputable def series : PowerSeries ℚ :=
  PowerSeries.mk (fun n => if n = 0 then 0 else (a n : ℚ))

open PowerSeries

theorem main :
    (∀ n : ℕ, 1 ≤ n →
      a n = 4 * (((n + 2) / Nat.gcd (n + 2) 5 : ℕ) : ℤ)) ∧
    (∀ n : ℕ, 11 ≤ n → a n = 2 * a (n - 5) - a (n - 10)) ∧
    series * ((X - 1)^2 * (X^4 + X^3 + X^2 + X + 1)^2) =
      -4 * X * (-3 - 4*X - X^2 - 6*X^3 - 7*X^4 - 2*X^5 - X^6 + X^8 + 2*X^9) := by
  sorry

end OMA.S_oeis_a175784
