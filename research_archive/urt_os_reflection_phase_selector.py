#!/usr/bin/env python3
"""Anti-linear OS reflection audit of the Cathedral determinant-line phase.

Earlier linear history reversal left

    exp(i lambda chi Omega5)

admissible for every real lambda because both Hodge chirality chi and the
ordered history scalar Omega5 reverse sign.  A Euclidean Osterwalder-Schrader
reflection is stronger: it is anti-linear.  The selected time reflection
reverses four-dimensional orientation, hence exchanges self-dual and
anti-self-dual two-forms, chi->-chi; history order gives Omega5->-Omega5.
Their product O5=chi Omega5 is therefore reflection even, while i->-i.

Standard OS reality of the Euclidean weight then requires

    exp(i lambda O5)=exp(-i lambda O5)

for every continuously variable O5.  This uniquely forces lambda=0.  The
conclusion is conditional on adopting the newly constructed vacuum OS
reflection and on O5 having the recorded even parity under it.

No observational target is used.
"""

from __future__ import annotations

import argparse
import cmath
import json
import math
from pathlib import Path

import numpy as np


def history_omega(branch_sign: int, phase_offset: float = 0.0) -> complex:
    phases = (
        branch_sign * math.pi / 30.0
        + phase_offset
        + 2.0 * math.pi * np.arange(5) / 5.0
    )
    branch = np.tile(np.exp(1.0j * phases), 12)
    conjugate = np.tile(np.exp(-1.0j * phases), 12)
    w = np.concatenate([conjugate, branch])
    tau3 = np.concatenate([-np.ones(60), np.ones(60)])
    return -1.0j * np.sum(tau3 * w**5) / 60.0


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    # Lambda^2 basis: 01,02,03,23,31,12.  In this oriented orthonormal basis,
    # the Euclidean Hodge star swaps the first and last three components.
    hodge = np.block(
        [
            [np.zeros((3, 3)), np.eye(3)],
            [np.eye(3), np.zeros((3, 3))],
        ]
    )
    time_reflection_on_two_forms = np.diag([-1.0, -1.0, -1.0, 1.0, 1.0, 1.0])
    hodge_square_residual = float(np.linalg.norm(hodge @ hodge - np.eye(6)))
    hodge_reflection_anticommutator = float(
        np.linalg.norm(
            time_reflection_on_two_forms @ hodge
            + hodge @ time_reflection_on_two_forms
        )
    )
    conjugated_hodge_residual = float(
        np.linalg.norm(
            time_reflection_on_two_forms
            @ hodge
            @ time_reflection_on_two_forms
            + hodge
        )
    )

    omega = history_omega(+1)
    omega_reversed = history_omega(-1)
    omega_reversal_residual = abs(omega_reversed + omega)

    lambda_values = [0.0, 0.1, 0.731, 1.123, math.pi]
    o_values = np.linspace(-1.0, 1.0, 2001)
    phase_rows = []
    for lambda_value in lambda_values:
        maximum_residual = 0.0
        for o_value in o_values:
            phase = cmath.exp(1.0j * lambda_value * o_value)
            reflected_phase = cmath.exp(-1.0j * lambda_value * o_value)
            maximum_residual = max(maximum_residual, abs(phase - reflected_phase))
        phase_rows.append(
            {
                "lambda": lambda_value,
                "maximum_OS_reality_residual_on_O5_in_minus1_1": maximum_residual,
                "infinitesimal_residual_slope_at_O5_0": 2.0 * abs(lambda_value),
            }
        )

    # The old linear reversal does not complex-conjugate the coefficient i.
    old_reversal_rows = []
    for lambda_value in lambda_values:
        chi = 1.0
        omega_value = float(omega.real)
        phase = cmath.exp(1.0j * lambda_value * chi * omega_value)
        reversed_phase = cmath.exp(
            1.0j * lambda_value * (-chi) * (-omega_value)
        )
        old_reversal_rows.append(
            {
                "lambda": lambda_value,
                "linear_reversal_residual": abs(phase - reversed_phase),
            }
        )

    out = {
        "certificate": "URT anti-linear OS reflection selector for determinant phase",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "geometric_parity": {
            "two_form_basis": ["01", "02", "03", "23", "31", "12"],
            "Hodge_star_squared_minus_I_residual": hodge_square_residual,
            "time_reflection_Hodge_anticommutator_residual": (
                hodge_reflection_anticommutator
            ),
            "R_star_R_inverse_plus_star_residual": conjugated_hodge_residual,
            "consequence": (
                "An orientation-reversing time reflection exchanges Lambda2_+ and "
                "Lambda2_-, hence chi maps to -chi."
            ),
            "status": "E",
        },
        "history_parity": {
            "Omega5": float(omega.real),
            "Omega5_imaginary_residual": abs(omega.imag),
            "reversed_Omega5": float(omega_reversed.real),
            "Omega5_reversal_odd_residual": omega_reversal_residual,
            "combined_O5": "O5=chi Omega5 is reflection even",
            "status": "E",
        },
        "linear_reversal_comparison": {
            "rows": old_reversal_rows,
            "conclusion": (
                "The previously imposed linear reversal leaves every real lambda "
                "admissible, reproducing the earlier no-go."
            ),
        },
        "anti_linear_OS_condition": {
            "anti_linearity": "theta(i)=-i",
            "O5_parity": "theta(O5)=O5",
            "weight_condition": "exp(i lambda O5)=exp(-i lambda O5) for all O5",
            "continuous_range": (
                "Omega5 varies continuously with the history phases, so O5 contains "
                "an interval around zero rather than only integer values."
            ),
            "infinitesimal_proof": (
                "Differentiating the weight condition at O5=0 gives i lambda="
                "-i lambda, hence lambda=0."
            ),
            "unique_solution": "lambda=0",
            "rows": phase_rows,
            "status": "E conditional on vacuum OS reflection",
        },
        "physical_scope": {
            "selected": (
                "the real OS-compatible trivialization of this specific even "
                "determinant-line counterterm"
            ),
            "not_selected": [
                "a flux/chirality orientation, because the lambda=0 term cannot split it",
                "complex Yukawa matrices or later spontaneous CP violation",
                "a non-vacuum finite-density reflection structure",
            ],
            "vectorlike_note": (
                "In the complete KO-6 vectorlike double the conjugate phases already "
                "cancel; the selector matters only when defining the physical chiral half."
            ),
        },
        "verdict": {
            "lambda_continuous_under_linear_reversal": "E",
            "lambda_continuous_under_anti_linear_vacuum_OS_reflection": "F",
            "OS_selected_lambda": 0,
            "determinant_phase_gate": "CLOSED conditional on the new reflection axiom",
            "orientation_branch_gate": "OPEN",
            "advance": (
                "The new reflection supplies the non-homogeneous equation absent from "
                "all previous symmetry audits.  It fixes the local determinant-line "
                "counterterm to lambda=0 without observational input."
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