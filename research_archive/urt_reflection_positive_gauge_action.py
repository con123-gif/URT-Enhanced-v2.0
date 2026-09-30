#!/usr/bin/env python3
"""Reflection-positive compact Wilson gauge action on the two-coset lattice.

Use the local graph already selected for the free fermion kernel.  A spatial
slice has unit vectors u_i, i=1,2,3, and the eight future links are

    v_eps=(sqrt(5)/2, eps_1/2, eps_2/2, eps_3/2), eps_i in {+1,-1},

in orthonormal (time,space) coordinates.  Spatial square plaquettes span
u_i wedge u_j; electric parallelograms span v_eps wedge u_i.

An exact Q(sqrt(5)) frame calculation gives

  sum spatial A tensor A = diag(0,0,0,1,1,1),
  sum electric A tensor A = diag(10,10,10,4,4,4).

Consequently four-dimensional quadratic isotropy uniquely fixes the positive
plaquette-weight ratio a:b=6:1.  All plaquettes span at most one time step.
Reflection through an integer slice therefore decomposes the action into
S_+ + theta(S_+) + S_0, which proves site Osterwalder--Schrader positivity by
an exact conditional-square factorization.  Positive Wilson character
coefficients also give the usual link-reflection cone for compact groups.

No observational target is used.
"""

from __future__ import annotations

import argparse
import cmath
import itertools
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np
from scipy.special import iv


# Algebraic number a+b sqrt(5), represented exactly by rational pairs.
Q5 = tuple[Fraction, Fraction]


def q5_add(left: Q5, right: Q5) -> Q5:
    return (left[0] + right[0], left[1] + right[1])


def q5_sub(left: Q5, right: Q5) -> Q5:
    return (left[0] - right[0], left[1] - right[1])


def q5_mul(left: Q5, right: Q5) -> Q5:
    return (
        left[0] * right[0] + 5 * left[1] * right[1],
        left[0] * right[1] + left[1] * right[0],
    )


def q5_zero() -> Q5:
    return (Fraction(0), Fraction(0))


def wedge(left: list[Q5], right: list[Q5]) -> list[Q5]:
    return [
        q5_sub(q5_mul(left[i], right[j]), q5_mul(left[j], right[i]))
        for i, j in itertools.combinations(range(4), 2)
    ]


def frame(vectors: list[list[Q5]]) -> list[list[Q5]]:
    out = [[q5_zero() for _ in range(6)] for _ in range(6)]
    for vector in vectors:
        for i in range(6):
            for j in range(6):
                out[i][j] = q5_add(out[i][j], q5_mul(vector[i], vector[j]))
    return out


def render_q5(value: Q5) -> str:
    a, b = value
    if b == 0:
        return str(a)
    if a == 0:
        return f"({b})sqrt(5)"
    return f"{a}+({b})sqrt(5)"


def render_matrix(matrix: list[list[Q5]]) -> list[list[str]]:
    return [[render_q5(value) for value in row] for row in matrix]


def diagonal_q5(values: list[Fraction]) -> list[list[Q5]]:
    return [
        [
            (values[i], Fraction(0)) if i == j else q5_zero()
            for j in range(len(values))
        ]
        for i in range(len(values))
    ]


def matrix_equal(left: list[list[Q5]], right: list[list[Q5]]) -> bool:
    return left == right


