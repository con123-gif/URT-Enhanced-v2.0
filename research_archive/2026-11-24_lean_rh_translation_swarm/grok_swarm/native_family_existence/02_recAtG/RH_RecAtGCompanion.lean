/-
  RH_RecAtGCompanion.lean  --  STATUS: NOT EXECUTED.
  Never elaborated: the Grok box has no build of the upstream project
  (leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005).
  Meant to be dropped into an upstream checkout and run with `lake env lean`.
  Each `example` restates an upstream declaration with the exact statement text
  copied from the pinned source and closes it with that declaration, so a
  successful run would confirm the statements below match upstream verbatim.
  Nothing here is claimed to have compiled.
-/
import Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.LayeredAutomorphicDataExistsOfTwoPasses
import Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.ExistsLayeredDataOfGoodScaleContexts
import Development.AbelianVarietyTheory.Definitions.AutomorphicMembership.ThetaChr
import Development.AutomorphicArithmetic.CharacterBoxes.SmallestPrimePolynomialBound
import Formalism.PeriodIntegrals.OrbitalBoundsConclusion.MinkowskiQ
import Formalism.SharpRestriction.DesignExistsOfChoices

open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Inhab Formalism.L2.Host GlobalTheory.EX GlobalTheory.EX.OB GlobalTheory.Mem GlobalTheory.Mem.Top GlobalTheory.Fc NumberField IsDedekindDomain

-- D-1a  (LayeredAutomorphicDataExistsOfTwoPasses.lean:12)
example (B : GroupRetwisting.Base) (pl : Finset ℕ) (f : GroupRetwisting.Fr B.toPre) :
    (GroupRetwisting.TwDat.untw B pl).set f = {1, f.del, f.del'} :=
  GroupRetwisting.untw_set_eq B pl f

-- D-1  (LayeredAutomorphicDataExistsOfTwoPasses.lean:22)
example : (∀ D : D7, Formalism.L2.Theta.VolTieG D → StandardLattice.VolumeEqMass₂ D) →
    ∀ (KP : GroupRetwisting.BaseP) (Q Q' : V4.Slot), GroupRetwisting.BaseCond KP → GroupRetwisting.FirstG KP Q → GroupRetwisting.ExportF KP Q → GroupRetwisting.SecondG KP Q Q' →
      RecAtG (fun K D Y => GroupRetwisting.FromCoreAt Q' K D Y ∧ DQ.TupUsedAt D ∧ DQ.TwAllAt D Y.nch Y.xd ∧ DQ.MtStableAt D) :=
  GroupRetwisting.recAtG_of_two_passes

-- D-2  (ExistsLayeredDataOfGoodScaleContexts.lean:16)
example : StandardLattice.SiegelMassRatioCM → ∀ (Q' : V4.Slot) (QO : Par → ∀ D : D7, Obj D → Prop), RecAtG (fun K D Y => GroupRetwisting.FromCoreAt Q' K D Y ∧ DQ.TupUsedAt D ∧ DQ.TwAllAt D Y.nch Y.xd ∧ DQ.MtStableAt D) → (EvP fun κ K => ∀ β : BPt K, β.Is Q' → QO κ β.D β.O) → RecExP (fun κ => DQ.withQD (fun D O => κ.Pos → QO κ D O)) :=
  GlobalTheory.Fc.recExP_of_recAtG

-- Link: the four recAtG inputs are exactly the four conjuncts of MemberE (ThetaChr.lean:102).
example (𝒮 : Slots) (h2v : ∀ D : D7, Formalism.L2.Theta.VolTieG D → StandardLattice.VolumeEqMass₂ D)
    (h : GlobalTheory.Mem.Top.Bl.MemberE 𝒮) :
    RecAtG (fun K D Y => GroupRetwisting.FromCoreAt (GlobalTheory.Mem.Top.Bl.IsGoodE 𝒮) K D Y ∧ DQ.TupUsedAt D ∧ DQ.TwAllAt D Y.nch Y.xd ∧ DQ.MtStableAt D) :=
  GroupRetwisting.recAtG_of_two_passes h2v GlobalTheory.Mem.Top.Bl.KPx _ _ h.1 h.2.1 h.2.2.1 h.2.2.2

-- hostQ  (SmallestPrimePolynomialBound.lean:64)
open GlobalTheory.EX.DC UpperTheory.Top.PolynomialHostPrimeBound in
example : SmallPrimeOne → ∀ (la : ℝ) (G : FReq), HostExW la G.req → DC.HostExQW la G.req :=
  UpperTheory.Top.hostQ

-- minkowski_bound_rat  (OrbitalBoundsConclusion/MinkowskiQ.lean:6)
example : PI.MinkowskiBoundQ := minkowski_bound_rat
-- and its use site in LinkEx.lean:35 needs MinkDiv; the two agree by unfolding
-- (PI.minkowskiM and S6.minkowskiM have identical bodies, MinkMult = the GL_n(ℚ) divisibility):
example : Formalism.MainNotions.MinkDiv := minkowski_bound_rat
