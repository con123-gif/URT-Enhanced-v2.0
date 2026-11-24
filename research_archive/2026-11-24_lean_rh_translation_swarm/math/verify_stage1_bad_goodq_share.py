#!/usr/bin/env python3
"""Deterministic regression for the source-matched QH.stage1 reconstruction.

This checks provenance/report anchors and the elementary adapter inequalities.
It is not a Lean kernel replay and does not certify the analytic stage theorem.
"""

from __future__ import annotations

import math
from pathlib import Path


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
SOURCES = {
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/Stage1Succ.lean":
        "79f79fe71e41f403a4d22e5b86540410748ac7c3",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/StagePow.lean":
        "2f7159075ea0e309f4a7ff7e237ede7b71bbe5e7",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean":
        "712579c16be75074705a2c5c00f69e2f5d835cf9",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean":
        "45616f33334b6ef360b18a8e64c0eb325f9463b8",
}


def divisors(n: int) -> list[int]:
    return [d for d in range(1, n + 1) if n % d == 0]


def check_conductor_models() -> int:
    checks = 0
    for n0 in range(1, 81):
        domain = list(range(2 * n0 + 1))
        # A finite mock of conductor lowering: every character label is sent
        # to one divisor of N0. Only image-cardinality and level facts matter.
        ds = divisors(n0)
        image = {ds[x % len(ds)] for x in domain}
        assert len(image) <= len(domain)
        for c in image:
            assert n0 % c == 0
            assert 1 <= c <= n0
            checks += 3
    return checks


def find_cutoff_log(eps: float, n0: int) -> tuple[float, float]:
    """Find L=log Y with all explicit wrapper inequalities true.

    Work in log space so the enormous Y itself is never formed.
    """
    length = 1.0
    for _ in range(200_000):
        exponent = eps * length / 5
        if exponent < 700:
            z = math.exp(exponent)
            if (
                z >= 2 * n0
                and length >= 1
                and length * length <= z / 2
                and 0.25 * length * length * math.log(8) <= z
            ):
                return length, z
        length *= 1.005
    raise AssertionError((eps, n0, length))


def check_scale_inequalities() -> int:
    checks = 0
    for eps in (1 / 1000, 1 / 401, 1 / 104, 1 / 53):
        assert 0 < eps < 1 / 52
        assert eps <= 1 / 4
        for n0 in (1, 2, 7, 31, 100):
            length, z = find_cutoff_log(eps, n0)
            # Y^(eps/6) <= Y^(eps/5) for log Y >= 0, checked in logs.
            assert eps * length / 6 <= math.log(z) + 1e-12
            # z <= z (log Y)^2.
            assert z <= z * length * length
            # F <= sqrt(exp z), checked after taking logs.
            assert math.log(n0) <= z / 2
            # Prime divisors of 8 reduce to 2 and use the small-prime branch.
            assert z >= 2
            checks += 6
    return checks


def check_coprimality_direction() -> tuple[int, tuple[int, int, int]]:
    checks = 0
    counterexample = None
    primes = (2, 3, 5, 7, 11, 13, 17, 19)
    for n0 in range(1, 41):
        for q in primes:
            if math.gcd(n0, q) != 1:
                continue
            for n in range(1, 4 * n0 * q + 1):
                if math.gcd(n, n0 * q) == 1:
                    assert math.gcd(n, n0) == 1
                    checks += 1
                if (
                    counterexample is None
                    and math.gcd(n, n0) == 1
                    and math.gcd(n, n0 * q) != 1
                ):
                    counterexample = (n0, q, n)
    assert counterexample is not None
    n0, q, n = counterexample
    assert math.gcd(n, n0) == 1 and math.gcd(n, n0 * q) != 1
    return checks, counterexample


def check_report() -> int:
    report = Path(__file__).with_name("2026-11-24_stage1_bad_goodq_share.md")
    text = report.read_text(encoding="utf-8")
    assert PIN in text
    for path, blob in SOURCES.items():
        assert path in text and blob in text
    anchors = (
        "QH.stage1",
        "primePairSetFirst",
        "eps<1/52",
        "card B <= eta",
        "stage1_prim",
        "image(g",
        "U=exp z",
        "F=N0",
        "m0` | `8",
        "a0` | `3",
        "M = N0*q",
        "Coprime(n,N0*q) => Coprime(n,N0)",
        "count_bad",
        "meanSqK",
        "not a Lean kernel replay",
        "Failed attempts / limits",
        "RESUME HERE",
    )
    for anchor in anchors:
        assert anchor in text, anchor
    return 1 + len(SOURCES) + len(anchors)


def main() -> None:
    conductor_checks = check_conductor_models()
    scale_checks = check_scale_inequalities()
    coprime_checks, counterexample = check_coprimality_direction()
    assert 0 < 1 / 53 < 1 / 52
    assert not (0 < 1 / 52 < 1 / 52)  # strict endpoint negative control
    report_checks = check_report()
    print(
        "stage1 bad-GoodQ regression: OK; "
        f"sources={len(SOURCES)}, conductor_checks={conductor_checks}, "
        f"scale_checks={scale_checks}, coprime_checks={coprime_checks}, "
        f"converse_counterexample={counterexample}, report_checks={report_checks}, "
        "strict_eps_negative_controls=1"
    )


if __name__ == "__main__":
    main()
