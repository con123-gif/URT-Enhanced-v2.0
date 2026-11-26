/-
Prepared scalar certificate for the final native `ribet_columns` payment.

Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Not elaborated locally: lean/lake/elan are unavailable.  This imports no RH
conclusion.  It checks the cited declarations and isolates the two exact
semiring calculations at the end of `RibetElement.lean`.
-/

import New.Selmer.DenominatorBound

#check rowBudget
#check sum_blockLoss_le
#check SelmerLengthLe
#check IsPrimeTriangle.detect
#check IsAuxTwist
#check hasTriangleCost_tateTwist
#check exists_length_shaOdd_le
#check ribet_first_order
#check ribet_columns
#check denominatorLe_rowBudget

/- If D.r = R + s and t = 5*D.r, this is the exact slack introduced when
the sharp caller ledger is replaced by the coarser source coefficient.
The residual terms are 10*f*s + 2*t*H^22. -/
theorem compact_ribet_source_coarsening_identity
    (R s f H : ℕ) :
    5 * (R + s) * (2 + 10 * f + 6 * H ^ 22)
      = 10 * f * R + 5 * (R + s) * (2 + 8 * f + 4 * H ^ 22)
        + 10 * f * s + 10 * (R + s) * H ^ 22 := by
  ring

/- The final caller uses A <= H^27 and t <= H^27, both supplied natively
by `Data.nat_le_of_hasLogBound`, and 1 <= R from `IsRow.rank_mem`.
All variables here live in ENNReal because that is the post-`simp` scalar
domain at `RibetElement.lean:211-223`. -/
theorem compact_ribet_final_payment
    (R t H f c q L : ℝ≥0∞)
    (hR : 1 ≤ R)
    (hA : 4 + t * (2 + 10 * f + 6 * H ^ 22) + H ^ 22 + H ≤ H ^ 27)
    (ht : t ≤ H ^ 27) :
    (4 + t * (2 + 10 * f + 6 * H ^ 22) + H ^ 22 + H) * c
        + t * q + 4 * R * f * L
      ≤ R * (H ^ 27 * (c + q) + 4 * f * L) := by
  let A : ℝ≥0∞ := 4 + t * (2 + 10 * f + 6 * H ^ 22) + H ^ 22 + H
  have hscale : H ^ 27 ≤ R * H ^ 27 := le_mul_of_one_le_left' hR
  have hAc : A * c ≤ (R * H ^ 27) * c :=
    mul_le_mul_right' (hA.trans hscale) c
  have htq : t * q ≤ (R * H ^ 27) * q :=
    mul_le_mul_right' (ht.trans hscale) q
  change A * c + t * q + 4 * R * f * L
    ≤ R * (H ^ 27 * (c + q) + 4 * f * L)
  calc
    A * c + t * q + 4 * R * f * L
        ≤ (R * H ^ 27) * c + (R * H ^ 27) * q + 4 * R * f * L :=
      add_le_add (add_le_add hAc htq) le_rfl
    _ = R * (H ^ 27 * (c + q) + 4 * f * L) := by ring

#print axioms compact_ribet_source_coarsening_identity
#print axioms compact_ribet_final_payment
#print axioms ribet_columns
#print axioms denominatorLe_rowBudget
