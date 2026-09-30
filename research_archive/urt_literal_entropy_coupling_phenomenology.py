#!/usr/bin/env python3
"""Blind post-freeze check of the literal entropy gauge coupling.

The already-derived c*nu=1 spectral-action branch gives

    alpha_U = pi/(8 log 2).

This script compares that frozen number with MS-bar Standard Model couplings
constructed at M_Z from Particle Data Group inputs and evolved with the
one-loop Standard Model beta functions.  It does not fit any Cathedral
parameter.  The overall action/trace normalization c*nu was already known to
be free; the calculation reports the value it would have to take at each
pairwise Standard Model crossing.

The result falsifies the *literal normalization-one identification* with a
high-scale Standard Model unified coupling.  It does not falsify a rescaled
spectral action, threshold corrections, new matter, or the larger Cathedral
framework, because those are independent unresolved inputs.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any


# PDG 2024 review inputs, all at M_Z in the MS-bar scheme where applicable.
M_Z_GEV = 91.1880
M_Z_SIGMA_GEV = 0.0020
ALPHA_EM_INV = 127.930
ALPHA_EM_INV_SIGMA = 0.008
SIN2_THETA_W = 0.23129
SIN2_THETA_W_SIGMA = 0.00004
ALPHA_S = 0.1180
ALPHA_S_SIGMA = 0.0009

# GUT-normalized U(1), SU(2), SU(3), with
# d alpha_i^{-1}/d ln(mu) = -b_i/(2 pi).
BETA = {"alpha1": 41.0 / 10.0, "alpha2": -19.0 / 6.0, "alpha3": -7.0}


def inverse_couplings() -> dict[str, float]:
    alpha_em = 1.0 / ALPHA_EM_INV
    cos2 = 1.0 - SIN2_THETA_W
    return {
        "alpha1": 1.0 / ((5.0 / 3.0) * alpha_em / cos2),
        "alpha2": 1.0 / (alpha_em / SIN2_THETA_W),
        "alpha3": 1.0 / ALPHA_S,
    }


def run_inverse(name: str, initial: float, log_scale_ratio: float) -> float:
    return initial - BETA[name] * log_scale_ratio / (2.0 * math.pi)


def pair_crossing(
    left: str, right: str, initial: dict[str, float], alpha_literal: float
) -> dict[str, Any]:
    denominator = BETA[left] - BETA[right]
    log_scale_ratio = (
        2.0 * math.pi * (initial[left] - initial[right]) / denominator
    )
    left_value = run_inverse(left, initial[left], log_scale_ratio)
    right_value = run_inverse(right, initial[right], log_scale_ratio)
    inverse_value = 0.5 * (left_value + right_value)
    alpha_value = 1.0 / inverse_value
    spectator = next(name for name in initial if name not in (left, right))
    spectator_inverse = run_inverse(
        spectator, initial[spectator], log_scale_ratio
    )
    return {
        "pair": [left, right],
        "log_mu_over_MZ": log_scale_ratio,
        "mu_GeV": M_Z_GEV * math.exp(log_scale_ratio),
        "inverse_coupling": inverse_value,
        "coupling": alpha_value,
        "crossing_residual": abs(left_value - right_value),
        "spectator": spectator,
        "spectator_inverse_coupling": spectator_inverse,
        "spectator_coupling": 1.0 / spectator_inverse,
        "spectator_inverse_mismatch": spectator_inverse - inverse_value,
        "spectator_fractional_coupling_mismatch": (
            (1.0 / spectator_inverse) / alpha_value - 1.0
        ),
        "required_c_times_nu": alpha_literal / alpha_value,
        "literal_to_crossing_coupling_ratio": alpha_literal / alpha_value,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    initial = inverse_couplings()
    alpha_literal = math.pi / (8.0 * math.log(2.0))
    inverse_literal = 1.0 / alpha_literal
    crossings = [
        pair_crossing("alpha1", "alpha2", initial, alpha_literal),
        pair_crossing("alpha1", "alpha3", initial, alpha_literal),
        pair_crossing("alpha2", "alpha3", initial, alpha_literal),
    ]

    # At any scale mu>=M_Z, alpha_2 and alpha_3 can only decrease because
    # b_2,b_3<0.  They begin far below the literal value.
    monotonic_no_go = {
        "alpha2_at_MZ": 1.0 / initial["alpha2"],
        "alpha3_at_MZ": 1.0 / initial["alpha3"],
        "literal_alpha_U": alpha_literal,
        "b2_negative": BETA["alpha2"] < 0.0,
        "b3_negative": BETA["alpha3"] < 0.0,
        "alpha2_decreases_for_mu_above_MZ": True,
        "alpha3_decreases_for_mu_above_MZ": True,
        "literal_common_coupling_impossible_for_mu_at_or_above_MZ": bool(
            alpha_literal > 1.0 / initial["alpha2"]
            and alpha_literal > 1.0 / initial["alpha3"]
        ),
        "proof": (
            "b2,b3<0 imply d(alpha_i^-1)/d ln(mu)>0; hence alpha2 and "
            "alpha3 decrease above MZ and never reach the larger literal value"
        ),
    }

    # Formal scale at which alpha_1 alone reaches the literal coupling.
    log_alpha1_literal = (
        2.0
        * math.pi
        * (initial["alpha1"] - inverse_literal)
        / BETA["alpha1"]
    )
    companions_at_alpha1_literal = {
        name: run_inverse(name, initial[name], log_alpha1_literal)
        for name in initial
    }

    out: dict[str, Any] = {
        "certificate": "URT literal entropy gauge-coupling phenomenology",
        "date": "2026-09-04",
        "observational_targets_used": True,
        "comparison_protocol": (
            "post-freeze test of c*nu=1; no parameter was adjusted in the tested branch"
        ),
        "sources": {
            "electroweak": {
                "citation": (
                    "Particle Data Group, Electroweak Model and Constraints on "
                    "New Physics, revised April 2024"
                ),
                "url": (
                    "https://pdg.lbl.gov/2024/reviews/"
                    "rpp2024-rev-standard-model.pdf"
                ),
                "inputs": {
                    "M_Z_GeV": [M_Z_GEV, M_Z_SIGMA_GEV],
                    "alpha_MSbar_5_inverse_MZ": [
                        ALPHA_EM_INV,
                        ALPHA_EM_INV_SIGMA,
                    ],
                    "sin2_thetaW_MSbar_MZ": [
                        SIN2_THETA_W,
                        SIN2_THETA_W_SIGMA,
                    ],
                },
            },
            "strong": {
                "citation": (
                    "Particle Data Group, Quantum Chromodynamics, 2024 review; "
                    "PDG 2023 average quoted in the 2024 edition"
                ),
                "url": "https://pdg.lbl.gov/2024/reviews/rpp2024-rev-qcd.pdf",
                "inputs": {"alpha_s_MZ": [ALPHA_S, ALPHA_S_SIGMA]},
            },
        },
        "conventions": {
            "alpha1": "(5/3) alpha_EM / cos^2(theta_W)",
            "alpha2": "alpha_EM / sin^2(theta_W)",
            "alpha3": "alpha_s",
            "one_loop_beta_coefficients": BETA,
            "running": (
                "alpha_i^-1(mu)=alpha_i^-1(MZ)-b_i ln(mu/MZ)/(2pi)"
            ),
            "scope_warning": (
                "one-loop Standard Model running only; no threshold or new-matter corrections"
            ),
        },
        "frozen_literal_prediction": {
            "premise": "c*nu=1",
            "alpha_U": alpha_literal,
            "alpha_U_inverse": inverse_literal,
            "formula": "alpha_U=pi/(8 log 2)",
        },
        "measured_scale_couplings": {
            "inverse": initial,
            "direct": {name: 1.0 / value for name, value in initial.items()},
            "literal_over_measured": {
                name: alpha_literal * value for name, value in initial.items()
            },
        },
        "pairwise_one_loop_crossings": crossings,
        "monotonic_literal_no_go": monotonic_no_go,
        "formal_alpha1_literal_scale": {
            "log_mu_over_MZ": log_alpha1_literal,
            "mu_GeV": M_Z_GEV * math.exp(log_alpha1_literal),
            "inverse_couplings_at_that_scale": companions_at_alpha1_literal,
            "not_a_common_crossing": True,
        },
        "verdict": {
            "literal_c_times_nu_equals_one_branch_matches_SM_unification": False,
            "one_loop_minimal_SM_has_exact_triple_crossing": False,
            "literal_branch_status": "F under the stated spectral-action/SM-running identification",
            "whole_framework_falsified": False,
            "reason_whole_framework_survives": (
                "c*nu is already an unfixed normalization and thresholds/new matter "
                "are not derived; allowing either removes the literal prediction"
            ),
            "cost_of_survival": (
                "the entropy number is not an absolute coupling prediction; the "
                "alpha1-alpha2 crossing requires c*nu equal to the reported value"
            ),
            "status": "F literal normalization-one phenomenology; U normalized theory",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()