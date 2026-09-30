#!/usr/bin/env python3
"""Conditional gravity and vacuum normalization from entropy moments.

For the standard three-generation almost-commutative Standard Model spectral
trace, the scalar-free Euclidean terms are

  S_E = integral sqrt(g) [48 f4 Lambda^4/pi^2
                          -4 f2 Lambda^2 R/pi^2 + ...].

The fermionic KMS entropy function fixes

  f2=(9/4) zeta(3),  f4=(225/8) zeta(5).

Matching -[R-2 Lambda_E]/(16 pi G) therefore gives exact conditional bare
numbers for G Lambda^2 and Lambda_E/Lambda^2.  This script audits every gate:
overall action/trace normalization, the beta-to-lattice scale, finite Majorana
Yukawa invariants, and an additive vacuum counterterm.  The result sharpens the
old no-go but does not erase it.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

from scipy.special import zeta


ETA_DELTA = 5.995797986741314


def scalar_free_branch(
    action_weight: float,
    trace_ratio: float,
    beta_over_lattice_spacing: float,
) -> dict[str, Any]:
    if action_weight <= 0.0 or trace_ratio <= 0.0:
        raise ValueError("action and trace weights must be positive")
    if beta_over_lattice_spacing <= 0.0:
        raise ValueError("beta/a must be positive")

    f2 = 9.0 * float(zeta(3.0, 1.0)) / 4.0
    f4 = 225.0 * float(zeta(5.0, 1.0)) / 8.0
    weight = action_weight * trace_ratio

    g_lambda_squared = math.pi / (64.0 * weight * f2)
    lambda_e_over_lambda_squared = 6.0 * f4 / f2
    g_over_a_squared = (
        beta_over_lattice_spacing**2 * g_lambda_squared
    )

    # Direct coefficient matching checks.
    einstein_coefficient = 4.0 * weight * f2 / math.pi**2
    volume_coefficient = 48.0 * weight * f4 / math.pi**2
    reconstructed_einstein = 1.0 / (16.0 * math.pi * g_lambda_squared)
    reconstructed_volume = (
        lambda_e_over_lambda_squared
        / (8.0 * math.pi * g_lambda_squared)
    )

    return {
        "action_weight": action_weight,
        "trace_ratio": trace_ratio,
        "combined_weight": weight,
        "beta_over_lattice_spacing": beta_over_lattice_spacing,
        "f2": f2,
        "f4": f4,
        "G_Lambda_squared": g_lambda_squared,
        "Lambda_E_over_Lambda_squared": lambda_e_over_lambda_squared,
        "G_over_a_squared": g_over_a_squared,
        "Einstein_coefficient_magnitude": einstein_coefficient,
        "volume_coefficient": volume_coefficient,
        "Einstein_matching_residual": abs(
            einstein_coefficient - reconstructed_einstein
        ),
        "volume_matching_residual": abs(
            volume_coefficient - reconstructed_volume
        ),
    }


def finite_majorana_branch(majorana_c: float, majorana_d: float) -> dict[str, Any]:
    """Use the published normalized coefficients before overall rescaling."""
    if majorana_c < 0.0 or majorana_d < 0.0:
        raise ValueError("Majorana trace invariants are nonnegative")

    f0 = math.log(2.0)
    f2 = 9.0 * float(zeta(3.0, 1.0)) / 4.0
    f4 = 225.0 * float(zeta(5.0, 1.0)) / 8.0
    denominator = 96.0 * f2 - f0 * majorana_c
    vacuum_numerator = (
        48.0 * f4 - f2 * majorana_c + 0.25 * f0 * majorana_d
    )
    positive_newton = denominator > 0.0

    if positive_newton:
        g_lambda_squared = 3.0 * math.pi / (2.0 * denominator)
        vacuum_to_einstein_ratio = 12.0 * vacuum_numerator / denominator
    else:
        g_lambda_squared = math.nan
        vacuum_to_einstein_ratio = math.nan

    return {
        "majorana_c": majorana_c,
        "majorana_d": majorana_d,
        "positive_Newton_coefficient": positive_newton,
        "G_Lambda_squared": g_lambda_squared,
        "dimensionless_vacuum_to_Einstein_ratio": vacuum_to_einstein_ratio,
        "Newton_denominator": denominator,
        "vacuum_numerator": vacuum_numerator,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    unit_scale = scalar_free_branch(1.0, 1.0, 1.0)
    eta_scale = scalar_free_branch(1.0, 1.0, ETA_DELTA)

    scale_witnesses = []
    maximum_scaling_residual = 0.0
    for action_weight, trace_ratio, beta_over_a in (
        (0.25, 1.0, 0.5),
        (0.5, 2.0, 1.0),
        (1.0, 1.0, ETA_DELTA),
        (2.0, 1.5, 3.0),
        (7.0, 0.4, 9.0),
    ):
        record = scalar_free_branch(action_weight, trace_ratio, beta_over_a)
        predicted = (
            unit_scale["G_Lambda_squared"]
            / (action_weight * trace_ratio)
        )
        predicted_lattice = beta_over_a**2 * predicted
        residual = max(
            abs(record["G_Lambda_squared"] - predicted),
            abs(record["G_over_a_squared"] - predicted_lattice),
            abs(
                record["Lambda_E_over_Lambda_squared"]
                - unit_scale["Lambda_E_over_Lambda_squared"]
            ),
        )
        maximum_scaling_residual = max(maximum_scaling_residual, residual)
        scale_witnesses.append({**record, "scale_law_residual": residual})

    # A rank-one nonnegative Majorana singular-value family has d=c^2.
    # It is sufficient to prove that the finite block reopens both coefficients.
    majorana_witnesses = []
    for majorana_c in (0.0, 0.1, 1.0, 10.0, 100.0):
        majorana_witnesses.append(
            finite_majorana_branch(majorana_c, majorana_c**2)
        )

    # A field-independent local volume counterterm delta_v Lambda^4 shifts
    # only the cosmological numerator.  Normalized Euclidean expectations are
    # invariant because the partition function acquires the same scalar factor.
    counterterm_witnesses = []
    base_ratio = unit_scale["Lambda_E_over_Lambda_squared"]
    einstein_coefficient = unit_scale["Einstein_coefficient_magnitude"]
    for delta_v in (-100.0, -1.0, 0.0, 3.0, 100.0):
        shifted_ratio = base_ratio + delta_v / (2.0 * einstein_coefficient)
        counterterm_witnesses.append(
            {
                "dimensionless_volume_counterterm_delta_v": delta_v,
                "shifted_Lambda_E_over_Lambda_squared": shifted_ratio,
                "normalized_measure_change": 0.0,
            }
        )

    out = {
        "certificate": "URT entropy spectral-action gravity-normalization audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "published_inputs": {
            "standard_trace_scalar_free_terms": (
                "S_E contains [48 f4 Lambda^4/pi^2 - "
                "4 f2 Lambda^2 R/pi^2] integral sqrt(g)"
            ),
            "entropy_moments": {
                "f0": "log(2)",
                "f2": "(9/4) zeta(3)",
                "f4": "(225/8) zeta(5)",
            },
            "primary_references": [
                {
                    "title": "Entropy and the spectral action",
                    "arXiv": "1809.02944",
                },
                {
                    "title": (
                        "Noncommutative Geometry as the Key to Unlock the "
                        "Secrets of Space-Time"
                    ),
                    "arXiv": "0901.0577",
                    "equations": "spectral action coefficients and kappa_0, gamma_0",
                },
                {
                    "title": (
                        "Noncommutative Geometry as a Framework for Unification "
                        "of all Fundamental Interactions including Gravity. Part I"
                    ),
                    "arXiv": "1004.0464",
                    "equations": "(5.12)-(5.14), (5.45)-(5.49)",
                },
            ],
        },
        "literal_scalar_free_one_trace_branch": {
            "matching_convention": (
                "S_E=-integral sqrt(g)(R-2 Lambda_E)/(16 pi G)"
            ),
            "exact_values": {
                "G_Lambda_squared": "pi/(144 zeta(3))",
                "Lambda_E_over_Lambda_squared": "75 zeta(5)/zeta(3)",
                "G_over_a_squared_if_beta_equals_a": "pi/(144 zeta(3))",
                "G_over_a_squared_if_beta_over_a_equals_eta_Delta": (
                    "eta_Delta^2 pi/(144 zeta(3))"
                ),
            },
            "beta_equals_a": unit_scale,
            "beta_over_a_equals_eta_Delta": eta_scale,
            "status": (
                "E conditional on one entropy trace, the standard finite trace, "
                "a scalar-free background and the displayed scale identification"
            ),
        },
        "scale_and_weight_orbit": {
            "general_laws": [
                "G Lambda^2=pi/[144 c_B nu zeta(3)]",
                "G/a^2=(beta/a)^2 G Lambda^2",
                "Lambda_E/Lambda^2=75 zeta(5)/zeta(3) in the bare scalar-free action",
            ],
            "witnesses": scale_witnesses,
            "maximum_scaling_residual": maximum_scaling_residual,
            "unfixed_inputs": [
                "physical bosonic action weight c_B",
                "Cathedral-to-standard finite trace ratio nu",
                "beta/a identification for the full spacetime Dirac operator",
            ],
            "status": "E",
        },
        "finite_Dirac_reopening": {
            "published_formulas": [
                "1/kappa_0^2=Lambda^2[96 f2-f0 c_M]/(12 pi^2)",
                "gamma_0=Lambda^4[48 f4-f2 c_M+(f0/4)d_M]/pi^2",
            ],
            "rank_one_family": "c_M=x, d_M=x^2 for x>=0",
            "witnesses": majorana_witnesses,
            "conclusion": (
                "Until the finite Majorana/Yukawa block is selected, even the "
                "entropy moments do not uniquely fix the Einstein or vacuum coefficient."
            ),
            "status": "E",
        },
        "vacuum_counterterm_obstruction": {
            "counterterm": "delta_v Lambda^4 integral sqrt(g)",
            "witnesses": counterterm_witnesses,
            "theorem": (
                "A field-independent volume term changes the gravitational vacuum "
                "coefficient while multiplying a fixed-geometry normalized measure "
                "by a cancelling scalar. OS positivity and normalized Gibbs data "
                "therefore cannot select delta_v."
            ),
            "status": "E",
        },
        "verdict": {
            "conditional_G_Lambda_squared": "E",
            "conditional_bare_Lambda_E_over_Lambda_squared": "E",
            "unconditional_G_over_a_squared": "U",
            "unconditional_cosmological_coefficient": "U",
            "advance": (
                "The universal entropy moments fix exact bare gravity ratios on a "
                "fully specified branch. The residual freedom is localized to action/"
                "trace weight, beta-to-lattice scale, the finite Dirac invariants and "
                "an entropy-invisible volume counterterm."
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