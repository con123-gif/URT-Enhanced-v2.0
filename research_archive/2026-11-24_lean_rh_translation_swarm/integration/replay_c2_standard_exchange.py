#!/usr/bin/env python3
"""Check a named local C2 interface against the accepted C2 module.

Reuse the authenticated source/cache and checked module, with no source
build, original general exchange call or completed determinant claim.
"""
import argparse
import hashlib
import json
import os
import re
from pathlib import Path
import subprocess
import tomllib

from build_b2_sequential import flatten_options
import run_compact_b2_native_replay as native


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--compact-root", type=Path, required=True)
    p.add_argument("--lean-bin", type=Path, required=True)
    p.add_argument("--module-dir", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--seconds", type=int, default=1200)
    p.add_argument("--source", type=Path,
                   default=Path(__file__).parent / "C2_STANDARD_EXCHANGE_UNIFORM.lean")
    p.add_argument("--module-name", default="C2StandardExchange")
    p.add_argument("--theorem", action="append", help="Repeat for each declaration in the checked file")
    p.add_argument("--guard", default="C2_STANDARD_EXCHANGE:")
    p.add_argument("--scope", default="uniform standard semilocal pair exchange; determinant/finite-modulus attachment remains open")
    p.add_argument("--receipt-name", default="standard_exchange_results.json")
    p.add_argument("--dependency-receipt", type=Path, action="append", default=[],
                   help="Accepted local interface receipt; validate exact source/object before importing")
    args = p.parse_args()
    names = args.theorem or ["c2_standard_exchange_uniform"]
    root, base, out = args.compact_root.resolve(), args.module_dir.resolve(), args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    r = json.loads((base / "c2_replacement_results.json").read_text())
    native.require(r["compact"] == native.PIN and r["mathlib"] == native.MATHLIB
                   and r["all_requested_checks_ok"] is True and r["compiled_module"]["name"] == "C2Combined",
                   "Unchecked or wrong C2 input")
    native.require(native.git_blob((base / "C2Combined.lean").read_bytes()) == r["combined_source_blob"],
                   "Changed checked C2 source")
    for obj in r["compiled_module"]["artifacts"]:
        native.require(Path(obj["name"]).name == obj["name"], "Unexpected module path")
        with (base / obj["name"]).open("rb") as stream:
            native.require(hashlib.file_digest(stream, "sha256").hexdigest() == obj["sha256"], "Wrong C2 object")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN, "Wrong source pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib") == native.MATHLIB,
                   "Wrong Mathlib pin")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"], cwd=root, check=True)
    native.require(re.fullmatch(r"[A-Za-z_][A-Za-z_0-9]*", args.module_name) is not None,
                   "Use a single module filename")
    native.require(Path(args.receipt_name).name == args.receipt_name, "Use a single receipt filename")
    source = args.source.resolve().read_bytes()
    path = out / (args.module_name + ".lean")
    path.write_bytes(source)
    env = os.environ.copy()
    env.update(json.loads((base / "environment.log").read_text().strip().splitlines()[-1]))
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    checked_dependencies = []
    module_dirs = [str(base)]
    for receipt_path in args.dependency_receipt:
        receipt_path = receipt_path.resolve()
        dependency = json.loads(receipt_path.read_text())
        native.require(dependency["compact"] == native.PIN and dependency["mathlib"] == native.MATHLIB
                       and dependency["all_requested_checks_ok"] is True,
                       "Unchecked or wrong local interface dependency")
        module = dependency["compiled_module"]
        native.require(re.fullmatch(r"[A-Za-z_][A-Za-z_0-9]*", module["name"]) is not None,
                       "Unexpected dependency module name")
        directory = receipt_path.parent
        native.require(native.git_blob((directory / (module["name"] + ".lean")).read_bytes())
                       == dependency["source_blob"], "Changed checked dependency source")
        for obj in module["artifacts"]:
            native.require(Path(obj["name"]).name == obj["name"], "Unexpected dependency object path")
            with (directory / obj["name"]).open("rb") as stream:
                native.require(hashlib.file_digest(stream, "sha256").hexdigest() == obj["sha256"],
                               "Changed checked dependency object")
        module_dirs.append(str(directory))
        checked_dependencies.append({"source_blob": dependency["source_blob"], "module": module})
    env["LEAN_PATH"] = os.pathsep.join(module_dirs + [env["LEAN_PATH"]])
    lake = tomllib.loads((root / "lakefile.toml").read_text())
    opts = list(lake.get("moreLeanArgs", [])) + list(flatten_options(lake["leanOptions"]))
    argv = [args.lean_bin.resolve() / "lean", *opts, "-Dpp.fullNames=true", "-Ddebug.skipKernelTC=false",
            "-j", "2", "-R", out, "-o", out / (args.module_name + ".olean"), path]
    state = {"compact": native.PIN, "mathlib": native.MATHLIB, "source_blob": native.git_blob(source),
             "checked_input_module": r["compiled_module"],
             "checked_interface_dependencies": checked_dependencies,
             "scope": args.scope, "theorems": names,
             "full_RH_replay": False, "native_source_build_performed": False, "argv": list(map(str, argv))}
    native.dump(out / "input_manifest.json", state)
    print(json.dumps({"phase": args.module_name, "theorems": names, "state": "started"}), flush=True)
    run = native.step(argv, root, env, out / "compile.log", args.seconds)
    run.update(native.audit(out / "compile.log", names))
    run["direct_supplier_guards_observed"] = args.guard in (out / "compile.log").read_text()
    good = run["returncode"] == 0 and run["axiom_audit_ok"] is True and run["direct_supplier_guards_observed"]
    state.update(compiler=run, new_Lean_execution=True, all_requested_checks_ok=good)
    if good:
        obj = out / (args.module_name + ".olean")
        with obj.open("rb") as stream:
            state["compiled_module"] = {"name": args.module_name, "artifacts": [{
                "name": obj.name, "bytes": obj.stat().st_size,
                "sha256": hashlib.file_digest(stream, "sha256").hexdigest()}]}
    native.dump(out / args.receipt_name, state)
    print(json.dumps({"theorems": names, "all_named_theorems_checked": good, "full_RH_replay": False}), flush=True)
    native.require(good, "Local C2 interface failed; inspect retained exact log")


if __name__ == "__main__":
    main()
