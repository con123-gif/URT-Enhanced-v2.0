#!/usr/bin/env python3
"""Prepare/replay constructor-inclusive comparisons of six or eight B2 roots.

This is a local B2 frontier, never the whole RH frontier or a completion
denominator. Reuse the authenticated exporter and verifier. A capable,
pinned CrudeEnergy workspace must already be built; no Main build/import.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import subprocess

import run_compact_b2_native_replay as native

ROOTS = ["Filling.sum_pairWeight_le", "Filling.b2_active_sum_pairWeight_le",
         "Filling.energy_le_of_level_pairs", "Filling.b2_active_energy_le_of_level_pairs",
         "Filling.energy_le_of_linkEnergy_le", "Filling.b2_active_energy_le_of_linkEnergy_le"]
HERE = Path(__file__).resolve().parent


def adapt_exporter_435(source):
    """Keep the old exporter immutable; match the pinned FoldConsts API.

    Lean 4.35 includes .proj carrier names in getUsedConstants. The old
    cross-check compared it only with .const nodes. Retain exact equality
    against an independent union, and preserve separate graph fields.
    """
    old = """  let found ← cs.get
  let builtin := e.getUsedConstants
  unless found.size == builtin.size && builtin.all (fun c => found.contains c) do
    throw (IO.userError "getUsedConstants disagrees with independent traversal")
  let projections ← ps.get
"""
    new = """  let found ← cs.get
  let projections ← ps.get
  let mut expected := found
  for name in projections.toArray do
    expected := expected.insert name
  let builtin := e.getUsedConstants
  unless expected.size == builtin.size && builtin.all (fun c => expected.contains c) do
    let missing := expected.toArray.filter (fun c => !builtin.contains c)
    let extra := builtin.filter (fun c => !expected.contains c)
    throw (IO.userError s!"getUsedConstants disagrees with independent const/projection traversal; missing={missing}; extra={extra}")
