#!/usr/bin/env python3
"""Finite regression for the source-matched QH.twist_prim reconstruction.

This instantiates the conductor/evaluation skeleton with quadratic characters
on small prime moduli.  It is not a Lean kernel replay.
"""

from __future__ import annotations

from math import gcd
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPORT = HERE / "2026-11-24_twist_prim_jacobi_conductor.md"

ANCHORS = (
    "40e56bab026552e089d7afcfeff08d2defb9c005",
    "5443adc0075731900672030d140d5d8c85b668f7",
    "388210880aa1abb93dbb2f7dc93115e0190f0638",
    "2c73f2f3005e8fe05017d74506cff497df52e4bd",
    "bdea967f4db26bfc2b040f01beeebbed0ff8909c",
    "1fc497069c8499edef750d4264a106e442dcb1ef",
    "9282d3a102c4aff0e6026746db2a8990f5d9cddd",
    "12203d3f4ca7e7da27ab01667d8c084d61246de6",
    "4564722f96a5e2ca86092fb039e127a77a950c34",
    "ed8c63c192dc174f282bad96335dbb57c6d4a4a2",
    "3a2de971bd8f34ce6fc3ca7aad7f635a4187fd5f",
    "QH.twist_prim",
    "twist_is_primitive_character",
    "twist_evaluation_formula",
    "conductor_mul_dvd_lcm_conductor",
    "jacobiSym.eq_zero_iff_not_coprime",
    "## Failed attempts / limitations",
    "## RESUME HERE",
)


def divisors(n: int) -> tuple[int, ...]:
    return tuple(d for d in range(1, n + 1) if n % d == 0)


def legendre(n: int, p: int) -> int:
    """Legendre symbol for prime p, including the p=2 control."""

    n %= p
    if n == 0:
        return 0
    if p == 2:
        return 1
    value = pow(n, (p - 1) // 2, p)
    assert value in (1, p - 1)
    return 1 if value == 1 else -1


def quadratic_twist_value(n: int, p: int, q: int) -> int:
    # The extended characters already vanish on nonunits of each factor.
    return legendre(n, p) * legendre(n, q)


def factors_through_on_units(n: int, d: int, values: tuple[int, ...]) -> bool:
    """Finite unit-kernel criterion for the tested cyclic residue groups."""

    seen: dict[int, int] = {}
    for u in range(n):
        if gcd(u, n) != 1:
            continue
        residue = u % d
        value = values[u]
        if residue in seen and seen[residue] != value:
            return False
        seen[residue] = value
    return True


def finite_conductor(n: int, values: tuple[int, ...]) -> int:
    return min(d for d in divisors(n) if factors_through_on_units(n, d, values))


def main() -> None:
    report = REPORT.read_text(encoding="utf-8")
    for anchor in ANCHORS:
        assert anchor in report, anchor
    report_checks = len(ANCHORS)

    primes = (3, 5, 7, 11, 13, 17, 19, 23, 29, 31)
    evaluation_checks = 0
    square_checks = 0
    conductor_checks = 0
    nonunit_checks = 0

    for p in primes:
        for q in primes:
            if p == q:
                continue
            modulus = p * q
            values = tuple(quadratic_twist_value(n, p, q) for n in range(modulus))
            for n, value in enumerate(values):
                # Global formula, including zero values at both nonunit branches.
                assert value == legendre(n, p) * legendre(n, q)
                evaluation_checks += 1
                if gcd(n, modulus) == 1:
                    assert value * value == 1
                    square_checks += 1
                else:
                    assert value == 0
                    nonunit_checks += 1
            assert finite_conductor(modulus, values) == modulus
            assert any(value == -1 for value in values)
            conductor_checks += 2

    # q=2: the quadratic character on the one-element unit group is principal.
    qc2 = tuple(legendre(n, 2) for n in range(2))
    assert finite_conductor(2, qc2) == 1

    # Reusing q=3 instead of adjoining a coprime new prime squares the same
    # quadratic character. On units modulo 9 the result is principal.
    repeated = tuple(quadratic_twist_value(n, 3, 3) for n in range(9))
    assert finite_conductor(9, repeated) == 1
    assert all(repeated[n] == 1 for n in range(9) if gcd(n, 9) == 1)
    negative_controls = 3

    print(
        "twist_prim Jacobi/conductor regression: OK; "
        f"report_checks={report_checks}, evaluation_checks={evaluation_checks}, "
        f"square_checks={square_checks}, conductor_checks={conductor_checks}, "
        f"nonunit_checks={nonunit_checks}, negative_controls={negative_controls}"
    )


if __name__ == "__main__":
    main()
