import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.KatoQuadraticCharacters.NewformTwistNorms.PowEqOneOfKills
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Prepared native certificate for the level-away branch of the `countQ_alt`
quadratic-twist ambiguity.

Upstream source pin: 40e56bab026552e089d7afcfeff08d2defb9c005.
This file does not import or prove RH.  It is PREPARED / NOT COMPILED locally.
-/

noncomputable section

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal
open Formalism.MainNotions.N GlobalTheory.GalOfCusp UpperTheory.V UpperTheory.V.Af
open UpperTheory.V.HV GlobalTheory.Ord2

namespace RHMathCountQLevelAway

variable {Omega : Type} [Field Omega] [Algebra ℚ Omega] [IsAlgClosure ℚ Omega]
variable {l M : ℕ} [Fact l.Prime]

/-- Exact source-level sufficient condition: a twist character killed by the same
level modulus preserves `LevelAway`.  No Frobenius, automorphy, or RH premise is
used. -/
theorem levelAway_twist_of_killsMu
    (W : R2 Omega l) (delta : G ℚ Omega →* (Qbar l)ˣ)
    (hdelta : KillsMu M delta) (hW : LevelAway l M W) :
    LevelAway l M (tw W delta) := by
  intro w hw
  obtain ⟨A, hA, chi, hchi, hdiag⟩ := hW w hw
  refine ⟨A, hA, fun i => chi i * delta, ?_, ?_⟩
  · intro i
    exact GlobalTheory.Ord2.TwDet.killsMu_mul (hchi i) hdelta
  · exact GlobalTheory.Ord2.TwDet.diag_twist delta hdiag

/-- Replay through the native reduction stack.  The direct theorem is the
trusted fallback if no reduction tactic improves the term. -/
theorem levelAway_twist_of_killsMu_replay
    (W : R2 Omega l) (delta : G ℚ Omega →* (Qbar l)ˣ)
    (hdelta : KillsMu M delta) (hW : LevelAway l M W) :
    LevelAway l M (tw W delta) := by
  first
  | (rh_reduce 2 using [levelAway_twist_of_killsMu W delta hdelta hW]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact levelAway_twist_of_killsMu W delta hdelta hW

end RHMathCountQLevelAway

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan RHMathCountQLevelAway.levelAway_twist_of_killsMu limit 2000
#print axioms UpperTheory.GalN.V.Win.N.countQ_alt
#print axioms RHMathCountQLevelAway.levelAway_twist_of_killsMu
#print axioms RHMathCountQLevelAway.levelAway_twist_of_killsMu_replay
