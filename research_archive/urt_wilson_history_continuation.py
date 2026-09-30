#!/usr/bin/env python3
"""Coefficient-free URT solenoid-to-Wilson-history continuation.

This certificate performs the next calculation recorded in
``Cathedral_Live_State.md``.  It uses no observed masses or mixing data.

The construction has four layers.

1.  The 20 oriented icosahedral faces are the vertices of the dual
    dodecahedral graph.  Its 60 directed edges form a regular A5-set.
    Adding the central spin sheet gives 120 states, the regular 2I-set.
2.  A directed edge has exactly two non-backtracking successors.  The two
    transitions are the right actions AB and AB^{-1}, where
    A^2=B^3=(AB)^5=-1 in 2I.  Hence the history shift has Perron value 2 and
    topological entropy log(2), exactly matching circle doubling.
3.  Hopf spinors at the 20 dual vertices give a unit-flux dual connection.
    The two branch maps, with weights 1/2, define the covariant transfer and
    a trace-preserving completely positive ordered-history channel.
4.  Because A5 acts freely on the 60 directed dual edges, every edge has a
    unique group frame.  Transporting the stored charge block in that frame
    supplies the previously missing full A5-covariant edge connection.  The
    resulting history operators are tested in a blind joint rank-one species
    action, and a standard four-block KO-6 real completion is certified.

The connected dyadic solenoid cannot map continuously and nontrivially to a
finite discrete history set.  The correct object is therefore the measurable
binary symbolic section together with its 2I frame bundle (a skew product),
not a state-only map from the solenoid.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from pathlib import Path
from typing import Any

import numpy as np
from scipy.linalg import eigh
from scipy.optimize import minimize_scalar, root


ROOT = Path(__file__).resolve().parent
HOPF_PATH = ROOT / "hopf_dirac_continuation.py"


def load_hopf_module():
    spec = importlib.util.spec_from_file_location("hopf_current", HOPF_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {HOPF_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


hopf = load_hopf_module()
audit = hopf.audit


def inverse_perm(p: tuple[int, ...]) -> tuple[int, ...]:
    out = [0] * len(p)
    for i, j in enumerate(p):
        out[j] = i
    return tuple(out)


def matrix(clebsch: np.ndarray, coordinates: np.ndarray) -> np.ndarray:
    return (clebsch @ coordinates).reshape((3, 3), order="F")


def su2_key(u: np.ndarray, decimals: int = 10) -> tuple[float, ...]:
    return tuple(np.round(u.real, decimals).ravel()) + tuple(
        np.round(u.imag, decimals).ravel()
    )


def unitary_order(u: np.ndarray, limit: int = 120) -> int:
    identity = np.eye(u.shape[0], dtype=complex)
    power = identity.copy()
    for n in range(1, limit + 1):
        power = power @ u
        if np.linalg.norm(power - identity) < 1.0e-8:
            return n
    raise RuntimeError("unitary order exceeded limit")


def generated_su2_group(a: np.ndarray, b: np.ndarray) -> list[np.ndarray]:
    identity = np.eye(2, dtype=complex)
    generators = [a, b, a.conj().T, b.conj().T]
    group = {su2_key(identity): identity}
    frontier = [identity]
    while frontier:
        x = frontier.pop()
        for generator in generators:
            y = x @ generator
            key = su2_key(y)
            if key not in group:
                group[key] = y
                frontier.append(y)
    return list(group.values())


def generic_hopf_links(
    points: np.ndarray,
    adjacency: np.ndarray,
    phases: np.ndarray | None = None,
) -> tuple[np.ndarray, np.ndarray]:
    spinors = np.asarray([hopf.spinor(point) for point in points])
    if phases is not None:
        spinors = np.exp(1j * phases)[:, None] * spinors
    links = np.zeros(adjacency.shape, dtype=complex)
    for i in range(len(points)):
        for j in range(len(points)):
            if adjacency[i, j]:
                overlap = np.vdot(spinors[i], spinors[j])
                links[i, j] = overlap / abs(overlap)
    return spinors, links


def grouped_spectrum(values: np.ndarray, tolerance: float = 1.0e-9) -> list[dict[str, Any]]:
    groups: list[list[float | int]] = []
    for value in np.sort(np.asarray(values, dtype=float)):
        if not groups or abs(value - float(groups[-1][0])) > tolerance:
            groups.append([float(value), 1])
        else:
            groups[-1][1] = int(groups[-1][1]) + 1
    return [
        {"value": float(value), "multiplicity": int(multiplicity)}
        for value, multiplicity in groups
    ]


def fiveplet_basis() -> list[np.ndarray]:
    basis = [
        np.diag([1.0, -1.0, 0.0]) / math.sqrt(2.0),
        np.diag([1.0, 1.0, -2.0]) / math.sqrt(6.0),
    ]
    for i, j in ((0, 1), (0, 2), (1, 2)):
        value = np.zeros((3, 3), dtype=float)
        value[i, j] = value[j, i] = 1.0 / math.sqrt(2.0)
        basis.append(value)
    return basis


def five_coords(value: np.ndarray, basis: list[np.ndarray]) -> np.ndarray:
    return np.asarray([np.tensordot(item, value, axes=2) for item in basis])


def solve_oriented_entropy_vacuum(geometry: dict[str, Any]) -> dict[str, Any]:
    """Reproduce the stored 30-edge 5+3 chiral stationary vacuum."""
    basis5 = fiveplet_basis()
    rows = []
    edge_data = []
    for i, j in geometry["edges"]:
        u = geometry["vunit"][i]
        v = geometry["vunit"][j]
        q_u = np.outer(u, u) - np.eye(3) / 3.0
        q_v = np.outer(v, v) - np.eye(3) / 3.0
        x_edge = math.sqrt(15.0) * (q_u + q_v) / 4.0
        m_edge = (u + v) / np.linalg.norm(u + v)
        edge_data.append((i, j, x_edge, m_edge))
        rows.append(np.concatenate([five_coords(x_edge, basis5), m_edge]))
    alphabet = np.asarray(rows)

    i0, j0, _, m0 = edge_data[0]
    u0 = geometry["vunit"][i0]
    v0 = geometry["vunit"][j0]
    d0 = (u0 - v0) / np.linalg.norm(u0 - v0)
    n0 = np.cross(m0, d0)
    n0 /= np.linalg.norm(n0)
    edge_frame = np.column_stack([m0, d0, n0])
    e_a = edge_frame @ np.diag([2.0, -1.0, -1.0]) @ edge_frame.T / math.sqrt(6.0)
    e_b = edge_frame @ np.diag([0.0, 1.0, -1.0]) @ edge_frame.T / math.sqrt(2.0)
    e_c_local = np.array(
        [
            [0.0, 0.0, 0.0],
            [0.0, 0.0, 1.0 / math.sqrt(2.0)],
            [0.0, 1.0 / math.sqrt(2.0), 0.0],
        ]
    )
    e_c = edge_frame @ e_c_local @ edge_frame.T
    fixed_basis = np.column_stack(
        [
            np.concatenate([five_coords(e_a, basis5), np.zeros(3)]),
            np.concatenate([five_coords(e_b, basis5), np.zeros(3)]),
            np.concatenate([five_coords(e_c, basis5), np.zeros(3)]),
            np.concatenate([np.zeros(5), m0]),
        ]
    )

    def mean_field(field: np.ndarray) -> np.ndarray:
        exponents = audit.ETA * (alphabet @ field)
        exponents -= np.max(exponents)
        weights = np.exp(exponents)
        weights /= np.sum(weights)
        return weights @ alphabet

    def hessian(field: np.ndarray) -> np.ndarray:
        exponents = audit.ETA * (alphabet @ field)
        exponents -= np.max(exponents)
        weights = np.exp(exponents)
        weights /= np.sum(weights)
        mean = weights @ alphabet
        centered = alphabet - mean
        covariance = centered.T @ (weights[:, None] * centered)
        return np.eye(8) - audit.ETA * covariance

    def equations(coefficients: np.ndarray) -> np.ndarray:
        field = fixed_basis @ coefficients
        return coefficients - fixed_basis.T @ mean_field(field)

    solution = root(equations, np.array([0.92, 0.37, 0.0, 0.99]))
    if not solution.success:
        raise RuntimeError(f"oriented-vacuum root failed: {solution.message}")
    field = fixed_basis @ solution.x
    residual = np.linalg.norm(field - mean_field(field))
    hessian_eigenvalues = np.linalg.eigvalsh(hessian(field))

    # The full A5 orbit has 30 edge-oriented vacua.
    h_chiral = (
        float(solution.x[0]) * e_a
        + float(solution.x[1]) * e_b
        + float(solution.x[2]) * e_c
    )
    xi_chiral = float(solution.x[3]) * m0
    orbit = []
    for p in geometry["group"]:
        rotation = geometry["rotations"][p]
        rotated = np.concatenate(
            [
                five_coords(rotation @ h_chiral @ rotation.T, basis5),
                rotation @ xi_chiral,
            ]
        )
        if all(np.linalg.norm(rotated - old) > 1.0e-8 for old in orbit):
            orbit.append(rotated)

    exponents = audit.ETA * (alphabet @ field)
    shift = float(np.max(exponents))
    potential = 0.5 * float(field @ field) - (
        shift + math.log(float(np.mean(np.exp(exponents - shift))))
    ) / audit.ETA
    return {
        "alphabet": alphabet,
        "field": field,
        "coefficients": solution.x,
        "stationarity_residual": float(residual),
        "hessian_eigenvalues": hessian_eigenvalues,
        "potential": float(potential),
        "orbit_size": len(orbit),
    }


def oriented_vacuum_stabilizer(
    geometry: dict[str, Any], vacuum: dict[str, Any]
) -> dict[str, Any]:
    """Find the exact residual A5 subgroup of the selected 30-vacuum."""
    basis5 = fiveplet_basis()
    field = vacuum["field"]
    h_matrix = sum(float(field[i]) * basis5[i] for i in range(5))
    xi = field[5:]
    elements = []
    residuals = []
    for p in geometry["group"]:
        rotation = geometry["rotations"][p]
        residual = max(
            np.linalg.norm(rotation @ h_matrix @ rotation.T - h_matrix),
            np.linalg.norm(rotation @ xi - xi),
        )
        if residual < 1.0e-8:
            elements.append(p)
            residuals.append(float(residual))
    if len(elements) * int(vacuum["orbit_size"]) != 60:
        raise RuntimeError("vacuum orbit-stabilizer identity failed")

    nonidentity = [p for p in elements if hopf.order(p) != 1]
    generation_spectra = []
    for p in nonidentity:
        values = np.linalg.eigvalsh(geometry["reps"][p]["3"])
        generation_spectra.append(values.tolist())
    return {
        "elements": elements,
        "order": len(elements),
        "element_orders": sorted(hopf.order(p) for p in elements),
        "max_field_invariance_residual": max(residuals, default=0.0),
        "generation_spectra_nonidentity": generation_spectra,
        "orbit_stabilizer_product": len(elements) * int(vacuum["orbit_size"]),
    }


def build_dual_history(geometry: dict[str, Any]) -> dict[str, Any]:
    faces = [
        hopf.oriented_face(face, geometry["vunit"]) for face in geometry["faces"]
    ]
    face_sets = [frozenset(face) for face in faces]
    face_index = {face: i for i, face in enumerate(face_sets)}

    normals = np.asarray(
        [np.sum(geometry["vunit"][list(face)], axis=0) for face in faces]
    )
    normals /= np.linalg.norm(normals, axis=1)[:, None]

    adjacency = np.zeros((20, 20), dtype=int)
    for i in range(20):
        for j in range(i + 1, 20):
            if len(face_sets[i].intersection(face_sets[j])) == 2:
                adjacency[i, j] = adjacency[j, i] = 1

    pentagons: list[list[int]] = []
    for vertex in range(12):
        incident = [f for f, face in enumerate(faces) if vertex in face]
        cycle = [incident[0]]
        previous = None
        current = incident[0]
        while len(cycle) < 5:
            candidates = [
                f
                for f in incident
                if adjacency[current, f] and f != previous and f not in cycle
            ]
            if not candidates:
                raise RuntimeError("dual pentagon ordering failed")
            # The first vertex has the two cyclic directions; choose a
            # deterministic one and orient the finished pentagon below.
            nxt = min(candidates)
            cycle.append(nxt)
            previous, current = current, nxt
        if (
            np.dot(
                np.cross(normals[cycle[0]], normals[cycle[1]]),
                geometry["vunit"][vertex],
            )
            < 0.0
        ):
            cycle = [cycle[0]] + list(reversed(cycle[1:]))
        pentagons.append(cycle)

    f0 = faces[0]
    i0, j0, k0 = f0
    face_rotation = next(
        p
        for p in geometry["group"]
        if p[i0] == j0 and p[j0] == k0 and p[k0] == i0
    )
    edge_half_turn = next(
        p
        for p in geometry["group"]
        if hopf.order(p) == 2
        and {p[i0], p[j0]} == {i0, j0}
        and frozenset(p[x] for x in f0) != frozenset(f0)
    )
    face_rotation_inverse = inverse_perm(face_rotation)

    adjacent_base_face = tuple(edge_half_turn[x] for x in f0)
    base_state = (
        face_index[frozenset(f0)],
        face_index[frozenset(adjacent_base_face)],
    )
    directed_states = [
        (i, j) for i in range(20) for j in range(20) if adjacency[i, j]
    ]
    state_index = {state: i for i, state in enumerate(directed_states)}

    def state_from_group(p: tuple[int, ...]) -> tuple[int, int]:
        return (
            face_index[frozenset(p[x] for x in f0)],
            face_index[frozenset(p[x] for x in adjacent_base_face)],
        )

    state_frame: dict[tuple[int, int], tuple[int, ...]] = {}
    for p in geometry["group"]:
        state = state_from_group(p)
        if state in state_frame:
            raise RuntimeError("A5 action on directed dual edges is not free")
        state_frame[state] = p
    if set(state_frame) != set(directed_states):
        raise RuntimeError("A5 action does not cover all directed dual edges")

    left_step = hopf.compose(edge_half_turn, face_rotation)
    right_step = hopf.compose(edge_half_turn, face_rotation_inverse)
    successors: dict[str, np.ndarray] = {}
    for label, step in (("left", left_step), ("right", right_step)):
        successor = []
        for state in directed_states:
            successor_state = state_from_group(hopf.compose(state_frame[state], step))
            successor.append(state_index[successor_state])
        successors[label] = np.asarray(successor, dtype=int)
        if len(set(successor)) != 60:
            raise RuntimeError(f"{label} successor is not a permutation")

    for s_index, (a, b) in enumerate(directed_states):
        targets = {
            directed_states[int(successors["left"][s_index])],
            directed_states[int(successors["right"][s_index])],
        }
        expected = {
            (b, c) for c in range(20) if adjacency[b, c] and c != a
        }
        if targets != expected:
            raise RuntimeError("AB/AB^-1 do not give the non-backtracking pair")

    nonbacktracking = np.zeros((60, 60), dtype=float)
    for s in range(60):
        nonbacktracking[s, successors["left"][s]] = 1.0
        nonbacktracking[s, successors["right"][s]] = 1.0

    eigenvalues = np.linalg.eigvals(nonbacktracking)
    spectral_radius = float(np.max(np.abs(eigenvalues)))

    reach = nonbacktracking.astype(bool)
    transitive_closure = reach.copy()
    for _ in range(59):
        transitive_closure |= (
            transitive_closure.astype(int) @ reach.astype(int)
        ) > 0

    return {
        "faces": faces,
        "face_sets": face_sets,
        "face_index": face_index,
        "normals": normals,
        "adjacency": adjacency,
        "pentagons": pentagons,
        "base_face": f0,
        "base_edge": (i0, j0),
        "base_state": base_state,
        "face_rotation": face_rotation,
        "edge_half_turn": edge_half_turn,
        "left_step": left_step,
        "right_step": right_step,
        "states": directed_states,
        "state_index": state_index,
        "state_frame": state_frame,
        "state_from_group": state_from_group,
        "successors": successors,
        "nonbacktracking": nonbacktracking,
        "spectral_radius": spectral_radius,
        "strongly_connected": bool(np.all(transitive_closure)),
    }


def ruelle_history_measure(
    geometry: dict[str, Any],
    history: dict[str, Any],
    vacuum: dict[str, Any],
) -> dict[str, Any]:
    """Equilibrium non-backtracking history measure for the selected vacuum.

    The bare factor 1/2 is the Haar weight of the two inverse branches.  The
    chiral edge potential is then incorporated by the standard
    Ruelle--Perron--Frobenius/Doob construction; no transition coefficient is
    fitted.
    """
    edge_index = {tuple(sorted(edge)): i for i, edge in enumerate(geometry["edges"])}
    state_potential = []
    for a, b in history["states"]:
        shared_edge = tuple(
            sorted(history["face_sets"][a].intersection(history["face_sets"][b]))
        )
        index = edge_index[shared_edge]
        state_potential.append(float(vacuum["alphabet"][index] @ vacuum["field"]))
    state_potential = np.asarray(state_potential)

    scaled = audit.ETA * state_potential
    scale_shift = float(np.max(scaled))
    ruelle = (
        0.5
        * history["nonbacktracking"]
        * np.exp(scaled - scale_shift)[None, :]
    )
    eigenvalues, right_vectors = np.linalg.eig(ruelle)
    index = int(np.argmax(np.abs(eigenvalues)))
    perron_scaled = float(np.real(eigenvalues[index]))
    right = np.real(right_vectors[:, index])
    if np.sum(right) < 0:
        right = -right
    right = np.maximum(right, 0.0)

    left_values, left_vectors = np.linalg.eig(ruelle.T)
    left_index = int(np.argmin(np.abs(left_values - eigenvalues[index])))
    left = np.real(left_vectors[:, left_index])
    if np.sum(left) < 0:
        left = -left
    left = np.maximum(left, 0.0)

    transition = np.zeros_like(ruelle)
    for s in range(60):
        transition[s, :] = ruelle[s, :] * right / (perron_scaled * right[s])
    # The Perron vectors span many orders of magnitude in the selected
    # low-entropy vacuum.  Enforce the exact Markov normalization after the
    # Doob formula, then recover the invariant measure from the normalized
    # transition matrix.  This changes only roundoff, not the construction.
    transition /= transition.sum(axis=1, keepdims=True)
    stationary_values, stationary_vectors = np.linalg.eig(transition.T)
    stationary_index = int(np.argmin(np.abs(stationary_values - 1.0)))
    stationary = np.real(stationary_vectors[:, stationary_index])
    if np.sum(stationary) < 0:
        stationary = -stationary
    stationary = np.maximum(stationary, 0.0)
    stationary /= np.sum(stationary)
    stationarity_residual = np.linalg.norm(stationary @ transition - stationary)
    row_residual = np.linalg.norm(transition.sum(axis=1) - 1.0)
    entropy_terms = np.zeros_like(transition)
    positive = transition > 0
    entropy_terms[positive] = transition[positive] * np.log(transition[positive])
    entropy_rate = -float(np.sum(stationary[:, None] * entropy_terms))

    normalized_ruelle = ruelle / perron_scaled
    perron = perron_scaled * math.exp(scale_shift)
    return {
        "state_potential": state_potential,
        "ruelle_weights": normalized_ruelle,
        "doob_transition": transition,
        "stationary": stationary,
        "perron_value": float(perron),
        "log_perron": float(math.log(perron)),
        "row_stochastic_residual": float(row_residual),
        "stationarity_residual": float(stationarity_residual),
        "entropy_rate": entropy_rate,
        "stationary_minmax": [float(np.min(stationary)), float(np.max(stationary))],
        "left_right_branch_probability_minmax": [
            float(np.min(transition[transition > 0])),
            float(np.max(transition)),
        ],
    }


def scalar_history_symmetry_certificate(
    geometry: dict[str, Any],
    history: dict[str, Any],
    ruelle: dict[str, Any],
    elements: list[tuple[int, ...]],
) -> dict[str, float]:
    """Check invariance of the selected scalar history measure."""
    potential_residual = 0.0
    transfer_residual = 0.0
    doob_residual = 0.0
    stationary_residual = 0.0
    for p in elements:
        face_permutation = tuple(
            history["face_index"][frozenset(p[x] for x in face)]
            for face in history["faces"]
        )
        permutation = np.zeros((60, 60))
        for s, (a, b) in enumerate(history["states"]):
            target = history["state_index"][
                (face_permutation[a], face_permutation[b])
            ]
            permutation[target, s] = 1.0
        potential_residual = max(
            potential_residual,
            float(
                np.linalg.norm(
                    permutation @ ruelle["state_potential"]
                    - ruelle["state_potential"]
                )
            ),
        )
        transfer_residual = max(
            transfer_residual,
            float(
                np.linalg.norm(
                    permutation
                    @ ruelle["ruelle_weights"]
                    @ permutation.T
                    - ruelle["ruelle_weights"]
                )
            ),
        )
        doob_residual = max(
            doob_residual,
            float(
                np.linalg.norm(
                    permutation
                    @ ruelle["doob_transition"]
                    @ permutation.T
                    - ruelle["doob_transition"]
                )
            ),
        )
        stationary_residual = max(
            stationary_residual,
            float(
                np.linalg.norm(
                    permutation @ ruelle["stationary"] - ruelle["stationary"]
                )
            ),
        )
    return {
        "state_potential_invariance_residual": potential_residual,
        "normalized_transfer_invariance_residual": transfer_residual,
        "doob_transition_invariance_residual": doob_residual,
        "stationary_measure_invariance_residual": stationary_residual,
    }


def binary_icosahedral_certificate(
    geometry: dict[str, Any], history: dict[str, Any]
) -> dict[str, Any]:
    a0 = hopf.su2_lift(geometry["rotations"][history["edge_half_turn"]])
    b0 = hopf.su2_lift(geometry["rotations"][history["face_rotation"]])
    identity = np.eye(2, dtype=complex)
    candidates = []
    for sign_a in (-1, 1):
        for sign_b in (-1, 1):
            a = sign_a * a0
            b = sign_b * b0
            residual = max(
                np.linalg.norm(a @ a + identity),
                np.linalg.norm(np.linalg.matrix_power(b, 3) + identity),
                np.linalg.norm(np.linalg.matrix_power(a @ b, 5) + identity),
            )
            candidates.append((residual, a, b, sign_a, sign_b))
    residual, a, b, sign_a, sign_b = min(candidates, key=lambda item: item[0])
    group = generated_su2_group(a, b)
    c6 = [np.linalg.matrix_power(b, n) for n in range(6)]

    # Count right cosets G/C6 numerically.
    remaining = {su2_key(g): g for g in group}
    cosets = 0
    while remaining:
        _, representative = next(iter(remaining.items()))
        coset_keys = {su2_key(representative @ h) for h in c6}
        for key in coset_keys:
            remaining.pop(key, None)
        cosets += 1

    left = a @ b
    right = a @ b.conj().T
    return {
        "presentation_residual": float(residual),
        "chosen_lift_signs": {"A": int(sign_a), "B": int(sign_b)},
        "group_order": len(group),
        "C6_order": len({su2_key(x) for x in c6}),
        "right_cosets_G_over_C6": cosets,
        "orders": {
            "A": unitary_order(a),
            "B": unitary_order(b),
            "AB_left": unitary_order(left),
            "ABinv_right": unitary_order(right),
        },
        "central_relations": {
            "A2_plus_I": float(np.linalg.norm(a @ a + identity)),
            "B3_plus_I": float(np.linalg.norm(np.linalg.matrix_power(b, 3) + identity)),
            "AB5_plus_I": float(
                np.linalg.norm(np.linalg.matrix_power(left, 5) + identity)
            ),
        },
        "regular_state_identity": "20 faces x 3 directed boundary positions x 2 spin sheets = 120 = |2I|",
    }


def dual_hopf_certificate(
    geometry: dict[str, Any], history: dict[str, Any]
) -> tuple[dict[str, Any], np.ndarray, np.ndarray]:
    spinors, links = generic_hopf_links(history["normals"], history["adjacency"])
    phases = []
    for cycle in history["pentagons"]:
        product = 1.0 + 0.0j
        for i, j in zip(cycle, cycle[1:] + cycle[:1]):
            product *= links[i, j]
        phases.append(float(np.angle(product)))
    magnetic_laplacian = 3.0 * np.eye(20) - links
    spectrum = np.linalg.eigvalsh(magnetic_laplacian)
    return (
        {
            "pentagon_phase_minmax": [float(min(phases)), float(max(phases))],
            "pentagon_phase_target": math.pi / 6.0,
            "pentagon_phase_error": float(
                max(abs(phase - math.pi / 6.0) for phase in phases)
            ),
            "total_phase": float(sum(phases)),
            "chern_number": float(sum(phases) / (2.0 * math.pi)),
            "magnetic_spectrum": grouped_spectrum(spectrum),
        },
        spinors,
        links,
    )


def history_transfer(
    history: dict[str, Any], links: np.ndarray
) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    branch_matrices = []
    for label in ("left", "right"):
        operator = np.zeros((60, 60), dtype=complex)
        for s, (a, b) in enumerate(history["states"]):
            operator[s, int(history["successors"][label][s])] = links[a, b]
        branch_matrices.append(operator)
    left, right = branch_matrices
    transfer = 0.5 * (left + right)
    return left, right, transfer


def history_channel_certificate(
    history: dict[str, Any], links: np.ndarray
) -> dict[str, Any]:
    left, right, transfer = history_transfer(history, links)
    identity = np.eye(60)
    kraus_left = left / math.sqrt(2.0)
    kraus_right = right / math.sqrt(2.0)
    trace_preserving = (
        kraus_left.conj().T @ kraus_left
        + kraus_right.conj().T @ kraus_right
    )
    unital = (
        kraus_left @ kraus_left.conj().T
        + kraus_right @ kraus_right.conj().T
    )
    uniform = identity / 60.0
    pushed = (
        kraus_left @ uniform @ kraus_left.conj().T
        + kraus_right @ uniform @ kraus_right.conj().T
    )

    rng = np.random.default_rng(20260828)
    phases = rng.uniform(-math.pi, math.pi, 20)
    _, transformed_links = generic_hopf_links(
        history["normals"], history["adjacency"], phases
    )
    _, _, transformed_transfer = history_transfer(history, transformed_links)
    state_gauge = np.diag(
        [np.exp(1j * phases[a]) for a, _ in history["states"]]
    )
    gauge_residual = np.linalg.norm(
        transformed_transfer
        - state_gauge.conj().T @ transfer @ state_gauge
    )

    return {
        "left_unitarity_residual": float(
            max(
                np.linalg.norm(left.conj().T @ left - identity),
                np.linalg.norm(left @ left.conj().T - identity),
            )
        ),
        "right_unitarity_residual": float(
            max(
                np.linalg.norm(right.conj().T @ right - identity),
                np.linalg.norm(right @ right.conj().T - identity),
            )
        ),
        "kraus_trace_preserving_residual": float(
            np.linalg.norm(trace_preserving - identity)
        ),
        "kraus_unital_residual": float(np.linalg.norm(unital - identity)),
        "uniform_stationary_residual": float(np.linalg.norm(pushed - uniform)),
        "random_gauge_covariance_residual": float(gauge_residual),
        "haar_branch_weights": [0.5, 0.5],
    }


def ordered_history_certificate(
    geometry: dict[str, Any], history: dict[str, Any], links: np.ndarray
) -> dict[str, Any]:
    """Certify the first orientation-sensitive coherent Wilson invariant."""
    left, right, _ = history_transfer(history, links)
    identity = np.eye(60)
    left_fifth = np.linalg.matrix_power(left, 5)
    right_fifth = np.linalg.matrix_power(right, 5)
    left_scalar = np.trace(left_fifth) / 60.0
    right_scalar = np.trace(right_fifth) / 60.0

    def crossed_edge(state: tuple[int, int]) -> frozenset[int]:
        a, b = state
        return history["face_sets"][a].intersection(history["face_sets"][b])

    edge_stabilizers = {}
    for state in history["states"]:
        edge = crossed_edge(state)
        if edge not in edge_stabilizers:
            edge_stabilizers[edge] = {
                p
                for p in geometry["group"]
                if frozenset(p[x] for x in edge) == edge
            }

    intersection_sizes = []
    branch_orbit_sizes = {}
    branch_orbit_verified = {}

    def act_state(p: tuple[int, ...], state: tuple[int, int]) -> tuple[int, int]:
        a, b = state
        return (
            history["face_index"][frozenset(p[x] for x in history["faces"][a])],
            history["face_index"][frozenset(p[x] for x in history["faces"][b])],
        )

    for label in ("left", "right"):
        ordered_pairs = {
            (
                history["states"][s],
                history["states"][int(history["successors"][label][s])],
            )
            for s in range(60)
        }
        branch_orbit_sizes[label] = len(ordered_pairs)
        base_pair = next(iter(ordered_pairs))
        orbit = {
            (act_state(p, base_pair[0]), act_state(p, base_pair[1]))
            for p in geometry["group"]
        }
        branch_orbit_verified[label] = orbit == ordered_pairs
        for source, target in ordered_pairs:
            intersection_sizes.append(
                len(
                    edge_stabilizers[crossed_edge(source)]
                    & edge_stabilizers[crossed_edge(target)]
                )
            )

    left_target = np.exp(-1j * math.pi / 6.0)
    right_target = np.exp(1j * math.pi / 6.0)
    orientation_odd = float(
        np.imag(np.trace(right_fifth - left_fifth)) / 60.0
    )
    orientation_even = float(
        np.real(np.trace(right_fifth + left_fifth)) / 120.0
    )
    return {
        "allowed_ordered_two_steps": 120,
        "A5_orbits": branch_orbit_sizes,
        "A5_orbits_verified": branch_orbit_verified,
        "two_step_edge_stabilizer_intersection_sizes": sorted(
            set(intersection_sizes)
        ),
        "trivial_stabilizer_count": int(
            sum(size == 1 for size in intersection_sizes)
        ),
        "left_fifth_power_phase": float(np.angle(left_scalar)),
        "right_fifth_power_phase": float(np.angle(right_scalar)),
        "left_fifth_scalar_residual": float(
            np.linalg.norm(left_fifth - left_target * identity)
        ),
        "right_fifth_scalar_residual": float(
            np.linalg.norm(right_fifth - right_target * identity)
        ),
        "fifth_phase_target_error": float(
            max(abs(left_scalar - left_target), abs(right_scalar - right_target))
        ),
        "orientation_odd_invariant": orientation_odd,
        "orientation_odd_target": 1.0,
        "orientation_odd_target_error": abs(orientation_odd - 1.0),
        "orientation_even_invariant": orientation_even,
        "orientation_even_target": math.sqrt(3.0) / 2.0,
        "orientation_even_target_error": abs(
            orientation_even - math.sqrt(3.0) / 2.0
        ),
        "interpretation": "The left/right binary branches are the two regular A5 orbits of ordered two-step histories. Their five-step Wilson loops have opposite phases -pi/6 and +pi/6, so the normalized orientation-odd trace is exactly one and changes sign under flux conjugation.",
    }


def twisted_state_action(
    geometry: dict[str, Any],
    history: dict[str, Any],
    face_spinors: np.ndarray,
    p: tuple[int, ...],
) -> np.ndarray:
    face_permutation = tuple(
        history["face_index"][frozenset(p[x] for x in face)]
        for face in history["faces"]
    )
    spin_lift = hopf.su2_lift(geometry["rotations"][p])
    face_phases = []
    for face in range(20):
        overlap = np.vdot(
            face_spinors[face_permutation[face]], spin_lift @ face_spinors[face]
        )
        face_phases.append(overlap / abs(overlap))
    action = np.zeros((60, 60), dtype=complex)
    for s, (a, b) in enumerate(history["states"]):
        target = history["state_index"][(face_permutation[a], face_permutation[b])]
        action[target, s] = face_phases[a]
    return action


def build_base_blocks(
    geometry: dict[str, Any], history: dict[str, Any]
) -> dict[str, Any]:
    c5, m5, e5 = audit.unique_clebsch(
        geometry["group"], geometry["reps"], "5"
    )
    c43, m43, e43 = audit.unique_clebsch(
        geometry["group"], geometry["reps"], "43"
    )
    c45, m45, e45 = audit.unique_clebsch(
        geometry["group"], geometry["reps"], "45"
    )
    b2, j43, j45_archived, charge_meta = audit.build_charge_embeddings(geometry)
    hodge = hopf.equivalence_h(geometry)
    if np.vdot(c43, c45 @ hodge).real < 0:
        hodge = -hodge
    j45 = hodge @ j43

    alphabet = audit.edge_shadow_alphabet(geometry)
    edge_index = {tuple(sorted(edge)): i for i, edge in enumerate(geometry["edges"])}
    base_edge_index = edge_index[tuple(sorted(history["base_edge"]))]
    row = alphabet[base_edge_index]
    raw_base = (
        matrix(c5, row[:5]),
        matrix(c43, row[5:9]),
        matrix(c45, row[9:13]),
    )

    zspecies = []
    for q in audit.WORDS.values():
        charge = audit.charge_coords(q, b2)
        zspecies.append(charge[0] + 1j * charge[1])
    zspecies = np.asarray(zspecies)

    return {
        "c5": c5,
        "c43": c43,
        "c45": c45,
        "b2": b2,
        "j43": j43,
        "j45": j45,
        "raw_base": raw_base,
        "zspecies": zspecies,
        "certificate": {
            "Clebsch_multiplicities": {"5": m5, "43": m43, "45": m45},
            "Clebsch_gram_errors": {"5": e5, "43": e43, "45": e45},
            "C45_H_minus_C43": float(np.linalg.norm(c45 @ hodge - c43)),
            "HJ43_vs_archived_J45_up_to_sign": float(
                min(
                    np.linalg.norm(j45 - j45_archived),
                    np.linalg.norm(j45 + j45_archived),
                )
            ),
            "charge_embedding": charge_meta,
        },
    }


def transported_blocks(
    geometry: dict[str, Any],
    history: dict[str, Any],
    base_block: np.ndarray,
) -> list[np.ndarray]:
    blocks = []
    for state in history["states"]:
        p = history["state_frame"][state]
        blocks.append(
            geometry["reps"][p]["3p"]
            @ base_block
            @ geometry["reps"][p]["3"].T
        )
    return blocks


def block_history_operator(
    history: dict[str, Any],
    links: np.ndarray,
    blocks: list[np.ndarray],
    transition_weights: np.ndarray | None = None,
) -> np.ndarray:
    operator = np.zeros((180, 180), dtype=complex)
    for s, (a, b) in enumerate(history["states"]):
        for label in ("left", "right"):
            target = int(history["successors"][label][s])
            weight = (
                0.5
                if transition_weights is None
                else float(transition_weights[s, target])
            )
            amplitude = weight * links[a, b] * blocks[s]
            operator[3 * s : 3 * s + 3, 3 * target : 3 * target + 3] = amplitude
    return operator


def reduced_generation_density(block: np.ndarray) -> np.ndarray:
    reduced = np.zeros((3, 3), dtype=complex)
    for state in range(60):
        reduced += block[3 * state : 3 * state + 3, 3 * state : 3 * state + 3]
    reduced = (reduced + reduced.conj().T) / 2.0
    reduced /= np.trace(reduced).real
    return reduced


def ko6_completion_certificate(m: np.ndarray) -> dict[str, float]:
    n = m.shape[0]
    zero = np.zeros_like(m)
    # Particle L/R and conjugate L/R blocks.
    d = np.block(
        [
            [zero, m.conj().T, zero, zero],
            [m, zero, zero, zero],
            [zero, zero, zero, m.T],
            [zero, zero, m.conj(), zero],
        ]
    )
    identity = np.eye(n)
    grading = np.block(
        [
            [-identity, zero, zero, zero],
            [zero, identity, zero, zero],
            [zero, zero, identity, zero],
            [zero, zero, zero, -identity],        ]
    )
    real_linear = np.block(
        [
            [zero, zero, identity, zero],
            [zero, zero, zero, identity],
            [identity, zero, zero, zero],
            [zero, identity, zero, zero],
        ]
    )
    full_identity = np.eye(4 * n)
    return {
        "D_self_adjoint": float(np.linalg.norm(d - d.conj().T)),
        "D_anticommutes_grading": float(np.linalg.norm(d @ grading + grading @ d)),
        "J_squared_plus_one": float(
            np.linalg.norm(real_linear @ real_linear.conj() - full_identity)
        ),
        "J_commutes_D": float(np.linalg.norm(real_linear @ d.conj() - d @ real_linear)),
        "J_anticommutes_grading": float(
            np.linalg.norm(real_linear @ grading.conj() + grading @ real_linear)
        ),
    }


def jarlskog(u: np.ndarray) -> float:
    return float(np.imag(u[0, 0] * u[1, 1] * np.conj(u[0, 1]) * np.conj(u[1, 0])))


def branch_calculation(
    geometry: dict[str, Any],
    history: dict[str, Any],
    face_spinors: np.ndarray,
    dual_links: np.ndarray,
    base: dict[str, Any],
    fiveplet_phase: float,
    chirality: int,
    flux: int,
    transition_weights: np.ndarray | None = None,
    history_measure: str = "Haar",
    include_ko6: bool = False,
    residual_symmetries: list[tuple[int, ...]] | None = None,
) -> dict[str, Any]:
    links = dual_links if flux == 1 else dual_links.conj()
    m5, m43, m45 = base["raw_base"]
    passive_base = (
        np.exp(1j * fiveplet_phase) * m5 + m43 + 1j * chirality * m45
    )
    passive_blocks = transported_blocks(geometry, history, passive_base)
    y0 = block_history_operator(
        history, links, passive_blocks, transition_weights=transition_weights
    )

    species_operators = []
    for name, q in audit.WORDS.items():
        cq = audit.charge_coords(q / 3.0, base["b2"])
        cg = audit.charge_coords(
            audit.DELTA * audit.quadratic_covariant(q) / 5.0, base["b2"]
        )
        charge_base = matrix(base["c43"], base["j43"] @ cq) + (
            1j
            * chirality
            * matrix(base["c45"], base["j45"] @ cg)
        )
        charge_blocks = transported_blocks(geometry, history, charge_base)
        active_blocks = [
            passive + charge
            for passive, charge in zip(passive_blocks, charge_blocks)
        ]
        species_operators.append(
            block_history_operator(
                history,
                links,
                active_blocks,
                transition_weights=transition_weights,
            )
        )

    k0 = y0.conj().T @ y0
    k0 = (k0 + k0.conj().T) / 2.0
    zspecies = base["zspecies"] / np.linalg.norm(base["zspecies"])
    hcat = np.hstack(
        [zspecies[i] * species_operators[i] for i in range(len(species_operators))]
    )
    joint = hcat.conj().T @ hcat + np.kron(np.eye(4), k0)
    joint = (joint + joint.conj().T) / 2.0
    eigenvalues, eigenvectors = eigh(joint, check_finite=False, driver="evd")
    shift = float(eigenvalues[0])
    weights = np.exp(-audit.ETA * (eigenvalues - shift))
    rho = (eigenvectors * weights) @ eigenvectors.conj().T
    rho /= np.trace(rho).real

    frames: dict[str, np.ndarray] = {}
    reduced_densities: dict[str, np.ndarray] = {}
    conditional_eigenvalues: dict[str, list[float]] = {}
    for species, name in enumerate(audit.WORDS):
        block = rho[180 * species : 180 * (species + 1), 180 * species : 180 * (species + 1)]
        reduced = reduced_generation_density(block)
        values, vectors = np.linalg.eigh(reduced)
        conditional_eigenvalues[name] = values.tolist()
        frames[name] = vectors
        reduced_densities[name] = reduced

    ckm = frames["u"].conj().T @ frames["d"]
    pmns = frames["e"].conj().T @ frames["nu"]
    log_partition = -audit.ETA * shift + math.log(float(np.sum(weights)))

    # The Haar operator is fully A5-equivariant.  A selected oriented vacuum
    # breaks A5 spontaneously; its complete 30-branch orbit is covariant, but
    # one branch is not invariant and therefore is not assigned this residual.
    covariance_residual: float | None = None
    generation_symmetry_residual: float | None = None
    covariance_scope = "none"
    covariance_elements: list[tuple[int, ...]] = []
    if transition_weights is None:
        covariance_scope = "A5 generators"
        covariance_elements = [history["edge_half_turn"], history["face_rotation"]]
    elif residual_symmetries:
        covariance_scope = "selected-vacuum stabilizer"
        covariance_elements = residual_symmetries

    if covariance_elements:
        covariance_residual = 0.0
        generation_symmetry_residual = 0.0
        for p in covariance_elements:
            state_action = twisted_state_action(geometry, history, face_spinors, p)
            if flux == -1:
                state_action = state_action.conj()
            left_action = np.kron(state_action, geometry["reps"][p]["3p"])
            right_action = np.kron(state_action, geometry["reps"][p]["3"])
            covariance_residual = max(
                covariance_residual,
                float(np.linalg.norm(left_action @ y0 - y0 @ right_action)),
            )
            generation_action = geometry["reps"][p]["3"]
            for reduced in reduced_densities.values():
                generation_symmetry_residual = max(
                    generation_symmetry_residual,
                    float(
                        np.linalg.norm(
                            generation_action @ reduced
                            - reduced @ generation_action
                        )
                    ),
                )

    result: dict[str, Any] = {
        "fiveplet_phase": float(fiveplet_phase),
        "chirality": int(chirality),
        "flux": int(flux),
        "history_measure": history_measure,
        "free_energy": float(-log_partition / audit.ETA),
        "joint_minmax": [float(eigenvalues[0]), float(eigenvalues[-1])],
        "K0_minmax": [
            float(np.linalg.eigvalsh(k0)[0]),
            float(np.linalg.eigvalsh(k0)[-1]),
        ],
        "A5_history_covariance_residual": covariance_residual,
        "history_covariance_scope": covariance_scope,
        "generation_symmetry_commutator_residual": generation_symmetry_residual,
        "conditional_eigenvalues": conditional_eigenvalues,
        "ckm_abs": np.abs(ckm).tolist(),
        "pmns_abs": np.abs(pmns).tolist(),
        "ckm_J": jarlskog(ckm),
        "pmns_J": jarlskog(pmns),
    }
    if include_ko6:
        result["KO6_completion"] = ko6_completion_certificate(y0)
    return result


def continuous_phase_minimization(
    geometry: dict[str, Any],
    history: dict[str, Any],
    face_spinors: np.ndarray,
    dual_links: np.ndarray,
    base: dict[str, Any],
    transition_weights: np.ndarray,
    residual_symmetries: list[tuple[int, ...]],
    grid_size: int,
) -> dict[str, Any]:
    """Minimize the blind vacuum-weighted action over the relative 5-phase.

    One chirality/flux representative is enough for the minimization because
    complex conjugation gives the exact partner
    (phi, chi, flux) -> (-phi, -chi, -flux).  The partner and all four
    chirality/flux choices are evaluated at the selected phase below.
    """
    if grid_size < 8:
        raise ValueError("phase grid must contain at least eight points")

    cache: dict[float, dict[str, Any]] = {}

    def evaluate(phase: float) -> dict[str, Any]:
        wrapped = float(phase % (2.0 * math.pi))
        key = round(wrapped, 14)
        if key not in cache:
            cache[key] = branch_calculation(
                geometry,
                history,
                face_spinors,
                dual_links,
                base,
                wrapped,
                1,
                1,
                transition_weights=transition_weights,
                history_measure="oriented-vacuum Ruelle equilibrium",
                residual_symmetries=residual_symmetries,
            )
        return cache[key]

    grid_phases = np.linspace(0.0, 2.0 * math.pi, grid_size, endpoint=False)
    grid = [evaluate(float(phase)) for phase in grid_phases]
    grid_best = min(grid, key=lambda branch: branch["free_energy"])
    step = 2.0 * math.pi / grid_size
    center = float(grid_best["fiveplet_phase"])
    optimum = minimize_scalar(
        lambda phase: evaluate(float(phase))["free_energy"],
        bounds=(center - step, center + step),
        method="bounded",
        options={"xatol": 1.0e-12, "maxiter": 80},
    )
    selected = evaluate(float(optimum.x))
    selected_phase = float(selected["fiveplet_phase"])

    selected_sector_branches = []
    for chirality in (-1, 1):
        for flux in (-1, 1):
            selected_sector_branches.append(
                branch_calculation(
                    geometry,
                    history,
                    face_spinors,
                    dual_links,
                    base,
                    selected_phase,
                    chirality,
                    flux,
                    transition_weights=transition_weights,
                    history_measure="oriented-vacuum Ruelle equilibrium",
                    residual_symmetries=residual_symmetries,
                )
            )
    selected_sector_branches.sort(key=lambda branch: branch["free_energy"])

    conjugate_phase = float((-selected_phase) % (2.0 * math.pi))
    conjugate_partner = branch_calculation(
        geometry,
        history,
        face_spinors,
        dual_links,
        base,
        conjugate_phase,
        -1,
        -1,
        transition_weights=transition_weights,
        history_measure="oriented-vacuum Ruelle equilibrium",
        residual_symmetries=residual_symmetries,
    )
    conjugation_residual = abs(
        selected["free_energy"] - conjugate_partner["free_energy"]
    )
    global_partner_branches = []
    for phase, chirality in (
        (selected_phase, 1),
        (conjugate_phase, -1),
    ):
        for flux in (-1, 1):
            global_partner_branches.append(
                branch_calculation(
                    geometry,
                    history,
                    face_spinors,
                    dual_links,
                    base,
                    phase,
                    chirality,
                    flux,
                    transition_weights=transition_weights,
                    history_measure="oriented-vacuum Ruelle equilibrium",
                    residual_symmetries=residual_symmetries,
                )
            )
    global_partner_branches.sort(key=lambda branch: branch["free_energy"])
    global_partner_energies = [
        branch["free_energy"] for branch in global_partner_branches
    ]

    derivative_step = 1.0e-4
    plus = evaluate(selected_phase + derivative_step)["free_energy"]
    minus = evaluate(selected_phase - derivative_step)["free_energy"]

    return {
        "grid_size": grid_size,
        "grid": [
            {
                "fiveplet_phase": branch["fiveplet_phase"],
                "free_energy": branch["free_energy"],
            }
            for branch in grid
        ],
        "optimizer_success": bool(optimum.success),
        "optimizer_message": str(optimum.message),
        "selected_branch": selected,
        "selected_phase_offset_from_three_pi_over_two": float(
            selected_phase - 3.0 * math.pi / 2.0
        ),
        "selected_phase_derivative_residual": float(
            abs(plus - minus) / (2.0 * derivative_step)
        ),
        "selected_phase_curvature": float(
            (plus - 2.0 * selected["free_energy"] + minus)
            / derivative_step**2
        ),
        "selected_sector_branches": selected_sector_branches,
        "conjugate_partner": conjugate_partner,
        "conjugation_free_energy_residual": float(conjugation_residual),
        "global_partner_branches": global_partner_branches,
        "global_partner_free_energy_spread": float(
            max(global_partner_energies) - min(global_partner_energies)
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument(
        "--phase-probe",
        action="store_true",
        help="also test pi/2 and 3pi/2 on the + chirality/+ flux branch",
    )
    parser.add_argument(
        "--phase-grid",
        type=int,
        default=24,
        help="grid size used to bracket the blind continuous-phase minimum",
    )
    args = parser.parse_args()

    geometry = hopf.build_geometry_no_networkx()
    history = build_dual_history(geometry)
    binary = binary_icosahedral_certificate(geometry, history)
    dual_hopf, face_spinors, dual_links = dual_hopf_certificate(geometry, history)
    channel = history_channel_certificate(history, dual_links)
    ordered_history = ordered_history_certificate(geometry, history, dual_links)
    base = build_base_blocks(geometry, history)
    oriented_vacuum = solve_oriented_entropy_vacuum(geometry)
    vacuum_stabilizer = oriented_vacuum_stabilizer(geometry, oriented_vacuum)
    ruelle = ruelle_history_measure(geometry, history, oriented_vacuum)
    ruelle_stabilizer = scalar_history_symmetry_certificate(
        geometry, history, ruelle, vacuum_stabilizer["elements"]
    )

    branches = []
    for fiveplet_phase in (0.0, math.pi):
        for chirality in (-1, 1):
            for flux in (-1, 1):
                branches.append(
                    branch_calculation(
                        geometry,
                        history,
                        face_spinors,
                        dual_links,
                        base,
                        fiveplet_phase,
                        chirality,
                        flux,
                        include_ko6=(
                            fiveplet_phase == 0.0 and chirality == 1 and flux == 1
                        ),
                    )
                )
    branches.sort(key=lambda branch: branch["free_energy"])
    ko6_certificate = next(
        branch["KO6_completion"]
        for branch in branches
        if "KO6_completion" in branch
    )
    haar_generation_deviation = max(
        abs(value - 1.0 / 3.0)
        for branch in branches
        for values in branch["conditional_eigenvalues"].values()
        for value in values
    )

    vacuum_branches = []
    for fiveplet_phase in (0.0, math.pi):
        for chirality in (-1, 1):
            for flux in (-1, 1):
                vacuum_branches.append(
                    branch_calculation(
                        geometry,
                        history,
                        face_spinors,
                        dual_links,
                        base,
                        fiveplet_phase,
                        chirality,
                        flux,
                        transition_weights=ruelle["ruelle_weights"],
                        history_measure="oriented-vacuum Ruelle equilibrium",
                        include_ko6=False,
                        residual_symmetries=vacuum_stabilizer["elements"],
                    )
                )
    vacuum_branches.sort(key=lambda branch: branch["free_energy"])

    phase_minimum = continuous_phase_minimization(
        geometry,
        history,
        face_spinors,
        dual_links,
        base,
        ruelle["ruelle_weights"],
        vacuum_stabilizer["elements"],
        args.phase_grid,
    )

    phase_probe = []
    if args.phase_probe:
        for phase in (math.pi / 2.0, 3.0 * math.pi / 2.0):
            phase_probe.append(
                branch_calculation(
                    geometry,
                    history,
                    face_spinors,
                    dual_links,
                    base,
                    phase,
                    1,
                    1,
                )
            )

    out = {
        "certificate": "URT equivariant Wilson-history and KO-6 continuation",
        "date": "2026-08-28",
        "observational_targets_used": False,
        "topological_obstruction": {
            "direct_continuous_kappa": "NO_GO",
            "proof": "The dyadic solenoid is connected, whereas a finite-state or finite-alphabet history shift is totally disconnected. A continuous image of a connected space is connected, so every such direct coding is constant.",
            "measure_theoretic_strengthening": "The Haar solenoid automorphism is mixing and therefore has no nontrivial finite periodic factor/eigenfunction.",
            "repair": "Use the almost-everywhere binary Markov section together with the 2I frame fibre. The resulting skew product codes complete non-backtracking Wilson histories and is equivariant.",
        },
        "dual_history": {
            "dual_vertices": 20,
            "dual_edges": 30,
            "directed_edges": 60,
            "spin_lifted_directed_edges": 120,
            "A5_regular_action_size": len(history["state_frame"]),
            "out_degree": sorted(set(history["nonbacktracking"].sum(axis=1).tolist())),
            "in_degree": sorted(set(history["nonbacktracking"].sum(axis=0).tolist())),
            "strongly_connected": history["strongly_connected"],
            "perron_value": history["spectral_radius"],
            "topological_entropy": math.log(history["spectral_radius"]),
            "URT_angular_exponent": math.log(2.0),
            "entropy_match_error": abs(
                math.log(history["spectral_radius"]) - math.log(2.0)
            ),
            "coding_rule": "state g in 2I; bit 0 sends g -> g(AB), bit 1 sends g -> g(AB^{-1}); projection is the left/right non-backtracking walk on directed dual edges",
            "coding_orbit_classification": {
                "orientation_preserving_classes": 2,
                "frames_per_class": 120,
                "within_class": "all base-frame and central-sign choices form one regular 2I orbit",
                "between_classes": "exchanging the two binary symbols swaps the left/right ordered-history orbits and reverses the Wilson orientation; the classes are paired by shell reflection/complex conjugation",
            },
        },
        "binary_icosahedral": binary,
        "dual_hopf": dual_hopf,
        "history_channel": channel,
        "ordered_history": ordered_history,
        "oriented_entropy_vacuum": {
            "coefficients": oriented_vacuum["coefficients"].tolist(),
            "potential": oriented_vacuum["potential"],
            "stationarity_residual": oriented_vacuum["stationarity_residual"],
            "hessian_min": float(np.min(oriented_vacuum["hessian_eigenvalues"])),
            "hessian_eigenvalues": oriented_vacuum["hessian_eigenvalues"].tolist(),
            "orbit_size": oriented_vacuum["orbit_size"],
            "stabilizer": {
                key: value
                for key, value in vacuum_stabilizer.items()
                if key != "elements"
            },
        },
        "ruelle_history_measure": {
            **{
                key: value
                for key, value in ruelle.items()
                if key
                not in {
                    "state_potential",
                    "ruelle_weights",
                    "doob_transition",
                    "stationary",
                }
            },
            "selected_vacuum_stabilizer": ruelle_stabilizer,
        },
        "finite_blocks": base["certificate"],
        "KO6_completion_certificate": ko6_certificate,
        "Haar_flavour_no_go": {
            "max_conditional_eigenvalue_deviation_from_one_third": float(
                haar_generation_deviation
            ),
            "theorem": "The Haar history action is A5-equivariant. The generation carrier is the irreducible real triplet, so every reduced generation density commuting with A5 is I3/3 by Schur's lemma. Its eigenframes are therefore undefined and no CKM/PMNS matrix can be extracted.",
        },
        "Haar_branches_by_free_energy": branches,
        "oriented_vacuum_branches_by_free_energy": vacuum_branches,
        "continuous_phase_probe": phase_probe,
        "continuous_phase_minimum": phase_minimum,
        "status": {
            "equivariant_history_coding": "CLOSED on the canonical a.e. symbolic section and 2I skew-product bundle; impossible as a nonconstant continuous map from the connected solenoid alone",
            "full_A5_edge_frame_connection": "CLOSED by the regular A5 action on 60 directed dual edges",
            "ordered_CP_history_pushforward": "CLOSED for the coefficient-free left/right Hopf history channel",
            "KO6_real_graded_star_completion": "CLOSED for every declared history amplitude by the four-block real completion",
            "KO6_relative_phase_and_species_contraction": "NO_GO: the KO-6 identities hold for an arbitrary complex history amplitude M, so they cannot select its relative Clebsch phase or the contraction of species blocks",
            "fully_symmetric_flavour_result": "NO_GO: exact A5/Haar reduction is I3/3 for every species, so its eigenframes and apparent mixing are basis artefacts",
            "symmetry_broken_flavour_test": "DIAGNOSTIC ONLY: the stored oriented 30-vacuum is inserted through its coefficient-free Ruelle equilibrium measure into the previously tested positive rank-one Gram contraction",
            "conditional_positive_Gram_phase": "The diagnostic vacuum-weighted Gram is minimized over the continuous fiveplet phase without observational targets; this does not promote the underived Gram to the physical action",
            "residual_flavour_obstruction": "NO_GO for this 30-vacuum: its C2 stabilizer enforces a common 1+2 generation split, hence at most one real mixing angle and zero Jarlskog invariant",
            "ordered_CP_invariant": "CLOSED: the two binary branch operators obey L^5=exp(-i*pi/6)I and R^5=exp(+i*pi/6)I; their normalized odd trace is one, but the tested positive Gram discards it",
            "physical_action": "OPEN: a real joint action must derive, rather than insert, the coupling of the KO-6/Hodge chirality to the orientation-odd five-step Wilson invariant",
        },
        "KO6_underdetermination_theorem": {
            "statement": "For every complex history amplitude M, the four-block D_M used here is self-adjoint, odd for the grading, and obeys J^2=+1, JD_M=D_MJ and J*grading=-grading*J. Therefore these KO-6 kinematic identities impose no equation on M itself.",
            "consequence": "Neither the continuous phase multiplying the 5 Clebsch channel nor the rank-one species-history contraction can be selected by KO-6 reality/grading/star alone.",
            "required_extra_input": "A dynamical axiom such as the recursive relative-information/Pfaffian phase action is still required; fitting a coefficient is forbidden.",
        },
    }

    payload = json.dumps(out, indent=2)
    if args.output is not None:
        args.output.write_text(payload + "\n", encoding="utf-8")
    else:
        print(payload)


if __name__ == "__main__":
    main()