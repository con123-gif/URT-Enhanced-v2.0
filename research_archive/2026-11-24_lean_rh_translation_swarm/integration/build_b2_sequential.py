#!/usr/bin/env python3
"""Recompile BlockBound's native import closure in order, one module at a time.

Verify the source pin, obtain Lake's pinned environment once, then call Lean
with the exact lakefile options. Avoid repeated scans of 9000 cached imports.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import time
import tomllib

PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
MATHLIB = "56a005855ea17e0b0958f73ec801ae140b0a1679"


def imports(text):
    # Preserve newlines, handling nested Lean block comments before header parsing.
    result = []
    depth = 0
    i = 0
    while i < len(text):
        if text.startswith("/-", i):
            depth += 1
            i += 2
        elif depth and text.startswith("-/", i):
            depth -= 1
            i += 2
        elif depth:
            if text[i] == "\n":
                result.append("\n")
            i += 1
        elif text.startswith("--", i):
            end = text.find("\n", i)
            i = len(text) if end < 0 else end
        else:
            result.append(text[i])
            i += 1
    clean = "".join(result)
    return [name for line in re.findall(r"^\s*import\s+([^\n]+)", clean, re.M)
            for name in line.split()]


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--compact-root", type=Path, required=True)
    p.add_argument("--lean-bin", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--reuse-existing", action="store_true",
                   help="Record and reuse existing native oleans; not a fresh native replay")
    args = p.parse_args()
    root, out = args.compact_root.resolve(), args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    def git(*parts):
        return subprocess.check_output(["git", *parts], cwd=root, text=True).strip()
    assert git("rev-parse", "HEAD") == PIN
    actual_mathlib = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=root/".lake/packages/mathlib", text=True).strip()
    assert actual_mathlib == MATHLIB
    subprocess.run(["git", "diff", "--exit-code", PIN, "--", "src", "lakefile.toml"],
                   cwd=root, check=True)
    files = {str(f.relative_to(root/"src").with_suffix("")).replace(os.sep, "."): f
             for f in (root/"src").rglob("*.lean")}
    order, active, seen = [], set(), set()
    def visit(module):
        assert module not in {"Main", "New.Main"}, "Forbidden RH root build"
        if module in seen or module not in files:
            return
        assert module not in active, "Native import cycle: " + module
        active.add(module)
        for dep in imports(files[module].read_text()):
            visit(dep)
        active.remove(module)
        seen.add(module)
        order.append(module)
    visit("New.Filling.BlockBound")
    config = tomllib.loads((root/"lakefile.toml").read_text())
    options = list(config.get("moreLeanArgs", [])) + [
        "-D"+key+"="+(str(value).lower() if isinstance(value, bool) else str(value))
        for key, value in config["leanOptions"].items()]
    result = {"compact": PIN, "mathlib": MATHLIB, "order": order,
              "mode": "direct Lean compilation in native import order",
              "lean_options": options, "steps": [],
              "all_modules_built": False, "reused_native_cache": [], "full_RH_replay": False}
    record = out/"sequential_build.json"
    def save():
        record.write_text(json.dumps(result, indent=2)+"\n")
    save()
    env = os.environ.copy()
    env["PATH"] = str(args.lean_bin.resolve())+os.pathsep+env["PATH"]
    env.update(LEAN_NUM_THREADS="1", LEAN_ABORT_ON_PANIC="1")
    setup = subprocess.check_output([
        str(args.lean_bin/"lake"), "env", "python3", "-c",
        "import os,json; print(json.dumps({k:os.environ[k] for k in "
        "['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','LD_LIBRARY_PATH','PATH'] if k in os.environ}))"],
        cwd=root, env=env, text=True)
    (out/"environment_setup.log").write_text(setup)
    env.update(json.loads(setup.strip().splitlines()[-1]))
    for n, module in enumerate(order, 1):
        start = time.monotonic()
        log = out/(module.replace(".", "_")+".log")
        print(f"[{n}/{len(order)}] {module}", flush=True)
        olean = root/".lake/build/lib/lean"/Path(*module.split("."))
        olean.parent.mkdir(parents=True, exist_ok=True)
        existing = olean.with_suffix(".olean")
        if args.reuse_existing and existing.is_file() and existing.stat().st_size > 0:
            with existing.open("rb") as stream:
                sha = hashlib.file_digest(stream, "sha256").hexdigest()
            result["reused_native_cache"].append({"module": module, "artifact_sha256": sha,
                                                  "recompiled_here": False})
            save()
            continue
        command = [str(args.lean_bin/"lean"), *options, "-j", "1", "-R", "src",
                   "-o", str(olean.with_suffix(".olean")),
                   "-i", str(olean.with_suffix(".ilean")), str(files[module].relative_to(root))]
        with log.open("w") as stream:
            try:
                rc = subprocess.run(command, cwd=root, env=env, stdout=stream,
                                    stderr=subprocess.STDOUT, timeout=900).returncode
            except subprocess.TimeoutExpired:
                rc = 124
        result["steps"].append({"module": module, "returncode": rc,
                                "seconds": round(time.monotonic()-start, 2), "log": log.name})
        save()
        if rc:
            raise SystemExit(f"Native build stopped at {module}: exit {rc}")
    result["all_modules_built"] = True
    result["fresh_native_replay"] = not result["reused_native_cache"]
    save()
    print(json.dumps({"native_modules_available": len(order),
                      "native_modules_compiled_here": len(result["steps"]),
                      "cached_native_modules_reused": len(result["reused_native_cache"]),
                      "fresh_native_replay": result["fresh_native_replay"],
                      "full_RH_replay": False}), flush=True)


if __name__ == "__main__":
    main()
