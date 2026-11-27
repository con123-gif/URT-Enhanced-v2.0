import OMAStatements.S_oeis_a124870
import Mathlib

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Four exact residue classes, with units at 2 and 5, determine every denominator.

namespace A124870Certificate
open OMA.S_oeis_a124870

def block : ℕ → ℤ × ℤ
  | 0 => (1, 0)
  | k + 1 => (7 * (block k).1 + 192 * (block k).2,
      -3 * (block k).1 + 7 * (block k).2)

def A (k : ℕ) : ℤ := (block k).1
def B (k : ℕ) : ℤ := (block k).2

lemma A_succ (k : ℕ) : A (k + 1) = 7 * A k + 192 * B k := rfl
lemma B_succ (k : ℕ) : B (k + 1) = -3 * A k + 7 * B k := rfl

lemma odd_A (k : ℕ) : Odd (A k) := by
  induction k with
  | zero => exact ⟨0, by rfl⟩
  | succ k ih =>
      obtain ⟨t, ht⟩ := ih
      refine ⟨7 * t + 96 * B k + 3, ?_⟩
      rw [A_succ, ht]
      ring

lemma rel_five (k : ℕ) : (5 : ℤ) ∣ A (k + 1) - B (k + 1) := by
  refine ⟨2 * A k + 37 * B k, ?_⟩
  rw [A_succ, B_succ]
  ring

lemma nondiv_linear (a b r s : ℤ) (ha : ¬ (5 : ℤ) ∣ a)
    (hab : (5 : ℤ) ∣ a - b) (hrs : ¬ (5 : ℤ) ∣ r + s) :
    ¬ (5 : ℤ) ∣ r * a + s * b := by
  intro h
  have hsum := dvd_add h (dvd_mul_of_dvd_right hab s)
  have heq : r * a + s * b + s * (a - b) = (r + s) * a := by ring
  rw [heq] at hsum
  exact (show Prime (5 : ℤ) by norm_num).not_dvd_mul hrs ha hsum

lemma nondiv_A (k : ℕ) : ¬ (5 : ℤ) ∣ A k := by
  induction k using Nat.twoStepInduction with
  | zero => norm_num [A, block]
  | one => norm_num [A, block]
  | more k ih ih1 =>
      rw [A_succ]
      exact nondiv_linear _ _ 7 192 ih1 (rel_five k) (by norm_num)

lemma numerator_units (k : ℕ) (r s : ℤ) (hr : Odd r) (hs : Even s)
    (hr5 : ¬ (5 : ℤ) ∣ r) (hrs5 : ¬ (5 : ℤ) ∣ r + s) :
    Odd (r * A k + s * B k) ∧ ¬ (5 : ℤ) ∣ r * A k + s * B k := by
  refine ⟨(hr.mul (odd_A k)).add_even (hs.mul_right (B k)), ?_⟩
  cases k with
  | zero => simpa [A, B, block] using hr5
  | succ k => exact nondiv_linear _ _ r s (nondiv_A _) (rel_five k) hrs5

lemma exact_den (p : ℤ) (u v k : ℕ) (hp2 : Odd p) (hp5 : ¬ (5 : ℤ) ∣ p) :
    ((p : ℚ) / (2 ^ u * 5 ^ v * 2500 ^ k)).den = 2 ^ u * 5 ^ v * 2500 ^ k := by
  have h2 : Nat.Coprime p.natAbs 2 := by simpa using hp2
  have h5 : Nat.Coprime p.natAbs 5 := by
    apply ((show Nat.Prime 5 by decide).coprime_iff_not_dvd.mpr ?_).symm
    intro h
    exact hp5 (Int.dvd_natAbs.mp (Int.natCast_dvd_natCast.mpr h))
  have h2500 : Nat.Coprime p.natAbs 2500 := by
    change Nat.Coprime p.natAbs (2 ^ 2 * 5 ^ 4)
    exact (h2.pow_right 2).mul_right (h5.pow_right 4)
  have hcop : Nat.Coprime p.natAbs (2 ^ u * 5 ^ v * 2500 ^ k) :=
    ((h2.pow_right u).mul_right (h5.pow_right v)).mul_right (h2500.pow_right k)
  let d : ℕ := 2 ^ u * 5 ^ v * 2500 ^ k
  have hcopd : Nat.Coprime p.natAbs (Int.natAbs (d : ℤ)) := by
    simpa only [Int.natAbs_natCast] using hcop
  have hd := Rat.den_div_eq_of_coprime (a := p) (b := (d : ℤ))
    (by dsimp [d]; positivity) hcopd
  dsimp [d] at hd
  push_cast at hd
  exact_mod_cast hd

