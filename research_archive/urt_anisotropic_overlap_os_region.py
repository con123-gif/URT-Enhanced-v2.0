#!/usr/bin/env python3
"""Exact free-overlap OS region for the reflected Cathedral lattice.

The earlier common-cone audit left the inherited-metric overlap kernel at

    c_t = 2/sqrt(5),  r_t = 1,  M = 1

without an Osterwalder--Schrader (OS) proof.  This continuation resolves that
question and, importantly, audits the domain-wall-height loophole instead of
mistaking failure at M=1 for failure of the entire anisotropic family.

At zero spatial momentum, in a gamma_0 eigenspace,

    X_s(w) = (r_t-M)-r_t cos(w) + i s c_t sin(w).

Writing x=cos(w), the analytically continued polar radicand is

    Q(x)=((r_t-M)-r_t x)^2+c_t^2(1-x^2).

For 0<c_t<r_t its branch points are real precisely when

    (r_t-M)^2+c_t^2-r_t^2 >= 0.

On the standard low-height branch 0<M<=r_t this is

    0 < M <= r_t-sqrt(r_t^2-c_t^2).

The full reflected kernel has C(p)=prod_i cos(p_i/2),
S^2=sum_i sin^2(p_i), B=sum_i(1-cos(p_i)), and

    A=r_s B+r_t-M,
    Q_p(x)=S^2+(A-r_t C x)^2+c_t^2 C^2(1-x^2).

Its branch discriminant has the sign of

    R_p=c_t^2 A^2-(r_t^2-c_t^2)(S^2+c_t^2 C^2).

For c_t^2=4/5, r_t=1, M<=1-1/sqrt(5), and r_s>=7/6,
R_p>=R_0>=0 follows from S^2<=2B.  All cuts therefore lie on the
imaginary-energy axis.  On a cut, the lower eigenvalue of the OS residue is

    c_t C sinh(E)-sqrt(S^2+(A-r_t C cosh(E))^2) > 0,

exactly because Q_p(cosh(E))<0.  This gives the same positive spectral
factorization used in the standard free-overlap proof, now with a finite cut.

At M=1 the branch points instead leave the imaginary-energy axis.  A direct
massive-covariance OS Gram matrix supplies a finite negative-norm witness.
Thus M=1 is excluded, but the anisotropic aspect ratio itself is not.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import mpmath as mp
import numpy as np


def temporal_branch_roots(
    temporal_kinetic: float,
    temporal_wilson: float,
    overlap_height: float,
) -> np.ndarray:
    c = temporal_kinetic
    b = temporal_wilson
    a = b - overlap_height
    return np.roots([b * b - c * c, -2.0 * a * b, a * a + c * c])


def covariance_coefficients(
    temporal_kinetic: mp.mpf,
    overlap_height: mp.mpf,
    physical_mass: mp.mpf,
    count: int,
) -> list[mp.mpc]:
    """Positive-frequency coefficients in the gamma_0=+1 sector."""

    def propagator(momentum: mp.mpf) -> mp.mpc:
        scalar = 1 - overlap_height - mp.cos(momentum)
        x_value = scalar + 1j * temporal_kinetic * mp.sin(momentum)
        norm = mp.sqrt(
            scalar * scalar
            + temporal_kinetic * temporal_kinetic * mp.sin(momentum) ** 2
        )
        overlap = (1 + x_value / norm) / 2
        massive = physical_mass + (1 - physical_mass) * overlap
        return 1 / massive

    cuts = [mp.mpf(0), mp.pi / 2, mp.pi, 3 * mp.pi / 2, 2 * mp.pi]
    result: list[mp.mpc] = []
    for index in range(1, count + 1):
        integrand = lambda p: mp.e ** (1j * p * index) * propagator(p)
        integral = sum(
            mp.quad(integrand, [cuts[j], cuts[j + 1]]) for j in range(4)
        )
        result.append(integral / (2 * mp.pi))
    return result


def action_third_coefficient_series(
    temporal_kinetic: float, terms: int = 200
) -> tuple[float, list[dict[str, float]]]:
    """Positive d_+(3) series proving the M=1 action-cone obstruction.

    Put epsilon=1-c_t^2 and
      1/sqrt(1-epsilon sin^2 p)=sum_j C(2j,j) epsilon^j sin^(2j)(p)/4^j.
    If A_m is its normalized cosine moment, then
      d_+(3)=-[(1+c_t)A_2+(1-c_t)A_4]/4.
    Each j contribution to the bracket is strictly negative because
      C(2j,j-2)/C(2j,j-1)=(j-1)/(j+2)<1.
    """
    c = temporal_kinetic
    epsilon = 1.0 - c * c
    bracket = 0.0
    rows: list[dict[str, float]] = []
    for j in range(1, terms + 1):
        central = math.comb(2 * j, j) / (4.0**j)
        a2_piece = -math.comb(2 * j, j - 1) / (4.0**j)
        a4_piece = (
            math.comb(2 * j, j - 2) / (4.0**j) if j >= 2 else 0.0
        )
        piece = central * epsilon**j * (
            (1.0 + c) * a2_piece + (1.0 - c) * a4_piece
        )
        if not piece < 0.0:
            raise AssertionError(f"nonnegative series bracket at j={j}: {piece}")
        bracket += piece
        if j <= 8:
            rows.append({"j": j, "negative_bracket_piece": piece})
    return -0.25 * bracket, rows


def full_discriminant_margin(
    spatial_momentum: np.ndarray,
    spatial_wilson: float,
    overlap_height: float,
) -> float:
    c2 = 4.0 / 5.0
    b2_minus_c2 = 1.0 / 5.0
    b_value = float(np.sum(1.0 - np.cos(spatial_momentum)))
    s_squared = float(np.sum(np.sin(spatial_momentum) ** 2))
    incidence = float(np.prod(np.cos(spatial_momentum / 2.0)))
    a_value = spatial_wilson * b_value + 1.0 - overlap_height
    return c2 * a_value**2 - b2_minus_c2 * (
        s_squared + c2 * incidence**2
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    mp.mp.dps = 70
    c_exact = 2 / mp.sqrt(5)
    c = float(c_exact)
    height_ceiling_exact = 1 - 1 / mp.sqrt(5)
    height_ceiling = float(height_ceiling_exact)
    spatial_wilson = 7.0 / 6.0

    roots_bad = temporal_branch_roots(c, 1.0, 1.0)
    roots_repaired = temporal_branch_roots(c, 1.0, 0.5)
    repaired_expected = np.array([1.5, 3.5])
    repaired_root_residual = float(
        np.max(np.abs(np.sort(roots_repaired.real) - repaired_expected))
    )
    if repaired_root_residual > 1.0e-12:
        raise AssertionError(repaired_root_residual)

    # Exact lower bound for the full spatial discriminant.  At p=0,
    # R0=(4/5)[(1-M)^2-1/5].  The remaining terms are nonnegative using
    # S^2<=2B and 4(1-M)r_s>=1 in the declared domain.
    repaired_height = 0.5
    lower_bound = (4.0 / 5.0) * ((1.0 - repaired_height) ** 2 - 1.0 / 5.0)
    if abs(lower_bound - 0.04) > 1.0e-15:
        raise AssertionError(lower_bound)
    inequality_coefficient = 4.0 * (1.0 - height_ceiling) * spatial_wilson
    if inequality_coefficient <= 1.0:
        raise AssertionError(inequality_coefficient)

    rng = np.random.default_rng(20260904)
    sampled_minimum_margin = math.inf
    for _ in range(200_000):
        momentum = rng.uniform(-math.pi, math.pi, size=3)
        sampled_minimum_margin = min(
            sampled_minimum_margin,
            full_discriminant_margin(momentum, spatial_wilson, repaired_height),
        )
    sampled_minimum_margin = min(
        sampled_minimum_margin,
        full_discriminant_margin(np.zeros(3), spatial_wilson, repaired_height),
    )

    # Direct covariance witness for the excluded inherited M=1 point.
    physical_mass = mp.mpf("0.5")
    coefficients = covariance_coefficients(c_exact, mp.mpf(1), physical_mass, 5)
    real_coefficients = [mp.re(value) for value in coefficients]
    imaginary_residual = max(abs(mp.im(value)) for value in coefficients)
    gram = mp.matrix(
        [
            [real_coefficients[0], real_coefficients[1]],
            [real_coefficients[1], real_coefficients[2]],
        ]
    )
    gram_eigenvalues = mp.eigsy(gram, eigvals_only=True)
    gram_determinant = mp.det(gram)
    if not gram_determinant < 0 or not gram_eigenvalues[0] < 0:
        raise AssertionError((gram_determinant, gram_eigenvalues))

    d3_partial, d3_rows = action_third_coefficient_series(c, terms=200)
    if d3_partial <= 0.0:
        raise AssertionError(d3_partial)

    # The repair cut at p=0 is the finite positive-energy interval
    # arcosh(3/2)<=E<=arcosh(7/2).
    repair_energy_interval = [math.acosh(1.5), math.acosh(3.5)]

    out: dict[str, Any] = {
        "certificate": "URT anisotropic free-overlap OS region",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "kernel_family": {
            "zero_spatial_momentum": (
                "X_s(w)=(r_t-M)-r_t cos(w)+i s c_t sin(w)"
            ),
            "general_radical": (
                "Q_p(x)=S^2+(A-r_t C x)^2+c_t^2 C^2(1-x^2), "
                "A=r_s B+r_t-M"
            ),
            "branch_discriminant_sign": (
                "R_p=c_t^2 A^2-(r_t^2-c_t^2)(S^2+c_t^2 C^2)"
            ),
        },
        "exact_low_height_OS_region": {
            "general": (
                "0<c_t<=r_t and 0<M<=r_t-sqrt(r_t^2-c_t^2), "
                "plus R_p>=0 for every spatial momentum"
            ),
            "inherited_metric_c_t": "2/sqrt(5)",
            "r_t": 1,
            "height_interval": "0<M<=1-1/sqrt(5)",
            "height_ceiling": height_ceiling,
            "full_spatial_sufficient_domain": (
                "r_s>=7/6; S^2<=2B gives R_p>=R_0>=0"
            ),
            "boundary_inequality_4_times_a0_times_rs": inequality_coefficient,
            "spectral_residue": (
                "c_t C sinh(E)-sqrt(S^2+(A-r_t C cosh(E))^2)>0 "
                "where Q_p(cosh(E))<0"
            ),
            "status": "E free spectral OS factorization",
        },
        "repaired_witness": {
            "M": repaired_height,
            "zero_momentum_cosh_branch_points": roots_repaired.tolist(),
            "expected_branch_points": repaired_expected.tolist(),
            "root_residual": repaired_root_residual,
            "energy_cut_interval": repair_energy_interval,
            "exact_full_discriminant_lower_bound": "1/25",
            "full_discriminant_lower_bound": lower_bound,
            "sampled_minimum_full_discriminant": sampled_minimum_margin,
            "status": "E repair; numerical sampling is corroborative only",
        },
        "excluded_M_equals_1_point": {
            "cosh_branch_points": [
                {"real": float(value.real), "imag": float(value.imag)}
                for value in roots_bad
            ],
            "exact_branch_points": "+/-2i",
            "off_imaginary_energy_axis": True,
            "physical_mass_in_covariance_test": float(physical_mass),
            "positive_frequency_coefficients_G1_to_G5": [
                mp.nstr(value, 60) for value in real_coefficients
            ],
            "OS_Gram_matrix_times_1_2": [
                [mp.nstr(gram[0, 0], 60), mp.nstr(gram[0, 1], 60)],
                [mp.nstr(gram[1, 0], 60), mp.nstr(gram[1, 1], 60)],
            ],
            "Gram_determinant": mp.nstr(gram_determinant, 60),
            "Gram_eigenvalues": [
                mp.nstr(gram_eigenvalues[j], 60) for j in range(2)
            ],
            "imaginary_quadrature_residual": mp.nstr(imaginary_residual, 10),
            "action_kernel_d_plus_3_positive_partial_sum": d3_partial,
            "series_term_witnesses": d3_rows,
            "status": "F: direct negative OS norm at M=1",
        },
        "selection_verdict": {
            "old_open_question": "resolved",
            "M_equals_1_inherited_branch": "excluded",
            "inherited_aspect_ratio": "not excluded; repaired by a continuous M interval",
            "time_aspect_selected_by_OS_alone": False,
            "next_calculation": (
                "Re-run the target-blind uniform-contraction selector on the full "
                "reflected (r_s,M,c_t) family subject to the exact OS region."
            ),
            "status": "E no-go for unique aspect selection by OS alone",
        },
        "method_sources": [
            "https://arxiv.org/abs/1005.3751",
            "https://arxiv.org/abs/1012.0152",
        ],
    }

    text = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text, encoding="utf-8")
    else:
        print(text, end="")


if __name__ == "__main__":
    main()