#!/usr/bin/env python3
"""Audit both actual signed product-formula routes, including constructors.

Use the same authenticated native inspector and independent Node verifier.
Memory file descriptors change only temporary storage, with a recorded
plain/memory core control. No original source build or proof is repeated.
"""
import argparse
import json
import os
from pathlib import Path

import run_compact_b2_native_replay as native
import RUN26_COMPACT_GRAPH as graph
import memory_graph_io
from audit_c2_callers_graph import check_object
from memory_graph_io import archive_graph, audit_in_memory, memory_exporter, memory_file, sha
from prepare_native_graph_exporter import execute_graph

EXE_SHA = "b62ecf5877e0701fbd5da4b647ab97e145ae0c13fec27ec33c27fefd4d75b46a"
PAIRS = [
    {"original": "HeightLe.nonneg", "candidate": "c2_heightLe_nonneg_arch",
     "required": ["c2_isAlgebraic_of_arch", "exists_ringEquiv_extend", "log_product_formula"],
     "forbidden": ["isAlgebraic_of_padic"]},
    {"original": "c2_heightLe_reciprocal_budget", "candidate": "c2_heightLe_single_witness_budget",
     "required": ["c2_heightLe_nonneg_arch", "c2_isAlgebraic_of_arch", "c2_heightLe_of_sq",
                  "c2_norm_map_le_exp_half", "HeightLe.mul", "log_product_formula",
                  "exists_ringEquiv_extend"],
     "forbidden": ["HeightLe.nonneg", "isAlgebraic_of_padic"]},
]


