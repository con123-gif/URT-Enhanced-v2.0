#!/usr/bin/env python3
"""Exact conditional uniqueness theorem for the 12-direction URT shell.

Assume twelve unit directions in R^3 occur in six antipodal pairs and have the
equal-weight isotropic second and fourth moments already used by the Cathedral
fluid/continuum branch.  The six rank-one projectors, after subtracting I/3,
form a regular simplex in the five-dimensional traceless-symmetric space.
Consequently the six axes are equiangular with squared inner product 1/5.

Their oriented Gram matrix is I+S/sqrt(5), where S is a symmetric conference
matrix of order six.  Switching signs makes the first row positive; the
remaining five-vertex +1 graph is 2-regular and hence the unique five-cycle.
Thus the line system is unique up to O(3), signed representatives and
permutation.  Its twelve endpoints are the regular icosahedron.  The same
second/fourth Gaussian moment matching also fixes the moving and rest weights
to 1/20 and 2/5.

This proves uniqueness conditional on the isotropy/antipodality premises.  It
does not by itself prove that nature must impose those premises.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np


def normalized_conference_matrices() -> list[np.ndarray]:
    """Enumerate exact S with S_1j=+1 and S^2=5I."""
    pairs = [(i, j) for i in range(1, 6) for j in range(i + 1, 6)]
    out: list[np.ndarray] = []
    for signs in itertools.product((-1, 1), repeat=len(pairs)):
        s = np.zeros((6, 6), dtype=int)
        s[0, 1:] = 1
        s[1:, 0] = 1
        for (i, j), value in zip(pairs, signs):
            s[i, j] = value
            s[j, i] = value
        if np.array_equal(s @ s, 5 * np.eye(6, dtype=int)):
            out.append(s)
    return out


def cycle_edges(matrix: np.ndarray) -> list[tuple[int, int]]:
    return [
        (i, j)
        for i in range(1, 6)
        for j in range(i + 1, 6)
        if matrix[i, j] == 1
    ]


def standard_icosahedron_vertices() -> np.ndarray:
    phi = (1.0 + math.sqrt(5.0)) / 2.0
    raw = []
    for a in (-1.0, 1.0):
        for b in (-phi, phi):
            raw.append((0.0, a, b))
            raw.append((a, b, 0.0))
            raw.append((b, 0.0, a))
    # The loop creates exactly the conventional twelve distinct vertices.
    vertices = np.unique(np.asarray(raw), axis=0)
    vertices /= np.linalg.norm(vertices, axis=1)[:, None]
    return vertices


def moment_and_graph_audit() -> dict[str, Any]:
    vertices = standard_icosahedron_vertices()
    if len(vertices) != 12:
        raise RuntimeError("standard coordinate construction did not give 12 vertices")

    identity = np.eye(3)
    second = np.einsum("ni,nj->ij", vertices, vertices)
    fourth = np.einsum("ni,nj,nk,nl->ijkl", vertices, vertices, vertices, vertices)
    isotropic_fourth = np.zeros((3, 3, 3, 3))
    for i in range(3):
        for j in range(3):
            for k in range(3):
                for l in range(3):
                    isotropic_fourth[i, j, k, l] = (4.0 / 5.0) * (
                        identity[i, j] * identity[k, l]
                        + identity[i, k] * identity[j, l]
                        + identity[i, l] * identity[j, k]
                    )

    gram = vertices @ vertices.T
    adjacency = (
        np.abs(gram - 1.0 / math.sqrt(5.0)) < 1.0e-12
    ).astype(int)
    np.fill_diagonal(adjacency, 0)
    degrees = np.sum(adjacency, axis=1)
    edge_count = int(np.sum(adjacency) // 2)

    # Count triangular faces in the resulting nearest-neighbour graph.
    face_count = 0
    for i, j, k in itertools.combinations(range(12), 3):
        if adjacency[i, j] and adjacency[j, k] and adjacency[k, i]:
            face_count += 1

    off_antipodal = []
    for i in range(12):
        for j in range(i + 1, 12):
            if abs(gram[i, j] + 1.0) > 1.0e-12:
                off_antipodal.append(abs(gram[i, j] ** 2 - 1.0 / 5.0))

    return {
        "second_moment_residual": float(np.linalg.norm(second - 4.0 * identity)),
        "fourth_moment_residual": float(np.linalg.norm(fourth - isotropic_fourth)),
        "maximum_nonantipodal_squared_inner_product_residual": float(max(off_antipodal)),
        "vertex_degrees": [int(value) for value in degrees],
        "edge_count": edge_count,
        "triangular_face_count": face_count,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    conference = normalized_conference_matrices()
    if len(conference) != 12:
        raise RuntimeError(f"expected 12 normalized labelled cycles, got {len(conference)}")

    cycle_audits = []
    for s in conference:
        edges = cycle_edges(s)
        degrees = [0] * 5
        for i, j in edges:
            degrees[i - 1] += 1
            degrees[j - 1] += 1
        gram = np.eye(6) + s / math.sqrt(5.0)
        eig = np.linalg.eigvalsh(gram)
        cycle_audits.append(
            {
                "plus_edge_count": len(edges),
                "plus_degrees": degrees,
                "S_squared_residual": int(np.max(np.abs(s @ s - 5 * np.eye(6, dtype=int)))),
                "Gram_eigenvalues": [float(value) for value in eig],
            }
        )

    moving_weight = Fraction(1, 20)
    rest_weight = Fraction(2, 5)
    sound_speed_squared = Fraction(1, 5)

    out = {
        "certificate": "URT icosahedral shell conditional uniqueness theorem",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "premises": {
            "directions": "12 unit vectors in R^3 grouped as six antipodal pairs +/-v_i",
            "second_moment": "sum over 12 directions n_a tensor n_a = 4 I_3",
            "fourth_moment": (
                "sum over 12 directions n_a^{tensor 4}=(4/5)"
                "(delta_ij delta_kl+delta_ik delta_jl+delta_il delta_jk)"
            ),
            "weights": "equal nonzero weight on the 12 moving directions plus one rest state",
        },
        "exact_projective_design_proof": {
            "traceless_projectors": "u_i=v_i v_i^T-I/3 in Sym^2_0(R^3), dimension 5",
            "projector_norm_squared": "||u_i||^2=2/3",
            "zero_sum": "sum_i u_i=0 from the second moment",
            "frame_operator": "sum_i u_i tensor u_i=(4/5) I_5 from the fourth moment",
            "simplex_Gram": "Gram(u)=(4/5)(I_6-J_6/6)",
            "off_diagonal_projector_inner_product": "<u_i,u_j>=-2/15",
            "axis_consequence": "(v_i dot v_j)^2=1/5 for every i!=j",
            "status": "E",
        },
        "exact_conference_classification": {
            "oriented_axis_Gram": "G=I_6+S/sqrt(5)",
            "tight_frame_equation": "G^2=2G iff S^2=5I_6",
            "switching_normalization": "sign-switch axes so S_1j=+1 for j>1",
            "row_sum_consequence": (
                "(S^2)_1j=0 forces two +1 and two -1 entries in every "
                "row of the remaining 5x5 block"
            ),
            "graph_consequence": (
                "the +1 graph on five vertices is 2-regular, hence C5; "
                "there is one switching/permutation class"
            ),
            "normalized_labelled_conference_count": len(conference),
            "expected_labelled_C5_count": 12,
            "all_integer_equations_exact": all(
                item["S_squared_residual"] == 0 for item in cycle_audits
            ),
            "representative_audits": cycle_audits[:3],
            "status": "E",
        },
        "icosahedron_consequence": {
            "statement": (
                "The six axes are unique up to O(3), sign switching and "
                "permutation. Their twelve signed endpoints are the regular icosahedron."
            ),
            "valence": (
                "For each vertex, exactly one endpoint on each of the other five "
                "axes has inner product +1/sqrt(5), so the nearest-neighbour degree is 5."
            ),
            "numerical_coordinate_audit": moment_and_graph_audit(),
            "status": "E conditional on the stated moment/antipodality premises",
        },
        "weight_closure": {
            "equations": (
                "c_s^2=4w, (4/5)w=c_s^4, w0+12w=1"
            ),
            "moving_weight": str(moving_weight),
            "rest_weight": str(rest_weight),
            "sound_speed_squared": str(sound_speed_squared),
            "uniqueness": True,
            "status": "E",
        },
        "verdict": {
            "mathematical_seed_uniqueness": "E conditional",
            "physical_seed_selection": "C/P",
            "closed": (
                "No other 12-direction antipodal equal-weight shell satisfies "
                "the stated exact second/fourth isotropy up to rotation."
            ),
            "remaining_premise": (
                "Derive, rather than postulate, why the microscopic action requires "
                "antipodality and exact second/fourth isotropy with six axes."
            ),
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()