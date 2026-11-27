#!/usr/bin/env python3
"""Prepare/replay a constructor-inclusive comparison of four B2 caller roots.

This is a local B2 frontier, never the whole RH frontier or a completion
denominator. Reuse the authenticated exporter and verifier. A capable,
pinned CrudeEnergy workspace must already be built; no Main build/import.
"""
import argparse
import importlib.util
import json
import os
from pathlib import Path
import re
import subprocess

import run_compact_b2_native_replay as native

ROOTS = ["Filling.sum_pairWeight_le", "Filling.b2_active_sum_pairWeight_le",
         "Filling.energy_le_of_level_pairs", "Filling.b2_active_energy_le_of_level_pairs"]
HERE = Path(__file__).resolve().parent


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--prepare-only", action="store_true")
    parser.add_argument("--compact-root", type=Path)
    parser.add_argument("--lean-bin", type=Path)
    args = parser.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    graph_file = native.KERNEL / "RUN26_COMPACT_GRAPH.py"
    spec = importlib.util.spec_from_file_location("b2_kernel_graph", graph_file)
    graph = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(graph)
    graph.ROOTS = ROOTS
    exporter = graph.driver()
    native.require(exporter.count("import Main\n") == 1, "Changed exporter import")
    exporter = exporter.replace("import Main\n", "", 1)
    config = json.loads((HERE / "B2_ACTIVE_ENERGY_INPUT.json").read_text())
    parts = []
    for part in config["parts"]:
        raw = (native.SWARM / part["source"]).read_bytes()
        native.require(native.git_blob(raw) == part["source_blob"], "Changed candidate graph input")
        parts.append(re.sub(r"^import[^\n]*\n", "", raw.decode(), flags=re.M))
    # Close each fragment's variable/include scope before adding the exporter.
    source = ("import Lean\nimport New.Filling.CrudeEnergy\nimport Mathlib.Tactic\n\n" +
              "\n".join("section\n" + s + "\nend\n" for s in parts) +
              "\n" + exporter.replace("import Lean\n", "", 1))
    native.require(not re.search(r"^import (?:Main|New\.Main)\b", source, re.M),
                   "Forbidden RH root import")
    path = out / "ActiveB2Graph.lean"
    path.write_text(source)
    manifest = {"compact": native.PIN, "mathlib": native.MATHLIB, "roots": ROOTS,
                "parts": config["parts"], "generated_source_blob": native.git_blob(source.encode()),
                "exporter_source_blob": "ee4efebb066f6775fa551ae9104cfa973e585071",
                "scope": "four local B2 caller frontiers; not the full RH frontier",
                "new_Lean_execution": False, "full_RH_replay": False}
    native.dump(out / "graph_input_manifest.json", manifest)
    if args.prepare_only:
        print(json.dumps(manifest))
        return
    native.require(args.compact_root is not None and args.lean_bin is not None,
                   "Provide the already-built pinned compact root and Lean bin")
    root = args.compact_root.resolve()
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN,
                   "Wrong compact source pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"],
                   root / ".lake/packages/mathlib") == native.MATHLIB, "Wrong Mathlib pin")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"],
                   cwd=root, check=True)
    env = os.environ.copy()
    env["PATH"] = str(args.lean_bin.resolve()) + os.pathsep + env["PATH"]
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1",
               CATHEDRAL_RH_GRAPH=str(out / "local_b2_graph.jsonl"))
    command = ["lake", "env", "lean", "--tstack=400000", path]
    receipt = native.step(command, root, env, out / "local_b2_graph.log", 1200)
    receipt.update(native.audit(out / "local_b2_graph.log", ROOTS))
    receipt.update(new_Lean_execution=True, full_RH_replay=False)
    native.dump(out / "graph_execution.json", receipt)
    native.require(receipt["returncode"] == 0 and receipt["axiom_audit_ok"] is True,
                   "Local B2 graph compilation/axiom checks failed")
    graph.audit_union(out / "local_b2_graph.jsonl", out, out)
    watched = {name: None for name in ROOTS + [
        "Filling.b2_active_outer_frameValueIndex_dvd",
        "Filling.b2_active_inner_frameValueIndex_dvd"]}
    with (out / "root_membership.jsonl").open() as stream:
        for line in stream:
            row = json.loads(line)
            name = ".".join(str(component[1]) for component in row["id"])
            if name in watched:
                watched[name] = row["root_mask"]
    native.require(all(mask is not None for mask in watched.values()),
                   "Missing caller or bridge in constructor-inclusive graph")
    new_roots = (1 << 1) | (1 << 3)
    guards = {
        "old_pair_absent_from_both_new_roots": not (watched[ROOTS[0]] & new_roots),
        "old_energy_absent_from_new_energy": not (watched[ROOTS[2]] & (1 << 3)),
        "new_pair_reachable_from_new_energy": bool(watched[ROOTS[1]] & (1 << 3)),
        "outer_bridge_reachable_from_both_new_roots":
            watched["Filling.b2_active_outer_frameValueIndex_dvd"] & new_roots == new_roots,
        "inner_bridge_reachable_from_both_new_roots":
            watched["Filling.b2_active_inner_frameValueIndex_dvd"] & new_roots == new_roots,
    }
    native.dump(out / "caller_reachability.json", {"roots": ROOTS, "membership": watched,
                "guards": guards, "all_guards_pass": all(guards.values()),
                "constructor_inclusive": True, "full_RH_replay": False})
    native.require(all(guards.values()), "Caller graph differs from advertised dependency substitution")
    summary = json.loads((out / "union_summary.json").read_text())
    summary.update(scope=manifest["scope"], full_RH_replay=False,
                   constructor_inclusive_caller_guards_pass=True,
                   root_obligation_completion_percentage=None)
    native.dump(out / "local_b2_graph_summary.json", summary)
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
