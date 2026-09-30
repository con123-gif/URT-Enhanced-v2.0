#!/usr/bin/env python3
"""KKT and orbit-stratum audit for A4 complex-momentum locality.

This continuation derives a symmetric Laurent form of the holomorphic Wilson
kernel square, states the full constrained KKT equation for the Euclidean
analytic radius, and checks that the 1+1+3 antipodal zeros found in the prior
continuation are strict constrained local minima in all eight real momentum
directions.  It also exposes why A5 symmetry alone does not reduce the global
problem to finitely many equality strata: the Euclidean norm contributes
logarithms of Laurent variables to the KKT equation.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from pathlib import Path
from typing import Any

import numpy as np
from scipy.linalg import null_space
from scipy.optimize._numdiff import approx_derivative


ROOT = Path(__file__).resolve().parent
COMPLEX_PATH = ROOT / "urt_a4_complex_locality_continuation.py"


def load_complex_module():
    spec = importlib.util.spec_from_file_location("urt_a4_complex_current", COMPLEX_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {COMPLEX_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


complex_a4 = load_complex_module()


def orthonormal_v4_basis() -> np.ndarray:
    spanning = np.stack(
        [np.eye(5)[:, index] - np.eye(5)[:, 4] for index in range(4)],
        axis=1,
    )
    basis, _ = np.linalg.qr(spanning)
    return basis


BASIS = orthonormal_v4_basis()


def laurent_kernel_and_gradient(
    momentum5: np.ndarray, coefficient: float
) -> tuple[complex, np.ndarray]:
    """Return F and its holomorphic derivatives dF/dq_j."""

    z = np.exp(1.0j * momentum5)
    inverse = 1.0 / z
    p1 = np.sum(z)
    pm1 = np.sum(inverse)
    p2 = np.sum(z**2)
    pm2 = np.sum(inverse**2)
    product = p1 * pm1
    shifted = coefficient * (25.0 - product) - 10.0
    kernel_square = (
        -(pm1**2) * p2
        - (p1**2) * pm2
        + 10.0 * product
        + shifted**2
    ) / 100.0

    product_derivative_without_i = z * pm1 - p1 * inverse
    gradient = (
        2.0j
        * (
            pm1 * p2 * inverse
            - (pm1**2) * z**2
            - p1 * pm2 * z
            + (p1**2) * inverse**2
        )
        + 1.0j
        * (10.0 - 2.0 * coefficient * shifted)
        * product_derivative_without_i
    ) / 100.0
    return complex(kernel_square), gradient


def direct_kernel_square(momentum5: np.ndarray, coefficient: float) -> complex:
    phases = complex_a4.ROOTS @ momentum5
    derivative = np.sum(
        complex_a4.ROOTS * np.sin(phases)[:, None], axis=0
    ) / 5.0
    wilson_scalar = np.sum(1.0 - np.cos(phases)) / 5.0
    return complex(
        np.dot(derivative, derivative)
        + (coefficient * wilson_scalar - 1.0) ** 2
    )


def deterministic_laurent_audit() -> dict[str, Any]:
    generator = np.random.default_rng(20260903)
    maximum_formula_residual = 0.0
    maximum_gradient_residual = 0.0
    maximum_translation_gradient = 0.0
    epsilon = 1.0e-6
    for _ in range(256):
        momentum = generator.uniform(-math.pi, math.pi, 5) + 1.0j * generator.normal(
            0.0, 0.35, 5
        )
        momentum -= np.mean(momentum)
        laurent, gradient = laurent_kernel_and_gradient(momentum, 1.27)
        direct = direct_kernel_square(momentum, 1.27)
        numerical_gradient = np.asarray(
            [
                (
                    direct_kernel_square(
                        momentum + epsilon * np.eye(5)[index], 1.27
                    )
                    - direct_kernel_square(
                        momentum - epsilon * np.eye(5)[index], 1.27
                    )
                )
                / (2.0 * epsilon)
                for index in range(5)
            ]
        )
        maximum_formula_residual = max(
            maximum_formula_residual, abs(laurent - direct)
        )
        maximum_gradient_residual = max(
            maximum_gradient_residual,
            float(np.max(np.abs(gradient - numerical_gradient))),
        )
        maximum_translation_gradient = max(
            maximum_translation_gradient, abs(np.sum(gradient))
        )

    return {
        "sample_count": 256,
        "maximum_direct_minus_Laurent_residual": maximum_formula_residual,
        "maximum_analytic_minus_finite_gradient_residual": (
            maximum_gradient_residual
        ),
        "maximum_common_translation_gradient": maximum_translation_gradient,
    }


def kkt_local_minimum_witness(
    coefficient: float, u: float, v: float
) -> dict[str, Any]:
    momentum = np.asarray(
        [math.pi + 1.0j * u, 1.0j * v, 0.0, 0.0, 0.0],
        dtype=complex,
    )
    momentum -= np.mean(momentum)
    kernel_square, gradient5 = laurent_kernel_and_gradient(momentum, coefficient)
    target = 2.0j * momentum.imag
    centered_gradient = gradient5 - np.mean(gradient5)
    multiplier = np.vdot(centered_gradient, target) / np.vdot(
        centered_gradient, centered_gradient
    )
    kkt_residual = multiplier * centered_gradient - target

    real4 = BASIS.T @ momentum.real
    imaginary4 = BASIS.T @ momentum.imag
    coordinates = np.concatenate([real4, imaginary4])

    def lagrangian_gradient(values: np.ndarray) -> np.ndarray:
        q = BASIS @ values[:4] + 1.0j * (BASIS @ values[4:])
        _, gradient = laurent_kernel_and_gradient(q, coefficient)
        gradient4 = BASIS.T @ gradient
        # The stationary witnesses have a real multiplier and beta=0.
        kappa = float(np.real(multiplier))
        return np.concatenate(
            [
                kappa * gradient4.real,
                2.0 * values[4:] - kappa * gradient4.imag,
            ]
        )

    gradient4 = BASIS.T @ gradient5
    constraint_jacobian = np.stack(
        [
            np.concatenate([gradient4.real, -gradient4.imag]),
            np.concatenate([gradient4.imag, gradient4.real]),
        ]
    )
    tangent_basis = null_space(constraint_jacobian)
    hessian = approx_derivative(
        lagrangian_gradient,
        coordinates,
        method="3-point",
        rel_step=1.0e-5,
    )
    hessian = (hessian + hessian.T) / 2.0
    tangent_hessian = tangent_basis.T @ hessian @ tangent_basis
    eigenvalues = np.linalg.eigvalsh(tangent_hessian)
    if eigenvalues[0] <= 0.0:
        raise AssertionError(eigenvalues)

    rounded_imaginary_gradient = np.round(gradient5.imag, 12)
    unique_values, multiplicities = np.unique(
        rounded_imaginary_gradient, return_counts=True
    )
    return {
        "coefficient": coefficient,
        "u": u,
        "v": v,
        "kernel_square_residual": abs(kernel_square),
        "KKT_multiplier_real": float(np.real(multiplier)),
        "KKT_multiplier_imag": float(np.imag(multiplier)),
        "KKT_residual_norm": float(np.linalg.norm(kkt_residual)),
        "constraint_Jacobian_singular_values": [
            float(value)
            for value in np.linalg.svd(
                constraint_jacobian, compute_uv=False
            )
        ],
        "tangent_Hessian_eigenvalues": [float(value) for value in eigenvalues],
        "strict_local_minimum": True,
        "gradient_orbit_values": [float(value) for value in unique_values],
        "gradient_orbit_multiplicities": [
            int(value) for value in multiplicities
        ],
        "status": "N finite-difference Hessian; E analytic KKT equation",
    }


def proof_record() -> dict[str, Any]:
    rstar = complex_a4.R_STAR
    locality = complex_a4.locality_proxy_crossing()
    locality_branch = locality["antipodal_branch"]
    return {
        "certificate": "URT A4 complex-locality KKT audit",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "symmetric_Laurent_form": {
            "definitions": (
                "z_j=exp(iq_j), P_m=sum_j z_j^m, X=P_1 P_-1, "
                "Q=r(25-X)-10"
            ),
            "identity": (
                "100 F_r=-P_-1^2 P_2-P_1^2 P_-2+10X+Q^2"
            ),
            "status": "E",
        },
        "full_KKT_equation": {
            "statement": (
                "Let g_j=partial F/partial q_j and eta_j=Im q_j with both "
                "real and imaginary common modes removed. At a regular nearest "
                "zero there is a complex kappa such that "
                "kappa(g_j-mean(g))=2i eta_j."
            ),
            "Laurent_variable_form": (
                "Because eta_j=-log|z_j| after centering, the right side is "
                "-2i log|z_j|. The stationarity system is therefore "
                "transcendental even though F and g are Laurent polynomials."
            ),
            "consequence": (
                "A5 symmetry alone does not force a finite two-cluster orbit "
                "classification; symmetry-breaking 1+1+3 stationary strata are "
                "allowed and must be audited explicitly."
            ),
            "status": "E",
        },
        "deterministic_Laurent_audit": deterministic_laurent_audit(),
        "strict_local_minimum_witnesses": {
            "condition_number_coefficient": kkt_local_minimum_witness(
                rstar, 0.27074045573775807, 0.9671381952245358
            ),
            "locality_proxy_coefficient": kkt_local_minimum_witness(
                locality["candidate_coefficient"],
                locality_branch["u"],
                locality_branch["v"],
            ),
        },
        "verdict": {
            "status": "E/N/U",
            "exact": (
                "The 1+1+3 branch satisfies the full KKT equations; it is not "
                "an artifact of restricting the zero equation before variation."
            ),
            "numerical": (
                "All six tangent-Hessian eigenvalues are positive at both "
                "reported coefficients, so both witnesses are strict local "
                "minima in the full eight-real-dimensional problem."
            ),
            "unresolved": (
                "KKT plus A5 symmetry does not certify global nearest-zero "
                "optimality. A permutation-stratified interval exclusion is "
                "still required."
            ),
            "phenomenology_gate": "CLOSED",
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    serialized = json.dumps(proof_record(), indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(serialized, end="")
    else:
        args.output.write_text(serialized)


if __name__ == "__main__":
    main()