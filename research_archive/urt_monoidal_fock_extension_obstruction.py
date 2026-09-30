#!/usr/bin/env python3
"""Monoidal full-Fock extension and identity-quotient obstruction.

A unitary-covariant gauge-invariant quasi-free prior that is natural under
orthogonal direct sums has covariance pI.  Its one remaining fugacity z=p/(1-p)
is fixed on every finite carrier if the Cathedral exterior value Delta is
postulated to extend monoidally.  This gives

    rho_{0,n}=Delta^N/(1+Delta)^n

without a new numerical parameter, and conditioning the corresponding history
Fock state on N=1 exactly recovers the existing normalized heat state.

However, the full state is not well-defined on the master equivalence class
K~K+bI at fixed Delta.  A one-particle identity shift becomes beta*b*N after
second quantization and changes all occupancies.  It can be repaired only by
co-shifting the chemical potential/fugacity, choosing a representative of [K],
or returning to fixed-number conditioning.  Each is additional structure.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import numpy as np
from scipy.linalg import expm


DELTA = 0.002489189840420375
THETA = -math.log(DELTA)


def annihilation_operators(mode_count: int) -> list[np.ndarray]:
    dimension = 1 << mode_count
    operators: list[np.ndarray] = []
    for mode in range(mode_count):
        operator = np.zeros((dimension, dimension), dtype=complex)
        for state in range(dimension):
            if (state >> mode) & 1:
                target = state ^ (1 << mode)
                parity = (state & ((1 << mode) - 1)).bit_count()
                operator[target, state] = -1.0 if parity % 2 else 1.0
        operators.append(operator)
    return operators


def second_quantize(one_particle: np.ndarray, annihilators: list[np.ndarray]) -> np.ndarray:
    dimension = annihilators[0].shape[0]
    result = np.zeros((dimension, dimension), dtype=complex)
    for i, annihilator_i in enumerate(annihilators):
        creator_i = annihilator_i.conj().T
        for j, annihilator_j in enumerate(annihilators):
            result += one_particle[i, j] * creator_i @ annihilator_j
    return result


def normalized_exponential(exponent: np.ndarray) -> np.ndarray:
    weight = expm(-exponent)
    return weight / np.trace(weight)


def monoidal_prior(mode_count: int, fugacity: float) -> np.ndarray:
    probabilities = np.array(
        [
            fugacity ** state.bit_count() / (1.0 + fugacity) ** mode_count
            for state in range(1 << mode_count)
        ]
    )
    return np.diag(probabilities)


def mean_number(density: np.ndarray, annihilators: list[np.ndarray]) -> float:
    number = sum(a.conj().T @ a for a in annihilators)
    return float(np.trace(density @ number).real)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    # Monoidality in the occupation basis.  Low-index modes are the right tensor
    # factor in this bit convention.
    rho2 = monoidal_prior(2, DELTA)
    rho3 = monoidal_prior(3, DELTA)
    rho5 = monoidal_prior(5, DELTA)
    tensor_residual = float(np.linalg.norm(rho5 - np.kron(rho3, rho2), ord=2))

    rng = np.random.default_rng(20260904)
    n = 3
    annihilators = annihilation_operators(n)
    raw = rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))
    unitary, _ = np.linalg.qr(raw)
    k = unitary @ np.diag([0.15, 0.8, 2.0]) @ unitary.conj().T
    beta = 0.91
    one_particle_exponent = THETA * np.eye(n) + beta * k
    rho_full = normalized_exponential(
        second_quantize(one_particle_exponent, annihilators)
    )

    one_particle_indices = [1 << mode for mode in range(n)]
    conditioned = rho_full[np.ix_(one_particle_indices, one_particle_indices)]
    conditioned /= np.trace(conditioned)
    history_heat = normalized_exponential(beta * k)
    conditioned_history_residual = float(
        np.linalg.norm(conditioned - history_heat, ord=2)
    )

    shift = 1.23
    k_shifted = k + shift * np.eye(n)
    rho_full_fixed_delta = normalized_exponential(
        second_quantize(THETA * np.eye(n) + beta * k_shifted, annihilators)
    )
    rho_history_shifted = normalized_exponential(beta * k_shifted)
    full_fixed_delta_distance = float(
        np.linalg.norm(rho_full_fixed_delta - rho_full, ord=2)
    )
    history_shift_residual = float(
        np.linalg.norm(rho_history_shifted - history_heat, ord=2)
    )

    # Co-transform theta so theta'I+beta(K+bI)=theta I+beta K.
    theta_compensated = THETA - beta * shift
    delta_compensated = math.exp(-theta_compensated)
    rho_full_compensated = normalized_exponential(
        second_quantize(
            theta_compensated * np.eye(n) + beta * k_shifted,
            annihilators,
        )
    )
    compensation_residual = float(
        np.linalg.norm(rho_full_compensated - rho_full, ord=2)
    )

    mean_before = mean_number(rho_full, annihilators)
    mean_after_fixed_delta = mean_number(rho_full_fixed_delta, annihilators)

    # A continuum of positive shifts remains inside positive costs.
    positive_shift_rows = []
    for b in (0.0, 0.1, 0.5, 2.0):
        shifted = normalized_exponential(
            second_quantize(
                THETA * np.eye(n) + beta * (k + b * np.eye(n)),
                annihilators,
            )
        )
        positive_shift_rows.append(
            {
                "b": b,
                "minimum_eigenvalue_K_plus_bI": float(
                    np.min(np.linalg.eigvalsh(k + b * np.eye(n)))
                ),
                "full_state_distance_from_b_0": float(
                    np.linalg.norm(shifted - rho_full, ord=2)
                ),
                "mean_number": mean_number(shifted, annihilators),
            }
        )

    out = {
        "certificate": "URT monoidal Fock extension and identity-quotient obstruction",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "conditional_monoidal_extension": {
            "classification": (
                "Unitary covariance gives Q_H=p_H I_H; natural direct-sum "
                "factorization forces one common p, equivalently one fugacity z."
            ),
            "Cathedral_choice": "z=Delta from the four-mode exterior prior",
            "prior_on_n_modes": "rho_0,n=Delta^N/(1+Delta)^n",
            "new_numerical_parameter": False,
            "new_structural_premise": (
                "the V4 exterior fugacity is universal and monoidal on every "
                "history one-particle carrier"
            ),
            "rho_5_minus_rho_3_tensor_rho_2_residual": tensor_residual,
            "status": "E conditional",
        },
        "history_embedding": {
            "full_state": (
                "rho_F proportional exp[-dGamma(theta_Delta I+beta K)]"
            ),
            "N1_conditioned_state": "rho_B proportional exp(-beta K)",
            "conditioning_residual": conditioned_history_residual,
            "status": "E conditional",
        },
        "identity_quotient_obstruction": {
            "master_equivalence": "K~K+bI in every normalized N=1 heat state",
            "second_quantized_shift": "dGamma(K+bI)=dGamma(K)+bN",
            "history_shift_residual": history_shift_residual,
            "full_state_distance_at_fixed_Delta": full_fixed_delta_distance,
            "mean_number_before": mean_before,
            "mean_number_after_fixed_Delta": mean_after_fixed_delta,
            "theorem": (
                "At fixed nonzero beta and fixed Delta, the full-Fock extension is "
                "not invariant on [K]=K+R I unless b=0 or one conditions on fixed N."
            ),
            "positive_shift_family": positive_shift_rows,
            "status": "E",
        },
        "chemical_potential_repair": {
            "transformation": (
                "theta_Delta' = theta_Delta-beta b, equivalently "
                "Delta'=Delta exp(beta b)"
            ),
            "Delta_prime": delta_compensated,
            "compensation_residual": compensation_residual,
            "cost": (
                "Delta/chemical potential must transform with the arbitrary identity "
                "representative, so it is no longer a fixed universal constant."
            ),
            "status": "E but not a selector",
        },
        "possible_sections_of_the_quotient": {
            "minimum_zero": (
                "replace K by K-lambda_min(K)I; preserves positivity but is a new "
                "spectral-zero prescription and is nonsmooth at level crossings"
            ),
            "trace_zero": (
                "replace K by K-Tr(K)I/n; canonical and linear but generally destroys "
                "the positive-Gram interpretation"
            ),
            "fixed_mean_number": (
                "choose the chemical potential from a declared mean occupancy; unique "
                "after beta and K are supplied, but the mean is a new premise"
            ),
            "fixed_number_sector": (
                "condition on N=1; recovers the existing theory but forfeits the full "
                "fermionic entropy spectral action"
            ),
        },
        "verdict": {
            "parameter_free_numeric_extension_from_Delta": "E conditional",
            "extension_derived_from_current_carrier_axioms": "U",
            "fixed_Delta_full_state_descends_to_master_cost_quotient": "F",
            "unique_quotient_repair_selected": "F",
            "advance": (
                "Universally copying Delta is the strongest target-blind full-Fock "
                "repair found, but it conflicts exactly with the existing identity-"
                "shift quotient.  Co-shifting chemical potential or choosing a cost "
                "zero is unavoidable additional structure."
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