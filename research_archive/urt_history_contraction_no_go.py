#!/usr/bin/env python3
"""Exact contraction-selector no-go for the URT history Mobius family.

The normalized A4 kernel coefficient is selected by maximal uniform
contraction, but the same rule must also be tested on the still-free history
family

    V_t=(W-tI)(I-tW)^(-1),   D_t=I-V_t,   -1<t<1.

The branch spectra are known exactly from L^5=exp(-i*pi/6)I and
R^5=exp(+i*pi/6)I.  This certificate reduces every singular value of D_t to a
one-variable expression, proves that its condition number decreases strictly
throughout (-1,1), and identifies the only boundary infimum t->1 as the
trivial operator D_t->2I.  Thus a contraction rule alone cannot select a
nontrivial ordered-history action or its determinant phase.

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


def branch_phases() -> list[float]:
    phases: list[float] = []
    for sign in (-1.0, 1.0):
        for k in range(5):
            phases.append(sign * math.pi / 30.0 + 2.0 * math.pi * k / 5.0)
    return phases


def singular_squared_from_cosine(t: float, cosine: float) -> float:
    return (
        2.0
        * (1.0 + t) ** 2
        * (1.0 - cosine)
        / (1.0 + t * t - 2.0 * t * cosine)
    )


def spectral_data(t: float) -> dict[str, Any]:
    phases = branch_phases()
    values = np.asarray(
        [singular_squared_from_cosine(t, math.cos(theta)) for theta in phases]
    )
    minimum = float(np.min(values))
    maximum = float(np.max(values))
    condition_squared = maximum / minimum
    condition = math.sqrt(condition_squared)
    contraction = (condition - 1.0) / (condition + 1.0)
    return {
        "t": t,
        "minimum_DdaggerD": minimum,
        "maximum_DdaggerD": maximum,
        "condition_number_D_squared": condition_squared,
        "condition_number_D": condition,
        "optimal_abs_D_Richardson_factor": contraction,
    }


def direct_matrix_check(t: float) -> dict[str, float]:
    phases = branch_phases()
    w = np.diag(np.exp(1.0j * np.asarray(phases)))
    identity = np.eye(len(phases), dtype=complex)
    v = (w - t * identity) @ np.linalg.inv(identity - t * w)
    d = identity - v
    direct = np.linalg.svd(d, compute_uv=False)
    formula = np.sqrt(
        np.asarray(
            [singular_squared_from_cosine(t, math.cos(theta)) for theta in phases]
        )
    )
    return {
        "t": t,
        "unitarity_residual": float(np.linalg.norm(v.conj().T @ v - identity)),
        "singular_formula_residual": float(
            np.max(np.abs(np.sort(direct) - np.sort(formula)))
        ),
    }


def determinant_ratio(t: float) -> complex:
    z = cmath.exp(1.0j * math.pi / 6.0)
    return ((1.0 - t**5 / z) / (1.0 - t**5 * z)) ** 12


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    cosine_max = math.cos(math.pi / 30.0)
    cosine_min = -math.sqrt(3.0) / 2.0
    witnesses = [spectral_data(t) for t in (0.0, 0.5, 1.0 / math.sqrt(2.0), 0.9, 0.99)]
    direct = [direct_matrix_check(t) for t in (0.0, 0.5, 1.0 / math.sqrt(2.0), 0.9)]

    phase_witnesses = []
    for t in (0.0, 0.5, 1.0 / math.sqrt(2.0), 0.9, 0.99, 0.999999):
        ratio = determinant_ratio(t)
        phase_witnesses.append(
            {
                "t": t,
                "determinant_ratio_real": float(ratio.real),
                "determinant_ratio_imag": float(ratio.imag),
                "principal_half_phase": float(cmath.phase(ratio) / 2.0),
                "degree_five_coefficient": 6.0 * t**5,
            }
        )

    out = {
        "certificate": "URT history contraction-selector boundary-collapse no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "history_family": {
            "definition": "V_t=(W-tI)(I-tW)^(-1), D_t=I-V_t, -1<t<1",
            "branch_phases": "theta=+/- pi/30+2 pi k/5, k=0,...,4",
            "singular_value_formula": (
                "sigma_t(theta)^2=2(1+t)^2(1-cos(theta))/"
                "(1+t^2-2t cos(theta))"
            ),
            "cosine_max": cosine_max,
            "cosine_min": cosine_min,
            "minimum_phase": "|theta|=pi/30",
            "maximum_phase": "|theta|=5pi/6",
        },
        "exact_monotonicity_theorem": {
            "condition_ratio": (
                "K_D(t)=[(1-c_min)/(1-c_max)]"
                "[(1+t^2-2t c_max)/(1+t^2-2t c_min)]"
            ),
            "log_derivative": (
                "d log K_D/dt=2(c_min-c_max)(1-t^2)/"
                "[(1+t^2-2t c_max)(1+t^2-2t c_min)]"
            ),
            "sign": "strictly negative for -1<t<1",
            "infimum": "K_D(t)->1 as t->1",
            "boundary_operator": "V_1=-I and D_1=2I because 1 is not in spec(W)",
            "conclusion": (
                "Maximal uniform contraction has no nontrivial minimizer in the "
                "admissible open family. Its closure selects t=1, which erases W."
            ),
            "status": "E",
        },
        "spectral_witnesses": witnesses,
        "direct_matrix_checks": direct,
        "orientation_phase_witnesses": phase_witnesses,
        "orientation_boundary": {
            "exact_t_equals_1_ratio": "det D_1(R)/det D_1(L)=1",
            "meaning": (
                "At the contraction optimum the physical determinant ratio is "
                "orientation-blind, even though a continuously unwrapped logarithm "
                "can approach an integer multiple of pi."
            ),
        },
        "no_go": {
            "statement": (
                "The URT uniform-contraction rule that conditionally fixes the A4 "
                "Wilson coefficient cannot by itself fix a nontrivial history Mobius "
                "parameter: it drives the history operator to D=2I and loses the "
                "ordered five-cycle invariant."
            ),
            "required_repair": (
                "A joint even/odd action must constrain contraction and ordered "
                "orientation simultaneously. Any scalar tradeoff inserted between "
                "them would be a new coefficient and is not yet derived."
            ),
            "determinant_line_lambda": "unfixed",
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