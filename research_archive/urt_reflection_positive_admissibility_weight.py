#!/usr/bin/env python3
"""Reflection-positive compact-support admissibility weights.

The compact-overlap global-gap obstruction requires excluding rough
plaquettes.  A sharp indicator of the admissible U(1) arc is not suitable for
link reflection: its Fourier coefficients sin(n delta)/(pi n) change sign.

There is, however, an exact constructive repair.  Let f be a real,
nonnegative class function supported in a sufficiently small identity
neighborhood V of a compact gauge group, and set

    w(g) = (f * f_tilde)(g),       f_tilde(g)=f(g^{-1}).

Then w is pointwise nonnegative, is supported in V V^{-1}, and its Peter-Weyl
coefficient in every representation is f_hat f_hat^dagger, hence positive
semidefinite.  A plaquette product of w therefore lies in the standard
positive-character reflection cone while assigning zero weight outside an
admissible neighborhood.

For U(1), a box f gives the explicit triangular weight

    w_delta(theta)=max(1-|theta|/delta,0),

whose coefficients are (1-cos(n delta))/(pi delta n^2)>=0.  A C-infinity
compact bump f gives a smooth autocorrelation with a positive quadratic
small-field action, avoiding the triangle's cusp.

This proves compatibility of admissibility with the nonnegative-character OS
cone only by giving up real analyticity at the identity.  Creutz's positivity
theorem shows that a nonzero single-plaquette weight cannot simultaneously
have nonnegative character coefficients, be analytic near the identity, and
vanish on an open set.  The later exact Cathedral gap certificate supplies
epsilon_*=0.00112194993744186... .  For U(1), choosing the triangle support
angle delta=epsilon_*/2 gives

    ||1-U_face|| <= 2 sin(delta/2) < delta < epsilon_*.

For a general compact group, continuity supplies an identity neighborhood V
with V V^{-1} inside the same representation-norm ball.  Thus the
nonanalytic gauge weight can enforce the proved gap.  Fermionic overlap
reflection positivity and the continuum limit remain separate problems.
No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np


EPSILON_STAR = Fraction(
    394924599595820227835064176865,
    351998414917049746226536404412312,
)


def sharp_coefficient(delta: float, mode: int) -> float:
    if mode == 0:
        return delta / math.pi
    return math.sin(mode * delta) / (math.pi * mode)


def triangle_coefficient(delta: float, mode: int) -> float:
    if mode == 0:
        return delta / (2.0 * math.pi)
    return (1.0 - math.cos(mode * delta)) / (
        math.pi * delta * mode**2
    )


def smooth_bump_audit(delta: float, grid_size: int = 65536) -> dict[str, Any]:
    angles = 2.0 * math.pi * np.arange(grid_size) / grid_size
    principal = (angles + math.pi) % (2.0 * math.pi) - math.pi
    scaled = 2.0 * principal / delta
    bump = np.zeros(grid_size)
    inside = np.abs(scaled) < 1.0
    bump[inside] = np.exp(-1.0 / (1.0 - scaled[inside] ** 2))

    # DFT convention: f_hat[n]=(1/N)sum_j f_j exp(-2 pi i n j/N).
    f_hat = np.fft.fft(bump) / grid_size
    positive_coefficients = np.abs(f_hat) ** 2
    autocorrelation = np.fft.ifft(
        np.fft.fft(bump) * np.conjugate(np.fft.fft(bump))
    ).real / grid_size

    outside_support = np.abs(principal) > delta + 4.0 * math.pi / grid_size
    support_leakage = float(np.max(np.abs(autocorrelation[outside_support])))
    minimum_weight = float(np.min(autocorrelation))

    step = 2.0 * math.pi / grid_size
    derivative = np.gradient(bump, step, edge_order=2)
    integral_f_squared = float(np.mean(bump**2))
    integral_derivative_squared = float(np.mean(derivative**2))
    predicted_quadratic = integral_derivative_squared / (
        2.0 * integral_f_squared
    )
    normalized = autocorrelation / autocorrelation[0]
    sample_index = max(2, int(round(0.002 / step)))
    sample_angle = sample_index * step
    measured_quadratic = -math.log(normalized[sample_index]) / sample_angle**2

    return {
        "delta": delta,
        "grid_size": grid_size,
        "minimum_pointwise_weight": minimum_weight,
        "support_leakage_outside_delta": support_leakage,
        "minimum_Fourier_coefficient_all_grid_modes": float(
            np.min(positive_coefficients)
        ),
        "minimum_Fourier_coefficient_modes_0_to_512": float(
            np.min(positive_coefficients[:513])
        ),
        "maximum_imaginary_coefficient": float(np.max(np.abs(f_hat.imag))),
        "predicted_small_field_quadratic_coefficient": predicted_quadratic,
        "measured_small_field_quadratic_coefficient": measured_quadratic,
        "quadratic_relative_residual": abs(
            measured_quadratic / predicted_quadratic - 1.0
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    delta_rows = []
    for delta in (0.05, 0.2, 0.6, 1.0, 2.5):
        bad_mode = math.floor(math.pi / delta) + 1
        sharp_bad = sharp_coefficient(delta, bad_mode)
        if not sharp_bad < 0.0:
            raise AssertionError((delta, bad_mode, sharp_bad))
        triangle_values = [triangle_coefficient(delta, n) for n in range(1025)]
        if min(triangle_values) < -1.0e-16:
            raise AssertionError((delta, min(triangle_values)))
        delta_rows.append(
            {
                "delta": delta,
                "sharp_cutoff_first_constructed_negative_mode": bad_mode,
                "sharp_cutoff_negative_coefficient": sharp_bad,
                "triangle_minimum_coefficient_n_0_to_1024": min(triangle_values),
                "triangle_c0": triangle_values[0],
                "triangle_formula": (
                    "c0=delta/(2pi); cn=(1-cos(n delta))/(pi delta n^2)"
                ),
            }
        )

    bump_rows = [smooth_bump_audit(delta) for delta in (0.2, 0.6, 1.0)]

    certified_delta = float(EPSILON_STAR) / 2.0
    certified_maximum_deviation = 2.0 * math.sin(certified_delta / 2.0)
    if not certified_maximum_deviation < certified_delta < float(EPSILON_STAR):
        raise RuntimeError("certified U(1) support does not lie inside the gap ball")

    # If ||1-U_p||<epsilon is required, a U(1) arc |theta|<delta
    # suffices whenever 2 sin(delta/2)<epsilon.
    epsilon_examples = []
    for epsilon in (0.01, 0.05, 0.1):
        maximal_angle = 2.0 * math.asin(epsilon / 2.0)
        chosen_delta = 0.9 * maximal_angle
        epsilon_examples.append(
            {
                "epsilon": epsilon,
                "maximal_arc_angle": maximal_angle,
                "example_strict_delta": chosen_delta,
                "maximum_link_deviation_on_support": 2.0
                * math.sin(chosen_delta / 2.0),
                "strictly_inside_epsilon": bool(
                    2.0 * math.sin(chosen_delta / 2.0) < epsilon
                ),
            }
        )

    out: dict[str, Any] = {
        "certificate": "URT reflection-positive admissibility weight",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "sharp_cutoff_no_go": {
            "weight": "1 if |theta|<delta, 0 otherwise",
            "Fourier_coefficients": (
                "c0=delta/pi; cn=sin(n delta)/(pi n)"
            ),
            "negative_mode_construction": (
                "n=floor(pi/delta)+1 gives pi<n delta<pi+delta<2pi, "
                "so cn<0 for every 0<delta<pi"
            ),
            "rows": delta_rows,
            "conclusion": (
                "The naive hard indicator is outside the link-reflection "
                "positive-character cone."
            ),
            "status": "E",
        },
        "U1_triangle_construction": {
            "seed_function": "f=indicator of |theta|<delta/2",
            "autocorrelation": "w=f*f_tilde=max(delta-|theta|,0), up to scale",
            "normalized_weight": "max(1-|theta|/delta,0)",
            "support": "|theta|<=delta",
            "Fourier_nonnegativity": (
                "cn=(1-cos(n delta))/(pi delta n^2)>=0"
            ),
            "small_field_warning": (
                "The triangle has a cusp and is an existence proof for the "
                "reflection cone, not the preferred continuum action."
            ),
            "status": "E",
        },
        "smooth_compact_construction": {
            "seed_function": (
                "f_delta(theta)=exp[-1/(1-(2theta/delta)^2)] for "
                "|theta|<delta/2, and 0 otherwise"
            ),
            "weight": "w=f_delta*f_delta_tilde",
            "properties": [
                "w is C-infinity, pointwise nonnegative and supported in |theta|<=delta",
                "w_hat(n)=|f_hat(n)|^2>=0 for every integer n",
                "-log(w(theta)/w(0))=kappa theta^2+O(theta^4)",
                "kappa=integral |f'|^2/(2 integral |f|^2)>0",
                "w is necessarily nonanalytic at theta=0 despite being C-infinity",
            ],
            "numerical_quadrature_checks": bump_rows,
            "status": "E C-infinity/nonanalytic formulas; N quadrature corroboration",
        },
        "general_compact_group_theorem": {
            "premise": (
                "G compact; f real nonnegative central L2 function supported "
                "in an identity neighborhood V"
            ),
            "construction": "w=f*f_tilde, f_tilde(g)=f(g^-1)",
            "pointwise_nonnegative": (
                "w(g)=integral f(h)f(g^-1 h)dh>=0"
            ),
            "support": "supp(w) subset V V^-1",
            "Peter_Weyl_coefficients": "w_hat(R)=f_hat(R) f_hat(R)^dagger>=0",
            "central_case": (
                "Schur's lemma makes each coefficient a nonnegative scalar "
                "multiple of the identity, hence a nonnegative character coefficient"
            ),
            "reflection_consequence": (
                "A product of such plaquette weights has the standard crossing-"
                "plaquette positive-character expansion and is link-reflection positive."
            ),
            "status": "E",
        },
        "analytic_transfer_matrix_boundary": {
            "theorem": (
                "For a single-plaquette weight analytic near the identity, "
                "nonnegative Fourier/character coefficients imply an analytic "
                "continuation to an annulus. Vanishing on an open group region "
                "then forces the weight to vanish identically."
            ),
            "application": (
                "Both the triangular and smooth-bump autocorrelation weights "
                "evade the theorem only because they are not real analytic at "
                "the identity; C-infinity is not enough."
            ),
            "primary_source": {
                "authors": "Michael Creutz",
                "title": "Positivity and topology in lattice gauge theory",
                "arXiv": "hep-lat/0409017",
                "url": "https://arxiv.org/abs/hep-lat/0409017"
            },
            "status": "E literature theorem plus exact application",
        },
        "admissibility_translation": {
            "U1_identity": "||1-exp(i theta)||=2|sin(theta/2)|",
            "examples": epsilon_examples,
            "instruction": (
                "For the now-certified epsilon_*, any support angle "
                "delta<2 asin(epsilon_*/2) enforces the kernel gap."
            ),
        },
        "certified_overlap_gap_implementation": {
            "epsilon_star_exact": (
                f"{EPSILON_STAR.numerator}/{EPSILON_STAR.denominator}"
            ),
            "epsilon_star_numeric": float(EPSILON_STAR),
            "U1_support_angle_choice": "delta=epsilon_star/2",
            "U1_support_angle_numeric": certified_delta,
            "maximum_U1_face_deviation_on_support": certified_maximum_deviation,
            "strict_chain": (
                "2 sin(delta/2)<delta=epsilon_star/2<epsilon_star"
            ),
            "general_compact_group_choice": (
                "choose an identity neighborhood V so that V V^-1 is inside "
                "the epsilon_star representation-norm ball, then use w=f*f_tilde"
            ),
            "gauge_weight_pointwise_nonnegative": True,
            "gauge_weight_in_positive_character_cone": True,
            "strict_local_overlap_gap_enforced": True,
            "real_analytic_at_identity": False,
            "status": "E conditional nonanalytic gauge-weight/gap merger",
        },
        "verdict": {
            "admissibility_and_OS_character_semipositivity_compatible": True,
            "admissibility_and_analytic_positive_transfer_compatible": False,
            "naive_indicator_allowed": False,
            "explicit_nonanalytic_positive_character_weight_exists": True,
            "conventional_continuum_repair_proved": False,
            "Cathedral_overlap_gap_repaired_now": True,
            "remaining_steps": [
                "adopt or reject the explicitly nonanalytic compact-support transfer weight",
                "prove the fermion-plus-gauge interacting OS cone and chiral measure",
                "establish the continuum/universality class of the new gauge weight",
            ],
            "status": (
                "E nonanalytic gauge-weight/gap merger; F analytic admissibility; "
                "U fermionic OS and continuum merger"
            ),
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()