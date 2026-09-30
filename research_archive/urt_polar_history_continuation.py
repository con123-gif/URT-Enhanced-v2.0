#!/usr/bin/env python3
"""Unique polar-unitary completion of the URT Haar history transfer.

This is the last coefficient-free single-history completion named in the live
frontier.  It computes the polar unitary of T=(L+R)/2 exactly through
P=L^dagger R, verifies covariance and its doubled GW lift, and tests whether
the ordered fifth Wilson phase survives.

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


def block_diag(*blocks: np.ndarray) -> np.ndarray:
    rows = sum(block.shape[0] for block in blocks)
    cols = sum(block.shape[1] for block in blocks)
    out = np.zeros((rows, cols), dtype=np.result_type(*blocks))
    i = j = 0
    for block in blocks:
        r, c = block.shape
        out[i : i + r, j : j + c] = block
        i += r
        j += c
    return out


def polar_unitary(matrix: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    eigenvalues, eigenvectors = np.linalg.eigh(matrix.conj().T @ matrix)
    positive = eigenvectors @ np.diag(np.sqrt(eigenvalues)) @ eigenvectors.conj().T
    inverse_positive = (
        eigenvectors @ np.diag(1.0 / np.sqrt(eigenvalues)) @ eigenvectors.conj().T
    )
    return matrix @ inverse_positive, positive


def complex_payload(value: complex) -> dict[str, float]:
    return {"real": float(np.real(value)), "imag": float(np.imag(value))}


def grouped_angles(eigenvalues: np.ndarray, tolerance: float = 1.0e-9) -> list[dict[str, Any]]:
    angles = sorted(float(np.angle(value)) for value in eigenvalues)
    groups: list[list[float | int]] = []
    for angle in angles:
        if not groups or abs(angle - float(groups[-1][0])) > tolerance:
            groups.append([angle, 1])
        else:
            groups[-1][1] = int(groups[-1][1]) + 1
    return [
        {"angle": float(angle), "multiplicity": int(multiplicity)}
        for angle, multiplicity in groups
    ]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    geometry = wilson.hopf.build_geometry_no_networkx()
    history = wilson.build_dual_history(geometry)
    _, face_spinors, links = wilson.dual_hopf_certificate(geometry, history)
    left, right, transfer = wilson.history_transfer(history, links)
    n = left.shape[0]
    identity = np.eye(n, dtype=complex)

    relative = left.conj().T @ right
    projector_one = (
        identity + relative + np.linalg.matrix_power(relative, 2)
    ) / 3.0
    positive_exact = 0.5 * (identity + projector_one)
    inverse_positive_exact = 2.0 * identity - projector_one
    midpoint_phase = 0.5 * (identity + relative) @ inverse_positive_exact
    polar_exact = left @ midpoint_phase

    polar, positive = polar_unitary(transfer)
    polar_eigenvalues = np.linalg.eigvals(polar)
    d_polar = identity - polar
    d_singular_values = np.linalg.svd(d_polar, compute_uv=False)

    # The principal square root of P is selected on its three spectral
    # projectors.  This makes the exact polar formula transparent.
    omega = np.exp(2j * math.pi / 3.0)
    projector_omega = (
        identity + np.conj(omega) * relative + omega * relative @ relative
    ) / 3.0
    projector_omega2 = (
        identity + omega * relative + np.conj(omega) * relative @ relative
    ) / 3.0
    midpoint_phase_spectral = (
        projector_one
        + np.exp(1j * math.pi / 3.0) * projector_omega
        + np.exp(-1j * math.pi / 3.0) * projector_omega2
    )

    # Covariance follows functorially from polar decomposition; verify on the
    # two A5 generators and a generic endpoint gauge transformation.
    a5_residuals = []
    for permutation in (history["edge_half_turn"], history["face_rotation"]):
        action = wilson.twisted_state_action(
            geometry, history, face_spinors, permutation
        )
        a5_residuals.append(float(np.linalg.norm(action @ polar - polar @ action)))

    rng = np.random.default_rng(20260903)
    phases = rng.uniform(-math.pi, math.pi, 20)
    _, transformed_links = wilson.generic_hopf_links(
        history["normals"], history["adjacency"], phases
    )
    _, _, transfer_g = wilson.history_transfer(history, transformed_links)
    polar_g, _ = polar_unitary(transfer_g)
    state_gauge = np.diag(
        [np.exp(1j * phases[face]) for face, _ in history["states"]]
    )
    gauge_residual = np.linalg.norm(
        polar_g - state_gauge.conj().T @ polar @ state_gauge
    )

    # Flux conjugation commutes with the unique polar decomposition.
    polar_conjugate, _ = polar_unitary(transfer.conj())
    conjugation_residual = np.linalg.norm(polar_conjugate - polar.conj())

    # Universal forward/backward doubling gives a valid GW operator for any
    # unitary polar kernel, but cannot cure its ten eigenvalues at one.
    doubled_polar = block_diag(polar, polar.conj().T)
    zero = np.zeros_like(identity)
    gamma = np.block([[zero, identity], [identity, zero]])
    identity_doubled = np.eye(2 * n, dtype=complex)
    d_doubled = identity_doubled - doubled_polar

    traces = [np.trace(np.linalg.matrix_power(polar, degree)) for degree in range(1, 61)]
    fifth_trace = traces[4]
    nonzero_eigenvalues = polar_eigenvalues[np.abs(polar_eigenvalues - 1.0) > 1.0e-8]
    pseudodeterminant = np.prod(1.0 - nonzero_eigenvalues)

    # Match each eigenangle to its negative, including the +/-pi convention.
    sorted_angles = np.sort(np.angle(polar_eigenvalues))
    conjugate_pairing_residual = float(
        np.max(np.abs(sorted_angles + sorted_angles[::-1]))
    )

    out = {
        "certificate": "URT unique polar-history completion obstruction",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "exact_polar_reduction": {
            "transfer": "T=(L+R)/2=L(I+P)/2, P=L^dagger R",
            "P_cube_minus_identity_residual": float(
                np.linalg.norm(np.linalg.matrix_power(relative, 3) - identity)
            ),
            "Pi_1_projector_residual": float(
                np.linalg.norm(projector_one @ projector_one - projector_one)
            ),
            "absolute_transfer": "|T|=(I+Pi_1)/2",
            "absolute_transfer_residual": float(np.linalg.norm(positive - positive_exact)),
            "minimum_singular_value_T": float(np.min(np.linalg.svd(transfer, compute_uv=False))),
            "polar_midpoint": "C=polar((I+P)/2)=P^(1/2)_principal",
            "midpoint_spectral_formula_residual": float(
                np.linalg.norm(midpoint_phase - midpoint_phase_spectral)
            ),
            "midpoint_square_minus_P_residual": float(
                np.linalg.norm(midpoint_phase @ midpoint_phase - relative)
            ),
            "polar_formula": "V_T=L C=T(T^dagger T)^(-1/2)",
            "numeric_minus_exact_polar_residual": float(np.linalg.norm(polar - polar_exact)),
            "polar_unitarity_residual": float(np.linalg.norm(polar.conj().T @ polar - identity)),
            "reconstruction_residual": float(np.linalg.norm(transfer - polar @ positive)),
            "uniqueness": (
                "T is invertible (minimum singular value 1/2), so its polar unitary is "
                "unique and is the unique Frobenius-nearest unitary."
            ),
        },
        "covariance": {
            "A5_generator_commutator_residuals": a5_residuals,
            "generic_endpoint_gauge_residual": float(gauge_residual),
            "flux_conjugation_residual": float(conjugation_residual),
        },
        "spectrum_and_orientation": {
            "eigenangle_groups": grouped_angles(polar_eigenvalues),
            "conjugate_pairing_residual": conjugate_pairing_residual,
            "det_V": complex_payload(np.linalg.det(polar)),
            "eigenvalue_one_multiplicity": int(
                np.sum(np.abs(polar_eigenvalues - 1.0) < 1.0e-8)
            ),
            "eigenvalue_minus_one_multiplicity": int(
                np.sum(np.abs(polar_eigenvalues + 1.0) < 1.0e-8)
            ),
            "D_zero_mode_count": int(np.sum(d_singular_values < 1.0e-8)),
            "fifth_trace": complex_payload(fifth_trace),
            "maximum_imaginary_trace_degree_1_to_60": float(
                max(abs(np.imag(value)) for value in traces)
            ),
            "orientation_odd_fifth_trace": float(np.imag(fifth_trace)),
            "nonzero_pseudodeterminant": complex_payload(pseudodeterminant),
            "interpretation": (
                "The unique Haar polar unitary has conjugate-paired spectrum, ten exact "
                "eigenvalues at one, and real traces. It erases the orientation-odd fifth "
                "Wilson trace; det(I-V_T) vanishes."
            ),
        },
        "doubled_GW_lift": {
            "kernel": "diag(V_T,V_T^dagger)",
            "Gamma": "branch swap",
            "Gamma_kernel_Gamma_minus_kernel_dagger": float(
                np.linalg.norm(
                    gamma @ doubled_polar @ gamma - doubled_polar.conj().T
                )
            ),
            "GW_residual": float(
                np.linalg.norm(
                    gamma @ d_doubled
                    + d_doubled @ gamma
                    - d_doubled @ gamma @ d_doubled
                )
            ),
            "zero_mode_count": int(
                np.sum(np.linalg.svd(d_doubled, compute_uv=False) < 1.0e-8)
            ),
            "conclusion": (
                "The universal GW lift exists but doubles the polar rank defect and "
                "contains no orientation phase."
            ),
        },
        "polar_no_go": {
            "status": "F/no-go for the final coefficient-free Haar completion",
            "theorem": (
                "Polar unitarization is unique, gauge/A5 covariant and coefficient-free, "
                "but the symmetric Haar average makes its spectrum flux-conjugation paired. "
                "Its degree-five trace is real, I-V_T has ten zero modes, and the doubled "
                "GW determinant has no orientation phase. Therefore the polar principle "
                "cannot fix lambda or freeze the flavour action."
            ),
            "axiom_boundary": (
                "All coefficient-free completions presently implied by the finite-history "
                "and Haar data have now been exhausted: affine GW, Mobius GW, overlap, "
                "determinant topology, Szegedy/Stinespring and polar unitarization. A new "
                "microscopic axiom must be stated and independently justified before the "
                "operator can advance."
            ),
            "phenomenology_gate": "CLOSED: no masses or CKM/PMNS calculation is licensed.",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()