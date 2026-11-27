#!/usr/bin/env python3
"""One official-source C2 build serves equal-rank and four Carrier callers.

Reuse the existing pinned bootstrap, with its legacy generic batch evidence
kept separate from the actual C2 replacement receipt. No Main import and
no inference of theorem acceptance from workflow success.
"""
import argparse
import contextlib
import hashlib
import io
import json
from pathlib import Path
import shutil
import sys

import replay_c2_built_workspace as c2
import run_compact_b2_native_replay as native

HERE = Path(__file__).resolve().parent


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--preflight", action="store_true")
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    # Authenticate and prepare both peer inputs before any source download.
    original_argv = sys.argv
    try:
        sys.argv = [sys.argv[0], "--out", str(out / "c2"), "--carrier", "--prepare-only"]
        with contextlib.redirect_stdout(io.StringIO()):
            c2.main()
    finally:
        sys.argv = original_argv
    prepared = json.loads((out / "c2/c2_input_manifest.json").read_text())
    native.PEERS = {}
    native.SOURCES = {"New/Exchange/EqualRankValue.lean": c2.ORIGINAL_BLOB,
                      **c2.PROPAGATION_ORIGINAL_BLOBS}
    native.ORIGINALS = c2.ORIGINALS + c2.PROPAGATION_ORIGINALS
    native.preflight()
    state = {"compact": native.PIN, "mathlib": native.MATHLIB,
             "scope": "C2 equal-rank plus four complete Carrier-path caller replacements",
             "source_build_target": "New.Rows.Carrier:olean", "prepared_inputs": prepared,
             "new_Lean_execution": False, "all_requested_checks_ok": False,
             "human_assembly_verified": False, "full_RH_replay": False,
             "recursive_graph_checked": False,
             "bootstrap_note": "Legacy b2_native_results names describe bootstrap/probes only; use the C2 receipt for caller acceptance"}

    def save():
        native.dump(out / "shared_c2_results.json", state)

    save()
    if args.preflight:
        print(json.dumps({"prepared_declarations": 6, "original_statements": 5,
                          "peer_sources_authenticated": 2, "new_Lean_execution": False,
                          "full_RH_replay": False}))
        return
    base_step = native.step

    def step(argv, cwd, env, log, seconds):
        argv = list(argv)
        building = argv == ["lake", "build", "+New.Filling.BlockBound:olean"]
        if building:
            argv[-1] = "+New.Rows.Carrier:olean"
        if argv[:3] == ["lake", "env", "lean"]:
            leaf = Path(str(argv[-1]))
            if leaf.name == "original_callers.lean":
                text = leaf.read_text()
                old = "import New.Filling.BlockBound\n"
                native.require(text.count(old) == 1, "Changed generic original-probe import")
                text = text.replace(old, "import New.Rows.Carrier\n", 1)
                leaf.write_text(text)
                state["original_probes_source_blob"] = native.git_blob(leaf.read_bytes())
            argv = argv[:3] + ["--tstack=400000", "-Dpp.fullNames=true"] + argv[3:]
        print(json.dumps({"step": log.stem, "state": "started"}), file=sys.stderr, flush=True)
        result = base_step(argv, cwd, env, log, seconds)
        print(json.dumps({"step": log.stem, **result}), file=sys.stderr, flush=True)
        if building:
            state["source_build_receipt"] = result
            archive = out / "native_c2_oleans.tar.zst"
            packed = base_step(["tar", "--zstd", "-cf", archive, "-C", cwd,
                                ".lake/build/lib/lean"], cwd, env,
                               out / "cache_archive.log", 180)
            manifest = {"compact": native.PIN, "mathlib": native.MATHLIB,
                        "lean_release_sha256": native.RELEASE,
                        "source_build_target": state["source_build_target"],
                        "source_build_complete": result["returncode"] == 0,
                        "archive": archive.name, "archive_result": packed,
                        "proof_receipt": False}
            if packed["returncode"] == 0:
                with archive.open("rb") as stream:
                    manifest["sha256"] = hashlib.file_digest(stream, "sha256").hexdigest()
                manifest["bytes"] = archive.stat().st_size
            native.dump(out / "native_cache_manifest.json", manifest)
            save()
            if result["returncode"] == 0:
                lean = shutil.which("lean", path=env["PATH"])
                native.require(lean is not None, "Pinned compiler missing after C2 source build")
                checked = base_step([sys.executable, HERE / "replay_c2_built_workspace.py",
                                     "--compact-root", cwd, "--lean-bin", Path(lean).parent,
                                     "--carrier", "--out", out / "c2"],
                                    cwd, env, out / "c2_driver.log", 3000)
                state["caller_driver"] = checked
                state["new_Lean_execution"] = True
                receipt_path = out / "c2/c2_replacement_results.json"
                if receipt_path.is_file():
                    state["caller_receipt"] = json.loads(receipt_path.read_text())
                save()
        return result

    native.step = step
    try:
        sys.argv = [sys.argv[0], "--out", str(out)]
        with contextlib.redirect_stdout(io.StringIO()):
            native.main()
        bootstrap = json.loads((out / "b2_native_results.json").read_text())
        caller = state.get("caller_receipt", {})
        state["all_requested_checks_ok"] = (
            bootstrap["all_requested_checks_ok"] is True
            and state.get("caller_driver", {}).get("returncode") == 0
            and caller.get("all_requested_checks_ok") is True
            and caller.get("caller_replacement_checked") is True
            and caller.get("carrier_propagation_checked") is True)
        save()
        native.require(state["all_requested_checks_ok"], "C2 caller checks incomplete; inspect actual receipts")
        print(json.dumps({"checked_declarations": 6, "original_statements": 5,
                          "C2_callers_checked": True, "full_RH_replay": False}))
    except Exception as exc:
        state["failure"] = str(exc)
        save()
        raise
    finally:
        sys.argv = original_argv
        native.step = base_step


if __name__ == "__main__":
    main()
