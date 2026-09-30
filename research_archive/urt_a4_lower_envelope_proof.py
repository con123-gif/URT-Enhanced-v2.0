#!/usr/bin/env python3
"""Exact lower-envelope proof for the five-phase A4 Wilson symbol.

For five unit phases z_j, set

    Z = sum_j z_j,
    B = (25-|Z|^2)/10,
    S_j = Im(z_j conjugate(Z))/5.

This certificate proves, without observational input,

    ||S||^2 >= 2 B-(5/4) B^2,       0 <= B <= 8/5,

and classifies equality as a 1+4 two-phase cluster.  It also records the
resulting exact conditional minimax theorem for the normalized M=1 Wilson
kernel.  The condition-number minimization principle remains a proposed URT
axiom; the inequality and the algebra conditional on that principle are exact.
"""

from __future__ import annotations

import argparse
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np


def fourth_moment_stationary_cases() -> dict[str, Any]:
    """Return the exact stationary-point classification of the kurtosis lemma.

    On sum(u_j)=0 and sum(u_j^2)=1, a maximizer of sum(u_j^4)
    has coordinates among the roots of a depressed cubic.  There are at most
    three occupied values.  The finite multiplicity enumeration below is the
    complete list up to permutation and an overall sign.
    """

    two_value = {}
    for k in (1, 2):
        ell = 5 - k
        ratio = Fraction(k**3 + ell**3, 25 * k * ell)
        two_value[f"{k}+{ell}"] = {
            "M4_over_E2": str(ratio),
            "decimal": float(ratio),
        }

    three_value = {
        "multiplicities_3_1_1": {
            "root_pattern": "0, +q, -q with zero repeated three times",
            "M4_over_E2": "1/2",
            "decimal": 0.5,
        },
        "multiplicities_2_2_1": {
            "root_pattern": "+q, -q, 0 with +/-q repeated twice",
            "M4_over_E2": "1/4",
            "decimal": 0.25,
        },
    }
    ratios = [
        Fraction(value["M4_over_E2"])
        for value in two_value.values()
    ] + [Fraction(1, 2), Fraction(1, 4)]
    maximum = max(ratios)
    if maximum != Fraction(13, 20):
        raise AssertionError(f"unexpected fourth-moment maximum {maximum}")

    return {
        "normalization": "sum u_j=0 and E=sum u_j^2=1",
        "lagrange_polynomial": "4 x^3-2 lambda x-mu=0",
        "two_value_cases": two_value,
        "three_value_cases": three_value,
        "sharp_bound": "sum u_j^4 <= (13/20)(sum u_j^2)^2",
        "sharp_constant": str(maximum),
        "equality": "permutation and scaling of (4,-1,-1,-1,-1)",
        "status": "E",
    }


def hermite_minorant_coefficients(a: float) -> tuple[float, float, float]:
    """Coefficients q(v)=A+Bv+Cv^2 for the forward-vector lemma."""

    if not 0.0 <= a <= 1.0:
        raise ValueError("a must lie in [0,1]")
    c = 1.0 - a * a
    b = math.sqrt(1.0 - c / 16.0)
    if c == 0.0:
        return 1.0, 0.0, 0.0
    derivative = -c / (2.0 * b)
    coefficient_c = (256.0 / 225.0) * (
        a - b - 15.0 * derivative / 16.0
    )
    coefficient_b = derivative - coefficient_c / 8.0
    coefficient_a = b - derivative / 16.0 + coefficient_c / 256.0
    return coefficient_a, coefficient_b, coefficient_c


