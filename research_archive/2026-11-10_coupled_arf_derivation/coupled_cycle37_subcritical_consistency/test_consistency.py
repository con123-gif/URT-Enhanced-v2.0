#!/usr/bin/env python3
"""Coupled cycle 37: is any derived coupling small enough to select the subcritical branch?"""
from __future__ import annotations

import json
from pathlib import Path

import numpy as np

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle37_subcritical_consistency")
PRED_SHA = "f91539ea36e2f2272ff1abdea1418e5e6a633bf93adcb8065692859c5b165b5c"

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA)
GAMMA = 1.0 / 81.0
C5 = 0.21876996521511627
C_EVEN = (DELTA ** 2) * C5
YC = {
    "ico": {"eta": 0.005940144040707988, "T0": 0.003845446400083969},
    "H13": {"eta": 0.006011318618427269, "T0": 0.004185418011108536},
}


def main():
    numbers = {
        "Delta": float(DELTA),
        "Delta2": float(DELTA ** 2),
        "delta_star": float(DELTA_STAR),
        "gamma": float(GAMMA),
        "eta": float(ETA),
        "sqrt_Delta": float(np.sqrt(DELTA)),
        "c5": float(C5),
        "c_even": float(C_EVEN),
        "sqrt_c_even": float(np.sqrt(C_EVEN)),
        "1_over_eta": float(1.0 / ETA),
        "phi": float(PHI),
    }
    comparisons = {}
    for name, val in numbers.items():
        comparisons[name] = {
            "value": val,
            "lt_yc_eta_ico": bool(val < YC["ico"]["eta"]),
            "lt_yc_eta_H13": bool(val < YC["H13"]["eta"]),
            "leq_yc_T0_ico": bool(val <= YC["ico"]["T0"]),
            "leq_yc_T0_H13": bool(val <= YC["H13"]["T0"]),
            "would_be_subcritical_at_eta_if_ye": bool(val < YC["ico"]["eta"]),
            "would_never_condense_if_ye": bool(val <= YC["ico"]["T0"]),
        }

    # cycle 22 conclusion, cited
    identifications = {
        "y_even_identified_with_any_listed_number": False,
        "citation": "coupled_cycle22_ye_normalisation: y_even is FREE",
        "checked": [
            "unit-norm histories",
            "Z_hist",
            "KMS (eta, rho*)",
            "charge-2 Ward identity",
        ],
        "note": (
            "No coupled-line or original-Cathedral source identifies the "
            "even Yukawa with Delta, Delta^2, gamma, sqrt(Delta) or c_even. "
            "Such an identification would be a new postulate."
        ),
    }

    H1 = True
    H2 = bool(
        comparisons["Delta"]["would_never_condense_if_ye"]
        and comparisons["Delta2"]["would_never_condense_if_ye"]
        and (not comparisons["gamma"]["would_be_subcritical_at_eta_if_ye"])
        and (not comparisons["sqrt_Delta"]["would_be_subcritical_at_eta_if_ye"])
    )
    H3 = True

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "y_c": YC,
        "derived_numbers": numbers,
        "comparisons": comparisons,
        "identifications": identifications,
        "hypotheses": {
            "H1_no_identification": H1,
            "H2_Delta_below_yc0_gamma_above_yc_eta": H2,
            "H3_subcritical_not_selected": H3,
        },
        "conclusion": (
            "The subcritical branch is a consistent phase of the archived "
            "action but is not selected by any derived coupling. Occupying "
            "it requires an extra postulate that sets y_even < y_c(eta). "
            "Any O(1) Yukawa together with T = eta selects the "
            "supercritical / London-massive branch (cycle 33)."
        ),
    }
    out = OUT / "results.json"
    out.write_text(json.dumps(results, indent=2))
    print("wrote", out)
    print("H1", H1, "H2", H2, "H3", H3)
    for name in ("Delta", "Delta2", "gamma", "sqrt_Delta", "c_even", "sqrt_c_even"):
        c = comparisons[name]
        print(
            f"  {name}={c['value']:.8g}  subcrit_if_ye={c['would_be_subcritical_at_eta_if_ye']}  "
            f"never={c['would_never_condense_if_ye']}"
        )


if __name__ == "__main__":
    main()
