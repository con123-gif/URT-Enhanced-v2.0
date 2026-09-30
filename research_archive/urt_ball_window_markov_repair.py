#!/usr/bin/env python3
"""Conditional ball-window Markov repair for the URT icosahedral shell.

Assume the two additional target-blind choices isolated by the window audit:
a centered ball acceptance window and the minimum-internal-length twelve-vector
C5 shell in Lambda^2(A4).  Propose each signed displacement with probability
1/12 and reject to a self-loop when the destination leaves the window.

The equal-ball overlap fraction is the spatial frequency with which a given
edge exists.  Requiring the previously derived averaged moving fraction 3/5
fixes one algebraic ratio between window radius and internal displacement, so
the averaged one-step weights and moments are exactly (w0,w)=(2/5,1/20).

The repair is reversible but not translation invariant.  Local degree, drift
and moment tensors vary, and accepted steps have an enhanced exact backtracking
probability.  Consequently the averaged one-step symbol does not determine the
homogenized diffusion/heat kernel; a corrector/Green-Kubo calculation remains.

No observational target is used.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from pathlib import Path
from typing import Any

import numpy as np

from urt_a4_bivector_icosahedral_lift import (
    bivector_metric_and_hodge_numerator,
)


def physical_root() -> float:
    roots = np.roots([5.0, 0.0, -15.0, 4.0])
    candidates = [
        float(root.real)
        for root in roots
        if abs(root.imag) < 1.0e-12 and 0.0 < root.real < 1.0
    ]
    if len(candidates) != 1:
        raise RuntimeError(f"expected one physical overlap root, got {candidates}")
    return candidates[0]


def selected_shell() -> tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    metric, hodge_numerator = bivector_metric_and_hodge_numerator()
    plus = (
        np.eye(6) + hodge_numerator.astype(float) / math.sqrt(5.0)
    ) / 2.0
    minus = (
        np.eye(6) - hodge_numerator.astype(float) / math.sqrt(5.0)
    ) / 2.0
    lattice_vectors = []
    for coordinates in itertools.product(range(-2, 3), repeat=6):
        if not any(coordinates):
            continue
        vector = np.asarray(coordinates, dtype=int)
        if (
            int(vector @ metric @ vector) == 5
            and int(vector @ metric @ hodge_numerator @ vector) == 10
        ):
            lattice_vectors.append(vector)
    if len(lattice_vectors) != 12:
        raise RuntimeError(
            f"expected selected twelve-vector shell, got {len(lattice_vectors)}"
        )
    physical = np.asarray([plus @ vector for vector in lattice_vectors])
    internal = np.asarray([minus @ vector for vector in lattice_vectors])
    physical_norm_squared = float(physical[0] @ metric @ physical[0])
    physical /= math.sqrt(physical_norm_squared)
    return metric, hodge_numerator, physical, internal


def euclidean_physical_coordinates(
    metric: np.ndarray, physical: np.ndarray
) -> np.ndarray:
    # Cholesky maps the Gram-metric coordinates isometrically into Euclidean R6.
    cholesky = np.linalg.cholesky(metric)
    embedded = (cholesky.T @ physical.T).T
    _, _, vh = np.linalg.svd(embedded, full_matrices=False)
    basis = vh[:3].T
    coordinates = embedded @ basis
    if np.max(np.abs(coordinates @ coordinates.T - embedded @ embedded.T)) > 1.0e-12:
        raise RuntimeError("physical Hodge coordinate extraction failed")
    return coordinates


def averaged_moment_audit(coordinates: np.ndarray) -> dict[str, float]:
    identity = np.eye(3)
    weight = 1.0 / 20.0
    second = weight * np.einsum("ni,nj->ij", coordinates, coordinates)
    fourth = weight * np.einsum(
        "ni,nj,nk,nl->ijkl", coordinates, coordinates, coordinates, coordinates
    )
    target_fourth = np.zeros((3, 3, 3, 3))
    for i, j, k, l in itertools.product(range(3), repeat=4):
        target_fourth[i, j, k, l] = (1.0 / 25.0) * (
            identity[i, j] * identity[k, l]
            + identity[i, k] * identity[j, l]
            + identity[i, l] * identity[j, k]
        )
    return {
        "second_moment_residual": float(
            np.linalg.norm(second - identity / 5.0)
        ),
        "third_moment_residual": float(
            np.linalg.norm(
                weight
                * np.einsum("ni,nj,nk->ijk", coordinates, coordinates, coordinates)
            )
        ),
        "fourth_moment_residual": float(
            np.linalg.norm(fourth - target_fourth)
        ),
    }


def local_pattern_audit(
    metric: np.ndarray,
    physical: np.ndarray,
    internal: np.ndarray,
    radius: float,
) -> list[dict[str, Any]]:
    internal_norm = math.sqrt(float(internal[0] @ metric @ internal[0]))
    unit_internal_axis = internal[0] / internal_norm
    records = []
    for radial_fraction in (0.0, 0.5, 0.9, 0.999999):
        point = radial_fraction * radius * unit_internal_axis
        allowed = np.asarray(
            [
                float((point + shift) @ metric @ (point + shift))
                <= radius**2 + 1.0e-12
                for shift in internal
            ]
        )
        accepted = physical[allowed]
        drift = np.sum(accepted, axis=0) / 12.0
        directional_second = np.asarray(
            [
                sum((direction @ metric @ step) ** 2 for step in accepted) / 12.0
                for direction in physical
            ]
        )
        records.append(
            {
                "radial_fraction": radial_fraction,
                "degree": int(np.sum(allowed)),
                "local_rest_probability": float(1.0 - np.sum(allowed) / 12.0),
                "local_drift_norm": math.sqrt(float(drift @ metric @ drift)),
                "directional_second_moment_minimum": float(
                    np.min(directional_second)
                ),
                "directional_second_moment_maximum": float(
                    np.max(directional_second)
                ),
            }
        )
    return records


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    x = physical_root()
    internal_norm_squared = (5.0 - 2.0 * math.sqrt(5.0)) / 2.0
    internal_distance = math.sqrt(internal_norm_squared)
    radius = internal_distance / (2.0 * x)
    overlap_fraction = (
        1.0
        - 3.0 * internal_distance / (4.0 * radius)
        + internal_distance**3 / (16.0 * radius**3)
    )

    metric, hodge_numerator, physical, internal = selected_shell()
    actual_internal_norm_residual = max(
        abs(float(vector @ metric @ vector) - internal_norm_squared)
        for vector in internal
    )
    coordinates = euclidean_physical_coordinates(metric, physical)
    moments = averaged_moment_audit(coordinates)
    local_patterns = local_pattern_audit(metric, physical, internal, radius)

    out = {
        "certificate": "URT conditional ball-window Markov repair",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "added_premises": [
            "the fixed-volume isoperimetric acceptance window is a centred ball",
            "the physical displacement shell is the minimum-internal-length C5-fixed orbit",
            "each of the twelve signed displacements is proposed with probability 1/12",
            "a proposal leaving the window is rejected to a self-loop",
        ],
        "equal_ball_overlap_closure": {
            "internal_displacement_squared": "(5-2 sqrt(5))/2",
            "internal_displacement_numeric": internal_distance,
            "overlap_fraction": (
                "f(d/R)=1-3d/(4R)+d^3/(16R^3), for 0<=d<=2R"
            ),
            "required_average_moving_fraction": "12w=3/5",
            "dimensionless_variable": "x=d/(2R)",
            "algebraic_equation": "5x^3-15x+4=0",
            "root_isolation": {
                "interval": ["6837/25000", "27349/100000"],
                "polynomial_at_left": "217618253/3125000000000 > 0",
                "polynomial_at_right": "-13828610451/200000000000000 < 0",
                "uniqueness": (
                    "p'(x)=15(x^2-1)<0 on (0,1), so this is the unique physical root"
                ),
            },
            "x_numeric": x,
            "R_over_d": 1.0 / (2.0 * x),
            "window_radius_numeric_in_internal_lattice_units": radius,
            "overlap_fraction_residual": abs(overlap_fraction - 3.0 / 5.0),
            "window_volume_numeric": 4.0 * math.pi * radius**3 / 3.0,
            "model_set_density_numeric_for_covolume_5sqrt5": (
                (4.0 * math.pi * radius**3 / 3.0) / (5.0 * math.sqrt(5.0))
            ),
            "status": "E conditional on the added ball/proposal premises",
        },
        "reversible_partial_graph_kernel": {
            "definition": (
                "P(x,x+v_a)=1/12 when both window points exist; rejected proposals "
                "are added to P(x,x)."
            ),
            "row_stochasticity": (
                "degree(x)/12+[12-degree(x)]/12=1 exactly"
            ),
            "detailed_balance": (
                "An accepted edge has P(x,y)=P(y,x)=1/12 because the signed shell "
                "contains both lattice displacements.  Counting/Palm measure is reversible."
            ),
            "spatial_average": {
                "each_oriented_move": "f/12=(3/5)/12=1/20",
                "rest": "1-f=2/5",
                "reason": (
                    "Regular model-set frequencies equal normalized internal-window "
                    "intersection volumes."
                ),
            },
            "actual_internal_norm_residual": actual_internal_norm_residual,
            "averaged_moment_audit": moments,
            "status": "E conditional",
        },
        "local_inhomogeneity": {
            "deterministic_internal_points": local_patterns,
            "theorem": (
                "The origin has all twelve moves and zero rest probability, while "
                "open internal regions nearer the boundary have fewer moves, nonzero "
                "rest probability and generally nonzero local drift.  Density of the "
                "internal projection realizes these patterns in the model set."
            ),
            "status": "E/N",
        },
        "correlation_obstruction": {
            "exact_backtracking": (
                "Conditioned on any accepted move v_a, the reverse edge is present "
                "at the destination and the next-step backtracking probability is 1/12."
            ),
            "iid_comparison": (
                "The translation-invariant averaged 13-velocity law would assign "
                "probability 1/20 to that reverse direction; the exact gap is 1/30."
            ),
            "consequence": (
                "Step increments are correlated.  The long-wave diffusion coefficient "
                "contains the full Green-Kubo velocity-correlation sum, and the "
                "fourth-order term requires a graph corrector.  One-step averaged "
                "moments do not prove the Gaussian heat symbol or c_s^2=1/5 for the "
                "homogenized chain."
            ),
            "symmetry_scope": (
                "A5 symmetry forces any existing homogenized rank-two tensor to be "
                "scalar and excludes rank-four anisotropy, but it does not fix their "
                "scalar coefficients."
            ),
            "status": "E for non-iid correlation; U for homogenized coefficients",
        },
        "verdict": {
            "window_radius_from_average_weights": "E conditional",
            "reversible_markov_kernel": "E conditional",
            "one_step_averaged_weights_and_moments": "E conditional",
            "homogenized_fourth_order_heat_closure": "U",
            "advance": (
                "The ball-window radius and average 13-state weights close algebraically, "
                "but the quasicrystal repair replaces translation invariance by correlated "
                "site-dependent motion.  A corrector/spectral homogenization theorem is "
                "the next indispensable calculation."
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