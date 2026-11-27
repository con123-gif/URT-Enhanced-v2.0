#!/usr/bin/env python3
"""RUN89: authenticated RUN88 endpoint replay in the existing compact workspace.

27 November 2026. PREPARED; not native executed in this session.
Source and seven axiom probes were retrieved and statically inspected, not elaborated.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 40aaf0afcc897a74d688bd6e9bae708428ffdabd,
ledger 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Shared C1 run 46055305146 job 140698522135 was still in progress on API read.
Local lean and lake were absent. No duplicate bootstrap, protected workflow edit,
or new claim of arithmetic closure. RUN88 is unchanged.

Correction to RUN88 handoff: Statements is a second independent import target;
building OneSidedCriterion alone is not a reliable clean-workspace replay.
Statements at the compact pin defines RiemannZetaZerosOnLine but proves no RH.
Build both targets, using the existing cache. The actual original one-sided
criterion and the primeError identity are probed separately; that is not
original-statement replacement of those declarations.

Original source-level path: star -> pointwise good data -> endpoint grid ->
chord and cover -> native one-sided criterion -> principal right -> reflection.
Reduced analytic replay begins at endpoint grid; it DOES NOT remove star,
the tail, or witness existence from the full proof. No old graph or axiom
evidence is overwritten. Native old-pin rh_scan/rh_prune/rh_auto are not
imported across incompatible source/toolchain pins. No full graph claimed.

RESUME HERE: after the current shared job releases its authenticated compact
workspace, execute:
 python3 COMPACT_RUN89_REPLAY_ENDPOINT.py --compact-root /path/to/grh-compact \
   --lean-bin /path/to/lean-4.35.0-linux/bin --out /new/output/directory
Read endpoint_receipt.json and the complete logs. If a proof fails, repair only
the first actual error; if it succeeds, hand the checked module to the shared
constructor-inclusive graph auditor, then supply EndpointGrid from RUN85.
HANDOFF TO: kernel/integration. RH OPEN.
"""
import argparse
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "kernel_extractor"))
from RUN26_COMPACT_GRAPH import PIN, MATHLIB, RELEASE, git_blob, require, dump
from RUN28_COMPACT_TARGETED import audit, step

CANDIDATE = HERE / "COMPACT_RUN88_ANALYTIC_ENDPOINT_GRID_ROOT.lean"
BLOB = "4de55aa0356e64cb780fda3f80dc67d4a9cf362f"
SOURCE_BLOBS = {
    "Statements.lean": "1cd1bce93344065936b2b392b23306254e0785ef",
    "New/Endgame/OneSidedCriterion.lean": "93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3",
    "New/Endgame/PrimeError.lean": "63eb3d79d95ad815878e623b96f237240058c8e2",
}
ROOTS = [
    "RHPrimeWindow84.hinge", "RHPrimeWindow84.log_correction",
    "RHPrimeWindow84.primeError_chord", "RHPrimeWindow87.quartic_cover",
    "RHPrimeWindow88.eventual_from_endpoint_grid",
    "RHPrimeWindow88.principal_right_from_endpoint_grid",
    "RHPrimeWindow88.zeta_line_from_endpoint_grid",
]
DIRECT_ROOTS = [ROOTS[2], ROOTS[4], ROOTS[5], ROOTS[6]]
ORIGINALS = ["lambdaClass_nonneg_and_abs_le", "primeError_eq_sum",
             "isPolar_primeError", "entireL_ne_zero_of_primeError_le"]

