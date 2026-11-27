#!/usr/bin/env python3
"""Inspect the restricted standard-pair interface and its general counterpart.

The new statement is a semilocal standard-data interface, not a replacement
for the original general finite-modulus theorem or the determinant consumer.
"""
import argparse
import json
import os
from pathlib import Path
import subprocess

from audit_c2_callers_graph import check_object
from prepare_native_graph_exporter import execute_graph
import run_compact_b2_native_replay as native
import RUN26_COMPACT_GRAPH as graph

ROOTS = ["exchange_theorem", "c2_standard_exchange_uniform"]


def main():
    p = argparse.ArgumentParser()
    for name in ["compact-root", "lean-bin", "base-module-dir", "module-dir", "native-exporter-dir", "out"]:
        p.add_argument("--" + name, type=Path, required=True)
    p.add_argument("--seconds", type=int, default=1800)
    args = p.parse_args()
    root, base, directory, out = (args.compact_root.resolve(), args.base_module_dir.resolve(),
                                  args.module_dir.resolve(), args.out.resolve())
    out.mkdir(parents=True, exist_ok=True)
    r = json.loads((directory / "standard_exchange_results.json").read_text())
    b = json.loads((base / "c2_replacement_results.json").read_text())
    for receipt in [r, b]:
        native.require(receipt["compact"] == native.PIN and receipt["mathlib"] == native.MATHLIB
                       and receipt["all_requested_checks_ok"] is True, "Unaccepted proof receipt")
    native.require(r["checked_input_module"] == b["compiled_module"], "Different base C2 module")
    check_object(base, b["compiled_module"], "C2Combined")
    check_object(directory, r["compiled_module"], "C2StandardExchange")
    source = (directory / "C2StandardExchange.lean").read_bytes()
    native.require(native.git_blob(source) == r["source_blob"] == native.git_blob(
        (Path(__file__).parent / "C2_STANDARD_EXCHANGE_UNIFORM.lean").read_bytes()), "Changed standard interface")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN, "Wrong compact pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib") == native.MATHLIB,
                   "Wrong Mathlib pin")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"], cwd=root, check=True)
    env = os.environ.copy()
    env["PATH"] = str(args.lean_bin.resolve()) + os.pathsep + env["PATH"]
    setup = subprocess.check_output(["lake", "env", "python3", "-c",
        "import os,json; print(json.dumps({k:os.environ[k] for k in "
        "['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
        cwd=root, env=env, text=True, timeout=300)
    (out / "environment.log").write_text(setup)
    env.update(json.loads(setup.strip().splitlines()[-1]))
    env["LEAN_PATH"] = str(directory) + os.pathsep + str(base) + os.pathsep + env["LEAN_PATH"]
    state = {"compact": native.PIN, "mathlib": native.MATHLIB, "roots": ROOTS,
             "scope": "restricted semilocal standard-pair interface; not determinant or general-theorem replacement",
             "checked_module": r["compiled_module"], "checked_base": b["compiled_module"], "full_RH_replay": False}
    native.dump(out / "input_manifest.json", state)
    run = execute_graph(args.native_exporter_dir, root, env, args.lean_bin, "C2StandardExchange", ROOTS,
                        out / "standard_exchange_graph.jsonl", out / "graph.log", args.seconds)
    native.dump(out / "graph_execution.json", run)
    native.require(run["returncode"] == 0 and run["axiom_audit_ok"] is True, "Standard graph export failed")
    graph.ROOTS = ROOTS
    graph.audit_union(out / "standard_exchange_graph.jsonl", out, out)
    watched = {name: 0 for name in ROOTS + ["exchange_of_partners", "exists_equalRankThetaRatio_value",
               "run78_equalRankThetaRatio_value", "RHCharacterBoxes77.exchange_of_standard_pairs"]}
    with (out / "root_membership.jsonl").open() as stream:
        for line in stream:
            row = json.loads(line)
            name = ".".join(str(x[1]) for x in row["id"])
            if name in watched:
                watched[name] = row["root_mask"]
    guards = {"new_root_present": watched[ROOTS[1]] & 2 == 2,
        "general_exchange_reachable_from_original": watched["exchange_of_partners"] & 1 == 1,
        "general_exchange_absent_from_standard_interface": not (watched["exchange_of_partners"] & 2),
        "old_equal_rank_absent_from_standard_interface": not (watched["exists_equalRankThetaRatio_value"] & 2),
        "original_exchange_absent_from_standard_interface": not (watched[ROOTS[0]] & 2),
        "checked_equal_rank_reachable": watched["run78_equalRankThetaRatio_value"] & 2 == 2,
        "checked_standard_helper_reachable": watched["RHCharacterBoxes77.exchange_of_standard_pairs"] & 2 == 2}
    native.dump(out / "supplier_reachability.json", {"membership": watched, "guards": guards,
                "all_guards_pass": all(guards.values()), "full_RH_replay": False})
    native.require(all(guards.values()), "Standard interface retained a forbidden general supplier")
    summary = json.loads((out / "union_summary.json").read_text())
    summary.update(scope=state["scope"], all_supplier_guards_pass=True, full_RH_replay=False)
    native.dump(out / "standard_graph_summary.json", summary)
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
