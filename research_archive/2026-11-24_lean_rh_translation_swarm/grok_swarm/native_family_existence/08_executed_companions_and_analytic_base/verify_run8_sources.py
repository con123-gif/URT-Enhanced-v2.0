#!/usr/bin/env python3
"""Source-match check for native_family_existence/08_executed_companions_and_analytic_base.
Usage: python3 verify_run8_sources.py <upstream git repo containing pin> <full source checkout root (contains src/)>
For each cited file: (1) git blob id of the file at the pin (from the git repo's tree);
(2) git hash-object of the checkout file must equal it (so the checkout content IS the pinned content);
(3) each quoted token occurs verbatim. Also counts top-level `axiom` declarations and files
containing `sorry` across src/ of the checkout. Reads files only; builds nothing."""
import subprocess, sys, os, re
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
A = "src/"
CHECKS = [
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsFactorOrder.lean', ['theorem exists_factor_order {U : Set ℂ} {g : ℂ → ℂ} (hg : AnalyticOnNhd ℂ g U) {w : ℂ}', '      (∀ z : ℂ, g z = (z - w) ^ analyticOrderNatAt g w * h z) ∧ h w ≠ (0 : ℂ) := by', 'refine ⟨fun z => if z = w then h0 w else g z / (z - w) ^ n, ?_, ?_, ?_⟩']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivRiemannZetaLocalZeroSum.lean', ['    ‖riemannZeta₁ (3/2 + t * I + z)‖ ≤ 5 * (|t| + 2) ^ 2 := by', 'have h3 := GlobalTheory.ZetaHalfPlane.norm_zeta_sub_le w (by linarith) h', 'lemma le_norm_zeta₁ (t : ℝ) : 1 / 6 ≤ ‖riemannZeta₁ (3/2 + t * I)‖ := by', 'have : 1 + Real.log (5 * T ^ 2 / ‖riemannZeta₁ c‖) ≤ 9 * Real.log T := by linarith', 'import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.DifferentiableAtFractInt']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DifferentiableAtFractInt.lean', ['    ∀ s : ℂ, 0 < s.re → s ≠ 1 → ‖riemannZeta s - s / (s - 1)‖ ≤ ‖s‖ / s.re := by', 'lemma norm_fractInt_le {s : ℂ} (hs : 0 < s.re) : ‖fractInt s‖ ≤ 1 / s.re := by', '  ∫ t in Ioi (1 : ℝ), ((Int.fract t : ℝ) : ℂ) * (t : ℂ) ^ (-(s + 1))', 'have heq := hf.eqOn_of_preconnected_of_eventuallyEq hg']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ZetaEqSubIntegralFract.lean', ['theorem zeta_eq_sub_integral_fract :', 'have key := LSeries_eq_mul_integral_of_nonneg (fun _ ↦ (1 : ℝ)) zero_le_one hs hO (fun _ ↦ zero_le_one)']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NormSubOneMulRiemannZetaLe.lean', ['      ‖(s - 1) * riemannZeta s‖ ≤ C * (‖s‖ + 2) ^ 5 := by', '    ‖emE a s‖ ≤ (‖s‖ + 2) ^ 4 * a ^ (-(9/8 : ℝ)) := by', 'refine ⟨3 + K, by linarith, fun s hs h1 => ?_⟩', 'have h3 : ‖emT 1 s‖ ≤ 1 + R / 2 + R * R / 12 := by']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/TsumOneDivRpowLe.lean', ["    ∑' n : ℕ, 1 / ((n : ℝ) + 1) ^ σ ≤ σ / (σ - 1) := by", 'have hprod := DirichletCharacter.LSeries.mul_mu_eq_one χ hs', '    (hs : 1 < s.re) : (s.re - 1) / s.re ≤ ‖LFunction χ s‖ := by']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DifferentiableAtMellinSummatory.lean', ['    ∀ s : ℂ, 0 < s.re → ‖LFunction χ s‖ ≤ q * ‖s‖ / s.re := by', '    ‖∑ k ∈ Finset.Icc 1 n, χ (k : ZMod q)‖ ≤ q := by', '    ‖mellin (summatory f) (-s)‖ ≤ C / s.re := by', '    LFunction χ s = s * mellin (summatory fun n => χ (n : ZMod q)) (-s) := by']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LFunctionEqTsumOfOneLt.lean', ['        ≤ 2 * q * (1 + ‖s‖ / s.re) * (N : ℝ) ^ (-s.re) := by', '    _ = q * (1 + ‖s‖ / s.re) * ((N + 1 : ℕ) : ℝ) ^ (-s.re) := by ring', '    ‖(a : ℂ) ^ (-s) - (b : ℂ) ^ (-s)‖ ≤ ‖s‖ / δ * (a ^ (-δ) - b ^ (-δ)) := by', "    {s : ℂ} (hs : 0 < s.re) : LFunction χ s = ∑' n, term χ n s := by"]),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogFreeZeroDensityDirichletOneModulus.lean', ['  obtain ⟨η, hη, H1⟩ := principal_height', '  obtain ⟨a, D, C, C3, r0, K0, η, ha, hD, hC, hC3, hr0, hη, H⟩ := count_param']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExplicitFormulaDirichletZerosRightHalf.lean', ['  obtain ⟨B, hB, HB⟩ := recip_bound']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DensityAndRegions.lean', ['obtain ⟨c, hc, H2, H3⟩ := GlobalTheory.ZeroFreeHalf.main GlobalTheory.LandauPageRegion.main']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ImportsFurther.lean', ['obtain ⟨C, c, hC, hc, H⟩ := density_and_regions']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/PrimesInProgressionsRelativeError.lean', ["obtain ⟨a', ha', hA'⟩ := GlobalTheory.T.chebyshevPsiProgression_relati"]),
 (A + 'Development/AutomorphicArithmetic/ThetaCorrespondence/Linnik.lean', ['exists_prime_modEq_le_rpow_of_primesRel GlobalTheory.T.primesInProgressions_relat', 'theorem linnik : GlobalTheory.Published.Linnik := by']),
 (A + 'Development/AutomorphicArithmetic/ShortNorms/Primes.lean', ['theorem UpperTheory.T3.smallOne : UpperTheory.T3.SmallOne := UpperTheory.T3.smallOne_of GlobalTheory.T.primesInProgress']),
 (A + 'Development/AutomorphicArithmetic/CharacterBoxes/ObjCTrue.lean', ['have hS : SmallPrimeOne := GlobalTheory.EX.smallPrimeOne_of_primesRel GlobalTheory.Lin.primesRel_holds']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/IteratedDerivLogDerivDirichletLViaNearbyZeros.lean', ['obtain ⟨B, hB, G⟩ := ZetaLeft.norm_sub_one_mul_riemannZeta_le']),
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ImportsMore.lean', ['obtain ⟨B, hB, hBl⟩ := GlobalTheory.ZetaLeft.norm_sub_one_mul_riemannZeta_le']),
 (A + 'Development/AbelianVarietyTheory/Definitions/GlobalTwisting/ZerosDisc.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DirichletLZerosEqPrimitiveCharacterZeros.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/DirichletLZerosEqPrimitiveCharacterZerosStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsDirichletLFunctionZeroGapNearOne.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsDirichletLFunctionZeroGapNearOneStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsLeNormLFunctionOne.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ExistsNormDerivLFunctionLe.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LFunctionConjEqZero.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivDirichletLFunctionLocalZeroSum.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivDirichletLFunctionLocalZeroSumStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivRiemannZetaLocalZeroSumStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/LogDerivativeBound.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NegReLogDerivPrincipalLFunctionLe.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NegReLogDerivPrincipalLFunctionLeStatement.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NegSumLogDerivNonneg.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/NormOneSubConjMul.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/OrderNeTop.lean', []),  # build-closure module: blob compare only
 (A + 'Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/ZeroFreePrincipal.lean', []),  # build-closure module: blob compare only
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
