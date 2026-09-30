#!/usr/bin/env python3
"""Gauge-covariant overlap operator and a rigorous weak-field gap domain.

Covariantize every hop of the reflection-lattice Wilson operator by a compact
unitary link.  At overlap mass M=1 the free kernel satisfies

  X_0^dagger X_0 >= 1/2

for the selected root r in (7/6,6/5).  The proof is elementary and global on
the Brillouin torus.  If, in one trivialization of the vacuum sector,

  max_link ||U_link-I|| < 5/(43 sqrt(2)),

then ||X_U-X_0|| < 1/sqrt(2), so X_U remains invertible.  Its polar overlap

  D_U=(I+X_U (X_U^dagger X_U)^(-1/2))/2

is exactly gauge covariant and obeys the normalization-two Ginsparg--Wilson
relation.  The link-small condition is only a sufficient local chart, not a
gauge-invariant global admissibility definition and not a chiral measure.

No observational target is used.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np


def stationarity_polynomial(value: Fraction | float) -> Fraction | float:
    return 240 * value**3 - 392 * value**2 - 28 * value + 185


def gamma_matrices() -> tuple[list[np.ndarray], np.ndarray]:
    identity2 = np.eye(2, dtype=complex)
    sigma1 = np.array([[0.0, 1.0], [1.0, 0.0]], dtype=complex)
    sigma2 = np.array([[0.0, -1.0j], [1.0j, 0.0]], dtype=complex)
    sigma3 = np.array([[1.0, 0.0], [0.0, -1.0]], dtype=complex)
    gamma0 = np.kron(sigma1, identity2)
    gamma1 = np.kron(sigma2, sigma1)
    gamma2 = np.kron(sigma2, sigma2)
    gamma3 = np.kron(sigma2, sigma3)
    gamma5 = np.kron(sigma3, identity2)
    return [gamma0, gamma1, gamma2, gamma3], gamma5


def selected_wilson_root() -> float:
    roots = np.roots([240.0, -392.0, -28.0, 185.0])
    selected = [
        float(root.real)
        for root in roots
        if abs(root.imag) < 1.0e-12 and 7.0 / 6.0 < root.real < 6.0 / 5.0
    ]
    if len(selected) != 1:
        raise RuntimeError(f"selected Wilson root not isolated: {roots}")
    return selected[0]


def lattice_sites(length: int) -> list[tuple[int, int, int, int]]:
    return list(itertools.product(range(length), repeat=4))


def shift(
    site: tuple[int, int, int, int],
    displacement: tuple[int, int, int, int],
    length: int,
) -> tuple[int, int, int, int]:
    return tuple(
        (site[i] + displacement[i]) % length for i in range(4)
    )  # type: ignore[return-value]


def positive_directions() -> list[tuple[int, int, int, int]]:
    spatial = [
        (0, 1, 0, 0),
        (0, 0, 1, 0),
        (0, 0, 0, 1),
    ]
    temporal = [
        (1, b1, b2, b3)
        for b1, b2, b3 in itertools.product((0, -1), repeat=3)
    ]
    return spatial + temporal


def make_links(
    length: int,
    phase_amplitude: float,
    rng: np.random.Generator,
) -> np.ndarray:
    site_count = length**4
    direction_count = len(positive_directions())
    phases = rng.uniform(
        -phase_amplitude, phase_amplitude, size=(site_count, direction_count)
    )
    return np.exp(1.0j * phases)


def transform_links(
    links: np.ndarray,
    gauge: np.ndarray,
    length: int,
) -> np.ndarray:
    sites = lattice_sites(length)
    index = {site: i for i, site in enumerate(sites)}
    out = np.empty_like(links)
    for ix, site in enumerate(sites):
        for direction_index, displacement in enumerate(positive_directions()):
            iy = index[shift(site, displacement, length)]
            out[ix, direction_index] = (
                gauge[ix] * links[ix, direction_index] * np.conjugate(gauge[iy])
            )
    return out


def wilson_operator(links: np.ndarray, length: int, wilson_r: float) -> np.ndarray:
    sites = lattice_sites(length)
    index = {site: i for i, site in enumerate(sites)}
    site_count = len(sites)
    gammas, _ = gamma_matrices()
    identity4 = np.eye(4, dtype=complex)
    operator = np.zeros((4 * site_count, 4 * site_count), dtype=complex)

    onsite = (3.0 * wilson_r + 1.0) * identity4
    for ix in range(site_count):
        operator[4 * ix : 4 * ix + 4, 4 * ix : 4 * ix + 4] += onsite

    directions = positive_directions()
    for direction_index, displacement in enumerate(directions):
        if direction_index < 3:
            gamma = gammas[direction_index + 1]
            forward_coefficient = 0.5 * (gamma - wilson_r * identity4)
            backward_coefficient = 0.5 * (-gamma - wilson_r * identity4)
        else:
            gamma = gammas[0]
            forward_coefficient = (gamma - identity4) / 16.0
            backward_coefficient = (-gamma - identity4) / 16.0

        reverse = tuple(-value for value in displacement)
        for ix, site in enumerate(sites):
            forward_site = shift(site, displacement, length)
            iy = index[forward_site]
            operator[4 * ix : 4 * ix + 4, 4 * iy : 4 * iy + 4] += (
                forward_coefficient * links[ix, direction_index]
            )

            backward_site = shift(site, reverse, length)
            iz = index[backward_site]
            operator[4 * ix : 4 * ix + 4, 4 * iz : 4 * iz + 4] += (
                backward_coefficient * np.conjugate(links[iz, direction_index])
            )

    return operator


def overlap_from_wilson(
    wilson: np.ndarray, gamma5_big: np.ndarray
) -> tuple[np.ndarray, dict[str, float]]:
    identity = np.eye(wilson.shape[0], dtype=complex)
    x_matrix = wilson - identity
    gram = x_matrix.conj().T @ x_matrix
    values, vectors = np.linalg.eigh(gram)
    if values[0] <= 0.0:
        raise RuntimeError("interacting overlap kernel lost its gap")
    inverse_square_root = (
        vectors * (1.0 / np.sqrt(values))
    ) @ vectors.conj().T
    polar = x_matrix @ inverse_square_root
    overlap = 0.5 * (identity + polar)
    diagnostics = {
        "minimum_XdaggerX_eigenvalue": float(values[0]),
        "maximum_XdaggerX_eigenvalue": float(values[-1]),
        "polar_unitarity_residual": float(
            np.linalg.norm(polar.conj().T @ polar - identity, ord=2)
        ),
        "polar_gamma5_hermiticity_residual": float(
            np.linalg.norm(polar.conj().T - gamma5_big @ polar @ gamma5_big, ord=2)
        ),
        "GW_residual": float(
            np.linalg.norm(
                gamma5_big @ overlap
                + overlap @ gamma5_big
                - 2.0 * overlap @ gamma5_big @ overlap,
                ord=2,
            )
        ),
    }
    return overlap, diagnostics


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    wilson_r = selected_wilson_root()
    gammas, gamma5 = gamma_matrices()
    _ = gammas
    length = 2
    site_count = length**4
    identity_links = np.ones((site_count, len(positive_directions())), dtype=complex)
    free_wilson = wilson_operator(identity_links, length, wilson_r)
    gamma5_big = np.kron(np.eye(site_count), gamma5)

    free_x = free_wilson - np.eye(free_wilson.shape[0], dtype=complex)
    free_gram_values = np.linalg.eigvalsh(free_x.conj().T @ free_x)

    # Exact rational endpoint checks for the chosen algebraic-root interval.
    polynomial_at_lower = stationarity_polynomial(Fraction(7, 6))
    polynomial_at_upper = stationarity_polynomial(Fraction(6, 5))
    derivative_at_lower = (
        720 * Fraction(7, 6) ** 2 - 784 * Fraction(7, 6) - 28
    )
    derivative_at_upper = (
        720 * Fraction(6, 5) ** 2 - 784 * Fraction(6, 5) - 28
    )

    exact_admissibility = 5.0 / (43.0 * math.sqrt(2.0))
    hop_norm_bound = 3.0 * wilson_r + 5.0
    rng = np.random.default_rng(20260904)

    interacting_rows = []
    maximum_gauge_covariance_residual = 0.0
    maximum_spectrum_residual = 0.0
    for phase_amplitude in (0.005, 0.015, 0.03, 0.05):
        links = make_links(length, phase_amplitude, rng)
        max_link_deviation = float(np.max(np.abs(links - 1.0)))
        interacting_wilson = wilson_operator(links, length, wilson_r)
        difference_norm = float(
            np.linalg.norm(interacting_wilson - free_wilson, ord=2)
        )
        bound = hop_norm_bound * max_link_deviation
        analytic_sigma_lower = 1.0 / math.sqrt(2.0) - (43.0 / 5.0) * max_link_deviation

        overlap, diagnostics = overlap_from_wilson(
            interacting_wilson, gamma5_big
        )
        gamma5_residual = float(
            np.linalg.norm(
                interacting_wilson.conj().T
                - gamma5_big @ interacting_wilson @ gamma5_big,
                ord=2,
            )
        )

        gauge = np.exp(1.0j * rng.uniform(-math.pi, math.pi, size=site_count))
        transformed_links = transform_links(links, gauge, length)
        transformed_wilson = wilson_operator(
            transformed_links, length, wilson_r
        )
        gauge_big = np.kron(np.diag(gauge), np.eye(4, dtype=complex))
        wilson_covariance_residual = float(
            np.linalg.norm(
                transformed_wilson
                - gauge_big @ interacting_wilson @ gauge_big.conj().T,
                ord=2,
            )
        )
        transformed_overlap, transformed_diagnostics = overlap_from_wilson(
            transformed_wilson, gamma5_big
        )
        overlap_covariance_residual = float(
            np.linalg.norm(
                transformed_overlap
                - gauge_big @ overlap @ gauge_big.conj().T,
                ord=2,
            )
        )
        spectrum = np.linalg.eigvalsh(
            (interacting_wilson - np.eye(4 * site_count)).conj().T
            @ (interacting_wilson - np.eye(4 * site_count))
        )
        transformed_spectrum = np.linalg.eigvalsh(
            (transformed_wilson - np.eye(4 * site_count)).conj().T
            @ (transformed_wilson - np.eye(4 * site_count))
        )
        spectrum_residual = float(np.max(np.abs(spectrum - transformed_spectrum)))
        maximum_gauge_covariance_residual = max(
            maximum_gauge_covariance_residual,
            wilson_covariance_residual,
            overlap_covariance_residual,
        )
        maximum_spectrum_residual = max(
            maximum_spectrum_residual, spectrum_residual
        )
        interacting_rows.append(
            {
                "phase_amplitude": phase_amplitude,
                "maximum_link_deviation": max_link_deviation,
                "inside_conservative_chart": max_link_deviation < exact_admissibility,
                "operator_difference_norm": difference_norm,
                "triangle_bound": bound,
                "difference_minus_bound": difference_norm - bound,
                "analytic_sigma_minimum_lower_bound": analytic_sigma_lower,
                "gamma5_hermiticity_residual": gamma5_residual,
                "overlap_diagnostics": diagnostics,
                "transformed_overlap_diagnostics": transformed_diagnostics,
                "Wilson_gauge_covariance_residual": wilson_covariance_residual,
                "overlap_gauge_covariance_residual": overlap_covariance_residual,
                "gauge_spectrum_residual": spectrum_residual,
            }
        )

    low_b_exact_margin = (
        Fraction(387, 200) - Fraction(119, 100) * math.sqrt(2.0)
    )

    out: dict[str, Any] = {
        "certificate": "URT gauge-covariant overlap admissibility",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "selected_root": {
            "polynomial": "240 r^3-392 r^2-28 r+185",
            "r": wilson_r,
            "isolating_interval": "7/6<r<6/5",
            "P_at_7_over_6": str(polynomial_at_lower),
            "P_at_6_over_5": str(polynomial_at_upper),
            "P_prime_at_7_over_6": str(derivative_at_lower),
            "P_prime_at_6_over_5": str(derivative_at_upper),
            "uniqueness_reason": "P is strictly increasing throughout the isolating interval",
            "status": "E",
        },
        "global_free_gap_theorem": {
            "definitions": [
                "x_i=1-cos(p_i) in [0,2]",
                "B=sum_i x_i",
                "S^2=sum_i x_i(2-x_i)",
                "C=product_i sqrt(1-x_i/2) in [0,1]",
            ],
            "omega_minimization": (
                "X0^dagger X0=S^2+C^2+r^2B^2-2rBC cos(omega), "
                "whose minimum is S^2+(rB-C)^2"
            ),
            "cases": [
                "For 1-1/sqrt(2)<=B<=1+1/sqrt(2), S^2>=B(2-B)>=1/2.",
                "For B>=1+1/sqrt(2), r>=1 and C<=1 give (rB-C)^2>=1/2.",
                "For B<=1-1/sqrt(2), C>=1-B/2 and r<6/5 give a lower bound whose minimum exceeds 1/2.",
            ],
            "low_B_margin_above_one_half": (
                "(387-238 sqrt(2))/200=" + str(float(low_b_exact_margin))
            ),
            "conclusion": "X0^dagger X0>=1/2 on the full Brillouin torus",
            "finite_L2_minimum_X0daggerX0": float(free_gram_values[0]),
            "status": "E global bound; N finite-volume displayed eigenvalue",
        },
        "weak_field_gap_chart": {
            "position_space_hop_norm_sum": "3(r+1)+2=3r+5<43/5",
            "perturbation_bound": "||X_U-X_0||<=(43/5) epsilon",
            "singular_value_bound": "sigma_min(X_U)>=1/sqrt(2)-(43/5)epsilon",
            "sufficient_condition": "epsilon=max_link ||U-I||<5/(43 sqrt(2))",
            "numerical_threshold": exact_admissibility,
            "scope": (
                "This is a gauge-fixed open chart around the trivial connection. "
                "The spectral gap itself is gauge invariant, but link closeness "
                "to I is not a global gauge-invariant admissibility condition."
            ),
            "status": "E",
        },
        "covariant_overlap": {
            "definition": "D_U=(I+X_U(X_U^dagger X_U)^(-1/2))/2",
            "identities": [
                "D_{U^g}=G D_U G^dagger",
                "D_U^dagger=gamma5 D_U gamma5",
                "gamma5 D_U+D_U gamma5=2 D_U gamma5 D_U",
            ],
            "finite_periodic_witness": {
                "linear_size": length,
                "sites": site_count,
                "spinor_matrix_dimension": 4 * site_count,
                "gauge_group": "U(1) witness; algebra extends to any unitary representation",
                "rows": interacting_rows,
                "maximum_gauge_covariance_residual": maximum_gauge_covariance_residual,
                "maximum_gauge_spectrum_residual": maximum_spectrum_residual,
            },
            "status": "E algebraically whenever the gap is open; N numerical witnesses",
        },
        "remaining_boundary": {
            "missing": [
                "a global gauge-invariant plaquette admissibility theorem on this non-orthogonal lattice",
                "reflection positivity of the interacting non-ultralocal overlap operator",
                "a local smooth nonabelian chiral-measure reconstruction",
                "selection of the surviving topological theta phase",
                "an interacting continuum limit",
            ],
            "status": "U/C",
        },
        "verdict": {
            "gauge_covariant_GW_operator": "E on the open-gap domain",
            "rigorous_nonzero_weak_field_domain": "E",
            "global_admissible_chiral_gauge_theory": "U",
            "advance": (
                "Gauge interaction no longer immediately destroys the overlap "
                "construction: a rigorous parameter-free open neighborhood of the "
                "vacuum has an invertible covariant kernel and exact GW chirality. "
                "The remaining obstruction is global measure/admissibility and "
                "interacting reflection positivity."
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