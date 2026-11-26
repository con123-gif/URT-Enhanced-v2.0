import New.Selmer.TwistTheorem

/-!
Prepared compact-pin audit for the human reconstruction in
`2026-11-26_COMPACT_PENCIL_DESCENT.md`.

Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
This file does not import `Main` and does not assert RH.  The theorem below
checks only the exact one-new-prime bookkeeping used after the arithmetic and
tilting inputs have produced a positive integral length drop.
-/

open Finset

namespace CompactPencilDescentAudit

/-- If adding one prime drops one selected finite length by at least one and
does not increase any other length, then total length strictly decreases and
the old `cardinality + total length` cap is preserved. -/
theorem one_prime_descent_budget {ι : Type} [Fintype ι] [DecidableEq ι]
    (old new : ι → ℕ) (i : ι) (oldCard newCard K : ℕ)
    (hcard : newCard ≤ oldCard + 1)
    (hi : new i + 1 ≤ old i)
    (hj : ∀ j, j ≠ i → new j ≤ old j)
    (hK : oldCard + ∑ j, old j ≤ K) :
    (∑ j, new j < ∑ j, old j) ∧ newCard + ∑ j, new j ≤ K := by
  have hsum : (∑ j, new j) + 1 ≤ ∑ j, old j := by
    have hsum' : (∑ j, (new j + if j = i then 1 else 0)) ≤
        ∑ j, old j := sum_le_sum fun j _ => by
      by_cases h : j = i
      · simpa [h] using hi
      · simpa [h] using hj j h
    simpa [sum_add_distrib] using hsum'
  constructor
  · omega
  · omega

#check exists_isPencil
#check IsPencil.length_le_of_unseen_class
#check tilting
#check exists_anticyclotomic_twist
#check exists_mFoldTwist_selmerLengthLe
#check denominatorLe_rowBudget
#check exists_isFitFamily

#print axioms one_prime_descent_budget
#print axioms exists_isPencil
#print axioms IsPencil.length_le_of_unseen_class
#print axioms tilting
#print axioms exists_anticyclotomic_twist

end CompactPencilDescentAudit

