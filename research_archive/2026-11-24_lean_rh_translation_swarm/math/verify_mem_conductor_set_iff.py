#!/usr/bin/env python3
"""Exact finite regression for mem_conductorSet_iff_conductor_dvd.

Values of finite unit-group characters are encoded as exponents in C_60, so
all arithmetic is exact.  This is a regression model, not a Lean proof.
"""

from __future__ import annotations

from itertools import product
from math import gcd
from pathlib import Path


ROOT_ORDER = 60


def divides(a: int, b: int) -> bool:
    return b == 0 if a == 0 else b % a == 0


def divisors(n: int) -> list[int]:
    return [d for d in range(1, n + 1) if n % d == 0]


def units(n: int) -> list[int]:
    return [a for a in range(n) if gcd(a, n) == 1]


def closure(n: int, gens: list[int]) -> set[int]:
    identity = 1 % n
    out = {identity}
    changed = True
    while changed:
        changed = False
        for x in tuple(out):
            for g in gens:
                y = x * g % n
                if y not in out:
                    out.add(y)
                    changed = True
    return out


def generators(n: int) -> list[int]:
    us = units(n)
    gs: list[int] = []
    have = closure(n, gs)
    for u in us:
        if u not in have:
            gs.append(u)
            have = closure(n, gs)
    assert have == set(us)
    return gs


def enumerate_characters(n: int) -> list[dict[int, int]]:
    """All homomorphisms U(Z/nZ) -> C_60, without floating point."""
    us = units(n)
    gs = generators(n)
    identity = 1 % n
    found: dict[tuple[int, ...], dict[int, int]] = {}
    for images in product(range(ROOT_ORDER), repeat=len(gs)):
        value = {identity: 0}
        todo = [identity]
        consistent = True
        while todo and consistent:
            x = todo.pop()
            for g, image in zip(gs, images):
                y = x * g % n
                proposed = (value[x] + image) % ROOT_ORDER
                if y in value:
                    if value[y] != proposed:
                        consistent = False
                        break
                else:
                    value[y] = proposed
                    todo.append(y)
        if not consistent or set(value) != set(us):
            continue
        if any(value[x * y % n] != (value[x] + value[y]) % ROOT_ORDER
               for x in us for y in us):
            continue
        key = tuple(value[u] for u in us)
        found[key] = value
    return list(found.values())


def factors_through(chi: dict[int, int], n: int, d: int) -> bool:
    """Exact unit-fibre form of FactorsThrough for positive d | n."""
    if not divides(d, n):
        return False
    seen: dict[int, int] = {}
    for u in units(n):
        image = u % d
        assert gcd(image, d) == 1
        if image in seen and seen[image] != chi[u]:
            return False
        seen[image] = chi[u]
    # Surjectivity of unitsMap is checked in every concrete case.
    assert set(seen) == set(units(d))
    return True


def conductor(chi: dict[int, int], n: int) -> int:
    return min(d for d in divisors(n) if factors_through(chi, n, d))


def main() -> None:
    report = Path(__file__).with_name("2026-11-25_mem_conductor_set_iff.md").read_text()
    required = [
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        "0df444a360eaa60ab8c11dca51a86af692955474",
        "4569ebb8e61f683a9c89877f0cda4d3add4d766d",
        "mem_conductorSet_iff_conductor_dvd",
        "conductor_dvd_of_mem_conductorSet",
        "FactorsThrough.mono",
        "RESUME HERE",
    ]
    for token in required:
        assert token in report

    counts = {
        "report_checks": len(required),
        "characters": 0,
        "equivalence_checks": 0,
        "mono_checks": 0,
        "surjective_fibre_checks": 0,
        "negative_controls": 0,
    }

    for n in range(1, 17):
        chars = enumerate_characters(n)
        assert chars
        for chi in chars:
            counts["characters"] += 1
            c = conductor(chi, n)
            assert divides(c, n)
            expected = {d for d in divisors(n) if divides(c, d)}
            actual = {d for d in divisors(n) if factors_through(chi, n, d)}
            assert actual == expected
            counts["equivalence_checks"] += len(divisors(n))

            # The exact upward-closure statement used by FactorsThrough.mono.
            for low in divisors(n):
                if not factors_through(chi, n, low):
                    continue
                for high in divisors(n):
                    if divides(low, high):
                        assert factors_through(chi, n, high)
                        counts["mono_checks"] += 1

            # Independent finite check of Units(Z/n) -> Units(Z/d) surjectivity.
            for d in divisors(n):
                assert {u % d for u in units(n)} == set(units(d))
                counts["surjective_fibre_checks"] += 1

    # hd : d | n cannot be dropped: conductor 1 divides 2, but level 2
    # cannot be a factor-through level of a level-5 character.
    trivial5 = {u: 0 for u in units(5)}
    assert conductor(trivial5, 5) == 1
    assert divides(1, 2) and not factors_through(trivial5, 5, 2)
    counts["negative_controls"] += 1

    # [NeZero n] is semantic, not cosmetic.  The pinned source gives conductor
    # zero at level zero, while changeLevel_one supplies a factorization of the
    # trivial level-zero character through level one; nevertheless 0 does not
    # divide 1.
    zero_level_trivial_factors_through_one = True
    assert zero_level_trivial_factors_through_one and not divides(0, 1)
    counts["negative_controls"] += 1

    # Least-natural-number information alone is weaker than divisibility.
    assert 3 <= 4 and not divides(3, 4)
    counts["negative_controls"] += 1

    print(
        "mem conductorSet iff conductor divides regression: OK; "
        + ", ".join(f"{k}={v}" for k, v in counts.items())
    )


if __name__ == "__main__":
    main()
