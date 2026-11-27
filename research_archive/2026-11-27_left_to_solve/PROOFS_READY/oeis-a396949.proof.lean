import OMAStatements.S_oeis_a396949

/-!
For a large prime p, distribute p+21 positive exponents over 2,3,5,7,11
and give p exponent 1.  A four-dimensional box yields order p^4 distinct
members below p*11^(p+21), whose logarithm is at most 31p.  This contradicts
even the proposed cubic-logarithm upper bound.  The source's fixed-support
characterization and classical unique factorization are prior mathematics.
The known one-prime family p^(p-1) (A036878) is also prior; the construction
below instead uses six distinct prime factors and four free exponents.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-/

open scoped BigOperators
open OMA.S_oeis_a396949

namespace A396949Certificate

private abbrev Box (p : ℕ) := Fin 4 → Fin (p / 4 + 1)

private def total {p : ℕ} (u : Box p) : ℕ :=
  (u 0 : ℕ) + (u 1 : ℕ) + (u 2 : ℕ) + (u 3 : ℕ)

private def lastExponent {p : ℕ} (u : Box p) : ℕ := p + 17 - total u

private def witness (p : ℕ) (u : Box p) : ℕ :=
  2 ^ ((u 0 : ℕ) + 1) * 3 ^ ((u 1 : ℕ) + 1) *
    5 ^ ((u 2 : ℕ) + 1) * 7 ^ ((u 3 : ℕ) + 1) *
    11 ^ lastExponent u * p

private noncomputable def factors (p : ℕ) (u : Box p) : ℕ →₀ ℕ :=
  Finsupp.single 2 ((u 0 : ℕ) + 1) +
  Finsupp.single 3 ((u 1 : ℕ) + 1) +
  Finsupp.single 5 ((u 2 : ℕ) + 1) +
  Finsupp.single 7 ((u 3 : ℕ) + 1) +
  Finsupp.single 11 (lastExponent u) + Finsupp.single p 1

private lemma total_le {p : ℕ} (u : Box p) : total u ≤ p := by
  have h0 := (u 0).isLt
  have h1 := (u 1).isLt
  have h2 := (u 2).isLt
  have h3 := (u 3).isLt
  unfold total
  omega

private lemma last_pos {p : ℕ} (u : Box p) : 0 < lastExponent u := by
  have := total_le u
  unfold lastExponent
  omega

private lemma exponent_sum {p : ℕ} (u : Box p) :
    ((u 0 : ℕ) + 1) + ((u 1 : ℕ) + 1) + ((u 2 : ℕ) + 1) +
      ((u 3 : ℕ) + 1) + lastExponent u = p + 21 := by
  have := total_le u
  unfold lastExponent total at *
  omega

private lemma witness_factorization {p : ℕ} (hp : p.Prime) (u : Box p) :
    (witness p u).factorization = factors p u := by
  have hppos := hp.pos
  simp (disch := positivity) only [witness, factors, Nat.factorization_mul,
    Nat.prime_two.factorization_pow,
    (by norm_num : Nat.Prime 3).factorization_pow,
    (by norm_num : Nat.Prime 5).factorization_pow,
    (by norm_num : Nat.Prime 7).factorization_pow,
    (by norm_num : Nat.Prime 11).factorization_pow, hp.factorization]

private lemma factors_support {p : ℕ} (hp13 : 13 ≤ p) (u : Box p) :
    (factors p u).support = {2, 3, 5, 7, 11, p} := by
  classical
  have he := (last_pos u).ne'
  unfold factors
  simp only [Finsupp.support_add_eq_union]
  rw [Finsupp.support_single 2 (by omega), Finsupp.support_single 3 (by omega),
    Finsupp.support_single 5 (by omega), Finsupp.support_single 7 (by omega),
    Finsupp.support_single 11 he, Finsupp.support_single p (by omega)]
  ext q
  simp only [Finset.mem_union, Finset.mem_singleton, Finset.mem_insert]
  tauto

private lemma witness_member {p : ℕ} (hp : p.Prime) (hp13 : 13 ≤ p)
    (u : Box p) : member (witness p u) := by
  classical
  have h2 : p ≠ 2 := by omega
  have h3 : p ≠ 3 := by omega
  have h5 : p ≠ 5 := by omega
  have h7 : p ≠ 7 := by omega
  have h11 : p ≠ 11 := by omega
  have hs := exponent_sum u
  unfold member
  rw [witness_factorization hp u, factors_support hp13 u]
  simp [factors, Finsupp.single_apply, h2, h3, h5, h7, h11,
    Ne.symm h2, Ne.symm h3, Ne.symm h5, Ne.symm h7, Ne.symm h11]
  omega

