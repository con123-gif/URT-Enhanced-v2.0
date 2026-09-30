#!/usr/bin/env python3
"""Complex-momentum locality audit for the normalized A4 overlap family.

The exact real-torus minimax coefficient need not maximize exponential
position-space locality.  This target-blind continuation studies zeros of the
analytic Wilson-kernel square

    F_r(q) = sum_mu S_mu(q)^2 + [r B(q)-1]^2

for complex A4 momentum q.  Such zeros are branch singularities of the overlap
polar factor and hence give upper bounds on analytic-strip widths.  Two exact
two-cluster reductions and a symmetry-reduced 1+1+3 antipodal branch are
compared, then checked by deterministic full eight-variable multistarts.

The symmetry-reduced formulae are exact.  The claim that the reported zero is
globally nearest on the full complex torus remains numerical.
"""

from __future__ import annotations

import argparse
import cmath
import json
import math
from pathlib import Path
from typing import Any

import numpy as np
from scipy.optimize import minimize, root


R_STAR = 1.169543397160372


def a4_roots() -> np.ndarray:
    roots = []
    for i in range(5):
        for j in range(i + 1, 5):
            item = np.zeros(5)
            item[i] = 1.0
            item[j] = -1.0
            roots.append(item)
    return np.asarray(roots)


ROOTS = a4_roots()


def analytic_kernel_square(raw: np.ndarray, coefficient: float) -> complex:
    """Evaluate F_r with q_5 gauge-fixed to zero.

    raw contains four real phases followed by four imaginary phases.  No
    complex conjugation occurs: this is the holomorphic continuation of H^2.
    """

    momentum = np.concatenate([raw[:4], np.zeros(1)]) + 1.0j * np.concatenate(
        [raw[4:], np.zeros(1)]
    )
    phases = ROOTS @ momentum
    derivative = np.sum(
        ROOTS * np.sin(phases)[:, None], axis=0
    ) / 5.0
    wilson_scalar = np.sum(1.0 - np.cos(phases)) / 5.0
    return complex(
        np.dot(derivative, derivative)
        + (coefficient * wilson_scalar - 1.0) ** 2
    )


def centered_imaginary_norm_squared(raw: np.ndarray) -> float:
    imaginary = np.concatenate([raw[4:], np.zeros(1)])
    imaginary -= np.mean(imaginary)
    return float(np.dot(imaginary, imaginary))


def two_cluster_singularity(coefficient: float, k: int) -> dict[str, Any]:
    """Nearest zero inside the k+(5-k) two-cluster complex slice."""

    ell = 5 - k
    alpha = 5.0 / (k * ell)
    b_roots = np.roots(
        np.asarray(
            [coefficient**2 - alpha, 2.0 * (1.0 - coefficient), 1.0]
        )
    )
    candidates = []
    for b_value in b_roots:
        cosine = 1.0 - 5.0 * b_value / (k * ell)
        phase_difference = cmath.acos(cosine)
        width = math.sqrt(k * ell / 5.0) * abs(phase_difference.imag)
        residual = (
            1.0
            + 2.0 * (1.0 - coefficient) * b_value
            + (coefficient**2 - alpha) * b_value**2
        )
        candidates.append(
            {
                "width": width,
                "B_real": float(np.real(b_value)),
                "B_imag": float(np.imag(b_value)),
                "phase_real": float(phase_difference.real),
                "phase_imag": float(phase_difference.imag),
                "quadratic_residual": float(abs(residual)),
            }
        )
    nearest = min(candidates, key=lambda item: item["width"])
    return {
        "multiplicities": [k, ell],
        "analytic_equation": (
            f"1+2(1-r)B+(r^2-{alpha:.16g})B^2=0"
        ),
        "nearest": nearest,
        "all_roots": candidates,
        "status": "E formula; N decimal evaluation",
    }


def antipodal_branch_values(
    coordinates: np.ndarray, coefficient: float
) -> tuple[float, float, float, float]:
    """Return F, width^2, B and D on q=(pi+iu, iv, 0,0,0)."""

    u, v = coordinates
    sinh_difference = math.sinh(u - v)
    sinh_u = math.sinh(u)
    sinh_v = math.sinh(v)
    first = sinh_difference + 3.0 * sinh_u
    second = sinh_difference + 3.0 * sinh_v
    third = sinh_u - sinh_v
    derivative_magnitude = (
        first**2 + second**2 + 3.0 * third**2
    ) / 25.0
    wilson_scalar = (
        7.0
        + math.cosh(u - v)
        + 3.0 * math.cosh(u)
        - 3.0 * math.cosh(v)
    ) / 5.0
    kernel_square = (
        coefficient * wilson_scalar - 1.0
    ) ** 2 - derivative_magnitude
    width_squared = (4.0 * u**2 + 4.0 * v**2 - 2.0 * u * v) / 5.0
    return kernel_square, width_squared, wilson_scalar, derivative_magnitude


