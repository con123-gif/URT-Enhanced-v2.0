#!/usr/bin/env python3
"""Scale-selection audit for the fermionic entropy spectral action.

For h(x)=log(1+e^-x)+x/(1+e^x), the scale orbit

    S(s)=Tr h(beta s |D|)

is strictly decreasing for s>0 whenever D is nonzero.  Hence entropy by itself
does not possess a nonzero finite stationary Dirac scale: maximizing it selects
D=0, while minimizing the positive entropy action sends every nonzero singular
value to infinity (leaving log(2) per exact zero mode).  Moreover beta and D
occur only through beta D, giving the exact orbit (D,beta)->(aD,beta/a).

This tests a selection claim, not the established entropy/spectral-action
identity.  No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import numpy as np


ETA_DELTA = 5.995797986741314


def h(x: np.ndarray | float) -> np.ndarray | float:
    x_array = np.asarray(x, dtype=float)
    # All audit arguments are nonnegative and moderate.  This stable form also
    # behaves correctly at zero.
    values = np.logaddexp(0.0, -x_array) + x_array / (1.0 + np.exp(x_array))
    if np.ndim(x) == 0:
        return float(values)
    return values


def h_prime(x: np.ndarray | float) -> np.ndarray | float:
    x_array = np.asarray(x, dtype=float)
    ex = np.exp(x_array)
    values = -x_array * ex / (1.0 + ex) ** 2
    if np.ndim(x) == 0:
        return float(values)
    return values


def spectral_entropy(beta: float, scale: float, singular_values: np.ndarray) -> float:
    return float(np.sum(h(beta * scale * singular_values)))


def scale_derivative(beta: float, scale: float, singular_values: np.ndarray) -> float:
    x = beta * scale * singular_values
    return float(np.sum(beta * singular_values * h_prime(x)))


def audit_spectrum(name: str, singular_values: np.ndarray) -> dict[str, object]:
    scales = np.array([0.0, 0.125, 0.25, 0.5, 1.0, 2.0, 4.0])
    values = [spectral_entropy(ETA_DELTA, float(s), singular_values) for s in scales]
    derivatives = [
        scale_derivative(ETA_DELTA, float(s), singular_values) for s in scales[1:]
    ]
    zero_count = int(np.sum(singular_values == 0.0))
    return {
        "name": name,
        "singular_values": singular_values.tolist(),
        "scales": scales.tolist(),
        "entropy_values": values,
        "positive_scale_derivatives": derivatives,
        "strictly_decreasing_sampled": bool(
            all(values[i + 1] < values[i] for i in range(len(values) - 1))
        ),
        "maximum_at_zero": float(len(singular_values) * math.log(2.0)),
        "large_scale_limit": float(zero_count * math.log(2.0)),
        "zero_mode_count": zero_count,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    passive = np.ones(4)
    hidden = np.array([0.0, 0.0, 2.0])
    generic = np.array([0.3, 0.8, 1.7, 2.4, 3.1])

    spectra = [
        audit_spectrum("passive |D|=I4", passive),
        audit_spectrum("hidden |D|=diag(0,0,2)", hidden),
        audit_spectrum("generic nonzero witness", generic),
    ]

    # Exact beta-D rescaling orbit, checked numerically on an irregular spectrum.
    base_beta = 1.731
    base_scale = 0.847
    base_value = spectral_entropy(base_beta, base_scale, generic)
    rescaling_rows = []
    for a in (0.2, 0.5, 2.0, 7.0):
        transformed_value = spectral_entropy(base_beta / a, a * base_scale, generic)
        rescaling_rows.append(
            {
                "a": a,
                "S_beta_over_a_aD": transformed_value,
                "residual_from_S_beta_D": abs(transformed_value - base_value),
            }
        )

    # Central finite differences verify the analytic derivative away from zero.
    derivative_rows = []
    epsilon = 1.0e-6
    for scale in (0.1, 0.4, 1.0, 2.5):
        analytic = scale_derivative(ETA_DELTA, scale, generic)
        finite_difference = (
            spectral_entropy(ETA_DELTA, scale + epsilon, generic)
            - spectral_entropy(ETA_DELTA, scale - epsilon, generic)
        ) / (2.0 * epsilon)
        derivative_rows.append(
            {
                "scale": scale,
                "analytic": analytic,
                "finite_difference": finite_difference,
                "residual": abs(analytic - finite_difference),
            }
        )

    max_rescaling_residual = max(
        row["residual_from_S_beta_D"] for row in rescaling_rows
    )
    max_derivative_residual = max(row["residual"] for row in derivative_rows)

    out = {
        "certificate": "URT entropy spectral-action Dirac-scale no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "universal_function": {
            "h": "log(1+exp(-x))+x/(1+exp(x)), x>=0",
            "h_prime": "-x exp(x)/(1+exp(x))^2",
            "endpoint_values": {"h(0)": "log(2)", "h(infinity)": 0},
            "monotonicity": "h'(x)<0 for every x>0",
            "status": "E",
        },
        "scale_orbit_theorem": {
            "action": "S(s)=sum_j h(beta s sigma_j), sigma_j>=0",
            "derivative": (
                "S'(s)=-beta^2 s sum_j sigma_j^2 exp(beta s sigma_j)/"
                "(1+exp(beta s sigma_j))^2"
            ),
            "consequence": (
                "For beta>0 and at least one nonzero sigma_j, S'(s)<0 for all "
                "s>0.  There is no nonzero finite stationary scale."
            ),
            "maximization": "s=0, giving dim(H) log(2)",
            "minimization": (
                "runaway s->infinity, with limit dim ker(D) log(2); the limit "
                "is zero when D is invertible"
            ),
            "status": "E",
        },
        "Cathedral_spectra": spectra,
        "beta_D_identifiability": {
            "identity": "S_{beta/a}(aD)=S_beta(D) for every a>0",
            "base_value": base_value,
            "rows": rescaling_rows,
            "maximum_residual": max_rescaling_residual,
            "consequence": (
                "The entropy action cannot separately select inverse KMS scale and "
                "Dirac normalization."
            ),
            "status": "E",
        },
        "derivative_numerical_audit": {
            "rows": derivative_rows,
            "maximum_residual": max_derivative_residual,
        },
        "continuum_coefficient_implication": {
            "four_dimensional_scaling": (
                "Tr h(beta|D|) ~ h4 beta^-4 a0+h2 beta^-2 a2+h0 a4+..."
            ),
            "fixed_by_entropy_theorem": "dimensionless moment ratios h0:h2:h4",
            "not_fixed": (
                "beta/length normalization, the choice of D and finite block, an "
                "overall boson-to-fermion action weight, and additive vacuum terms"
            ),
            "note": (
                "Fixing a principal symbol, norm, volume, or lattice-to-length map "
                "can stop the scale orbit only as an additional premise."
            ),
        },
        "verdict": {
            "entropy_selects_nonzero_finite_Dirac_scale": "F",
            "entropy_separately_selects_beta_and_D": "F",
            "entropy_fixes_cutoff_moment_ratios": "E conditional on the KMS premise",
            "unique_Cathedral_action": "U",
            "advance": (
                "The universal entropy cutoff repairs generic cutoff-shape freedom "
                "but supplies no variational mechanism for a finite nonzero Dirac "
                "scale.  The exact beta-D orbit is the spectral counterpart of the "
                "master affine identifiability quotient."
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