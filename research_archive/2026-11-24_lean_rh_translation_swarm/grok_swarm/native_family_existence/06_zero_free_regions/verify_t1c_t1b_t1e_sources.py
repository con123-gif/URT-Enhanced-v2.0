#!/usr/bin/env python3
"""Source-match check for native_family_existence/06_zero_free_regions.
Usage: python3 verify_t1c_t1b_t1e_sources.py <upstream git repo containing pin> <full source checkout root (contains src/)>
For each cited file: (1) git blob id of the file at the pin (from the git repo's tree);
(2) git hash-object of the checkout file must equal it (so the checkout content IS the pinned content);
(3) each quoted token occurs verbatim. Also counts top-level `axiom` declarations and files
containing `sorry` across src/ of the checkout. Reads files only; builds nothing."""
import subprocess, sys, os, re
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
A = "src/Development/AbelianVarietyTheory/"
G = A + "Proofs/GlobalInterpolation/"
CHECKS = [
 (G + "LFunctionConjEqZero.lean",
  ["theorem zero_free_region : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ), χ ≠ 1 → LFunction χ s = 0 → (χ ^ 2 ≠ 1 ∨ s.im ≠ 0) → s.re < 1 - c / Real.log (q * (|s.im| + 2)) := by",
   "theorem inv_le_log : ∃ K : ℝ, 0 < K ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)\n    (δ γ : ℝ), χ ≠ 1 → LFunction χ (((1 - δ : ℝ) : ℂ) + γ * I) = 0 → (χ ^ 2 ≠ 1 ∨ γ ≠ 0) →\n    0 < δ → δ ≤ 1 / 21 → 1 / δ ≤ K * Real.log (q * (|γ| + 2)) := by",
   "theorem neg_re_logDeriv_le : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),\n    χ ≠ 1 → ∀ (σ t : ℝ), 1 < σ → σ ≤ 2 → ∀ S : Finset ℂ,\n    (∀ w ∈ S, ‖w - (3/2 + t * I)‖ ≤ 5/6 ∧ LFunction χ w = 0) →\n    -(deriv (LFunction χ) (σ + t * I) / LFunction χ (σ + t * I)).re\n      ≤ C * Real.log (q * (|t| + 2)) - ∑ w ∈ S, (1 / ((σ : ℂ) + t * I - w)).re := by",
   "theorem LFunction_conj_eq_zero {d : ℕ} [NeZero d] {χ : DirichletCharacter ℂ d} (h₁ : χ ≠ 1)\n    (h2 : χ ^ 2 = 1) {s : ℂ} (hs : LFunction χ s = 0) : LFunction χ (conj s) = 0 := by",
   "refine ⟨300 * (C0 + C1), by positivity, fun q _ χ δ γ hχ hρ hcase hδ hδ21 => ?_⟩",
   "by_cases hsmall : 2 * γ ^ 2 ≤ 81 * δ ^ 2",
   "have hlow : 2 / 27 * (1 / δ) ≤ T := by",
   "≤ 4 / 81 * (1 / δ) + 2 * C0 * L := by",
   "refine ⟨min (1 / (2 * K)) (1 / 42), by positivity, fun q _ χ s hχ hs hcase => ?_⟩",
   "by_cases hsmall : 1 - s.re ≤ 1 / 21",
   "obtain ⟨C, hC, hloc⟩ := GlobalTheory.LLocal.logDeriv_LFunction_local",
   "obtain ⟨C0, hC0, h0⟩ := GlobalTheory.PrincipalLogDeriv.neg_re_logDeriv_le"]),
 (G + "LogDerivativeBound.lean",
  ["theorem three_four_one : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (σ t : ℝ), 1 < σ → 0 ≤ -(3 * (deriv (LFunction (1 : DirichletCharacter ℂ q)) σ / LFunction (1 : DirichletCharacter ℂ q) σ).re + 4 * (deriv (LFunction χ) (σ + t * I) / LFunction χ (σ + t * I)).re + (deriv (LFunction (χ ^ 2)) (σ + 2 * t * I) / LFunction (χ ^ 2) (σ + 2 * t * I)).re) := by",
   "lemma comb_nonneg {z : ℂ} (hz : ‖z‖ = 1) : 0 ≤ 3 + 4 * z.re + (z ^ 2).re := by"]),
 (G + "ZeroFreePrincipal.lean",
  ["theorem _root_.GlobalTheory.ZeroFreePrincipal.zero_free : ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q] (s : ℂ),\n    s ≠ 1 → LFunction (1 : DirichletCharacter ℂ q) s = 0 →\n    s.re < 1 - c / Real.log (q * (|s.im| + 2)) := by",
   "private lemma exists_re_lt_one_sub_div_log_of_riemannZeta_eq_zero : ∃ c : ℝ, 0 < c ∧ ∀ s : ℂ,\n    riemannZeta s = 0 → 1 ≤ |s.im| → s.re < 1 - c / Real.log (|s.im| + 2) := by",
   "private lemma exists_riemannZeta_ne_zero_near_one_of_abs_im_le_one :\n    ∃ η : ℝ, 0 < η ∧ ∀ s : ℂ, s ≠ 1 → |s.im| ≤ 1 → 1 - η < s.re → riemannZeta s ≠ 0 := by",
   "obtain ⟨C, hC0, hC⟩ := _root_.GlobalTheory.ZetaLocal.logDeriv_riemannZeta_local",
   "set K : ℝ := 9 * C + 5 with hK", "refine ⟨1 / (28 * K), by positivity, fun s hs hγ => ?_⟩",
   "set δ : ℝ := 1 / (2 * K) with hδ", "have hfin : 7 * K * (δ + 1 / (28 * K)) = 15 / 4 := by",
   "(1 / z).re ≤ z.re := by",
   "let g : ℂ → ℂ := Function.update (fun s => (s - 1) * riemannZeta s) 1 1",
   "obtain ⟨δ, hδ, hsub⟩ := hK.exists_thickening_subset_open hU hKU",
   "refine ⟨min (min c1 (η / 2)) (1 / 2), by positivity, fun q _ s hs hL => ?_⟩",
   "LFunctionTrivChar_eq_mul_riemannZeta hs",
   "_root_.GlobalTheory.logDerivativeThreeFourOne.three_four_one 1 (1 : DirichletCharacter ℂ 1) σ t hσ"]),
 (G + "LogDerivRiemannZetaLocalZeroSum.lean",
  ["theorem logDeriv_riemannZeta_local : ∃ C : ℝ, 0 < C ∧ ∀ (t : ℝ) (s : ℂ), ‖s - (3/2 + t * I)‖ ≤ 2/3 → s ≠ 1 → riemannZeta s ≠ 0 →",
   "obtain ⟨C, hC, H⟩ := GlobalTheory.LogDerivZeros.main (2/3) (5/6) (by norm_num) (by norm_num) (by norm_num)"]),
 (G + "DirichletLZerosEqPrimitiveCharacterZeros.lean",
  ["theorem _root_.GlobalTheory.Lin.zeros_eq_zeros_primitiveCharacter :\n    ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ), 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) →",
   "set E : ℂ → ℂ := fun z => ∏ p ∈ q.primeFactors, (1 - χ.primitiveCharacter p * (p : ℂ) ^ (-z))",
   "have h := LFunction_changeLevel χ.conductor_dvd_level χ.primitiveCharacter hz",
   "exact Real.rpow_lt_one_of_one_lt_of_neg (by exact_mod_cast hp1) (by linarith)",
   "analyticOrderAt_eq_zero.2 (Or.inr hEne), add_zero]"]),
 (G + "DirichletLZerosEqPrimitiveCharacterZerosStatement.lean",
  ["theorem _root_.GlobalTheory.T.dirichletL_zeros_eq_primitiveCharacter_zeros : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ), 0 < s.re → (χ ≠ 1 ∨ s ≠ 1) → haveI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩; (LFunction χ s = 0 ↔ LFunction χ.primitiveCharacter s = 0) ∧ ord χ s = ord χ.primitiveCharacter s := by",
   "exact @GlobalTheory.Lin.zeros_eq_zeros_primitiveCharacter"]),
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
