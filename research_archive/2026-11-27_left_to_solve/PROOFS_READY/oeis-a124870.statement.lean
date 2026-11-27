import Mathlib

/-!
OEIS A124870, offset zero: denominator of Re((3i-1)^(-n)).
Source: https://oeis.org/A124870/internal
The rational quadratic algebra below has i^2=-1. Its element
(-1/10,-3/10) is exactly (3i-1)^(-1), so the definition uses the
source's real part and reduced positive denominator without approximation.
Both Colin Barker's July16,2019 conjectures are included. The generating
function is stated after multiplication by its denominator, whose constant
coefficient is one; this is equivalent to the displayed source quotient.
Sequence: Jonathan Vos Post. Credit: Cornelius Lytollis (@con123-gif),
assisted by ChatGPT.
-/
namespace OMA.S_oeis_a124870

abbrev QI := QuadraticAlgebra ℚ (-1) 0

def base : QI := ⟨-1 / 10, -3 / 10⟩

def a (n : ℕ) : ℕ := ((base ^ n).re).den

def series : PowerSeries ℚ := PowerSeries.mk fun n => (a n : ℚ)

theorem main :
    (∀ n : ℕ, 6 < n → a n = 2500 * a (n - 4)) ∧
    ((1 - PowerSeries.C 50 * PowerSeries.X ^ 2) *
      (1 + PowerSeries.C 50 * PowerSeries.X ^ 2)) * series =
        1 + PowerSeries.C 10 * PowerSeries.X + PowerSeries.C 25 * PowerSeries.X ^ 2 +
          PowerSeries.C 500 * PowerSeries.X ^ 3 - PowerSeries.C 31250 * PowerSeries.X ^ 6 := by
  sorry

end OMA.S_oeis_a124870
