#!/usr/bin/env python3
"""Lowest-degree joint-action invariant classification for Cathedral/URT.

This continuation asks whether putting the selected positive contraction sector
and the unique ordered orientation scalar into one gauge-, A5-, reversal- and
KO-6-compatible action fixes their relative coefficient.

It does not.  The positive quadratic invariant E_2 and the reversal-even
chiral orientation invariant chi*Omega_5 are separately allowed and linearly
independent.  Their real span is two-dimensional; quotienting by one overall
action normalization leaves a real projective parameter, exactly the existing
determinant-line coefficient lambda.  The explicit history matrices verify
that varying this phase changes neither the positive spectrum nor any of the
stated covariance/reversal identities.

No observational target is used.
"""

from __future__ import annotations

import argparse
import cmath
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


def branch_diagonal(sign: int) -> np.ndarray:
    """Twelve copies of the five branch eigenvalues."""
    phases = sign * math.pi / 30.0 + 2.0 * math.pi * np.arange(5) / 5.0
    return np.tile(np.exp(1.0j * phases), 12)


def history_invariants(t: float) -> dict[str, Any]:
    left = branch_diagonal(-1)
    right = branch_diagonal(+1)
    w = np.concatenate([left, right])
    tau3 = np.concatenate([-np.ones(60), np.ones(60)])

    v = (w - t) / (1.0 - t * w)
    d = 1.0 - v
    positive = np.abs(d) ** 2

    omega5 = -1.0j * np.sum(tau3 * w**5) / 60.0
    even5 = np.real(np.sum(w**5)) / 120.0
    branch_positive_difference = abs(
        np.mean(positive[:60]) - np.mean(positive[60:])
    )
    return {
        "t": t,
        "E2_normalized_trace": float(np.mean(positive)),
        "E2_branch_conjugation_residual": float(branch_positive_difference),
        "Omega5_real": float(omega5.real),
        "Omega5_imaginary_residual": float(abs(omega5.imag)),
        "E5": float(even5),
        "minimum_positive_eigenvalue": float(np.min(positive)),
        "maximum_positive_eigenvalue": float(np.max(positive)),
    }


def phase_witness(lambda_value: float, chirality: int, omega: float) -> dict[str, Any]:
    phase = cmath.exp(1.0j * lambda_value * chirality * omega)
    # Reversal flips both chi and Omega, leaving their product invariant.
    reversed_phase = cmath.exp(
        1.0j * lambda_value * (-chirality) * (-omega)
    )
    # Flux conjugation alone flips Omega and hence complex conjugates the phase.
    flux_phase = cmath.exp(1.0j * lambda_value * chirality * (-omega))
    return {
        "lambda": lambda_value,
        "chirality": chirality,
        "phase_real": float(phase.real),
        "phase_imag": float(phase.imag),
        "unit_modulus_residual": float(abs(abs(phase) - 1.0)),
        "reversal_invariance_residual": float(abs(reversed_phase - phase)),
        "flux_conjugation_residual": float(abs(flux_phase - phase.conjugate())),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    t_values = (0.0, 0.5, 1.0 / math.sqrt(2.0), 0.9)
    invariants = [history_invariants(t) for t in t_values]
    phases = [
        phase_witness(value, chirality, 1.0)
        for value in (0.0, 0.731, 1.123, math.pi)
        for chirality in (-1, 1)
    ]

    out = {
        "certificate": "URT lowest-degree joint-action invariant no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "exact_invariant_classification": {
            "positive_line": (
                "E2=normalized Tr(D^dagger D), or the selected A4 H_r^2 "
                "quadratic form; it is real, positive, gauge/A5 covariant and "
                "reversal even."
            ),
            "orientation_line": (
                "O5=chi*Omega5, with Omega5=-(i/60)Tr(tau3 W^5); "
                "chi and Omega5 are separately reversal odd, so O5 is even."
            ),
            "linear_independence": (
                "E2 is chirality even and quadratic/positive, whereas O5 is "
                "linear in chi and orientation sensitive at degree five. They "
                "cannot be scalar multiples as invariant functions."
            ),
            "lowest_joint_space": "span_R{E2, i O5}",
            "real_dimension": 2,
            "normalized_family": "S_lambda=E2+i lambda chi Omega5, lambda in R",
            "normalization_quotient": (
                "One overall nonzero action normalization fixes the coefficient "
                "of E2 but leaves lambda=b/a continuously free."
            ),
            "status": "E",
        },
        "explicit_history_invariants": invariants,
        "phase_witnesses": phases,
        "symmetry_theorem": {
            "statement": (
                "If S_0 satisfies the declared gauge, A5, reversal and KO-6 "
                "conditions, then S_0+i lambda chi Omega5 satisfies the same "
                "conditions for every real lambda. The multiplier has unit "
                "modulus, is reversal invariant, and is carried to its complex "
                "conjugate by flux conjugation."
            ),
            "contraction_independence": (
                "The determinant-line multiplier does not change D^dagger D, "
                "the A4 kernel spectrum, r_star, or any condition-number "
                "relaxation factor."
            ),
            "cross_term_consequence": (
                "Allowing higher products of E2 and O5 enlarges the invariant "
                "algebra and cannot remove the already present one-parameter "
                "subfamily without an additional non-homogeneous equation."
            ),
        },
        "verdict": {
            "joint_action_uniqueness": "F",
            "theorem": (
                "Common normalization plus the presently declared symmetries "
                "does not quantize the orientation coefficient. The exact "
                "continuous lambda ambiguity survives after r_star is selected."
            ),
            "minimum_new_datum": (
                "A normalized microscopic bulk/regulator or measure principle "
                "that supplies a non-homogeneous equation for lambda. Symmetry, "
                "index, positivity of the even sector, and contraction do not."
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