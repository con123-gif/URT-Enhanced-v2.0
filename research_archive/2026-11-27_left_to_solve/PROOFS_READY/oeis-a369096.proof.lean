import OMAStatements.S_oeis_a369096


/- Classical Chebyshev estimates for the source-faithful A369096 proof.
No PNT, Landau asymptotic, or new asymptotic theorem is assumed. -/

open Filter

namespace A369096Certificate

theorem primeCounting_lower {n : ℕ} (hn : 100 ≤ n) :
    (n : ℝ) / (4 * Real.log n) ≤ Nat.primeCounting n := by
  have hnR : (100 : ℝ) ≤ n := by exact_mod_cast hn
  have hn0 : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hs0 : 0 ≤ Real.sqrt (n : ℝ) := Real.sqrt_nonneg _
  have hsq : Real.sqrt (n : ℝ) ^ 2 = n := Real.sq_sqrt hn0
  have hs10 : 10 ≤ Real.sqrt (n : ℝ) := by
    nlinarith
  have hs1 : Real.sqrt ((n : ℝ) + 1) ≤ Real.sqrt n + 1 := by
    apply Real.sqrt_le_iff.mpr
    constructor
    · positivity
    · nlinarith
  have hlog0 := Real.log_le_rpow_div
    (show (0 : ℝ) ≤ (n : ℝ) + 1 by positivity)
    (show (0 : ℝ) < 1 / 2 by norm_num)
  rw [← Real.sqrt_eq_rpow] at hlog0
  have hlog : Real.log ((n : ℝ) + 1) ≤ (n : ℝ) / 4 := by
    have hp := mul_nonneg (sub_nonneg.mpr hs10)
      (show (0 : ℝ) ≤ Real.sqrt n + 2 by positivity)
    nlinarith
  have hlog2 : (1 : ℝ) / 2 ≤ Real.log 2 := by
    linarith [Real.log_two_gt_d9]
  have hlogn : 0 < Real.log (n : ℝ) := Real.log_pos (by linarith)
  have hnum : (n : ℝ) / 4 ≤ n * Real.log 2 - Real.log ((n : ℝ) + 1) := by
    nlinarith [mul_le_mul_of_nonneg_left hlog2 hn0]
  have hpi := Chebyshev.pi_ge n
  push_cast at hpi
  calc
    (n : ℝ) / (4 * Real.log n) = ((n : ℝ) / 4) / Real.log n := by ring
    _ ≤ (n * Real.log 2 - Real.log ((n : ℝ) + 1)) / Real.log n :=
      div_le_div_of_nonneg_right hnum hlogn.le
    _ ≤ Nat.primeCounting n := hpi

theorem primeCounting_upper :
    ∀ᶠ n : ℕ in atTop,
      (Nat.primeCounting n : ℝ) ≤ 4 * (n : ℝ) / Real.log n := by
  have h := (tendsto_natCast_atTop_atTop :
    Tendsto (fun n : ℕ => (n : ℝ)) atTop atTop).eventually
      (Chebyshev.eventually_primeCounting_le (by norm_num : (0 : ℝ) < 1))
  filter_upwards [h, eventually_ge_atTop 2] with n hn hn2
  have hn0 : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hlogn : 0 ≤ Real.log (n : ℝ) := Real.log_nonneg (by exact_mod_cast (by omega : 1 ≤ n))
  have hfour : Real.log (4 : ℝ) + 1 ≤ 4 := by
    linarith [Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 4)]
  simp only [Nat.floor_natCast] at hn
  calc
    (Nat.primeCounting n : ℝ) ≤ (Real.log 4 + 1) * n / Real.log n := hn
    _ ≤ 4 * (n : ℝ) / Real.log n := by
      gcongr

