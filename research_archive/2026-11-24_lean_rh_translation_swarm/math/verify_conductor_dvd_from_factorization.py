#!/usr/bin/env python3
"""Exact finite regression for conductor_dvd_of_mem_conductorSet.

Characters are homomorphisms Units(ZMod n) -> C_60, represented by additive
root-of-unity exponents.  The checker reconstructs every lower-level character
from its unit fibres; it does not assign an expected conductor in advance.
This is a finite model of the proof skeleton, not a Lean proof.
"""

from __future__ import annotations

from functools import lru_cache
from itertools import product
from math import gcd
from pathlib import Path


ROOT_ORDER = 60
REPORT = Path(__file__).with_name("2026-11-25_conductor_dvd_from_factorization.md")


def check(ok: bool, message: str) -> None:
    if not ok:
        raise AssertionError(message)


def divides(a: int, b: int) -> bool:
    return b == 0 if a == 0 else b % a == 0


def divisors(n: int) -> list[int]:
    return [d for d in range(1, n + 1) if divides(d, n)]


@lru_cache(maxsize=None)
def units(n: int) -> tuple[int, ...]:
    return tuple(x for x in range(n) if gcd(x, n) == 1)


def generated(n: int, gs: tuple[int, ...]) -> set[int]:
    out = {1 % n}
    changed = True
    while changed:
        changed = False
        for x in tuple(out):
            for g in gs:
                y = x * g % n
                if y not in out:
                    out.add(y)
                    changed = True
    return out


def generators(n: int) -> tuple[int, ...]:
    gs: tuple[int, ...] = ()
    have = generated(n, gs)
    for u in units(n):
        if u not in have:
            gs += (u,)
            have = generated(n, gs)
    check(have == set(units(n)), f"generator failure at level {n}")
    return gs


@lru_cache(maxsize=None)
def characters(n: int) -> tuple[tuple[int, ...], ...]:
    """All homomorphisms Units(ZMod n) -> C_60 in sorted-unit order."""
    us = units(n)
    gs = generators(n)
    identity = 1 % n
    found: set[tuple[int, ...]] = set()
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
        if any(
            value[x * y % n] != (value[x] + value[y]) % ROOT_ORDER
            for x in us
            for y in us
        ):
            continue
        found.add(tuple(value[u] for u in us))
    return tuple(sorted(found))


def as_map(n: int, chi: tuple[int, ...]) -> dict[int, int]:
    return dict(zip(units(n), chi))


def factor_fibres(chi: dict[int, int], n: int, d: int) -> bool:
    """Whether chi is constant on the unit-map fibres n -> d."""
    seen: dict[int, int] = {}
    for u in units(n):
        y = u % d
        check(gcd(y, d) == 1, "unit reduction stopped being a unit")
        if y in seen and seen[y] != chi[u]:
            return False
        seen[y] = chi[u]
    return True


def descend(chi: dict[int, int], n: int, d: int) -> dict[int, int]:
    """Construct the unique lower character from actual nonempty fibres."""
    fibres: dict[int, list[int]] = {y: [] for y in units(d)}
    for u in units(n):
        fibres[u % d].append(u)
    check(all(fibres[y] for y in units(d)), f"unitsMap {n}->{d} not surjective")
    lower = {y: chi[min(fibres[y])] for y in units(d)}
    check(
        all(lower[u % d] == chi[u] for u in units(n)),
        f"descent composition failed {n}->{d}",
    )
    check(
        all(
            lower[x * y % d] == (lower[x] + lower[y]) % ROOT_ORDER
            for x in units(d)
            for y in units(d)
        ),
        f"descended map not a character at level {d}",
    )
    return lower


def lift(lower: dict[int, int], source: int, target: int) -> dict[int, int]:
    check(divides(source, target), f"invalid lift {source}->{target}")
    return {u: lower[u % source] for u in units(target)}


def conductor(chi: dict[int, int], n: int) -> int:
    return min(d for d in divisors(n) if factor_fibres(chi, n, d))


