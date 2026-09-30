#!/usr/bin/env python3
"""Gauge-invariant OS search entirely inside the certified overlap gap.

This finite-volume audit repairs a scope defect in the earlier beta=0
strong-coupling searches: Haar-random links do not lie in the strict local
admissibility domain where the polar overlap is uniformly defined.

Start with independent compact U(1) link angles in [-alpha,alpha], with

    alpha = epsilon_star/8.

Every spatial square then has angle at most 4 alpha=epsilon_star/2 and every
elementary repaired triangle has angle at most 3 alpha.  Since
|exp(i phi)-1|<=|phi|, the entire support lies strictly inside the exact
volume-uniform gap certificate.  Haar averaging over local gauge
transformations makes the product-link measure gauge invariant without
changing any gauge-invariant expectation or face holonomy.  The ungauged
product density is site-reflection positive (identical even link weights on
paired link orbits and a nonnegative fixed-plane density), so its gauge
average is reflection positive on the gauge-invariant algebra.

The scalar-density and all elementary point-split meson OS matrices are
tested after determinant reweighting.  Witness directions are selected on a
training subset and evaluated on an independent holdout subset.  Wilson
fermions are the calibration control.

Passing this finite basis is not an interacting-overlap theorem.  A
holdout-negative overlap direction with a passing Wilson control would be a
candidate counterexample requiring replication.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np


HERE = Path(__file__).resolve().parent
POINT_AUDIT = HERE / "urt_strong_coupling_point_split_os_audit.py"
EPSILON_STAR = Fraction(
    394924599595820227835064176865,
    351998414917049746226536404412312,
)
ALPHA = EPSILON_STAR / 8
DEFAULT_SEED = 2026090501
DEFAULT_SAMPLES = 1024


def load_module() -> Any:
    spec = importlib.util.spec_from_file_location("urt_point_split", POINT_AUDIT)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {POINT_AUDIT}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


P = load_module()
CORE = P.CORE
A = P.A


def stored_link_phase(
    phases: np.ndarray, site: tuple[int, int, int, int], direction_index: int
) -> float:
    return float(phases[A.SITE_INDEX[site], direction_index])


def max_face_deviations(phases: np.ndarray) -> dict[str, float]:
    """Enumerate every repaired square and bottom/top triangle on the torus."""
    square_max_angle = 0.0
    triangle_max_angle = 0.0
    square_max_deviation = 0.0
    triangle_max_deviation = 0.0

    for base in A.SITES:
        for first, second in itertools.combinations(range(3), 2):
            first_site = A.shift(base, A.DIRECTIONS[first])
            second_site = A.shift(base, A.DIRECTIONS[second])
            angle = (
                stored_link_phase(phases, base, first)
                + stored_link_phase(phases, first_site, second)
                - stored_link_phase(phases, second_site, first)
                - stored_link_phase(phases, base, second)
            )
            square_max_angle = max(square_max_angle, abs(angle))
            square_max_deviation = max(
                square_max_deviation, 2.0 * abs(math.sin(angle / 2.0))
            )

        for axis in range(3):
            for other_bits in itertools.product((0, -1), repeat=2):
                minus = list(other_bits)
                minus.insert(axis, -1)
                plus = minus.copy()
                plus[axis] = 0
                minus_direction = A.DIRECTION_INDEX[(1, *minus)]
                plus_direction = A.DIRECTION_INDEX[(1, *plus)]
                spatial_direction = axis
                spatial_endpoint = A.shift(base, A.DIRECTIONS[axis])
                future_minus_endpoint = A.shift(
                    base, A.DIRECTIONS[minus_direction]
                )

                bottom_angle = (
                    stored_link_phase(phases, base, spatial_direction)
                    + stored_link_phase(
                        phases, spatial_endpoint, minus_direction
                    )
                    - stored_link_phase(phases, base, plus_direction)
                )
                top_angle = (
                    stored_link_phase(phases, base, plus_direction)
                    - stored_link_phase(
                        phases, future_minus_endpoint, spatial_direction
                    )
                    - stored_link_phase(phases, base, minus_direction)
                )
                for angle in (bottom_angle, top_angle):
                    triangle_max_angle = max(triangle_max_angle, abs(angle))
                    triangle_max_deviation = max(
                        triangle_max_deviation,
                        2.0 * abs(math.sin(angle / 2.0)),
                    )

    return {
        "maximum_spatial_square_angle": square_max_angle,
        "maximum_spatial_square_norm_deviation": square_max_deviation,
        "maximum_triangle_angle": triangle_max_angle,
        "maximum_triangle_norm_deviation": triangle_max_deviation,
    }


def action_data(phases: np.ndarray) -> tuple[dict[str, np.ndarray], float]:
    return P.operators(phases)


def determinant_data(operator: np.ndarray) -> tuple[float, float, int]:
    return CORE.real_determinant_weight(operator)


def scalar_blocks(covariance: np.ndarray) -> np.ndarray:
    return CORE.momentum_blocks(CORE.scalar_density_gram(covariance))


def point_blocks(covariance: np.ndarray, phases: np.ndarray) -> np.ndarray:
    return P.point_split_momentum_blocks(covariance, phases)


def select(mean_blocks: np.ndarray) -> dict[str, Any]:
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
        "momentum_pi_units": list(P.MOMENTA[best[1]]),
        "vector": best[2],
        "mode_minima": mode_minima,
    }


def evaluate(
    blocks: np.ndarray,
    logweights: np.ndarray,
    signs: np.ndarray,
    holdout: slice,
    witness: dict[str, Any],
) -> dict[str, Any]:
    values = P.fixed_values(
        blocks[holdout], int(witness["momentum_index"]), witness["vector"]
    )
    return CORE.ratio_statistics(values, logweights[holdout], signs[holdout])


def spectrum(mean_blocks: np.ndarray) -> dict[str, Any]:
    mode_rows = []
    all_values = []
    maximum_antihermitian = 0.0
    for momentum, block in zip(P.MOMENTA, mean_blocks):
        values = np.linalg.eigvalsh(CORE.hermitian(block))
        all_values.extend(float(value) for value in values)
        maximum_antihermitian = max(
            maximum_antihermitian,
            float(np.linalg.norm(block - block.conj().T)),
        )
        mode_rows.append(
            {
                "momentum_pi_units": list(momentum),
                "minimum_eigenvalue": float(values[0]),
                "maximum_eigenvalue": float(values[-1]),
            }
        )
    return {
        "minimum_eigenvalue_descriptive_only": min(all_values),
        "maximum_eigenvalue": max(all_values),
        "maximum_antihermitian_residual": maximum_antihermitian,
        "modes": mode_rows,
        "warning": "adaptive same-sample minimum; holdout test controls selection",
    }


def witness_record(witness: dict[str, Any], basis: str) -> dict[str, Any]:
    vector = witness["vector"]
    out: dict[str, Any] = {
        "training_minimum": witness["training_minimum"],
        "momentum_pi_units": witness["momentum_pi_units"],
        "mode_minima": witness["mode_minima"],
    }
    if basis == "scalar_density":
        out["time_layer_vector"] = CORE.encode_vector(vector)
    else:
        out["largest_edge_components"] = P.witness_edges(vector)
    return out


def gauge_covariance_calibration(seed: int) -> dict[str, Any]:
    rng = np.random.default_rng(seed)
    phases = rng.uniform(-float(ALPHA), float(ALPHA), size=(len(A.SITES), len(A.DIRECTIONS)))
    angles = rng.uniform(-math.pi, math.pi, size=len(A.SITES))
    transformed = P.gauge_transform(phases, angles)
    before, gap_before = action_data(phases)
    after, gap_after = action_data(transformed)
    out: dict[str, Any] = {"XdaggerX_gap_residual": abs(gap_after - gap_before)}
    for theory in before:
        covariance_before = np.linalg.inv(before[theory])
        covariance_after = np.linalg.inv(after[theory])
        scalar_residual = float(
            np.linalg.norm(scalar_blocks(covariance_after) - scalar_blocks(covariance_before))
        )
        point_residual = float(
            np.linalg.norm(
                point_blocks(covariance_after, transformed)
                - point_blocks(covariance_before, phases)
            )
        )
        determinant_before = np.linalg.slogdet(before[theory])
        determinant_after = np.linalg.slogdet(after[theory])
        out[theory] = {
            "scalar_block_residual": scalar_residual,
            "point_split_block_residual": point_residual,
            "logabsdet_residual": abs(determinant_after[1] - determinant_before[1]),
            "determinant_phase_residual": abs(
                np.angle(determinant_after[0] / determinant_before[0])
            ),
        }
    return out


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--samples", type=int, default=DEFAULT_SAMPLES)
    parser.add_argument("--seed", type=int, default=DEFAULT_SEED)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--progress", type=int, default=128)
    args = parser.parse_args()
    if args.samples < 128:
        raise ValueError("at least 128 samples are required")

    rng = np.random.default_rng(args.seed)
    theory_names = ("overlap", "Wilson_control")
    scalar: dict[str, np.ndarray] = {
        name: np.empty((args.samples, 8, 2, 2), dtype=complex)
        for name in theory_names
    }
    point: dict[str, np.ndarray] = {
        name: np.empty((args.samples, 8, P.EDGE_TYPE_COUNT, P.EDGE_TYPE_COUNT), dtype=complex)
        for name in theory_names
    }
    logweights = {name: np.empty(args.samples) for name in theory_names}
    determinant_phases = {name: np.empty(args.samples) for name in theory_names}
    signs = {name: np.empty(args.samples) for name in theory_names}
    gaps = np.empty(args.samples)
    face_maxima = {
        "maximum_spatial_square_angle": 0.0,
        "maximum_spatial_square_norm_deviation": 0.0,
        "maximum_triangle_angle": 0.0,
        "maximum_triangle_norm_deviation": 0.0,
    }

    for sample in range(args.samples):
        phases = rng.uniform(
            -float(ALPHA),
            float(ALPHA),
            size=(len(A.SITES), len(A.DIRECTIONS)),
        )
        operators, gaps[sample] = action_data(phases)
        if sample < 16:
            local_maxima = max_face_deviations(phases)
            for key, value in local_maxima.items():
                face_maxima[key] = max(face_maxima[key], value)
        for theory, operator in operators.items():
            (
                logweights[theory][sample],
                determinant_phases[theory][sample],
                signs[theory][sample],
            ) = determinant_data(operator)
            covariance = np.linalg.inv(operator)
            scalar[theory][sample] = scalar_blocks(covariance)
            point[theory][sample] = point_blocks(covariance, phases)
        if args.progress and (sample + 1) % args.progress == 0:
            print(f"completed {sample + 1}/{args.samples}", flush=True)

    training_count = int(round(CORE.TRAINING_FRACTION * args.samples))
    training = slice(0, training_count)
    holdout = slice(training_count, args.samples)
    bases = {"scalar_density": scalar, "point_split_mesons": point}
    results: dict[str, Any] = {}
    any_overlap_negative = False
    any_wilson_negative = False

    for basis_name, basis_blocks in bases.items():
        witnesses = {}
        all_means = {}
        weights = {}
        for theory in theory_names:
            training_mean, _ = CORE.weighted_blocks(
                basis_blocks[theory][training],
                logweights[theory][training],
                signs[theory][training],
            )
            witnesses[theory] = select(training_mean)
            all_means[theory], weights[theory] = CORE.weighted_blocks(
                basis_blocks[theory], logweights[theory], signs[theory]
            )

        tests = {
            "overlap_at_overlap_selected_witness": evaluate(
                basis_blocks["overlap"], logweights["overlap"], signs["overlap"], holdout, witnesses["overlap"]
            ),
            "Wilson_at_overlap_selected_witness": evaluate(
                basis_blocks["Wilson_control"], logweights["Wilson_control"], signs["Wilson_control"], holdout, witnesses["overlap"]
            ),
            "Wilson_at_Wilson_selected_witness": evaluate(
                basis_blocks["Wilson_control"], logweights["Wilson_control"], signs["Wilson_control"], holdout, witnesses["Wilson_control"]
            ),
            "overlap_at_Wilson_selected_witness": evaluate(
                basis_blocks["overlap"], logweights["overlap"], signs["overlap"], holdout, witnesses["Wilson_control"]
            ),
        }
        overlap_negative = tests["overlap_at_overlap_selected_witness"]["status"] == "negative witness"
        wilson_negative = tests["Wilson_at_Wilson_selected_witness"]["status"] == "negative witness"
        any_overlap_negative = any_overlap_negative or overlap_negative
        any_wilson_negative = any_wilson_negative or wilson_negative
        results[basis_name] = {
            "dimensions": {
                "momentum_blocks": 8,
                "block_dimension": int(basis_blocks["overlap"].shape[-1]),
            },
            "training_witnesses": {
                theory: witness_record(witnesses[theory], basis_name)
                for theory in theory_names
            },
            "independent_holdout_tests": tests,
            "descriptive_full_sample_spectra": {
                theory: spectrum(all_means[theory]) for theory in theory_names
            },
        }

    determinant_records = {}
    for theory in theory_names:
        all_weights = CORE.normalized_weights(logweights[theory], signs[theory])
        holdout_weights = CORE.normalized_weights(
            logweights[theory][holdout], signs[theory][holdout]
        )
        determinant_records[theory] = {
            "maximum_absolute_phase": float(np.max(np.abs(determinant_phases[theory]))),
            "negative_count": int(np.sum(signs[theory] < 0.0)),
            "effective_sample_size_all": CORE.effective_sample_size(all_weights),
            "effective_sample_size_holdout": CORE.effective_sample_size(holdout_weights),
            "logweight_range": [
                float(np.min(logweights[theory])),
                float(np.max(logweights[theory])),
            ],
        }

    if any_wilson_negative:
        status = "calibration failure"
        conclusion = "A Wilson holdout control is negative, so no overlap-specific inference is valid."
    elif any_overlap_negative:
        status = "candidate admissible overlap-specific counterexample"
        conclusion = (
            "A gauge-invariant overlap witness is holdout-negative while the separately selected "
            "Wilson controls pass; independent replication is required."
        )
    else:
        status = "finite admissible gauge-invariant test passed; theorem remains open"
        conclusion = (
            "No holdout-confirmed negative direction was found in the local scalar or complete "
            "elementary point-split meson bases on this cell."
        )

    square_support = Fraction(4) * ALPHA
    triangle_support = Fraction(3) * ALPHA
    out: dict[str, Any] = {
        "certificate": "URT admissible gauge-invariant interacting OS audit",
        "date": "2026-09-05",
        "observational_targets_used": False,
        "support_theorem": {
            "epsilon_star_exact": f"{EPSILON_STAR.numerator}/{EPSILON_STAR.denominator}",
            "epsilon_star_numeric": float(EPSILON_STAR),
            "alpha_exact": f"{ALPHA.numerator}/{ALPHA.denominator}",
            "alpha_numeric": float(ALPHA),
            "spatial_square_angle_bound_exact": f"{square_support.numerator}/{square_support.denominator}",
            "spatial_square_bound_over_epsilon_star": "1/2",
            "triangle_angle_bound_exact": f"{triangle_support.numerator}/{triangle_support.denominator}",
            "triangle_bound_over_epsilon_star": "3/8",
            "norm_inequality": "|exp(i phi)-1|<=|phi|",
            "entire_gauge_averaged_support_inside_certified_gap": True,
            "sampled_face_checks_first_16_configurations": face_maxima,
        },
        "gauge_measure": {
            "base_density": "independent uniform U(1) link angles on [-alpha,alpha]",
            "physical_density": "local-Haar gauge average of the base product density",
            "gauge_invariant": True,
            "face_holonomies_unchanged_by_gauge_average": True,
            "site_reflection_positive_on_gauge_invariant_algebra": True,
            "factorization": (
                "even identical link densities pair across theta; fixed t=0 spatial-link "
                "density is pointwise nonnegative"
            ),
            "scope_note": (
                "this is an admissible RP probe measure, not the previously selected "
                "face-autocorrelation action"
            ),
        },
        "finite_cell": {
            "Nt": A.NT,
            "Ns": A.NS,
            "site_count": len(A.SITES),
            "link_count": len(A.SITES) * len(A.DIRECTIONS),
            "reflection": "theta(t,n)=(-t,n+t(1,1,1))",
        },
        "fermions": {
            "r": A.R_SELECTED,
            "M": A.M_SELECTED,
            "c_t": A.C_SELECTED,
            "physical_mass": A.PHYSICAL_MASS,
            "minimum_sampled_XdaggerX": float(np.min(gaps)),
            "median_sampled_XdaggerX": float(np.median(gaps)),
        },
        "method": {
            "samples": args.samples,
            "seed": args.seed,
            "training_samples": training_count,
            "holdout_samples": args.samples - training_count,
            "confidence_multiplier": CORE.CONFIDENCE_MULTIPLIER,
            "observables": [
                "local scalar density",
                "all 112 elementary positive-half point-split scalar mesons",
            ],
            "selection": "lowest training direction; fixed independent holdout sign test",
        },
        "gauge_covariance_calibration": gauge_covariance_calibration(args.seed + 9000),
        "determinants": determinant_records,
        "observable_tests": results,
        "verdict": {
            "status": status,
            "overlap_negative_witness_found": any_overlap_negative,
            "Wilson_control_failure": any_wilson_negative,
            "conclusion": conclusion,
            "interacting_overlap_reflection_positivity_proved": False,
            "selected_face_autocorrelation_weight_decided": False,
            "remaining_gate": (
                "direct all-boundary polar Grassmann-cone factorization or a replicated "
                "gauge-invariant negative observable for the selected face weight"
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