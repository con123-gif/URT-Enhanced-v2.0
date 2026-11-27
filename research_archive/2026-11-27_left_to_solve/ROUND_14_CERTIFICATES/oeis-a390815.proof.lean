import OMAStatements.S_oeis_a390815

open Finset

namespace A390815Research

def sigma (n : ℕ) : ℕ := ArithmeticFunction.sigma 1 n

def PP (n : ℕ) : Prop :=
  ∃ p e : ℕ, p.Prime ∧ 0 < e ∧ n = p ^ e

theorem geometric_bound (p e : ℕ) (hp : 2 ≤ p) :
    (∑ i ∈ Finset.range (e + 1), p ^ i) + 1 ≤ 2 * p ^ e := by
  induction e with
  | zero => simp
  | succ e ih =>
      rw [Finset.sum_range_succ]
      simp only [pow_succ]
      have hmul : 2 * p ^ e ≤ p ^ e * p := by
        simpa [Nat.mul_comm] using Nat.mul_le_mul_left (p ^ e) hp
      omega

theorem geometric_odd_bound (p e : ℕ) (hp : 3 ≤ p) :
    2 * (∑ i ∈ Finset.range (e + 1), p ^ i) + 1 ≤ 3 * p ^ e := by
  induction e with
  | zero => simp
  | succ e ih =>
      rw [Finset.sum_range_succ]
      simp only [pow_succ]
      have hmul : 3 * p ^ e ≤ p ^ e * p := by
        simpa [Nat.mul_comm] using Nat.mul_le_mul_left (p ^ e) hp
      omega

theorem sigma_pp_bound {n : ℕ} (hn : PP n) : sigma n + 1 ≤ 2 * n := by
  rcases hn with ⟨p, e, hp, he, rfl⟩
  rw [sigma, ArithmeticFunction.sigma_one_apply_prime_pow hp]
  exact geometric_bound p e hp.two_le

theorem sigma_pp_bound_coprime_two {n : ℕ} (hn : PP n) (hodd : Nat.Coprime 2 n) :
    2 * sigma n + 1 ≤ 3 * n := by
  rcases hn with ⟨p, e, hp, he, rfl⟩
  have hcp : Nat.Coprime 2 p := (Nat.coprime_pow_right_iff he 2 p).mp hodd
  have hp3 : 3 ≤ p := by
    have hp2le : 2 ≤ p := hp.two_le
    by_contra h
    have hp2 : p = 2 := by omega
    subst p
    norm_num at hcp
  rw [sigma, ArithmeticFunction.sigma_one_apply_prime_pow hp]
  exact geometric_odd_bound p e hp3

theorem distinct_mul_dvd_factorial (a b n : ℕ)
    (ha : 0 < a) (hb : 0 < b) (han : a ≤ n) (hbn : b ≤ n) (hab : a ≠ b) :
    a * b ∣ n.factorial := by
  have hne : a - 1 ≠ b - 1 := by omega
  have hsub : ({a - 1, b - 1} : Finset ℕ) ⊆ Finset.range n := by
    intro i hi
    simp only [Finset.mem_insert, Finset.mem_singleton] at hi
    rcases hi with rfl | rfl <;> simp only [Finset.mem_range] <;> omega
  have h := Finset.prod_dvd_prod_of_subset {a - 1, b - 1} (Finset.range n)
    (fun i : ℕ => i + 1) hsub
  simpa [Finset.prod_pair hne, Nat.sub_add_cancel ha, Nat.sub_add_cancel hb,
    ← Nat.factorial_eq_prod_range_add_one] using h

theorem composite_dvd_factorial (m n : ℕ) (hn : 6 ≤ n)
    (hm : 0 < m) (hmn : m ≤ 2 * n) (hnp : ¬ m.Prime) : m ∣ n.factorial := by
  by_cases hsmall : m ≤ n
  · exact Nat.dvd_factorial hm hsmall
  have hm2 : 2 ≤ m := by omega
  obtain ⟨a, b, ham, hbm, hab⟩ := (Nat.not_prime_iff_exists_mul_eq hm2).mp hnp
  have ha2 : 2 ≤ a := by
    by_contra h
    interval_cases a <;> simp_all
  have hb2 : 2 ≤ b := by
    by_contra h
    interval_cases b <;> simp_all
  have han : a ≤ n := by nlinarith
  have hbn : b ≤ n := by nlinarith
  by_cases hne : a ≠ b
  · rw [← hab]
    exact distinct_mul_dvd_factorial a b n (by omega) (by omega) han hbn hne
  have heq : a = b := by simpa using hne
  subst b
  have ha3 : 3 ≤ a := by
    by_contra h
    have haeq : a = 2 := by omega
    subst a
    norm_num at hab
    omega
  have h2an : 2 * a ≤ n := by
    by_cases haeq : a = 3
    · subst a
      omega
    have ha4 : 4 ≤ a := by omega
    have h4 : 4 * a ≤ a * a := Nat.mul_le_mul_right a ha4
    nlinarith
  have hpair := distinct_mul_dvd_factorial a (2 * a) n (by omega) (by omega)
    han h2an (by omega)
  rw [← hab]
  exact (show a * a ∣ a * (2 * a) from ⟨2, by ring⟩).trans hpair

