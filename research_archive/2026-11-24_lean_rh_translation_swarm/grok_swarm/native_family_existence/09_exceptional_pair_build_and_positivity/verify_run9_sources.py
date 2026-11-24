#!/usr/bin/env python3
"""Source-match check for native_family_existence/09_exceptional_pair_build_and_positivity.
Usage: python3 verify_run9_sources.py <upstream git repo containing pin> <full source checkout root (contains src/)>
For each cited file: (1) git blob id of the file at the pin (from the git repo's tree);
(2) git hash-object of the checkout file must equal it (so the checkout content IS the pinned content);
(3) each quoted token occurs verbatim. Also counts top-level `axiom` declarations and files
containing `sorry` across src/ of the checkout. Reads files only; builds nothing."""
import subprocess, sys, os, re
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
A = "src/"
CHECKS = [
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/OrderNeTop.lean', ['theorem exists_bound : ∃ C : ℝ, 0 < C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),', '    (∀ β ∈ T, 2 / 3 ≤ β ∧ LFunction χ β = 0) →', '      - ∑ β ∈ T, (analyticOrderNatAt (LFunction χ) β : ℝ) / (σ - β) := by', 'obtain ⟨C, hC, hb⟩ := GlobalTheory.T.logDeriv_dirichletLFunction_local_zero_sum', 'obtain ⟨hfin, hbd⟩ := hb q χ hχ 0 σ hs hLσ', 'exact LFunction_ne_zero_of_one_le_re χ (.inl h) (not_lt.mp hc) hz', 'refine mul_nonneg (Nat.cast_nonneg _) (div_nonneg ?_ (Complex.normSq_nonneg _))']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NegSumLogDerivNonneg.lean', ['theorem neg_sum_logDeriv_nonneg : ∀ (q : ℕ) [NeZero q] (χ ψ : DirichletCharacter ℂ q) (σ : ℝ), χ ^ 2 = 1 → ψ ^ 2 = 1 → 1 < σ → 0 ≤ -((deriv (LFunction (1 : DirichletCharacter ℂ q)) σ / LFunction (1 : DirichletCharacter ℂ q) σ).re + (deriv (LFunction χ) σ / LFunction χ σ).re + (deriv (LFunction ψ) σ / LFunction ψ σ).re + (deriv (LFunction (χ * ψ)) σ / LFunction (χ * ψ) σ).re) := by', '    HasSum (fun n : ℕ => (χ n).re * (vonMangoldt n / (n : ℝ) ^ σ))', '    0 ≤ ((1 : DirichletCharacter ℂ q) a).re + (χ a).re + (ψ a).re + ((χ * ψ) a).re := by', 'rw [LSeries_twist_vonMangoldt_eq χ hs, ← deriv_LFunction_eq_deriv_LSeries χ hs,']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivativeBound.lean', ['lemma comb_nonneg {z : ℂ} (hz : ‖z‖ = 1) : 0 ≤ 3 + 4 * z.re + (z ^ 2).re := by', 'nlinarith [sq_nonneg (z.re + 1)]', 'theorem three_four_one : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (σ t : ℝ), 1 < σ → 0 ≤ -(3 * (deriv (LFunction (1 : DirichletCharacter ℂ q)) σ / LFunction (1 : DirichletCharacter ℂ q) σ).re + 4 * (deriv (LFunction χ) (σ + t * I)', 'have h := ((h1.mul_left 3).add (h2.mul_left 4)).add h3', 'have k3 : (χ ^ 2) n * (vonMangoldt n : ℂ) / ((A : ℂ) * b ^ 2) = (c : ℂ) * (χ n / b) ^ 2 := by']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExceptionalDirichletZeroUniqueZeroFreeRegionStatement.lean', ['first | exact @GlobalTheory.ExceptionalPair.main | exact GlobalTheory.ExceptionalPair.main']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExceptionalDirichletZeroUniqueZeroFreeRegion.lean', ['namespace GlobalTheory.ExceptionalPair']),
 (A + 'Development/AbelianVarietyTheory/Definitions/GlobalTwisting/ZerosDisc.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DifferentiableAtFractInt.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DifferentiableAtMellinSummatory.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DirichletLZerosEqPrimitiveCharacterZeros.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DirichletLZerosEqPrimitiveCharacterZerosStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsDirichletLFunctionZeroGapNearOne.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsDirichletLFunctionZeroGapNearOneStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsFactorOrder.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsLeNormLFunctionOne.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsNormDerivLFunctionLe.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LFunctionConjEqZero.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LFunctionEqTsumOfOneLt.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivDirichletLFunctionLocalZeroSum.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivDirichletLFunctionLocalZeroSumStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivRiemannZetaLocalZeroSum.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivRiemannZetaLocalZeroSumStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NegReLogDerivPrincipalLFunctionLe.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NegReLogDerivPrincipalLFunctionLeStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NormOneSubConjMul.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/TsumOneDivRpowLe.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ZeroFreePrincipal.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ZetaEqSubIntegralFract.lean', []),  # build-closure module: blob compare only
 (A + 'Formalism/GL3MeanSquares/PrimeCountAsymptoticInProgressions.lean', []),  # build-closure module: blob compare only
 (A + 'Formalism/GL3MeanSquares/SmoothedRemainderRealIntegralFormula.lean', []),  # build-closure module: blob compare only
 (A + 'Formalism/LandauZeroFreeBounds/Statement.lean', []),  # build-closure module: blob compare only
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