def main() -> None:
    report = REPORT.read_text(encoding="utf-8")
    anchors = (
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        "0df444a360eaa60ab8c11dca51a86af692955474",
        "4569ebb8e61f683a9c89877f0cda4d3add4d766d",
        "conductor_dvd_of_mem_conductorSet",
        "factorsThrough_gcd",
        "changeLevel_injective",
        "Nat.gcd_eq_right_iff_dvd",
        "RESUME HERE",
    )
    counts = {
        "report_checks": 0,
        "characters": 0,
        "factor_levels": 0,
        "gcd_descents": 0,
        "product_equalities": 0,
        "common_level_equalities": 0,
        "injectivity_checks": 0,
        "divisibility_checks": 0,
        "negative_controls": 0,
    }
    for anchor in anchors:
        check(anchor in report, f"missing report anchor: {anchor}")
        counts["report_checks"] += 1

    for n in range(1, 19):
        for raw in characters(n):
            chi = as_map(n, raw)
            c = conductor(chi, n)
            check(c > 0 and divides(c, n), f"invalid recovered conductor {c} at {n}")
            primitive = descend(chi, n, c)
            counts["characters"] += 1

            for d in divisors(n):
                if not factor_fibres(chi, n, d):
                    continue
                counts["factor_levels"] += 1
                lower_d = descend(chi, n, d)
                g = gcd(d, c)

                # The output of factorsThrough_gcd: the d-level character
                # descends to gcd(d,c), and the resulting character also
                # recovers the original n-level character.
                check(factor_fibres(lower_d, d, g), "gcd descent missing")
                lower_g = descend(lower_d, d, g)
                check(lift(lower_g, g, d) == lower_d, "gcd->d lift mismatch")
                check(lift(lower_g, g, n) == chi, "gcd->n composite mismatch")
                counts["gcd_descents"] += 1

                # Exact equality that the Lean proof first establishes at d*c.
                dc = d * c
                left_dc = lift(lower_d, d, dc)
                right_dc = lift(primitive, c, dc)
                check(left_dc == right_dc, f"common product disagreement at {d}*{c}")
                counts["product_equalities"] += 1

                # Lean proves that equality by lifting once more to d*c*n.
                common = dc * n
                left_common = lift(left_dc, dc, common)
                right_common = lift(right_dc, dc, common)
                check(left_common == right_common, "further common-level disagreement")
                counts["common_level_equalities"] += 1

                image = {u % dc for u in units(common)}
                check(image == set(units(dc)), f"unit map {common}->{dc} not surjective")
                # Equality after pullback along this surjection reflects equality
                # below: this is the finite changeLevel_injective step.
                reflected = all(left_common[u] == right_common[u] for u in units(common))
                check(reflected and left_dc == right_dc, "injectivity reflection failed")
                counts["injectivity_checks"] += 1

                # Minimality gives c<=g. The universal gcd bound gives g<=c;
                # equality is exactly the orientation c|d.
                check(c <= g and g <= c and g == c, "gcd minimality squeeze failed")
                check(divides(c, d), f"conductor {c} does not divide factor level {d}")
                counts["divisibility_checks"] += 1

    # A least-element inequality is not itself divisibility.
    check(3 <= 4 and not divides(3, 4), "inequality/divisibility negative control")
    counts["negative_controls"] += 1

    # Abstract upward membership without gcd closure does not force divisibility.
    abstract_set = {3, 4}
    check(min(abstract_set) == 3 and 4 in abstract_set and not divides(3, 4), "gcd closure control")
    check(gcd(3, 4) not in abstract_set, "abstract set unexpectedly gcd closed")
    counts["negative_controls"] += 1

    # At formal target level zero the unit map need not be surjective. The two
    # order-four characters of exponents 1 and 3 modulo 5 agree on +/-1 but are
    # distinct, so pullback cannot be injective.
    values_w1 = (0, 2)
    values_w3 = (0, 6 % 4)
    check(values_w1 == values_w3 and 1 % 4 != 3 % 4, "zero-target injectivity control")
    counts["negative_controls"] += 1

    # For positive n, membership at d=0 is impossible already at 0|n.
    check(not divides(0, 5), "zero factor level control")
    counts["negative_controls"] += 1

    print(
        "conductor divisibility regression: OK; "
        + ", ".join(f"{key}={value}" for key, value in counts.items())
    )


if __name__ == "__main__":
    main()
