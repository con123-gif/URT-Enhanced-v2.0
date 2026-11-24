#!/usr/bin/env python3
"""Source-match check for native_family_existence/04_published_bundle_and_exceptional_pair.
Usage: python3 verify_t8_t1_sources.py <upstream git repo containing pin> <full source checkout root (contains src/)>
For each cited file: (1) git blob id of the file at the pin (from the git repo's tree);
(2) git hash-object of the checkout file must equal it (so the checkout content IS the pinned content);
(3) each quoted token occurs verbatim. Also counts top-level `axiom` declarations and files
containing `sorry` across src/ of the checkout. Reads files only; builds nothing."""
import subprocess, sys, os, re
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
A = "src/Development/AbelianVarietyTheory/"
T = "src/Development/AutomorphicArithmetic/"
G = A + "Proofs/GlobalInterpolation/"
W = T + "ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/"
CHECKS = [
 ("src/Main.lean", ["theorem riemannHypothesis : RiemannHypothesis := rhOfAll"]),
 ("src/Supplements/Kernels/MainTheorems.lean", ["theorem allChi : UpperTheory.EveryCharacter := UpperTheory.FinalTheorems.everyCharacter",
   "theorem rhOfAll : RiemannHypothesis := Formalism.VW.rh_of_every allChi"]),
 (T + "CharacterBoxes/MainConclusion.lean",
  ["UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin ⟨h, UpperTheory.Zero.LLC.recTExists, h⟩ (UpperTheory.One.vwin_of_row h)",
   "UpperTheory.FinalTheorems.everyCharacter_of_row UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter"]),
 (T + "Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean",
  ["theorem galoisLocalGlobalStrong_recParameter : UpperTheory.GalStar.Row0b recT := galoisRepresentations_of_thetaLift UpperTheory.TP.K.tLiftK"]),
 (T + "Foundations/LocalLanglands/LocalCentralUnits/RecTExists.lean", ["theorem UpperTheory.Zero.LLC.recTExists :"]),
 (W + "EveryCharacterOfLiteratureOfVWin.lean",
  ["structure UpperTheory.LiteratureTheorems.OpenLiteratureStatements : Prop where",
   "caraianiLocalGlobalDual : _root_.UpperTheory.One.M.Row",
   "localLanglandsExists : _root_.UpperTheory.Zero.LLC.RecTExists",
   "galoisRepOfPolarizedPairLit : _root_.UpperTheory.One.M.Row",
   "theorem UpperTheory.LiteratureTheorems.published_results_eigen (O : _root_.UpperTheory.LiteratureTheorems.OpenLiteratureStatements) : _root_.GlobalTheory.Fc.S0.UnitaryGroupThirdPlaceHypotheses where",
   "theorem UpperTheory.LiteratureTheorems.every_character_of_literature_of_vWin (O : _root_.UpperTheory.LiteratureTheorems.OpenLiteratureStatements) (hV : UpperTheory.Top.VWin) : UpperTheory.EveryCharacter :=",
   "_root_.UpperTheory.Lit.every_character_of_theta_integrals_local_matching (_root_.UpperTheory.LiteratureTheorems.published_results_eigen O)",
   "theorem UpperTheory.LiteratureTheorems.local_langlands_recT_exists_of_literature (O : _root_.UpperTheory.LiteratureTheorems.OpenLiteratureStatements) : _root_.UpperTheory.Zero.LLC.RecTExists :=\n  O.localLanglandsExists"]),
 (G + "ExceptionalDirichletZeroUniqueZeroFreeRegion.lean",
  ["theorem main : ∃ c₀ : ℝ, 0 < c₀ ∧ ∀ c₁ : ℝ, 0 < c₁ → c₁ ≤ c₀ → ∃ c : ℝ, 0 < c ∧ ∀ (M : ℕ) [NeZero M], 3 ≤ M → (∀ (χ χ' : DirichletCharacter ℂ M) (β β' : ℝ), IsExc c₁ χ β → IsExc c₁ χ' β' → χ = χ' ∧ β = β') ∧ (∀ (χ : DirichletCharacter ℂ M) (β : ℝ), IsExc c₁ χ β → χ ≠ 1 ∧ 7 / 8 ≤ β ∧ LFunction χ β = 0 ∧ ord χ β = 1 ∧ c / ((M : ℝ) ^ 2 * Real.log M) ≤ 1 - β) ∧ ∀ (χ : DirichletCharacter ℂ M) (ρ : ℂ), ρ.re < 1 → LFunction χ ρ = 0 → (ρ.im = 0 ∧ IsExc c₁ χ ρ.re) ∨ ρ.re ≤ 1 - c / Real.log (M * (|ρ.im| + 2)) := by",
   "obtain ⟨cu, hcu, hU⟩ := GlobalTheory.RealZeroNearOne.main",
   "obtain ⟨cp, hcp, hP⟩ := GlobalTheory.ZeroFreePrincipal.zero_free",
   "obtain ⟨cz, hcz, hZ⟩ := GlobalTheory.ZeroFreeComplex.zero_free_region",
   "obtain ⟨cs, hcs, hS⟩ := GlobalTheory.T.exists_dirichletLFunction_zero_gap_near_one",
   "refine ⟨min (1 / 8) (min (cu / 2) (cp / 2)),",
   "set c := min c₁ (min cz (min cp (cs / 2))) with hcdef",
   "by_cases hreal : χ ^ 2 = 1 ∧ ρ.im = 0", "by_cases hbig : 1 - c₁ / Real.log M < ρ.re",
   "analyticOrderAt_eq_one_of_zero_deriv_ne_zero"]),
 (G + "ExceptionalDirichletZeroUniqueZeroFreeRegionStatement.lean", ["exact @GlobalTheory.ExceptionalPair.main"]),
 (A + "Definitions/GlobalTwisting/ZerosDisc.lean",
  ["def IsExc (c₁ : ℝ) {M : ℕ} [NeZero M] (χ : DirichletCharacter ℂ M) (β : ℝ) : Prop :=",
   "χ ^ 2 = 1 ∧ 1 - c₁ / Real.log M < β ∧ β < 1 ∧",
   "DirichletCharacter.LFunction χ.primitiveCharacter β = 0",
   "analyticOrderNatAt (DirichletCharacter.LFunction χ) ρ"]),
 (G + "OrderNeTop.lean",
  ["theorem main : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ ψ : DirichletCharacter ℂ q) (β β' : ℝ), χ ≠ 1 → ψ ≠ 1 → χ ^ 2 = 1 → ψ ^ 2 = 1 → 1 - c / Real.log (2 * q) ≤ β → 1 - c / Real.log (2 * q) ≤ β' → LFunction χ β = 0 → LFunction ψ β' = 0 → χ = ψ ∧ β = β' ∧ deriv (LFunction χ) β ≠ 0 := by",
   "namespace GlobalTheory.RealZeroNearOne"]),
 (G + "ZeroFreePrincipal.lean",
  ["theorem _root_.GlobalTheory.ZeroFreePrincipal.zero_free : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (s : ℂ),",
   "s ≠ 1 → LFunction (1 : DirichletCharacter ℂ q) s = 0 →", "exists_re_lt_one_sub_div_log_of_riemannZeta_eq_zero"]),
 (G + "LFunctionConjEqZero.lean",
  ["theorem zero_free_region : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ), χ ≠ 1 → LFunction χ s = 0 → (χ ^ 2 ≠ 1 ∨ s.im ≠ 0) → s.re < 1 - c / Real.log (q * (|s.im| + 2)) := by",
   "namespace GlobalTheory.ZeroFreeComplex"]),
 (G + "ExistsDirichletLFunctionZeroGapNearOneStatement.lean",
  ["theorem _root_.GlobalTheory.T.exists_dirichletLFunction_zero_gap_near_one : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (ρ : ℂ), (χ ≠ 1 ∨ ρ ≠ 1) → LFunction χ ρ = 0 → |ρ.im| ≤ 1 → c / ((q : ℝ) ^ 2 * Real.log (3 * q)) ≤ 1 - ρ.re := by"]),
 (G + "DirichletLZerosEqPrimitiveCharacterZerosStatement.lean",
  ["theorem _root_.GlobalTheory.T.dirichletL_zeros_eq_primitiveCharacter_zeros : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ), 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) →"]),
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
