#!/usr/bin/env python3
"""Source-match check for native_family_existence/03_trust_boundary_lay_of_core.
Usage: python3 verify_trust_and_laycore.py <upstream git repo containing pin> <full source checkout root (contains src/)>
For each cited file: (1) git blob id of the file at the pin (from the git repo's tree);
(2) git hash-object of the checkout file must equal it (so the checkout content IS the pinned content);
(3) each quoted token occurs verbatim. Also counts top-level `axiom` declarations and files
containing `sorry` across src/ of the checkout. Reads files only; builds nothing."""
import subprocess, sys, os, re
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
A = "src/Development/AbelianVarietyTheory/"
T = "src/Development/AutomorphicArithmetic/"
CHECKS = [
 ("src/Main.lean", ["theorem riemannHypothesis : RiemannHypothesis := rhOfAll"]),
 # --- SmallPrimeOne
 (A+"Definitions/GlobalTwisting/LogCondLeThree.lean",
  ["def SmallPrimeOne : Prop := ∃ A : ℝ, 1 ≤ A ∧ ∀ M : ℕ, 2 ≤ M → ∃ p : ℕ, p.Prime ∧ p % M = 1 ∧ (p : ℝ) ≤ (M : ℝ) ^ A"]),
 (T+"CharacterBoxes/ObjCTrue.lean",
  ["theorem recS (QO : Par → ∀ D : D7, Obj D → Prop)",
   "have hS : SmallPrimeOne := GlobalTheory.EX.smallPrimeOne_of_primesRel GlobalTheory.Lin.primesRel_holds",
   "(hostQ hS la G hH)"]),
 (A+"Proofs/GlobalInterpolation/SmallPrimeOneOfPrimesRel.lean",
  ["theorem smallPrimeOne_of_primesRel : GlobalTheory.Lin.PrimesRel → SmallPrimeOne := by"]),
 (A+"Proofs/GlobalInterpolation/PrimesInProgressionsRelativeError.lean",
  ["theorem primesRel_holds : GlobalTheory.Lin.PrimesRel := by",
   "GlobalTheory.T.exceptionalDirichletZero_unique_zeroFreeRegion",
   "GlobalTheory.T.chebyshevPsiProgression_relative_error",
   "GlobalTheory.T.primeCount_relative_error_of_psi_relative_error"]),
 (A+"Proofs/GlobalInterpolation/ExceptionalDirichletZeroUniqueZeroFreeRegionStatement.lean",
  ["exact @GlobalTheory.ExceptionalPair.main"]),
 (A+"Proofs/GlobalInterpolation/ChebyshevPsiProgressionRelativeErrorStatement.lean",
  ["exact @GlobalTheory.Lin.PsiRel.psiAP_relative"]),
 (A+"Proofs/GlobalInterpolation/PrimeCountRelativeErrorOfPsiRelativeErrorStatement.lean",
  ["exact @GlobalTheory.Lin.pi_rel_of_psi_rel"]),
 (A+"Proofs/GlobalInterpolation/SmallPrimeOneOfTzRat.lean",
  ["theorem smallPrimeOne_of_tzRat : GlobalTheory.Mem.An.TZRat → SmallPrimeOne := by"]),
 # --- SiegelMassRatioCM
 ("src/Formalism/SharpRestriction/GlobalSchurBounds/StandardLattice.lean", ["def SiegelMassRatioCM : Prop :="]),
 (T+"CharacterBoxes/ClassSel.lean",
  ["theorem classSel : StandardLattice.SiegelMassRatioCM →",
   "refine recS (QOf (sAnd Q' R) Lk E) cT fun hm => ?_",
   "memberTop_final_contextParameters h1 h2"]),
 (A+"Proofs/IwasawaDecomposition/MemberTopFinalContextParameters.lean",
  ["GlobalTheory.T.existsLayeredData_of_goodScaleContexts hAll Q' QO"]),
 (T+"ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/NonemptyHypsOfAllRows.lean",
  ["theorem nonempty_hyps_of_allRows_alt : StandardLattice.SiegelMassRatioCM →", "UpperTheory.Top.classSel hP (fun D => hU D)"]),
 (T+"ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean",
  ["obtain ⟨hP, hMem, hEx⟩ := _root_.GlobalTheory.T.large_unramified_exponent_bundles_exist_alt P hR hL cDep A hA",
   "exact _root_.GlobalTheory.Fc.nonempty_hyps_of_allRows_alt hP"]),
 (T+"ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/MemberBundlesLargeUnramifiedExponents.lean",
  ["have hA := _root_.GlobalTheory.T.compatibleSystem_member_hypotheses", "exact ⟨hA.a18,"]),
 (T+"ThetaCorrespondence/ThetaPairLifts/LocalTypeDictionary/CompatibleSystemHypothesesOfLocalInputs.lean",
  ["theorem compatibleSystem_hypotheses_of_localInputs", "fd, GlobalTheory.Mass.massRatio_all_unramified_cmFields,"]),
 (T+"ThetaCorrespondence/ThetaPairLifts/LocalTypeDictionary/HypA.lean", ["a18 : StandardLattice.SiegelMassRatioCM"]),
 (A+"Proofs/GlobalInterpolation/MassRatioAllUnramifiedCmFields.lean",
  ["theorem massRatio_all_unramified_cmFields : StandardLattice.SiegelMassRatioCM :=",
   "Formalism.MainNotions.StandardLattice.standardMassRatio_of_modelMassRatio GlobalTheory.Mass.siegelMassRatio_holds"]),
 (A+"Proofs/FlagMeasures/SiegelMassRatioUnimodularDefinite.lean",
  ["theorem siegelMassRatio_holds : Formalism.HermitianLatticesTheory.SiegelMassRatio :=",
   "Formalism.HermitianLattices.Ext.L3.siegelMassRatio_of_LI binary_hermitian_represents Formalism.HermitianLattices.Ext.L3.liStat"]),
 ("src/Formalism/SharpRestriction/GlobalSchurBounds/ThickPlacesCorollaryOfAnyTranslate.lean",
  ["theorem standardMassRatio_of_modelMassRatio (h : SiegelMassRatioModels) : SiegelMassRatioCM := by"]),
 ("src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/UnimodularClassRepresentatives/SiegelMassRatioOfLI.lean",
  ["theorem siegelMassRatio_of_LI (hH : HermRepUnram) (hLI : LIStat) : Formalism.HermitianLatticesTheory.SiegelMassRatio := by"]),
 (A+"Proofs/FlagMeasures/BinaryHermitianRepresents.lean",
  ["theorem _root_.GlobalTheory.Mass.binary_hermitian_represents : _root_.Formalism.HermitianLattices.Ext.L3.HermRepUnram := by"]),
 ("src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/UnimodularClassRepresentatives/LiStatOf.lean",
  ["theorem liStat : LIStat := liStat_of liRatio liPin"]),
 # --- lay_of_core
 (A+"Proofs/IwasawaDecomposition/ExistsLayerParametersAdmissible.lean",
  ["theorem lay_of_core : Ev fun K => ∀ (X : Stages) (f : Fr X.B.toPre) (T : TwDat X.B) (c : V4.Core K X f T),",
   "ev_imp TamePow.tame_of_pow fun _ hK X _ _ c hv =>",
   "⟨c.del, c.etaF, untw c, fin c, (Full.dgam_pos_and_full X.toD7).1, (Full.dgam_pos_and_full X.toD7).2,",
   "hK X c.isOver c.chiT, c.col.mink, c.col.atT⟩, ledOK c hv, tupUsed c⟩",
   "duStar_def := (sizes_eq_count K X c.isOver hv c.dsig_eq).1",
   "theorem layObj_lay (c : V4.Core K X f T) (hv : StandardLattice.VolumeEqMass₂ X.toD7) : layObj (lay c hv) = c.O := rfl",
   "theorem tupUsed (c : V4.Core K X f T) : DQ.TupUsedAt X.toD7 := by",
   "theorem ledOK (c : V4.Core K X f T)"]),
 (A+"Definitions/GlobalTwisting/SetUnipotentTranslate.lean",
  ["structure RecOK (s : Scale) (C : FC) (cD : ℝ) (D : D7) : Prop where",
   "dgam : ∀ u, 0 < (D.mem u).C.DGam", "mink : DGamChoice_at D",
   "def LedOK (s : Scale) (C : FC) (cD ch : ℝ) {D : D7} (Y : Lay D)"]),
 (A+"Definitions/AutomorphicMembership/RationalRootsDef.lean",
  ["structure Core (K : Ctx) (X : Stages) (f : Fr X.B.toPre) (T : TwDat X.B) : Type 1 where",
   "chiT : ∀ (k : Fin 2) (v : X.N.nd.PlG k), ∃ w : (ZMod (X.B.host.g k))ˣ, orderOf w = X.B.host.g k - 1 ∧",
   "dsig_eq : ∀ τ, X.S.dsig τ = Vol.trueDsig X.B.R (X.B.hc τ)", "mtStable : DQ.MtStableAt X.toD7"]),
 (A+"Proofs/IwasawaDecomposition/FourMulRootLt.lean",
  ["theorem four_mul_root_lt {m k g : ℝ} (hm : 2 ≤ m) (hk : m + 3 ≤ k) (hg : k ^ 8 ≤ g) :",
   "4 * m * g ^ ((1 : ℝ) / 4) < g - 1 := by",
   "theorem bound_of_over (K : Ctx) (B : Pre) (h : K.Over B) (i : Fin 2) :",
   "theorem tame_of_pow : Ev fun K => ∀ X : Stages, K.Over X.B.toPre →",
   "refine ⟨1, one_pos, ?_⟩", "GlobalTheory.EX.DC.TameGen.tameDistinct_gen"]),
 (A+"Proofs/GlobalInterpolation/PowEqOfPartEq.lean",
  ["theorem tameDistinct_gen : ∀ (r g m : ℕ) [Fact g.Prime] (w : (ZMod g)ˣ), orderOf w = g - 1 → 4 * (m : ℝ) * (g : ℝ) ^ ((1 : ℝ) / 4) < (g : ℝ) - 1 → 1 ≤ r → DC.TameDistinct r g (fun j : Fin m => w ^ (2 * (j.1 + 1)))",
   "theorem pow_eq_of_part_eq", "theorem dvd_of_pow_eq", "refine Or.inr ⟨1, le_rfl, hr, hl, ?_⟩"]),
 (A+"Definitions/GlobalTwisting/AuxiliaryPrimeMemAvoidedPrimes.lean",
  ["def TameDistinct (r g : ℕ) [Fact g.Prime] {m : ℕ} (χ : Fin m → (ZMod g)ˣ) : Prop :="]),
 ("src/Formalism/CyclotomicNorms/StatementI.lean",
  ["def Exc (g d ℓ : ℕ) : Prop := ℓ.Prime ∧ g ^ d < ℓ ^ (4 * padicValNat ℓ (g ^ d - 1))",
   "def BB (N g : ℕ) : Set ℕ := {g} ∪ {ℓ | ∃ d, 1 ≤ d ∧ d ≤ N ∧ Exc g d ℓ}"]),
 (A+"Proofs/IwasawaDecomposition/ExistsNsmulMemOfSpan.lean",
  ["theorem dgam_pos_and_full : ∀ D : D7, (∀ u, 0 < (D.mem u).C.DGam) ∧", "(D.mem u).C.DGam_pos"]),
 (A+"Proofs/IwasawaDecomposition/SizesEqCount.lean",
  ["theorem sizes_eq_count (K : Ctx) (X : Stages) (hO : K.Over X.B.toPre) (hv : StandardLattice.VolumeEqMass₂ X.toD7)"]),
 (A+"Definitions/GlobalTwisting/FamilyClassSevenDutiesAndStableLattices.lean",
  ["def TupUsedAt (D : D7) : Prop := ∀ μ : D.what₂.Tup, DV.Used D μ"]),
]
def run(*a, cwd=None):
    return subprocess.run(list(a), capture_output=True, text=True, timeout=300, cwd=cwd)
