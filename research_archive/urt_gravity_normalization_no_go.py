#!/usr/bin/env python3
"""Gravity-normalization and vacuum-energy no-go for Cathedral/URT.

The finite construction supplies an exact trace-free symmetric source type and
an exact entropy-transfer identity.  This certificate asks what follows after
adding the stated continuum assumptions: a torsion-free metric, locality,
diffeomorphism invariance, and a bulk Lagrangian containing at most two metric
derivatives.

Those assumptions select the Einstein-Hilbert plus cosmological *form*, but not
its two coefficients.  More sharply, the trace-free source is insensitive to
the cosmological term, normalized Gibbs states are invariant under additive
cost shifts, and the pointwise representation type does not imply a conserved
stress tensor.  Hence neither G/a_*^2 nor Lambda a_*^2 is selected by the
present data.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


ETA_DELTA = 5.995797986741314


def hermitian_function(matrix: np.ndarray, function: Any) -> np.ndarray:
    """Apply a real scalar function to a Hermitian matrix spectrally."""
    values, vectors = np.linalg.eigh(matrix)
    return (vectors * function(values)) @ vectors.conj().T


def gibbs_state(prior: np.ndarray, cost: np.ndarray, eta: float) -> tuple[np.ndarray, float]:
    log_prior = hermitian_function(prior, np.log)
    unnormalized = hermitian_function(log_prior - eta * cost, np.exp)
    partition = float(np.trace(unnormalized).real)
    return unnormalized / partition, partition


def additive_shift_witnesses() -> tuple[list[dict[str, float]], float]:
    # A faithful prior and a positive cost that do not commute.
    prior = np.diag([0.41, 0.29, 0.19, 0.11]).astype(complex)
    generator = np.asarray(
        [
            [0.30 + 0.10j, -0.20 + 0.05j, 0.10, 0.00],
            [0.05, 0.35 - 0.10j, -0.08j, 0.12],
            [-0.10j, 0.04, 0.28 + 0.06j, -0.09],
            [0.07, -0.11j, 0.03, 0.24 - 0.02j],
        ],
        dtype=complex,
    )
    cost = generator.conj().T @ generator
    state, partition = gibbs_state(prior, cost, ETA_DELTA)
    identity = np.eye(cost.shape[0])
    records: list[dict[str, float]] = []
    maximum_residual = 0.0
    for shift in (0.0, 0.07, 0.19, 0.41):
        shifted_state, shifted_partition = gibbs_state(
            prior, cost + shift * identity, ETA_DELTA
        )
        state_residual = float(np.linalg.norm(shifted_state - state, ord="fro"))
        predicted_partition = math.exp(-ETA_DELTA * shift) * partition
        partition_residual = abs(shifted_partition - predicted_partition)
        free_energy_shift_residual = abs(
            (-math.log(shifted_partition) + math.log(partition))
            - ETA_DELTA * shift
        )
        residual = max(
            state_residual, partition_residual, free_energy_shift_residual
        )
        maximum_residual = max(maximum_residual, residual)
        records.append(
            {
                "additive_shift": shift,
                "state_frobenius_residual": state_residual,
                "partition_law_residual": partition_residual,
                "free_energy_shift_residual": free_energy_shift_residual,
            }
        )
    return records, maximum_residual


def tracefree_source(x: np.ndarray, y: np.ndarray) -> np.ndarray:
    raw = 3.0 * np.outer(x, x) + 5.0 * np.outer(y, y)
    return raw - np.trace(raw) * np.eye(4) / 4.0


def conservation_counterexample() -> dict[str, float | str]:
    # On flat R^4 let x(u)=(1+u)e_1 and y=0.  The source is pointwise in
    # Sym^2_0, yet div Sigma has component d_u Sigma_11=(9/2)(1+u).
    u = 0.2
    f = 1.0 + u
    x = np.asarray([f, 0.0, 0.0, 0.0])
    y = np.zeros(4)
    source = tracefree_source(x, y)
    analytic_divergence_component = 4.5 * f
    epsilon = 1.0e-6
    x_plus = np.asarray([f + epsilon, 0.0, 0.0, 0.0])
    x_minus = np.asarray([f - epsilon, 0.0, 0.0, 0.0])
    finite_difference = (
        tracefree_source(x_plus, y)[0, 0]
        - tracefree_source(x_minus, y)[0, 0]
    ) / (2.0 * epsilon)
    return {
        "field": "x(u)=(1+u)e_1, y(u)=0 on flat R^4",
        "trace_residual": float(abs(np.trace(source))),
        "divergence_component_exact": analytic_divergence_component,
        "divergence_component_finite_difference": float(finite_difference),
        "finite_difference_residual": float(
            abs(finite_difference - analytic_divergence_component)
        ),
    }


def scale_witnesses() -> tuple[list[dict[str, float]], float]:
    records: list[dict[str, float]] = []
    maximum_residual = 0.0
    a_star = 1.7
    newton = 0.23
    cosmological = -0.08
    g_dimensionless = newton / a_star**2
    lambda_dimensionless = cosmological * a_star**2
    for scale in (0.3, 0.8, 2.0, 7.0):
        scaled_a = scale * a_star
        scaled_newton = scale**2 * newton
        scaled_cosmological = cosmological / scale**2
        g_residual = abs(scaled_newton / scaled_a**2 - g_dimensionless)
        lambda_residual = abs(
            scaled_cosmological * scaled_a**2 - lambda_dimensionless
        )
        maximum_residual = max(maximum_residual, g_residual, lambda_residual)
        records.append(
            {
                "scale": scale,
                "G_over_a_star_squared_residual": g_residual,
                "Lambda_a_star_squared_residual": lambda_residual,
            }
        )
    return records, maximum_residual


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    shifts, shift_residual = additive_shift_witnesses()
    conservation = conservation_counterexample()
    scales, scale_residual = scale_witnesses()

    out = {
        "certificate": "URT gravity normalization and vacuum-energy no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "continuum_assumptions": [
            "four-dimensional torsion-free metric",
            "local diffeomorphism-invariant bulk action",
            "metric Lagrangian with at most two derivatives",
            "boundary terms omitted from the bulk equation",
        ],
        "two_derivative_classification": {
            "bulk_basis": ["integral sqrt(|g|)", "integral sqrt(|g|) R"],
            "general_action": "S_g=integral sqrt(|g|) (A R+B)",
            "coefficient_dimension": 2,
            "proof": (
                "At derivative order zero the only metric scalar is a constant. "
                "At derivative order two, Levi-Civita covariance combines metric "
                "derivatives into one Riemann tensor, whose only scalar contraction "
                "is R; the epsilon contraction vanishes by the first Bianchi identity."
            ),
            "einstein_parameterization": {
                "A": "1/(16 pi G)",
                "B": "-Lambda/(8 pi G)=-2 Lambda A",
                "field_equation": "G_mn+Lambda g_mn=8 pi G T_mn",
            },
            "status": "E conditional on the listed continuum assumptions",
        },
        "lattice_dimensionless_coefficients": {
            "g_G": "G/a_*^2",
            "lambda_Lambda": "Lambda a_*^2",
            "curvature_coefficient": "a_*^2/(16 pi G)=1/(16 pi g_G)",
            "volume_coefficient": (
                "-Lambda a_*^4/(8 pi G)=-lambda_Lambda/(8 pi g_G)"
            ),
            "conclusion": (
                "Supplying a_* converts units but supplies no equation for either "
                "dimensionless coefficient."
            ),
        },
        "tracefree_projection_theorem": {
            "equation": "Ricci_0=8 pi G T_0",
            "cosmological_cancellation": (
                "The trace-free projection annihilates Lambda g_mn exactly."
            ),
            "application": (
                "The hidden 4+5 source Sigma is exactly trace-free, so its normalized "
                "Ricci representation map contains no information about Lambda."
            ),
            "newton_degeneracy": (
                "If T_0=C Sigma/a_*^4, the equation contains only the product "
                "(G/a_*^2) C.  The replacement (g_G,C)->(s g_G,C/s) leaves it unchanged."
            ),
            "status": "E",
        },
        "gibbs_vacuum_shift_theorem": {
            "state": "rho_K=exp(log rho0-eta K)/Z_K",
            "identity": (
                "rho_{K+cI}=rho_K and Z_{K+cI}=exp(-eta c) Z_K for every real c"
            ),
            "free_energy": "-log Z_{K+cI}=-log Z_K+eta c",
            "local_gravity_consequence": (
                "A constant cost per cell becomes a volume/vacuum term when cell "
                "number or geometry varies.  All normalized-state and entropy-transfer "
                "data are blind to its coefficient, so they cannot select Lambda."
            ),
            "deterministic_noncommuting_witnesses": shifts,
            "maximum_witness_residual": shift_residual,
            "status": "E",
        },
        "conservation_gate": {
            "requirement": "nabla^m T_mn=0 follows from the Bianchi identity",
            "representation_is_insufficient": (
                "Membership in Sym^2_0(V4) is pointwise algebraic and does not imply "
                "a differential conservation law."
            ),
            "counterexample": conservation,
            "status": "U for the project source dynamics",
        },
        "unit_rescaling_witnesses": scales,
        "maximum_unit_rescaling_residual": scale_residual,
        "verdict": {
            "einstein_hilbert_plus_cosmological_form": (
                "E conditional on locality, diffeomorphism invariance and the "
                "two-derivative metric premise"
            ),
            "G_over_a_star_squared": "U",
            "Lambda_a_star_squared": "U",
            "conserved_hidden_stress_tensor": "U",
            "no_go": (
                "The exact finite entropy and 4+5 curvature-typing identities do not "
                "select the gravitational normalization or vacuum energy.  They fix a "
                "tensor channel, not the two continuum coefficients or conservation law."
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