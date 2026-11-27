import OMAStatements.S_mo_466218

-- Source: user133281, MathOverflow question 466218, CC BY-SA 4.0.
-- Credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT.

open scoped BigOperators Matrix

lemma oma466218_identity {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (t : ℝ) (hr : ∀ i, ∑ j, A i j = 0) (v : Fin n → ℝ) (i : Fin n) :
    ((t • 1 - A) *ᵥ v) i =
      t * v i + ∑ j, A i j * (v i - v j) := by
  calc
    ((t • 1 - A) *ᵥ v) i = ∑ j, ((t • 1 - A) i j) * v j := rfl
    _ = ∑ j, ((if i = j then t else 0) - A i j) * v j := by
      apply Finset.sum_congr rfl
      intro j hj
      simp [Matrix.sub_apply, Matrix.smul_apply, Matrix.one_apply,
        smul_eq_mul, mul_ite]
    _ = t * v i - ∑ j, A i j * v j := by
      simp_rw [sub_mul]
      rw [Finset.sum_sub_distrib]
      simp [ite_mul]
    _ = t * v i + ∑ j, A i j * (v i - v j) := by
      simp_rw [mul_sub]
      rw [Finset.sum_sub_distrib, ← Finset.sum_mul, hr i]
      ring

lemma oma466218_minimum {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (t : ℝ) (ht : 0 < t) (ha : ∀ i j, i ≠ j → 0 < A i j)
    (hr : ∀ i, ∑ j, A i j = 0) (v : Fin n → ℝ)
    (hv : ∀ i, 0 ≤ ((t • 1 - A) *ᵥ v) i) : ∀ i, 0 ≤ v i := by
  intro i
  by_contra hn
  have hni : v i < 0 := lt_of_not_ge hn
  obtain ⟨k, hk, hmin⟩ :=
    Finset.exists_min_image Finset.univ v ⟨i, Finset.mem_univ i⟩
  have hnk : v k < 0 := lt_of_le_of_lt (hmin i (Finset.mem_univ i)) hni
  have hs : (∑ j, A k j * (v k - v j)) ≤ 0 := by
    apply Finset.sum_nonpos
    intro j hj
    by_cases hkj : k = j
    · simp [hkj]
    · exact mul_nonpos_of_nonneg_of_nonpos (ha k j hkj).le
        (sub_nonpos.mpr (hmin j (Finset.mem_univ j)))
  have he := oma466218_identity A t hr v k
  have hp : ((t • 1 - A) *ᵥ v) k < 0 := by
    rw [he]
    exact add_neg_of_neg_of_nonpos (mul_neg_of_pos_of_neg ht hnk) hs
  exact (not_lt_of_ge (hv k)) hp

theorem OMA.solution : type_of% @OMA.S_mo_466218.main := by
  intro n A ha hr t ht
  let H : Matrix (Fin n) (Fin n) ℝ := t • 1 - A
  let B : Matrix (Fin n) (Fin n) ℝ := OMA.S_mo_466218.resolvent A t
  have hdet : H.det ≠ 0 := by
    apply Matrix.det_ne_zero_of_sum_row_pos
    · intro i j hij
      simpa [H, Matrix.sub_apply, Matrix.smul_apply, Matrix.one_apply, hij,
        smul_eq_mul] using neg_neg_of_pos (ha i j hij)
    · intro i
      have he : (∑ j, H i j) = t := by
        simp [H, Matrix.sub_apply, Matrix.smul_apply, smul_eq_mul,
          Finset.sum_sub_distrib, hr i, Matrix.one_apply]
      rw [he]
      exact ht
  have hHB : H * B = t • 1 := by
    dsimp [B, OMA.S_mo_466218.resolvent]
    rw [Matrix.mul_smul, Matrix.mul_nonsing_inv _ (isUnit_iff_ne_zero.mpr hdet)]
  have hnonneg : ∀ i j, 0 ≤ B i j := by
    intro i j
    apply oma466218_minimum A t ht ha hr (fun k => B k j) _ i
    intro k
    change 0 ≤ (H * B) k j
    rw [hHB]
    by_cases hkj : k = j
    · simp [hkj, Matrix.smul_apply, smul_eq_mul, ht.le]
    · simp [Matrix.smul_apply, Matrix.one_apply, smul_eq_mul, hkj]
  have hrows : ∀ i, ∑ j, B i j = 1 := by
    have hHone : H *ᵥ (1 : Fin n → ℝ) = t • 1 := by
      ext i
      simp [H, Matrix.sub_mulVec, Matrix.smul_mulVec, Matrix.one_mulVec,
        Matrix.mulVec, dotProduct, hr i, Matrix.one_apply, mul_ite]
    have he : H *ᵥ (B *ᵥ (1 : Fin n → ℝ)) = H *ᵥ 1 := by
      rw [Matrix.mulVec_mulVec, hHB, Matrix.smul_mulVec,
        Matrix.one_mulVec, hHone]
    have hh := Matrix.mulVec_injective_of_det_ne_zero hdet he
    intro i
    simpa [Matrix.mulVec, dotProduct] using congrFun hh i
  have hcolumn : ∀ i j, B j i ≤ B i i := by
    intro i j
    by_contra hn
    have hj : B i i < B j i := lt_of_not_ge hn
    obtain ⟨k, hk, hmax⟩ :=
      Finset.exists_max_image Finset.univ (fun z => B z i) ⟨i, Finset.mem_univ i⟩
    have hki : k ≠ i := by
      intro h
      subst k
      have he := hmax j (Finset.mem_univ j)
      linarith
    have hpos : 0 < B k i :=
      lt_of_lt_of_le (lt_of_le_of_lt (hnonneg i i) hj)
        (hmax j (Finset.mem_univ j))
    have hs : 0 ≤ ∑ l, A k l * (B k i - B l i) := by
      apply Finset.sum_nonneg
      intro l hl
      by_cases hkl : k = l
      · simp [hkl]
      · exact mul_nonneg (ha k l hkl).le
          (sub_nonneg.mpr (hmax l (Finset.mem_univ l)))
    have heq : ((t • 1 - A) *ᵥ (fun z => B z i)) k = 0 := by
      change (H * B) k i = 0
      rw [hHB]
      simp [Matrix.smul_apply, Matrix.one_apply, smul_eq_mul, hki]
    rw [oma466218_identity A t hr] at heq
    have hp := mul_pos ht hpos
    linarith
  intro i
  change 0 ≤ (B - B ^ 2) i i
  have hs : (∑ j, B i j * B j i) ≤ B i i := by
    calc
      (∑ j, B i j * B j i) ≤ ∑ j, B i j * B i i := by
        exact Finset.sum_le_sum fun j hj =>
          mul_le_mul_of_nonneg_left (hcolumn i j) (hnonneg i j)
      _ = (∑ j, B i j) * B i i := by rw [Finset.sum_mul]
      _ = B i i := by rw [hrows i]; ring
  simpa [Matrix.sub_apply, pow_two, Matrix.mul_apply] using sub_nonneg.mpr hs
