import OMAStatements.S_oeis_a134799

-- Cornelius Lytollis (@con123-gif), assisted by ChatGPT.
-- Steven Finch's conjecture; statement formalized by @senamakel.

namespace A134799Certificate

open OMA.S_oeis_a134799

lemma index_step (n : ℕ) :
    (3 ^ (n + 1) - 1) / 2 = 3 * ((3 ^ n - 1) / 2) + 1 := by
  obtain ⟨k, hk⟩ := (show Odd (3 : ℕ) by decide).pow (n := n)
  have hk' : 3 ^ n = 2 * k + 1 := by omega
  rw [pow_succ, hk']
  omega

lemma representation (n : ℕ) :
    ∃ p : ℤ,
      iterate n = (p : ℚ) / (3 : ℚ) ^ (((3 ^ n - 1) / 2) + 1) ∧
      ¬ (3 : ℤ) ∣ p := by
  induction n with
  | zero =>
      refine ⟨1, ?_, ?_⟩
      · norm_num [iterate]
      · norm_num
  | succ n ih =>
      obtain ⟨p, hp, hp3⟩ := ih
      let t : ℕ := (3 ^ n - 1) / 2
      let D : ℤ := 3 ^ (t + 1)
      have hDodd : Odd D := (show Odd (3 : ℤ) by decide).pow
      have hD3 : (3 : ℤ) ∣ D := by
        dsimp [D]
        exact dvd_pow_self 3 (by omega)
      have heven : Even (p * (D ^ 2 - p ^ 2)) := by
        rcases Int.even_or_odd p with h | h
        · exact h.mul_right _
        · exact ((hDodd.pow (n := 2)).sub_odd (h.pow (n := 2))).mul_left p
      obtain ⟨r, hr⟩ := even_iff_exists_two_mul.mp heven
      have hS3 : ¬ (3 : ℤ) ∣ p * (D ^ 2 - p ^ 2) := by
        intro hs
        rcases Int.prime_three.dvd_or_dvd hs with h | h
        · exact hp3 h
        · have hD2 : (3 : ℤ) ∣ D ^ 2 := dvd_pow hD3 (by decide)
          obtain ⟨u, hu⟩ := hD2
          obtain ⟨v, hv⟩ := h
          have hp2 : (3 : ℤ) ∣ p ^ 2 := ⟨u - v, by linarith⟩
          exact hp3 (Int.prime_three.dvd_of_dvd_pow hp2)
      have hr3 : ¬ (3 : ℤ) ∣ r := by
        intro h
        apply hS3
        rw [hr]
        exact dvd_mul_of_dvd_right h 2
      have hrq : (p : ℚ) * ((D : ℚ) ^ 2 - (p : ℚ) ^ 2) = 2 * (r : ℚ) := by
        exact_mod_cast hr
      have hDn : (D : ℚ) ≠ 0 := by
        simp [D]
      have hDq : (D : ℚ) = (3 : ℚ) ^ (t + 1) := by
        simp [D]
      have hpow : (D : ℚ) ^ 3 = 3 * (3 : ℚ) ^ (3 * t + 2) := by
        rw [hDq, ← pow_mul, ← pow_succ']
        congr 1
        omega
      refine ⟨r, ?_, hr3⟩
      rw [iterate, hp, index_step]
      change (3 / 2 : ℚ) * ((p : ℚ) / 3 ^ (t + 1)) *
          (1 - ((p : ℚ) / 3 ^ (t + 1)) ^ 2) =
        (r : ℚ) / 3 ^ (3 * t + 1 + 1)
      rw [← hDq]
      calc
        (3 / 2 : ℚ) * ((p : ℚ) / (D : ℚ)) *
              (1 - ((p : ℚ) / (D : ℚ)) ^ 2) =
            3 * ((p : ℚ) * ((D : ℚ) ^ 2 - (p : ℚ) ^ 2)) /
              (2 * (D : ℚ) ^ 3) := by
                field_simp [hDn] <;> ring
        _ = 3 * (r : ℚ) / (D : ℚ) ^ 3 := by
          rw [hrq]
          field_simp [hDn] <;> ring
        _ = (r : ℚ) / 3 ^ (3 * t + 1 + 1) := by
          rw [hpow]
          have hE : 3 * t + 1 + 1 = 3 * t + 2 := by omega
          rw [hE]
          field_simp <;> ring

end A134799Certificate

theorem OMA.solution : type_of% @OMA.S_oeis_a134799.main := by
  intro n
  obtain ⟨p, hp, hp3⟩ := A134799Certificate.representation n
  let e : ℕ := (3 ^ n - 1) / 2 + 1
  have hcop3 : Nat.Coprime p.natAbs 3 := by
    apply (Nat.prime_three.coprime_iff_not_dvd.mpr ?_).symm
    intro h
    apply hp3
    exact Int.dvd_natAbs.mp (Int.natCast_dvd_natCast.mpr h)
  have hcop : Nat.Coprime p.natAbs (3 ^ e) := hcop3.pow_right e
  have hden : (((p : ℚ) / ((3 : ℤ) ^ e : ℚ)).den : ℤ) = (3 : ℤ) ^ e := by
    simpa only [Int.cast_pow] using
      (Rat.den_div_eq_of_coprime (a := p) (b := (3 : ℤ) ^ e)
        (by positivity) (by simpa using hcop))
  have hnatden : ((p : ℚ) / (3 : ℚ) ^ e).den = (3 : ℕ) ^ e := by
    exact_mod_cast hden
  rw [hp]
  change ((p : ℚ) / (3 : ℚ) ^ e).den = 3 * OMA.S_oeis_a134799.term n
  rw [hnatden]
  simp [e, OMA.S_oeis_a134799.term, pow_succ, Nat.mul_comm]