theorem sigma_lt_two_pp {n : ℕ} (hn : PP n) : sigma n < 2 * n := by
  have := sigma_pp_bound hn
  omega

theorem factorial_product_dvd {a b u v : ℕ}
    (ha : a ∣ u.factorial) (hb : b ∣ v.factorial) :
    a * b ∣ (u + v).factorial := by
  exact (Nat.mul_dvd_mul ha hb).trans (Nat.factorial_mul_factorial_dvd_factorial_add u v)

theorem mixed_budget (a b s : ℕ) (ha : 2 ≤ a) (hb : 3 ≤ b)
    (hs : s + 1 ≤ 2 * a) : s + b ≤ a * b := by
  have hmul : 2 * (b - 2) ≤ a * (b - 2) := Nat.mul_le_mul_right (b - 2) ha
  have hbsub : b - 2 + 2 = b := by omega
  have heq : a * b = a * (b - 2) + 2 * a := by
    have h : b = (b - 2) + 2 := by omega
    calc
      a * b = a * ((b - 2) + 2) := congrArg (a * ·) h
      _ = a * (b - 2) + 2 * a := by ring
  omega

theorem two_pp_budget (a b s t : ℕ) (ha : 4 ≤ a) (hb : 3 ≤ b)
    (hs : s + 1 ≤ 2 * a) (ht : t + 1 ≤ 2 * b) : s + t ≤ a * b := by
  have hmul : 4 * (b - 2) ≤ a * (b - 2) := Nat.mul_le_mul_right (b - 2) ha
  have hbsub : b - 2 + 2 = b := by omega
  have heq : a * b = a * (b - 2) + 2 * a := by
    have h : b = (b - 2) + 2 := by omega
    calc
      a * b = a * ((b - 2) + 2) := congrArg (a * ·) h
      _ = a * (b - 2) + 2 * a := by ring
  omega

theorem sigma_two : sigma 2 = 3 := by decide

theorem sigma_six_dvd : sigma 6 ∣ Nat.factorial 6 := by decide

theorem two_pp_product_dvd (b : ℕ) (hb : 1 < b)
    (hcop : Nat.Coprime 2 b) (hpb : PP b) :
    sigma (2 * b) ∣ (2 * b).factorial := by
  by_cases hb3 : b = 3
  · subst b
    exact sigma_six_dvd
  have hb5 : 5 ≤ b := by
    have hodd := hcop.odd_of_left
    rcases hodd with ⟨u, hu⟩
    omega
  have hbound := sigma_pp_bound_coprime_two hpb hcop
  have hbudget : sigma 2 + sigma b ≤ 2 * b := by
    rw [sigma_two]
    omega
  have hmul : sigma (2 * b) = sigma 2 * sigma b :=
    ArithmeticFunction.isMultiplicative_sigma.map_mul_of_coprime hcop
  rw [hmul]
  exact (factorial_product_dvd
    (Nat.dvd_factorial (ArithmeticFunction.sigma_pos 1 2 (by decide)) le_rfl)
    (Nat.dvd_factorial (ArithmeticFunction.sigma_pos 1 b (by omega)) le_rfl)).trans
    (Nat.factorial_dvd_factorial hbudget)

theorem pp_product_dvd (a b : ℕ) (ha : 1 < a) (hb : 1 < b)
    (hcop : Nat.Coprime a b) (hpa : PP a) (hpb : PP b) :
    sigma (a * b) ∣ (a * b).factorial := by
  have hmul : sigma (a * b) = sigma a * sigma b :=
    ArithmeticFunction.isMultiplicative_sigma.map_mul_of_coprime hcop
  by_cases ha2 : a = 2
  · subst a
    exact two_pp_product_dvd b hb hcop hpb
  by_cases hb2 : b = 2
  · subst b
    simpa [Nat.mul_comm] using two_pp_product_dvd a ha hcop.symm hpa
  have ha3 : 3 ≤ a := by omega
  have hb3 : 3 ≤ b := by omega
  have hbudget : sigma a + sigma b ≤ a * b := by
    by_cases ha4 : 4 ≤ a
    · exact two_pp_budget a b (sigma a) (sigma b) ha4 hb3
        (sigma_pp_bound hpa) (sigma_pp_bound hpb)
    have haeq : a = 3 := by omega
    have hb4 : 4 ≤ b := by
      by_contra h
      have hbeq : b = 3 := by omega
      subst a
      subst b
      norm_num at hcop
    have h := two_pp_budget b a (sigma b) (sigma a) hb4 ha3
      (sigma_pp_bound hpb) (sigma_pp_bound hpa)
    simpa only [Nat.add_comm, Nat.mul_comm] using h
  rw [hmul]
  exact (factorial_product_dvd
    (Nat.dvd_factorial (ArithmeticFunction.sigma_pos 1 a (by omega)) le_rfl)
    (Nat.dvd_factorial (ArithmeticFunction.sigma_pos 1 b (by omega)) le_rfl)).trans
    (Nat.factorial_dvd_factorial hbudget)

