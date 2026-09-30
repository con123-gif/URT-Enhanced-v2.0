#!/usr/bin/env python3
"""Shortest-loop gauge-action closure on the A4 root lattice.

The primitive steps are the A4 roots e_i-e_j.  The shortest non-backtracking
closed paths are root triangles associated with three-element subsets of five
indices.  This certificate proves that their ten unoriented types form one A5
orbit, that their area bivectors are an exact tight frame for Lambda^2(V4), and
that a strict shortest-loop, reversal-real action with one parent fundamental
trace is unique up to an overall coupling and additive constant.

Restricting the parent trace to S(U(3)xU(2)) fixes the standard GUT-normalized
relative gauge couplings.  If the one-parent-trace premise is dropped, the
three ideals u(1), su(2), su(3) retain independent couplings.

No observational target is used.
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


def permutation_parity(permutation: tuple[int, ...]) -> int:
    inversions = sum(
        permutation[i] > permutation[j]
        for i in range(len(permutation))
        for j in range(i + 1, len(permutation))
    )
    return inversions % 2


def a5_permutations() -> list[tuple[int, ...]]:
    return [
        permutation
        for permutation in itertools.permutations(range(5))
        if permutation_parity(permutation) == 0
    ]


def wedge_coordinates(a: np.ndarray, b: np.ndarray) -> np.ndarray:
    return np.asarray(
        [a[i] * b[j] - a[j] * b[i] for i, j in itertools.combinations(range(5), 2)],
        dtype=int,
    )


def triangle_bivectors() -> tuple[list[tuple[int, int, int]], np.ndarray]:
    triples = list(itertools.combinations(range(5), 3))
    bivectors = []
    for i, j, k in triples:
        alpha = np.zeros(5, dtype=int)
        beta = np.zeros(5, dtype=int)
        alpha[i], alpha[j] = 1, -1
        beta[j], beta[k] = 1, -1
        # alpha+beta+(e_k-e_i)=0 is the oriented triangular loop.
        bivectors.append(wedge_coordinates(alpha, beta))
    return triples, np.asarray(bivectors)


def orbit_of_triple(seed: tuple[int, int, int]) -> set[tuple[int, int, int]]:
    return {
        tuple(sorted(permutation[index] for index in seed))
        for permutation in a5_permutations()
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    permutations = a5_permutations()
    triples, bivectors = triangle_bivectors()
    orbit = orbit_of_triple(triples[0])

    frame = bivectors.T @ bivectors
    frame_polynomial_residual = frame @ frame - 5 * frame
    eigenvalues = np.linalg.eigvalsh(frame.astype(float))
    bivector_norms = np.sum(bivectors * bivectors, axis=1)

    # Exact parent U(1) generator Y=diag(-1/3,-1/3,-1/3,1/2,1/2).
    trace_y_squared = 3 * Fraction(1, 9) + 2 * Fraction(1, 4)
    normalized_y_factor_squared = Fraction(3, 5)
    normalized_generator_trace = normalized_y_factor_squared * trace_y_squared

    out = {
        "certificate": "URT A4 shortest-loop gauge-action closure",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "root_lattice": {
            "carrier": "A4={n in Z^5: sum n_i=0}",
            "primitive_steps": "Phi(A4)={e_i-e_j:i!=j}",
            "primitive_step_count": 20,
            "shortest_nonbacktracking_loop_length": 3,
            "triangle_closure": "(e_i-e_j)+(e_j-e_k)+(e_k-e_i)=0",
            "unoriented_triangle_types_per_translation_cell": len(triples),
        },
        "A5_orbit_classification": {
            "A5_order": len(permutations),
            "seed_triangle": list(triples[0]),
            "orbit_size_on_unoriented_types": len(orbit),
            "all_ten_types_in_one_orbit": orbit == set(triples),
            "stabilizer_order": len(permutations) // len(orbit),
            "consequence": (
                "A5 invariance forces one common coefficient on all shortest "
                "unoriented triangle loops."
            ),
        },
        "bivector_tight_frame": {
            "raw_bivector": "A_ijk=(e_i-e_j) wedge (e_j-e_k)",
            "raw_norm_squared_values": [int(value) for value in bivector_norms],
            "ambient_frame_exact_polynomial": "M^2=5M",
            "maximum_integer_polynomial_residual": int(
                np.max(np.abs(frame_polynomial_residual))
            ),
            "ambient_frame_eigenvalues": [float(value) for value in eigenvalues],
            "rank": int(np.linalg.matrix_rank(frame)),
            "Lambda2_V4_dimension": 6,
            "exact_restricted_frame": (
                "sum A_ijk tensor A_ijk=5 I on Lambda^2(V4); for geometric "
                "triangle areas A/2 the coefficient is 5/4"
            ),
            "continuum_consequence": (
                "The quadratic small-holonomy term is proportional to the full "
                "isotropic norm Tr(F_{mu nu}F^{mu nu}); the 3 and 3' Hodge "
                "blocks receive the same coefficient."
            ),
            "status": "E",
        },
        "minimal_gauge_action": {
            "formula": (
                "S_g=beta sum_{x, {i,j,k}} [1-(1/d_R) "
                "Re Tr_R U_{x;ijk}]"
            ),
            "uniqueness_conditions": [
                "strict shortest-loop locality",
                "gauge invariance",
                "A5 invariance",
                "reversal reality",
                "one chosen parent representation trace",
            ],
            "uniqueness": (
                "Under these conditions the linear fundamental-character action "
                "is unique up to beta and an additive constant."
            ),
            "status": "E conditional on the listed locality/trace premises",
        },
        "parent_trace_reduction": {
            "parent_carrier": "C^5=C^3+C^2",
            "block_group": "S(U(3)xU(2))=(SU(3)xSU(2)xU(1))/Z6",
            "hypercharge_generator": "Y=diag(-1/3,-1/3,-1/3,1/2,1/2)",
            "Tr5_Y_squared": str(trace_y_squared),
            "normalized_generator": "T1=sqrt(3/5) Y",
            "Tr5_T1_squared": str(normalized_generator_trace),
            "nonabelian_generator_normalization": "Tr_fund(T_a T_b)=delta_ab/2",
            "one_parent_coupling_relation": "g3=g2=g1 with g1=sqrt(5/3) gY",
            "conditional_weak_angle_at_parent_scale": "sin^2(theta_W)=3/8",
            "status": "E algebraically, C/P as a physical unification boundary condition",
        },
        "remaining_freedom": {
            "with_one_parent_trace": [
                "one overall bare gauge coupling beta",
                "the scale at which the parent relation is imposed",
                "symmetry-breaking and threshold dynamics",
            ],
            "without_one_parent_trace": (
                "An invariant quadratic form on u(1)+su(2)+su(3) has three "
                "independent positive coefficients, so g1, g2 and g3 remain free."
            ),
            "phenomenology_gate": "CLOSED",
        },
    }

    if len(permutations) != 60 or len(orbit) != 10:
        raise RuntimeError("A5 triangle orbit did not close")
    if np.max(np.abs(frame_polynomial_residual)) != 0:
        raise RuntimeError("bivector frame polynomial failed")
    if normalized_generator_trace != Fraction(1, 2):
        raise RuntimeError("parent U(1) normalization failed")

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()