def preflight():
    raw = CANDIDATE.read_bytes()
    require(git_blob(raw) == BLOB, "RUN88 source changed")
    code = re.sub(r"/-.*?-/", "", raw.decode(), flags=re.S)
    code = re.sub(r"--[^\n]*", "", code)
    imports = re.findall(r"^import\s+([^\n]+)", code, re.M)
    require(imports == ["Statements", "New.Endgame.OneSidedCriterion", "Lean"],
            "Unexpected import closure entry")
    bare = re.sub(r'"(?:\\.|[^"\\])*"', '""', code)
    require(not re.search(r"\b(sorry|admit|axiom)\b", bare), "Unproved declaration")
    require(re.findall(r"^#print axioms (RHPrimeWindow[^\n]+)", code, re.M) == ROOTS,
            "Axiom roster changed")
    require("RUN88_ANALYTIC_GUARDS_OK" in code, "Missing native guard")
    return {"compact": PIN, "mathlib": MATHLIB, "expected_release_sha256": RELEASE,
            "source_blob": BLOB, "source_blobs": SOURCE_BLOBS,
            "imports": imports, "roots": ROOTS, "original_probes": ORIGINALS,
            "new_Lean_execution": False, "all_requested_checks_ok": False,
            "full_RH_replay": False, "arithmetic_premise_proved": False}

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--compact-root", type=Path)
    p.add_argument("--lean-bin", type=Path)
    p.add_argument("--preflight", action="store_true")
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    state = preflight()
    state["steps"] = {}
    receipt = out / "endpoint_receipt.json"
    def save():
        dump(receipt, state)
    save()
    if args.preflight:
        print(json.dumps(state))
        return
    env = os.environ.copy()
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    def run(label, argv, seconds):
        state["steps"][label] = step(argv, root, env, out / (label+".log"), seconds)
        save()
        return state["steps"][label]["returncode"]
    try:
        require(args.compact_root is not None and args.lean_bin is not None,
                "Require existing authenticated workspace and compiler bin")
        root = args.compact_root.resolve()
        env["PATH"] = str(args.lean_bin.resolve()) + os.pathsep + env["PATH"]
        def capture(argv, cwd):
            return subprocess.check_output(argv, cwd=cwd, env=env, text=True).strip()
        require(capture(["git", "rev-parse", "HEAD"], root) == PIN, "Wrong source pin")
        require(capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib") == MATHLIB,
                "Wrong Mathlib pin")
        require((root / "lean-toolchain").read_text().strip() == "leanprover/lean4:v4.35.0",
                "Wrong toolchain file")
        require("4.35.0" in capture(["lean", "--version"], root), "Wrong compiler version")
        require(shutil.which("lean", path=env["PATH"]) == str(args.lean_bin.resolve() / "lean"),
                "Compiler did not resolve from supplied bin")
        for rel, sha in SOURCE_BLOBS.items():
            require(git_blob((root / "src" / rel).read_bytes()) == sha, "Source mismatch: " + rel)
        # Distinguish verified source hashes from inherited compiler provenance.
        state["compiler_version"] = capture(["lean", "--version"], root)
        state["compiler_archive_rehashed_here"] = False
        save()
        require(run("build", ["lake", "build", "+Statements:olean",
                              "+New.Endgame.OneSidedCriterion:olean"], 2700) == 0,
                "Analytic import build failed")
        original = out / "OriginalAnalytic.lean"
        original.write_text("import New.Endgame.OneSidedCriterion\n" +
                            "\n".join("#print axioms " + n for n in ORIGINALS) + "\n")
        state["new_Lean_execution"] = True
        save()
        rc = run("originals", ["lake", "env", "lean", "-Dpp.fullNames=true", original], 600)
        state["original_axioms"] = audit(out / "originals.log", ORIGINALS)
        save()
        require(rc == 0 and state["original_axioms"]["axiom_audit_ok"], "Original probe failed")
        dst = out / "Run88Endpoint.lean"
        dst.write_bytes(CANDIDATE.read_bytes())
        rc = run("endpoint", ["lake", "env", "lean", "--tstack=400000",
                              "-Dpp.fullNames=true", "--root=" + str(out),
                              "-o", out / "Run88Endpoint.olean", dst], 1200)
        state["candidate_axioms"] = audit(out / "endpoint.log", ROOTS)
        log = (out / "endpoint.log").read_text(errors="replace")
        state["direct_guards"] = ("RUN88_ANALYTIC_GUARDS_OK" in log and
            all("RUN88_DIRECT|" + n + "|" in log for n in DIRECT_ROOTS))
        save()
        require(rc == 0 and state["candidate_axioms"]["axiom_audit_ok"] and
                state["direct_guards"] and (out / "Run88Endpoint.olean").is_file(),
                "RUN88 conditional endpoint failed")
        # Negative control: cannot manufacture an unconditional RH theorem
        # merely by naming the conditional root. Run on exact successful source.
        negative = out / "NoGridPremise.lean"
        raw = dst.read_text()
        negative.write_text(raw + "\nexample : RiemannZetaZerosOnLine :=\n"
                            "  RHPrimeWindow88.zeta_line_from_endpoint_grid\n")
        badline = len(raw.splitlines()) + 3
        rc = run("negative", ["lake", "env", "lean", "--tstack=400000",
                              "-Dpp.fullNames=true", negative], 1200)
        log = (out / "negative.log").read_text(errors="replace")
        errors = re.findall(r"NoGridPremise\.lean:(\d+):\d+: error:", log)
        state["negative_control"] = {"error_lines": errors, "expected_line": badline,
            "rejected": rc == 1 and bool(errors) and
            all(int(n) >= badline-1 for n in errors) and
            "type mismatch" in log.lower() and "PrincipalGrid" in log}
        save()
        require(state["negative_control"]["rejected"], "Omitted-premise negative control inconclusive")
        state["all_requested_checks_ok"] = True
        save()
        print(json.dumps({"conditional_endpoint_checked": True, "full_RH_replay": False}))
    except Exception as exc:
        state["failure"] = str(exc)
        save()
        raise

if __name__ == "__main__":
    main()
