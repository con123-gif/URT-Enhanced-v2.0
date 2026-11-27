import OMAStatements.S_oeis_a372561

/-!
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
Conjectures: Antti Karttunen, OEIS A372561, May2024.
Classical Jacobsthal identities, ordinary digit-sum carry inequalities,
and the known finite reduced-Collatz trajectory of27 are acknowledged.
The new target is the complete three-clause minimum-summand assertion,
with uniform lift exponents and the full infinite array retained.
No new general method or worldwide-priority claim is made.
-/


/-!
Base4 digit-weight infrastructure for the complete A372561 lift argument.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Complete candidates await pinned checking.
-/

namespace A372561Certificate

def D (n : ℕ) : ℕ := (Nat.digits 4 n).sum

@[simp] lemma D_zero : D 0 = 0 := by simp [D]
@[simp] lemma D_one : D 1 = 1 := by norm_num [D, Nat.digits_of_lt]
@[simp] lemma D_two : D 2 = 2 := by norm_num [D, Nat.digits_of_lt]

lemma D_step (q r : ℕ) (hr : r < 4) : D (4 * q + r) = D q + r := by
  by_cases hz : q = 0 ∧ r = 0
  · rcases hz with ⟨rfl, rfl⟩
    simp
  · have hh : r ≠ 0 ∨ q ≠ 0 := by omega
    have hd := Nat.digits_add 4 (by decide) r q hr hh
    have he : 4 * q + r = r + 4 * q := by omega
    rw [D, he, hd]
    simp [D, Nat.add_comm]

lemma D_quotient (n : ℕ) : D n = D (n / 4) + n % 4 := by
  have h := D_step (n / 4) (n % 4) (Nat.mod_lt _ (by decide))
  have he : 4 * (n / 4) + n % 4 = n := by omega
  rw [he] at h
  exact h

@[simp] lemma D_mul_four (n : ℕ) : D (4 * n) = D n := by
  simpa using D_step n 0 (by decide)

lemma D_shift (n e : ℕ) : D (4 ^ e * n) = D n := by
  induction e with
  | zero => simp
  | succ e ih =>
    have he : 4 ^ (e + 1) * n = 4 * (4 ^ e * n) := by rw [pow_succ]; ring
    rw [he, D_mul_four, ih]

lemma D_succ_le (n : ℕ) : D (n + 1) ≤ D n + 1 := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases hn : n = 0
    · subst n
      simp
    · have hq : n / 4 < n := Nat.div_lt_self (by omega) (by decide)
      have hd := D_quotient n
      have hr := Nat.mod_lt n (by decide : 0 < 4)
      by_cases hc : n % 4 < 3
      · have he : n + 1 = 4 * (n / 4) + (n % 4 + 1) := by omega
        rw [he, D_step _ _ (by omega)]
        omega
      · have h3 : n % 4 = 3 := by omega
        have he : n + 1 = 4 * (n / 4 + 1) := by omega
        rw [he, D_mul_four]
        have hh := ih (n / 4) hq
        omega

lemma D_add_le (a b : ℕ) : D (a + b) ≤ D a + D b := by
  induction a using Nat.strong_induction_on generalizing b with
  | h a ih =>
    by_cases ha : a = 0
    · subst a
      simp
    · have hq : a / 4 < a := Nat.div_lt_self (by omega) (by decide)
      have hh := ih (a / 4) hq (b / 4)
      have hda := D_quotient a
      have hdb := D_quotient b
      have hra := Nat.mod_lt a (by decide : 0 < 4)
      have hrb := Nat.mod_lt b (by decide : 0 < 4)
      by_cases hc : a % 4 + b % 4 < 4
      · have he : a + b = 4 * (a / 4 + b / 4) + (a % 4 + b % 4) := by omega
        rw [he, D_step _ _ hc]
        omega
      · have he : a + b = 4 * (a / 4 + b / 4 + 1) + (a % 4 + b % 4 - 4) := by omega
        rw [he, D_step _ _ (by omega)]
        have hs := D_succ_le (a / 4 + b / 4)
        omega

lemma D_even_succ (a : ℕ) : D (2 * a + 1) = D (2 * a) + 1 := by
  have ha : a % 2 < 2 := Nat.mod_lt _ (by decide)
  have hd : a % 2 + 2 * (a / 2) = a := by omega
  have he0 : 2 * a = 4 * (a / 2) + 2 * (a % 2) := by omega
  have he1 : 2 * a + 1 = 4 * (a / 2) + (2 * (a % 2) + 1) := by omega
  rw [he1, he0, D_step _ _ (by omega), D_step _ _ (by omega)]
  omega

lemma D_borrow (a e : ℕ) (ha : 1 ≤ a) :
    D (a * 4 ^ e - 1) = D (a - 1) + 3 * e := by
  induction e with
  | zero => simp
  | succ e ih =>
    have hp : 0 < 4 ^ e := by positivity
    have hprod : 1 ≤ a * 4 ^ e := by
      have hpos := Nat.mul_pos (by omega : 0 < a) hp
      omega
    have hpow : a * 4 ^ (e + 1) = 4 * (a * 4 ^ e) := by
      rw [pow_succ]
      ring
    have he : a * 4 ^ (e + 1) - 1 = 4 * (a * 4 ^ e - 1) + 3 := by
      rw [hpow]
      omega
    rw [he, D_step _ _ (by decide), ih]
    omega

lemma D_double_borrow (a e : ℕ) (ha : 1 ≤ a) :
    D (2 * (a * 4 ^ e - 1)) = D (2 * (a - 1)) + 3 * e := by
  induction e with
  | zero => simp
  | succ e ih =>
    have hp : 0 < 4 ^ e := by positivity
    have hprod : 1 ≤ a * 4 ^ e := by
      have hpos := Nat.mul_pos (by omega : 0 < a) hp
      omega
    have hpow : a * 4 ^ (e + 1) = 4 * (a * 4 ^ e) := by
      rw [pow_succ]
      ring
    have he : 2 * (a * 4 ^ (e + 1) - 1) = 4 * (2 * (a * 4 ^ e - 1) + 1) + 2 := by
      rw [hpow]
      omega
    rw [he, D_step _ _ (by decide), D_even_succ, ih]
    omega

