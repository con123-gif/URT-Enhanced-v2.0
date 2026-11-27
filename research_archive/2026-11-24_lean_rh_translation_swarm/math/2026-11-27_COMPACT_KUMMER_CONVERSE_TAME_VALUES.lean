import Lib.ClassField.GreenbergWiles.SplitPrimeReciprocity
import Mathlib.Tactic

/-!
Executable companion to `2026-11-27_COMPACT_KUMMER_CONVERSE_TAME_VALUES.md`.
It isolates the exact last algebraic substitution in the converse direction.
Compact pin: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
PREPARED only: no local Lean toolchain was available, and no RH result is
imported.
-/

namespace MathCompactKummerConverse

open scoped BigOperators

/-- Once every conjugate local Kummer value is identified with the requested
coefficient times `a`, corestriction gives the prescribed tame value.  The
group action is retained rather than replaced by an unsigned scalar sum. -/
theorem corestriction_prescribed_tame_value
    {Delta A R : Type*} [Fintype Delta] [Semiring R]
    [AddCommMonoid A] [Module R A]
    (rho : Delta -> A ->+ A) (f : Delta -> R) (a : A)
    (localValue : Delta -> A)
    (hlocal : forall delta, localValue delta = f delta • a) :
    (sum delta, rho delta (localValue delta)) =
      sum delta, rho delta (f delta • a) := by
  simp only [hlocal]

#check SplitPlaces.power_residue_reciprocity
#check exists_kummer_chars
#check IsPlaceOver.smul_root_eq_of_local_pow
#check trivialisedCocycles.exists_mem_of_orbit_reps
#check trivialisedCocycles.corestrict_mem
#check eq_one_or_isComplexConj
#print axioms corestriction_prescribed_tame_value

end MathCompactKummerConverse
