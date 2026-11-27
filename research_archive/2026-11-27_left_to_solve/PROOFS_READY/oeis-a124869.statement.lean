import Mathlib

/-!
OEIS A124869, offset zero: numerator of Re((3i-1)^(-n)).
Source: https://oeis.org/A124869/internal
The quadratic algebra below has i^2=-1 and its base is the exact rational
Cartesian reciprocal (-1-3i)/10. Rat.num is the reduced signed numerator.
Both Colin Barker July16,2019 conjectures are included. The generating
function is multiplied by its source denominator, a unit with constant one.
The older displayed Jovovic2007 generating function describes the rational
real values, as its fractional coefficients show; the target below is the
separately conjectured generating function of the integer numerators.
Sequence: Jonathan Vos Post. Credit: Cornelius Lytollis (@con123-gif),
assisted by ChatGPT.
-/
namespace OMA.S_oeis_a124869

abbrev QI := QuadraticAlgebra ℚ (-1) 0

def base : QI := ⟨-1 / 10, -3 / 10⟩

def a (n : ℕ) : ℤ := ((base ^ n).re).num

def series : PowerSeries ℚ := PowerSeries.mk fun n => (a n : ℚ)

theorem main :
    (∀ n : ℕ, 10 < n → a n = 14 * a (n - 4) - 625 * a (n - 8)) ∧
    ((1 - PowerSeries.C 8 * PowerSeries.X ^ 2 + PowerSeries.C 25 * PowerSeries.X ^ 4) *
      (1 + PowerSeries.C 8 * PowerSeries.X ^ 2 + PowerSeries.C 25 * PowerSeries.X ^ 4)) * series =
        1 - PowerSeries.X - PowerSeries.C 2 * PowerSeries.X ^ 2 +
          PowerSeries.C 13 * PowerSeries.X ^ 3 - PowerSeries.C 7 * PowerSeries.X ^ 4 -
          PowerSeries.C 65 * PowerSeries.X ^ 5 + PowerSeries.C 39 * PowerSeries.X ^ 6 +
          PowerSeries.C 125 * PowerSeries.X ^ 7 - PowerSeries.C 625 * PowerSeries.X ^ 10 := by
  sorry

end OMA.S_oeis_a124869
