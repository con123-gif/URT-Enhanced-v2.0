#!/usr/bin/env python3
"""Check the actual energy consumer with the active pair-weight supplier.

Authenticate the two source fragments and preserve the complete assembled
Lean input. Reuse the pinned bootstrap and compile only the CrudeEnergy
import closure. A successful workflow alone is never a theorem receipt.
"""
import argparse
import contextlib
import io
import json
import re
from pathlib import Path

import run_compact_b2_native_replay as native
from run_active_b2_callers import GUARD as PAIR_GUARD

HERE = Path(__file__).resolve().parent
ENERGY_GUARD = ("B2_ACTIVE_ENERGY: original declaration type matches; replacement pair bound "
                "consumed; original targets absent from direct proof dependencies")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True)
    parser.add_argument("--preflight", action="store_true")
    args = parser.parse_args()
    out = Path(args.out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    config = json.loads((HERE / "B2_ACTIVE_ENERGY_INPUT.json").read_text())
    texts = []
    for part in config["parts"]:
        raw = (native.SWARM / part["source"]).read_bytes()
        native.require(native.git_blob(raw) == part["source_blob"],
                       "Changed energy input: " + part["source"])
        texts.append(re.sub(r"^import[^\n]*\n", "", raw.decode(), flags=re.M))
    assembled = out / "active_b2_energy.lean"
    assembled.write_text("import New.Filling.CrudeEnergy\nimport Mathlib.Tactic\n\n" +
                         "\n".join(texts))
    assembled_blob = native.git_blob(assembled.read_bytes())
    names = config["theorems"]
    native.require(len(names) == 5 and len(set(names)) == 5, "Wrong energy theorem manifest")
    native.PEERS = {"active_b2_energy": (str(assembled), assembled_blob, names)}
    native.SOURCES["New/Filling/CrudeEnergy.lean"] = config["original_source_blob"]
    base_step = native.step

    def pinned_step(argv, cwd, env, log, seconds):
        argv = list(argv)
        if argv == ["lake", "build", "+New.Filling.BlockBound:olean"]:
            argv[-1] = "+New.Filling.CrudeEnergy:olean"
        if argv[:3] == ["lake", "env", "lean"]:
            argv = argv[:3] + ["--tstack=400000"] + argv[3:]
        return base_step(argv, cwd, env, log, seconds)

    native.step = pinned_step
    native.preflight()
    provenance = {**config, "assembled_source_blob": assembled_blob,
                  "new_Lean_execution": False, "full_RH_replay": False}
    native.dump(out / "energy_input_manifest.json", provenance)
    if args.preflight:
        print(json.dumps({"source_fragments_authenticated": len(texts),
                          "assembled_source_blob": assembled_blob,
                          "new_Lean_execution": False, "energy_caller_checked": False}))
        return
    with contextlib.redirect_stdout(io.StringIO()):
        native.main()
    state = json.loads((out / "b2_native_results.json").read_text())
    probe = state["steps"]["active_b2_energy"]
    native.require(state["all_requested_checks_ok"] is True, "Incomplete energy native batch")
    native.require(probe["returncode"] == 0 and probe["axiom_audit_ok"] is True,
                   "Energy compilation/axiom audit failed")
    native.require(set(probe["axioms"]) == set(names), "Missing energy theorem report")
    log = (out / probe["log"]).read_text()
    native.require(PAIR_GUARD in log and ENERGY_GUARD in log,
                   "Actual pair/energy caller guards did not complete")
    result = {
        **provenance, "new_Lean_execution": True, "axioms": probe["axioms"],
        "original_declaration_types_match": True,
        "energy_caller_checked": True,
        "replacement_pair_bound_consumed": True,
        "original_targets_absent_from_direct_proof_dependencies": True,
        "scope": "pair-weight replacement and its full original-statement level-energy consumer",
        "human_assembly_verified": False, "full_RH_replay": False,
        "all_requested_checks_ok": True,
    }
    native.dump(out / "energy_replacement_results.json", result)
    print(json.dumps({"compiled_theorems": len(names), "energy_caller_checked": True,
                      "human_assembly_verified": False, "full_RH_replay": False}))


if __name__ == "__main__":
    main()
