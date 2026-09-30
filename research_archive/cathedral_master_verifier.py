#!/usr/bin/env python3
"""Independent compact verifier for the Cathedral--URT master audit.

The script deliberately separates algebraic identities from response-model
outputs.  It uses no measured particle masses, mixing angles, or couplings.
"""

from __future__ import annotations

import json
import math
from collections import Counter
from fractions import Fraction

import numpy as np


TOL = 1.0e-10
PHI = (1.0 + math.sqrt(5.0)) / 2.0


def grouped(values: np.ndarray, tol: float = TOL) -> list[dict[str, float | int]]:
    out: list[list[float | int]] = []
    for value in sorted(float(x) for x in values):
        if not out or abs(value - float(out[-1][0])) > tol:
            out.append([value, 1])
        else:
            out[-1][1] = int(out[-1][1]) + 1
    return [{"value": float(x), "multiplicity": int(m)} for x, m in out]


def icosahedral_shell() -> tuple[np.ndarray, np.ndarray]:
    vertices = []
    for a in (-1.0, 1.0):
        for b in (-PHI, PHI):
            vertices.append((0.0, a, b))
            vertices.append((a, b, 0.0))
            vertices.append((b, 0.0, a))
    v = np.asarray(vertices)
    distances = np.linalg.norm(v[:, None, :] - v[None, :, :], axis=2)
    edge = np.min(distances[distances > TOL])
    a = np.isclose(distances, edge, atol=TOL).astype(float)
    np.fill_diagonal(a, 0.0)
    return v, a


