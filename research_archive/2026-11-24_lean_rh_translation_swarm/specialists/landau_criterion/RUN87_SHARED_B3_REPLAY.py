#!/usr/bin/env python3
"""RUN87: register the existing RUN85/86 B3 replay in the shared compute queue.

27 November 2026. Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
No proof has been compiled in this session. No new source bootstrap
implementation, protected workflow changes, Main import or RH claim.

RUN86 was prepared but had no registered compute job. Reuse the existing
official-source shared bootstrap; replace its build target once and retain
one workspace for all six B3 roots. Preserve its legacy original probes
and negative control separately; they are not B3 replacement evidence.
An existing C1 job is running, so do not cancel it or alter its inputs.

Actual next consumers (source matched, not yet transported):
  New/RealPlace/ComplexShells.lean, 351cfdf7fa54238f79b1b950c3532feef1f74f53,
  formConst_mul_lintegral_le, line 75: real dyadic shell integral.
  New/Filling/TopFloor.lean, 9762970967aef90b3a4e025b7f2891d892c70111,
  lintegral_shells_le, line 299: finite content-ideal integral.
Each invokes Gauge.lintegral_positions_le once in its source proof, with
its original gauge and shell conditions. Do not merge the real and finite
quantitative suppliers, or treat the floor-chart change as eliminating
Parseval, the full Gauge, or either shell's majorant inputs.

RESUME HERE: inspect the queued B3 run's actual run86_receipt.json and
compiler/graph logs; repair only a failing stage, or after complete
acceptance retarget the two exact shell consumers. No new helper proof
until the existing six-root frontier has a native receipt.
HANDOFF TO: integration / B3 / audit.
"""
import argparse
import json
import os
from pathlib import Path
import shutil
import sys

HERE = Path(__file__).resolve().parent
SWARM = HERE.parents[1]
sys.path.insert(0, str(SWARM / "integration"))
import run_compact_b2_native_replay as native
import RUN86_DIRECT_CHART_REPLAY as replay

RUNNER = HERE / "RUN86_DIRECT_CHART_REPLAY.py"
RUNNER_BLOB = "3ed30a881eea411dcb48c8b137a16659d401fc51"
TARGETS = ["+New.RealPlace.LocalTheorem:olean", "+New.Filling.StandardLevel:olean"]


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", required=True, type=Path)
    p.add_argument("--preflight", action="store_true")
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    native.require(native.git_blob(RUNNER.read_bytes()) == RUNNER_BLOB,
                   "Changed RUN86 runner")
    native.require(native.git_blob(replay.SOURCE.read_bytes()) == replay.SOURCE_BLOB,
                   "Changed RUN85 proof")
    native.PEERS = {}
    native.SOURCES = {**replay.ORIGINALS,
        "New/Filling/StandardLevel.lean": "ec149f4a38c54931f75c7e106ce94d1d6e65c5a4"}
    native.ORIGINALS = replay.ROOTS[::2]
    native.preflight()
    state = {"compact": native.PIN, "mathlib": native.MATHLIB,
             "runner_blob": RUNNER_BLOB, "proof_blob": replay.SOURCE_BLOB,
             "source_build_targets": TARGETS, "original_roots": native.ORIGINALS,
             "new_Lean_execution": False, "all_requested_checks_ok": False,
             "human_assembly_verified": False, "full_RH_replay": False}

    def save():
        native.dump(out / "run87_shared_receipt.json", state)

    save()
    base = native.step
    pre = base([sys.executable, RUNNER, "--out", out / "preflight",
                "--prepare-only"], SWARM, os.environ.copy(),
               out / "preflight.log", 180)
    state["preflight"] = pre
    save()
    native.require(pre["returncode"] == 0, "RUN86 input preflight failed")
    if args.preflight:
        return
    original_argv = sys.argv[:]

    def step(argv, cwd, env, log, seconds):
        argv = list(argv)
        building = argv == ["lake", "build", "+New.Filling.BlockBound:olean"]
        leaf = Path(str(argv[-1]))
        if building:
            argv = ["lake", "build", *TARGETS]
        if leaf.name == "original_callers.lean":
            source = leaf.read_text()
            old = "import New.Filling.BlockBound\n"
            native.require(source.count(old) == 1, "Changed legacy probe import")
            leaf.write_text(source.replace(old, "import New.RealPlace.LocalTheorem\n", 1))
            argv = argv[:3] + ["--tstack=400000", "-Dpp.fullNames=true"] + argv[3:]
        ans = base(argv, cwd, env, log, seconds)
        if building:
            state["source_build"] = ans
            save()
        if leaf.name == "original_callers.lean":
            state["original_probes"] = {**ans, **native.audit(log, native.ORIGINALS)}
            save()
        if leaf.name == "missing_projector_guard.lean":
            # Last stage of the legacy shared bootstrap. Do not count this
            # unrelated negative control as a replacement proof check.
            state["legacy_negative_control"] = ans
            save()
            native.require(state.get("source_build", {}).get("returncode") == 0 and
                           state.get("original_probes", {}).get("returncode") == 0 and
                           state.get("original_probes", {}).get("axiom_audit_ok") is True,
                           "Original B3 build/probes incomplete")
            lean = shutil.which("lean", path=env["PATH"])
            native.require(lean is not None, "Pinned Lean binary unavailable")
            result = base([sys.executable, RUNNER, "--compact-root", cwd,
                           "--lean-bin", Path(lean).parent, "--out", out / "b3"],
                          cwd, env, out / "b3_driver.log", 6300)
            state["replacement_driver"] = result
            receipt = out / "b3/run86_receipt.json"
            if receipt.is_file():
                state["replacement_receipt"] = json.loads(receipt.read_text())
                state["new_Lean_execution"] = state["replacement_receipt"].get(
                    "new_Lean_execution", False)
            save()
        return ans

    native.step = step
    try:
        sys.argv = [str(HERE / "RUN87_SHARED_B3_REPLAY.py"), "--out", str(out)]
        native.main()
        receipt = state.get("replacement_receipt", {})
        state["all_requested_checks_ok"] = (
            state.get("replacement_driver", {}).get("returncode") == 0 and
            receipt.get("all_requested_checks_ok") is True and
            receipt.get("compile", {}).get("returncode") == 0 and
            receipt.get("graph", {}).get("returncode") == 0 and
            len(receipt.get("reachability_guards", {})) == 13 and
            all(receipt["reachability_guards"].values()))
        save()
        native.require(state["all_requested_checks_ok"],
                       "B3 replay incomplete; inspect actual receipts")
    except Exception as exc:
        state["failure"] = str(exc)
        save()
        raise
    finally:
        sys.argv = original_argv
        native.step = base


if __name__ == "__main__":
    main()
