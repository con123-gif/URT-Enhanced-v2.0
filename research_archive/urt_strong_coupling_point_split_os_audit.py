#!/usr/bin/env python3
"""Gauge-invariant point-split strong-coupling OS audit.

The positive-half observable basis consists of scalar mesons

    B_e = bar(psi)_x U_(x->y) psi_y

on every elementary graph edge that stays inside positive time.  There are
14 edge types per spatial base point: three spatial directions on each of
the t=1 and t=2 layers, and eight future diagonals from t=1 to t=2.  Spatial
Z_2^3 translation symmetry reduces the 112-dimensional OS form to eight
14-by-14 momentum blocks.

For an edge x->y, anti-linear order-reversing OS reflection produces the
parallel transporter on theta(y)->theta(x).  The implementation explicitly
checks this endpoint identity and gauge covariance.  A training ensemble
selects the lowest direction; only an independent determinant-weighted
holdout ensemble decides its sign.  The Wilson-kernel action is the control.

This is a finite-volume counterexample search, not an interacting proof.
No observational target is used.
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
SCALAR_AUDIT = HERE / "urt_strong_coupling_gauge_invariant_os_audit.py"
DEFAULT_SEED = 2026090429
DEFAULT_SAMPLES = 4096


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


def build_edge_basis() -> dict[str, Any]:
    labels = []
    descriptors = []
    for time in (1, 2):
        for direction in range(3):
            labels.append(f"spatial t={time}, direction={direction + 1}")
            descriptors.append((time, direction))
    for direction in range(3, len(A.DIRECTIONS)):
        signs = tuple(2 * bit + 1 for bit in A.DIRECTIONS[direction][1:])
        labels.append(f"future t=1->2, spatial signs={signs}")
        descriptors.append((1, direction))

    start = np.empty((len(labels), len(SPATIAL_POINTS)), dtype=int)
    end = np.empty_like(start)
    link_direction = np.empty_like(start)
    theta_link_site = np.empty_like(start)
    theta_link_direction = np.empty_like(start)
    theta_conjugate = np.empty_like(start, dtype=bool)
    endpoint_residual = 0

    for edge_type, (time, direction) in enumerate(descriptors):
        for spatial_index, spatial in enumerate(SPATIAL_POINTS):
            site = (time, *spatial)
            site_index = A.SITE_INDEX[site]
            endpoint = A.shift(site, A.DIRECTIONS[direction])
            endpoint_index = A.SITE_INDEX[endpoint]
            start[edge_type, spatial_index] = site_index
            end[edge_type, spatial_index] = endpoint_index
            link_direction[edge_type, spatial_index] = direction

            partner_site, partner_direction, phase_sign = A.reflected_link_partner(
                site_index, direction
            )
            theta_link_site[edge_type, spatial_index] = partner_site
            theta_link_direction[edge_type, spatial_index] = partner_direction
            if direction < 3:
                # The stored partner is theta(x)->theta(y); invert it.
                theta_conjugate[edge_type, spatial_index] = True
                represented_start = A.SITE_INDEX[A.reflect_site(endpoint)]
                represented_end = partner_site
                actual_end = A.SITE_INDEX[
                    A.shift(A.SITES[represented_start], tuple(-x for x in A.DIRECTIONS[partner_direction]))
                ]
                endpoint_residual = max(
                    endpoint_residual,
                    int(represented_end != A.SITE_INDEX[A.reflect_site(site)]),
                    int(actual_end != represented_end),
                )
                if phase_sign != 1:
                    raise AssertionError("unexpected spatial reflection sign")
            else:
                # The stored future partner already runs theta(y)->theta(x).
                theta_conjugate[edge_type, spatial_index] = False
                represented_start = partner_site
                represented_end = A.SITE_INDEX[
                    A.shift(A.SITES[partner_site], A.DIRECTIONS[partner_direction])
                ]
                endpoint_residual = max(
                    endpoint_residual,
                    int(represented_start != A.SITE_INDEX[A.reflect_site(endpoint)]),
                    int(represented_end != A.SITE_INDEX[A.reflect_site(site)]),
                )
                if phase_sign != -1:
                    raise AssertionError("unexpected temporal reflection sign")

    if endpoint_residual:
        raise AssertionError("reflected transporter endpoints do not match")
    return {
        "labels": labels,
        "start": start,
        "end": end,
        "direction": link_direction,
        "theta_link_site": theta_link_site,
        "theta_link_direction": theta_link_direction,
        "theta_conjugate": theta_conjugate,
        "endpoint_residual": endpoint_residual,
    }


EDGES = build_edge_basis()
EDGE_TYPE_COUNT = len(EDGES["labels"])
FLAT_START = EDGES["start"].reshape(-1)
FLAT_END = EDGES["end"].reshape(-1)
FLAT_DIRECTION = EDGES["direction"].reshape(-1)
FLAT_THETA_LINK_SITE = EDGES["theta_link_site"].reshape(-1)
FLAT_THETA_LINK_DIRECTION = EDGES["theta_link_direction"].reshape(-1)
FLAT_THETA_CONJUGATE = EDGES["theta_conjugate"].reshape(-1)
FLAT_REFLECTED_START = np.array(
    [A.SITE_INDEX[A.reflect_site(A.SITES[index])] for index in FLAT_START]
)
FLAT_REFLECTED_END = np.array(
    [A.SITE_INDEX[A.reflect_site(A.SITES[index])] for index in FLAT_END]
)


def covariance_site_blocks(covariance: np.ndarray) -> np.ndarray:
    site_count = len(A.SITES)
    return covariance.reshape(site_count, 4, site_count, 4).transpose(0, 2, 1, 3)


def point_split_momentum_blocks(
    covariance: np.ndarray, phases: np.ndarray
) -> np.ndarray:
    links = np.exp(1.0j * phases)
    positive_transporters = links[FLAT_START, FLAT_DIRECTION]
    reflected_stored = links[FLAT_THETA_LINK_SITE, FLAT_THETA_LINK_DIRECTION]
    reflected_reverse_transporters = np.where(
        FLAT_THETA_CONJUGATE,
        np.conjugate(reflected_stored),
        reflected_stored,
    )

    blocks = covariance_site_blocks(covariance)
    # theta(B_i) has bar at theta(y_i), psi at theta(x_i), and a
    # transporter theta(y_i)->theta(x_i).
    theta_bar = FLAT_REFLECTED_END
    theta_psi = FLAT_REFLECTED_START
    positive_bar = FLAT_START
    positive_psi = FLAT_END

    theta_traces = np.trace(blocks[theta_psi, theta_bar], axis1=1, axis2=2)
    positive_traces = np.trace(
        blocks[positive_psi, positive_bar], axis1=1, axis2=2
    )
    cross_one = blocks[theta_psi[:, None], positive_bar[None, :]]
    cross_two = blocks[positive_psi[None, :], theta_bar[:, None]]
    connected = np.einsum("ijab,ijba->ij", cross_one, cross_two, optimize=True)
    transporter_factor = (
        reflected_reverse_transporters[:, None] * positive_transporters[None, :]
    )
    correlation = transporter_factor * (
        theta_traces[:, None] * positive_traces[None, :] - connected
    )
    correlation = correlation.reshape(
        EDGE_TYPE_COUNT,
        len(SPATIAL_POINTS),
        EDGE_TYPE_COUNT,
        len(SPATIAL_POINTS),
    )
    return np.einsum(
        "ks,asbq,kq->kab",
        MOMENTUM_PHASES,
        correlation,
        MOMENTUM_PHASES,
        optimize=True,
    )


def gauge_transform(phases: np.ndarray, site_angles: np.ndarray) -> np.ndarray:
    transformed = phases.copy()
    for site_index, site in enumerate(A.SITES):
        for direction_index, displacement in enumerate(A.DIRECTIONS):
            endpoint = A.SITE_INDEX[A.shift(site, displacement)]
            transformed[site_index, direction_index] += (
                site_angles[site_index] - site_angles[endpoint]
            )
    return transformed


def operators(phases: np.ndarray) -> tuple[dict[str, np.ndarray], float]:
    wilson = A.wilson_operator(phases)
    overlap, gap = A.overlap_and_gap(wilson)
    identity = np.eye(wilson.shape[0], dtype=complex)
    return {
        "overlap": A.PHYSICAL_MASS * identity
        + (1.0 - A.PHYSICAL_MASS) * overlap,
        "Wilson_control": wilson + A.PHYSICAL_MASS * identity,
    }, gap


def calibration(phases: np.ndarray) -> dict[str, Any]:
    action_operators, gap = operators(phases)
    out: dict[str, Any] = {"minimum_XdaggerX": gap}
    for name, operator in action_operators.items():
        momentum = point_split_momentum_blocks(np.linalg.inv(operator), phases)
        values = np.concatenate(
            [np.linalg.eigvalsh(CORE.hermitian(block)) for block in momentum]
        )
        out[name] = {
            "minimum_eigenvalue": float(np.min(values)),
            "maximum_eigenvalue": float(np.max(values)),
            "maximum_antihermitian_residual": max(
                float(np.linalg.norm(block - block.conj().T)) for block in momentum
            ),
        }
    return out


def gauge_covariance_calibration(seed: int) -> dict[str, Any]:
    rng = np.random.default_rng(seed)
    phases = rng.uniform(-0.7, 0.7, size=(len(A.SITES), len(A.DIRECTIONS)))
    angles = rng.uniform(-math.pi, math.pi, size=len(A.SITES))
    transformed = gauge_transform(phases, angles)
    before, gap_before = operators(phases)
    after, gap_after = operators(transformed)
    rows = {}
    for name in before:
        determinant_before = np.linalg.slogdet(before[name])
        determinant_after = np.linalg.slogdet(after[name])
        blocks_before = point_split_momentum_blocks(
            np.linalg.inv(before[name]), phases
        )
        blocks_after = point_split_momentum_blocks(
            np.linalg.inv(after[name]), transformed
        )
        rows[name] = {
            "operator_spectrum_gap_residual": abs(gap_after - gap_before),
            "logabsdet_residual": abs(determinant_after[1] - determinant_before[1]),
            "determinant_phase_residual": abs(
                np.angle(determinant_after[0] / determinant_before[0])
            ),
            "observable_block_residual": float(
                np.linalg.norm(blocks_after - blocks_before)
            ),
        }
    return rows


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


def witness_edges(vector: np.ndarray, count: int = 8) -> list[dict[str, Any]]:
    rows = []
    for index in np.argsort(np.abs(vector))[::-1][:count]:
        component = vector[index]
        rows.append(
            {
                "edge_type": EDGES["labels"][int(index)],
                "real": float(component.real),
                "imaginary": float(component.imag),
                "absolute_value": float(abs(component)),
            }
        )
    return rows


def fixed_values(
    blocks: np.ndarray, momentum_index: int, vector: np.ndarray
) -> np.ndarray:
    selected = blocks[:, momentum_index]
    return np.real(np.einsum("i,nij,j->n", vector.conj(), selected, vector))


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


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--samples", type=int, default=DEFAULT_SAMPLES)
    parser.add_argument("--seed", type=int, default=DEFAULT_SEED)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--progress", type=int, default=256)
    args = parser.parse_args()
    if args.samples < 128:
        raise ValueError("at least 128 samples are required")

    free = calibration(np.zeros((len(A.SITES), len(A.DIRECTIONS))))
    strict_half = [
        calibration(A.reflection_symmetric_phases(0.2, args.seed + i, True))
        for i in range(3)
    ]
    covariance_check = gauge_covariance_calibration(args.seed + 1000)

    rng = np.random.default_rng(args.seed)
    overlap_blocks = np.empty((args.samples, 8, EDGE_TYPE_COUNT, EDGE_TYPE_COUNT), complex)
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
        action_operators, gaps[sample] = operators(phases)
        overlap_operator = action_operators["overlap"]
        wilson_operator = action_operators["Wilson_control"]
        (
            overlap_logweights[sample],
            overlap_phases[sample],
            overlap_signs[sample],
        ) = CORE.real_determinant_weight(overlap_operator)
        (
            wilson_logweights[sample],
            wilson_phases[sample],
            wilson_signs[sample],
        ) = CORE.real_determinant_weight(wilson_operator)
        overlap_blocks[sample] = point_split_momentum_blocks(
            np.linalg.inv(overlap_operator), phases
        )
        wilson_blocks[sample] = point_split_momentum_blocks(
            np.linalg.inv(wilson_operator), phases
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
        tests["overlap_at_overlap_selected_witness"]["status"] == "negative witness"
    )
    wilson_failure = (
        tests["Wilson_at_Wilson_selected_witness"]["status"] == "negative witness"
    )
    if wilson_failure:
        status = "calibration failure"
        conclusion = "The Wilson holdout control is negative; this is not overlap-specific."
    elif overlap_negative:
        status = "candidate overlap-specific counterexample"
        conclusion = (
            "A holdout-negative gauge-invariant point-split overlap direction was "
            "found without a separately selected Wilson failure; replicate it."
        )
    else:
        status = "finite point-split test passed; theorem remains open"
        conclusion = (
            "No holdout-confirmed negative direction was found among all elementary "
            "positive-half scalar mesons on this cell."
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
            "effective_sample_size_training": CORE.effective_sample_size(training_weights),
            "effective_sample_size_holdout": CORE.effective_sample_size(holdout_weights),
        }

    out: dict[str, Any] = {
        "certificate": "URT gauge-invariant point-split strong-coupling OS audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "basis": {
            "edge_type_count": EDGE_TYPE_COUNT,
            "edge_types": EDGES["labels"],
            "spatial_translates_per_type": len(SPATIAL_POINTS),
            "unprojected_dimension": EDGE_TYPE_COUNT * len(SPATIAL_POINTS),
            "reflection_endpoint_residual": EDGES["endpoint_residual"],
            "reflection_rule": (
                "x->y maps inside theta(B) to theta(y)->theta(x)"
            ),
        },
        "scope": {
            "ensemble": "compact U(1), beta=0, all 528 links Haar",
            "observable": "bar(psi)_x U_(x->y) psi_y",
            "momentum_decomposition": "eight 14-by-14 blocks",
            "fermion_parameters": {
                "r": A.R_SELECTED,
                "M": A.M_SELECTED,
                "c_t": A.C_SELECTED,
                "mass": A.PHYSICAL_MASS,
            },
        },
        "calibration": {
            "gauge_covariance": covariance_check,
            "free": free,
            "strict_half_reflection_paired": strict_half,
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
                "largest_edge_components": witness_edges(overlap_witness["vector"]),
            },
            "Wilson_control": {
                "minimum": wilson_witness["training_minimum"],
                "momentum_pi_units": wilson_witness["momentum_pi_units"],
                "mode_minima": wilson_witness["mode_minima"],
                "largest_edge_components": witness_edges(wilson_witness["vector"]),
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
            "remaining_boundary": (
                "longer Wilson-line mesons, multi-bilinears, nonzero beta, larger "
                "cells, or an analytic all-boundary cone factorization"
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