lemma D_double_pred {q : ℕ} (hq : 2 ≤ q) (he : q % 2 = 0) :
    D (2 * (q - 1)) ≥ D (2 * q) + 1 := by
  have hq2 : 1 ≤ q / 2 := by omega
  have he1 : 2 * (q - 1) = 4 * (q / 2 - 1) + 2 := by omega
  have he2 : 2 * q = 4 * (q / 2) := by omega
  rw [he1, D_step _ _ (by decide), he2, D_mul_four]
  have hs := D_succ_le (q / 2 - 1)
  have hx : q / 2 - 1 + 1 = q / 2 := by omega
  rw [hx] at hs
  omega

lemma D_le_double (q : ℕ) : D q ≤ 2 * D (2 * q) := by
  have hh := D_add_le (2 * q) (2 * q)
  have he : 2 * q + 2 * q = 4 * q := by omega
  rw [he, D_mul_four] at hh
  omega

end A372561Certificate

/-!
Base4 digit-weight lift identities for A372561.
Prerequisite: the unchanged a372561_digits_helpers.lean in the same namespace.
Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6;
exact serving variant not exposed. Candidates await pinned checking.
-/

namespace A372561Certificate

lemma D_shift_right (n e : ℕ) : D (n * 4 ^ e) = D n := by
  simpa [Nat.mul_comm] using D_shift n e

lemma D_plus_four {q E : ℕ} (hq : q % 2 = 0) (hE : 1 ≤ E) :
    D (q * 4 ^ E + 4) = D q + 1 ∧
      D (2 * (q * 4 ^ E + 4)) = D (2 * q) + 2 := by
  obtain ⟨e, rfl⟩ : ∃ e, E = e + 1 := ⟨E - 1, by omega⟩
  let a := q / 2
  have hqa : q = 2 * a := by dsimp [a]; omega
  have hpow : q * 4 ^ (e + 1) = 4 * (q * 4 ^ e) := by
    rw [pow_succ]
    ring
  have hA : q * 4 ^ e = 2 * (a * 4 ^ e) := by rw [hqa]; ring
  have he1 : q * 4 ^ (e + 1) + 4 = 4 * (2 * (a * 4 ^ e) + 1) := by
    rw [hpow, hA]
    ring
  have he2 : 2 * (q * 4 ^ (e + 1) + 4) = 4 * (4 * (a * 4 ^ e) + 2) := by
    rw [he1]
    ring
  have hdA : D (2 * (a * 4 ^ e)) = D q := by
    rw [← hA]
    exact D_shift_right q e
  have hd2A : D (a * 4 ^ e) = D (2 * q) := by
    have ht : (2 * q) * 4 ^ e = 4 * (a * 4 ^ e) := by rw [hqa]; ring
    have hs := D_shift_right (2 * q) e
    rw [ht, D_mul_four] at hs
    exact hs
  constructor
  · rw [he1, D_mul_four, D_even_succ, hdA]
  · rw [he2, D_mul_four, D_step _ 2 (by decide), hd2A]

lemma D_minus_four {q E : ℕ} (hq : 1 ≤ q) (hE : 1 ≤ E) :
    D (q * 4 ^ E - 4) = D (q - 1) + 3 * (E - 1) ∧
      D (2 * (q * 4 ^ E - 4)) = D (2 * (q - 1)) + 3 * (E - 1) := by
  obtain ⟨e, rfl⟩ : ∃ e, E = e + 1 := ⟨E - 1, by omega⟩
  simp only [Nat.add_sub_cancel]
  have hp : 0 < 4 ^ e := by positivity
  have hprod : 1 ≤ q * 4 ^ e := by
    have hpos := Nat.mul_pos (by omega : 0 < q) hp
    omega
  have hpow : q * 4 ^ (e + 1) = 4 * (q * 4 ^ e) := by
    rw [pow_succ]
    ring
  have he1 : q * 4 ^ (e + 1) - 4 = 4 * (q * 4 ^ e - 1) := by
    rw [hpow]
    omega
  have he2 : 2 * (q * 4 ^ (e + 1) - 4) = 4 * (2 * (q * 4 ^ e - 1)) := by
    rw [he1]
    ring
  constructor
  · rw [he1, D_mul_four, D_borrow q e hq]
  · rw [he2, D_mul_four, D_double_borrow q e hq]

lemma D_double_minus_eight {q E : ℕ} (hq : 1 ≤ q) (hE : 2 ≤ E) :
    D (2 * (q * 4 ^ E - 8)) = D (2 * (q - 1)) + 1 + 3 * (E - 2) := by
  obtain ⟨e, rfl⟩ : ∃ e, E = e + 2 := ⟨E - 2, by omega⟩
  simp only [Nat.add_sub_cancel]
  have hp : 0 < 4 ^ e := by positivity
  have hprod : 1 ≤ q * 4 ^ e := by
    have hpos := Nat.mul_pos (by omega : 0 < q) hp
    omega
  have hpow : q * 4 ^ (e + 2) = 16 * (q * 4 ^ e) := by
    rw [pow_add]
    norm_num
    ring
  have htwo : (2 * q) * 4 ^ e = 2 * (q * 4 ^ e) := by ring
  have he : 2 * (q * 4 ^ (e + 2) - 8) = 16 * ((2 * q) * 4 ^ e - 1) := by
    rw [hpow, htwo]
    omega
  have hs : D (16 * ((2 * q) * 4 ^ e - 1)) = D ((2 * q) * 4 ^ e - 1) := by
    simpa using D_shift ((2 * q) * 4 ^ e - 1) 2
  have hpred : 2 * q - 1 = 2 * (q - 1) + 1 := by omega
  rw [he, hs, D_borrow (2 * q) e (by omega), hpred, D_even_succ]

end A372561Certificate


/-
Existence and extremal bridges for the literal global minimum coin count.
These lemmas do not assume a greedy algorithm is optimal.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

open OMA.S_oeis_a372561

namespace A372561Certificate

@[simp] theorem value_zero : value (0 : Multiset ℕ) = 0 := by
  simp [value]

@[simp] theorem value_add (m t : Multiset ℕ) : value (m + t) = value m + value t := by
  simp [value]

@[simp] theorem value_single (i : ℕ) : value ({i} : Multiset ℕ) = jac i := by
  simp [value]

@[simp] theorem value_replicate (r i : ℕ) :
    value (Multiset.replicate r i) = r * jac i := by
  simp [value, nsmul_eq_mul]

