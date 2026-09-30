#!/usr/bin/env python3
"""Finite-volume U(1) overlap-gap theorem for the triangular face repair.

On the Nt=6, Ns=2^3 reflected cell, form the real face-link incidence matrix
B for three spatial squares and 24 elementary future/spatial triangles per
site.  Exact Fourier blocks show

    rank(B)=477,
    dim ker(B)=51=(48-1)+4,
    sigma_min^+(B)^2=6-2 sqrt(7).

Thus the only zero-curvature real link modes are 47 gauge modes and four
torons.  In the zero-lift U(1) sector, if every unwrapped face angle obeys
|f_p|<=delta, Hodge projection gives

    ||theta-theta_flat||_infinity
      <= 36 delta/sqrt(6-2 sqrt(7)).

An exact rational Bernstein certificate gives X_flat^dagger X_flat >= 3/5
for the frozen rational (r,M) values and the whole surviving clock interval.
The Wilson-hop norm then proves a positive overlap gap whenever

    delta < sqrt(3/5)*sqrt(6-2 sqrt(7)) /
            (36*(5+3r))
          = 0.00298539857027...

This closes a real finite-volume gap gate.  It is not yet the required
volume-uniform, non-Abelian, all-topological-sector theorem, and it does not
prove interacting fermionic reflection positivity or a continuum limit.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from fractions import Fraction
from math import comb
from pathlib import Path
from typing import Any

import numpy as np
import sympy as sp


NT = 6
NS = 2
R = Fraction(355508034923519, 10**15)
M = Fraction(790940592107124, 10**15)
BERNSTEIN_TARGET = Fraction(3, 5)

DIRECTIONS = [
    (0, 1, 0, 0),
    (0, 0, 1, 0),
    (0, 0, 0, 1),
] + [(1, *bits) for bits in itertools.product((0, -1), repeat=3)]
DIRECTION_INDEX = {direction: index for index, direction in enumerate(DIRECTIONS)}


def temporal_root(index: int) -> sp.Expr:
    roots = [
        sp.Integer(1),
        sp.Rational(1, 2) + sp.I * sp.sqrt(3) / 2,
        -sp.Rational(1, 2) + sp.I * sp.sqrt(3) / 2,
        sp.Integer(-1),
        -sp.Rational(1, 2) - sp.I * sp.sqrt(3) / 2,
        sp.Rational(1, 2) - sp.I * sp.sqrt(3) / 2,
    ]
    return roots[index]


def fourier_face_block(
    temporal_index: int, spatial_signs: tuple[int, int, int]
) -> sp.Matrix:
    """Return the exact 27-by-11 face coboundary symbol."""
    zt = temporal_root(temporal_index)
    rows: list[list[sp.Expr]] = []

    for first in range(3):
        for second in range(first + 1, 3):
            row = [sp.Integer(0)] * 11
            row[first] = 1 - spatial_signs[second]
            row[second] = spatial_signs[first] - 1
            rows.append(row)

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

            # Bottom triangle:
            # x -> x+e_i -> x+d_plus -> x.
            row = [sp.Integer(0)] * 11
            row[axis] = 1
            row[minus_index] = spatial_signs[axis]
            row[plus_index] = -1
            rows.append(row)

            # Top triangle:
            # x -> x+d_plus -> x+d_minus -> x.
            endpoint_phase: sp.Expr = zt
            for coordinate, bit in enumerate(minus_tuple):
                if bit == -1:
                    endpoint_phase *= spatial_signs[coordinate]
            row = [sp.Integer(0)] * 11
            row[plus_index] = 1
            row[axis] = -endpoint_phase
            row[minus_index] = -1
            rows.append(row)

    return sp.Matrix(rows)


QuadraticMatrix = tuple[np.ndarray, np.ndarray]


def _as_fraction(value: sp.Expr) -> Fraction:
    rational = sp.Rational(sp.simplify(value))
    return Fraction(int(rational.p), int(rational.q))


def quadratic_parts(matrix: sp.Matrix) -> QuadraticMatrix:
    """Represent an exact matrix as A+B*w over Q, w=i*sqrt(3), w^2=-3."""
    real = np.empty((matrix.rows, matrix.cols), dtype=object)
    omega = np.empty_like(real)
    for row in range(matrix.rows):
        for column in range(matrix.cols):
            entry = sp.expand_complex(sp.expand(matrix[row, column]))
            real[row, column] = _as_fraction(sp.re(entry))
            omega[row, column] = _as_fraction(sp.im(entry) / sp.sqrt(3))
    return real, omega


def quadratic_matmul(
    left: QuadraticMatrix, right: QuadraticMatrix
) -> QuadraticMatrix:
    left_real, left_omega = left
    right_real, right_omega = right
    return (
        left_real @ right_real - 3 * (left_omega @ right_omega),
        left_real @ right_omega + left_omega @ right_real,
    )


def quadratic_identity(size: int) -> QuadraticMatrix:
    real = np.full((size, size), Fraction(0), dtype=object)
    omega = np.full_like(real, Fraction(0))
    for index in range(size):
        real[index, index] = Fraction(1)
    return real, omega


def quadratic_zero(size: int) -> QuadraticMatrix:
    return (
        np.full((size, size), Fraction(0), dtype=object),
        np.full((size, size), Fraction(0), dtype=object),
    )


def quadratic_add_scalar_identity(
    matrix: QuadraticMatrix, scalar: Fraction
) -> QuadraticMatrix:
    real = matrix[0].copy()
    omega = matrix[1].copy()
    for index in range(real.shape[0]):
        real[index, index] += scalar
    return real, omega


def quadratic_trace(matrix: QuadraticMatrix) -> tuple[Fraction, Fraction]:
    return (
        sum((matrix[0][index, index] for index in range(matrix[0].shape[0])), Fraction(0)),
        sum((matrix[1][index, index] for index in range(matrix[1].shape[0])), Fraction(0)),
    )


def polynomial_matrix_zero(
    matrix: QuadraticMatrix, polynomial: sp.Expr
) -> bool:
    variable = next(iter(polynomial.free_symbols))
    coefficients = [
        _as_fraction(coefficient)
        for coefficient in sp.Poly(sp.expand(polynomial), variable).all_coeffs()
    ]
    size = matrix[0].shape[0]
    result = quadratic_zero(size)
    for coefficient in coefficients:
        result = quadratic_add_scalar_identity(
            quadratic_matmul(result, matrix), coefficient
        )
    return all(value == 0 for value in result[0].flat) and all(
        value == 0 for value in result[1].flat
    )


def gauge_kernel_vector(
    temporal_index: int, spatial_signs: tuple[int, int, int]
) -> sp.Matrix:
    zt = temporal_root(temporal_index)
    entries = []
    for direction in DIRECTIONS:
        phase: sp.Expr = zt ** direction[0]
        for coordinate in range(3):
            if direction[coordinate + 1] != 0:
                phase *= spatial_signs[coordinate]
        entries.append(phase - 1)
    return sp.Matrix(entries)


def trace_moment_witness(
    matrix: QuadraticMatrix,
    roots_and_multiplicities: list[tuple[sp.Expr, int]],
) -> dict[str, Any]:
    """Prove the spectral multiplicities after an annihilator is known.

    For d distinct candidate roots, equality of traces through power d-1 is
    an invertible Vandermonde system for their multiplicities.
    """
    roots = [root for root, _ in roots_and_multiplicities]
    for left in range(len(roots)):
        for right in range(left):
            if sp.simplify(roots[left] - roots[right]) == 0:
                raise RuntimeError(("repeated candidate root", roots[left]))
    actual = []
    expected = []
    power = quadratic_identity(matrix[0].shape[0])
    for exponent in range(len(roots)):
        actual_real, actual_omega = quadratic_trace(power)
        expected_value = sp.simplify(sp.expand(
            sum(
                multiplicity * root**exponent
                for root, multiplicity in roots_and_multiplicities
            )
        ))
        expected_fraction = _as_fraction(expected_value)
        if actual_real != expected_fraction or actual_omega != 0:
            raise RuntimeError(
                (
                    "trace moment",
                    exponent,
                    actual_real,
                    actual_omega,
                    expected_fraction,
                )
            )
        actual.append(str(actual_real))
        expected.append(str(expected_fraction))
        power = quadratic_matmul(power, matrix)
    return {
        "candidate_roots_are_distinct": True,
        "Vandermonde_trace_moments": actual,
        "expected_trace_moments": expected,
        "moments_match_exactly": True,
    }


def fourier_class_certificate() -> dict[str, Any]:
    x = sp.symbols("x", real=True)
    class_rows = [
        {
            "name": "spatial_zero_temporal_zero",
            "representatives": [(0, (1, 1, 1))],
            "coverage": 1,
            "annihilator": x * (x - 8) * (x - 12),
            "spectrum": [(sp.Integer(0), 4), (sp.Integer(8), 3), (sp.Integer(12), 4)],
            "rank": 7,
            "least_positive": sp.Integer(8),
        },
        {
            "name": "one_spatial_pi_any_temporal",
            "representatives": [
                (index, (-1, 1, 1)) for index in range(4)
            ],
            "coverage": 18,
            "annihilator": x * (x - 2) * (x - 4) * (x - 6) * (x - 10) * (x - 14),
            "spectrum": [
                (sp.Integer(0), 1),
                (sp.Integer(2), 1),
                (sp.Integer(4), 2),
                (sp.Integer(6), 2),
                (sp.Integer(10), 3),
                (sp.Integer(14), 2),
            ],
            "rank": 10,
            "least_positive": sp.Integer(2),
        },
        {
            "name": "two_spatial_pi_any_temporal",
            "representatives": [
                (index, (-1, -1, 1)) for index in range(4)
            ],
            "coverage": 18,
            "annihilator": (
                x
                * (x - 4)
                * (x - 8)
                * (x - 12)
                * (x - 16)
                * ((x - 12) ** 2 - 32)
            ),
            "spectrum": [
                (sp.Integer(0), 1),
                (sp.Integer(4), 3),
                (12 - 4 * sp.sqrt(2), 1),
                (sp.Integer(8), 3),
                (sp.Integer(12), 1),
                (sp.Integer(16), 1),
                (12 + 4 * sp.sqrt(2), 1),
            ],
            "rank": 10,
            "least_positive": sp.Integer(4),
        },
        {
            "name": "three_spatial_pi_any_temporal",
            "representatives": [
                (index, (-1, -1, -1)) for index in range(4)
            ],
            "coverage": 6,
            "annihilator": x * (x - 6) * (x - 14) * (x - 20),
            "spectrum": [
                (sp.Integer(0), 1),
                (sp.Integer(6), 7),
                (sp.Integer(14), 1),
                (sp.Integer(20), 2),
            ],
            "rank": 10,
            "least_positive": sp.Integer(6),
        },
        {
            "name": "spatial_zero_temporal_plus_minus_one",
            "representatives": [(1, (1, 1, 1))],
            "coverage": 2,
            "annihilator": x * (x - 8) * (x - 12) * (x**2 - 12 * x + 8),
            "spectrum": [
                (sp.Integer(0), 1),
                (6 - 2 * sp.sqrt(7), 3),
                (sp.Integer(8), 3),
                (6 + 2 * sp.sqrt(7), 3),
                (sp.Integer(12), 1),
            ],
            "rank": 10,
            "least_positive": 6 - 2 * sp.sqrt(7),
        },
        {
            "name": "spatial_zero_temporal_plus_minus_two",
            "representatives": [(2, (1, 1, 1))],
            "coverage": 2,
            "annihilator": x * (x - 8) * (x - 12) * (x**2 - 12 * x + 24),
            "spectrum": [
                (sp.Integer(0), 1),
                (6 - 2 * sp.sqrt(3), 3),
                (sp.Integer(8), 3),
                (6 + 2 * sp.sqrt(3), 3),
                (sp.Integer(12), 1),
            ],
            "rank": 10,
            "least_positive": 6 - 2 * sp.sqrt(3),
        },
        {
            "name": "spatial_zero_temporal_three",
            "representatives": [(3, (1, 1, 1))],
            "coverage": 1,
            "annihilator": x * (x - 4) * (x - 8) * (x - 12),
            "spectrum": [
                (sp.Integer(0), 1),
                (sp.Integer(4), 3),
                (sp.Integer(8), 6),
                (sp.Integer(12), 1),
            ],
            "rank": 10,
            "least_positive": sp.Integer(4),
        },
    ]

    rendered_rows = []
    all_checks = True
    for row in class_rows:
        checks = []
        spectral_witnesses = []
        for temporal_index, spatial_signs in row["representatives"]:
            block = fourier_face_block(temporal_index, spatial_signs)
            gram = sp.expand(block.conjugate().T * block)
            exact_gram = quadratic_parts(gram)
            check = polynomial_matrix_zero(exact_gram, row["annihilator"])
            spectral_witness = trace_moment_witness(
                exact_gram, row["spectrum"]
            )
            zero_multiplicity = next(
                multiplicity
                for root, multiplicity in row["spectrum"]
                if root == 0
            )
            rank = 11 - zero_multiplicity
            if not (temporal_index == 0 and spatial_signs == (1, 1, 1)):
                gauge_vector = gauge_kernel_vector(
                    temporal_index, spatial_signs
                )
                gauge_check = all(
                    sp.expand_complex(sp.expand(entry)) == 0
                    for entry in block * gauge_vector
                )
                if not gauge_check or gauge_vector == sp.zeros(11, 1):
                    raise RuntimeError(
                        ("gauge-kernel check", temporal_index, spatial_signs)
                    )
                spectral_witness["exact_gauge_kernel_check"] = gauge_check
            checks.append(check)
            spectral_witnesses.append(spectral_witness)
            if not check or rank != row["rank"]:
                raise RuntimeError((row["name"], check, rank))
        all_checks = all_checks and all(checks)
        rendered_rows.append(
            {
                "class": row["name"],
                "momentum_block_count": row["coverage"],
                "exact_annihilator": str(sp.factor(row["annihilator"])),
                "representative_annihilator_checks": checks,
                "exact_spectrum": [
                    {"eigenvalue": str(root), "multiplicity": multiplicity}
                    for root, multiplicity in row["spectrum"]
                ],
                "representative_spectral_witnesses": spectral_witnesses,
                "rank_per_block": row["rank"],
                "least_positive_eigenvalue": str(row["least_positive"]),
                "least_positive_eigenvalue_numeric": float(row["least_positive"]),
            }
        )

    if sum(row["coverage"] for row in class_rows) != NT * NS**3:
        raise RuntimeError("Fourier classes do not cover all momenta")
    total_rank = 7 + (NT * NS**3 - 1) * 10
    link_count = NT * NS**3 * len(DIRECTIONS)
    site_count = NT * NS**3
    nullity = link_count - total_rank
    if nullity != (site_count - 1) + 4:
        raise RuntimeError((total_rank, nullity))

    return {
        "Fourier_block_size": [27, 11],
        "momentum_block_count": NT * NS**3,
        "classes": rendered_rows,
        "all_exact_annihilator_checks": all_checks,
        "rank_B": total_rank,
        "link_count": link_count,
        "nullity_B": nullity,
        "gauge_nullity": site_count - 1,
        "toron_nullity": 4,
        "smallest_positive_BdaggerB_eigenvalue": "6-2*sqrt(7)",
        "smallest_positive_singular_value": float(sp.sqrt(6 - 2 * sp.sqrt(7))),
        "classification_argument": (
            "spatial permutations cover equal Hamming weights; temporal "
            "momenta 4 and 5 are complex conjugates of 2 and 1"
        ),
        "status": "E",
    }


def monomial_to_bernstein(polynomial: sp.Poly, degree: int) -> np.ndarray:
    monomials = {
        exponent: Fraction(int(coefficient.p), int(coefficient.q))
        for exponent, coefficient in polynomial.terms()
    }
    result = np.empty((degree + 1,) * 3, dtype=object)
    for index in np.ndindex(result.shape):
        value = Fraction(0)
        for exponent, coefficient in monomials.items():
            if all(exponent[axis] <= index[axis] for axis in range(3)):
                factor = Fraction(1)
                for axis in range(3):
                    factor *= Fraction(
                        comb(index[axis], exponent[axis]),
                        comb(degree, exponent[axis]),
                    )
                value += coefficient * factor
        result[index] = value
    return result


def split_bernstein(
    coefficients: np.ndarray, axis: int
) -> tuple[np.ndarray, np.ndarray]:
    moved = np.moveaxis(coefficients, axis, 0)
    degree = moved.shape[0] - 1
    left = np.empty_like(moved)
    right = np.empty_like(moved)
    for tail_index in np.ndindex(moved.shape[1:]):
        levels = [[moved[(index,) + tail_index] for index in range(degree + 1)]]
        for level in range(1, degree + 1):
            levels.append(
                [
                    (levels[-1][index] + levels[-1][index + 1]) / 2
                    for index in range(degree - level + 1)
                ]
            )
        for index in range(degree + 1):
            left[(index,) + tail_index] = levels[index][0]
            right[(degree - index,) + tail_index] = levels[index][-1]
    return np.moveaxis(left, 0, axis), np.moveaxis(right, 0, axis)


def bernstein_gap_certificate() -> dict[str, Any]:
    variables = sp.symbols("t0:3", real=True)
    r_value = sp.Rational(R.numerator, R.denominator)
    height = sp.Rational(M.numerator, M.denominator)
    scalar = (
        1
        - height
        + 2 * r_value * sum(1 - variable**2 for variable in variables)
        - variables[0] * variables[1] * variables[2]
    )
    radicand = sp.expand(
        4 * sum(variable**2 * (1 - variable**2) for variable in variables)
        + scalar**2
    )
    polynomial = sp.Poly(radicand, *variables)
    coefficients = monomial_to_bernstein(polynomial, degree=4)

    stack: list[tuple[np.ndarray, str, int]] = [(coefficients, "", 0)]
    leaves = []
    split_count = 0
    while stack:
        current, path, depth = stack.pop()
        lower = min(current.flat)
        if lower >= BERNSTEIN_TARGET:
            leaves.append((path or "root", lower, depth))
            continue
        if depth >= 30:
            raise RuntimeError(("Bernstein depth exhausted", path, lower))
        axis = depth % 3
        left, right = split_bernstein(current, axis)
        stack.append((right, path + f"{axis}R", depth + 1))
        stack.append((left, path + f"{axis}L", depth + 1))
        split_count += 1

    weakest = min(lower for _, lower, _ in leaves)
    return {
        "frozen_r_rational": f"{R.numerator}/{R.denominator}",
        "frozen_M_rational": f"{M.numerator}/{M.denominator}",
        "time_minimum": (
            "For c_t^2>=2M-M^2, dF/dy=2C[(1-c_t^2)Cy-A]<=0; "
            "therefore y=cos(omega)=1 is the minimum."
        ),
        "spatial_variables": "t_i=cos(p_i/2) in [0,1]",
        "spatial_polynomial": str(radicand),
        "exact_lower_bound": "3/5",
        "whole_cube_Bernstein_lower_bound": float(min(coefficients.flat)),
        "certified_leaf_count": len(leaves),
        "split_count": split_count,
        "maximum_depth": max(depth for _, _, depth in leaves),
        "weakest_leaf_Bernstein_bound": {
            "exact": f"{weakest.numerator}/{weakest.denominator}",
            "numeric": float(weakest),
        },
        "leaf_paths": [path for path, _, _ in leaves],
        "all_leaf_bounds_at_least_3_over_5": all(
            lower >= BERNSTEIN_TARGET for _, lower, _ in leaves
        ),
        "status": "E exact rational Bernstein certificate",
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    face_certificate = fourier_class_certificate()
    gap_certificate = bernstein_gap_certificate()

    curvature_eigenvalue = 6.0 - 2.0 * math.sqrt(7.0)
    hodge_factor = 36.0 / math.sqrt(curvature_eigenvalue)
    hop_factor = 5.0 + 3.0 * float(R)
    perturbation_factor = hodge_factor * hop_factor
    delta_threshold = math.sqrt(float(BERNSTEIN_TARGET)) / perturbation_factor

    out: dict[str, Any] = {
        "certificate": "URT triangular finite-volume U1 overlap-gap theorem",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "scope": {
            "gauge_group": "U(1)",
            "lattice": "Nt=6, Ns=2^3 periodic gauge cell; antiperiodic fermion time",
            "topological_scope": (
                "zero-lift sector: link phases admit real lifts with every "
                "face equation B theta=f and |f_p|<=delta"
            ),
            "clock_scope": (
                "sqrt(2M-M^2)<=c_t<=1 for the frozen rational M"
            ),
        },
        "face_complex": {
            "site_count": NT * NS**3,
            "links_per_site": len(DIRECTIONS),
            "link_count": NT * NS**3 * len(DIRECTIONS),
            "faces_per_site": 27,
            "face_count": NT * NS**3 * 27,
            "spatial_squares_per_site": 3,
            "triangles_per_site": 24,
            **face_certificate,
        },
        "free_kernel_gap": gap_certificate,
        "Hodge_bound": {
            "decomposition": (
                "theta=k+eta, k in ker(B), eta in range(B^dagger)"
            ),
            "exact_bound": (
                "||eta||_infinity<=||eta||_2<="
                "36 delta/sqrt(6-2 sqrt(7))"
            ),
            "numeric_coefficient": hodge_factor,
            "flat_kernel": (
                "ker(B)=47 gauge modes plus four torons; after gauge fixing, "
                "torons only shift the continuous free momenta"
            ),
            "status": "E in the stated real-lift sector",
        },
        "interacting_gap": {
            "hop_norm_bound": "5+3r",
            "hop_norm_bound_numeric": hop_factor,
            "operator_perturbation_bound": (
                "||X(theta)-X(k)||<=(5+3r)*36 delta/"
                "sqrt(6-2 sqrt(7))"
            ),
            "operator_perturbation_coefficient": perturbation_factor,
            "singular_value_lower_bound": (
                "sigma_min(X_theta)>=sqrt(3/5)-"
                "(5+3r)*36 delta/sqrt(6-2 sqrt(7))"
            ),
            "strict_face_angle_threshold": delta_threshold,
            "equivalent_maximum_U1_face_holonomy_deviation": (
                2.0 * math.sin(delta_threshold / 2.0)
            ),
            "positive_gap_below_threshold": True,
            "status": "E conditional on the scope premises",
        },
        "verdict": {
            "triangular_faces_remove_extra_flat_modes": True,
            "nonempty_finite_volume_admissible_overlap_domain": True,
            "volume_uniform_gap_proved": False,
            "non_Abelian_gap_proved": False,
            "all_topological_sectors_proved": False,
            "fermion_gauge_reflection_positivity_proved": False,
            "continuum_limit_proved": False,
            "next_gate": (
                "replace the finite-cell Hodge factor by a volume-uniform local "
                "curvature estimate and extend it to the compact non-Abelian factors"
            ),
            "status": "E finite zero-lift U1 gap; U full interacting theory",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()