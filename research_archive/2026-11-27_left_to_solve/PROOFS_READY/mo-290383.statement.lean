import Mathlib

/-!
# Nonnegative differences with half the rank

Source: Turbo, MathOverflow question 290383, January 10, 2018.
https://mathoverflow.net/questions/290383
Original question text: CC BY-SA 3.0.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
The source asks whether every nonnegative rational square matrix of rank 2r
can be expressed as the difference of two nonnegative rational square matrices
of rank at most r. All natural matrix sizes and rank halves r are quantified, including r = 0.
-/

namespace OMA.S_mo_290383

def Nonnegative {n : ℕ} (M : Matrix (Fin n) (Fin n) ℚ) : Prop :=
  ∀ i j, 0 ≤ M i j

theorem main : ∀ n r : ℕ,
    ∀ M : Matrix (Fin n) (Fin n) ℚ,
      Nonnegative M → M.rank = 2 * r →
      ∃ P Q : Matrix (Fin n) (Fin n) ℚ,
        Nonnegative P ∧ Nonnegative Q ∧ P.rank ≤ r ∧ Q.rank ≤ r ∧ M = P - Q := by
  sorry

end OMA.S_mo_290383