lemma base_four : base ^ 4 = (⟨7 / 2500, -24 / 2500⟩ : QI) := by
  ext <;> norm_num [base, pow_succ, QuadraticAlgebra.re_mul, QuadraticAlgebra.im_mul]

lemma block_value (k : ℕ) : base ^ (4 * k) =
    (⟨(A k : ℚ) / 2500 ^ k, 8 * (B k : ℚ) / 2500 ^ k⟩ : QI) := by
  induction k with
  | zero => ext <;> simp [A, B, block, QuadraticAlgebra.re_one, QuadraticAlgebra.im_one]
  | succ k ih =>
      rw [show 4 * (k + 1) = 4 * k + 4 by omega, pow_add, ih, base_four]
      ext <;> simp only [QuadraticAlgebra.re_mul, QuadraticAlgebra.im_mul,
        A_succ, B_succ, pow_succ]
      all_goals push_cast; field_simp <;> ring

lemma value_zero (k : ℕ) : (base ^ (4 * k)).re = (A k : ℚ) / 2500 ^ k := by
  rw [block_value]

lemma value_one (k : ℕ) : (base ^ (4 * k + 1)).re =
    ((-A k + 24 * B k : ℤ) : ℚ) / (10 * 2500 ^ k) := by
  rw [pow_add, block_value]
  norm_num [base, QuadraticAlgebra.re_mul, QuadraticAlgebra.im_mul]
  push_cast
  field_simp <;> ring

lemma value_three (k : ℕ) : (base ^ (4 * k + 3)).re =
    ((13 * A k - 72 * B k : ℤ) : ℚ) / (500 * 2500 ^ k) := by
  rw [pow_add, block_value]
  norm_num [base, pow_succ, QuadraticAlgebra.re_mul, QuadraticAlgebra.im_mul]
  push_cast
  field_simp <;> ring

lemma value_two (k : ℕ) : (base ^ (4 * k + 6)).re =
    ((-A (k + 1) - 6 * B (k + 1) : ℤ) : ℚ) / (31250 * 2500 ^ k) := by
  rw [show 4 * k + 6 = 4 * (k + 1) + 2 by omega, pow_add, block_value]
  norm_num [base, pow_succ, QuadraticAlgebra.re_mul, QuadraticAlgebra.im_mul]
  push_cast
  field_simp <;> ring

lemma den_zero (k : ℕ) : a (4 * k) = 2500 ^ k := by
  have h := numerator_units k 1 0 (by decide) (by decide) (by norm_num) (by norm_num)
  have hd := exact_den (A k) 0 0 k (by simpa using h.1) (by simpa using h.2)
  simpa [a, value_zero] using hd

lemma den_one (k : ℕ) : a (4 * k + 1) = 10 * 2500 ^ k := by
  have h := numerator_units k (-1) 24 (by decide) (by decide) (by norm_num) (by norm_num)
  have hd := exact_den (-A k + 24 * B k) 1 1 k (by simpa using h.1) (by simpa using h.2)
  norm_num at hd
  simpa [a, value_one] using hd

lemma den_three (k : ℕ) : a (4 * k + 3) = 500 * 2500 ^ k := by
  have h := numerator_units k 13 (-72) (by decide) (by decide) (by norm_num) (by norm_num)
  have hd := exact_den (13 * A k - 72 * B k) 2 3 k
    (by simpa [sub_eq_add_neg] using h.1) (by simpa [sub_eq_add_neg] using h.2)
  norm_num at hd
  simpa [a, value_three] using hd

lemma den_two (k : ℕ) : a (4 * k + 6) = 31250 * 2500 ^ k := by
  have h := numerator_units (k + 1) (-1) (-6)
    (by decide) (by decide) (by norm_num) (by norm_num)
  have hd := exact_den (-A (k + 1) - 6 * B (k + 1)) 1 6 k
    (by simpa [sub_eq_add_neg] using h.1) (by simpa [sub_eq_add_neg] using h.2)
  norm_num at hd
  simpa [a, value_two] using hd

