import Mathlib

open BigOperators

namespace A116150ParityRun22

/-- Verbatim copy of `OeisA116150.a` at formal-conjectures commit
`9097e2f90e66d2f6244209cb1c07f7120d17ec53`. -/
def a (n : ℕ) : ℕ :=
  (∑ j ∈ Finset.Icc 1 n, ((3 : ℤ) ^ j + ((-2) : ℤ) ^ j)).toNat

def sourceSum (n : ℕ) : ℤ :=
  ∑ j ∈ Finset.Icc 1 n, ((3 : ℤ) ^ j + ((-2) : ℤ) ^ j)

lemma sourceSum_succ (n : ℕ) :
    sourceSum (n + 1) = sourceSum n + ((3 : ℤ) ^ (n + 1) + ((-2) : ℤ) ^ (n + 1)) := by
  simp [sourceSum, Finset.sum_Icc_succ_top]

lemma three_pow_emod_two (n : ℕ) : ((3 : ℤ) ^ n) % 2 = 1 := by
  induction n with
  | zero => norm_num
  | succ n ih =>
      rw [pow_succ, Int.mul_emod, ih]
      norm_num

lemma neg_two_pow_succ_emod_two (n : ℕ) : ((-2 : ℤ) ^ (n + 1)) % 2 = 0 := by
  rw [pow_succ, Int.mul_emod]
  norm_num

lemma sourceTerm_odd (n : ℕ) :
    ¬ Even (((3 : ℤ) ^ (n + 1) + ((-2) : ℤ) ^ (n + 1))) := by
  rw [Int.even_iff, Int.add_emod, three_pow_emod_two, neg_two_pow_succ_emod_two]
  norm_num

theorem sourceSum_even_iff (n : ℕ) : Even (sourceSum n) ↔ Even n := by
  induction n with
  | zero => simp [sourceSum]
  | succ n ih =>
      rw [sourceSum_succ]
      rw [Int.even_add, iff_false_intro (sourceTerm_odd n), ih, Nat.even_add_one]
      simp

lemma sourceTerm_nonneg {j : ℕ} (hj : 1 ≤ j) :
    0 ≤ ((3 : ℤ) ^ j + ((-2) : ℤ) ^ j) := by
  have hpow : (2 : ℤ) ^ j ≤ (3 : ℤ) ^ j := by
    gcongr
    norm_num
  have habs : |((-2 : ℤ) ^ j)| = (2 : ℤ) ^ j := by
    rw [abs_pow]
    norm_num
  have hneg : -((2 : ℤ) ^ j) ≤ ((-2 : ℤ) ^ j) := by
    rw [← habs]
    exact neg_abs_le _
  omega

lemma sourceSum_nonneg (n : ℕ) : 0 ≤ sourceSum n := by
  unfold sourceSum
  apply Finset.sum_nonneg
  intro j hj
  exact sourceTerm_nonneg (Finset.mem_Icc.mp hj).1

lemma sourceSum_mono : Monotone sourceSum := by
  apply monotone_nat_of_le_succ
  intro n
  rw [sourceSum_succ]
  exact le_add_of_nonneg_right (sourceTerm_nonneg (by omega))

lemma coe_a (n : ℕ) : ((a n : ℕ) : ℤ) = sourceSum n := by
  change (((sourceSum n).toNat : ℕ) : ℤ) = sourceSum n
  exact Int.toNat_of_nonneg (sourceSum_nonneg n)

theorem a_even_iff (n : ℕ) : Even (a n) ↔ Even n := by
  calc
    Even (a n) ↔ Even ((a n : ℕ) : ℤ) := (Int.even_coe_nat (a n)).symm
    _ ↔ Even (sourceSum n) := by rw [coe_a]
    _ ↔ Even n := sourceSum_even_iff n

theorem a_two_mul_even (k : ℕ) : Even (a (2 * k)) := by
  rw [a_even_iff]
  exact ⟨k, by omega⟩

lemma a_two_mul_ne_two (k : ℕ) (hk : 1 ≤ k) : a (2 * k) ≠ 2 := by
  intro heq
  have hmono : sourceSum 2 ≤ sourceSum (2 * k) := sourceSum_mono (by omega)
  have htwo : sourceSum 2 = 14 := by
    calc
      sourceSum 2 = sourceSum 1 + ((3 : ℤ) ^ 2 + ((-2 : ℤ) ^ 2)) := by
        simpa using sourceSum_succ 1
      _ = sourceSum 0 + ((3 : ℤ) ^ 1 + ((-2 : ℤ) ^ 1)) +
            ((3 : ℤ) ^ 2 + ((-2 : ℤ) ^ 2)) := by
        rw [sourceSum_succ 0]
      _ = 14 := by norm_num [sourceSum]
  have hcoe := coe_a (2 * k)
  rw [heq] at hcoe
  omega

theorem a_two_mul_not_prime (k : ℕ) (hk : 1 ≤ k) : ¬ Nat.Prime (a (2 * k)) := by
  intro hp
  exact a_two_mul_ne_two k hk ((hp.even_iff).1 (a_two_mul_even k))

#print axioms A116150ParityRun22.a_even_iff
#print axioms A116150ParityRun22.a_two_mul_even
#print axioms A116150ParityRun22.a_two_mul_not_prime

end A116150ParityRun22
