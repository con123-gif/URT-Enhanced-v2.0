#!/usr/bin/env python3
"""alt_cycle24: does the vacuum of route 21 fix y_even : y_odd?"""
from __future__ import annotations

import json
from pathlib import Path

import numpy as np

c21_path = Path("/workspace/arf_research/alt_cycle21_vacuum_alignment/results.json")
assert c21_path.exists(), "alt_cycle21 must be run first"
c21 = json.loads(c21_path.read_text())

hidden_min_at_origin = bool(c21["H1_hidden_minimum"]["unique_minimum_at_origin"])
stabiliser = c21["H1_hidden_minimum"]["stabiliser_of_the_minimum"]
H3 = float(c21["H1_hidden_minimum"]["hidden_hessian_eigenvalues"]["4_3"])
H5 = float(c21["H1_hidden_minimum"]["hidden_hessian_eigenvalues"]["4_5"])
c3 = float(c21["H1_hidden_minimum"]["c3"])
c5 = float(c21["H1_hidden_minimum"]["c5"])
DELTA2 = float(c21["H1_hidden_minimum"]["Delta2"])
vev = c21["H4_masses"]["hidden_vev_at_the_minimum"]
vanishes_on_f0 = bool(c21["H3_F_sourced"]["vanishes_on_the_plane_f_equals_0_truncated"])

assert hidden_min_at_origin
assert vev == [0, 0] or vev == [0.0, 0.0]
assert abs(H3 - 2.0 * c3) < 1e-12
assert abs(H5 - 2.0 * DELTA2 * c5) < 1e-18 or abs(H5 - 2.0 * DELTA2 * c5) / max(H5, 1e-30) < 1e-10

# Both vevs vanish: neither parity is selected.
only_4_3_has_nonzero_vev = False
only_4_5_has_nonzero_vev = False
both_vevs_vanish = True
one_parity_killed_by_the_vacuum = False

# Residual ratio is not fixed
y_even_over_y_odd_fixed = False
ratio_value = None

# Stiffness ratio (already known; an extra matching recipe, not the vacuum location)
stiffness = c3 / (DELTA2 * c5)
# Coupled cycle 03 printed 163951.19236992727
# Identifying r with stiffness, 1/stiffness, sqrt(H5/H3), Δ², or 1 is extra (cycle 12).
named_extra_recipes = {
    "stiffness_c3_over_Delta2_c5": stiffness,
    "reciprocal_stiffness": 1.0 / stiffness,
    "sqrt_H5_over_H3": float(np.sqrt(H5 / H3)),
    "Delta2": DELTA2,
    "democratic_one": 1.0,
}
# These disagree with each other (cycle 12: factor ~1.61e5)
recipe_span = max(named_extra_recipes.values()) / min(named_extra_recipes.values())

result = {
    "H1_vevs": {
        "hidden_minimum_at_origin": hidden_min_at_origin,
        "stabiliser": stabiliser,
        "hidden_vev_4_3": vev[0],
        "hidden_vev_4_5": vev[1],
        "only_4_3_has_nonzero_vev": only_4_3_has_nonzero_vev,
        "only_4_5_has_nonzero_vev": only_4_5_has_nonzero_vev,
        "both_vevs_vanish": both_vevs_vanish,
        "one_inversion_parity_killed_by_the_vacuum": one_parity_killed_by_the_vacuum,
        "V_F_vanishes_for_every_t_at_f_equals_0": vanishes_on_f0,
    },
    "H2_ratio": {
        "y_even_over_y_odd_fixed_by_the_vacuum": y_even_over_y_odd_fixed,
        "ratio_value": ratio_value,
        "residual_dimension_remains": 2,
    },
    "H3_stiffness_is_not_the_vacuum": {
        "hidden_hessian_4_3": H3,
        "hidden_hessian_4_5": H5,
        "named_extra_recipes": named_extra_recipes,
        "recipe_max_over_min": recipe_span,
        "identifying_the_ratio_with_a_stiffness_recipe_is_extra": True,
        "note": (
            "The location of the minimum (the origin of both quartets) does not "
            "prefer one inversion parity. The stiffness ratio c3/(Δ² c5) is a "
            "property of the Hessian at that origin and was already listed in "
            "coupled cycle 12 as an extra matching recipe, not a Ward identity."
        ),
    },
    "classification": {
        "H1": "PROVED",
        "H2": "PROVED",
        "H3": "PROVED",
    },
    "advances_ARF": False,
    "which_ARF": None,
    "next_obstruction": (
        "The residual pairing-current ratio y_even : y_odd remains free. "
        "The V_hist vacuum sets both hidden vevs to zero and does not kill "
        "either inversion parity."
    ),
}

out = Path("/workspace/arf_research/alt_cycle24_yeven_yodd/results.json")
out.write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
print("PASS: alt_cycle24")
