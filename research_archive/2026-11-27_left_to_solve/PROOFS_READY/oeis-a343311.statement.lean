import Mathlib

/-!
OEIS A343311: Robert Israel's April12,2021 conjecture, offset one.
Source: https://oeis.org/A343311/internal
Membership means a sum of three pairwise distinct positive integers whose
product is divisible by their sum. The statement includes both directions
and all four exceptional composite numbers. Composite means greater than
one and not prime. Source authors Wesley Ivan Hurt and Robert Israel.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-/
namespace OMA.S_oeis_a343311

def represented (n : ℕ) : Prop :=
  ∃ x y z : ℕ, 0 < x ∧ 0 < y ∧ 0 < z ∧
    x ≠ y ∧ x ≠ z ∧ y ≠ z ∧ x + y + z = n ∧ n ∣ x * y * z

theorem main : ∀ n : ℕ,
    represented n ↔
      1 < n ∧ ¬ Nat.Prime n ∧ n ≠ 4 ∧ n ≠ 8 ∧ n ≠ 9 ∧ n ≠ 25 := by
  sorry

end OMA.S_oeis_a343311
