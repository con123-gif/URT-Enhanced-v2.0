#!/usr/bin/env python3
"""Born-rule conditional closure and measurement no-go for Cathedral/URT.

The exact exterior carrier is a complex Hilbert space of dimension 16.  This
certificate separates two statements:

1. positivity, normalization, phase independence, continuity, outcome
   relabeling and simultaneous unitary covariance do not select the Born rule;
   a continuous alpha-family satisfies all of them;
2. if one additionally postulates a noncontextual finitely additive measure on
   every orthogonal projector, Gleason's theorem applies (dimension >= 3), and
   pure-state certainty then gives the Born rule exactly.

The existing Gibbs functional uses the trace pairing as mathematical input but
does not derive the physical noncontextual measurement premise.  No
observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


DIMENSION = 16


def alpha_probabilities(
    state: np.ndarray, basis: np.ndarray, alpha: float
) -> np.ndarray:
    squared_amplitudes = np.abs(basis.conj().T @ state) ** 2
    powers = squared_amplitudes**alpha
    return powers / np.sum(powers)


def embedded_contexts() -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    state = np.zeros(DIMENSION, dtype=complex)
    state[:3] = [math.sqrt(0.5), 0.5, 0.5]

    standard = np.eye(DIMENSION, dtype=complex)
    aligned = standard.copy()
    aligned[:, 0] = 0.0
    aligned[:, 1] = 0.0
    aligned[0, 0] = math.sqrt(2.0 / 3.0)
    aligned[1, 0] = 1.0 / math.sqrt(3.0)
    aligned[0, 1] = -1.0 / math.sqrt(3.0)
    aligned[1, 1] = math.sqrt(2.0 / 3.0)
    return state, standard, aligned


def random_unitary(dimension: int) -> np.ndarray:
    rng = np.random.default_rng(20260904)
    raw = rng.normal(size=(dimension, dimension)) + 1.0j * rng.normal(
        size=(dimension, dimension)
    )
    q, r = np.linalg.qr(raw)
    phases = np.diag(r)
    phases = phases / np.abs(phases)
    return q @ np.diag(phases.conj())


def family_witnesses() -> tuple[list[dict[str, Any]], float]:
    state, standard, aligned = embedded_contexts()
    unitary = random_unitary(DIMENSION)
    records: list[dict[str, Any]] = []
    maximum_covariance_residual = 0.0
    for alpha in (0.5, 1.0, 2.0, 3.0):
        p_standard = alpha_probabilities(state, standard, alpha)
        p_aligned = alpha_probabilities(state, aligned, alpha)
        transformed = alpha_probabilities(
            unitary @ state, unitary @ standard, alpha
        )
        covariance_residual = float(np.max(np.abs(transformed - p_standard)))
        maximum_covariance_residual = max(
            maximum_covariance_residual, covariance_residual
        )
        records.append(
            {
                "alpha": alpha,
                "normalization_residual_standard": float(
                    abs(np.sum(p_standard) - 1.0)
                ),
                "normalization_residual_rotated": float(
                    abs(np.sum(p_aligned) - 1.0)
                ),
                "simultaneous_unitary_covariance_residual": covariance_residual,
                "probability_of_same_rank_two_projector_standard_context": float(
                    np.sum(p_standard[:2])
                ),
                "probability_of_same_rank_two_projector_aligned_context": float(
                    np.sum(p_aligned[:2])
                ),
                "context_gap": float(
                    abs(np.sum(p_standard[:2]) - np.sum(p_aligned[:2]))
                ),
            }
        )
    return records, maximum_covariance_residual


def pure_certainty_witness() -> dict[str, float]:
    # If a positive trace-one rho has <psi|rho|psi>=1, positivity forces all
    # remaining eigenweight to vanish.  This numerical witness checks the
    # resulting Born projection formula for a deterministic complex state.
    rng = np.random.default_rng(137)
    state = rng.normal(size=DIMENSION) + 1.0j * rng.normal(size=DIMENSION)
    state = state / np.linalg.norm(state)
    rho = np.outer(state, state.conj())
    basis = random_unitary(DIMENSION)
    trace_probabilities = np.asarray(
        [
            np.trace(rho @ np.outer(basis[:, i], basis[:, i].conj())).real
            for i in range(DIMENSION)
        ]
    )
    amplitude_probabilities = np.abs(basis.conj().T @ state) ** 2
    return {
        "rho_trace_residual": float(abs(np.trace(rho) - 1.0)),
        "rho_idempotence_residual": float(np.linalg.norm(rho @ rho - rho)),
        "trace_vs_squared_amplitude_residual": float(
            np.max(np.abs(trace_probabilities - amplitude_probabilities))
        ),
        "probability_sum_residual": float(
            abs(np.sum(trace_probabilities) - 1.0)
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    family, covariance_residual = family_witnesses()
    certainty = pure_certainty_witness()

    out = {
        "certificate": "URT Born-rule conditional closure and measurement boundary",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "exact_carrier": {
            "space": "Lambda^bullet(V4_C)",
            "complex_dimension": DIMENSION,
            "gleason_dimension_gate": "passes because 16>=3",
            "status": "E",
        },
        "covariant_non_born_family": {
            "definition": (
                "p_i^(alpha)(psi;{e_j})=|<e_i,psi>|^(2 alpha)/"
                "sum_j |<e_j,psi>|^(2 alpha), alpha>0"
            ),
            "properties_for_every_alpha": [
                "nonnegative and normalized",
                "continuous in state and basis",
                "independent of vector phases",
                "covariant under simultaneous unitary action on state and basis",
                "covariant under relabeling of outcomes",
                "certainty for a state equal to a basis vector",
            ],
            "born_member": "alpha=1",
            "non_born_members": "every alpha!=1",
            "same_projector_counterexample": {
                "state_squared_amplitudes_in_standard_context": [
                    "1/2",
                    "1/4",
                    "1/4",
                ],
                "rank_two_projector": "P=span(e1,e2)",
                "rotated_context_squared_amplitudes": ["3/4", "0", "1/4"],
                "alpha_2_standard_probability": "5/6",
                "alpha_2_rotated_probability": "9/10",
                "alpha_2_context_gap": "1/15",
                "born_probability_in_both_contexts": "3/4",
            },
            "deterministic_witnesses": family,
            "maximum_unitary_covariance_residual": covariance_residual,
            "theorem": (
                "Unitary covariance, normalization, continuity, phase blindness "
                "and eigenstate certainty do not determine the Born rule."
            ),
            "status": "E",
        },
        "conditional_gleason_closure": {
            "premises": [
                "mu(P)>=0 for every orthogonal projector P",
                "mu(I)=1",
                "mu(sum_i P_i)=sum_i mu(P_i) for every orthogonal family",
                "mu(P) depends only on P, not on the projective frame containing P",
                "complex Hilbert dimension at least three",
            ],
            "theorem": (
                "There is a unique positive trace-one operator rho such that "
                "mu(P)=Tr(rho P) for every projector P."
            ),
            "pure_state_step": (
                "If the preparation ray psi has certainty mu(P_psi)=1, positivity "
                "and Tr rho=1 force rho=P_psi. Hence "
                "mu(P_e)=|<e,psi>|^2 exactly."
            ),
            "continuity_note": (
                "In finite dimension >=3, nonnegativity plus the frame-additivity "
                "premise is sufficient; continuity need not be separately assumed."
            ),
            "primary_reference": {
                "author": "Andrew M. Gleason",
                "title": "Measures on the Closed Subspaces of a Hilbert Space",
                "journal": "Journal of Mathematics and Mechanics 6 (1957), 885-893",
                "doi": "10.1512/iumj.1957.6.56050",
            },
            "deterministic_trace_witness": certainty,
            "status": "C: exact theorem after the measurement premises are postulated",
        },
        "cathedral_dynamics_audit": {
            "existing_input": (
                "The relative-information law already writes states as density "
                "matrices and costs through Tr(rho K)."
            ),
            "circularity_boundary": (
                "This trace pairing defines a mathematical expectation inside the "
                "chosen Gibbs model.  Treating it as a derivation of physical outcome "
                "probabilities would assume the rule being claimed."
            ),
            "missing_objects": [
                "a physical measurement/instrument map",
                "outcome records and update dynamics",
                "derivation of projector noncontextuality",
                "derivation of orthogonal additivity across every frame",
            ],
        },
        "verdict": {
            "born_rule_given_gleason_premises": "E/C",
            "gleason_premises_from_urt_dynamics": "U",
            "physical_measurement_process": "U",
            "no_go": (
                "The current finite Hilbert/CAR/Gibbs structure does not derive the "
                "Born rule or measurement.  It satisfies the dimension needed for a "
                "conditional Gleason theorem, but a continuous covariant non-Born "
                "family survives every weaker premise presently derived."
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