import Mathlib

/-!
Independent boundary audit for OEIS A175784.

Source statement: `statements/oeis-a175784.lean` in
GuillaumeBAUD-coder/open-math-agents, merged by PR #7931.
The definitions below are copied verbatim from that registered statement.
They do not define the sequence by the recurrence under audit.
-/

namespace A175784RecurrenceBoundary

def q (n : ℕ) : ℚ := (2 * (n : ℚ) - 1) / (2 * (n : ℚ) + 9) + 1

def a (n : ℕ) : ℤ := (q n).num

theorem exact_values :
    a 0 = 8 ∧ a 4 = 24 ∧ a 5 = 28 ∧ a 9 = 44 ∧ a 10 = 48 := by
  norm_num [a, q]

theorem recurrence_at_ten :
    a 10 = 2 * a (10 - 5) - a (10 - 10) := by
  norm_num [a, q]

theorem recurrence_fails_at_nine :
    a 9 ≠ 2 * a (9 - 5) - a (9 - 10) := by
  norm_num [a, q]

#print axioms exact_values
#print axioms recurrence_at_ten
#print axioms recurrence_fails_at_nine

end A175784RecurrenceBoundary
