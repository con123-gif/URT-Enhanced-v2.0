import New.Selmer.ReciprocityLaw

/-!
Prepared independent-review cancellation certificate and declaration probe for
the stabilizer argument in `exists_isLaw`, pinned to lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207.

This checks the exact group cancellations isolated from the two branches.  It
does not duplicate the native Chebotarev or procyclic-image proofs.
-/

namespace CompactIsLawRootDetection

variable {G : Type*} [Group G]

/-- In the crossed-coset branch, membership of `r=g*c` and `c` recovers
`g`; this is the native right cancellation after the second Boolean place. -/
theorem recover_from_right_twist (F : Subgroup G) {g c r : G}
    (hr : r ∈ F) (hc : c ∈ F) (e : r = g * c) : g ∈ F := by
  rw [e] at hr
  exact (F.mul_mem_cancel_right hc).mp hr

/-- If `g` and the crossed value `r=g*c` lie in `O`, then the conditional
second auxiliary element really is `c`. -/
theorem crossed_element_mem (O : Subgroup G) {g c r : G}
    (hg : g ∈ O) (hr : r ∈ O) (e : r = g * c) : c ∈ O := by
  have ec : c = g⁻¹ * r := by
    rw [e]
    simp
  rw [ec]
  exact O.mul_mem (O.inv_mem hg) hr

/-- Chebotarev supplies `a*sigma` in the stabilizer and Frobenius fixedness
supplies `sigma`; right cancellation recovers the prescribed element `a`. -/
theorem recover_auxiliary_element (F : Subgroup G) {a σ : G}
    (has : a * σ ∈ F) (hs : σ ∈ F) : a ∈ F :=
  (F.mul_mem_cancel_right hs).mp has

#check exists_isLaw
#check SplitPlaces.FrobeniiDetectRoots
#check exists_procyclic_generator
#check chebotarev
#check four_dvd_cycChar_sub_one

#print axioms exists_isLaw
#print axioms exists_procyclic_generator
#print axioms chebotarev

end CompactIsLawRootDetection
