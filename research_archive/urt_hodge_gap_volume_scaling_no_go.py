#!/usr/bin/env python3
"""Exact volume-scaling no-go for the global Hodge gap proof route.

The finite triangular U(1) certificate compares every admissible link field
globally with one flat connection using the pseudoinverse of the face-link
incidence matrix.  This script determines the long-wavelength obstruction to
making that particular estimate volume uniform.

At zero spatial momentum and temporal phase z, the exact 11-by-11 curvature
Gram block has characteristic polynomial

  x (x-8)^3 (x-12) [x^2-12x+8q]^3,
  q=2-z-z^-1=4 sin^2(k/2).

Its least positive branch is

  lambda_-(k)=6-2 sqrt(9-8 sin^2(k/2)).

For k=2 pi/Nt this is 8 pi^2/(3 Nt^2)+O(Nt^-4).  Hence the global Hodge
pseudoinverse norm grows at least linearly with Nt.  Combining it with the
L2 norm of all face fluxes makes the resulting isotropic admissibility radius
shrink at least as L^-3.

This rejects the *global flat-link comparison proof strategy*, not local
overlap admissibility itself.  A volume-uniform theorem must work directly
with local covariant-shift commutators, as standard hypercubic overlap bounds
do, rather than globally gauge-fixing near a single flat connection.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import sympy as sp


R = Fraction(355508034923519, 10**15)
FLAT_GAP_SQUARED = Fraction(3, 5)

DIRECTIONS = [
    (0, 1, 0, 0),
    (0, 0, 1, 0),
    (0, 0, 0, 1),
] + [(1, *bits) for bits in itertools.product((0, -1), repeat=3)]
DIRECTION_INDEX = {direction: index for index, direction in enumerate(DIRECTIONS)}


def symbolic_spatial_zero_block(z: sp.Symbol) -> sp.Matrix:
    rows: list[list[sp.Expr]] = [[sp.Integer(0)] * 11 for _ in range(3)]
    for axis in range(3):
        for other_signs in itertools.product((0, -1), repeat=2):
            minus = list(other_signs)
            minus.insert(axis, -1)
            minus_tuple = tuple(minus)
            plus = list(other_signs)
            plus.insert(axis, 0)
            plus_tuple = tuple(plus)
            minus_index = DIRECTION_INDEX[(1, *minus_tuple)]
            plus_index = DIRECTION_INDEX[(1, *plus_tuple)]

            bottom = [sp.Integer(0)] * 11
            bottom[axis] = 1
            bottom[minus_index] = 1
            bottom[plus_index] = -1
            rows.append(bottom)

            top = [sp.Integer(0)] * 11
            top[plus_index] = 1
            top[axis] = -z
            top[minus_index] = -1
            rows.append(top)
    return sp.Matrix(rows)


def exact_characteristic_polynomial() -> dict[str, Any]:
    z = sp.symbols("z", nonzero=True)
    x = sp.symbols("x")
    block = symbolic_spatial_zero_block(z)
    adjoint = block.T.applyfunc(lambda entry: entry.xreplace({z: 1 / z}))
    gram = sp.expand(adjoint * block)
    q = 2 - z - 1 / z
    characteristic = gram.charpoly(x).as_expr()
    target = x * (x - 8) ** 3 * (x - 12) * (x**2 - 12 * x + 8 * q) ** 3
    residual = sp.factor(characteristic - target)
    if residual != 0:
        residual = sp.cancel(characteristic - target)
    if residual != 0:
        raise RuntimeError(residual)
    return {
        "characteristic_polynomial": (
            "x (x-8)^3 (x-12) [x^2-12x+8q]^3"
        ),
        "q": "2-z-z^-1=4 sin^2(k/2)",
        "symbolic_residual": str(residual),
        "least_branch": "lambda_-=6-2 sqrt(9-2q)",
        "multiplicity": 3,
        "status": "E",
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    exact_block = exact_characteristic_polynomial()
    hop_factor = 5.0 + 3.0 * float(R)
    rows = []
    for length in (4, 6, 8, 12, 16, 24, 32, 64, 128):
        k_min = 2.0 * math.pi / length
        q_min = 4.0 * math.sin(k_min / 2.0) ** 2
        eigenvalue = 6.0 - 2.0 * math.sqrt(9.0 - 2.0 * q_min)
        volume = length**4
        face_count = 27 * volume
        optimistic_hodge_factor = math.sqrt(face_count / eigenvalue)
        optimistic_delta = (
            math.sqrt(float(FLAT_GAP_SQUARED))
            / (hop_factor * optimistic_hodge_factor)
        )
        rows.append(
            {
                "isotropic_length": length,
                "temporal_k_min": k_min,
                "q_min": q_min,
                "long_wavelength_curvature_eigenvalue": eigenvalue,
                "Nt_squared_times_eigenvalue": length**2 * eigenvalue,
                "optimistic_global_Hodge_factor_lower_bound": optimistic_hodge_factor,
                "optimistic_face_angle_threshold_upper_bound": optimistic_delta,
                "L_cubed_times_threshold": length**3 * optimistic_delta,
            }
        )

    length = sp.symbols("L", positive=True)
    asymptotic_eigenvalue_coefficient = sp.limit(
        length**2
        * (
            6
            - 2
            * sp.sqrt(
                9 - 8 * sp.sin(sp.pi / length) ** 2
            )
        ),
        length,
        sp.oo,
    )
    if sp.simplify(asymptotic_eigenvalue_coefficient - 8 * sp.pi**2 / 3) != 0:
        raise RuntimeError(asymptotic_eigenvalue_coefficient)

    hodge_coefficient = 9.0 / (2.0 * math.sqrt(2.0) * math.pi)
    threshold_scaled_limit = (
        math.sqrt(float(FLAT_GAP_SQUARED))
        / (hop_factor * hodge_coefficient)
    )

    out: dict[str, Any] = {
        "certificate": "URT global-Hodge gap volume-scaling no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "exact_spatial_zero_block": exact_block,
        "asymptotics": {
            "smallest_temporal_momentum": "k_min=2pi/Nt",
            "exact_eigenvalue": (
                "6-2 sqrt(9-8 sin^2(pi/Nt))"
            ),
            "limit_Nt_squared_lambda": str(asymptotic_eigenvalue_coefficient),
            "limit_formula": "8 pi^2/3",
            "singular_value_scaling": "sigma_min^+(B)<=sqrt(8/3) pi/Nt+O(Nt^-3)",
            "status": "E",
        },
        "global_Hodge_route": {
            "face_count_isotropic": "27 L^4",
            "optimistic_Hodge_factor": (
                "sqrt(27 L^4/lambda_min)<=not applicable; the actual factor "
                "is at least (9/(2 sqrt(2) pi)) L^3 asymptotically"
            ),
            "Hodge_factor_L_cubed_coefficient": hodge_coefficient,
            "sufficient_delta_must_shrink_at_least_as": "L^-3",
            "optimistic_limit_L_cubed_delta": threshold_scaled_limit,
            "rows": rows,
            "status": "E asymptotic obstruction for this norm-comparison method",
        },
        "verdict": {
            "finite_volume_certificate_invalidated": False,
            "global_flat_connection_comparison_volume_uniform": False,
            "volume_uniform_local_admissibility_disproved": False,
            "required_replacement": (
                "derive X^dagger X directly as a positive flat part plus local "
                "covariant-shift commutators bounded by individual triangular "
                "and square holonomies"
            ),
            "status": "F global Hodge proof route; U local commutator theorem",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()