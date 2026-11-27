#!/usr/bin/env python3
"""Generate a native executable wrapper around the authenticated graph exporter.

The record traversal, collector cross-check, union schema and independent Node
verifier are unchanged. Runtime imports expose private checked declaration
bodies; this program inspects compiled objects, never adds proof declarations.
An actual native/interpreted equivalence receipt is required before adoption.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path

from audit_active_b2_graph import adapt_exporter_435
import run_compact_b2_native_replay as native
from compare_complete_graph_exports import validate_execution_modes


def validated_executable(directory):
    """Require actual build receipts and the independent core comparison."""
    directory = Path(directory).resolve()
    manifest = json.loads((directory / "native_graph_build.json").read_text())
    expected_source = native.git_blob(source().encode())
    native.require(manifest["source_blob"] == expected_source ==
                   native.git_blob((directory / "NativeGraph.lean").read_bytes()),
                   "Native graph executable source changed")
    for name in ["compile_result.json", "link_result.json"]:
        native.require(json.loads((directory / name).read_text())["returncode"] == 0,
                       "Native graph build did not complete")
    equivalence = json.loads((directory / "core_equivalence_results.json").read_text())
    native.require(equivalence["all_checks_pass"] is True and
                   equivalence["independent_verifier_passed_both"] is True and
                   equivalence["record_sets_equal"] is True,
                   "Native/interpreted collector compatibility not checked")
    core_i = directory / "core_interpreted_result.json"
    core_n = directory / "core_native_result.json"
    native.require(core_i.is_file() and core_n.is_file(),
                   "Require both actual core execution-mode receipts; rebuild the inspection program")
    validate_execution_modes(json.loads(core_i.read_text()), json.loads(core_n.read_text()))
    binary = directory / "native_graph"
    with binary.open("rb") as stream:
        native.require(hashlib.file_digest(stream, "sha256").hexdigest() ==
                       manifest["executable_sha256"], "Native graph executable changed")
    return binary, manifest


def execute_graph(directory, compact_root, env, lean_bin, module_name, roots, output, log, seconds):
    """Inspect checked objects and report actual collectAxioms output."""
    binary, build = validated_executable(directory)
    command = [binary, Path(lean_bin).resolve().parent, module_name, output, *roots]
    receipt = native.step(command, compact_root, env, log, seconds)
    axioms = {}
    if receipt["returncode"] == 0 and Path(output).is_file():
        with Path(output).open() as stream:
            header = json.loads(stream.readline())
        for row in header.get("root_axioms", []):
            name = ".".join(str(x[1]) for x in row["root"])
            axioms[name] = [".".join(str(x[1]) for x in ax) for ax in row["lean_collect_axioms"]]
    allowed = {"propext", "Classical.choice", "Quot.sound"}
    receipt.update(axioms=axioms,
        axiom_audit_ok=set(axioms) == set(roots) and all(set(a) <= allowed for a in axioms.values()),
        native_exporter_build=build, native_graph_execution=True, new_Lean_execution=False,
        full_RH_replay=False)
    return receipt


def source():
    spec = importlib.util.spec_from_file_location(
        "native_union_driver", native.KERNEL / "RUN26_COMPACT_GRAPH.py")
    graph = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(graph)
    driver = adapt_exporter_435(graph.driver())
    boundary = "set_option maxHeartbeats 0 in\nset_option maxRecDepth 1000000 in\nrun_cmd do"
    native.require(driver.count(boundary) == 1, "Changed checked exporter boundary")
    definitions = driver.split(boundary)[0]
    native.require(definitions.count("import Main\n") == 1, "Changed exporter imports")
    definitions = definitions.replace("import Main\n", "", 1)
    return definitions + r'''
/-- Runtime declaration inspection only. All graph records come from the imported
    kernel environment; the executable's own declarations are never imported. -/
def main (args : List String) : IO UInt32 := do
  let sysroot :: moduleName :: output :: rootNames := args |
    throw <| IO.userError "usage: native_graph SYSROOT MODULE OUTPUT ROOT..."
  unless !rootNames.isEmpty do
    throw <| IO.userError "At least one root is required"
  Lean.initSearchPath (System.FilePath.mk sysroot)
  let nameOf (text : String) : Lean.Name :=
    (text.splitOn ".").foldl Lean.Name.str .anonymous
  let roots := rootNames.toArray.map nameOf
  unless (roots.foldl (fun seen n => seen.insert n) ({} : Lean.NameHashSet)).size == roots.size do
    throw <| IO.userError "Duplicate roots"
  -- No environment extensions or module initializers are executed. Constant
  -- maps and private theorem bodies are sufficient for this inspection. Lean's
  -- own collectAxioms then traverses those bodies rather than cached extensions.
  let env := (← Lean.importModules #[{ module := nameOf moduleName }] {}
    (trustLevel := 0) (loadExts := false) (level := .private)).setExporting false
  let mut axiomRows : Array Lean.Json := #[]
  for root in roots do
    match env.toKernelEnv.find? root with
    | some (.thmInfo _) => pure ()
    | _ => throw <| IO.userError s!"Root theorem not present as checked theorem: {root}"
    let axs ← (Lean.collectAxioms root : Lean.CoreM (Array Lean.Name)).toIO'
      { fileName := "native-graph-inspection", fileMap := default } { env := env }
    axiomRows := axiomRows.push (Lean.Json.mkObj [
      ("root", CathedralKernelGraph.jid root),
      ("lean_collect_axioms", CathedralKernelGraph.jnames axs)])
  CathedralKernelGraph.exportGraph env roots axiomRows (System.FilePath.mk output)
  IO.println "NATIVE_GRAPH_COMPLETE"
  return 0
'''


def build(out, lean_bin, manifest, seconds):
    """Build only the inspection program and compare complete core graphs."""
    lean_bin = lean_bin.resolve()
    env = os.environ.copy()
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    env["PATH"] = str(lean_bin) + os.pathsep + env["PATH"]
    version = native.capture([lean_bin / "lean", "--version"])
    native.require("4.35.0" in version and "eb6cafb7290e8bd5f2937522d8d804f58f02bafc" in version,
                   "Use the exact pinned Lean release")
    (out / "version.log").write_text(version + "\n")

    def run(label, argv, limit):
        print(json.dumps({"phase": label, "state": "started"}), flush=True)
        result = native.step(argv, out, env, out / (label + ".log"), limit)
        result["argv"] = list(map(str, argv))
        native.dump(out / (label + "_result.json"), result)
        native.require(result["returncode"] == 0, "Native exporter " + label + " failed")
        return result

    run("compile", [lean_bin / "lean", "-R", out, "-o", out / "NativeGraph.olean",
                    "-c", out / "NativeGraph.c", out / "NativeGraph.lean"], seconds)
    run("link", [lean_bin / "leanc", "-O3", "-o", out / "native_graph", out / "NativeGraph.c"], seconds)
    spec = importlib.util.spec_from_file_location("native_core_comparison", native.KERNEL / "RUN26_COMPACT_GRAPH.py")
    graph = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(graph)
    graph.ROOTS = ["Nat.le_refl"]
    interpreted = adapt_exporter_435(graph.driver()).replace("import Main\n", "", 1)
    (out / "InterpretedCore.lean").write_text(interpreted)
    native_run = run("core_native", [out / "native_graph", lean_bin.parent, "Lean",
                        out / "core_native.jsonl", "Nat.le_refl"], seconds)
    env["CATHEDRAL_RH_GRAPH"] = str(out / "core_interpreted.jsonl")
    interpreted_run = run("core_interpreted", [lean_bin / "lean", "--tstack=400000", out / "InterpretedCore.lean"], seconds)
    modes = validate_execution_modes(interpreted_run, native_run)
    rows = {}
    for name in ["core_native", "core_interpreted"]:
        audit = out / name
        audit.mkdir(exist_ok=True)
        graph.audit_union(out / (name + ".jsonl"), audit, audit)
        rows[name] = [json.loads(line) for line in (out / (name + ".jsonl")).read_text().splitlines()]
    nodes = lambda rs: {json.dumps(r["id"], sort_keys=True): r for r in rs if r["record"] == "node"}
    a, b = rows["core_native"], rows["core_interpreted"]
    result = {"record_sets_equal": nodes(a) == nodes(b), "headers_equal": a[0] == b[0],
              "footers_equal": a[-1] == b[-1], "native_nodes": len(nodes(a)),
              "independent_verifier_passed_both": True, "all_checks_pass": False,
              "execution_modes_valid": True, "execution_modes": modes,
              "scope": "Nat.le_refl compatibility only; no B2/C2/RH proof claim", "full_RH_replay": False}
    result["all_checks_pass"] = all(result[k] for k in
        ["record_sets_equal", "headers_equal", "footers_equal", "independent_verifier_passed_both"])
    native.dump(out / "core_equivalence_results.json", result)
    native.require(result["all_checks_pass"], "Native and interpreted core records differ")
    with (out / "native_graph").open("rb") as stream:
        digest = hashlib.file_digest(stream, "sha256").hexdigest()
    manifest.update(executable_sha256=digest, lean_version=version, equivalence_verified=True,
                    core_equivalence_verified=True, equivalence_scope="Nat.le_refl only",
                    compile_returncode=0, link_returncode=0)
    native.dump(out / "native_graph_build.json", manifest)
    validated_executable(out)
    print(json.dumps({"native_exporter_ready": True, "core_equivalence": result, "full_RH_replay": False}), flush=True)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--build", action="store_true",
                   help="Build the inspection executable and require both independent core checks")
    p.add_argument("--lean-bin", type=Path)
    p.add_argument("--seconds", type=int, default=600)
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    path = out / "NativeGraph.lean"
    path.write_text(source())
    manifest = {"source_blob": native.git_blob(path.read_bytes()),
                "exporter_source_blob": "ee4efebb066f6775fa551ae9104cfa973e585071",
                "independent_verifier_blob": "2e431301970196a6b786d004fb16a4320a25fe8e",
                "collector_adapter": "strict independent const/projection union",
                "runtime_imports_private_bodies": True,
                "executes_module_initializers": False,
                "new_proof_declarations_added": False,
                "equivalence_verified": False,
                "adopted_for_B2_or_C2": False,
                "full_RH_replay": False}
    native.dump(out / "native_graph_input.json", manifest)
    print(path)
    if args.build:
        native.require(args.lean_bin is not None, "Provide the pinned Lean binary directory")
        build(out, args.lean_bin, manifest, args.seconds)


if __name__ == "__main__":
    main()
