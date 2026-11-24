#!/usr/bin/env python3
"""Finite regression for the MulChar restriction/extension equivalence.

This checks residue-monoid models; it is not a Lean kernel replay.
"""

from __future__ import annotations

from itertools import product
from math import gcd
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPORT = HERE / "2026-11-24_mulchar_unit_equivalence.md"
RH_PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
MATHLIB_PIN = "0df444a360eaa60ab8c11dca51a86af692955474"
CURRENT_RH = "9282d3a102c4aff0e6026746db2a8990f5d9cddd"
CURRENT_MATHLIB = "31ce06eaadf4a200c0e1407c5f10953cf606b8f8"
SOURCE_BLOBS = {
    "Mathlib/NumberTheory/MulChar/Basic.lean":
        "dc3c465d304326784909c686d278edfa30a75385",
    "Mathlib/NumberTheory/DirichletCharacter/Basic.lean":
        "4569ebb8e61f683a9c89877f0cda4d3add4d766d",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/IndUnique.lean":
        "d0784c03bdc5ca1b96fdd39a5a9fbb846a63cc0e",
}
CURRENT_BLOBS = {
    "MulChar": "acae35e68481b6095d7e1c154b0015383a7fe2f9",
    "DirichletCharacter": "a954549811e3e87c5f4e85b5d37f359ddfc83a81",
}
FIVE_UNITS = (1, 2, 3, 4)


def units(n: int) -> tuple[int, ...]:
    assert n > 0
    return tuple(x for x in range(n) if gcd(x, n) == 1)


def unit_homs_to_five(n: int) -> list[dict[int, int]]:
    domain = units(n)
    one = 1 % n
    homs: list[dict[int, int]] = []
    for values in product(FIVE_UNITS, repeat=len(domain)):
        f = dict(zip(domain, values, strict=True))
        if f[one] != 1:
            continue
        if all(f[(x * y) % n] == (f[x] * f[y]) % 5
               for x in domain for y in domain):
            homs.append(f)
    return homs


def extend_by_zero(f: dict[int, int], n: int) -> tuple[int, ...]:
    domain = set(units(n))
    return tuple(f[x] if x in domain else 0 for x in range(n))


def check_report() -> int:
    text = REPORT.read_text(encoding="utf-8")
    anchors = [
        RH_PIN,
        MATHLIB_PIN,
        CURRENT_RH,
        CURRENT_MATHLIB,
        "MulChar.ext_iff",
        "MulChar.ext",
        "toUnitHom",
        "ofUnitHom",
        "equivToUnitHom",
        "ofUnitHom_coe",
        "coe_toUnitHom",
        "changeLevel_def",
        "simpa [changeLevel_def] using h z",
        "CommMonoid A",
        "CommMonoidWithZero B",
        "Nontrivial B",
        "Failed attempts / limitations",
        "RESUME HERE",
        "not a Lean kernel replay",
    ]
    anchors.extend(SOURCE_BLOBS)
    anchors.extend(SOURCE_BLOBS.values())
    anchors.extend(CURRENT_BLOBS.values())
    for anchor in anchors:
        assert anchor in text, f"missing report anchor: {anchor}"
    return len(anchors)


def check_equivalence() -> tuple[int, int, int, int]:
    hom_count = 0
    multiplicativity_checks = 0
    inverse_checks = 0
    extensionality_checks = 0
    for n in range(1, 11):
        domain = units(n)
        homs = unit_homs_to_five(n)
        hom_count += len(homs)
        chars: list[tuple[int, ...]] = []
        for f in homs:
            chi = extend_by_zero(f, n)
            chars.append(chi)
            assert chi[1 % n] == 1
            inverse_checks += 1
            for x in range(n):
                for y in range(n):
                    assert chi[(x * y) % n] == (chi[x] * chi[y]) % 5
                    multiplicativity_checks += 1
            for u in domain:
                assert chi[u] == f[u]
                inverse_checks += 1
            recovered = {u: chi[u] for u in domain}
            assert recovered == f
            assert extend_by_zero(recovered, n) == chi
            inverse_checks += 2
        for i, f in enumerate(homs):
            for j, g in enumerate(homs):
                same_on_units = all(f[u] == g[u] for u in domain)
                same_everywhere = chars[i] == chars[j]
                assert same_on_units == same_everywhere
                extensionality_checks += 1
    return hom_count, multiplicativity_checks, inverse_checks, extensionality_checks


def check_change_level_formula() -> int:
    checks = 0
    for m in range(1, 21):
        for n in range(1, m + 1):
            if m % n or n > 10:
                continue
            for f in unit_homs_to_five(n):
                source_units = set(units(m))
                composed = {z: f[z % n] for z in source_units}
                changed = extend_by_zero(composed, m)
                for z in source_units:
                    assert z % n in f
                    assert changed[z] == f[z % n]
                    checks += 2
    return checks


def check_nonunit_negative_control() -> int:
    n = 4
    principal = tuple(1 if x in units(n) else 0 for x in range(n))
    constant_one = (1, 1, 1, 1)
    for raw in (principal, constant_one):
        assert raw[1] == 1
        for x in range(n):
            for y in range(n):
                assert raw[(x * y) % n] == (raw[x] * raw[y]) % 5
    assert all(principal[u] == constant_one[u] for u in units(n))
    assert principal != constant_one
    assert principal[0] == principal[2] == 0
    assert constant_one[0] == constant_one[2] == 1
    return 2 * n * n + 4


def check_trivial_target() -> int:
    # In the one-element target monoid, zero equals one. Extensionality still holds.
    for n in range(1, 11):
        chi = tuple(0 for _ in range(n))
        for x in range(n):
            for y in range(n):
                assert chi[(x * y) % n] == 0
        assert all(chi[u] == 0 for u in units(n))
    return sum(n * n + len(units(n)) for n in range(1, 11))


def main() -> None:
    homs, mul, inv, ext = check_equivalence()
    counts = {
        "report_checks": check_report(),
        "unit_homs": homs,
        "multiplicativity_checks": mul,
        "inverse_checks": inv,
        "extensionality_checks": ext,
        "change_level_checks": check_change_level_formula(),
        "negative_control_checks": check_nonunit_negative_control(),
        "trivial_target_checks": check_trivial_target(),
    }
    summary = ", ".join(f"{name}={count}" for name, count in counts.items())
    print(f"MulChar unit-equivalence regression: OK; {summary}")


if __name__ == "__main__":
    main()
