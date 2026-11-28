#!/usr/bin/env python3
"""B3 convex closure: isolated native replay, 28 Nov 2026.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source compact 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Continue f1f3df92 and 3751e66b; do not repeat scalar checks or peer RUN95.
Source/API audit: all six fields live in EichlerFlag, not Moments.
The candidate body uses only SieveSystem and ordinary finite sums, norm,
integral, PSD and continuity APIs (pinned PosDef/Bochner/Integrable read).
Narrow only its import, leaving proof text exactly unchanged.
This removes an unnecessary source-build requirement for this helper;
not a claim of removed transitive mathematical dependencies or root replay.
Original import/body remains archived unchanged. No native lean/lake
on current local PATH. Existing runner used, no protected workflow edit.
No new native PASS until actual receipt. No B3/B4 or RH closure.

RESUME HERE: inspect compute/rh-compact-b3-convex-leaf-20261128/
outputs/convex_receipt.json and convex_compile.log on cathedral-research-state.
If any compiler or axiom guard fails, repair precisely that diagnostic;
if accepted, connect the helper to the weighted GlobalSieve.sieve caller
with the unchanged packet calibration. Keep the original Moments graph.
HANDOFF integration / Landau / audit.
"""
import argparse
import json
from pathlib import Path
import re
import sys

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[2]
sys.path.insert(0, str(SWARM / "integration"))
import run_compact_b2_native_replay as native

CANDIDATE = HERE / "2026-11-28_CONVEX_SIEVE_SYSTEM.lean"
BLOB = "2e7d8b0c0cc25ae3308674176544d8bebb418d8f"
SOURCE = "New/Filling/EichlerFlag.lean"
SOURCE_BLOB = "3da2606a049a092719b779802cb8ead3af7141ce"
NAMES = ["PositivityConvexSieve."+n for n in
         ("norm_mix_le", "convexSystem", "commonTopLabels_weighted")]
ORIGINALS = ["SieveSystem.pi", "SieveSystem.step_sum"]

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", required=True, type=Path)
    p.add_argument("--preflight", action="store_true")
    a = p.parse_args()
    out = a.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    raw = CANDIDATE.read_bytes()
    native.require(native.git_blob(raw) == BLOB, "Changed candidate")
    old = b"import New.Filling.Moments\n"
    new = b"import New.Filling.EichlerFlag\n"
    native.require(raw.startswith(old) and raw.count(old) == 1, "Unexpected import")
    generated = new + raw[len(old):]
    native.require(generated[len(new):] == raw[len(old):], "Proof body changed")
    code = re.sub(r"/-.*?-/", "", generated.decode(), flags=re.S)
    code = re.sub(r"--[^\n]*", "", code)
    native.require(not re.search(r"\b(sorry|admit|axiom)\b", code), "Unproved code")
    for name in NAMES:
        native.require("#print axioms "+name.split(".")[-1] in code, "Missing probe "+name)
    (out/"ConvexSieve.lean").write_bytes(generated)
    state = {"candidate_blob":BLOB,"generated_blob":native.git_blob(generated),
             "source_blob":SOURCE_BLOB,"compact":native.PIN,"mathlib":native.MATHLIB,
             "proof_body_unchanged":True,"new_Lean_execution":False,
             "all_requested_checks_ok":False,"full_RH_replay":False,
             "caller_replacements_checked":False,"human_assembly_verified":False}
    save = lambda: native.dump(out/"convex_receipt.json",state)
    save()
    if a.preflight:
        return
    native.PEERS = {}
    native.SOURCES = {SOURCE: SOURCE_BLOB}
    native.ORIGINALS = ORIGINALS
    base = native.step
    def checked(log, receipt, names):
        report = native.audit(log,names)
        report["no_compiler_errors"] = not re.search(
            r"(?i)\berror(?:\s*\([^\n]*?\))?\s*:",log.read_text(errors="replace"))
        report.update(receipt)
        return report
    def step(argv,cwd,env,log,seconds):
        argv = list(argv)
        if argv == ["lake","build","+New.Filling.BlockBound:olean"]:
            argv = ["lake","build","+New.Filling.EichlerFlag:olean"]
        if Path(str(argv[-1])).name == "original_callers.lean":
            Path(argv[-1]).write_text("import New.Filling.EichlerFlag\n"+
                "\n".join("#print axioms "+n for n in ORIGINALS)+"\n")
            state["new_Lean_execution"] = True
            save()
            proof = out/"ConvexSieve.lean"
            proof_log = out/"convex_compile.log"
            rec = base(["lake","env","lean","--tstack=400000",
                        "-Dpp.fullNames=true",proof],cwd,env,proof_log,600)
            state["convex_compile"] = checked(proof_log,rec,NAMES)
            save()
        if Path(str(argv[-1])).name == "missing_projector_guard.lean":
            # Negative-control guard specific to this proof, not B2 projectors.
            Path(argv[-1]).write_text("import New.Filling.EichlerFlag\n"+
                "example : 0 ≤ (-1 : ℝ) * 1 := by norm_num\n")
        ans = base(argv,cwd,env,log,seconds)
        if Path(str(argv[-1])).name == "original_callers.lean":
            state["original_probes"] = checked(log,ans,ORIGINALS)
            save()
        if Path(str(argv[-1])).name == "missing_projector_guard.lean":
            state["negative_control"] = {
                **ans,"expected_rejection": ans["returncode"] not in (0,124,137)
                and bool(re.search(r"\berror:",log.read_text(errors="replace")))}
            save()
        return ans
    native.step = step
    try:
        sys.argv = [str(__file__),"--out",str(out)]
        native.main()
        for label in ("convex_compile","original_probes"):
            rec=state[label]
            native.require(rec["returncode"]==0 and rec["axiom_audit_ok"]
                           and rec["no_compiler_errors"],label+" failed")
        native.require(state["negative_control"]["expected_rejection"],
                       "Missing nonnegative-weight negative control")
        state["all_requested_checks_ok"] = True
    except Exception as exc:
        state["failure"] = str(exc)
        raise
    finally:
        save()
        native.step = base

if __name__ == "__main__":
    main()
