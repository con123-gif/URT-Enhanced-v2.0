import OMAStatements.S_oeis_a175784

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Original conjectures R. J. Mathar. Independent gcd compression of our archived proof.
-- CANDIDATE ONLY: no fresh Lean kernel verification.

namespace A175784Certificate
open OMA.S_oeis_a175784

lemma closed_formula (n : ℕ) :
    a n = 4 * (((n+2) / Nat.gcd (n+2) 5 : ℕ) : ℤ) := by
  have hq : q n = mkRat (↑(4*(n+2):ℕ)) (2*(n+2)+5) := by
    rw [← Rat.divInt_ofNat, Rat.divInt_eq_div]
    unfold q
    push_cast
    have hd : 2*(n:ℚ)+9 ≠ 0 := by positivity
    field_simp [hd] <;> ring
  have hc : Nat.Coprime 4 (2*(n+2)+5) := by
    have h : Nat.Coprime 2 (2*(n+2)+5) := by
      rw [Nat.prime_two.coprime_iff_not_dvd]
      omega
    simpa using h.pow_left 2
  have hg : Nat.gcd (2*(n+2)+5) (4*(n+2)) = Nat.gcd (n+2) 5 := by
    rw [hc.gcd_mul_left_cancel_right (n+2), Nat.gcd_mul_right_add_left, Nat.gcd_comm 5]
  rw [a, hq, Rat.num_mkRat, if_neg (by omega), Int.natAbs_natCast, hg]
  exact_mod_cast Nat.mul_div_assoc 4 (Nat.gcd_dvd_left (n+2) 5)

lemma shift_five (n : ℕ) :
    a (n+5) = a n + (if n%5=3 then 4 else 20) := by
  obtain ⟨k,r,hr,rfl⟩ : ∃ k r : ℕ, r < 5 ∧ n = 5*k+r :=
    ⟨n/5,n%5,Nat.mod_lt n (by decide),by omega⟩
  rw [show 5*k+r+5=5*(k+1)+r by omega, closed_formula, closed_formula]
  interval_cases r <;>
    norm_num [Nat.add_assoc,Nat.gcd_mul_left_add_left,Nat.add_mod,Nat.mul_mod] <;> omega

lemma recurrence (n : ℕ) (hn : 11 ≤ n) : a n = 2*a (n-5)-a (n-10) := by
  have h1 := shift_five (n-5)
  have h2 := shift_five (n-10)
  rw [show n-5+5=n by omega, show (n-5)%5=(n-10)%5 by omega] at h1
  rw [show n-10+5=n-5 by omega] at h2
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
  · have hN : coeff n numerator = 0 := by
      simp (disch := omega) only [numerator, map_add, map_sub, PowerSeries.coeff_C_mul,
        PowerSeries.coeff_X_pow, if_neg]
      norm_num
    rw [hN]
    have ha : (a n : ℚ) = 2 * (a (n-5) : ℚ) - (a (n-10) : ℚ) := by
      exact_mod_cast recurrence n (by omega)
    simp (disch := omega) only [map_add, map_sub, PowerSeries.coeff_mul_X_pow', coeff_series,
      if_pos, if_neg]
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
