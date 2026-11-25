import Formalism.LocalToGlobal.GlobalTheory.LossRequirementsOfSmallShares

/-!
Selected-point signed loss bridge, 25 Nov 2026.
SOURCE-MATCHED / PREPARED, not compiled; RH OPEN.
Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.

This uses the genuine pointwise local loss setting and native discriminant
theorem, not a new conjectural replacement for ASK-Ga. In particular,
joint_discriminant_bound has an arbitrary outer type U, and the native
losses_of_small_share_weight already applies it with U=Unit. No reason to
construct a FamP for that one call.

The pointwise parameter constructor pe_parAt and native pe_windows_at
give the scale record directly. The latter has no FamP, coverS, CoverAll
or shared-family parameter equality premise. The original windows_ev
merely chooses uniform thresholds and applies this theorem. Here retain
every explicit size and scalar guard as a local premise. To use at all
large x one must produce uniform constants and the same local data
on the selected point, not infer them from its mere existence.

Actual source files:
Formalism/LocalToGlobal/GlobalTheory/LossRequirementsOfSmallShares.lean
  287dcaae544bf078e47910aa5c9986ec501bdbd2 (loss_setting_family)
Formalism/LocalToGlobal/GlobalTheory/PowFourLtCeilThresholdPrime.lean
  8166795ec6e846795d7272781119ee7d17d426c0 (pe_parAt, pe_windows_at,
  ASK_at, Ga_at, IO_at, pd_a, pd_b)
Formalism/LocalToGlobal/GlobalTheory/SuppSat.lean
  80c1d0526b661eae74d87ec3b569d6a459e900ce (ParTie, PtH, ldAt)
Formalism/LocalToGlobal/GlobalTheory/SmallShareWeightExists.lean
  1fa3d7c7c5fcd4a31a376dd26beea1372b8d3c8e (LossSettingFamily)
Formalism/SizeWindowBrackets/ChainSlopeWindows/DiscriminantSettingSatisfied.lean
  edc32424311c076565c2e13b7657f6a5f58cfd84 (joint_discriminant_bound,
  discriminant_windows_of, io_discriminant_bound)
Formalism/SizeWindowBrackets/PrimeClassLossHypothesesSatisfiable.lean
  3f609406f5456e034f5dfb94e9688fca6c9f95a9 (WindowsD, IoD, LossBounds)
Formalism/SharpRestriction/GlobalSchurBounds/JointsL.lean
  057913eaf7d7d88fda208e16cd84e910ebdd4227 (count_at_of, slopesM_at_of)
Original family assembler and proof graph preserved.
-/

noncomputable section
namespace Formalism.L2.GlobalTheoryTheory.Loss7

open Formalism.BasicNotions Formalism.MainNotions
  Formalism.LFunctionChainParameters.DeficitSplitLemmas
  Formalism.LFunctionChainParameters.PrimeWindowSizeBounds
  Formalism.LFunctionChainParameters.SmallOrderPrimeLosses
  Formalism.LFunctionChainParameters.LErr
  Formalism.L2.GlobalTheoryTheory.Loss

/-- The record is constructed from the very same native point. No transport
of its parameters between family members is needed. -/
theorem selected_parTie {D : D7} (L : SizeData₂ D) (K : G.Consts)
    (Cr C bo Cb Cord : ℝ) :
    ParTie (pe_parAt L K Cr C bo Cb Cord) L K C bo Cr := by
  constructor <;> rfl

