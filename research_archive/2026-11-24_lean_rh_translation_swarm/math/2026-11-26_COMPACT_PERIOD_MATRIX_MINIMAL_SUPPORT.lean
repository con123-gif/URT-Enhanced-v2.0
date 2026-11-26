import Lib.PadicHodge.WachKisin.PeriodMatrixFrame

/-!
Prepared audit probe for the normalized minimal-support kernel certificate.

Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
`grh-compact/src/Lib/PadicHodge/WachKisin/PeriodMatrixFrame.lean`

Local Lean/Lake/Elan are unavailable. This file is PREPARED, NOT PASS.
It neither imports nor proves the RH root.
-/

#check exists_fixed_ker
#check Lift.Chart.IsPeriodMatrix.exists_frame

/-- The exact coordinate equation used in the strict-support contradiction. -/
theorem normalized_coordinate_sub_eq_zero
    {R : Type*} [CommRing R] (g : R →+* R)
    {d : Type*} (a : d → R) (ν : d) (hν : a ν = 1) :
    g (a ν) - a ν = 0 := by
  rw [hν]
  simp

/-- A zero at the normalized coordinate witnesses omission of that coordinate
from the support of the difference. -/
theorem normalized_coordinate_not_mem_support
    {R : Type*} [CommRing R] (g : R →+* R)
    {d : Type*} (a : d → R) (ν : d) (hν : a ν = 1) :
    ν ∉ Function.support (g ∘ a - a) := by
  simp [Function.mem_support, hν]

#print axioms exists_fixed_ker
#print axioms Lift.Chart.IsPeriodMatrix.exists_frame

/-!
RESUME HERE: compile this probe in the pinned compact source. Then isolate the
post-`eventually_exists_coeff_eq_of_fixed` determinant-contraction recurrence;
do not report PASS without the actual CI output.
-/