theorem represents_ones (n : ℕ) : represents n (Multiset.replicate n 2) := by
  refine ⟨?_, ?_⟩
  · intro i hi
    have hi2 : i = 2 := (Multiset.mem_replicate.mp hi).2
    omega
  · simp [value, jac]

theorem minCoins_witness (n : ℕ) :
    ∃ m : Multiset ℕ, represents n m ∧ m.card = minCoins n := by
  have hs : {r : ℕ | ∃ m : Multiset ℕ, represents n m ∧ m.card = r}.Nonempty :=
    ⟨n, Multiset.replicate n 2, represents_ones n, by simp⟩
  unfold minCoins
  exact csInf_mem hs

theorem minCoins_le {n : ℕ} {m : Multiset ℕ} (hm : represents n m) :
    minCoins n ≤ m.card := by
  unfold minCoins
  exact csInf_le (OrderBot.bddBelow _) ⟨m, hm, rfl⟩

theorem minCoins_eq_of_bounds {n r : ℕ}
    (upper : ∃ m : Multiset ℕ, represents n m ∧ m.card = r)
    (lower : ∀ m : Multiset ℕ, represents n m → r ≤ m.card) : minCoins n = r := by
  obtain ⟨m, hm, hcard⟩ := upper
  apply le_antisymm
  · calc
      minCoins n ≤ m.card := minCoins_le hm
      _ = r := hcard
  · obtain ⟨t, ht, htcard⟩ := minCoins_witness n
    calc
      r ≤ t.card := lower t ht
      _ = minCoins n := htcard

theorem minCoins_pos {n : ℕ} (hn : 0 < n) : 0 < minCoins n := by
  apply Nat.pos_of_ne_zero
  intro hz
  obtain ⟨m, hm, hcard⟩ := minCoins_witness n
  have hm0 : m = 0 := Multiset.card_eq_zero.mp (hcard.trans hz)
  have hn0 : n = 0 := by simpa [hm0, value] using hm.2.symm
  omega

end A372561Certificate


/-
Exact arithmetic helpers for the source-defined A372561 transformations.
Assemble after the faithful statement. No conjecture or valuation identity
is assumed; all valuations are the genuine padicValNat 2.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).
Helper candidate awaiting the pinned checker; no full-solution claim.
-/

namespace A372561Certificate

open OMA.S_oeis_a372561

theorem four_pow_two (E : ℕ) : 4 ^ E = 2 ^ (2 * E) := by
  calc
    4 ^ E = (2 ^ 2) ^ E := rfl
    _ = 2 ^ (2 * E) := (pow_mul 2 2 E).symm

theorem four_pow_square (E : ℕ) : 4 ^ E = (2 ^ E) ^ 2 := by
  calc
    4 ^ E = 2 ^ (2 * E) := four_pow_two E
    _ = 2 ^ (E * 2) := by rw [Nat.mul_comm 2 E]
    _ = (2 ^ E) ^ 2 := pow_mul 2 E 2

theorem three_dvd_four_pow_sub_one (E : ℕ) : 3 ∣ 4 ^ E - 1 := by
  have hp : 0 < 4 ^ E := pow_pos (by decide) E
  have hm : 4 ^ E % 3 = 1 := by norm_num [Nat.pow_mod]
  apply Nat.dvd_of_mod_eq_zero
  omega

theorem three_lift (E y : ℕ) :
    3 * lift E y + 1 = (3 * y + 1) * 4 ^ E := by
  have hq : 3 * ((4 ^ E - 1) / 3) = 4 ^ E - 1 :=
    Nat.mul_div_cancel' (three_dvd_four_pow_sub_one E)
  have hp : 0 < 4 ^ E := pow_pos (by decide) E
  have hs : 4 ^ E - 1 + 1 = 4 ^ E := Nat.sub_add_cancel (by omega)
  unfold lift
  nlinarith

@[simp] theorem lift_zero (y : ℕ) : lift 0 y = y := by
  simp [lift]

@[simp] theorem lift_one (y : ℕ) : lift 1 y = 4 * y + 1 := by
  norm_num [lift]

theorem valuation_dvd (y : ℕ) : 2 ^ valuation y ∣ 3 * y + 1 :=
  pow_padicValNat_dvd

theorem reduced_mul_pow (y : ℕ) :
    2 ^ valuation y * reduced y = 3 * y + 1 := by
  exact Nat.mul_div_cancel' (valuation_dvd y)

theorem stretch_eq_lift (y : ℕ) : stretch y = lift (valuation y) (reduced y) := by
  unfold stretch lift
  congr 1
  rw [← reduced_mul_pow y, four_pow_square]
  ring

theorem valuation_lift (E y : ℕ) :
    valuation (lift E y) = 2 * E + valuation y := by
  letI : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
  unfold valuation
  rw [three_lift]
  rw [padicValNat.mul (by omega : 3 * y + 1 ≠ 0)
    (by positivity : 4 ^ E ≠ 0)]
  rw [four_pow_two, padicValNat.prime_pow]
  omega

theorem reduced_lift (E y : ℕ) : reduced (lift E y) = reduced y := by
  unfold reduced
  rw [three_lift, valuation_lift, pow_add, ← four_pow_two]
  rw [Nat.mul_comm (3 * y + 1) (4 ^ E)]
  exact Nat.mul_div_mul_left (3 * y + 1) (2 ^ valuation y) (by positivity : 0 < 4 ^ E)

theorem stretch_lift (E y : ℕ) :
    stretch (lift E y) = lift (2 * E + valuation y) (reduced y) := by
  rw [stretch_eq_lift, valuation_lift, reduced_lift]

end A372561Certificate



/-
Exact factorization certificates for the A372561 reduced Collatz orbit.
Assemble after the faithful statement; no valuation computation or orbit
identity is assumed. All finite inputs reduce to integer equalities and
oddness tests.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).
Candidate awaiting pinned verification.
-/

namespace A372561Certificate

open OMA.S_oeis_a372561

theorem valuation_of_factor (y v z : ℕ)
    (hf : 3 * y + 1 = 2 ^ v * z) (hz : 0 < z) (ho : z % 2 = 1) :
    valuation y = v := by
  letI : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
  have hnd : ¬ 2 ∣ z := by
    intro hd
    have hm : z % 2 = 0 := Nat.mod_eq_zero_of_dvd hd
    omega
  unfold valuation
  rw [hf, padicValNat.mul (by positivity : 2 ^ v ≠ 0) (by omega : z ≠ 0),
    padicValNat.prime_pow, padicValNat.eq_zero_of_not_dvd hnd, Nat.add_zero]

