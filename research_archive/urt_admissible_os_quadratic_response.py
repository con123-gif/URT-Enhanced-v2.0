#!/usr/bin/env python3
"""Deterministic weak-gauge OS curvature on the certified overlap domain.

For the gauge-invariant, site-reflection-positive probe measure defined in
``urt_admissible_gauge_invariant_os_audit.py``, every stored link angle is an
independent uniform variable on [-alpha,alpha].  If K(phi) is a fermionic OS
matrix and d(phi)=det D(phi), analyticity at the free field gives

  E[d K] / E[d]
    = K(0) + alpha^2 C + O(alpha^4),

  C = (1/6) sum_l ((d K)_{,ll}/d(0) - K(0) d_{,ll}/d(0)).

All mixed second derivatives vanish because the link variables are
independent and centered.  This script evaluates the complete sum over all
528 link directions by symmetric differences, at two step sizes, and uses
Richardson extrapolation.  It then compresses C to every exact free OS
nullspace.  A stable negative compressed eigenvalue would prove a
small-coupling violation for this gauge measure once interval bounds control
the numerical remainder; a nonnegative finite-cell curvature is evidence,
not a general reflection-positivity theorem.

Both the local scalar density and all elementary point-split scalar mesons
are evaluated.  The gauge-covariant Wilson action is the calibration control.
No observational target is used.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


HERE = Path(__file__).resolve().parent
ADMISSIBLE_AUDIT = HERE / "urt_admissible_gauge_invariant_os_audit.py"
DEFAULT_STEP = 8.0e-4
NULL_TOLERANCE = 2.0e-11


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
THEORIES = ("overlap", "Wilson_control")
BASES = ("scalar_density", "point_split_mesons")


def matrices(operator: np.ndarray, phases: np.ndarray) -> dict[str, np.ndarray]:
    covariance = np.linalg.inv(operator)
    return {
        "scalar_density": W.scalar_blocks(covariance),
        "point_split_mesons": W.point_blocks(covariance, phases),
    }


def determinant_ratio(
    operator: np.ndarray, reference_logabs: float, reference_phase: float
) -> float:
    logabs, phase, sign = CORE.real_determinant_weight(operator)
    if sign != 1:
        raise RuntimeError("negative determinant encountered near the free field")
    if abs(phase - reference_phase) > 2.0e-9:
        raise RuntimeError("determinant phase changed near the free field")
    return float(math.exp(logabs - reference_logabs))


def hermitian(matrix: np.ndarray) -> np.ndarray:
    return 0.5 * (matrix + np.swapaxes(matrix.conj(), -1, -2))


def curvature_at_step(
    step: float,
    free_matrices: dict[str, dict[str, np.ndarray]],
    reference_logabs: dict[str, float],
    reference_phase: dict[str, float],
    progress: int,
) -> tuple[dict[str, dict[str, np.ndarray]], dict[str, float], dict[str, Any]]:
    accumulators = {
        theory: {
            basis: np.zeros_like(free_matrices[theory][basis])
            for basis in BASES
        }
        for theory in THEORIES
    }
    weight_second_sum = {theory: 0.0 for theory in THEORIES}
    maximum_face = 0.0
    minimum_gap = math.inf
    link_count = len(A.SITES) * len(A.DIRECTIONS)

    for flat_index in range(link_count):
        site_index, direction_index = divmod(flat_index, len(A.DIRECTIONS))
        signed_data: dict[int, tuple[dict[str, np.ndarray], float]] = {}
        for sign in (-1, 1):
            phases = np.zeros((len(A.SITES), len(A.DIRECTIONS)))
            phases[site_index, direction_index] = sign * step
            operators, gap = W.action_data(phases)
            minimum_gap = min(minimum_gap, gap)
            if flat_index == 0:
                checks = W.max_face_deviations(phases)
                maximum_face = max(
                    maximum_face,
                    checks["maximum_spatial_square_norm_deviation"],
                    checks["maximum_triangle_norm_deviation"],
                )
            for theory in THEORIES:
                ratio = determinant_ratio(
                    operators[theory],
                    reference_logabs[theory],
                    reference_phase[theory],
                )
                signed_data[(sign, theory)] = (
                    matrices(operators[theory], phases),
                    ratio,
                )

        for theory in THEORIES:
            plus_matrices, plus_weight = signed_data[(1, theory)]
            minus_matrices, minus_weight = signed_data[(-1, theory)]
            weight_second_sum[theory] += (
                plus_weight + minus_weight - 2.0
            ) / (step * step)
            for basis in BASES:
                accumulators[theory][basis] += (
                    plus_weight * plus_matrices[basis]
                    + minus_weight * minus_matrices[basis]
                    - 2.0 * free_matrices[theory][basis]
                ) / (step * step)

        if progress and (flat_index + 1) % progress == 0:
            print(
                f"step={step:.9g}: completed {flat_index + 1}/{link_count}",
                flush=True,
            )

    curvature = {
        theory: {
            basis: hermitian(
                (
                    accumulators[theory][basis]
                    - free_matrices[theory][basis]
                    * weight_second_sum[theory]
                )
                / 6.0
            )
            for basis in BASES
        }
        for theory in THEORIES
    }
    diagnostics = {
        "step": step,
        "link_directions_summed": link_count,
        "maximum_one_link_face_deviation": maximum_face,
        "minimum_one_link_XdaggerX": minimum_gap,
        "determinant_normalization_second_derivative_sums": weight_second_sum,
    }
    return curvature, weight_second_sum, diagnostics


def compressed_rows(
    free_blocks: np.ndarray,
    curvature: np.ndarray,
    lower_step_curvature: np.ndarray,
    alpha: float,
) -> list[dict[str, Any]]:
    rows = []
    for momentum, free, response, lower in zip(
        P.MOMENTA, free_blocks, curvature, lower_step_curvature
    ):
        free_h = CORE.hermitian(free)
        values, vectors = np.linalg.eigh(free_h)
        null_mask = np.abs(values) < NULL_TOLERANCE
        q = vectors[:, null_mask]
        if q.shape[1]:
            compressed = CORE.hermitian(q.conj().T @ response @ q)
            compressed_lower = CORE.hermitian(q.conj().T @ lower @ q)
            curvature_values = np.linalg.eigvalsh(compressed)
            comparison_norm = float(np.linalg.norm(compressed - compressed_lower, 2))
            leading_values = alpha * alpha * curvature_values
        else:
            curvature_values = np.empty(0)
            leading_values = np.empty(0)
            comparison_norm = 0.0
        rows.append(
            {
                "momentum_pi_units": list(momentum),
                "free_eigenvalues": [float(value) for value in values],
                "free_nullity": int(q.shape[1]),
                "Richardson_curvature_eigenvalues_on_free_nullspace": [
                    float(value) for value in curvature_values
                ],
                "alpha_squared_leading_eigenvalues": [
                    float(value) for value in leading_values
                ],
                "Richardson_vs_lower_step_operator_norm": comparison_norm,
                "sign_resolved_against_step_comparison": bool(
                    q.shape[1]
                    and (
                        float(curvature_values[0]) + comparison_norm < 0.0
                        or float(curvature_values[0]) - comparison_norm > 0.0
                    )
                ),
            }
        )
    return rows


def summarize_rows(rows: list[dict[str, Any]]) -> dict[str, Any]:
    nonempty = [row for row in rows if row["free_nullity"]]
    all_curvatures = [
        value
        for row in nonempty
        for value in row["Richardson_curvature_eigenvalues_on_free_nullspace"]
    ]
    all_leading = [
        value
        for row in nonempty
        for value in row["alpha_squared_leading_eigenvalues"]
    ]
    resolved_negative_rows = [
        row
        for row in nonempty
        if row["Richardson_curvature_eigenvalues_on_free_nullspace"][0]
        + row["Richardson_vs_lower_step_operator_norm"]
        < 0.0
    ]
    return {
        "total_free_nullity": sum(row["free_nullity"] for row in nonempty),
        "minimum_Richardson_curvature": min(all_curvatures) if all_curvatures else None,
        "minimum_alpha_squared_leading_eigenvalue": min(all_leading) if all_leading else None,
        "step_comparison_resolved_negative_momenta": [
            row["momentum_pi_units"] for row in resolved_negative_rows
        ],
        "negative_against_step_comparison": bool(resolved_negative_rows),
        "note": (
            "step comparison controls observed finite-difference drift, not a "
            "rigorous interval bound on floating-point or O(alpha^4) remainder"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--step", type=float, default=DEFAULT_STEP)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--progress", type=int, default=66)
    args = parser.parse_args()
    if not 0.0 < args.step < 0.05:
        raise ValueError("finite-difference step must lie in the local analytic chart")

    zero = np.zeros((len(A.SITES), len(A.DIRECTIONS)))
    free_operators, free_gap = W.action_data(zero)
    reference_logabs: dict[str, float] = {}
    reference_phase: dict[str, float] = {}
    free_matrices: dict[str, dict[str, np.ndarray]] = {}
    for theory in THEORIES:
        logabs, phase, sign = CORE.real_determinant_weight(free_operators[theory])
        if sign != 1:
            raise RuntimeError("free determinant is not positive")
        reference_logabs[theory] = logabs
        reference_phase[theory] = phase
        free_matrices[theory] = matrices(free_operators[theory], zero)

    coarse, _, coarse_diagnostics = curvature_at_step(
        args.step,
        free_matrices,
        reference_logabs,
        reference_phase,
        args.progress,
    )
    lower_step = args.step / 2.0
    fine, _, fine_diagnostics = curvature_at_step(
        lower_step,
        free_matrices,
        reference_logabs,
        reference_phase,
        args.progress,
    )
    richardson = {
        theory: {
            basis: hermitian((4.0 * fine[theory][basis] - coarse[theory][basis]) / 3.0)
            for basis in BASES
        }
        for theory in THEORIES
    }

    alpha = float(W.ALPHA)
    analysis: dict[str, Any] = {}
    overlap_negative = False
    wilson_negative = False
    for basis in BASES:
        analysis[basis] = {}
        for theory in THEORIES:
            rows = compressed_rows(
                free_matrices[theory][basis],
                richardson[theory][basis],
                fine[theory][basis],
                alpha,
            )
            summary = summarize_rows(rows)
            analysis[basis][theory] = {"summary": summary, "momenta": rows}
            if theory == "overlap":
                overlap_negative = overlap_negative or summary[
                    "negative_against_step_comparison"
                ]
            else:
                wilson_negative = wilson_negative or summary[
                    "negative_against_step_comparison"
                ]

    if wilson_negative:
        status = "calibration failure or unresolved numerical curvature"
        conclusion = (
            "The Wilson control has a negative nullspace curvature against the "
            "two-step comparison, so no overlap-specific inference is valid."
        )
    elif overlap_negative:
        status = "numerical candidate weak-gauge overlap counterexample"
        conclusion = (
            "The overlap nullspace has a stable negative quadratic direction while "
            "the Wilson control does not; interval certification and direct small-alpha "
            "quadrature are required before an exact no-go claim."
        )
    else:
        status = "no negative quadratic direction resolved; theorem remains open"
        conclusion = (
            "The complete deterministic quadratic response in the tested bases did "
            "not resolve an overlap-specific negative nullspace direction."
        )

    out: dict[str, Any] = {
        "certificate": "URT admissible OS quadratic-response audit",
        "date": "2026-09-05",
        "observational_targets_used": False,
        "expansion": {
            "measure": "independent centered uniform link angles on [-alpha,alpha], then local-Haar gauge average",
            "formula": (
                "<K>_det=K0+alpha^2/6 sum_l[((dK)_,ll/d0)-K0(d_,ll/d0)]+O(alpha^4)"
            ),
            "mixed_derivatives": "vanish through E[phi_l phi_m]=0 for l!=m",
            "alpha": alpha,
            "alpha_squared": alpha * alpha,
            "free_XdaggerX": free_gap,
            "finite_difference_steps": [args.step, lower_step],
            "Richardson_formula": "C_R=(4 C(h/2)-C(h))/3",
            "free_null_tolerance": NULL_TOLERANCE,
        },
        "support": {
            "epsilon_star": float(W.EPSILON_STAR),
            "both_steps_inside_certified_face_radius": bool(
                args.step < float(W.EPSILON_STAR)
            ),
            "finite_difference_scope": (
                "the symmetric points approximate derivatives at the free field; "
                "only the physical alpha support, not the auxiliary step, must lie "
                "inside epsilon_star"
            ),
            "alpha_support_inside_certified_gap": True,
        },
        "finite_difference_diagnostics": {
            "coarse": coarse_diagnostics,
            "fine": fine_diagnostics,
        },
        "nullspace_analysis": analysis,
        "verdict": {
            "status": status,
            "overlap_negative_against_step_comparison": overlap_negative,
            "Wilson_negative_against_step_comparison": wilson_negative,
            "conclusion": conclusion,
            "rigorous_interval_certificate": False,
            "interacting_overlap_reflection_positivity_proved": False,
            "interacting_overlap_reflection_positivity_disproved": False,
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()