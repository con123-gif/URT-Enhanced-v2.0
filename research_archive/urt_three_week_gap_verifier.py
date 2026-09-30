#!/usr/bin/env python3
"""Independent checks for the URT/Cathedral branches omitted after 22 Aug 2026.

This verifier separates exact finite mathematics from physical interpretation.
It checks:

1. the A4 root-shell / icosahedral-face A5 permutation representation;
2. why that correspondence is not a Euclidean isometry;
3. the A4*/A4 = Z5 lattice quotient;
4. the outer six-axis return and entropy attenuation identity;
5. the golden normal-mode frequency ratio;
6. the exact mod-9 / 2^a 3^b arithmetic; and
7. the numerical entropy, engine, and resonance-detuning constants.
"""

from __future__ import annotations

import itertools
import json
import math

import numpy as np


TOL = 1.0e-11
PHI = (1.0 + math.sqrt(5.0)) / 2.0
GAMMA = 1.0 / 81.0
D_STAR = (1.0 - GAMMA) * math.pi / (13.0 * PHI)
D_CLASSICAL = 3.0 / 20.0
DELTA = D_CLASSICAL - D_STAR
ETA_DELTA = -math.log(DELTA)


def even_permutations_five() -> list[tuple[int, ...]]:
    def parity(p: tuple[int, ...]) -> int:
        inversions = sum(
            int(p[i] > p[j]) for i in range(5) for j in range(i + 1, 5)
        )
        return inversions % 2

    return [p for p in itertools.permutations(range(5)) if parity(p) == 0]


def cycle_type(p: tuple[int, ...]) -> tuple[int, ...]:
    seen = set()
    cycles = []
    for i in range(len(p)):
        if i in seen:
            continue
        j = i
        length = 0
        while j not in seen:
            seen.add(j)
            length += 1
            j = p[j]
        cycles.append(length)
    return tuple(sorted(cycles, reverse=True))


