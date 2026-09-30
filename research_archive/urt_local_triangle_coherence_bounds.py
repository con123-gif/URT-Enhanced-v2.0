#!/usr/bin/env python3
"""Volume-independent local coherence bounds from triangular admissibility.

Let S_i be the three unitary spatial covariant shifts and V_b the eight
future shifts, b in {-1,0}^3.  A bottom and top triangle on every sign-cube
edge give, in operator norm,

  ||S_i V_b - V_(b+e_i)|| <= epsilon,
  ||V_b S_i - V_(b+e_i)|| <= epsilon.

Consequently ||[S_i,V_b]||<=2 epsilon.  Starting with V_--- and walking a
fixed order through the sign cube gives

  ||A-P_rev V_---|| <= (3/2) epsilon,

where A=(1/8)sum_b V_b and
P_rev=(1+S_3)(1+S_2)(1+S_1)/8.  The reflected top triangles similarly give

  ||A-V_--- P_fwd|| <= (3/2) epsilon.

Spatial-square admissibility gives ||[S_i,S_j]||<=epsilon and hence
||P_rev-P_fwd||<=(3/4)epsilon.  All constants are independent of volume and
the compact gauge group.  The temporal part of the Wilson kernel therefore
differs from its coherent-product replacement by at most 3 epsilon for
0<c_t<=1.

This supplies the local replacement for the failed global Hodge estimate.
It does not yet prove a kernel gap: the remaining task is an HJL-style
noncommutative lower bound for the coherent-product Wilson kernel.
"""

from __future__ import annotations

import argparse
import itertools
import json
from fractions import Fraction
from pathlib import Path
from typing import Any


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    sign_types = list(itertools.product((0, 1), repeat=3))
    hamming_weights = [sum(signs) for signs in sign_types]
    total_path_steps = sum(hamming_weights)
    average_path_steps = Fraction(total_path_steps, len(sign_types))
    if average_path_steps != Fraction(3, 2):
        raise RuntimeError(average_path_steps)

    inversion_counts = []
    for signs in sign_types:
        selected = [axis for axis, present in enumerate(signs) if present]
        inversion_counts.append(len(selected) * (len(selected) - 1) // 2)
    total_inversions = sum(inversion_counts)
    average_inversions = Fraction(total_inversions, len(sign_types))
    if average_inversions != Fraction(3, 4):
        raise RuntimeError(average_inversions)

    commutator_crossings = [2 * weight for weight in hamming_weights]
    average_commutator_crossings = Fraction(
        sum(commutator_crossings), len(commutator_crossings)
    )
    if average_commutator_crossings != 3:
        raise RuntimeError(average_commutator_crossings)

    out: dict[str, Any] = {
        "certificate": "URT local triangular coherence bounds",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "premise": {
            "face_admissibility": "||1-U_face||<=epsilon for every elementary triangle and square",
            "operator_translation": (
                "two path transports around a face differ by a unitary factor "
                "times (1-U_face), hence by at most epsilon"
            ),
            "gauge_group_scope": "every compact unitary representation",
            "volume_dependence": "none",
        },
        "triangle_relations": {
            "bottom": "||S_i V_b-V_(b+e_i)||<=epsilon",
            "top": "||V_b S_i-V_(b+e_i)||<=epsilon",
            "commutator": "||[S_i,V_b]||<=2 epsilon",
            "sign_cube_edge_count": 12,
            "status": "E",
        },
        "future_average": {
            "definition": "A=(1/8) sum_b V_b",
            "reference": "V=V_(-1,-1,-1)",
            "left_product": "P_rev=(1+S_3)(1+S_2)(1+S_1)/8",
            "right_product": "P_fwd=(1+S_1)(1+S_2)(1+S_3)/8",
            "path_lengths": hamming_weights,
            "total_path_steps": total_path_steps,
            "average_path_steps_exact": str(average_path_steps),
            "left_coherence_bound": "||A-P_rev V||<=(3/2) epsilon",
            "right_coherence_bound": "||A-V P_fwd||<=(3/2) epsilon",
            "status": "E telescoping unitary-path bound",
        },
        "spatial_reordering": {
            "square_bound": "||[S_i,S_j]||<=epsilon",
            "subset_inversion_counts": inversion_counts,
            "total_inversions": total_inversions,
            "average_inversions_exact": str(average_inversions),
            "product_reordering_bound": "||P_rev-P_fwd||<=(3/4) epsilon",
            "status": "E",
        },
        "derived_bounds": {
            "P_V_commutator_word_crossings": commutator_crossings,
            "average_crossings_exact": str(average_commutator_crossings),
            "direct_product_commutator": "||P V-V P||<=3 epsilon",
            "two_triangle_product_comparison": (
                "||P_rev V-V P_fwd||<=3 epsilon"
            ),
            "same_order_product_comparison": (
                "||P_fwd V-V P_fwd||<=(15/4) epsilon after spatial reordering; "
                "the direct word-commutator estimate improves this to 3 epsilon"
            ),
            "status": "E",
        },
        "Wilson_kernel_consequence": {
            "temporal_map": (
                "T(A)=(c_t gamma_0-I)A/2+(-c_t gamma_0-I)A^dagger/2"
            ),
            "Lipschitz_norm": "||T(A)-T(B)||<=(1+c_t)||A-B||",
            "clock_range": "0<c_t<=1",
            "coherent_replacement_bound": (
                "||T(A)-T(P_rev V)||<=3 epsilon"
            ),
            "status": "E",
        },
        "literature_method_boundary": {
            "reference": {
                "authors": "P. Hernandez, K. Jansen, M. Luscher",
                "title": "Locality properties of Neuberger's lattice Dirac operator",
                "arXiv": "hep-lat/9808010",
                "url": "https://arxiv.org/abs/hep-lat/9808010",
            },
            "standard_result": (
                "For the hypercubic s=0 Wilson kernel, a local commutator "
                "expansion gives A^dagger A>=1-30 epsilon."
            ),
            "adaptation_status": (
                "The Cathedral coherent product P V is not a primitive unitary "
                "shift, so the standard Appendix-C cancellation cannot be copied "
                "without a new noncommutative positive decomposition."
            ),
        },
        "verdict": {
            "volume_independent_coherence_established": True,
            "global_Hodge_comparison_needed": False,
            "volume_uniform_kernel_gap_established": False,
            "remaining_exact_problem": (
                "prove Y^dagger Y>=g0-C epsilon for the coherent-product kernel "
                "Y, using only the displayed local commutator bounds"
            ),
            "status": "E local reduction; U noncommutative gap inequality",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()