def icosahedral_spectrum() -> dict[str, object]:
    vertices, a = icosahedral_shell()
    centred = np.zeros((13, 13))
    centred[1:, 1:] = a
    centred[0, 1:] = centred[1:, 0] = 1.0
    lap = np.diag(centred.sum(axis=1)) - centred
    eigen = np.linalg.eigvalsh(lap)
    expected = np.array(
        [0.0]
        + [6.0 - math.sqrt(5.0)] * 3
        + [7.0] * 5
        + [6.0 + math.sqrt(5.0)] * 3
        + [13.0]
    )
    shell_lap = 5.0 * np.eye(12) - a
    faces = [
        (i, j, k)
        for i in range(12)
        for j in range(i + 1, 12)
        for k in range(j + 1, 12)
        if a[i, j] and a[i, k] and a[j, k]
    ]
    incidence = np.zeros((len(faces), 12))
    for row, face in enumerate(faces):
        incidence[row, list(face)] = 1.0
    dual_adjacency = np.zeros((len(faces), len(faces)))
    for i, first in enumerate(faces):
        for j in range(i + 1, len(faces)):
            if len(set(first).intersection(faces[j])) == 2:
                dual_adjacency[i, j] = dual_adjacency[j, i] = 1.0
    dual_lap = 3.0 * np.eye(len(faces)) - dual_adjacency
    _, singular, vh = np.linalg.svd(incidence.T, full_matrices=True)
    hidden = vh[np.sum(singular > TOL) :].T
    hidden_lap = hidden.T @ dual_lap @ hidden
    incidence_error = float(np.linalg.norm(incidence.T @ incidence - 5.0 * np.eye(12) - 2.0 * a))
    hidden_invariance_error = float(
        np.linalg.norm((np.eye(20) - hidden @ hidden.T) @ dual_lap @ hidden)
    )
    centred_edges = [
        (i, j)
        for i in range(13)
        for j in range(i + 1, 13)
        if centred[i, j]
    ]
    edge_index = {edge: index for index, edge in enumerate(centred_edges)}
    boundary_one = np.zeros((len(centred_edges), 13))
    for row, (i, j) in enumerate(centred_edges):
        boundary_one[row, i] = -1.0
        boundary_one[row, j] = 1.0
    boundary_two = np.zeros((len(faces), len(centred_edges)))
    for row, (i, j, k) in enumerate(faces):
        first, second, third = i + 1, j + 1, k + 1
        boundary_two[row, edge_index[(second, third)]] = 1.0
        boundary_two[row, edge_index[(first, third)]] = -1.0
        boundary_two[row, edge_index[(first, second)]] = 1.0
    rank_one = int(np.linalg.matrix_rank(boundary_one))
    rank_two = int(np.linalg.matrix_rank(boundary_two))
    chain_error = float(np.linalg.norm(boundary_two @ boundary_one))
    betti = [13 - rank_one, len(centred_edges) - rank_one - rank_two, len(faces) - rank_two]
    assert len(faces) == 20
    assert incidence_error < TOL
    assert hidden_invariance_error < TOL
    assert chain_error < TOL
    assert betti == [1, 11, 1]
    return {
        "shell_edges": int(a.sum() // 2),
        "shell_faces": len(faces),
        "centred_edges": int(centred.sum() // 2),
        "shell_degrees": sorted(set(int(x) for x in a.sum(axis=1))),
        "shell_spectrum": grouped(np.linalg.eigvalsh(shell_lap)),
        "centred_spectrum": grouped(eigen),
        "max_spectral_error": float(np.max(np.abs(np.sort(eigen) - np.sort(expected)))),
        "face_vertex_incidence_rank": int(np.linalg.matrix_rank(incidence)),
        "face_vertex_incidence_identity_error": incidence_error,
        "hidden_face_dimension": int(hidden.shape[1]),
        "hidden_dual_laplacian_spectrum": grouped(np.linalg.eigvalsh(hidden_lap)),
        "hidden_dual_invariance_error": hidden_invariance_error,
        "centred_graph_shell_face_betti_numbers": betti,
        "chain_boundary_squared_error": chain_error,
        "vertex_radius": float(np.linalg.norm(vertices[0])),
    }


CLASS_SIZES = np.array([1.0, 15.0, 20.0, 12.0, 12.0])
CHARACTERS = {
    "1": np.array([1.0, 1.0, 1.0, 1.0, 1.0]),
    "3": np.array([3.0, -1.0, 0.0, PHI, 1.0 - PHI]),
    "3p": np.array([3.0, -1.0, 0.0, 1.0 - PHI, PHI]),
    "4": np.array([4.0, 0.0, 1.0, -1.0, -1.0]),
    "5": np.array([5.0, 1.0, -1.0, 0.0, 0.0]),
}


def decompose(character: np.ndarray) -> dict[str, int]:
    ans = {}
    for name, irreducible in CHARACTERS.items():
        multiplicity = float(np.dot(CLASS_SIZES, character * irreducible) / 60.0)
        rounded = int(round(multiplicity))
        if rounded:
            ans[name] = rounded
        assert abs(multiplicity - rounded) < TOL
    return ans


def representation_audit() -> dict[str, object]:
    chi4 = CHARACTERS["4"]
    # Class-square map: 1->1, 2->1, 3->3, and the two 5-classes exchange.
    chi4_square = chi4[[0, 0, 2, 4, 3]]
    lambda2 = (chi4**2 - chi4_square) / 2.0
    lambda_full = 2.0 * CHARACTERS["1"] + 2.0 * chi4 + lambda2
    hom_3_3p = CHARACTERS["3"] * CHARACTERS["3p"]
    sym2_3 = (CHARACTERS["3"] ** 2 + CHARACTERS["3"][[0, 0, 2, 4, 3]]) / 2.0
    sym2_3p = (CHARACTERS["3p"] ** 2 + CHARACTERS["3p"][[0, 0, 2, 4, 3]]) / 2.0
    pre_bianchi = sym2_3 + sym2_3p + hom_3_3p
    h21 = lambda_full + CHARACTERS["5"]
    return {
        "Lambda0_V4": {"1": 1},
        "Lambda1_V4": {"4": 1},
        "Lambda2_V4": decompose(lambda2),
        "Lambda3_V4": {"4": 1},
        "Lambda4_V4": {"1": 1},
        "Lambda_full_V4": decompose(lambda_full),
        "Hom_3_3p": decompose(hom_3_3p),
        "Sym2_3": decompose(sym2_3),
        "Sym2_3p": decompose(sym2_3p),
        "curvature_pre_Bianchi_21": decompose(pre_bianchi),
        "curvature_after_Bianchi_20": {"1": 1, "4": 1, "5": 3},
        "H21_state_module": decompose(h21),
        "H21_is_curvature_module": bool(np.allclose(h21, pre_bianchi)),
    }


def frozen_primitives() -> dict[str, float | int]:
    """Return the present frozen definitions without claiming their selection."""
    gamma = 1.0 / 81.0
    d_star = (1.0 - gamma) * math.pi / (13.0 * PHI)
    d_classical = 3.0 / 20.0
    delta = d_classical - d_star
    return {
        "D": 3,
        "V": 12,
        "E": 30,
        "F": 20,
        "N": 13,
        "q": 5,
        "hidden_dimension": 8,
        "phi": PHI,
        "gamma": gamma,
        "d_star": d_star,
        "d_classical": d_classical,
        "Delta": delta,
        "eta_Delta": -math.log(delta),
    }


def hidden_entropy_audit() -> dict[str, object]:
    """Verify the complete two-quartet canonical thermodynamics.

    The small probability belongs to eigenvalue 5.  Calling it p_3 while also
    writing L=3P_3+5P_5 reverses the entropy-variation sign.  This verifier
    names it p_exhaust and reports both spectral probabilities explicitly.
    """
    primitive = frozen_primitives()
    delta = float(primitive["Delta"])
    eta = float(primitive["eta_Delta"])
    weights = np.exp(-eta * np.array([3.0] * 4 + [5.0] * 4))
    partition = float(np.sum(weights))
    rho = weights / partition
    p3 = float(np.sum(rho[:4]))
    p5 = float(np.sum(rho[4:]))
    expected_p3 = 1.0 / (1.0 + delta**2)
    expected_p5 = delta**2 / (1.0 + delta**2)
    entropy_direct = float(-np.sum(rho * np.log(rho)))
    entropy_closed = (
        math.log(4.0)
        + math.log1p(delta**2)
        - delta**2 * math.log(delta**2) / (1.0 + delta**2)
    )
    derivative_p5 = math.log((1.0 - p5) / p5)
    mean_energy = 3.0 + 2.0 * p5
    variance_energy = 4.0 * p5 * (1.0 - p5)
    dp5_deta = -2.0 * p5 * (1.0 - p5)
    dentropy_deta = -eta * variance_energy
    errors = {
        "normalization": abs(float(np.sum(rho)) - 1.0),
        "p3_formula": abs(p3 - expected_p3),
        "p5_formula": abs(p5 - expected_p5),
        "entropy_formula": abs(entropy_direct - entropy_closed),
        "entropy_susceptibility": abs(derivative_p5 - 2.0 * eta),
        "canonical_entropy_flow": abs(derivative_p5 * dp5_deta - dentropy_deta),
    }
    assert max(errors.values()) < TOL
    return {
        "spectrum": [{"value": 3, "multiplicity": 4}, {"value": 5, "multiplicity": 4}],
        "partition_function": partition,
        "p_eigenvalue_3": p3,
        "p_eigenvalue_5_exhaust": p5,
        "entropy_over_kB": entropy_direct,
        "vacuum_subtracted_entropy_over_kB": entropy_direct - math.log(4.0),
        "mean_dimensionless_energy": mean_energy,
        "energy_variance": variance_energy,
        "dS_over_kB_dp_exhaust": derivative_p5,
        "dS_over_kB_deta": dentropy_deta,
        "identity_errors": errors,
        "notation_correction": (
            "The positive identity dS=2 k_B eta dp applies to the eigenvalue-5 "
            "exhaust probability p=Delta^2/(1+Delta^2).  Using the eigenvalue-3 "
            "probability instead changes the sign."
        ),
    }


def gibbs_master_audit() -> dict[str, object]:
    """Check the exact finite relative-information minimization theorem."""
    primitive = frozen_primitives()
    delta = float(primitive["Delta"])
    eta = float(primitive["eta_Delta"])
    exterior_degrees = np.array(
        [degree for degree in range(5) for _ in range(math.comb(4, degree))],
        dtype=float,
    )
    prior = delta**exterior_degrees / (1.0 + delta) ** 4
    costs = np.linspace(0.0, 2.0, len(prior))
    unnormalized = prior * np.exp(-eta * costs)
    partition = float(np.sum(unnormalized))
    minimizer = unnormalized / partition
    competitor = np.full_like(minimizer, 1.0 / len(minimizer))

    def relative_entropy(p: np.ndarray, q: np.ndarray) -> float:
        return float(np.sum(p * np.log(p / q)))

    def action(p: np.ndarray) -> float:
        return relative_entropy(p, prior) + eta * float(np.dot(p, costs))

    free_energy = -math.log(partition)
    gap = action(competitor) - action(minimizer)
    relative_gap = relative_entropy(competitor, minimizer)
    mean_cost = float(np.dot(minimizer, costs))
    variance_cost = float(np.dot(minimizer, (costs - mean_cost) ** 2))
    errors = {
        "passive_state_normalization": abs(float(np.sum(prior)) - 1.0),
        "gibbs_state_normalization": abs(float(np.sum(minimizer)) - 1.0),
        "minimum_equals_minus_log_Z": abs(action(minimizer) - free_energy),
        "free_energy_gap_equals_relative_entropy": abs(gap - relative_gap),
    }
    assert max(errors.values()) < TOL
    assert gap > 0.0
    return {
        "exterior_degree_multiplicities": [1, 4, 6, 4, 1],
        "passive_state_formula": "rho_0=Delta^Nhat/(1+Delta)^4",
        "trace_dimension": int(len(prior)),
        "sample_partition_function": partition,
        "sample_free_energy": free_energy,
        "sample_competitor_free_energy_gap": gap,
        "sample_mean_cost": mean_cost,
        "sample_variance_cost": variance_cost,
        "diagonal_flow_identity": "d<K>/deta=-Var(K)<=0",
        "identity_errors": errors,
        "status": (
            "The Gibbs minimizer is an exact theorem after a full-rank passive state "
            "and a specific cost operator are supplied; the physical cost operator "
            "is not yet uniquely derived."
        ),
    }


WEDGE_PAIRS = [(a, b) for a in range(4) for b in range(a + 1, 4)]


def levi_civita(indices: tuple[int, int, int, int]) -> int:
    if len(set(indices)) != 4:
        return 0
    inversions = sum(
        int(indices[i] > indices[j]) for i in range(4) for j in range(i + 1, 4)
    )
    return -1 if inversions % 2 else 1


def hodge_star_four() -> np.ndarray:
    star = np.zeros((6, 6))
    for column, (i, j) in enumerate(WEDGE_PAIRS):
        for row, (k, ell) in enumerate(WEDGE_PAIRS):
            star[row, column] = levi_civita((i, j, k, ell))
    return star


def symmetric_action_on_two_forms(sigma: np.ndarray) -> np.ndarray:
    """Return (u wedge v) -> sigma(u) wedge v + u wedge sigma(v)."""
    pair_index = {pair: i for i, pair in enumerate(WEDGE_PAIRS)}
    action = np.zeros((6, 6))

    def add_wedge(column: int, first: int, second: int, coefficient: float) -> None:
        if first == second:
            return
        if first < second:
            action[pair_index[(first, second)], column] += coefficient
        else:
            action[pair_index[(second, first)], column] -= coefficient

    for column, (i, j) in enumerate(WEDGE_PAIRS):
        for k in range(4):
            add_wedge(column, k, j, float(sigma[k, i]))
            add_wedge(column, i, k, float(sigma[k, j]))
    return action


def tracefree_symmetric_basis() -> list[np.ndarray]:
    basis = []
    for i in range(4):
        for j in range(i + 1, 4):
            matrix = np.zeros((4, 4))
            matrix[i, j] = matrix[j, i] = 1.0 / math.sqrt(2.0)
            basis.append(matrix)
    basis.extend(
        [
            np.diag([1.0, -1.0, 0.0, 0.0]) / math.sqrt(2.0),
            np.diag([1.0, 1.0, -2.0, 0.0]) / math.sqrt(6.0),
            np.diag([1.0, 1.0, 1.0, -3.0]) / math.sqrt(12.0),
        ]
    )
    return basis


def ricci_map_audit() -> dict[str, object]:
    """Independently construct the normalized four-dimensional Ricci map."""
    star = hodge_star_four()
    values, vectors = np.linalg.eigh(star)
    plus = vectors[:, values > 0.0]
    minus = vectors[:, values < 0.0]
    basis = tracefree_symmetric_basis()
    columns = []
    anti_hodge_errors = []
    ricci_errors = []
    identity = np.eye(4)

    for sigma in basis:
        action = symmetric_action_on_two_forms(sigma)
        anti_hodge_errors.append(float(np.linalg.norm(star @ action + action @ star)))
        # R_sigma=(1/2)(sigma wedge g); its off-diagonal curvature block is B.
        block = 0.5 * minus.T @ action @ plus
        columns.append(block.reshape(-1))
        curvature = np.zeros((4, 4, 4, 4))
        for i in range(4):
            for j in range(4):
                for k in range(4):
                    for ell in range(4):
                        curvature[i, j, k, ell] = 0.5 * (
                            sigma[i, k] * identity[j, ell]
                            - sigma[i, ell] * identity[j, k]
                            - sigma[j, k] * identity[i, ell]
                            + sigma[j, ell] * identity[i, k]
                        )
        ricci = np.einsum("ijil->jl", curvature)
        ricci_errors.append(float(np.linalg.norm(ricci - sigma)))

    linear_map = np.column_stack(columns)
    singular_values = np.linalg.svd(linear_map, compute_uv=False)
    normalized_gram_error = float(
        np.linalg.norm((2.0 * linear_map).T @ (2.0 * linear_map) - np.eye(9))
    )
    rng = np.random.default_rng(20260822)
    x = rng.normal(size=4)
    y = rng.normal(size=4)
    z = math.sqrt(3.0) * x + 1j * math.sqrt(5.0) * y
    source_complex = np.real(np.outer(z, np.conjugate(z)))
    source_real = 3.0 * np.outer(x, x) + 5.0 * np.outer(y, y)
    sigma_source = source_real - np.trace(source_real) * np.eye(4) / 4.0
    errors = {
        "hodge_square": float(np.linalg.norm(star @ star - np.eye(6))),
        "tracefree_action_anticommutes_with_hodge": max(anti_hodge_errors),
        "kulkarni_nomizu_has_ricci_sigma": max(ricci_errors),
        "normalized_2B_is_isometry": normalized_gram_error,
        "complex_source_equals_weighted_real_source": float(
            np.linalg.norm(source_complex - source_real)
        ),
        "quadratic_source_trace": abs(float(np.trace(sigma_source))),
    }
    assert max(errors.values()) < TOL
    assert np.max(np.abs(singular_values - 0.5)) < TOL
    return {
        "domain": "Sym^2_0(R^4)=4+5",
        "codomain": "Hom(Lambda^2_+,Lambda^2_-)=4+5",
        "dimension": 9,
        "B_singular_values": [float(x) for x in singular_values],
        "normalized_map": "2B is an isometric isomorphism",
        "source_formula": "Sigma=[3 xx^T+5 yy^T]_0",
        "identity_errors": errors,
        "status": (
            "Exact four-dimensional curvature algebra and exact hidden-source typing; "
            "identifying the source with physical stress or curvature requires a "
            "dynamical connection and normalization."
        ),
    }


def quaternion_multiply(first: np.ndarray, second: np.ndarray) -> np.ndarray:
    a, b, c, d = first
    e, f, g, h = second
    return np.array(
        [
            a * e - b * f - c * g - d * h,
            a * f + b * e + c * h - d * g,
            a * g - b * h + c * e + d * f,
            a * h + b * g - c * f + d * e,
        ]
    )


def hopf_spacetime_audit() -> dict[str, object]:
    """Check the regular five-frame and quaternionic Hopf quotient identities."""
    projector = np.eye(5) - np.ones((5, 5)) / 5.0
    eigenvalues, eigenvectors = np.linalg.eigh(projector)
    hyperplane = eigenvectors[:, eigenvalues > 0.5]
    frame = math.sqrt(5.0 / 4.0) * hyperplane
    gram = frame @ frame.T
    expected_gram = 1.25 * np.eye(5) - 0.25 * np.ones((5, 5))
    rng = np.random.default_rng(144)
    pair = rng.normal(size=8)
    pair /= np.linalg.norm(pair)
    q1, q2 = pair[:4], pair[4:]
    fibre = rng.normal(size=4)
    fibre /= np.linalg.norm(fibre)

    def hopf(first: np.ndarray, second: np.ndarray) -> np.ndarray:
        conjugate = second * np.array([1.0, -1.0, -1.0, -1.0])
        return np.concatenate(
            [
                np.array([np.dot(first, first) - np.dot(second, second)]),
                2.0 * quaternion_multiply(first, conjugate),
            ]
        )

    image = hopf(q1, q2)
    shifted = hopf(quaternion_multiply(q1, fibre), quaternion_multiply(q2, fibre))
    errors = {
        "simplex_frame_gram": float(np.linalg.norm(gram - expected_gram)),
        "simplex_frame_sum": float(np.linalg.norm(np.sum(frame, axis=0))),
        "simplex_tight_frame": float(np.linalg.norm(frame.T @ frame - 1.25 * np.eye(4))),
        "hopf_image_unit_sphere": abs(float(np.dot(image, image)) - 1.0),
        "right_SU2_fibre_invariance": float(np.linalg.norm(image - shifted)),
    }
    assert max(errors.values()) < TOL
    return {
        "tetrahedral_frames": 5,
        "mutual_inner_product": -0.25,
        "tight_frame_constant": 1.25,
        "hopf_quotient": "S^7/SU(2)=HP^1=S^4",
        "local_chart_dimension": 4,
        "identity_errors": errors,
        "status": (
            "An exact regular-simplex frame and an exact local quaternionic quotient; "
            "a globally glued Lorentzian spacetime and dynamics remain additional steps."
        ),
    }


def portal_audit() -> dict[str, object]:
    squared_small = (20.0 - 8.0 * math.sqrt(5.0)) / 15.0
    squared_large = (20.0 + 8.0 * math.sqrt(5.0)) / 15.0
    ratio_squared = squared_large / squared_small
    ratio_amplitude = math.sqrt(ratio_squared)
    errors = {
        "squared_ratio_phi_six": abs(ratio_squared - PHI**6),
        "amplitude_ratio_phi_cubed": abs(ratio_amplitude - PHI**3),
    }
    assert max(errors.values()) < TOL
    return {
        "mixed_portal_singular_values_squared": [squared_small, squared_large],
        "amplitude_ratio": ratio_amplitude,
        "squared_ratio": ratio_squared,
        "identity_errors": errors,
        "status": "Exact algebraic consequences of the previously recovered mixed-quartet portal spectrum.",
    }


S = np.array(
    [
        [0, -1, 1, -1, 1, -1],
        [-1, 0, 1, -1, -1, 1],
        [1, 1, 0, -1, 1, 1],
        [-1, -1, -1, 0, 1, 1],
        [1, -1, 1, 1, 0, 1],
        [-1, 1, 1, 1, 1, 0],
    ],
    dtype=float,
)

C_OUTER = np.array(
    [
        [0, 0, 0, 0, 1, 0],
        [1, 0, 0, 0, 0, 0],
        [0, 1, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, -1],
        [0, 0, 0, 1, 0, 0],
    ],
    dtype=float,
)


def outer_lorentz_audit() -> dict[str, object]:
    b = S / math.sqrt(5.0)
    j = np.linalg.matrix_power(C_OUTER, 3)
    identities = {
        "S2_minus_5I": np.linalg.norm(S @ S - 5.0 * np.eye(6)),
        "C6_plus_I": np.linalg.norm(np.linalg.matrix_power(C_OUTER, 6) + np.eye(6)),
        "C12_minus_I": np.linalg.norm(np.linalg.matrix_power(C_OUTER, 12) - np.eye(6)),
        "C_reverses_wedge_form": np.linalg.norm(C_OUTER.T @ b @ C_OUTER + b),
        "J2_plus_I": np.linalg.norm(j @ j + np.eye(6)),
        "J_orthogonal": np.linalg.norm(j.T @ j - np.eye(6)),
        "J_B_self_adjoint": np.linalg.norm(j.T @ b - b @ j),
        "J_B_anti_isometry": np.linalg.norm(j.T @ b @ j + b),
    }
    assert max(identities.values()) < TOL
    signature = Counter(int(np.sign(x)) for x in np.linalg.eigvalsh(b))
    return {
        "wedge_form_signature": {"positive": signature[1], "negative": signature[-1]},
        "C_order": 12,
        "J_matrix": j.astype(int).tolist(),
        "residuals": {key: float(value) for key, value in identities.items()},
        "mathematical_conclusion": (
            "J=C^3 is a wedge-compatible complex structure on Lambda^2(V4); "
            "it determines a Lorentzian conformal Hodge structure, not an absolute scale."
        ),
    }


def vortex_audit() -> dict[str, object]:
    cycle = []
    x = 1
    for _ in range(6):
        cycle.append(x)
        x = (2 * x) % 9
    return {
        "units_mod_9": sorted(x for x in range(9) if math.gcd(x, 9) == 1),
        "doubling_cycle": cycle + [cycle[0]],
        "order_of_2_mod_9": 6,
        "square_subgroup": sorted({(x * x) % 9 for x in cycle}),
        "conclusion": "U(9)=<2> is C6, matching the projective outer cycle; this does not test primality.",
    }


def engine_audit() -> dict[str, object]:
    r_star = 9.0 / 13.0
    theta = math.pi * (3.0 - math.sqrt(5.0))
    radial_multiplier = 5.0 - 4.0 * math.pi / math.e
    seeds = [0.03, 0.1, 0.4, 0.68, 0.95, 1.2]
    finals = []
    for radius in seeds:
        angle = 0.123
        z = radius * np.exp(1j * angle)
        for _ in range(5000):
            r = abs(z)
            factor = math.pi / math.e - (math.pi / math.e - 1.0) * (r / r_star) ** 4
            if r == 0.0:
                break
            z = factor * (z * z / r) * np.exp(1j * theta)
            if not np.isfinite(z.real + z.imag) or abs(z) > 1.0e6:
                break
        finals.append(float(abs(z)))
    return {
        "r_star": r_star,
        "theta": theta,
        "lambda_angular": math.log(2.0),
        "radial_multiplier": radial_multiplier,
        "lambda_radial": math.log(abs(radial_multiplier)),
        "lyapunov_sum": math.log(2.0) + math.log(abs(radial_multiplier)),
        "final_radii": finals,
        "max_lock_error_for_bounded_seeds": float(max(abs(x - r_star) for x in finals[:5])),
        "status": "Exact dynamics of the defined map; the map itself is a constructed model.",
    }


def urt_contraction_audit() -> dict[str, object]:
    alpha = 1.155
    theta_h = 2.4
    beta = 0.235
    kappa = beta * alpha * (1.0 + theta_h)
    return {
        "alpha": alpha,
        "theta_H": theta_h,
        "beta": beta,
        "conditional_Lipschitz_bound": kappa,
        "is_contractive_if_nonlinearity_is_1_Lipschitz": kappa < 1.0,
        "piecewise_phi_jump_at_pi": 1.0,
        "status": (
            "The contraction proof is valid on an invariant |P|<=pi domain, or after replacing the "
            "stated discontinuous saturation by a globally Lipschitz one; it is not global as written."
        ),
    }


def response_audit() -> dict[str, object]:
    d, v, e, f, n, q, h = 3, 12, 30, 20, 13, 5, 8
    gamma = 1.0 / 81.0
    d_star = (1.0 - gamma) * math.pi / (n * PHI)
    d_cl = d / f
    delta = d_cl - d_star
    ws = 9.0 / 5.0
    alpha_inverse = (
        n * n
        - e
        - (d - 1)
        + delta * (n + ws - (1.0 + gamma) / d)
        - delta**2 * (n - d - 1) / (q * n)
    )
    return {
        "primitives": {
            "D": d,
            "V": v,
            "E": e,
            "F": f,
            "N": n,
            "q": q,
            "h": h,
            "gamma": gamma,
            "d_star": d_star,
            "d_cl": d_cl,
            "Delta": delta,
            "eta_Delta": -math.log(delta),
        },
        "alpha_inverse_response": alpha_inverse,
        "quark": {
            "s12": 1.0 / math.sqrt(f - 1.0 / h),
            "s23": delta * (PHI**6 - 1.0),
            "s13": d * delta / 2.0,
            "J": gamma * delta * (1.0 + ws * gamma),
        },
        "lepton": {
            "sin2_theta12": 1.0 / d - v * delta,
            "sin2_theta23": 0.5 + f * delta + gamma,
            "sin2_theta13": 2.0 * gamma * (d_star / d_cl) ** 2 * (1.0 - f * delta),
            "J": -n * delta,
        },
        "status": (
            "Arithmetic consequence of the August-21 response-routing axiom.  The finite action "
            "does not yet derive the route-to-observable assignments, so these are conditional outputs."
        ),
    }


def hypercharge_audit() -> dict[str, object]:
    """Derive the standard charge ratios from explicitly stated assumptions."""
    higgs = Fraction(1, 2)
    lepton = -higgs
    quark = higgs / 3
    up = quark + higgs
    down = quark - higgs
    electron = lepton - higgs
    sterile = lepton + higgs
    anomalies = {
        "SU3_squared_U1": 2 * quark - up - down,
        "SU2_squared_U1": 3 * quark + lepton,
        "gravity_squared_U1": 6 * quark - 3 * up - 3 * down + 2 * lepton - electron - sterile,
        "U1_cubed": 6 * quark**3 - 3 * up**3 - 3 * down**3 + 2 * lepton**3 - electron**3 - sterile**3,
    }
    k_y = 6 * quark**2 + 3 * up**2 + 3 * down**2 + 2 * lepton**2 + electron**2 + sterile**2
    k_two = Fraction(3, 2) + Fraction(1, 2)
    k_three = Fraction(2, 2) + Fraction(1, 2) + Fraction(1, 2)
    assert all(value == 0 for value in anomalies.values())
    assert k_y == Fraction(10, 3)
    assert k_two == k_three == 2
    return {
        "assumptions": [
            "the Standard-Model multiplet representations",
            "one Higgs doublet and invariant Yukawa couplings",
            "a neutral right-handed neutrino",
            "SU(2)^2 U(1) anomaly cancellation",
            "the convention Y_H=1/2",
        ],
        "hypercharges": {
            "q_L": str(quark),
            "u_R": str(up),
            "d_R": str(down),
            "ell_L": str(lepton),
            "e_R": str(electron),
            "nu_R": str(sterile),
            "H": str(higgs),
        },
        "anomaly_residuals": {key: str(value) for key, value in anomalies.items()},
        "bare_gauge_traces": {"kY": str(k_y), "k2": str(k_two), "k3": str(k_three)},
        "bare_sin2_theta_W": str(k_two / (k_two + k_y)),
        "status": (
            "An exact conditional anomaly calculation. The multiplets, Higgs, "
            "sterile state and normalization were supplied, not derived from A5 alone."
        ),
    }


def higgs_spectral_audit() -> dict[str, object]:
    primitive = frozen_primitives()
    delta = float(primitive["Delta"])
    gamma = float(primitive["gamma"])
    alpha_inverse = float(response_audit()["alpha_inverse_response"])
    a_trace = 16.0 * (100.0 + 183.0 * delta**2) / 75.0
    b_trace = (
        976.0 / 27.0
        + (384.0 / 5.0) * delta
        + (99584.0 / 225.0) * delta**2
        + (1728.0 / 5.0) * delta**3
        + (420592.0 / 1875.0) * delta**4
    )
    ratio = b_trace / a_trace**2
    sin2_response = 3.0 / 13.0
    g2_squared = (4.0 * math.pi / alpha_inverse) / sin2_response
    target_lambda = 1.0 / 8.0 + gamma / 3.0
    required_normalization = target_lambda / (g2_squared * ratio)
    lambda_if_four = 4.0 * g2_squared * ratio
    relative_mismatch = (target_lambda - lambda_if_four) / target_lambda
    assert required_normalization > 4.0
    assert relative_mismatch > 0.01
    return {
        "finite_trace_a": a_trace,
        "finite_trace_b": b_trace,
        "b_over_a_squared": ratio,
        "assumed_response_sin2_theta_W": sin2_response,
        "g2_squared_under_that_assumption": g2_squared,
        "target_response_lambda_H": target_lambda,
        "required_trace_normalization": required_normalization,
        "lambda_H_if_normalization_is_four": lambda_if_four,
        "relative_mismatch_if_normalization_is_four": relative_mismatch,
        "status": (
            "The traces are exact for the supplied finite operator. Exact Higgs "
            "closure fails until a single action fixes the common gauge/Higgs trace normalization."
        ),
    }


def cosmology_response_audit() -> dict[str, object]:
    primitive = frozen_primitives()
    delta = float(primitive["Delta"])
    gamma = float(primitive["gamma"])
    d_star = float(primitive["d_star"])
    jq = gamma * delta * (1.0 + 9.0 * gamma / 5.0)
    theta_qcd = (jq / math.pi) ** 2
    omega_m = Fraction(6, 19)
    omega_lambda = Fraction(13, 19)
    omega_b = omega_m * Fraction(2, 13)
    omega_c = omega_m * Fraction(11, 13)
    tensor_ratio = 16.0 * gamma * delta
    assert omega_m + omega_lambda == 1
    assert omega_b + omega_c == omega_m
    assert omega_c / omega_b == Fraction(11, 2)
    return {
        "J_Q": jq,
        "theta_QCD_response": theta_qcd,
        "baryon_to_photon_ratio_response": 6.0 * theta_qcd,
        "scalar_amplitude_response": 21.0 * theta_qcd,
        "log_1e10_As": math.log(1.0e10 * 21.0 * theta_qcd),
        "Omega_m": float(omega_m),
        "Omega_Lambda": float(omega_lambda),
        "Omega_b": float(omega_b),
        "Omega_c": float(omega_c),
        "Omega_dark": float(omega_lambda + omega_c),
        "Omega_c_over_Omega_b": float(omega_c / omega_b),
        "n_s": 1.0 - 3.0 * gamma + delta,
        "running_alpha_s": -(delta**2),
        "tensor_to_scalar_ratio_r": tensor_ratio,
        "tensor_tilt_n_t": -tensor_ratio / 8.0,
        "tau_reionization": 1.0 / 19.0 + delta / math.pi,
        "sigma_8_response": math.cos(math.pi / 5.0),
        "neutrino_mass_squared_ratio_response": (d_star + d_star**2) ** 2,
        "status": (
            "Exactly reproducible arithmetic within the response-slot prescription. "
            "No Friedmann evolution, inflationary action, baryogenesis dynamics, "
            "dark-matter species, renormalization scale or statistical fit follows from this arithmetic alone."
        ),
    }


def mass_response_audit() -> dict[str, object]:
    primitive = frozen_primitives()
    delta = float(primitive["Delta"])
    d_star = float(primitive["d_star"])
    d_classical = float(primitive["d_classical"])
    d, q, h, edges, vertices = 3.0, 5.0, 8.0, 30.0, 12.0
    rail = d_star / d_classical
    masses = {
        "top": 1.0,
        "bottom": 2.0 * q * delta,
        "tau": (d + 1.0) * delta,
        "charm": d * delta,
        "strange": (2.0 * q * delta) * (3.0 * d * delta),
        "muon": ((d + 1.0) * delta) * (d * h * delta),
        "up": 2.0 * delta**2,
        "down": (2.0 * q * delta) * (2.0 * d * edges * delta**2),
        "electron": ((d + 1.0) * delta) * (2.0 * d * h * delta**2 * rail**2),
    }
    nu3 = d * delta**q
    nu2_over_nu3 = math.sqrt(vertices * delta)
    nu1_over_nu3 = d * delta**3
    return {
        "mass_ratios_to_top": masses,
        "neutrino_m3_over_top": nu3,
        "neutrino_m2_over_m3": nu2_over_nu3,
        "neutrino_m1_over_m3": nu1_over_nu3,
        "neutrino_dm21_over_dm31": (
            nu2_over_nu3**2 - nu1_over_nu3**2
        ) / (1.0 - nu1_over_nu3**2),
        "status": (
            "Reproducible dimensionless recursive-route outputs. They are not "
            "yet eigenvalues of a uniquely selected finite Dirac operator, and "
            "absolute masses require an independently supplied mass scale."
        ),
    }


def gravity_normalization_audit() -> dict[str, object]:
    primitive = frozen_primitives()
    delta = float(primitive["Delta"])
    d_star = float(primitive["d_star"])
    d_classical = float(primitive["d_classical"])
    gamma = float(primitive["gamma"])
    eta = float(primitive["eta_Delta"])
    alpha = 1.0 / float(response_audit()["alpha_inverse_response"])
    alpha_g_first = alpha**21 * (4.0 / 3.0) * (d_star / d_classical) * (1.0 - gamma / 8.0)
    alpha_g_second = (
        alpha**21
        * (4.0 / 3.0)
        * (d_star / d_classical)
        * (1.0 - (delta / d_classical) / (13.0 - 2.0 - gamma))
    )
    relative_disagreement = abs(alpha_g_first - alpha_g_second) / alpha_g_first
    assert relative_disagreement > 1.0e-5
    return {
        "entropy_susceptibility_dS_over_kB_dp_exhaust": 2.0 * eta,
        "candidate_alpha_G_formula_one": alpha_g_first,
        "candidate_alpha_G_formula_two": alpha_g_second,
        "relative_candidate_disagreement": relative_disagreement,
        "spectral_dimensionless_G_Lambda_cut_squared_over_gU_squared": eta / (16.0 * math.pi),
        "spectral_kernel_moment_ratio_f2_over_f0": 1.0 / (2.0 * eta),
        "required_missing_bridge": (
            "2 k_B eta_Delta (dp_exhaust/dA)=k_B/(4 ell_*^2) requires a physical "
            "cell area, an area/probability map, an energy map and local equilibrium."
        ),
        "einstein_equation_status": (
            "The Clausius/Raychaudhuri and Lovelock routes yield Einstein form only "
            "after their physical hypotheses and area normalization are independently assumed."
        ),
        "newton_constant_derived": False,
    }


def spin_two_projector_audit() -> dict[str, object]:
    vertices, adjacency = icosahedral_shell()
    centred = np.zeros((13, 13))
    centred[1:, 1:] = adjacency
    centred[0, 1:] = centred[1:, 0] = 1.0
    laplacian = np.diag(centred.sum(axis=1)) - centred
    values, vectors = np.linalg.eigh(laplacian)
    fiveplet = vectors[:, np.isclose(values, 7.0, atol=TOL)]
    projector = fiveplet @ fiveplet.T
    green_block = projector / 7.0
    shell = green_block[1:, 1:]
    antipodal = np.linalg.norm(vertices[:, None, :] + vertices[None, :, :], axis=2) < TOL
    high_mask = antipodal | np.eye(12, dtype=bool)
    low_mask = ~high_mask
    errors = {
        "projector_rank_five": abs(float(np.trace(projector)) - 5.0),
        "central_row_zero": float(np.linalg.norm(green_block[0, :])),
        "diagonal_and_antipodal_value": float(np.max(np.abs(shell[high_mask] - 5.0 / 84.0))),
        "other_shell_value": float(np.max(np.abs(shell[low_mask] + 1.0 / 84.0))),
    }
    assert max(errors.values()) < TOL
    return {
        "laplacian_eigenvalue": 7,
        "projector_rank": 5,
        "central_source_response": 0.0,
        "diagonal_or_antipodal_kernel": "5/84",
        "all_other_shell_kernel": "-1/84",
        "identity_errors": errors,
        "newtonian_radial_green_function": False,
        "status": (
            "The fiveplet is an exact angular spin-2 carrier, but its finite projector "
            "has no central response and changes sign; a 1/r potential needs an additional continuum field equation."
        ),
    }


def regular_black_hole_audit() -> dict[str, object]:
    """Verify consequences of the historical chosen regular-core metric ansatz."""
    a = float(frozen_primitives()["d_star"])

    def lapse(r: float) -> float:
        return 1.0 - r**2 / (r**2 + a**2) ** 1.5

    def derivative(r: float) -> float:
        return r * (r**2 - 2.0 * a**2) / (r**2 + a**2) ** 2.5

    def second_derivative(r: float) -> float:
        return (-2.0 * r**4 + 11.0 * a**2 * r**2 - 2.0 * a**4) / (r**2 + a**2) ** 3.5

    def bisect(left: float, right: float) -> float:
        assert lapse(left) * lapse(right) < 0.0
        for _ in range(100):
            mid = (left + right) / 2.0
            if lapse(left) * lapse(mid) <= 0.0:
                right = mid
            else:
                left = mid
        return (left + right) / 2.0

    minimum = math.sqrt(2.0) * a
    inner = bisect(1.0e-14, minimum)
    outer = bisect(minimum, 3.0)
    errors = []
    for r in (0.03, a, 0.4, 1.0, 2.0):
        h = r**2 + a**2
        g_tt = (r * derivative(r) + lapse(r) - 1.0) / r**2
        g_theta = second_derivative(r) / 2.0 + derivative(r) / r
        scalar_r = -second_derivative(r) - 4.0 * derivative(r) / r + 2.0 * (1.0 - lapse(r)) / r**2
        errors.extend(
            [
                abs(g_tt + 3.0 * a**2 / h**2.5),
                abs(g_theta - 3.0 * a**2 * (3.0 * r**2 - 2.0 * a**2) / (2.0 * h**3.5)),
                abs(scalar_r - 3.0 * a**2 * (4.0 * a**2 - r**2) / h**3.5),
            ]
        )
    assert max(errors) < 1.0e-10
    assert abs(lapse(inner)) < TOL and abs(lapse(outer)) < TOL
    critical = 2.0 / (3.0 * math.sqrt(3.0))
    return {
        "units": "r_s=G=c=1",
        "chosen_a_over_r_s": a,
        "critical_a_over_r_s": critical,
        "two_horizons_exist": a < critical,
        "inner_horizon_over_r_s": inner,
        "outer_horizon_over_r_s": outer,
        "inner_surface_gravity_times_r_s": abs(derivative(inner)) / 2.0,
        "outer_surface_gravity_times_r_s": abs(derivative(outer)) / 2.0,
        "core_de_Sitter_Lambda_times_r_s_squared": 3.0 / a**3,
        "core_R_times_r_s_squared": 12.0 / a**3,
        "core_Kretschmann_times_r_s_fourth": 24.0 / a**6,
        "maximum_einstein_tensor_formula_error": max(errors),
        "weak_energy_condition": "satisfied",
        "strong_energy_condition": "violated for r<sqrt(2/3) a",
        "dominant_energy_condition": "violated for r>2a",
        "status": (
            "Exact metric and stress-tensor consequences of a historical chosen ansatz. "
            "The URT action has not derived this metric, its source, or its physical scale."
        ),
    }


def fluid_isotropy_audit() -> dict[str, object]:
    vertices, _ = icosahedral_shell()
    directions = vertices / np.linalg.norm(vertices, axis=1, keepdims=True)
    rest_weight = 2.0 / 5.0
    direction_weight = 1.0 / 20.0
    second = direction_weight * np.einsum("ai,aj->ij", directions, directions)
    third = direction_weight * np.einsum("ai,aj,ak->ijk", directions, directions, directions)
    fourth = direction_weight * np.einsum("ai,aj,ak,al->ijkl", directions, directions, directions, directions)
    eye = np.eye(3)
    expected_fourth = (        np.einsum("ij,kl->ijkl", eye, eye)
        + np.einsum("ik,jl->ijkl", eye, eye)
        + np.einsum("il,jk->ijkl", eye, eye)
    ) / 25.0
    errors = {
        "weight_normalization": abs(rest_weight + 12.0 * direction_weight - 1.0),
        "second_moment": float(np.linalg.norm(second - np.eye(3) / 5.0)),
        "odd_third_moment": float(np.linalg.norm(third)),
        "fourth_moment": float(np.linalg.norm(fourth - expected_fourth)),
    }
    assert max(errors.values()) < TOL
    return {
        "velocity_directions": 13,
        "rest_weight": rest_weight,
        "shell_weight_each": direction_weight,
        "c_s_squared_over_c_squared": 1.0 / 5.0,
        "pressure_if_BGK_closure_assumed": "p=rho c^2/5",
        "kinematic_viscosity_if_BGK_closure_assumed": "nu=c^2 tau/5",
        "identity_errors": errors,
        "status": (
            "Exact second/fourth isotropy of the icosahedral velocity frame. "
            "Navier-Stokes equations require a BGK/Chapman-Enskog continuum assumption."
        ),
    }


def born_refinement_audit() -> dict[str, object]:
    rng = np.random.default_rng(13)
    amplitudes = rng.normal(size=9) + 1j * rng.normal(size=9)
    probabilities = abs(amplitudes) ** 2 / np.sum(abs(amplitudes) ** 2)
    groups = [probabilities[:2], probabilities[2:6], probabilities[6:]]
    coarse = np.array([np.sum(group) for group in groups])
    errors = {
        "fine_normalization": abs(float(np.sum(probabilities)) - 1.0),
        "coarse_normalization": abs(float(np.sum(coarse)) - 1.0),
        "refinement_additivity": abs(float(np.sum(coarse)) - float(np.sum(probabilities))),
    }
    assert max(errors.values()) < TOL
    return {
        "sample_fine_probabilities": [float(value) for value in probabilities],
        "sample_coarse_probabilities": [float(value) for value in coarse],
        "identity_errors": errors,
        "conditional_theorem": (
            "Given complex norm-squared branch weights, phase independence, "
            "noncontextual refinement additivity, continuity and normalization, F(x)=x."
        ),
        "status": (
            "Conditional Born-rule consistency, not a derivation of Hilbert kinematics, "
            "unitary evolution, quantum fields, or measurement."
        ),
    }


def main() -> None:
    report = {
        "frozen_primitives": frozen_primitives(),
        "icosahedral_geometry": icosahedral_spectrum(),
        "A5_representations": representation_audit(),
        "hidden_entropy": hidden_entropy_audit(),
        "information_free_energy": gibbs_master_audit(),
        "hopf_local_spacetime": hopf_spacetime_audit(),
        "mixed_quartet_portal": portal_audit(),
        "outer_lorentz_structure": outer_lorentz_audit(),
        "normalized_ricci_map": ricci_map_audit(),
        "conditional_hypercharge": hypercharge_audit(),
        "higgs_trace_normalization": higgs_spectral_audit(),
        "gravity_normalization": gravity_normalization_audit(),
        "spin_two_newton_no_go": spin_two_projector_audit(),
        "historical_regular_black_hole": regular_black_hole_audit(),
        "icosahedral_fluid_isotropy": fluid_isotropy_audit(),
        "conditional_born_refinement": born_refinement_audit(),
        "vortex_group": vortex_audit(),
        "bounded_chaos_engine": engine_audit(),
        "URT_contraction": urt_contraction_audit(),
        "response_model": response_audit(),
        "response_mass_tree": mass_response_audit(),
        "response_cosmology": cosmology_response_audit(),
    }
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()