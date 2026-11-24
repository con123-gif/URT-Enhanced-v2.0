#!/usr/bin/env python3
"""Finite regression for the source-matched QH.ind_drop reconstruction.

This checks arithmetic routing and report provenance only. It is not a Lean proof.
"""

from __future__ import annotations

from math import gcd
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPORT = HERE / "2026-11-24_ind_drop_conductor_descent.md"

SOURCES = {
    "IndDrop.lean": "1fc497069c8499edef750d4264a106e442dcb1ef",
    "TwistPrim.lean": "5443adc0075731900672030d140d5d8c85b668f7",
    "IndUnique.lean": "d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e",
    "PrimeSetTwoBounds.lean": "45616f33334b6ef360b18a8e64c0eb325f9463b8",
    "pairEx.lean": "0020840fcf9b97e9e6e834c591e8516b9875e003",
}


def is_prime(n: int) -> bool:
    if n < 2:
        return False
    return all(n % d for d in range(2, int(n**0.5) + 1))


def divisors(n: int) -> list[int]:
    return [d for d in range(1, n + 1) if n % d == 0]


def legendre(n: int, p: int) -> int:
    n %= p
    if n == 0:
        return 0
    value = pow(n, (p - 1) // 2, p)
    return -1 if value == p - 1 else value


def xi_primitive(n: int) -> int:
    return legendre(n, 3)


def xi_changed_to_12(n: int) -> int:
    # Change level of the nontrivial character modulo 3 to level 12.
    return xi_primitive(n) if gcd(n, 12) == 1 else 0


def check_report() -> int:
    text = REPORT.read_text(encoding="utf-8")
    anchors = [
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        "QH.ind_drop",
        "QH.twist_prim",
        "QH.ind_unique",
        "Sigma.mk.inj_iff",
        "changeLevel_eq_cast_of_dvd'",
        "factorsThrough_gcd",
        "neither divides the other",
        "Failed attempts / limitations",
        "RESUME HERE",
        "not a replacement for Lean elaboration",
    ]
    for path, sha in SOURCES.items():
        assert path in text and sha in text, (path, sha)
    for anchor in anchors:
        assert anchor in text, anchor
    return len(anchors) + 2 * len(SOURCES)


def check_coprimality_routing() -> tuple[int, int]:
    comparison_checks = 0
    target_checks = 0
    primes = [q for q in range(3, 24) if is_prime(q)]
    for n0 in range(1, 25):
        for q in primes:
            if q == 2 or n0 % q == 0:
                continue
            for m in range(1, 16):
                level = m * n0 * q
                for n in range(1, 121):
                    if gcd(n, level) == 1:
                        assert gcd(n, m) == 1
                        assert gcd(n, n0) == 1
                        comparison_checks += 1
                    if gcd(n, n0 * q) == 1:
                        assert gcd(n, n0) == 1
                        target_checks += 1
    return comparison_checks, target_checks


def check_conductor_exclusion() -> int:
    checks = 0
    for n0 in range(1, 80):
        for q in range(3, 30):
            if not is_prime(q) or n0 % q == 0:
                continue
            for conductor in divisors(n0):
                assert conductor % q != 0
                checks += 1
    return checks


def check_change_level_fixture() -> tuple[int, int]:
    # N0=12, conductor f=3, twist prime q=5, comparison M=7.
    n0, q, m = 12, 5, 7
    guarded = 0
    comparison = 0
    for n in range(1, 500):
        psi = xi_primitive(n) * legendre(n, q)
        if gcd(n, n0) == 1:
            assert xi_changed_to_12(n) == xi_primitive(n)
            guarded += 1
        if gcd(n, m * n0 * q) == 1:
            chi_from_input = xi_changed_to_12(n) * legendre(n, q)
            assert chi_from_input == psi
            comparison += 1
        if gcd(n, n0 * q) == 1:
            assert psi == xi_changed_to_12(n) * legendre(n, q)

    # Negative control: change-level equality is not global.
    assert xi_changed_to_12(2) == 0
    assert xi_primitive(2) == -1
    return guarded, comparison


def check_downstream_nonmonotonicity() -> tuple[int, int]:
    m0, q, d = 1, 11, 263
    source = 2 * m0 * q * d
    target = 8 * m0 * q
    assert source == 5786 and target == 88
    assert source % target != 0 and target % source != 0
    return source, target


def check_negative_controls() -> int:
    # q|N0 can allow q|conductor, blocking twist_prim's hypothesis.
    n0, q, conductor = 15, 3, 3
    assert n0 % conductor == 0 and n0 % q == 0 and conductor % q == 0
    # M=0 makes the comparison modulus zero.
    assert 0 * 12 * 5 == 0
    # q=2 is prime but explicitly excluded by twist_prim/ind_drop.
    assert is_prime(2)
    return 3


def main() -> None:
    report_checks = check_report()
    comparison_checks, target_checks = check_coprimality_routing()
    conductor_checks = check_conductor_exclusion()
    guarded, fixture_comparisons = check_change_level_fixture()
    source, target = check_downstream_nonmonotonicity()
    negative_controls = check_negative_controls()
    print(
        "ind_drop conductor regression: OK; "
        f"sources={len(SOURCES)}, report_checks={report_checks}, "
        f"comparison_coprime_checks={comparison_checks}, "
        f"target_coprime_checks={target_checks}, conductor_checks={conductor_checks}, "
        f"guarded_fixture_checks={guarded}, fixture_comparisons={fixture_comparisons}, "
        f"downstream_moduli={source}/{target}, negative_controls={negative_controls}"
    )


if __name__ == "__main__":
    main()
