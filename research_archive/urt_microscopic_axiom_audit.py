#!/usr/bin/env python3
"""Foundational microscopic-axiom audit for the URT chiral action gate.

This certificate records whether any already-declared Cathedral/URT principle
supplies the missing overlap/Wilson parameter or the coefficient of
chi*Omega_5.  It also verifies two finite-dimensional obstruction identities:
positive spectral/KL costs are flux-conjugation even, and a modular/KMS state
does not determine its Hamiltonian scale without an independent beta.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import numpy as np


def matrix_function_hermitian(matrix: np.ndarray, function) -> np.ndarray:
    eigenvalues, eigenvectors = np.linalg.eigh((matrix + matrix.conj().T) / 2.0)
    return eigenvectors @ np.diag(function(eigenvalues)) @ eigenvectors.conj().T


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    rng = np.random.default_rng(20260903)
    amplitude = rng.normal(size=(9, 9)) + 1j * rng.normal(size=(9, 9))
    gram = amplitude.conj().T @ amplitude
    gram_flux = amplitude.T @ amplitude.conj()
    spectrum = np.linalg.eigvalsh(gram)
    spectrum_flux = np.linalg.eigvalsh(gram_flux)
    eta = 1.731
    partition = float(np.sum(np.exp(-eta * spectrum)))
    partition_flux = float(np.sum(np.exp(-eta * spectrum_flux)))

    # A faithful Gaussian occupation and its modular log odds.
    raw = rng.normal(size=(7, 7)) + 1j * rng.normal(size=(7, 7))
    hamiltonian_seed = (raw + raw.conj().T) / 2.0
    occupation = matrix_function_hermitian(
        hamiltonian_seed, lambda values: 1.0 / (1.0 + np.exp(values))
    )
    modular = matrix_function_hermitian(
        occupation, lambda values: np.log((1.0 - values) / values)
    )

    # The same faithful density matrix is Gibbs for a continuum of beta/H
    # pairs.  This is the finite-dimensional modular-scale circularity.
    positive_raw = rng.normal(size=(6, 6)) + 1j * rng.normal(size=(6, 6))
    density = positive_raw.conj().T @ positive_raw + 0.5 * np.eye(6)
    density /= np.trace(density)
    log_density = matrix_function_hermitian(density, np.log)
    gibbs_reconstruction_residuals = []
    hamiltonians = []
    for beta in (0.5, 1.0, 2.0, 5.0):
        hamiltonian = -log_density / beta
        exponential = matrix_function_hermitian(
            hamiltonian, lambda values: np.exp(-beta * values)
        )
        reconstructed = exponential / np.trace(exponential)
        gibbs_reconstruction_residuals.append(
            float(np.linalg.norm(reconstructed - density))
        )
        hamiltonians.append(hamiltonian)

    out = {
        "certificate": "URT recoverable microscopic-axiom boundary audit",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "archive_scope": {
            "authoritative_sources": [
                "Cathedral_Live_State.md",
                "Cathedral_Master_Index.md",
                "URT_Nature_Checkpoint_2026-08-25/urt_full_claim_ledger.json",
                "URT_Nature_Checkpoint_2026-08-25/urt_nature_solver.py",
                "Cathedral_URT_Theory_of_Nature_2026-08-22.md",
                "URT_Cathedral_Three_Week_Reconstruction_2026-08-24.md",
                "cathedral_master_verifier.py",
                "derive_a4_clifford_dirac.py",
                "urt_gate2_global_modular_solver.py",
                "urt_gate2_global_modular_eta_scan.py",
            ],
            "rare_term_search": {
                "terms": [
                    "KMS",
                    "Tomita",
                    "reflection positivity",
                    "Pauli-Villars",
                    "anomaly inflow",
                    "determinant line",
                    "fermion measure",
                ],
                "result": (
                    "No recoverable pre-2026-09-03 declaration of a KMS/Tomita boundary "
                    "condition, reflection-positive fermion action, Pauli-Villars/domain-wall "
                    "regulator, anomaly-inflow bulk, determinant-line normalization or "
                    "fermion-measure convention was found in the searched Cathedral folder."
                ),
                "scope_note": (
                    "This is an archive-retrieval statement, not a theorem that no lost or "
                    "unindexed source ever existed."
                ),
            },
        },
        "candidate_principles": [
            {
                "candidate": "relative-information master functional",
                "source": "claim ledger C-2026-08-12; Theory of Nature lines 55-80",
                "formula": "F_eta(rho)=D(rho||rho0)+eta Tr(rho K)",
                "exact_content": "For supplied rho0, K, eta and trace domain, the Gibbs minimizer is unique.",
                "missing_equation": (
                    "The sources explicitly leave rho0, physical K_URT, finite D_X, trace "
                    "domain and normalization unselected. The variational theorem does not "
                    "choose the operator it is asked to minimize."
                ),
                "selects_Wilson_or_overlap_parameter": False,
                "selects_lambda": False,
                "status": "C/organizing principle, not microscopic selector",
            },
            {
                "candidate": "K_URT=C_closure+D_X^dagger D_X",
                "source": "claim ledger C-2026-08-12; Theory of Nature lines 63-80",
                "exact_content": "A coherent candidate positive cost architecture.",
                "missing_equation": (
                    "D_X and its normalization are the unknowns. Squaring makes this cost "
                    "flux-conjugation even and removes the orientation-odd phase."
                ),
                "selects_Wilson_or_overlap_parameter": False,
                "selects_lambda": False,
                "status": "U/C and phase-blind",
            },
            {
                "candidate": "hidden Gibbs state and eta_Delta",
                "source": "claim ledger C-2026-08-13",
                "exact_content": (
                    "The displayed hidden probabilities and entropy follow from the supplied "
                    "costs 3,5 and eta_Delta=-log Delta."
                ),
                "missing_equation": (
                    "No declared map identifies eta_Delta with a history hop, overlap mass, "
                    "Wilson coefficient, regulator boundary or determinant phase."
                ),
                "selects_Wilson_or_overlap_parameter": False,
                "selects_lambda": False,
                "status": "E for the defined Gibbs state; physical link absent",
            },
            {
                "candidate": "global Gaussian modular Hamiltonian",
                "source": "claim ledger C-2026-08-09 and urt_gate2_global_modular_solver.py",
                "formula": "K_Q=log[(I-Q)/Q] after Q is constructed and averaged",
                "exact_content": "Finite Gaussian log-odds functional calculus after a state Q is supplied.",
                "missing_equation": (
                    "It reconstructs a modular Hamiltonian from a previously chosen state; it "
                    "does not define a KMS dynamics or boundary regulator. The ledger already "
                    "marks the global-modular flavour closure NO_GO."
                ),
                "selects_Wilson_or_overlap_parameter": False,
                "selects_lambda": False,
                "status": "F as flavour selector; circular as microscopic input",
            },
            {
                "candidate": "A4 continuum regulator",
                "source": "urt_nature_solver.py continuum_and_lorentz()",
                "exact_content": "A normalized positive scalar root-lattice Laplacian with |k|^2 principal symbol.",
                "missing_equation": (
                    "The source explicitly says that no chiral lattice Dirac is supplied and "
                    "that overlap/GW or an equivalent repair is still required."
                ),
                "selects_Wilson_or_overlap_parameter": False,
                "selects_lambda": False,
                "status": "E scalar symbol; U fermion regulator",
            },
            {
                "candidate": "finite A4 Clifford Dirac amplitude",
                "source": "derive_a4_clifford_dirac.py; claim ledger C-2026-08-08",
                "exact_content": "Finite exterior-CAR/Clifford transfer carrier.",
                "missing_equation": (
                    "This is an internal finite amplitude, not a spacetime overlap kernel or "
                    "a determinant-line measure. Its natural connection is generation/species "
                    "degenerate and does not supply the missing regulator."
                ),
                "selects_Wilson_or_overlap_parameter": False,
                "selects_lambda": False,
                "status": "E carrier with recorded flavour no-go",
            },
            {
                "candidate": "conditional gauge anomaly cancellation",
                "source": "Theory of Nature section 22; cathedral_master_verifier.py",
                "exact_content": "Hypercharge anomaly cancellation after multiplets and normalization are supplied.",
                "missing_equation": (
                    "This is representation-charge arithmetic, not an anomaly-inflow bulk or "
                    "a trivialization of the history determinant line."
                ),
                "selects_Wilson_or_overlap_parameter": False,
                "selects_lambda": False,
                "status": "C/E conditional arithmetic; irrelevant to the measure phase",
            },
        ],
        "positive_cost_flux_even_theorem": {
            "identity": (
                "If M_- = conjugate(M_+), then K_-=M_-^dagger M_-=conjugate(K_+). "
                "The Hermitian spectra coincide, so Tr f(K), Gibbs partition functions, "
                "relative-information minima and any real spectral action coincide."
            ),
            "Gram_spectrum_conjugation_residual": float(
                np.max(np.abs(spectrum_flux - spectrum))
            ),
            "Gibbs_partition_conjugation_residual": float(
                abs(partition_flux - partition)
            ),
            "conclusion": (
                "Every already-declared positive Gram/KL/spectral cost is unable to select "
                "the sign or coefficient of chi*Omega_5. A genuinely complex chiral measure "
                "is additional data."
            ),
        },
        "modular_KMS_circularity": {
            "occupation_to_modular_residual": float(
                np.linalg.norm(modular - hamiltonian_seed)
            ),
            "identity": (
                "For any faithful rho and every beta>0, H_beta=-(1/beta)log rho+cI "
                "satisfies rho=exp(-beta H_beta)/Z. A state alone does not select beta or "
                "the Hamiltonian normalization."
            ),
            "beta_witnesses": [0.5, 1.0, 2.0, 5.0],
            "Gibbs_reconstruction_residuals": gibbs_reconstruction_residuals,
            "Hamiltonian_half_vs_five_norm_ratio": float(
                np.linalg.norm(hamiltonians[0]) / np.linalg.norm(hamiltonians[-1])
            ),
            "conclusion": (
                "Calling the supplied density matrix modular/KMS cannot determine the missing "
                "lattice hop, Wilson coefficient or determinant phase."
            ),
        },
        "axiom_boundary": {
            "status": "U with an exact insufficiency proof for the recoverable premises",
            "determined": (
                "The normalized geometric direction chi*Omega_5 and the allowed chiral "
                "projectors/covariance class."
            ),
            "not_determined": [
                "one point in the doubler-free Wilson/overlap family",
                "one determinant-line trivialization / lambda modulo the chosen phase convention",
                "a UV bulk or regulator boundary condition tying those two choices together",
            ],
            "minimum_genuinely_new_input": (
                "A microscopic fermion action or higher-dimensional regulator specified "
                "independently of flavour observations, including its kernel normalization, "
                "boundary conditions and measure phase. An inequality or framework name is "
                "insufficient unless it yields an equation with a unique admissible solution."
            ),
            "forbidden_shortcuts": [
                "identify eta_Delta with a hop or mass without a derived map",
                "choose 1/2 or 1/sqrt(2) because each appears elsewhere",
                "truncate the log determinant at degree five without a controlled expansion",
                "choose an overlap/Wilson point by convention",
                "fit lambda, masses, CKM or PMNS",
            ],
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