"""
    native.require(source.count(old) == 1, "Changed exporter collector anchor")
    source = source.replace(old, new, 1)
    anchor = "return ⟨builtin, projections.toArray, hasNat, hasStr⟩"
    native.require(source.count(anchor) == 1, "Changed exporter reference return")
    source = source.replace(anchor, "return ⟨found.toArray, projections.toArray, hasNat, hasStr⟩", 1)
    source = source.replace("Record projection carrier names separately: FoldConsts skips them.",
                            "Record .const nodes and projection carriers separately; Lean 4.35 FoldConsts includes both.")
    return source


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--prepare-only", action="store_true")
    parser.add_argument("--compact-root", type=Path)
    parser.add_argument("--lean-bin", type=Path)
    parser.add_argument("--module-dir", type=Path,
                        help="Reuse the checked active_b2_energy object and its exact source receipt")
    parser.add_argument("--fused-module-dir", type=Path,
                        help="Also import a checked count-to-energy fusion; needs --module-dir")
    parser.add_argument("--seconds", type=int, default=1200,
                        help="Explicit graph compilation limit; no native source rebuild")
    args = parser.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    graph_file = native.KERNEL / "RUN26_COMPACT_GRAPH.py"
    spec = importlib.util.spec_from_file_location("b2_kernel_graph", graph_file)
    graph = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(graph)
    roots = list(ROOTS)
    prefix = "b2_active_"
    if args.fused_module_dir:
        native.require(args.module_dir is not None, "Fused object needs its checked base module")
        prefix = "b2_fused_"
        roots = [name.replace("b2_active_", prefix) for name in roots]
        roots += ["Filling.tsum_invPowWeight_le_of_codim_le",
                  "Filling.b2_fused_tsum_invPowWeight_le_of_codim_le"]
    graph.ROOTS = roots
    exporter = graph.driver()
    native.require(exporter.count("import Main\n") == 1, "Changed exporter import")
    exporter = exporter.replace("import Main\n", "", 1)
    exporter = adapt_exporter_435(exporter)
    config = json.loads((HERE / "B2_ACTIVE_FULL_ENERGY_INPUT.json").read_text())
    parts = []
    for part in config["parts"]:
        raw = (native.SWARM / part["source"]).read_bytes()
        native.require(native.git_blob(raw) == part["source_blob"], "Changed candidate graph input")
        parts.append(re.sub(r"^import[^\n]*\n", "", raw.decode(), flags=re.M))
    module_receipt = None
    if args.module_dir:
        module_receipt = json.loads((args.module_dir / "energy_replacement_results.json").read_text())
        native.require(module_receipt["energy_caller_checked"] is True and
                       module_receipt["full_energy_chain_checked"] is True and
                       module_receipt["parts"] == config["parts"], "Unverified/different B2 module")
        obj = module_receipt["compiled_module"]
        native.require(obj["name"] == "active_b2_energy" and obj["artifacts"], "Missing B2 object")
        for item in obj["artifacts"]:
            native.require(Path(item["name"]).name == item["name"], "Unexpected module artifact name")
            with (args.module_dir / item["name"]).open("rb") as stream:
                native.require(hashlib.file_digest(stream, "sha256").hexdigest() == item["sha256"],
                               "B2 module artifact digest mismatch")
        module_name = "active_b2_energy"
        if args.fused_module_dir:
            fused = json.loads((args.fused_module_dir / "fused_b2_results.json").read_text())
            native.require(fused["fused_chain_checked"] is True and fused["parts"] == config["parts"]
                           and fused["compact"] == native.PIN and fused["mathlib"] == native.MATHLIB,
                           "Unverified/different fused B2 module")
            native.require(native.git_blob((args.fused_module_dir / "active_b2_fused.lean").read_bytes())
                           == fused["source_blob"], "Changed fused source")
            fused_object = fused["compiled_module"]
            native.require(fused_object["name"] == "active_b2_fused" and fused_object["artifacts"],
                           "Missing fused object")
            for item in fused_object["artifacts"]:
                native.require(Path(item["name"]).name == item["name"], "Unexpected fused object path")
                with (args.fused_module_dir / item["name"]).open("rb") as stream:
                    native.require(hashlib.file_digest(stream, "sha256").hexdigest() == item["sha256"],
                                   "Fused object digest mismatch")
            module_name = "active_b2_fused"
        source = ("import Lean\nimport " + module_name + "\nset_option pp.fullNames true\n\n" +
                  exporter.replace("import Lean\n", "", 1))
    else:
        # The extra energy fragment shares its predecessor's variable context.
        # Close their combined include scope before adding exporter definitions.
        source = ("import Lean\nimport New.Filling.CrudeEnergy\nimport Mathlib.Tactic\n\nsection\n" +
                  "\n".join(parts) + "\nend\nset_option pp.fullNames true\n\n" +
                  exporter.replace("import Lean\n", "", 1))
    native.require(not re.search(r"^import (?:Main|New\.Main)\b", source, re.M),
                   "Forbidden RH root import")
    path = out / "ActiveB2Graph.lean"
    path.write_text(source)
    scope = ("eight local fused count/pair/energy frontiers; not the full RH frontier"
             if args.fused_module_dir else "six local B2 caller frontiers; not the full RH frontier")
    manifest = {"compact": native.PIN, "mathlib": native.MATHLIB, "roots": roots,
                "parts": config["parts"], "generated_source_blob": native.git_blob(source.encode()),
                "exporter_source_blob": "ee4efebb066f6775fa551ae9104cfa973e585071",
                "collector_adapter": "Lean 4.35 getUsedConstants equals independent .const union .proj carriers",
                "collector_crosscheck_weakened": False,
                "scope": scope,
                "checked_module_reused": module_receipt is not None,
                "fused_chain_module_reused": args.fused_module_dir is not None,
                "new_Lean_execution": False, "full_RH_replay": False}
    if args.fused_module_dir:
        manifest["fused_source_blob"] = fused["source_blob"]
        manifest["fused_module"] = fused_object
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
    if args.module_dir:
        setup = subprocess.check_output(["lake", "env", "python3", "-c",
                "import os,json; print(json.dumps({k:os.environ[k] for k in "
                "['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
                cwd=root, env=env, text=True, timeout=300)
        (out / "graph_environment.log").write_text(setup)
        env.update(json.loads(setup.strip().splitlines()[-1]))
        env["LEAN_PATH"] = str(args.module_dir.resolve()) + os.pathsep + env["LEAN_PATH"]
        if args.fused_module_dir:
            env["LEAN_PATH"] = str(args.fused_module_dir.resolve()) + os.pathsep + env["LEAN_PATH"]
        command = [str(args.lean_bin.resolve() / "lean"), "--tstack=400000", "-j", "2", path]
    else:
        command = ["lake", "env", "lean", "--tstack=400000", path]
    receipt = native.step(command, root, env, out / "local_b2_graph.log", args.seconds)
    receipt.update(native.audit(out / "local_b2_graph.log", roots))
    receipt.update(new_Lean_execution=True, full_RH_replay=False)
    native.dump(out / "graph_execution.json", receipt)
    native.require(receipt["returncode"] == 0 and receipt["axiom_audit_ok"] is True,
                   "Local B2 graph compilation/axiom checks failed")
    graph.audit_union(out / "local_b2_graph.jsonl", out, out)
    outer = "Filling." + prefix + "outer_frameValueIndex_dvd"
    inner = "Filling." + prefix + "inner_frameValueIndex_dvd"
    lower = "Filling." + prefix + "energy_le_of_level_lt"
    watched = {name: None for name in roots + [outer, inner,
               "Filling.energy_le_of_level_lt", lower]}
    if args.fused_module_dir:
        watched["RHB2Fusion.skew_correction_mul"] = None
    optional = ({name: 0 for name in config["theorems"]} if args.fused_module_dir else {})
    with (out / "root_membership.jsonl").open() as stream:
        for line in stream:
            row = json.loads(line)
            name = ".".join(str(component[1]) for component in row["id"])
            if name in watched:
                watched[name] = row["root_mask"]
            if name in optional:
                optional[name] = row["root_mask"]
    native.require(all(mask is not None for mask in watched.values()),
                   "Missing caller or bridge in constructor-inclusive graph")
    new_roots = (1 << 1) | (1 << 3) | (1 << 5)
    guards = {
        "old_pair_absent_from_all_new_roots": not (watched[roots[0]] & new_roots),
        "old_level_energy_absent_from_new_energy_roots": not (watched[roots[2]] & ((1 << 3) | (1 << 5))),
        "old_full_energy_absent_from_new_full_energy": not (watched[roots[4]] & (1 << 5)),
        "old_lower_level_absent_from_new_full_energy":
            not (watched["Filling.energy_le_of_level_lt"] & (1 << 5)),
        "new_pair_reachable_from_new_energy_roots":
            watched[roots[1]] & ((1 << 3) | (1 << 5)) == ((1 << 3) | (1 << 5)),
        "new_lower_level_reachable_from_new_full_energy":
            bool(watched[lower] & (1 << 5)),
        "outer_bridge_reachable_from_all_new_roots":
            watched[outer] & new_roots == new_roots,
        "inner_bridge_reachable_from_all_new_roots":
            watched[inner] & new_roots == new_roots,
    }
    if args.fused_module_dir:
        all_new_roots = new_roots | (1 << 7)
        guards.update({
            "old_count_absent_from_all_fused_roots": not (watched[roots[6]] & all_new_roots),
            "new_count_reachable_from_all_fused_callers": watched[roots[7]] & new_roots == new_roots,
            "skew_helper_reachable_from_all_fused_roots":
                watched["RHB2Fusion.skew_correction_mul"] & all_new_roots == all_new_roots,
            "unfused_active_suppliers_absent_from_all_fused_roots":
                all(not (mask & all_new_roots) for mask in optional.values()),
        })
    native.dump(out / "caller_reachability.json", {"roots": roots, "membership": watched,
                "optional_old_active_suppliers": optional,
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
