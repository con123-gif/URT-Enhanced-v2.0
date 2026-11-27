#!/usr/bin/env python3
"""Check the repaired C2 base and four consumers in one native process.

Same authenticated fragments, separate binder scopes, five exact statement
guards and seven original probes. No source build or RH-root import.
"""
import argparse
import contextlib
import hashlib
import io
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tomllib

from build_b2_sequential import flatten_options
import replay_c2_built_workspace as c2
import run_compact_b2_native_replay as native


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--prepare-only", action="store_true")
    p.add_argument("--compact-root", type=Path)
    p.add_argument("--lean-bin", type=Path)
    p.add_argument("--cache-receipt", type=Path)
    p.add_argument("--seconds", type=int, default=3600)
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    original_argv = sys.argv
    try:
        sys.argv = [sys.argv[0], "--out", str(out), "--carrier", "--prepare-only"]
        with contextlib.redirect_stdout(io.StringIO()):
            c2.main()
    finally:
        sys.argv = original_argv
    manifest = json.loads((out / "c2_input_manifest.json").read_text())
    base = (native.SWARM / c2.SOURCE).read_text()
    for patch in [manifest["adapter"], *manifest["native_repairs"]]:
        native.require(base.count(patch["old"]) == 1, "Changed combined C2 patch anchor")
        base = base.replace(patch["old"], patch["new"], 1)
    native.require(native.git_blob(base.encode()) == manifest["replay_source_blob"], "Changed repaired base")
    prop = (native.SWARM / c2.PROPAGATION_SOURCE).read_bytes()
    native.require(native.git_blob(prop) == c2.PROPAGATION_BLOB, "Changed propagation input")
    (out / "C2Caller.lean").write_text(base)
    (out / "C2Propagation.lean").write_bytes(prop)
    strip = lambda text: re.sub(r"^import[^\n]*\n", "", text, flags=re.M)
    names = c2.NAMES + c2.PROPAGATION_NAMES
    originals = c2.ORIGINALS + c2.PROPAGATION_ORIGINALS
    source = ("import New.Rows.Carrier\nimport Mathlib.Tactic\n"
              "set_option pp.fullNames true\nset_option debug.skipKernelTC false\n"
              "section C2Base\n" + strip(base) + "\nend C2Base\n"
              "section C2Propagation\n" + strip(prop.decode()) + "\nend C2Propagation\n" +
              "\n".join("#print axioms " + n for n in originals) + "\n")
    path = out / "C2Combined.lean"
    path.write_text(source)
    state = {**manifest, "compiled_together": True,
             "combined_source_blob": native.git_blob(path.read_bytes()),
             "candidate_declarations": names, "all_original_probes": originals,
             "new_Lean_execution": False, "native_source_build_performed": False,
             "caller_replacement_checked": False, "carrier_propagation_checked": False,
             "all_requested_checks_ok": False, "human_assembly_verified": False,
             "full_RH_replay": False, "steps": {}}
    receipt = out / "c2_replacement_results.json"
    native.dump(receipt, state)
    if args.prepare_only:
        print(json.dumps({"combined_source_blob": state["combined_source_blob"],
                          "declarations": len(names), "original_statements": 5,
                          "new_Lean_execution": False}))
        return
    native.require(args.compact_root and args.lean_bin and args.cache_receipt,
                   "Provide built workspace, pinned compiler and authenticated cache receipt")
    root = args.compact_root.resolve()
    cache = json.loads(args.cache_receipt.read_text())
    native.require(cache["compact"] == native.PIN and cache["mathlib"] == native.MATHLIB
                   and cache["source_build_complete"] is True
                   and cache["modules_available"]["New.Rows.Carrier"] is True, "Incomplete C2 cache")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN, "Wrong source pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib") == native.MATHLIB,
                   "Wrong Mathlib pin")
    for rel, sha in {"New/Exchange/EqualRankValue.lean": c2.ORIGINAL_BLOB,
                     **c2.PROPAGATION_ORIGINAL_BLOBS}.items():
        native.require(native.git_blob((root / "src" / rel).read_bytes()) == sha, "Wrong native C2 source")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"], cwd=root, check=True)
    env = os.environ.copy()
    env["PATH"] = str(args.lean_bin.resolve()) + os.pathsep + env["PATH"]
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    print(json.dumps({"step": "environment", "state": "started"}), flush=True)
    setup = native.step(["lake", "env", "python3", "-c",
            "import os,json; print(json.dumps({k:os.environ[k] for k in "
            "['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
            root, env, out / "environment.log", 300)
    state["steps"]["environment"] = setup
    native.dump(receipt, state)
    native.require(setup["returncode"] == 0, "Cannot resolve C2 environment")
    env.update(json.loads((out / "environment.log").read_text().strip().splitlines()[-1]))
    env["LEAN_PATH"] = str(out) + os.pathsep + env["LEAN_PATH"]
    lake = tomllib.loads((root / "lakefile.toml").read_text())
    options = list(lake.get("moreLeanArgs", [])) + list(flatten_options(lake["leanOptions"]))
    print(json.dumps({"step": "six_C2_declarations", "state": "started"}), flush=True)
    run = native.step([str(args.lean_bin.resolve() / "lean"), *options, "-Dpp.fullNames=true",
                       "-Ddebug.skipKernelTC=false", "-j", "2", "-R", out,
                       "-o", out / "C2Combined.olean", path], root, env, out / "compile.log", args.seconds)
    run.update(native.audit(out / "compile.log", names))
    original_audit = native.audit(out / "compile.log", originals)
    log = (out / "compile.log").read_text()
    guards = c2.GUARD in log and all(
        "C2_PROPAGATED_CALLER: " + n + ": exact type and direct edges" in log for n in c2.PROPAGATION_NAMES)
    good = (run["returncode"] == 0 and run["axiom_audit_ok"] is True
            and original_audit["axiom_audit_ok"] is True and guards)
    for label, roster in [("c2_candidate", c2.NAMES), ("c2_propagated_callers", c2.PROPAGATION_NAMES)]:
        state["steps"][label] = {**run, "compiled_together": True,
            "axioms": {n: run["axioms"][n] for n in roster if n in run["axioms"]}}
    state["steps"]["c2_originals"] = {"returncode": run["returncode"], **original_audit,
                                        "compiled_together": True, "log": "compile.log"}
    state.update(new_Lean_execution=True, caller_replacement_checked=good,
                 carrier_propagation_checked=good, all_requested_checks_ok=good,
                 all_five_type_and_dependency_guards_observed=guards)
    if good:
        objects = []
        for obj in sorted(out.glob("C2Combined.olean*")):
            with obj.open("rb") as stream:
                objects.append({"name": obj.name, "bytes": obj.stat().st_size,
                                "sha256": hashlib.file_digest(stream, "sha256").hexdigest()})
        state["compiled_module"] = {"name": "C2Combined", "artifacts": objects}
    native.dump(receipt, state)
    print(json.dumps({"all_six_declarations_checked": good, "full_RH_replay": False}), flush=True)
    native.require(good, "Repaired combined C2 input failed; retain log and fix first error")


if __name__ == "__main__":
    main()
