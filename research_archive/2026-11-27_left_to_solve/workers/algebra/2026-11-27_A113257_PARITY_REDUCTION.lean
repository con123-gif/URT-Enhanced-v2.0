import Mathlib

open BigOperators

namespace A113257ParityRun17

/-- The independent defining sum from `FormalConjectures/OEIS/113257.lean`. -/
def a (n : ℕ) : ℕ :=
  ∑ i ∈ Finset.Icc 1 n, (i ^ 2) ^ ((n - i + 1) ^ 2)

lemma zmod2_sq (x : ZMod 2) : x ^ 2 = x := by
  simpa using ZMod.pow_card x

lemma zmod2_pow_pos (x : ZMod 2) {e : ℕ} (he : 0 < e) : x ^ e = x := by
  cases e with
  | zero => omega
  | succ e =>
      clear he
      induction e with
      | zero => simp
      | succ e ih =>
          rw [pow_succ, ih, ← pow_two, zmod2_sq]

lemma term_cast (n i : ℕ) (hi : i ∈ Finset.Icc 1 n) :
    (((i ^ 2) ^ ((n - i + 1) ^ 2) : ℕ) : ZMod 2) = (i : ZMod 2) := by
  have hie : i ≤ n := (Finset.mem_Icc.mp hi).2
  have he : 0 < (n - i + 1) ^ 2 := by positivity
  push_cast
  rw [zmod2_sq, zmod2_pow_pos _ he]

theorem cast_a (n : ℕ) :
    (a n : ZMod 2) = ∑ i ∈ Finset.Icc 1 n, (i : ZMod 2) := by
  simp only [a, Nat.cast_sum]
  apply Finset.sum_congr rfl
  intro i hi
  exact term_cast n i hi

lemma sum_cast_four_mul (k : ℕ) :
    (∑ i ∈ Finset.Icc 1 (4 * k), (i : ZMod 2)) = 0 := by
  induction k with
  | zero => norm_num
  | succ k ih =>
      rw [Nat.mul_succ]
      rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ 4 * k + 4)]
      rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ 4 * k + 3)]
      rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ 4 * k + 2)]
      rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ 4 * k + 1)]
      rw [ih]
      push_cast
      ring_nf
      rw [show (10 : ZMod 2) = 0 from (ZMod.natCast_eq_zero_iff 10 2).mpr (by norm_num)]
      rw [show (16 : ZMod 2) = 0 from (ZMod.natCast_eq_zero_iff 16 2).mpr (by norm_num)]
      simp

lemma sum_cast_four_mul_add_three (k : ℕ) :
    (∑ i ∈ Finset.Icc 1 (4 * k + 3), (i : ZMod 2)) = 0 := by
  rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ 4 * k + 3)]
  rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ 4 * k + 2)]
  rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ 4 * k + 1)]
  rw [sum_cast_four_mul]
  push_cast
  ring_nf
  rw [show (6 : ZMod 2) = 0 from (ZMod.natCast_eq_zero_iff 6 2).mpr (by norm_num)]
  rw [show (12 : ZMod 2) = 0 from (ZMod.natCast_eq_zero_iff 12 2).mpr (by norm_num)]
  simp

theorem cast_a_four_mul (k : ℕ) : (a (4 * k) : ZMod 2) = 0 := by
  rw [cast_a, sum_cast_four_mul]

theorem cast_a_four_mul_add_three (k : ℕ) :
    (a (4 * k + 3) : ZMod 2) = 0 := by
  rw [cast_a, sum_cast_four_mul_add_three]

theorem even_a_four_mul (k : ℕ) : Even (a (4 * k)) :=
  ZMod.natCast_eq_zero_iff_even.mp (cast_a_four_mul k)

theorem even_a_four_mul_add_three (k : ℕ) : Even (a (4 * k + 3)) :=
  ZMod.natCast_eq_zero_iff_even.mp (cast_a_four_mul_add_three k)

#print axioms cast_a
#print axioms cast_a_four_mul
#print axioms cast_a_four_mul_add_three
#print axioms even_a_four_mul
#print axioms even_a_four_mul_add_three

end A113257ParityRun17
