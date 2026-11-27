import OMAStatements.S_oeis_a058128
import Mathlib

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Weighted geometric sums supply exact factors and their modular invariants.

namespace A058128Certificate
open OMA.S_oeis_a058128

def weighted (b : ℕ) : ℕ → ℕ
  | 0 => 0
  | m + 1 => b * weighted b m + (m + 1)

lemma weighted_identity (b m : ℕ) :
    ((b : ℤ) - 1) ^ 2 * (weighted b m : ℤ) =
      (b : ℤ) ^ (m + 1) - ((m : ℤ) + 1) * b + m := by
  induction m with
  | zero => simp [weighted]
  | succ m ih =>
      simp only [weighted, Nat.cast_add, Nat.cast_mul, Nat.cast_one, Nat.cast_succ]
      rw [pow_succ (b : ℤ) (m + 1)]
      linear_combination (b : ℤ) * ih

lemma power_identity (m : ℕ) :
    (m + 1) ^ 2 * (1 + weighted (m + 2) m) + 1 = (m + 2) ^ (m + 1) := by
  have h := weighted_identity (m + 2) m
  push_cast at h
  have hz : ((m : ℤ) + 1) ^ 2 * (1 + (weighted (m + 2) m : ℤ)) + 1 =
      ((m : ℤ) + 2) ^ (m + 1) := by
    linear_combination h
  exact_mod_cast hz

lemma a_factor (m : ℕ) : a (m + 2) = (m + 2) * (1 + weighted (m + 2) m) := by
  have hpow : (m + 2) ^ (m + 2) =
      ((m + 2) * (1 + weighted (m + 2) m)) * (m + 1) ^ 2 + (m + 2) := by
    calc
      (m + 2) ^ (m + 2) = (m + 2) ^ (m + 1) * (m + 2) := pow_succ _ _
      _ = ((m + 1) ^ 2 * (1 + weighted (m + 2) m) + 1) * (m + 2) := by
        rw [power_identity]
      _ = _ := by ring
  rw [a, if_neg (by omega), show m + 2 - 1 = m + 1 by omega, hpow,
    Nat.add_sub_cancel]
  exact Nat.mul_div_cancel _ (by positivity)

lemma weighted_mod (N b : ℕ) (hb : b ≡ 1 [MOD N]) (m : ℕ) :
    2 * weighted b m ≡ m * (m + 1) [MOD N] := by
  induction m with
  | zero => simp [weighted, Nat.ModEq]
  | succ m ih =>
      calc
        2 * weighted b (m + 1) = b * (2 * weighted b m) + 2 * (m + 1) := by
          rw [weighted]
          ring
        _ ≡ 1 * (m * (m + 1)) + 2 * (m + 1) [MOD N] := (hb.mul ih).add_right _
        _ = (m + 1) * (m + 1 + 1) := by ring

lemma even_congruence (k : ℕ) :
    1 < a (2 * k + 2) ∧
      (2 * k + 2) ^ a (2 * k + 2) ≡ (2 * k + 2) [MOD a (2 * k + 2)] := by
  let n := 2 * k + 2
  let N := 2 * k + 1
  let q := 1 + weighted n (2 * k)
  have ha : a n = n * q := a_factor (2 * k)
  have ha2 : 1 < a n := by
    rw [ha]
    dsimp [n, q]
    nlinarith
  have hpower : N ^ 2 * q + 1 = n ^ N := power_identity (2 * k)
  have hnmod : n ≡ 1 [MOD N] := by
    simpa [n, N] using (Nat.ModEq.modulus_mul_add (m := N) (a := 1) (b := 1))
  have htwodiv : N ∣ 2 * weighted n (2 * k) := by
    apply Nat.modEq_zero_iff_dvd.mp
    exact (weighted_mod N n hnmod (2 * k)).trans (by simp [N, Nat.ModEq])
  have hN2 : Nat.Coprime N 2 := Nat.coprime_two_right.mpr (by
    dsimp [N]
    exact ⟨k, by omega⟩)
  have hWdiv : N ∣ weighted n (2 * k) := hN2.dvd_of_dvd_mul_left htwodiv
  have hqmod : q ≡ 1 [MOD N] := by
    simpa [q] using hWdiv.modEq_zero_nat.add_left 1
  have hamod : a n ≡ 1 [MOD N] := by
    rw [ha]
    simpa using hnmod.mul hqmod
  obtain ⟨t, ht⟩ : N ∣ a n - 1 := hamod.symm.dvd'
  have hatexp : a n = N * t + 1 := by omega
  have hnQ : n ^ N ≡ 1 [MOD q] := by
    rw [← hpower]
    simpa [mul_comm] using (Nat.ModEq.modulus_mul_add (m := q) (a := N ^ 2) (b := 1))
  have hcop : Nat.Coprime n q := by
    apply Nat.coprime_of_mul_modEq_one (n ^ (2 * k))
    simpa [N, pow_succ'] using hnQ
  have hq : n ^ a n ≡ n [MOD q] := by
    rw [hatexp, pow_add, pow_mul, pow_one]
    simpa using (hnQ.pow t).mul_right n
  have hn : n ^ a n ≡ n [MOD n] := by
    obtain ⟨s, hs⟩ : ∃ s : ℕ, a n = s + 1 := ⟨a n - 1, by omega⟩
    rw [hs, pow_succ]
    simp [Nat.ModEq]
  refine ⟨ha2, ?_⟩
  change n ^ a n ≡ n [MOD a n]
  simpa only [ha] using (Nat.modEq_and_modEq_iff_modEq_mul hcop).mp ⟨hn, hq⟩

end A058128Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a058128.main := by
  intro n hn heven
  obtain ⟨k, rfl⟩ : ∃ k : ℕ, n = 2 * k + 2 := by
    obtain ⟨j, hj⟩ := heven
    exact ⟨j - 1, by omega⟩
  have h := A058128Certificate.even_congruence k
  by_cases hp : (OMA.S_oeis_a058128.a (2 * k + 2)).Prime
  · exact Or.inl hp
  · exact Or.inr ⟨h.1, hp, h.2⟩