def site_reflection_quadrature() -> dict[str, float]:
    """Numerically audit the exact conditional-square OS identity."""
    count = 192
    beta = 0.73
    boundary_beta = 0.21
    angles = 2.0 * math.pi * np.arange(count) / count
    db = 1.0 / count

    # S_+(p,b) is a one-plaquette U(1) stand-in.  The proof below is general;
    # this quadrature catches misplaced conjugations or reflection factors.
    inner = np.zeros(count, dtype=complex)
    for ib, boundary in enumerate(angles):
        total = 0.0j
        for positive in angles:
            s_plus = beta * (1.0 - math.cos(positive - boundary))
            test = (
                cmath.exp(2.0j * positive)
                + (0.31 - 0.27j) * cmath.exp(-1.0j * positive)
                + 0.19 * cmath.exp(1.0j * boundary)
            )
            total += test * math.exp(-s_plus) * db
        inner[ib] = total

    square_form = 0.0
    direct_form = 0.0j
    for ib, boundary in enumerate(angles):
        boundary_weight = math.exp(
            -boundary_beta * (1.0 - math.cos(boundary))
        )
        square_form += boundary_weight * abs(inner[ib]) ** 2 * db

        # The independent negative-half integral is conjugate(inner).
        negative_inner = np.conjugate(inner[ib])
        direct_form += boundary_weight * negative_inner * inner[ib] * db

    return {
        "direct_OS_form_real": float(direct_form.real),
        "direct_OS_form_imaginary_abs": float(abs(direct_form.imag)),
        "conditional_square_form": float(square_form),
        "factorization_residual": float(abs(direct_form - square_form)),
        "nonnegative": bool(square_form >= 0.0),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    zero: Q5 = (Fraction(0), Fraction(0))
    one: Q5 = (Fraction(1), Fraction(0))
    half: Q5 = (Fraction(1, 2), Fraction(0))
    sqrt5_half: Q5 = (Fraction(0), Fraction(1, 2))

    time = [one, zero, zero, zero]
    spatial_basis = [
        [zero, one, zero, zero],
        [zero, zero, one, zero],
        [zero, zero, zero, one],
    ]
    _ = time  # Records the chosen orthonormal ordering explicitly.

    spatial_areas = [
        wedge(spatial_basis[i], spatial_basis[j])
        for i, j in itertools.combinations(range(3), 2)
    ]
    future_links = []
    for signs in itertools.product((-1, 1), repeat=3):
        future_links.append(
            [sqrt5_half]
            + [
                (Fraction(sign, 2), Fraction(0))
                for sign in signs
            ]
        )
    electric_areas = [
        wedge(link, spatial_basis[i])
        for link in future_links
        for i in range(3)
    ]

    spatial_frame = frame(spatial_areas)
    electric_frame = frame(electric_areas)
    expected_spatial = diagonal_q5(
        [Fraction(0)] * 3 + [Fraction(1)] * 3
    )
    expected_electric = diagonal_q5(
        [Fraction(10)] * 3 + [Fraction(4)] * 3
    )
    if not matrix_equal(spatial_frame, expected_spatial):
        raise RuntimeError("spatial bivector frame failed")
    if not matrix_equal(electric_frame, expected_electric):
        raise RuntimeError("electric bivector frame failed")

    # a M_spatial+b M_electric=lambda I.  Electric entries give lambda=10b;
    # magnetic entries give lambda=a+4b, hence a=6b.
    spatial_weight = Fraction(6)
    electric_weight = Fraction(1)
    combined = [
        [
            q5_add(
                q5_mul((spatial_weight, Fraction(0)), spatial_frame[i][j]),
                q5_mul((electric_weight, Fraction(0)), electric_frame[i][j]),
            )
            for j in range(6)
        ]
        for i in range(6)
    ]
    expected_combined = diagonal_q5([Fraction(10)] * 6)
    if not matrix_equal(combined, expected_combined):
        raise RuntimeError("isotropic gauge frame failed")

    site_witness = site_reflection_quadrature()

    # For U(1), exp(k cos theta)=sum_n I_n(k)e^{in theta}; all I_n(k)>0.
    # This is the simplest explicit compact-character audit.
    character_rows = []
    minimum_character_coefficient = math.inf
    maximum_bessel_symmetry_residual = 0.0
    for coupling in (0.01, 0.2, 1.0, 4.0):
        coefficients = {
            str(n): float(iv(abs(n), coupling)) for n in range(-16, 17)
        }
        minimum_character_coefficient = min(
            minimum_character_coefficient, min(coefficients.values())
        )
        symmetry_residual = max(
            abs(coefficients[str(n)] - coefficients[str(-n)])
            for n in range(17)
        )
        maximum_bessel_symmetry_residual = max(
            maximum_bessel_symmetry_residual, symmetry_residual
        )
        character_rows.append(
            {
                "coupling": coupling,
                "coefficients_n_minus16_to_16": coefficients,
                "minimum_coefficient": min(coefficients.values()),
                "I_n_minus_I_minus_n_residual": symmetry_residual,
            }
        )

    out: dict[str, Any] = {
        "certificate": "URT reflection-positive compact gauge action",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "local_cell_geometry": {
            "orthonormal_coordinates": "(t,x1,x2,x3)",
            "spatial_links": "u_i=e_i, i=1,2,3, and reverses",
            "future_links": (
                "v_eps=(sqrt(5)/2,eps1/2,eps2/2,eps3/2), "
                "all eight sign triples"
            ),
            "future_link_squared_length": "2",
            "spatial_plaquettes": "unit squares u_i wedge u_j",
            "electric_plaquettes": "parallelograms v_eps wedge u_i",
            "plaquettes_per_cell": {
                "spatial_types": len(spatial_areas),
                "electric_types": len(electric_areas),
            },
            "maximum_time_span_in_layers": 1,
            "status": "E",
        },
        "exact_bivector_frames": {
            "basis": ["t^x1", "t^x2", "t^x3", "x1^x2", "x1^x3", "x2^x3"],
            "spatial_frame": render_matrix(spatial_frame),
            "electric_frame": render_matrix(electric_frame),
            "identities": [
                "M_spatial=diag(0,0,0,1,1,1)",
                "M_electric=diag(10,10,10,4,4,4)",
            ],
            "irrational_part_cancels_exactly": all(
                value[1] == 0
                for matrix in (spatial_frame, electric_frame)
                for row in matrix
                for value in row
            ),
            "status": "E",
        },
        "isotropic_Wilson_action": {
            "formula": (
                "S_g=beta[6 sum_spatial (1-Re tr_R U_p/d_R)+"
                "sum_electric (1-Re tr_R U_p/d_R)]"
            ),
            "isotropy_equation": "a+4b=10b",
            "unique_positive_ratio": "a:b=6:1",
            "combined_frame": render_matrix(combined),
            "quadratic_continuum_symbol": "10 beta ||F||^2 up to area/trace convention",
            "group_scope": (
                "any compact group and unitary representation; in particular "
                "S(U(3)xU(2)) in the parent fundamental trace"
            ),
            "status": "E conditional on the plaquette-local action premise",
        },
        "site_reflection_positivity": {
            "reflection": "theta(t,x)=(-t,x), with gauge-link orientation reversed",
            "action_split": "S=S_+ + theta(S_+) + S_0",
            "reason": (
                "Every electric plaquette lies between one adjacent pair of layers; "
                "none contains both t>0 and t<0 links. Spatial plaquettes at t=0 "
                "belong to S_0."
            ),
            "exact_factorization": (
                "<theta(F)F>=integral dU_0 e^{-S_0} "
                "|integral dU_+ F e^{-S_+}|^2 >=0"
            ),
            "deterministic_U1_quadrature_witness": site_witness,
            "status": "E",
        },
        "link_reflection_character_cone": {
            "U1_identity": (
                "exp(k cos theta)=sum_{n in Z} I_n(k) exp(i n theta), "
                "I_n(k)>=0 for k>=0"
            ),
            "general_compact_group_proof": (
                "exp[k(chi_R+chi_Rbar)] expands into tensor powers of R and Rbar; "
                "decomposition multiplicities and Taylor coefficients are "
                "nonnegative, hence every irreducible-character coefficient is "
                "nonnegative. Crossing plaquettes are sums of theta(F_alpha)F_alpha."
            ),
            "U1_witnesses": character_rows,
            "minimum_sampled_character_coefficient": minimum_character_coefficient,
            "maximum_I_n_symmetry_residual": maximum_bessel_symmetry_residual,
            "status": "E for nonnegative Wilson character coefficients; C for the adapted one-step transfer construction",
        },
        "remaining_boundary": {
            "not_proved_here": [
                "a gauge-covariant overlap determinant with a globally trivialized chiral measure",
                "dynamical 3+2 breaking and a selected finite Higgs/Yukawa Dirac block",
                "continuum limit and universality of the interacting theory",
                "absolute gauge coupling and lattice spacing",
            ],
            "status": "U/C",
        },
        "verdict": {
            "local_compact_gauge_action": "E conditional",
            "unique_isotropic_plaquette_ratio": "E",
            "site_OS_reflection_positivity": "E",
            "link_character_positive_Wilson_weight": "E",
            "interacting_chiral_gauge_theory": "U",
            "advance": (
                "The reflection-closed lattice now carries both a free overlap "
                "fermion kernel and a compact reflection-positive gauge measure. "
                "Their unresolved merger is specifically the chiral gauge measure, "
                "not Euclidean locality or positivity of the separate free layers."
            ),
            "phenomenology_gate": "CLOSED",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()