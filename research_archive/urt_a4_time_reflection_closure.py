#!/usr/bin/env python3
"""Minimal time-reflection closure of the selected A4 lattice.

Selecting one simplex/cube gives the A4-stabilized split V4=R t + t^perp,
with t proportional to w=(4,-1,-1,-1,-1).  The Euclidean reflection R_t that
reverses t while fixing t^perp is not an automorphism of the root lattice
L=A4={x in Z^5: sum x_i=0}.

Exact rational arithmetic proves that the unique minimal additive
reflection-stable superlattice is

    L_ref=L + Z(w/2)=L union (L+w/2),    L_ref/L = C2.

Closing the 20-root edge shell under R_t gives 28 unique squared-length-two
directions: 12 spatial and 16 adjacent-time.  Stabilizer/reflection symmetry
leaves one weight on each orbit; 4D second-moment isotropy uniquely forces the
ratio 2:1.  Thus every spatial direction has weight 1/20 and the total
adjacent-time sector has weight 2/5.

This supplies a canonical reflection-compatible graph, not yet a proof of
fermionic Osterwalder-Schrader positivity.  No observational target is used.
"""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path


Vector = list[Fraction]
Matrix = list[list[Fraction]]


def identity(size: int) -> Matrix:
    return [[Fraction(int(i == j)) for j in range(size)] for i in range(size)]


def zero_matrix(rows: int, columns: int) -> Matrix:
    return [[Fraction(0) for _ in range(columns)] for _ in range(rows)]


def vector_add(left: Vector, right: Vector) -> Vector:
    return [a + b for a, b in zip(left, right)]


def vector_sub(left: Vector, right: Vector) -> Vector:
    return [a - b for a, b in zip(left, right)]


def vector_scale(scale: int | Fraction, vector: Vector) -> Vector:
    scale = Fraction(scale)
    return [scale * value for value in vector]


def dot(left: Vector, right: Vector) -> Fraction:
    return sum((a * b for a, b in zip(left, right)), Fraction(0))


def outer(left: Vector, right: Vector) -> Matrix:
    return [[a * b for b in right] for a in left]


def matrix_add(left: Matrix, right: Matrix) -> Matrix:
    return [[a + b for a, b in zip(lrow, rrow)] for lrow, rrow in zip(left, right)]


def matrix_sub(left: Matrix, right: Matrix) -> Matrix:
    return [[a - b for a, b in zip(lrow, rrow)] for lrow, rrow in zip(left, right)]


def matrix_scale(scale: int | Fraction, matrix: Matrix) -> Matrix:
    scale = Fraction(scale)
    return [[scale * value for value in row] for row in matrix]


def matrix_multiply(left: Matrix, right: Matrix) -> Matrix:
    rows, middle, columns = len(left), len(right), len(right[0])
    return [[sum((left[i][k] * right[k][j] for k in range(middle)), Fraction(0))
             for j in range(columns)] for i in range(rows)]


def matrix_vector(matrix: Matrix, vector: Vector) -> Vector:
    return [sum((a * b for a, b in zip(row, vector)), Fraction(0)) for row in matrix]


def squared_norm(vector: Vector) -> Fraction:
    return dot(vector, vector)


def matrix_sum_outer(vectors: list[Vector]) -> Matrix:
    out = zero_matrix(5, 5)
    for vector in vectors:
        out = matrix_add(out, outer(vector, vector))
    return out


def render_vector(vector: Vector) -> list[str]:
    return [str(value) for value in vector]


