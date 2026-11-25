#!/usr/bin/env python3
"""Exact finite regression for DirichletCharacter.factorsThrough_gcd.

Characters take values in the additive exponent group C_60.  Positive levels
use Units(ZMod n); formal level zero uses Units(Z)=±1.  Every CRT witness is
constructed by exhaustive exact congruence search.  This is not a Lean proof.
"""

from __future__ import annotations

from functools import lru_cache
from itertools import product
from math import gcd
from pathlib import Path


ROOT_ORDER = 60
REPORT = Path(__file__).with_name("2026-11-25_factors_through_gcd_crt.md")


def check(ok: bool, message: str) -> None:
    if not ok:
        raise AssertionError(message)


def divides(a: int, b: int) -> bool:
    return b == 0 if a == 0 else b % a == 0


@lru_cache(maxsize=None)
def units(n: int) -> tuple[int, ...]:
    if n == 0:
        return (-1, 1)
    return tuple(x for x in range(n) if gcd(x, n) == 1)


def identity(n: int) -> int:
    return 1 if n == 0 else 1 % n


def mul(n: int, x: int, y: int) -> int:
    return x * y if n == 0 else x * y % n


def reduce_unit(u: int, source: int, target: int) -> int:
    check(divides(target, source), f"invalid unit reduction {source}->{target}")
    if target == 0:
        check(source == 0 and u in (-1, 1), "invalid unit at formal level zero")
        return u
    return u % target


def generated(n: int, gs: tuple[int, ...]) -> set[int]:
    out = {identity(n)}
    changed = True
    while changed:
        changed = False
        for x in tuple(out):
            for g in gs:
                y = mul(n, x, g)
                if y not in out:
                    out.add(y)
                    changed = True
    return out


def generators(n: int) -> tuple[int, ...]:
    if n == 0:
        return (-1,)
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
    """All homomorphisms Units(ZMod n) -> C_60 in units(n) order."""
    us = units(n)
    gs = generators(n)
    found: set[tuple[int, ...]] = set()
    for images in product(range(ROOT_ORDER), repeat=len(gs)):
        value = {identity(n): 0}
        todo = [identity(n)]
        consistent = True
        while todo and consistent:
            x = todo.pop()
            for g, image in zip(gs, images):
                y = mul(n, x, g)
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
            value[mul(n, x, y)] != (value[x] + value[y]) % ROOT_ORDER
            for x in us
            for y in us
        ):
            continue
        found.add(tuple(value[u] for u in us))
    return tuple(sorted(found))


def as_map(n: int, raw: tuple[int, ...]) -> dict[int, int]:
    return dict(zip(units(n), raw))


def lift(lower: dict[int, int], source: int, target: int) -> dict[int, int]:
    check(divides(source, target), f"invalid character lift {source}->{target}")
    return {u: lower[reduce_unit(u, target, source)] for u in units(target)}


def factors_through(chi: dict[int, int], n: int, d: int) -> bool:
    check(n > 0 and d > 0 and divides(d, n), "positive factor levels required")
    seen: dict[int, int] = {}
    for u in units(n):
        y = u % d
        if y in seen and seen[y] != chi[u]:
            return False
        seen[y] = chi[u]
    return True


def descend(chi: dict[int, int], n: int, d: int) -> dict[int, int]:
    fibres: dict[int, list[int]] = {u: [] for u in units(d)}
    for u in units(n):
        fibres[u % d].append(u)
    check(all(fibres[u] for u in units(d)), f"units map {n}->{d} not surjective")
    lower = {u: chi[min(fibres[u])] for u in units(d)}
    check(all(lower[x % d] == chi[x] for x in units(n)), "descent composition failure")
    return lower


def crt_witness(n: int, m: int, x: int) -> int | None:
    """Find z=x mod n and z=1 mod m, including the formal modulus m=0."""
    if m == 0:
        return 1 if 1 % n == x else None
    for z in range(n * m):
        if z % n == x and z % m == 1 % m:
            return z
    return None


def signature(chi: dict[int, int], source: int, target: int) -> tuple[int, ...]:
    lifted = lift(chi, source, target)
    return tuple(lifted[u] for u in units(target))


