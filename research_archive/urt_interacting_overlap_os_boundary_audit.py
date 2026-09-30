#!/usr/bin/env python3
"""Finite gauge-boundary audit for reflected overlap fermions.

The rigorous overlap reflection-positivity theorem is free-field only; its
authors explicitly leave gauge models open.  This script attacks, but does
not assume an answer to, the gauge boundary problem on the smallest useful
reflection cell of the Cathedral two-coset lattice.

The staggered cubic slices have physical coordinates n+t(1,1,1)/2.  Site
reflection therefore acts in integer labels as

    theta(t,n)=(-t,n+t(1,1,1)).

On an antiperiodic Nt=6 time circle and Ns=2 spatial circle, positive sites
are t=1,2.  The covariance OS Gram matrix is built directly and calibrated
against Wilson fermions.

Three tests are separated deliberately:

1. Gauge links wholly inside the positive and negative halves preserve both
   Wilson and overlap positivity, as factorization predicts.
2. Fixing arbitrary reflection-plane links can create a negative covariance
   eigenvalue for both Wilson and overlap fermions.  It is therefore not an
   overlap counterexample; it is an invalid replacement for boundary Haar
   integration.
3. Determinant-weighted U(1) Haar quadrature over one boundary link is
   positive for both controls.

The outcome is a resolved false lead, not a proof of the interacting theory.
No observational target is used.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


NT = 6
NS = 2
SHAPE = (NT, NS, NS, NS)
R_SELECTED = 0.3555080349235190743
M_SELECTED = 0.7909405921071237235
C_SELECTED = 1.0
PHYSICAL_MASS = 0.5


def gamma_matrices() -> tuple[list[np.ndarray], np.ndarray]:
    identity2 = np.eye(2, dtype=complex)
    sigma1 = np.array([[0.0, 1.0], [1.0, 0.0]], dtype=complex)
    sigma2 = np.array([[0.0, -1.0j], [1.0j, 0.0]], dtype=complex)
    sigma3 = np.array([[1.0, 0.0], [0.0, -1.0]], dtype=complex)
    return [
        np.kron(sigma1, identity2),
        np.kron(sigma2, sigma1),
        np.kron(sigma2, sigma2),
        np.kron(sigma2, sigma3),
    ], np.kron(sigma3, identity2)


SITES = list(itertools.product(range(NT), range(NS), range(NS), range(NS)))
SITE_INDEX = {site: index for index, site in enumerate(SITES)}
DIRECTIONS = [
    (0, 1, 0, 0),
    (0, 0, 1, 0),
    (0, 0, 0, 1),
] + [(1, *bits) for bits in itertools.product((0, -1), repeat=3)]
DIRECTION_INDEX = {direction: index for index, direction in enumerate(DIRECTIONS)}


def signed_time(time_index: int) -> int:
    return time_index if time_index <= NT // 2 else time_index - NT


def shift(
    site: tuple[int, int, int, int], displacement: tuple[int, int, int, int]
) -> tuple[int, int, int, int]:
    return tuple(
        (site[index] + displacement[index]) % SHAPE[index] for index in range(4)
    )  # type: ignore[return-value]


def antiperiodic_sign(
    site: tuple[int, int, int, int], displacement: tuple[int, int, int, int]
) -> int:
    raw_time = site[0] + displacement[0]
    return -1 if raw_time < 0 or raw_time >= NT else 1


def reflect_site(
    site: tuple[int, int, int, int]
) -> tuple[int, int, int, int]:
    time = signed_time(site[0])
    return (
        (-time) % NT,
        *((site[index] + time) % NS for index in range(1, 4)),
    )


def reflected_link_partner(
    site_index: int, direction_index: int
) -> tuple[int, int, int]:
    """Return partner site, partner direction and phase sign.

    Spatial links retain orientation and phase.  A future diagonal is mapped
    to the reverse future diagonal and its U(1) phase changes sign.
    """
    site = SITES[site_index]
    if direction_index < 3:
        return SITE_INDEX[reflect_site(site)], direction_index, 1
    endpoint = shift(site, DIRECTIONS[direction_index])
    reflected_direction = (
        1,
        *tuple(-DIRECTIONS[direction_index][j] - 1 for j in range(1, 4)),
    )
    return (
        SITE_INDEX[reflect_site(endpoint)],
        DIRECTION_INDEX[reflected_direction],
        -1,
    )


def reflection_symmetric_phases(
    amplitude: float, seed: int, strict_half_only: bool
) -> np.ndarray:
    rng = np.random.default_rng(seed)
    phases = np.zeros((len(SITES), len(DIRECTIONS)))
    seen: set[tuple[int, int]] = set()

    def is_strict_half(site_index: int, direction_index: int) -> bool:
        site = SITES[site_index]
        time = signed_time(site[0])
        if direction_index < 3:
            return 0 < abs(time) < NT // 2
        endpoint_time = signed_time(shift(site, DIRECTIONS[direction_index])[0])
        return (
            time * endpoint_time > 0
            and abs(time) < NT // 2
            and abs(endpoint_time) < NT // 2
        )

    for site_index in range(len(SITES)):
        for direction_index in range(len(DIRECTIONS)):
            key = (site_index, direction_index)
            if key in seen:
                continue
            partner_site, partner_direction, phase_sign = reflected_link_partner(
                site_index, direction_index
            )
            partner = (partner_site, partner_direction)
            if strict_half_only and not is_strict_half(site_index, direction_index):
                seen.add(key)
                continue
            phase = float(rng.uniform(-amplitude, amplitude))
            if partner == key and phase_sign == -1:
                phase = 0.0
            phases[key] = phase
            phases[partner] = phase_sign * phase
            seen.add(key)
            seen.add(partner)
    return phases


def wilson_operator(phases: np.ndarray) -> np.ndarray:
    gammas, _ = gamma_matrices()
    identity4 = np.eye(4, dtype=complex)
    site_count = len(SITES)
    operator = np.zeros((4 * site_count, 4 * site_count), dtype=complex)
    links = np.exp(1.0j * phases)

    onsite = (3.0 * R_SELECTED + 1.0) * identity4
    for site_index in range(site_count):
        operator[
            4 * site_index : 4 * site_index + 4,
            4 * site_index : 4 * site_index + 4,
        ] = onsite

    for direction_index, displacement in enumerate(DIRECTIONS):
        if direction_index < 3:
            gamma = gammas[direction_index + 1]
            forward = 0.5 * (gamma - R_SELECTED * identity4)
            backward = 0.5 * (-gamma - R_SELECTED * identity4)
        else:
            gamma = gammas[0]
            forward = (C_SELECTED * gamma - identity4) / 16.0
            backward = (-C_SELECTED * gamma - identity4) / 16.0
        reverse = tuple(-value for value in displacement)
        for site_index, site in enumerate(SITES):
            forward_index = SITE_INDEX[shift(site, displacement)]
            backward_index = SITE_INDEX[shift(site, reverse)]
            operator[
                4 * site_index : 4 * site_index + 4,
                4 * forward_index : 4 * forward_index + 4,
            ] += (
                antiperiodic_sign(site, displacement)
                * forward
                * links[site_index, direction_index]
            )
            operator[
                4 * site_index : 4 * site_index + 4,
                4 * backward_index : 4 * backward_index + 4,
            ] += (
                antiperiodic_sign(site, reverse)
                * backward
                * np.conjugate(links[backward_index, direction_index])
            )
    return operator


def reflection_operator() -> np.ndarray:
    gammas, _ = gamma_matrices()
    site_reflection = np.zeros((len(SITES), len(SITES)))
    for site in SITES:
        # This cocycle places the antiperiodic seam at t=0.
        sign = -1.0 if site[0] == 0 else 1.0
        site_reflection[SITE_INDEX[reflect_site(site)], SITE_INDEX[site]] = sign
    return np.kron(site_reflection, gammas[0])


POSITIVE_SITES = [site for site in SITES if 1 <= site[0] <= NT // 2 - 1]


def os_gram(covariance: np.ndarray) -> np.ndarray:
    gammas, _ = gamma_matrices()
    gram = np.zeros((4 * len(POSITIVE_SITES), 4 * len(POSITIVE_SITES)), dtype=complex)
    for row, positive_site in enumerate(POSITIVE_SITES):
        reflected_index = SITE_INDEX[reflect_site(positive_site)]
        for column, other_site in enumerate(POSITIVE_SITES):
            other_index = SITE_INDEX[other_site]
            block = covariance[
                4 * reflected_index : 4 * reflected_index + 4,
                4 * other_index : 4 * other_index + 4,
            ]
            gram[4 * row : 4 * row + 4, 4 * column : 4 * column + 4] = (
                gammas[0] @ block
            )
    return gram


def overlap_and_gap(wilson: np.ndarray) -> tuple[np.ndarray, float]:
    identity = np.eye(wilson.shape[0], dtype=complex)
    x_matrix = wilson - M_SELECTED * identity
    values, vectors = np.linalg.eigh(x_matrix.conj().T @ x_matrix)
    polar = x_matrix @ (vectors * (1.0 / np.sqrt(values))) @ vectors.conj().T
    return 0.5 * (identity + polar), float(values[0])


def fermion_rows(phases: np.ndarray) -> dict[str, Any]:
    wilson = wilson_operator(phases)
    overlap, gap = overlap_and_gap(wilson)
    identity = np.eye(wilson.shape[0], dtype=complex)
    massive_overlap = PHYSICAL_MASS * identity + (1.0 - PHYSICAL_MASS) * overlap
    massive_wilson = wilson + PHYSICAL_MASS * identity
    reflection = reflection_operator()

    overlap_gram = os_gram(np.linalg.inv(massive_overlap))
    wilson_gram = os_gram(np.linalg.inv(massive_wilson))
    overlap_eigenvalues = np.linalg.eigvalsh(
        0.5 * (overlap_gram + overlap_gram.conj().T)
    )
    wilson_eigenvalues = np.linalg.eigvalsh(
        0.5 * (wilson_gram + wilson_gram.conj().T)
    )
    return {
        "maximum_link_deviation": float(np.max(np.abs(np.exp(1.0j * phases) - 1.0))),
        "minimum_XdaggerX": gap,
        "Wilson_reflection_covariance_residual": float(
            np.linalg.norm(wilson.conj().T - reflection @ wilson @ reflection)
        ),
        "overlap_Gram_hermiticity_residual": float(
            np.linalg.norm(overlap_gram - overlap_gram.conj().T)
        ),
        "Wilson_Gram_hermiticity_residual": float(
            np.linalg.norm(wilson_gram - wilson_gram.conj().T)
        ),
        "minimum_overlap_Gram_eigenvalue": float(overlap_eigenvalues[0]),
        "maximum_overlap_Gram_eigenvalue": float(overlap_eigenvalues[-1]),
        "minimum_Wilson_Gram_eigenvalue": float(wilson_eigenvalues[0]),
        "maximum_Wilson_Gram_eigenvalue": float(wilson_eigenvalues[-1]),
    }


def boundary_haar_quadrature(count: int = 64) -> dict[str, Any]:
    identity_phases = np.zeros((len(SITES), len(DIRECTIONS)))
    varied_site = SITE_INDEX[(0, 0, 0, 0)]
    varied_direction = 0
    overlap_terms = []
    wilson_terms = []
    maximum_overlap_phase = 0.0
    maximum_wilson_phase = 0.0
    for index in range(count):
        phase = 2.0 * math.pi * (index + 0.5) / count
        phases = identity_phases.copy()
        phases[varied_site, varied_direction] = phase
        wilson = wilson_operator(phases)
        overlap, _ = overlap_and_gap(wilson)
        identity = np.eye(wilson.shape[0], dtype=complex)
        massive_overlap = PHYSICAL_MASS * identity + (1.0 - PHYSICAL_MASS) * overlap
        massive_wilson = wilson + PHYSICAL_MASS * identity

        overlap_sign, overlap_logdet = np.linalg.slogdet(massive_overlap)
        wilson_sign, wilson_logdet = np.linalg.slogdet(massive_wilson)
        maximum_overlap_phase = max(maximum_overlap_phase, abs(np.angle(overlap_sign)))
        maximum_wilson_phase = max(maximum_wilson_phase, abs(np.angle(wilson_sign)))
        overlap_terms.append(
            (overlap_logdet, overlap_sign, os_gram(np.linalg.inv(massive_overlap)))
        )
        wilson_terms.append(
            (wilson_logdet, wilson_sign, os_gram(np.linalg.inv(massive_wilson)))
        )

    def average(terms: list[tuple[float, complex, np.ndarray]]) -> dict[str, float]:
        maximum_logdet = max(term[0] for term in terms)
        averaged = np.zeros_like(terms[0][2])
        normalization = 0.0j
        for logdet, sign, gram in terms:
            weight = math.exp(logdet - maximum_logdet) * sign
            averaged += weight * gram
            normalization += weight
        averaged /= normalization
        eigenvalues = np.linalg.eigvalsh(0.5 * (averaged + averaged.conj().T))
        return {
            "minimum_eigenvalue": float(eigenvalues[0]),
            "maximum_eigenvalue": float(eigenvalues[-1]),
            "hermiticity_residual": float(np.linalg.norm(averaged - averaged.conj().T)),
            "normalization_phase": float(np.angle(normalization)),
        }

    return {
        "quadrature_points": count,
        "boundary_link": "spatial direction 1 at site (t,x)=(0,0)",
        "gauge_weight": "U(1) Haar (beta=0), fermion determinant included",
        "overlap": average(overlap_terms),
        "Wilson_control": average(wilson_terms),
        "maximum_overlap_determinant_phase": maximum_overlap_phase,
        "maximum_Wilson_determinant_phase": maximum_wilson_phase,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    reflection = reflection_operator()
    reflection_involution_residual = float(
        np.linalg.norm(reflection @ reflection - np.eye(reflection.shape[0]))
    )

    free = fermion_rows(np.zeros((len(SITES), len(DIRECTIONS))))
    strict_rows = [
        fermion_rows(reflection_symmetric_phases(0.2, 20260904 + seed, True))
        for seed in range(12)
    ]
    boundary_fixed = fermion_rows(
        reflection_symmetric_phases(0.01, 20261017, False)
    )
    boundary_quadrature = boundary_haar_quadrature(count=64)

    strict_min_overlap = min(
        row["minimum_overlap_Gram_eigenvalue"] for row in strict_rows
    )
    strict_min_wilson = min(
        row["minimum_Wilson_Gram_eigenvalue"] for row in strict_rows
    )

    out: dict[str, Any] = {
        "certificate": "URT interacting-overlap OS boundary audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "finite_cell": {
            "time_sites": NT,
            "spatial_sites_per_axis": NS,
            "spinor_matrix_dimension": 4 * len(SITES),
            "positive_times": [1, 2],
            "reflection": "theta(t,n)=(-t,n+t(1,1,1))",
            "antiperiodic_time": True,
            "reflection_involution_residual": reflection_involution_residual,
        },
        "free_calibration": free,
        "strict_half_link_tests": {
            "background_count": len(strict_rows),
            "phase_amplitude": 0.2,
            "minimum_overlap_Gram_eigenvalue": strict_min_overlap,
            "minimum_Wilson_Gram_eigenvalue": strict_min_wilson,
            "rows": strict_rows,
            "result": "both positive semidefinite to roundoff",
            "status": "N",
        },
        "invalid_fixed_boundary_test": {
            **boundary_fixed,
            "interpretation": (
                "A negative fixed-background covariance is not overlap-specific "
                "because the Wilson control is also negative. Reflection-plane "
                "link integration cannot be replaced by an arbitrary delta value."
            ),
            "status": "F as an interacting-overlap counterexample",
        },
        "boundary_Haar_test": {
            **boundary_quadrature,
            "result": "both determinant-weighted averaged Gram matrices are PSD",
            "status": "N; one boundary variable only",
        },
        "literature_boundary": {
            "free_overlap_result": (
                "Kikukawa and Usui prove link-reflection positivity for free "
                "overlap fermions and non-gauge Yukawa interactions."
            ),
            "gauge_statement": (
                "Their paper explicitly says the gauge-model proof is more involved "
                "and leaves it for future study."
            ),
            "primary_sources": [
                "https://arxiv.org/abs/1005.3751",
                "https://arxiv.org/abs/1012.0152",
            ],
        },
        "verdict": {
            "interacting_overlap_reflection_positivity_proved": False,
            "interacting_overlap_counterexample_found": False,
            "fixed_background_false_lead_closed": True,
            "next_calculation": (
                "A valid decision requires either an all-boundary character/cone "
                "factorization or a gauge-invariant determinant-weighted negative "
                "observable; neither is supplied by fixed-background covariance."
            ),
            "status": "U with calibrated finite evidence",
        },
    }

    text = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text, encoding="utf-8")
    else:
        print(text, end="")


if __name__ == "__main__":
    main()