theorem primeCounting_dilation (m : ℕ) (hm : 0 < m) :
    ∀ᶠ N : ℕ in atTop,
      (Nat.primeCounting N : ℝ) ≤
        32 * (m : ℝ) * (Nat.primeCounting (N / m) : ℝ) := by
  filter_upwards [primeCounting_upper, eventually_ge_atTop (100 * m)] with N hupper hN
  have hq100 : 100 ≤ N / m := (Nat.le_div_iff_mul_le hm).mpr hN
  have hN100 : 100 ≤ N := by nlinarith
  have hN0 : (0 : ℝ) < N := by exact_mod_cast (by omega : 0 < N)
  have hm0 : (0 : ℝ) < m := by exact_mod_cast hm
  have hq0 : (0 : ℝ) < (N / m : ℕ) := by exact_mod_cast (by omega : 0 < N / m)
  have hlogN : 0 < Real.log (N : ℝ) := Real.log_pos (by exact_mod_cast (by omega : 1 < N))
  have hlogq : 0 < Real.log (N / m : ℕ) := Real.log_pos (by exact_mod_cast (by omega : 1 < N / m))
  have hqN : N / m ≤ N := Nat.div_le_self N m
  have hlogs : Real.log (N / m : ℕ) ≤ Real.log (N : ℝ) :=
    Real.log_le_log hq0 (by exact_mod_cast hqN)
  have hdiv : N ≤ 2 * m * (N / m) := by
    have hmod := Nat.mod_lt N hm
    have heq := Nat.div_add_mod N m
    have hmul : m ≤ m * (N / m) := by nlinarith
    nlinarith
  have hdivR : (N : ℝ) ≤ 2 * (m : ℝ) * (N / m : ℕ) := by exact_mod_cast hdiv
  have hpiq := primeCounting_lower hq100
  have hqbound : (N / m : ℕ) ≤ 4 * Real.log (N : ℝ) * (Nat.primeCounting (N / m) : ℝ) := by
    have hsmall : (N / m : ℕ) ≤
        (Nat.primeCounting (N / m) : ℝ) * (4 * Real.log (N / m : ℕ)) :=
      (div_le_iff₀ (by positivity)).mp hpiq
    have hmul := mul_le_mul_of_nonneg_right hlogs
      (show (0 : ℝ) ≤ Nat.primeCounting (N / m) by positivity)
    nlinarith
  have hNbound : 4 * (N : ℝ) ≤
      Real.log (N : ℝ) * (32 * (m : ℝ) * (Nat.primeCounting (N / m) : ℝ)) := by
    have hmul := mul_le_mul_of_nonneg_left hqbound (show (0 : ℝ) ≤ 8 * m by positivity)
    nlinarith
  have hupper' : Real.log (N : ℝ) * (Nat.primeCounting N : ℝ) ≤ 4 * (N : ℝ) := by
    have := (le_div_iff₀ hlogN).mp hupper
    nlinarith
  exact le_of_mul_le_mul_left (hupper'.trans hNbound) hlogN

end A369096Certificate




/-!
Finite counting lemma for the exact OEIS A369096 prime-proportion statement.
Append after the frozen source namespace OMA.S_oeis_a369096 in a combined probe.
No asymptotic estimate, source closure or kernel pass is claimed by this fragment.
The disjoint large-prime semiprime families are classical elementary background.
Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6;
exact serving variant not exposed). All scalar/counting arguments are exact.
-/

namespace A369096Certificate
open scoped BigOperators
open OMA.S_oeis_a369096

lemma triangular_pair_sum (k : ℕ) :
    triangular k + triangular (k + 1) = (k + 1) ^ 2 := by
  unfold triangular
  rw [← Nat.add_div_of_dvd_right (Nat.two_dvd_mul_add_one k)]
  have he : k * (k + 1) + (k + 1) * (k + 1 + 1) = (k + 1) ^ 2 * 2 := by ring
  rw [he]
  omega

lemma distinct_odd_prime_product_member {p q : ℕ}
    (hp : p.Prime) (hq : q.Prime) (hpOdd : Odd p) (hqOdd : Odd q) (hne : p ≠ q) :
    member (p * q) := by
  have hcard : (p * q).primeFactors.card = 2 := by
    rw [Nat.primeFactors_mul hp.ne_zero hq.ne_zero, hp.primeFactors, hq.primeFactors]
    simp [hne, Ne.symm hne]
  have htwo : 2 ∣ p * q + 1 := by
    obtain ⟨a, ha⟩ := hpOdd.mul hqOdd
    refine ⟨a + 1, ?_⟩
    omega
  constructor
  · have hfour := Nat.mul_le_mul hp.two_le hq.two_le
    omega
  · rw [hcard, triangular_pair_sum, pow_two]
    exact dvd_mul_of_dvd_left htwo _

