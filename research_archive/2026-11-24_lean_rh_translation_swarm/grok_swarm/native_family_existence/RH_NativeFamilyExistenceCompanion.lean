/-
  Native family existence — upstream-typed Lean companion (Grok, 2026-11-24).
  Source: leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005.

  STATUS: NOT EXECUTED. Requires the compiled upstream environment (oleans for the
  imported modules); that environment is not available on the machine where this was
  written. Each statement below is copied verbatim (binder-for-binder) from the cited
  upstream declaration and closed by that declaration, so if it elaborates it certifies
  only "statement = upstream statement", not any new mathematics.
-/
import Development.AutomorphicArithmetic.CharacterBoxes.ClassSel
import Development.AutomorphicArithmetic.CharacterBoxes.ObjCTrue
import Development.AutomorphicArithmetic.CharacterBoxes.DesignS
import Development.AutomorphicArithmetic.CharacterBoxes.ExS
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ExistsFamPOfKits
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.WorkingClassesFrozen
import Development.AbelianVarietyTheory.Proofs.IwasawaDecomposition.MemberTopFinalContextParameters
import Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.LinkEx

open Formalism.BasicNotions Formalism.BasicNotions.LevelStarExponents Formalism.MainNotions Formalism.MainNotions.Inhab Formalism.L2.Host GlobalTheory.EX
  GlobalTheory.EX.OB GlobalTheory.Mem GlobalTheory.Mem.Top GlobalTheory.Fc NumberField IsDedekindDomain

namespace Cathedral.NativeFamily

/-- NF-1 (glue): ExistsFamPOfKits.lean, `GlobalTheory.EX.exists_famP_of_kits`. -/
theorem nf1_glue : ∀ (eps : ℝ) (C : FC) (cD ch x1 la : ℝ) (S : Scales la), 0 < eps → eps < 1 / 52 → 1 < x1 → 1 ≤ la →
    Std C → C.GK.Nonneg → ∀ k : ∀ s : Scale, s.eps = eps → x1 ≤ s.x → S.Mem s → Kit C cD ch s,
    (∀ s h h' h'' i, Nonempty (NumAt C ((k s h h' h'').pt i).L)) →
    ∃ Fm : FamP eps, Fm.x1 = x1 ∧ Fm.cPre = C.cPre ∧ Fm.cOut = C.cOut.set 15 C.P.Cpde ∧ Fm.cMid = C.cMid ∧
      Fm.cLast = C.cLast ∧ Fm.CTu = C.CTu ∧
      (∀ Q : PtProp, (∀ s h h' h'' i, ((k s h h' h'').pt i).Has Q) → classOf Q Fm) ∧
      (∀ Rr : ∀ (D : D7) (L : SizeData₂ D), G.Inst D L → Prop,
        (∀ s h h' h'' i, Rr ((k s h h' h'').pt i).D ((k s h h' h'').pt i).L ((k s h h' h'').pt i).ta.Gx) →
        ∀ x, ∀ i : Fm.Ix x, Rr (Fm.D x i) (Fm.L x i) (Fm.Gx x i)) ∧
      Fm.J = S.J ∧ Fm.Win = S.Win ∧ Fm.Co = C.P.Cpde :=
  GlobalTheory.EX.exists_famP_of_kits

/-- NF-2 (design choices from kits): DesignS.lean, `UpperTheory.Top.designS`. -/
theorem nf2_designS : ∀ (Q : Par → PtProp) (cT : ℝ → ℝ → ℝ) (la : ℝ) (G : UpperTheory.Top.FReq), 1 < la → DC.MinkDiv →
    KitCPW la (fun κ => ((withDuty (DC.withObj (Q κ))).and DC.WallPt).and G.pt) →
    DC.DesignChoices (DC.WithTw fun Fm => (∃ κ : Par, Link κ Fm ∧ DC.cls (Q κ) Fm) ∧ G.cls la Fm) 3 cT :=
  UpperTheory.Top.designS

/-- NF-3 (existence for the selected class): ObjCTrue.lean, `UpperTheory.Top.recS`. -/
theorem nf3_recS (QO : Par → ∀ D : D7, Obj D → Prop) (cT : ℝ → ℝ → ℝ)
    (hR : DC.MinkDiv → RecExP (fun κ => DQ.withQD (QO κ))) (hM : DC.MinkDiv) :
    UpperTheory.Top.ExD (clsP QO) cT :=
  UpperTheory.Top.recS QO cT hR hM

/-- NF-4 (common class selection): ClassSel.lean, `UpperTheory.Top.classSel`. -/
theorem nf4_classSel : StandardLattice.SiegelMassRatioCM → (∀ D : D7, StandardLattice.VolTie D → StandardLattice.VolumeRatio₂ D) →
    ∀ (KP : ∀ B : Base, Fr B.toPre → Prop) (Q Q' : V4.Slot) (Bd : BdT) (Lk : LkT Bd) (H : ∀ 𝒜 : FamClass, RawSel Bd 𝒜 → Prop)
      (cT : ℝ → ℝ → ℝ),
    (DC.MinkDiv → GroupRetwisting.BaseCond KP ∧ GroupRetwisting.FirstG KP Q ∧ GroupRetwisting.ExportF KP Q ∧
      GroupRetwisting.SecondG KP Q Q') →
    ExBL KP Q Q' Lk → RowL KP Q Q' Lk H →
    ∃ (𝒜 : FamClass) (σ : RawSel Bd 𝒜), (DC.MinkDiv → UpperTheory.Top.ExD 𝒜 cT) ∧
      (∀ (eps : ℝ) (Fm : FamP eps), 𝒜 Fm → DQ.Duty7 Fm ∧ DQ.MtStableF Fm) ∧
      IsSel Q' Lk (fun _ _ _ _ _ => True) 𝒜 σ ∧ H 𝒜 σ :=
  UpperTheory.Top.classSel

/-- NF-5 (row evaluation → rec-existence): MemberTopFinalContextParameters.lean. -/
theorem nf5_memberTop : StandardLattice.SiegelMassRatioCM → (∀ D : D7, StandardLattice.VolTie D → StandardLattice.VolumeRatio₂ D) →
    ∀ (KP : GroupRetwisting.BaseP) (Q Q' : V4.Slot) (QO : Par → ∀ D : D7, Obj D → Prop),
      GroupRetwisting.BaseCond KP → GroupRetwisting.FirstG KP Q → GroupRetwisting.ExportF KP Q → GroupRetwisting.SecondG KP Q Q' →
      (EvP fun κ K => ∀ β : BPt K, β.Is Q' → QO κ β.D β.O) →
      RecExP (fun κ => DQ.withQD (fun D O => κ.Pos → QO κ D O)) :=
  GlobalTheory.Fc.memberTop_final_contextParameters

/-- NF-6 (namespace transfer DC → MainNotions used for `HypsAlt.hEx`): WorkingClassesFrozen.lean, second conjunct. -/
theorem nf6_frozen (𝒜 : FamClass) (cT : ℝ → ℝ → ℝ) (h : DC.MinkDiv → DC.DesignChoices (DC.WithTw 𝒜) 3 cT) :
    Formalism.MainNotions.MinkDiv → Formalism.MainNotions.DesignChoices (Formalism.MainNotions.WithTw 𝒜) 3 cT :=
  GlobalTheory.Fc.working_classes_frozen.2 𝒜 cT h

end Cathedral.NativeFamily
