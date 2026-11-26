/-
Prepared declaration and scalar probe for the compact integral-strictness audit.

Source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Not elaborated locally: lean/lake/elan are unavailable.  This imports no RH
conclusion and proves only the two integer inequalities isolated in the audit.
-/

import New.Lift.LongGap

#check Lift.KummerChart.PairingSide.exists_extend_form
#check Lift.KummerChart.PairingSide.exists_inclKer_eq_of_projTriv_eq_zero
#check Lift.KummerChart.PairingSide.smul_sub_mem_kerWithExponents
#check Lift.KummerChart.PairingSide.sub_mem_kerWithExponents_of_pointsOver
#check Lift.KummerChart.PairingSide.phi_pow_smul_mem_pointsOver
#check Lift.KummerChart.PairingSide.wittPairing_constantAt_and_thirdPairing
#check Lift.KummerChart.PairingSide.SidePairing.isSafe_of_exponents
#check Lift.KummerChart.PairingSide.SidePairing.isSafe_smul_sub

namespace CompactIntegralStrictness

theorem transported_tensor_threshold (z z' o o' : ℤ)
    (h : 0 < z + o + o') (hmono : z ≤ z') :
    1 - z' ≤ o + o' := by
  omega

theorem third_side_threshold (z' zq : ℤ) (hmono : z' ≤ zq) :
    1 ≤ zq + (1 - z') := by
  omega

#print axioms transported_tensor_threshold
#print axioms third_side_threshold
#print axioms Lift.KummerChart.PairingSide.exists_extend_form
#print axioms Lift.KummerChart.PairingSide.exists_inclKer_eq_of_projTriv_eq_zero
#print axioms Lift.KummerChart.PairingSide.SidePairing.isSafe_of_exponents
#print axioms Lift.KummerChart.PairingSide.SidePairing.isSafe_smul_sub

end CompactIntegralStrictness
