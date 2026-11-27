#!/usr/bin/env python3
"""Independently replay the exact determinant/Carrier chain in one workspace.

The official-source bootstrap builds Carrier once. All accepted replacement
sources are authenticated before downloading, then compiled through the normal
kernel. A separate constructor-inclusive graph audit checks both full original
statements. Workflow success is never substituted for these receipts.
"""
import argparse
import contextlib
import gzip
import hashlib
import io
import json
from pathlib import Path
import re
import shutil
import sys

import replay_c2_built_workspace as c2
import replay_c2_combined_built as combined
import run_compact_b2_native_replay as native

HERE = Path(__file__).resolve().parent
BASE_SOURCE = "aba46120ca4118decd864f817b51bcca2bc31c19"
GUARD_CONFIG = "017c112510e5eb6f9e338b6fdf149d89499d5aa6"
STAGES = [
    ("C2_STANDARD_EXCHANGE_UNIFORM.lean", "1b945d4df64ade81cb8ccf5f345a52668afc5f7a",
     "C2StandardExchange", "standard_exchange_results.json", "C2_STANDARD_EXCHANGE:",
     ["c2_standard_exchange_uniform"], []),
    ("C2_DETERMINANT_LIFT.lean", "052a8d386b6573cac924804cbc7640a34957b045",
     "C2DeterminantLift", "determinant_lift_results.json", "C2_DETERMINANT_LIFT:",
     ["c2_lift_inverse_determinant", "c2_lift_one_empty_columns", "c2_standard_column_empty"], []),
    ("C2_DETERMINANT_EXCHANGE.lean", "acefc3125d97bd02906c555c35e46722d6a31a6b",
     "C2DeterminantExchange", "determinant_exchange_results.json", "C2_DETERMINANT_EXCHANGE:",
     ["c2_determinant_exchange"], [0, 1]),
    ("C2_REAL_MATCHING_STANDARD.lean", "45fc666e330b42e0c38605f22e190748168e3a9d",
     "C2RealMatchingStandard", "real_standard_results.json", "C2_REAL_STANDARD:",
     ["c2_real_matching_standard", "c2_real_determinant_invariant"], []),
    ("C2_DETERMINANT_CLASS_SUM.lean", "67473a75e141e04e3bed87f97e57cb5979c7bce1",
     "C2DeterminantClassSum", "determinant_class_sum_results.json", "C2_DETERMINANT_CLASS_SUM:",
     ["c2_empty_matching", "c2_stdClassSum_det_modKernel_eq"], [0, 1, 2, 3]),
    ("C2_DETERMINANT_CARRIER_TRANSPORT.lean", "5083aea866074ba1e52b025342752df605581c78",
     "C2DeterminantCarrierTransport", "determinant_carrier_results.json", "C2_DETERMINANT_CARRIER:",
     ["c2_stdClassSum_carrierXi_eq_carrierForm"], [0, 1, 2, 3, 4]),
]


def preflight(out):
    """Authenticate actual inputs; this function does not execute Lean."""
    previous = sys.argv
    try:
        sys.argv = [sys.argv[0], "--prepare-only", "--out", str(out / "base")]
        with contextlib.redirect_stdout(io.StringIO()):
            combined.main()
    finally:
        sys.argv = previous
    base = json.loads((out / "base/c2_replacement_results.json").read_text())
    native.require(base["combined_source_blob"] == BASE_SOURCE, "Changed accepted combined C2 source")
    prepared = []
    for i, (filename, expected, module, receipt, guard, names, deps) in enumerate(STAGES):
        raw = (HERE / filename).read_bytes()
        native.require(native.git_blob(raw) == expected, "Changed accepted proof: " + filename)
        code = re.sub(r"/-.*?-/", "", raw.decode(), flags=re.S)
        code = re.sub(r"--[^\n]*", "", code)
        native.require(not re.search(r"\b(sorry|admit|axiom)\b", code), "Unproved code: " + filename)
        native.require(not re.search(r"^\s*import\s+(?:Main|New\.Main)\b", code, re.M),
                       "RH root import forbidden")
        native.require(all(j < i for j in deps), "Dependency order is not acyclic")
        native.require(guard in code and all("#print axioms " + n in code for n in names),
                       "Missing actual guard or axiom probe: " + filename)
        prepared.append({"source": filename, "source_blob": expected, "module": module,
                         "receipt": receipt, "guard": guard, "theorems": names, "dependencies": deps})
    config = (HERE / "C2_DETERMINANT_CARRIER_GRAPH.json").read_bytes()
    native.require(native.git_blob(config) == GUARD_CONFIG, "Changed complete graph guard roster")
    native.PEERS = {}
    native.SOURCES = {"New/Exchange/EqualRankValue.lean": c2.ORIGINAL_BLOB,
                      **c2.PROPAGATION_ORIGINAL_BLOBS}
    native.ORIGINALS = c2.ORIGINALS + c2.PROPAGATION_ORIGINALS
    native.preflight()
    manifest = {"compact": native.PIN, "mathlib": native.MATHLIB,
                "base_source_blob": BASE_SOURCE, "stages": prepared,
                "graph_config_blob": GUARD_CONFIG, "new_Lean_execution": False,
                "full_RH_replay": False}
    native.dump(out / "pipeline_input_manifest.json", manifest)
    return manifest