/-- Prime q is larger than the common cutoff B, so it cannot be confused with
any of the chosen small prime factors. -/
def largePrimePairs (P : Finset ℕ) (B N : ℕ) : Finset (Σ _ : ℕ, ℕ) :=
  P.sigma (fun p => Nat.primesLE (N / p) \ Nat.primesLE B)

lemma largePrimePairs_data {P : Finset ℕ} {B N p q : ℕ}
    (hP : ∀ p ∈ P, Nat.Prime p ∧ Odd p ∧ p ≤ B)
    (h : (⟨p, q⟩ : Σ _ : ℕ, ℕ) ∈ largePrimePairs P B N) :
    p.Prime ∧ Odd p ∧ p ≤ B ∧ q.Prime ∧ B < q ∧ q ≤ N / p := by
  have hmem := Finset.mem_sigma.mp h
  change p ∈ P ∧ q ∈ (Nat.primesLE (N / p) \ Nat.primesLE B) at hmem
  obtain ⟨hpP, hq⟩ := hmem
  obtain ⟨hqmem, hqnot⟩ := Finset.mem_sdiff.mp hq
  obtain ⟨hqp, hqPrime⟩ := Nat.mem_primesLE.mp hqmem
  obtain ⟨hp, hpOdd, hpB⟩ := hP p hpP
  have hBq : B < q := by
    by_contra h
    exact hqnot (Nat.mem_primesLE.mpr ⟨by omega, hqPrime⟩)
  exact ⟨hp, hpOdd, hpB, hqPrime, hBq, hqp⟩

lemma largePrimePairs_product_injective (P : Finset ℕ) (B N : ℕ)
    (hP : ∀ p ∈ P, Nat.Prime p ∧ Odd p ∧ p ≤ B) :
    Set.InjOn (fun z : Σ _ : ℕ, ℕ => z.1 * z.2) (largePrimePairs P B N) := by
  intro x hx y hy hxy
  obtain ⟨p, q⟩ := x
  obtain ⟨r, s⟩ := y
  obtain ⟨hp, hpOdd, hpB, hq, hBq, hqp⟩ := largePrimePairs_data hP hx
  obtain ⟨hr, hrOdd, hrB, hs, hBs, hsr⟩ := largePrimePairs_data hP hy
  change p * q = r * s at hxy
  have hdiv : p ∣ r * s := by
    rw [← hxy]
    exact dvd_mul_right p q
  rcases hp.dvd_mul.mp hdiv with hpr | hps
  · have he : p = r := (Nat.prime_dvd_prime_iff_eq hp hr).mp hpr
    subst r
    have heq : q = s := Nat.eq_of_mul_eq_mul_left hp.pos hxy
    subst s
    rfl
  · have he : p = s := (Nat.prime_dvd_prime_iff_eq hp hs).mp hps
    omega

lemma largePrimePairs_product_member (P : Finset ℕ) (B N : ℕ) (hB : 2 ≤ B)
    (hP : ∀ p ∈ P, Nat.Prime p ∧ Odd p ∧ p ≤ B) :
    ∀ n ∈ (largePrimePairs P B N).image (fun z => z.1 * z.2),
      2 ≤ n ∧ n ≤ N ∧ member n := by
  classical
  intro n hn
  obtain ⟨⟨p, q⟩, hpq, rfl⟩ := Finset.mem_image.mp hn
  obtain ⟨hp, hpOdd, hpB, hq, hBq, hqp⟩ := largePrimePairs_data hP hpq
  have hqOdd : Odd q := hq.odd_of_ne_two (by omega)
  have hne : p ≠ q := by omega
  have hm := distinct_odd_prime_product_member hp hq hpOdd hqOdd hne
  have hle : p * q ≤ N := by
    have he := (Nat.le_div_iff_mul_le hp.pos).mp hqp
    simpa only [Nat.mul_comm q p] using he
  exact ⟨hm.1, hle, hm⟩

lemma largePrimePairs_card_le_count (P : Finset ℕ) (B N : ℕ) (hB : 2 ≤ B)
    (hP : ∀ p ∈ P, Nat.Prime p ∧ Odd p ∧ p ≤ B) :
    (largePrimePairs P B N).card ≤ count N := by
  classical
  have hi := largePrimePairs_product_injective P B N hP
  have hs : (largePrimePairs P B N).image (fun z => z.1 * z.2) ⊆
      (Finset.Icc 2 N).filter member := by
    intro n hn
    obtain ⟨h2, hN, hm⟩ := largePrimePairs_product_member P B N hB hP n hn
    exact Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨h2, hN⟩, hm⟩
  have hc := Finset.card_le_card hs
  rw [Finset.card_image_of_injOn hi] at hc
  exact hc

