#!/usr/bin/env python3
"""Replay existing B2 peer proofs in one pinned native workspace.

Original caller axiom checks and new helper compilation have separate results.
Neither certifies the complete human assembly or a caller replacement.
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

SWARM = Path(__file__).resolve().parents[1]
KERNEL = SWARM / "specialists/kernel_extractor"
sys.path.insert(0, str(KERNEL))
from RUN28_COMPACT_TARGETED import audit, step
from RUN26_COMPACT_GRAPH import PIN, MATHLIB, RELEASE, capture, dump, git_blob, require

PEERS = {
    "geometric_fibre": (
        "specialists/positivity_geometry/compact/RUN73_GEOMETRIC_COLOUR_FIBRE.lean",
        "8ce22849ab4dd088bd8934f26a215321b075af1e",
        ["RHPositivityRun73.skew_correction_mul", "RHPositivityRun73.shared_vector_exponent"],
    ),
    "saturation_divisor": (
        "specialists/positivity_geometry/compact/RUN74_SATURATION_PAIR_DIVISIBILITY.lean",
        "25ca13681bab4700da153d4361b75601a2c61f61",
        ["RHPositivityRun74.pairing_transport", "RHPositivityRun74.positive_difference"],
    ),
    "middle_alignment": (
        "specialists/positivity_geometry/compact/RUN75_MIDDLE_ROW_PROJECTOR_LIFT.lean",
        "8d1fb3c112978ecbd5f0f113f84969976a55c524",
        ["RHPositivityRun75.project_residual", "RHPositivityRun75.short_residual",
         "RHPositivityRun75.supported_rows", "RHPositivityRun75.reconstruct"],
    ),
}
SOURCES = {
    "New/Filling/BlockBound.lean": "6c68e80e3b1ea2b7983696716305493a37f2b1fd",
    "New/RealPlace/VolumeKernel.lean": "fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0",
    "New/Filling/BoxPartition.lean": "53f11966247a892d94cf688e8b366e887a92f641",
    "New/Filling/LinkPairing.lean": "a802533ca5a385d6f44c3254f1a4d600b28fc416",
    "New/Filling/GramLiouville.lean": "e0e55155b72a00bb6c11d618bf1961e52a4e696c",
}
ORIGINALS = [
    "Filling.HasLevel.exists_frameImage_toRows₂_eq_add",
    "Filling.tsum_invPowWeight_le_of_codim_le",
    "Filling.sum_pairWeight_le",
    "Filling.pairInvariant_mul_le",
    "Filling.le_genIndex_det_of_fixesNormAtLeast",
    "Filling.sublatticeDisc_mul_index_sq_le",
]


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
            require("#print axioms " + name in code, "Missing peer axiom probe: " + name)
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

    state = {"scope": "new peer helper replay; original caller axioms checked separately",
             "steps": {}, "new_Lean_execution": False,
             "caller_replacements_checked": False, "human_assembly_verified": False,
             "full_RH_replay": False, "all_requested_checks_ok": False}
    result_path = out / "b2_native_results.json"
    started = time.monotonic()
    env = os.environ.copy()
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")

    def run(label, argv, cwd, seconds):
        remaining = int(165 * 60 - (time.monotonic() - started))
        require(remaining > 10, "B2 batch time budget exhausted")
        ans = step(argv, cwd, env, out / (label + ".log"), min(seconds, remaining - 5))
        state["steps"][label] = ans
        dump(result_path, state)
        return ans["returncode"] == 0

    def probe(label, path, names, cwd):
        ok = run(label, ["lake", "env", "lean", path], cwd, 600)
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
        with tempfile.TemporaryDirectory(prefix="compact-b2-native-") as temp:
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
            # One build serves all eight existing helper proofs and the six original probes.
            require(run("b2_build", ["lake", "build", "+New.Filling.BlockBound:olean"], compact, 2700),
                    "BlockBound build failed or timed out; inspect partial logs")
            ok = []
            for label, (rel, expected, names) in PEERS.items():
                dest = work / (label + ".lean")
                raw = (SWARM / rel).read_bytes()
                require(git_blob(raw) == expected, "Peer input changed during replay: " + rel)
                dest.write_bytes(raw)
                ok.append(probe(label, dest, names, compact))
            original = work / "original_callers.lean"
            original.write_text("import New.Filling.BlockBound\n" +
                                "\n".join("#print axioms " + n for n in ORIGINALS) + "\n")
            ok.append(probe("original_callers", original, ORIGINALS, compact))
            # Omitting P*C=C from the exact middle-projector identity must fail.
            bad = work / "missing_projector_guard.lean"
            bad.write_text("import Mathlib.Tactic\n"
                           "example (P C X : ℚ) : P * (C * X) = C * X := by ring\n")
            rejected = not run("negative_missing_projector_guard", ["lake", "env", "lean", bad],
                               compact, 180)
            control = state["steps"]["negative_missing_projector_guard"]
            rejected = rejected and control["returncode"] not in (124, 137) and \
                "error:" in (out / control["log"]).read_text()
            control["expected_rejection_observed"] = rejected
            state["all_requested_checks_ok"] = all(ok) and rejected
            dump(result_path, state)
            require(state["all_requested_checks_ok"], "B2 native checks incomplete or failed")
            print(json.dumps({"new_helper_theorems": 8, "original_caller_axiom_probes": len(ORIGINALS),
                              "negative_control_rejected": rejected, "caller_replacements_checked": False,
                              "human_assembly_verified": False, "full_RH_replay": False}))
    except Exception as exc:
        state["failure"] = str(exc)
        dump(result_path, state)
        raise


if __name__ == "__main__":
    main()