theorem reduced_of_factor (y v z : ℕ)
    (hf : 3 * y + 1 = 2 ^ v * z) (hz : 0 < z) (ho : z % 2 = 1) :
    reduced y = z := by
  unfold reduced
  rw [valuation_of_factor y v z hf hz ho, hf]
  exact Nat.mul_div_cancel_left z (by positivity : 0 < 2 ^ v)

theorem factor_data (y v z : ℕ)
    (hf : 3 * y + 1 = 2 ^ v * z) (hz : 0 < z) (ho : z % 2 = 1) :
    valuation y = v ∧ reduced y = z :=
  ⟨valuation_of_factor y v z hf hz ho, reduced_of_factor y v z hf hz ho⟩

end A372561Certificate



/-
Generic iteration reduction for A372561. Assemble after the faithful source
statement and a372561_valuation_helpers.lean. No orbit table, minimum-count
claim, or valuation identity is assumed here.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).
Candidate awaiting pinned verification; no full-solution claim.
-/

namespace A372561Certificate

open OMA.S_oeis_a372561

theorem stretch_iterate_lift (m y : ℕ) :
    ∃ E : ℕ,
      (stretch^[m + 1]) y = lift E ((reduced^[m + 1]) y) ∧
      valuation ((reduced^[m]) y) ≤ E := by
  induction m with
  | zero =>
    refine ⟨valuation y, ?_, ?_⟩
    · simpa using stretch_eq_lift y
    · simp
  | succ m ih =>
    obtain ⟨E, hE, hbound⟩ := ih
    refine ⟨2 * E + valuation ((reduced^[m + 1]) y), ?_, ?_⟩
    · rw [Function.iterate_succ_apply' stretch (m + 1) y, hE, stretch_lift,
        Function.iterate_succ_apply' reduced (m + 1) y]
    · simpa only [Nat.succ_eq_add_one] using
        (show valuation ((reduced^[m + 1]) y) ≤
          2 * E + valuation ((reduced^[m + 1]) y) by omega)

theorem grid_lift (n k : ℕ) (hn : 2 ≤ n) (hk : 1 ≤ k) :
    ∃ E : ℕ,
      grid n k = lift E ((reduced^[n + k - 2]) 27) ∧
      valuation ((reduced^[n + k - 3]) 27) ≤ E := by
  obtain ⟨E, hE, hbound⟩ :=
    stretch_iterate_lift (n - 2) ((reduced^[k - 1]) 27)
  have hn1 : n - 2 + 1 = n - 1 := by omega
  have hsum1 : n - 2 + 1 + (k - 1) = n + k - 2 := by omega
  have hsum0 : n - 2 + (k - 1) = n + k - 3 := by omega
  refine ⟨E, ?_, ?_⟩
  · calc
      grid n k = (stretch^[n - 2 + 1]) ((reduced^[k - 1]) 27) := by
        simp only [grid, hn1]
      _ = lift E ((reduced^[n - 2 + 1]) ((reduced^[k - 1]) 27)) := hE
      _ = lift E ((reduced^[n + k - 2]) 27) := by
        rw [← Function.iterate_add_apply, hsum1]
  · simpa only [← Function.iterate_add_apply, hsum0] using hbound

end A372561Certificate


namespace A372561Certificate
open OMA.S_oeis_a372561

lemma alt_step (n : ℕ) :
    (n % 2 = 0 → jac (n + 1) = 2 * jac n + 1) ∧
    (n % 2 = 1 → 2 * jac n = jac (n + 1) + 1) := by
  induction n with
  | zero => norm_num [jac]
  | succ n ih =>
    have hr : jac (n + 2) = jac (n + 1) + 2 * jac n := rfl
    rcases Nat.mod_two_eq_zero_or_one n with h | h
    · have hh := ih.1 h
      constructor
      · intro hn
        omega
      · intro hn
        change 2 * jac (n + 1) = jac (n + 2) + 1
        rw [hr]
        omega
    · have hh := ih.2 h
      constructor
      · intro hn
        change jac (n + 2) = 2 * jac (n + 1) + 1
        rw [hr]
        omega
      · intro hn
        omega


lemma binary_formula (n : ℕ) :
    3 * jac n + (if n % 2 = 0 then 1 else 0) =
      2 ^ n + (if n % 2 = 1 then 1 else 0) := by
  induction n with
  | zero => norm_num [jac]
  | succ n ih =>
    rcases Nat.mod_two_eq_zero_or_one n with he | ho
    · have hn : (n + 1) % 2 = 1 := by omega
      have hs := (alt_step n).1 he
      simp only [he, hn, show ¬ (0 = 1) by decide, show ¬ (1 = 0) by decide,
        ↓reduceIte] at ih ⊢
      rw [pow_succ]
      omega
    · have hn : (n + 1) % 2 = 0 := by omega
      have hs := (alt_step n).2 ho
      simp only [ho, hn, show ¬ (0 = 1) by decide, show ¬ (1 = 0) by decide,
        ↓reduceIte] at ih ⊢
      rw [pow_succ]
      omega

def evenCount (m : Multiset ℕ) : ℕ :=
  (m.map fun i => if i % 2 = 0 then 1 else 0).sum

def oddCount (m : Multiset ℕ) : ℕ :=
  (m.map fun i => if i % 2 = 1 then 1 else 0).sum

def powerSum (m : Multiset ℕ) : ℕ := (m.map fun i => 2 ^ i).sum

lemma counts_card (m : Multiset ℕ) : evenCount m + oddCount m = m.card := by
  induction m using Multiset.induction_on with
  | empty => simp [evenCount, oddCount]
  | @cons i m ih =>
    rcases Nat.mod_two_eq_zero_or_one i with he | ho
    · simp [evenCount, oddCount, he] at *
      omega
    · simp [evenCount, oddCount, ho] at *
      omega

lemma jac_power_balance (m : Multiset ℕ) :
    3 * value m + evenCount m = powerSum m + oddCount m := by
  induction m using Multiset.induction_on with
  | empty => simp [value, evenCount, oddCount, powerSum]
  | @cons i m ih =>
    have hi := binary_formula i
    simp only [value, evenCount, oddCount, powerSum, Multiset.map_cons,
      Multiset.sum_cons] at ih ⊢
    omega

lemma D_power_two (i : ℕ) :
    D (2 ^ i) = if i % 2 = 0 then 1 else 2 := by
  rcases Nat.mod_two_eq_zero_or_one i with he | ho
  · have hi : i = 2 * (i / 2) := by omega
    have hp : 2 ^ i = 4 ^ (i / 2) * 1 := by
      calc
        2 ^ i = 2 ^ (2 * (i / 2)) := by congr 1 <;> omega
        _ = 4 ^ (i / 2) * 1 := by rw [pow_mul]; norm_num
    rw [hp, D_shift]
    simp [he]
  · have hi : i = 2 * (i / 2) + 1 := by omega
    have hp : 2 ^ i = 4 ^ (i / 2) * 2 := by
      calc
        2 ^ i = 2 ^ (2 * (i / 2) + 1) := by congr 1 <;> omega
        _ = 4 ^ (i / 2) * 2 := by rw [pow_add, pow_mul]; norm_num
    rw [hp, D_shift]
    simp [ho]

lemma D_double_power_two (i : ℕ) :
    D (2 * 2 ^ i) = if i % 2 = 0 then 2 else 1 := by
  have he : 2 * 2 ^ i = 2 ^ (i + 1) := by rw [pow_succ]; omega
  rw [he, D_power_two]
  rcases Nat.mod_two_eq_zero_or_one i with h | h <;> simp [h, show (i + 1) % 2 = 1 - i % 2 by omega]

lemma power_weights (m : Multiset ℕ) :
    D (powerSum m) ≤ evenCount m + 2 * oddCount m ∧
    D (2 * powerSum m) ≤ 2 * evenCount m + oddCount m := by
  induction m using Multiset.induction_on with
  | empty => simp [powerSum, evenCount, oddCount]
  | @cons i m ih =>
    have ha := D_add_le (2 ^ i) (powerSum m)
    have hb := D_add_le (2 * 2 ^ i) (2 * powerSum m)
    have hpi := D_power_two i
    have hpdi := D_double_power_two i
    have hps : powerSum (i ::ₘ m) = 2 ^ i + powerSum m := by simp [powerSum]
    have hps2 : 2 * powerSum (i ::ₘ m) = 2 * 2 ^ i + 2 * powerSum m := by rw [hps]; omega
    rcases Nat.mod_two_eq_zero_or_one i with he | ho
    · simp only [he, if_true] at hpi hpdi
      have hcs : evenCount (i ::ₘ m) = 1 + evenCount m := by simp [evenCount, he]
      have hco : oddCount (i ::ₘ m) = oddCount m := by simp [oddCount, he]
      constructor
      · rw [hps, hcs, hco]
        omega
      · rw [hps2, hcs, hco]
        omega
    · simp only [ho, show ¬ (1 = 0) by decide, if_false] at hpi hpdi
      have hcs : evenCount (i ::ₘ m) = evenCount m := by simp [evenCount, ho]
      have hco : oddCount (i ::ₘ m) = 1 + oddCount m := by simp [oddCount, ho]
      constructor
      · rw [hps, hcs, hco]
        omega
      · rw [hps2, hcs, hco]
        omega

lemma powerSum_four_dvd {n : ℕ} {m : Multiset ℕ} (hm : represents n m) :
    4 ∣ powerSum m := by
  have hvalid := hm.1
  clear hm
  induction m using Multiset.induction_on with
  | empty => simp [powerSum]
  | @cons i m ih =>
    have hi : 2 ≤ i := hvalid i (by simp)
    have hrest : ∀ j ∈ m, 2 ≤ j := by intro j hj; exact hvalid j (by simp [hj])
    have hpow : 4 ∣ 2 ^ i := by
      refine ⟨2 ^ (i - 2), ?_⟩
      have he : i = 2 + (i - 2) := by omega
      rw [he, pow_add]
      norm_num
    simpa [powerSum] using dvd_add hpow (ih hrest)

end A372561Certificate

namespace A372561Certificate
open OMA.S_oeis_a372561

lemma shift_powerSum (m : Multiset ℕ) (E : ℕ) :
    powerSum (m.map (fun i => i + 2 * E)) = 4 ^ E * powerSum m := by
  induction m using Multiset.induction_on with
  | empty => simp [powerSum]
  | @cons i m ih =>
    have hp : 2 ^ (i + 2 * E) = 4 ^ E * 2 ^ i := by
      rw [pow_add, pow_mul]
      norm_num
      ring
    simp only [Multiset.map_cons, powerSum, Multiset.map_cons, Multiset.sum_cons] at ih ⊢
    rw [hp, ih]
    ring

lemma shift_evenCount (m : Multiset ℕ) (E : ℕ) :
    evenCount (m.map (fun i => i + 2 * E)) = evenCount m := by
  simp [evenCount, Multiset.map_map, Function.comp_def, Nat.add_mod]

lemma shift_oddCount (m : Multiset ℕ) (E : ℕ) :
    oddCount (m.map (fun i => i + 2 * E)) = oddCount m := by
  simp [oddCount, Multiset.map_map, Function.comp_def, Nat.add_mod]

lemma lift_upper_witness {y R E : ℕ} (hE : 1 ≤ E) (w : List ℕ)
    (hp : powerSum (w : Multiset ℕ) = 3 * y + 1)
    (hc : evenCount (w : Multiset ℕ) = oddCount (w : Multiset ℕ) + 1)
    (hr : w.length = R) :
    ∃ m : Multiset ℕ, represents (lift E y) m ∧ m.card = R := by
  let m : Multiset ℕ := (w : Multiset ℕ).map (fun i => i + 2 * E)
  have hvalid : ∀ i ∈ m, 2 ≤ i := by
    intro i hi
    obtain ⟨j, hj, rfl⟩ := Multiset.mem_map.mp hi
    omega
  have hbalance := jac_power_balance m
  have he : evenCount m = evenCount (w : Multiset ℕ) := shift_evenCount _ _
  have ho : oddCount m = oddCount (w : Multiset ℕ) := shift_oddCount _ _
  have hpow : powerSum m = 4 ^ E * (3 * y + 1) := by
    change powerSum ((w : Multiset ℕ).map (fun i => i + 2 * E)) = _
    rw [shift_powerSum, hp]
  have hl := three_lift E y
  refine ⟨m, ⟨hvalid, ?_⟩, ?_⟩
  · nlinarith
  · simpa [m] using hr

/-- A finite digit-weight obstruction packet sufficient for every representation. -/
lemma lift_lower_packet {q R E N : ℕ} (hE : 1 ≤ E) (hR9 : R ≤ 9)
    (hRodd : R % 2 = 1)
    (hR : 3 * R = 2 * D q + 1 ∨ 3 * R + 1 = 2 * D (2 * q))
    (hN : 3 * N + 1 = q * 4 ^ E)
    (hplus : D (q * 4 ^ E + 4) = D q + 1 ∧
      D (2 * (q * 4 ^ E + 4)) = D (2 * q) + 2)
    (hminus3 : 3 * R ≤ max (2 * D (q * 4 ^ E - 4) - 3)
      (2 * D (2 * (q * 4 ^ E - 4)) + 3))
    (hminus7 : R = 9 → 7 < D (2 * (q * 4 ^ E - 8)))
    {m : Multiset ℕ} (hm : represents N m) : R ≤ m.card := by
  by_contra hh
  let e := evenCount m
  let o := oddCount m
  let P := powerSum m
  have hcard := counts_card m
  change e + o = m.card at hcard
  have hbal := jac_power_balance m
  rw [hm.2] at hbal
  change 3 * N + e = P + o at hbal
  have hweights := power_weights m
  change D P ≤ e + 2 * o ∧ D (2 * P) ≤ 2 * e + o at hweights
  have hPdiv := powerSum_four_dvd hm
  have hPmod : P % 4 = 0 := Nat.mod_eq_zero_of_dvd hPdiv
  have h4pow : 4 ∣ 4 ^ E := by
    refine ⟨4 ^ (E - 1), ?_⟩
    calc
      4 ^ E = 4 ^ ((E - 1) + 1) := by congr 1 <;> omega
      _ = 4 ^ (E - 1) * 4 := by rw [pow_succ]
      _ = 4 * 4 ^ (E - 1) := by omega
  have hNdiv : 4 ∣ 3 * N + 1 := by rw [hN]; exact dvd_mul_of_dvd_right h4pow q
  have hNmod : (3 * N + 1) % 4 = 0 := Nat.mod_eq_zero_of_dvd hNdiv
  have heo : (e + 3 * o) % 4 = 1 := by omega
  have hcases : e = o + 1 ∨ e = o + 5 ∨ o = e + 3 ∨ (e = 0 ∧ o = 7) := by omega
  rcases hcases with hs | hs | hs | hs
  · have hPeq : P = q * 4 ^ E := by omega
    rw [hPeq] at hweights
    have hd1 : D (q * 4 ^ E) = D q := by simpa [Nat.mul_comm] using D_shift q E
    have hd2 : D (2 * (q * 4 ^ E)) = D (2 * q) := by
      have heq : 2 * (q * 4 ^ E) = 4 ^ E * (2 * q) := by ring
      rw [heq, D_shift]
    rw [hd1, hd2] at hweights
    rcases hR with hR | hR <;> omega
  · have hPeq : P = q * 4 ^ E + 4 := by omega
    rw [hPeq, hplus.1, hplus.2] at hweights
    rcases hR with hR | hR <;> omega
  · have hPeq : P = q * 4 ^ E - 4 := by omega
    rw [hPeq] at hweights
    have hm3 : max (2 * D (q * 4 ^ E - 4) - 3)
        (2 * D (2 * (q * 4 ^ E - 4)) + 3) ≤ 3 * m.card := by
      apply max_le <;> omega
    omega
  · obtain ⟨he, ho⟩ := hs
    have hr : R = 9 := by omega
    have hPeq : P = q * 4 ^ E - 8 := by omega
    have hb := hminus7 hr
    rw [hPeq] at hweights
    omega

lemma lift_lower_uniform {q R E N : ℕ} (hE : 2 ≤ E) (hq : 2 ≤ q)
    (heven : q % 2 = 0) (hR9 : R ≤ 9) (hRodd : R % 2 = 1)
    (hR : 3 * R = 2 * D q + 1 ∨ 3 * R + 1 = 2 * D (2 * q))
    (hN : 3 * N + 1 = q * 4 ^ E)
    {m : Multiset ℕ} (hm : represents N m) : R ≤ m.card := by
  apply lift_lower_packet (by omega) hR9 hRodd hR hN (D_plus_four heven (by omega)) ?_ ?_ hm
  · have hd := D_minus_four (q := q) (E := E) (by omega) (by omega)
    have hpred1 := D_succ_le (q - 1)
    have heq : q - 1 + 1 = q := by omega
    rw [heq] at hpred1
    have hpred2 := D_double_pred hq heven
    rcases hR with hR | hR
    · apply le_trans ?_ (le_max_left _ _)
      rw [hd.1]
      omega
    · apply le_trans ?_ (le_max_right _ _)
      rw [hd.2]
      omega
  · intro hr
    have hd := D_double_minus_eight (q := q) (E := E) (by omega) hE
    have hpred := D_double_pred hq heven
    have hcomp := D_le_double q
    have hv : 7 ≤ D (2 * q) := by
      rcases hR with hR | hR <;> rw [hr] at hR <;> omega
    rw [hd]
    omega

lemma lift_lower_one {q R N : ℕ} (hq : 2 ≤ q) (heven : q % 2 = 0)
    (hR9 : R ≤ 9) (hRodd : R % 2 = 1)
    (hR : 3 * R = 2 * D q + 1 ∨ 3 * R + 1 = 2 * D (2 * q))
    (hN : 3 * N + 1 = q * 4)
    (hc3 : 3 * R ≤ max (2 * D (q - 1) - 3) (2 * D (2 * (q - 1)) + 3))
    (hc7 : R = 9 → 7 < D (2 * (q - 2)))
    {m : Multiset ℕ} (hm : represents N m) : R ≤ m.card := by
  apply lift_lower_packet (E := 1) (by decide) hR9 hRodd hR (by simpa using hN)
    (D_plus_four heven (by decide)) ?_ ?_ hm
  · have hd := D_minus_four (q := q) (E := 1) (by omega) (by decide)
    simp only [pow_one, Nat.sub_self, Nat.mul_zero, Nat.add_zero] at hd
    simp only [pow_one]
    rw [hd.1, hd.2]
    exact hc3
  · intro hr
    have heq : 2 * (q * 4 ^ 1 - 8) = 4 * (2 * (q - 2)) := by norm_num; omega
    rw [heq, D_mul_four]
    exact hc7 hr

end A372561Certificate

namespace A372561Certificate
open OMA.S_oeis_a372561

structure Core where
  y : ℕ
  T : ℕ
  v : ℕ
  w : List ℕ

def defaultCore : Core := ⟨1, 1, 2, [2]⟩

def coreRows : List Core := [
  ⟨41, 5, 1, [2, 3, 4, 5, 6]⟩,
  ⟨31, 5, 2, [1, 2, 3, 4, 6]⟩,
  ⟨47, 5, 1, [0, 0, 2, 3, 7]⟩,
  ⟨71, 5, 1, [1, 2, 4, 6, 7]⟩,
  ⟨107, 3, 1, [1, 6, 8]⟩,
  ⟨161, 5, 1, [2, 5, 6, 7, 8]⟩,
  ⟨121, 5, 2, [2, 3, 5, 6, 8]⟩,
  ⟨91, 3, 2, [1, 4, 8]⟩,
  ⟨137, 5, 1, [2, 3, 4, 7, 8]⟩,
  ⟨103, 5, 2, [1, 2, 4, 5, 8]⟩,
  ⟨155, 5, 1, [1, 4, 6, 7, 8]⟩,
  ⟨233, 7, 1, [2, 2, 2, 4, 5, 7, 9]⟩,
  ⟨175, 5, 2, [0, 0, 2, 3, 9]⟩,
  ⟨263, 5, 1, [1, 2, 4, 8, 9]⟩,
  ⟨395, 5, 1, [0, 0, 5, 7, 10]⟩,
  ⟨593, 7, 1, [2, 4, 5, 6, 7, 9, 10]⟩,
  ⟨445, 5, 2, [3, 4, 5, 8, 10]⟩,
  ⟨167, 7, 3, [1, 2, 4, 5, 6, 7, 8]⟩,
  ⟨251, 7, 1, [0, 0, 4, 5, 6, 7, 9]⟩,
  ⟨377, 5, 1, [2, 3, 5, 6, 10]⟩,
  ⟨283, 5, 2, [1, 4, 6, 8, 9]⟩,
  ⟨425, 7, 1, [2, 3, 4, 5, 6, 7, 10]⟩,
  ⟨319, 9, 2, [0, 0, 2, 3, 4, 5, 7, 8, 9]⟩,
  ⟨479, 7, 1, [1, 2, 3, 4, 7, 8, 10]⟩,
  ⟨719, 7, 1, [0, 0, 2, 3, 5, 6, 11]⟩,
  ⟨1079, 7, 1, [0, 0, 2, 5, 7, 10, 11]⟩,
  ⟨1619, 9, 1, [0, 0, 3, 4, 5, 6, 7, 9, 12]⟩,
  ⟨2429, 7, 1, [3, 4, 5, 6, 10, 11, 12]⟩,
  ⟨911, 9, 3, [0, 0, 2, 2, 2, 5, 7, 9, 11]⟩,
  ⟨1367, 3, 1, [1, 2, 12]⟩,
  ⟨2051, 5, 1, [0, 0, 3, 11, 12]⟩,
  ⟨3077, 3, 1, [4, 10, 13]⟩,
  ⟨577, 5, 4, [2, 6, 7, 9, 10]⟩,
  ⟨433, 5, 2, [1, 1, 4, 8, 10]⟩,
  ⟨325, 5, 2, [4, 6, 7, 8, 9]⟩,
  ⟨61, 5, 4, [2, 2, 4, 5, 7]⟩,
  ⟨23, 3, 3, [1, 2, 6]⟩,
  ⟨35, 5, 1, [0, 0, 3, 5, 6]⟩,
  ⟨53, 3, 1, [4, 4, 7]⟩,
  ⟨5, 1, 5, [4]⟩,
  ⟨1, 1, 4, [2]⟩
]

def coreAt (i : Fin 41) : Core := coreRows.getD i.val defaultCore

def coreNat (s : ℕ) : Core := coreRows.getD (s - 1) defaultCore

def antidiagCost (s : ℕ) : ℕ := (coreNat s).T

def coreGood (c : Core) : Prop :=
  0 < c.y ∧ (3 * c.y + 1) % 2 = 0 ∧ 1 ≤ c.v ∧
  c.T ≤ 9 ∧ c.T % 2 = 1 ∧
  (3 * c.T = 2 * D (3 * c.y + 1) + 1 ∨
    3 * c.T + 1 = 2 * D (2 * (3 * c.y + 1))) ∧
  powerSum (c.w : Multiset ℕ) = 3 * c.y + 1 ∧
  evenCount (c.w : Multiset ℕ) = oddCount (c.w : Multiset ℕ) + 1 ∧
  c.w.length = c.T ∧
  (c.v = 1 →
    3 * c.T ≤ max (2 * D (3 * c.y) - 3) (2 * D (2 * (3 * c.y)) + 3) ∧
    (c.T = 9 → 7 < D (2 * (3 * c.y - 1))))

instance coreGood_decidable (c : Core) : Decidable (coreGood c) := by
  unfold coreGood
  infer_instance

set_option maxHeartbeats 4000000 in
lemma core_good : ∀ i : Fin 41, coreGood (coreAt i) := by
  decide

lemma default_core_good : coreGood defaultCore := by decide

lemma core_cost (c : Core) (hc : coreGood c) {E : ℕ}
    (hE : 1 ≤ E) (he1 : E = 1 → c.v = 1) :
    minCoins (lift E c.y) = c.T := by
  rcases hc with ⟨hy, hqeven, hv, ht9, htodd, ht, hp, heo, hr, hsmall⟩
  apply minCoins_eq_of_bounds (lift_upper_witness hE c.w hp heo hr)
  intro m hm
  have hN := three_lift E c.y
  by_cases he : E = 1
  · subst E
    have hs := hsmall (he1 rfl)
    apply lift_lower_one (q := 3 * c.y + 1) (by omega) hqeven ht9 htodd ht
      (by simpa using hN) ?_ ?_ hm
    · simpa using hs.1
    · simpa using hs.2
  · apply lift_lower_uniform (q := 3 * c.y + 1) (by omega) (by omega)
      hqeven ht9 htodd ht hN hm

def orbitRows : List ℕ := [27, 41, 31, 47, 71, 107, 161, 121, 91, 137, 103, 155, 233, 175, 263, 395, 593, 445, 167, 251, 377, 283, 425, 319, 479, 719, 1079, 1619, 2429, 911, 1367, 2051, 3077, 577, 433, 325, 61, 23, 35, 53, 5, 1]

def orbitNat (s : ℕ) : ℕ := orbitRows.getD s 1

set_option maxHeartbeats 4000000 in
lemma core_factors : ∀ i : Fin 41,
    3 * orbitNat i.val + 1 = 2 ^ (coreAt i).v * (coreAt i).y ∧
      0 < (coreAt i).y ∧ (coreAt i).y % 2 = 1 ∧
      (coreAt i).y = orbitNat (i.val + 1) := by
  decide

lemma orbit_start : orbitNat 0 = 27 := by decide
lemma orbit_last : orbitNat 41 = 1 := by decide
lemma core_12 : antidiagCost 12 = 7 := by decide
lemma core_29 : antidiagCost 29 = 9 := by decide

end A372561Certificate

namespace A372561Certificate
open OMA.S_oeis_a372561

lemma reduced_one : reduced 1 = 1 :=
  reduced_of_factor 1 2 1 (by decide) (by decide) (by decide)

lemma valuation_one : valuation 1 = 2 :=
  valuation_of_factor 1 2 1 (by decide) (by decide) (by decide)

lemma orbit_tail {s : ℕ} (hs : 41 ≤ s) : orbitNat s = 1 := by
  by_cases he : s = 41
  · subst s
    exact orbit_last
  · have hlen : orbitRows.length ≤ s := by
      have hl : orbitRows.length = 42 := by rfl
      rw [hl]
      omega
    unfold orbitNat
    rw [List.getD_eq_getElem?_getD, List.getElem?_eq_none hlen]
    rfl

lemma core_tail {s : ℕ} (hs : 42 ≤ s) : coreNat s = defaultCore := by
  have hlen : coreRows.length ≤ s - 1 := by
    have hl : coreRows.length = 41 := by rfl
    rw [hl]
    omega
  unfold coreNat
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_none hlen]
  rfl