def main():
    p = argparse.ArgumentParser()
    for name in ["compact-root", "lean-bin", "base-module-dir", "original-cache",
                 "proof-receipt", "exporter-dir", "exporter-archive", "memory-control", "out"]:
        p.add_argument("--" + name, type=Path, required=True)
    a = p.parse_args()
    root, base, cache, out = [x.resolve() for x in
                            [a.compact_root, a.base_module_dir, a.original_cache, a.out]]
    out.mkdir(parents=True, exist_ok=True)
    proof_path = a.proof_receipt.resolve()
    r = json.loads(proof_path.read_text())
    native.require(r["compact"] == native.PIN and r["mathlib"] == native.MATHLIB
                   and r["all_requested_checks_ok"] is True
                   and r["compiler"]["returncode"] == 0
                   and r["compiler"]["axiom_audit_ok"] is True
                   and r["compiler"]["direct_supplier_guards_observed"] is True
                   and "-Ddebug.skipKernelTC=false" in r["argv"],
                   "Unaccepted single-witness proof receipt")
    module = r["compiled_module"]
    native.require(module["name"] == "C2SingleWitnessCombined", "Wrong combined proof module")
    check_object(proof_path.parent, module, module["name"])
    native.require(native.git_blob((proof_path.parent / (module["name"] + ".lean")).read_bytes())
                   == r["source_blob"], "Changed combined proof source")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN
                   and native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib")
                   == native.MATHLIB, "Wrong source or Mathlib pin")
    original_inputs = []
    for record in r["original_extensions"]:
        rel = record["module"].replace(".", "/")
        obj, source = cache / (rel + ".olean"), root / "src" / (rel + ".lean")
        native.require(record["compiler"]["returncode"] == 0
                       and sha(obj) == record["sha256"]
                       and native.git_blob(source.read_bytes()) == record["source_blob"],
                       "Changed original height prerequisite")
        original_inputs.append({k: record[k] for k in ["module", "source_blob", "sha256"]})
    b = json.loads((base / "c2_replacement_results.json").read_text())
    native.require(b["all_requested_checks_ok"] is True and r["checked_input_module"] == b["compiled_module"],
                   "Different accepted original-cache provenance")
    check_object(base, b["compiled_module"], "C2Combined")
    control = json.loads(a.memory_control.resolve().read_text())
    native.require(control["all_requested_checks_ok"] is True
                   and control["same_as_recorded_native_core_bytes"] is True
                   and control["unchanged_independent_validator"] is True
                   and len(control["plain_and_memory_audits_byte_identical"]) == 4,
                   "Temporary-memory graph mode has not passed its exact core control")
    native.require(control["memory_io_source_blob"] ==
                   native.git_blob(Path(memory_graph_io.__file__).read_bytes()),
                   "Memory graph adapter changed after its actual core control")
    env = os.environ.copy()
    saved_env = json.loads((proof_path.parent / "environment.log").read_text().strip().splitlines()[-1])
    original_env = json.loads((base / "environment.log").read_text().strip().splitlines()[-1])
    native.require(saved_env["LEAN_PATH"] == str(cache) + os.pathsep + original_env["LEAN_PATH"],
                   "Unexpected original-cache environment")
    env.update(saved_env)
    env["LEAN_PATH"] = str(proof_path.parent) + os.pathsep + env["LEAN_PATH"]
    roots = [name for pair in PAIRS for name in [pair["original"], pair["candidate"]]]
    manifest = {"compact": native.PIN, "mathlib": native.MATHLIB, "source_blob": r["source_blob"],
                "checked_proof_module": module, "original_inputs": original_inputs,
                "roots": roots, "pairs": PAIRS, "temporary_graph_storage": "memory file descriptors",
                "unchanged_independent_validator": "2e431301970196a6b786d004fb16a4320a25fe8e",
                "new_Lean_execution": False, "full_RH_replay": False}
    native.dump(out / "input_manifest.json", manifest)
    with memory_exporter(a.exporter_dir.resolve(), out / "exporter", a.exporter_archive.resolve(), EXE_SHA) as exporter:
        with memory_file("single-witness-graph") as raw:
            run = execute_graph(exporter, root, env, a.lean_bin, module["name"], roots,
                                raw, out / "graph.log", 1800)
            native.dump(out / "graph_execution.json", run)
            native.require(run["returncode"] == 0 and run["axiom_audit_ok"] is True,
                           "Single-witness graph export failed")
            saved = archive_graph(raw, out / "single_witness_graph.jsonl.gz")
            native.dump(out / "graph_retention.json", saved)
            audit_in_memory(graph, raw, out, roots)
    watched = {name: 0 for name in roots}
    for pair in PAIRS:
        watched.update({name: 0 for name in pair["required"] + pair["forbidden"]})
    with (out / "root_membership.jsonl").open() as stream:
        for line in stream:
            row = json.loads(line)
            name = ".".join(str(x[1]) for x in row["id"])
            if name in watched:
                watched[name] = row["root_mask"]
    guards = {}
    for i, pair in enumerate(PAIRS):
        old_mask, new_mask = 1 << (2 * i), 1 << (2 * i + 1)
        prefix = pair["candidate"] + ":"
        guards[prefix + "original_reaches_itself"] = bool(watched[pair["original"]] & old_mask)
        guards[prefix + "candidate_reaches_itself"] = bool(watched[pair["candidate"]] & new_mask)
        guards[prefix + "original_absent"] = not (watched[pair["original"]] & new_mask)
        guards.update({prefix + "required:" + name: bool(watched[name] & new_mask)
                       for name in pair["required"]})
        guards.update({prefix + "forbidden:" + name: not (watched[name] & new_mask)
                       for name in pair["forbidden"]})
    native.dump(out / "supplier_reachability.json", {"membership": watched, "guards": guards,
                "all_guards_pass": all(guards.values())})
    native.require(all(guards.values()), "Single-witness transitive supplier guard failed")
    summary = json.loads((out / "union_summary.json").read_text())
    native.require(summary["missing"] == 0 and all(x["exit"] == 0 for x in summary["per_root"].values()),
                   "Independent graph validation failed")
    summary.update(all_supplier_guards_pass=True, supplier_guards=len(guards),
                   scope="one native product-formula replacement and the same signed reciprocal budget",
                   full_RH_replay=False, new_Lean_execution=False)
    native.dump(out / "single_witness_graph_summary.json", summary)
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
