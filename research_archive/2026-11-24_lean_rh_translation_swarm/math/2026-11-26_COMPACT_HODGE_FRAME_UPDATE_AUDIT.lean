import Lib.PadicHodge.WachKisin.HodgeFrame

/-!
Prepared source probe for the independent Hodge-frame update audit.

Compact source pin: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
This file was not locally elaborated: lean/lake/elan were unavailable.
The abstract lemma below isolates the inverse-weight kernel transport.
It does not replace the period-ring or Tate-invariant premises of
`exists_hodge_frame`.
-/

namespace MathHodgeFrameAudit

theorem inverseWeightKernelTransport {V : Type*} [Zero V]
    (P Pg N D Di G : V -> V)
    (frame : forall x, N (Pg (D x)) = P x)
    (inverse : forall x, D (Di x) = x)
    (semilinear : forall x, Pg (G x) = G (P x))
    (G0 : G 0 = 0) (N0 : N 0 = 0) {w : V} (hw : P w = 0) :
    P (Di (G w)) = 0 := by
  calc
    P (Di (G w)) = N (Pg (D (Di (G w)))) := (frame _).symm
    _ = N (Pg (G w)) := congrArg N (congrArg Pg (inverse _))
    _ = N (G (P w)) := congrArg N (semilinear w)
    _ = N (G 0) := congrArg (fun x => N (G x)) hw
    _ = N 0 := congrArg N G0
    _ = 0 := N0

theorem equalWeightColumnScalar {R : Type*} [CommRing R] {I : Type*}
    (d a : I -> R) (nu : I)
    (sameWeight : forall i, a i != 0 -> d i = d nu) (i : I) :
    d i * a i = a i * d nu := by
  by_cases h : a i = 0
  · simp [h]
  · rw [sameWeight i h]
    exact mul_comm _ _

#check exists_hodge_frame
#check le_of_hodgeTate_stable
#check tate_eq_zero_of_chi_twist
#print axioms inverseWeightKernelTransport
#print axioms equalWeightColumnScalar
#print axioms exists_hodge_frame

end MathHodgeFrameAudit
