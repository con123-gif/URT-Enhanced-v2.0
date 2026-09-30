#!/usr/bin/env python3
"""Complete local-Clifford strong-coupling OS counterexample search.

The scalar-density audit tests only bar(psi) psi.  Here the positive-half
observable basis is enlarged to

    O_(x,A) = bar(psi)_x Gamma_A psi_x,

where Gamma_A runs over all 16 Hermitian Euclidean Clifford matrices.  These
operators are local and gauge invariant.  Their reflected two-point matrix is
evaluated in the beta=0 compact-U(1) ensemble with the fermion determinant
included.  Spatial Z_2^3 translation symmetry reduces the problem to eight
32-by-32 blocks (two positive time layers times 16 Clifford channels).

The most negative direction is chosen on a training set.  Only its value on
an independent holdout set is used as a sign test.  The Wilson-kernel theory
is run on the identical gauge configurations as a calibration control.

This is a finite-volume search for a counterexample, not a proof of the
interacting overlap theory.  No observational target is used.
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


HERE = Path(__file__).resolve().parent
SCALAR_AUDIT = HERE / "urt_strong_coupling_gauge_invariant_os_audit.py"
DEFAULT_SEED = 2026090419
DEFAULT_SAMPLES = 2048


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


CORE = load_module("urt_scalar_os_audit", SCALAR_AUDIT)
A = CORE.A
SPATIAL_POINTS = CORE.SPATIAL_POINTS
MOMENTA = CORE.MOMENTA
MOMENTUM_PHASES = np.array(
    [
        [
            (-1.0) ** sum(momentum[j] * point[j] for j in range(3))
            / math.sqrt(len(SPATIAL_POINTS))
            for point in SPATIAL_POINTS
        ]
        for momentum in MOMENTA
    ]
)


def clifford_basis() -> tuple[np.ndarray, list[str]]:
    gammas, _ = A.gamma_matrices()
    matrices = []
    labels = []
    identity = np.eye(4, dtype=complex)
    for degree in range(5):
        for indices in itertools.combinations(range(4), degree):
            matrix = identity.copy()
            for index in indices:
                matrix = matrix @ gammas[index]
            phase_label = ""
            if np.linalg.norm(matrix - matrix.conj().T) > 1.0e-12:
                matrix = 1.0j * matrix
                phase_label = "i "
            matrices.append(matrix)
            if indices:
                labels.append(phase_label + " ".join(f"gamma_{i}" for i in indices))
            else:
                labels.append("I")
    return np.asarray(matrices), labels


CLIFFORD, CLIFFORD_LABELS = clifford_basis()
GAMMA0 = A.gamma_matrices()[0][0]
THETA_CLIFFORD = np.asarray(
    [GAMMA0 @ matrix.conj().T @ GAMMA0 for matrix in CLIFFORD]
)


def spin_block(matrix: np.ndarray, left_site: int, right_site: int) -> np.ndarray:
    return matrix[
        4 * left_site : 4 * left_site + 4,
        4 * right_site : 4 * right_site + 4,
    ]


def local_clifford_momentum_blocks(covariance: np.ndarray) -> np.ndarray:
    """Return eight momentum blocks on time-layer x Clifford space."""
    # H[t,x,A,u,y,B] = <theta(O_(t,x,A)) O_(u,y,B)>.
    correlation = np.empty((2, 8, 16, 2, 8, 16), dtype=complex)
    for time_index, time in enumerate((1, 2)):
        for spatial_index, spatial in enumerate(SPATIAL_POINTS):
            site = (time, *spatial)
            reflected = A.SITE_INDEX[A.reflect_site(site)]
            reflected_diagonal = spin_block(covariance, reflected, reflected)
            reflected_traces = np.einsum(
                "aij,ji->a", THETA_CLIFFORD, reflected_diagonal
            )
            for other_time_index, other_time in enumerate((1, 2)):
                for other_spatial_index, other_spatial in enumerate(SPATIAL_POINTS):
                    other = A.SITE_INDEX[(other_time, *other_spatial)]
                    other_diagonal = spin_block(covariance, other, other)
                    other_traces = np.einsum(
                        "bij,ji->b", CLIFFORD, other_diagonal
                    )
                    connected = np.einsum(
                        "aij,jk,bkl,li->ab",
                        THETA_CLIFFORD,
                        spin_block(covariance, reflected, other),
                        CLIFFORD,
                        spin_block(covariance, other, reflected),
                        optimize=True,
                    )
                    correlation[
                        time_index,
                        spatial_index,
                        :,
                        other_time_index,
                        other_spatial_index,
                        :,
                    ] = (
                        reflected_traces[:, None] * other_traces[None, :]
                        - connected
                    )

    blocks = np.einsum(
        "ks,tsauqb,kq->ktaub",
        MOMENTUM_PHASES,
        correlation,
        MOMENTUM_PHASES,
        optimize=True,
    )
    return blocks.reshape(len(MOMENTA), 32, 32)


def basis_diagnostics() -> dict[str, Any]:
    inner = np.einsum("aij,bij->ab", CLIFFORD.conj(), CLIFFORD)
    orthogonality_residual = float(np.linalg.norm(inner - 4.0 * np.eye(16)))
    hermiticity_residual = max(
        float(np.linalg.norm(matrix - matrix.conj().T)) for matrix in CLIFFORD
    )
    theta_rows = []
    theta_closure_residual = 0.0
    for label, reflected in zip(CLIFFORD_LABELS, THETA_CLIFFORD):
        coefficients = np.einsum("aij,ij->a", CLIFFORD.conj(), reflected) / 4.0
        index = int(np.argmax(np.abs(coefficients)))
        sign = float(coefficients[index].real)
        residual = float(np.linalg.norm(reflected - sign * CLIFFORD[index]))
        theta_closure_residual = max(theta_closure_residual, residual)
        theta_rows.append(
            {
                "input": label,
                "output": CLIFFORD_LABELS[index],
                "sign": sign,
                "residual": residual,
            }
        )
    return {
        "labels": CLIFFORD_LABELS,
        "trace_orthogonality_residual": orthogonality_residual,
        "Hermiticity_residual": hermiticity_residual,
        "theta_action": theta_rows,
        "theta_closure_residual": theta_closure_residual,
    }


def calibration(phases: np.ndarray) -> dict[str, Any]:
    wilson = A.wilson_operator(phases)
    overlap, gap = A.overlap_and_gap(wilson)
    identity = np.eye(wilson.shape[0], dtype=complex)
    operators = {
        "overlap": A.PHYSICAL_MASS * identity
        + (1.0 - A.PHYSICAL_MASS) * overlap,
        "Wilson_control": wilson + A.PHYSICAL_MASS * identity,
    }
    out = {"minimum_XdaggerX": gap}
    for name, operator in operators.items():
        blocks = local_clifford_momentum_blocks(np.linalg.inv(operator))
        eigenvalues = np.concatenate(
            [np.linalg.eigvalsh(CORE.hermitian(block)) for block in blocks]
        )
        out[name] = {
            "minimum_eigenvalue": float(np.min(eigenvalues)),
            "maximum_eigenvalue": float(np.max(eigenvalues)),
            "maximum_antihermitian_residual": max(
                float(np.linalg.norm(block - block.conj().T)) for block in blocks
            ),
        }
    return out


def select_witness(mean_blocks: np.ndarray) -> dict[str, Any]:
    best: tuple[float, int, np.ndarray] | None = None
    mode_minima = []
    for momentum_index, block in enumerate(mean_blocks):
        values, vectors = np.linalg.eigh(CORE.hermitian(block))
        mode_minima.append(float(values[0]))
        candidate = (float(values[0]), momentum_index, vectors[:, 0])
        if best is None or candidate[0] < best[0]:
            best = candidate
    assert best is not None
    return {
        "training_minimum": best[0],
        "momentum_index": best[1],
        "momentum_pi_units": list(MOMENTA[best[1]]),
        "vector": best[2],
        "mode_minima": mode_minima,
    }


def witness_channels(vector: np.ndarray, count: int = 8) -> list[dict[str, Any]]:
    rows = []
    for flat_index in np.argsort(np.abs(vector))[::-1][:count]:
        time_index, clifford_index = divmod(int(flat_index), 16)
        component = vector[flat_index]
        rows.append(
            {
                "positive_time": time_index + 1,
                "Clifford_channel": CLIFFORD_LABELS[clifford_index],
                "real": float(component.real),
                "imaginary": float(component.imag),
                "absolute_value": float(abs(component)),
            }
        )
    return rows


def spectrum_summary(mean_blocks: np.ndarray) -> dict[str, Any]:
    rows = []
    all_values = []
    for momentum, block in zip(MOMENTA, mean_blocks):
        values = np.linalg.eigvalsh(CORE.hermitian(block))
        all_values.extend(float(value) for value in values)
        rows.append(
            {
                "momentum_pi_units": list(momentum),
                "minimum_eigenvalue": float(values[0]),
                "maximum_eigenvalue": float(values[-1]),
            }
        )
    return {
        "minimum_eigenvalue_descriptive_only": min(all_values),
        "maximum_eigenvalue": max(all_values),
        "modes": rows,
        "warning": "same-data adaptive minimum; not a significance test",
    }


def fixed_values(
    blocks: np.ndarray, momentum_index: int, vector: np.ndarray
) -> np.ndarray:
    selected = blocks[:, momentum_index]
    return np.real(np.einsum("i,nij,j->n", vector.conj(), selected, vector))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--samples", type=int, default=DEFAULT_SAMPLES)
    parser.add_argument("--seed", type=int, default=DEFAULT_SEED)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--progress", type=int, default=128)
    args = parser.parse_args()
    if args.samples < 128:
        raise ValueError("at least 128 samples are required")

    free = calibration(np.zeros((len(A.SITES), len(A.DIRECTIONS))))
    strict_half = [
        calibration(A.reflection_symmetric_phases(0.2, args.seed + i, True))
        for i in range(3)
    ]

    rng = np.random.default_rng(args.seed)
    dimension = 4 * len(A.SITES)
    identity = np.eye(dimension, dtype=complex)
    overlap_blocks = np.empty((args.samples, 8, 32, 32), dtype=complex)
    wilson_blocks = np.empty_like(overlap_blocks)
    overlap_logweights = np.empty(args.samples)
    wilson_logweights = np.empty(args.samples)
    overlap_signs = np.empty(args.samples)
    wilson_signs = np.empty(args.samples)
    overlap_phases = np.empty(args.samples)
    wilson_phases = np.empty(args.samples)
    gaps = np.empty(args.samples)

    for sample in range(args.samples):
        phases = rng.uniform(-math.pi, math.pi, size=(len(A.SITES), len(A.DIRECTIONS)))
        wilson = A.wilson_operator(phases)
        overlap, gaps[sample] = A.overlap_and_gap(wilson)
        massive_overlap = A.PHYSICAL_MASS * identity + (
            1.0 - A.PHYSICAL_MASS
        ) * overlap
        massive_wilson = wilson + A.PHYSICAL_MASS * identity
        (
            overlap_logweights[sample],
            overlap_phases[sample],
            overlap_signs[sample],
        ) = CORE.real_determinant_weight(massive_overlap)
        (
            wilson_logweights[sample],
            wilson_phases[sample],
            wilson_signs[sample],
        ) = CORE.real_determinant_weight(massive_wilson)
        overlap_blocks[sample] = local_clifford_momentum_blocks(
            np.linalg.inv(massive_overlap)
        )
        wilson_blocks[sample] = local_clifford_momentum_blocks(
            np.linalg.inv(massive_wilson)
        )
        if args.progress and (sample + 1) % args.progress == 0:
            print(f"completed {sample + 1}/{args.samples}", flush=True)

    training_count = int(round(CORE.TRAINING_FRACTION * args.samples))
    training = slice(0, training_count)
    holdout = slice(training_count, args.samples)

    overlap_training_mean, overlap_training_weights = CORE.weighted_blocks(
        overlap_blocks[training], overlap_logweights[training], overlap_signs[training]
    )
    wilson_training_mean, wilson_training_weights = CORE.weighted_blocks(
        wilson_blocks[training], wilson_logweights[training], wilson_signs[training]
    )
    overlap_witness = select_witness(overlap_training_mean)
    wilson_witness = select_witness(wilson_training_mean)

    def evaluate(
        blocks: np.ndarray,
        logweights: np.ndarray,
        signs: np.ndarray,
        witness: dict[str, Any],
    ) -> dict[str, Any]:
        values = fixed_values(
            blocks[holdout], int(witness["momentum_index"]), witness["vector"]
        )
        return CORE.ratio_statistics(values, logweights[holdout], signs[holdout])

    tests = {
        "overlap_at_overlap_selected_witness": evaluate(
            overlap_blocks, overlap_logweights, overlap_signs, overlap_witness
        ),
        "Wilson_at_overlap_selected_witness": evaluate(
            wilson_blocks, wilson_logweights, wilson_signs, overlap_witness
        ),
        "Wilson_at_Wilson_selected_witness": evaluate(
            wilson_blocks, wilson_logweights, wilson_signs, wilson_witness
        ),
        "overlap_at_Wilson_selected_witness": evaluate(
            overlap_blocks, overlap_logweights, overlap_signs, wilson_witness
        ),
    }

    overlap_all_mean, overlap_all_weights = CORE.weighted_blocks(
        overlap_blocks, overlap_logweights, overlap_signs
    )
    wilson_all_mean, wilson_all_weights = CORE.weighted_blocks(
        wilson_blocks, wilson_logweights, wilson_signs
    )

    overlap_negative = (
        tests["overlap_at_overlap_selected_witness"]["status"]
        == "negative witness"
    )
    wilson_failure = (
        tests["Wilson_at_Wilson_selected_witness"]["status"]
        == "negative witness"
    )
    if wilson_failure:
        status = "calibration failure"
        conclusion = (
            "The Wilson control has a holdout-negative direction, so this "
            "implementation is not an overlap-specific discriminator."
        )
    elif overlap_negative:
        status = "candidate overlap-specific counterexample"
        conclusion = (
            "The overlap theory has a holdout-negative local-Clifford direction "
            "without a separately selected Wilson failure. Replication is required."
        )
    else:
        status = "finite Clifford test passed; theorem remains open"
        conclusion = (
            "No holdout-confirmed negative direction was found in the complete "
            "local gauge-invariant Clifford basis on this finite cell."
        )

    def determinant_record(
        phases: np.ndarray,
        signs: np.ndarray,
        weights: np.ndarray,
        training_weights: np.ndarray,
        logweights: np.ndarray,
    ) -> dict[str, Any]:
        holdout_weights = CORE.normalized_weights(logweights[holdout], signs[holdout])
        return {
            "maximum_absolute_phase": float(np.max(np.abs(phases))),
            "negative_count": int(np.sum(signs < 0.0)),
            "effective_sample_size_all": CORE.effective_sample_size(weights),
            "effective_sample_size_training": CORE.effective_sample_size(
                training_weights
            ),
            "effective_sample_size_holdout": CORE.effective_sample_size(
                holdout_weights
            ),
        }

    out: dict[str, Any] = {
        "certificate": "URT complete local-Clifford strong-coupling OS audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "basis": basis_diagnostics(),
        "scope": {
            "ensemble": "compact U(1), beta=0, all 528 links Haar",
            "operators": "16 local gauge-invariant Clifford bilinears per site",
            "positive_sites": len(A.POSITIVE_SITES),
            "unprojected_OS_matrix_dimension": 16 * len(A.POSITIVE_SITES),
            "spatial_momentum_blocks": "8 blocks of dimension 32",
            "fermion_parameters": {
                "r": A.R_SELECTED,
                "M": A.M_SELECTED,
                "c_t": A.C_SELECTED,
                "mass": A.PHYSICAL_MASS,
            },
        },
        "calibration": {
            "free": free,
            "strict_half_reflection_paired": strict_half,
            "result": "PSD to roundoff before boundary Haar integration",
        },
        "method": {
            "samples": args.samples,
            "seed": args.seed,
            "training_samples": training_count,
            "holdout_samples": args.samples - training_count,
            "selection": "minimum training eigenvector over eight momentum blocks",
            "test": "fixed-vector determinant-weighted holdout ratio",
            "confidence_multiplier": CORE.CONFIDENCE_MULTIPLIER,
        },
        "minimum_XdaggerX": float(np.min(gaps)),
        "determinants": {
            "overlap": determinant_record(
                overlap_phases,
                overlap_signs,
                overlap_all_weights,
                overlap_training_weights,
                overlap_logweights,
            ),
            "Wilson_control": determinant_record(
                wilson_phases,
                wilson_signs,
                wilson_all_weights,
                wilson_training_weights,
                wilson_logweights,
            ),
        },
        "training_witnesses": {
            "overlap": {
                "minimum": overlap_witness["training_minimum"],
                "momentum_pi_units": overlap_witness["momentum_pi_units"],
                "mode_minima": overlap_witness["mode_minima"],
                "largest_channels": witness_channels(overlap_witness["vector"]),
            },
            "Wilson_control": {
                "minimum": wilson_witness["training_minimum"],
                "momentum_pi_units": wilson_witness["momentum_pi_units"],
                "mode_minima": wilson_witness["mode_minima"],
                "largest_channels": witness_channels(wilson_witness["vector"]),
            },
        },
        "independent_holdout_tests": tests,
        "descriptive_full_sample_spectra": {
            "overlap": spectrum_summary(overlap_all_mean),
            "Wilson_control": spectrum_summary(wilson_all_mean),
        },
        "verdict": {
            "status": status,
            "overlap_negative_witness_found": overlap_negative,
            "Wilson_control_failure": wilson_failure,
            "interacting_overlap_reflection_positivity_proved": False,
            "conclusion": conclusion,
            "next_observable_class": (
                "gauge-invariant point-split bilinears with positive-half "
                "parallel transporters, or an all-boundary cone proof"
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