#!/usr/bin/env python3
"""Check memory storage against the exact saved native core graph and audit."""
import argparse
import json
import os
from pathlib import Path

import run_compact_b2_native_replay as native
import RUN26_COMPACT_GRAPH as graph
import memory_graph_io
from memory_graph_io import memory_file, memory_exporter, audit_in_memory, archive_graph
from prepare_native_graph_exporter import execute_graph


def main():
    p = argparse.ArgumentParser()
    for name in ["compact-root", "lean-bin", "base-module-dir", "exporter-dir", "exporter-archive", "out"]:
        p.add_argument("--" + name, type=Path, required=True)
    a = p.parse_args()
    out, original = a.out.resolve(), a.exporter_dir.resolve()
    out.mkdir(parents=True, exist_ok=True)
    env = os.environ.copy()
    env.update(json.loads((a.base_module_dir / "environment.log").read_text().strip().splitlines()[-1]))
    expected = "b62ecf5877e0701fbd5da4b647ab97e145ae0c13fec27ec33c27fefd4d75b46a"
    roots = ["Nat.le_refl"]
    with memory_exporter(original, out / "exporter", a.exporter_archive.resolve(), expected) as exporter:
        with memory_file("core-graph") as raw:
            result = execute_graph(exporter, a.compact_root, env, a.lean_bin, "Init", roots,
                                   raw, out / "native.log", 120)
            native.require(result["returncode"] == 0 and result["axiom_audit_ok"],
                           "Memory native control failed")
            native.require(raw.read_bytes() == (original / "core_native.jsonl").read_bytes(),
                           "Changed native core graph bytes")
            archive = archive_graph(raw, out / "core_graph.jsonl.gz")
            plain = out / "plain"
            plain.mkdir(exist_ok=True)
            graph.ROOTS = roots
            graph.audit_union(original / "core_native.jsonl", plain, plain)
            audit_in_memory(graph, raw, out / "memory", roots)
            names = ["union_summary.json", "root_audits.json", "root_membership.jsonl", "audit-0.json"]
            for name in names:
                native.require((plain / name).read_bytes() == (out / "memory" / name).read_bytes(),
                               "Memory audit changed " + name)
            record = {"native_execution": result, "archive": archive,
                      "control_source_blob": native.git_blob(Path(__file__).read_bytes()),
                      "memory_io_source_blob": native.git_blob(Path(memory_graph_io.__file__).read_bytes()),
                      "same_as_recorded_native_core_bytes": True, "unchanged_independent_validator": True,
                      "plain_and_memory_audits_byte_identical": names, "all_requested_checks_ok": True,
                      "new_Lean_execution": False, "new_proof_compilation": False, "full_RH_replay": False}
            native.dump(out / "memory_io_control_results.json", record)
            print(json.dumps({"all_requested_checks_ok": True, "raw_bytes": archive["raw_bytes"],
                              "native_seconds": result["seconds"], "identical_audit_files": names}))


if __name__ == "__main__":
    main()
