import New.Patching.OnePrimeTie
import New.Selmer.DenominatorBound

/-!
Interface certificate for `2026-11-26_COMPACT_DIAGONAL_INTEGRALITY.md`.
Compact source pin: 72fead102f663d5c7a407964a13dc0cf9d977207.

This file deliberately imports no `Main` theorem.  Native compact replay is
pending; do not infer PASS from the source text.
-/

namespace CompactDiagonalIntegralityAudit

/-- Exact cancellation used before the quotient-module and valuation steps.
If `p(b) = p0 + b*q`, the discrepancy between the deformed scalar and its
constant part remains divisible by `b` after every positive or zero power. -/
theorem deformed_power_sub_constant_dvd {R : Type*} [CommRing R]
    (A b c p0 q : R) (k : Nat) :
    b ∣ (c ^ 2 * (A * (p0 + b * q))) ^ k -
      (p0 * c ^ 2) ^ k * A ^ k := by
  let X := c ^ 2 * (A * (p0 + b * q))
  let Y := (p0 * c ^ 2) * A
  have hXY : b ∣ X - Y := by
    use c ^ 2 * A * q
    dsimp [X, Y]
    ring
  have hpow : X - Y ∣ X ^ k - Y ^ k := sub_dvd_pow_sub_pow X Y k
  simpa [X, Y, mul_pow] using hXY.trans hpow

/-- Abstract finite-sum form of the top-coefficient survival step. -/
theorem sum_eq_top_of_other_zero {R I : Type*} [AddCommMonoid R]
    [DecidableEq I] (S : Finset I) (top : I) (hTop : top ∈ S)
    (F : I → R) (hOther : ∀ i ∈ S, i ≠ top → F i = 0) :
    ∑ i ∈ S, F i = F top := by
  simpa using Finset.sum_eq_single_of_mem top hTop hOther

#check IsTraceIdeal
#check IsRibetElement
#check BaseLevel.ellIntegralForms
#check exists_higman_operator
#check BaseLevel.exists_diagOp_mem_ellIntegralForms
#check denominatorLe_rowBudget

#print axioms deformed_power_sub_constant_dvd
#print axioms sum_eq_top_of_other_zero
#print axioms BaseLevel.exists_diagOp_mem_ellIntegralForms
#print axioms denominatorLe_rowBudget

end CompactDiagonalIntegralityAudit
