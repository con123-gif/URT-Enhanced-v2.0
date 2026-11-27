#!/usr/bin/env python3
"""RUN78: A3 targeted replay, using the successful B2 runner layout.
Pinned source: lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7; spine
f62d03bdcd987268e70657298702a238335fb3e6; obligations
b24ae883acc131f657241e944d523013ac5432a9.

Actual source audit 27 Nov: IntegralParameter.norm_disc_eq_one has a proof
body using finite class-group induction, not an external Weber axiom;
norm_a₁_le_one follows from that discriminant and integrality of 64.
FormalHeight.exists_unit_coeff_degree_le has a proof body using integral
sections and Tate height. New/Curve/FormalParameter.lean invokes it at cg
with q=m+1 in the nonsplit branch. CurveTheta.lean defines the same local
coordinate as RUN76: (wp'(z+t)-a1*(wp(z+t)-wp(t)))/2. In particular
RUN76's weaker premise is integrality of that coordinate after substitution;
the original hZ implies it via the generator membership. Its g0, Z0, Z1,
isogeny and subst hypotheses remain. RUN77 retains the marked CM split
condition, ideal-cycle existence, and both exact quotient identities.
Neither human replacement is a native caller substitution. The previous
B2 job is separate and no duplicate B2 job is registered.

Original/reduced source graphs and evidence are preserved in RUN76/77.
Old pin CI receipts 45577239749 and 45576756833 re-read (both exit 0);
B2 45986308748 results re-read; no A3 evidence inferred. B2 repaired
energy receipt was not yet published when checked. Local lean/lake absent,
30 GB scratch below the existing 35 GB guard; native tools unavailable.
No new theorem PASS or kernel graph claim. All A1--E1 obligations open.

RESUME HERE: inspect status.json and outputs/a3_native_results.json for
this single A3 batch; if a build or candidate fails inspect that log and
repair only the failed item. If it passes, distinguish five scalar helpers
and three original axiom probes from a complete geometric replacement.
HANDOFF TO: kernel / integration / proof editor.
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
    "formal_height_scalar": (
        "specialists/literature_provenance/RUN76_COMPACT_FORMAL_HEIGHT_GOOD_REDUCTION.lean",
        "7d0d96c9e26ddc305d867682d739e645b92c29d2",
        ["CompactLiteratureRun76.curve_invariants", "CompactLiteratureRun76.unit_at_boundary"],
    ),
    "weber_cycle_scalar": (
        "specialists/literature_provenance/RUN77_COMPACT_WEBER_UNIT_CYCLE.lean",
        "9b39df466e8c83b3e05ab65ff9163e610b8d6ddd",
        ["CompactLiteratureRun77.weber_polynomial", "CompactLiteratureRun77.no_rise",
         "CompactLiteratureRun77.low_trap"],
    ),
}
SOURCES = {
    "Lib/CM/FormalGroup/FormalHeight.lean": "640cabefca81dde25d092fd6ac057c3bcdd3516e",
    "Lib/CM/LocalHeight/IntegralParameter.lean": "9dc955b1e8a0650c27c8eda49f6e4adaf94680bd",
    "Lib/CM/Sigma/CurveTheta.lean": "cd276f383c2768ee6039051e407ecac800a7f0d7",
    "New/Curve/FormalParameter.lean": "61130bd5600a2b1f1679cfe0a18123d2c458d425",
}
ORIGINALS = [
    "CMLattice.norm_disc_eq_one",
    "CMLattice.norm_a₁_le_one",
    "CMLattice.exists_unit_coeff_degree_le",
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

    state = {"scope": "new peer helper replay; original caller axioms checked separately",
             "steps": {}, "new_Lean_execution": False,
             "caller_replacements_checked": False, "human_assembly_verified": False,
             "full_RH_replay": False, "all_requested_checks_ok": False}
    result_path = out / "a3_native_results.json"
    started = time.monotonic()
    env = os.environ.copy()
    env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")

    def run(label, argv, cwd, seconds):
        remaining = int(165 * 60 - (time.monotonic() - started))
        require(remaining > 10, "A3 batch time budget exhausted")
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
        with tempfile.TemporaryDirectory(prefix="compact-a3-native-") as temp:
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
            # Build and probe the integral supplier first, preserving its
            # receipt even if the larger formal-height build times out.
            ok = []
            modules = [
                ("integral", "Lib.CM.LocalHeight.IntegralParameter", ORIGINALS[:2],
                 "weber_cycle_scalar"),
                ("formal", "Lib.CM.FormalGroup.FormalHeight", ORIGINALS[2:],
                 "formal_height_scalar"),
            ]
            for prefix, module, originals, peer_label in modules:
                built = run(prefix + "_build", ["lake", "build", "+" + module + ":olean"],
                            compact, 2700)
                ok.append(built)
                if not built:
                    continue
                original = work / (prefix + "_original.lean")
                original.write_text("import " + module + "\n" +
                                    "\n".join("#print axioms " + n for n in originals) + "\n")
                ok.append(probe(prefix + "_original", original, originals, compact))
                rel, expected, names = PEERS[peer_label]
                dest = work / (peer_label + ".lean")
                raw = (SWARM / rel).read_bytes()
                require(git_blob(raw) == expected, "Peer input changed during replay: " + rel)
                dest.write_bytes(raw)
                ok.append(probe(peer_label, dest, names, compact))
            # Without x>0, the claimed no-rise implication is false
            # (x,c=-2 and y=2); the unguarded proof must be rejected.
            bad = work / "missing_positive_guard.lean"
            bad.write_text("import Mathlib.Tactic\n"
                           "example (x y c : ℝ) (hc : c ≤ x) (h : y^2 = c*x) : "
                           "y ≤ x := by nlinarith\n")
            rejected = not run("negative_missing_positive_guard", ["lake", "env", "lean", bad],
                               compact, 180)
            control = state["steps"]["negative_missing_positive_guard"]
            rejected = rejected and control["returncode"] not in (124, 137) and \
                "error:" in (out / control["log"]).read_text()
            control["expected_rejection_observed"] = rejected
            state["all_requested_checks_ok"] = all(ok) and rejected
            dump(result_path, state)
            require(state["all_requested_checks_ok"], "A3 native checks incomplete or failed")
            print(json.dumps({"new_helper_theorems": 5, "original_caller_axiom_probes": len(ORIGINALS),
                              "negative_control_rejected": rejected, "caller_replacements_checked": False,
                              "human_assembly_verified": False, "full_RH_replay": False}))
    except Exception as exc:
        state["failure"] = str(exc)
        dump(result_path, state)
        raise


if __name__ == "__main__":
    main()
