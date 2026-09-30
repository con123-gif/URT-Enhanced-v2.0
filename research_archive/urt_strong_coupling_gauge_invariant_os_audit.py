#!/usr/bin/env python3
"""Gauge-invariant strong-coupling OS audit for the reflected overlap layer.

This is a finite-volume counterexample search, not a proof of reflection
positivity.  It improves on taking the smallest eigenvalue of a noisy Monte
Carlo matrix in two ways:

* the observable is the gauge-invariant local scalar density
  S_x = sum_a bar(psi)_(x,a) psi_(x,a);
* spatial Z_2^3 translation symmetry is imposed before diagonalization, and
  a candidate negative direction is selected on training configurations and
  evaluated only on an independent holdout set.

The ensemble is beta=0 compact U(1): every link is independently Haar
distributed and the massive fermion determinant is included by importance
reweighting.  The same configurations are evaluated with the overlap action
and with its reflection-positive Wilson-kernel control.

The finite cell and the staggered-slice reflection are imported from
``urt_interacting_overlap_os_boundary_audit.py``.  No observational target is
used.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


HERE = Path(__file__).resolve().parent
BOUNDARY_AUDIT = HERE / "urt_interacting_overlap_os_boundary_audit.py"
DEFAULT_SEED = 2026090407
DEFAULT_SAMPLES = 4096
TRAINING_FRACTION = 0.25
CONFIDENCE_MULTIPLIER = 3.5


def load_boundary_module() -> Any:
    spec = importlib.util.spec_from_file_location("urt_boundary_audit", BOUNDARY_AUDIT)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {BOUNDARY_AUDIT}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


A = load_boundary_module()
SPATIAL_POINTS = list(np.ndindex((A.NS, A.NS, A.NS)))
POSITIVE_INDEX = {site: index for index, site in enumerate(A.POSITIVE_SITES)}
MOMENTA = list(np.ndindex((2, 2, 2)))


def spin_block(matrix: np.ndarray, left_site: int, right_site: int) -> np.ndarray:
    return matrix[
        4 * left_site : 4 * left_site + 4,
        4 * right_site : 4 * right_site + 4,
    ]


def scalar_density_gram(covariance: np.ndarray) -> np.ndarray:
    """Return <theta(S_x) S_y> for all positive-half sites.

    Wick contraction gives

      tr C_(theta x,theta x) tr C_(y,y)
        - tr[C_(theta x,y) C_(y,theta x)].

    The ensemble average, rather than an individual gauge background, is
    Hermitian.  We therefore retain the full complex per-sample matrix.
    """
    count = len(A.POSITIVE_SITES)
    gram = np.empty((count, count), dtype=complex)
    diagonal_traces = np.empty(len(A.SITES), dtype=complex)
    for site_index in range(len(A.SITES)):
        diagonal_traces[site_index] = np.trace(
            spin_block(covariance, site_index, site_index)
        )

    for row, positive_site in enumerate(A.POSITIVE_SITES):
        reflected_index = A.SITE_INDEX[A.reflect_site(positive_site)]
        reflected_trace = diagonal_traces[reflected_index]
        for column, other_site in enumerate(A.POSITIVE_SITES):
            other_index = A.SITE_INDEX[other_site]
            connected = np.trace(
                spin_block(covariance, reflected_index, other_index)
                @ spin_block(covariance, other_index, reflected_index)
            )
            gram[row, column] = (
                reflected_trace * diagonal_traces[other_index] - connected
            )
    return gram


def momentum_isometries() -> list[np.ndarray]:
    """Isometries from two positive time layers into each spatial momentum."""
    isometries: list[np.ndarray] = []
    normalization = math.sqrt(len(SPATIAL_POINTS))
    for momentum in MOMENTA:
        q = np.zeros((len(A.POSITIVE_SITES), 2), dtype=complex)
        for time_column, time in enumerate((1, 2)):
            for spatial in SPATIAL_POINTS:
                phase = (-1.0) ** sum(
                    momentum[j] * spatial[j] for j in range(3)
                )
                site = (time, *spatial)
                q[POSITIVE_INDEX[site], time_column] = phase / normalization
        isometries.append(q)
    return isometries


MOMENTUM_ISOMETRIES = momentum_isometries()


def momentum_blocks(gram: np.ndarray) -> np.ndarray:
    return np.stack([q.conj().T @ gram @ q for q in MOMENTUM_ISOMETRIES])


def real_determinant_weight(operator: np.ndarray) -> tuple[float, float, int]:
    sign, logabs = np.linalg.slogdet(operator)
    phase = float(np.angle(sign))
    if abs(math.sin(phase)) > 2.0e-9:
        raise RuntimeError(f"fermion determinant is not real: phase={phase}")
    sign_real = 1 if math.cos(phase) >= 0.0 else -1
    return float(logabs), phase, sign_real


def normalized_weights(logweights: np.ndarray, signs: np.ndarray) -> np.ndarray:
    shifted = np.exp(logweights - float(np.max(logweights))) * signs
    normalization = float(np.sum(shifted))
    if normalization <= 0.0:
        raise RuntimeError("nonpositive determinant-weight normalization")
    return shifted / normalization


def effective_sample_size(weights: np.ndarray) -> float:
    return float(1.0 / np.sum(np.square(weights)))


def weighted_blocks(
    blocks: np.ndarray, logweights: np.ndarray, signs: np.ndarray
) -> tuple[np.ndarray, np.ndarray]:
    weights = normalized_weights(logweights, signs)
    mean = np.einsum("n,nkij->kij", weights, blocks)
    return mean, weights


def hermitian(matrix: np.ndarray) -> np.ndarray:
    return 0.5 * (matrix + matrix.conj().T)


def select_witness(mean_blocks: np.ndarray) -> dict[str, Any]:
    best: tuple[float, int, np.ndarray] | None = None
    mode_eigenvalues: list[list[float]] = []
    for momentum_index, block in enumerate(mean_blocks):
        values, vectors = np.linalg.eigh(hermitian(block))
        mode_eigenvalues.append([float(value) for value in values])
        candidate = (float(values[0]), momentum_index, vectors[:, 0])
        if best is None or candidate[0] < best[0]:
            best = candidate
    assert best is not None
    return {
        "training_minimum": best[0],
        "momentum_index": best[1],
        "momentum_pi_units": list(MOMENTA[best[1]]),
        "vector": best[2],
        "training_mode_eigenvalues": mode_eigenvalues,
    }


def ratio_statistics(
    values: np.ndarray,
    logweights: np.ndarray,
    signs: np.ndarray,
    batch_count: int = 24,
) -> dict[str, float | list[float] | str]:
    """Delta-method and independent-batch errors for a fixed real witness."""
    weights = normalized_weights(logweights, signs)
    mean = float(np.sum(weights * values))

    # Influence function for the ratio sum(w q)/sum(w).
    unnormalized = np.exp(logweights - float(np.max(logweights))) * signs
    mean_weight = float(np.mean(unnormalized))
    influence = unnormalized * (values - mean) / mean_weight
    delta_se = float(np.std(influence, ddof=1) / math.sqrt(len(values)))

    usable_batch_count = min(batch_count, len(values) // 16)
    boundaries = np.linspace(0, len(values), usable_batch_count + 1, dtype=int)
    batch_means = []
    for left, right in zip(boundaries[:-1], boundaries[1:]):
        local_weights = normalized_weights(logweights[left:right], signs[left:right])
        batch_means.append(float(np.sum(local_weights * values[left:right])))
    batch_se = float(
        np.std(np.asarray(batch_means), ddof=1) / math.sqrt(usable_batch_count)
    )
    conservative_se = max(delta_se, batch_se)
    lower = mean - CONFIDENCE_MULTIPLIER * conservative_se
    upper = mean + CONFIDENCE_MULTIPLIER * conservative_se
    if upper < 0.0:
        status = "negative witness"
    elif lower > 0.0:
        status = "positive at this fixed witness"
    else:
        status = "sign unresolved at this fixed witness"
    return {
        "mean": mean,
        "delta_method_standard_error": delta_se,
        "batch_standard_error": batch_se,
        "conservative_standard_error": conservative_se,
        "normal_z_score": mean / conservative_se if conservative_se else math.inf,
        "confidence_multiplier": CONFIDENCE_MULTIPLIER,
        "confidence_interval": [lower, upper],
        "batch_count": usable_batch_count,
        "batch_means": batch_means,
        "status": status,
    }


def fixed_witness_values(
    blocks: np.ndarray, momentum_index: int, vector: np.ndarray
) -> np.ndarray:
    selected = blocks[:, momentum_index]
    values = np.einsum("i,nij,j->n", vector.conj(), selected, vector)
    return np.real(values)


def encode_vector(vector: np.ndarray) -> list[dict[str, float]]:
    return [
        {"real": float(component.real), "imaginary": float(component.imag)}
        for component in vector
    ]


def spectrum_summary(mean_blocks: np.ndarray) -> dict[str, Any]:
    rows = []
    all_values = []
    maximum_antihermitian = 0.0
    for momentum, block in zip(MOMENTA, mean_blocks):
        values = np.linalg.eigvalsh(hermitian(block))
        all_values.extend(float(value) for value in values)
        maximum_antihermitian = max(
            maximum_antihermitian, float(np.linalg.norm(block - block.conj().T))
        )
        rows.append(
            {
                "momentum_pi_units": list(momentum),
                "eigenvalues": [float(value) for value in values],
            }
        )
    return {
        "minimum_eigenvalue_descriptive_only": min(all_values),
        "maximum_eigenvalue": max(all_values),
        "maximum_antihermitian_residual": maximum_antihermitian,
        "modes": rows,
        "warning": (
            "The minimum is selected on these same data and is not itself a "
            "valid significance test when the exact matrix has null modes."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--samples", type=int, default=DEFAULT_SAMPLES)
    parser.add_argument("--seed", type=int, default=DEFAULT_SEED)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--progress", type=int, default=256)
    args = parser.parse_args()
    if args.samples < 128:
        raise ValueError("at least 128 samples are required")

    rng = np.random.default_rng(args.seed)
    matrix_dimension = 4 * len(A.SITES)
    identity = np.eye(matrix_dimension, dtype=complex)
    overlap_blocks = np.empty((args.samples, len(MOMENTA), 2, 2), dtype=complex)
    wilson_blocks = np.empty_like(overlap_blocks)
    overlap_logweights = np.empty(args.samples)
    wilson_logweights = np.empty(args.samples)
    overlap_signs = np.empty(args.samples)
    wilson_signs = np.empty(args.samples)
    overlap_phases = np.empty(args.samples)
    wilson_phases = np.empty(args.samples)
    gaps = np.empty(args.samples)

    for sample in range(args.samples):
        phases = rng.uniform(
            -math.pi, math.pi, size=(len(A.SITES), len(A.DIRECTIONS))
        )
        wilson = A.wilson_operator(phases)
        overlap, gap = A.overlap_and_gap(wilson)
        massive_overlap = A.PHYSICAL_MASS * identity + (
            1.0 - A.PHYSICAL_MASS
        ) * overlap
        massive_wilson = wilson + A.PHYSICAL_MASS * identity

        (
            overlap_logweights[sample],
            overlap_phases[sample],
            overlap_signs[sample],
        ) = real_determinant_weight(massive_overlap)
        (
            wilson_logweights[sample],
            wilson_phases[sample],
            wilson_signs[sample],
        ) = real_determinant_weight(massive_wilson)
        gaps[sample] = gap

        overlap_covariance = np.linalg.inv(massive_overlap)
        wilson_covariance = np.linalg.inv(massive_wilson)
        overlap_blocks[sample] = momentum_blocks(
            scalar_density_gram(overlap_covariance)
        )
        wilson_blocks[sample] = momentum_blocks(
            scalar_density_gram(wilson_covariance)
        )
        if args.progress and (sample + 1) % args.progress == 0:
            print(f"completed {sample + 1}/{args.samples}", flush=True)

    training_count = int(round(TRAINING_FRACTION * args.samples))
    training = slice(0, training_count)
    holdout = slice(training_count, args.samples)

    overlap_training_mean, overlap_training_weights = weighted_blocks(
        overlap_blocks[training],
        overlap_logweights[training],
        overlap_signs[training],
    )
    wilson_training_mean, wilson_training_weights = weighted_blocks(
        wilson_blocks[training],
        wilson_logweights[training],
        wilson_signs[training],
    )
    overlap_witness = select_witness(overlap_training_mean)
    wilson_witness = select_witness(wilson_training_mean)

    def evaluate(
        theory_blocks: np.ndarray,
        theory_logweights: np.ndarray,
        theory_signs: np.ndarray,
        witness: dict[str, Any],
    ) -> dict[str, Any]:
        values = fixed_witness_values(
            theory_blocks[holdout],
            int(witness["momentum_index"]),
            witness["vector"],
        )
        return ratio_statistics(
            values,
            theory_logweights[holdout],
            theory_signs[holdout],
        )

    overlap_all_mean, overlap_all_weights = weighted_blocks(
        overlap_blocks, overlap_logweights, overlap_signs
    )
    wilson_all_mean, wilson_all_weights = weighted_blocks(
        wilson_blocks, wilson_logweights, wilson_signs
    )

    overlap_selected_on_overlap = evaluate(
        overlap_blocks, overlap_logweights, overlap_signs, overlap_witness
    )
    wilson_at_overlap_witness = evaluate(
        wilson_blocks, wilson_logweights, wilson_signs, overlap_witness
    )
    wilson_selected_on_wilson = evaluate(
        wilson_blocks, wilson_logweights, wilson_signs, wilson_witness
    )
    overlap_at_wilson_witness = evaluate(
        overlap_blocks, overlap_logweights, overlap_signs, wilson_witness
    )

    negative_overlap = overlap_selected_on_overlap["status"] == "negative witness"
    wilson_control_failure = wilson_selected_on_wilson["status"] == "negative witness"
    if negative_overlap and not wilson_control_failure:
        conclusion = (
            "A holdout-confirmed overlap-negative scalar-density witness was found "
            "while the separately selected Wilson control did not fail.  This is "
            "finite-volume evidence for a counterexample and requires independent "
            "replication before rejection of the interacting overlap merger."
        )
        status = "candidate overlap-specific counterexample"
    elif wilson_control_failure:
        conclusion = (
            "The Wilson control also fails the holdout sign test.  The observable, "
            "reflection convention, or Monte Carlo estimator is therefore not a "
            "valid overlap-specific discriminator in this implementation."
        )
        status = "calibration failure"
    else:
        conclusion = (
            "No holdout-confirmed negative scalar-density witness was found.  This "
            "removes the adaptive-minimum false alarm on this finite cell but does "
            "not prove interacting overlap reflection positivity."
        )
        status = "finite test passed; theorem remains open"

    def determinant_diagnostics(
        phases: np.ndarray,
        signs: np.ndarray,
        all_weights: np.ndarray,
        training_weights: np.ndarray,
        logweights: np.ndarray,
    ) -> dict[str, Any]:
        holdout_weights = normalized_weights(
            logweights[holdout], signs[holdout]
        )
        return {
            "maximum_absolute_phase": float(np.max(np.abs(phases))),
            "negative_determinant_count": int(np.sum(signs < 0.0)),
            "effective_sample_size_all": effective_sample_size(all_weights),
            "effective_sample_size_training": effective_sample_size(training_weights),
            "effective_sample_size_holdout": effective_sample_size(holdout_weights),
            "log_weight_range": [
                float(np.min(logweights)), float(np.max(logweights))
            ],
        }

    def witness_record(witness: dict[str, Any]) -> dict[str, Any]:
        return {
            "training_minimum": float(witness["training_minimum"]),
            "momentum_pi_units": witness["momentum_pi_units"],
            "time_layer_vector": encode_vector(witness["vector"]),
            "training_mode_eigenvalues": witness["training_mode_eigenvalues"],
        }

    out: dict[str, Any] = {
        "certificate": "URT gauge-invariant strong-coupling OS audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "scope": {
            "ensemble": (
                "compact U(1), beta=0, every graph link independently Haar; "
                "massive one-flavour determinant included"
            ),
            "observable": "S_x=sum_a bar(psi)_(x,a) psi_(x,a)",
            "OS_form": "<theta(S_x) S_y>",
            "finite_cell": {
                "Nt": A.NT,
                "Ns": A.NS,
                "positive_times": [1, 2],
                "matrix_dimension": matrix_dimension,
                "link_variables": len(A.SITES) * len(A.DIRECTIONS),
                "reflection": "theta(t,n)=(-t,n+t(1,1,1))",
            },
            "fermion_parameters": {
                "r": A.R_SELECTED,
                "M": A.M_SELECTED,
                "c_t": A.C_SELECTED,
                "physical_mass": A.PHYSICAL_MASS,
            },
        },
        "method": {
            "samples": args.samples,
            "seed": args.seed,
            "training_samples": training_count,
            "holdout_samples": args.samples - training_count,
            "exact_symmetry_projection": "spatial Z_2^3 momentum blocks",
            "selection_rule": (
                "choose the lowest two-time-layer eigenvector on training data only"
            ),
            "test_rule": (
                "evaluate that fixed vector on independent holdout data using "
                "self-normalized determinant weights"
            ),
            "uncertainty": (
                "maximum of iid ratio delta-method SE and 24 independent-batch SE"
            ),
            "confidence_multiplier": CONFIDENCE_MULTIPLIER,
            "multiple_testing_note": (
                "training selection and holdout testing prevent reuse of the same "
                "noise realization for the reported sign test"
            ),
        },
        "kernel_gap": {
            "minimum_XdaggerX": float(np.min(gaps)),
            "median_XdaggerX": float(np.median(gaps)),
        },
        "determinants": {
            "overlap": determinant_diagnostics(
                overlap_phases,
                overlap_signs,
                overlap_all_weights,
                overlap_training_weights,
                overlap_logweights,
            ),
            "Wilson_control": determinant_diagnostics(
                wilson_phases,
                wilson_signs,
                wilson_all_weights,
                wilson_training_weights,
                wilson_logweights,
            ),
        },
        "descriptive_full_sample_spectra": {
            "overlap": spectrum_summary(overlap_all_mean),
            "Wilson_control": spectrum_summary(wilson_all_mean),
        },
        "training_witnesses": {
            "selected_by_overlap": witness_record(overlap_witness),
            "selected_by_Wilson": witness_record(wilson_witness),
        },
        "independent_holdout_tests": {
            "overlap_at_overlap_selected_witness": overlap_selected_on_overlap,
            "Wilson_at_overlap_selected_witness": wilson_at_overlap_witness,
            "Wilson_at_Wilson_selected_witness": wilson_selected_on_wilson,
            "overlap_at_Wilson_selected_witness": overlap_at_wilson_witness,
        },
        "verdict": {
            "status": status,
            "overlap_negative_witness_found": negative_overlap,
            "Wilson_control_failure": wilson_control_failure,
            "interacting_overlap_reflection_positivity_proved": False,
            "conclusion": conclusion,
            "remaining_decision": (
                "An all-boundary Grassmann-cone/character factorization or a "
                "replicated gauge-invariant negative witness in a larger observable "
                "class is still required."
            ),
        },
    }

    text = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text, encoding="utf-8")
    else:
        print(text, end="")


if __name__ == "__main__":
    main()