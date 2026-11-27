import Lib.ClassField.GreenbergWiles.SplitPrimeReciprocity
import Mathlib.Tactic

/-!
Executable companion for the human source-matched derivation in
`2026-11-27_COMPACT_PRINCIPAL_ARTIN_RESIDUE_SUM.md`.

Compact source pin: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
This file is PREPARED, not locally compiled.  It imports no RH conclusion.
-/

namespace MathCompactPrincipalArtin

open scoped BigOperators

/-- The exact last algebraic step: the valuation sign and Frobenius-value
identification convert the principal-Artin sum into the power-residue sum.
No norm or separate upper bound is taken. -/
theorem principal_artin_to_power_residue
    {J A : Type*} [Fintype J] [AddCommGroup A]
    (ord b : J → ℤ) (χ value : J → A)
    (hord : ∀ j, ord j = -b j)
    (hχ : ∀ j, χ j = value j)
    (hartin : ∑ j, (-ord j) • χ j = 0) :
    ∑ j, b j • value j = 0 := by
  simpa [hord, hχ] using hartin

#check SplitPlaces.power_residue_reciprocity
#check sum_ord_smul_frob_eq_zero
#check artin_reciprocity
#check resH2_cyclicClass_eq_zero
#check hilbert90_unitsRep
#check eq_zero_of_forall_hom_eq_zero
#print axioms principal_artin_to_power_residue

end MathCompactPrincipalArtin
