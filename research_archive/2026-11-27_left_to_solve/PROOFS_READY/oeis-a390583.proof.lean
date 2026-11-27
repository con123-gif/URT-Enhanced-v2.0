import OMAStatements.S_oeis_a390583

-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
-- Descartes' theorem and elementary reduced-fraction uniqueness are prior mathematics.
-- Background: C. J. Bradley, Challenges in Geometry (2005), Section 7.2.
-- The primitive gcd argument is supplied in full below; no new-method priority is claimed.

namespace OMA.S_oeis_a390583

private lemma reduced_cross_product {R g D N : ℕ}
    (h : R * D = g * N) (hRg : R.Coprime g) (hDN : D.Coprime N) : g = D := by
  apply Nat.dvd_antisymm
  · exact hRg.symm.dvd_of_dvd_mul_left (show g ∣ R * D from ⟨N, h⟩)
  · exact hDN.dvd_of_dvd_mul_right
      (show D ∣ g * N from ⟨R, by simpa [mul_comm] using h.symm⟩)

private lemma normalized_difference (a delta g R : ℕ)
    (hcop : delta.Coprime a) (hprim : g.Coprime R)
    (heq : R * delta ^ 2 = 4 * g * a * (a + delta) * (2 * a + delta)) :
    ∃ k : ℕ, g * delta = k ^ 3 ∨ g * delta = 2 * k ^ 3 := by
  by_cases ho : Odd delta
  · have hc2 : delta.Coprime 2 := ho.coprime_two_right
    have hc4 : delta.Coprime 4 := by simpa using hc2.pow_right 2
    have hcab : delta.Coprime (a + delta) := by simpa using hcop
    have hcac : delta.Coprime (2 * a + delta) := by
      simpa using hc2.mul_right hcop
    have hN : delta.Coprime (4 * a * (a + delta) * (2 * a + delta)) :=
      ((hc4.mul_right hcop).mul_right hcab).mul_right hcac
    have hg : g = delta ^ 2 := reduced_cross_product
      (by nlinarith only [heq]) hprim.symm (hN.pow_left 2)
    refine ⟨delta, Or.inl ?_⟩
    rw [hg]
    ring
  · obtain ⟨d, rfl⟩ := (Nat.not_odd_iff_even.mp ho).two_dvd
    have h2a : (2 : ℕ).Coprime a := (Nat.coprime_mul_iff_left.mp hcop).1
    have hda : d.Coprime a := (Nat.coprime_mul_iff_left.mp hcop).2
    by_cases hdo : Odd d
    · have hd2 : d.Coprime 2 := hdo.coprime_two_right
      have hdab : d.Coprime (a + 2 * d) :=
        (Nat.coprime_add_mul_right_right d a 2).mpr hda
      have hdac : d.Coprime (a + d) := by simpa using hda
      have hN : d.Coprime (2 * a * (a + 2 * d) * (a + d)) :=
        ((hd2.mul_right hda).mul_right hdab).mul_right hdac
      have hsmall : R * d ^ 2 = g * (2 * a * (a + 2 * d) * (a + d)) := by
        nlinarith only [heq]
      have hg : g = d ^ 2 := reduced_cross_product hsmall hprim.symm (hN.pow_left 2)
      refine ⟨d, Or.inr ?_⟩
      rw [hg]
      ring
    · obtain ⟨e, rfl⟩ := (Nat.not_odd_iff_even.mp hdo).two_dvd
      have hea : e.Coprime a := (Nat.coprime_mul_iff_left.mp hda).2
      have heab : e.Coprime (a + 4 * e) :=
        (Nat.coprime_add_mul_right_right e a 4).mpr hea
      have heac : e.Coprime (a + 2 * e) :=
        (Nat.coprime_add_mul_right_right e a 2).mpr hea
      have h2ab : (2 : ℕ).Coprime (a + 4 * e) := by
        convert (Nat.coprime_add_mul_right_right 2 a (2 * e)).mpr h2a using 1 <;> ring
      have h2ac : (2 : ℕ).Coprime (a + 2 * e) :=
        (Nat.coprime_add_mul_left_right 2 a e).mpr h2a
      have h2N : (2 : ℕ).Coprime (a * (a + 4 * e) * (a + 2 * e)) :=
        (h2a.mul_right h2ab).mul_right h2ac
      have heN : e.Coprime (a * (a + 4 * e) * (a + 2 * e)) :=
        (hea.mul_right heab).mul_right heac
      have hDN : (2 * e ^ 2).Coprime (a * (a + 4 * e) * (a + 2 * e)) :=
        h2N.mul_left (heN.pow_left 2)
      have hsmall : R * (2 * e ^ 2) = g * (a * (a + 4 * e) * (a + 2 * e)) := by
        nlinarith only [heq]
      have hg : g = 2 * e ^ 2 := reduced_cross_product hsmall hprim.symm hDN
      refine ⟨2 * e, Or.inl ?_⟩
      rw [hg]
      ring

