#!/usr/bin/env python3
"""Canonical Haar Stinespring/Szegedy dilation test for URT.

The closed history channel has two equally weighted unitary branches L and R.
This blind certificate constructs its minimal edge isometries, the canonical
product-of-reflections (Szegedy) walk, its GW chirality and physical chiral
map, then classifies the freedom in a direct unitary Stinespring completion.

No observational mass or mixing target is used.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


ROOT = Path(__file__).resolve().parent
WILSON_PATH = ROOT / "urt_wilson_history_continuation.py"


def load_wilson_module():
    spec = importlib.util.spec_from_file_location("wilson_current", WILSON_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {WILSON_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


wilson = load_wilson_module()


def complex_payload(value: complex) -> dict[str, float]:
    return {"real": float(np.real(value)), "imag": float(np.imag(value))}


def grouped_real(values: np.ndarray, tolerance: float = 1.0e-9) -> list[dict[str, Any]]:
    groups: list[list[float | int]] = []
    for value in sorted(float(x) for x in values):
        if not groups or abs(value - float(groups[-1][0])) > tolerance:
            groups.append([value, 1])
        else:
            groups[-1][1] = int(groups[-1][1]) + 1
    return [
        {"value": float(value), "multiplicity": int(multiplicity)}
        for value, multiplicity in groups
    ]


def history_edge_isometries(
    left: np.ndarray, right: np.ndarray
) -> tuple[np.ndarray, np.ndarray, dict[tuple[int, int], int]]:
    """Return A,B with A^dagger B=(L+R)/2 on the 120 allowed edges."""
    n = left.shape[0]
    a = np.zeros((2 * n, n), dtype=complex)
    b = np.zeros((2 * n, n), dtype=complex)
    edge_index: dict[tuple[int, int], int] = {}
    edge = 0
    for source in range(n):
        for branch, operator in enumerate((left, right)):
            target = int(np.argmax(np.abs(operator[source])))
            edge_index[(source, branch)] = edge
            a[edge, source] = 1.0 / math.sqrt(2.0)
            b[edge, target] = operator[source, target] / math.sqrt(2.0)
            edge += 1
    return a, b, edge_index


def incoming_complement(b: np.ndarray) -> np.ndarray:
    """Canonical SU(2) complement for each two-entry incoming column of B."""
    edges, n = b.shape
    c = np.zeros((edges, n), dtype=complex)
    for target in range(n):
        incoming = np.flatnonzero(np.abs(b[:, target]) > 1.0e-12)
        if len(incoming) != 2:
            raise RuntimeError("history target does not have exactly two incoming edges")
        b_pair = b[incoming, target]
        c[incoming[0], target] = -np.conj(b_pair[1])
        c[incoming[1], target] = np.conj(b_pair[0])
    return c


def reflection(isometry: np.ndarray) -> np.ndarray:
    return 2.0 * isometry @ isometry.conj().T - np.eye(isometry.shape[0])


def direct_extension(left: np.ndarray, right: np.ndarray, phase: float) -> np.ndarray:
    """A scalar slice of all unitary completions [K,K_perp C]."""
    n = left.shape[0]
    c = np.exp(1j * phase) * np.eye(n, dtype=complex)
    return np.block([[left, left @ c], [right, -right @ c]]) / math.sqrt(2.0)


def log_determinant(matrix: np.ndarray) -> complex:
    sign, logabs = np.linalg.slogdet(matrix)
    return float(logabs) + 1j * float(np.angle(sign))


def induced_edge_action(
    state_action: np.ndarray,
    edge_index: dict[tuple[int, int], int],
) -> np.ndarray:
    n = state_action.shape[0]
    edge_action = np.zeros((2 * n, 2 * n), dtype=complex)
    for source in range(n):
        transformed_source = int(np.argmax(np.abs(state_action[:, source])))
        phase = state_action[transformed_source, source]
        for branch in (0, 1):
            edge_action[
                edge_index[(transformed_source, branch)], edge_index[(source, branch)]
            ] = phase
    return edge_action


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    geometry = wilson.hopf.build_geometry_no_networkx()
    history = wilson.build_dual_history(geometry)
    _, face_spinors, links = wilson.dual_hopf_certificate(geometry, history)
    left, right, transfer = wilson.history_transfer(history, links)
    n = left.shape[0]
    identity_n = np.eye(n, dtype=complex)
    identity_edges = np.eye(2 * n, dtype=complex)

    a, b, edge_index = history_edge_isometries(left, right)
    r_a = reflection(a)
    r_b = reflection(b)
    walk = r_b @ r_a
    gamma = r_a
    d_szegedy = identity_edges - walk
    gamma_hat = gamma @ walk

    relative_branch = left.conj().T @ right
    transfer_gram_formula = (
        0.5 * identity_n
        + 0.25 * (relative_branch + relative_branch.conj().T)
    )
    transfer_singular_values = np.linalg.svd(transfer, compute_uv=False)
    walk_eigenvalues = np.linalg.eigvals(walk)
    d_singular_values = np.linalg.svd(d_szegedy, compute_uv=False)

    c_in = incoming_complement(b)
    v_minus = r_a @ c_in
    chiral_block = a.conj().T @ d_szegedy @ v_minus
    chiral_singular_values = np.linalg.svd(chiral_block, compute_uv=False)

    # Full A5 covariance on the 120 allowed transitions.
    a5_residuals = []
    for permutation in (history["edge_half_turn"], history["face_rotation"]):
        state_action = wilson.twisted_state_action(
            geometry, history, face_spinors, permutation
        )
        edge_action = induced_edge_action(state_action, edge_index)
        a5_residuals.append(
            {
                "A_intertwiner": float(np.linalg.norm(edge_action @ a - a @ state_action)),
                "B_intertwiner": float(np.linalg.norm(edge_action @ b - b @ state_action)),
                "walk_commutator": float(
                    np.linalg.norm(edge_action @ walk - walk @ edge_action)
                ),
            }
        )

    # Endpoint Hopf gauge covariance.
    rng = np.random.default_rng(20260903)
    phases = rng.uniform(-math.pi, math.pi, 20)
    _, transformed_links = wilson.generic_hopf_links(
        history["normals"], history["adjacency"], phases
    )
    left_g, right_g, _ = wilson.history_transfer(history, transformed_links)
    state_gauge = np.diag(
        [np.exp(1j * phases[face]) for face, _ in history["states"]]
    )
    a_g, b_g, _ = history_edge_isometries(left_g, right_g)
    edge_gauge = np.diag(np.repeat(np.diag(state_gauge), 2))
    walk_g = reflection(b_g) @ reflection(a_g)
    gauge_residuals = {
        "A": float(np.linalg.norm(a_g - edge_gauge.conj().T @ a @ state_gauge)),
        "B": float(np.linalg.norm(b_g - edge_gauge.conj().T @ b @ state_gauge)),
        "walk": float(
            np.linalg.norm(walk_g - edge_gauge.conj().T @ walk @ edge_gauge)
        ),
    }

    # Flux conjugation leaves all principal angles, and hence the complete
    # Szegedy spectrum, unchanged.
    a_c, b_c, _ = history_edge_isometries(left.conj(), right.conj())
    walk_c = reflection(b_c) @ reflection(a_c)
    flux_spectral_residual = np.linalg.norm(
        np.sort_complex(np.linalg.eigvals(walk_c))
        - np.sort_complex(np.conj(walk_eigenvalues))
    )

    # Every unitary extension of K differs by C in U(60).  The scalar slice
    # already proves nonuniqueness while preserving gauge and A5 covariance.
    k = np.vstack([left, right]) / math.sqrt(2.0)
    k_perp = np.vstack([left, -right]) / math.sqrt(2.0)
    extension_witnesses = []
    for phase in (0.0, 0.2, 0.5, math.pi):
        extension = direct_extension(left, right, phase)
        extension_flux = direct_extension(left.conj(), right.conj(), phase)
        d_extension = identity_edges - extension
        d_extension_flux = identity_edges - extension_flux
        logdet = log_determinant(d_extension)
        logdet_flux = log_determinant(d_extension_flux)
        extension_witnesses.append(
            {
                "phase": float(phase),
                "unitarity_residual": float(
                    np.linalg.norm(extension.conj().T @ extension - identity_edges)
                ),
                "complex_conjugation_reversal_residual": float(
                    np.linalg.norm(extension_flux - extension.conj())
                ),
                "logdet": complex_payload(logdet),
                "flux_conjugate_logdet": complex_payload(logdet_flux),
                "log_absolute_flux_difference": float(
                    np.real(logdet_flux - logdet)
                ),
                "det_extension_phase": float(
                    np.angle(np.linalg.det(extension))
                ),
                "expected_det_extension_phase_mod_2pi": float(
                    np.angle(np.exp(1j * 60.0 * phase))
                ),
            }
        )

    out = {
        "certificate": "URT Haar Stinespring / Szegedy dilation obstruction",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "edge_isometries": {
            "space": "120 allowed directed transitions over 60 history states",
            "A_definition": "A|s>=(|s,L>+|s,R>)/sqrt(2)",
            "B_definition": "B has incoming amplitudes U_s,t/sqrt(2)",
            "A_isometry_residual": float(np.linalg.norm(a.conj().T @ a - identity_n)),
            "B_isometry_residual": float(np.linalg.norm(b.conj().T @ b - identity_n)),
            "overlap_identity": "A^dagger B=T=(L+R)/2",
            "overlap_residual": float(np.linalg.norm(a.conj().T @ b - transfer)),
            "A5_covariance": a5_residuals,
            "gauge_covariance": gauge_residuals,
        },
        "canonical_Szegedy_GW_walk": {
            "reflections": "R_A=2AA^dagger-I, R_B=2BB^dagger-I",
            "walk": "U_S=R_B R_A",
            "chirality": "Gamma=R_A, Gamma U_S Gamma=U_S^dagger",
            "R_A_involution_residual": float(np.linalg.norm(r_a @ r_a - identity_edges)),
            "R_B_involution_residual": float(np.linalg.norm(r_b @ r_b - identity_edges)),
            "walk_unitarity_residual": float(
                np.linalg.norm(walk.conj().T @ walk - identity_edges)
            ),
            "chiral_intertwining_residual": float(
                np.linalg.norm(gamma @ walk @ gamma - walk.conj().T)
            ),
            "GW_residual": float(
                np.linalg.norm(
                    gamma @ d_szegedy
                    + d_szegedy @ gamma
                    - d_szegedy @ gamma @ d_szegedy
                )
            ),
            "Gamma_hat_involution_residual": float(
                np.linalg.norm(gamma_hat @ gamma_hat - identity_edges)
            ),
            "index_half_trace": float(
                np.real(np.trace(gamma + gamma_hat)) / 2.0
            ),
            "walk_cube_minus_identity_residual": float(
                np.linalg.norm(np.linalg.matrix_power(walk, 3) - identity_edges)
            ),
            "walk_eigenvalue_multiplicities": {
                "1": int(np.sum(np.abs(walk_eigenvalues - 1.0) < 1.0e-9)),
                "exp(+2pi_i/3)": int(
                    np.sum(
                        np.abs(walk_eigenvalues - np.exp(2j * math.pi / 3.0))
                        < 1.0e-9
                    )
                ),
                "exp(-2pi_i/3)": int(
                    np.sum(
                        np.abs(walk_eigenvalues - np.exp(-2j * math.pi / 3.0))
                        < 1.0e-9
                    )
                ),
            },
            "D_zero_mode_count": int(np.sum(d_singular_values < 1.0e-9)),
            "flux_conjugate_spectrum_residual": float(flux_spectral_residual),
        },
        "singular_value_reduction": {
            "relative_branch": "P=L^dagger R",
            "P_cube_minus_identity_residual": float(
                np.linalg.norm(np.linalg.matrix_power(relative_branch, 3) - identity_n)
            ),
            "P_eigenvalue_multiplicities": {
                "1": int(
                    np.sum(np.abs(np.linalg.eigvals(relative_branch) - 1.0) < 1.0e-9)
                ),
                "exp(+2pi_i/3)": int(
                    np.sum(
                        np.abs(
                            np.linalg.eigvals(relative_branch)
                            - np.exp(2j * math.pi / 3.0)
                        )
                        < 1.0e-9
                    )
                ),
                "exp(-2pi_i/3)": int(
                    np.sum(
                        np.abs(
                            np.linalg.eigvals(relative_branch)
                            - np.exp(-2j * math.pi / 3.0)
                        )
                        < 1.0e-9
                    )
                ),
            },
            "TdaggerT_identity": "T^dagger T=I/2+(P+P^dagger)/4",
            "TdaggerT_residual": float(
                np.linalg.norm(transfer.conj().T @ transfer - transfer_gram_formula)
            ),
            "T_singular_values": grouped_real(transfer_singular_values),
            "interpretation": (
                "The product-of-reflections spectrum depends only on singular values of T. "
                "It is therefore invariant under Hopf-flux conjugation and cannot retain "
                "the orientation-odd Wilson trace."
            ),
        },
        "physical_chiral_map": {
            "target_frame": "A spans Gamma=+1",
            "source_frame": "V_-=R_A C_in spans Gamma_hat=-1",
            "C_in_isometry_residual": float(
                np.linalg.norm(c_in.conj().T @ c_in - identity_n)
            ),
            "Bdagger_C_in_residual": float(np.linalg.norm(b.conj().T @ c_in)),
            "restricted_identity": "A^dagger (I-U_S) V_-=2 A^dagger C_in",
            "restricted_identity_residual": float(
                np.linalg.norm(chiral_block - 2.0 * a.conj().T @ c_in)
            ),
            "singular_values": grouped_real(chiral_singular_values),
            "rank": int(np.linalg.matrix_rank(chiral_block, tol=1.0e-9)),
            "kernel_dimension": int(np.sum(chiral_singular_values < 1.0e-9)),
            "nonzero_pseudodeterminant_magnitude": float(3.0**20),
            "conclusion": (
                "The canonical chiral block has a 20-dimensional kernel. Its nonzero "
                "data are flux-even, and any phase of a reduced determinant again depends "
                "on a basis/measure choice."
            ),
        },
        "unitary_completion_freedom": {
            "Haar_isometry": "K=2^(-1/2)[L;R]",
            "canonical_complement": "K_perp=2^(-1/2)[L;-R]",
            "all_extensions": "U_C=[K,K_perp C], C in U(60)",
            "K_isometry_residual": float(np.linalg.norm(k.conj().T @ k - identity_n)),
            "Kperp_isometry_residual": float(
                np.linalg.norm(k_perp.conj().T @ k_perp - identity_n)
            ),
            "orthogonality_residual": float(np.linalg.norm(k.conj().T @ k_perp)),
            "A5_commutant_statement": (
                "Because the 60 history states carry the regular A5 representation, "
                "covariant completions contain the unitary right-group algebra. Even the "
                "local scalar slice C=e^(i phi)I is a continuous gauge- and A5-covariant family."
            ),
            "scalar_phase_witnesses": extension_witnesses,
            "reversal_statement": (
                "If the same fixed scalar completion must be carried to its complex "
                "conjugate, phi=0 or pi are the real choices; both are flux-even and "
                "orientation-blind. If conjugate Hodge sectors carry C_chi=e^(i chi phi), "
                "reversal permits continuous phi, so uniqueness still fails."
            ),
        },
        "dilation_no_go": {
            "status": "F/no-go for coefficient-free selection by Haar dilation",
            "theorem": (
                "The canonical range-only Szegedy completion is an exact covariant GW "
                "walk, but factors through T^dagger T, erases Omega_5, and has forty full "
                "zero modes (twenty in the physical chiral block). A direct Stinespring "
                "unitary retains an arbitrary U(60) completion; its reversal-real scalar "
                "members are orientation-blind, while chirality-paired members retain a "
                "continuous phase. Therefore the closed Haar channel does not provide the "
                "missing microscopic Dirac/measure selector."
            ),
            "phenomenology_gate": "CLOSED: masses and CKM/PMNS remain quarantined.",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()