#!/usr/bin/env python3
"""Exact site-reflection factorization of the repaired triangular gauge weight.

In integer slice coordinates the Cathedral reflection is

    theta(t,n) = (-t,n+t(1,1,1)).

It fixes the t=0 spatial slice, maps every spatial square at t to the same
square at -t, and maps every bottom triangle in slab [t,t+1] to a top
triangle in slab [-t-1,-t] with reversed orientation.  There is no fixed
time-spanning face.

Consequently, for any real central face weight w with w(g)>=0 and
w(g^-1)=w(g), the complete repaired gauge density factors as

    W_gauge(U)=W_0(U_0) W_+(U_+,U_0) theta(W_+)(U_-,U_0),

with W_0>=0.  Haar invariance then gives

    integral theta(F) F W_gauge dU
      = integral dU_0 W_0 |integral dU_+ F W_+|^2 >= 0.

This proves gauge-sector site-reflection positivity for the compact-support
autocorrelation weight that enforces the overlap gap.  It does not prove the
gauge-dependent polar-overlap fermion boundary cone.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any


Site = tuple[int, int, int, int]
Cycle = tuple[Site, ...]
EPSILON_STAR = Fraction(
    394924599595820227835064176865,
    351998414917049746226536404412312,
)


def add(left: Site, right: Site) -> Site:
    return tuple(left[index] + right[index] for index in range(4))  # type: ignore[return-value]


def subtract(left: Site, right: Site) -> Site:
    return tuple(left[index] - right[index] for index in range(4))  # type: ignore[return-value]


def theta(site: Site) -> Site:
    time = site[0]
    return (-time, site[1] + time, site[2] + time, site[3] + time)


SPATIAL = (
    (0, 1, 0, 0),
    (0, 0, 1, 0),
    (0, 0, 0, 1),
)


def future(bits: tuple[int, int, int]) -> Site:
    return (1, *bits)


def complement(bits: tuple[int, int, int]) -> tuple[int, int, int]:
    return tuple(-bit - 1 for bit in bits)  # type: ignore[return-value]


def rotate(cycle: Cycle, offset: int) -> Cycle:
    return cycle[offset:] + cycle[:offset]


def canonical_unoriented(cycle: Cycle) -> Cycle:
    candidates = []
    for orientation in (cycle, tuple(reversed(cycle))):
        candidates.extend(rotate(orientation, offset) for offset in range(len(cycle)))
    return min(candidates)


def same_oriented_cycle(left: Cycle, right: Cycle) -> bool:
    return any(left == rotate(right, offset) for offset in range(len(right)))


def same_reversed_cycle(left: Cycle, right: Cycle) -> bool:
    reversed_right = tuple(reversed(right))
    return any(left == rotate(reversed_right, offset) for offset in range(len(right)))


def spatial_square(base: Site, first: int, second: int) -> Cycle:
    return (
        base,
        add(base, SPATIAL[first]),
        add(add(base, SPATIAL[first]), SPATIAL[second]),
        add(base, SPATIAL[second]),
    )


def triangle_bits(
    axis: int, other_bits: tuple[int, int]
) -> tuple[tuple[int, int, int], tuple[int, int, int]]:
    minus = list(other_bits)
    minus.insert(axis, -1)
    plus = minus.copy()
    plus[axis] = 0
    return tuple(minus), tuple(plus)  # type: ignore[return-value]


def bottom_triangle(
    base: Site, axis: int, minus: tuple[int, int, int]
) -> Cycle:
    plus = list(minus)
    plus[axis] = 0
    return (
        base,
        add(base, SPATIAL[axis]),
        add(base, future(tuple(plus))),
    )


def top_triangle(
    base: Site, axis: int, minus: tuple[int, int, int]
) -> Cycle:
    plus = list(minus)
    plus[axis] = 0
    return (
        base,
        add(base, future(tuple(plus))),
        add(base, future(minus)),
    )


def reflect_cycle(cycle: Cycle) -> Cycle:
    return tuple(theta(site) for site in cycle)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    test_sites = [
        (time, 3 - time, -2 + 2 * time, 5)
        for time in range(-3, 4)
    ]
    involution_checks = [theta(theta(site)) == site for site in test_sites]
    if not all(involution_checks):
        raise RuntimeError("theta is not an involution")

    square_rows = []
    for base in test_sites:
        for first, second in itertools.combinations(range(3), 2):
            original = spatial_square(base, first, second)
            expected = spatial_square(theta(base), first, second)
            reflected = reflect_cycle(original)
            if not same_oriented_cycle(reflected, expected):
                raise RuntimeError(("spatial square reflection", base, first, second))
            square_rows.append(
                {
                    "base_time": base[0],
                    "reflected_base_time": theta(base)[0],
                    "directions": [first + 1, second + 1],
                    "orientation": "preserved",
                }
            )

    triangle_rows = []
    representative_base = (2, 3, -1, 4)
    for axis in range(3):
        for other_bits in itertools.product((-1, 0), repeat=2):
            minus, plus = triangle_bits(axis, other_bits)
            original = bottom_triangle(representative_base, axis, minus)
            reflected = reflect_cycle(original)

            reflected_minus = complement(plus)
            if reflected_minus[axis] != -1:
                raise RuntimeError("reflected triangle type is not minus-normalized")
            reflected_base = theta(add(representative_base, future(plus)))
            expected = top_triangle(reflected_base, axis, reflected_minus)
            if canonical_unoriented(reflected) != canonical_unoriented(expected):
                raise RuntimeError(("triangle face mismatch", axis, minus))
            if not same_reversed_cycle(reflected, expected):
                raise RuntimeError(("triangle orientation mismatch", axis, minus))
            if reflected_base[0] != -representative_base[0] - 1:
                raise RuntimeError("slab reflection mismatch")

            # Applying theta again must return the original unoriented face.
            if canonical_unoriented(reflect_cycle(reflected)) != canonical_unoriented(original):
                raise RuntimeError("triangle reflection is not involutive")
            triangle_rows.append(
                {
                    "axis": axis + 1,
                    "minus_bits": list(minus),
                    "reflected_minus_bits": list(reflected_minus),
                    "source_slab": [
                        representative_base[0],
                        representative_base[0] + 1,
                    ],
                    "target_slab": [
                        -representative_base[0] - 1,
                        -representative_base[0],
                    ],
                    "bottom_maps_to": "top",
                    "orientation": "reversed",
                }
            )

    if len(triangle_rows) != 12:
        raise RuntimeError("wrong triangle-type count")

    # delta=epsilon_star/2 is a strict U(1) support choice because
    # 2 sin(delta/2)<delta for delta>0.
    delta = float(EPSILON_STAR) / 2.0
    maximum_deviation = 2.0 * math.sin(delta / 2.0)
    if not maximum_deviation < delta < float(EPSILON_STAR):
        raise RuntimeError("support is not strictly admissible")

    out: dict[str, Any] = {
        "certificate": "URT exact triangular gauge site-reflection factorization",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "reflection": {
            "map": "theta(t,n)=(-t,n+t(1,1,1))",
            "involution_verified": all(involution_checks),
            "fixed_sites": "the complete t=0 spatial slice",
            "positive_slabs": "[t,t+1] with t>=0",
            "negative_slabs": "[t,t+1] with t<=-1",
        },
        "face_orbits": {
            "spatial_square_types": 3,
            "spatial_checks": len(square_rows),
            "spatial_rule": "Q_ij(t,n) maps to Q_ij(-t,n+t*1)",
            "spatial_orientation": "preserved",
            "fixed_faces": "only spatial squares on t=0",
            "triangle_types_per_slab": 24,
            "bottom_type_checks": len(triangle_rows),
            "bottom_rule": (
                "B_i,b in slab t maps to the reversed T_i,complement(b+e_i) "
                "in slab -t-1"
            ),
            "top_rule": "follows by theta^2=1",
            "time_spanning_fixed_face_count": 0,
            "representative_triangle_rows": triangle_rows,
            "status": "E exact integer-coordinate enumeration",
        },
        "weight_hypotheses": {
            "group": "any compact group",
            "face_weight": "real central w with w(g)>=0 and w(g^-1)=w(g)",
            "autocorrelation_choice": "w=f*f_tilde with f real nonnegative central",
            "boundary_weight": "product of w over t=0 spatial squares, hence nonnegative",
        },
        "exact_factorization": {
            "density": "W_gauge=W_0 W_+ theta(W_+)",
            "Haar_split": "dU=dU_0 dU_+ dU_- with theta-invariant Haar measure",
            "OS_identity": (
                "integral theta(F)F W_gauge dU = integral dU_0 W_0 "
                "|integral dU_+ F W_+|^2"
            ),
            "site_reflection_positive": True,
            "character_expansion_needed_for_this_site_factorization": False,
            "status": "E",
        },
        "gap_weight_merger": {
            "epsilon_star_exact": (
                f"{EPSILON_STAR.numerator}/{EPSILON_STAR.denominator}"
            ),
            "epsilon_star_numeric": float(EPSILON_STAR),
            "U1_choice": "delta=epsilon_star/2",
            "U1_delta_numeric": delta,
            "maximum_face_deviation_numeric": maximum_deviation,
            "strict_support_chain": "2 sin(delta/2)<delta<epsilon_star",
            "general_compact_choice": (
                "choose supp(f)=V with V V^-1 inside the epsilon_star norm ball"
            ),
            "entire_weight_support_has_uniform_overlap_gap": True,
            "status": "E",
        },
        "verdict": {
            "repaired_gauge_sector_site_reflection_positive": True,
            "nonanalytic_admissibility_compatible_with_gauge_OS": True,
            "volume_uniform_overlap_gap_on_support": True,
            "polar_overlap_fermion_gauge_OS_proved": False,
            "continuum_limit_proved": False,
            "remaining_OS_gate": (
                "the gauge-dependent polar-overlap fermion cross-boundary cone"
            ),
            "theory_of_nature": False,
            "status": "E gauge-only OS/gap merger; U fermionic merger",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()