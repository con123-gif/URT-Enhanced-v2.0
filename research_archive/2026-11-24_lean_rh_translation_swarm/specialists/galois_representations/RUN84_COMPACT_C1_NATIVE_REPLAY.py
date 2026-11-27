#!/usr/bin/env python3
"""RUN84 C1 source-matched fit-family budget split; native replay queued.

Current mission 3adc76221a978016e3505cdf3e36ad688354d7d7;
spine 509fdba8772c61988cbe780d414d726579db7f54;
ledger b094c82e0c910f74a6f7b31dbcc0351f9053deab.
RUN83 e0142c5ccb5503d1e97256584a7f68eb5d0f625d read and retained.
C1 open. Source FitTwistsExist blob da769eba595af2f883eed9b82dbd322a521aea14.
One conditional assembly takes the two exact original finite-set budgets
as a single premise, and the original arithmetic proof supplies them.
The same original row choices, tau and H are kept. No new deep arithmetic
premises removed. The wrapper is an exact-statement candidate with
direct dependency guards, NOT a transitive graph audit.
RUN83 packed-payment helper and native original axiom probes are separate.
Old-pin reducer receipts not compact receipts. Local lean/lake absent;
scratch 30 GB below shared 35 GB guard. No Lean execution this run.
Native bootstrap reused from existing A3 runner; no protected workflow edit.

RESUME HERE: inspect compute/rh-compact-c1-fit-budget-replay-20261127/
status.json and outputs/c1_native_results.json on cathedral-research-state.
Repair only the first failing source/guard, or, on success, replace the
named arithmetic budget supplier with the packed valuation derivation
and audit constructor-inclusive reachability at its actual consumer.
Keep all period-ring, odd-Sha and local row obligations open.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import sys
import tempfile
import time

SWARM = Path(__file__).resolve().parents[2]
KERNEL = SWARM / "specialists/kernel_extractor"
sys.path.insert(0, str(KERNEL))
from RUN28_COMPACT_TARGETED import audit, step
from RUN26_COMPACT_GRAPH import PIN, MATHLIB, RELEASE, capture, dump, git_blob, require

PEERS = {
    "fit_budget_split": (
        "specialists/galois_representations/RUN84_COMPACT_FIT_BUDGET_SPLIT.lean",
        "3cbb1e320a0eb2bae1f45efbd4f72d78f6191cb0",
        ["fit_budget_run84", "exists_isFitFamily_of_budget_run84", "exists_isFitFamily_run84"],
    ),
    "packed_payment": (
        "specialists/galois_representations/RUN83_COMPACT_SINGLE_ARITHMETIC_PAYMENT.lean",
        "e0142c5ccb5503d1e97256584a7f68eb5d0f625d",
        ["RHGaloisRun83.packed_payment", "exists_isFitFamily"],
    ),
}
SOURCES = {
    "New/Selmer/FitTwistsExist.lean": "da769eba595af2f883eed9b82dbd322a521aea14",
    "New/Selmer/DenominatorBound.lean": "5889d96fe1a6ad7926e0df09a7d183232f91c534",
    "New/Selmer/TwistForRows.lean": "802242498ad4530e7f52cc4f14e0a03be2c59f4d",
}
ORIGINALS = ["exists_isFitFamily", "denominatorLe_rowBudget",
             "exists_mFoldTwist_selmerLengthLe"]


def preflight():
    found = {}
    for label, (rel, expected, names) in PEERS.items():
        raw = (SWARM / rel).read_bytes()
        require(git_blob(raw) == expected, "Changed peer input: " + rel)
        code = re.sub(r"/-.*?-/", "", raw.decode(), flags=re.S)
        code = re.sub(r"--[^\n]*", "", code)
        require(not re.search(r"\b(sorry|admit|axiom)\b", code), "Unproved peer code: " + rel)
        require(not re.search(r"^\s*import\s+(?:Main|New\.Main)\b", code, re.M),
                "Root import forbidden: " + rel)
        for name in names:
            require("#print axioms " + name.rsplit(".", 1)[-1] in code, "Missing peer axiom probe: " + name)
        found[label] = {"path": rel, "source_blob": expected, "theorems": names}
    return {"compact": PIN, "mathlib": MATHLIB, "peers": found,
            "source_blobs": SOURCES, "original_theorems": ORIGINALS,
            "new_Lean_execution": False, "caller_replacements_checked": False,
            "human_assembly_verified": False, "full_RH_replay": False}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True)
    parser.add_argument("--preflight", action="store_true")
    args = parser.parse_args()
    out = Path(args.out).resolve()
    out.mkdir(parents=True, exist_ok=True)
    manifest = preflight()
    dump(out / "input_manifest.json", manifest)
    if args.preflight:
        print(json.dumps({"input_sources_authenticated": len(PEERS),
                          "prepared_theorems": sum(len(p[2]) for p in PEERS.values()),
                          "new_Lean_execution": False}))
        return

    state = {"scope": "C1 original-statement budget split and separate RUN83 scalar helper",
             "steps": {}, "new_Lean_execution": False,
             "caller_replacements_checked": False, "human_assembly_verified": False,
             "full_RH_replay": False, "all_requested_checks_ok": False}
    result_path = out / "c1_native_results.json"
    started = time.monotonic()
    env = os.environ.copy()
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")

    def run(label, argv, cwd, seconds):
        remaining = int(300 * 60 - (time.monotonic() - started))
        require(remaining > 10, "C1 batch time budget exhausted")
        ans = step(argv, cwd, env, out / (label + ".log"), min(seconds, remaining - 5))
        state["steps"][label] = ans
        dump(result_path, state)
        return ans["returncode"] == 0

    def probe(label, path, names, cwd):
        ok = run(label, ["lake", "env", "lean", "--tstack=400000", path], cwd, 600)
        state["new_Lean_execution"] = True
        state["steps"][label].update(audit(out / (label + ".log"), names))
        dump(result_path, state)
        return ok and state["steps"][label]["axiom_audit_ok"]

    try:
        mem = int(next(l.split()[1] for l in Path("/proc/meminfo").read_text().splitlines()
                       if l.startswith("MemTotal:"))) * 1024
        limit = Path("/sys/fs/cgroup/memory.max")
        if limit.exists() and limit.read_text().strip() != "max":
            mem = min(mem, int(limit.read_text()))
        disk = shutil.disk_usage(tempfile.gettempdir()).free
        dump(out / "resources.json", {"memory_bytes": mem, "free_bytes": disk, "threads": 2})
        require(mem >= 8_000_000_000 and disk >= 35_000_000_000,
                "RESOURCE_BLOCKED: require 8 GB RAM and 35 GB scratch")
        with tempfile.TemporaryDirectory(prefix="compact-c1-native-") as temp:
            work = Path(temp)
            asset = work / "lean-4.35.0-linux.tar.zst"
            repo = work / "grh"
            require(run("download", ["curl", "--fail", "--location", "--retry", "3", "-o", asset,
                        "https://github.com/leanprover/lean4/releases/download/v4.35.0/" + asset.name],
                        work, 900), "Lean download failed")
            with asset.open("rb") as stream:
                require(hashlib.file_digest(stream, "sha256").hexdigest() == RELEASE,
                        "Lean release checksum mismatch")
            require(run("extract", ["tar", "--zstd", "-xf", asset], work, 900), "Lean extract failed")
            asset.unlink()
            env["PATH"] = str(work / "lean-4.35.0-linux/bin") + os.pathsep + env["PATH"]
            require(run("version", ["lean", "--version"], work, 60), "Lean version failed")
            require("4.35.0" in (out / "version.log").read_text(), "Wrong Lean version")
            require(run("init", ["git", "init", "-q", repo], work, 60), "Git init failed")
            require(run("remote", ["git", "remote", "add", "origin",
                        "https://github.com/lsernau/grh-lean.git"], repo, 60), "Git remote failed")
            require(run("fetch", ["git", "fetch", "--depth=1", "origin", PIN], repo, 600), "Source fetch failed")
            require(run("checkout", ["git", "checkout", "--detach", "FETCH_HEAD"], repo, 120), "Checkout failed")
            require(capture(["git", "rev-parse", "HEAD"], repo) == PIN, "Wrong compact commit")
            compact = repo / "grh-compact"
            require((compact / "lean-toolchain").read_text().strip() == "leanprover/lean4:v4.35.0",
                    "Wrong compact toolchain")
            lake_manifest = json.loads((compact / "lake-manifest.json").read_text())
            require(any(p["name"] == "mathlib" and p["rev"] == MATHLIB
                        for p in lake_manifest["packages"]), "Wrong Mathlib manifest")
            for rel, expected in SOURCES.items():
                require(git_blob((compact / "src" / rel).read_bytes()) == expected,
                        "Wrong source blob: " + rel)
            dump(out / "pins.json", {**manifest, "lean_release_sha256": RELEASE})
            require(run("mathlib_cache", ["lake", "exe", "cache", "get"], compact, 4200),
                    "Mathlib cache unavailable")
            require(capture(["git", "rev-parse", "HEAD"], compact / ".lake/packages/mathlib") == MATHLIB,
                    "Wrong actual Mathlib checkout")
            require(run("fit_build", ["lake", "build", "+New.Selmer.FitTwistsExist:olean"],
                        compact, 10800), "FitTwistsExist build failed or timed out")
            original = work / "original_callers.lean"
            original.write_text("import New.Selmer.FitTwistsExist\n" +
                                "\n".join("#print axioms " + n for n in ORIGINALS) + "\n")
            ok = [probe("original_callers", original, ORIGINALS, compact)]
            for label, (rel, expected, names) in PEERS.items():
                raw = (SWARM / rel).read_bytes()
                require(git_blob(raw) == expected, "Peer input changed: " + rel)
                dest = out / (label + ".lean")
                dest.write_bytes(raw)
                ok.append(probe(label, dest, names, compact))
            guard = "C1_RUN84_GUARDS_OK" in (out / "fit_budget_split.log").read_text()
            state["caller_replacements_checked"] = bool(ok[1] and guard)
            state["direct_type_and_dependency_guards_ok"] = guard
            state["transitive_graph_verified"] = False
            state["packed_valuation_identity_replayed"] = False
            # k=0 makes the RUN83 scalar identity false even when w=k*a*u+b*v.
            bad = work / "zero_k_control.lean"
            bad.write_text("import Mathlib.Tactic\n"
                           "example : (2:ℝ)*(3+4)+(5/0)*6 = (5*6)/0+2*4 := by norm_num\n")
            rejected = not run("negative_zero_k", ["lake", "env", "lean", bad], compact, 180)
            control = state["steps"]["negative_zero_k"]
            rejected = rejected and control["returncode"] not in (124, 137) and \
                "unsolved goals" in (out / control["log"]).read_text()
            control["expected_rejection_observed"] = rejected
            state["all_requested_checks_ok"] = all(ok) and guard and rejected
            dump(result_path, state)
            require(state["all_requested_checks_ok"], "C1 native checks incomplete or failed")
            print(json.dumps({"caller_replacement_checked": True,
                              "transitive_graph_verified": False,
                              "packed_valuation_identity_replayed": False,
                              "human_assembly_verified": False, "full_RH_replay": False}))
    except Exception as exc:
        state["failure"] = str(exc)
        dump(result_path, state)
        raise


if __name__ == "__main__":
    main()
