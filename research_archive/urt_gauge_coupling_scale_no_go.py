#!/usr/bin/env python3
"""Gauge-coupling scale no-go for the URT relative-information selector.

After the shortest-loop form and parent-trace coupling ratios are fixed, write
the remaining positive gauge cost as beta K0.  In the declared Gibbs/relative-
information functional it occurs only through eta*beta.  The exact variational
minimum -log Z is strictly monotone in beta for a nonzero positive K0, so it has
no nonzero interior stationary point.  Fixing eta_Delta does not turn a choice
of action units into a derived gauge coupling.

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


def gibbs_commuting(prior: np.ndarray, costs: np.ndarray, eta: float, beta: float) -> tuple[np.ndarray, float]:
    weights = prior * np.exp(-eta * beta * costs)
    partition = float(np.sum(weights))
    return weights / partition, partition


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    # Exact theorem is operator-general.  This deterministic commuting witness
    # only checks the displayed derivative and eta-beta scaling numerically.
    prior = np.asarray([0.41, 0.29, 0.19, 0.11])
    costs = np.asarray([0.0, 0.75, 1.5, 3.0])
    witnesses = []
    max_scaling_residual = 0.0
    max_derivative_residual = 0.0
    for beta in (0.1, 0.5, 1.0, 2.0):
        state, partition = gibbs_commuting(prior, costs, ETA_DELTA, beta)
        expectation = float(np.dot(state, costs))
        epsilon = 1.0e-6
        _, plus = gibbs_commuting(prior, costs, ETA_DELTA, beta + epsilon)
        _, minus = gibbs_commuting(prior, costs, ETA_DELTA, beta - epsilon)
        derivative = (-(math.log(plus)) + math.log(minus)) / (2.0 * epsilon)
        exact_derivative = ETA_DELTA * expectation
        max_derivative_residual = max(
            max_derivative_residual, abs(derivative - exact_derivative)
        )

        scale = 3.7
        scaled_state, scaled_partition = gibbs_commuting(
            prior, costs, ETA_DELTA * scale, beta / scale
        )
        scaling_residual = max(
            float(np.max(np.abs(state - scaled_state))),
            abs(partition - scaled_partition),
        )
        max_scaling_residual = max(max_scaling_residual, scaling_residual)
        witnesses.append(
            {
                "beta": beta,
                "partition": partition,
                "minimum_relative_information_value": -math.log(partition),
                "cost_expectation": expectation,
                "analytic_derivative": exact_derivative,
                "finite_difference_derivative": derivative,
                "eta_beta_scaling_residual": scaling_residual,
            }
        )

    out = {
        "certificate": "URT gauge-coupling scale circularity no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "setup": {
            "gauge_cost": "K_g(beta)=beta K0 with K0>=0",
            "relative_information": (
                "F_{eta,beta}(rho)=D(rho||rho0)+eta beta Tr(rho K0)"
            ),
            "minimizer": (
                "rho_beta=exp(log rho0-eta beta K0)/Z in the displayed "
                "commuting form; the eta-beta product statement is general"
            ),
            "minimum_value": "F_min(beta)=-log Z(beta)",
        },
        "exact_theorem": {
            "scale_identity": (
                "F_{c eta,beta/c}(rho)=F_{eta,beta}(rho) for every c>0"
            ),
            "partition_derivative": (
                "d[-log Z]/d beta=eta Tr(rho_beta K0)>=0"
            ),
            "strictness": (
                "The derivative is positive whenever K0 is nonzero on the "
                "faithful support of rho_beta."
            ),
            "stationarity": (
                "There is no positive interior stationary beta; minimizing the "
                "variational value over beta sends beta to 0."
            ),
            "status": "E",
        },
        "fixed_inputs_do_not_repair_it": {
            "eta_Delta": ETA_DELTA,
            "plaquette_bivector_frame": "5 I on Lambda^2(V4)",
            "parent_trace": "fixes g1:g2:g3 but not their common magnitude",
            "conclusion": (
                "Geometric and trace normalization determine the tensor form and "
                "relative couplings. They supply no non-homogeneous equation for beta."
            ),
        },
        "deterministic_witnesses": witnesses,
        "maximum_eta_beta_scaling_residual": max_scaling_residual,
        "maximum_derivative_residual": max_derivative_residual,
        "verdict": {
            "absolute_bare_gauge_coupling": "U",
            "relative_parent_couplings": "E conditional on one parent trace",
            "no_go": (
                "The declared relative-information principle cannot select a "
                "nonzero absolute gauge coupling from eta_Delta and the normalized "
                "plaquette action. Setting beta or g to one would be a convention."
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