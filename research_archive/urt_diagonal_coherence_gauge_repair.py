#!/usr/bin/env python3
"""Minimal triangular gauge-face repair for the reflected Cathedral graph.

Between two adjacent spatial slices, each bottom vertex is joined to the eight
vertices of a half-shifted cube.  The old gauge action used 24
future-diagonal/spatial parallelograms.  But every such parallelogram is the
union of two elementary graph triangles, and the triangular holonomies are
what compare different future-link types.

Use all 12 triangles sharing a bottom vertex and all 12 sharing a top vertex,
plus the three spatial squares.  For future vectors

    v_s=(tau,s_1/2,s_2/2,s_3/2),  s_i in {+1,-1},

an exact bivector-frame calculation gives

    M_sp  = diag(0_3, I_3),
    M_tri = diag(2 tau^2 I_3, I_3).

Thus the positive spatial/triangle weights a,d are quadratically isotropic
iff

    a/d = 2 tau^2-1.

With unit frame normalization, d=c_t^2/2 and a=1-c_t^2/2.  Both are positive
throughout the surviving OS clock interval.  The triangles span one time
step, occur in reflected top/bottom pairs, and compact-group Wilson or
autocorrelation-square character weights on them have nonnegative character
coefficients.  These choices are not equivalent: the Wilson weight is
analytic and has full rough-field support, while an exact compact-support
autocorrelation admissibility weight is necessarily nonanalytic at the
identity by Creutz's positivity theorem.  The face repair therefore does not
by itself solve the overlap gap/transfer-matrix conflict.

At zero triangular curvature the cube of future-link types is connected, so
the incoherent four-plus/four-minus zero-action obstruction is excluded.
Fermionic interacting overlap reflection positivity and a quantitative
admissible gap still require separate proofs.  No observational target is
used.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from pathlib import Path
from typing import Any

import numpy as np
import sympy as sp


M_SELECTED = 0.7909405921071237234972289955777431055452218194573


def wedge(left: sp.Matrix, right: sp.Matrix) -> sp.Matrix:
    return sp.Matrix(
        [
            left[i] * right[j] - left[j] * right[i]
            for i, j in itertools.combinations(range(4), 2)
        ]
    )


def frame(vectors: list[sp.Matrix]) -> sp.Matrix:
    result = sp.zeros(6, 6)
    for vector in vectors:
        result += vector * vector.T
    return sp.simplify(result)


def matrix_strings(matrix: sp.Matrix) -> list[list[str]]:
    return [
        [str(sp.simplify(matrix[i, j])) for j in range(matrix.cols)]
        for i in range(matrix.rows)
    ]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    tau = sp.symbols("tau", positive=True, real=True)
    spatial_basis = [
        sp.Matrix([0, 1, 0, 0]),
        sp.Matrix([0, 0, 1, 0]),
        sp.Matrix([0, 0, 0, 1]),
    ]
    future = {
        signs: sp.Matrix([tau, *(sp.Rational(sign, 2) for sign in signs)])
        for signs in itertools.product((-1, 1), repeat=3)
    }

    spatial_areas = [
        wedge(spatial_basis[i], spatial_basis[j])
        for i, j in itertools.combinations(range(3), 2)
    ]
    parallelogram_areas = [
        wedge(future[signs], spatial_basis[i])
        for signs in future
        for i in range(3)
    ]

    top_triangle_areas = []
    bottom_triangle_areas = []
    triangle_labels = []
    for axis in range(3):
        for other_signs in itertools.product((-1, 1), repeat=2):
            minus = list(other_signs)
            minus.insert(axis, -1)
            plus = list(other_signs)
            plus.insert(axis, 1)
            minus_tuple = tuple(minus)
            plus_tuple = tuple(plus)
            top_triangle_areas.append(
                sp.Rational(1, 2)
                * wedge(future[minus_tuple], future[plus_tuple])
            )
            bottom_triangle_areas.append(
                sp.Rational(1, 2)
                * wedge(spatial_basis[axis], future[plus_tuple])
            )
            triangle_labels.append(
                {
                    "axis": axis + 1,
                    "minus_future_signs": list(minus_tuple),
                    "plus_future_signs": list(plus_tuple),
                }
            )

    spatial_frame = frame(spatial_areas)
    parallelogram_frame = frame(parallelogram_areas)
    top_frame = frame(top_triangle_areas)
    bottom_frame = frame(bottom_triangle_areas)
    triangle_frame = sp.simplify(top_frame + bottom_frame)

    expected_spatial = sp.diag(0, 0, 0, 1, 1, 1)
    expected_parallelogram = sp.diag(
        8 * tau**2, 8 * tau**2, 8 * tau**2, 4, 4, 4
    )
    expected_half_triangles = expected_parallelogram / 8
    expected_triangles = expected_parallelogram / 4
    exact_residuals = {
        "spatial": bool(spatial_frame == expected_spatial),
        "old_parallelogram": bool(parallelogram_frame == expected_parallelogram),
        "top_triangles": bool(top_frame == expected_half_triangles),
        "bottom_triangles": bool(bottom_frame == expected_half_triangles),
        "all_triangles": bool(triangle_frame == expected_triangles),
    }
    if not all(exact_residuals.values()):
        raise RuntimeError(exact_residuals)

    c_min = math.sqrt(2.0 * M_SELECTED - M_SELECTED**2)
    clock_rows = []
    for c_value in (c_min, (1.0 + c_min) / 2.0, 1.0):
        tau_value = 1.0 / c_value
        triangle_weight = c_value**2 / 2.0
        spatial_weight = 1.0 - c_value**2 / 2.0
        electric_entry = 2.0 * tau_value**2 * triangle_weight
        magnetic_entry = spatial_weight + triangle_weight
        clock_rows.append(
            {
                "c_t": c_value,
                "tau": tau_value,
                "spatial_weight_a": spatial_weight,
                "triangle_weight_d": triangle_weight,
                "a_over_d": spatial_weight / triangle_weight,
                "exact_ratio_formula": 2.0 * tau_value**2 - 1.0,
                "electric_frame_entry": electric_entry,
                "magnetic_frame_entry": magnetic_entry,
                "isotropy_residual": max(
                    abs(electric_entry - 1.0), abs(magnetic_entry - 1.0)
                ),
            }
        )

    # Evaluate the exact zero-action obstruction from the preceding audit.
    phi = math.acos(1.0 - M_SELECTED)
    nontrivial_triangle_phase = 2.0 * phi
    obstruction_rows = []
    for c_value in (c_min, 1.0):
        triangle_weight = c_value**2 / 2.0
        obstruction_rows.append(
            {
                "c_t": c_value,
                "triangle_weight_d": triangle_weight,
                "nontrivial_top_triangles_per_cell": 4,
                "nontrivial_bottom_triangles_per_cell": 4,
                "triangle_phase_absolute": nontrivial_triangle_phase,
                "triangle_holonomy_deviation": 2.0 * abs(math.sin(phi)),
                "repair_action_per_cell": 8.0
                * triangle_weight
                * (1.0 - math.cos(nontrivial_triangle_phase)),
                "zero_action_after_repair": False,
            }
        )

    out: dict[str, Any] = {
        "certificate": "URT diagonal-coherence triangular gauge repair",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "cell_complex": {
            "spatial_square_types": 3,
            "old_electric_parallelogram_types": 24,
            "top_triangle_types": len(top_triangle_areas),
            "bottom_triangle_types": len(bottom_triangle_areas),
            "total_triangle_types": len(top_triangle_areas)
            + len(bottom_triangle_areas),
            "triangle_labels": triangle_labels,
            "decomposition": (
                "Each old future/spatial parallelogram is the union of one top "
                "and one bottom triangle. Replacing, rather than supplementing, "
                "the parallelograms is the minimal face-complete action."
            ),
            "future_type_adjacency": (
                "The 12 top triangles are the 12 edges of the sign cube; their "
                "connected adjacency graph compares all eight future-link types."
            ),
        },
        "exact_bivector_frames": {
            "basis": ["t^x1", "t^x2", "t^x3", "x1^x2", "x1^x3", "x2^x3"],
            "spatial": matrix_strings(spatial_frame),
            "old_parallelograms": matrix_strings(parallelogram_frame),
            "top_triangles": matrix_strings(top_frame),
            "bottom_triangles": matrix_strings(bottom_frame),
            "all_triangles": matrix_strings(triangle_frame),
            "identities": [
                "M_sp=diag(0_3,I_3)",
                "M_old_el=diag(8 tau^2 I_3,4 I_3)",
                "M_top=M_bottom=M_old_el/8",
                "M_tri=M_old_el/4=diag(2 tau^2 I_3,I_3)",
            ],
            "symbolic_checks": exact_residuals,
            "status": "E",
        },
        "isotropic_repaired_action": {
            "formula": (
                "S_g=beta[a sum_spatial W(U_square)+d sum_all_triangles W(U_triangle)]"
            ),
            "isotropy_equation": "a+d=2 d tau^2",
            "unique_positive_ratio": "a/d=2 tau^2-1",
            "unit_frame_normalization": "d=c_t^2/2, a=1-c_t^2/2 when tau=1/c_t",
            "surviving_clock_rows": clock_rows,
            "positive_through_OS_interval": all(
                row["spatial_weight_a"] > 0.0
                and row["triangle_weight_d"] > 0.0
                for row in clock_rows
            ),
            "old_ratio_withdrawn": (
                "The 4:1 spatial/parallelogram ratio belongs to the incomplete "
                "face set and is not the repaired action."
            ),
            "status": "E quadratic frame conditional on the triangular face premise",
        },
        "reflection_and_compact_group": {
            "time_span": "every triangle lies between two adjacent slices",
            "reflection_pairing": "top and bottom triangles are exchanged by slice reflection",
            "site_reflection_factorization": (
                "Conditioning on the reflection slice separates positive and "
                "negative one-step triangles into conjugate factors."
            ),
            "character_weights": (
                "Wilson weights and the compact-support autocorrelation-square "
                "weights have nonnegative compact-group character coefficients."
            ),
            "analyticity_split": (
                "Ordinary Wilson weights are analytic but do not exclude rough "
                "fields or overlap-kernel zeros. Exact compact-support "
                "autocorrelation weights stay in the nonnegative-character cone "
                "only by being nonanalytic at the identity."
            ),
            "Creutz_boundary": (
                "A nonzero single-face weight cannot be analytic near the "
                "identity, have nonnegative character coefficients, and vanish "
                "on an open set (hep-lat/0409017)."
            ),
            "status": "E site-reflection gauge cone; link-orientation audit still required",
        },
        "old_obstruction_retest": {
            "configuration": "four alpha_+ and four alpha_- constant future links",
            "rows": obstruction_rows,
            "reason_removed_at_zero_action": (
                "Zero top-triangle curvature forces equal neighboring sign-cube "
                "transporters (including the spatial connector). Connectivity "
                "then forbids the incoherent four-plus/four-minus assignment."
            ),
            "status": "E",
        },
        "zero_curvature_structure": {
            "spatial_squares": "make the three spatial covariant shifts commute",
            "triangles": (
                "express every future covariant shift through one reference future "
                "shift and spatial shifts"
            ),
            "consequence": (
                "At zero curvature all graph shifts form one coherent flat connection; "
                "the free momentum-gap proof applies after holonomy shifts."
            ),
            "status": "E local relations; global toron classification not expanded here",
        },
        "verdict": {
            "exact_zero_action_coherence_obstruction_repaired": True,
            "pure_gauge_quadratic_isotropy_repaired": True,
            "interacting_overlap_merger_proved": False,
            "remaining_steps": [
                "derive a volume-uniform plaquette-to-kernel gap bound for the triangular face set",
                "complete the link-reflection orientation proof for triangular character weights",
                "choose between analytic full-support weights and nonanalytic exact admissibility",
                "prove or disprove fermion-plus-gauge overlap reflection positivity",
                "construct the anomaly-free chiral determinant measure and continuum limit",
            ],
            "status": (
                "E minimal gauge repair; F that analytic Wilson support supplies "
                "a global overlap gap; U interacting overlap theory"
            ),
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()