private lemma witness_injective {p : ℕ} (hp : p.Prime) (hp13 : 13 ≤ p) :
    Function.Injective (witness p) := by
  intro u v huv
  have h2 : p ≠ 2 := by omega
  have h3 : p ≠ 3 := by omega
  have h5 : p ≠ 5 := by omega
  have h7 : p ≠ 7 := by omega
  have hu0 := congrArg (fun n : ℕ => n.factorization 2) huv
  have hu1 := congrArg (fun n : ℕ => n.factorization 3) huv
  have hu2 := congrArg (fun n : ℕ => n.factorization 5) huv
  have hu3 := congrArg (fun n : ℕ => n.factorization 7) huv
  simp [witness_factorization hp, factors, Finsupp.single_apply,
    h2, h3, h5, h7, Ne.symm h2, Ne.symm h3, Ne.symm h5, Ne.symm h7] at hu0 hu1 hu2 hu3
  funext i
  apply Fin.ext
  fin_cases i
  · change (u 0 : ℕ) = (v 0 : ℕ)
    omega
  · change (u 1 : ℕ) = (v 1 : ℕ)
    omega
  · change (u 2 : ℕ) = (v 2 : ℕ)
    omega
  · change (u 3 : ℕ) = (v 3 : ℕ)
    omega

private lemma witness_le {p : ℕ} (u : Box p) :
    witness p u ≤ p * 11 ^ (p + 21) := by
  have hs := exponent_sum u
  calc
    witness p u ≤ 11 ^ ((u 0 : ℕ) + 1) * 11 ^ ((u 1 : ℕ) + 1) *
        11 ^ ((u 2 : ℕ) + 1) * 11 ^ ((u 3 : ℕ) + 1) *
        11 ^ lastExponent u * p := by
      unfold witness
      gcongr <;> norm_num
    _ = p * 11 ^ (p + 21) := by
      simp only [← pow_add]
      rw [hs, mul_comm]

private lemma box_count {p : ℕ} (hp : p.Prime) (hp13 : 13 ≤ p) :
    (p / 4 + 1) ^ 4 ≤ count (p * 11 ^ (p + 21)) := by
  classical
  have hppos := hp.pos
  have hsub : (Finset.univ.image (witness p)) ⊆
      ((Finset.range (p * 11 ^ (p + 21) + 1)).filter fun n => 0 < n ∧ member n) := by
    intro n hn
    obtain ⟨u, _, rfl⟩ := Finset.mem_image.mp hn
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_range.mpr (Nat.lt_succ_of_le (witness_le u)), ?_,
      witness_member hp hp13 u⟩
    unfold witness
    positivity
  have hc := Finset.card_le_card hsub
  rw [Finset.card_image_of_injective _ (witness_injective hp hp13)] at hc
  simpa [count, Fintype.card_fun] using hc

private lemma log_bound {p : ℕ} (hp13 : 13 ≤ p) :
    Real.log (p * 11 ^ (p + 21) : ℕ) ≤ 31 * (p : ℝ) := by
  have hp0 : 0 < (p : ℝ) := by exact_mod_cast (show 0 < p by omega)
  have hpR : (13 : ℝ) ≤ p := by exact_mod_cast hp13
  have hlogp := Real.log_le_sub_one_of_pos hp0
  have hlog11 : Real.log 11 ≤ 10 := by
    convert (Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 11)) using 1 <;>
      norm_num
  have hm : ((p : ℝ) + 21) * Real.log 11 ≤ ((p : ℝ) + 21) * 10 :=
    mul_le_mul_of_nonneg_left hlog11 (by positivity)
  rw [Nat.cast_mul, Nat.cast_pow, Real.log_mul (by positivity) (by positivity),
    Real.log_pow]
  push_cast
  nlinarith

end A396949Certificate

