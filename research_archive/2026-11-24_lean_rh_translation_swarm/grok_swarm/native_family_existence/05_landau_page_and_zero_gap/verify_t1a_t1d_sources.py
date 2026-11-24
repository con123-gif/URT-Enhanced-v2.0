#!/usr/bin/env python3
"""Source-match check for native_family_existence/05_landau_page_and_zero_gap.
Usage: python3 verify_t1a_t1d_sources.py <upstream git repo containing pin> <full source checkout root (contains src/)>
For each cited file: (1) git blob id of the file at the pin (from the git repo's tree);
(2) git hash-object of the checkout file must equal it (so the checkout content IS the pinned content);
(3) each quoted token occurs verbatim. Also counts top-level `axiom` declarations and files
containing `sorry` across src/ of the checkout. Reads files only; builds nothing."""
import subprocess, sys, os, re
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
A = "src/Development/AbelianVarietyTheory/"
G = A + "Proofs/GlobalInterpolation/"
CHECKS = [
 (G + "OrderNeTop.lean",
  ["theorem main : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ ψ : DirichletCharacter ℂ q) (β β' : ℝ), χ ≠ 1 → ψ ≠ 1 → χ ^ 2 = 1 → ψ ^ 2 = 1 → 1 - c / Real.log (2 * q) ≤ β → 1 - c / Real.log (2 * q) ≤ β' → LFunction χ β = 0 → LFunction ψ β' = 0 → χ = ψ ∧ β = β' ∧ deriv (LFunction χ) β ≠ 0 := by",
   "theorem exists_bound : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),\n    χ ≠ 1 → ∀ σ : ℝ, 1 < σ → σ ≤ 2 → ∀ T : Finset ℝ,\n    (∀ β ∈ T, 2 / 3 ≤ β ∧ LFunction χ β = 0) →\n    -(deriv (LFunction χ) σ / LFunction χ σ).re ≤ C * Real.log (2 * q)\n      - ∑ β ∈ T, (analyticOrderNatAt (LFunction χ) β : ℝ) / (σ - β) := by",
   "obtain ⟨C1, hC1, h1⟩ := GlobalTheory.T.neg_re_logDeriv_principalLFunction_le",
   "obtain ⟨C, hC, hb⟩ := GlobalTheory.T.logDeriv_dirichletLFunction_local_zero_sum",
   "set K := C1 + 3 * C2 with hKdef", "set ε : ℝ := min (1 / 2) (1 / (4 * K)) with hεdef",
   "refine ⟨ε / 8, by positivity, ?_⟩", "set σ : ℝ := 1 + ε / L with hσdef",
   "GlobalTheory.TwoRealCharacters.neg_sum_logDeriv_nonneg q χ ψ σ hχ2 hψ2 hσ1",
   "have hBχψ := h2 q (χ * ψ) hcψ σ hσ1 hσ2 ∅ (by simp)",
   "have hsL : (σ - β) * L ≤ ε + ε / 8 := by",
   "LFunction_ne_zero_of_one_le_re χ (.inl h) (by norm_num)"]),
 (G + "NegSumLogDerivNonneg.lean",
  ["theorem neg_sum_logDeriv_nonneg : ∀ (q : ℕ) [NeZero q] (χ ψ : DirichletCharacter ℂ q) (σ : ℝ), χ ^ 2 = 1 → ψ ^ 2 = 1 → 1 < σ → 0 ≤ -((deriv (LFunction (1 : DirichletCharacter ℂ q)) σ / LFunction (1 : DirichletCharacter ℂ q) σ).re + (deriv (LFunction χ) σ / LFunction χ σ).re + (deriv (LFunction ψ) σ / LFunction ψ σ).re + (deriv (LFunction (χ * ψ)) σ / LFunction (χ * ψ) σ).re) := by",
   "HasSum (fun n : ℕ => (χ n).re * (vonMangoldt n / (n : ℝ) ^ σ))",
   "0 ≤ ((1 : DirichletCharacter ℂ q) a).re + (χ a).re + (ψ a).re + ((χ * ψ) a).re := by",
   "LSeries_twist_vonMangoldt_eq χ hs"]),
 (G + "LogDerivDirichletLFunctionLocalZeroSumStatement.lean",
  ["theorem _root_.GlobalTheory.T.logDeriv_dirichletLFunction_local_zero_sum : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ ≠ 1 → ∀ (t : ℝ) (s : ℂ), ‖s - (3/2 + t * I)‖ ≤ 2/3 → LFunction χ s ≠ 0 → {w : ℂ | ‖w - (3/2 + t * I)‖ ≤ 5/6 ∧ LFunction χ w = 0}.Finite ∧ ‖deriv (LFunction χ) s / LFunction χ s - ∑ᶠ w ∈ {w : ℂ | ‖w - (3/2 + t * I)‖ ≤ 5/6 ∧ LFunction χ w = 0}, (analyticOrderNatAt (LFunction χ) w : ℂ) / (s - w)‖ ≤ C * Real.log (q * (|t| + 2)) := by",
   "exact @GlobalTheory.LLocal.logDeriv_LFunction_local"]),
 (G + "LogDerivDirichletLFunctionLocalZeroSum.lean",
  ["obtain ⟨C, hC, H⟩ := GlobalTheory.LogDerivZeros.main (2/3) (5/6) (by norm_num) (by norm_num) (by norm_num)"]),
 (G + "NegReLogDerivPrincipalLFunctionLeStatement.lean",
  ["theorem _root_.GlobalTheory.T.neg_re_logDeriv_principalLFunction_le : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (σ t : ℝ), 1 < σ → σ ≤ 2 → -(deriv (LFunction (1 : DirichletCharacter ℂ q)) (σ + t * I) / LFunction (1 : DirichletCharacter ℂ q) (σ + t * I)).re ≤ (1 / ((σ : ℂ) + t * I - 1)).re + C * Real.log (q * (|t| + 2)) := by",
   "exact @GlobalTheory.PrincipalLogDeriv.neg_re_logDeriv_le"]),
 (G + "ExistsDirichletLFunctionZeroGapNearOne.lean",
  ["theorem exists_gap : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (ρ : ℂ),\n    (χ ≠ 1 ∨ ρ ≠ 1) → LFunction χ ρ = 0 → |ρ.im| ≤ 1 →\n      c / ((q : ℝ) ^ 2 * Real.log (3 * q)) ≤ 1 - ρ.re := by",
   "obtain ⟨a, ha, Ha⟩ := GlobalTheory.LOneLower.exists_le_norm_LFunction_one",
   "obtain ⟨C, hC, HC⟩ := GlobalTheory.DirichletDeriv.exists_norm_deriv_LFunction_le",
   "obtain ⟨d, hd, Hd⟩ := GlobalTheory.ZeroFreeComplex.zero_free_region",
   "obtain ⟨e, he, He⟩ := GlobalTheory.ZeroFreePrincipal.zero_free",
   "refine ⟨min (min 1 (a / (4 * C))) (min d e), by positivity, ?_⟩",
   "by_cases h3 : 1 / Real.log (3 * q) ≤ 1 - ρ.re",
   "lemma log_le_sqrt {x : ℝ} (hx : 1 ≤ x) : Real.log (3 * x) ≤ 4 * √x := by",
   "have key := Convex.norm_image_sub_le_of_norm_deriv_le (𝕜 := ℂ) (f := LFunction χ)"]),
 (G + "ExistsDirichletLFunctionZeroGapNearOneStatement.lean", ["exact @GlobalTheory.ZeroGapNearOne.exists_gap"]),
 (G + "ExistsLeNormLFunctionOne.lean",
  ["theorem exists_le_norm_LFunction_one : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q]\n    (χ : DirichletCharacter ℂ q), χ ≠ 1 → χ ^ 2 = 1 →\n      c / (q : ℝ) ^ ((3 : ℝ) / 2) ≤ ‖LFunction χ 1‖ := by",
   "(h2 : χ ^ 2 = 1) : 1 / (36 * (q : ℝ)) ≤ ‖LFunction χ 1‖ := by",
   "refine ⟨1 / 36, by norm_num, fun q _ χ h1 h2 => le_trans ?_ (inv_le_norm_LFunction_one χ h1 h2)⟩"]),
 (G + "ExistsNormDerivLFunctionLe.lean",
  ["∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ ≠ 1 → ∀ σ : ℝ,\n      1 - 1 / Real.log (3 * q) ≤ σ → σ ≤ 1 →\n        ‖deriv (LFunction χ) σ‖ ≤ C * Real.log (3 * q) ^ 2 := by",
   "refine ⟨336 * Real.exp 2, by positivity, fun q _ χ hχ σ h1 h2 => ?_⟩"]),
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
