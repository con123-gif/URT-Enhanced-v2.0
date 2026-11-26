/-
Prepared compact-source probe for the source-matched audit in
2026-11-26_COMPACT_TESTED_AGREEMENT_AUDIT.md.

Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

This file has not been elaborated locally: lean/lake/elan are unavailable.
It imports no RH conclusion and uses only explicit proof terms below.
-/

import New.Selmer.DenominatorBound

open Complex LinearMap Submodule

#check AuxPair.IsTested
#check orthogonal_mem_invtSubmodule_hecke
#check le_of_isotypic_mem
#check isRoot_hecke_string
#check LinearMap.sub_mem_ker_iff
#check BaseLevel.exists_diagOp_mem_ellIntegralForms
#check norm_gram_det_le_of_operators
#check denominatorLe_rowBudget

/- The final agreement rewrite used at DenominatorBound.lean:143 is purely
linear: membership of x-y in ker T is exactly equality of the two images. -/
theorem compact_agreement_of_sub_mem_ker
    {R M N : Type*} [Ring R]
    [AddCommGroup M] [Module R M]
    [AddCommGroup N] [Module R N]
    (T : M →ₗ[R] N) (x y : M) (h : x - y ∈ LinearMap.ker T) :
    T x = T y :=
  T.sub_mem_ker_iff.mp h

/- This is the exact final contradiction for the native narrow cut
W = A ∩ (A ∩ K)ᗮ.  No orthogonality to a larger F ∩ K is needed. -/
theorem compact_narrow_cut_self_orthogonal
    {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
    (A K : Submodule ℂ V) {v : V}
    (hA : v ∈ A) (hperp : v ∈ (A ⊓ K)ᗮ) (hK : v ∈ K) :
    inner ℂ v v = 0 :=
  hperp v ⟨hA, hK⟩

#print axioms compact_agreement_of_sub_mem_ker
#print axioms compact_narrow_cut_self_orthogonal
#print axioms denominatorLe_rowBudget
