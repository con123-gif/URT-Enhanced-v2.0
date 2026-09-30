#!/usr/bin/env python3
"""History heat state versus full fermionic KMS state type audit.

Cathedral history calculations use a normalized one-particle heat state

    rho_B(k)=exp(-beta k)/Tr exp(-beta k)

on spaces of dimension 36, 144, 180 or 720.  The fermionic entropy spectral
action instead arises from the full CAR Fock state

    rho_F(k)=exp[-beta dGamma(k)]/det(I+exp(-beta k))

on a space of dimension 2^N when k acts on N one-particle modes.  The first
state is exactly the second state conditioned on particle number one, but it is
not the full KMS state.  Conditioning removes the vacuum/multiparticle sectors
and restores invariance under k->k+cI, whereas the unconditioned Fock state
changes unless a chemical potential is shifted with c.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import numpy as np
from scipy.linalg import expm


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


def normalized_exponential(hamiltonian: np.ndarray) -> np.ndarray:
    weight = expm(-hamiltonian)
    return weight / np.trace(weight)


def von_neumann_entropy(density: np.ndarray) -> float:
    eigenvalues = np.linalg.eigvalsh((density + density.conj().T) / 2.0)
    positive = eigenvalues[eigenvalues > 0.0]
    return float(-np.sum(positive * np.log(positive)))


def h(x: float) -> float:
    return math.log1p(math.exp(-x)) + x / (1.0 + math.exp(x))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    rng = np.random.default_rng(20260904)
    n = 3
    beta = 0.73
    eigenvalues = np.array([0.2, 1.1, 2.3])
    raw = rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))
    unitary, _ = np.linalg.qr(raw)
    k = unitary @ np.diag(eigenvalues) @ unitary.conj().T

    annihilators = annihilation_operators(n)
    dgamma_k = second_quantize(k, annihilators)
    rho_fock = normalized_exponential(beta * dgamma_k)
    rho_boltzmann = normalized_exponential(beta * k)

    one_particle_indices = [1 << mode for mode in range(n)]
    one_particle_block = rho_fock[np.ix_(one_particle_indices, one_particle_indices)]
    rho_conditioned = one_particle_block / np.trace(one_particle_block)
    conditioning_residual = float(
        np.linalg.norm(rho_conditioned - rho_boltzmann, ord=2)
    )

    fock_entropy_direct = von_neumann_entropy(rho_fock)
    fock_entropy_formula = float(sum(h(beta * value) for value in eigenvalues))
    boltzmann_entropy = von_neumann_entropy(rho_boltzmann)

    shift = 1.37
    rho_boltzmann_shifted = normalized_exponential(beta * (k + shift * np.eye(n)))
    rho_fock_shifted = normalized_exponential(
        beta * second_quantize(k + shift * np.eye(n), annihilators)
    )
    boltzmann_shift_residual = float(
        np.linalg.norm(rho_boltzmann_shifted - rho_boltzmann, ord=2)
    )
    fock_shift_distance = float(np.linalg.norm(rho_fock_shifted - rho_fock, ord=2))

    # Grand-canonical compensation: k->k+cI and mu->mu+c leaves k-mu I fixed.
    chemical_potential = -0.41
    rho_grand = normalized_exponential(
        beta
        * second_quantize(
            k - chemical_potential * np.eye(n), annihilators
        )
    )
    rho_grand_compensated = normalized_exponential(
        beta
        * second_quantize(
            (k + shift * np.eye(n))
            - (chemical_potential + shift) * np.eye(n),
            annihilators,
        )
    )
    chemical_shift_residual = float(
        np.linalg.norm(rho_grand_compensated - rho_grand, ord=2)
    )

    number_operator = sum(
        annihilator.conj().T @ annihilator for annihilator in annihilators
    )
    mean_number_before = float(np.trace(rho_fock @ number_operator).real)
    mean_number_after = float(np.trace(rho_fock_shifted @ number_operator).real)

    cathedral_spaces = [
        {
            "source": "Hopf passive/species history Y",
            "factorization": "12 shell vertices x 3 generation components",
            "dimension": 36,
        },
        {
            "source": "Hopf four-species joint Gram",
            "factorization": "4 species x 12 vertices x 3 generations",
            "dimension": 144,
        },
        {
            "source": "Wilson directed-history Y",
            "factorization": "60 directed history states x 3 generations",
            "dimension": 180,
        },
        {
            "source": "Wilson four-species joint Gram",
            "factorization": "4 species x 60 histories x 3 generations",
            "dimension": 720,
        },
    ]
    for entry in cathedral_spaces:
        dimension = entry["dimension"]
        entry["is_power_of_two"] = bool(
            dimension > 0 and (dimension & (dimension - 1)) == 0
        )
        entry["full_Fock_dimension_if_each_basis_state_is_a_mode"] = (
            f"2^{dimension}"
        )

    out = {
        "certificate": "URT history heat versus full fermionic KMS type audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "two_states": {
            "Cathedral_history_heat_state": "rho_B=e^{-beta k}/Tr e^{-beta k} on H1",
            "fermionic_KMS_state": (
                "rho_F=e^{-beta dGamma(k)}/det(I+e^{-beta k}) on Fock(H1)"
            ),
            "dimensions": "dim H1=N while dim Fock(H1)=2^N",
            "status": "E",
        },
        "conditioning_theorem": {
            "identity": (
                "P1 rho_F P1/Tr(P1 rho_F)=e^{-beta k}/Tr(e^{-beta k})=rho_B"
            ),
            "reason": "dGamma(k) restricted to exterior degree one equals k",
            "finite_witness": {
                "mode_count": n,
                "Fock_dimension": 1 << n,
                "conditioning_residual": conditioning_residual,
            },
            "status": "E",
        },
        "entropy_comparison": {
            "full_Fock_direct": fock_entropy_direct,
            "full_Fock_spectral_formula": fock_entropy_formula,
            "full_Fock_identity_residual": abs(
                fock_entropy_direct - fock_entropy_formula
            ),
            "one_particle_conditioned_entropy": boltzmann_entropy,
            "difference_conditioned_minus_full": (
                boltzmann_entropy - fock_entropy_direct
            ),
            "consequence": (
                "The normalized history heat entropy is not Tr h(beta k); the latter "
                "is the entropy before conditioning on particle number one."
            ),
        },
        "additive_shift_diagnostic": {
            "shift_c": shift,
            "Boltzmann_identity": "rho_B(k+cI)=rho_B(k)",
            "Boltzmann_shift_residual": boltzmann_shift_residual,
            "Fock_fixed_mu_shift_distance": fock_shift_distance,
            "mean_particle_number_before": mean_number_before,
            "mean_particle_number_after": mean_number_after,
            "grand_canonical_identity": (
                "rho_F(k+cI,mu+c)=rho_F(k,mu) because k-mu I is unchanged"
            ),
            "chemical_potential_compensation_residual": chemical_shift_residual,
            "consequence": (
                "The master's Gibbs-invisible identity shift is compatible with the "
                "conditioned one-particle state, but a full Fock interpretation needs "
                "an independently specified or co-shifted chemical potential."
            ),
            "status": "E",
        },
        "actual_Cathedral_history_spaces": cathedral_spaces,
        "scope_of_exact_finite_factorizations": {
            "valid_full_Fock_cases": [
                "16-dimensional exterior prior = Fock(C^4)",
                "8-dimensional hidden 3/5 block admits a Fock(C^3) realization",
            ],
            "not_automatically_full_Fock": (
                "the 36/144/180/720-dimensional normalized history heat states"
            ),
            "note": (
                "A history cost k can be declared a one-particle generator for a new "
                "2^N-dimensional Fock theory, but that changes the state space and "
                "does not identify the already used rho_B with its full KMS state."
            ),
        },
        "completion_dichotomy": {
            "full_Fock_lift": (
                "Retain Tr h(beta k), add vacuum and all multiparticle sectors, and "
                "specify particle number/chemical potential plus their couplings."
            ),
            "conditioned_history_state": (
                "Retain existing normalized heat outputs, but treat them as the N=1 "
                "sector and do not equate their entropy with the full fermionic "
                "entropy spectral action."
            ),
            "status": "U; neither branch is selected by current axioms",
        },
        "verdict": {
            "history_heat_state_is_one_particle_conditioned_KMS": "E",
            "history_heat_state_is_full_fermionic_KMS": "F",
            "master_shift_symmetry_matches_fixed_mu_full_Fock_state": "F",
            "finite_exterior_KMS_identity_promotes_automatically_to_history": "F",
            "advance": (
                "The entropy spectral-action connection survives exactly for the "
                "finite exterior and hidden factorizations, but it does not close the "
                "history theory.  The existing heat states are conditioned sectors; "
                "a full Fock lift requires new occupancy and chemical-potential data."
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