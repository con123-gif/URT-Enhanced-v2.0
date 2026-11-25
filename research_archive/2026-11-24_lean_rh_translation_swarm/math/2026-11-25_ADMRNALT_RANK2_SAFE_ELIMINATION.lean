import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.AutQN
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared native bridge deleting the `SafeRA` premise from the actual
rank-two `AdmRNAlt` caller.

Upstream pin: 40e56bab026552e089d7afcfeff08d2defb9c005
AutQN.lean blob: d626de1e423ebf58d4b7357f69905fd98829ff51
UnlAllOf.lean blob: 125ba13df0fb07890a431dcded6fb91c22f1b1e0

This file is PREPARED / NOT COMPILED locally.  It imports no claimed RH
theorem and contains no `sorry` or `admit`.
-/

noncomputable section

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual
  ReciprocityTheory.Gal Formalism.MainNotions.N

namespace RHMathAdmRNAltRankTwo

open UpperTheory.GalN.V

theorem safeRA_rankTwo_weights
    {Omega : Type} [Field Omega] [Algebra ℚ Omega]
    {l M e : ℕ} [Fact l.Prime]
    (he : 1 ≤ e)
    (r : G ℚ Omega →* GL (Fin 2) (Qbar l)) :
    UpperTheory.V.Z.Win.A4.SafeRA l M
      (![(e : ℤ), -(e : ℤ)] : Fin 2 → ℤ) r := by
  apply Or.inr
  intro i j
  fin_cases i <;> fin_cases j <;> simp <;> omega

theorem admRNAlt_rankTwo_of_core
    {Omega : Type} [Field Omega] [Algebra ℚ Omega]
    {l M e : ℕ} [Fact l.Prime]
    {ι : Qbar l ≃+* ℂ}
    {r : G ℚ Omega →* GL (Fin 2) (Qbar l)}
    (he : 1 ≤ e)
    (hirr : IsIrr r)
    (haut : UpperTheory.V.Z.Win.IsAutQA ι r)
    (hlevel : Level l M (![(e : ℤ), -(e : ℤ)] : Fin 2 → ℤ) r)
    (hdual : ∃ theta, IsCycWt l 0 theta ∧ DualTw r theta) :
    AdmRNAlt ι M (![(e : ℤ), -(e : ℤ)] : Fin 2 → ℤ) 0 r := by
  exact ⟨hirr, haut, hlevel, hdual, safeRA_rankTwo_weights he r⟩

theorem admRNAlt_rankTwo_of_core_replay
    {Omega : Type} [Field Omega] [Algebra ℚ Omega]
    {l M e : ℕ} [Fact l.Prime]
    {ι : Qbar l ≃+* ℂ}
    {r : G ℚ Omega →* GL (Fin 2) (Qbar l)}
    (he : 1 ≤ e)
    (hirr : IsIrr r)
    (haut : UpperTheory.V.Z.Win.IsAutQA ι r)
    (hlevel : Level l M (![(e : ℤ), -(e : ℤ)] : Fin 2 → ℤ) r)
    (hdual : ∃ theta, IsCycWt l 0 theta ∧ DualTw r theta) :
    AdmRNAlt ι M (![(e : ℤ), -(e : ℤ)] : Fin 2 → ℤ) 0 r := by
  first
  | (rh_reduce 3 using [admRNAlt_rankTwo_of_core]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact admRNAlt_rankTwo_of_core he hirr haut hlevel hdual

end RHMathAdmRNAltRankTwo

rh_scan RHMathAdmRNAltRankTwo.safeRA_rankTwo_weights limit 2000
rh_scan RHMathAdmRNAltRankTwo.admRNAlt_rankTwo_of_core limit 2000
#print axioms RHMathAdmRNAltRankTwo.safeRA_rankTwo_weights
#print axioms RHMathAdmRNAltRankTwo.admRNAlt_rankTwo_of_core
#print axioms RHMathAdmRNAltRankTwo.admRNAlt_rankTwo_of_core_replay
