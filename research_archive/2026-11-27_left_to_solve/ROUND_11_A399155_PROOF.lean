import OMAStatements.S_oeis_a399155
import Mathlib

/-!
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
Conjecture: Jaylen Dilkhush, OEIS A399155 (2026).
The complete argument uses an upper bound for greatest-factor subtraction
and the exact even-input count for smallest-factor subtraction.
The greatest-factor list lemmas below follow the standard primeFactorsList
API, as in the Apache-2.0 Formal Conjectures Authors' MaxPrimeFac module.
-/

namespace OMA.A399155Proof

open OMA.S_oeis_a399155

lemma greatest_mem (n : ℕ) (hn : 1 < n) :
    greatestPrimeFactor n ∈ n.primeFactorsList := by
  have hlist : n.primeFactorsList ≠ [] := (Nat.primeFactorsList_ne_nil n).2 hn
  simpa [greatestPrimeFactor, hn.ne', List.getLastI_eq_getLast?_getD,
    List.getLast?_eq_getLast_of_ne_nil hlist] using List.getLast_mem hlist

lemma greatest_prime (n : ℕ) (hn : 1 < n) :
    Nat.Prime (greatestPrimeFactor n) :=
  Nat.prime_of_mem_primeFactorsList (greatest_mem n hn)

lemma greatest_dvd (n : ℕ) (hn : 1 < n) : greatestPrimeFactor n ∣ n :=
  Nat.dvd_of_mem_primeFactorsList (greatest_mem n hn)

lemma subtract_prime_ne_one (n p : ℕ) (hp : p.Prime) (hd : p ∣ n) :
    n - p ≠ 1 := by
  intro h
  have hdiv : p ∣ n - p := Nat.dvd_sub hd (dvd_refl p)
  rw [h] at hdiv
  exact hp.not_dvd_one hdiv

lemma greatest_half_bound (fuel n : ℕ) (hn : n ≠ 1) :
    2 * steps greatestPrimeFactor fuel n ≤ n := by
  induction fuel generalizing n with
  | zero => simp [steps]
  | succ fuel ih =>
      by_cases hzero : n = 0
      · simp [steps, hzero]
      have hlarge : 1 < n := by omega
      have hp := greatest_prime n hlarge
      have hd := greatest_dvd n hlarge
      have hnext := subtract_prime_ne_one n (greatestPrimeFactor n) hp hd
      have hi := ih (n - greatestPrimeFactor n) hnext
      have hp2 := hp.two_le
      have hle : greatestPrimeFactor n ≤ n := Nat.le_of_dvd (by omega) hd
      simp only [steps, if_neg hzero]
      omega

lemma smallest_even_exact (fuel n : ℕ) (hsize : n ≤ fuel) (hn : Even n) :
    2 * steps Nat.minFac fuel n = n := by
  induction fuel generalizing n with
  | zero =>
      have : n = 0 := by omega
      simp [this, steps]
  | succ fuel ih =>
      by_cases hzero : n = 0
      · simp [steps, hzero]
      have hmod : n % 2 = 0 := Nat.even_iff.mp hn
      have hn2 : 2 ≤ n := by omega
      have hfac : n.minFac = 2 := (Nat.minFac_eq_two_iff n).2 hn.two_dvd
      have hsub : Even (n - 2) := Nat.even_iff.mpr (by omega)
      have hi := ih (n - 2) (by omega) hsub
      simp only [steps, if_neg hzero, hfac]
      omega

lemma subtract_smallest_even (n : ℕ) (hn : 2 ≤ n) : Even (n - n.minFac) := by
  by_cases heven : Even n
  · have hfac : n.minFac = 2 := (Nat.minFac_eq_two_iff n).2 heven.two_dvd
    have hmod : n % 2 = 0 := Nat.even_iff.mp heven
    rw [hfac]
    exact Nat.even_iff.mpr (by omega)
  · have hodd : Odd n := Nat.not_even_iff_odd.mp heven
    have hfacodd : Odd n.minFac :=
      (Nat.minFac_prime (by omega)).odd_of_ne_two (by
        intro h
        have htwo : 2 ∣ n := h ▸ Nat.minFac_dvd n
        exact heven (even_iff_two_dvd.mpr htwo))
    exact hodd.tsub_odd hfacodd

lemma full_comparison (n : ℕ) (hn : 2 ≤ n) : largestSteps n ≤ smallestSteps n := by
  cases n with
  | zero => omega
  | succ m =>
      have hp := greatest_prime (m + 1) (by omega)
      have hd := greatest_dvd (m + 1) (by omega)
      have hnext := subtract_prime_ne_one (m + 1) (greatestPrimeFactor (m + 1)) hp hd
      have hsmall_pos := Nat.minFac_pos (m + 1)
      have hsmall_le : (m + 1).minFac ≤ m + 1 := Nat.minFac_le (by omega)
      have hlarge_le : greatestPrimeFactor (m + 1) ≤ m + 1 :=
        Nat.le_of_dvd (by omega) hd
      have horder : (m + 1).minFac ≤ greatestPrimeFactor (m + 1) :=
        Nat.minFac_le_of_dvd hp.two_le hd
      have hf := smallest_even_exact m (m + 1 - (m + 1).minFac)
        (by omega) (subtract_smallest_even (m + 1) hn)
      have hg := greatest_half_bound m (m + 1 - greatestPrimeFactor (m + 1)) hnext
      simp only [largestSteps, smallestSteps, steps, Nat.succ_ne_zero, if_false]
      omega

end OMA.A399155Proof

theorem OMA.solution : type_of% @OMA.S_oeis_a399155.main := by
  exact OMA.A399155Proof.full_comparison
