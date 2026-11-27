import OMAStatements.S_oeis_a175784

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Original conjectures credited to R. J. Mathar.

namespace A175784Certificate

open OMA.S_oeis_a175784

lemma q_eq (n : ℕ) :
    q n = ((4 * (n : ℤ) + 8 : ℤ) : ℚ) / ((2 * (n : ℤ) + 9 : ℤ) : ℚ) := by
  dsimp [q]
  push_cast
  have hd : 2 * (n : ℚ) + 9 ≠ 0 := by positivity
  field_simp [hd]
  ring

lemma a_of_fraction (n : ℕ) (p d u v : ℤ)
    (hd : 0 < d)
    (hcross : (4 * (n : ℤ) + 8) * d = p * (2 * (n : ℤ) + 9))
    (hbez : u * p + v * d = 1) : a n = p := by
  have hd1 : ((2 * (n : ℤ) + 9 : ℤ) : ℚ) ≠ 0 := by positivity
  have hd2 : (d : ℚ) ≠ 0 := by exact_mod_cast ne_of_gt hd
  have hq : q n = (p : ℚ) / (d : ℚ) := by
    rw [q_eq]
    apply (div_eq_div_iff hd1 hd2).2
    exact_mod_cast hcross
  rw [a, hq]
  exact Rat.num_div_eq_of_coprime hd
    (Int.isCoprime_iff_nat_coprime.mp ⟨u, v, hbez⟩)

lemma a_mod0 (k : ℕ) : a (5*k) = 20 * (k : ℤ) + 8 := by
  apply a_of_fraction (d := 10 * (k : ℤ) + 9)
    (u := -((k : ℤ) + 1)) (v := 2 * (k : ℤ) + 1)
  · positivity
  · push_cast; ring
  · ring

lemma a_mod1 (k : ℕ) : a (5*k + 1) = 20 * (k : ℤ) + 12 := by
  apply a_of_fraction (d := 10 * (k : ℤ) + 11)
    (u := (k : ℤ) + 1) (v := -(2 * (k : ℤ) + 1))
  · positivity
  · push_cast; ring
  · ring

lemma a_mod2 (k : ℕ) : a (5*k + 2) = 20 * (k : ℤ) + 16 := by
  apply a_of_fraction (d := 10 * (k : ℤ) + 13)
    (u := 7 * (k : ℤ) + 9) (v := -(14 * (k : ℤ) + 11))
  · positivity
  · push_cast; ring
  · ring

lemma a_mod3 (k : ℕ) : a (5*k + 3) = 4 * (k : ℤ) + 4 := by
  apply a_of_fraction (d := 2 * (k : ℤ) + 3)
    (u := (k : ℤ) + 1) (v := -(2 * (k : ℤ) + 1))
  · positivity
  · push_cast; ring
  · ring

lemma a_mod4 (k : ℕ) : a (5*k + 4) = 20 * (k : ℤ) + 24 := by
  apply a_of_fraction (d := 10 * (k : ℤ) + 17)
    (u := 3 * (k : ℤ) + 5) (v := -(6 * (k : ℤ) + 7))
  · positivity
  · push_cast; ring
  · ring

lemma quotient_remainder (n : ℕ) : ∃ k r : ℕ, r < 5 ∧ n = 5*k+r := by
  refine ⟨n / 5, n % 5, Nat.mod_lt n (by decide), ?_⟩
  omega

lemma shift_five (n : ℕ) :
    a (n + 5) = a n + (if n % 5 = 3 then 4 else 20) := by
  obtain ⟨k, r, hr, hn⟩ := quotient_remainder n
  subst n
  have he : 5*k+r+5 = 5*(k+1)+r := by omega
  rw [he]
  interval_cases r <;>
    simp [a_mod0, a_mod1, a_mod2, a_mod3, a_mod4, Nat.add_mod, Nat.mul_mod] <;> ring

lemma recurrence (n : ℕ) (hn : 11 ≤ n) : a n = 2*a (n-5)-a (n-10) := by
  have h1 := shift_five (n-5)
  have h2 := shift_five (n-10)
  have he1 : n-5+5 = n := by omega
  have he2 : n-10+5 = n-5 := by omega
  rw [he1] at h1
  rw [he2] at h2
  have hm : (n-5)%5 = (n-10)%5 := by omega
  rw [hm] at h1
  linear_combination h1-h2

