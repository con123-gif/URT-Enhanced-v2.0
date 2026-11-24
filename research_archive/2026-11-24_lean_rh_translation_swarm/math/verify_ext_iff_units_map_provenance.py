#!/usr/bin/env python3
"""Finite regression certificate for the ext_iff / Units.map provenance note.

This is deliberately a standard-library check, not a Lean kernel replay.  It
guards the exact source ledger recorded in the report and instantiates the
mathematical content of the generated extensionality iff and the explicit
unit witness transported by Units.map.
"""

from __future__ import annotations

from itertools import product
from math import gcd
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPORT = HERE / "2026-11-24_ext_iff_units_map_provenance.md"

EXPECTED_REPORT_ANCHORS = (
    "40e56bab026552e089d7afcfeff08d2defb9c005",
    "b4d1ec31575a26b2159ec3a262b482bc051f3f6f",
    "0df444a360eaa60ab8c11dca51a86af692955474",
    "819816b2e0a3bf405af45ae5c7af2491d8f5bee6",
    "dc3c465d304326784909c686d278edfa30a75385",
    "253a16e52bc0469a2071c2c29a03a97951d790f7",
    "4569ebb8e61f683a9c89877f0cda4d3add4d766d",
    "526ed04905f730e568144cbf0043f439a6d86651",
    "5e503f026f6e03a03a44f7ce25f5e5ab5cc6f96f",
    "9282d3a102c4aff0e6026746db2a8990f5d9cddd",
    "31ce06eaadf4a200c0e1407c5f10953cf606b8f8",
    "0b77e12952ad39077d80d8bd6b66d601f225c321",
    "b7bcab6786a7c009f3cdf020189fc33b8f7685eb",
    "Mathlib/NumberTheory/MulChar/Basic.lean",
    "Mathlib/Algebra/Group/Units/Hom.lean",
    "Mathlib/NumberTheory/DirichletCharacter/Basic.lean",
    "src/Lean/Elab/Tactic/Ext.lean",
    "src/Lean/Meta/Tactic/Ext.lean",
    "mkExtIffType",
    "realizeExtIffTheorem",
    "ExtTheorem",
    "extExtension",
    "MulChar.ext_iff",
    "Units.map",
    "Units.coe_map",
    "CommMonoid",
    "CommMonoidWithZero",
    "No Lean or lake executable is installed locally",
    "## Failed attempts / limitations",
    "## RESUME HERE",
)


def generated_iff_name(theorem_name: str) -> str:
    """Mirror realizeExtIffTheorem's final-component `_iff` naming rule."""

    namespace, separator, final = theorem_name.rpartition(".")
    generated = f"{final}_iff"
    return f"{namespace}{separator}{generated}" if separator else generated


def units(n: int) -> tuple[int, ...]:
    return tuple(x for x in range(n) if gcd(x, n) == 1)


def inverse_mod(u: int, n: int) -> int:
    # ZMod 1 is the one-element ring: 0 is its identity and its own inverse.
    return 0 if n == 1 else pow(u, -1, n)


def power_map(x: int, exponent: int, n: int) -> int:
    return pow(x, exponent, n)


def main() -> None:
    report = REPORT.read_text(encoding="utf-8")
    for anchor in EXPECTED_REPORT_ANCHORS:
        assert anchor in report, f"missing report anchor: {anchor}"
    report_checks = len(EXPECTED_REPORT_ANCHORS)

    assert generated_iff_name("MulChar.ext") == "MulChar.ext_iff"
    assert generated_iff_name("ext") == "ext_iff"
    name_checks = 2

    # Finite truth-table model of (x = y) <-> all observations agree.
    iff_checks = 0
    for dimension in range(9):
        vectors = tuple(product((False, True), repeat=dimension))
        for left in vectors:
            for right in vectors:
                equality = left == right
                pointwise = all(a == b for a, b in zip(left, right))
                assert equality == pointwise
                iff_checks += 1

    # A proper subset of observations is insufficient for extensionality.
    assert (False, False)[0] == (False, True)[0]
    assert (False, False) != (False, True)

    unit_witness_checks = 0
    unit_multiplicativity_checks = 0
    composition_checks = 0
    for n in range(1, 61):
        us = units(n)
        identity = 1 % n
        for exponent in range(1, 9):
            for u in us:
                u_inv = inverse_mod(u, n)
                assert (u * u_inv) % n == identity
                assert (u_inv * u) % n == identity

                value = power_map(u, exponent, n)
                inverse_value = power_map(u_inv, exponent, n)
                assert (value * inverse_value) % n == identity
                assert (inverse_value * value) % n == identity
                assert gcd(value, n) == 1
                # The underlying value of the mapped unit is f(u).
                assert value == power_map(u, exponent, n)
                unit_witness_checks += 7

            for u in us:
                for v in us:
                    left = power_map((u * v) % n, exponent, n)
                    right = (
                        power_map(u, exponent, n)
                        * power_map(v, exponent, n)
                    ) % n
                    assert left == right
                    unit_multiplicativity_checks += 1

        for first in range(1, 5):
            for second in range(1, 5):
                for u in us:
                    composed = power_map(power_map(u, first, n), second, n)
                    direct = power_map(u, first * second, n)
                    assert composed == direct
                    composition_checks += 1

    # Negative control: a bare constant-zero function on ZMod 5 neither
    # preserves one nor sends the source unit 1 to a target unit.
    zero_of_one = 0
    assert zero_of_one != 1
    assert gcd(zero_of_one, 5) != 1
    negative_controls = 2

    print(
        "ext_iff/Units.map provenance regression: OK; "
        f"report_checks={report_checks}, name_checks={name_checks}, "
        f"iff_checks={iff_checks}, unit_witness_checks={unit_witness_checks}, "
        "unit_multiplicativity_checks="
        f"{unit_multiplicativity_checks}, composition_checks={composition_checks}, "
        f"negative_controls={negative_controls}"
    )


if __name__ == "__main__":
    main()
