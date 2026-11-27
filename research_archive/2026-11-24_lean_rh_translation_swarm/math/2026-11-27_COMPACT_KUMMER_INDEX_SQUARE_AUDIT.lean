import Lib.ClassField.Global.Avatars
import Mathlib.Tactic

/-!
Algebraic companion to the finite-index audit.  This isolates the final
cancellation in Avatars.lean: if B*D divides A and A <= B^2 with B positive,
then D <= B.  PREPARED only; no local Lean toolchain was available.
Compact source pin: 72fead102f663d5c7a407964a13dc0cf9d977207.
-/

namespace MathCompactKummerIndex

theorem quotient_index_le_unit_index
    {A B D : Nat} (hA : 0 < A) (hB : 0 < B)
    (hdiv : B * D ∣ A) (hsq : A ≤ B ^ 2) : D ≤ B := by
  have hmul : B * D ≤ A := Nat.le_of_dvd hA hdiv
  nlinarith [hsq]

#check exists_kummer_chars
#check index_pow_at_places_le
#check SUnit.dirichlet_unit_theorem
#check relIndex_mul_index_sup
#check cokerKerIndex_eq_pow_finrank
#print axioms quotient_index_le_unit_index

end MathCompactKummerIndex