def deterministic_factor_checks() -> dict[str, Any]:
    """Numerically audit the exact Hermite factorization on a fixed grid."""

    maximum_identity_residual = 0.0
    minimum_minorant_gap = math.inf
    maximum_c = -math.inf
    maximum_b = -math.inf
    maximum_a_minus_one = -math.inf

    # The endpoints are included.  Values immediately below a=1 check the
    # degenerate limit where all three nonconstant coefficients vanish.
    a_grid = np.concatenate(
        [np.linspace(0.0, 0.99, 200), np.asarray([0.999, 0.9999, 1.0])]
    )
    v_grid = np.linspace(0.0, 1.0, 1001)
    for a in a_grid:
        c = 1.0 - a * a
        A, B, C = hermite_minorant_coefficients(float(a))
        h = np.sqrt(np.maximum(0.0, 1.0 - c * v_grid))
        q = A + B * v_grid + C * v_grid**2
        factor = (
            (v_grid - 1.0 / 16.0) ** 2
            * (1.0 - v_grid)
            * (C * C * v_grid + 256.0 * (1.0 - A * A))
        )
        identity_residual = np.max(np.abs((h * h - q * q) - factor))
        maximum_identity_residual = max(
            maximum_identity_residual, float(identity_residual)
        )
        minimum_minorant_gap = min(
            minimum_minorant_gap, float(np.min(h - q))
        )
        if a < 1.0:
            maximum_c = max(maximum_c, C)
            maximum_b = max(maximum_b, B)
        maximum_a_minus_one = max(maximum_a_minus_one, A - 1.0)

    if maximum_identity_residual > 2.0e-12:
        raise AssertionError(maximum_identity_residual)
    if minimum_minorant_gap < -2.0e-13:
        raise AssertionError(minimum_minorant_gap)
    if maximum_c >= 0.0 or maximum_b >= 0.0:
        raise AssertionError((maximum_b, maximum_c))
    if maximum_a_minus_one > 2.0e-15:
        raise AssertionError(maximum_a_minus_one)

    return {
        "a_grid_count": int(a_grid.size),
        "v_grid_count": int(v_grid.size),
        "maximum_squared_factorization_residual": maximum_identity_residual,
        "minimum_h_minus_q": minimum_minorant_gap,
        "largest_C_for_a_strictly_below_1": maximum_c,
        "largest_B_for_a_strictly_below_1": maximum_b,
        "largest_A_minus_1": maximum_a_minus_one,
        "role": "floating-point audit of the displayed exact identities",
    }


def minimax_root_certificate() -> dict[str, Any]:
    """Give an exact rational isolating interval for the admissible cubic root."""

    def polynomial(value: Fraction) -> Fraction:
        return (
            240 * value**3
            - 392 * value**2
            - 28 * value
            + 185
        )

    lower = Fraction("1.16954339716037")
    upper = Fraction("1.16954339716038")
    lower_value = polynomial(lower)
    upper_value = polynomial(upper)
    if not lower_value < 0 < upper_value:
        raise AssertionError((lower_value, upper_value))

    roots = np.roots(np.asarray([240.0, -392.0, -28.0, 185.0]))
    admissible = sorted(
        float(root.real)
        for root in roots
        if abs(root.imag) < 1.0e-12 and lower < root.real < upper
    )
    if len(admissible) != 1:
        raise AssertionError(admissible)

    return {
        "polynomial": "240 r^3-392 r^2-28 r+185",
        "isolating_interval": [str(float(lower)), str(float(upper))],
        "exact_sign_at_lower": str(lower_value),
        "exact_sign_at_upper": str(upper_value),
        "decimal_root": admissible[0],
        "uniqueness_on_admissible_branch": (
            "P'(r)=720r^2-784r-28 is positive for r>=r_entry; "
            "P(r_entry)<P(1.1626)<0, while the upper isolating endpoint "
            "has positive P."
        ),
        "status": "E conditional on adopting global condition-number minimization",
    }


