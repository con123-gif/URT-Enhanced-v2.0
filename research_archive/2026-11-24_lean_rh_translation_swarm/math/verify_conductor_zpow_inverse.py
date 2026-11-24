#!/usr/bin/env python3
"""Exact finite regression for conductor_zpow_dvd and conductor_inv.

Characters are represented exactly by exponents of roots of unity on products
of small prime unit groups.  Conductors are recovered by the factor-through
fibre condition, not assigned from the parameter vector under test.
"""

from __future__ import annotations

from itertools import product
from math import gcd, lcm, prod
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPORT = HERE / "2026-11-24_conductor_zpow_inverse.md"
PRIME_SETS = (
    (3,), (5,), (7,), (11,),
    (3, 5), (3, 7), (5, 7), (3, 5, 7),
)
EXPONENTS = tuple(range(-12, 13))


def check(ok: bool, message: str) -> None:
    if not ok:
        raise AssertionError(message)


def divisors(n: int) -> list[int]:
    return [d for d in range(1, n + 1) if n % d == 0]


def prime_factors(n: int) -> list[int]:
    return [p for p in range(2, n + 1) if n % p == 0 and all(p % q for q in range(2, p))]


def primitive_root(p: int) -> int:
    factors = prime_factors(p - 1)
    for g in range(2, p):
        if all(pow(g, (p - 1) // q, p) != 1 for q in factors):
            return g
    raise AssertionError(f"no primitive root for {p}")


def log_table(p: int) -> dict[int, int]:
    g = primitive_root(p)
    return {pow(g, e, p): e for e in range(p - 1)}


def phase_order(primes: tuple[int, ...]) -> int:
    out = 1
    for p in primes:
        out = lcm(out, p - 1)
    return out


def char_value(
    primes: tuple[int, ...], weights: tuple[int, ...], a: int
) -> int | None:
    """Exact root-of-unity exponent, or None for the MulChar zero on nonunits."""
    n = prod(primes)
    if gcd(a, n) != 1:
        return None
    order = phase_order(primes)
    exponent = 0
    for p, weight in zip(primes, weights):
        exponent += weight * log_table(p)[a % p] * (order // (p - 1))
    return exponent % order


def zpow_weights(
    primes: tuple[int, ...], weights: tuple[int, ...], exponent: int
) -> tuple[int, ...]:
    return tuple((exponent * w) % (p - 1) for p, w in zip(primes, weights))


def factors_through(
    primes: tuple[int, ...], weights: tuple[int, ...], d: int
) -> bool:
    n = prod(primes)
    fibres: dict[int, int] = {}
    for a in range(n):
        value = char_value(primes, weights, a)
        if value is None:
            continue
        residue = a % d
        if residue in fibres and fibres[residue] != value:
            return False
        fibres[residue] = value
    return True


def recovered_conductor(
    primes: tuple[int, ...], weights: tuple[int, ...]
) -> int:
    n = prod(primes)
    return min(d for d in divisors(n) if factors_through(primes, weights, d))


def main() -> None:
    report = REPORT.read_text(encoding="utf-8")
    anchors = (
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        "0df444a360eaa60ab8c11dca51a86af692955474",
        "Mathlib/NumberTheory/DirichletCharacter/Basic.lean",
        "conductor_zpow_dvd",
        "conductor_inv",
        "mem_conductorSet_iff_conductor_dvd",
        "MonoidHom.map_zpow",
        "double inverse",
        "RESUME HERE",
    )
    report_checks = 0
    for anchor in anchors:
        check(anchor in report, f"missing report anchor: {anchor}")
        report_checks += 1

    character_checks = 0
    fibre_checks = 0
    zpow_checks = 0
    value_checks = 0
    inverse_checks = 0

    for primes in PRIME_SETS:
        n = prod(primes)
        ranges = [range(p - 1) for p in primes]
        for weights in product(*ranges):
            weights = tuple(weights)
            conductor = recovered_conductor(primes, weights)
            expected = prod(p for p, w in zip(primes, weights) if w != 0)
            check(conductor == expected, f"conductor recovery failed {primes=} {weights=}")
            character_checks += 1

            for d in divisors(n):
                observed = factors_through(primes, weights, d)
                check(observed == (d % conductor == 0), f"factor-through mismatch {primes=} {weights=} {d=}")
                fibre_checks += 1

            inverse = zpow_weights(primes, weights, -1)
            inverse_conductor = recovered_conductor(primes, inverse)
            check(inverse_conductor == conductor, f"inverse conductor changed {primes=} {weights=}")
            check(zpow_weights(primes, inverse, -1) == weights, f"double inverse failed {primes=} {weights=}")
            inverse_checks += 2

            for exponent in EXPONENTS:
                powered = zpow_weights(primes, weights, exponent)
                powered_conductor = recovered_conductor(primes, powered)
                check(conductor % powered_conductor == 0, f"zpow conductor bound failed {primes=} {weights=} {exponent=}")
                zpow_checks += 1
                order = phase_order(primes)
                for a in range(n):
                    base_value = char_value(primes, weights, a)
                    powered_value = char_value(primes, powered, a)
                    if base_value is None:
                        # Every character power, including exponent zero, is the
                        # character-group identity and therefore zero on nonunits.
                        check(powered_value is None, f"nonunit power became nonzero {primes=} {a=}")
                    else:
                        check(powered_value == exponent * base_value % order, f"unit zpow mismatch {primes=} {a=}")
                    value_checks += 1

    negative_controls = 0
    # A quadratic character can square to the principal character, so equality
    # is false even though divisibility is true.
    check(recovered_conductor((3,), (1,)) == 3, "quadratic base conductor")
    check(recovered_conductor((3,), zpow_weights((3,), (1,), 2)) == 1, "quadratic square conductor")
    negative_controls += 1
    # At exponent zero the identity character remains zero on nonunits.
    check(char_value((5,), zpow_weights((5,), (1,), 0), 0) is None, "identity nonunit value")
    negative_controls += 1
    # The zero-level proof branch is the arithmetic statement 0 divides 0.
    check(lcm(0, 0) == 0, "zero-level control")
    negative_controls += 1

    print(
        "conductor zpow/inverse regression: OK; "
        f"report_checks={report_checks}, character_checks={character_checks}, "
        f"fibre_checks={fibre_checks}, zpow_checks={zpow_checks}, "
        f"value_checks={value_checks}, inverse_checks={inverse_checks}, "
        f"negative_controls={negative_controls}"
    )


if __name__ == "__main__":
    main()