def archive_graph(directory):
    """Keep the exact stream but avoid two large copies in the job artifact."""
    raw, packed = directory / "interface_graph.jsonl", directory / "interface_graph.jsonl.gz"
    digest = hashlib.sha256()
    size = 0
    with raw.open("rb") as source, gzip.open(packed, "wb", compresslevel=6) as target:
        for chunk in iter(lambda: source.read(1048576), b""):
            digest.update(chunk)
            size += len(chunk)
            target.write(chunk)
    check = hashlib.sha256()
    count = 0
    with gzip.open(packed, "rb") as stream:
        for chunk in iter(lambda: stream.read(1048576), b""):
            check.update(chunk)
            count += len(chunk)
    native.require(count == size and check.digest() == digest.digest(), "Graph archive changed its stream")
    with packed.open("rb") as stream:
        packed_hash = hashlib.file_digest(stream, "sha256").hexdigest()
    native.dump(directory / "graph_archive_receipt.json", {
        "raw_name": raw.name, "raw_bytes": size, "raw_sha256": digest.hexdigest(),
        "archive_name": packed.name, "archive_bytes": packed.stat().st_size,
        "archive_sha256": packed_hash, "decompressed_sha256_verified": True,
        "raw_removed_after_verification": True, "full_RH_replay": False})
    raw.unlink()


