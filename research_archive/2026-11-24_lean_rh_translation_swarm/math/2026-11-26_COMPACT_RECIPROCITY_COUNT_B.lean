import New.Selmer.ReciprocityLaw

/-!
Prepared scalar certificate and declaration/axiom probe for the exact exponent
payment in `exists_isLaw`, pinned to lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207.

This file checks only the finite-cardinal bookkeeping extracted in the
companion note.  It does not formalize the Chebotarev, projective-count, or
Greenberg--Wiles arguments already present in the imported source.
-/

namespace CompactReciprocityCountB

/-- The two appended Boolean places contribute two indices and the
projective cocycle count contributes one further exponent. -/
theorem auxiliary_cost (n a : ℕ) : (n + 2) + 1 + a = n + (a + 3) := by
  omega

/-- The non-ell places containing the prescribed split primes and four
infinite places pay the three auxiliary exponents and leave `k+1`. -/
theorem exponent_budget (a b h k : ℕ) (hk : k ≤ b) (hh : 4 ≤ h) :
    (a + 3) + (k + 1) ≤ (a + b) + h := by
  omega

/-- Additive form of the exact surplus identity, avoiding truncated natural
subtraction: the right side is the used budget plus the two sources of slack. -/
theorem exact_surplus (a b h k : ℕ) (hk : k ≤ b) (hh : 4 ≤ h) :
    (a + b) + h = (a + 3) + (k + 1) + ((b - k) + (h - 4)) := by
  omega

#check exists_isLaw
#check selmerZ1.card_mul_pow_le
#check SplitPlaces.card_trivialised_of_isHigmanProjective
#check DiscreteModule.FiniteKilledFixedInj.isHigmanProjective_of_coprime
#check exists_procyclic_generator

#print axioms exists_isLaw
#print axioms selmerZ1.card_mul_pow_le
#print axioms SplitPlaces.card_trivialised_of_isHigmanProjective

end CompactReciprocityCountB
