#!/usr/bin/env python3
"""Chiral lattice-Dirac and fermion-measure continuation for URT.

This certificate continues the blind operator gate in Cathedral_Live_State.md.
It uses no particle masses, mixing matrices, or other observational targets.

The calculation has four parts:

1. construct the A5-covariant, Hopf-gauge-covariant reversal intertwiner on
   the full 120-state branch-doubled directed-history space;
2. impose the Ginsparg--Wilson equation on the one-step history ansatz and
   compute its physical chiral half-spaces and determinant;
3. exhibit the residual covariant GW/Mobius family and the chiral-measure
   phase freedom; and
4. construct the A4-root Wilson--overlap family and classify its doublers.

The result is a no-go/underdetermination theorem: strict one-step GW fixes the
positive history hopping ratio to one, where the exact orientation phase is
trivial, while relaxing one-step locality or completing the A4 root operator
restores continuous parameters.  The chiral measure itself also retains the
same symmetry-allowed orientation counterterm.
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


def complex_payload(value: complex) -> dict[str, float]:
    return {"real": float(np.real(value)), "imag": float(np.imag(value))}


def determinant_log(matrix: np.ndarray) -> complex:
    sign, logabs = np.linalg.slogdet(matrix)
    return float(logabs) + 1j * float(np.angle(sign))


def reversal_support(history: dict[str, Any]) -> np.ndarray:
    """Permutation |a,b> -> |b,a> on the 60 directed dual edges."""
    n = len(history["states"])
    reversal = np.zeros((n, n), dtype=complex)
    for source, (a, b) in enumerate(history["states"]):
        target = history["state_index"][(b, a)]
        reversal[target, source] = 1.0
    return reversal


def covariant_reversal_intertwiner(
    geometry: dict[str, Any],
    history: dict[str, Any],
    face_spinors: np.ndarray,
    left: np.ndarray,
    right: np.ndarray,
) -> tuple[np.ndarray, dict[str, Any]]:
    """Return the unique A5-covariant monomial Q on reversal support.

    Q is sought as diag(d) S, where S reverses a directed edge.  The linear
    conditions are

        Q R = L^dagger Q,       [Q,U_A]=[Q,U_B]=0,

    for the two stored A5 generators.  The null line is then normalized to a
    unitary monomial.  Its overall phase is a harmless chirality convention.
    """
    n = left.shape[0]
    reversal = reversal_support(history)
    actions = [
        wilson.twisted_state_action(geometry, history, face_spinors, p)
        for p in (history["edge_half_turn"], history["face_rotation"])
    ]

    columns = []
    for k in range(n):
        diagonal_unit = np.zeros((n, n), dtype=complex)
        diagonal_unit[k, k] = 1.0
        q_basis = diagonal_unit @ reversal
        constraints = [q_basis @ right - left.conj().T @ q_basis]
        constraints.extend(action @ q_basis - q_basis @ action for action in actions)
        columns.append(np.concatenate([item.ravel() for item in constraints]))
    constraint_matrix = np.stack(columns, axis=1)
    _, singular_values, vh = np.linalg.svd(constraint_matrix, full_matrices=False)
    null_vector = vh[-1].conj()
    null_vector /= np.mean(np.abs(null_vector))
    null_vector *= np.exp(-1j * np.angle(null_vector[0]))
    q = np.diag(null_vector) @ reversal

    support_only = constraint_matrix[: n * n]
    relation_singular_values = np.linalg.svd(support_only, compute_uv=False)
    payload = {
        "support": "Q=diag(d) S, S|a,b>=|b,a>",
        "linear_conditions": "Q R=L^dagger Q and [Q,U_A]=[Q,U_B]=0",
        "relation_nullity": int(np.sum(relation_singular_values < 1.0e-10)),
        "relation_plus_A5_nullity": int(np.sum(singular_values < 1.0e-10)),
        "smallest_combined_singular_value": float(singular_values[-1]),
        "next_combined_singular_value": float(singular_values[-2]),
        "entry_modulus_minmax": [
            float(np.min(np.abs(null_vector))),
            float(np.max(np.abs(null_vector))),
        ],
        "unitarity_residual": float(np.linalg.norm(q.conj().T @ q - np.eye(n))),
        "intertwining_residuals": {
            "Q_R_Qdagger_minus_Ldagger": float(
                np.linalg.norm(q @ right @ q.conj().T - left.conj().T)
            ),
            "Qdagger_L_Q_minus_Rdagger": float(
                np.linalg.norm(q.conj().T @ left @ q - right.conj().T)
            ),
        },
        "A5_generator_commutator_residuals": [
            float(np.linalg.norm(action @ q - q @ action)) for action in actions
        ],
        "uniqueness_statement": (
            "Reversal intertwining alone leaves one phase per pentagon (12 lines); "
            "A5 covariance reduces these to one global phase."
        ),
    }
    return q, payload


def mobius_unitary(unitary: np.ndarray, parameter: float) -> np.ndarray:
    identity = np.eye(unitary.shape[0], dtype=complex)
    return (unitary - parameter * identity) @ np.linalg.inv(
        identity - parameter * unitary
    )


def mobius_witness(
    left: np.ndarray,
    right: np.ndarray,
    doubled_wilson: np.ndarray,
    gamma: np.ndarray,
    parameter: float,
) -> dict[str, Any]:
    if not -1.0 < parameter < 1.0:
        raise ValueError("Mobius parameter must lie in (-1,1)")
    n = left.shape[0]
    identity_n = np.eye(n, dtype=complex)
    identity_2n = np.eye(2 * n, dtype=complex)
    v_left = mobius_unitary(left, parameter)
    v_right = mobius_unitary(right, parameter)
    v = block_diag(v_left, v_right)
    d = identity_2n - v

    d_left = identity_n - v_left
    d_right = identity_n - v_right
    raw_log_ratio = determinant_log(d_right) - determinant_log(d_left)
    theta = math.pi / 6.0
    exact_log_ratio = 12.0 * (
        np.log(1.0 - parameter**5 * np.exp(-1j * theta))
        - np.log(1.0 - parameter**5 * np.exp(1j * theta))
    )
    # slogdet reports each determinant on its principal branch.  Align their
    # difference to the analytic branch continued from t=0.
    branch_winding = int(
        round((np.imag(raw_log_ratio) - np.imag(exact_log_ratio)) / (2.0 * math.pi))
    )
    numeric_log_ratio = raw_log_ratio - 2.0j * math.pi * branch_winding
    half_action = numeric_log_ratio / (2.0j)

    one_step_basis = np.stack(
        [identity_2n.ravel(), doubled_wilson.ravel()], axis=1
    )
    coefficients, *_ = np.linalg.lstsq(one_step_basis, d.ravel(), rcond=None)
    one_step_residual = np.linalg.norm(
        d - (coefficients[0] * identity_2n + coefficients[1] * doubled_wilson)
    )

    return {
        "parameter": float(parameter),
        "definition": "V_t=(W-tI)(I-tW)^(-1), D_t=I-V_t",
        "unitarity_residual": float(np.linalg.norm(v.conj().T @ v - identity_2n)),
        "gamma_hermiticity_residual": float(
            np.linalg.norm(gamma @ v @ gamma - v.conj().T)
        ),
        "GW_residual": float(
            np.linalg.norm(gamma @ d + d @ gamma - d @ gamma @ d)
        ),
        "best_affine_one_step_residual": float(one_step_residual),
        "log_chiral_determinant_ratio": complex_payload(numeric_log_ratio),
        "principal_branch_winding_removed": branch_winding,
        "determinant_formula_residual": float(
            abs(numeric_log_ratio - exact_log_ratio)
        ),
        "half_log_ratio_phase_action": float(np.real(half_action)),
        "half_log_ratio_imaginary_residual": float(abs(np.imag(half_action))),
        "degree_five_coefficient_of_Omega5": float(6.0 * parameter**5),
        "exact_action_minus_degree_five_term": float(
            np.real(half_action) - 6.0 * parameter**5
        ),
        "interpretation": (
            "Exact GW, gauge covariance and A5 covariance permit a continuous "
            "Mobius parameter once strict one-step history locality is relaxed."
        ),
    }


def euclidean_gamma_matrices() -> tuple[list[np.ndarray], np.ndarray]:
    identity2 = np.eye(2, dtype=complex)
    sigma1 = np.array([[0.0, 1.0], [1.0, 0.0]], dtype=complex)
    sigma2 = np.array([[0.0, -1j], [1j, 0.0]], dtype=complex)
    sigma3 = np.array([[1.0, 0.0], [0.0, -1.0]], dtype=complex)
    gammas = [
        np.kron(sigma1, sigma1),
        np.kron(sigma1, sigma2),
        np.kron(sigma1, sigma3),
        np.kron(sigma2, identity2),
    ]
    gamma5 = np.kron(sigma3, identity2)
    return gammas, gamma5


def a4_root_data() -> tuple[np.ndarray, np.ndarray]:
    """Return an orthonormal V4 basis and the ten positive primitive roots."""
    spanning = np.stack(
        [np.eye(5)[:, i] - np.eye(5)[:, 4] for i in range(4)], axis=1
    )
    basis, _ = np.linalg.qr(spanning)
    roots = []
    for i in range(5):
        for j in range(i + 1, 5):
            root = np.zeros(5)
            root[i] = 1.0
            root[j] = -1.0
            roots.append(root)
    return basis, np.asarray(roots)


def a4_symbol_components(
    momentum4: np.ndarray, basis: np.ndarray, roots5: np.ndarray
) -> tuple[np.ndarray, float]:
    momentum5 = basis @ momentum4
    roots4 = roots5 @ basis
    phases = roots5 @ momentum5
    derivative_vector = np.sum(roots4 * np.sin(phases)[:, None], axis=0) / 5.0
    wilson_scalar = float(np.sum(1.0 - np.cos(phases)) / 5.0)
    return derivative_vector, wilson_scalar


def overlap_symbol(
    momentum4: np.ndarray,
    mass: float,
    basis: np.ndarray,
    roots5: np.ndarray,
    gammas: list[np.ndarray],
    wilson_coefficient: float = 1.0,
    normalization: float | None = None,
) -> tuple[np.ndarray, np.ndarray, float, np.ndarray]:
    derivative_vector, wilson_scalar = a4_symbol_components(
        momentum4, basis, roots5
    )
    slash = sum(
        derivative_vector[index] * gammas[index] for index in range(4)
    )
    identity4 = np.eye(4, dtype=complex)
    kernel = 1j * slash + (wilson_coefficient * wilson_scalar - mass) * identity4
    denominator = math.sqrt(
        float(np.dot(derivative_vector, derivative_vector))
        + (wilson_coefficient * wilson_scalar - mass) ** 2
    )
    polar = kernel / denominator
    prefactor = mass if normalization is None else normalization
    overlap = prefactor * (identity4 + polar)
    return overlap, polar, wilson_scalar, derivative_vector


def a4_overlap_certificate() -> dict[str, Any]:
    basis, roots5 = a4_root_data()
    roots4 = roots5 @ basis
    gammas, gamma5 = euclidean_gamma_matrices()
    identity4 = np.eye(4, dtype=complex)
    tight_frame = roots4.T @ roots4

    clifford_residual = 0.0
    for i in range(4):
        for j in range(4):
            target = 2.0 * identity4 if i == j else np.zeros_like(identity4)
            clifford_residual = max(
                clifford_residual,
                float(np.linalg.norm(gammas[i] @ gammas[j] + gammas[j] @ gammas[i] - target)),
            )

    test_momentum = np.asarray([0.37, -0.21, 0.43, -0.18])
    covariance_residuals = []
    permutations = [
        (1, 2, 0, 3, 4),  # 3-cycle
        (1, 0, 3, 2, 4),  # double transposition
    ]
    derivative, scalar = a4_symbol_components(test_momentum, basis, roots5)
    momentum5 = basis @ test_momentum
    for permutation in permutations:
        permutation_matrix = np.eye(5)[list(permutation)]
        transformed_momentum5 = permutation_matrix @ momentum5
        transformed_momentum4 = basis.T @ transformed_momentum5
        transformed_derivative, transformed_scalar = a4_symbol_components(
            transformed_momentum4, basis, roots5
        )
        induced = basis.T @ permutation_matrix @ basis
        covariance_residuals.append(
            max(
                float(np.linalg.norm(transformed_derivative - induced @ derivative)),
                abs(transformed_scalar - scalar),
            )
        )

    masses = [0.5, 1.0, 1.5]
    mass_witnesses = []
    epsilon = 1.0e-6
    for mass in masses:
        overlap, polar, _, _ = overlap_symbol(
            test_momentum, mass, basis, roots5, gammas
        )
        gw_residual = np.linalg.norm(
            gamma5 @ overlap
            + overlap @ gamma5
            - (overlap @ gamma5 @ overlap) / mass
        )
        gamma5_residual = np.linalg.norm(gamma5 @ polar @ gamma5 - polar.conj().T)
        principal_residual = 0.0
        for axis in range(4):
            delta = np.zeros(4)
            delta[axis] = epsilon
            plus, _, _, _ = overlap_symbol(delta, mass, basis, roots5, gammas)
            minus, _, _, _ = overlap_symbol(-delta, mass, basis, roots5, gammas)
            derivative_matrix = (plus - minus) / (2.0 * epsilon)
            principal_residual = max(
                principal_residual,
                float(np.linalg.norm(derivative_matrix - 1j * gammas[axis])),
            )
        mass_witnesses.append(
            {
                "mass": mass,
                "GW_residual": float(gw_residual),
                "gamma5_hermiticity_residual": float(gamma5_residual),
                "continuum_principal_symbol_residual": float(principal_residual),
            }
        )

    critical_phase_patterns = {
        "physical": np.asarray([0.0, 0.0, 0.0, 0.0, 0.0]),
        "one_plus_four": np.asarray([math.pi, 0.0, 0.0, 0.0, 0.0]),
        "two_plus_three": np.asarray([math.pi, math.pi, 0.0, 0.0, 0.0]),
        "zero_polygon_sum": 2.0 * math.pi * np.arange(5) / 5.0,
    }
    critical_values = {}
    for name, phases5 in critical_phase_patterns.items():
        centered = phases5 - np.mean(phases5)
        momentum4 = basis.T @ centered
        vector, value = a4_symbol_components(momentum4, basis, roots5)
        critical_values[name] = {
            "derivative_norm": float(np.linalg.norm(vector)),
            "Wilson_scalar": float(value),
        }

    beyond_mass = 1.7
    split_momentum = basis.T @ (
        critical_phase_patterns["one_plus_four"]
        - np.mean(critical_phase_patterns["one_plus_four"])
    )
    beyond_overlap, _, _, _ = overlap_symbol(
        split_momentum, beyond_mass, basis, roots5, gammas
    )

    # Even if one fixes both the continuum coefficient and the standard GW
    # radius to one, the Wilson coefficient remains continuous.  With m=1,
    # D=I+A/sqrt(A^dagger A) has one zero precisely when r>5/8.
    fixed_radius_witnesses = []
    for wilson_coefficient in (0.75, 1.0, 2.0):
        overlap, polar, _, _ = overlap_symbol(
            test_momentum,
            1.0,
            basis,
            roots5,
            gammas,
            wilson_coefficient=wilson_coefficient,
            normalization=1.0,
        )
        gw_residual = np.linalg.norm(
            gamma5 @ overlap + overlap @ gamma5 - overlap @ gamma5 @ overlap
        )
        principal_residual = 0.0
        for axis in range(4):
            delta = np.zeros(4)
            delta[axis] = epsilon
            plus, _, _, _ = overlap_symbol(
                delta,
                1.0,
                basis,
                roots5,
                gammas,
                wilson_coefficient=wilson_coefficient,
                normalization=1.0,
            )
            minus, _, _, _ = overlap_symbol(
                -delta,
                1.0,
                basis,
                roots5,
                gammas,
                wilson_coefficient=wilson_coefficient,
                normalization=1.0,
            )
            derivative_matrix = (plus - minus) / (2.0 * epsilon)
            principal_residual = max(
                principal_residual,
                float(np.linalg.norm(derivative_matrix - 1j * gammas[axis])),
            )
        fixed_radius_witnesses.append(
            {
                "Wilson_coefficient": wilson_coefficient,
                "GW_residual_standard_radius": float(gw_residual),
                "gamma5_hermiticity_residual": float(
                    np.linalg.norm(gamma5 @ polar @ gamma5 - polar.conj().T)
                ),
                "continuum_principal_symbol_residual": float(principal_residual),
            }
        )

    subcritical_wilson = 0.6
    subcritical_overlap, _, _, _ = overlap_symbol(
        split_momentum,
        1.0,
        basis,
        roots5,
        gammas,
        wilson_coefficient=subcritical_wilson,
        normalization=1.0,
    )

    return {
        "root_system": "Phi(A4)={e_i-e_j}; ten positive roots are used in paired differences",
        "tight_frame_half_residual": float(np.linalg.norm(tight_frame - 5.0 * np.eye(4))),
        "Clifford_residual": float(clifford_residual),
        "symbol": {
            "S": "(1/5) sum_{i<j} gamma(e_i-e_j) sin(p_i-p_j)",
            "B": "(1/5) sum_{i<j} [1-cos(p_i-p_j)]",
            "A_m": "i S+B-m",
            "D_m": "m [I+A_m (A_m^dagger A_m)^(-1/2)]",
        },
        "A5_root_covariance_residuals": covariance_residuals,
        "derivative_zero_classification": (
            "Let Z=sum_j exp(i p_j). S=0 iff Z=0 or every phase is parallel/antiparallel "
            "to Z. Also sum_{i<j}(1-cos(p_i-p_j))=(25-|Z|^2)/2. The first "
            "nonphysical zero is the 1+4 antipodal split, where B=8/5."
        ),
        "critical_values": critical_values,
        "doubler_free_mass_interval": "0<m<8/5 (Wilson coefficient r=1)",
        "mass_witnesses": mass_witnesses,
        "beyond_interval_witness": {
            "mass": beyond_mass,
            "one_plus_four_overlap_norm": float(np.linalg.norm(beyond_overlap)),
            "interpretation": "For m>8/5 the 1+4 critical point becomes an extra zero.",
        },
        "fixed_standard_GW_radius_family": {
            "definition": "m=1, A_r=iS+rB-1, D_r=I+A_r/sqrt(A_r^dagger A_r)",
            "doubler_free_interval": "r>5/8",
            "witnesses": fixed_radius_witnesses,
            "subcritical_witness": {
                "Wilson_coefficient": subcritical_wilson,
                "one_plus_four_overlap_norm": float(
                    np.linalg.norm(subcritical_overlap)
                ),
            },
            "conclusion": (
                "Fixing the GW coefficient and the i gamma.p normalization to one does "
                "not restore uniqueness: the Wilson coefficient r remains continuous."
            ),
        },
        "conclusion": (
            "Every m in the open interval has one massless orbit, no root-lattice doublers, "
            "the same i gamma.p principal symbol, exact GW chirality, and A5 covariance. "
            "The root data do not select m."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    geometry = wilson.hopf.build_geometry_no_networkx()
    history = wilson.build_dual_history(geometry)
    _, face_spinors, links = wilson.dual_hopf_certificate(geometry, history)
    left, right, _ = wilson.history_transfer(history, links)
    n = left.shape[0]
    identity_n = np.eye(n, dtype=complex)
    identity_2n = np.eye(2 * n, dtype=complex)
    zero_n = np.zeros((n, n), dtype=complex)

    q, q_certificate = covariant_reversal_intertwiner(
        geometry, history, face_spinors, left, right
    )
    doubled_wilson = block_diag(left, right)
    gamma = np.block([[zero_n, q], [q.conj().T, zero_n]])
    d_one_step = identity_2n - doubled_wilson
    gamma_hat = gamma @ doubled_wilson

    # Explicit physical chiral half-spaces.  U_+ spans Gamma=+1 and V_-
    # spans Gamma_hat=-1.  In these canonical frames the chiral block is I-R.
    u_plus = np.vstack([q, identity_n]) / math.sqrt(2.0)
    v_minus = np.vstack([-q @ right, identity_n]) / math.sqrt(2.0)
    chiral_block = u_plus.conj().T @ d_one_step @ v_minus

    # Gauge covariance of W, Gamma and a representative Mobius solution.
    rng = np.random.default_rng(20260903)
    phases = rng.uniform(-math.pi, math.pi, 20)
    _, transformed_links = wilson.generic_hopf_links(
        history["normals"], history["adjacency"], phases
    )
    left_g, right_g, _ = wilson.history_transfer(history, transformed_links)
    state_gauge = np.diag(
        [np.exp(1j * phases[a]) for a, _ in history["states"]]
    )
    doubled_gauge = block_diag(state_gauge, state_gauge)
    doubled_wilson_g = block_diag(left_g, right_g)
    q_g = state_gauge.conj().T @ q @ state_gauge
    gamma_g = np.block([[zero_n, q_g], [q_g.conj().T, zero_n]])
    gauge_w_residual = np.linalg.norm(
        doubled_wilson_g
        - doubled_gauge.conj().T @ doubled_wilson @ doubled_gauge
    )
    gauge_gamma_residual = np.linalg.norm(
        gamma_g - doubled_gauge.conj().T @ gamma @ doubled_gauge
    )
    mobius_probe = 0.37
    d_probe = identity_2n - mobius_unitary(doubled_wilson, mobius_probe)
    d_probe_g = identity_2n - mobius_unitary(doubled_wilson_g, mobius_probe)
    gauge_mobius_residual = np.linalg.norm(
        d_probe_g - doubled_gauge.conj().T @ d_probe @ doubled_gauge
    )

    # The standard GW equation on D_a=I-aW has the exact residual
    # (1-a^2) Gamma.  Positive one-step hopping therefore forces a=1.
    affine_witnesses = []
    for amplitude in (0.5, 1.0 / math.sqrt(2.0), 1.0, -1.0):
        d_amplitude = identity_2n - amplitude * doubled_wilson
        residual_matrix = (
            gamma @ d_amplitude
            + d_amplitude @ gamma
            - d_amplitude @ gamma @ d_amplitude
        )
        affine_witnesses.append(
            {
                "amplitude": float(amplitude),
                "GW_residual": float(np.linalg.norm(residual_matrix)),
                "exact_residual_norm": float(
                    abs(1.0 - amplitude**2) * math.sqrt(2 * n)
                ),
            }
        )

    det_left = determinant_log(identity_n - left)
    det_right = determinant_log(identity_n - right)
    exact_logabs = 12.0 * math.log(2.0 * math.sin(math.pi / 12.0))
    determinant_ratio = np.exp(det_right - det_left)
    singular_values_d = np.linalg.svd(d_one_step, compute_uv=False)

    # A basis phase is a genuine chiral-measure phase: V_- -> V_- B changes
    # det(U_+^dagger D V_-) by det(B), without changing either projector.
    measure_angle = 0.731
    measure_rotation = np.exp(1j * measure_angle / n) * identity_n
    rotated_chiral_block = u_plus.conj().T @ d_one_step @ (
        v_minus @ measure_rotation
    )
    measure_phase_ratio = np.exp(
        determinant_log(rotated_chiral_block) - determinant_log(chiral_block)
    )

    mobius_witnesses = [
        mobius_witness(
            left, right, doubled_wilson, gamma, parameter
        )
        for parameter in (0.0, 0.5, 1.0 / math.sqrt(2.0), -0.5)
    ]

    ko6 = wilson.ko6_completion_certificate(d_one_step)
    a4_overlap = a4_overlap_certificate()

    out = {
        "certificate": "URT chiral Dirac / measure obstruction continuation",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "history_reversal_chirality": q_certificate,
        "branch_doubled_GW_operator": {
            "space": "C^2_branch tensor C^60_directed-edge",
            "W": "diag(L,R)",
            "Gamma": "[[0,Q],[Q^dagger,0]]",
            "Gamma_hermitian_residual": float(np.linalg.norm(gamma - gamma.conj().T)),
            "Gamma_square_residual": float(np.linalg.norm(gamma @ gamma - identity_2n)),
            "Gamma_W_Gamma_minus_Wdagger": float(
                np.linalg.norm(gamma @ doubled_wilson @ gamma - doubled_wilson.conj().T)
            ),
            "D": "I-W",
            "D_Gamma_hermiticity_residual": float(
                np.linalg.norm(d_one_step.conj().T - gamma @ d_one_step @ gamma)
            ),
            "GW_residual": float(
                np.linalg.norm(
                    gamma @ d_one_step
                    + d_one_step @ gamma
                    - d_one_step @ gamma @ d_one_step
                )
            ),
            "Gamma_hat": "Gamma(1-D)=Gamma W",
            "Gamma_hat_hermitian_residual": float(
                np.linalg.norm(gamma_hat - gamma_hat.conj().T)
            ),
            "Gamma_hat_square_residual": float(
                np.linalg.norm(gamma_hat @ gamma_hat - identity_2n)
            ),
            "index_half_trace_Gamma_plus_Gamma_hat": float(
                np.real(np.trace(gamma + gamma_hat)) / 2.0
            ),
            "minimum_singular_value_D": float(np.min(singular_values_d)),
            "minimum_singular_value_exact": float(2.0 * math.sin(math.pi / 60.0)),
            "internal_zero_mode_count": int(np.sum(singular_values_d < 1.0e-10)),
            "KO6_completion_residuals": ko6,
        },
        "gauge_covariance": {
            "W_residual": float(gauge_w_residual),
            "Gamma_residual": float(gauge_gamma_residual),
            "Mobius_D_t_residual": float(gauge_mobius_residual),
        },
        "one_step_ratio_theorem": {
            "ansatz": "D_a=I-aW",
            "identity": "{Gamma,D_a}-D_a Gamma D_a=(1-a^2) Gamma",
            "positive_solution": "a=1",
            "real_solutions": [-1, 1],
            "witnesses": affine_witnesses,
            "conclusion": (
                "GW fixes the positive relative coefficient only inside the strict affine "
                "one-step ansatz."
            ),
        },
        "physical_chiral_half_space": {
            "target_projector": "P_+=(I+Gamma)/2",
            "source_projector": "P_hat_-=(I-Gamma_hat)/2",
            "U_plus": "2^(-1/2) [Q;I]",
            "V_minus": "2^(-1/2) [-Q R;I]",
            "U_isometry_residual": float(
                np.linalg.norm(u_plus.conj().T @ u_plus - identity_n)
            ),
            "V_isometry_residual": float(
                np.linalg.norm(v_minus.conj().T @ v_minus - identity_n)
            ),
            "Gamma_U_minus_U": float(np.linalg.norm(gamma @ u_plus - u_plus)),
            "Gamma_hat_V_plus_V": float(
                np.linalg.norm(gamma_hat @ v_minus + v_minus)
            ),
            "restricted_operator_identity": "U_plus^dagger D V_minus=I-R",
            "restricted_operator_residual": float(
                np.linalg.norm(chiral_block - (identity_n - right))
            ),
            "dimension": n,
        },
        "one_step_pfaffian_obstruction": {
            "det_I_minus_L_log": complex_payload(det_left),
            "det_I_minus_R_log": complex_payload(det_right),
            "common_log_absolute_value_exact": float(exact_logabs),
            "determinant_ratio": complex_payload(determinant_ratio),
            "determinant_ratio_minus_one": float(abs(determinant_ratio - 1.0)),
            "exact_identity": (
                "det(I-L)=(1-e^(-i pi/6))^12 and det(I-R)=(1-e^(+i pi/6))^12; "
                "both are the same negative real number, so their ratio is one."
            ),
            "Abel_resummed_half_log_ratio": "-5 pi, hence exp(log ratio)=exp(-10 pi i)=1",
            "interpretation": (
                "The leading -6 a^5 Omega_5 term for |a|<1 is canceled at the GW point "
                "a=1 by all higher 5n-step closed walks. Strict one-step GW therefore "
                "does not induce a physical orientation phase."
            ),
        },
        "GW_Mobius_family": {
            "domain": "-1<t<1",
            "witnesses": mobius_witnesses,
            "locality_tradeoff": (
                "t=0 is the affine one-step operator. Nonzero t is a covariant rational "
                "function of W (finite pentagon-range after using the minimal polynomial), "
                "and its orientation coefficient varies continuously as 6 t^5+O(t^10)."
            ),
        },
        "fermion_measure_ambiguity": {
            "basis_change": "U_+ -> U_+ B_+, V_- -> V_- B_-",
            "determinant_change": "det M -> det(B_+^dagger) det(B_-) det M",
            "witness_angle": measure_angle,
            "numeric_phase_ratio": complex_payload(measure_phase_ratio),
            "target_phase": complex_payload(np.exp(1j * measure_angle)),
            "phase_witness_residual": float(
                abs(measure_phase_ratio - np.exp(1j * measure_angle))
            ),
            "symmetry_allowed_counterterm": "exp(i lambda chi Omega_5), lambda real",
            "conclusion": (
                "The chiral projectors do not specify a fermionic measure. The missing "
                "orientation coefficient is exactly a permitted measure/counterterm phase."
            ),
        },
        "A4_root_overlap_family": a4_overlap,
        "status": {
            "exact": [
                "A5-covariant reversal chirality on the 120-state history space",
                "one-step GW ratio identity and physical chiral projectors",
                "trivial exact orientation ratio at a=1",
                "continuous covariant GW Mobius family",
                "A4-root overlap mass interval and doubler classification",
                "fermion-measure phase transformation law",
            ],
            "no_go": (
                "The five requested operator conditions do not select one microscopic "
                "chiral Dirac/measure pair. Strict one-step GW fixes a=1 but cancels the "
                "orientation phase; allowing GW-compatible finite-range completion leaves "
                "t continuous; the A4 overlap construction independently leaves 0<m<8/5; "
                "and the chiral measure permits arbitrary exp(i lambda chi Omega_5)."
            ),
            "unresolved": (
                "A new microscopic measure principle or anomaly-inflow datum capable of "
                "quantizing lambda, plus a coefficient-free selector for the overlap kernel, "
                "would be required before the flavour action can be frozen."
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