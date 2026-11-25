import Formalism.LocalToGlobal.GlobalTheory.LossRequirementsOfSmallShares
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.WeightRequirementOfValid

/-!
Selected-point loss, 25 Nov 2026. SOURCE-MATCHED / PREPARED, not compiled.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.

Actual kitS selects R,H,q0,a,b via HostWW, then a common word code,
then uses ObjCP at each translation. selectedPointS specializes that
application to one start. ObjCP remains a substantial premise.

Important correction: FamCore.coverS is a STRUCTURE FIELD, unlike the
stronger FamCore.CoverAll. Do not instantiate a full FamCore with Unit.
The eLoss=0 alternative native LossesSmallShares.linkCore uses
coverS_carry, not the explicit CoverAll argument of linkGLOBAL_of.
Both coverage-dependent family interfaces must be bypassed at point level.

The present local bridge removes a separate coarse IO-loss supplier.
WOK -> native WReq -> ChW_at, without choosing weights a second time.
Using actual PtH and LinkG_at at the SAME point, IO_at and
io_discriminant_bound give the sharper unnormalized bound
    IOsum <= a*m*|TT|*x^(-9).
Since a=x*b, this is Q*x^(-8), Q=m*|TT|*b.
No family, coverage, joint_discriminant_eventually, bad prime budget,
first-kind or discriminant window estimate is needed for THIS conclusion.
The native theorem io_discriminant_bound already proves the finite sum
inequality; this is a direct retained-strength transport, not new number
theory. ASK-Ga still needs its quantitative estimate, as do rank/count,
slope/entropy and actual ObjCP. Other consumers of LinkG/IO must remain.

Exact source anchors (all at pin):
- KitS.lean 0c36d8f9f09fc160cb21149253a5bb53f0553c14 (HostWW then hObj).
- FamCore.lean 44cd54c38881086724fdf7f10f32b7d8e80e35b3
  (coverS field, CoverAll, coverS_carry).
- LossesSmallShares.lean 70624b10f53b29e43deb89bd9dae257403ecb61e
  (LossFS, linkCore).
- WeightVectorSmallSharesSeven.lean 370098c956d2156e2c95069994e4c8cfae490b03
  (ChW_at, ChosenWS).
- WeightVectorSmallSharesEight.lean 02258485bdcf6216685a7f1345283701df2f89c0
  (chosenWS_of_wall).
- GrowthBounds/SmallOrderPrimes.lean a35ad58d20f072b48cbb03f619f1bf0f1501e66f
  (AuxBlock8.cands,WReq).
- WeightRequirementOfValid.lean a3936e26986700117f1b5b2c0e6d0d1032cebdbb
  (wreq_of_wok).
- LossRequirementsOfSmallShares.lean 287dcaae544bf078e47910aa5c9986ec501bdbd2
  (cands_eq, loss_setting_family, losses_of_small_share_weight).
- PowFourLtCeilThresholdPrime.lean 8166795ec6e846795d7272781119ee7d17d426c0
  (IO_at).
- DiscriminantSettingSatisfied.lean edc32424311c076565c2e13b7657f6a5f58cfd84
  (io_discriminant_bound, joint_core).
- GlobalTheoremInputs.lean ba31f5120ed089d48968754ae577427912d467c5
  (LinkG_at).
- PrimeClassLossHypothesesSatisfiable.lean 3f609406f5456e034f5dfb94e9688fca6c9f95a9
  (lhsW, IoD, tIoD).

Native verification outstanding; imports need the pinned upstream build.
No claim of a full native proof or of RH. Original graph retained.
RESUME HERE: compile this actual record bridge, then transfer ASK-Ga
from same-point loss_setting_family without a FamP, retaining first-kind,
local gain and all actual window premises. Do not replace by a model.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.Loss7

open Formalism.BasicNotions Formalism.MainNotions
  Formalism.LFunctionChainParameters.DeficitSplitLemmas
  Formalism.LFunctionChainParameters.PrimeWindowSizeBounds
  Formalism.LFunctionChainParameters.SmallOrderPrimeLosses
  Formalism.L2.GlobalTheoryTheory.Loss

variable {D : D7} {L : SizeData₂ D}

theorem chW_of_selected_wreq (X : G.Inst D L) (K : G.Consts)
    (h : Formalism.MainNotions.AuxBlock8.WReq X K (G.aL L) (G.bL L)) :
    ChW_at X K := by
  classical
  unfold ChW_at Formalism.MainNotions.AuxBlock8.WReq at *
  unfold cands Formalism.MainNotions.AuxBlock8.cands at *
  simpa only [mul_ite, mul_one, mul_zero] using h

theorem selected_io_bound (X : G.Inst D L) (K : G.Consts)
    (Cr C bo : ℝ) (H : PtH X K Cr)
    (hG : LinkG_at X K C bo) (hW : ChW_at X K) :
    Lnk.IOsum L ≤ L.sc.a * (D.R.m : ℝ) * (D.host.TT.card : ℝ) *
      L.sc.x ^ (-9 : ℝ) := by
  classical
  let Sig : ℕ → ℝ := G.Sig X K (G.aL L) (G.bL L)
  have hSig : ∀ p, 0 ≤ Sig p :=
    fun p => Lnk.Sig_nonneg X K H.Knn H.kapI _ _ p
  have hWW : lhsW (sAt L K) (L.sc.x ^ (-L.sc.eps)) Sig ≤
      L.sc.x ^ (-9 : ℝ) := by
    unfold ChW_at at hW
    unfold lhsW Sig
    rw [← cands_eq L K]
    exact hW
  have hio : ∀ p ∈ sAt L K,
      G.ioP X K (G.aL L) (G.bL L) p ≤
        2 * Sig p * (2 * ((D.R.m : ℝ) * D.host.TT.card * L.sc.a) / p) := by
    intro p _
    have h := Lnk.ioP_le X K p (hG.2.1 p) (hSig p)
    exact h
  have ha : 0 ≤ L.sc.a := (Lnk.sc_a_pos L.sc).le
  have h := io_discriminant_bound (sAt L K) Sig
    (G.ioP X K (G.aL L) (G.bL L)) (L.sc.x ^ (-L.sc.eps))
    (D.R.m : ℝ) (D.host.TT.card : ℝ) L.sc.a (L.sc.x ^ (-9 : ℝ))
    (Nat.cast_nonneg _) (Nat.cast_nonneg _) ha hWW hio
  rw [IO_at X K Cr H] at h
  exact h

#print axioms chW_of_selected_wreq
#print axioms selected_io_bound

end Formalism.L2.GlobalTheoryTheory.Loss7