/-- Each small prime's omitted q≤B portion costs at most π(B), uniformly in N.
This form does not assume N/p≥B and therefore covers every natural cutoff. -/
theorem finite_prime_sum_bound (P : Finset ℕ) (B N : ℕ) (hB : 2 ≤ B)
    (hP : ∀ p ∈ P, Nat.Prime p ∧ Odd p ∧ p ≤ B) :
    ∑ p ∈ P, Nat.primeCounting (N / p) ≤ count N + P.card * Nat.primeCounting B := by
  classical
  have hpoint (p : ℕ) : Nat.primeCounting (N / p) ≤
      (Nat.primesLE (N / p) \ Nat.primesLE B).card + Nat.primeCounting B := by
    simpa only [Nat.primesLE_card_eq_primeCounting] using
      (Finset.card_le_card_sdiff_add_card (s := Nat.primesLE (N / p))
        (t := Nat.primesLE B))
  calc
    (∑ p ∈ P, Nat.primeCounting (N / p)) ≤
        ∑ p ∈ P, ((Nat.primesLE (N / p) \ Nat.primesLE B).card + Nat.primeCounting B) :=
      Finset.sum_le_sum (fun p _ => hpoint p)
    _ = (largePrimePairs P B N).card + P.card * Nat.primeCounting B := by
      rw [Finset.sum_add_distrib, Finset.sum_const_nat (fun _ _ => rfl)]
      rw [largePrimePairs, Finset.card_sigma]
    _ ≤ count N + P.card * Nat.primeCounting B :=
      Nat.add_le_add_right (largePrimePairs_card_le_count P B N hB hP) _

end A369096Certificate




/- Assemble after the exact A369096 statement and the Chebyshev and finite
semiprime-counting modules. All classical ingredients are explicitly prior. -/

open Filter Finset
open scoped BigOperators
open OMA.S_oeis_a369096

namespace A369096Certificate

theorem exists_odd_prime_recip_sum (C : ℝ) :
    ∃ P : Finset ℕ, (∀ p ∈ P, Nat.Prime p ∧ Odd p) ∧
      C < ∑ p ∈ P, (1 : ℝ) / p := by
  classical
  by_contra h
  push_neg at h
  have hbounded : ∀ S : Finset ℕ,
      ∑ p ∈ S, Set.indicator {p : ℕ | Nat.Prime p} (fun p => (1 : ℝ) / p) p ≤ C + 1 := by
    intro S
    let Q := S.filter Nat.Prime
    let P := Q.erase 2
    have hP : ∀ p ∈ P, Nat.Prime p ∧ Odd p := by
      intro p hp
      obtain ⟨hne, hpQ⟩ := Finset.mem_erase.mp hp
      have hprime := (Finset.mem_filter.mp hpQ).2
      exact ⟨hprime, hprime.odd_of_ne_two hne⟩
    have hsmall := h P hP
    have hsubset : Q ⊆ insert 2 P := by
      intro p hp
      by_cases htwo : p = 2
      · simp [htwo]
      · exact Finset.mem_insert_of_mem (Finset.mem_erase.mpr ⟨htwo, hp⟩)
    have hsum : (∑ p ∈ Q, (1 : ℝ) / p) ≤
        ∑ p ∈ insert 2 P, (1 : ℝ) / p :=
      Finset.sum_le_sum_of_subset_of_nonneg hsubset (fun _ _ _ => by positivity)
    have hne : 2 ∉ P := by simp [P]
    rw [Finset.sum_insert hne] at hsum
    have hidentity : (∑ p ∈ S,
        Set.indicator {p : ℕ | Nat.Prime p} (fun p => (1 : ℝ) / p) p) =
        ∑ p ∈ Q, (1 : ℝ) / p := by
      simp [Q, Finset.sum_filter, Set.indicator]
    rw [hidentity]
    norm_num at hsum hsmall ⊢
    linarith
  exact not_summable_one_div_on_primes
    (summable_of_sum_le (fun n => Set.indicator_nonneg (fun p _ => by positivity) _) hbounded)

