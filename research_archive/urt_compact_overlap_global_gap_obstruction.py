#!/usr/bin/env python3
"""Global-gap obstruction for the compact reflected overlap merger.

For the selected reflected Wilson kernel define

    H(U) = gamma_5 (D_W(U)-M).

H is Hermitian and H^2=X^dagger X.  This script uses the exact derivative of
the eigenvalue of H nearest zero to locate a rough compact U(1) background.
It then varies just one link phase and exhibits two nonsingular endpoints
whose Hermitian inertias differ by one.  Since H depends continuously on that
phase, an exact zero eigenvalue must occur between the endpoints.

Thus the polar overlap operator cannot be a continuous globally defined
function on the full compact-link configuration space.  A measure-zero value
can be assigned by convention, but no uniform spectral gap or uniform
locality bound exists on the support of an unqualified Wilson/Haar gauge
measure.  One must select admissible sectors, keep a domain-wall/Wilson
regulator explicit, or prove a weaker measure-local continuum statement.

The endpoint inertia is a high-margin numerical certificate; the
intermediate-value implication from certified inertia is exact.  No
observational target is used.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from pathlib import Path
from typing import Any

import numpy as np
from scipy.optimize import minimize


HERE = Path(__file__).resolve().parent
BOUNDARY_AUDIT = HERE / "urt_interacting_overlap_os_boundary_audit.py"
SEED = 20260904
LEFT_DELTA = -1.0
RIGHT_DELTA = 0.5


def load_boundary_module() -> Any:
    spec = importlib.util.spec_from_file_location("urt_boundary_audit", BOUNDARY_AUDIT)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {BOUNDARY_AUDIT}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


A = load_boundary_module()
GAMMAS, GAMMA5 = A.gamma_matrices()
IDENTITY4 = np.eye(4, dtype=complex)
SITE_COUNT = len(A.SITES)
DIRECTION_COUNT = len(A.DIRECTIONS)
MATRIX_DIMENSION = 4 * SITE_COUNT
IDENTITY = np.eye(MATRIX_DIMENSION, dtype=complex)
GAMMA5_BIG = np.kron(np.eye(SITE_COUNT), GAMMA5)


def link_derivative_data() -> list[tuple[int, int, np.ndarray, np.ndarray, int, int]]:
    rows = []
    for site_index, site in enumerate(A.SITES):
        for direction_index, displacement in enumerate(A.DIRECTIONS):
            endpoint = A.SITE_INDEX[A.shift(site, displacement)]
            if direction_index < 3:
                gamma = GAMMAS[direction_index + 1]
                forward = 0.5 * (gamma - A.R_SELECTED * IDENTITY4)
                backward = 0.5 * (-gamma - A.R_SELECTED * IDENTITY4)
            else:
                gamma = GAMMAS[0]
                forward = (A.C_SELECTED * gamma - IDENTITY4) / 16.0
                backward = (-A.C_SELECTED * gamma - IDENTITY4) / 16.0
            reverse = tuple(-value for value in displacement)
            rows.append(
                (
                    site_index,
                    endpoint,
                    forward,
                    backward,
                    A.antiperiodic_sign(site, displacement),
                    A.antiperiodic_sign(A.SITES[endpoint], reverse),
                )
            )
    return rows


DERIVATIVE_DATA = link_derivative_data()


def hermitian_wilson(flat_phases: np.ndarray) -> np.ndarray:
    phases = flat_phases.reshape(SITE_COUNT, DIRECTION_COUNT)
    x_matrix = A.wilson_operator(phases) - A.M_SELECTED * IDENTITY
    return GAMMA5_BIG @ x_matrix


def nearest_eigenpair(
    flat_phases: np.ndarray,
) -> tuple[float, np.ndarray, np.ndarray, np.ndarray]:
    hermitian_matrix = hermitian_wilson(flat_phases)
    eigenvalues, eigenvectors = np.linalg.eigh(hermitian_matrix)
    nearest_index = int(np.argmin(np.abs(eigenvalues)))
    return (
        float(eigenvalues[nearest_index]),
        eigenvectors[:, nearest_index],
        eigenvalues,
        hermitian_matrix,
    )


def signed_eigenvalue_gradient(flat_phases: np.ndarray, vector: np.ndarray) -> np.ndarray:
    links = np.exp(1.0j * flat_phases)
    gradient = np.empty_like(flat_phases)
    for link_index, (
        start,
        endpoint,
        forward,
        backward,
        forward_sign,
        backward_sign,
    ) in enumerate(DERIVATIVE_DATA):
        link = links[link_index]
        forward_derivative = 1.0j * forward_sign * forward * link
        backward_derivative = (
            -1.0j * backward_sign * backward * np.conjugate(link)
        )
        start_vector = vector[4 * start : 4 * start + 4]
        endpoint_vector = vector[4 * endpoint : 4 * endpoint + 4]
        gradient[link_index] = float(
            np.real(
                np.vdot(
                    start_vector,
                    GAMMA5 @ forward_derivative @ endpoint_vector,
                )
                + np.vdot(
                    endpoint_vector,
                    GAMMA5 @ backward_derivative @ start_vector,
                )
            )
        )
    return gradient


def gap_objective(flat_phases: np.ndarray) -> tuple[float, np.ndarray]:
    eigenvalue, vector, _, _ = nearest_eigenpair(flat_phases)
    eigenvalue_gradient = signed_eigenvalue_gradient(flat_phases, vector)
    return eigenvalue**2, 2.0 * eigenvalue * eigenvalue_gradient


def inertia_diagnostics(flat_phases: np.ndarray) -> dict[str, Any]:
    _, _, eigenvalues, hermitian_matrix = nearest_eigenpair(flat_phases)
    vectors_values, vectors = np.linalg.eigh(hermitian_matrix)
    reconstruction = (
        vectors * vectors_values[None, :]
    ) @ vectors.conj().T
    reconstruction_residual = float(
        np.linalg.norm(hermitian_matrix - reconstruction, ord=2)
    )
    hermiticity_residual = float(
        np.linalg.norm(hermitian_matrix - hermitian_matrix.conj().T, ord=2)
    )
    minimum_absolute = float(np.min(np.abs(eigenvalues)))
    negative_count = int(np.sum(eigenvalues < 0.0))
    return {
        "negative_eigenvalue_count": negative_count,
        "overlap_index_minus_half_trace_signH": negative_count
        - MATRIX_DIMENSION // 2,
        "minimum_absolute_H_eigenvalue": minimum_absolute,
        "minimum_XdaggerX_eigenvalue": minimum_absolute**2,
        "smallest_H_eigenvalue": float(eigenvalues[0]),
        "largest_H_eigenvalue": float(eigenvalues[-1]),
        "Hermiticity_residual": hermiticity_residual,
        "eigendecomposition_reconstruction_residual": reconstruction_residual,
        "gap_to_numerical_residual_ratio": minimum_absolute
        / max(reconstruction_residual, hermiticity_residual, np.finfo(float).eps),
    }


def plaquette_diagnostics(flat_phases: np.ndarray) -> dict[str, float]:
    phases = flat_phases.reshape(SITE_COUNT, DIRECTION_COUNT)
    spatial_fluxes = []
    electric_fluxes = []
    for site_index, site in enumerate(A.SITES):
        for first in range(3):
            for second in range(first + 1, 3):
                site_first = A.SITE_INDEX[A.shift(site, A.DIRECTIONS[first])]
                site_second = A.SITE_INDEX[A.shift(site, A.DIRECTIONS[second])]
                flux = (
                    phases[site_index, first]
                    + phases[site_first, second]
                    - phases[site_second, first]
                    - phases[site_index, second]
                )
                spatial_fluxes.append(float(np.angle(np.exp(1.0j * flux))))
        for temporal in range(3, DIRECTION_COUNT):
            temporal_site = A.SITE_INDEX[A.shift(site, A.DIRECTIONS[temporal])]
            for spatial in range(3):
                spatial_site = A.SITE_INDEX[A.shift(site, A.DIRECTIONS[spatial])]
                flux = (
                    phases[site_index, temporal]
                    + phases[temporal_site, spatial]
                    - phases[spatial_site, temporal]
                    - phases[site_index, spatial]
                )
                electric_fluxes.append(float(np.angle(np.exp(1.0j * flux))))

    spatial_array = np.asarray(spatial_fluxes)
    electric_array = np.asarray(electric_fluxes)
    spatial_action = float(np.sum(1.0 - np.cos(spatial_array)))
    electric_action = float(np.sum(1.0 - np.cos(electric_array)))
    action = 4.0 * spatial_action + electric_action
    return {
        "spatial_plaquette_count": len(spatial_fluxes),
        "electric_plaquette_count": len(electric_fluxes),
        "maximum_spatial_plaquette_angle": float(np.max(np.abs(spatial_array))),
        "maximum_electric_plaquette_angle": float(np.max(np.abs(electric_array))),
        "maximum_plaquette_deviation_from_identity": float(
            max(
                np.max(np.abs(np.exp(1.0j * spatial_array) - 1.0)),
                np.max(np.abs(np.exp(1.0j * electric_array) - 1.0)),
            )
        ),
        "Wilson_gauge_action_at_beta_1_ratio_4_to_1": action,
        "finite_action": bool(np.isfinite(action)),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    rng = np.random.default_rng(SEED)
    initial = rng.uniform(
        -math.pi, math.pi, size=SITE_COUNT * DIRECTION_COUNT
    )
    initial_value, initial_gradient = gap_objective(initial)
    gradient_checks = []
    finite_step = 1.0e-6
    for coordinate in (0, 17, 300):
        plus = initial.copy()
        minus = initial.copy()
        plus[coordinate] += finite_step
        minus[coordinate] -= finite_step
        finite_difference = (
            gap_objective(plus)[0] - gap_objective(minus)[0]
        ) / (2.0 * finite_step)
        gradient_checks.append(
            {
                "coordinate": coordinate,
                "analytic": float(initial_gradient[coordinate]),
                "finite_difference": float(finite_difference),
                "residual": float(
                    abs(initial_gradient[coordinate] - finite_difference)
                ),
            }
        )

    optimization = minimize(
        gap_objective,
        initial,
        jac=True,
        method="L-BFGS-B",
        options={"maxiter": 300, "ftol": 1.0e-18, "gtol": 1.0e-13, "maxls": 40},
    )
    optimized = np.asarray(optimization.x)
    optimized_eigenvalue, optimized_vector, _, _ = nearest_eigenpair(optimized)
    eigenvalue_gradient = signed_eigenvalue_gradient(optimized, optimized_vector)
    varied_link = int(np.argmax(np.abs(eigenvalue_gradient)))

    left = optimized.copy()
    right = optimized.copy()
    left[varied_link] += LEFT_DELTA
    right[varied_link] += RIGHT_DELTA
    left_diagnostics = inertia_diagnostics(left)
    right_diagnostics = inertia_diagnostics(right)
    if (
        left_diagnostics["negative_eigenvalue_count"]
        == right_diagnostics["negative_eigenvalue_count"]
    ):
        raise RuntimeError("the deterministic one-link endpoints do not bracket an inertia change")

    # Locate the crossing using inertia, without treating a noisy adaptive
    # minimum as the logical proof of existence.
    lower_delta = LEFT_DELTA
    upper_delta = RIGHT_DELTA
    lower_inertia = left_diagnostics["negative_eigenvalue_count"]
    for _ in range(80):
        midpoint = 0.5 * (lower_delta + upper_delta)
        trial = optimized.copy()
        trial[varied_link] += midpoint
        trial_inertia = inertia_diagnostics(trial)["negative_eigenvalue_count"]
        if trial_inertia == lower_inertia:
            lower_delta = midpoint
        else:
            upper_delta = midpoint
        if upper_delta - lower_delta < 2.0e-14:
            break
    crossing_delta = 0.5 * (lower_delta + upper_delta)
    crossing = optimized.copy()
    crossing[varied_link] += crossing_delta
    crossing_diagnostics = inertia_diagnostics(crossing)

    varied_site_index, varied_direction = divmod(varied_link, DIRECTION_COUNT)
    out: dict[str, Any] = {
        "certificate": "URT compact-overlap global-gap obstruction",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "finite_cell": {
            "Nt": A.NT,
            "Ns": A.NS,
            "matrix_dimension": MATRIX_DIMENSION,
            "compact_U1_link_variables": SITE_COUNT * DIRECTION_COUNT,
            "antiperiodic_time": True,
        },
        "selected_kernel": {
            "r": A.R_SELECTED,
            "M": A.M_SELECTED,
            "c_t": A.C_SELECTED,
            "identity": "H=gamma5(D_W-M), H^2=X^dagger X",
        },
        "optimization": {
            "seed": SEED,
            "initial_minimum_XdaggerX": initial_value,
            "analytic_gradient_checks": gradient_checks,
            "maximum_gradient_check_residual": max(
                row["residual"] for row in gradient_checks
            ),
            "iterations": int(optimization.nit),
            "function_evaluations": int(optimization.nfev),
            "reported_success": bool(optimization.success),
            "message": str(optimization.message),
            "optimized_nearest_H_eigenvalue": optimized_eigenvalue,
            "optimized_minimum_XdaggerX": optimized_eigenvalue**2,
            "maximum_signed_eigenvalue_derivative": float(
                eigenvalue_gradient[varied_link]
            ),
            "optimized_flat_link_phases": optimized.tolist(),
            "status": "N reproducible zero search; not the existence argument",
        },
        "one_link_inertia_bracket": {
            "varied_flat_link_index": varied_link,
            "varied_site_index": varied_site_index,
            "varied_site": list(A.SITES[varied_site_index]),
            "varied_direction_index": varied_direction,
            "varied_direction": list(A.DIRECTIONS[varied_direction]),
            "left_phase_delta": LEFT_DELTA,
            "right_phase_delta": RIGHT_DELTA,
            "left": {
                **left_diagnostics,
                "plaquettes": plaquette_diagnostics(left),
            },
            "right": {
                **right_diagnostics,
                "plaquettes": plaquette_diagnostics(right),
            },
            "inertia_difference": int(
                right_diagnostics["negative_eigenvalue_count"]
                - left_diagnostics["negative_eigenvalue_count"]
            ),
            "crossing_delta_bracket": [lower_delta, upper_delta],
            "crossing_delta_bracket_width": upper_delta - lower_delta,
            "crossing_midpoint": crossing_diagnostics,
            "exact_implication": (
                "H(delta) is a continuous finite Hermitian matrix. Different "
                "endpoint inertias force det H=0 for some intermediate delta."
            ),
            "status": "E implication conditional on N high-margin endpoint inertia",
        },
        "measure_support": {
            "endpoint_Wilson_actions_are_finite": True,
            "Haar_support": "every open link neighborhood has positive Haar measure",
            "Wilson_weight": (
                "exp(-beta S_g)>0 at both endpoints and throughout the finite-action path"
            ),
            "consequence": (
                "Every neighborhood of the zero-gap surface is in the support of "
                "the unqualified compact Wilson/Haar gauge measure."
            ),
        },
        "verdict": {
            "uniform_global_kernel_gap": False,
            "globally_continuous_polar_overlap_on_all_compact_links": False,
            "almost_everywhere_definition_possible": True,
            "what_fails": (
                "A globally uniform locality theorem and a continuous one-chart "
                "overlap definition on the full compact-link space."
            ),
            "required_repair": [
                "restrict to explicitly selected admissible topological sectors",
                "prove the restricted gauge weight remains reflection positive",
                "or keep a finite domain-wall/Wilson regulator and take a controlled limit",
            ],
            "interacting_overlap_reflection_positivity_decided": False,
            "status": "F global-gap merger; U repaired interacting theory",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()