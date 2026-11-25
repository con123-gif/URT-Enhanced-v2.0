#!/usr/bin/env python3
"""Exact finite regression for conductor_changeLevel and injectivity.

Small Dirichlet characters are represented by exact root-of-unity exponents.
Conductors are recovered from unit-fibre constancy at each ambient level.  The
checker does not assign the expected conductor to the lifted character.
"""

from __future__ import annotations

from itertools import product
from math import gcd, lcm, prod
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPORT = HERE / "2026-11-25_conductor_change_level.md"
BASES = ((), (3,), (5,), (7,), (11,), (3, 5), (3, 7), (5, 7), (3, 5, 7))


def check(ok: bool, message: str) -> None:
    if not ok:
        raise AssertionError(message)


def divisors(n: int) -> list[int]:
    return [d for d in range(1, n + 1) if n % d == 0]


def prime_factors(n: int) -> list[int]:
    out: list[int] = []
    q = 2
    while q * q <= n:
        if n % q == 0:
            out.append(q)
            while n % q == 0:
                n //= q
        q += 1
    if n > 1:
        out.append(n)
    return out


def primitive_root(p: int) -> int:
    factors = prime_factors(p - 1)
    for g in range(2, p):
        if all(pow(g, (p - 1) // q, p) != 1 for q in factors):
            return g
    raise AssertionError(f"no primitive root modulo {p}")


def log_table(p: int) -> dict[int, int]:
    g = primitive_root(p)
    return {pow(g, e, p): e for e in range(p - 1)}


def phase_order(base_primes: tuple[int, ...]) -> int:
    order = 1
    for p in base_primes:
        order = lcm(order, p - 1)
    return order


def lifted_value(
    base_primes: tuple[int, ...],
    weights: tuple[int, ...],
    ambient_primes: tuple[int, ...],
    a: int,
) -> int | None:
    ambient = prod(ambient_primes) if ambient_primes else 1
    if gcd(a, ambient) != 1:
        return None
    order = phase_order(base_primes)
    exponent = 0
    for p, weight in zip(base_primes, weights):
        exponent += weight * log_table(p)[a % p] * (order // (p - 1))
    return exponent % order


def factors_through(
    base_primes: tuple[int, ...],
    weights: tuple[int, ...],
    ambient_primes: tuple[int, ...],
    d: int,
) -> bool:
    ambient = prod(ambient_primes) if ambient_primes else 1
    fibres: dict[int, int] = {}
    for a in range(ambient):
        value = lifted_value(base_primes, weights, ambient_primes, a)
        if value is None:
            continue
        residue = a % d
        if residue in fibres and fibres[residue] != value:
            return False
        fibres[residue] = value
    return True


def recovered_conductor(
    base_primes: tuple[int, ...],
    weights: tuple[int, ...],
    ambient_primes: tuple[int, ...],
) -> int:
    ambient = prod(ambient_primes) if ambient_primes else 1
    return min(
        d for d in divisors(ambient)
        if factors_through(base_primes, weights, ambient_primes, d)
    )


def signature(
    base_primes: tuple[int, ...],
    weights: tuple[int, ...],
    ambient_primes: tuple[int, ...],
) -> tuple[int | None, ...]:
    ambient = prod(ambient_primes) if ambient_primes else 1
    return tuple(lifted_value(base_primes, weights, ambient_primes, a) for a in range(ambient))


def main() -> None:
    report = REPORT.read_text(encoding="utf-8")
    anchors = (
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        "0df444a360eaa60ab8c11dca51a86af692955474",
        "conductor_changeLevel",
        "conductor_dvd_of_mem_conductorSet",
        "changeLevel_injective",
        "changeLevel_trans",
        "ZMod.unitsMap_surjective",
        "TwistIsPrimitiveCharacter.lean",
        "RESUME HERE",
    )
    report_checks = 0
    for anchor in anchors:
        check(anchor in report, f"missing report anchor: {anchor}")
        report_checks += 1

    character_checks = 0
    conductor_checks = 0
    fibre_checks = 0
    transitivity_checks = 0
    injectivity_checks = 0

    for base_primes in BASES:
        extra = 13 if 11 in base_primes else 11
        ambient_primes = tuple(sorted(base_primes + (extra,)))
        ranges = [range(p - 1) for p in base_primes]
        characters = [tuple(w) for w in product(*ranges)] if ranges else [()]
        lifted_signatures: dict[tuple[int | None, ...], tuple[int, ...]] = {}

        for weights in characters:
            c_base = recovered_conductor(base_primes, weights, base_primes)
            c_lift = recovered_conductor(base_primes, weights, ambient_primes)
            expected = prod(p for p, w in zip(base_primes, weights) if w != 0)
            check(c_base == expected, f"base conductor recovery failed {base_primes=} {weights=}")
            check(c_lift == c_base, f"changeLevel changed conductor {base_primes=} {weights=}")
            conductor_checks += 2

            # The two conductor-set memberships used in the Lean proof.
            check(factors_through(base_primes, weights, ambient_primes, c_base), "lift does not factor through old conductor")
            check(factors_through(base_primes, weights, base_primes, c_lift), "base does not factor through lifted conductor")
            fibre_checks += 2

            # Direct conductor-to-ambient lift equals conductor-to-base-to-ambient.
            direct = signature(base_primes, weights, ambient_primes)
            base_level = prod(base_primes) if base_primes else 1
            ambient_level = prod(ambient_primes)
            via_base = tuple(
                None if gcd(a, ambient_level) != 1 else
                lifted_value(base_primes, weights, base_primes, a % base_level)
                for a in range(ambient_level)
            )
            check(direct == via_base, "changeLevel transitivity model")
            transitivity_checks += 1

            # Equality after lifting to a nonzero multiple reflects equality below.
            check(direct not in lifted_signatures, f"changeLevel collision {base_primes=} {weights=}")
            lifted_signatures[direct] = weights
            injectivity_checks += 1
            character_checks += 1

        check(len(lifted_signatures) == len(characters), f"injectivity census failed {base_primes=}")
        injectivity_checks += 1

    negative_controls = 0
    # The nonzero target hypothesis is essential.  For a formal lift from level
    # 5 to level 0, target units are only +/-1. Characters of weights 1 and 3
    # agree on both, although they differ on 2 modulo 5.
    order = 4
    values_w1 = (0, (1 * 2) % order)  # values at 1 and -1=g^2
    values_w3 = (0, (3 * 2) % order)
    check(values_w1 == values_w3 and (1 * 1) % order != (3 * 1) % order, "zero-target noninjectivity control")
    negative_controls += 1
    # A lift changes the formal level: confusing level with conductor would
    # claim conductor 55 for a conductor-5 character lifted from 5 to 55.
    check(recovered_conductor((5,), (1,), (5, 11)) == 5, "formal-level/conductor control")
    negative_controls += 1

    print(
        "conductor changeLevel regression: OK; "
        f"report_checks={report_checks}, character_checks={character_checks}, "
        f"conductor_checks={conductor_checks}, fibre_checks={fibre_checks}, "
        f"transitivity_checks={transitivity_checks}, injectivity_checks={injectivity_checks}, "
        f"negative_controls={negative_controls}"
    )


if __name__ == "__main__":
    main()