theorem count_pos {N : ℕ} (hN : 2 ≤ N) : 0 < count N := by
  classical
  have hm : member 2 := by
    simp [member, Nat.prime_two.primeFactors]
  unfold count
  apply Finset.card_pos.mpr
  exact ⟨2, Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨le_rfl, hN⟩, hm⟩⟩

theorem relative_density_zero :
    Filter.Tendsto (fun N : ℕ =>
      (Nat.primeCounting N : ℝ) / (count N : ℝ)) atTop (nhds 0) := by
  classical
  apply tendsto_order.2
  constructor
  · intro a ha
    exact Filter.Eventually.of_forall fun N => ha.trans_le (by positivity)
  · intro ε hε
    obtain ⟨P, hP, hH⟩ := exists_odd_prime_recip_sum (64 / ε + 1)
    let H : ℝ := ∑ p ∈ P, (1 : ℝ) / p
    let B : ℕ := P.sup id + 2
    let K : ℕ := P.card * Nat.primeCounting B
    have hB : 2 ≤ B := by dsimp [B]; omega
    have hPB : ∀ p ∈ P, Nat.Prime p ∧ Odd p ∧ p ≤ B := by
      intro p hp
      have hsup : p ≤ P.sup id := Finset.le_sup (f := id) hp
      exact ⟨(hP p hp).1, (hP p hp).2, by dsimp [B]; omega⟩
    have hH' : 64 / ε + 1 < H := hH
    have hHm : 0 < H - 1 := by
      have hposdiv : 0 < (64 : ℝ) / ε := by positivity
      linarith
    have hlarge : 64 < (H - 1) * ε := by
      apply (div_lt_iff₀ hε).mp
      linarith
    have hdil : ∀ᶠ N : ℕ in atTop, ∀ p ∈ P,
        (Nat.primeCounting N : ℝ) ≤
          32 * (p : ℝ) * (Nat.primeCounting (N / p) : ℝ) := by
      apply (Filter.eventually_all_finset P).mpr
      intro p hp
      exact primeCounting_dilation p (hP p hp).1.pos
    have hprime : ∀ᶠ N : ℕ in atTop, 32 * K ≤ Nat.primeCounting N :=
      Nat.tendsto_primeCounting.eventually (eventually_ge_atTop (32 * K))
    filter_upwards [hdil, hprime, eventually_ge_atTop 2] with N hdilN hprimeN hN
    have hpos : (0 : ℝ) < count N := by exact_mod_cast count_pos hN
    have hsum : H * (Nat.primeCounting N : ℝ) ≤
        32 * ∑ p ∈ P, (Nat.primeCounting (N / p) : ℝ) := by
      have hpoint : ∀ p ∈ P,
          ((1 : ℝ) / p) * (Nat.primeCounting N : ℝ) ≤
            32 * (Nat.primeCounting (N / p) : ℝ) := by
        intro p hp
        have hp0 : (0 : ℝ) < p := by exact_mod_cast (hP p hp).1.pos
        have hpbound := hdilN p hp
        calc
          ((1 : ℝ) / p) * (Nat.primeCounting N : ℝ) =
              (Nat.primeCounting N : ℝ) / p := by ring
          _ ≤ 32 * (Nat.primeCounting (N / p) : ℝ) :=
            (div_le_iff₀ hp0).mpr (by nlinarith)
      simpa only [H, Finset.sum_mul, Finset.mul_sum] using Finset.sum_le_sum hpoint
    have hcount : (∑ p ∈ P, (Nat.primeCounting (N / p) : ℝ)) ≤
        (count N : ℝ) + K := by
      dsimp [K]
      exact_mod_cast finite_prime_sum_bound P B N hB hPB
    have hprimeR : 32 * (K : ℝ) ≤ (Nat.primeCounting N : ℝ) := by
      exact_mod_cast hprimeN
    have hbound : (H - 1) * (Nat.primeCounting N : ℝ) ≤ 32 * (count N : ℝ) := by
      linarith
    calc
      (Nat.primeCounting N : ℝ) / (count N : ℝ) ≤ 32 / (H - 1) :=
        (div_le_div_iff₀ hpos hHm).mpr (by nlinarith)
      _ < ε := (div_lt_iff₀ hHm).mpr (by nlinarith)

end A369096Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a369096.main :=
  A369096Certificate.relative_density_zero