lemma closed_formula (n : ℕ) :
    a n = 4 * (((n+2) / Nat.gcd (n+2) 5 : ℕ) : ℤ) := by
  obtain ⟨k, r, hr, hn⟩ := quotient_remainder n
  subst n
  interval_cases r <;>
    norm_num [a_mod0, a_mod1, a_mod2, a_mod3, a_mod4,
      Nat.add_assoc, Nat.gcd_mul_left_add_left] <;>
    omega

end A175784Certificate

namespace A175784Certificate

open OMA.S_oeis_a175784 PowerSeries

noncomputable def numerator : PowerSeries ℚ :=
  C 12 * X^1 + C 16 * X^2 + C 4 * X^3 + C 24 * X^4 + C 28 * X^5 +
    C 8 * X^6 + C 4 * X^7 - C 4 * X^9 - C 8 * X^10

lemma coeff_series (n : ℕ) :
    coeff n series = if n = 0 then 0 else (a n : ℚ) := by
  simp [series]

lemma generating_identity : series * (1 - (X : PowerSeries ℚ)^5)^2 = numerator := by
  have hf : series * (1 - (X : PowerSeries ℚ)^5)^2 =
      series - series * X^5 - series * X^5 + series * X^10 := by ring
  rw [hf]
  apply PowerSeries.ext
  intro n
  by_cases hn : n ≤ 10
  · interval_cases n <;>
      norm_num [numerator, map_add, map_sub, PowerSeries.coeff_C_mul,
        PowerSeries.coeff_mul_X_pow', PowerSeries.coeff_X_pow, series, a, q] <;> decide
  · have hm : ∀ m : ℕ, m ≤ 10 → n ≠ m := by
      intro m hm
      omega
    have hN : coeff n numerator = 0 := by
      simp only [numerator, map_add, map_sub, PowerSeries.coeff_C_mul,
        PowerSeries.coeff_X_pow, if_neg (hm 1 (by decide)),
        if_neg (hm 2 (by decide)), if_neg (hm 3 (by decide)),
        if_neg (hm 4 (by decide)), if_neg (hm 5 (by decide)),
        if_neg (hm 6 (by decide)), if_neg (hm 7 (by decide)),
        if_neg (hm 9 (by decide)), if_neg (hm 10 (by decide))]
      norm_num
    rw [hN]
    have h5 : 5 ≤ n := by omega
    have h10 : 10 ≤ n := by omega
    have hn0 : n ≠ 0 := by omega
    have hn5 : n - 5 ≠ 0 := by omega
    have hn10 : n - 10 ≠ 0 := by omega
    have ha : (a n : ℚ) = 2 * (a (n-5) : ℚ) - (a (n-10) : ℚ) := by
      exact_mod_cast recurrence n (by omega)
    simp only [map_add, map_sub, PowerSeries.coeff_mul_X_pow', coeff_series,
      if_pos h5, if_pos h10, if_neg hn0, if_neg hn5, if_neg hn10]
    linear_combination ha

lemma full_generating_function :
    series * (((X : PowerSeries ℚ) - 1)^2 * (X^4 + X^3 + X^2 + X + 1)^2) =
      -4 * X * (-3 - 4*X - X^2 - 6*X^3 - 7*X^4 - 2*X^5 - X^6 + X^8 + 2*X^9) := by
  have hd : (((X : PowerSeries ℚ) - 1)^2 *
      (X^4 + X^3 + X^2 + X + 1)^2) = (1-X^5)^2 := by ring
  have hN : numerator =
      -4 * (X : PowerSeries ℚ) *
        (-3 - 4*X - X^2 - 6*X^3 - 7*X^4 - 2*X^5 - X^6 + X^8 + 2*X^9) := by
    simp only [numerator, map_ofNat]
    ring
  rw [hd, ← hN]
  exact generating_identity

end A175784Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a175784.main := by
  refine ⟨?_, ?_, A175784Certificate.full_generating_function⟩
  · intro n hn
    exact A175784Certificate.closed_formula n
  · exact A175784Certificate.recurrence