/-- Direct application of the native joint bound to one actual point.
Cord is chosen before every point and every scale. The window and
large-scale guards, PtH, LinkG_at, bad-prime and small-share budgets
are retained. This closes a conditional bridge, not their suppliers. -/
theorem selected_point_loss :
    ∃ Cord : ℝ, 0 ≤ Cord ∧
    ∀ (D : D7) (L : SizeData₂ D) (X : G.Inst D L) (K : G.Consts)
      (Cr C bo e Kb : ℝ),
      WindowsD (pe_parAt L K Cr C bo 0 Cord) e Kb →
      LargeX L.sc.x L.sc.eps e Kb →
      PtH X K Cr → LinkG_at X K C bo →
      0 ≤ bo → 0 ≤ L.LaG → L.sc.p0 D.R.k ≤ L.sc.X' →
      D.host.TT.Nonempty → ChBadp_at X → ChW_at X K →
      LocalQuadraticParts.ASK L - L.Ga ≤
        (3 * max C 0 + 13) * ((D.host.TT.card : ℝ) * D.R.m * L.sc.b) ∧
      Lnk.IOsum L ≤ (D.host.TT.card : ℝ) * D.R.m * L.sc.b := by
  obtain ⟨Cord, hCord, hJ⟩ := joint_discriminant_bound
  refine ⟨Cord, hCord, ?_⟩
  intro D L X K Cr C bo e Kb hW hLarge H hG hbo hLa hp0 hTT hBad hShare
  let P := pe_parAt L K Cr C bo 0 Cord
  have tie : ParTie P L K C bo Cr := selected_parTie L K Cr C bo 0 Cord
  have hS := loss_setting_family D L X K Cr C bo P H hG tie hbo hLa hp0 hTT hBad hShare
  have hL : LargeX P.x P.ε e Kb := hLarge
  obtain ⟨hc1, hc2⟩ :=
    hJ P e Kb rfl hW hL ℕ ℕ ℕ Unit _ _ _ _ _ _ _ _ _ hS
  have hU : unitU P (SizeData₂.lifts D).card (TTv D).card =
      ((D.host.TT.card : ℝ) * D.R.m * L.sc.b) := by
    unfold unitU
    rw [card_lifts, card_TTv, pd_b tie]
  constructor
  · have h := hc1 ()
    rw [Ga_at X K Cr C bo H, hU, tie.d, ASK_at X K Cr C bo H, tie.C] at h
    exact h
  · have h := hc2 ()
    rw [IO_at X K Cr H, hU] at h
    exact h

#print axioms selected_parTie
#print axioms selected_point_loss

end Formalism.L2.GlobalTheoryTheory.Loss7

/-!
Composition, to be elaborated against the pinned build:
1. Choose Cord from selected_point_loss before the scale threshold.
2. Use pe_windows_at with Cb=0 and e>=max(40,L.Ct+3), retaining K.Nonneg,
   SizesAt L, x>=3, 1<=Cr<=x, rhoB<=x^-2, rG<=x, the two displayed
   exponential size inequalities, 0<=bo<=exp(x^eps/2), Cord>=0.
   Apply discriminant_windows_of. For fixed positive eps, fixed J,
   fixed Cr,C,Ct and bo=b^delta(x), delta(x)->0, native windows_ev
   establishes the eventual scalar guards by elementary growth.
   Do not treat pointwise bo control or constants as automatic from
   selectedPointS.
3. selectedPointS supplies WinOK/WOK and genuine p.From/Val/CanonInst.
   wreq_of_wok supplies the native WReq, hence ChW_at.
   The actual local PtH, ChBadp_at and LinkG_at suppliers remain.
4. Transport native ASK by askIs_of (FrameCodeOfAdditive.lean),
   with actual AD, Reads, fills, positivity and truncation. This is
   source identification, not a loss estimate.
5. Instantiate the native selected-translation ch_top geometry at
   U0=Unit, with actual word fibre W; count_at_of and slopesM_at_of
   are already pointwise and need no family. Do not replace the
   word fibre by Unit (the entropy/count result needs that fibre).
6. Preserve the common arithmetic data and selected translation
   before selecting the geometric point; no circular choice of tables.

This removes full-family coverage from the LOCAL signed-loss consumer
and gives the exact original constant. No claim that local LinkG_at,
rank, count, DIV, slope, entropy or ObjCP are proved unconditionally.
No native Lean run; compile and repair with the pinned upstream
olean environment before claiming a verified replacement.
-/
