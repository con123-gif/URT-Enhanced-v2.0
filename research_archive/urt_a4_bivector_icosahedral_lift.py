#!/usr/bin/env python3
"""Minimal A4-bivector lift of the URT icosahedral shell.

The rank-four A4 root lattice cannot project A5-equivariantly to either real
three-dimensional icosahedral irrep.  Its integral bivector lattice is the
minimal repair: Lambda^2(A4) has rank six, its Hodge star is N/sqrt(5), and
Lambda^2(V4)=3+3'.

Each of the six Sylow C5 subgroups fixes a two-plane in the rational rank-six
carrier and one line in each Hodge sector.  The A5 orbit of either oriented
fixed line has twelve points with inner products -1 and +/-1/sqrt(5), exactly
the regular icosahedron.  Thus the finite directions have a canonical
cut-and-project origin already inside the Cathedral algebra.

This does not yet give a local microscopic lattice.  Each Hodge projection of
the rank-six lattice is dense in its three-space, so a compact internal-space
acceptance window and an adjacency/streaming rule are additional data.

No observational target is used.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from collections import Counter
from pathlib import Path
from typing import Any

import numpy as np


Permutation = tuple[int, ...]
PAIRS = list(itertools.combinations(range(4), 2))


def parity(permutation: Permutation) -> int:
    return sum(
        permutation[i] > permutation[j]
        for i in range(len(permutation))
        for j in range(i + 1, len(permutation))
    ) % 2


def compose(left: Permutation, right: Permutation) -> Permutation:
    return tuple(left[right[i]] for i in range(5))


def power(permutation: Permutation, exponent: int) -> Permutation:
    result: Permutation = tuple(range(5))
    for _ in range(exponent):
        result = compose(permutation, result)
    return result


def order(permutation: Permutation) -> int:
    for exponent in range(1, 7):
        if power(permutation, exponent) == tuple(range(5)):
            return exponent
    raise RuntimeError("unexpected permutation order")


def simple_root_matrix() -> np.ndarray:
    roots = np.zeros((5, 4), dtype=int)
    for i in range(4):
        roots[i, i] = 1
        roots[i + 1, i] = -1
    return roots


def root_representation(permutation: Permutation) -> np.ndarray:
    roots = simple_root_matrix()
    ambient = np.zeros((5, 5), dtype=int)
    for source, target in enumerate(permutation):
        ambient[target, source] = 1
    moved = ambient @ roots
    representation = np.zeros((4, 4), dtype=int)
    # If v=sum_i c_i(e_i-e_{i+1}), then c_i=sum_{j<=i}v_j.
    for column in range(4):
        representation[:, column] = np.cumsum(moved[:, column])[:4]
    if not np.array_equal(roots @ representation, moved):
        raise RuntimeError("integral A4 representation reconstruction failed")
    return representation


def exterior_square(matrix: np.ndarray) -> np.ndarray:
    result = np.zeros((6, 6), dtype=int)
    for source, (a, b) in enumerate(PAIRS):
        for target, (i, j) in enumerate(PAIRS):
            result[target, source] = (
                matrix[i, a] * matrix[j, b]
                - matrix[j, a] * matrix[i, b]
            )
    return result


def bivector_metric_and_hodge_numerator() -> tuple[np.ndarray, np.ndarray]:
    roots = simple_root_matrix()
    metric4 = roots.T @ roots
    metric6 = np.asarray(
        [
            [
                metric4[i, k] * metric4[j, l]
                - metric4[i, l] * metric4[j, k]
                for k, l in PAIRS
            ]
            for i, j in PAIRS
        ],
        dtype=int,
    )
    wedge_pairing = np.zeros((6, 6), dtype=int)
    for row, (i, j) in enumerate(PAIRS):
        for column, (k, l) in enumerate(PAIRS):
            sequence = [i, j, k, l]
            if len(set(sequence)) == 4:
                wedge_pairing[row, column] = (-1) ** sum(
                    sequence[a] > sequence[b]
                    for a in range(4)
                    for b in range(a + 1, 4)
                )
    # In the integral simple-root bivector basis, *=N/sqrt(det A4)=N/sqrt(5).
    hodge_numerator = wedge_pairing @ metric6
    return metric6, hodge_numerator


def metric_norm(vector: np.ndarray, metric: np.ndarray) -> float:
    return math.sqrt(max(0.0, float(vector @ metric @ vector)))


def unique_vectors(
    vectors: list[np.ndarray], metric: np.ndarray, signed: bool
) -> list[np.ndarray]:
    representatives: list[np.ndarray] = []
    for vector in vectors:
        if not any(
            (
                min(
                    metric_norm(vector - other, metric),
                    metric_norm(vector + other, metric),
                )
                if signed
                else metric_norm(vector - other, metric)
            )
            < 1.0e-9
            for other in representatives
        ):
            representatives.append(vector)
    return representatives


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    elements = [
        permutation
        for permutation in itertools.permutations(range(5))
        if parity(permutation) == 0
    ]
    root_actions = {p: root_representation(p) for p in elements}
    bivector_actions = {p: exterior_square(root_actions[p]) for p in elements}
    metric6, hodge_numerator = bivector_metric_and_hodge_numerator()
    identity6 = np.eye(6, dtype=int)

    metric_residual = max(
        int(np.max(np.abs(action.T @ metric6 @ action - metric6)))
        for action in bivector_actions.values()
    )
    hodge_square_residual = int(
        np.max(np.abs(hodge_numerator @ hodge_numerator - 5 * identity6))
    )
    hodge_commutator_residual = max(
        int(np.max(np.abs(action @ hodge_numerator - hodge_numerator @ action)))
        for action in bivector_actions.values()
    )
    hodge_self_adjoint_residual = int(
        np.max(
            np.abs(
                hodge_numerator.T @ metric6
                - metric6 @ hodge_numerator
            )
        )
    )

    order_counts = Counter(order(element) for element in elements)
    order_five = [element for element in elements if order(element) == 5]
    subgroups = {
        frozenset(power(generator, exponent) for exponent in range(5))
        for generator in order_five
    }
    subgroup_audits = []
    plus_projector = (
        np.eye(6) + hodge_numerator.astype(float) / math.sqrt(5.0)
    ) / 2.0
    minus_projector = (
        np.eye(6) - hodge_numerator.astype(float) / math.sqrt(5.0)
    ) / 2.0
    for subgroup in subgroups:
        average = sum(bivector_actions[element] for element in subgroup)
        subgroup_audits.append(
            {
                "integral_average_rank": int(np.linalg.matrix_rank(average)),
                "plus_fixed_rank": int(
                    np.linalg.matrix_rank(plus_projector @ average, tol=1.0e-9)
                ),
                "minus_fixed_rank": int(
                    np.linalg.matrix_rank(minus_projector @ average, tol=1.0e-9)
                ),
            }
        )

    generator: Permutation = (1, 2, 3, 4, 0)
    cyclic_average = sum(
        bivector_actions[power(generator, exponent)] for exponent in range(5)
    )
    column = next(
        cyclic_average[:, index]
        for index in range(6)
        if np.any(cyclic_average[:, index])
    ).astype(float)
    hodge_column = hodge_numerator @ column
    plus_axis = plus_projector @ column
    minus_axis = minus_projector @ column
    plus_norm_squared = float(plus_axis @ metric6 @ plus_axis)
    minus_norm_squared = float(minus_axis @ metric6 @ minus_axis)
    plus_axis /= math.sqrt(plus_norm_squared)
    minus_axis /= math.sqrt(minus_norm_squared)

    orbit_audits = {}
    for name, axis, sign in (
        ("self_dual_3", plus_axis, 1.0),
        ("anti_self_dual_3_prime", minus_axis, -1.0),
    ):
        images = [action @ axis for action in bivector_actions.values()]
        orbit = unique_vectors(images, metric6, signed=False)
        axes = unique_vectors(orbit, metric6, signed=True)
        oriented_stabilizer = sum(
            metric_norm(image - axis, metric6) < 1.0e-9 for image in images
        )
        axis_stabilizer = sum(
            min(
                metric_norm(image - axis, metric6),
                metric_norm(image + axis, metric6),
            )
            < 1.0e-9
            for image in images
        )
        dots = [
            float(left @ metric6 @ right)
            for i, left in enumerate(orbit)
            for right in orbit[i + 1 :]
        ]
        targets = (-1.0, -1.0 / math.sqrt(5.0), 1.0 / math.sqrt(5.0))
        dot_residual = max(min(abs(dot - target) for target in targets) for dot in dots)
        dot_counts = Counter(
            min(targets, key=lambda target: abs(dot - target)) for dot in dots
        )
        gram = np.asarray(
            [[left @ metric6 @ right for right in orbit] for left in orbit]
        )
        gram_eigenvalues = np.linalg.eigvalsh(gram)
        hodge_residual = metric_norm(
            hodge_numerator @ axis / math.sqrt(5.0) - sign * axis,
            metric6,
        )
        orbit_audits[name] = {
            "oriented_orbit_size": len(orbit),
            "unoriented_axis_count": len(axes),
            "oriented_stabilizer_order": int(oriented_stabilizer),
            "axis_stabilizer_order": int(axis_stabilizer),
            "pair_inner_product_counts": {
                "-1": dot_counts[-1.0],
                "-1/sqrt(5)": dot_counts[-1.0 / math.sqrt(5.0)],
                "+1/sqrt(5)": dot_counts[1.0 / math.sqrt(5.0)],
            },
            "maximum_inner_product_residual": dot_residual,
            "Gram_eigenvalues": [float(value) for value in gram_eigenvalues],
            "Hodge_eigenvector_residual": hodge_residual,
        }

    character_counts: dict[str, dict[str, int]] = {}
    for element in elements:
        element_order = str(order(element))
        character_counts.setdefault(element_order, {})
        trace = str(int(np.trace(bivector_actions[element])))
        character_counts[element_order][trace] = (
            character_counts[element_order].get(trace, 0) + 1
        )

    out = {
        "certificate": "URT minimal A4-bivector icosahedral lift",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "integral_carrier": {
            "lattice": "Lambda^2 A4 ~= Z^6",
            "simple_root_Gram_determinant": 5,
            "bivector_Gram_determinant": int(round(np.linalg.det(metric6))),
            "Hodge_star": "*=N/sqrt(5) in the integral simple-root bivector basis",
            "Hodge_numerator_N": hodge_numerator.tolist(),
            "exact_identities": [
                "N^2=5 I6",
                "N is self-adjoint for the bivector Gram metric",
                "N commutes with every A5 action",
            ],
            "metric_invariance_residual": metric_residual,
            "Hodge_square_residual": hodge_square_residual,
            "Hodge_commutator_residual": hodge_commutator_residual,
            "Hodge_self_adjoint_residual": hodge_self_adjoint_residual,
            "status": "E",
        },
        "minimal_rational_representation_theorem": {
            "A5_character_rows": {
                "3": "(3,-1,0,phi,1-phi)",
                "3_prime": "(3,-1,0,1-phi,phi)",
                "4": "(4,0,1,-1,-1)",
                "Lambda2_4": "(6,-2,0,1,1)=3+3_prime",
            },
            "no_rank_four_projection": (
                "The character inner products <4,3> and <4,3_prime> are zero, "
                "so Hom_A5(V4,V3)=Hom_A5(V4,V3_prime)=0."
            ),
            "rank_six_minimality": (
                "An integral/rational representation containing 3 must also contain "
                "its Q(sqrt(5))-Galois conjugate 3_prime with equal multiplicity. "
                "Therefore the minimum rational rank is six, achieved by Lambda^2 A4."
            ),
            "computed_order_counts": {str(k): v for k, v in order_counts.items()},
            "computed_bivector_character_counts": character_counts,
            "status": "E",
        },
        "order_five_fixed_axis_classification": {
            "order_five_element_count": len(order_five),
            "Sylow_C5_subgroup_count": len(subgroups),
            "fixed_space_per_subgroup": (
                "rank two over the rational six-carrier, splitting as one line in "
                "each Hodge 3-space"
            ),
            "all_subgroup_audits": subgroup_audits,
            "representative_integral_orbit_sum_s": [int(value) for value in column],
            "representative_Ns": [int(value) for value in hodge_column],
            "representative_projections": (
                "pi_+(s)=(s+Ns/sqrt(5))/2 and "
                "pi_-(s)=(s-Ns/sqrt(5))/2"
            ),
            "projection_norm_squared_exact": {
                "plus": "(25+10 sqrt(5))/2",
                "minus": "(25-10 sqrt(5))/2",
            },
            "projection_norm_squared_residuals": {
                "plus": abs(
                    plus_norm_squared - (25.0 + 10.0 * math.sqrt(5.0)) / 2.0
                ),
                "minus": abs(
                    minus_norm_squared - (25.0 - 10.0 * math.sqrt(5.0)) / 2.0
                ),
            },
            "status": "E",
        },
        "icosahedral_orbits": orbit_audits,
        "cut_and_project_theorem": {
            "six_dimensional_lattice": (
                "Lambda^2 A4 embeds as a full lattice in E_+ direct_sum E_-, "
                "where E_+=3 and E_-=3_prime."
            ),
            "injectivity": (
                "If pi_+(z)=0 for nonzero integral z, then Nz=-sqrt(5)z, "
                "impossible because Nz and z are integral; similarly for pi_-."
            ),
            "density": (
                "Each projected additive group has rank six in R^3 and cannot be "
                "discrete.  Its closure is A5-invariant; irreducibility of 3 or "
                "3_prime forces the nonzero identity component to be the full space."
            ),
            "missing_locality_data": [
                "a compact acceptance window in the conjugate Hodge space",
                "window scale, offset and boundary convention",
                "a finite-neighbour adjacency/streaming rule on the selected point set",
            ],
            "status": "E for the cut-and-project carrier; U for a unique window and local dynamics",
        },
        "verdict": {
            "canonical_twelve_directions": (
                "E: the six C5 fixed axes in either Hodge sector have a twelve-point "
                "A5 orbit equal to a regular icosahedron"
            ),
            "minimal_higher_dimensional_origin": "E: Lambda^2 A4 is rank-six minimal",
            "exact_local_microscopic_streaming": "U",
            "advance": (
                "The icosahedral directions are no longer an external geometric "
                "insertion: they arise canonically from the existing A4 bivector "
                "carrier.  Local site selection still requires an acceptance-window "
                "and adjacency axiom not contained in the current theory."
            ),
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