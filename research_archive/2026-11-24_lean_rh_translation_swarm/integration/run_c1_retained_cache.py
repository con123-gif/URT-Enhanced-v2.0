#!/usr/bin/env python3
"""Retain the original compiled C1 closure before the existing replay ends.

Execute the unchanged, authenticated RUN84 runner. Its mathematical checks
and result stay separate from the original-source cache artifact. Save even
a partial cache after a failed original build so the next repair can reuse it.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
RUNNER = HERE.parent / "specialists/galois_representations/RUN84_COMPACT_C1_NATIVE_REPLAY.py"
RUNNER_BLOB = "4ec1f89444fd6e779595ed83c601c2a5ebca2560"


def git_blob(raw):
    return hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--preflight", action="store_true")
    args = parser.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    if git_blob(RUNNER.read_bytes()) != RUNNER_BLOB:
        raise RuntimeError("C1 runner changed; reconcile the exact owner input before replay")
    spec = importlib.util.spec_from_file_location("c1_run84_retained", RUNNER)
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    original_step, original_argv = runner.step, sys.argv
    state = {"runner_source_blob": RUNNER_BLOB, "compact": runner.PIN, "mathlib": runner.MATHLIB,
             "cache_only_wrapper": True, "source_build_complete": False,
             "native_cache_retained": False, "proof_receipt": False, "full_RH_replay": False}

    def save():
        (out / "retained_cache_wrapper.json").write_text(json.dumps(state, indent=2) + "\n")

    save()

    def step(argv, cwd, env, log, seconds):
        result = original_step(argv, cwd, env, log, seconds)
        if list(map(str, argv)) == ["lake", "build", "+New.Selmer.FitTwistsExist:olean"]:
            state["source_build_receipt"] = result
            state["source_build_complete"] = result["returncode"] == 0
            cache = Path(cwd) / ".lake/build/lib/lean"
            state["modules_available"] = {
                name: cache.joinpath(*name.split(".")).with_suffix(".olean").is_file()
                for name in ["New.Selmer.FitTwistsExist", "New.Selmer.ValueFamilies", "New.Rows.Carrier"]}
            if cache.is_dir():
                archive = out / "native_c1_oleans.tar.zst"
                packed = original_step(["tar", "--zstd", "-cf", archive, "-C", cwd,
                                        ".lake/build/lib/lean"], cwd, env,
                                       out / "cache_archive.log", 300)
                state["archive_result"] = packed
                if packed["returncode"] == 0:
                    with archive.open("rb") as stream:
                        digest = hashlib.file_digest(stream, "sha256").hexdigest()
                    state.update(native_cache_retained=True, archive=archive.name,
                                 bytes=archive.stat().st_size, sha256=digest,
                                 lean_release_sha256=runner.RELEASE)
            save()
        return result

    try:
        runner.step = step
        sys.argv = [str(RUNNER), "--out", str(out)] + (["--preflight"] if args.preflight else [])
        runner.main()
        if not args.preflight and not state["native_cache_retained"]:
            raise RuntimeError("C1 runner finished but original compiled cache was not retained")
    except Exception as exc:
        state["failure"] = str(exc)
        save()
        raise
    finally:
        runner.step, sys.argv = original_step, original_argv


if __name__ == "__main__":
    main()
