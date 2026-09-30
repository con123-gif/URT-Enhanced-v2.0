#!/usr/bin/env python3
"""Adjoint SU(5) symmetry-breaking classification for Cathedral/URT.

The A4 root system conditionally supplies a compact SU(5) gauge envelope, and
the selected centre-plus-tetrahedral plane supplies a 3+2 projector.  This
certificate asks whether a target-blind renormalizable adjoint-Higgs action is
then forced to choose that orbit and its scale.

For a traceless Hermitian adjoint field Phi, the complete SU(5)-invariant real
potential through degree four contains four independent coefficients.  All
stationary eigenvalues obey one cubic, so the nonzero strata have multiplicity
types 4+1, 3+2, 3+1+1, or 2+2+1.  An exact trace inequality shows that even the
reflection-symmetric subfamily can select either 3+2 or 4+1 solely by changing
the sign of an allowed quartic coefficient.  The desired stabilizer and the
breaking scale are therefore not selected by the present symmetry data.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np


def invariants(eigenvalues: np.ndarray) -> tuple[float, float, float]:
    return tuple(float(np.sum(eigenvalues**power)) for power in (2, 3, 4))


def potential(eigenvalues: np.ndarray, a: float, b: float, c: float, d: float) -> float:
    s2, s3, s4 = invariants(eigenvalues)
    return 0.5 * a * s2 + (b / 3.0) * s3 + 0.25 * c * s2**2 + 0.25 * d * s4


def constrained_gradient_residual(
    eigenvalues: np.ndarray, a: float, b: float, c: float, d: float
) -> float:
    s2 = float(np.sum(eigenvalues**2))
    gradient = a * eigenvalues + b * eigenvalues**2 + c * s2 * eigenvalues + d * eigenvalues**3
    return float(np.max(np.abs(gradient - np.mean(gradient))))


def cartan_hessian_eigenvalues(
    eigenvalues: np.ndarray, a: float, b: float, c: float, d: float
) -> np.ndarray:
    s2 = float(np.sum(eigenvalues**2))
    diagonal = a + 2.0 * b * eigenvalues + c * s2 + 3.0 * d * eigenvalues**2
    hessian = np.diag(diagonal) + 2.0 * c * np.outer(eigenvalues, eigenvalues)
    # Orthonormal basis of the trace-zero hyperplane.
    projector = np.eye(5) - np.ones((5, 5)) / 5.0
    values, vectors = np.linalg.eigh(projector)
    basis = vectors[:, values > 0.5]
    return np.linalg.eigvalsh(basis.T @ hessian @ basis)


def two_cluster_branch(m: int, q: float) -> np.ndarray:
    n = 5 - m
    return np.asarray([n * q] * m + [-m * q] * n, dtype=float)


def exact_ratio_for_two_cluster(m: int) -> Fraction:
    n = 5 - m
    return Fraction(5, m * n) - Fraction(3, 5)


def branch_witnesses() -> dict[str, Any]:
    # Same gauge and discrete symmetries, opposite allowed sign of Tr(Phi^4).
    desired_coefficients = (-1.0, 0.0, 1.0, 1.0)
    desired_q = 1.0 / math.sqrt(37.0)
    desired = two_cluster_branch(3, desired_q)
    desired_hessian = cartan_hessian_eigenvalues(desired, *desired_coefficients)

    alternative_coefficients = (-1.0, 0.0, 1.0, -1.0)
    alternative_q = 1.0 / math.sqrt(7.0)
    alternative = two_cluster_branch(4, alternative_q)
    alternative_hessian = cartan_hessian_eigenvalues(alternative, *alternative_coefficients)

    # Exact integer examples of both allowed three-eigenvalue stationary strata.
    three_one_one = np.asarray([1.0, 1.0, 1.0, 2.0, -5.0])
    two_two_one = np.asarray([1.0, 1.0, 2.0, 2.0, -6.0])

    return {
        "three_plus_two_global_example": {
            "coefficients_a_b_c_d": desired_coefficients,
            "eigenvalues": desired.tolist(),
            "stationarity_residual": constrained_gradient_residual(
                desired, *desired_coefficients
            ),
            "cartan_hessian_eigenvalues": desired_hessian.tolist(),
            "minimum_energy_exact": "-15/74",
            "minimum_energy_numeric": potential(desired, *desired_coefficients),
            "stabilizer": "S(U(3)xU(2))",
        },
        "four_plus_one_global_example": {
            "coefficients_a_b_c_d": alternative_coefficients,
            "eigenvalues": alternative.tolist(),
            "stationarity_residual": constrained_gradient_residual(
                alternative, *alternative_coefficients
            ),
            "cartan_hessian_eigenvalues": alternative_hessian.tolist(),
            "minimum_energy_exact": "-5/7",
            "minimum_energy_numeric": potential(
                alternative, *alternative_coefficients
            ),
            "stabilizer": "S(U(4)xU(1))",
        },
        "three_plus_one_plus_one_stationary_example": {
            "coefficients_a_b_c_d": (-45.0, 2.0, 1.0, 1.0),
            "eigenvalues": three_one_one.tolist(),
            "stationarity_residual": constrained_gradient_residual(
                three_one_one, -45.0, 2.0, 1.0, 1.0
            ),
            "stabilizer": "S(U(3)xU(1)xU(1))",
        },
        "two_plus_two_plus_one_stationary_example": {
            "coefficients_a_b_c_d": (-62.0, 3.0, 1.0, 1.0),
            "eigenvalues": two_two_one.tolist(),
            "stationarity_residual": constrained_gradient_residual(
                two_two_one, -62.0, 3.0, 1.0, 1.0
            ),
            "stabilizer": "S(U(2)xU(2)xU(1))",
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    witnesses = branch_witnesses()
    maximum_stationarity_residual = max(
        branch["stationarity_residual"] for branch in witnesses.values()
    )

    out = {
        "certificate": "URT SU(5) adjoint-breaking underdetermination theorem",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "field": "Phi=Phi^dagger in su(5), Tr Phi=0",
        "renormalizable_invariant_classification": {
            "potential": (
                "V=a Tr(Phi^2)/2+b Tr(Phi^3)/3+"
                "c (Tr(Phi^2))^2/4+d Tr(Phi^4)/4+constant"
            ),
            "independent_real_coefficients_excluding_constant": 4,
            "reason": (
                "The conjugation-invariant polynomial ring is generated by the "
                "power traces of degrees 2,3,4,5 for a traceless 5x5 matrix; "
                "through degree four the independent monomials are p2,p3,p2^2,p4."
            ),
            "A5_consequence": (
                "SU(5) invariance already implies invariance under its A5 Weyl "
                "subgroup, so A5 supplies no relation among a,b,c,d.  Allowing only "
                "A5 invariance would add terms rather than remove this family."
            ),
            "status": "E",
        },
        "complete_generic_stationary_strata": {
            "stationary_equation": (
                "d x_i^3+b x_i^2+(a+c S2)x_i-lambda=0, "
                "S2=sum_j x_j^2"
            ),
            "consequence": "Every generic stationary point has at most three distinct eigenvalues.",
            "multiplicity_partitions": [
                "5 (the trace-zero origin)",
                "4+1",
                "3+2",
                "3+1+1",
                "2+2+1",
            ],
            "two_value_solution": {
                "parameterization": (
                    "multiplicities (m,n=5-m), values (n q,-m q)"
                ),
                "stationarity": (
                    "a+b(n-m)q+[5 c m n+d(25-3mn)]q^2=0"
                ),
                "solutions": (
                    "q={-b(n-m)+/-sqrt[b^2(n-m)^2-4aL_m]}/(2L_m), "
                    "L_m=5cmn+d(25-3mn)"
                ),
                "split_hessian": [
                    "h_x=5q[b+d(3n-5)q], multiplicity m-1",
                    "h_y=5q[-b+d(3m-5)q], multiplicity n-1",
                    "h_rad=q[b(n-m)+2L_m q], multiplicity 1",
                ],
            },
            "three_value_solution_when_d_nonzero": {
                "3+1+1": (
                    "values (u,u,u,v,w), u=b/(2d), v+w=-3u, "
                    "vw=[a+(12c+3d)u^2]/(2c+d)"
                ),
                "2+2+1": (
                    "values (u,u,v,v,w), s=u+v=b/d, w=-2s, "
                    "uv=[a+(6c+2d)s^2]/(4c+d)"
                ),
                "reality": (
                    "The corresponding quadratic discriminant must be positive; "
                    "zero discriminant reduces to a two-value stratum."
                ),
                "singular_loci": (
                    "d=0 or vanishing displayed denominators give lower-degree or "
                    "tuned flat cases; they do not restore uniqueness."
                ),
            },
            "status": "E",
        },
        "exact_trace_inequality": {
            "statement": (
                "For real x_i with sum x_i=0, "
                "7/30 <= sum x_i^4/(sum x_i^2)^2 <= 13/20."
            ),
            "lower_equality": "3+2 spectrum, proportional to (2,2,2,-3,-3)",
            "upper_equality": "4+1 spectrum, proportional to (1,1,1,1,-4)",
            "stationary_ratios": {
                "3+2": str(exact_ratio_for_two_cluster(3)),
                "4+1": str(exact_ratio_for_two_cluster(4)),
                "2+2+1_three_value": "1/4",
                "3+1+1_three_value": "1/2",
            },
            "proof": (
                "Extremize p4 at fixed p2 and p1=0.  Each x_i obeys one depressed "
                "cubic.  For two roots the multiplicity formula gives 7/30 or "
                "13/20; for three roots their unweighted sum is zero and the only "
                "multiplicity partitions give ratios 1/4 and 1/2.  Compactness "
                "then proves the bounds."
            ),
            "status": "E",
        },
        "reflection_symmetric_global_selection": {
            "subfamily": "b=0, a<0",
            "boundedness": (
                "c+d r>0 for every r in [7/30,13/20]"
            ),
            "radial_minimum": (
                "At fixed r=p4/p2^2, p2=-a/(c+dr) and "
                "V_min(r)=-a^2/[4(c+dr)]."
            ),
            "d_positive": "The unique orbit type at the global minimum is 3+2.",
            "d_negative": "The unique orbit type at the global minimum is 4+1.",
            "d_zero": "Every trace-zero direction with the same p2 is degenerate.",
            "consequence": (
                "The sign of one allowed invariant coefficient decides between the "
                "desired Standard-Model stabilizer and S(U(4)xU(1))."
            ),
            "status": "E",
        },
        "deterministic_branch_witnesses": witnesses,
        "maximum_stationarity_residual": maximum_stationarity_residual,
        "finite_seed_scope": {
            "available_direction": (
                "Once a centre-plus-tetrahedral plane P2 is chosen, "
                "Y=-P3/3+P2/2 is an exact 3+2 adjoint direction."
            ),
            "missing_dynamics": (
                "A gauge-invariant linear preference for that fixed Y is forbidden; "
                "an SU(5)-invariant potential sees only its spectrum and retains the "
                "four free coefficients above.  A coupled dynamical seed field would "
                "be an additional action premise."
            ),
        },
        "verdict": {
            "three_plus_two_stabilizer_given_orbit": "E",
            "dynamical_three_plus_two_selection": "U",
            "breaking_scale": "U",
            "no_go": (
                "The current A4/A5 and parent-gauge data identify the desired 3+2 "
                "orbit but do not select it dynamically.  Symmetry permits equally "
                "valid bounded potentials with a 4+1 vacuum, an unbroken vacuum, or "
                "additional stationary strata, and the mass/quartic ratios set a "
                "continuous breaking scale."
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