def a4_root_representation_audit() -> dict[str, object]:
    # A4 roots are the 20 ordered differences e_i-e_j, i != j.
    roots = []
    labels = []
    for i in range(5):
        for j in range(5):
            if i == j:
                continue
            root = np.zeros(5)
            root[i] = 1.0
            root[j] = -1.0
            roots.append(root / math.sqrt(2.0))
            labels.append((i, j))
    roots = np.asarray(roots)

    group = even_permutations_five()
    assert len(group) == 60
    class_counts: dict[tuple[int, ...], int] = {}
    fixed_ordered_pairs: dict[tuple[int, ...], set[int]] = {}
    for p in group:
        kind = cycle_type(p)
        class_counts[kind] = class_counts.get(kind, 0) + 1
        fixed = sum(int(p[i] == i and p[j] == j) for i, j in labels)
        fixed_ordered_pairs.setdefault(kind, set()).add(fixed)

    # A5 character order: 1, (ab)(cd), (abc), 5A, 5B.
    root_character = np.array([20.0, 0.0, 2.0, 0.0, 0.0])
    shell_character = np.array([12.0, 0.0, 0.0, 2.0, 2.0])
    hidden_character = root_character - shell_character
    class_sizes = np.array([1.0, 15.0, 20.0, 12.0, 12.0])
    characters = {
        "1": np.array([1.0, 1.0, 1.0, 1.0, 1.0]),
        "3": np.array([3.0, -1.0, 0.0, PHI, 1.0 - PHI]),
        "3p": np.array([3.0, -1.0, 0.0, 1.0 - PHI, PHI]),
        "4": np.array([4.0, 0.0, 1.0, -1.0, -1.0]),
        "5": np.array([5.0, 1.0, -1.0, 0.0, 0.0]),
    }

    def decompose(character: np.ndarray) -> dict[str, int]:
        answer = {}
        for name, irreducible in characters.items():
            value = float(np.dot(class_sizes, character * irreducible) / 60.0)
            rounded = int(round(value))
            assert abs(value - rounded) < TOL
            if rounded:
                answer[name] = rounded
        return answer

    # The root stabilizer fixes an ordered pair and is the even permutation
    # group of the three remaining letters: C3.  The 20 faces are likewise
    # A5/C3.  This proves an A5-set isomorphism, but not a metric isometry.
    root_stabilizer_size = sum(
        int(p[3] == 3 and p[4] == 4) for p in group
    )

    # Actual icosahedral face centres, to make the metric distinction explicit.
    vertices = []
    for a in (-1.0, 1.0):
        for b in (-PHI, PHI):
            vertices.append((0.0, a, b))
            vertices.append((a, b, 0.0))
            vertices.append((b, 0.0, a))
    vertices = np.asarray(vertices)
    distances = np.linalg.norm(vertices[:, None, :] - vertices[None, :, :], axis=2)
    edge = np.min(distances[distances > TOL])
    adjacency = np.isclose(distances, edge, atol=TOL)
    faces = [
        (i, j, k)
        for i in range(12)
        for j in range(i + 1, 12)
        for k in range(j + 1, 12)
        if adjacency[i, j] and adjacency[i, k] and adjacency[j, k]
    ]
    centres = np.asarray([vertices[list(face)].mean(axis=0) for face in faces])
    centres /= np.linalg.norm(centres, axis=1)[:, None]

    root_gram = roots @ roots.T
    face_gram = centres @ centres.T
    root_dots = sorted(set(np.round(root_gram.flatten(), 12)))
    face_dots = sorted(set(np.round(face_gram.flatten(), 12)))

    cartan_a4 = 2.0 * np.eye(4)
    cartan_a4 += -1.0 * np.eye(4, k=1)
    cartan_a4 += -1.0 * np.eye(4, k=-1)
    cartan_determinant = round(float(np.linalg.det(cartan_a4)))

    t = np.array([1.0, 0.0, 0.0, 0.0])
    lorentz_candidate = np.eye(4) - 2.0 * np.outer(t, t)

    return {
        "A5_order": len(group),
        "cycle_type_counts": {str(k): v for k, v in class_counts.items()},
        "fixed_root_counts_by_cycle_type": {
            str(k): sorted(v) for k, v in fixed_ordered_pairs.items()
        },
        "A4_root_count": len(roots),
        "root_stabilizer_size": root_stabilizer_size,
        "root_orbit": "A5/C3, cardinality 20",
        "face_orbit": "A5/C3, cardinality 20",
        "A5_set_isomorphism": root_stabilizer_size == 3 and len(faces) == 20,
        "root_representation": decompose(root_character),
        "icosahedral_shell_representation": decompose(shell_character),
        "hidden_difference_representation": decompose(hidden_character),
        "representation_identity": "20 = (1+3+3p+5) + (4+4) = 12+8",
        "A4_root_span_rank": int(np.linalg.matrix_rank(roots)),
        "icosahedral_face_centre_span_rank": int(np.linalg.matrix_rank(centres)),
        "Euclidean_isometry_possible": bool(
            np.linalg.matrix_rank(roots) == np.linalg.matrix_rank(centres)
            and root_dots == face_dots
        ),
        "A4_root_inner_products": root_dots,
        "face_centre_inner_products": face_dots,
        "A4_Cartan_determinant": cartan_determinant,
        "dual_quotient": "A4*/A4 is cyclic of order 5",
        "candidate_metric_eigenvalues": np.linalg.eigvalsh(lorentz_candidate).tolist(),
        "status": (
            "The 20 roots and 20 faces are exactly isomorphic as A5-sets and "
            "permutation modules. They are not the same Euclidean point shell. "
            "The Lorentz signature of I-2tt^T is exact after a unit t is supplied; "
            "entropy selection of t and physical lattice spacing are additional hypotheses."
        ),
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


def symmetric_matrix_exponential(matrix: np.ndarray) -> np.ndarray:
    values, vectors = np.linalg.eigh(matrix)
    return vectors @ np.diag(np.exp(values)) @ vectors.T


def resonant_outer_return_audit() -> dict[str, object]:
    identity = np.eye(6)
    l_phi = 5.0 * identity - S
    epsilon = ETA_DELTA / 30.0
    decay = symmetric_matrix_exponential(-epsilon * l_phi)
    transfer = decay @ C_OUTER
    transfer_two = np.linalg.matrix_power(transfer, 2)
    transfer_six = np.linalg.matrix_power(transfer, 6)
    transfer_twelve = np.linalg.matrix_power(transfer, 12)

    s_values, s_vectors = np.linalg.eigh(S)
    plus = s_vectors[:, s_values > 0]
    minus = s_vectors[:, s_values < 0]
    determinant_plus = abs(float(np.linalg.det(plus.T @ transfer_two @ plus)))
    determinant_minus = abs(float(np.linalg.det(minus.T @ transfer_two @ minus)))
    determinant_full = abs(float(np.linalg.det(transfer_two)))

    lambda_low = 5.0 - math.sqrt(5.0)
    lambda_high = 5.0 + math.sqrt(5.0)
    omega_ratio = math.sqrt(lambda_high / lambda_low)

    errors = {
        "S_squared": float(np.linalg.norm(S @ S - 5.0 * identity)),
        "outer_order_six": float(
            np.linalg.norm(np.linalg.matrix_power(C_OUTER, 6) + identity)
        ),
        "outer_order_twelve": float(
            np.linalg.norm(np.linalg.matrix_power(C_OUTER, 12) - identity)
        ),
        "outer_exchanges_laplacian": float(
            np.linalg.norm(C_OUTER @ l_phi @ C_OUTER.T - (10.0 * identity - l_phi))
        ),
        "six_return": float(np.linalg.norm(transfer_six + DELTA * identity)),
        "twelve_return": float(
            np.linalg.norm(transfer_twelve - DELTA**2 * identity)
        ),
        "plus_three_determinant": abs(determinant_plus - DELTA),
        "minus_three_determinant": abs(determinant_minus - DELTA),
        "full_six_determinant": abs(determinant_full - DELTA**2),
        "golden_frequency_ratio": abs(omega_ratio - PHI),
    }
    assert max(errors.values()) < TOL

    return {
        "L_phi_spectrum": [lambda_low, lambda_high],
        "multiplicity_each": 3,
        "epsilon": epsilon,
        "one_step_singular_values": sorted(
            np.linalg.svd(transfer, compute_uv=False).tolist()
        ),
        "exact_two_step_identity": "F^2 = exp(-10 epsilon) C^2",
        "three_dimensional_determinants_of_F2": [
            determinant_plus,
            determinant_minus,
        ],
        "full_six_dimensional_determinant_of_F2": determinant_full,
        "exact_six_return": "F^6 = -Delta I6",
        "exact_twelve_return": "F^12 = Delta^2 I6",
        "frequency_ratio_if_equal_mass_harmonic_dynamics": omega_ratio,
        "generation_weight_interpretation": [1.0, DELTA, DELTA**2],
        "identity_errors": errors,
        "status": (
            "The transfer identities are exact for the defined F. Epsilon is fixed "
            "from the already supplied Delta, so this unifies the outer return with "
            "entropy attenuation but does not independently select Delta. Reading "
            "successive determinant factors as generations is a physical selection rule."
        ),
    }


def vortex_and_prime_lattice_audit() -> dict[str, object]:
    unit_cycle = []
    value = 1
    for _ in range(6):
        unit_cycle.append(value)
        value = (2 * value) % 9

    layer_table = []
    for b in range(4):
        residues = sorted({(pow(2, a, 9) * pow(3, b, 9)) % 9 for a in range(12)})
        layer_table.append({"b": b, "residues": residues})

    mersenne_by_exponent_mod_six = {
        str(a): (pow(2, a, 9) - 1) % 9 for a in range(6)
    }

    return {
        "Z9_partition": [[0], [3, 6], [1, 2, 4, 8, 7, 5]],
        "doubling_cycle": unit_cycle + [unit_cycle[0]],
        "inverse_of_two_mod_9": 5,
        "quadratic_residue_subgroup": sorted({(x * x) % 9 for x in unit_cycle}),
        "two_a_three_b_layers": layer_table,
        "Mersenne_residue_by_exponent_mod_6": mersenne_by_exponent_mod_six,
        "status": (
            "The residue dynamics and 2^a 3^b stratification are exact. Mersenne "
            "residues inherit the doubled cycle shifted by -1, but primality is an "
            "additional property and no prime theorem follows."
        ),
    }


def entropy_engine_resonance_audit() -> dict[str, object]:
    p_exhaust = DELTA**2 / (1.0 + DELTA**2)
    entropy_over_kb = (
        math.log(4.0)
        + math.log1p(DELTA**2)
        - DELTA**2 * math.log(DELTA**2) / (1.0 + DELTA**2)
    )
    r_star = 9.0 / 13.0
    radial_multiplier = 5.0 - 4.0 * math.pi / math.e
    lambda_plus = math.log(2.0)
    lambda_minus = math.log(abs(radial_multiplier))
    t_geo = math.log(2.0) - r_star

    return {
        "d_star": D_STAR,
        "d_classical": D_CLASSICAL,
        "Delta": DELTA,
        "eta_Delta": ETA_DELTA,
        "p_exhaust": p_exhaust,
        "hidden_entropy_over_kB": entropy_over_kb,
        "dS_over_kB_dp_exhaust": 2.0 * ETA_DELTA,
        "engine_radius": r_star,
        "engine_theta": 2.0 * math.pi / PHI**2,
        "engine_lambda_angular": lambda_plus,
        "engine_lambda_radial": lambda_minus,
        "engine_lyapunov_sum": lambda_plus + lambda_minus,
        "T_geo": t_geo,
        "f_res": t_geo / math.log(2.0),
        "status": (
            "The entropy and Lyapunov numbers follow exactly from their definitions. "
            "T_geo=ln(2)-9/13 is a numerical detuning between two defined dimensionless "
            "quantities; calling it a physical loss fraction requires a derived coupling."
        ),
    }


def main() -> None:
    result = {
        "frozen_constants": {
            "phi": PHI,
            "gamma": GAMMA,
            "d_star": D_STAR,
            "d_classical": D_CLASSICAL,
            "Delta": DELTA,
            "eta_Delta": ETA_DELTA,
        },
        "A4_root_icosahedral_face_bridge": a4_root_representation_audit(),
        "resonant_outer_return": resonant_outer_return_audit(),
        "vortex_prime_arithmetic": vortex_and_prime_lattice_audit(),
        "entropy_engine_resonance": entropy_engine_resonance_audit(),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()