def antipodal_stationarity(
    coordinates: np.ndarray, coefficient: float
) -> np.ndarray:
    """F=0 plus constrained stationarity of the Euclidean imaginary norm."""

    u, v = coordinates
    sinh_difference = math.sinh(u - v)
    sinh_u = math.sinh(u)
    sinh_v = math.sinh(v)
    cosh_difference = math.cosh(u - v)
    cosh_u = math.cosh(u)
    cosh_v = math.cosh(v)
    first = sinh_difference + 3.0 * sinh_u
    second = sinh_difference + 3.0 * sinh_v
    third = sinh_u - sinh_v
    wilson_scalar = (
        7.0 + cosh_difference + 3.0 * cosh_u - 3.0 * cosh_v
    ) / 5.0
    derivative_magnitude = (
        first**2 + second**2 + 3.0 * third**2
    ) / 25.0
    kernel_square = (
        coefficient * wilson_scalar - 1.0
    ) ** 2 - derivative_magnitude

    b_u = first / 5.0
    b_v = -second / 5.0
    d_u = 2.0 * (
        first * (cosh_difference + 3.0 * cosh_u)
        + second * cosh_difference
        + 3.0 * third * cosh_u
    ) / 25.0
    d_v = 2.0 * (
        -first * cosh_difference
        + second * (-cosh_difference + 3.0 * cosh_v)
        - 3.0 * third * cosh_v
    ) / 25.0
    f_u = (
        2.0
        * coefficient
        * (coefficient * wilson_scalar - 1.0)
        * b_u
        - d_u
    )
    f_v = (
        2.0
        * coefficient
        * (coefficient * wilson_scalar - 1.0)
        * b_v
        - d_v
    )
    norm_u = (8.0 * u - 2.0 * v) / 5.0
    norm_v = (8.0 * v - 2.0 * u) / 5.0
    tangent_stationarity = norm_u * f_v - norm_v * f_u
    return np.asarray([kernel_square, tangent_stationarity])


def solve_antipodal_branch(
    coefficient: float, initial: tuple[float, float]
) -> dict[str, Any]:
    solution = root(
        lambda coordinates: antipodal_stationarity(coordinates, coefficient),
        np.asarray(initial),
        tol=1.0e-12,
    )
    if not solution.success:
        raise RuntimeError(solution.message)
    kernel_square, width_squared, wilson_scalar, derivative_magnitude = (
        antipodal_branch_values(solution.x, coefficient)
    )
    stationarity = antipodal_stationarity(solution.x, coefficient)
    return {
        "coefficient": coefficient,
        "u": float(solution.x[0]),
        "v": float(solution.x[1]),
        "width": math.sqrt(width_squared),
        "width_squared": width_squared,
        "B": wilson_scalar,
        "D": derivative_magnitude,
        "kernel_square_residual": abs(kernel_square),
        "stationarity_residual": float(abs(stationarity[1])),
        "branch": "q=(pi+i u, i v, 0,0,0), up to A5 permutation/sign",
    }


def two_plus_three_width_squared(coefficient: float) -> float:
    return two_cluster_singularity(coefficient, 2)["nearest"]["width"] ** 2


def locality_proxy_crossing() -> dict[str, Any]:
    """Solve where the rising antipodal branch meets the 2+3 branch."""

    def equations(values: np.ndarray) -> np.ndarray:
        u, v, coefficient = values
        fixed = antipodal_stationarity(np.asarray([u, v]), coefficient)
        _, width_squared, _, _ = antipodal_branch_values(
            np.asarray([u, v]), coefficient
        )
        return np.asarray(
            [
                fixed[0],
                fixed[1],
                width_squared - two_plus_three_width_squared(coefficient),
            ]
        )

    solution = root(
        equations,
        np.asarray([0.3018, 1.0870, 1.3114]),
        method="lm",
        options={"ftol": 1.0e-14, "xtol": 1.0e-14, "gtol": 1.0e-14},
    )
    if not solution.success:
        raise RuntimeError(solution.message)
    u, v, coefficient = solution.x
    branch = solve_antipodal_branch(coefficient, (u, v))
    two_cluster = two_cluster_singularity(coefficient, 2)
    residuals = equations(solution.x)
    return {
        "candidate_coefficient": float(coefficient),
        "candidate_width": branch["width"],
        "antipodal_branch": branch,
        "two_plus_three_branch": two_cluster,
        "crossing_residual": float(np.max(np.abs(residuals))),
        "status": (
            "N: exact branch equations, numerical stationary crossing; global "
            "nearest-zero optimality on the full complex torus is not proved"
        ),
    }


def branch_start(
    u: float, v: float, first_index: int, second_index: int
) -> np.ndarray:
    momentum = np.zeros(5, dtype=complex)
    momentum[first_index] = math.pi + 1.0j * u
    momentum[second_index] = 1.0j * v
    momentum -= momentum[4]
    return np.concatenate([momentum[:4].real, momentum[:4].imag])


