import Mathlib

/-!
Independent edge audit for the checked OEIS A124869/A124870 proof candidates.

The sequence is defined from the source formula, not from either conjectured recurrence:
`base = (3*i - 1)⁻¹ = (-1 - 3*i)/10`, represented in `ℚ[i]`.
The two theorems below show that the strict lower bounds in the official statement
candidates are sharp at the immediately preceding indices and that the recurrences
hold at the first admitted indices.
-/

namespace LeftToSolve.Algebra.A124BoundaryAudit

abbrev QI := QuadraticAlgebra ℚ (-1) 0

def base : QI := ⟨-1 / 10, -3 / 10⟩

def numerator (n : ℕ) : ℤ := ((base ^ n).re).num

def denominator (n : ℕ) : ℕ := ((base ^ n).re).den

theorem a124869_boundary_is_sharp :
    numerator 10 = 779 ∧
    14 * numerator 6 - 625 * numerator 2 = 1404 ∧
    numerator 10 - (14 * numerator 6 - 625 * numerator 2) = -625 ∧
    numerator 11 = 14 * numerator 7 - 625 * numerator 3 := by
  norm_num [numerator, base, pow_succ, QuadraticAlgebra.re_mul,
    QuadraticAlgebra.im_mul, QuadraticAlgebra.re_one, QuadraticAlgebra.im_one]

theorem a124870_boundary_is_sharp :
    denominator 6 = 31250 ∧
    2500 * denominator 2 = 62500 ∧
    (denominator 6 : ℤ) - 2500 * (denominator 2 : ℤ) = -31250 ∧
    denominator 7 = 2500 * denominator 3 := by
  norm_num [denominator, base, pow_succ, QuadraticAlgebra.re_mul,
    QuadraticAlgebra.im_mul, QuadraticAlgebra.re_one, QuadraticAlgebra.im_one]

end LeftToSolve.Algebra.A124BoundaryAudit

#print axioms LeftToSolve.Algebra.A124BoundaryAudit.a124869_boundary_is_sharp
#print axioms LeftToSolve.Algebra.A124BoundaryAudit.a124870_boundary_is_sharp
