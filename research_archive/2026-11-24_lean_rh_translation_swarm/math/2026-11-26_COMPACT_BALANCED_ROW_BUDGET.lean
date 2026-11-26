import New.Selmer.RowBalanced
import New.Selmer.TwistForRows

/-!
Interface certificate for `2026-11-26_COMPACT_BALANCED_ROW_BUDGET.md`.
Compact source pin: 72fead102f663d5c7a407964a13dc0cf9d977207.
No `Main` or RH conclusion is imported.
-/

namespace CompactBalancedRowAudit

/-- Exact aggregation used after splitting the local places. -/
theorem split_local_budget (ellPart offPart detPart ellBase offBase beta : ℕ)
    (hell : ellPart ≤ ellBase)
    (hoff : offPart + detPart ≤ offBase + beta) :
    ellPart + offPart + detPart ≤ ellBase + offBase + beta := by
  omega

#check IsBalanced
#check IsRow.eventually_isBalanced
#check length_localCocycles_le
#check length_obeying_relationsOn_le
#check finrank_crysCocycles_eq_add_neg_jumps
#check length_ker_le_addVal_det
#check ellVal_le_crudeUnit
#check exists_mFoldTwist_selmerLengthLe

#print axioms split_local_budget
#print axioms IsRow.eventually_isBalanced
#print axioms exists_mFoldTwist_selmerLengthLe

end CompactBalancedRowAudit
