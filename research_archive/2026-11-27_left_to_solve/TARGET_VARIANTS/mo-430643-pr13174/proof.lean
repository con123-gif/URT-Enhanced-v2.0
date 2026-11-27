import OMAStatements.S_mo_430643


/-!
Abstract algebra and logarithm helpers for the MO430643 candidate.
These helpers do not assert the source conjecture or any prior-status claim.
Unverified candidate: no pinned compiler result has yet been obtained.
Credit: Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6.
-/

open scoped BigOperators

namespace OMA.MO430643.Quadratic

def gap (ell S X R : ℝ) : ℝ :=
  4 * S * (S - 2 * ell + 1) + 4 * (S - ell) * X + R

theorem gap_nonneg {ell S X R : ℝ}
    (hS : 0 ≤ S) (hSL : ell ≤ S) (hS2 : 2 * ell - 1 ≤ S)
    (hX : 0 ≤ X) (hR : 0 ≤ R) : 0 ≤ gap ell S X R := by
  have h₁ := mul_nonneg hS (show 0 ≤ S - 2 * ell + 1 by linarith)
  have h₂ := mul_nonneg (show 0 ≤ S - ell by linarith) hX
  dsimp [gap]
  linarith

theorem gap_nonneg_large_ell {ell S X R : ℝ}
    (hell : 4 ≤ ell) (hS : 9 * ell / 4 - 2 ≤ S)
    (hX : 0 ≤ X) (hR : 0 ≤ R) : 0 ≤ gap ell S X R := by
  apply gap_nonneg (by linarith) (by linarith) (by linarith) hX hR

theorem gap_nonneg_small_ell {ell S X R : ℝ}
    (hell0 : 0 ≤ ell) (hell1 : ell ≤ 1) (hS : ell ≤ S)
    (hX : 0 ≤ X) (hR : 0 ≤ R) : 0 ≤ gap ell S X R := by
  apply gap_nonneg (by linarith) hS (by linarith) hX hR

theorem gap_three_lower {S X R : ℝ}
    (hS : 19 / 4 ≤ S) (hX : 1 ≤ X) (hR : 0 ≤ R) :
    9 / 4 ≤ gap 3 S X R := by
  have h₁ := mul_nonneg
    (show 0 ≤ S - 3 by linarith) (show 0 ≤ X - 1 by linarith)
  have h₂ := mul_nonneg
    (show 0 ≤ S - 19 / 4 by linarith) (show 0 ≤ S + 3 / 4 by linarith)
  dsimp [gap]
  nlinarith

theorem gap_three_pos {S X R : ℝ}
    (hS : 19 / 4 ≤ S) (hX : 1 ≤ X) (hR : 0 ≤ R) :
    0 < gap 3 S X R := by
  have h := gap_three_lower hS hX hR
  linarith

theorem weighted_square_gap_nonneg {ι : Type*} (s : Finset ι)
    (x w : ι → ℝ) (hx : ∀ i ∈ s, 0 ≤ x i)
    (hw : ∀ i ∈ s, 1 ≤ w i) :
    0 ≤ (∑ i ∈ s, x i * w i) ^ 2 - ∑ i ∈ s, x i ^ 2 * w i := by
  have hpoint : ∀ i ∈ s, x i ^ 2 * w i ≤ (x i * w i) ^ 2 := by
    intro i hi
    have h := mul_le_mul_of_nonneg_left (hw i hi)
      (mul_nonneg (sq_nonneg (x i)) (show 0 ≤ w i by linarith [hw i hi]))
    nlinarith
  have hsum := Finset.sum_le_sum hpoint
  have hsq := Finset.sum_sq_le_sq_sum_of_nonneg
    (s := s) (f := fun i => x i * w i)
    (fun i hi => mul_nonneg (hx i hi) (show 0 ≤ w i by linarith [hw i hi]))
  linarith

def twoGap (a b t : ℝ) : ℝ :=
  (a + b * t) ^ 2 - a ^ 2 - b ^ 2 * t - 4 * (a + b * t)