def proof_record() -> dict[str, Any]:
    fourth = fourth_moment_stationary_cases()
    diagnostics = deterministic_factor_checks()
    root = minimax_root_certificate()
    return {
        "certificate": "URT exact five-phase A4 lower envelope",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "theorem": {
            "statement": (
                "For five unit phases, ||S||^2 >= 2B-(5/4)B^2 on "
                "0<=B<=8/5. Equality is exactly a 1+4 two-phase cluster, "
                "up to common phase, permutation and conjugation."
            ),
            "status": "E",
        },
        "reduction": {
            "definitions": (
                "Rotate Z=sum z_j=rho>0 to the real axis; write "
                "z_j=x_j+i y_j. Then sum x_j=rho, sum y_j=0, "
                "Y=sum y_j^2, and ||S||^2=rho^2 Y/25."
            ),
            "range": "0<=B<=8/5 is equivalent to 3<=rho<=5",
            "individual_resultant_bound": (
                "|Z-z_j|<=4 gives x_j>=a=(rho^2-15)/(2rho)."
            ),
            "target_in_Y": (
                "Y >= (5/4)(1-a^2) = "
                "5(25-rho^2)(rho^2-9)/(16rho^2)."
            ),
        },
        "backward_vector_case": {
            "proof": (
                "There is at most one x_j<0. Write it x_1=-u. Then "
                "u<=-a and Cauchy applied to y_1=-sum_{j>1}y_j gives "
                "Y>=y_1^2+y_1^2/4=(5/4)(1-u^2)>=(5/4)(1-a^2)."
            ),
            "equality": (
                "u=-a and the other four transverse components coincide; "
                "|Z-z_1|=4 then forces the other four unit phases to coincide."
            ),
            "status": "E",
        },
        "sharp_fourth_moment_lemma": fourth,
        "forward_vector_case": {
            "normalization": (
                "For a>=0 put c=1-a^2 and u_j=y_j/sqrt(c). "
                "Then |u_j|<=1 and sum u_j=0."
            ),
            "Hermite_minorant": (
                "For h(v)=sqrt(1-cv), let q(v)=A+Bv+Cv^2 satisfy "
                "q(1)=a, q(1/16)=h(1/16)=b, and "
                "q'(1/16)=h'(1/16), where b=sqrt(1-c/16)."
            ),
            "coefficients": {
                "C": "(256/225)[a-b+15c/(32b)]",
                "B": "-c/(2b)-C/8",
                "A": "b+c/(32b)+C/256",
            },
            "exact_factorization": (
                "h(v)^2-q(v)^2=(v-1/16)^2(1-v)"
                "[C^2 v+256(1-A^2)]."
            ),
            "coefficient_signs": (
                "For 0<=a<1, C<0 and B<0, while 0<A<=1. "
                "The sign checks reduce respectively to "
                "(15+17a^2)^2-(32ab)^2=225(1-a^2)^2, "
                "the two-region identity "
                "(64ab)^2-(259a^2-195)^2="
                "225(1-a^2)(297a^2-169), and "
                "16{[b(450-2a)]^2-(435+13a^2)^2}="
                "900(1-a)^3(3a+11)."
            ),
            "summed_bound": (
                "If E=sum u_j^2<=5/4, the minorant and the fourth-moment "
                "lemma give sum h(u_j^2)>=5A+(5/4)B+(65/64)C="
                "a+4b. Since rho=a+4b identically, equality rigidity "
                "forces E=5/4 and u proportional to (4,-1,-1,-1,-1)."
            ),
            "a_negative_all_forward_subcase": (
                "If rho<sqrt(15) but all x_j>=0, apply the a=0 forward "
                "lemma. Y<=5/4 would force rho>=sqrt(15), so "
                "Y>5/4>=(5/4)(1-a^2)."
            ),
            "status": "E",
        },
        "conversion_to_A4_envelope": (
            "Multiplying the Y bound by rho^2/25 and using "
            "rho^2=25-10B gives ||S||^2 >= "
            "(25-rho^2)(rho^2-9)/80=2B-(5/4)B^2."
        ),
        "diagnostics": diagnostics,
        "conditional_minimax_consequence": {
            "entry": "r_entry=(5+sqrt(185))/16",
            "minimum_for_r_at_or_above_entry": (
                "h_min^2=(2r-9/4)/(r^2-5/4)"
            ),
            "maximum_for_r_at_or_above_entry": "h_max^2=(5r/2-1)^2",
            "root_certificate": root,
            "principle_status": (
                "C: minimizing the global kernel condition number is a new "
                "candidate axiom, not a recovered URT premise."
            ),
            "algebra_status": "E conditional on that candidate axiom",
        },
        "phenomenology_gate": "CLOSED",
        "unfixed_after_this_proof": [
            "the history Mobius/locality parameter t",
            "domain-wall transfer scale and extent",
            "microscopic gauge-link action",
            "determinant-line trivialization lambda",
        ],
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    serialized = json.dumps(proof_record(), indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(serialized, end="")
    else:
        args.output.write_text(serialized)


if __name__ == "__main__":
    main()