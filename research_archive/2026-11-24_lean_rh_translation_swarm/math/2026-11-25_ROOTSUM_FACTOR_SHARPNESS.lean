import Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.AdmissibleResidues.FrobeniusTraceCountBoundOfRatEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared native audit for the rank-two RootSum factor obstruction.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Source blobs WinDefs=05d36e61e5740cf2eef83d75c5882b29eea6d2fa,
SumThree=17b9f64eeabb09c08b0487991c05296b03c6b396,
rootSum=fc375ef5c996180c985df22cc3f15655a9765126.

The exact Q(sqrt 5) EigData witness is documented and checked by
verify_rootsum_factor_sharpness.py.  It is not yet encoded here as an
EigData term.  This file checks the source's final exact factor algebra
and prepares the actual proof-term scans.  NOT COMPILED locally.
-/

namespace RHMathRootSumSharpness

theorem carrier_factor_exact (n k : Nat) :
    (2 ^ n * k) * 2 = 2 ^ (n + 1) * k := by
  rw [pow_succ]
  ring

theorem rank_two_attained_count : 2 ^ (2 + 1) * 2 = 16 := by
  norm_num

theorem carrier_factor_replay (n k : Nat) :
    (2 ^ n * k) * 2 = 2 ^ (n + 1) * k := by
  first
  | (rh_reduce 2 using [carrier_factor_exact]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact carrier_factor_exact n k

end RHMathRootSumSharpness

rh_scan UpperTheory.GalN.V.Win.rootSum limit 2000
rh_scan RHMathRootSumSharpness.carrier_factor_exact limit 2000
#print axioms UpperTheory.GalN.V.Win.rootSum
#print axioms RHMathRootSumSharpness.carrier_factor_exact
#print axioms RHMathRootSumSharpness.rank_two_attained_count
#print axioms RHMathRootSumSharpness.carrier_factor_replay
