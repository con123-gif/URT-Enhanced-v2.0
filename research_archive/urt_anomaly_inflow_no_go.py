#!/usr/bin/env python3
"""Local/global anomaly audit of the Cathedral 16-state generation.

The finite carrier is Lambda^even(C^5)=1+10+5bar, branching to one
left-handed Standard-Model generation including nu^c under

    G=(SU(3)xSU(2)xU(1))/Z6.

This certificate evaluates every perturbative four-dimensional gauge and
mixed gravitational anomaly coefficient with exact rational arithmetic, checks
the mod-two doublet count, and records the established spin-bordism result
Omega_5^Spin(BG)=0 for the Z6 quotient.  The conclusion is a no-go for using
anomaly inflow to select the still-free local determinant phase: the anomaly
class vanishes, so inflow supplies no nonzero level or normalization equation.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
from fractions import Fraction
from pathlib import Path
from typing import Any


FIELDS = (
    # name, SU3 orientation (+1 fund, -1 antifund, 0 singlet), SU3 dim,
    # SU2 dim, hypercharge
    ("Q", +1, 3, 2, Fraction(1, 6)),
    ("u^c", -1, 3, 1, Fraction(-2, 3)),
    ("d^c", -1, 3, 1, Fraction(1, 3)),
    ("L", 0, 1, 2, Fraction(-1, 2)),
    ("e^c", 0, 1, 1, Fraction(1, 1)),
    ("nu^c", 0, 1, 1, Fraction(0, 1)),
)


def fraction_payload(value: Fraction) -> dict[str, Any]:
    return {
        "numerator": value.numerator,
        "denominator": value.denominator,
        "text": str(value),
        "zero": value == 0,
    }


def local_anomalies() -> dict[str, Any]:
    su3_cubic = Fraction(0)
    su3_squared_u1 = Fraction(0)
    su2_squared_u1 = Fraction(0)
    u1_cubic = Fraction(0)
    gravity_squared_u1 = Fraction(0)
    left_su2_doublets = 0
    state_count = 0
    rows = []

    for name, su3_orientation, su3_dim, su2_dim, hypercharge in FIELDS:
        multiplicity = su3_dim * su2_dim
        state_count += multiplicity

        # Cubic SU(3) coefficient: fundamental=+1, antifundamental=-1,
        # multiplied by the spectator SU(2) dimension.
        su3_cubic += su3_orientation * su2_dim

        # T(fundamental)=T(antifundamental)=1/2.
        if su3_dim == 3:
            su3_squared_u1 += su2_dim * hypercharge * Fraction(1, 2)

        # T(doublet)=1/2, multiplied by colour multiplicity.
        if su2_dim == 2:
            su2_squared_u1 += su3_dim * hypercharge * Fraction(1, 2)
            left_su2_doublets += su3_dim

        u1_cubic += multiplicity * hypercharge**3
        gravity_squared_u1 += multiplicity * hypercharge

        integer_charge = 6 * hypercharge
        rows.append(
            {
                "field": name,
                "multiplicity": multiplicity,
                "hypercharge": str(hypercharge),
                "integer_charge_6Y": int(integer_charge),
                "SU2_parity_constraint": (
                    int(integer_charge) - (1 if su2_dim == 2 else 0)
                )
                % 2,
            }
        )

    coefficients = {
        "SU3_cubed": fraction_payload(su3_cubic),
        "SU3_squared_U1": fraction_payload(su3_squared_u1),
        "SU2_squared_U1": fraction_payload(su2_squared_u1),
        "U1_cubed": fraction_payload(u1_cubic),
        "gravity_squared_U1": fraction_payload(gravity_squared_u1),
        "SU2_cubed": {
            "text": "0",
            "zero": True,
            "reason": "SU(2) has no perturbative cubic invariant and its doublet is pseudoreal.",
        },
        "one_nonabelian_two_U1": {
            "text": "0",
            "zero": True,
            "reason": "A single traceless nonabelian generator has zero trace.",
        },
    }

    return {
        "field_rows": rows,
        "left_handed_state_count": state_count,
        "coefficients": coefficients,
        "all_local_coefficients_zero": all(
            item["zero"] for item in coefficients.values()
        ),
        "Witten_SU2_doublet_count": left_su2_doublets,
        "Witten_mod_two_residue": left_su2_doublets % 2,
        "Witten_anomaly_cancelled": left_su2_doublets % 2 == 0,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    local = local_anomalies()
    if not local["all_local_coefficients_zero"]:
        raise RuntimeError("local anomaly cancellation failed")
    if not local["Witten_anomaly_cancelled"]:
        raise RuntimeError("Witten mod-two cancellation failed")
    if local["left_handed_state_count"] != 16:
        raise RuntimeError("the exterior carrier did not branch to 16 states")

    out = {
        "certificate": "URT compact-gauge anomaly/inflow no-go",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "carrier": {
            "definition": "Lambda^even(C^5)=1+10+5bar",
            "gauge_group": "(SU(3)xSU(2)xU(1))/Z6",
            "chirality_convention": "all entries are left-handed Weyl fields",
            "right_handed_neutrino_conjugate_included": True,
        },
        "exact_local_anomaly_audit": local,
        "global_anomaly_input": {
            "established_result": "Omega_5^Spin(B((SU(3)xSU(2)xU(1))/Z6))=0",
            "meaning": (
                "On spin four-manifolds this compact gauge group admits no "
                "independent five-dimensional global gauge-anomaly class."
            ),
            "primary_source": {
                "authors": "Joe Davighi, Ben Gripaios, Nakarin Lohitsiri",
                "title": "Global anomalies in the Standard Model(s) and Beyond",
                "arxiv": "1910.11277",
                "equation": "Eq. (4.45)",
                "url": "https://arxiv.org/abs/1910.11277",
            },
            "status": "E from the cited bordism computation",
        },
        "unit_Hopf_sector": {
            "input": "c1=1 for the certified shell U(1) bundle",
            "local_anomaly_evaluation": (
                "The complete six-form anomaly polynomial is identically zero, "
                "so evaluating it on c1=1 still gives zero."
            ),
            "global_anomaly_evaluation": (
                "The vanishing fifth spin-bordism group supplies no torsion "
                "inflow phase on this sector."
            ),
        },
        "inflow_verdict": {
            "anomaly_class": "zero",
            "forced_bulk_level": "none",
            "lambda_selected": False,
            "theorem": (
                "Anomaly cancellation removes the obstruction to a gauge-invariant "
                "fermion measure; it does not choose a trivialization of the now "
                "topologically trivial determinant line. The already exhibited "
                "factor exp(i lambda chi Omega5) remains allowed for every real lambda."
            ),
            "consequence": (
                "No anomaly-inflow calculation based only on the selected compact "
                "gauge group, the 16-state generation and c1=1 can supply the missing "
                "non-homogeneous equation for lambda."
            ),
            "phenomenology_gate": "CLOSED",
        },
        "minimum_remaining_datum": (
            "An explicitly normalized microscopic regulator/measure convention or "
            "an additional physical symmetry/dynamics beyond anomaly cancellation."
        ),
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()