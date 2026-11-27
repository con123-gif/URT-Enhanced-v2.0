import OMAStatements.S_oeis_a079269
import Mathlib

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Prior mathematics: the elementary coprime-pair representation also appears
-- in TrureTuring's QuetRationalIterationDenominator certificate, which proves
-- A079278 but explicitly does not claim the A079269 numerator conjecture.
-- The numerator bridge and numerator-only elimination below prove this target.

namespace A079269Certificate
open OMA.S_oeis_a079269

def pair : ℕ → ℕ × ℕ
  | 0 => (1, 1)
  | n + 1 => ((pair n).1 * ((pair n).1 + 2 * (pair n).2),
      (pair n).2 * ((pair n).1 + (pair n).2))

def P (n : ℕ) : ℕ := (pair n).1
def Q (n : ℕ) : ℕ := (pair n).2

lemma P_succ (n : ℕ) : P (n + 1) = P n * (P n + 2 * Q n) := rfl
lemma Q_succ (n : ℕ) : Q (n + 1) = Q n * (P n + Q n) := rfl

lemma positive_pair (n : ℕ) : 0 < P n ∧ 0 < Q n := by
  induction n with
  | zero => norm_num [P, Q, pair]
  | succ n ih =>
      rw [P_succ, Q_succ]
      exact ⟨Nat.mul_pos ih.1 (by omega), Nat.mul_pos ih.2 (by omega)⟩

lemma coprime_pair (n : ℕ) : Nat.Coprime (P n) (Q n) := by
  induction n with
  | zero => norm_num [P, Q, pair]
  | succ n ih =>
      rw [P_succ, Q_succ, Nat.coprime_mul_iff_left]
      constructor
      · apply Nat.coprime_mul_iff_right.mpr
        exact ⟨ih, Nat.coprime_self_add_right.mpr ih⟩
      · apply Nat.coprime_mul_iff_right.mpr
        constructor
        · exact (Nat.coprime_add_mul_right_left (P n) (Q n) 2).mpr ih
        · have hsum : Nat.Coprime (P n + Q n) (Q n) :=
            Nat.coprime_add_self_left.mpr ih
          have hcross :=
            (Nat.coprime_add_mul_left_right (P n + Q n) (Q n) 1).mpr hsum
          have hcross' : Nat.Coprime (P n + Q n) (P n + 2 * Q n) := by
            convert hcross using 1 <;> omega
          exact hcross'.symm

lemma rational_pair (n : ℕ) : iterate n = (P n : ℚ) / Q n := by
  induction n with
  | zero => norm_num [iterate, P, Q, pair]
  | succ n ih =>
      rw [iterate, ih, P_succ, Q_succ]
      have hp : (P n : ℚ) ≠ 0 := by exact_mod_cast (positive_pair n).1.ne'
      have hq : (Q n : ℚ) ≠ 0 := by exact_mod_cast (positive_pair n).2.ne'
      have hs : (P n : ℚ) + (Q n : ℚ) ≠ 0 := by
        have hpos : 0 < (P n : ℚ) + (Q n : ℚ) := by
          exact_mod_cast Nat.add_pos_left (positive_pair n).1 (Q n)
        exact hpos.ne'
      push_cast
      field_simp [hp, hq, hs]
      ring

lemma exact_numerator (n : ℕ) : (iterate n).num = (P n : ℤ) := by
  rw [rational_pair]
  have hcop : Nat.Coprime (Int.natAbs (P n : ℤ)) (Int.natAbs (Q n : ℤ)) := by
    simpa only [Int.natAbs_natCast] using coprime_pair n
  have h := Rat.num_div_eq_of_coprime (a := (P n : ℤ)) (b := (Q n : ℤ))
    (by exact_mod_cast (positive_pair n).2) hcop
  simpa only [Int.cast_natCast] using h

lemma recurrence (m : ℕ) (hm : 2 ≤ m) :
    (a (m + 1) : ℚ) = (a m : ℚ) ^ 2 +
      (a m : ℚ) ^ 3 / (2 * (a (m - 1) : ℚ) ^ 2) -
      (a m : ℚ) * (a (m - 1) : ℚ) ^ 2 / 2 := by
  obtain ⟨n, rfl⟩ : ∃ n : ℕ, m = n + 2 := ⟨m - 2, by omega⟩
  have h0 : n + 2 - 1 = n + 1 := by omega
  have h1 : n + 2 + 1 - 1 = n + 2 := by omega
  have h2 : n + 2 - 1 - 1 = n := by omega
  simp only [a, h0, h1, h2, Nat.add_sub_cancel, exact_numerator, Int.cast_natCast]
  rw [P_succ (n + 1), P_succ n, Q_succ n]
  have hp : (P n : ℚ) ≠ 0 := by exact_mod_cast (positive_pair n).1.ne'
  push_cast
  field_simp [hp]
  ring

end A079269Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a079269.main := by
  exact A079269Certificate.recurrence
