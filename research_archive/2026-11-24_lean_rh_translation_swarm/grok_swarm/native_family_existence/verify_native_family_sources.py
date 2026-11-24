#!/usr/bin/env python3
"""Source-token verifier for the native-family-existence chapter (Grok, 2026-11-24).

Checks, against a local checkout of leanprover-community/riemann-hypothesis at
40e56bab026552e089d7afcfeff08d2defb9c005 (sparse/blobless is enough):
  1. git blob id of every cited file equals the id recorded in the chapter;
  2. every quoted declaration header / proof token occurs verbatim in that file.
It does NOT elaborate Lean and proves nothing about the mathematics.
Usage: python3 verify_native_family_sources.py --source-root /path/to/riemann-hypothesis
"""
import argparse, hashlib, os, sys, json

CB = "src/Development/AutomorphicArithmetic/CharacterBoxes/"
GI = "src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/"
GT = "src/Development/AbelianVarietyTheory/Definitions/GlobalTwisting/"
IW = "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/"
TP = "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/"
SR = "src/Formalism/SharpRestriction/"

CHECKS = [
 (CB+"ClassSel.lean", "bb17cd650ebccefed17812bdc2c16cf7d4c3d8b1",
  ["theorem classSel : StandardLattice.SiegelMassRatioCM", "obtain ⟨R, r, hx', hr'⟩ := RowL.elim hx hr",
   "obtain ⟨E, hE, hH⟩ := Row.elim hx' hr'", "refine recS (QOf (sAnd Q' R) Lk E) cT fun hm => ?_",
   "GlobalTheory.T.secondG_sAnd_of_largeBase KP Q Q' R a (evG_of_ev r) d",
   "memberTop_final_contextParameters h1 h2 KP Q (sAnd Q' R) (QOf (sAnd Q' R) Lk E) a b c d' hE",
   "fun _ _ h => sevenDuties_of_class h"]),
 (CB+"ObjCTrue.lean", "abb0785a6a55e0c1aa450cbc6c815b53f0ebd313",
  ["theorem recS (QO : Par → ∀ D : D7, Obj D → Prop) (cT : ℝ → ℝ → ℝ) (hR : DC.MinkDiv → RecExP (fun κ => DQ.withQD (QO κ)))",
   "GlobalTheory.EX.smallPrimeOne_of_primesRel GlobalTheory.Lin.primesRel_holds",
   "GlobalTheory.T.existsObjects_of_admissibleTwistDatum _ GlobalTheory.EX.normPrimes_and_levelPrime_unconditional.2 (hR hM)",
   "hostWW _ la _ hla (hostQ hS la G hH) (objC_true hO) GlobalTheory.T.windowShareRequirementClosedForm_proof",
   "designS (fun κ => ptO (DQ.withQD (QO κ))) cT la G hla hM (kitS _ la G hW hO)"]),
 (CB+"DesignS.lean", "94baadfe879799d68ea8d1873497490da8f5b838",
  ["theorem designS : ∀ (Q : Par → PtProp) (cT : ℝ → ℝ → ℝ) (la : ℝ) (G : FReq), 1 < la → DC.MinkDiv →",
   "refine ⟨min ε0 (1 / 53), lt_min hε0 (by norm_num), fun eps he hle K => ?_⟩",
   "exists_std_large (thrTu K (cT eps 9)) K0 CT2 C8 hC8", "szRow_numAt eps he he52 C hStd",
   "exists_famP_of_kits eps C _ _ _ la S he he52 hx1 hla.le hStd hGK k",
   "fix_and_win_of_numAt eps C Fm hStd hOut", "have hCYL : Fm.CYL = 9 := hFix.2.2.2.2.2.2.2.1",
   "have hDG : DGamDvdF Fm := ⟨Fm.x1 + 1, fun x hx i u => (hc x (hlt x hx) i).1.1.2.2.1 _ (hM _) u⟩"]),
 (CB+"KitS.lean", "0c36d8f9f09fc160cb21149253a5bb53f0553c14",
  ["theorem kitS : ∀ (Q : Par → PtProp) (la : ℝ) (G : FReq), DC.HostWW la G.req → ObjCP Q →",
   "exists_injective_words eps C.CGam C.P.CF he he1 hG hF", "small_prime_lt eps C8 he h8",
   "GlobalTheory.EX.TieSame.same_of_from", "DC.has_withDuty_wall_and_choices"]),
 (CB+"HostWW.lean", "bf6d1090c41ae3270dc031d85cd38382834ebfe4",
  ["theorem UpperTheory.Top.hostWW :", "∀ (Q : PtProp) (la : ℝ) (P : HostReq), 1 < la → DC.HostExQW la P → DC.ObjC Q → DC.WClosed → DC.HostWW la P"]),
 (CB+"ExS.lean", "dee1bac5570acedf2630756fce7c43b3a535e854",
  ["def ExS (𝒜 : FamClass) (cT : ℝ → ℝ → ℝ) : Prop :=", "Formalism.MainNotions.DesignChoices (Formalism.MainNotions.WithTw fun Fm => 𝒜 Fm ∧ G.cls la Fm) 3 cT"]),
 (CB+"Supply.lean", "b104f034fc9c13758e280d1b7d33ac1ea370663a",
  ["def cls (la : ℝ) : FamClass := fun Fm =>", "Fm.toFamCore.Windows la ∧ ∀ x, Fm.x1 < x → ∀ i : Fm.Ix x, G.At (Fm.L x i)",
   "def ExD (𝒜 : FamClass) (cT : ℝ → ℝ → ℝ) : Prop :=", "DC.DesignChoices (DC.WithTw fun Fm => 𝒜 Fm ∧ G.cls la Fm) 3 cT"]),
 (GI+"ExistsFamPOfKits.lean", "b5246ad29ce66b7680db8a0e1dd3a6f8577a45ba",
  ["S.scale (if x1 < x ∧ x ∈ S.Win then x else y) eps", "Ix x := {_i : (k x).Ix // x ≤ x1 ∨ x ∈ Wn}",
   "Ix_win x hx := ⟨⟨(k x).ne.some, Or.inr hx⟩⟩", "D x i := ((k x).pt i.1).D", "theorem exists_famP_of_kits :",
   "obtain ⟨y, hw, hy⟩ := S.unb hla x1"]),
 (GT+"ValidForConstructedPointClassesEventuallyWorking.lean", "6f511130184c1e9d96637efe81b84fe54d7ec8ec",
  ["def QOf (E : Par → BdP Bd) (κ : Par) : ∀ D : D7, Obj D → Prop := fun D O =>", "κ.Pos → ∀ c : ℝ, ∃ b : Bd D O c, Built Q Lk κ D O c b ∧ E κ D O c b",
   "def cls (E : Par → BdP Bd) : FamClass := clsP (QOf Q Lk E)", "def ExB : Prop := EvP fun _ K => ∀ β : BPt K, β.Is Q → ∀ c : ℝ, ∃ b : Bd β.D β.O c, Lk K β c b",
   "def pick (E : Par → BdP Bd) : RawSel Bd (cls Q Lk E) := fun Fm hc x hx i => Classical.choose (cls_at Q Lk Fm hc x hx i)",
   "theorem Row.elim", "def clsP (QO : Par → ∀ D : D7, Obj D → Prop) : FamClass := fun Fm => ∃ κ : Par, Link κ Fm ∧ DQ.cls7 (QO κ) Fm",
   "def RecExP (QO : Par → ∀ D : D7, Obj D → Prop) : Prop :=", "def ParEv (q : Par → Prop) : Prop :=", "def EvP (p : Par → Ctx → Prop) : Prop :="]),
 (GT+"EventuallyAllScaleContextsAndOfBoth.lean", "9cf715e78a3b56d5730b0a8795f9599561bc00ed",
  ["def ExBL : Prop := ∃ R : V4.Slot, LargeBaseCondition KP Q R ∧ ExB (sAnd Q' R) Lk",
   "def RowL (H : ∀ 𝒜 : FamClass, RawSel Bd 𝒜 → Prop) : Prop := ∃ R : V4.Slot, LargeBaseCondition KP Q R ∧ Row (sAnd Q' R) Lk H",
   "theorem RowL.elim", "exact ⟨_, r.and r', EvP.mono (fun _ _ _ H β q => H β ⟨q.1, q.2.1⟩) hx, h.strengthen fun _ _ _ _ _ t => ⟨t.1, t.2.2⟩⟩"]),
 (GT+"AuxiliaryPrimeMemAvoidedPrimes.lean", "9ca81e4194b4501231f8624b0c1a393af0dbc8fa",
  ["namespace GlobalTheory.EX.DC", "def DesignChoices (𝒞 : FamClass) (C0 : ℝ) (cT : ℝ → ℝ → ℝ) : Prop :=",
   "def HostWW (la : ℝ) (P : HostReq) : Prop :=", "def cls (Q : PtProp) : FamClass := fun Fm =>"]),
 (IW+"MemberTopFinalContextParameters.lean", "57bbacbaa90ede7ca71597de15b9a3e17cc9786a",
  ["theorem memberTop_final_contextParameters :", "GlobalTheory.T.existsLayeredData_of_goodScaleContexts hAll Q' QO",
   "GlobalTheory.T.layeredAutomorphicData_exists_of_twoPasses (GlobalTheory.Mem.VolMass.volumes_eq_masses_of_unfold hU) KP Q Q' hB hF hE hS"]),
 (IW+"LayeredAutomorphicDataExistsOfTwoPassesStatement.lean", "d16f4dc3ea951ef669197d74b76ffb49ebf4614e",
  ["GlobalTheory.Mem.Top.GroupRetwisting.recAtG_of_two_passes"]),
 (IW+"ExistsLayeredDataOfGoodScaleContextsStatement.lean", "e6f2235540e143085de5f14a8c665e9ff3904b12",
  ["GlobalTheory.Fc.recExP_of_recAtG"]),
 (GI+"ExistsObjectsOfAdmissibleTwistDatumStatement.lean", "6affb81887f300406155545eff5355dbe4721d91",
  ["theorem _root_.GlobalTheory.T.existsObjects_of_admissibleTwistDatum : ∀ QO : Par → ∀ D : D7, Obj D → Prop, LevelPrime → RecExP QO → ObjCP (fun κ => DC.withObj (ptO (QO κ)))"]),
 (GI+"WorkingClassesFrozen.lean", "9214062323b4b136b07ed8b08e03a509c1f3afc4",
  ["theorem working_classes_frozen :", "(tameDistinctF_iff Fm).1 h15", "(codeUpF_iff Fm 3 CH).1 h17"]),
 (TP+"NonemptyHypsOfAllRows.lean", "6a09205dfc3e57486ecbc27517072f3c27f09a51",
  ["UpperTheory.Top.classSel hP (fun D => hU D) KP Q Q' _root_.GlobalTheory.Fc.BundleCondition Lk _",
   "hEx := fun hM la G hla hH => working_classes_frozen.2 _ _ (fun hM' => hE hM' la G hla hH) hM"]),
 (TP+"TopShapeAlt.lean", "0c6a19a019a55bd4e8b070c0384d8840cf4cd890",
  ["def TopShapeAlt (V NR : Prop) (N : FamClass → Prop) (G : Prop) : Prop :=", "(hEx : MinkDiv → UpperTheory.Top.ExS 𝒜 cT)"]),
 (TP+"TopShape.lean", "3f791ca182db235c4a8ff582d3f038019320d5cd",
  ["_root_.GlobalTheory.Top.designExists_of_tuSize_aux4n_litThin (fun Fm => 𝒜 Fm ∧ G.cls la Fm) cT (fun hM => hEx hM la G hla hH)",
   "UpperTheory.Top.topDesWin (WithChN 𝒜) (WithChN fun Fm => 𝒜 Fm ∧ G.cls la Fm) (G.cls la) 2 3 2 0 hE"]),
 (TP+"LinkEx.lean", "e28c35e57535a15a17a9dfc7f7c1ded20e38ff82",
  ["(hEx : MinkDiv → DesignChoices (WithTw 𝒜) 3 cT)", "designExists_of_choices (designChoices_upN (hEx minkowski_bound_rat)) hTu hProv"]),
 (SR+"DesignExistsOfChoices.lean", "bad4dbc2a133cf4211a8c044bcfa361c86b7c9cd",
  ["def DesignChoices (𝒞 : FamClass) (C0 : ℝ) (cT : ℝ → ℝ → ℝ) : Prop :=", "theorem designExists_of_choices",
   "ChosenCode Fm C0 CH ∧ BoxesF Fm ∧ QDRowsF Fm ∧ DGamDvdF Fm ∧ cT eps Fm.CYL ≤ Fm.CTu ∧"]),
 (CB+"DesWin.lean", "94820ef32775f43f41c61da2b892a121d0549b86",
  ["theorem topDesWin", "obtain ⟨ε3, hε3, hEx⟩ := hEx", "obtain ⟨Fm, CH, hc, -, hL, hCh, hT, hDG⟩ := hEx ε h0"]),
 ("src/Development/AutomorphicArithmetic/PrimeDiscriminants/Scales.lean", "c0ccc985076aaada625ebcf8696d5d0f187c57ac",
  ["structure Scales (la : ℝ) where", "windows : ∀ y : ℝ, ∃ Y : ℝ, y ≤ Y ∧ ∀ x : ℝ, Y ≤ x → x ≤ Y ^ la → x ∈ Win",
   "def Mem (S : Scales la) (s : Scale) : Prop := s.J = S.J ∧ s.x ∈ S.Win"]),
]

def blob_id(data: bytes) -> str:
    return hashlib.sha1(b"blob %d\0" % len(data) + data).hexdigest()

def main():
    ap = argparse.ArgumentParser(); ap.add_argument("--source-root", required=True); a = ap.parse_args()
    files = tokens = 0; bad = []
    for path, blob, toks in CHECKS:
        p = os.path.join(a.source_root, path)
        if not os.path.exists(p): bad.append(("missing", path)); continue
        data = open(p, "rb").read(); files += 1
        if blob_id(data) != blob: bad.append(("blob", path, blob_id(data)))
        text = data.decode("utf-8")
        for t in toks:
            tokens += 1
            if t not in text: bad.append(("token", path, t))
    print(json.dumps({"files_checked": files, "tokens_checked": tokens, "failures": bad}, ensure_ascii=False, indent=1))
    sys.exit(1 if bad else 0)

if __name__ == "__main__":
    main()
