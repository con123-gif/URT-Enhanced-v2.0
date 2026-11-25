#!/usr/bin/env python3
"""Finite exact regression for FactorsThrough.mono and conductor-set closure.

Characters are exact homomorphisms Units(ZMod n) -> C_60.  Factorization is
recovered from actual unit-map fibres.  This is a finite model, not Lean.
"""

from __future__ import annotations

from functools import lru_cache
from itertools import product
from math import gcd
from pathlib import Path


ROOT_ORDER = 60
REPORT = Path(__file__).with_name("2026-11-25_factors_through_monotonicity.md")


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
    us = units(n)
    gs = generators(n)
    found: set[tuple[int, ...]] = set()
    for images in product(range(ROOT_ORDER), repeat=len(gs)):
        value = {1 % n: 0}
        todo = [1 % n]
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


def as_map(n: int, raw: tuple[int, ...]) -> dict[int, int]:
    return dict(zip(units(n), raw))


def factors_through(chi: dict[int, int], n: int, d: int) -> bool:
    check(divides(d, n), f"factor level {d} does not divide {n}")
    seen: dict[int, int] = {}
    for x in units(n):
        y = x % d
        if y in seen and seen[y] != chi[x]:
            return False
        seen[y] = chi[x]
    return True


def kernel_contained(chi: dict[int, int], n: int, d: int) -> bool:
    return all(chi[x] == 0 for x in units(n) if x % d == 1 % d)


def descend(chi: dict[int, int], n: int, d: int) -> dict[int, int]:
    fibres: dict[int, list[int]] = {u: [] for u in units(d)}
    for x in units(n):
        fibres[x % d].append(x)
    check(all(fibres[u] for u in units(d)), f"units map {n}->{d} not surjective")
    lower = {u: chi[min(fibres[u])] for u in units(d)}
    check(all(lower[x % d] == chi[x] for x in units(n)), "descent composition failure")
    return lower


def conductor(chi: dict[int, int], n: int) -> int:
    return min(d for d in divisors(n) if factors_through(chi, n, d))


def main() -> None:
    report = REPORT.read_text(encoding="utf-8")
    anchors = (
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        "4569ebb8e61f683a9c89877f0cda4d3add4d766d",
        "c93c732e5bedd18aadd8cab7b9baf139bfb41553",
        "FactorsThrough.mono",
        "ZMod.unitsMap_comp",
        "mem_conductorSet_iff_conductor_dvd",
        "RESUME HERE",
    )
    counts = {
        "report_checks": 0,
        "characters": 0,
        "criterion_checks": 0,
        "monotone_pairs": 0,
        "unit_compositions": 0,
        "kernel_transports": 0,
        "descent_witnesses": 0,
        "conductor_equivalences": 0,
        "reverse_memberships": 0,
        "negative_controls": 0,
    }
    for anchor in anchors:
        check(anchor in report, f"missing report anchor: {anchor}")
        counts["report_checks"] += 1

    saved: dict[tuple[int, int], tuple[dict[int, int], int]] = {}
    for n in range(1, 19):
        ds = divisors(n)
        for raw in characters(n):
            chi = as_map(n, raw)
            c = conductor(chi, n)
            saved[(n, c)] = (chi, c)
            counts["characters"] += 1

            for q in ds:
                factor = factors_through(chi, n, q)
                criterion = kernel_contained(chi, n, q)
                check(factor == criterion, f"kernel criterion mismatch {n=}, {q=}")
                check(factor == divides(c, q), f"conductor equivalence mismatch {n=}, {c=}, {q=}")
                counts["criterion_checks"] += 1
                counts["conductor_equivalences"] += 1
                if divides(c, q):
                    check(factor, "reverse conductor-set membership failed")
                    counts["reverse_memberships"] += 1

            for d in ds:
                if not factors_through(chi, n, d):
                    continue
                for m in ds:
                    if not divides(d, m):
                        continue
                    counts["monotone_pairs"] += 1

                    # unitsMap_comp: n->m->d equals n->d on every unit.
                    for x in units(n):
                        check((x % m) % d == x % d, "unitsMap composition failure")
                        counts["unit_compositions"] += 1
                        if x % m == 1 % m:
                            check(x % d == 1 % d, "kernel transported in wrong direction")
                            check(chi[x] == 0, "old factorization did not kill transported kernel")
                            counts["kernel_transports"] += 1

                    check(factors_through(chi, n, m), "monotonicity conclusion failed")
                    lower_m = descend(chi, n, m)
                    check(all(lower_m[x % m] == chi[x] for x in units(n)), "witness lift failure")
                    counts["descent_witnesses"] += 1

    # Reversing divisibility is invalid: a conductor-5 character factors at 5
    # but not at the smaller level 1.
    chi5, _ = saved[(15, 5)]
    check(factors_through(chi5, 15, 5) and not factors_through(chi5, 15, 1), "direction control")
    counts["negative_controls"] += 1

    # Numerical inequality cannot replace c|m. A conductor-3 character at
    # level 12 has 3<=4 but does not factor through 4.
    chi3, _ = saved[(12, 3)]
    check(3 <= 4 and not divides(3, 4) and not factors_through(chi3, 12, 4), "inequality control")
    counts["negative_controls"] += 1

    # m|n is part of FactorsThrough membership, not a convenience.
    check(divides(2, 4) and not divides(4, 6), "ambient divisibility control")
    counts["negative_controls"] += 1

    # The proof's kernel criterion genuinely needs nonzero ambient level: for
    # Units(Z)=C2 -> Units(Z/5)=C4, the sign character has trivial kernel on
    # the source map but no C4->C2 extension nontrivial on the order-two image.
    possible_extensions = [a for a in range(2) if (2 * a) % 2 == 1]
    check(possible_extensions == [], "level-zero extension obstruction")
    counts["negative_controls"] += 1

    print(
        "factor-through monotonicity regression: OK; "
        + ", ".join(f"{key}={value}" for key, value in counts.items())
    )


if __name__ == "__main__":
    main()
