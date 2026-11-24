/-
  RH_TrustLayCoreCompanion.lean  --  STATUS: NOT EXECUTED.
  Never elaborated on the Grok box (no upstream build). Intended for an upstream checkout at
  leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005 via `lake env lean`.
  Each `example` restates an upstream declaration verbatim and closes it with that declaration.
  The `#print axioms` lines are what an executor should run to confirm the trust-boundary claims of §1.
-/
import Development.AutomorphicArithmetic.CharacterBoxes.ObjCTrue
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.MassRatioAllUnramifiedCmFields
import Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.ExistsLayerParametersAdmissible
import Main

open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Inhab Formalism.L2.Host GlobalTheory.EX GlobalTheory.EX.OB GlobalTheory.Mem GlobalTheory.Mem.Top NumberField IsDedekindDomain

-- §1a SmallPrimeOne: discharged inside recS (ObjCTrue.lean:33) by a closed term
example : SmallPrimeOne := GlobalTheory.EX.smallPrimeOne_of_primesRel GlobalTheory.Lin.primesRel_holds
-- §1b SiegelMassRatioCM: discharged as HypA field a18 by a closed term
example : StandardLattice.SiegelMassRatioCM := GlobalTheory.Mass.massRatio_all_unramified_cmFields
example : StandardLattice.SiegelMassRatioCM :=
  Formalism.MainNotions.StandardLattice.standardMassRatio_of_modelMassRatio GlobalTheory.Mass.siegelMassRatio_holds

#print axioms GlobalTheory.Lin.primesRel_holds
#print axioms GlobalTheory.Mass.massRatio_all_unramified_cmFields
#print axioms riemannHypothesis

-- §2 lay_of_core (ExistsLayerParametersAdmissible.lean:105)
example : Ev fun K => ∀ (X : Stages) (f : Fr X.B.toPre) (T : TwDat X.B) (c : V4.Core K X f T),
    StandardLattice.VolumeEqMass₂ X.toD7 → ∃ Y : Lay X.toD7, layObj Y = c.O ∧ Over X.toD7 K.P K.Lv ∧ RecOK K.s K.C K.cD X.toD7 ∧
      LedOK K.s K.C K.cD K.ch Y K.a K.b ∧ DQ.TupUsedAt X.toD7 :=
  GlobalTheory.Mem.Top.LayOfCore.lay_of_core

-- §2 tameDistinct_gen (PowEqOfPartEq.lean:84)
example : ∀ (r g m : ℕ) [Fact g.Prime] (w : (ZMod g)ˣ), orderOf w = g - 1 → 4 * (m : ℝ) * (g : ℝ) ^ ((1 : ℝ) / 4) < (g : ℝ) - 1 → 1 ≤ r → DC.TameDistinct r g (fun j : Fin m => w ^ (2 * (j.1 + 1))) :=
  GlobalTheory.EX.DC.TameGen.tameDistinct_gen

-- §2 four_mul_root_lt (FourMulRootLt.lean:9)
example {m k g : ℝ} (hm : 2 ≤ m) (hk : m + 3 ≤ k) (hg : k ^ 8 ≤ g) : 4 * m * g ^ ((1 : ℝ) / 4) < g - 1 :=
  GlobalTheory.Mem.Top.TamePow.four_mul_root_lt hm hk hg
