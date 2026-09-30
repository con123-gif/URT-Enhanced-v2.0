#!/usr/bin/env python3
"""Explicit finite-volume gauge-invariant overlap OS-negative witness.

This audit defines a four-configuration compact U(1) gauge measure on the
Nt=6, Ns=2 Cathedral reflection cell.  One future-link orbit {l,theta(l)}
is varied, independently, over the exact rational unitaries

    z=(12+5 i)/13,  z^{-1}=(12-5 i)/13.

All other links equal one.  The product two-point measure factors between
the two members of the site-reflection orbit, so it is gauge-sector
reflection positive.  Haar averaging over local gauge transformations makes
it gauge invariant without changing gauge-invariant expectations, face
holonomies, or the scalar-density observable used below.

For a fixed rational linear combination F of the sixteen positive-half
scalar densities, the determinant-weighted overlap OS form is negative by
about 5.7e-8.  The same F is positive for the gauge-covariant Wilson control.
Three independent constructions of the overlap polar factor -- XdaggerX
eigendecomposition, SVD, and the Hermitian Wilson-kernel sign -- agree on the
negative value to about 1e-15.  Every configuration has a large polar gap.

This is a robust numerical finite-volume counterexample for generic
gauge-covariant massive overlap reflection positivity with this RP probe
measure.  It is not yet an interval-arithmetic theorem, and the probe measure
is not the selected triangular face-autocorrelation action.  It therefore
does not by itself settle the specially weighted Cathedral merger.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np


HERE = Path(__file__).resolve().parent
ADMISSIBLE_AUDIT = HERE / "urt_admissible_gauge_invariant_os_audit.py"
R_EXACT = Fraction(355508034923519, 10**15)
M_EXACT = Fraction(790940592107124, 10**15)
MASS_EXACT = Fraction(1, 2)
Z_REAL = Fraction(12, 13)
Z_IMAGINARY = Fraction(5, 13)
Z = complex(float(Z_REAL), float(Z_IMAGINARY))


def load_module() -> Any:
    spec = importlib.util.spec_from_file_location(
        "urt_admissible_audit", ADMISSIBLE_AUDIT
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {ADMISSIBLE_AUDIT}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


W = load_module()
P = W.P
CORE = W.CORE
A = W.A


FIRST_KEY = (
    A.SITE_INDEX[(2, 0, 0, 0)],
    A.DIRECTION_INDEX[(1, -1, 0, -1)],
)
SECOND_KEY = (
    A.SITE_INDEX[(3, 0, 1, 0)],
    A.DIRECTION_INDEX[(1, 0, -1, 0)],
)
ORBIT = (FIRST_KEY, SECOND_KEY)

# A deliberately short exact witness.  The positive-site order is the order
# in A.POSITIVE_SITES: all eight t=1 sites, then the eight t=2 sites in binary
# lexicographic order.  Normalization is irrelevant to the sign.
WITNESS_EXACT = (
    *(Fraction(-17, 10000) for _ in range(8)),
    Fraction(223, 250),
    Fraction(51, 10000),
    Fraction(51, 10000),
    Fraction(-1019, 5000),
    Fraction(51, 10000),
    Fraction(-1019, 5000),
    Fraction(-1019, 5000),
    Fraction(-1411, 5000),
)


def wilson_operator_from_links(links: np.ndarray) -> np.ndarray:
    gammas, _ = A.gamma_matrices()
    identity4 = np.eye(4, dtype=complex)
    site_count = len(A.SITES)
    operator = np.zeros((4 * site_count, 4 * site_count), dtype=complex)
    r = float(R_EXACT)
    onsite = (3.0 * r + 1.0) * identity4
    for site_index in range(site_count):
        operator[
            4 * site_index : 4 * site_index + 4,
            4 * site_index : 4 * site_index + 4,
        ] = onsite

    for direction_index, displacement in enumerate(A.DIRECTIONS):
        if direction_index < 3:
            gamma = gammas[direction_index + 1]
            forward = 0.5 * (gamma - r * identity4)
            backward = 0.5 * (-gamma - r * identity4)
        else:
            gamma = gammas[0]
            forward = (gamma - identity4) / 16.0
            backward = (-gamma - identity4) / 16.0
        reverse = tuple(-value for value in displacement)
        for site_index, site in enumerate(A.SITES):
            forward_index = A.SITE_INDEX[A.shift(site, displacement)]
            backward_index = A.SITE_INDEX[A.shift(site, reverse)]
            operator[
                4 * site_index : 4 * site_index + 4,
                4 * forward_index : 4 * forward_index + 4,
            ] += (
                A.antiperiodic_sign(site, displacement)
                * forward
                * links[site_index, direction_index]
            )
            operator[
                4 * site_index : 4 * site_index + 4,
                4 * backward_index : 4 * backward_index + 4,
            ] += (
                A.antiperiodic_sign(site, reverse)
                * backward
                * np.conjugate(links[backward_index, direction_index])
            )
    return operator


def polar_factors(x_matrix: np.ndarray) -> dict[str, np.ndarray]:
    values, vectors = np.linalg.eigh(x_matrix.conj().T @ x_matrix)
    xdagx = x_matrix @ (vectors * (1.0 / np.sqrt(values))) @ vectors.conj().T

    left, _, right_h = np.linalg.svd(x_matrix, full_matrices=False)
    svd = left @ right_h

    _, gamma5_spin = A.gamma_matrices()
    gamma5 = np.kron(np.eye(len(A.SITES)), gamma5_spin)
    hermitian_kernel = gamma5 @ x_matrix
    h_values, h_vectors = np.linalg.eigh(hermitian_kernel)
    hermitian_sign = gamma5 @ (
        (h_vectors * np.sign(h_values)) @ h_vectors.conj().T
    )
    return {
        "XdaggerX": xdagx,
        "SVD": svd,
        "Hermitian_sign": hermitian_sign,
    }


def scalar_gram(operator: np.ndarray) -> np.ndarray:
    identity = np.eye(operator.shape[0], dtype=complex)
    covariance = np.linalg.solve(operator, identity)
    return CORE.scalar_density_gram(covariance)


def determinant(operator: np.ndarray) -> tuple[float, float, int]:
    return CORE.real_determinant_weight(operator)


def normalized_average(
    matrices: list[np.ndarray], logweights: list[float], signs: list[int]
) -> tuple[np.ndarray, np.ndarray]:
    weights = CORE.normalized_weights(np.asarray(logweights), np.asarray(signs))
    average = sum(weight * matrix for weight, matrix in zip(weights, matrices))
    return CORE.hermitian(average), weights


def render_fraction(value: Fraction) -> str:
    return f"{value.numerator}/{value.denominator}"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    partner_first = A.reflected_link_partner(*FIRST_KEY)
    partner_second = A.reflected_link_partner(*SECOND_KEY)
    if partner_first[:2] != SECOND_KEY or partner_first[2] != -1:
        raise RuntimeError("first link is not reflected to the second with inversion")
    if partner_second[:2] != FIRST_KEY or partner_second[2] != -1:
        raise RuntimeError("second link is not reflected to the first with inversion")
    if abs(Z * np.conjugate(Z) - 1.0) > 2.0 * np.finfo(float).eps:
        raise RuntimeError("binary floating representation lost unit norm")

    dimension = 4 * len(A.SITES)
    identity = np.eye(dimension, dtype=complex)
    witness = np.asarray([float(value) for value in WITNESS_EXACT])
    witness /= np.linalg.norm(witness)
    polar_names = ("XdaggerX", "SVD", "Hermitian_sign")
    overlap_matrices = {name: [] for name in polar_names}
    overlap_logweights = {name: [] for name in polar_names}
    overlap_signs = {name: [] for name in polar_names}
    Wilson_matrices: list[np.ndarray] = []
    Wilson_logweights: list[float] = []
    Wilson_signs: list[int] = []
    configuration_rows = []
    polar_residuals = []
    gaps = []

    for first_sign, second_sign in itertools.product((-1, 1), repeat=2):
        links = np.ones((len(A.SITES), len(A.DIRECTIONS)), dtype=complex)
        links[FIRST_KEY] = Z if first_sign > 0 else np.conjugate(Z)
        links[SECOND_KEY] = Z if second_sign > 0 else np.conjugate(Z)
        wilson = wilson_operator_from_links(links)
        x_matrix = wilson - float(M_EXACT) * identity
        gap_values = np.linalg.eigvalsh(x_matrix.conj().T @ x_matrix)
        gap = float(gap_values[0])
        gaps.append(gap)
        polars = polar_factors(x_matrix)
        polar_residuals.append(
            {
                "XdaggerX_vs_SVD": float(
                    np.linalg.norm(polars["XdaggerX"] - polars["SVD"], 2)
                ),
                "XdaggerX_vs_Hermitian_sign": float(
                    np.linalg.norm(
                        polars["XdaggerX"] - polars["Hermitian_sign"], 2
                    )
                ),
                "SVD_vs_Hermitian_sign": float(
                    np.linalg.norm(polars["SVD"] - polars["Hermitian_sign"], 2)
                ),
            }
        )
        per_method = {}
        for name, polar in polars.items():
            overlap = 0.5 * (identity + polar)
            massive = float(MASS_EXACT) * identity + (
                1.0 - float(MASS_EXACT)
            ) * overlap
            logweight, phase, sign = determinant(massive)
            gram = scalar_gram(massive)
            overlap_matrices[name].append(gram)
            overlap_logweights[name].append(logweight)
            overlap_signs[name].append(sign)
            per_method[name] = {
                "fixed_witness_value_before_gauge_average": float(
                    np.real(witness.conj() @ gram @ witness)
                ),
                "logabsdet": logweight,
                "determinant_phase": phase,
                "determinant_sign": sign,
            }

        massive_wilson = wilson + float(MASS_EXACT) * identity
        Wilson_logweight, Wilson_phase, Wilson_sign = determinant(massive_wilson)
        Wilson_gram = scalar_gram(massive_wilson)
        Wilson_matrices.append(Wilson_gram)
        Wilson_logweights.append(Wilson_logweight)
        Wilson_signs.append(Wilson_sign)
        configuration_rows.append(
            {
                "link_signs": [first_sign, second_sign],
                "minimum_XdaggerX": gap,
                "overlap_methods": per_method,
                "Wilson_control": {
                    "fixed_witness_value_before_gauge_average": float(
                        np.real(witness.conj() @ Wilson_gram @ witness)
                    ),
                    "logabsdet": Wilson_logweight,
                    "determinant_phase": Wilson_phase,
                    "determinant_sign": Wilson_sign,
                },
            }
        )

    overlap_results = {}
    overlap_values = []
    for name in polar_names:
        gram, weights = normalized_average(
            overlap_matrices[name],
            overlap_logweights[name],
            overlap_signs[name],
        )
        value = float(np.real(witness.conj() @ gram @ witness))
        overlap_values.append(value)
        eigenvalues = np.linalg.eigvalsh(gram)
        overlap_results[name] = {
            "fixed_rational_witness_OS_value": value,
            "minimum_full_scalar_Gram_eigenvalue": float(eigenvalues[0]),
            "maximum_full_scalar_Gram_eigenvalue": float(eigenvalues[-1]),
            "normalized_determinant_weights": [float(weight) for weight in weights],
            "Gram_antihermitian_residual_before_symmetrization_max": float(
                max(
                    np.linalg.norm(matrix - matrix.conj().T)
                    for matrix in overlap_matrices[name]
                )
            ),
        }

    Wilson_gram, Wilson_weights = normalized_average(
        Wilson_matrices, Wilson_logweights, Wilson_signs
    )
    Wilson_value = float(np.real(witness.conj() @ Wilson_gram @ witness))
    Wilson_eigenvalues = np.linalg.eigvalsh(Wilson_gram)
    method_spread = max(overlap_values) - min(overlap_values)
    negative_margin = -max(overlap_values)
    if not negative_margin > 1.0e6 * max(method_spread, np.finfo(float).eps):
        raise RuntimeError("negative overlap witness lost its cross-method margin")
    if not Wilson_value > 0.0:
        raise RuntimeError("fixed Wilson control is not positive")
    if not min(gaps) > 0.67:
        raise RuntimeError("polar gap unexpectedly small")

    direction_rows = []
    for key in ORBIT:
        site_index, direction_index = key
        direction_rows.append(
            {
                "site": list(A.SITES[site_index]),
                "stored_direction_index": direction_index,
                "integer_direction": list(A.DIRECTIONS[direction_index]),
            }
        )

    witness_rows = []
    for site, coefficient in zip(A.POSITIVE_SITES, WITNESS_EXACT):
        witness_rows.append(
            {
                "positive_site": list(site),
                "coefficient_exact": render_fraction(coefficient),
                "coefficient_decimal": float(coefficient),
            }
        )

    out: dict[str, Any] = {
        "certificate": "URT explicit overlap reflection-orbit counterexample",
        "date": "2026-09-05",
        "observational_targets_used": False,
        "finite_cell": {
            "Nt": A.NT,
            "Ns": A.NS,
            "positive_times": [1, 2],
            "reflection": "theta(t,n)=(-t,n+t(1,1,1))",
            "fermion_matrix_dimension": dimension,
        },
        "fermion_parameters": {
            "r_exact": render_fraction(R_EXACT),
            "M_exact": render_fraction(M_EXACT),
            "c_t": 1,
            "mass_exact": render_fraction(MASS_EXACT),
        },
        "gauge_probe_measure": {
            "varied_reflection_orbit": direction_rows,
            "reflection_phase_rule": "theta exchanges the two links and inverts U",
            "link_unitary_exact": {
                "z": "(12+5i)/13",
                "z_inverse": "(12-5i)/13",
                "unit_norm_identity": "12^2+5^2=13^2",
            },
            "four_configurations": "each varied link independently takes z or z_inverse with probability 1/2",
            "all_other_links": "identity",
            "site_reflection_positive_before_gauge_average": True,
            "physical_measure": "local-Haar gauge average of the four-point product measure",
            "gauge_invariant": True,
            "gauge_average_preserves_invariant_expectations": True,
            "maximum_triangle_norm_deviation_exact": "sqrt(2/13)",
            "maximum_triangle_norm_deviation_numeric": math.sqrt(2.0 / 13.0),
            "maximum_spatial_square_deviation": 0,
            "selected_face_autocorrelation_action": False,
        },
        "observable": {
            "definition": "F=sum_x c_x S_x, S_x=sum_a bar(psi)_(x,a) psi_(x,a)",
            "gauge_invariant": True,
            "coefficients": witness_rows,
            "coefficient_norm_before_normalization": math.sqrt(
                sum(float(value * value) for value in WITNESS_EXACT)
            ),
            "normalization": "the script normalizes this exact rational coefficient vector to unit Euclidean norm",
        },
        "configuration_diagnostics": configuration_rows,
        "polar_cross_checks": {
            "methods": list(polar_names),
            "maximum_pairwise_polar_operator_residuals": {
                key: max(row[key] for row in polar_residuals)
                for key in polar_residuals[0]
            },
            "fixed_witness_value_spread": method_spread,
            "negative_margin_using_least_negative_method": negative_margin,
            "negative_margin_over_method_spread": negative_margin / method_spread,
        },
        "determinant_weighted_OS_results": {
            "overlap": overlap_results,
            "Wilson_control": {
                "fixed_same_witness_OS_value": Wilson_value,
                "minimum_full_scalar_Gram_eigenvalue": float(
                    Wilson_eigenvalues[0]
                ),
                "maximum_full_scalar_Gram_eigenvalue": float(
                    Wilson_eigenvalues[-1]
                ),
                "normalized_determinant_weights": [
                    float(weight) for weight in Wilson_weights
                ],
            },
            "minimum_XdaggerX_over_all_four_configurations": min(gaps),
        },
        "verdict": {
            "status": "N robust finite-volume overlap-specific negative witness",
            "fixed_gauge_invariant_overlap_OS_witness_negative": True,
            "same_fixed_Wilson_witness_positive": True,
            "all_four_polar_kernels_gapped": True,
            "generic_interacting_overlap_RP_supported": False,
            "rigorous_interval_arithmetic_completed": False,
            "selected_face_autocorrelation_weight_decided": False,
            "theory_of_nature": False,
            "conclusion": (
                "Generic gauge-covariant massive overlap reflection positivity fails "
                "this finite RP gauge-measure test numerically.  An interval certificate "
                "would promote the finite statement to E; the specially selected face "
                "weight still requires a direct calculation."
            ),
            "next_executable_gate": (
                "certify the fixed negative scalar with interval/backward-error bounds, "
                "then test whether the selected compact-support face weight contains the same mode"
            ),
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()