theorem sigma_dvd_or_pp (n : ℕ) : 0 < n → sigma n ∣ n.factorial ∨ PP n := by
  induction n using Nat.recOnPosPrimePosCoprime with
  | prime_pow p e hp he =>
      intro hn
      exact Or.inr ⟨p, e, hp, he, rfl⟩
  | zero =>
      intro hn
      omega
  | one =>
      intro hn
      left
      norm_num [sigma]
  | coprime a b ha hb hcop iha ihb =>
      intro hn
      have hmul : sigma (a * b) = sigma a * sigma b :=
        ArithmeticFunction.isMultiplicative_sigma.map_mul_of_coprime hcop
      have hab : a + b ≤ a * b := by
        have h1 : 2 * a ≤ a * b := by
          simpa [Nat.mul_comm] using Nat.mul_le_mul_left a (show 2 ≤ b by omega)
        have h2 : 2 * b ≤ a * b := Nat.mul_le_mul_right b (by omega : 2 ≤ a)
        omega
      rcases iha (by omega) with had | hpa
      · rcases ihb (by omega) with hbd | hpb
        · left
          rw [hmul]
          exact (factorial_product_dvd had hbd).trans (Nat.factorial_dvd_factorial hab)
        · left
          have ha3 : 3 ≤ a := by
            by_contra h
            have ha2 : a = 2 := by omega
            subst a
            have hnot : ¬ sigma 2 ∣ Nat.factorial 2 := by decide
            exact hnot had
          have hbudget : sigma b + a ≤ b * a :=
            mixed_budget b a (sigma b) (by omega) ha3 (sigma_pp_bound hpb)
          have hbudget' : a + sigma b ≤ a * b := by
            simpa only [Nat.add_comm, Nat.mul_comm] using hbudget
          have hsbd : sigma b ∣ (sigma b).factorial :=
            Nat.dvd_factorial (ArithmeticFunction.sigma_pos 1 b (by omega)) le_rfl
          rw [hmul]
          exact (factorial_product_dvd had hsbd).trans
            (Nat.factorial_dvd_factorial hbudget')
      · rcases ihb (by omega) with hbd | hpb
        · left
          have hb3 : 3 ≤ b := by
            by_contra h
            have hb2 : b = 2 := by omega
            subst b
            have hnot : ¬ sigma 2 ∣ Nat.factorial 2 := by decide
            exact hnot hbd
          have hbudget : sigma a + b ≤ a * b :=
            mixed_budget a b (sigma a) (by omega) hb3 (sigma_pp_bound hpa)
          rw [hmul]
          exact (factorial_product_dvd
            (Nat.dvd_factorial (ArithmeticFunction.sigma_pos 1 a (by omega)) le_rfl) hbd).trans
            (Nat.factorial_dvd_factorial hbudget)
        · exact Or.inl (pp_product_dvd a b ha hb hcop hpa hpb)

theorem sigma_prime_of_not_dvd (n : ℕ) (hn : 6 ≤ n)
    (hnot : ¬ sigma n ∣ n.factorial) :
    (sigma n).Prime ∧ n < sigma n ∧ PP n := by
  rcases sigma_dvd_or_pp n (by omega) with hd | hpp
  · exact False.elim (hnot hd)
  have hspos : 0 < sigma n := ArithmeticFunction.sigma_pos 1 n (by omega)
  have hsbound : sigma n ≤ 2 * n := by
    have := sigma_lt_two_pp hpp
    omega
  have hsprime : (sigma n).Prime := by
    by_contra h
    exact hnot (composite_dvd_factorial (sigma n) n hn hspos hsbound h)
  have hslarge : n < sigma n := by
    by_contra h
    exact hnot (Nat.dvd_factorial hspos (by omega))
  exact ⟨hsprime, hslarge, hpp⟩

theorem odd_geometric_factor (p m : ℕ) :
    (∑ i ∈ Finset.range (2 * m + 2), p ^ i) =
      (p + 1) * (∑ j ∈ Finset.range (m + 1), (p ^ 2) ^ j) := by
  induction m with
  | zero => simp
  | succ m ih =>
      have hindex : 2 * (m + 1) + 2 = (2 * m + 2) + 1 + 1 := by omega
      have hpow0 : p ^ (2 * m + 2) = (p ^ 2) ^ (m + 1) := by
        rw [show 2 * m + 2 = 2 * (m + 1) by omega, pow_mul]
      have hpow1 : p ^ (2 * m + 3) = (p ^ 2) ^ (m + 1) * p := by
        rw [show 2 * m + 3 = (2 * m + 2) + 1 by omega, pow_add, pow_one, hpow0]
      calc
        _ = (∑ i ∈ Finset.range (2 * m + 2), p ^ i) +
              p ^ (2 * m + 2) + p ^ (2 * m + 3) := by
                rw [hindex, Finset.sum_range_succ, Finset.sum_range_succ]
        _ = (p + 1) * (∑ j ∈ Finset.range (m + 1), (p ^ 2) ^ j) +
              (p ^ 2) ^ (m + 1) + (p ^ 2) ^ (m + 1) * p := by
                rw [ih, hpow0, hpow1]
        _ = (p + 1) * ((∑ j ∈ Finset.range (m + 1), (p ^ 2) ^ j) +
              (p ^ 2) ^ (m + 1)) := by ring
        _ = _ := by
          congr 1
          exact (Finset.sum_range_succ (fun j : ℕ => (p ^ 2) ^ j) (m + 1)).symm

theorem prime_sigma_pp_square (n : ℕ) (hn : 4 ≤ n)
    (hsprime : (sigma n).Prime) (hslarge : n < sigma n) (hpp : PP n) :
    ∃ k : ℕ, n = k ^ 2 := by
  rcases hpp with ⟨p, e, hp, he, hnEq⟩
  have hptwo : 2 ≤ p := hp.two_le
  rcases Nat.even_or_odd e with heven | hodd
  · rcases heven with ⟨m, hm⟩
    refine ⟨p ^ m, ?_⟩
    rw [hnEq, hm, pow_add, pow_two]
  · rcases hodd with ⟨m, hm⟩
    have hdiv : p + 1 ∣ sigma n := by
      rw [hnEq, sigma, ArithmeticFunction.sigma_one_apply_prime_pow hp]
      rw [show e + 1 = 2 * m + 2 by omega, odd_geometric_factor]
      exact dvd_mul_right _ _
    have hsum : p + 1 = sigma n :=
      (Nat.dvd_prime_two_le hsprime (by omega)).mp hdiv
    have hple : p ≤ n := by
      rw [hnEq]
      exact Nat.le_self_pow (Nat.ne_of_gt he) p
    have hnp : n = p := by omega
    have hpodd : Odd p := hp.odd_iff.mpr (by omega)
    have hseven : Even (sigma n) := by
      rcases hpodd with ⟨k, hk⟩
      refine ⟨k + 1, ?_⟩
      omega
    have hs2 : sigma n = 2 := hsprime.even_iff.mp hseven
    omega

end A390815Research

/-- The two original assertions from A390815. -/
theorem OMA.solution : type_of% @OMA.S_oeis_a390815.main := by
  constructor
  · intro n hn
    by_cases h6 : 6 ≤ n
    · intro hd
      by_cases hdiv : A390815Research.sigma n ∣ n.factorial
      · have hspos : 0 < A390815Research.sigma n :=
          ArithmeticFunction.sigma_pos 1 n (by omega)
        change 1 < A390815Research.sigma n /
          Nat.gcd (A390815Research.sigma n) n.factorial at hd
        rw [Nat.gcd_eq_left hdiv, Nat.div_self hspos] at hd
        omega
      · obtain ⟨hp, hlarge, hpp⟩ := A390815Research.sigma_prime_of_not_dvd n h6 hdiv
        have hcop : Nat.gcd (A390815Research.sigma n) n.factorial = 1 :=
          (hp.coprime_factorial_of_lt hlarge).gcd_eq_one
        change (A390815Research.sigma n /
          Nat.gcd (A390815Research.sigma n) n.factorial).Prime
        rw [hcop, Nat.div_one]
        exact hp
    · have hnlt : n < 6 := by omega
      interval_cases n <;> decide
  · intro n hn
    by_cases h6 : 6 ≤ n
    · intro hnot
      obtain ⟨hp, hlarge, hpp⟩ := A390815Research.sigma_prime_of_not_dvd n h6 hnot
      exact A390815Research.prime_sigma_pp_square n hn hp hlarge hpp
    · have hsmall : n = 4 ∨ n = 5 := by omega
      rcases hsmall with rfl | rfl
      · intro hnot
        exact ⟨2, by decide⟩
      · intro hnot
        exact False.elim (hnot (by decide))
