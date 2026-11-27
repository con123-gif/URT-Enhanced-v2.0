#!/usr/bin/env python3
"""Reproduce the compact native relation-transport replay.

This authenticates the pinned source checkout, builds the exact defining module, invokes Lean on
the repository certificate, and rejects compiler errors or any `sorryAx` in the axiom output.
"""

from __future__ import annotations

import argparse
import os
import pathlib
import subprocess
import sys

PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
BLOBS = {
    "grh-compact/src/Lib/General/Algebra/FittingDuality.lean":
        "50c522f409cc0214163df1d26b77aede4aa8100a",
    "grh-compact/src/New/Selmer/TwistForRows.lean":
        "802242498ad4530e7f52cc4f14e0a03be2c59f4d",
    "grh-compact/src/New/Selmer/TwistTheorem.lean":
        "bdf0bed65edefd067b584695b1fac0b6acbbd754",
}
EXPECTED_AXIOMS = "[propext, Classical.choice, Quot.sound]"


def run(cmd: list[str], cwd: pathlib.Path, env: dict[str, str]) -> str:
    completed = subprocess.run(
        cmd, cwd=cwd, env=env, text=True, stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT, check=False,
    )
    sys.stdout.write(completed.stdout)
    if completed.returncode != 0:
        raise SystemExit(completed.returncode)
    return completed.stdout


def git(checkout: pathlib.Path, *args: str) -> str:
    return subprocess.check_output(
        ["git", "-C", str(checkout), *args], text=True
    ).strip()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--compact-checkout", required=True, type=pathlib.Path)
    parser.add_argument("--lean-home", required=True, type=pathlib.Path)
    parser.add_argument("--skip-build", action="store_true")
    args = parser.parse_args()

    checkout = args.compact_checkout.resolve()
    compact = checkout / "grh-compact"
    lean_file = pathlib.Path(__file__).with_name(
        "2026-11-27_COMPACT_RELATION_TRANSPORT_NATIVE.lean"
    ).resolve()
    assert git(checkout, "rev-parse", "HEAD") == PIN
    for rel, expected in BLOBS.items():
        assert git(checkout, "hash-object", rel) == expected, rel

    env = dict(os.environ)
    env["PATH"] = str(args.lean_home.resolve() / "bin") + os.pathsep + env["PATH"]
    version = run(["lean", "--version"], compact, env)
    assert "version 4.35.0" in version
    if not args.skip_build:
        run(["lake", "build", "Lib.General.Algebra.FittingDuality"], compact, env)
    output = run(["lake", "env", "lean", str(lean_file)], compact, env)

    assert "error:" not in output.lower()
    assert "sorryAx" not in output
    normalized_output = " ".join(output.split())
    declarations = (
        "relEval_mapRel_eq_zero_of_forall_dual",
        "mapRel_mem_relationsOn_of_forall_dual",
        "obeying_antitone",
    )
    for declaration in declarations:
        marker = f"'{declaration}' depends on axioms: {EXPECTED_AXIOMS}"
        if marker not in normalized_output:
            # Lean qualifies declarations by namespace in its output.
            qualified = (
                "'CompactRelationTransportNative." + declaration
                + f"' depends on axioms: {EXPECTED_AXIOMS}"
            )
            assert qualified in normalized_output, declaration

    print(f"PASS source_pin={PIN}")
    print(f"PASS source_blobs={len(BLOBS)}")
    print("PASS native_declarations=3")
    print(f"PASS axioms={EXPECTED_AXIOMS}")
    print("STATUS replayed_not_integrated")


if __name__ == "__main__":
    main()
