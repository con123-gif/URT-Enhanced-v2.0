#!/usr/bin/env python3
"""Target-blind A4 overlap minimax-locality candidate for URT.

On the normalized overlap slice M=1, r>5/8, this certificate studies the
global spectral conditioning of the Hermitian Wilson kernel

    H_r(p)^2 = ||S(p)||^2 + [r B(p)-1]^2

over the A4 momentum torus.  It uses exact sharp upper and lower envelopes,
obtains the unique algebraic minimax Wilson coefficient conditional on adopting
global condition-number minimization as a new axiom, and independently checks
the result with a deterministic Sobol scan and global differential-evolution
searches.  The lower-envelope proof is recorded in
urt_a4_lower_envelope_proof.py.

The minimax principle is a new candidate axiom, not an existing URT premise.
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
from scipy.optimize import differential_evolution
from scipy.stats import qmc


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


def invariants_from_phases(phases: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    """Return B and ||S||^2 for rows of five phases."""
    phases = np.atleast_2d(phases)
    unit = np.exp(1.0j * phases)
    polygon_sum = np.sum(unit, axis=1)
    wilson_scalar = (25.0 - np.abs(polygon_sum) ** 2) / 10.0
    derivative5 = np.imag(unit * np.conj(polygon_sum)[:, None]) / 5.0
    derivative_squared = np.sum(derivative5**2, axis=1)
    return wilson_scalar, derivative_squared


def kernel_squared_from_phases(phases: np.ndarray, coefficient: float) -> np.ndarray:
    wilson_scalar, derivative_squared = invariants_from_phases(phases)
    return derivative_squared + (coefficient * wilson_scalar - 1.0) ** 2


def one_plus_four_curve(wilson_scalar: float) -> float:
    return 2.0 * wilson_scalar - 1.25 * wilson_scalar**2


def cauchy_upper_curve(wilson_scalar: np.ndarray) -> np.ndarray:
    return 2.0 * wilson_scalar - 0.8 * wilson_scalar**2


def exact_candidate_values() -> dict[str, Any]:
    entry = (5.0 + math.sqrt(185.0)) / 16.0
    polynomial_coefficients = np.asarray([240.0, -392.0, -28.0, 185.0])
    roots = np.roots(polynomial_coefficients)
    admissible = sorted(
        float(root.real)
        for root in roots
        if abs(root.imag) < 1.0e-12 and root.real >= entry
    )
    if len(admissible) != 1:
        raise RuntimeError(f"expected one admissible minimax root, got {admissible}")
    coefficient = admissible[0]
    minimum_location = (coefficient - 1.0) / (
        coefficient**2 - 1.25
    )
    minimum_squared = (2.0 * coefficient - 2.25) / (
        coefficient**2 - 1.25
    )
    maximum_squared = (2.5 * coefficient - 1.0) ** 2
    squared_condition = maximum_squared / minimum_squared
    condition = math.sqrt(squared_condition)
    polynomial_residual = float(
        abs(np.polyval(polynomial_coefficients, coefficient))
    )
    return {
        "entry_coefficient": entry,
        "minimax_coefficient": coefficient,
        "minimizing_B": minimum_location,
        "minimum_H_squared": minimum_squared,
        "maximum_H_squared": maximum_squared,
        "squared_condition_number": squared_condition,
        "condition_number": condition,
        "stationarity_polynomial": "240 r^3-392 r^2-28 r+185=0",
        "stationarity_polynomial_residual": polynomial_residual,
        "all_polynomial_roots": [
            {"real": float(root.real), "imag": float(root.imag)} for root in roots
        ],
    }


def symmetric_extremum_witnesses(
    coefficient: float, minimizing_b: float
) -> dict[str, Any]:
    cosine = 1.0 - 1.25 * minimizing_b
    delta = math.acos(cosine)
    minimum_phases = np.asarray([[delta, 0.0, 0.0, 0.0, 0.0]])
    maximum_phases = np.asarray(
        [[2.0 * math.pi * index / 5.0 for index in range(5)]]
    )
    min_b, min_s2 = invariants_from_phases(minimum_phases)
    max_b, max_s2 = invariants_from_phases(maximum_phases)
    min_h2 = kernel_squared_from_phases(minimum_phases, coefficient)
    max_h2 = kernel_squared_from_phases(maximum_phases, coefficient)
    return {
        "minimum_one_plus_four": {
            "phase_difference": delta,
            "B": float(min_b[0]),
            "S_squared": float(min_s2[0]),
            "one_plus_four_formula_residual": float(
                abs(min_s2[0] - one_plus_four_curve(min_b[0]))
            ),
            "H_squared": float(min_h2[0]),
        },
        "maximum_zero_polygon_sum": {
            "phases": [float(value) for value in maximum_phases[0]],
            "B": float(max_b[0]),
            "S_squared": float(max_s2[0]),
            "H_squared": float(max_h2[0]),
        },
    }


def deterministic_global_checks(
    coefficient: float,
    exact_minimum: float,
    exact_maximum: float,
) -> dict[str, Any]:
    # A low-discrepancy scan tests the two envelope inequalities independently
    # of the analytic symmetric representatives.
    sample_power = 19
    sampler = qmc.Sobol(5, scramble=True, seed=20260903)
    phases = (2.0 * sampler.random_base2(sample_power) - 1.0) * math.pi
    wilson_scalar, derivative_squared = invariants_from_phases(phases)
    lower_mask = wilson_scalar <= 1.6
    lower_slack = derivative_squared[lower_mask] - (
        2.0 * wilson_scalar[lower_mask]
        - 1.25 * wilson_scalar[lower_mask] ** 2
    )
    upper_slack = cauchy_upper_curve(wilson_scalar) - derivative_squared
    h_squared = derivative_squared + (coefficient * wilson_scalar - 1.0) ** 2

    # Direct global optimization uses four relative phases; the fifth is fixed
    # to zero because the symbol is invariant under a common phase shift.
    def objective(relative: np.ndarray) -> float:
        full = np.concatenate([relative, np.zeros(1)])[None, :]
        return float(kernel_squared_from_phases(full, coefficient)[0])

    bounds = [(-math.pi, math.pi)] * 4
    minimum_search = differential_evolution(
        objective,
        bounds,
        seed=20260903,
        tol=1.0e-11,
        maxiter=1000,
        popsize=20,
        polish=True,
        workers=1,
        updating="immediate",
    )
    maximum_search = differential_evolution(
        lambda relative: -objective(relative),
        bounds,
        seed=20260903,
        tol=1.0e-11,
        maxiter=1000,
        popsize=20,
        polish=True,
        workers=1,
        updating="immediate",
    )
    min_full = np.concatenate([minimum_search.x, np.zeros(1)])[None, :]
    max_full = np.concatenate([maximum_search.x, np.zeros(1)])[None, :]
    min_b, min_s2 = invariants_from_phases(min_full)
    max_b, max_s2 = invariants_from_phases(max_full)

    return {
        "Sobol_sample_count": int(2**sample_power),
        "minimum_lower_envelope_slack_on_B_le_8_over_5": float(
            np.min(lower_slack)
        ),
        "minimum_Cauchy_upper_envelope_slack": float(np.min(upper_slack)),
        "sample_minimum_H_squared": float(np.min(h_squared)),
        "sample_maximum_H_squared": float(np.max(h_squared)),
        "sample_minimum_minus_exact": float(np.min(h_squared) - exact_minimum),
        "exact_maximum_minus_sample": float(exact_maximum - np.max(h_squared)),
        "differential_evolution_minimum": {
            "success": bool(minimum_search.success),
            "H_squared": float(minimum_search.fun),
            "absolute_error_from_analytic": float(
                abs(minimum_search.fun - exact_minimum)
            ),
            "B": float(min_b[0]),
            "S_squared": float(min_s2[0]),
            "function_evaluations": int(minimum_search.nfev),
        },
        "differential_evolution_maximum": {
            "success": bool(maximum_search.success),
            "H_squared": float(-maximum_search.fun),
            "absolute_error_from_analytic": float(
                abs(-maximum_search.fun - exact_maximum)
            ),
            "B": float(max_b[0]),
            "S_squared": float(max_s2[0]),
            "function_evaluations": int(maximum_search.nfev),
        },
    }


def overlap_witness(coefficient: float) -> dict[str, Any]:
    basis, roots5 = chiral.a4_root_data()
    gammas, gamma5 = chiral.euclidean_gamma_matrices()
    momentum = np.asarray([0.37, -0.21, 0.43, -0.18])
    overlap, polar, scalar, _ = chiral.overlap_symbol(
        momentum,
        1.0,
        basis,
        roots5,
        gammas,
        wilson_coefficient=coefficient,
        normalization=1.0,
    )
    gw_residual = float(
        np.linalg.norm(
            gamma5 @ overlap
            + overlap @ gamma5
            - overlap @ gamma5 @ overlap
        )
    )

    covariance_residuals = []
    derivative, reference_scalar = chiral.a4_symbol_components(
        momentum, basis, roots5
    )
    momentum5 = basis @ momentum
    for permutation in ((1, 2, 0, 3, 4), (1, 0, 3, 2, 4)):
        permutation_matrix = np.eye(5)[list(permutation)]
        transformed_momentum = basis.T @ (permutation_matrix @ momentum5)
        transformed_derivative, transformed_scalar = chiral.a4_symbol_components(
            transformed_momentum, basis, roots5
        )
        induced = basis.T @ permutation_matrix @ basis
        covariance_residuals.append(
            max(
                float(np.linalg.norm(transformed_derivative - induced @ derivative)),
                abs(transformed_scalar - reference_scalar),
            )
        )

    epsilon = 1.0e-6
    principal_residual = 0.0
    for axis in range(4):
        displacement = np.zeros(4)
        displacement[axis] = epsilon
        plus, *_ = chiral.overlap_symbol(
            displacement,
            1.0,
            basis,
            roots5,
            gammas,
            wilson_coefficient=coefficient,
            normalization=1.0,
        )
        minus, *_ = chiral.overlap_symbol(
            -displacement,
            1.0,
            basis,
            roots5,
            gammas,
            wilson_coefficient=coefficient,
            normalization=1.0,
        )
        principal_residual = max(
            principal_residual,
            float(
                np.linalg.norm(
                    (plus - minus) / (2.0 * epsilon) - 1.0j * gammas[axis]
                )
            ),
        )

    return {
        "Wilson_coefficient": coefficient,
        "doubler_margin_at_first_nonphysical_orbit": 1.6 * coefficient - 1.0,
        "test_momentum_B": scalar,
        "GW_residual": gw_residual,
        "gamma5_Hermiticity_residual": float(
            np.linalg.norm(gamma5 @ polar @ gamma5 - polar.conj().T)
        ),
        "A5_root_symbol_covariance_residuals": covariance_residuals,
        "continuum_principal_symbol_residual": principal_residual,
    }


def comparison_values(coefficient: float) -> list[dict[str, float]]:
    rows = []
    for candidate in (1.0, coefficient, 1.5, 2.0):
        if candidate < (5.0 + math.sqrt(185.0)) / 16.0:
            minimum = (1.6 * candidate - 1.0) ** 2
        else:
            minimum = (2.0 * candidate - 2.25) / (
                candidate**2 - 1.25
            )
        maximum = (2.5 * candidate - 1.0) ** 2
        rows.append(
            {
                "Wilson_coefficient": candidate,
                "minimum_H_squared": minimum,
                "maximum_H_squared": maximum,
                "condition_number": math.sqrt(maximum / minimum),
            }
        )
    return rows


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    exact = exact_candidate_values()
    coefficient = exact["minimax_coefficient"]
    symmetric = symmetric_extremum_witnesses(
        coefficient, exact["minimizing_B"]
    )
    numeric = deterministic_global_checks(
        coefficient,
        exact["minimum_H_squared"],
        exact["maximum_H_squared"],
    )
    overlap = overlap_witness(coefficient)

    out = {
        "certificate": "URT A4 overlap spectral-locality minimax candidate",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "premise_status": (
            "CANDIDATE ONLY: minimizing the global Wilson-kernel condition number "
            "is not an already-declared URT axiom."
        ),
        "momentum_invariants": {
            "definitions": (
                "Z=sum_j exp(i p_j), B=(25-|Z|^2)/10, "
                "S_j=Im(exp(i p_j) conjugate(Z))/5"
            ),
            "kernel": "H_r^2=||S||^2+(r B-1)^2 on M=1",
            "exact_Cauchy_upper_bound": "||S||^2 <= 2B-(4/5)B^2",
            "upper_bound_proof": (
                "Rotate Z=rho real. Then ||S||^2=rho^2 sum(sin^2 p_j)/25 "
                "and sum(cos^2 p_j)>=(sum cos p_j)^2/5=rho^2/5."
            ),
            "exact_sharp_lower_envelope": (
                "For 0<=B<=8/5, ||S||^2 >= 2B-(5/4)B^2, "
                "with equality on a 1+4 two-phase cluster; for B>=8/5 "
                "the displayed right side is nonpositive and the bound is trivial."
            ),
            "lower_envelope_proof_status": (
                "E: urt_a4_lower_envelope_proof.py proves the global inequality "
                "and equality classification by a sharp fourth-moment lemma and "
                "an exact Hermite-minorant factorization."
            ),
        },
        "conditional_exact_minimax": {
            **exact,
            "piecewise_minimum_for_r_above_5_over_8": (
                "(8r/5-1)^2 until r_entry=(5+sqrt(185))/16; thereafter "
                "(2r-9/4)/(r^2-5/4)"
            ),
            "maximum_in_minimax_domain": "(5r/2-1)^2, attained at Z=0",
            "uniqueness_statement": (
                "On r>=r_entry the condition-number derivative has numerator "
                "240r^3-392r^2-28r+185. Exactly one real root lies in that domain; "
                "the r<r_entry lower bound is already worse at the endpoint."
            ),
            "status": (
                "E exact algebra conditional on adopting the new minimax axiom; "
                "N independently corroborated on the full four-torus"
            ),
        },
        "symmetric_extremum_witnesses": symmetric,
        "deterministic_global_checks": numeric,
        "overlap_operator_at_candidate": overlap,
        "comparison_coefficients": comparison_values(coefficient),
        "selection_result": {
            "conditional_selected_Wilson_coefficient": coefficient,
            "what_it_would_fix": (
                "One r on the already normalized M=1 overlap slice, if global "
                "condition-number minimization is adopted as a new axiom."
            ),
            "what_it_does_not_fix": [
                "the history Mobius/locality parameter t",
                "a domain-wall transfer scale or extent",
                "the chiral determinant-line trivialization lambda",
                "a microscopic gauge-link action",
            ],
            "phenomenology_gate": "CLOSED",
            "verdict": (
                "The target-blind algebraic minimax theorem is exact, conditional "
                "only on adopting its new selection principle. It does not freeze "
                "the joint microscopic action or measure and is not licensed for "
                "mass or mixing calculations."
            ),
        },
    }

    serialized = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(serialized, end="")
    else:
        args.output.write_text(serialized)


if __name__ == "__main__":
    main()