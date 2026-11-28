#!/usr/bin/env python3
"""RUN91: actually queue RUN88/RUN90 native replay and the principal-class bridge.

Uses the existing compact source/official release pin and RUN89 runner,
not a second A/B/C build. Each stage has a separate fail-closed receipt.
Prepared 27 November 2026; no local Lean execution.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "kernel_extractor"))
from RUN26_COMPACT_GRAPH import PIN, MATHLIB, RELEASE, git_blob, require, dump
from RUN28_COMPACT_TARGETED import audit, step

R89 = HERE / "COMPACT_RUN92_REPLAY_ANALYTIC.py"
R88 = HERE / "COMPACT_RUN92_ANALYTIC_REPAIR.lean"
R90 = HERE / "COMPACT_RUN92_ADAPTER_REPAIR.lean"
R91 = HERE / "COMPACT_RUN92_BRIDGE_REPAIR.lean"
BLOBS = {
    R89: "401cdaf5b32416d9efa267ec267180d60f67981a",
    R88: "feac9de9a2448bf595ea18873528e6066d16846f",
    R90: "14aaedca526240e1ef947958ee9278dd14add544",
    R91: "d1f58ba6d8c29b70e5a07e1eb497abd830a7a29b",
}
SOURCE_BLOBS = {
    "New/Data/Weights.lean": "8749d68da003347685ca36817b32cafda51a3a6a",
    "New/Data/AdmissibleData.lean": "04208a5044bb7cf6464ef142a14d939148bed834",
    "New/Data/Magnitudes.lean": "306fe7e22378322422d11b1f8415fcdac75ffd6e",
    "New/Endgame/PrimeError.lean": "63eb3d79d95ad815878e623b96f237240058c8e2",
    "New/Endgame/OneSidedCriterion.lean": "93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3",
    "Statements.lean": "1cd1bce93344065936b2b392b23306254e0785ef",
}
ADAPTER = ["Data.run90Remainder_eq", "RHPrimeWindow90.pointwise_good_data",
           "RHPrimeWindow90.endpoint_from_good_grid"]
BRIDGE = ["RHPrimeWindow91.principal_grid_from_class_inputs",
          "RHPrimeWindow91.zeta_line_from_class_inputs"]

def preflight():
    for path, sha in BLOBS.items():
        require(git_blob(path.read_bytes()) == sha, "Changed pinned candidate: " + path.name)
    spec = importlib.util.spec_from_file_location("run89", R89)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    analytic = module.preflight()
    def imports(path):
        return re.findall(r"^import\s+([^\n]+)", path.read_text(), re.M)
    require(imports(R90) == ["New.Data.Weights", "New.Endgame.PrimeError", "Lean"],
            "Unexpected adapter imports")
    require(imports(R91) == ["Run88Endpoint", "Run90Adapter", "Lean"],
            "Unexpected bridge imports")
    def endpoint(path):
        text = path.read_text()
        return text.split("def EndpointGrid ", 1)[1].split("\n\n", 1)[0]
    require(endpoint(R88) == endpoint(R90), "EndpointGrid changed")
    for path, roots in [(R90, ADAPTER), (R91, BRIDGE)]:
        code = re.sub(r"/-.*?-/", "", path.read_text(), flags=re.S)
        code = re.sub(r"--[^\n]*", "", code)
        code = re.sub(r'"(?:\\.|[^"\\])*"', '""', code)
        require(not re.search(r"\b(sorry|admit|axiom)\b", code), "Unproved declaration")
        require(re.findall(r"^#print axioms ([^\n]+)", code, re.M) == roots,
                "Axiom roster changed")
    return {
        "compact": PIN, "mathlib": MATHLIB, "release_sha256": RELEASE,
        "candidate_blobs": {p.name: git_blob(p.read_bytes()) for p in [R88, R89, R90, R91]},
        "source_blobs": SOURCE_BLOBS, "analytic_preflight": analytic,
        "endpoint_grid_text_identical": True, "new_Lean_execution": False,
        "original_definition_native_bridge_checked": False,
        "arithmetic_premise_proved": False, "pnt_tail_proved_here": False,
        "full_RH_replay": False, "all_requested_checks_ok": False, "steps": {},
    }

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--preflight", action="store_true")
    args = ap.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    state = preflight()
    def save():
        dump(out / "run91_receipt.json", state)
    save()
    if args.preflight:
        return
    env = os.environ.copy()
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
    def run(label, argv, cwd, seconds, runenv=None):
        result = step(argv, cwd, env if runenv is None else runenv,
                      out / (label + ".log"), seconds)
        state["steps"][label] = result
        save()
        return result["returncode"]
    def must(label, argv, cwd, seconds):
        require(run(label, argv, cwd, seconds) == 0, "Failed: " + label)
    def capture(argv, cwd):
        return subprocess.check_output(list(map(str, argv)), cwd=cwd, env=env, text=True).strip()
    try:
        with tempfile.TemporaryDirectory(prefix="compact-prime-endpoint-") as td:
            w = Path(td)
            repo = w / "grh"
            asset = w / "lean-4.35.0-linux.tar.zst"
            must("download", ["curl", "--fail", "--location", "--retry", "3", "-o", asset,
                 "https://github.com/leanprover/lean4/releases/download/v4.35.0/" + asset.name], w, 900)
            with asset.open("rb") as f:
                require(hashlib.file_digest(f, "sha256").hexdigest() == RELEASE, "Wrong compiler release")
            must("extract", ["tar", "--zstd", "-xf", asset], w, 900)
            asset.unlink()
            binpath = w / "lean-4.35.0-linux/bin"
            env["PATH"] = str(binpath) + os.pathsep + env["PATH"]
            must("version", ["lean", "--version"], w, 60)
            require("4.35.0" in (out / "version.log").read_text(), "Wrong compiler version")
            must("init", ["git", "init", "-q", repo], w, 60)
            must("remote", ["git", "remote", "add", "origin", "https://github.com/lsernau/grh-lean.git"], repo, 60)
            must("fetch", ["git", "fetch", "--depth=1", "origin", PIN], repo, 600)
            must("checkout", ["git", "checkout", "--detach", "FETCH_HEAD"], repo, 120)
            require(capture(["git", "rev-parse", "HEAD"], repo) == PIN, "Wrong source")
            root = repo / "grh-compact"
            require((root / "lean-toolchain").read_text().strip() == "leanprover/lean4:v4.35.0",
                    "Wrong toolchain")
            for rel, sha in SOURCE_BLOBS.items():
                require(git_blob((root / "src" / rel).read_bytes()) == sha, "Wrong source " + rel)
            manifest = json.loads((root / "lake-manifest.json").read_text())
            require(any(p["name"] == "mathlib" and p["rev"] == MATHLIB for p in manifest["packages"]),
                    "Wrong Mathlib manifest")
            must("mathlib_cache", ["lake", "exe", "cache", "get"], root, 4200)
            require(capture(["git", "rev-parse", "HEAD"], root / ".lake/packages/mathlib") == MATHLIB,
                    "Wrong Mathlib checkout")
            state["compiler_archive_rehashed_here"] = True
            save()
            # Keep both stages even when one fails. RUN89 owns its detailed receipt.
            analytic_dir = out / "analytic"
            analytic_dir.mkdir()
            analytic_rc = run("analytic_runner", [sys.executable, R89, "--compact-root", root,
                "--lean-bin", binpath, "--out", analytic_dir], root, 6500)
            ar = analytic_dir / "endpoint_receipt.json"
            if ar.exists():
                a = json.loads(ar.read_text())
                state["analytic_checked"] = analytic_rc == 0 and a.get("all_requested_checks_ok") is True
                state["new_Lean_execution"] = a.get("new_Lean_execution") is True
            else:
                state["analytic_checked"] = False
            save()
            modules = out / "modules"
            modules.mkdir()
            endpoint_olean = analytic_dir / "Run88Endpoint.olean"
            if endpoint_olean.is_file() and state["analytic_checked"]:
                shutil.copy2(endpoint_olean, modules / endpoint_olean.name)
            rc = run("adapter_build", ["lake", "build", "+New.Data.Weights:olean",
                "+New.Endgame.PrimeError:olean"], root, 5400)
            state["adapter_checked"] = False
            state["bridge_checked"] = False
            if rc == 0:
                dst = modules / "Run90Adapter.lean"
                dst.write_bytes(R90.read_bytes())
                state["new_Lean_execution"] = True
                save()
                rc = run("adapter", ["lake", "env", "lean", "--tstack=400000",
                    "-Dpp.fullNames=true", "-Ddebug.skipKernelTC=false", "--root=" + str(modules),
                    "-o", modules / "Run90Adapter.olean", dst], root, 1500)
                state["adapter_axioms"] = audit(out / "adapter.log", ADAPTER)
                state["adapter_checked"] = (
                    rc == 0 and state["adapter_axioms"]["axiom_audit_ok"] and
                    "RUN90_ADAPTER_GUARDS_OK" in (out / "adapter.log").read_text(errors="replace") and
                    (modules / "Run90Adapter.olean").is_file())
                save()
            if state["analytic_checked"] and state["adapter_checked"]:
                dst = modules / "Run91PrincipalBridge.lean"
                dst.write_bytes(R91.read_bytes())
                env2 = env.copy()
                env2["LEAN_PATH"] = str(modules) + os.pathsep + capture(
                    ["lake", "env", "printenv", "LEAN_PATH"], root)
                rc = run("principal_bridge", ["lean", "--tstack=400000", "-Dpp.fullNames=true",
                    "-Ddebug.skipKernelTC=false", "--root=" + str(modules), "-o",
                    modules / "Run91PrincipalBridge.olean", dst], root, 1500, env2)
                state["bridge_axioms"] = audit(out / "principal_bridge.log", BRIDGE)
                state["bridge_checked"] = (
                    rc == 0 and state["bridge_axioms"]["axiom_audit_ok"] and
                    "RUN91_PRINCIPAL_BRIDGE_GUARDS_OK" in
                    (out / "principal_bridge.log").read_text(errors="replace") and
                    (modules / "Run91PrincipalBridge.olean").is_file())
                save()
            state["all_requested_checks_ok"] = all(state.get(k) is True for k in
                ["analytic_checked", "adapter_checked", "bridge_checked"])
            state["native_module_sha256"] = {
                p.name: hashlib.sha256(p.read_bytes()).hexdigest()
                for p in modules.glob("*.olean")
            }
            save()
            require(state["all_requested_checks_ok"], "At least one conditional endpoint stage failed")
    except Exception as exc:
        state["failure"] = str(exc)
        save()
        raise

if __name__ == "__main__":
    main()
