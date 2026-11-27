#!/usr/bin/env python3
"""Verify the full B2 candidate and six caller frontiers on the shared host.

Reuse the existing GitHub-only pinned bootstrap. Compile the seven-declaration
candidate, preserve its checked object, then audit its constructor-inclusive
graph before the temporary native workspace is removed. No RH root import.
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import sys

import run_active_b2_energy as energy
from replay_full_b2_built import FULL_GUARD
import run_compact_b2_native_replay as native
import fuse_b2_checked_proofs as fusion


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--preflight", action="store_true")
    p.add_argument("--labelled-fusion", action="store_true",
                   help="Check core transport controls, the joint eleven-declaration fusion, and eight graph roots")
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    config = json.loads((energy.HERE / "B2_ACTIVE_FULL_ENERGY_INPUT.json").read_text())
    base = native.step
    status = {"compact": native.PIN, "mathlib": native.MATHLIB,
              "scope": "seven B2 declarations, repaired skew/count caller and six local graph roots",
              "new_Lean_execution": False, "full_RH_replay": False,
              "human_assembly_verified": False, "graph_executed": False,
              "all_requested_checks_ok": False}
    if args.labelled_fusion:
        raw = (native.SWARM / fusion.LABEL_SOURCE).read_bytes()
        native.require(native.git_blob(raw) == fusion.LABEL_BLOB, "Changed joint labelled candidate")
        status.update(scope="seven prerequisite proofs, checked transport controls, eleven joint B2 declarations and eight local graph roots",
                      joint_labelled_source={"source": fusion.LABEL_SOURCE, "source_blob": fusion.LABEL_BLOB},
                      joint_fusion_checked=False, core_transport_controls_pass=False)
    module = None

    def save():
        native.dump(out / "shared_full_b2_results.json", status)

    def step(argv, cwd, env, log, seconds):
        nonlocal module
        argv = list(argv)
        leaf = Path(str(argv[-1])).name if argv else ""
        primary = argv[:3] == ["lake", "env", "lean"] and leaf == "active_b2_energy.lean"
        if primary:
            # A stable module name allows the graph to inspect these exact checked
            # objects without repeating the seven proofs in another source file.
            argv = argv[:-1] + ["-Dpp.fullNames=true", "-R", Path(str(argv[-1])).parent,
                                "-o", out / "active_b2_energy.olean", argv[-1]]
        ans = base(argv, cwd, env, log, seconds)
        if primary:
            audit = native.audit(log, config["theorems"])
            text = log.read_text()
            guards = all(g in text for g in [energy.PAIR_GUARD, energy.ENERGY_GUARD, FULL_GUARD])
            passed = ans["returncode"] == 0 and audit["axiom_audit_ok"] and guards
            status.update(new_Lean_execution=True, primary_callers_checked=passed)
            status["primary_receipt"] = {**ans, **audit, "all_caller_guards_observed": guards}
            if passed:
                objects = []
                for obj in sorted(out.glob("active_b2_energy.olean*")):
                    with obj.open("rb") as stream:
                        objects.append({"name": obj.name, "bytes": obj.stat().st_size,
                            "sha256": hashlib.file_digest(stream, "sha256").hexdigest()})
                module = {"name": "active_b2_energy", "artifacts": objects}
                # The graph requires a real compiler/type/axiom/guard receipt.
                # The outer energy runner later writes the complete batch result.
                native.dump(out / "energy_replacement_results.json", {
                    **config, "compact": native.PIN, "mathlib": native.MATHLIB,
                    "new_Lean_execution": True, "energy_caller_checked": True,
                    "full_energy_chain_checked": True, "compiled_module": module,
                    "axioms": audit["axioms"], "all_requested_checks_ok": False,
                    "full_RH_replay": False, "human_assembly_verified": False})
            save()
        if leaf == "missing_projector_guard.lean" and module is not None:
            lean = shutil.which("lean", path=env["PATH"])
            native.require(lean is not None, "Pinned Lean binary missing before graph")
            graph_args = []
            if args.labelled_fusion:
                core = base([sys.executable, energy.HERE / "test_checked_retarget_kernel.py",
                             "--lean", lean, "--out", out / "transport_core", "--seconds", "120"],
                            cwd, env, out / "transport_core_driver.log", 300)
                status["core_transport_driver"] = core
                core_receipt = out / "transport_core/compatibility_results.json"
                status["core_transport_controls_pass"] = (core["returncode"] == 0 and
                    core_receipt.is_file() and json.loads(core_receipt.read_text())["all_checks_pass"] is True)
                save()
                native.require(status["core_transport_controls_pass"], "Core transport compatibility controls failed")
                fused = base([sys.executable, energy.HERE / "fuse_b2_checked_proofs.py",
                              "--compact-root", cwd, "--lean-bin", Path(lean).parent,
                              "--module-dir", out, "--out", out / "fused", "--labelled"],
                             cwd, env, out / "fused_driver.log", 2700)
                status["joint_fusion_driver"] = fused
                receipt = out / "fused/fused_b2_results.json"
                if receipt.is_file():
                    status["joint_fusion_receipt"] = json.loads(receipt.read_text())
                status["joint_fusion_checked"] = (fused["returncode"] == 0 and
                    status.get("joint_fusion_receipt", {}).get("fused_chain_checked") is True and
                    status.get("joint_fusion_receipt", {}).get("labelled_supplier_guards_observed") is True)
                save()
                native.require(status["joint_fusion_checked"], "Joint labelled B2 fusion failed; preserve exact log")
                graph_args = ["--fused-module-dir", out / "fused"]
            graph = base([sys.executable, energy.HERE / "audit_active_b2_graph.py",
                          "--compact-root", cwd, "--lean-bin", Path(lean).parent,
                          "--module-dir", out, "--out", out / "graph", *graph_args],
                         cwd, env, out / "graph_driver.log", 1800)
            status.update(graph_executed=True, graph_receipt=graph)
            if graph["returncode"] == 0:
                status["graph_summary"] = json.loads(
                    (out / "graph/local_b2_graph_summary.json").read_text())
            save()
        return ans

    native.step = step
    original_argv = sys.argv
    try:
        sys.argv = [sys.argv[0], "--out", str(out), "--manifest", "B2_ACTIVE_FULL_ENERGY_INPUT.json"]
        if args.preflight:
            sys.argv.append("--preflight")
        energy.main()
        if args.preflight:
            save()
            return
        result = json.loads((out / "energy_replacement_results.json").read_text())
        result["compiled_module"] = module
        native.dump(out / "energy_replacement_results.json", result)
        status["all_requested_checks_ok"] = (result["all_requested_checks_ok"] is True and
            status.get("primary_callers_checked") is True and status["graph_executed"] and
            status["graph_receipt"]["returncode"] == 0)
        if args.labelled_fusion:
            status["all_requested_checks_ok"] = (status["all_requested_checks_ok"] and
                status["core_transport_controls_pass"] and status["joint_fusion_checked"])
        save()
        native.require(status["all_requested_checks_ok"], "Full B2/graph checks incomplete; inspect individual receipts")
        print(json.dumps(status))
    except Exception as exc:
        status["failure"] = str(exc)
        save()
        raise
    finally:
        sys.argv = original_argv
        native.step = base


if __name__ == "__main__":
    main()