private lemma cleared_descartes {x y R : ℕ}
    (hx : 0 < x) (hxy : x ≤ y) (hyR : y ≤ R) (hd : descartes x y R R) :
    R * (y - x) ^ 2 = 4 * x * y * (x + y) := by
  have hy : 0 < y := lt_of_lt_of_le hx hxy
  have hR : 0 < R := lt_of_lt_of_le hy hyR
  have hxq : (x : ℚ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hx)
  have hyq : (y : ℚ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hy)
  have hRq : (R : ℚ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hR)
  unfold descartes at hd
  field_simp [hxq, hyq, hRq] at hd
  have hz : (R : ℚ) * ((R : ℚ) * ((y : ℚ) - x) ^ 2 -
      4 * (x : ℚ) * y * (x + y)) = 0 := by
    nlinarith only [hd]
  have hq : (R : ℚ) * ((y : ℚ) - x) ^ 2 = 4 * (x : ℚ) * y * (x + y) := by
    have := (mul_eq_zero.mp hz).resolve_left hRq
    linarith only [this]
  have hq' : (R : ℚ) * ((y - x : ℕ) : ℚ) ^ 2 =
      4 * (x : ℚ) * y * (x + y) := by
    simpa only [Nat.cast_sub hxy] using hq
  exact_mod_cast hq'

private lemma full_result (x y R : ℕ) (hx : 0 < x) (hxy : x ≤ y) (hyR : y ≤ R)
    (hprim : Nat.Coprime (Nat.gcd x y) R) (hd : descartes x y R R) :
    ∃ k : ℕ, y - x = k ^ 3 ∨ y - x = 2 * k ^ 3 := by
  let g := Nat.gcd x y
  let a := x / g
  let b := y / g
  have hg : 0 < g := Nat.gcd_pos_of_pos_left y hx
  have hxa : x = g * a := by
    dsimp [a, g]
    exact (Nat.mul_div_cancel' (Nat.gcd_dvd_left x y)).symm
  have hyb : y = g * b := by
    dsimp [b, g]
    exact (Nat.mul_div_cancel' (Nat.gcd_dvd_right x y)).symm
  have hab : a ≤ b := Nat.le_of_mul_le_mul_left (by simpa [← hxa, ← hyb] using hxy) hg
  have habc : a.Coprime b := Nat.coprime_div_gcd_div_gcd hg
  let delta := b - a
  have hbd : b = a + delta := by dsimp [delta]; omega
  have hda : delta.Coprime a := (Nat.coprime_sub_self_left hab).mpr habc.symm
  have hdiff : y - x = g * delta := by
    have : y = x + g * delta := by rw [hyb, hxa, hbd]; ring
    omega
  have heq : R * delta ^ 2 = 4 * g * a * (a + delta) * (2 * a + delta) := by
    apply Nat.eq_of_mul_eq_mul_left (show 0 < g ^ 2 by positivity)
    calc
      g ^ 2 * (R * delta ^ 2) = R * (y - x) ^ 2 := by rw [hdiff]; ring
      _ = 4 * x * y * (x + y) := cleared_descartes hx hxy hyR hd
      _ = g ^ 2 * (4 * g * a * (a + delta) * (2 * a + delta)) := by
        rw [hxa, hyb, hbd]
        ring
  simpa only [hdiff] using normalized_difference a delta g R hda hprim heq

end OMA.S_oeis_a390583

theorem OMA.solution : type_of% @OMA.S_oeis_a390583.main := by
  exact OMA.S_oeis_a390583.full_result
