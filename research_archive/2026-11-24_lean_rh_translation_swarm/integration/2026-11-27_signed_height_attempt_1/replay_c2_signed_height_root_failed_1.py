#!/usr/bin/env python3
"""Check the global square-root rule using the unchanged native HeightLe.

Extend the existing pinned cache only by missing original modules. Keep
every source, command and result; never overwrite an existing compiled
module. A failed proposed proof cannot be accepted by a printed guard.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tomllib

from build_b2_sequential import flatten_options
import run_compact_b2_native_replay as native

NAMES = ["c2_norm_map_le_exp_half", "c2_heightLe_of_sq",
         "c2_heightLe_reciprocal_budget", "c2_heightLe_squared_one_no_negative",
         "HeightLe.nonneg"]
HEIGHT_SOURCE = "a18a99e1f76a6e963113cae8f906ddc99814f518"


def digest(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def main():
    p = argparse.ArgumentParser()
    for name in ["compact-root", "lean-bin", "base-module-dir", "build-cache", "out"]:
        p.add_argument("--" + name, type=Path, required=True)
    p.add_argument("--source", type=Path,
                   default=Path(__file__).parent / "C2_SIGNED_HEIGHT_ROOT.lean")
    p.add_argument("--seconds", type=int, default=1200)
    a = p.parse_args()
    root, base, cache, out = [x.resolve() for x in
                            [a.compact_root, a.base_module_dir, a.build_cache, a.out]]
    cache.mkdir(parents=True, exist_ok=True)
    out.mkdir(parents=True, exist_ok=True)
    native.require(native.capture(["git", "rev-parse", "HEAD"], root) == native.PIN,
                   "Wrong original source pin")
    native.require(native.capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib")
                   == native.MATHLIB, "Wrong Mathlib pin")
    subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"],
                   cwd=root, check=True)
    native.require(native.git_blob((root / "src/New/Heights/Heights.lean").read_bytes())
                   == HEIGHT_SOURCE, "Wrong native signed-height definition")
    base_receipt = json.loads((base / "c2_replacement_results.json").read_text())
    native.require(base_receipt["all_requested_checks_ok"] is True
                   and base_receipt["compact"] == native.PIN
                   and base_receipt["mathlib"] == native.MATHLIB,
                   "Unchecked original-cache provenance")
    for obj in base_receipt["compiled_module"]["artifacts"]:
        native.require(Path(obj["name"]).name == obj["name"]
                       and digest(base / obj["name"]) == obj["sha256"],
                       "Changed checked base module")
    env = os.environ.copy()
    env.update(json.loads((base / "environment.log").read_text().strip().splitlines()[-1]))
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    env["LEAN_PATH"] = str(cache) + os.pathsep + env["LEAN_PATH"]
    (out / "environment.log").write_text(json.dumps(env_to_save := {
        k: env[k] for k in ["LEAN_PATH", "LEAN_SRC_PATH", "LEAN_SYSROOT", "LD_LIBRARY_PATH", "PATH"]
        if k in env}) + "\n")
    lake = tomllib.loads((root / "lakefile.toml").read_text())
    opts = list(lake.get("moreLeanArgs", [])) + list(flatten_options(lake["leanOptions"]))
    compiler = [a.lean_bin.resolve() / "lean", *opts,
                "-Ddebug.skipKernelTC=false", "-Dpp.fullNames=true", "-j", "2"]
    state = {"compact": native.PIN, "mathlib": native.MATHLIB,
             "native_height_source_blob": HEIGHT_SOURCE, "scope": "one global root in actual signed HeightLe",
             "new_Lean_execution": False, "full_RH_replay": False,
             "all_requested_checks_ok": False, "original_extensions": []}
    receipt = out / "signed_height_root_results.json"
    native.dump(receipt, state)
    cache_file = cache / "original_module_receipts.json"
    cached = json.loads(cache_file.read_text()) if cache_file.exists() else {}
    order, seen = [], set()

    def visit(module):
        if module in seen:
            return
        seen.add(module)
        source = root / "src" / (module.replace(".", "/") + ".lean")
        if not source.exists():
            return
        for dependency in re.findall(r"^import\s+([A-Za-z0-9_.]+)", source.read_text(), re.M):
            visit(dependency)
        order.append(module)

    visit("New.Heights.Heights")
    for module in order:
        rel = module.replace(".", "/")
        source = root / "src" / (rel + ".lean")
        obj = cache / (rel + ".olean")
        original = root / ".lake/build/lib/lean" / (rel + ".olean")
        if original.exists():
            continue
        raw = source.read_bytes()
        blob = native.git_blob(raw)
        if obj.exists():
            record = cached.get(module)
            native.require(record is not None and record["source_blob"] == blob
                           and record["sha256"] == digest(obj)
                           and record["compiler"]["returncode"] == 0,
                           "Unrecorded or changed original extension: " + module)
            state["original_extensions"].append({**record, "reused": True})
            continue
        native.require(shutil.disk_usage(cache).free > 12_000_000,
                       "Insufficient scratch for another original module")
        obj.parent.mkdir(parents=True, exist_ok=True)
        source_copy = out / "original_sources" / (rel + ".lean")
        source_copy.parent.mkdir(parents=True, exist_ok=True)
        source_copy.write_bytes(raw)
        argv = [*compiler, "-R", root / "src", "-o", obj, source]
        log = out / (module + ".log")
        print(json.dumps({"phase": "original_extension", "module": module}), flush=True)
        run = native.step(argv, root, env, log, a.seconds)
        state["new_Lean_execution"] = True
        record = {"module": module, "source_blob": blob,
                  "argv": list(map(str, argv)), "compiler": run}
        state["original_extensions"].append(record)
        native.dump(receipt, state)
        native.require(run["returncode"] == 0, "Original extension failed: " + module)
        record.update(bytes=obj.stat().st_size, sha256=digest(obj))
        cached[module] = record
        native.dump(cache_file, cached)
        native.dump(receipt, state)
    proposed = out / "C2SignedHeightRoot.lean"
    proposed.write_bytes(a.source.resolve().read_bytes())
    argv = [*compiler, "-R", out, "-o", out / "C2SignedHeightRoot.olean", proposed]
    state.update(source_blob=native.git_blob(proposed.read_bytes()),
                 theorems=NAMES, argv=list(map(str, argv)))
    native.dump(out / "input_manifest.json", state)
    print(json.dumps({"phase": "C2SignedHeightRoot", "state": "started"}), flush=True)
    run = native.step(argv, root, env, out / "compile.log", a.seconds)
    run.update(native.audit(out / "compile.log", NAMES))
    run["direct_supplier_guards_observed"] = "C2_SIGNED_HEIGHT_ROOT:" in (out / "compile.log").read_text()
    good = run["returncode"] == 0 and run["axiom_audit_ok"] is True and run["direct_supplier_guards_observed"]
    state.update(compiler=run, new_Lean_execution=True, all_requested_checks_ok=good)
    if good:
        obj = out / "C2SignedHeightRoot.olean"
        state["compiled_module"] = {"name": "C2SignedHeightRoot", "bytes": obj.stat().st_size,
                                    "sha256": digest(obj)}
    native.dump(receipt, state)
    print(json.dumps({"all_requested_checks_ok": good, "full_RH_replay": False}), flush=True)
    native.require(good, "Height-root proof failed; preserve the exact source and log")


if __name__ == "__main__":
    main()
