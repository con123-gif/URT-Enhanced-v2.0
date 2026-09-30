#!/usr/bin/env python3
"""Nonlocal A5-equivariant rank-12 projector audit for URT history.

This target-blind certificate closes the nonlocal-boundary loophole left by
urt_domain_wall_history_continuation.py.  It classifies equivariant rank-12
orthogonal projectors in the 60-state regular A5 history representation,
constructs the five cyclic spectral projectors of the left history transfer,
tests the principal-log/minimum-phase member, and exhibits a continuous
reversal- and endpoint-gauge-covariant projector family.

No flavour observable or other observational target is used.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


ROOT = Path(__file__).resolve().parent
CHIRAL_PATH = ROOT / "urt_chiral_dirac_continuation.py"


def load_chiral_module():
    spec = importlib.util.spec_from_file_location("urt_chiral_current", CHIRAL_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {CHIRAL_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


chiral = load_chiral_module()
wilson = chiral.wilson


def complex_payload(value: complex) -> dict[str, float]:
    return {"real": float(np.real(value)), "imag": float(np.imag(value))}


def support_permutation(matrix: np.ndarray) -> tuple[int, ...]:
    return tuple(int(value) for value in np.argmax(np.abs(matrix), axis=0))


def enumerate_generated_representation(
    generators: list[np.ndarray],
) -> list[np.ndarray]:
    identity = np.eye(generators[0].shape[0], dtype=complex)
    moves = generators + [generator.conj().T for generator in generators]
    seen: dict[tuple[int, ...], np.ndarray] = {
        support_permutation(identity): identity
    }
    queue = [identity]
    for current in queue:
        for move in moves:
            candidate = move @ current
            key = support_permutation(candidate)
            if key not in seen:
                seen[key] = candidate
                queue.append(candidate)
    return list(seen.values())


def rank_twelve_patterns() -> list[dict[str, Any]]:
    names = ("1", "3", "3prime", "4", "5")
    dimensions = (1, 3, 3, 4, 5)
    patterns = []
    for ranks in itertools.product(
        *(range(dimension + 1) for dimension in dimensions)
    ):
        total_rank = sum(
            dimension * rank for dimension, rank in zip(dimensions, ranks)
        )
        if total_rank != 12:
            continue
        real_dimension = 2 * sum(
            rank * (dimension - rank)
            for dimension, rank in zip(dimensions, ranks)
        )
        patterns.append(
            {
                "multiplicity_space_ranks": {
                    name: rank for name, rank in zip(names, ranks)
                },
                "projector_rank": total_rank,
                "real_Grassmannian_dimension": real_dimension,
            }
        )
    return patterns


def cyclic_projector(
    unitary: np.ndarray, eigenvalue: complex, order: int = 5
) -> np.ndarray:
    return sum(
        eigenvalue ** (-power) * np.linalg.matrix_power(unitary, power)
        for power in range(order)
    ) / order


def unitary_from_hermitian(hermitian: np.ndarray, parameter: float) -> np.ndarray:
    values, vectors = np.linalg.eigh(hermitian)
    return vectors @ np.diag(np.exp(1.0j * parameter * values)) @ vectors.conj().T


def principal_angle(angle: float) -> float:
    return float(np.angle(np.exp(1.0j * angle)))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    geometry = wilson.hopf.build_geometry_no_networkx()
    history = wilson.build_dual_history(geometry)
    _, face_spinors, links = wilson.dual_hopf_certificate(geometry, history)
    left, right, _ = wilson.history_transfer(history, links)
    actions = [
        wilson.twisted_state_action(geometry, history, face_spinors, permutation)
        for permutation in (history["edge_half_turn"], history["face_rotation"])
    ]
    reversal, _ = chiral.covariant_reversal_intertwiner(
        geometry, history, face_spinors, left, right
    )
    n = left.shape[0]
    identity = np.eye(n, dtype=complex)

    group_matrices = enumerate_generated_representation(actions)
    identity_key = support_permutation(identity)
    nonidentity_characters = [
        np.trace(matrix)
        for matrix in group_matrices
        if support_permutation(matrix) != identity_key
    ]
    character_inner_product = sum(
        abs(np.trace(matrix)) ** 2 for matrix in group_matrices
    ) / len(group_matrices)

    patterns = rank_twelve_patterns()
    dimensions = [item["real_Grassmannian_dimension"] for item in patterns]

    left_base_angle = -math.pi / 30.0
    right_base_angle = math.pi / 30.0
    left_projectors = []
    right_projectors = []
    left_eigenvalues = []
    right_eigenvalues = []
    for index in range(5):
        left_eigenvalue = np.exp(
            1.0j * (left_base_angle + 2.0 * math.pi * index / 5.0)
        )
        right_eigenvalue = np.exp(
            1.0j * (right_base_angle + 2.0 * math.pi * index / 5.0)
        )
        left_eigenvalues.append(left_eigenvalue)
        right_eigenvalues.append(right_eigenvalue)
        left_projectors.append(cyclic_projector(left, left_eigenvalue))
        right_projectors.append(cyclic_projector(right, right_eigenvalue))

    spectral_witnesses = []
    for index, (eigenvalue, projector) in enumerate(
        zip(left_eigenvalues, left_projectors)
    ):
        paired_right_index = (-index) % 5
        paired_right = right_projectors[paired_right_index]
        paired_right_eigenvalue = right_eigenvalues[paired_right_index]
        row_support = np.sum(np.abs(projector) > 1.0e-10, axis=1)
        restricted_omega = (
            np.trace(paired_right @ np.linalg.matrix_power(right, 5))
            - np.trace(projector @ np.linalg.matrix_power(left, 5))
        ) / (12.0j)
        spectral_witnesses.append(
            {
                "left_index": index,
                "paired_right_index": paired_right_index,
                "left_eigenvalue": complex_payload(eigenvalue),
                "left_principal_angle": principal_angle(np.angle(eigenvalue)),
                "paired_right_principal_angle": principal_angle(
                    np.angle(paired_right_eigenvalue)
                ),
                "rank_trace": float(np.trace(projector).real),
                "idempotence_residual": float(
                    np.linalg.norm(projector @ projector - projector)
                ),
                "Hermiticity_residual": float(
                    np.linalg.norm(projector - projector.conj().T)
                ),
                "spectral_residual": float(
                    np.linalg.norm(left @ projector - eigenvalue * projector)
                ),
                "A5_commutator_residuals": [
                    float(np.linalg.norm(projector @ action - action @ projector))
                    for action in actions
                ],
                "reversal_pairing_residual": float(
                    np.linalg.norm(
                        reversal @ paired_right @ reversal.conj().T - projector
                    )
                ),
                "diagonal_minmax": [
                    float(np.min(np.diag(projector).real)),
                    float(np.max(np.diag(projector).real)),
                ],
                "nonzero_entries_per_row_minmax": [
                    int(np.min(row_support)),
                    int(np.max(row_support)),
                ],
                "off_diagonal_norm": float(
                    np.linalg.norm(projector - np.diag(np.diag(projector)))
                ),
                "restricted_D_singular_value": float(abs(1.0 - eigenvalue)),
                "restricted_normalized_Omega5": complex_payload(restricted_omega),
            }
        )

    principal_index = int(
        np.argmin([abs(item["left_principal_angle"]) for item in spectral_witnesses])
    )
    principal_projector = left_projectors[principal_index]
    principal_right_index = (-principal_index) % 5
    principal_right_projector = right_projectors[principal_right_index]
    principal_left_eigenvalue = left_eigenvalues[principal_index]
    principal_right_eigenvalue = right_eigenvalues[principal_right_index]
    band_determinant_ratio = (
        (1.0 - principal_right_eigenvalue)
        / (1.0 - principal_left_eigenvalue)
    ) ** 12
    band_half_phase = np.angle(band_determinant_ratio) / 2.0

    # Endpoint-gauge covariance of the principal spectral projector.
    rng = np.random.default_rng(20260903)
    endpoint_phases = rng.uniform(-math.pi, math.pi, 20)
    _, transformed_links = wilson.generic_hopf_links(
        history["normals"], history["adjacency"], endpoint_phases
    )
    left_g, right_g, _ = wilson.history_transfer(history, transformed_links)
    state_gauge = np.diag(
        [np.exp(1.0j * endpoint_phases[a]) for a, _ in history["states"]]
    )
    reversal_g = state_gauge.conj().T @ reversal @ state_gauge
    principal_projector_g = cyclic_projector(
        left_g, principal_left_eigenvalue
    )
    principal_right_projector_g = cyclic_projector(
        right_g, principal_right_eigenvalue
    )

    # A continuous family in the A5 commutant.  Conjugating the principal
    # projector by exp[i alpha (R+R^dagger)/2] preserves rank, A5 covariance
    # and the fifth trace.  The paired right projector is fixed by reversal.
    family_generator = (right + right.conj().T) / 2.0
    family_generator_g = (right_g + right_g.conj().T) / 2.0
    continuous_witnesses = []
    for parameter in (0.0, 0.2, 0.5, 1.0):
        family_unitary = unitary_from_hermitian(family_generator, parameter)
        projector = (
            family_unitary
            @ principal_projector
            @ family_unitary.conj().T
        )
        paired_right = reversal.conj().T @ projector @ reversal

        family_unitary_g = unitary_from_hermitian(
            family_generator_g, parameter
        )
        projector_g = (
            family_unitary_g
            @ principal_projector_g
            @ family_unitary_g.conj().T
        )
        paired_right_g = reversal_g.conj().T @ projector_g @ reversal_g
        row_support = np.sum(np.abs(projector) > 1.0e-10, axis=1)
        restricted_omega = (
            np.trace(paired_right @ np.linalg.matrix_power(right, 5))
            - np.trace(projector @ np.linalg.matrix_power(left, 5))
        ) / (12.0j)
        continuous_witnesses.append(
            {
                "parameter": parameter,
                "distance_from_principal_spectral_projector": float(
                    np.linalg.norm(projector - principal_projector)
                ),
                "rank_trace": float(np.trace(projector).real),
                "idempotence_residual": float(
                    np.linalg.norm(projector @ projector - projector)
                ),
                "Hermiticity_residual": float(
                    np.linalg.norm(projector - projector.conj().T)
                ),
                "A5_commutator_residuals": [
                    float(np.linalg.norm(projector @ action - action @ projector))
                    for action in actions
                ],
                "reversal_pairing_residual": float(
                    np.linalg.norm(
                        reversal @ paired_right @ reversal.conj().T - projector
                    )
                ),
                "endpoint_gauge_residuals": {
                    "left_projector": float(
                        np.linalg.norm(
                            projector_g
                            - state_gauge.conj().T @ projector @ state_gauge
                        )
                    ),
                    "right_projector": float(
                        np.linalg.norm(
                            paired_right_g
                            - state_gauge.conj().T @ paired_right @ state_gauge
                        )
                    ),
                },
                "commutator_with_left_transfer": float(
                    np.linalg.norm(projector @ left - left @ projector)
                ),
                "diagonal_minmax": [
                    float(np.min(np.diag(projector).real)),
                    float(np.max(np.diag(projector).real)),
                ],
                "nonzero_entries_per_row_minmax": [
                    int(np.min(row_support)),
                    int(np.max(row_support)),
                ],
                "restricted_normalized_Omega5": complex_payload(restricted_omega),
            }
        )

    measure_angle = 0.731
    measure_factor = np.exp(1.0j * measure_angle)
    out = {
        "certificate": "URT nonlocal A5-equivariant history projector audit",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "regular_representation_and_commutant": {
            "generated_group_order": len(group_matrices),
            "identity_character": float(abs(np.trace(identity))),
            "maximum_nonidentity_character_modulus": float(
                max(abs(value) for value in nonidentity_characters)
            ),
            "character_inner_product_and_commutant_dimension": float(
                character_inner_product
            ),
            "regular_decomposition": (
                "C[A5]=V_1 tensor C^1 + V_3 tensor C^3 + "
                "V_3prime tensor C^3 + V_4 tensor C^4 + V_5 tensor C^5"
            ),
            "all_equivariant_orthogonal_projectors": (
                "P=direct_sum_rho I_{d_rho} tensor P_rho, where P_rho is "
                "an arbitrary orthogonal projector on C^{d_rho}"
            ),
            "rank_formula": (
                "rank(P)=k_1+3 k_3+3 k_3prime+4 k_4+5 k_5, "
                "0<=k_d<=d"
            ),
            "rank_12_multiplicity_patterns": patterns,
            "rank_12_pattern_count": len(patterns),
            "minimum_family_real_dimension": min(dimensions),
            "maximum_family_real_dimension": max(dimensions),
            "classification_conclusion": (
                "Every A5-equivariant rank-12 component has positive Grassmannian "
                "dimension; A5 symmetry alone supplies no isolated nonlocal boundary projector."
            ),
        },
        "five_cyclic_spectral_projectors": {
            "formula": (
                "P_k(L)=(1/5) sum_{n=0}^4 lambda_k^{-n} L^n, "
                "lambda_k=exp[i(-pi/30+2 pi k/5)]"
            ),
            "witnesses": spectral_witnesses,
            "interpretation": (
                "Each P_k is a gauge- and A5-covariant rank-12 Fourier band and "
                "retains normalized Omega5=1, but has diagonal 1/5 and support on "
                "all five sites of every pentagon. It is a cyclic spectral filter, not a local wall."
            ),
        },
        "principal_log_candidate": {
            "selected_left_index": principal_index,
            "selected_right_index": principal_right_index,
            "left_angle": principal_angle(np.angle(principal_left_eigenvalue)),
            "right_angle": principal_angle(np.angle(principal_right_eigenvalue)),
            "next_absolute_angle_gap": float(
                sorted(abs(item["left_principal_angle"]) for item in spectral_witnesses)[1]
                - abs(spectral_witnesses[principal_index]["left_principal_angle"])
            ),
            "endpoint_gauge_covariance_residuals": {
                "left": float(
                    np.linalg.norm(
                        principal_projector_g
                        - state_gauge.conj().T
                        @ principal_projector
                        @ state_gauge
                    )
                ),
                "right": float(
                    np.linalg.norm(
                        principal_right_projector_g
                        - state_gauge.conj().T
                        @ principal_right_projector
                        @ state_gauge
                    )
                ),
            },
            "reversal_pairing_residual": float(
                np.linalg.norm(
                    reversal
                    @ principal_right_projector
                    @ reversal.conj().T
                    - principal_projector
                )
            ),
            "restricted_operator_gap": float(abs(1.0 - principal_left_eigenvalue)),
            "spectral_band_determinant_ratio": complex_payload(
                band_determinant_ratio
            ),
            "spectral_band_half_phase": float(band_half_phase),
            "exact_half_phase": "pi/5 before any determinant-line counterterm",
            "selection_scope": (
                "The minimum-phase rule uniquely selects k=0 only after imposing "
                "the additional conditions P=f(L), one complete Fourier band, and "
                "the principal branch. Those conditions are not consequences of A5 covariance."
            ),
            "boundary_failure": (
                "The selected band is delocalized and I-L has nonzero gap "
                "2 sin(pi/60); it is not a chiral wall zero mode."
            ),
        },
        "continuous_reversal_covariant_family": {
            "definition": (
                "U_alpha=exp[i alpha (R+R^dagger)/2], "
                "P_L(alpha)=U_alpha P_L(0) U_alpha^dagger, "
                "P_R(alpha)=Q^dagger P_L(alpha) Q"
            ),
            "generator_A5_commutator_residuals": [
                float(
                    np.linalg.norm(
                        family_generator @ action - action @ family_generator
                    )
                )
                for action in actions
            ],
            "witnesses": continuous_witnesses,
            "conclusion": (
                "Rank, A5 covariance, endpoint-gauge covariance, reversal pairing and "
                "Omega5 do not remove alpha. Nonzero alpha is more nonlocal and need not "
                "commute with L, showing exactly which extra spectral axiom the principal rule adds."
            ),
        },
        "measure_obstruction": {
            "candidate_phase_before_trivialization": "pi/5",
            "frame_or_counterterm_angle_witness": measure_angle,
            "multiplicative_phase_witness": complex_payload(measure_factor),
            "statement": (
                "Even the principal spectral band fixes only a candidate endomorphism "
                "phase. Rephasing a chiral determinant-line frame, or multiplying by "
                "exp(i lambda chi Omega5), changes it continuously without changing the "
                "projector, covariance, index or winding."
            ),
        },
        "uniqueness_gate": {
            "A5_equivariant_rank_12_projector": "NOT UNIQUE: 11 positive-dimensional families",
            "local_boundary": "FAIL: every cyclic band has five-site support and diagonal 1/5",
            "principal_log_band": (
                "UNIQUE only inside the newly imposed five-band spectral subclass"
            ),
            "one_chiral_zero_mode": "FAIL: the principal band has gap 2 sin(pi/60)",
            "orientation_invariant": "PASS: normalized Omega5 remains 1",
            "determinant_measure": "FAIL: the lambda/frame phase remains continuous",
            "verdict": (
                "F/no-go for nonlocal projector selection from the current premises. "
                "The principal-log rule gives a conditional pi/5 band phase but neither "
                "a local wall nor a fixed chiral measure."
            ),
            "phenomenology_gate": "CLOSED",
        },
    }

    serialized = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(serialized, end="")
    else:
        args.output.write_text(serialized)


if __name__ == "__main__":
    main()