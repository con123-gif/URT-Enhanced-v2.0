#!/usr/bin/env python3
"""Run only the corrected core transport controls on the shared host.

No GRH checkout, Mathlib download or native source build. Check the official
Lean release digest, then require valid transport accepted and an ill-typed
theorem rejected by the kernel. No B2 or RH theorem is certified here.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile

import run_compact_b2_native_replay as native


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--out", type=Path, required=True)
    args = p.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    state = {"scope": "Lean 4.35 core proof-transport controls only",
             "release_sha256": native.RELEASE, "native_source_build_performed": False,
             "B2_replayed": False, "full_RH_replay": False, "steps": {},
             "all_requested_checks_ok": False}
    def save():
        native.dump(out / "shared_core_results.json", state)
    save()
    with tempfile.TemporaryDirectory(prefix="lean435-core-controls-") as temp:
        work = Path(temp)
        asset = work / "lean-4.35.0-linux.tar.zst"
        env = os.environ.copy()
        commands = [
            ("download", ["curl", "--fail", "--location", "--retry", "3", "-o", asset,
                          "https://github.com/leanprover/lean4/releases/download/v4.35.0/" + asset.name], 900),
            ("extract", ["tar", "--zstd", "-xf", asset], 900)]
        for label, command, seconds in commands:
            if label == "extract":
                with asset.open("rb") as stream:
                    native.require(hashlib.file_digest(stream, "sha256").hexdigest() == native.RELEASE,
                                   "Wrong official Lean release digest")
            result = native.step(command, work, env, out / (label + ".log"), seconds)
            state["steps"][label] = result
            save()
            native.require(result["returncode"] == 0, "Core-control bootstrap failed: " + label)
        asset.unlink()
        lean = work / "lean-4.35.0-linux/bin/lean"
        result = native.step([sys.executable, Path(__file__).parent / "test_checked_retarget_kernel.py",
                              "--lean", lean, "--out", out / "controls", "--seconds", "120"],
                             work, env, out / "controls_driver.log", 300)
        state["steps"]["controls"] = result
        receipt = out / "controls/compatibility_results.json"
        if receipt.is_file():
            state["controls_receipt"] = json.loads(receipt.read_text())
        state["all_requested_checks_ok"] = (result["returncode"] == 0 and
            state.get("controls_receipt", {}).get("all_checks_pass") is True)
        save()
        native.require(state["all_requested_checks_ok"], "Corrected core controls failed; inspect retained log")
        print(json.dumps(state))


if __name__ == "__main__":
    main()
