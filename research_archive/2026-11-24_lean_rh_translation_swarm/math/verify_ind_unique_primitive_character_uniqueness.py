#!/usr/bin/env python3
"""Finite arithmetic regression for the QH.ind_unique reconstruction.

This is a provenance and finite-routing certificate, not a Lean proof.
"""

from __future__ import annotations

from math import gcd, lcm
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPORT = HERE / "2026-11-24_ind_unique_primitive_character_uniqueness.md"

SOURCES = {
    "IndUnique.lean": "d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e",
    "IndDrop.lean": "1fc497069c8499edef750d4264a106e442dcb1ef",
    "lake-manifest.json": "b4d1ec31575a26b2159ec3a262b482bc051f3f6f",
    "Basic.lean": "4569ebb8e61f683a9c89877f0cda4d3add4d766d",
}
MATHLIB_REV = "0df444a360eaa60ab8c11dca51a86af692955474"


def check_report() -> int:
    text = REPORT.read_text(encoding="utf-8")
    anchors = [
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        MATHLIB_REV,
        "QH.ind_unique",
        "factorsThrough_gcd",
        "factorsThrough_iff_ker_unitsMap",
        "changeLevel_injective",
        "Nat.chineseRemainder'",
        "gcd(N,N')=N",
        "N=2,N'=4",
        "Failed attempts / limitations",
        "RESUME HERE",
        "not a Lean kernel replay",
    ]
    for path, sha in SOURCES.items():
        assert path in text and sha in text, (path, sha)
    for anchor in anchors:
        assert anchor in text, anchor
    return len(anchors) + 2 * len(SOURCES)


def check_common_level_restriction() -> int:
    checks = 0
    for n_level in range(1, 22):
        for n_prime_level in range(1, 22):
            for comparison in range(1, 14):
                common = n_level * n_prime_level * comparison
                for value in range(common):
                    if gcd(value, common) == 1:
                        assert gcd(value, comparison) == 1
                        assert gcd(value, n_level) == 1
                        assert gcd(value, n_prime_level) == 1
                        checks += 1
    return checks


def compatible_crt_witness(x: int, n: int, m: int) -> int:
    """Find z=x (mod n), z=1 (mod m) on the canonical lcm range."""
    for z in range(lcm(n, m)):
        if z % n == x % n and z % m == 1 % m:
            return z
    raise AssertionError((x, n, m))


def check_crt_kernel_step() -> int:
    checks = 0
    for n in range(1, 35):
        for m in range(1, 35):
            g = gcd(n, m)
            for x in range(n):
                if gcd(x, n) != 1 or x % g != 1 % g:
                    continue
                z = compatible_crt_witness(x, n, m)
                assert z % n == x % n
                assert z % m == 1 % m
                assert gcd(z, n * m) == 1
                checks += 1
    return checks


def check_two_sided_gcd_forcing() -> tuple[int, int]:
    forcing = 0
    one_sided = 0
    for n in range(1, 101):
        for m in range(1, 101):
            g1 = gcd(n, m)
            g2 = gcd(m, n)
            if n <= g1 and m <= g2:
                assert n == m
                forcing += 1
            if n <= g1:
                assert n != 0 and m % n == 0
                one_sided += 1
    assert gcd(2, 4) == 2 and 2 != 4
    return forcing, one_sided


def check_level_arithmetic() -> int:
    checks = 0
    for n in range(1, 30):
        for m in range(1, 30):
            for comparison in range(1, 10):
                level = n * m * comparison
                assert level % n == 0
                assert level % m == 0
                assert level % comparison == 0
                assert level % (n * m) == 0
                assert level % (m * n) == 0
                checks += 5
    return checks


def check_negative_controls() -> int:
    # One gcd direction does not force level equality.
    assert gcd(2, 4) == 2 and 2 != 4
    # M=0 destroys the nonzero common target level.
    assert 7 * 11 * 0 == 0
    # A nonunit at the common level need not be coprime to M.
    assert gcd(6, 5 * 7 * 6) != 1 and gcd(6, 6) != 1
    # Agreement on a single residue cannot establish character extensionality.
    samples_a = [1, 1, -1]
    samples_b = [1, -1, -1]
    assert samples_a[0] == samples_b[0] and samples_a != samples_b
    return 4


def main() -> None:
    report_checks = check_report()
    restriction_checks = check_common_level_restriction()
    crt_checks = check_crt_kernel_step()
    forcing_checks, one_sided_checks = check_two_sided_gcd_forcing()
    level_checks = check_level_arithmetic()
    negative_controls = check_negative_controls()
    print(
        "ind_unique primitive-character regression: OK; "
        f"sources={len(SOURCES)}, report_checks={report_checks}, "
        f"restriction_checks={restriction_checks}, crt_checks={crt_checks}, "
        f"two_sided_forcing_checks={forcing_checks}, one_sided_checks={one_sided_checks}, "
        f"level_checks={level_checks}, negative_controls={negative_controls}"
    )


if __name__ == "__main__":
    main()
