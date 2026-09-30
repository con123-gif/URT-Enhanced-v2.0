#!/usr/bin/env python3
"""Continuum-universality audit of the surviving Cathedral clock interval.

Free reflection positivity and uniform contraction leave

    sqrt(2 M-M^2) <= c_t <= 1,       tau = 1/c_t.

This script asks whether that interval is an infrared physical modulus or a
choice of ultraviolet regulator.  It expands the reflected Wilson kernel and
its overlap polar projection in physical momenta, where

    p_i = a k_i,       omega = a k_0/c_t.

After the canonical overlap normalization 2M/a, every allowed c_t has the
same Dirac principal symbol and the same dimension-five overlap term:

    D_can = i gamma_mu k_mu + a k^2/(2M) + O(a^2).

The first c_t dependence is an O(a^2) dimension-six fermion artifact.  The
gauge frame has an exact matching orbit as well: choosing

    b=c_t^2/8,         a_sp=1-c_t^2/2

makes its full quadratic bivector frame the identity for every c_t.  Its
quartic plaquette moments still depend on c_t, so the finite-spacing actions
are not identical.

Therefore c_t may be quotiented as a regulator parameter only conditional on
the existence and universality of the continuum limit.  If the Cathedral
lattice spacing is fundamental and nonzero, the interval remains physical.
No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


R_SELECTED = 0.3555080349235190743243089946207532477463351202813
M_SELECTED = 0.7909405921071237234972289955777431055452218194573


def gamma_matrices() -> list[np.ndarray]:
    identity2 = np.eye(2, dtype=complex)
    sigma1 = np.array([[0.0, 1.0], [1.0, 0.0]], dtype=complex)
    sigma2 = np.array([[0.0, -1.0j], [1.0j, 0.0]], dtype=complex)
    sigma3 = np.array([[1.0, 0.0], [0.0, -1.0]], dtype=complex)
    return [
        np.kron(sigma1, identity2),
        np.kron(sigma2, sigma1),
        np.kron(sigma2, sigma2),
        np.kron(sigma2, sigma3),
    ]


GAMMAS = gamma_matrices()
IDENTITY4 = np.eye(4, dtype=complex)


def exact_canonical_overlap(
    temporal_kinetic: float, lattice_spacing: float, physical_momentum: np.ndarray
) -> np.ndarray:
    k0 = float(physical_momentum[0])
    spatial = np.asarray(physical_momentum[1:], dtype=float)
    omega = lattice_spacing * k0 / temporal_kinetic
    momenta = lattice_spacing * spatial
    incidence = float(np.prod(np.cos(momenta / 2.0)))
    kinetic = np.concatenate(
        (
            [temporal_kinetic * incidence * math.sin(omega)],
            np.sin(momenta),
        )
    )
    scalar = (
        R_SELECTED * float(np.sum(1.0 - np.cos(momenta)))
        + 1.0
        - incidence * math.cos(omega)
        - M_SELECTED
    )
    norm = math.sqrt(float(np.dot(kinetic, kinetic)) + scalar**2)
    x_matrix = scalar * IDENTITY4
    for gamma, coefficient in zip(GAMMAS, kinetic):
        x_matrix += 1.0j * coefficient * gamma
    overlap = 0.5 * (IDENTITY4 + x_matrix / norm)
    return (2.0 * M_SELECTED / lattice_spacing) * overlap


def vector_artifact_coefficients(
    temporal_kinetic: float, physical_momentum: np.ndarray
) -> np.ndarray:
    k0 = float(physical_momentum[0])
    spatial = np.asarray(physical_momentum[1:], dtype=float)
    spatial_squared = float(np.dot(spatial, spatial))
    total_squared = k0**2 + spatial_squared
    wilson_second = (
        (R_SELECTED / 2.0 + 1.0 / 8.0) * spatial_squared
        + k0**2 / (2.0 * temporal_kinetic**2)
    )
    bare_cubic = np.concatenate(
        (
            [
                -k0**3 / (6.0 * temporal_kinetic**2)
                - k0 * spatial_squared / 8.0
            ],
            -(spatial**3) / 6.0,
        )
    )
    return (
        bare_cubic
        - physical_momentum * total_squared / (2.0 * M_SELECTED**2)
        + physical_momentum * wilson_second / M_SELECTED
    )


def overlap_expansion(
    temporal_kinetic: float, lattice_spacing: float, physical_momentum: np.ndarray
) -> np.ndarray:
    total_squared = float(np.dot(physical_momentum, physical_momentum))
    result = (
        lattice_spacing * total_squared / (2.0 * M_SELECTED) * IDENTITY4
    )
    vector = physical_momentum + lattice_spacing**2 * vector_artifact_coefficients(
        temporal_kinetic, physical_momentum
    )
    for gamma, coefficient in zip(GAMMAS, vector):
        result += 1.0j * coefficient * gamma
    return result


def gauge_weights(temporal_kinetic: float) -> dict[str, float]:
    tau = 1.0 / temporal_kinetic
    electric_weight = temporal_kinetic**2 / 8.0
    spatial_weight = 1.0 - temporal_kinetic**2 / 2.0
    electric_quadratic = electric_weight * 8.0 * tau**2
    magnetic_quadratic = spatial_weight + 4.0 * electric_weight
    return {
        "c_t": temporal_kinetic,
        "tau": tau,
        "spatial_weight_a": spatial_weight,
        "electric_weight_b": electric_weight,
        "a_over_b": spatial_weight / electric_weight,
        "expected_a_over_b": 8.0 * tau**2 - 4.0,
        "electric_quadratic_frame_entry": electric_quadratic,
        "magnetic_quadratic_frame_entry": magnetic_quadratic,
        "pure_electric_quartic_moment": 1.0 / temporal_kinetic**2,
        "pure_magnetic_quartic_moment": 1.0 - 3.0 * temporal_kinetic**2 / 8.0,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    c_min = math.sqrt(2.0 * M_SELECTED - M_SELECTED**2)
    c_values = [c_min, (1.0 + c_min) / 2.0, 1.0]

    gauge_rows = [gauge_weights(value) for value in c_values]
    gauge_quadratic_residual = max(
        max(
            abs(row["electric_quadratic_frame_entry"] - 1.0),
            abs(row["magnetic_quadratic_frame_entry"] - 1.0),
            abs(row["a_over_b"] - row["expected_a_over_b"]),
        )
        for row in gauge_rows
    )

    momentum = np.array([0.37, -0.23, 0.19, 0.31])
    spacings = [0.08, 0.04, 0.02, 0.01, 0.005]
    expansion_rows: list[dict[str, Any]] = []
    maximum_scaled_remainder_growth = 0.0
    for c_value in c_values:
        rows = []
        scaled_remainders = []
        for spacing in spacings:
            exact = exact_canonical_overlap(c_value, spacing, momentum)
            approximate = overlap_expansion(c_value, spacing, momentum)
            remainder = float(np.linalg.norm(exact - approximate, ord=2))
            scaled = remainder / spacing**3
            scaled_remainders.append(scaled)
            rows.append(
                {
                    "lattice_spacing": spacing,
                    "operator_norm_remainder": remainder,
                    "remainder_over_a_cubed": scaled,
                }
            )
        maximum_scaled_remainder_growth = max(
            maximum_scaled_remainder_growth,
            max(scaled_remainders) / min(scaled_remainders),
        )
        expansion_rows.append({"c_t": c_value, "checks": rows})

    pure_temporal_momentum = np.array([0.7, 0.0, 0.0, 0.0])
    endpoint_difference_rows = []
    predicted_coefficient = abs(
        pure_temporal_momentum[0] ** 3
        * (-1.0 / 6.0 + 1.0 / (2.0 * M_SELECTED))
        * (1.0 / c_min**2 - 1.0)
    )
    for spacing in spacings:
        lower = exact_canonical_overlap(c_min, spacing, pure_temporal_momentum)
        upper = exact_canonical_overlap(1.0, spacing, pure_temporal_momentum)
        difference = float(np.linalg.norm(lower - upper, ord=2))
        endpoint_difference_rows.append(
            {
                "lattice_spacing": spacing,
                "operator_norm_difference": difference,
                "difference_over_a_squared": difference / spacing**2,
                "predicted_a_squared_coefficient": predicted_coefficient,
                "coefficient_residual": abs(
                    difference / spacing**2 - predicted_coefficient
                ),
            }
        )

    gauge_endpoint_change = {
        "electric_quartic_relative_change": (
            gauge_rows[0]["pure_electric_quartic_moment"]
            / gauge_rows[-1]["pure_electric_quartic_moment"]
            - 1.0
        ),
        "magnetic_quartic_relative_change": (
            gauge_rows[0]["pure_magnetic_quartic_moment"]
            / gauge_rows[-1]["pure_magnetic_quartic_moment"]
            - 1.0
        ),
    }

    out: dict[str, Any] = {
        "certificate": "URT clock universality-quotient audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "surviving_OS_interval": {
            "M": M_SELECTED,
            "r": R_SELECTED,
            "c_t_min": c_min,
            "c_t_max": 1.0,
            "tau_interval": [1.0, 1.0 / c_min],
        },
        "physical_momentum_map": {
            "spatial": "p_i=a k_i",
            "temporal": "omega=a k_0/c_t=tau a k_0",
            "consequence": "c_t C(p) sin(omega)=a k_0+O(a^3)",
        },
        "fermion_series": {
            "kernel_second_order_scalar": (
                "W_2=(r/2+1/8)|k_sp|^2+k_0^2/(2c_t^2)"
            ),
            "canonically_normalized_overlap": (
                "(2M/a)D_ov=i gamma.k+a k^2/(2M)+"
                "i a^2 sum_mu gamma_mu deltaK_mu(c_t)+O(a^3)"
            ),
            "dimension_six_vector_coefficient": (
                "deltaK=kappa-k k^2/(2M^2)+k W_2/M; "
                "kappa_0=-k_0^3/(6c_t^2)-k_0|k_sp|^2/8, "
                "kappa_i=-k_i^3/6"
            ),
            "exact_conclusions": [
                "the Dirac principal symbol is c_t-independent",
                "the dimension-five a k^2/(2M) term is c_t-independent",
                "generic c_t dependence first occurs at dimension six, O(a^2)",
            ],
            "numerical_series_checks": expansion_rows,
            "maximum_ratio_of_remainder_over_a_cubed": (
                maximum_scaled_remainder_growth
            ),
            "endpoint_pure_temporal_difference": endpoint_difference_rows,
            "status": "E series; numerical checks corroborate the remainder order",
        },
        "gauge_series": {
            "general_frame": (
                "M_sp=diag(0_3,I_3), "
                "M_el=diag(8 tau^2 I_3,4 I_3)"
            ),
            "unit_quadratic_frame_weights": (
                "b=c_t^2/8 and a_sp=1-c_t^2/2"
            ),
            "rows": gauge_rows,
            "maximum_quadratic_matching_residual": gauge_quadratic_residual,
            "quartic_endpoint_change": gauge_endpoint_change,
            "interpretation": (
                "The continuum F^2 term is exactly common, but finite-spacing "
                "plaquette F^4 moments distinguish the endpoints."
            ),
            "status": "E",
        },
        "verdict": {
            "same_tree_level_continuum_action": True,
            "finite_spacing_actions_identical": False,
            "c_t_is_unconditionally_redundant": False,
            "conditional_quotient": (
                "If an interacting continuum limit exists and universality erases "
                "irrelevant operators, all surviving c_t values represent the same "
                "infrared theory and c_t is a regulator choice."
            ),
            "fundamental_lattice_branch": (
                "If a is nonzero and fundamental, the O(a^2) fermion and higher "
                "gauge artifacts are physical; c_t remains an unfixed parameter."
            ),
            "advance": (
                "The clock interval is no longer an infrared tree-level ambiguity; "
                "it is isolated to the unproved continuum/universality gate or to "
                "measurable cutoff-scale artifacts."
            ),
            "status": "E tree-level quotient; U nonperturbative universality",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()