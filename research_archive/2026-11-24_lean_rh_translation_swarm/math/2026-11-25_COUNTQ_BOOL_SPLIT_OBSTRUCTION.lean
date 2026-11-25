import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared native audit for the exact Boolean used by `countQ_alt`.
Source pin: 40e56bab026552e089d7afcfeff08d2defb9c005.
Caller blob: 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40.

The private source lemma `bit_of_fibre` cannot be named outside its module.
The two declarations below encode its sharp two-point regression control:
a singleton label cannot separate two equality classes, while `PUnit × Bool` can.
This file is PREPARED / NOT COMPILED locally.
-/

namespace RHMathCountQBool

theorem no_singleton_classifier :
    ¬ ∃ g : Bool → PUnit, ∀ x y, g x = g y → x = y := by
  rintro ⟨g, hg⟩
  have h : true = false := hg true false (Subsingleton.elim _ _)
  cases h

theorem bool_classifier :
    ∃ g : Bool → PUnit × Bool, ∀ x y, g x = g y → x = y := by
  refine ⟨fun b => (PUnit.unit, b), ?_⟩
  intro x y h
  exact congrArg Prod.snd h

theorem bool_classifier_replay :
    ∃ g : Bool → PUnit × Bool, ∀ x y, g x = g y → x = y := by
  first
  | (rh_reduce 2 using [bool_classifier]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact bool_classifier

end RHMathCountQBool

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan RHMathCountQBool.bool_classifier limit 2000
#print axioms UpperTheory.GalN.V.Win.N.countQ_alt
#print axioms RHMathCountQBool.no_singleton_classifier
#print axioms RHMathCountQBool.bool_classifier
#print axioms RHMathCountQBool.bool_classifier_replay