def main():
    repo, root = sys.argv[1], sys.argv[2]
    fails = ntok = 0
    for path, toks in CHECKS:
        pin_blob = run("git", "-C", repo, "rev-parse", f"{PIN}:{path}").stdout.strip()
        fp = os.path.join(root, path)
        if not os.path.exists(fp):
            print(f"FAIL missing in checkout: {path}"); fails += 1; continue
        loc_blob = run("git", "hash-object", fp).stdout.strip()
        if not pin_blob or pin_blob != loc_blob:
            print(f"FAIL blob {path}: pin={pin_blob or '?'} checkout={loc_blob}"); fails += 1; continue
        txt = open(fp, encoding="utf-8").read()
        for t in toks:
            ntok += 1
            if t not in txt:
                print(f"FAIL token missing in {path}: {t!r}"); fails += 1
        print(f"ok   {pin_blob[:12]} {path} ({len(toks)} tokens)")
    # whole-tree comparison: checkout src/ vs pinned src/ (blob ids from both git trees)
    a = run("git", "-C", repo, "ls-tree", "-r", PIN, "src").stdout.splitlines()
    b = run("git", "-C", root, "ls-tree", "-r", "HEAD", "src").stdout.splitlines()
    pa = {l.split("\t")[1]: l.split()[2] for l in a}; pb = {l.split("\t")[1]: l.split()[2] for l in b}
    only_pin = sorted(set(pa) - set(pb)); only_co = sorted(set(pb) - set(pa))
    diff = sorted(p for p in set(pa) & set(pb) if pa[p] != pb[p])
    print(f"tree: pin src files={len(pa)} checkout src files={len(pb)} only_in_pin={only_pin} only_in_checkout={only_co} differing={len(diff)}")
    if only_pin or diff: fails += 1
    # comparator config of the original compiled environment (not part of the upstream pin)
    cj = os.path.join(root, "comparator.json")
    if os.path.exists(cj):
        c = open(cj, encoding="utf-8").read()
        ntok += 1
        tok = '"permitted_axioms": ["propext", "Quot.sound", "Classical.choice"]'
        cb = run("git", "hash-object", cj).stdout.strip()
        print(("ok  " if tok in c else "FAIL") + f" comparator.json (checkout HEAD {run('git','-C',root,'rev-parse','HEAD').stdout.strip()[:12]}, blob {cb[:12]}) permitted_axioms token")
        if tok not in c: fails += 1
    # global scans over the pinned-content checkout
    ax = run("rg", "-l", r"(^|\s)axiom\s+[^\s]+", "-g", "*.lean", os.path.join(root, "src")).stdout.split()
    so = run("rg", "-l", r"\bsorry\b|\badmit\b", "-g", "*.lean", os.path.join(root, "src")).stdout.split()
    print(f"scan: files with top-level `axiom` decl = {len(ax)}; files containing sorry/admit = {len(so)}: {[os.path.relpath(s, root) for s in so]}")
    print(f"files={len(CHECKS)} tokens={ntok} failures={fails}")
    sys.exit(1 if fails else 0)
main()