lemma recurrence (n : ℕ) (hn : 6 < n) : a n = 2500 * a (n - 4) := by
  obtain ⟨k, hk⟩ : ∃ k : ℕ,
      n = 4 * k + 7 ∨ n = 4 * k + 8 ∨ n = 4 * k + 9 ∨ n = 4 * k + 10 := by
    refine ⟨(n - 7) / 4, ?_⟩
    have h := Nat.mod_add_div (n - 7) 4
    have hmod := Nat.mod_lt (n - 7) (by decide : 0 < 4)
    omega
  rcases hk with rfl | rfl | rfl | rfl
  · rw [show 4 * k + 7 = 4 * (k + 1) + 3 by omega, den_three,
      show 4 * (k + 1) + 3 - 4 = 4 * k + 3 by omega, den_three, pow_succ]
    ring
  · rw [show 4 * k + 8 = 4 * (k + 2) by omega, den_zero,
      show 4 * (k + 2) - 4 = 4 * (k + 1) by omega, den_zero, pow_succ]
    ring
  · rw [show 4 * k + 9 = 4 * (k + 2) + 1 by omega, den_one,
      show 4 * (k + 2) + 1 - 4 = 4 * (k + 1) + 1 by omega, den_one, pow_succ]
    ring
  · rw [show 4 * k + 10 = 4 * (k + 1) + 6 by omega, den_two,
      show 4 * (k + 1) + 6 - 4 = 4 * k + 6 by omega, den_two, pow_succ]
    ring

open PowerSeries

noncomputable def numerator : PowerSeries ℚ :=
  1 + C 10 * X ^ 1 + C 25 * X ^ 2 + C 500 * X ^ 3 - C 31250 * X ^ 6

lemma coeff_series (n : ℕ) : coeff n series = (a n : ℚ) := by simp [series]

lemma generating_identity : series * (1 - C 2500 * (X : PowerSeries ℚ) ^ 4) = numerator := by
  have hf : series * (1 - C 2500 * (X : PowerSeries ℚ) ^ 4) =
      series - C 2500 * (series * X ^ 4) := by ring
  rw [hf]
  apply PowerSeries.ext
  intro n
  by_cases hn : n ≤ 6
  · interval_cases n <;>
      simp [numerator, map_add, map_sub, PowerSeries.coeff_C_mul,
        PowerSeries.coeff_mul_X_pow', PowerSeries.coeff_X_pow,
        PowerSeries.coeff_X, PowerSeries.coeff_one, series] <;>
      norm_num [a, base, pow_succ, QuadraticAlgebra.re_mul, QuadraticAlgebra.im_mul,
        QuadraticAlgebra.re_one, QuadraticAlgebra.im_one] <;> decide
  · have hm : ∀ m : ℕ, m ≤ 6 → n ≠ m := by intro m hm; omega
    have hN : coeff n numerator = 0 := by
      simp only [numerator, map_add, map_sub, PowerSeries.coeff_one,
        PowerSeries.coeff_C_mul, PowerSeries.coeff_X_pow,
        if_neg (hm 0 (by decide)), if_neg (hm 1 (by decide)),
        if_neg (hm 2 (by decide)), if_neg (hm 3 (by decide)), if_neg (hm 6 (by decide))]
      norm_num
    rw [hN]
    have h4 : 4 ≤ n := by omega
    have ha : (a n : ℚ) = 2500 * (a (n - 4) : ℚ) := by
      exact_mod_cast recurrence n (by omega)
    simp only [map_sub, PowerSeries.coeff_C_mul, PowerSeries.coeff_mul_X_pow',
      coeff_series, if_pos h4]
    linear_combination ha

lemma full_generating_identity :
    ((1 - C 50 * (X : PowerSeries ℚ) ^ 2) * (1 + C 50 * X ^ 2)) * series =
      1 + C 10 * X + C 25 * X ^ 2 + C 500 * X ^ 3 - C 31250 * X ^ 6 := by
  have hd : (1 - C 50 * (X : PowerSeries ℚ) ^ 2) * (1 + C 50 * X ^ 2) =
      1 - C 2500 * X ^ 4 := by
    simp only [map_ofNat]
    ring
  rw [hd, mul_comm]
  simpa [numerator] using generating_identity

end A124870Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a124870.main := by
  exact ⟨A124870Certificate.recurrence, A124870Certificate.full_generating_identity⟩
