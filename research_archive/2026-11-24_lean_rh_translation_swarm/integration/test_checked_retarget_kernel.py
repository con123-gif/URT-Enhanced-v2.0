#!/usr/bin/env python3
"""Check proof retargeting and rejection of an ill-typed theorem on pinned Lean.

This core-only compatibility test is not a B2 or RH verification receipt.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

import run_compact_b2_native_replay as native

GOOD = """import Lean
set_option debug.skipKernelTC false
set_option Elab.async false
theorem retargetSourceSupplier (n : Nat) : n = n := rfl
theorem retargetNewSupplier (n : Nat) : n = n := rfl
theorem retargetSourceCaller (n : Nat) : n = n := retargetSourceSupplier n
run_cmd do
  let .thmInfo info ← Lean.getConstInfo ``retargetSourceCaller |
    Lean.throwError "Not a checked theorem"
  let proof := info.value.replace fun expression =>
    match expression with
    | .const name levels =>
      if name == ``retargetSourceSupplier then some (.const ``retargetNewSupplier levels)
      else none
    | _ => none
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := `retargetNewCaller
    levelParams := info.levelParams
    type := info.type
    value := proof
  })
  let some value := (← Lean.getConstInfo `retargetNewCaller).value? (allowOpaque := true) |
    Lean.throwError "Missing checked proof"
  let dependencies := value.getUsedConstants
  if dependencies.contains ``retargetSourceSupplier then
    Lean.throwError "Old supplier retained"
  unless dependencies.contains ``retargetNewSupplier do
    Lean.throwError "New supplier absent"
  Lean.logInfo "CHECKED_RETARGET_CORE_PASS"
#print axioms retargetNewCaller
"""

BAD = """import Lean
set_option debug.skipKernelTC false
set_option Elab.async false
run_cmd do
  -- The ordinary checker must reject a proof of True offered as False.
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := `retargetInvalidTheorem
    levelParams := []
    type := .const ``False []
    value := .const ``True.intro []
  })
"""


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--lean", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--seconds", type=int, default=600)
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    version = subprocess.check_output([args.lean, "--version"], text=True).strip()
    if "version 4.35.0," not in version:
        raise RuntimeError("Wrong Lean version")
    results = {"lean_version": version, "scope": "core-only proof retargeting compatibility",
               "B2_replayed": False, "full_RH_replay": False, "cases": {}}
    for label, text in [("checked_retarget", GOOD), ("reject_ill_typed_proof", BAD)]:
        path = out / (label + ".lean")
        path.write_text(text)
        import os
        result = native.step([args.lean, "-j", "1", path], out, os.environ.copy(),
                             out / (label + ".log"), args.seconds)
        results["cases"][label] = {**result, "source_sha256": hashlib.sha256(path.read_bytes()).hexdigest()}
        (out / "compatibility_results.json").write_text(json.dumps(results, indent=2) + "\n")
    good = (out / "checked_retarget.log").read_text()
    bad = (out / "reject_ill_typed_proof.log").read_text()
    results["all_checks_pass"] = (
        results["cases"]["checked_retarget"]["returncode"] == 0
        and "CHECKED_RETARGET_CORE_PASS" in good
        and "'retargetNewCaller' does not depend on any axioms" in good
        and results["cases"]["reject_ill_typed_proof"]["returncode"] != 0
        and "declaration type mismatch" in bad)
    (out / "compatibility_results.json").write_text(json.dumps(results, indent=2) + "\n")
    print(json.dumps(results))
    if not results["all_checks_pass"]:
        raise RuntimeError("Inspect retained compatibility logs")


if __name__ == "__main__":
    main()
