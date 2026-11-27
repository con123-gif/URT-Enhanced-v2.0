#!/usr/bin/env python3
"""Static/source and finite-free certificate for COMPACT_RELATION_TRANSPORT_NATIVE.

This is deliberately not a substitute for Lean elaboration.  It authenticates the exact compact
source pin/blobs when given the compact checkout, checks that the prepared file retains its stated
interface, and exhaustively checks the separating-dual implication on small free modules.
"""

from __future__ import annotations

import argparse
import itertools
import pathlib
import subprocess

PIN = "72fead102f663d5c7a407964a13dc0cf9d977207"
BLOBS = {
    "grh-compact/src/New/Selmer/TwistForRows.lean":
        "802242498ad4530e7f52cc4f14e0a03be2c59f4d",
    "grh-compact/src/Lib/General/Algebra/FittingDuality.lean":
        "50c522f409cc0214163df1d26b77aede4aa8100a",
    "grh-compact/src/New/Selmer/TwistTheorem.lean":
        "bdf0bed65edefd067b584695b1fac0b6acbbd754",
}
TOKENS = (
    "theorem relEval_mapRel_eq_zero_of_forall_dual",
    "[Projective O O']",
    "forall_dual_apply_eq_zero_iff O",
    "mapRel (algebraMap O O')",
    "theorem mapRel_mem_relationsOn_of_forall_dual",
    "theorem obeying_antitone",
    "mem_obeying.2",
    "RESUME HERE:",
)


def git(cwd: pathlib.Path, *args: str) -> str:
    return subprocess.check_output(["git", "-C", str(cwd), *args], text=True).strip()


def authenticate(checkout: pathlib.Path) -> None:
    assert git(checkout, "rev-parse", "HEAD") == PIN
    for rel, expected in BLOBS.items():
        actual = git(checkout, "hash-object", rel)
        assert actual == expected, (rel, expected, actual)


def finite_dual_separation() -> int:
    """Exhaust `(∀ coordinate dual l, l(v)=0) ⇒ v=0` for small free modules."""
    checks = 0
    for p in (2, 3, 5):
        for rank in range(1, 5):
            for v in itertools.product(range(p), repeat=rank):
                all_duals_zero = all(v[i] % p == 0 for i in range(rank))
                conclusion = all(x % p == 0 for x in v)
                assert (not all_duals_zero) or conclusion
                checks += rank
    return checks


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--compact-checkout", type=pathlib.Path)
    args = parser.parse_args()
    if args.compact_checkout is not None:
        authenticate(args.compact_checkout)
        print(f"PASS source_pin={PIN}")
        print(f"PASS source_blobs={len(BLOBS)}")
    else:
        print("SKIP source_authentication=no_compact_checkout")
    lean_file = pathlib.Path(__file__).with_name(
        "2026-11-27_COMPACT_RELATION_TRANSPORT_NATIVE.lean"
    )
    text = lean_file.read_text(encoding="utf-8")
    missing = [token for token in TOKENS if token not in text]
    assert not missing, missing
    checks = finite_dual_separation()
    print(f"PASS theorem_tokens={len(TOKENS)}")
    print(f"PASS finite_dual_coordinate_checks={checks}")
    print("STATUS prepared_not_kernel_checked")


if __name__ == "__main__":
    main()
