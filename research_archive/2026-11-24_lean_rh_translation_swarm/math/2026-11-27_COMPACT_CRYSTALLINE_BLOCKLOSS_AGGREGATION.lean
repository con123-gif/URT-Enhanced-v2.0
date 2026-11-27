/-
Prepared scalar certificate for the crystalline block-loss aggregation.

Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Not elaborated locally: lean/lake/elan are unavailable. This imports no RH
conclusion. It checks the cited declarations and the scalar tail of the actual
sum_blockLoss_le proof; all local crystalline and duality premises remain in
the imported theorem.
-/

import New.Selmer.RibetElement

#check block_defect_le_at_place
#check relLength_obeyingCocycles_le
#check relLength_iInf_le
#check IsCompletionGroup.index_eq_card_range
#check sum_complexEmbOf_le
#check sum_blockLoss_le
#check ribet_columns

/-- Scalar tail of `sum_blockLoss_le`. The row contributes `r * loss`, the
`t` singleton string blocks contribute `(t / T) * loss`, and all local indices
sum to at most `2 * f`. -/
theorem compact_crystalline_blockloss_scalar
    (r t T f : ℕ) (loss : ℝ)
    (hr : 1 ≤ r) (ht : t ≤ T) (hT : 0 < T) (hloss : 0 ≤ loss) :
    (2 * f : ℝ) * ((r : ℝ) + (t : ℝ) / (T : ℝ)) * loss
      ≤ (4 * r * f : ℕ) * loss := by
  have hT' : (0 : ℝ) < T := by exact_mod_cast hT
  have ht' : (t : ℝ) / T ≤ 1 := (div_le_one hT').2 (by exact_mod_cast ht)
  have hr' : (1 : ℝ) ≤ r := by exact_mod_cast hr
  calc
    (2 * f : ℝ) * ((r : ℝ) + (t : ℝ) / T) * loss
        ≤ (2 * f : ℝ) * ((r : ℝ) + 1) * loss := by gcongr
    _ ≤ (2 * f : ℝ) * (2 * r) * loss := by gcongr <;> nlinarith
    _ = (4 * r * f : ℕ) * loss := by norm_num; ring

#print axioms compact_crystalline_blockloss_scalar
#print axioms block_defect_le_at_place
#print axioms sum_blockLoss_le
#print axioms ribet_columns
