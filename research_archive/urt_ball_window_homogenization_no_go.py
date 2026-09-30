#!/usr/bin/env python3
"""Strict homogenized-diffusion no-go for the conditional ball-window repair.

The ball-window proposal/rejection chain has the desired spatially averaged
one-step second and fourth moments.  It is nevertheless not the translation-
invariant 13-velocity walk.  This certificate uses the reversible corrector
variational principle to prove that, if a diffusive homogenized limit exists,
its per-step variance is strictly smaller than the naive one-step value 1/5.

The reason is exact: the local drift is nonzero on open internal-space regions.
For any physical direction e, adding a small multiple of that drift as a
corrector lowers the Dirichlet energy below the constant corrector.  A
deterministic Monte Carlo integration gives a reproducible quantitative trial
upper bound but is not used for the strict theorem.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np

from urt_ball_window_markov_repair import (
    euclidean_physical_coordinates,
    physical_root,
    selected_shell,
)


def monte_carlo_trial(
    physical: np.ndarray,
    internal: np.ndarray,
    radius: float,
    sample_count: int,
) -> dict[str, float | int]:
    rng = np.random.default_rng(20260904)
    directions = rng.normal(size=(sample_count, 3))
    directions /= np.linalg.norm(directions, axis=1)[:, None]
    points = directions * (
        radius * rng.random(sample_count) ** (1.0 / 3.0)
    )[:, None]

    allowed = (
        np.sum((points[:, None, :] + internal[None, :, :]) ** 2, axis=2)
        <= radius**2
    )
    test_direction = physical[0]
    projected_steps = physical @ test_direction
    local_drift = allowed @ projected_steps / 12.0

    one_step_energy = float(
        np.mean(allowed @ (projected_steps**2) / 12.0)
    )
    drift_norm_squared = float(np.mean(local_drift**2))
    cross_term = 0.0
    corrector_energy = 0.0
    for index in range(12):
        next_points = points + internal[index]
        next_allowed = (
            np.sum(
                (next_points[:, None, :] + internal[None, :, :]) ** 2,
                axis=2,
            )
            <= radius**2
        )
        next_drift = next_allowed @ projected_steps / 12.0
        increment = next_drift - local_drift
        edge_exists = allowed[:, index]
        cross_term += float(
            np.mean(edge_exists * projected_steps[index] * increment) / 12.0
        )
        corrector_energy += float(
            np.mean(edge_exists * increment**2) / 12.0
        )

    optimal_trial_scale = -cross_term / corrector_energy
    trial_upper_bound = (
        one_step_energy
        + 2.0 * optimal_trial_scale * cross_term
        + optimal_trial_scale**2 * corrector_energy
    )
    return {
        "sample_count": sample_count,
        "mean_degree": float(np.mean(np.sum(allowed, axis=1))),
        "one_step_directional_energy": one_step_energy,
        "mean_squared_local_drift_component": drift_norm_squared,
        "cross_term": cross_term,
        "exact_cross_identity_residual": abs(
            cross_term + 2.0 * drift_norm_squared
        ),
        "drift_corrector_Dirichlet_energy": corrector_energy,
        "optimal_trial_scale": optimal_trial_scale,
        "trial_upper_bound_on_effective_variance": trial_upper_bound,
        "reduction_below_one_step_energy": one_step_energy - trial_upper_bound,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--samples", type=int, default=400_000)
    args = parser.parse_args()

    metric, _, physical_metric, internal_metric = selected_shell()
    physical = euclidean_physical_coordinates(metric, physical_metric)
    internal = euclidean_physical_coordinates(metric, internal_metric)
    internal_distance = float(np.linalg.norm(internal[0]))
    x = physical_root()
    radius = internal_distance / (2.0 * x)

    # Exact open-set witness: at y=(R/2) times a shell direction, the threshold
    # on its dot products is between 1/sqrt(5) and 1, so exactly the outward
    # displacement is rejected.  The remaining physical directions sum to -v,
    # giving drift norm 1/12.
    point = 0.5 * radius * internal[0] / internal_distance
    allowed = (
        np.sum((point[None, :] + internal) ** 2, axis=1) <= radius**2
    )
    drift = np.sum(physical[allowed], axis=0) / 12.0
    threshold = (
        1.0 - 0.5**2 - (internal_distance / radius) ** 2
    ) / (2.0 * 0.5 * (internal_distance / radius))
    witness = {
        "internal_radial_fraction": 0.5,
        "acceptance_dot_threshold": threshold,
        "one_over_sqrt5": 1.0 / math.sqrt(5.0),
        "degree": int(np.sum(allowed)),
        "drift_norm": float(np.linalg.norm(drift)),
        "drift_norm_minus_one_over_12_residual": abs(
            float(np.linalg.norm(drift)) - 1.0 / 12.0
        ),
    }

    numerical = monte_carlo_trial(
        physical, internal, radius, args.samples
    )

    out = {
        "certificate": "URT ball-window homogenized-diffusion strict no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "scope": (
            "Conditional on the centred-ball window, selected C5 displacement "
            "orbit and symmetric proposal/rejection kernel."
        ),
        "reversible_corrector_principle": {
            "environment": (
                "y is uniform in the internal ball W; an accepted signed proposal "
                "has internal increment t_a and unit physical increment v_a"
            ),
            "local_drift": "b_e(y)=(1/12) sum_a I_a(y) (e dot v_a)",
            "variational_energy": (
                "E_e(phi)=average_y sum_a I_a(y)/12 "
                "[(e dot v_a)+phi(y+t_a)-phi(y)]^2"
            ),
            "homogenized_variance": (
                "If the stationary chain obeys the standard diffusive "
                "homogenization/CLT hypotheses, sigma_e^2=inf_phi E_e(phi)."
            ),
            "constant_trial": "E_e(0)=1/5 from the exact averaged shell moment",
            "first_variation": (
                "For every test phi, the edge-reversal identity gives "
                "d E_e(epsilon phi)/d epsilon at 0=-4 <b_e,phi>."
            ),
            "strict_trial": (
                "Taking phi=b_e gives E_e(epsilon b_e)="
                "1/5-4 epsilon ||b_e||_2^2+epsilon^2 B_e, with finite B_e>=0."
            ),
            "status": "E",
        },
        "nonzero_drift_open_set": {
            "exact_geometry": (
                "At y=(R/2)u for an internal shell axis u, the acceptance threshold "
                "lies strictly between 1/sqrt(5) and 1. Exactly the outward move "
                "is missing, so b=-v/12. Strict inequalities persist on an open set."
            ),
            "deterministic_witness": witness,
            "A5_consequence": (
                "The covariance integral average(b b^T) is A5-invariant and nonzero, "
                "hence is a positive scalar multiple of I3. Therefore ||b_e||_2>0 "
                "for every nonzero physical direction e."
            ),
            "status": "E/N",
        },
        "strict_no_go": {
            "theorem": (
                "For every unit e, sigma_e^2<1/5 whenever the homogenized variance "
                "exists.  Thus the proposal/rejection quasicrystal cannot retain "
                "the naive c_s^2=1/5 per microscopic step."
            ),
            "isotropy": (
                "A5 still forces sigma_e^2 to be direction independent; the failure "
                "is the scalar normalization, not a rank-two anisotropy."
            ),
            "possible_rescaling": (
                "A continuous rescaling of microscopic time could rename the smaller "
                "coefficient as 1/5, but that reintroduces an unselected clock scale "
                "and does not fix the fourth-order corrector."
            ),
            "status": "E conditional on existence of the homogenized limit",
        },
        "deterministic_monte_carlo_trial": numerical,
        "numerical_scope": (
            "The Monte Carlo trial estimates one explicit upper bound only; the exact "
            "strict inequality follows from the first-variation argument."
        ),
        "verdict": {
            "naive_homogenized_sound_speed_squared_1_over_5": "F",
            "isotropic_homogenized_diffusion_form": "C",
            "absolute_diffusion_clock_normalization": "U",
            "fourth_order_homogenized_coefficient": "U",
            "advance": (
                "The ball-window construction is a valid reversible microscopic "
                "Markov model, but its graph correlations provably renormalize the "
                "continuum coefficient.  It cannot serve as the claimed exact "
                "13-velocity heat symbol without a new time normalization and a "
                "solved corrector problem."
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