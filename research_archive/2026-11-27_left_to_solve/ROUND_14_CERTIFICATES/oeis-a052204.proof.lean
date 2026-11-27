import OMAStatements.S_oeis_a052204
import Mathlib

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- A factorial-ratio identity followed by exact algebraic cancellation.

namespace A052204Certificate
open OMA.S_oeis_a052204

lemma first_step (k : ℕ) :
    3 * ((k : ℚ) + 1) * (5 * (k : ℚ) + 1) *
        (3 * (k : ℚ) + 2) * (3 * (k : ℚ) + 4) * a (k + 1) =
      8 * (5 * (k : ℚ) + 6) * (4 * (k : ℚ) + 3) *
        (2 * (k : ℚ) + 1) * (4 * (k : ℚ) + 1) * a k := by
  unfold a
  rw [Nat.cast_choose ℚ (show k + 1 ≤ 4 * (k + 1) by omega),
    Nat.cast_choose ℚ (show k ≤ 4 * k by omega)]
  rw [show 4 * (k + 1) - (k + 1) = 3 * (k + 1) by omega,
    show 4 * k - k = 3 * k by omega]
  have hF4 : (4 * (k + 1)).factorial =
      (4 * k + 4) * (4 * k + 3) * (4 * k + 2) * (4 * k + 1) * (4 * k).factorial := by
    rw [show 4 * (k + 1) = 4 * k + 4 by omega]
    simp only [Nat.factorial_succ]
    ring
  have hF3 : (3 * (k + 1)).factorial =
      (3 * k + 3) * (3 * k + 2) * (3 * k + 1) * (3 * k).factorial := by
    rw [show 3 * (k + 1) = 3 * k + 3 by omega]
    simp only [Nat.factorial_succ]
    ring
  rw [hF4, hF3, Nat.factorial_succ]
  push_cast
  field_simp <;> ring

end A052204Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a052204.main := by
  intro n hn
  obtain ⟨k, rfl⟩ : ∃ k : ℕ, n = k + 2 := ⟨n - 2, by omega⟩
  have htop := A052204Certificate.first_step (k + 1)
  have hbottom := A052204Certificate.first_step k
  simp only [show k + 2 - 1 = k + 1 by omega, Nat.add_sub_cancel]
  push_cast at htop hbottom ⊢
  have hnz : 5 * (k : ℚ) + 6 ≠ 0 := by positivity
  apply mul_left_cancel₀ hnz
  linear_combination 2 * htop - 11 * hbottom