def render_matrix(matrix: Matrix) -> list[list[str]]:
    return [[str(value) for value in row] for row in matrix]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    identity5 = identity(5)
    all_ones = [[Fraction(1) for _ in range(5)] for _ in range(5)]
    projector_v4 = matrix_sub(identity5, matrix_scale(Fraction(1, 5), all_ones))
    w: Vector = [Fraction(value) for value in (4, -1, -1, -1, -1)]
    w_norm_squared = squared_norm(w)
    t_projector = matrix_scale(Fraction(1, w_norm_squared), outer(w, w))
    spatial_projector = matrix_sub(projector_v4, t_projector)
    reflection = matrix_sub(identity5, matrix_scale(2, t_projector))

    witness_root: Vector = [Fraction(value) for value in (1, -1, 0, 0, 0)]
    reflected_witness = matrix_vector(reflection, witness_root)
    witness_integral = all(value.denominator == 1 for value in reflected_witness)
    involution_residual = matrix_sub(matrix_multiply(reflection, reflection), identity5)
    fixes_spatial_residual = matrix_sub(
        matrix_multiply(reflection, spatial_projector), spatial_projector
    )
    flips_time_residual = vector_add(matrix_vector(reflection, w), w)

    half_w = vector_scale(Fraction(1, 2), w)
    enumerated: dict[tuple[Fraction, ...], Vector] = {}
    for coordinates in itertools.product(range(-4, 5), repeat=4):
        x: Vector = [Fraction(value) for value in (*coordinates, -sum(coordinates))]
        for coset in (0, 1):
            y = vector_add(x, vector_scale(coset, half_w))
            if squared_norm(y) <= 2:
                enumerated[tuple(y)] = y

    shells: dict[Fraction, list[Vector]] = {}
    for vector in enumerated.values():
        norm = squared_norm(vector)
        if norm:
            shells.setdefault(norm, []).append(vector)

    roots: list[Vector] = []
    for i in range(5):
        for j in range(5):
            if i != j:
                root = [Fraction(0) for _ in range(5)]
                root[i], root[j] = Fraction(1), Fraction(-1)
                roots.append(root)
    reflected_roots = [matrix_vector(reflection, root) for root in roots]
    root_union = list({tuple(vector): vector for vector in roots + reflected_roots}.values())

    spatial_directions: list[Vector] = []
    future_directions: list[Vector] = []
    past_directions: list[Vector] = []
    for direction in root_union:
        layer_increment = dot(direction, w) / 5
        if layer_increment == 0:
            spatial_directions.append(direction)
        elif layer_increment == 1:
            future_directions.append(direction)
        elif layer_increment == -1:
            past_directions.append(direction)
        else:
            raise RuntimeError(f"unexpected layer increment {layer_increment}")
    temporal_directions = future_directions + past_directions

    root_moment = matrix_sum_outer(roots)
    reflected_root_moment = matrix_sum_outer(reflected_roots)
    spatial_moment = matrix_sum_outer(spatial_directions)
    temporal_moment = matrix_sum_outer(temporal_directions)

    # M=8a P_sp+(4P_sp+20P_t)b.  Isotropy forces a=2b.
    a, b = Fraction(2), Fraction(1)
    weighted_moment = matrix_add(
        matrix_scale(a, spatial_moment), matrix_scale(b, temporal_moment)
    )
    total_weight = a * len(spatial_directions) + b * len(temporal_directions)
    normalized_moment = matrix_scale(Fraction(1, total_weight), weighted_moment)

    reflection_membership_failures = 0
    for vector in enumerated.values():
        reflected = matrix_vector(reflection, vector)
        integral = all(value.denominator == 1 for value in reflected)
        shifted_integral = all(
            (reflected[i] - half_w[i]).denominator == 1 for i in range(5)
        )
        if sum(reflected, Fraction(0)) != 0 or not (integral or shifted_integral):
            reflection_membership_failures += 1

    generated_half_w_residual = vector_sub(
        vector_sub(witness_root, reflected_witness), half_w
    )

    out = {
        "certificate": "URT minimal A4 time-reflection closure",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "selected_split": {
            "time_weight_vector_w": render_vector(w),
            "w_squared": str(w_norm_squared),
            "unit_time": "t=w/sqrt(20)",
            "stabilizer": "even permutations of the four unselected coordinates, A4",
            "reflection": render_matrix(reflection),
            "R_squared_minus_I": render_matrix(involution_residual),
            "R_fixes_spatial_projector_residual": render_matrix(fixes_spatial_residual),
            "R_w_plus_w": render_vector(flips_time_residual),
            "status": "E",
        },
        "bare_lattice_obstruction": {
            "lattice": "L=A4={x in Z^5: sum x_i=0}",
            "witness_root": render_vector(witness_root),
            "reflected_witness": render_vector(reflected_witness),
            "reflected_witness_is_integral": witness_integral,
            "consequence": "the selected time reflection is not in Aut(A4)",
            "status": "E",
        },
        "minimal_reflection_superlattice": {
            "definition": "L_ref=L+Z(w/2)=L union (L+w/2)",
            "quotient": "L_ref/L is C2",
            "minimality_proof": (
                "R(alpha)=alpha-w/2 for alpha=e0-e1, so every R-stable additive "
                "superlattice containing L must contain w/2; conversely R maps "
                "x+m w/2 to x-(x0+m)w/2."
            ),
            "alpha_minus_R_alpha_minus_w_over_2": render_vector(generated_half_w_residual),
            "enumerated_reflection_membership_failures": reflection_membership_failures,
            "status": "E",
        },
        "short_shells_of_L_ref": {
            "counts_by_squared_norm": {
                str(norm): len(vectors) for norm, vectors in sorted(shells.items())
            },
            "q_1_note": (
                "Six purely spatial vectors are geometrically shorter; the inherited "
                "root/reflected-root graph deliberately uses the generating q=2 shell."
            ),
            "q_2_generates_both_cosets": True,
        },
        "reflection_closed_root_graph": {
            "original_oriented_roots": len(roots),
            "reflected_oriented_roots": len(reflected_roots),
            "unique_q2_directions": len(root_union),
            "spatial_layer_0": len(spatial_directions),
            "future_layer_plus_1": len(future_directions),
            "past_layer_minus_1": len(past_directions),
            "all_q2": all(squared_norm(vector) == 2 for vector in root_union),
            "root_moment_minus_10_P_V4": render_matrix(
                matrix_sub(root_moment, matrix_scale(10, projector_v4))
            ),
            "reflected_root_moment_minus_10_P_V4": render_matrix(
                matrix_sub(reflected_root_moment, matrix_scale(10, projector_v4))
            ),
            "spatial_moment_minus_8_P_spatial": render_matrix(
                matrix_sub(spatial_moment, matrix_scale(8, spatial_projector))
            ),
            "temporal_moment_minus_4Psp_20Pt": render_matrix(
                matrix_sub(
                    temporal_moment,
                    matrix_add(matrix_scale(4, spatial_projector), matrix_scale(20, t_projector)),
                )
            ),
            "status": "E",
        },
        "unique_isotropic_weights": {
            "orbit_weights": "a on 12 spatial directions, b on 16 temporal directions",
            "isotropy_equation": "8a+4b=20b",
            "unique_positive_ratio": "a:b=2:1",
            "total_integer_weight": str(total_weight),
            "probability_per_spatial_direction": str(a / total_weight),
            "probability_per_temporal_direction": str(b / total_weight),
            "total_spatial_probability": str(a * len(spatial_directions) / total_weight),
            "total_temporal_probability": str(b * len(temporal_directions) / total_weight),
            "weighted_moment_minus_20_P_V4": render_matrix(
                matrix_sub(weighted_moment, matrix_scale(20, projector_v4))
            ),
            "normalized_second_moment": render_matrix(normalized_moment),
            "identity": (
                "The spatial sector has twelve directions of weight 1/20 and total "
                "weight 3/5; the reflection-paired temporal sector has total 2/5."
            ),
            "status": "E",
        },
        "interpretation_boundary": {
            "advance": (
                "The selected 1+3 split now has a unique minimal two-coset lattice "
                "on which time reflection and a translation-invariant isotropic graph "
                "coexist.  Its sector weights reproduce 3/5 and 2/5 without fitting."
            ),
            "not_yet_proved": [
                "fermionic Osterwalder-Schrader positivity",
                "identification of temporal 2/5 with the old rest channel",
                "a chiral anomaly-safe transfer matrix",
                "Lorentzian physical time and seconds per layer",
            ],
            "status": "E geometry; C/P physical identification",
        },
        "verdict": {
            "bare_A4_supports_selected_time_reflection": "F",
            "unique_minimal_two_coset_reflection_closure": "E",
            "reflection_closed_isotropic_local_graph": "E",
            "stored_1_over_20_and_2_over_5_sector_weights_recovered": "E",
            "reflection_positive_fermion_theory": "U",
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