set_option maxHeartbeats 800000 in
theorem OMA.disproof : ¬ (type_of% @OMA.S_oeis_a396949.main) := by
  intro htheta
  change Asymptotics.IsTheta Filter.atTop (fun N : ℕ => (count N : ℝ))
    (fun N : ℕ => (Real.log N) ^ 3) at htheta
  obtain ⟨C, hC, hbound⟩ := htheta.isBigO.exists_nonneg
  obtain ⟨N0, hN0⟩ := Filter.eventually_atTop.mp hbound.bound
  obtain ⟨K, hK⟩ := exists_nat_gt (256 * C * 31 ^ 3)
  obtain ⟨p, hlarge, hp⟩ := Nat.exists_infinite_primes (max (max N0 13) K)
  have hpN0 : N0 ≤ p := le_trans (le_trans (le_max_left _ _) (le_max_left _ _)) hlarge
  have hp13 : 13 ≤ p := le_trans (le_trans (le_max_right _ _) (le_max_left _ _)) hlarge
  have hpK : K ≤ p := le_trans (le_max_right _ _) hlarge
  have hpbig : 256 * C * 31 ^ 3 < (p : ℝ) :=
    lt_of_lt_of_le hK (by exact_mod_cast hpK)
  have hpR : 0 < (p : ℝ) := by exact_mod_cast hp.pos
  let X : ℕ := p * 11 ^ (p + 21)
  have hpX : p ≤ X := by
    have hw : 0 < (11 : ℕ) ^ (p + 21) := by positivity
    dsimp [X]
    exact le_mul_of_one_le_right (Nat.zero_le p) (by omega)
  have hupper : (count X : ℝ) ≤ C * (Real.log X) ^ 3 := by
    have hb := hN0 X (hpN0.trans hpX)
    have hn1 : ‖(count X : ℝ)‖ = (count X : ℝ) :=
      Real.norm_of_nonneg (Nat.cast_nonneg _)
    have hn2 : ‖(Real.log X) ^ 3‖ = (Real.log X) ^ 3 :=
      Real.norm_of_nonneg (pow_nonneg (Real.log_natCast_nonneg X) _)
    simpa only [hn1, hn2] using hb
  have hbox : (((p / 4 + 1 : ℕ) : ℝ)) ^ 4 ≤ (count X : ℝ) := by
    exact_mod_cast A396949Certificate.box_count hp hp13
  have hpbox : (p : ℝ) ≤ 4 * ((p / 4 + 1 : ℕ) : ℝ) := by
    exact_mod_cast (show p ≤ 4 * (p / 4 + 1) by omega)
  have hp4 : (p : ℝ) ^ 4 ≤ 256 * (((p / 4 + 1 : ℕ) : ℝ)) ^ 4 := by
    calc
      (p : ℝ) ^ 4 ≤ (4 * ((p / 4 + 1 : ℕ) : ℝ)) ^ 4 := by gcongr
      _ = 256 * (((p / 4 + 1 : ℕ) : ℝ)) ^ 4 := by ring
  have hlog : Real.log X ≤ 31 * (p : ℝ) := A396949Certificate.log_bound hp13
  have hlog3 : (Real.log X) ^ 3 ≤ (31 * (p : ℝ)) ^ 3 := by gcongr
  have hupper2 : (count X : ℝ) ≤ C * (31 * (p : ℝ)) ^ 3 :=
    hupper.trans (mul_le_mul_of_nonneg_left hlog3 hC)
  have hfinal : (p : ℝ) ^ 4 ≤ (256 * C * 31 ^ 3) * (p : ℝ) ^ 3 := by
    calc
      (p : ℝ) ^ 4 ≤ 256 * (((p / 4 + 1 : ℕ) : ℝ)) ^ 4 := hp4
      _ ≤ 256 * (count X : ℝ) := mul_le_mul_of_nonneg_left hbox (by norm_num)
      _ ≤ 256 * (C * (31 * (p : ℝ)) ^ 3) :=
        mul_le_mul_of_nonneg_left hupper2 (by norm_num)
      _ = (256 * C * 31 ^ 3) * (p : ℝ) ^ 3 := by ring
  have hcancel : (p : ℝ) ≤ 256 * C * 31 ^ 3 := by
    apply le_of_mul_le_mul_right (a := (p : ℝ) ^ 3) ?_ (pow_pos hpR 3)
    calc
      (p : ℝ) * (p : ℝ) ^ 3 = (p : ℝ) ^ 4 := by ring
      _ ≤ (256 * C * 31 ^ 3) * (p : ℝ) ^ 3 := hfinal
  exact (not_le_of_gt hpbig) hcancel