def main() -> None:
    report = REPORT.read_text(encoding="utf-8")
    anchors = (
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        "4569ebb8e61f683a9c89877f0cda4d3add4d766d",
        "1ffd68b0527a5bd6d04b77b323b024bc9c0aba83",
        "9049c491aa452af92b1833707270bc914c7d0d4e",
        "factorsThrough_gcd",
        "Nat.chineseRemainder'",
        "changeLevel_eq_cast_of_dvd",
        "RESUME HERE",
    )
    counts = {
        "report_checks": 0,
        "level_pairs": 0,
        "common_lift_pairs": 0,
        "kernel_units": 0,
        "crt_witnesses": 0,
        "coprimality_checks": 0,
        "evaluation_chains": 0,
        "gcd_factorizations": 0,
        "zero_second_level_pairs": 0,
        "negative_controls": 0,
    }
    for anchor in anchors:
        check(anchor in report, f"missing report anchor: {anchor}")
        counts["report_checks"] += 1

    for n in range(1, 15):
        for m in range(0, 15):
            target = n * m
            g = gcd(n, m)
            counts["level_pairs"] += 1

            psi_by_signature: dict[tuple[int, ...], list[dict[int, int]]] = {}
            for psi_raw in characters(m):
                psi = as_map(m, psi_raw)
                psi_by_signature.setdefault(signature(psi, m, target), []).append(psi)

            for chi_raw in characters(n):
                chi = as_map(n, chi_raw)
                sig = signature(chi, n, target)
                for psi in psi_by_signature.get(sig, []):
                    counts["common_lift_pairs"] += 1
                    if m == 0:
                        counts["zero_second_level_pairs"] += 1

                    # This is the exact kernel used by the source criterion.
                    kernel = [x for x in units(n) if x % g == identity(g)]
                    for x in kernel:
                        counts["kernel_units"] += 1
                        z = crt_witness(n, m, x)
                        check(z is not None, f"CRT witness missing for {n=}, {m=}, {x=}")
                        assert z is not None
                        check(z % n == x, "first CRT residue failure")
                        if m == 0:
                            check(z == 1, "level-zero equality is integer equality")
                        else:
                            check(z % m == identity(m), "second CRT residue failure")
                        counts["crt_witnesses"] += 1

                        check(gcd(z, n) == 1, "CRT witness not coprime to n")
                        check(gcd(z, m) == 1, "CRT witness not coprime to m")
                        check(gcd(z, target) == 1, "CRT witness not a unit at n*m")
                        counts["coprimality_checks"] += 3

                        u = z if target == 0 else z % target
                        left = lift(chi, n, target)[u]
                        right = lift(psi, m, target)[u]
                        check(left == right, "hypothesis equality failed at CRT unit")
                        check(left == chi[x], "first changeLevel evaluation failed")
                        check(right == psi[identity(m)], "second changeLevel evaluation failed")
                        check(psi[identity(m)] == 0 and chi[x] == 0, "kernel conclusion failed")
                        counts["evaluation_chains"] += 1

                    check(factors_through(chi, n, g), "first character does not factor through gcd")
                    lower = descend(chi, n, g)
                    check(lift(lower, g, n) == chi, "gcd witness does not recover first character")
                    counts["gcd_factorizations"] += 1

    # Without the kernel congruence, the two CRT residues may be inconsistent.
    check(crt_witness(5, 10, 2) is None, "nonkernel CRT control")
    counts["negative_controls"] += 1

    # Without equality of the two common lifts, a nontrivial mod-5 character
    # need not factor through gcd(5,2)=1.
    nontrivial5 = next(as_map(5, raw) for raw in characters(5) if any(raw))
    trivial2 = as_map(2, characters(2)[0])
    check(not factors_through(nontrivial5, 5, 1), "omitted-hypothesis factor control")
    check(signature(nontrivial5, 5, 10) != signature(trivial2, 2, 10), "common-lift control")
    counts["negative_controls"] += 1

    # The second congruence is what changes the second evaluation to map_one.
    nontrivial_m5 = nontrivial5
    check(nontrivial_m5[2] != nontrivial_m5[identity(5)], "map_one residue control")
    counts["negative_controls"] += 1

    # ZMod 0 is the integers, whose units are ±1; treating range(0) as its unit
    # set would make the zero-level equality hypothesis vacuous.
    check(units(0) == (-1, 1) and len(characters(0)) == 2, "formal level-zero control")
    counts["negative_controls"] += 1

    print(
        "factorsThrough_gcd CRT regression: OK; "
        + ", ".join(f"{key}={value}" for key, value in counts.items())
    )


if __name__ == "__main__":
    main()