theorem twoGap_mono {a b a' b' t : ℝ}
    (ha : 2 ≤ a) (hb : 2 ≤ b) (ha' : a ≤ a') (hb' : b ≤ b')
    (ht : 1 ≤ t) : twoGap a b t ≤ twoGap a' b' t := by
  have hb'0 : 0 ≤ b' := by linarith
  have hbt := mul_nonneg hb'0 (show 0 ≤ t - 1 by linarith)
  have hc : 0 ≤ 2 * b' * t - 4 := by nlinarith
  have h₁ := mul_nonneg (show 0 ≤ a' - a by linarith) hc
  have hsum : 0 ≤ b' + b := by linarith
  have hinside : 0 ≤ (b' + b) * (t - 1) + 2 * a - 4 := by
    have h := mul_nonneg hsum (show 0 ≤ t - 1 by linarith)
    linarith
  have h₂ := mul_nonneg
    (mul_nonneg (show 0 ≤ b' - b by linarith) (show 0 ≤ t by linarith)) hinside
  have heq : twoGap a' b' t - twoGap a b t =
      (a' - a) * (2 * b' * t - 4) +
        (b' - b) * t * ((b' + b) * (t - 1) + 2 * a - 4) := by
    dsimp [twoGap]
    ring
  linarith

theorem twoGap_four_two_lower {t : ℝ} (ht : 11 / 7 ≤ t) :
    8 / 49 ≤ twoGap 4 2 t := by
  have h := mul_nonneg
    (show 0 ≤ t - 11 / 7 by linarith) (show 0 ≤ t + 18 / 7 by linarith)
  dsimp [twoGap]
  nlinarith

theorem twoGap_two_three_lower {t : ℝ} (ht : 11 / 7 ≤ t) :
    4 / 49 ≤ twoGap 2 3 t := by
  have h := mul_nonneg
    (show 0 ≤ t - 11 / 7 by linarith) (show 0 ≤ t + 4 / 7 by linarith)
  dsimp [twoGap]
  nlinarith

theorem twoGap_nonneg {a b t : ℝ}
    (ha : 2 ≤ a) (hb : 2 ≤ b) (ht : 11 / 7 ≤ t)
    (hgood : 4 ≤ a ∨ 3 ≤ b) : 0 ≤ twoGap a b t := by
  rcases hgood with h | h
  · have hmono := twoGap_mono (a := 4) (b := 2) (a' := a) (b' := b)
      (by norm_num) (by norm_num) h hb (by linarith)
    have hbase := twoGap_four_two_lower ht
    linarith
  · have hmono := twoGap_mono (a := 2) (b := 3) (a' := a) (b' := b)
      (by norm_num) (by norm_num) ha h (by linarith)
    have hbase := twoGap_two_three_lower ht
    linarith

theorem log_two_three_lower : (11 : ℝ) / 7 ≤ Real.logb 2 3 := by
  have h := Real.logb_le_logb_of_le (b := (2 : ℝ))
    (by norm_num : 1 < (2 : ℝ))
    (by norm_num : 0 < (2 : ℝ) ^ 11)
    (by norm_num : (2 : ℝ) ^ 11 ≤ (3 : ℝ) ^ 7)
  rw [Real.logb_pow, Real.logb_pow,
    Real.logb_self_eq_one (by norm_num : 1 < (2 : ℝ))] at h
  norm_num at h
  linarith

end OMA.MO430643.Quadratic


/-!
Prime-logarithm helpers for the complete MO430643 candidate.
Unverified local candidate: no compiler pass or official acceptance asserted.
Credit: Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6.
-/

open scoped BigOperators

namespace OMA.MO430643.Weights

noncomputable def weight (p : ℕ) : ℝ := Real.logb 2 (p : ℝ)

theorem weight_lower_of_pow {p k m : ℕ} (hp : 0 < p)
    (hpow : 2 ^ m ≤ p ^ k) : (m : ℝ) ≤ (k : ℝ) * weight p := by
  have hreal : (2 : ℝ) ^ m ≤ (p : ℝ) ^ k := by exact_mod_cast hpow
  have h := Real.logb_le_logb_of_le (b := (2 : ℝ))
    (by norm_num : 1 < (2 : ℝ))
    (by positivity : 0 < (2 : ℝ) ^ m) hreal
  simpa [Real.logb_pow, Real.logb_self_eq_one (by norm_num : 1 < (2 : ℝ)),
    weight] using h

theorem weight_two : weight 2 = 1 := by
  exact Real.logb_self_eq_one (by norm_num)

theorem weight_prime_ge_one {p : ℕ} (hp : Nat.Prime p) : 1 ≤ weight p := by
  have h := weight_lower_of_pow (k := 1) (m := 1) hp.pos
    (by simpa using hp.two_le)
  simpa using h

theorem weight_ge_three_halves {p : ℕ} (hp : 3 ≤ p) : 3 / 2 ≤ weight p := by
  have hpow : (2 : ℕ) ^ 3 ≤ p ^ 2 :=
    (by norm_num : (2 : ℕ) ^ 3 ≤ 3 ^ 2).trans (Nat.pow_le_pow_left hp 2)
  have h := weight_lower_of_pow (by omega : 0 < p) hpow
  norm_num at h
  linarith

theorem weight_ge_nine_fourths {p : ℕ} (hp : 5 ≤ p) : 9 / 4 ≤ weight p := by
  have hpow : (2 : ℕ) ^ 9 ≤ p ^ 4 :=
    (by norm_num : (2 : ℕ) ^ 9 ≤ 5 ^ 4).trans (Nat.pow_le_pow_left hp 4)
  have h := weight_lower_of_pow (by omega : 0 < p) hpow
  norm_num at h
  linarith

theorem weight_ge_five_halves {p : ℕ} (hp : 7 ≤ p) : 5 / 2 ≤ weight p := by
  have hpow : (2 : ℕ) ^ 5 ≤ p ^ 2 :=
    (by norm_num : (2 : ℕ) ^ 5 ≤ 7 ^ 2).trans (Nat.pow_le_pow_left hp 2)
  have h := weight_lower_of_pow (by omega : 0 < p) hpow
  norm_num at h
  linarith

theorem weight_three_ge : 11 / 7 ≤ weight 3 := by
  have h := weight_lower_of_pow (p := 3) (k := 7) (m := 11)
    (by norm_num) (by norm_num)
  norm_num at h
  linarith

theorem prime_ge_five {p : ℕ} (hp : Nat.Prime p) (h2 : p ≠ 2) (h3 : p ≠ 3) :
    5 ≤ p := by
  have hlow := hp.two_le
  have h4 : p ≠ 4 := by
    intro heq
    subst p
    norm_num at hp
  omega

theorem prime_ge_seven {p : ℕ} (hp : Nat.Prime p)
    (h2 : p ≠ 2) (h3 : p ≠ 3) (h5 : p ≠ 5) : 7 ≤ p := by
  have hlow := prime_ge_five hp h2 h3
  have h6 : p ≠ 6 := by
    intro heq
    subst p
    norm_num at hp
  omega

theorem sum_weight_ge_card (s : Finset ℕ) (hp : ∀ p ∈ s, Nat.Prime p) :
    (s.card : ℝ) ≤ ∑ p ∈ s, weight p := by
  calc
    (s.card : ℝ) = ∑ p ∈ s, (1 : ℝ) := by simp
    _ ≤ ∑ p ∈ s, weight p := Finset.sum_le_sum fun p h => weight_prime_ge_one (hp p h)

theorem sum_weight_ge (s : Finset ℕ) (hp : ∀ p ∈ s, Nat.Prime p) :
    9 * (s.card : ℝ) / 4 - 2 ≤ ∑ p ∈ s, weight p := by
  have hpoint : ∀ p ∈ s, (9 : ℝ) / 4 ≤ weight p +
      (if p = 2 then (5 : ℝ) / 4 else 0) +
      (if p = 3 then (3 : ℝ) / 4 else 0) := by
    intro p hmem
    by_cases h2 : p = 2
    · subst p
      norm_num [weight_two]
    · by_cases h3 : p = 3
      · subst p
        have h := weight_ge_three_halves (p := 3) (by norm_num)
        norm_num at *
        linarith
      · have h := weight_ge_nine_fourths (prime_ge_five (hp p hmem) h2 h3)
        simp only [h2, h3, if_false, add_zero]
        exact h
  have hsum := Finset.sum_le_sum hpoint
  have h2sum : (∑ p ∈ s, if p = 2 then (5 : ℝ) / 4 else 0) ≤ 5 / 4 := by
    by_cases h2 : 2 ∈ s <;> norm_num [h2]
  have h3sum : (∑ p ∈ s, if p = 3 then (3 : ℝ) / 4 else 0) ≤ 3 / 4 := by
    by_cases h3 : 3 ∈ s <;> norm_num [h3]
  simp only [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul] at hsum
  linarith

theorem sum_weight_ge_three_of_card_two (s : Finset ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) (hcard : s.card = 2)
    (hne : s ≠ {2, 3}) : 3 ≤ ∑ p ∈ s, weight p := by
  have hnsub : ¬ s ⊆ {2, 3} := by
    intro hs
    exact hne (Finset.eq_of_subset_of_card_le hs (by simpa [hcard]))
  have hex : ∃ p ∈ s, p ∉ ({2, 3} : Finset ℕ) := by
    by_contra! hx
    apply hnsub
    intro p hps
    exact hx p hps
  obtain ⟨p, hps, hpout⟩ := hex
  have h2 : p ≠ 2 := by
    intro h
    exact hpout (by simp [h])
  have h3 : p ≠ 3 := by
    intro h
    exact hpout (by simp [h])
  have hpweight := weight_ge_nine_fourths (prime_ge_five (hp p hps) h2 h3)
  have hrest := sum_weight_ge_card (s.erase p) (fun q hq => hp q (Finset.mem_of_mem_erase hq))
  have hrestcard : (s.erase p).card = 1 := by
    rw [Finset.card_erase_of_mem hps, hcard]
  have hsplit : (∑ q ∈ s.erase p, weight q) + weight p = ∑ q ∈ s, weight q :=
    Finset.sum_erase_add _ _ hps
  rw [hrestcard] at hrest
  norm_num at hrest
  linarith

theorem sum_weight_ge_five_of_card_three (s : Finset ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) (hcard : s.card = 3)
    (hne : s ≠ {2, 3, 5}) : 5 ≤ ∑ p ∈ s, weight p := by
  have hnsub : ¬ s ⊆ {2, 3, 5} := by
    intro hs
    exact hne (Finset.eq_of_subset_of_card_le hs (by simpa [hcard]))
  have hex : ∃ p ∈ s, p ∉ ({2, 3, 5} : Finset ℕ) := by
    by_contra! hx
    apply hnsub
    intro p hps
    exact hx p hps
  obtain ⟨p, hps, hpout⟩ := hex
  have h2 : p ≠ 2 := by
    intro h
    exact hpout (by simp [h])
  have h3 : p ≠ 3 := by
    intro h
    exact hpout (by simp [h])
  have h5 : p ≠ 5 := by
    intro h
    exact hpout (by simp [h])
  have hpweight := weight_ge_five_halves (prime_ge_seven (hp p hps) h2 h3 h5)
  have hrest := sum_weight_ge (s.erase p) (fun q hq => hp q (Finset.mem_of_mem_erase hq))
  have hrestcard : (s.erase p).card = 2 := by
    rw [Finset.card_erase_of_mem hps, hcard]
  have hsplit : (∑ q ∈ s.erase p, weight q) + weight p = ∑ q ∈ s, weight q :=
    Finset.sum_erase_add _ _ hps
  rw [hrestcard] at hrest
  norm_num at hrest
  linarith

end OMA.MO430643.Weights


/-
Interface adaptation of our independently complete MO430643 proof, following
our frozen Quadratic and Weights helper namespaces. Original complete proof
passed the pinned whole-kernel check, run46077033577; this interface-only
adaptation requires its own check against the proposed PR13174 statement.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex GPT-6
(exact serving variant not exposed).

Closely related prior subgroup-counting work was read during the audit:
https://arxiv.org/abs/2210.02972
https://arxiv.org/abs/2304.14200
https://arxiv.org/abs/2505.00413
https://arxiv.org/abs/2609.10343
Their bounds and constants differ from the exact source assertion. No
worldwide novelty or priority claim is made by this candidate certificate.
-/

namespace OMA.MO430643

open scoped BigOperators

noncomputable section

/- This local product helper replaces the helper from our original source
statement. All subsequent mathematical proof bodies are unchanged. -/
def number (s : Finset ℕ) (a : ℕ → ℕ) : ℕ := ∏ p ∈ s, p ^ a p

def mass (s : Finset ℕ) : ℝ := ∑ p ∈ s, Weights.weight p
def excess (s : Finset ℕ) (a : ℕ → ℕ) : ℝ :=
  ∑ p ∈ s, ((a p : ℝ) - 2) * Weights.weight p
def linear (s : Finset ℕ) (a : ℕ → ℕ) : ℝ :=
  ∑ p ∈ s, (a p : ℝ) * Weights.weight p
def square (s : Finset ℕ) (a : ℕ → ℕ) : ℝ :=
  ∑ p ∈ s, (a p : ℝ) ^ 2 * Weights.weight p
def remainder (s : Finset ℕ) (a : ℕ → ℕ) : ℝ :=
  excess s a ^ 2 - ∑ p ∈ s, ((a p : ℝ) - 2) ^ 2 * Weights.weight p
def defect (s : Finset ℕ) (a : ℕ → ℕ) : ℝ :=
  linear s a ^ 2 - square s a - 4 * ((s.card : ℝ) - 1) * linear s a

theorem linear_eq (s : Finset ℕ) (a : ℕ → ℕ) :
    linear s a = 2 * mass s + excess s a := by
  unfold linear mass excess
  simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro p hp
  ring

theorem square_eq (s : Finset ℕ) (a : ℕ → ℕ) :
    square s a = 4 * mass s + 4 * excess s a +
      ∑ p ∈ s, ((a p : ℝ) - 2) ^ 2 * Weights.weight p := by
  unfold square mass excess
  simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro p hp
  ring

theorem defect_eq_gap (s : Finset ℕ) (a : ℕ → ℕ) :
    defect s a = Quadratic.gap (s.card : ℝ) (mass s) (excess s a) (remainder s a) := by
  unfold defect
  rw [linear_eq, square_eq]
  unfold Quadratic.gap remainder
  ring

theorem excess_nonneg (s : Finset ℕ) (a : ℕ → ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) (ha : ∀ p ∈ s, 2 ≤ a p) :
    0 ≤ excess s a := by
  apply Finset.sum_nonneg
  intro p hmem
  have hcast : (2 : ℝ) ≤ a p := by exact_mod_cast ha p hmem
  have hw := Weights.weight_prime_ge_one (hp p hmem)
  exact mul_nonneg (by linarith) (by linarith)

theorem remainder_nonneg (s : Finset ℕ) (a : ℕ → ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) (ha : ∀ p ∈ s, 2 ≤ a p) :
    0 ≤ remainder s a := by
  apply Quadratic.weighted_square_gap_nonneg s
    (fun p => (a p : ℝ) - 2) Weights.weight
  · intro p hmem
    have hcast : (2 : ℝ) ≤ a p := by exact_mod_cast ha p hmem
    linarith
  · intro p hmem
    exact Weights.weight_prime_ge_one (hp p hmem)

theorem excess_ge_one (s : Finset ℕ) (a : ℕ → ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) (ha : ∀ p ∈ s, 2 ≤ a p)
    {p : ℕ} (hmem : p ∈ s) (hne : a p ≠ 2) : 1 ≤ excess s a := by
  have hage : 3 ≤ a p := by have h := ha p hmem; omega
  have hcast : (3 : ℝ) ≤ a p := by exact_mod_cast hage
  have hw := Weights.weight_prime_ge_one (hp p hmem)
  have hx : (1 : ℝ) ≤ (a p : ℝ) - 2 := by linarith
  have hproduct : 1 ≤ ((a p : ℝ) - 2) * Weights.weight p := by
    have h := mul_nonneg (show 0 ≤ (a p : ℝ) - 2 by linarith)
      (show 0 ≤ Weights.weight p - 1 by linarith)
    nlinarith
  apply hproduct.trans
  unfold excess
  apply Finset.single_le_sum (s := s)
    (f := fun q : ℕ => ((a q : ℝ) - 2) * Weights.weight q) (a := p)
  · intro q hq
    have hcastq : (2 : ℝ) ≤ a q := by exact_mod_cast ha q hq
    have hwq := Weights.weight_prime_ge_one (hp q hq)
    exact mul_nonneg (by linarith) (by linarith)
  · exact hmem

theorem defect_pair (s : Finset ℕ) (a : ℕ → ℕ) (hs : s = {2, 3}) :
    defect s a = Quadratic.twoGap (a 2 : ℝ) (a 3 : ℝ) (Weights.weight 3) := by
  simp [defect, linear, square, hs, Weights.weight_two, Quadratic.twoGap] <;> ring

theorem defect_nonneg (s : Finset ℕ) (a : ℕ → ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) (ha : ∀ p ∈ s, 2 ≤ a p)
    (h36 : number s a ≠ 36) (h72 : number s a ≠ 72) (h900 : number s a ≠ 900) :
    0 ≤ defect s a := by
  classical
  have hX := excess_nonneg s a hp ha
  have hR := remainder_nonneg s a hp ha
  have hcard : (s.card : ℝ) ≤ mass s := Weights.sum_weight_ge_card s hp
  have hS : 9 * (s.card : ℝ) / 4 - 2 ≤ mass s := Weights.sum_weight_ge s hp
  rw [defect_eq_gap]
  by_cases hlarge : 4 ≤ s.card
  · apply Quadratic.gap_nonneg_large_ell
    · exact_mod_cast hlarge
    · exact hS
    · exact hX
    · exact hR
  by_cases hsmall : s.card ≤ 1
  · apply Quadratic.gap_nonneg_small_ell
    · positivity
    · exact_mod_cast hsmall
    · exact hcard
    · exact hX
    · exact hR
  have hcases : s.card = 2 ∨ s.card = 3 := by omega
  rcases hcases with htwo | hthree
  · by_cases hs : s = {2, 3}
    · have ha2 : 2 ≤ a 2 := ha 2 (by simp [hs])
      have ha3 : 2 ≤ a 3 := ha 3 (by simp [hs])
      have hgood : 4 ≤ a 2 ∨ 3 ≤ a 3 := by
        by_contra h
        push_neg at h
        have heq3 : a 3 = 2 := by omega
        have heq2 : a 2 = 2 ∨ a 2 = 3 := by omega
        rcases heq2 with heq2 | heq2
        · apply h36
          simp [number, hs, heq2, heq3]
        · apply h72
          simp [number, hs, heq2, heq3]
      rw [← defect_eq_gap, defect_pair s a hs]
      apply Quadratic.twoGap_nonneg
      · exact_mod_cast ha2
      · exact_mod_cast ha3
      · exact Weights.weight_three_ge
      · rcases hgood with h | h
        · left
          exact_mod_cast h
        · right
          exact_mod_cast h
    · have hmass : 3 ≤ mass s :=
        Weights.sum_weight_ge_three_of_card_two s hp htwo hs
      apply Quadratic.gap_nonneg (by linarith)
      · norm_num [htwo] at hcard ⊢
        linarith
      · norm_num [htwo]
        exact hmass
      · exact hX
      · exact hR
  · by_cases hs : s = {2, 3, 5}
    · have hnotall : ¬ ∀ p ∈ s, a p = 2 := by
        intro hall
        have ha2 := hall 2 (by simp [hs])
        have ha3 := hall 3 (by simp [hs])
        have ha5 := hall 5 (by simp [hs])
        apply h900
        simp [number, hs, ha2, ha3, ha5]
      push_neg at hnotall
      obtain ⟨p, hmem, hne⟩ := hnotall
      have hXone := excess_ge_one s a hp ha hmem hne
      have hSthree : 19 / 4 ≤ mass s := by norm_num [hthree] at hS; exact hS
      have hpos := Quadratic.gap_three_pos hSthree hXone hR
      simpa only [hthree, Nat.cast_ofNat] using le_of_lt hpos
    · have hmass : 5 ≤ mass s :=
        Weights.sum_weight_ge_five_of_card_three s hp hthree hs
      apply Quadratic.gap_nonneg (by linarith)
      · norm_num [hthree] at hcard ⊢
        linarith
      · norm_num [hthree]
        exact hmass
      · exact hX
      · exact hR

theorem number_pos (s : Finset ℕ) (a : ℕ → ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) : 0 < number s a := by
  apply Finset.prod_pos
  intro p hmem
  exact pow_pos (hp p hmem).pos _

theorem log_number (s : Finset ℕ) (a : ℕ → ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) :
    Real.logb 2 (number s a : ℝ) = linear s a := by
  have hcast : (number s a : ℝ) = ∏ p ∈ s, (p : ℝ) ^ a p := by simp [number]
  have hne : ∀ p ∈ s, (p : ℝ) ^ a p ≠ 0 := by
    intro p hmem
    have hpos : (0 : ℝ) < p := by exact_mod_cast (hp p hmem).pos
    exact ne_of_gt (pow_pos hpos _)
  rw [hcast, Real.logb_prod s (fun p => (p : ℝ) ^ a p) hne]
  simp only [Real.logb_pow, linear, Weights.weight]

theorem log_lhs (s : Finset ℕ) (a : ℕ → ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) :
    Real.logb 2 (∏ p ∈ s, (p : ℝ) ^ ((a p : ℝ) ^ 2 / 4)) = square s a / 4 := by
  have hpos : ∀ p ∈ s, (0 : ℝ) < p := by
    intro p hmem
    exact_mod_cast (hp p hmem).pos
  rw [Real.logb_prod s (fun p => (p : ℝ) ^ ((a p : ℝ) ^ 2 / 4))
    (fun p hmem => ne_of_gt (Real.rpow_pos_of_pos (hpos p hmem) _))]
  calc
    (∑ p ∈ s, Real.logb 2 ((p : ℝ) ^ ((a p : ℝ) ^ 2 / 4))) =
        ∑ p ∈ s, ((a p : ℝ) ^ 2 * Weights.weight p) / 4 := by
      apply Finset.sum_congr rfl
      intro p hmem
      rw [Real.logb_rpow_eq_mul_logb_of_pos (hpos p hmem)]
      unfold Weights.weight
      ring
    _ = square s a / 4 := by simp only [square, Finset.sum_div]

theorem full_bound (s : Finset ℕ) (a : ℕ → ℕ)
    (hp : ∀ p ∈ s, Nat.Prime p) (ha : ∀ p ∈ s, 2 ≤ a p)
    (h36 : number s a ≠ 36) (h72 : number s a ≠ 72) (h900 : number s a ≠ 900) :
    (∏ p ∈ s, (p : ℝ) ^ ((a p : ℝ) ^ 2 / 4)) ≤
      (number s a : ℝ) ^
        (Real.logb 2 (number s a : ℝ) / 4 + 1 - (s.card : ℝ)) := by
  have hn : (0 : ℝ) < number s a := by exact_mod_cast number_pos s a hp
  have hlhs : 0 < ∏ p ∈ s, (p : ℝ) ^ ((a p : ℝ) ^ 2 / 4) := by
    apply Finset.prod_pos
    intro p hmem
    exact Real.rpow_pos_of_pos (by exact_mod_cast (hp p hmem).pos) _
  have hrhs : 0 < (number s a : ℝ) ^
      (Real.logb 2 (number s a : ℝ) / 4 + 1 - (s.card : ℝ)) :=
    Real.rpow_pos_of_pos hn _
  apply (Real.logb_le_logb (by norm_num : (1 : ℝ) < 2) hlhs hrhs).mp
  rw [log_lhs s a hp, Real.logb_rpow_eq_mul_logb_of_pos hn]
  simp only [log_number s a hp]
  have hgap := defect_nonneg s a hp ha h36 h72 h900
  unfold defect at hgap
  nlinarith

end

end OMA.MO430643

/- Interface-only adapter to the exact statement proposed by @AminAhantab
in official PR13174. Our original complete mathematical argument was publicly
checkpointed at 22:05:27 UTC on 2026-11-27, before that concurrent statement
and proof candidate. No claim of exclusive or worldwide priority is made. -/
theorem OMA.solution : type_of% @OMA.S_mo_430643.main := by
  intro s a r hp ha hr hex
  subst r
  have h36 : OMA.MO430643.number s a ≠ 36 := by
    intro h
    apply hex
    change OMA.MO430643.number s a ∈ ({36, 72, 900} : Finset ℕ)
    simp [h]
  have h72 : OMA.MO430643.number s a ≠ 72 := by
    intro h
    apply hex
    change OMA.MO430643.number s a ∈ ({36, 72, 900} : Finset ℕ)
    simp [h]
  have h900 : OMA.MO430643.number s a ≠ 900 := by
    intro h
    apply hex
    change OMA.MO430643.number s a ∈ ({36, 72, 900} : Finset ℕ)
    simp [h]
  exact OMA.MO430643.full_bound s a hp ha h36 h72 h900
