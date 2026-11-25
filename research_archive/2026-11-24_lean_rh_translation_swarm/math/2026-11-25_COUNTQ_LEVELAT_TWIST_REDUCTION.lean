import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.KatoQuadraticCharacters.NewformTwistNorms.PowEqOneOfKills
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared native certificate for the at-l part of the `countQ_alt` quadratic
twist classifier.

Upstream source pin: 40e56bab026552e089d7afcfeff08d2defb9c005.
This file does not import or prove RH.  It is PREPARED / NOT COMPILED locally.
-/

noncomputable section

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal
open Formalism.MainNotions.N GlobalTheory.GalOfCusp UpperTheory.V UpperTheory.V.Af
open UpperTheory.V.HV GlobalTheory.Ord2

namespace RHMathCountQLevelAt

variable {Omega : Type} [Field Omega] [Algebra ℚ Omega] [IsAlgClosure ℚ Omega]
variable {l M e : ℕ} [Fact l.Prime]

/-- Exact reduction of at-l level transport.  The flag relation and the
distinct-character branch transport by cancellation.  The only genuinely
local Hodge input retained is preservation of `PotCrysAt` when that branch of
the source disjunction is used. -/
theorem levelAt_twist_of_killsMu_of_potCrys
    (W : R2 Omega l) (delta : G ℚ Omega →* (Qbar l)ˣ)
    (hdelta : KillsMu M delta)
    (hpot : ∀ A : ValuationSubring Omega,
      PotCrysAt W A → PotCrysAt (tw W delta) A)
    (hW : LevelAt l M ![(e : ℤ), -(e : ℤ)] W) :
    LevelAt l M ![(e : ℤ), -(e : ℤ)] (tw W delta) := by
  intro w hw
  obtain ⟨A, hA, chi, kappa, hchi, hflag, hrel, hor⟩ := hW w hw
  let deltaA := delta.comp (Dec (F := ℚ) A).subtype
  refine ⟨A, hA, (fun i => chi i * delta),
    (fun i => kappa i * deltaA), ?_, ?_, ?_, ?_⟩
  · intro i
    exact GlobalTheory.Ord2.TwDet.killsMu_mul (hchi i) hdelta
  · exact GlobalTheory.Ord2.TwDet.flag_twist delta hflag
  · intro i s hs
    rw [hrel i s hs]
    simp only [MonoidHom.mul_apply, MonoidHom.comp_apply, Subgroup.coe_subtype]
    ac_rfl
  · rcases hor with hdist | hp
    · left
      intro i j hij
      apply hdist i j
      ext s
      have hs := congrArg (fun f => f s) hij
      simp only [MonoidHom.mul_apply, MonoidHom.comp_apply, Subgroup.coe_subtype] at hs ⊢
      apply mul_right_cancel (b := delta (s : G ℚ Omega))
      simpa [mul_assoc, mul_left_comm, mul_comm] using hs
    · exact Or.inr (hpot A hp)

/-- Replay through the mandatory native reduction stack. -/
theorem levelAt_twist_replay
    (W : R2 Omega l) (delta : G ℚ Omega →* (Qbar l)ˣ)
    (hdelta : KillsMu M delta)
    (hpot : ∀ A : ValuationSubring Omega,
      PotCrysAt W A → PotCrysAt (tw W delta) A)
    (hW : LevelAt l M ![(e : ℤ), -(e : ℤ)] W) :
    LevelAt l M ![(e : ℤ), -(e : ℤ)] (tw W delta) := by
  first
  | (rh_reduce 3 using [levelAt_twist_of_killsMu_of_potCrys W delta hdelta hpot hW]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact levelAt_twist_of_killsMu_of_potCrys W delta hdelta hpot hW

end RHMathCountQLevelAt

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan RHMathCountQLevelAt.levelAt_twist_of_killsMu_of_potCrys limit 2000
#print axioms UpperTheory.GalN.V.Win.N.countQ_alt
#print axioms RHMathCountQLevelAt.levelAt_twist_of_killsMu_of_potCrys
#print axioms RHMathCountQLevelAt.levelAt_twist_replay
