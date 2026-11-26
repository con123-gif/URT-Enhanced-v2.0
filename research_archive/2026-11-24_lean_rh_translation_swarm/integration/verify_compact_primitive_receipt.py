#!/usr/bin/env python3
"""Authenticate the existing bounded primitive replay, including its A timeout.

This reads committed receipts through git. It does not run Lean or infer
success from the outer Actions job. No source/workflow modification.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB = "56a005855ea17e0b0958f73ec801ae140b0a1679"
JOB = "compute/rh-compact-primitives-replay-20261126"
EXPECTED = {
    "New.Selmer.TiltingLemma": {
        "IsPencil.length_le_of_unseen_class", "tilting",
        "IsPencil.length_le_of_drop_ties"},
    "New.Filling.Moments": {
        "Filling.energy_fixingSet_le", "Filling.sum_le_of_positive_type",
        "Filling.Fits.exists_translate_finrank_comap_le"},
}
AXIOMS = {"propext", "Classical.choice", "Quot.sound"}


def git(*args):
    return subprocess.check_output(["git", *args])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--state-ref", default="origin/cathedral-research-state")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()
    state = git("rev-parse", args.state_ref).decode().strip()

    def read(name):
        return git("show", f"{state}:{JOB}/{name}")

    status = json.loads(read("status.json"))
    result = json.loads(read("outputs/targeted_results.json"))
    pins = json.loads(read("outputs/pins.json"))
    assert pins["compact"] == PIN and pins["mathlib"] == MATHLIB
    assert result["full_RH_replay"] is False
    assert result["all_requested_checks_ok"] is False
    assert status["status"] == "error" and status["returncode"] == 1
    authenticated = []
    for entry in status["outputs_committed"]:
        data = read("outputs/"+entry["path"])
        assert len(data) == entry["bytes"], entry["path"]
        actual = hashlib.sha256(data).hexdigest()
        assert actual == entry["sha256"], entry["path"]
        authenticated.append({"path": entry["path"], "sha256": actual})

    native = []
    for slot in (0, 2):
        probe = result["steps"][f"module_{slot}"]
        build = result["steps"][f"module_{slot}_build"]
        assert probe["returncode"] == build["returncode"] == 0
        assert probe["axiom_audit_ok"] is True
        assert set(probe["axioms"]) == EXPECTED[probe["module"]]
        log = read(f"outputs/module_{slot}.log").decode()
        for theorem, axioms in probe["axioms"].items():
            assert set(axioms) == AXIOMS
            line = next(x for x in log.splitlines() if x.startswith("'"+theorem+"'"))
            assert "depends on axioms: [propext, Classical.choice, Quot.sound]" in line
            native.append({"theorem": theorem, "axioms": axioms})
    timeout = result["steps"]["module_1_build"]
    assert timeout["returncode"] == 124
    assert "module_1" not in result["steps"]
    assert "TIMEOUT" in read("outputs/module_1_build.log").decode()
    assert "4.35.0" in read("outputs/version.log").decode()
    out = {
        "scope": "authentication of committed partial native replay only",
        "source_commit": PIN, "mathlib_commit": MATHLIB,
        "state_commit": state, "run_url": status["run_url"],
        "overall_task_passed": False,
        "authenticated_outputs": authenticated,
        "successful_native_checks": native,
        "timed_out_build": {
            "module": "New.Columns.JetExponentBound", **timeout,
            "probe_executed": False,
            "meaning": "bounded timeout; no theorem or human-proof verdict"},
        "new_Lean_execution": False,
        "human_reconstruction_verified": False,
        "full_RH_replay": False,
    }
    args.out.write_text(json.dumps(out, indent=2)+"\n")
    print(json.dumps({"authenticated_outputs": len(authenticated),
                      "successful_native_checks": len(native),
                      "overall_task_passed": False,
                      "A_build": "bounded timeout; probe not executed",
                      "new_Lean_execution": False}))


if __name__ == "__main__":
    main()
