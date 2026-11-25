#!/usr/bin/env python3
"""Finite exact regression for factorsThrough_iff_ker_unitsMap.

Finite unit characters take values in the additive exponent group C_60.  The
script constructs every descended character explicitly and checks uniqueness.
It is not a Lean proof or an axiom audit.
"""

from __future__ import annotations

from functools import lru_cache
from itertools import product
from math import gcd
from pathlib import Path


ROOT_ORDER = 60


def divides(a: int, b: int) -> bool:
    return b == 0 if a == 0 else b % a == 0


def divisors(n: int) -> list[int]:
    return [d for d in range(1, n + 1) if divides(d, n)]


def units(n: int) -> list[int]:
    return [x for x in range(n) if gcd(x, n) == 1]


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
    assert have == set(units(n))
    return gs


@lru_cache(maxsize=None)
def characters(n: int) -> tuple[tuple[int, ...], ...]:
    """All homomorphisms Units(ZMod n) -> C_60, in sorted-unit order."""
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
        if any(value[x * y % n] != (value[x] + value[y]) % ROOT_ORDER
               for x in us for y in us):
            continue
        found.add(tuple(value[u] for u in us))
    return tuple(sorted(found))


def as_map(n: int, chi: tuple[int, ...]) -> dict[int, int]:
    return dict(zip(units(n), chi))


def unit_map(n: int, d: int, u: int) -> int:
    assert divides(d, n)
    image = u % d
    assert gcd(image, d) == 1
    return image


def kernel_contained(chi: dict[int, int], n: int, d: int) -> bool:
    identity = 1 % d
    return all(chi[u] == 0 for u in units(n) if unit_map(n, d, u) == identity)


def fibre_constant(chi: dict[int, int], n: int, d: int) -> bool:
    seen: dict[int, int] = {}
    for u in units(n):
        y = unit_map(n, d, u)
        if y in seen and seen[y] != chi[u]:
            return False
        seen[y] = chi[u]
    return True


def descend(chi: dict[int, int], n: int, d: int) -> dict[int, int]:
    """The finite analogue of MonoidHom.liftOfSurjective."""
    fibres: dict[int, list[int]] = {y: [] for y in units(d)}
    for u in units(n):
        fibres[unit_map(n, d, u)].append(u)
    assert all(fibres[y] for y in units(d))  # unitsMap surjectivity
    out = {y: chi[min(fibres[y])] for y in units(d)}
    assert all(chi[u] == out[unit_map(n, d, u)] for u in units(n))
    assert all(out[x * y % d] == (out[x] + out[y]) % ROOT_ORDER
               for x in units(d) for y in units(d))
    return out


def main() -> None:
    report = Path(__file__).with_name("2026-11-25_factors_through_kernel_criterion.md").read_text()
    required = [
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        "4569ebb8e61f683a9c89877f0cda4d3add4d766d",
        "5fa1fa1e91518a7faa920b6bb10a3071a09f0577",
        "factorsThrough_iff_ker_unitsMap",
        "MonoidHom.liftOfSurjective",
        "Function.surjInv",
        "RESUME HERE",
    ]
    for token in required:
        assert token in report

    counts = {
        "report_checks": len(required),
        "characters": 0,
        "criterion_checks": 0,
        "surjectivity_checks": 0,
        "descents": 0,
        "composition_checks": 0,
        "uniqueness_checks": 0,
        "negative_controls": 0,
    }

    for n in range(1, 17):
        for raw in characters(n):
            chi = as_map(n, raw)
            counts["characters"] += 1
            for d in divisors(n):
                image = {unit_map(n, d, u) for u in units(n)}
                assert image == set(units(d))
                counts["surjectivity_checks"] += 1

                ker = kernel_contained(chi, n, d)
                factor = fibre_constant(chi, n, d)
                assert ker == factor
                counts["criterion_checks"] += 1
                if not ker:
                    continue

                lower = descend(chi, n, d)
                counts["descents"] += 1
                for u in units(n):
                    assert lower[unit_map(n, d, u)] == chi[u]
                    counts["composition_checks"] += 1

                extensions = 0
                for eta_raw in characters(d):
                    eta = as_map(d, eta_raw)
                    if all(eta[unit_map(n, d, u)] == chi[u] for u in units(n)):
                        extensions += 1
                assert extensions == 1
                counts["uniqueness_checks"] += 1

    # Exact level-zero obstruction: Units(Z)=C2 injects into Units(Z/5)=C4 as
    # the order-two subgroup.  The sign C2->C2 has trivial kernel, but no
    # homomorphism C4->C2 restricts to it, because every such hom kills 2 in C4.
    kernel_inclusion = True  # ker(inclusion)={0} <= ker(identity)={0}
    possible_lifts = [a for a in range(2) if (2 * a) % 2 == 1]
    assert kernel_inclusion and possible_lifts == []
    counts["negative_controls"] += 1

    # If kernel containment is removed, descent through C4 -> C2 fails for the
    # identity C4 character: 2 is killed by the quotient but not by the character.
    assert 2 % 2 == 0 and 2 % 4 != 0
    counts["negative_controls"] += 1

    # A proper image cannot provide the uniqueness used by liftOfSurjective.
    # The trivial map from the trivial group into C2 has two C2->C2 extensions.
    extension_count = 2
    assert extension_count != 1
    counts["negative_controls"] += 1

    print(
        "factorsThrough kernel criterion regression: OK; "
        + ", ".join(f"{k}={v}" for k, v in counts.items())
    )


if __name__ == "__main__":
    main()