def full_complex_multistart(
    coefficient: float,
    branch_u: float,
    branch_v: float,
    seed: int,
) -> dict[str, Any]:
    """Search all four real and four imaginary relative momenta."""

    starts = [
        branch_start(branch_u, branch_v, first, second)
        for first in range(5)
        for second in range(5)
        if first != second
    ]
    generator = np.random.default_rng(seed)
    for _ in range(20):
        starts.append(
            np.concatenate(
                [
                    generator.uniform(-math.pi, math.pi, 4),
                    generator.normal(0.0, 1.0, 4),
                ]
            )
        )

    constraints = [
        {
            "type": "eq",
            "fun": lambda raw: analytic_kernel_square(raw, coefficient).real,
        },
        {
            "type": "eq",
            "fun": lambda raw: analytic_kernel_square(raw, coefficient).imag,
        },
    ]
    successful = []
    best = None
    for start in starts:
        result = minimize(
            centered_imaginary_norm_squared,
            start,
            method="SLSQP",
            bounds=[(-math.pi, math.pi)] * 4 + [(-5.0, 5.0)] * 4,
            constraints=constraints,
            options={"ftol": 1.0e-12, "maxiter": 1200},
        )
        residual = abs(analytic_kernel_square(result.x, coefficient))
        if result.success and residual < 1.0e-7:
            width = math.sqrt(centered_imaginary_norm_squared(result.x))
            successful.append(width)
            if best is None or width < best[0]:
                best = (width, result, residual)
    if best is None:
        raise RuntimeError("full complex multistart found no feasible zero")

    width, result, residual = best
    real = np.concatenate([result.x[:4], np.zeros(1)])
    imaginary = np.concatenate([result.x[4:], np.zeros(1)])
    real -= np.mean(real)
    imaginary -= np.mean(imaginary)
    successful.sort()
    return {
        "start_count": len(starts),
        "successful_count": len(successful),
        "best_width": width,
        "best_kernel_square_residual": residual,
        "best_centered_real_momentum5": [float(value) for value in real],
        "best_centered_imaginary_momentum5": [
            float(value) for value in imaginary
        ],
        "ten_smallest_feasible_widths": successful[:10],
        "status": "N deterministic multistart; not an exhaustive proof",
    }


def main_record() -> dict[str, Any]:
    crossing = locality_proxy_crossing()
    locality_coefficient = crossing["candidate_coefficient"]
    rstar_branch = solve_antipodal_branch(R_STAR, (0.2707, 0.9671))
    locality_branch = crossing["antipodal_branch"]

    rstar_search = full_complex_multistart(
        R_STAR,
        rstar_branch["u"],
        rstar_branch["v"],
        20260903,
    )
    locality_search = full_complex_multistart(
        locality_coefficient,
        locality_branch["u"],
        locality_branch["v"],
        20260904,
    )
    width_ratio = locality_search["best_width"] / rstar_search["best_width"]

    return {
        "certificate": "URT A4 complex-momentum locality audit",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "analytic_setup": {
            "kernel_square": "F_r(q)=sum_mu S_mu(q)^2+[rB(q)-1]^2",
            "complex_conjugation_used": False,
            "strip_metric": (
                "A5-invariant Euclidean norm of centered Im(q) in V4"
            ),
            "interpretation": (
                "Every zero is an overlap-polar branch singularity and gives an "
                "upper bound on the isotropic analytic radius."
            ),
            "status": "E",
        },
        "two_cluster_at_condition_minimax": {
            "one_plus_four": two_cluster_singularity(R_STAR, 1),
            "two_plus_three": two_cluster_singularity(R_STAR, 2),
        },
        "antipodal_1_plus_1_plus_3_at_condition_minimax": rstar_branch,
        "locality_proxy_crossing": crossing,
        "full_complex_multistarts": {
            "at_condition_minimax": rstar_search,
            "at_locality_proxy_candidate": locality_search,
        },
        "comparison": {
            "condition_number_coefficient": R_STAR,
            "locality_proxy_coefficient": locality_coefficient,
            "coefficient_difference": locality_coefficient - R_STAR,
            "condition_candidate_width": rstar_search["best_width"],
            "locality_proxy_width": locality_search["best_width"],
            "width_ratio": width_ratio,
            "width_increase_percent": 100.0 * (width_ratio - 1.0),
        },
        "verdict": {
            "status": "N/U",
            "statement": (
                "The deterministic search finds a nearer 1+1+3 antipodal "
                "singularity than either two-cluster slice.  The three-family "
                "analytic-radius proxy is maximized at r approximately "
                "1.311415007, not at the exact condition-number value "
                "1.169543397.  Thus spectral conditioning and complex-strip "
                "locality are inequivalent selection proposals.  A certified "
                "global complex-torus bound is still required before calling the "
                "new coefficient a true locality optimum."
            ),
            "axiom_consequence": (
                "Do not adopt either coefficient silently; the archive contains "
                "no rule choosing between these target-blind locality criteria."
            ),
            "phenomenology_gate": "CLOSED",
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    serialized = json.dumps(main_record(), indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(serialized, end="")
    else:
        args.output.write_text(serialized)


if __name__ == "__main__":
    main()