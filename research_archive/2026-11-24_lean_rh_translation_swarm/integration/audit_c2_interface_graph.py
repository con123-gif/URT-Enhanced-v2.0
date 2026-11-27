#!/usr/bin/env python3
"""Complete two-root graph check for a checked C2 interface and its original.

Use the authenticated constructor-inclusive exporter and the unchanged,
independent Node verifier. The caller supplies the exact positive/negative
supplier roster; acceptance never follows from a build alone.
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


def checked_interface(path):
    path = path.resolve()
    r = json.loads(path.read_text())
    native.require(r["compact"] == native.PIN and r["mathlib"] == native.MATHLIB
                   and r["all_requested_checks_ok"] is True
                   and r["compiler"]["returncode"] == 0
                   and r["compiler"]["axiom_audit_ok"] is True,
                   "Unaccepted C2 interface receipt")
    module = r["compiled_module"]
    check_object(path.parent, module, module["name"])
    source = path.parent / (module["name"] + ".lean")
    native.require(native.git_blob(source.read_bytes()) == r["source_blob"],
                   "Changed checked interface source")
    return r


def main():
    p = argparse.ArgumentParser()
    for name in ["compact-root", "lean-bin", "base-module-dir", "proof-receipt",
                 "native-exporter-dir", "out"]:
        p.add_argument("--" + name, type=Path, required=True)
    p.add_argument("--dependency-receipt", type=Path, action="append", default=[])
    p.add_argument("--original", required=True)
    p.add_argument("--candidate", required=True)
    p.add_argument("--require", dest="required", action="append", default=[])
    p.add_argument("--forbid", action="append", default=[])
    p.add_argument("--scope", required=True)
    p.add_argument("--seconds", type=int, default=1800)
    a = p.parse_args()
    root, base, out = a.compact_root.resolve(), a.base_module_dir.resolve(), a.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    r = checked_interface(a.proof_receipt)
    dependencies = [checked_interface(path) for path in a.dependency_receipt]
    checked = [{"source_blob": d["source_blob"], "module": d["compiled_module"]} for d in dependencies]
    native.require(r.get("checked_interface_dependencies", []) == checked,
                   "Different checked dependency roster")
    b = json.loads((base / "c2_replacement_results.json").read_text())
    native.require(b["compact"] == native.PIN and b["mathlib"] == native.MATHLIB
                   and b["all_requested_checks_ok"] is True,
                   "Unaccepted base C2 module")
    check_object(base, b["compiled_module"], "C2Combined")
    native.require(native.git_blob((base / "C2Combined.lean").read_bytes()) == b["combined_source_blob"],
                   "Changed checked base C2 source")
    for receipt in [r] + dependencies:
        native.require(receipt["checked_input_module"] == b["compiled_module"],
                       "Different base C2 proof object")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN, "Wrong compact pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib") == native.MATHLIB,
                   "Wrong Mathlib pin")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"], cwd=root, check=True)
    env = os.environ.copy()
    env["PATH"] = str(a.lean_bin.resolve()) + os.pathsep + env["PATH"]
    setup = subprocess.check_output(["lake", "env", "python3", "-c",
        "import os,json; print(json.dumps({k:os.environ[k] for k in "
        "['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
        cwd=root, env=env, text=True, timeout=300)
    (out / "environment.log").write_text(setup)
    env.update(json.loads(setup.strip().splitlines()[-1]))
    dirs = [a.proof_receipt.resolve().parent] + [x.resolve().parent for x in a.dependency_receipt] + [base]
    env["LEAN_PATH"] = os.pathsep.join(list(map(str, dirs)) + [env["LEAN_PATH"]])
    roots = [a.original, a.candidate]
    native.require(a.original != a.candidate, "Distinct original and candidate required")
    native.require(not (set(a.required) & set(a.forbid + [a.original])), "Contradictory supplier guards")
    state = {"compact": native.PIN, "mathlib": native.MATHLIB, "roots": roots,
             "scope": a.scope, "checked_module": r["compiled_module"],
             "checked_dependencies": checked, "checked_base": b["compiled_module"],
             "full_RH_replay": False}
    native.dump(out / "input_manifest.json", state)
    run = execute_graph(a.native_exporter_dir, root, env, a.lean_bin,
                        r["compiled_module"]["name"], roots,
                        out / "interface_graph.jsonl", out / "graph.log", a.seconds)
    native.dump(out / "graph_execution.json", run)
    native.require(run["returncode"] == 0 and run["axiom_audit_ok"] is True, "Graph export failed")
    graph.ROOTS = roots
    graph.audit_union(out / "interface_graph.jsonl", out, out)
    watched = {name: 0 for name in roots + a.required + a.forbid}
    with (out / "root_membership.jsonl").open() as stream:
        for line in stream:
            row = json.loads(line)
            name = ".".join(str(x[1]) for x in row["id"])
            if name in watched:
                watched[name] = row["root_mask"]
    guards = {"candidate_reaches_itself": bool(watched[a.candidate] & 2),
              "original_reaches_itself": bool(watched[a.original] & 1),
              "original_absent_from_candidate": not (watched[a.original] & 2)}
    guards.update({"required:" + name: bool(watched[name] & 2) for name in a.required})
    guards.update({"forbidden:" + name: not (watched[name] & 2) for name in a.forbid})
    native.dump(out / "supplier_reachability.json", {"membership": watched, "guards": guards,
                "all_guards_pass": all(guards.values()), "full_RH_replay": False})
    native.require(all(guards.values()), "Candidate dependency guards failed")
    summary = json.loads((out / "union_summary.json").read_text())
    summary.update(scope=a.scope, all_supplier_guards_pass=True, full_RH_replay=False)
    native.dump(out / "interface_graph_summary.json", summary)
    print(json.dumps(summary), flush=True)


if __name__ == "__main__":
    main()
