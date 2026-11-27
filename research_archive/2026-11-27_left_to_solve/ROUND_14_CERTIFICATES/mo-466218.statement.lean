import Mathlib

/-!
# Nonnegative diagonal of the difference between a resolvent and its square

Source: user133281, MathOverflow question 466218.
https://mathoverflow.net/questions/466218
Original question text: CC BY-SA 4.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
The generator has strictly positive off-diagonal entries and zero row sums.
The rate is positive. No stochasticity or invertibility hypothesis is added.
-/

namespace OMA.S_mo_466218

open scoped BigOperators

noncomputable def resolvent {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) (t : ℝ) :
    Matrix (Fin n) (Fin n) ℝ := t • (t • 1 - A)⁻¹

theorem main : ∀ n : ℕ, ∀ A : Matrix (Fin n) (Fin n) ℝ,
    (∀ i j, i ≠ j → 0 < A i j) → (∀ i, ∑ j, A i j = 0) →
    ∀ t : ℝ, 0 < t → ∀ i,
      0 ≤ (resolvent A t - (resolvent A t) ^ 2) i i := by
  sorry

end OMA.S_mo_466218
