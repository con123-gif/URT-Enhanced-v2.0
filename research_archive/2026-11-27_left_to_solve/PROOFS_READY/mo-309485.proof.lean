import Mathlib
import OMAStatements.S_mo_309485

/-!
Complete MO309485 certificate. Verification status and immutable run metadata
are recorded separately in the accompanying artifact receipts.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6; exact serving
variant not exposed. We prove the source's complete zero-eigenvalue
classification and credit Lampe's odd LEFT and MTyson's even RIGHT proposed
vectors. The binomial identities are classical; no vector invention,
new general method or historical priority is claimed.
-/

set_option maxHeartbeats 800000
set_option maxRecDepth 2000


/-!
Classical finite binomial identities for the full MO309485 matrix proof.
Unverified helper candidate; no kernel pass or official acceptance asserted.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).
The source kernel vectors are credited separately to Philipp Lampe and MTyson.
All coefficient identities explicitly preserve the negative-lower-index zero
convention. No source conjecture or asymptotic premise is assumed.
-/

open scoped BigOperators
open Polynomial

namespace OMA.MO309485.Binomial

theorem factor_alternating {R : Type*} [CommRing R]
    (h N : ℕ) (hN : h ≤ N) (A B : R) :
    (∑ j ∈ Finset.range (h + 1),
      (-1 : R) ^ j * (h.choose j : R) * A ^ (N - j) * B ^ j) =
      A ^ (N - h) * (A - B) ^ h := by
  have hbin : (A - B) ^ h =
      ∑ j ∈ Finset.range (h + 1),
        (-1 : R) ^ j * (h.choose j : R) * A ^ (h - j) * B ^ j := by
    calc
      (A - B) ^ h = (-B + A) ^ h := by congr 1; ring
      _ = ∑ j ∈ Finset.range (h + 1),
          (-B) ^ j * A ^ (h - j) * (h.choose j : R) := add_pow _ _ _
      _ = _ := by
        apply Finset.sum_congr rfl
        intro j hj
        rw [neg_pow]
        ring
  rw [hbin, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  have hjh : j ≤ h := by
    have := Finset.mem_range.mp hj
    omega
  have hexp : N - j = (N - h) + (h - j) := by omega
  rw [hexp, pow_add]
  ring

theorem C_sign_choose (h j : ℕ) :
    C ((-1 : ℤ) ^ j * (h.choose j : ℤ)) =
      (-1 : ℤ[X]) ^ j * (h.choose j : ℤ[X]) := by
  rw [C_mul, C_pow, C_neg, C_1, C_eq_natCast]

theorem poly_A (h N : ℕ) (hN : h ≤ N) :
    (∑ j ∈ Finset.range (h + 1),
      C ((-1 : ℤ) ^ j * (h.choose j : ℤ)) *
        (1 + X : ℤ[X]) ^ (N - j)) =
      X ^ h * (1 + X : ℤ[X]) ^ (N - h) := by
  have hf := factor_alternating h N hN (1 + X : ℤ[X]) 1
  have hb : (1 + X : ℤ[X]) - 1 = X := by ring
  rw [hb] at hf
  calc
    _ = (1 + X : ℤ[X]) ^ (N - h) * X ^ h := by
      simpa only [C_sign_choose, one_pow, mul_one] using hf
    _ = X ^ h * (1 + X : ℤ[X]) ^ (N - h) := mul_comm _ _

theorem poly_B (h N : ℕ) (hN : h ≤ N) :
    (∑ j ∈ Finset.range (h + 1),
      C ((-1 : ℤ) ^ j * (h.choose j : ℤ)) *
        (X ^ j * (1 + X : ℤ[X]) ^ (N - j))) =
      (1 + X : ℤ[X]) ^ (N - h) := by
  calc
    _ = ∑ j ∈ Finset.range (h + 1),
        (-1 : ℤ[X]) ^ j * (h.choose j : ℤ[X]) *
          (1 + X : ℤ[X]) ^ (N - j) * X ^ j := by
      apply Finset.sum_congr rfl
      intro j hj
      rw [C_sign_choose]
      ring
    _ = (1 + X : ℤ[X]) ^ (N - h) * ((1 + X : ℤ[X]) - X) ^ h :=
      factor_alternating h N hN _ _
    _ = (1 + X : ℤ[X]) ^ (N - h) := by simp

theorem poly_C (h : ℕ) :
    (∑ j ∈ Finset.range (h + 1),
      C ((-1 : ℤ) ^ j * (h.choose j : ℤ)) *
        (1 + X : ℤ[X]) ^ j) =
      C ((-1 : ℤ) ^ h) * X ^ h := by
  have hbin := add_pow (-(1 + X) : ℤ[X]) 1 h
  have hb : (-(1 + X) : ℤ[X]) + 1 = -X := by ring
  rw [hb] at hbin
  calc
    _ = ∑ j ∈ Finset.range (h + 1),
        (-(1 + X) : ℤ[X]) ^ j * 1 ^ (h - j) * (h.choose j : ℤ[X]) := by
      apply Finset.sum_congr rfl
      intro j hj
      rw [C_sign_choose, neg_pow (1 + X : ℤ[X]) j]
      simp only [one_pow, mul_one]
      ring
    _ = (-X : ℤ[X]) ^ h := hbin.symm
    _ = C ((-1 : ℤ) ^ h) * X ^ h := by
      rw [neg_pow, C_pow, C_neg, C_1]

theorem sum_A (h N k : ℕ) (hN : h ≤ N) :
    (∑ j ∈ Finset.range (h + 1),
      (-1 : ℤ) ^ j * (h.choose j : ℤ) * ((N - j).choose k : ℤ)) =
      if h ≤ k then ((N - h).choose (k - h) : ℤ) else 0 := by
  have hc := congrArg (fun p : ℤ[X] => p.coeff k) (poly_A h N hN)
  simpa only [finsetSum_coeff, coeff_C_mul, coeff_X_pow_mul',
    coeff_one_add_X_pow] using hc

theorem sum_B (h N k : ℕ) (hN : h ≤ N) :
    (∑ j ∈ Finset.range (h + 1),
      (-1 : ℤ) ^ j * (h.choose j : ℤ) *
        (if j ≤ k then ((N - j).choose (k - j) : ℤ) else 0)) =
      ((N - h).choose k : ℤ) := by
  have hc := congrArg (fun p : ℤ[X] => p.coeff k) (poly_B h N hN)
  simpa only [finsetSum_coeff, coeff_C_mul, coeff_X_pow_mul',
    coeff_one_add_X_pow] using hc

theorem sum_C (h k : ℕ) :
    (∑ j ∈ Finset.range (h + 1),
      (-1 : ℤ) ^ j * (h.choose j : ℤ) * (j.choose k : ℤ)) =
      if k = h then (-1 : ℤ) ^ h else 0 := by
  have hc := congrArg (fun p : ℤ[X] => p.coeff k) (poly_C h)
  simpa only [finsetSum_coeff, coeff_C_mul, coeff_one_add_X_pow,
    coeff_X_pow, mul_ite, mul_one, mul_zero] using hc

end OMA.MO309485.Binomial



/-!
Integer-matrix and complex-eigenvalue bridge for MO309485.
This follows the frozen source statement in a combined probe.
Credit: Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6.
Local candidate; no compiler pass asserted.
-/

namespace OMA.MO309485.Bridge

def entry (n i j : ℕ) : ℤ :=
  (Nat.choose i j : ℤ) +
    (if i ≤ j then (Nat.choose (2 * n + 1 - i) (j - i) : ℤ) else 0) +
    (Nat.choose (2 * n + 1 - i) j : ℤ)

def matrixInt (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) ℤ :=
  fun i j => entry n i.val j.val

def oddVector (n j : ℕ) : ℤ :=
  (-1 : ℤ) ^ j * ((Nat.choose n j : ℤ) + (Nat.choose (n + 1) j : ℤ))

def evenVector (n j : ℕ) : ℤ :=
  (-1 : ℤ) ^ j * (Nat.choose (2 * (n + 1) - j) (n + 1) : ℤ) -
    (if j = n then 2 else 0)

theorem zero_eig_iff_det {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A : Matrix ι ι ℂ) :
    Module.End.HasEigenvalue (Matrix.toLin' A) (0 : ℂ) ↔ A.det = 0 := by
  rw [Module.End.hasEigenvalue_iff, Module.End.eigenspace_zero,
    ← LinearMap.det_eq_zero_iff_ker_ne_bot, LinearMap.det_toLin']

theorem matrixInt_map (n : ℕ) :
    (matrixInt n).map (fun z : ℤ => (z : ℂ)) = OMA.S_mo_309485.matrix n := by
  ext i j
  by_cases h : i.val ≤ j.val <;>
    simp [matrixInt, entry, OMA.S_mo_309485.matrix, h]

theorem det_cast (n : ℕ) :
    (OMA.S_mo_309485.matrix n).det = ((matrixInt n).det : ℂ) := by
  rw [← matrixInt_map]
  exact (Int.cast_det (matrixInt n)).symm

theorem zero_eig_of_int_det (n : ℕ) (hdet : (matrixInt n).det = 0) :
    Module.End.HasEigenvalue (Matrix.toLin' (OMA.S_mo_309485.matrix n)) (0 : ℂ) := by
  apply (zero_eig_iff_det _).mpr
  rw [det_cast, hdet]
  norm_num

theorem zero_index_det : (OMA.S_mo_309485.matrix 0).det = (3 : ℂ) := by
  rw [Matrix.det_fin_one]
  norm_num [OMA.S_mo_309485.matrix]

theorem zero_index_not_eig :
    ¬ Module.End.HasEigenvalue
      (Matrix.toLin' (OMA.S_mo_309485.matrix 0)) (0 : ℂ) := by
  rw [zero_eig_iff_det, zero_index_det]
  norm_num

end OMA.MO309485.Bridge


/-!
The odd-index kernel proposed by Philipp Lampe in the source comments.
The finite-sum verification below is an unverified local candidate until the
actual pinned checker has run. No priority or full-check claim is made.
Credit: Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6.
-/

open scoped BigOperators Matrix

namespace OMA.MO309485.OddKernel

open Bridge Binomial

theorem first_sum (n j : ℕ) (hn : Odd n) (hj : j ≤ n) :
    (∑ i ∈ Finset.range (n + 1), oddVector n i * (i.choose j : ℤ)) =
      -((n + 1).choose j : ℤ) - (if j = n then 1 else 0) := by
  have hs : (-1 : ℤ) ^ n = -1 := hn.neg_one_pow
  have hs1 : (-1 : ℤ) ^ (n + 1) = 1 := by rw [pow_succ, hs]; norm_num
  have h0 := sum_C n j
  have h1 := sum_C (n + 1) j
  rw [Finset.sum_range_succ] at h1
  have hj1 : j ≠ n + 1 := by omega
  simp only [hs, hs1, Nat.choose_self, Int.natCast_one, mul_one,
    if_neg hj1] at h0 h1
  have he : (∑ i ∈ Finset.range (n + 1), oddVector n i * (i.choose j : ℤ)) =
      (∑ i ∈ Finset.range (n + 1),
        (-1 : ℤ) ^ i * (n.choose i : ℤ) * (i.choose j : ℤ)) +
      (∑ i ∈ Finset.range (n + 1),
        (-1 : ℤ) ^ i * ((n + 1).choose i : ℤ) * (i.choose j : ℤ)) := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i hi
    simp only [oddVector]
    ring
  rw [he, h0]
  split_ifs <;> linarith

theorem second_sum (n j : ℕ) (hj : j ≤ n) :
    (∑ i ∈ Finset.range (n + 1), oddVector n i *
      (if i ≤ j then ((2 * n + 1 - i).choose (j - i) : ℤ) else 0)) =
      ((n + 1).choose j : ℤ) + (n.choose j : ℤ) := by
  have h0 := sum_B n (2 * n + 1) j (by omega)
  have h1 := sum_B (n + 1) (2 * n + 1) j (by omega)
  rw [Finset.sum_range_succ] at h1
  have hj1 : ¬ n + 1 ≤ j := by omega
  have he0 : 2 * n + 1 - n = n + 1 := by omega
  have he1 : 2 * n + 1 - (n + 1) = n := by omega
  simp only [he0] at h0
  simp only [he1, if_neg hj1, mul_zero, add_zero] at h1
  have he : (∑ i ∈ Finset.range (n + 1), oddVector n i *
      (if i ≤ j then ((2 * n + 1 - i).choose (j - i) : ℤ) else 0)) =
      (∑ i ∈ Finset.range (n + 1),
        (-1 : ℤ) ^ i * (n.choose i : ℤ) *
          (if i ≤ j then ((2 * n + 1 - i).choose (j - i) : ℤ) else 0)) +
      (∑ i ∈ Finset.range (n + 1),
        (-1 : ℤ) ^ i * ((n + 1).choose i : ℤ) *
          (if i ≤ j then ((2 * n + 1 - i).choose (j - i) : ℤ) else 0)) := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i hi
    simp only [oddVector]
    ring
  rw [he, h0, h1]

theorem third_sum (n j : ℕ) (hn : Odd n) (hj : j ≤ n) :
    (∑ i ∈ Finset.range (n + 1),
      oddVector n i * ((2 * n + 1 - i).choose j : ℤ)) =
      (if j = n then 1 else 0) - (n.choose j : ℤ) := by
  have hs : (-1 : ℤ) ^ n = -1 := hn.neg_one_pow
  have hs1 : (-1 : ℤ) ^ (n + 1) = 1 := by rw [pow_succ, hs]; norm_num
  have h0 := sum_A n (2 * n + 1) j (by omega)
  have h1 := sum_A (n + 1) (2 * n + 1) j (by omega)
  rw [Finset.sum_range_succ] at h1
  have hj1 : ¬ n + 1 ≤ j := by omega
  have he0 : 2 * n + 1 - n = n + 1 := by omega
  have he1 : 2 * n + 1 - (n + 1) = n := by omega
  have hdelta : (if n ≤ j then ((n + 1).choose (j - n) : ℤ) else 0) =
      (if j = n then 1 else 0) := by
    by_cases h : j = n
    · subst j; simp
    · have hnj : ¬ n ≤ j := by omega
      simp [h, hnj]
  simp only [he0] at h0
  rw [hdelta] at h0
  simp only [he1, hs1, Nat.choose_self, Int.natCast_one,
    one_mul, if_neg hj1] at h1
  have he : (∑ i ∈ Finset.range (n + 1),
      oddVector n i * ((2 * n + 1 - i).choose j : ℤ)) =
      (∑ i ∈ Finset.range (n + 1),
        (-1 : ℤ) ^ i * (n.choose i : ℤ) * ((2 * n + 1 - i).choose j : ℤ)) +
      (∑ i ∈ Finset.range (n + 1),
        (-1 : ℤ) ^ i * ((n + 1).choose i : ℤ) *
          ((2 * n + 1 - i).choose j : ℤ)) := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i hi
    simp only [oddVector]
    ring
  rw [he, h0]
  linarith

theorem left_kernel (n : ℕ) (hn : Odd n) :
    (fun i : Fin (n + 1) => oddVector n i.val) ᵥ* matrixInt n = 0 := by
  ext j
  change (∑ i : Fin (n + 1), oddVector n i.val * entry n i.val j.val) = 0
  rw [Fin.sum_univ_eq_sum_range (fun i : ℕ => oddVector n i * entry n i j.val) (n + 1)]
  have hj : j.val ≤ n := by omega
  simp only [entry, mul_add, Finset.sum_add_distrib]
  rw [first_sum n j.val hn hj, second_sum n j.val hj, third_sum n j.val hn hj]
  ring

theorem vector_ne_zero (n : ℕ) :
    (fun i : Fin (n + 1) => oddVector n i.val) ≠ 0 := by
  intro h
  have h0 := congrFun h (⟨0, by omega⟩ : Fin (n + 1))
  norm_num [oddVector] at h0

theorem det_eq_zero (n : ℕ) (hn : Odd n) : (matrixInt n).det = 0 := by
  exact Matrix.exists_vecMul_eq_zero_iff.mp
    ⟨_, vector_ne_zero n, left_kernel n hn⟩

end OMA.MO309485.OddKernel



/-!
Uniform verification of MTyson's proposed even-index RIGHT nullvector.
Local unverified candidate. The source's negative-lower-index convention is
retained throughout. Credit: Cornelius Lytollis (@con123-gif), assisted by
Codex/GPT-6; the kernel proposal itself is credited to MTyson.
-/

open scoped BigOperators Matrix

namespace OMA.MO309485.EvenKernel

open Bridge Binomial

def vector (m j : ℕ) : ℤ :=
  (-1 : ℤ) ^ j * ((2 * m - j).choose m : ℤ) - (if j = m - 1 then 2 else 0)

theorem sum_shift (m i : ℕ) (hi : i ≤ m) (f : ℕ → ℤ) :
    (∑ j ∈ Finset.range m, if i ≤ j then f (j - i) else 0) =
      ∑ k ∈ Finset.range (m - i), f k := by
  have he : m = i + (m - i) := by omega
  conv_lhs => rw [he, Finset.sum_range_add]
  have hz : (∑ j ∈ Finset.range i, if i ≤ j then f (j - i) else 0) = 0 := by
    apply Finset.sum_eq_zero
    intro j hj
    have hji : ¬ i ≤ j := by have := Finset.mem_range.mp hj; omega
    simp [hji]
  rw [hz, zero_add]
  apply Finset.sum_congr rfl
  intro k hk
  have hik : i ≤ i + k := by omega
  simp [hik]

theorem truncated_A (h k b : ℕ) (hb : b ≤ h) (hN : h ≤ k + b) :
    (∑ j ∈ Finset.range b,
      (-1 : ℤ) ^ j * (h.choose j : ℤ) * ((k + b - j).choose k : ℤ)) =
      (if h ≤ k then ((k + b - h).choose (k - h) : ℤ) else 0) -
        (-1 : ℤ) ^ b * (h.choose b : ℤ) := by
  have hfull := sum_A h (k + b) k hN
  have hcut : (∑ j ∈ Finset.range (b + 1),
      (-1 : ℤ) ^ j * (h.choose j : ℤ) * ((k + b - j).choose k : ℤ)) =
      ∑ j ∈ Finset.range (h + 1),
        (-1 : ℤ) ^ j * (h.choose j : ℤ) * ((k + b - j).choose k : ℤ) := by
    apply Finset.sum_subset (Finset.range_mono (by omega))
    intro j hj hjnot
    have hjb : b < j := by
      simp only [Finset.mem_range] at hjnot
      omega
    have hjh := Finset.mem_range.mp hj
    rw [Nat.choose_eq_zero_of_lt (show k + b - j < k by omega)]
    simp
  rw [Finset.sum_range_succ] at hcut
  have he : k + b - b = k := by omega
  simp only [he, Nat.choose_self, Int.natCast_one, mul_one] at hcut
  rw [hfull] at hcut
  linarith

theorem sum_last (m : ℕ) (hm : 0 < m) (f : ℕ → ℤ) :
    (∑ j ∈ Finset.range m, f j * (if j = m - 1 then 2 else 0)) =
      2 * f (m - 1) := by
  have hmem : m - 1 ∈ Finset.range m := Finset.mem_range.mpr (by omega)
  simp only [mul_ite, mul_zero]
  rw [Finset.sum_ite_eq', if_pos hmem]
  ring

theorem raw_first_sum (m i : ℕ) (hi : i < m) :
    (∑ j ∈ Finset.range m,
      (i.choose j : ℤ) * ((-1 : ℤ) ^ j * ((2 * m - j).choose m : ℤ))) =
      ((2 * m - i).choose m : ℤ) := by
  have hfull := sum_A i (2 * m) m (by omega)
  have hcut : (∑ j ∈ Finset.range (i + 1),
      (-1 : ℤ) ^ j * (i.choose j : ℤ) * ((2 * m - j).choose m : ℤ)) =
      ∑ j ∈ Finset.range m,
        (-1 : ℤ) ^ j * (i.choose j : ℤ) * ((2 * m - j).choose m : ℤ) := by
    apply Finset.sum_subset (Finset.range_mono (by omega))
    intro j hj hjnot
    have hij : i < j := by
      simp only [Finset.mem_range] at hjnot
      omega
    rw [Nat.choose_eq_zero_of_lt hij]
    simp
  have hs : (2 * m - i).choose (m - i) = (2 * m - i).choose m := by
    have he : m - i = (2 * m - i) - m := by omega
    rw [he, Nat.choose_symm (by omega)]
  have him : i ≤ m := by omega
  rw [if_pos him, hs, hcut] at hfull
  calc
    _ = ∑ j ∈ Finset.range m,
      (-1 : ℤ) ^ j * (i.choose j : ℤ) * ((2 * m - j).choose m : ℤ) := by
        apply Finset.sum_congr rfl
        intro j hj
        ring
    _ = _ := hfull

theorem raw_third_sum (m i : ℕ) (hm : Odd m) (hi : i < m) :
    (∑ j ∈ Finset.range m,
      ((2 * m - 1 - i).choose j : ℤ) *
        ((-1 : ℤ) ^ j * ((2 * m - j).choose m : ℤ))) =
      (if i = m - 1 then 1 else 0) + ((2 * m - 1 - i).choose m : ℤ) := by
  have hcut := truncated_A (2 * m - 1 - i) m m (by omega) (by omega)
  have hs : (-1 : ℤ) ^ m = -1 := hm.neg_one_pow
  have hd : (if 2 * m - 1 - i ≤ m then
      ((m + m - (2 * m - 1 - i)).choose (m - (2 * m - 1 - i)) : ℤ)
      else 0) = (if i = m - 1 then 1 else 0) := by
    by_cases h : i = m - 1
    · have he : 2 * m - 1 - i = m := by omega
      rw [if_pos h, he, if_pos (le_refl m)]
      simp only [Nat.sub_self, Nat.choose_zero_right, Nat.cast_one]
    · have he : ¬ 2 * m - 1 - i ≤ m := by omega
      simp [he, h]
  rw [hd, hs] at hcut
  calc
    _ = ∑ j ∈ Finset.range m,
      (-1 : ℤ) ^ j * ((2 * m - 1 - i).choose j : ℤ) *
        ((m + m - j).choose m : ℤ) := by
          apply Finset.sum_congr rfl
          intro j hj
          rw [show m + m = 2 * m by omega]
          ring
    _ = _ := by linarith

theorem raw_second_sum (m i : ℕ) (hm : Odd m) (hi : i < m) :
    (∑ j ∈ Finset.range m,
      (if i ≤ j then ((2 * m - 1 - i).choose (j - i) : ℤ) else 0) *
        ((-1 : ℤ) ^ j * ((2 * m - j).choose m : ℤ))) =
      (if i = m - 1 then 1 else 0) + ((2 * m - 1 - i).choose (m - 1) : ℤ) := by
  have hs : (-1 : ℤ) ^ m = -1 := hm.neg_one_pow
  have hs0 : (-1 : ℤ) ^ (m - 1) = 1 := by
    have he : m = (m - 1) + 1 := by omega
    rw [he, pow_succ] at hs
    linarith
  have hcut := truncated_A (2 * m - 1 - i) m (m - i) (by omega) (by omega)
  have hsprod : (-1 : ℤ) ^ i * (-1 : ℤ) ^ (m - i) = -1 := by
    rw [← pow_add, show i + (m - i) = m by omega, hs]
  have hd : (-1 : ℤ) ^ i * (if 2 * m - 1 - i ≤ m then
      ((m + (m - i) - (2 * m - 1 - i)).choose (m - (2 * m - 1 - i)) : ℤ)
      else 0) = (if i = m - 1 then 1 else 0) := by
    by_cases h : i = m - 1
    · have he : 2 * m - 1 - i = m := by omega
      rw [if_pos h, he, if_pos (le_refl m)]
      simpa only [Nat.sub_self, Nat.choose_zero_right, Nat.cast_one, mul_one, h] using hs0
    · have he : ¬ 2 * m - 1 - i ≤ m := by omega
      simp [he, h]
  have hsym : (2 * m - 1 - i).choose (m - i) =
      (2 * m - 1 - i).choose (m - 1) := by
    have he : m - i = (2 * m - 1 - i) - (m - 1) := by omega
    rw [he, Nat.choose_symm (by omega)]
  calc
    _ = ∑ j ∈ Finset.range m,
        if i ≤ j then (-1 : ℤ) ^ i *
          ((-1 : ℤ) ^ (j - i) * ((2 * m - 1 - i).choose (j - i) : ℤ) *
            ((m + (m - i) - (j - i)).choose m : ℤ)) else 0 := by
      apply Finset.sum_congr rfl
      intro j hj
      by_cases hij : i ≤ j
      · rw [if_pos hij, if_pos hij]
        have he : i + (j - i) = j := by omega
        have he2 : m + (m - i) - (j - i) = 2 * m - j := by omega
        have hep : (-1 : ℤ) ^ j = (-1 : ℤ) ^ i * (-1 : ℤ) ^ (j - i) := by
          rw [← pow_add, he]
        rw [he2, hep]
        ring
      · simp [hij]
    _ = ∑ k ∈ Finset.range (m - i), (-1 : ℤ) ^ i *
        ((-1 : ℤ) ^ k * ((2 * m - 1 - i).choose k : ℤ) *
          ((m + (m - i) - k).choose m : ℤ)) :=
      sum_shift m i (by omega) (fun k => (-1 : ℤ) ^ i *
        ((-1 : ℤ) ^ k * ((2 * m - 1 - i).choose k : ℤ) *
          ((m + (m - i) - k).choose m : ℤ)))
    _ = (-1 : ℤ) ^ i * (∑ k ∈ Finset.range (m - i),
        (-1 : ℤ) ^ k * ((2 * m - 1 - i).choose k : ℤ) *
          ((m + (m - i) - k).choose m : ℤ)) := (Finset.mul_sum _ _ _).symm
    _ = (-1 : ℤ) ^ i * ((if 2 * m - 1 - i ≤ m then
        ((m + (m - i) - (2 * m - 1 - i)).choose (m - (2 * m - 1 - i)) : ℤ)
        else 0) - (-1 : ℤ) ^ (m - i) * ((2 * m - 1 - i).choose (m - i) : ℤ)) := by
      rw [hcut]
    _ = _ := by rw [mul_sub, hd, ← mul_assoc, hsprod, hsym]; ring

theorem first_sum (m i : ℕ) (hi : i < m) :
    (∑ j ∈ Finset.range m, (i.choose j : ℤ) * vector m j) =
      ((2 * m - i).choose m : ℤ) - 2 * (if i = m - 1 then 1 else 0) := by
  have hd : (i.choose (m - 1) : ℤ) = (if i = m - 1 then 1 else 0) := by
    by_cases h : i = m - 1
    · simp [h]
    · have he : i < m - 1 := by omega
      simp [h, Nat.choose_eq_zero_of_lt he]
  simp only [vector, mul_sub, Finset.sum_sub_distrib]
  rw [raw_first_sum m i hi, sum_last m (by omega), hd]

theorem second_sum (m i : ℕ) (hm : Odd m) (hi : i < m) :
    (∑ j ∈ Finset.range m,
      (if i ≤ j then ((2 * m - 1 - i).choose (j - i) : ℤ) else 0) * vector m j) =
      (if i = m - 1 then 1 else 0) + ((2 * m - 1 - i).choose (m - 1) : ℤ) -
        2 * ((2 * m - 1 - i).choose m : ℤ) := by
  have his : i ≤ m - 1 := by omega
  have hsym : (2 * m - 1 - i).choose (m - 1 - i) =
      (2 * m - 1 - i).choose m := by
    have he : m - 1 - i = (2 * m - 1 - i) - m := by omega
    rw [he, Nat.choose_symm (by omega)]
  simp only [vector, mul_sub, Finset.sum_sub_distrib]
  rw [raw_second_sum m i hm hi, sum_last m (by omega), if_pos his, hsym]

theorem third_sum (m i : ℕ) (hm : Odd m) (hi : i < m) :
    (∑ j ∈ Finset.range m, ((2 * m - 1 - i).choose j : ℤ) * vector m j) =
      (if i = m - 1 then 1 else 0) + ((2 * m - 1 - i).choose m : ℤ) -
        2 * ((2 * m - 1 - i).choose (m - 1) : ℤ) := by
  simp only [vector, mul_sub, Finset.sum_sub_distrib]
  rw [raw_third_sum m i hm hi, sum_last m (by omega)]

theorem row_sum (m i : ℕ) (hm : Odd m) (hi : i < m) :
    (∑ j ∈ Finset.range m,
      ((i.choose j : ℤ) +
        (if i ≤ j then ((2 * m - 1 - i).choose (j - i) : ℤ) else 0) +
        ((2 * m - 1 - i).choose j : ℤ)) * vector m j) = 0 := by
  have hpascal : ((2 * m - i).choose m : ℤ) =
      ((2 * m - 1 - i).choose m : ℤ) +
        ((2 * m - 1 - i).choose (m - 1) : ℤ) := by
    have hp : 0 < 2 * m - i := by omega
    have hmpos : 0 < m := by omega
    rw [Nat.choose_eq_choose_pred_add hp hmpos,
      show 2 * m - i - 1 = 2 * m - 1 - i by omega, Nat.cast_add]
    ring
  simp only [add_mul, Finset.sum_add_distrib]
  rw [first_sum m i hi, second_sum m i hm hi, third_sum m i hm hi]
  linarith

theorem right_kernel (n : ℕ) (hn : Even n) :
    matrixInt n *ᵥ (fun j : Fin (n + 1) => vector (n + 1) j.val) = 0 := by
  ext i
  change (∑ j : Fin (n + 1), entry n i.val j.val * vector (n + 1) j.val) = 0
  rw [Fin.sum_univ_eq_sum_range
    (fun j : ℕ => entry n i.val j * vector (n + 1) j) (n + 1)]
  have hm : Odd (n + 1) := by simpa using hn.add_odd (show Odd (1 : ℕ) by decide)
  have he : 2 * (n + 1) - 1 - i.val = 2 * n + 1 - i.val := by omega
  simpa only [entry, he] using row_sum (n + 1) i.val hm i.isLt

theorem vector_ne_zero (n : ℕ) (hn : 0 < n) :
    (fun j : Fin (n + 1) => vector (n + 1) j.val) ≠ 0 := by
  intro h
  have h0 := congrFun h (⟨0, by omega⟩ : Fin (n + 1))
  have hp : 0 < (2 * (n + 1)).choose (n + 1) := Nat.choose_pos (by omega)
  have hne : (0 : ℕ) ≠ n + 1 - 1 := by omega
  simp only [vector, pow_zero, Nat.sub_zero, one_mul, if_neg hne,
    sub_zero, Pi.zero_apply] at h0
  exact (Nat.cast_ne_zero.mpr (by omega)) h0

theorem det_eq_zero (n : ℕ) (hn : Even n) (hp : 0 < n) :
    (matrixInt n).det = 0 := by
  exact Matrix.exists_mulVec_eq_zero_iff.mp
    ⟨_, vector_ne_zero n hp, right_kernel n hn⟩

end OMA.MO309485.EvenKernel



theorem OMA.solution : type_of% @OMA.S_mo_309485.main := by
  intro n
  constructor
  · intro heig
    by_contra hpos
    have hn : n = 0 := by omega
    subst n
    exact OMA.MO309485.Bridge.zero_index_not_eig heig
  · intro hn
    apply OMA.MO309485.Bridge.zero_eig_of_int_det n
    rcases Nat.even_or_odd n with heven | hodd
    · exact OMA.MO309485.EvenKernel.det_eq_zero n heven hn
    · exact OMA.MO309485.OddKernel.det_eq_zero n hodd