def replay_pipeline(root, lean_bin, cache_receipt, out, env, run_step, state, save):
    base = out / "base"

    def run(label, argv, seconds):
        result = run_step(argv, root, env, out / (label + ".log"), seconds)
        state["steps"][label] = result
        save()
        native.require(result["returncode"] == 0, "Pipeline phase failed: " + label)

    run("combined", [sys.executable, HERE / "replay_c2_combined_built.py", "--out", base,
                     "--compact-root", root, "--lean-bin", lean_bin,
                     "--cache-receipt", cache_receipt], 1800)
    base_result = json.loads((base / "c2_replacement_results.json").read_text())
    native.require(base_result["all_requested_checks_ok"] is True
                   and base_result["combined_source_blob"] == BASE_SOURCE, "Combined C2 check rejected")
    state["base_receipt"] = base_result
    receipts = []
    for i, (filename, expected, module, receipt, guard, names, deps) in enumerate(STAGES):
        destination = out / module
        argv = [sys.executable, HERE / "replay_c2_standard_exchange.py",
                "--compact-root", root, "--lean-bin", lean_bin, "--module-dir", base,
                "--out", destination, "--source", HERE / filename, "--module-name", module,
                "--receipt-name", receipt, "--guard", guard, "--seconds", "1200",
                "--scope", "Independent shared replay of exact accepted determinant/Carrier chain; RH remains open"]
        for name in names:
            argv += ["--theorem", name]
        for j in deps:
            argv += ["--dependency-receipt", receipts[j]]
        run(module, argv, 1260)
        path = destination / receipt
        checked = json.loads(path.read_text())
        native.require(checked["all_requested_checks_ok"] is True
                       and checked["source_blob"] == expected, "Interface receipt rejected: " + module)
        receipts.append(path)
        state["checked_interfaces"].append(checked)
        save()
    exporter = out / "native_exporter"
    run("exporter_build", [sys.executable, HERE / "prepare_native_graph_exporter.py",
                           "--out", exporter, "--build", "--lean-bin", lean_bin], 900)
    argv = [sys.executable, HERE / "audit_c2_interface_graph.py",
            "--compact-root", root, "--lean-bin", lean_bin, "--base-module-dir", base,
            "--proof-receipt", receipts[-1], "--native-exporter-dir", exporter,
            "--out", out / "complete_graph", "--guard-config", HERE / "C2_DETERMINANT_CARRIER_GRAPH.json",
            "--scope", "Independent four-root determinant/Carrier audit; general complement retained; not RH"]
    for path in receipts[:-1]:
        argv += ["--dependency-receipt", path]
    run("complete_graph", argv, 2400)
    graph = json.loads((out / "complete_graph/interface_graph_summary.json").read_text())
    guards = json.loads((out / "complete_graph/supplier_reachability.json").read_text())
    native.require(graph["missing"] == 0 and all(x["exit"] == 0 for x in graph["per_root"].values())
                   and len(graph["per_root"]) == 4 and graph["all_supplier_guards_pass"] is True
                   and len(guards["guards"]) == 35 and guards["all_guards_pass"] is True,
                   "Complete dependency audit rejected")
    state["graph_receipt"] = graph
    state["pipeline_checks_ok"] = True
    archive_graph(out / "complete_graph")
    save()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--preflight", action="store_true")
    args = parser.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    manifest = preflight(out)
    state = {**manifest, "source_build_target": "New.Rows.Carrier:olean",
             "scope": "Six accepted interfaces, both unchanged determinant/Carrier statements and four complete graphs",
             "steps": {}, "checked_interfaces": [], "pipeline_checks_ok": False,
             "all_requested_checks_ok": False, "human_assembly_verified": False,
             "bootstrap_note": "Legacy b2_native_results contains bootstrap and original probes only"}

    def save():
        native.dump(out / "determinant_shared_results.json", state)

    save()
    if args.preflight:
        print(json.dumps({"authenticated_interfaces": len(STAGES), "new_interface_declarations": 10,
                          "combined_source_blob": BASE_SOURCE, "new_Lean_execution": False,
                          "full_RH_replay": False}))
        return
    original_step, original_argv = native.step, sys.argv

    def step(argv, cwd, env, log, seconds):
        argv = list(argv)
        building = argv == ["lake", "build", "+New.Filling.BlockBound:olean"]
        if building:
            argv[-1] = "+New.Rows.Carrier:olean"
        if argv[:3] == ["lake", "env", "lean"]:
            path = Path(str(argv[-1]))
            if path.name == "original_callers.lean":
                text = path.read_text()
                native.require(text.count("import New.Filling.BlockBound\n") == 1,
                               "Original probe import changed")
                path.write_text(text.replace("import New.Filling.BlockBound\n", "import New.Rows.Carrier\n", 1))
            argv = argv[:3] + ["--tstack=400000", "-Dpp.fullNames=true"] + argv[3:]
        print(json.dumps({"step": log.stem, "state": "started"}), file=sys.stderr, flush=True)
        result = original_step(argv, cwd, env, log, seconds)
        print(json.dumps({"step": log.stem, **result}), file=sys.stderr, flush=True)
        if building:
            state["source_build_receipt"] = result
            archive = out / "native_c2_oleans.tar.zst"
            packed = original_step(["tar", "--zstd", "-cf", archive, "-C", cwd, ".lake/build/lib/lean"],
                                   cwd, env, out / "cache_archive.log", 180)
            cache = {"compact": native.PIN, "mathlib": native.MATHLIB,
                     "lean_release_sha256": native.RELEASE, "source_build_target": state["source_build_target"],
                     "source_build_complete": result["returncode"] == 0,
                     "modules_available": {"New.Rows.Carrier": result["returncode"] == 0},
                     "archive": archive.name, "archive_result": packed, "proof_receipt": False}
            if packed["returncode"] == 0:
                with archive.open("rb") as stream:
                    cache["sha256"] = hashlib.file_digest(stream, "sha256").hexdigest()
                cache["bytes"] = archive.stat().st_size
            cache_path = out / "native_cache_manifest.json"
            native.dump(cache_path, cache)
            save()
            if result["returncode"] == 0:
                native.require(packed["returncode"] == 0, "Native cache retention failed; preserve the build receipt")
                lean = shutil.which("lean", path=env["PATH"])
                native.require(lean is not None, "Pinned compiler missing after source build")
                state["new_Lean_execution"] = True
                replay_pipeline(Path(cwd), Path(lean).parent, cache_path, out,
                                env, original_step, state, save)
        return result

    native.step = step
    try:
        sys.argv = [sys.argv[0], "--out", str(out)]
        with contextlib.redirect_stdout(io.StringIO()):
            native.main()
        bootstrap = json.loads((out / "b2_native_results.json").read_text())
        state["all_requested_checks_ok"] = (
            bootstrap["all_requested_checks_ok"] is True and state["pipeline_checks_ok"] is True)
        save()
        native.require(state["all_requested_checks_ok"], "Shared replay incomplete; inspect exact receipts")
        print(json.dumps({"all_requested_checks_ok": True, "new_interface_declarations": 10,
                          "complete_original_statements": 2, "complete_graph_roots": 4,
                          "full_RH_replay": False}))
    except Exception as exc:
        state["failure"] = str(exc)
        save()
        raise
    finally:
        native.step, sys.argv = original_step, original_argv


if __name__ == "__main__":
    main()
