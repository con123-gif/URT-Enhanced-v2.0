import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.RepERankOne
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared wrapper-level certificate for the remaining at-l Hodge premise in
`countQ_alt`.

Upstream source pin: 40e56bab026552e089d7afcfeff08d2defb9c005.
This file does not import or prove RH.  It is PREPARED / NOT COMPILED locally.
-/

noncomputable section

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal
open Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N
open GlobalTheory.Pst GlobalTheory.TripleGal UpperTheory.V UpperTheory.V.Af

namespace RHMathCountQPotCrys

variable {F Omega : Type} [Field F] [NumberField F] [Field Omega]
variable [Algebra F Omega] [IsAlgClosure F Omega]
variable {l n : Nat} [Fact l.Prime]

/-- The native `twist_above` theorem weakens an ad hoc preservation premise
to potential crystallinity of the rank-one twisting character itself, on the
same local bridge. -/
theorem potCrysAt_twist_of_rankOnePotCrys
    (W : G F Omega →* GL (Fin n) (Qbar l))
    (delta : G F Omega →* (Qbar l)ˣ)
    (hdelta : ∀ (A : ValuationSubring Omega) (O : Type)
      [CommRing O] [Algebra ℤ_[l] O] [TopologicalSpace O]
      (Bw : LocBridge l F Omega (Dec (F := F) A) O),
      Induces Bw →
        IsPotCrysAt (Loc.PP l) Bw
          ((rk1 delta).comp (Dec (F := F) A).subtype))
    (A : ValuationSubring Omega)
    (hW : PotCrysAt W A) :
    PotCrysAt (tw W delta) A := by
  obtain ⟨O, _, _, _, Bw, hBw, hpc⟩ := hW
  refine ⟨O, inferInstance, inferInstance, inferInstance, Bw, hBw, ?_⟩
  have ht := GlobalTheory.TwistAbove.twist_above l _ _
    (UpperTheory.V.Loc.tiedP l) F Omega (Dec (F := F) A) O Bw n
    (W.comp (Dec (F := F) A).subtype)
    ((tw W delta).comp (Dec (F := F) A).subtype)
    (delta.comp (Dec (F := F) A).subtype)
    (fun g => tw_val W delta (g : G F Omega))
  exact ht.2.2.1 hpc (hdelta A O Bw hBw)

/-- Replay through the mandatory reduction stack. -/
theorem potCrysAt_twist_replay
    (W : G F Omega →* GL (Fin n) (Qbar l))
    (delta : G F Omega →* (Qbar l)ˣ)
    (hdelta : ∀ (A : ValuationSubring Omega) (O : Type)
      [CommRing O] [Algebra ℤ_[l] O] [TopologicalSpace O]
      (Bw : LocBridge l F Omega (Dec (F := F) A) O),
      Induces Bw →
        IsPotCrysAt (Loc.PP l) Bw
          ((rk1 delta).comp (Dec (F := F) A).subtype))
    (A : ValuationSubring Omega)
    (hW : PotCrysAt W A) :
    PotCrysAt (tw W delta) A := by
  first
  | (rh_reduce 3 using [potCrysAt_twist_of_rankOnePotCrys W delta hdelta A hW]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact potCrysAt_twist_of_rankOnePotCrys W delta hdelta A hW

end RHMathCountQPotCrys

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan GlobalTheory.TwistAbove.twist_above limit 2000
rh_scan RHMathCountQPotCrys.potCrysAt_twist_of_rankOnePotCrys limit 2000
#print axioms GlobalTheory.TwistAbove.twist_above
#print axioms RHMathCountQPotCrys.potCrysAt_twist_of_rankOnePotCrys
#print axioms RHMathCountQPotCrys.potCrysAt_twist_replay
