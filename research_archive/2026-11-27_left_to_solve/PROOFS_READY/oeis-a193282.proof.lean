import OMAStatements.S_oeis_a193282
import Mathlib

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Separate parity identities remove the factorials before algebraic cancellation.

namespace A193282Certificate
open OMA.S_oeis_a193282

lemma odd_step (k : ℕ) : a (2 * k + 1) = (2 * (k : ℚ) + 1) ^ 2 * a (2 * k) := by
  simp only [a, show (2 * k + 1) / 2 = k by omega,
    show 2 * k / 2 = k by omega, Nat.factorial_succ]
  push_cast
  field_simp <;> ring

lemma even_step (k : ℕ) : a (2 * k + 2) = 4 * a (2 * k + 1) := by
  simp only [a, show (2 * k + 2) / 2 = k + 1 by omega,
    show (2 * k + 1) / 2 = k by omega, Nat.factorial_succ]
  push_cast
  field_simp <;> ring

end A193282Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a193282.main := by
  intro n hn
  obtain ⟨k, rfl⟩ : ∃ k : ℕ, n = k + 4 := ⟨n - 4, by omega⟩
  obtain ⟨m, rfl | rfl⟩ := Nat.even_or_odd' k
  · have h0 := A193282Certificate.odd_step m
    have h1 := A193282Certificate.even_step m
    have h2 := A193282Certificate.odd_step (m + 1)
    have h3 := A193282Certificate.even_step (m + 1)
    norm_num only [Nat.mul_add, Nat.mul_one, Nat.add_assoc] at h2 h3
    simp only [show 2 * m + 4 - 1 = 2 * m + 3 by omega,
      show 2 * m + 4 - 2 = 2 * m + 2 by omega,
      show 2 * m + 4 - 3 = 2 * m + 1 by omega,
      Nat.add_sub_cancel, h3, h2, h1, h0]
    push_cast
    ring
  · have h0 := A193282Certificate.even_step m
    have h1 := A193282Certificate.odd_step (m + 1)
    have h2 := A193282Certificate.even_step (m + 1)
    have h3 := A193282Certificate.odd_step (m + 2)
    norm_num only [Nat.mul_add, Nat.mul_one, Nat.add_assoc] at h1 h2 h3
    change OMA.S_oeis_a193282.a (2 * m + 5) +
      8 * OMA.S_oeis_a193282.a (2 * m + 5 - 1) -
      4 * (((2 * m + 5 : ℕ) : ℚ) - 2) * (((2 * m + 5 : ℕ) : ℚ) + 2) *
        OMA.S_oeis_a193282.a (2 * m + 5 - 2) +
      16 * (-2 * ((2 * m + 5 : ℕ) : ℚ) ^ 2 +
        6 * ((2 * m + 5 : ℕ) : ℚ) - 3) * OMA.S_oeis_a193282.a (2 * m + 5 - 3) -
      64 * (((2 * m + 5 : ℕ) : ℚ) - 3) ^ 2 * OMA.S_oeis_a193282.a (2 * m + 5 - 4) = 0
    simp only [show 2 * m + 5 - 1 = 2 * m + 4 by omega,
      show 2 * m + 5 - 2 = 2 * m + 3 by omega,
      show 2 * m + 5 - 3 = 2 * m + 2 by omega,
      show 2 * m + 5 - 4 = 2 * m + 1 by omega, h3, h2, h1, h0]
    push_cast
    ring
