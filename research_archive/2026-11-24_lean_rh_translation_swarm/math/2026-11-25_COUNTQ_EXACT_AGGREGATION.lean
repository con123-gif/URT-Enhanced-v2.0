import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared native certificate for the exact CountQ aggregation reduction.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Source blob 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40.

This file was NOT compiled locally: no Lean/Lake executable was present.
It proves only the arithmetic bridge conditional on the exact selected
cardinality bounds, exponent domination, and injective-sum domination.
The latter two are standard finite-family facts to be supplied by the
caller with Astar = univ.sup A and the source's hu : Injective u.
It does not prove CountPAlt, CountQAlt, CountI, or RH.
-/

open scoped BigOperators

namespace RHMathCountQAggregation

set_option maxHeartbeats 800000

theorem selected_aggregate
    {I J : Type} [Fintype I] [Fintype J]
    (c A : J -> Nat) (u : I -> J) (d : I -> Nat)
    (Y Astar : Nat) (hY : 1 <= Y)
    (hmax : forall i, A (u i) <= Astar)
    (hd : forall i, d i <= c (u i) * Y ^ A (u i))
    (hsum : (Finset.univ.sum fun i => c (u i)) <=
      Finset.univ.sum c) :
    (Finset.univ.sum d) <=
      (Finset.univ.sum c) * Y ^ Astar := by
  calc
    Finset.univ.sum d <=
        Finset.univ.sum (fun i => c (u i) * Y ^ A (u i)) :=
      Finset.sum_le_sum fun i _ => hd i
    _ <= Finset.univ.sum (fun i => c (u i) * Y ^ Astar) :=
      Finset.sum_le_sum fun i _ =>
        Nat.mul_le_mul_left (c (u i))
          (Nat.pow_le_pow_right hY (hmax i))
    _ = (Finset.univ.sum fun i => c (u i)) * Y ^ Astar := by
      rw [Finset.sum_mul]
    _ <= (Finset.univ.sum c) * Y ^ Astar :=
      Nat.mul_le_mul_right _ hsum

theorem root_sum_aggregate
    {I J : Type} [Fintype I] [Fintype J]
    (c A : J -> Nat) (u : I -> J) (d : I -> Nat)
    (Y Astar rootFactor cardD : Nat) (hY : 1 <= Y)
    (hmax : forall i, A (u i) <= Astar)
    (hd : forall i, d i <= c (u i) * Y ^ A (u i))
    (hsum : (Finset.univ.sum fun i => c (u i)) <=
      Finset.univ.sum c)
    (hroot : cardD <= rootFactor * Finset.univ.sum d) :
    cardD <= rootFactor * ((Finset.univ.sum c) * Y ^ Astar) := by
  exact hroot.trans (Nat.mul_le_mul_left rootFactor
    (selected_aggregate c A u d Y Astar hY hmax hd hsum))

theorem root_sum_aggregate_replay
    {I J : Type} [Fintype I] [Fintype J]
    (c A : J -> Nat) (u : I -> J) (d : I -> Nat)
    (Y Astar rootFactor cardD : Nat) (hY : 1 <= Y)
    (hmax : forall i, A (u i) <= Astar)
    (hd : forall i, d i <= c (u i) * Y ^ A (u i))
    (hsum : (Finset.univ.sum fun i => c (u i)) <=
      Finset.univ.sum c)
    (hroot : cardD <= rootFactor * Finset.univ.sum d) :
    cardD <= rootFactor * ((Finset.univ.sum c) * Y ^ Astar) := by
  first
  | (rh_reduce 2 using [root_sum_aggregate]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact root_sum_aggregate c A u d Y Astar rootFactor cardD
      hY hmax hd hsum hroot

end RHMathCountQAggregation

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan RHMathCountQAggregation.root_sum_aggregate limit 2000
#print axioms RHMathCountQAggregation.selected_aggregate
#print axioms RHMathCountQAggregation.root_sum_aggregate
#print axioms RHMathCountQAggregation.root_sum_aggregate_replay
