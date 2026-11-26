import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LevelAdmissibleRestrictionHolds
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.AutQN
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
MATH lane / mandatory unified reduction, 26 Nov 2026.

Pinned upstream source:
  leanprover-community/riemann-hypothesis
  40e56bab026552e089d7afcfeff08d2defb9c005

The actual rank-two CountQ restriction edge needs only `LevelF`, not the
stronger source `Level`.  In particular it does not consume the final
`LevelAt` alternative saying that the flag characters are nonadjacent or the
representation is potentially crystalline.  The three `LevelF` fields remain.

PREPARED / NOT COMPILED locally.  This proves neither the retained inputs,
`CountQAlt`, the weighted-prime lower bound, nor RH.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

noncomputable section

open NumberField IsDedekindDomain IsLocalRing
  Formalism.ConjugateSelfDual ReciprocityTheory.Gal
  Formalism.BasicNotions Formalism.MainNotions.N Polynomial
  GlobalTheory.CuspRep GlobalTheory.GalOfCusp
  UpperTheory.V UpperTheory.V.Af UpperTheory.V.HV UpperTheory.V.U3
  UpperTheory.V.Aut UpperTheory.V.Pr
open UpperTheory.GalN.V

namespace RHMathCountQLevelFInput

theorem safePA_rankTwo_weights
    {K Omega : Type} [Field K] [NumberField K]
    [Field Omega] [Algebra K Omega]
    {l M e : Nat} [Fact l.Prime]
    (he : 1 <= e)
    (rho : G K Omega ->* GL (Fin 2) (Qbar l)) :
    UpperTheory.V.Z.Win.A4.SafePA l M
      (![(e : Int), -(e : Int)] : Fin 2 -> Int) rho := by
  apply Or.inr
  intro i j
  fin_cases i <;> fin_cases j <;> simp <;> omega

theorem admissible_restriction_rankTwo_of_levelF_core
    (hP : UpperTheory.V.Af.Hypotheses')
    (K : Type) [Field K] [NumberField K] [IsCMField K]
    (hK : Module.finrank Rat K = 2)
    (e : Nat) (he : 1 <= e)
    (M : Nat)
    (l : Nat) [Fact l.Prime]
    (Omega : Type) [Field Omega] [Algebra Rat Omega] [Algebra K Omega]
    [IsScalarTower Rat K Omega] [IsAlgClosure Rat Omega] [IsAlgClosure K Omega]
    (iota : Qbar l ≃+* Complex)
    (r : G Rat Omega ->* GL (Fin 2) (Qbar l))
    (haut : UpperTheory.V.Z.Win.IsAutQA iota r)
    (hlevelF : UpperTheory.V.Lev.LevelF l M
      (![(e : Int), -(e : Int)] : Fin 2 -> Int) r)
    (hdual : Exists fun theta => IsCycWt l 0 theta ∧ DualTw r theta)
    (hirrK : IsIrr (r.comp (res Rat Omega K))) :
    AdmPNAlt iota M (![(e : Int), -(e : Int)] : Fin 2 -> Int)
      (r.comp (res Rat Omega K)) := by
  have hF := UpperTheory.V.Lev.levelFRes Rat K Omega l 2 M
    (![(e : Int), -(e : Int)] : Fin 2 -> Int) r hlevelF
  obtain ⟨⟨P, hreg, hA⟩, hW⟩ := haut hlevelF.cont K hK hirrK
  obtain ⟨theta, htheta, hd⟩ := hdual
  obtain ⟨chi, mu, hpol, -, -⟩ :=
    UpperTheory.V.Z.Bc.polarization_k_of_printed_results hP K hK 2 (by omega)
      l Omega iota r 0 theta P htheta hd hA
  exact ⟨hirrK, ⟨P, hreg, ⟨chi, hpol⟩, hA⟩, hW, hF,
    safePA_rankTwo_weights he (r.comp (res Rat Omega K))⟩

theorem admissible_restriction_rankTwo_original_bridge
    (hP : UpperTheory.V.Af.Hypotheses')
    (K : Type) [Field K] [NumberField K] [IsCMField K]
    (hK : Module.finrank Rat K = 2)
    (e : Nat) (he : 1 <= e)
    (M : Nat)
    (l : Nat) [Fact l.Prime]
    (Omega : Type) [Field Omega] [Algebra Rat Omega] [Algebra K Omega]
    [IsScalarTower Rat K Omega] [IsAlgClosure Rat Omega] [IsAlgClosure K Omega]
    (iota : Qbar l ≃+* Complex)
    (r : G Rat Omega ->* GL (Fin 2) (Qbar l))
    (haut : UpperTheory.V.Z.Win.IsAutQA iota r)
    (hlevel : Level l M (![(e : Int), -(e : Int)] : Fin 2 -> Int) r)
    (hdual : Exists fun theta => IsCycWt l 0 theta ∧ DualTw r theta)
    (hirrK : IsIrr (r.comp (res Rat Omega K))) :
    AdmPNAlt iota M (![(e : Int), -(e : Int)] : Fin 2 -> Int)
      (r.comp (res Rat Omega K)) := by
  first
  | (rh_reduce 3 using [admissible_restriction_rankTwo_of_levelF_core]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 3; done)
  | exact admissible_restriction_rankTwo_of_levelF_core hP K hK e he M l
      Omega iota r haut (UpperTheory.V.Lev.LevelF.of_level hlevel) hdual hirrK

end RHMathCountQLevelFInput

rh_scan RHMathCountQLevelFInput.admissible_restriction_rankTwo_of_levelF_core limit 2000
rh_prune RHMathCountQLevelFInput.admissible_restriction_rankTwo_of_levelF_core as RHMathCountQLevelFInputPruned
#print axioms RHMathCountQLevelFInput.safePA_rankTwo_weights
#print axioms RHMathCountQLevelFInput.admissible_restriction_rankTwo_of_levelF_core
#print axioms RHMathCountQLevelFInput.admissible_restriction_rankTwo_original_bridge