lemma orbit_iterate (s : ℕ) : (reduced^[s]) 27 = orbitNat s := by
  induction s with
  | zero => simpa using orbit_start.symm
  | succ s ih =>
    rw [Function.iterate_succ_apply' reduced s 27, ih]
    by_cases hs : s < 41
    · let i : Fin 41 := ⟨s, hs⟩
      have hf := core_factors i
      have hr := reduced_of_factor (orbitNat i.val) (coreAt i).v (coreAt i).y
        hf.1 hf.2.1 hf.2.2.1
      exact hr.trans hf.2.2.2
    · rw [orbit_tail (s := s) (by omega), orbit_tail (s := s + 1) (by omega)]
      exact reduced_one

lemma grid_cost {n k : ℕ} (hn : 2 ≤ n) (hk : 1 ≤ k) :
    minCoins (grid n k) = antidiagCost (n + k - 2) := by
  obtain ⟨E, hgrid, hbound⟩ := grid_lift n k hn hk
  let s := n + k - 2
  have hs1 : 1 ≤ s := by dsimp [s]; omega
  have hs_sub : n + k - 3 = s - 1 := by dsimp [s]; omega
  rw [orbit_iterate] at hgrid hbound
  rw [hs_sub] at hbound
  change minCoins (grid n k) = antidiagCost s
  change grid n k = lift E (orbitNat s) at hgrid
  by_cases hs : s ≤ 41
  · let i : Fin 41 := ⟨s - 1, by omega⟩
    have hc := core_good i
    have hf := core_factors i
    have hidx : i.val + 1 = s := by dsimp [i]; omega
    have hy : (coreAt i).y = orbitNat s := by simpa only [hidx] using hf.2.2.2
    have hv := valuation_of_factor (orbitNat i.val) (coreAt i).v (coreAt i).y
      hf.1 hf.2.1 hf.2.2.1
    have hv_bound : (coreAt i).v ≤ E := by
      have heq : i.val = s - 1 := rfl
      rw [heq] at hv
      omega
    have he : 1 ≤ E := hc.2.2.1.trans hv_bound
    have he1 : E = 1 → (coreAt i).v = 1 := by
      intro hh
      have hvpos := hc.2.2.1
      omega
    have hcost := core_cost (coreAt i) hc he he1
    rw [hgrid, ← hy]
    exact hcost
  · have hs42 : 42 ≤ s := by omega
    have hy : orbitNat s = 1 := orbit_tail (by omega)
    have hprev : orbitNat (s - 1) = 1 := orbit_tail (by omega)
    rw [hprev, valuation_one] at hbound
    have hcost := core_cost defaultCore default_core_good (E := E) (by omega)
      (by intro hh; omega)
    rw [hgrid, hy]
    unfold antidiagCost
    rw [core_tail hs42]
    exact hcost

lemma fullMain :
    (∀ n k : ℕ, 2 ≤ n → 1 ≤ k → n + k = 14 → minCoins (grid n k) = 7) ∧
    (∀ n k : ℕ, 2 ≤ n → 1 ≤ k → n + k = 31 → minCoins (grid n k) = 9) ∧
    (∀ n k : ℕ, 1 < n → 1 < k → minCoins (grid n k) = minCoins (grid k n)) := by
  refine ⟨?_, ?_, ?_⟩
  · intro n k hn hk heq
    rw [grid_cost hn hk, show n + k - 2 = 12 by omega]
    exact core_12
  · intro n k hn hk heq
    rw [grid_cost hn hk, show n + k - 2 = 29 by omega]
    exact core_29
  · intro n k hn hk
    calc
      minCoins (grid n k) = antidiagCost (n + k - 2) := grid_cost (by omega) (by omega)
      _ = antidiagCost (k + n - 2) := by congr 1; omega
      _ = minCoins (grid k n) := (grid_cost (n := k) (k := n) (by omega) (by omega)).symm

end A372561Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a372561.main := by
  exact A372561Certificate.fullMain
