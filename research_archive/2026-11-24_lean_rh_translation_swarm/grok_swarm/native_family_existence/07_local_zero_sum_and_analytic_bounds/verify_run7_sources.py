#!/usr/bin/env python3
"""Source-match check for native_family_existence/07_local_zero_sum_and_analytic_bounds.
Usage: python3 verify_run7_sources.py <upstream git repo containing pin> <full source checkout root (contains src/)>
For each cited file: (1) git blob id of the file at the pin (from the git repo's tree);
(2) git hash-object of the checkout file must equal it (so the checkout content IS the pinned content);
(3) each quoted token occurs verbatim. Also counts top-level `axiom` declarations and files
containing `sorry` across src/ of the checkout. Reads files only; builds nothing."""
import subprocess, sys, os, re
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
A = "src/Development/AbelianVarietyTheory/"
G = A + "Proofs/GlobalInterpolation/"
CHECKS = [
 (G + "NormOneSubConjMul.lean",
  ["theorem main : ∀ r R : ℝ, 0 < r → r < R → R < 1 → ∃ C : ℝ, 0 < C ∧ ∀ (f : ℂ → ℂ) (M : ℝ), AnalyticOnNhd ℂ f (Metric.closedBall 0 1) → f 0 ≠ 0 → (∀ z ∈ Metric.closedBall (0 : ℂ) 1, ‖f z‖ ≤ M) → ({w : ℂ | ‖w‖ ≤ R ∧ f w = 0}.Finite ∧ (∑ᶠ w ∈ {w : ℂ | ‖w‖ ≤ R ∧ f w = 0}, (analyticOrderNatAt f w : ℝ)) ≤ C * (1 + Real.log (M / ‖f 0‖))) ∧ ∀ z : ℂ, ‖z‖ ≤ r → f z ≠ 0 → ‖deriv f z / f z - ∑ᶠ w ∈ {w : ℂ | ‖w‖ ≤ R ∧ f w = 0}, (analyticOrderNatAt f w : ℂ) / (z - w)‖ ≤ C * (1 + Real.log (M / ‖f 0‖)) := by",
   "namespace GlobalTheory.LogDerivZeros",
   "    ‖deriv g z / g z‖ ≤ (8 * R / (R - r) ^ 2) * K := by",
   "have h1 := Complex.borelCaratheodory_zero hK hhd hre hR hu' hh0",
   "    ‖1 - (starRingEnd ℂ) w * z‖ = ‖z - w‖ := by",
   "refine ⟨c1⁻¹ + A * (1 + c1⁻¹ * c2), by positivity, ?_⟩",
   "set c1 := -Real.log R with hc1d", "set c2 := -Real.log (1 - R) with hc2d",
   "set A := 8 * R / (R - r) ^ 2 with hAd",
   "exact @_root_.GlobalTheory.FactorOrderExistence.exists_factor_order",
   "have hK : 0 < 1 + L + N * c2 := by positivity"]),
 (G + "NegReLogDerivPrincipalLFunctionLe.lean",
  ["theorem neg_re_logDeriv_le : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (σ t : ℝ), 1 < σ → σ ≤ 2 → -(deriv (LFunction (1 : DirichletCharacter ℂ q)) (σ + t * I) / LFunction (1 : DirichletCharacter ℂ q) (σ + t * I)).re ≤ (1 / ((σ : ℂ) + t * I - 1)).re + C * Real.log (q * (|t| + 2)) := by",
   "obtain ⟨C, hC, hZ⟩ := GlobalTheory.T.logDeriv_riemannZeta_local_zero_sum",
   "refine ⟨C + 1, by linarith, ?_⟩",
   "    ‖(p : ℂ) ^ (-s)‖ ≤ 1 / 2 := by",
   "    ∑ p ∈ q.primeFactors, Real.log p ≤ Real.log q := by",
   "exact LFunctionTrivChar_eq_mul_riemannZeta hz"]),
 (G + "LogDerivDirichletLFunctionLocalZeroSum.lean",
  ["obtain ⟨C, hC, H⟩ := GlobalTheory.LogDerivZeros.main (2/3) (5/6) (by norm_num) (by norm_num) (by norm_num)",
   "refine ⟨6 * C, by positivity, ?_⟩",
   "have := GlobalTheory.LLower.norm_LFunction_ge q χ c (by rw [hcre]; norm_num)",
   "refine (GlobalTheory.LGrowth.norm_LFunction_le q χ hχ (c + z) (by linarith)).trans ?_",
   "‖LFunction χ (c + z)‖ ≤ q * (2 * |t| + 5) := by"]),
 (G + "LogDerivRiemannZetaLocalZeroSum.lean",
  ["obtain ⟨C, hC, H⟩ := GlobalTheory.LogDerivZeros.main (2/3) (5/6) (by norm_num) (by norm_num) (by norm_num)",
   "obtain ⟨⟨hfin, -⟩, H2⟩ := H (fun z => riemannZeta₁ (c + z)) (5 * (|t| + 2) ^ 2)"]),
 (G + "DifferentiableAtMellinSummatory.lean",
  ["    ∀ s : ℂ, 0 < s.re → ‖LFunction χ s‖ ≤ q * ‖s‖ / s.re := by"]),
 (G + "TsumOneDivRpowLe.lean",
  ["    (hs : 1 < s.re) : (s.re - 1) / s.re ≤ ‖LFunction χ s‖ := by"]),
 (G + "ExistsNormDerivLFunctionLe.lean",
  ["refine ⟨336 * Real.exp 2, by positivity, fun q _ χ hχ σ h1 h2 => ?_⟩",
   "    ‖LFunction χ s‖ ≤ 84 * Real.exp 2 * Real.log (3 * q) := by",
   "have ht := GlobalTheory.DirichletTail.norm_LFunction_sub_sum_le q χ hχ s hs q hq",
   "exact harmonic_le_one_add_log q",
   "have hr : 0 < 1 / L / 4 := by positivity",
   "have hL : 1.38 ≤ Real.log (3 * q) := by"]),
 (G + "LFunctionEqTsumOfOneLt.lean",
  ["        ≤ 2 * q * (1 + ‖s‖ / s.re) * (N : ℝ) ^ (-s.re) := by"]),
 (G + "ExistsLeNormLFunctionOne.lean",
  ["    (h2 : χ ^ 2 = 1) : 1 / (36 * (q : ℝ)) ≤ ‖LFunction χ 1‖ := by",
   "noncomputable def wt (x : ℝ) : ℝ := x⁻¹ - (Real.exp x - 1)⁻¹",
   "    (M : ℝ) / 3 ≤ ‖∑' d : ℕ, χ ((d + 1 : ℕ) : ZMod q) *",
   "    ‖∑ n ∈ Finset.range N, χ ((n + 1 : ℕ) : ZMod q)‖ ≤ q := by",
   "    (hm : m ≠ 0) : 1 ≤ zetaMul χ (m ^ 2) := by",
   "have h1 := lambert_lower h2 (M := 6 * q) (by omega)",
   "have h7 : (1 / 3 : ℝ) ≤ Real.exp (-1) := by linarith [Real.exp_neg_one_gt_d9]",
   "refine (abel_bound _ b q (char_sum_bound χ hχ) hb hb0 N).trans ?_"]),
 (G + "ZeroFreePrincipal.lean",
  ["refine ⟨min (min c1 (η / 2)) (1 / 2), by positivity, fun q _ s hs hL => ?_⟩",
   "obtain ⟨δ, hδ, hsub⟩ := hK.exists_thickening_subset_open hU hKU"]),
 (G + "ExceptionalDirichletZeroUniqueZeroFreeRegion.lean", ["obtain ⟨cp, hcp, hP⟩ := GlobalTheory.ZeroFreePrincipal.zero_free"]),
 (G + "ExistsDirichletLFunctionZeroGapNearOne.lean", ["obtain ⟨e, he, He⟩ := GlobalTheory.ZeroFreePrincipal.zero_free"]),
 (G + "InRegionMono.lean", ["obtain ⟨c₃, hc₃, hC⟩ := GlobalTheory.ZeroFreePrincipal.zero_free", "theorem main : Formalism.ZeroFreeDirichlet.ZFRDirichlet := by"]),
 (G + "LogFreeZeroDensityDirichletOneModulus.lean", ["obtain ⟨c, hc, H⟩ := GlobalTheory.ZeroFreePrincipal.zero_free"]),
 (G + "ChebyshevPsiProgressionRelativeError.lean", ["obtain ⟨c₀, hc₀, hX⟩ := GlobalTheory.T.exceptionalDirichletZero_unique_zeroFreeRegion"]),
 (G + "PrimesInProgressionsRelativeError.lean", ["obtain ⟨a, ha, hA⟩ := GlobalTheory.T.exceptionalDirichletZero_unique_zeroFreeRegion", "theorem primesRel_holds : GlobalTheory.Lin.PrimesRel := by"]),
 (G + "ExplicitFormulaDirichletZerosRightHalf.lean", ["obtain ⟨c, hc, H₂⟩ := GlobalTheory.T.exists_dirichletLFunction_zero_gap_near_one"]),
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
