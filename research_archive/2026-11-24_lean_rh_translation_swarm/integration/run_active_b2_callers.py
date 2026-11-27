#!/usr/bin/env python3
"""Reproduce the actual B2 caller replacement in the shared pinned runner.

Reuse the completed bootstrap/build/axiom guard, with a different authenticated
candidate. Its historical fixed-count stdout is not used as a receipt; actual
compiler logs and the configured theorem list determine the result below.
"""
import argparse
import contextlib
import io
import json
from pathlib import Path

import run_compact_b2_native_replay as native

HERE = Path(__file__).resolve().parent
GUARD = ("B2_ACTIVE_CALLER: original declaration type matches; both bridges consumed; "
         "original target absent from direct proof dependencies")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True)
    parser.add_argument("--preflight", action="store_true")
    args = parser.parse_args()
    out = Path(args.out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    config = json.loads((HERE / "B2_ACTIVE_CALLER_INPUT.json").read_text())
    names = config["theorems"]
    native.require(len(names) == 4 and len(set(names)) == 4, "Wrong caller theorem manifest")
    native.PEERS = {"active_b2_callers": (config["source"], config["source_blob"], names)}
    base_step = native.step
    def pinned_step(argv, cwd, env, log, seconds):
        argv = list(argv)
        if argv[:3] == ["lake", "env", "lean"]:
            argv = argv[:3] + ["--tstack=400000"] + argv[3:]
        return base_step(argv, cwd, env, log, seconds)
    native.step = pinned_step
    manifest = native.preflight()
    native.dump(out / "input_manifest.json", manifest)
    if args.preflight:
        print(json.dumps({"source_authenticated": True, "candidate_theorems": len(names),
                          "new_Lean_execution": False, "caller_replacement_checked": False}))
        return

    # The reused function records every compiler exit, log, pin and axiom report.
    # Suppress only its hard-coded historical summary, never compiler evidence.
    with contextlib.redirect_stdout(io.StringIO()):
        native.main()
    state = json.loads((out / "b2_native_results.json").read_text())
    probe = state["steps"]["active_b2_callers"]
    native.require(state["all_requested_checks_ok"] is True, "Incomplete native batch")
    native.require(probe["returncode"] == 0 and probe["axiom_audit_ok"] is True,
                   "Caller compilation/axiom audit failed")
    native.require(set(probe["axioms"]) == set(names), "Missing caller theorem report")
    native.require(GUARD in (out / probe["log"]).read_text(),
                   "Actual caller type/dependency guards did not complete")
    result = {
        "scope": "one full original-statement pair-weight caller replacement",
        "source": config["source"], "source_blob": config["source_blob"],
        "compact": native.PIN, "mathlib": native.MATHLIB,
        "new_Lean_execution": True, "compiled_theorems": names,
        "axioms": probe["axioms"], "original_declaration_type_matches": True,
        "both_bridge_dependencies_observed": True,
        "original_target_absent_from_direct_proof_dependencies": True,
        "caller_replacement_checked": True,
        "caller": "Filling.sum_pairWeight_le",
        "replacement": "Filling.b2_active_sum_pairWeight_le",
        "human_assembly_verified": False, "full_RH_replay": False,
        "all_requested_checks_ok": True,
        "bootstrap_results": "b2_native_results.json",
    }
    native.dump(out / "caller_replacement_results.json", result)
    print(json.dumps({"compiled_theorems": len(names),
                      "original_statement_caller_checked": True,
                      "human_assembly_verified": False, "full_RH_replay": False}))


if __name__ == "__main__":
    main()
