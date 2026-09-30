#!/usr/bin/env python3
"""Exact half-step reflection classification for the Cathedral lattice.

The reflection-closed Cathedral graph is written in staggered cubic labels

    Lambda = {(t, x): t in Z, x=n+t h, n in Z^3},  h=(1,1,1)/2.

This script classifies affine graph isometries which reverse time about the
half-integer plane t=1/2,

    Theta_(R,a)(t,x) = (1-t, R x+a),

with R a signed permutation of the three spatial axes.  Exact integer
arithmetic proves:

* no pure-time choice R=I maps Lambda to itself as an involution;
* exactly seven of the 48 signed-permutation linear parts admit such an
  involution: central inversion and six edge-axis half turns;
* none of those seven belongs to the selected orientation-preserving
  tetrahedral A4 stabilizer.

Consequently the usual half-step/link-reflection proof geometry is not
available without enlarging or twisting the selected spatial symmetry.  The
integer-plane site reflection theta(t,n)=(-t,n+t(1,1,1)) remains available.

This is a geometry theorem.  It neither proves nor disproves interacting
overlap reflection positivity.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
from typing import Any, Iterable


Vector = tuple[int, int, int]
Matrix = tuple[Vector, Vector, Vector]
IDENTITY: Matrix = ((1, 0, 0), (0, 1, 0), (0, 0, 1))
H2: Vector = (1, 1, 1)  # twice h


def matrix_vector(matrix: Matrix, vector: Vector) -> Vector:
    return tuple(sum(row[j] * vector[j] for j in range(3)) for row in matrix)  # type: ignore[return-value]


def matrix_multiply(left: Matrix, right: Matrix) -> Matrix:
    return tuple(
        tuple(sum(left[i][k] * right[k][j] for k in range(3)) for j in range(3))
        for i in range(3)
    )  # type: ignore[return-value]


def matrix_add(left: Matrix, right: Matrix) -> Matrix:
    return tuple(
        tuple(left[i][j] + right[i][j] for j in range(3)) for i in range(3)
    )  # type: ignore[return-value]


def vector_add(left: Vector, right: Vector) -> Vector:
    return tuple(left[i] + right[i] for i in range(3))  # type: ignore[return-value]


def vector_scale(scale: int, vector: Vector) -> Vector:
    return tuple(scale * value for value in vector)  # type: ignore[return-value]


def determinant(matrix: Matrix) -> int:
    a, b, c = matrix
    return (
        a[0] * (b[1] * c[2] - b[2] * c[1])
        - a[1] * (b[0] * c[2] - b[2] * c[0])
        + a[2] * (b[0] * c[1] - b[1] * c[0])
    )


def trace(matrix: Matrix) -> int:
    return sum(matrix[i][i] for i in range(3))


def signed_permutations() -> list[Matrix]:
    out: list[Matrix] = []
    for permutation in itertools.permutations(range(3)):
        for signs in itertools.product((-1, 1), repeat=3):
            rows = []
            for row, column in enumerate(permutation):
                values = [0, 0, 0]
                values[column] = signs[row]
                rows.append(tuple(values))
            out.append(tuple(rows))  # type: ignore[arg-type]
    if len(set(out)) != 48:
        raise AssertionError("hyperoctahedral enumeration failed")
    return out


def fixed_coordinate_signs(matrix: Matrix) -> list[int]:
    """Signs of one-cycles in the underlying signed permutation."""
    return [matrix[i][i] for i in range(3) if matrix[i][i] != 0]


def admits_half_step_involution(matrix: Matrix) -> bool:
    """Exact odd-vector criterion for an admissible affine translation.

    Write 2a=v=2m+(1,1,1).  Lattice preservation says v has odd integer
    coordinates, while involutivity says (I+R)v=0.  For an involutive signed
    permutation, every one-cycle must therefore have sign -1.  Each signed
    two-cycle has equal signs and admits an odd solution v_j=-s v_i.
    """
    if matrix_multiply(matrix, matrix) != IDENTITY:
        return False
    return all(sign == -1 for sign in fixed_coordinate_signs(matrix))


def odd_translation_witness(matrix: Matrix) -> Vector:
    """Construct v=2a with odd entries and Rv=-v."""
    if not admits_half_step_involution(matrix):
        raise ValueError("linear part does not admit a half-step involution")
    values: list[int | None] = [None, None, None]
    for i in range(3):
        if matrix[i][i] == -1:
            values[i] = 1
    for i in range(3):
        if values[i] is not None:
            continue
        j = next(index for index, value in enumerate(matrix[i]) if value)
        sign = matrix[i][j]
        values[i] = 1
        values[j] = -sign
    witness = tuple(int(value) for value in values)  # type: ignore[arg-type]
    if matrix_vector(matrix, witness) != vector_scale(-1, witness):
        raise AssertionError("constructed affine witness is invalid")
    if not all(value % 2 for value in witness):
        raise AssertionError("translation witness must be odd")
    return witness  # type: ignore[return-value]


TETRAHEDRON = {
    (1, 1, 1),
    (1, -1, -1),
    (-1, 1, -1),
    (-1, -1, 1),
}


def tetrahedral_a4(group: Iterable[Matrix]) -> list[Matrix]:
    return [
        matrix
        for matrix in group
        if determinant(matrix) == 1
        and {matrix_vector(matrix, vertex) for vertex in TETRAHEDRON}
        == TETRAHEDRON
    ]


SPATIAL_STORED = {(0, 1, 0), (0, 0, 1), (1, 0, 0)}
SPATIAL_DIRECTED = SPATIAL_STORED | {vector_scale(-1, v) for v in SPATIAL_STORED}
FUTURE_INTEGER = set(itertools.product((0, -1), repeat=3))
PAST_INTEGER = {vector_scale(-1, vector) for vector in FUTURE_INTEGER}


def graph_direction_residual(matrix: Matrix, v: Vector) -> int:
    """Count failures of the induced integer-coordinate direction map."""
    # n' = R n + t k + m, k=(R(2h)+2h)/2.
    rh2_plus_h2 = vector_add(matrix_vector(matrix, H2), H2)
    if any(value % 2 for value in rh2_plus_h2):
        return 1
    k = tuple(value // 2 for value in rh2_plus_h2)
    failures = 0
    for spatial in SPATIAL_DIRECTED:
        failures += int(matrix_vector(matrix, spatial) not in SPATIAL_DIRECTED)
    for future in FUTURE_INTEGER:
        image_spatial = vector_add(matrix_vector(matrix, future), k)  # dt'= -1
        failures += int(image_spatial not in PAST_INTEGER)
    # v is used here to verify m=(v-H2)/2 is integral and involutive.
    m2 = tuple(v[i] - H2[i] for i in range(3))
    failures += int(any(value % 2 for value in m2))
    m = tuple(value // 2 for value in m2)
    lhs = matrix_vector(matrix_add(IDENTITY, matrix), v)
    failures += int(lhs != (0, 0, 0))
    # Direct integer-coordinate affine involution constant residual:
    # Rm+k+m=0.
    failures += int(
        vector_add(vector_add(matrix_vector(matrix, m), k), m) != (0, 0, 0)
    )
    return failures


def render_matrix(matrix: Matrix) -> list[list[int]]:
    return [list(row) for row in matrix]


def render_vector(vector: Vector) -> list[int]:
    return list(vector)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    group = signed_permutations()
    involutions = [matrix for matrix in group if matrix_multiply(matrix, matrix) == IDENTITY]
    admissible = [matrix for matrix in involutions if admits_half_step_involution(matrix)]
    tetrahedral = tetrahedral_a4(group)
    intersection = [matrix for matrix in admissible if matrix in tetrahedral]

    rows: list[dict[str, Any]] = []
    maximum_graph_residual = 0
    for matrix in admissible:
        v = odd_translation_witness(matrix)
        m = tuple((v[i] - H2[i]) // 2 for i in range(3))
        k = tuple(
            value // 2
            for value in vector_add(matrix_vector(matrix, H2), H2)
        )
        residual = graph_direction_residual(matrix, v)
        maximum_graph_residual = max(maximum_graph_residual, residual)
        rows.append(
            {
                "R": render_matrix(matrix),
                "determinant": determinant(matrix),
                "trace": trace(matrix),
                "twice_spatial_translation_a": render_vector(v),
                "integer_coordinate_m_equals_a_minus_h": render_vector(m),
                "integer_coordinate_k_equals_Rh_plus_h": render_vector(k),
                "integer_label_map": "(t,n)->(1-t,R n+t k+m)",
                "graph_direction_residual": residual,
                "belongs_to_selected_tetrahedral_A4": matrix in tetrahedral,
            }
        )

    pure_time_lattice_map_condition = vector_add(
        matrix_vector(IDENTITY, H2), H2
    )
    # With R=I, involutivity needs a=0, but lattice preservation needs
    # a-h integer.  Equivalently an odd v must obey 2v=0, impossible.
    pure_time_odd_kernel_exists = admits_half_step_involution(IDENTITY)

    if len(group) != 48 or len(involutions) != 20:
        raise AssertionError("signed-permutation classification count changed")
    if len(admissible) != 7:
        raise AssertionError("half-step classification count changed")
    if len(tetrahedral) != 12 or intersection:
        raise AssertionError("tetrahedral intersection classification failed")
    if maximum_graph_residual:
        raise AssertionError("an admitted affine map failed to preserve the graph")
    if pure_time_odd_kernel_exists:
        raise AssertionError("pure half-step time reflection was admitted")

    determinant_counts = {
        str(value): sum(determinant(matrix) == value for matrix in admissible)
        for value in (-1, 1)
    }
    trace_counts = {
        str(value): sum(trace(matrix) == value for matrix in admissible)
        for value in (-3, -1)
    }
    out: dict[str, Any] = {
        "certificate": "URT half-step reflection geometry no-go",
        "date": "2026-09-05",
        "observational_targets_used": False,
        "lattice": {
            "physical_embedding": "x=n+t(1,1,1)/2",
            "spatial_directions": "(0,+/-e_i)",
            "temporal_directions": "(+/-1,+/-(1/2,1/2,1/2))",
            "candidate": "Theta_(R,a)(t,x)=(1-t,Rx+a)",
            "R_class": "three-dimensional signed permutation matrices",
        },
        "exact_criteria": {
            "lattice_preservation": "a-h in Z^3; Rh+h is automatically integral",
            "involution": "R^2=I and (I+R)a=0",
            "odd_vector_form": "v=2a has all coordinates odd and Rv=-v",
            "cycle_classification": (
                "an involutive signed permutation is admissible iff every "
                "one-cycle has sign -1"
            ),
        },
        "enumeration": {
            "signed_permutations": len(group),
            "linear_involutions": len(involutions),
            "admissible_half_step_linear_parts": len(admissible),
            "determinant_counts": determinant_counts,
            "trace_counts": trace_counts,
            "maximum_graph_direction_residual": maximum_graph_residual,
            "representatives": rows,
        },
        "pure_time_half_step": {
            "R": render_matrix(IDENTITY),
            "Rh_plus_h_twice": render_vector(pure_time_lattice_map_condition),
            "admissible": pure_time_odd_kernel_exists,
            "contradiction": (
                "R=I makes involutivity require a=0, while lattice "
                "preservation requires a-(1,1,1)/2 in Z^3"
            ),
            "status": "F",
        },
        "selected_spatial_symmetry": {
            "tetrahedral_A4_order": len(tetrahedral),
            "admissible_half_step_intersection_count": len(intersection),
            "consequence": (
                "no half-step reflection is compatible with the selected A4 "
                "spatial stabilizer"
            ),
            "status": "E",
        },
        "surviving_site_reflection": {
            "integer_label_map": "theta(t,n)=(-t,n+t(1,1,1))",
            "physical_map": "theta(t,x)=(-t,x)",
            "role": (
                "the direct interacting polar-fermion OS gate must be decided "
                "on this site-reflection geometry unless the model symmetry is changed"
            ),
        },
        "verdict": {
            "status": "E geometry classification; U interacting overlap OS",
            "usual_pure_time_link_reflection_available": False,
            "A4_compatible_half_step_reflection_available": False,
            "interacting_overlap_reflection_positivity_proved": False,
            "interacting_overlap_reflection_positivity_disproved": False,
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()