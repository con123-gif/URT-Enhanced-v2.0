#!/usr/bin/env python3
"""Finite regression for Mathlib's changeLevel_injective arithmetic skeleton.

This does not replay Lean or prove the general Dirichlet-character theorem.
"""

from __future__ import annotations

from itertools import product
from math import gcd, prod
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPORT = HERE / "2026-11-24_change_level_injective_unit_lifting.md"
RH_REV = "40e56bab026552e089d7afcfeff08d2defb9c005"
MATHLIB_REV = "0df444a360eaa60ab8c11dca51a86af692955474"
SOURCES = {
    "Mathlib/NumberTheory/DirichletCharacter/Basic.lean":
        "4569ebb8e61f683a9c89877f0cda4d3add4d766d",
    "Mathlib/Data/ZMod/Units.lean":
        "c93c732e5bedd18aadd8cab7b9baf139bfb41553",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean":
        "d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean":
        "1fc497069c8499edef750d4264a106e442dcb1ef",
    "lake-manifest.json": "b4d1ec31575a26b2159ec3a262b482bc051f3f6f",
}


def distinct_prime_factors(n: int) -> list[int]:
    factors: list[int] = []
    candidate = 2
    while candidate * candidate <= n:
        if n % candidate == 0:
            factors.append(candidate)
            while n % candidate == 0:
                n //= candidate
        candidate += 1
    if n > 1:
        factors.append(n)
    return factors


def source_lift(x: int, n: int, m: int) -> tuple[int, int]:
    """Return Mathlib's k and the representative x + k*n."""
    selected = [p for p in distinct_prime_factors(m) if x % p != 0]
    k = prod(selected)
    return k, x + k * n


def units(n: int) -> list[int]:
    assert n > 0
    return [x for x in range(n) if gcd(x, n) == 1]


def divisors(m: int) -> list[int]:
    return [n for n in range(1, m + 1) if m % n == 0]


def check_report() -> int:
    text = REPORT.read_text(encoding="utf-8")
    anchors = [
        RH_REV,
        MATHLIB_REV,
        "changeLevel_injective",
        "unitsMap_surjective",
        "Nat.coprime_of_dvd",
        "MulChar.ext_iff",
        "n=5",
        "m=0",
        "Failed attempts / limitations",
        "RESUME HERE",
        "not a Lean kernel replay",
    ]
    anchors.extend(SOURCES)
    anchors.extend(SOURCES.values())
    for anchor in anchors:
        assert anchor in text, f"missing report anchor: {anchor}"
    return len(anchors)


def check_prime_factor_lift() -> int:
    checks = 0
    for m in range(1, 121):
        for n in divisors(m):
            for x in units(n):
                _, lifted = source_lift(x, n, m)
                assert lifted % n == x
                assert gcd(lifted, m) == 1
                for p in distinct_prime_factors(m):
                    assert lifted % p != 0
                    checks += 1
                checks += 2
    return checks


def check_units_map_surjective() -> int:
    checks = 0
    for m in range(1, 101):
        for n in divisors(m):
            source = units(m)
            image = {z % n for z in source}
            target = set(units(n))
            assert image == target
            checks += 1
            for x in target:
                _, lifted = source_lift(x, n, m)
                assert lifted % m in source
                assert lifted % n == x
                checks += 2
    return checks


def check_precomposition_injective() -> int:
    """Exhaust Boolean-valued functions on small target unit sets."""
    checks = 0
    for m in range(1, 31):
        for n in divisors(m):
            target = units(n)
            if len(target) > 5:
                continue
            source = units(m)
            target_index = {x: i for i, x in enumerate(target)}
            functions = list(product((False, True), repeat=len(target)))
            for f in functions:
                pull_f = tuple(f[target_index[z % n]] for z in source)
                for g in functions:
                    pull_g = tuple(g[target_index[z % n]] for z in source)
                    if pull_f == pull_g:
                        assert f == g
                    checks += 1
    return checks


def check_zero_target_obstruction() -> int:
    # ZMod 0 is Z, whose units are exactly +1 and -1.
    image_mod_five = {1 % 5, (-1) % 5}
    target = set(units(5))
    assert 0 % 5 == 0  # 5 divides 0.
    assert image_mod_five == {1, 4}
    assert target == {1, 2, 3, 4}
    assert image_mod_five != target
    return 4


def check_negative_controls() -> int:
    # k=0 fails to preserve being a unit in this example.
    assert gcd(2, 5) == 1
    assert gcd(2, 10) != 1

    # Sampling only a proper subset cannot cancel precomposition.
    f = (False, False, True)
    g = (False, True, True)
    sampled_positions = (0, 2)
    assert tuple(f[i] for i in sampled_positions) == tuple(g[i] for i in sampled_positions)
    assert f != g
    return 4


def main() -> None:
    counts = {
        "report_checks": check_report(),
        "lift_checks": check_prime_factor_lift(),
        "surjectivity_checks": check_units_map_surjective(),
        "cancellation_checks": check_precomposition_injective(),
        "zero_level_checks": check_zero_target_obstruction(),
        "negative_controls": check_negative_controls(),
    }
    summary = ", ".join(f"{name}={count}" for name, count in counts.items())
    print(f"changeLevel_injective unit-lifting regression: OK; {summary}")


if __name__ == "__main__":
    main()
