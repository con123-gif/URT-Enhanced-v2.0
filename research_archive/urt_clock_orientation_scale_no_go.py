#!/usr/bin/env python3
"""Physical-clock orientation and scale audit for Cathedral/URT.

This certificate separates three structures that earlier branches sometimes
identified: invertible history order, the one-sided arrow of a dissipative
semigroup, and a time orientation of the Lorentzian tangent metric.

Entropy monotonicity fixes the allowed sign of a forward Markov/gradient
generator, but multiplication by any kappa>0 preserves its stationary Gibbs
state, detailed balance, symmetries and monotonicity while changing every
physical rate.  The selected contraction factor similarly fixes decay per
iteration, not the duration of an iteration.  Finally g=h-2u tensor u is
unchanged by u->-u, so the Lorentzian metric does not select a cone component.

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
H2_CONTRACTION = 0.6607570507106295
ABS_H_CONTRACTION = 0.37744608195463153


def reversible_generator_witness() -> dict[str, Any]:
    stationary = np.asarray([0.4, 0.3, 0.2, 0.1])
    conductance = np.asarray(
        [
            [0.0, 0.07, 0.03, 0.02],
            [0.07, 0.0, 0.05, 0.01],
            [0.03, 0.05, 0.0, 0.04],
            [0.02, 0.01, 0.04, 0.0],
        ]
    )
    generator = conductance / stationary[:, None]
    np.fill_diagonal(generator, 0.0)
    np.fill_diagonal(generator, -np.sum(generator, axis=1))
    initial = np.asarray([0.18, 0.27, 0.31, 0.24])
    log_ratio = np.log(initial / stationary)

    detailed_balance_residual = 0.0
    for i in range(4):
        for j in range(4):
            detailed_balance_residual = max(
                detailed_balance_residual,
                abs(
                    stationary[i] * generator[i, j]
                    - stationary[j] * generator[j, i]
                ),
            )

    records = []
    base_derivative = None
    base_gap = None
    for rate_scale in (0.1, 1.0, 7.3):
        scaled = rate_scale * generator
        derivative = float((initial @ scaled) @ log_ratio)
        symmetrized = (
            np.sqrt(stationary)[:, None]
            * scaled
            / np.sqrt(stationary)[None, :]
        )
        eigenvalues = np.linalg.eigvalsh(symmetrized)
        gap = float(-np.sort(eigenvalues)[-2])
        if rate_scale == 1.0:
            base_derivative = derivative
            base_gap = gap
        records.append(
            {
                "kappa": rate_scale,
                "stationarity_residual": float(
                    np.max(np.abs(stationary @ scaled))
                ),
                "relative_entropy_derivative": derivative,
                "spectral_gap": gap,
            }
        )
    assert base_derivative is not None and base_gap is not None
    derivative_scaling_residual = max(
        abs(record["relative_entropy_derivative"] - record["kappa"] * base_derivative)
        for record in records
    )
    gap_scaling_residual = max(
        abs(record["spectral_gap"] - record["kappa"] * base_gap)
        for record in records
    )
    return {
        "stationary_distribution": stationary.tolist(),
        "detailed_balance_residual": detailed_balance_residual,
        "scaled_generators": records,
        "entropy_derivative_scaling_residual": derivative_scaling_residual,
        "spectral_gap_scaling_residual": gap_scaling_residual,
    }


def metric_orientation_witness() -> dict[str, Any]:
    h = np.eye(4)
    u = np.asarray([1.0, 0.0, 0.0, 0.0])
    g_plus = h - 2.0 * np.outer(u, u)
    g_minus = h - 2.0 * np.outer(-u, -u)
    return {
        "metric": g_plus.tolist(),
        "signature_eigenvalues": np.linalg.eigvalsh(g_plus).tolist(),
        "u_sign_metric_residual": float(np.linalg.norm(g_plus - g_minus)),
        "future_cone_choices": 2,
    }


def contraction_rate_witnesses() -> list[dict[str, float]]:
    records = []
    for step_duration in (0.001, 1.0, 17.0):
        records.append(
            {
                "step_duration": step_duration,
                "H_squared_decay_rate": -math.log(H2_CONTRACTION) / step_duration,
                "absolute_H_decay_rate": -math.log(ABS_H_CONTRACTION) / step_duration,
                "H_squared_per_step_contraction": H2_CONTRACTION,
                "absolute_H_per_step_contraction": ABS_H_CONTRACTION,
            }
        )
    return records


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    generator = reversible_generator_witness()
    metric = metric_orientation_witness()
    contraction = contraction_rate_witnesses()

    out = {
        "certificate": "URT physical-clock orientation and rate no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "three_nonidentical_structures": {
            "history_order": (
                "The baker/two-sheet history map is invertible.  Replacing the "
                "history step B by B^-1 reverses ordering while preserving "
                "invertibility, orbit data and the unoriented spectrum."
            ),
            "entropy_arrow": (
                "A positive dissipative mobility or forward Markov generator makes "
                "relative information nonincreasing and defines a semigroup that is "
                "not positivity-preserving backward in time."
            ),
            "Lorentz_time_orientation": (
                "A Lorentz metric supplies two cone components.  Choosing which one "
                "is future is additional to the metric tensor."
            ),
            "nonconflation": (
                "These live respectively on history, state/probability and tangent "
                "geometry.  An explicit coupling map is required to identify them."
            ),
        },
        "Lorentz_sign_theorem": {
            "construction": "g=h-2 u tensor u for a unit one-form u",
            "identity": "g(u)=g(-u)",
            "consequence": (
                "The Euclidean seed plus Lorentz reflection fixes signature (1,3) "
                "but not the sign of the future cone."
            ),
            "deterministic_witness": metric,
            "status": "E",
        },
        "dissipative_rate_scaling_theorem": {
            "setup": (
                "Let L be any detailed-balance Markov, Lindblad or gradient-flow "
                "generator with stationary Gibbs state rho_* and entropy production "
                "sigma_L>=0."
            ),
            "identity": (
                "For every kappa>0, L_kappa=kappa L has the same rho_*, fixed points, "
                "detailed balance, covariance and entropy-arrow sign, while gaps, "
                "entropy-production rates and all inverse relaxation times scale by kappa."
            ),
            "negative_sign": (
                "kappa<0 reverses entropy production and generally destroys forward "
                "Markov/complete-positive semigroup admissibility.  Positivity selects "
                "the semigroup orientation but not any positive magnitude."
            ),
            "finite_reversible_witness": generator,
            "status": "E",
        },
        "selected_contraction_scope": {
            "H_squared_factor": H2_CONTRACTION,
            "absolute_H_factor": ABS_H_CONTRACTION,
            "dimensionless_log_decrements": {
                "H_squared": -math.log(H2_CONTRACTION),
                "absolute_H": -math.log(ABS_H_CONTRACTION),
            },
            "rate_formula": "Gamma=-log(rho_step)/tau_step",
            "duration_witnesses": contraction,
            "conclusion": (
                "The maximal-contraction theorem selects a decay factor per declared "
                "iteration.  It supplies no equation for the physical duration tau_step."
            ),
        },
        "candidate_inputs_audit": {
            "eta_Delta": {
                "value": ETA_DELTA,
                "dimension": "dimensionless",
                "scope": (
                    "It fixes a Gibbs depth/product eta K after cost normalization, "
                    "not a transition rate or time unit."
                ),
            },
            "lattice_length_a_star": (
                "A length becomes a time only after a propagation speed or causal "
                "update law is supplied.  Assuming tau_step=a_star/c is a new "
                "light-crossing postulate; a_star itself remains an absolute scale."
            ),
            "entropy_depth": (
                "A scalar ordering of states is not a coordinate function on the "
                "punctured Hopf spacetime, and it is stationary at equilibrium.  It "
                "cannot by itself be a nowhere-zero global clock one-form."
            ),
            "history_step": (
                "It labels an integer iteration and fixes orientation-sensitive "
                "ordering only after a branch convention; no seconds-per-step map exists."
            ),
        },
        "exact_degeneracies": {
            "clock_rescaling": "t'=c t, L'=L/c for every c>0",
            "Lorentz_orientation": "u and -u give the same g",
            "history_reversal": "B and B^-1 carry opposite order conventions",
            "physical_consequence": (
                "All currently certified static spectra, Gibbs states, symmetry "
                "identities and per-step contraction factors survive these changes."
            ),
        },
        "verdict": {
            "entropy_semigroup_orientation": "E conditional on positive dissipation",
            "Lorentz_future_orientation": "U",
            "history_to_Lorentz_alignment": "U",
            "physical_clock_rate": "U",
            "no_go": (
                "The present principles select at most a dimensionless iteration arrow. "
                "They do not select a future cone, identify entropy depth with tangent "
                "time, or determine seconds per update.  eta_Delta, a per-step "
                "contraction and a lattice length do not remove the exact positive "
                "generator-rescaling freedom."
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