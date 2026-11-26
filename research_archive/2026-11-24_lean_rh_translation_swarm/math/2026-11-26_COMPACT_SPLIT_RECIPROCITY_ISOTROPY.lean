import New.Selmer.TiltingLemma

/-!
Source-interface certificate for the split-prime reciprocity to mirror-isotropy
reconstruction.  Compact source pin:
72fead102f663d5c7a407964a13dc0cf9d977207.

This file imports neither `Main` nor any RH conclusion.  The small lemmas below
check only the exact additive cancellations after the native arithmetic
suppliers have produced their cocycles and relations.
-/

namespace CompactSplitReciprocityAudit

/-- The three prescribed tame values turn annihilation into covariance. -/
theorem three_term_covariance {A : Type*} [AddCommGroup A]
    (u v w : A) (h : u - v - w = 0) : u = v + w := by
  abel

/-- The two-place reciprocity sum is exactly the mirror equality. -/
theorem two_place_isotropy {A : Type*} [AddCommGroup A]
    (left right : A) (h : left + (-right) = 0) : left = right := by
  abel

#check selmerZ1.exists_split_primes_relations
#check SplitPlaces.power_residue_reciprocity
#check SplitPlaces.apply_inertia_eq_zero
#check card_le_torsion_of_isotropic
#check IsPencil.length_le_of_unseen_class
#check exists_isPencil

#print axioms three_term_covariance
#print axioms two_place_isotropy
#print axioms selmerZ1.exists_split_primes_relations
#print axioms SplitPlaces.power_residue_reciprocity
#print axioms card_le_torsion_of_isotropic
#print axioms IsPencil.length_le_of_unseen_class

end CompactSplitReciprocityAudit
