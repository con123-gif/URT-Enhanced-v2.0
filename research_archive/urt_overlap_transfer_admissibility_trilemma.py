#!/usr/bin/env python3
"""Exact overlap-gap / positivity / analyticity trilemma for the repaired graph.

The face-complete triangular gauge action removes the *zero-action* defect of
the earlier parallelogram action, but an ordinary Wilson face weight is
strictly positive on every compact link configuration.  The explicit
four-plus/four-minus temporal-link configuration therefore remains in its
support.  For every overlap height 0<M<2 that configuration has an exact
zero of X=D_W-M.

Exact open-set admissibility can remove a neighborhood of that zero.  A
nonnegative-character autocorrelation weight can implement the removal, but
it is nonanalytic.  Creutz's theorem excludes a nonzero analytic
positive-character single-face weight that vanishes on an open set.

Consequently the current local face-factor class cannot simultaneously have

  (i) an exact polar-overlap operator with a uniform global kernel gap,
 (ii) analytic positive-transfer face weights, and
(iii) exact open-set admissibility excluding rough configurations.

The result is a theorem about the defined regulator class, not a theorem of
nature.  It forces a regulator choice; it does not choose one.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


M_SELECTED = 0.7909405921071237234972289955777431055452218194573
C_MIN = math.sqrt(2.0 * M_SELECTED - M_SELECTED**2)


def singular_configuration(M: float, nt: int = 6) -> dict[str, Any]:
    if not 0.0 < M < 2.0:
        raise ValueError("overlap height must lie in 0<M<2")
    omega = math.pi / nt
    phi = math.acos(1.0 - M)
    alpha_plus = -omega + phi
    alpha_minus = -omega - phi
    phases = np.array([alpha_plus] * 4 + [alpha_minus] * 4)
    temporal_average = np.mean(np.exp(1j * (omega + phases)))
    scalar_part = 1.0 - M - temporal_average.real
    kinetic_part = temporal_average.imag
    triangle_phase = 2.0 * phi
    return {
        "M": M,
        "nt": nt,
        "lowest_antiperiodic_omega": omega,
        "phi": phi,
        "alpha_plus": alpha_plus,
        "alpha_minus": alpha_minus,
        "future_links_of_each_type": 4,
        "temporal_average_real": float(temporal_average.real),
        "temporal_average_imag": float(temporal_average.imag),
        "target_1_minus_M": 1.0 - M,
        "scalar_X_residual": float(abs(scalar_part)),
        "kinetic_X_residual": float(abs(kinetic_part)),
        "exact_identity": (
            "(exp(i phi)+exp(-i phi))/2=cos(phi)=1-M; "
            "the four spin components of the selected plane wave lie in ker(X)"
        ),
        "nontrivial_triangle_phase": triangle_phase,
        "triangle_deviation": 1.0 - math.cos(triangle_phase),
        "finite_repaired_Wilson_action": True,
        "strictly_positive_Wilson_Boltzmann_weight_for_finite_beta": True,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    configurations = [
        singular_configuration(M)
        for M in (0.1, 0.5, M_SELECTED, 1.0, 1.5, 1.9)
    ]
    maximum_scalar_residual = max(
        row["scalar_X_residual"] for row in configurations
    )
    maximum_kinetic_residual = max(
        row["kinetic_X_residual"] for row in configurations
    )

    branch_table = [
        {
            "branch": "analytic Wilson/heat-kernel face weight",
            "nonnegative_character_cone": True,
            "analytic_near_identity": True,
            "open_set_admissibility": False,
            "uniform_global_polar_gap": False,
            "exact_GW_overlap_at_every_supported_configuration": False,
            "continuum_status": (
                "standard gauge branch possible; chiral merger unproved"
            ),
        },
        {
            "branch": "compact-support autocorrelation face weight",
            "nonnegative_character_cone": True,
            "analytic_near_identity": False,
            "open_set_admissibility": True,
            "uniform_global_polar_gap": (
                "conditional on a proved plaquette-gap bound"
            ),
            "exact_GW_overlap_at_every_supported_configuration": (
                "conditional on that bound"
            ),
            "continuum_status": "unproved for the nonanalytic weight",
        },
        {
            "branch": "finite Wilson/domain-wall fermion regulator",
            "nonnegative_character_cone": True,
            "analytic_near_identity": True,
            "open_set_admissibility": False,
            "uniform_global_polar_gap": "not required",
            "exact_GW_overlap_at_every_supported_configuration": False,
            "continuum_status": (
                "local positive regulator; exact finite-spacing chirality surrendered"
            ),
        },
        {
            "branch": "almost-everywhere overlap with analytic gauge weight",
            "nonnegative_character_cone": True,
            "analytic_near_identity": True,
            "open_set_admissibility": False,
            "uniform_global_polar_gap": False,
            "exact_GW_overlap_at_every_supported_configuration": False,
            "continuum_status": (
                "measure-local limiting construction required and unproved"
            ),
        },
    ]

    out: dict[str, Any] = {
        "certificate": "URT overlap-transfer-admissibility trilemma",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "scope": (
            "local products of compact-group single-face weights on the repaired "
            "spatial-square plus elementary-triangle cell complex"
        ),
        "exact_singular_family": {
            "range": (
                "every 0<M<2 and every c_t; c_t multiplies an exactly vanishing term"
            ),
            "construction": configurations,
            "maximum_floating_scalar_residual": maximum_scalar_residual,
            "maximum_floating_kinetic_residual": maximum_kinetic_residual,
            "proof_status": "E analytic identity; floating rows are corroboration",
        },
        "support_lemma": {
            "statement": (
                "An ordinary repaired Wilson action is finite on the singular "
                "configuration, so exp(-S_g)>0 there for every finite beta. "
                "Continuity then places arbitrarily small kernel gaps in "
                "positive-weight neighborhoods."
            ),
            "consequence": (
                "no volume-uniform positive polar gap on full compact support"
            ),
            "status": "E",
        },
        "analytic_admissibility_no_go": {
            "statement": (
                "Nonnegative character coefficients plus analyticity near the "
                "identity forbid a nonzero single-face weight from vanishing on "
                "an open group region."
            ),
            "application": (
                "Exact admissibility must remove an open neighborhood of rough "
                "faces, hence it cannot be imposed by a nonzero analytic "
                "positive-character face weight."
            ),
            "primary_source": {
                "authors": "Michael Creutz",
                "title": "Positivity and topology in lattice gauge theory",
                "arXiv": "hep-lat/0409017",
                "url": "https://arxiv.org/abs/hep-lat/0409017",
            },
            "status": "E literature theorem plus exact application",
        },
        "trilemma": {
            "incompatible_joint_requirements": [
                "uniform global gap for the exact polar overlap",
                "analytic positive-character transfer weight",
                "exact open-set admissibility",
            ],
            "logical_form": (
                "Within the stated face-factor class, analytic positive transfer "
                "AND exact open-set admissibility is false; analytic full support "
                "also implies failure of a uniform polar gap through the explicit "
                "singular family."
            ),
            "branch_table": branch_table,
            "status": "E",
        },
        "verdict": {
            "old_incomplete_parallelogram_action": "F/W",
            "triangular_face_geometry_repaired": True,
            "analytic_full_support_overlap_merger": False,
            "nonanalytic_admissible_overlap_merger": "U",
            "regulator_branch_selected_by_current_axioms": False,
            "theory_of_nature": False,
            "next_gate": (
                "derive a triangular plaquette-to-kernel gap theorem, then either "
                "prove the nonanalytic admissible branch has an OS continuum "
                "limit or retain a finite Wilson/domain-wall regulator"
            ),
            "status": "E regulator trilemma; U viable interacting branch",
        },
        "selected_clock_context": {
            "M_selected": M_SELECTED,
            "c_t_interval": [C_MIN, 1.0],
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()