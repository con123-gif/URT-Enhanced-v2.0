#!/usr/bin/env python3
"""RUN61: terminal-error-aware A1 retry, not a new mathematical claim.
27 November 2026. Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
87c621d0d18103ec2eb9be14bf774b8bff2a747d, 600487957c8cff9ab77705c1441d0ef4559138ce.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Old pin separate.
The original status (07a2b14930c38095e6771ae9ed1a10a3cf1bf678) is terminal
ERROR; original A1 generated blob bacc8d571342525149fb6eba8f062568988ce0d2,
compiler exit 1. No retained original cache manifest at inspection.
The unchanged next_job function (7058133cc927c98bdf83e3df91af294d337c3717)
skips EVERY existing status.json, including ERROR. Updating RUN57 therefore
cannot cause a retry of its recorded job. Preserve that receipt. New retry
is A1-only, not a new full build or repeated known-failed A2 overlay.
Reuse authenticated original workspace directly if available. Otherwise
only build the same LocalStatement import closure once, preserve cache,
then run RUN59 and RUN58 before the workspace is deleted. No Main import.
No new hypotheses; native verification remains pending until actual receipts.
Local Python syntax compile succeeded; exact next_job selection condition
tested on temporary queue: 3/3 controls. No native Lean/lake installed.
RESUME HERE: read retry_summary.json, a1_transport.json and actual log;
if accepted, inspect strict eight-root graph and separate scan/prune receipt;
if rejected, repair first actual error. Never infer PASS from job label.
HANDOFF TO integration, acceleration, theta, audit. A1/star/RH OPEN.
"""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys

HERE = Path(__file__).resolve().parent
SHARED_BLOB = "9710263e09417d5e4d1e0902f00b554d6fee7ae0"
GRAPH_BLOB = "e39ff87e5088064c4186fa6bb7a2a88770ff194f"
LOCAL_BLOB = "9d5bd0d698b0db2850cbd306d8d400d7e99a3547"
ORIG = ["Columns.hasType_markOperator", "Data.IsMarked.hasType_markOperator",
        "Data.IsMarked.hasType_prod_markOperator_pow", "Data.exists_indexDvd_Bmu_divisible"]


def replay(shared, step, cwd, env, out):
    native = shared.native
    state = {"scope": "repaired A1 only", "native_verified": False,
             "graph_and_prune_complete": False, "full_RH_replay": False}
    def save():
        native.dump(out / "retry_summary.json", state)
    save()
    try:
        native.require(native.capture(["git", "rev-parse", "HEAD"], cwd) == native.PIN,
                       "wrong compact pin")
        native.require(native.capture(["git", "rev-parse", "HEAD"], cwd / ".lake/packages/mathlib") == native.MATHLIB,
                       "wrong mathlib pin")
        native.require(native.git_blob((cwd / "src/New/Columns/LocalStatement.lean").read_bytes()) == LOCAL_BLOB,
                       "wrong original source blob")
        subprocess.run(["git", "diff", "--exit-code", native.PIN, "--", "src", "lakefile.toml"], cwd=cwd, check=True)
        version = subprocess.check_output(["lake", "env", "lean", "--version"], cwd=cwd, env=env, text=True, timeout=60)
        native.require("4.35.0" in version, "wrong Lean version")
        state["native_verified"] = shared.a1_run(step, cwd, env, out)
        save()
        if not state["native_verified"]:
            return False
        graph = HERE / "RUN58_A1_GRAPH_AND_PRUNE.py"
        shared.check_blob(graph, GRAPH_BLOB)
        state["graph_step"] = step([sys.executable, graph, "--compact-root", cwd,
            "--receipt-dir", out, "--out", out / "a1_graph"], cwd, env,
            out / "a1_graph_driver.log", 7200)
        result_file = out / "a1_graph/a1_graph_result.json"
        if result_file.is_file():
            result = json.loads(result_file.read_text())
            state["graph_and_prune_complete"] = (state["graph_step"]["returncode"] == 0
                and result.get("graph_audited") is True and result.get("new_paths_present") is True
                and result.get("prune_executed") is True and result.get("prune_result", {}).get("returncode") == 0)
        return state["graph_and_prune_complete"]
    finally:
        save()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--compact-root", type=Path)
    args = parser.parse_args()
    out = args.out.resolve(); out.mkdir(parents=True, exist_ok=True)
    import RUN57_SHARED_MARKED_TRANSPORT as shared
    shared.check_blob(HERE / "RUN57_SHARED_MARKED_TRANSPORT.py", SHARED_BLOB)
    shared.check_blob(HERE / "RUN58_A1_GRAPH_AND_PRUNE.py", GRAPH_BLOB)
    native = shared.native
    base = native.step
    if args.compact_root:
        env = os.environ.copy(); env.update(LEAN_NUM_THREADS="2", LEAN_ABORT_ON_PANIC="1")
        native.require(replay(shared, base, args.compact_root.resolve(), env, out), "A1 retry/audit not accepted")
        return
    native.PEERS = {}
    native.TARGETS = [("New.Columns.LocalStatement", LOCAL_BLOB, ORIG)]
    accepted = False
    def hook(argv, cwd, env, log, seconds):
        nonlocal accepted
        if log.name == "module_0_build.log":
            result = base(argv, cwd, env, log, 5400)
            if result["returncode"] == 0:
                shared.preserve_source_cache(base, cwd, env, log.parent, result, argv)
            return result
        result = base(argv, cwd, env, log, seconds)
        if log.name == "module_0.log" and result["returncode"] == 0:
            if native.audit(log, ORIG)["axiom_audit_ok"]:
                accepted = replay(shared, base, cwd, env, log.parent)
        return result
    native.step = hook
    # RUN28 parses only --out. Keep its original independent probe and receipt.
    sys.argv = [sys.argv[0], "--out", str(out)]
    native.main()
    native.require(accepted, "A1 retry/audit not accepted; original check remains separate")


if __name__ == "__main__":
    main()
