#!/usr/bin/env python3
"""Can the universal entropy action select SU(5)->3+2 breaking?

Let Phi be traceless Hermitian with eigenvalues x_i.  Apply the universal KMS
entropy function h to three natural SU(5) carriers: the fundamental 5, the
adjoint 24, and the Cathedral matter carrier Lambda^even(C^5)=16.

Exact weight sums give

  Tr_5 rho(Phi)^4  = p4,
  Tr_24 ad(Phi)^4  = 10 p4+6 p2^2,
  Tr_16 rho(Phi)^2 = 4 p2,
  Tr_16 rho(Phi)^4 = 3 p2^2-2 p4.

Since h(x)=log(2)-x^2/8+x^4/64+O(x^6), a fixed small norm selects the minimum
p4 orbit (3+2) in 5 and 24, but the maximum p4 orbit (4+1) in the actual
exterior 16.  Thus the universal cutoff does not remove the finite-trace
choice.  More decisively, along every nonzero ray Tr h(s rho(Phi)) is strictly
decreasing for s>0, so entropy alone selects no finite breaking scale.

No observational target is used.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from pathlib import Path
from typing import Any, Callable

import numpy as np
from scipy.optimize import minimize


def entropy_h(value: float | np.ndarray) -> float | np.ndarray:
    x = np.abs(np.asarray(value, dtype=float))
    first = np.logaddexp(0.0, -x)
    second = np.where(x > 40.0, x * np.exp(-x), x / (1.0 + np.exp(x)))
    result = first + second
    if np.ndim(value) == 0:
        return float(result)
    return result


def entropy_h_prime_positive(x: float) -> float:
    if x < 0.0:
        raise ValueError("x must be nonnegative")
    return -x / (4.0 * math.cosh(x / 2.0) ** 2)


def representation_weights(name: str, eigenvalues: np.ndarray) -> np.ndarray:
    if name == "fundamental_5":
        return np.asarray(eigenvalues, dtype=float)
    if name == "adjoint_24":
        roots = [
            eigenvalues[i] - eigenvalues[j]
            for i in range(5)
            for j in range(5)
            if i != j
        ]
        return np.asarray([0.0] * 4 + roots, dtype=float)
    if name == "exterior_even_16":
        degree_two = [
            eigenvalues[i] + eigenvalues[j]
            for i, j in itertools.combinations(range(5), 2)
        ]
        degree_four = [-eigenvalues[i] for i in range(5)]
        return np.asarray([0.0] + degree_two + degree_four, dtype=float)
    raise ValueError(f"unknown representation {name}")


def spectral_entropy(name: str, eigenvalues: np.ndarray) -> float:
    return float(np.sum(entropy_h(representation_weights(name, eigenvalues))))


def two_cluster(multiplicity: int, radius: float) -> np.ndarray:
    other = 5 - multiplicity
    q = radius / math.sqrt(5.0 * multiplicity * other)
    return np.asarray(
        [other * q] * multiplicity + [-multiplicity * q] * other,
        dtype=float,
    )


def trace_formula_audit() -> tuple[list[dict[str, float]], float]:
    rng = np.random.default_rng(20260904)
    rows = []
    maximum_residual = 0.0
    for _ in range(20):
        x = rng.normal(size=5)
        x -= np.mean(x)
        p2 = float(np.sum(x**2))
        p4 = float(np.sum(x**4))
        expected = {
            "fundamental_5": (p2, p4),
            "adjoint_24": (10.0 * p2, 10.0 * p4 + 6.0 * p2**2),
            "exterior_even_16": (4.0 * p2, 3.0 * p2**2 - 2.0 * p4),
        }
        record: dict[str, float] = {"p2": p2, "p4": p4}
        for name, (expected_t2, expected_t4) in expected.items():
            weights = representation_weights(name, x)
            t2 = float(np.sum(weights**2))
            t4 = float(np.sum(weights**4))
            residual = max(abs(t2 - expected_t2), abs(t4 - expected_t4))
            maximum_residual = max(maximum_residual, residual)
            record[f"{name}_T2_residual"] = abs(t2 - expected_t2)
            record[f"{name}_T4_residual"] = abs(t4 - expected_t4)
        rows.append(record)
    return rows, maximum_residual


def trace_zero_basis() -> np.ndarray:
    projector = np.eye(5) - np.ones((5, 5)) / 5.0
    values, vectors = np.linalg.eigh(projector)
    return vectors[:, values > 0.5]


def fixed_radius_search(name: str, radius: float, starts: int = 36) -> dict[str, Any]:
    basis = trace_zero_basis()

    def point(parameters: np.ndarray) -> np.ndarray:
        vector = basis @ parameters
        norm = float(np.linalg.norm(vector))
        if norm < 1.0e-14:
            vector = basis[:, 0]
            norm = 1.0
        return radius * vector / norm

    def objective(parameters: np.ndarray) -> float:
        return spectral_entropy(name, point(parameters))

    best_value = math.inf
    best_point: np.ndarray | None = None
    rng = np.random.default_rng(20260904 + int(1000 * radius) + len(name))
    for _ in range(starts):
        initial = rng.normal(size=4)
        result = minimize(
            objective,
            initial,
            method="BFGS",
            options={"gtol": 1.0e-10, "maxiter": 1500},
        )
        candidate = point(result.x)
        value = spectral_entropy(name, candidate)
        if value < best_value:
            best_value = value
            best_point = candidate

    if best_point is None:
        raise RuntimeError("fixed-radius optimization did not run")
    branch_32 = two_cluster(3, radius)
    branch_41 = two_cluster(4, radius)
    return {
        "representation": name,
        "radius": radius,
        "best_multistart_entropy": best_value,
        "best_sorted_eigenvalues": np.sort(best_point).tolist(),
        "three_plus_two_entropy": spectral_entropy(name, branch_32),
        "four_plus_one_entropy": spectral_entropy(name, branch_41),
        "best_minus_three_plus_two": best_value - spectral_entropy(name, branch_32),
        "best_minus_four_plus_one": best_value - spectral_entropy(name, branch_41),
    }


def radial_rows(name: str, direction: np.ndarray) -> list[dict[str, float]]:
    weights = np.abs(representation_weights(name, direction))
    rows = []
    for scale in (0.05, 0.2, 1.0, 3.0, 10.0):
        analytic = sum(
            entropy_h_prime_positive(scale * float(weight)) * float(weight)
            for weight in weights
        )
        epsilon = 1.0e-6
        plus = spectral_entropy(name, (scale + epsilon) * direction)
        minus = spectral_entropy(name, (scale - epsilon) * direction)
        finite_difference = (plus - minus) / (2.0 * epsilon)
        rows.append(
            {
                "scale": scale,
                "entropy": spectral_entropy(name, scale * direction),
                "analytic_derivative": analytic,
                "finite_difference_derivative": finite_difference,
                "derivative_residual": abs(analytic - finite_difference),
            }
        )
    return rows


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    trace_rows, trace_residual = trace_formula_audit()
    representations = ("fundamental_5", "adjoint_24", "exterior_even_16")

    numerical_searches = [
        fixed_radius_search(name, radius)
        for name in representations
        for radius in (0.3, 1.0, 3.0)
    ]

    direction_32 = two_cluster(3, 1.0)
    radial = {
        name: radial_rows(name, direction_32) for name in representations
    }
    maximum_derivative_residual = max(
        row["derivative_residual"]
        for rows in radial.values()
        for row in rows
    )

    out: dict[str, Any] = {
        "certificate": "URT entropy spectral-action SU(5)-breaking audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "universal_function": {
            "h": "h(x)=log(1+exp(-|x|))+|x|/(1+exp(|x|))",
            "Taylor_series": "h(x)=log(2)-x^2/8+x^4/64-x^6/576+O(x^8)",
            "radial_derivative": "h'(x)=-x/[4 cosh^2(x/2)] for x>0",
            "status": "E",
        },
        "exact_representation_traces": {
            "definitions": "p_k=sum_i x_i^k, p_1=0",
            "formulas": {
                "fundamental_5": {"T2": "p2", "T4": "p4"},
                "adjoint_24": {"T2": "10 p2", "T4": "10 p4+6 p2^2"},
                "exterior_even_16": {"T2": "4 p2", "T4": "3 p2^2-2 p4"},
            },
            "exterior_weights": "0; x_i+x_j for i<j; -x_i",
            "self_adjoint_completion": (
                "Adding the conjugate 16bar doubles every trace and does not "
                "change the orbit-selection sign."
            ),
            "numerical_audit_rows": trace_rows,
            "maximum_trace_formula_residual": trace_residual,
            "status": "E",
        },
        "small_fixed_norm_orbit_theorem": {
            "trace_inequality": "7/30<=p4/p2^2<=13/20",
            "lower_equality": "3+2, proportional to (2,2,2,-3,-3)",
            "upper_equality": "4+1, proportional to (1,1,1,1,-4)",
            "entropy_expansion": (
                "Tr_R h(rho_R(Phi))=dim(R)log(2)-T2/8+T4/64+O(||Phi||^6)"
            ),
            "selection": {
                "fundamental_5": "3+2 for sufficiently small fixed nonzero p2",
                "adjoint_24": "3+2 for sufficiently small fixed nonzero p2",
                "exterior_even_16": "4+1 for sufficiently small fixed nonzero p2",
            },
            "consequence": (
                "The same universal entropy function gives opposite breaking "
                "orbits on two equally natural finite traces. On the Cathedral "
                "matter carrier itself, its weak-field preference is the wrong "
                "4+1 stabilizer."
            ),
            "status": "E asymptotically at fixed norm",
        },
        "finite_radius_numerical_audit": {
            "multistarts_per_case": 36,
            "rows": numerical_searches,
            "interpretation": (
                "These target-blind searches illustrate the exact small-field "
                "sign and show that the adjoint trace can change to a lower-symmetry "
                "shape as the radius grows. They are not global numerical proofs."
            ),
            "status": "N",
        },
        "radial_scale_no_go": {
            "theorem": (
                "For any nonzero represented direction, d/ds Tr h(s rho(Phi))="
                "sum_a h'(s|lambda_a|)|lambda_a|<0 for every s>0."
            ),
            "maximization": "The unique maximal-entropy point is Phi=0 (unbroken).",
            "minimization": (
                "The entropy decreases toward the infinite-radius boundary and "
                "has no finite nonzero radial minimum."
            ),
            "derivative_witnesses": radial,
            "maximum_derivative_residual": maximum_derivative_residual,
            "status": "E",
        },
        "verdict": {
            "entropy_selects_three_plus_two_on_fundamental_trace": "E conditional at small fixed norm",
            "entropy_selects_three_plus_two_on_Cathedral_16_trace": "F at small fixed norm",
            "entropy_selects_finite_breaking_scale": "F",
            "dynamical_three_plus_two_breaking": "U",
            "advance": (
                "The universal entropy cutoff fixes the quartic sign only after a "
                "finite representation is chosen. The actual exterior matter trace "
                "prefers 4+1 near the origin, while unconstrained entropy has a radial "
                "runaway. A finite Dirac/Higgs construction remains indispensable."
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