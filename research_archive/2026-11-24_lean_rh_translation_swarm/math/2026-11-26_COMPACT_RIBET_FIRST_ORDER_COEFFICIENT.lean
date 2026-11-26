/-
Prepared scalar certificate for the first-order Ribet coefficient audit.

Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Not elaborated locally: lean/lake/elan are unavailable.  This imports no RH
conclusion and only checks the cited declarations plus the exact scalar identity.
-/

import New.Selmer.RibetElement

#check IsTraceIdeal
#check IsRibetElement
#check exists_ribet_element_cramer
#check exists_rows_addVal_det_le
#check ribet_first_order
#check ribet_columns

/- The left side records, in order: the row and character budgets; the
summed Fitting costs (|J| + t|s|)v(C); the single extra v(C); and the
a^t cost t(sum_v v(o_v(1)) + |s|v(C)). -/
theorem compact_ribet_first_order_budget_identity
    (b0 sumB t sumO cardS cardJ valC : ℕ) :
    b0 + sumB + (cardJ + t * cardS) * valC + valC
        + t * (sumO + cardS * valC)
      = b0 + sumB + t * (sumO + 2 * cardS * valC)
        + (cardJ + 1) * valC := by
  ring

#print axioms compact_ribet_first_order_budget_identity
#print axioms ribet_first_order
#print axioms ribet_columns
