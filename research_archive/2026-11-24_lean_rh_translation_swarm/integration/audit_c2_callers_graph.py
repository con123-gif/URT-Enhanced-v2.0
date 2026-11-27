#!/usr/bin/env python3
"""Audit ten C2 caller roots from actual checked module/cache receipts.

No source build. Reuse the authenticated exporter and independent verifier,
including the strict Lean 4.35 projection-collector adapter. This is a local
C2 frontier, not the complete RH graph.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import subprocess

from audit_active_b2_graph import adapt_exporter_435
import replay_c2_built_workspace as c2
import run_compact_b2_native_replay as native

ROOTS = ["exists_equalRankThetaRatio_value", "run78_equalRankThetaRatio_value",
         "exchange_theorem", "run79_exchange_theorem",
         "explicit_matching", "run79_explicit_matching",
         "stdClassSum_det_modKernel_eq", "run79_stdClassSum_det_modKernel_eq",
         "stdClassSum_carrierXi_eq_carrierForm", "run79_stdClassSum_carrierXi_eq_carrierForm"]


def check_object(directory, obj, expected_name):
    native.require(obj["name"] == expected_name and obj["artifacts"], "Missing checked C2 module")
    native.require(any(item["name"] == expected_name + ".olean" for item in obj["artifacts"]),
                   "No primary C2 object")
    for item in obj["artifacts"]:
        native.require(Path(item["name"]).name == item["name"], "Unexpected module object path")
        with (directory / item["name"]).open("rb") as stream:
            native.require(hashlib.file_digest(stream, "sha256").hexdigest() == item["sha256"],
                           "C2 object digest mismatch")


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--module-dir", type=Path, required=True)
    p.add_argument("--artifact-receipt", type=Path,
                   help="Actual Actions status.json inventory, needed by the original C2 propagation receipt")
    p.add_argument("--compact-root", type=Path)
    p.add_argument("--lean-bin", type=Path)
    p.add_argument("--native-exporter-dir", type=Path,
                   help="Inspect checked private objects with an authenticated compiled exporter")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--prepare-only", action="store_true")
    p.add_argument("--seconds", type=int, default=1800)
    args = p.parse_args()
    directory, out = args.module_dir.resolve(), args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    receipt = json.loads((directory / "c2_replacement_results.json").read_text())
    native.require(receipt["compact"] == native.PIN and receipt["mathlib"] == native.MATHLIB
                   and receipt["all_requested_checks_ok"] is True
                   and receipt["caller_replacement_checked"] is True
                   and receipt["carrier_propagation_checked"] is True,
                   "C2 caller chain lacks a complete actual compiler receipt")
    native.require(receipt["source_blob"] == c2.SOURCE_BLOB and
                   receipt["carrier_propagation"]["source_blob"] == c2.PROPAGATION_BLOB,
                   "Changed C2 peer inputs")
    native.require(native.git_blob((directory / "C2Caller.lean").read_bytes()) == receipt["replay_source_blob"],
                   "Changed adapted equal-rank source")
    native.require(native.git_blob((directory / "C2Propagation.lean").read_bytes()) == c2.PROPAGATION_BLOB,
                   "Changed Carrier propagation source")
    for label, names in [("c2_candidate", c2.NAMES), ("c2_propagated_callers", c2.PROPAGATION_NAMES)]:
        step = receipt["steps"][label]
        native.require(step["returncode"] == 0 and step["axiom_audit_ok"] is True
                       and set(step["axioms"]) == set(names), "Incomplete C2 declaration roster")
        native.require(all(set(axes) <= {"propext", "Classical.choice", "Quot.sound"}
                           for axes in step["axioms"].values()), "Unexpected C2 axiom")
    base = receipt["compiled_module"]
    combined = receipt.get("compiled_together") is True
    check_object(directory, base, "C2Combined" if combined else "C2Caller")
    propagated = receipt.get("propagated_module")
    if combined:
        native.require(native.git_blob((directory / "C2Combined.lean").read_bytes())
                       == receipt["combined_source_blob"], "Changed combined C2 source")
    elif propagated is None:
        native.require(args.artifact_receipt is not None, "Provide authenticated Actions object inventory")
        artifact = json.loads(args.artifact_receipt.read_text())
        native.require(artifact["id"] == "rh-compact-c2-carrier-replay-20261127",
                       "Wrong C2 Actions inventory")
        entries = artifact["outputs_committed"] + artifact["outputs_artifact_only"]
        selected = [item for item in entries if item["path"].startswith("c2/C2Propagation.olean")]
        propagated = {"name": "C2Propagation", "artifacts": [
            {**item, "name": Path(item["path"]).name} for item in selected]}
    if not combined:
        check_object(directory, propagated, "C2Propagation")
    spec = importlib.util.spec_from_file_location("c2_union_export", native.KERNEL / "RUN26_COMPACT_GRAPH.py")
    graph = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(graph)
    graph.ROOTS = ROOTS
    exporter = graph.driver()
    native.require(exporter.count("import Main\n") == 1, "Changed exporter import anchor")
    module_name = "C2Combined" if combined else "C2Propagation"
    source = exporter.replace("import Main\n", "import " + module_name + "\nset_option pp.fullNames true\n", 1)
    source = adapt_exporter_435(source)
    target = out / "C2CallersGraph.lean"
    target.write_text(source)
    manifest = {"compact": native.PIN, "mathlib": native.MATHLIB, "roots": ROOTS,
                "scope": "ten local C2 caller frontiers; not the full RH graph",
                "source_blob": native.git_blob(target.read_bytes()),
                "checked_modules": [base] if combined else [base, propagated], "new_Lean_execution": False,
                "full_RH_replay": False, "constructor_inclusive_guards_pass": False}
    native.dump(out / "graph_input_manifest.json", manifest)
    if args.prepare_only:
        print(json.dumps(manifest))
        return
    native.require(args.compact_root is not None and args.lean_bin is not None,
                   "Provide the already-built pinned C2 workspace and Lean bin")
    root = args.compact_root.resolve()
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN, "Wrong compact pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib") == native.MATHLIB,
                   "Wrong Mathlib pin")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"], cwd=root, check=True)
    env = os.environ.copy()
    env["PATH"] = str(args.lean_bin.resolve()) + os.pathsep + env["PATH"]
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1",
               CATHEDRAL_RH_GRAPH=str(out / "c2_callers_graph.jsonl"))
    setup = subprocess.check_output(["lake", "env", "python3", "-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in "
            "['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            cwd=root, env=env, text=True, timeout=300)
    (out / "environment.log").write_text(setup)
    env.update(json.loads(setup.strip().splitlines()[-1]))
    env["LEAN_PATH"] = str(directory) + os.pathsep + env["LEAN_PATH"]
    if args.native_exporter_dir:
        from prepare_native_graph_exporter import validated_executable
        binary, build = validated_executable(args.native_exporter_dir)
        run = native.step([binary, args.lean_bin.resolve().parent, module_name,
                           out / "c2_callers_graph.jsonl", *ROOTS],
                          root, env, out / "compile.log", args.seconds)
        axioms = {}
        graph_path = out / "c2_callers_graph.jsonl"
        if run["returncode"] == 0 and graph_path.is_file():
            with graph_path.open() as stream:
                header = json.loads(stream.readline())
            for row in header.get("root_axioms", []):
                name = ".".join(str(x[1]) for x in row["root"])
                axioms[name] = [".".join(str(x[1]) for x in ax)
                                for ax in row["lean_collect_axioms"]]
        run.update(axioms=axioms,
                   axiom_audit_ok=set(axioms) == set(ROOTS) and all(
                       set(axes) <= {"propext", "Classical.choice", "Quot.sound"}
                       for axes in axioms.values()),
                   native_exporter_build=build,
                   native_graph_execution=True, new_Lean_execution=False)
    else:
        run = native.step([str(args.lean_bin.resolve() / "lean"), "--tstack=400000", "-j", "2", target],
                          root, env, out / "compile.log", args.seconds)
        run.update(native.audit(out / "compile.log", ROOTS))
        run.update(native_graph_execution=False, new_Lean_execution=True)
    native.dump(out / "graph_execution.json", {**run, "full_RH_replay": False})
    native.require(run["returncode"] == 0 and run["axiom_audit_ok"] is True,
                   "C2 graph compiler or axiom audit failed; retain exact log")
    graph.audit_union(out / "c2_callers_graph.jsonl", out, out)
    watched = {name: None for name in ROOTS +
               ["RHCharacterBoxes77.exchange_of_standard_pairs", "exchange_of_partners"]}
    with (out / "root_membership.jsonl").open() as stream:
        for line in stream:
            row = json.loads(line)
            name = ".".join(str(x[1]) for x in row["id"])
            if name in watched:
                watched[name] = row["root_mask"]
    native.require(all(mask is not None for mask in watched.values()), "Missing C2 caller/supplier root")
    guards = {}
    for stage in range(5):
        later = sum(1 << (2 * i + 1) for i in range(stage, 5))
        guards["old_stage_" + str(stage) + "_absent_from_new_descendants"] = not (
            watched[ROOTS[2 * stage]] & later)
        guards["new_stage_" + str(stage) + "_reachable_from_new_descendants"] = (
            watched[ROOTS[2 * stage + 1]] & later == later)
    all_new = sum(1 << (2 * i + 1) for i in range(5))
    outer = all_new & ~(1 << 1)
    guards.update({
        "standard_pair_helper_reachable_from_all_new_roots":
            watched["RHCharacterBoxes77.exchange_of_standard_pairs"] & all_new == all_new,
        "general_exchange_absent_from_new_equal_rank_root": not (watched["exchange_of_partners"] & (1 << 1)),
        "general_outer_exchange_deliberately_retained": watched["exchange_of_partners"] & outer == outer,
    })
    native.dump(out / "caller_reachability.json", {"roots": ROOTS, "membership": watched,
                "guards": guards, "all_guards_pass": all(guards.values()),
                "constructor_inclusive": True, "full_RH_replay": False})
    native.require(all(guards.values()), "C2 graph differs from advertised local substitution")
    summary = json.loads((out / "union_summary.json").read_text())
    summary.update(scope=manifest["scope"], constructor_inclusive_guards_pass=True,
                   full_RH_replay=False, root_obligation_completion_percentage=None)
    native.dump(out / "c2_graph_summary.json", summary)
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
