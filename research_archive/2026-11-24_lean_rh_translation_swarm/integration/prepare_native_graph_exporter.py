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
from pathlib import Path

from audit_active_b2_graph import adapt_exporter_435
import run_compact_b2_native_replay as native


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
    binary = directory / "native_graph"
    with binary.open("rb") as stream:
        native.require(hashlib.file_digest(stream, "sha256").hexdigest() ==
                       manifest["executable_sha256"], "Native graph executable changed")
    return binary, manifest


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


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", type=Path, required=True)
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


if __name__ == "__main__":
    main()
