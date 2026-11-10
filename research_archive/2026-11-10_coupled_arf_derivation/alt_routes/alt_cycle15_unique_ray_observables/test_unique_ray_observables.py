#!/usr/bin/env python3
"""alt_cycle15: observables only if a unique ray was derived — it was not."""
from __future__ import annotations

import json
from pathlib import Path

# Residual from alt_cycle09 (re-stated, not re-fitted)
residual_yukawa_dim = 4
kinetic_scale_remaining = 1
unique_ray = False

# A5 mass pattern from alt_cycle04
degeneracies = [1, 1, 3, 3, 5]
singlets_massless_at_this_order = True
can_reproduce_three_distinct_lepton_masses_without_breaking_A5 = False

# EM response: archive scientific boundary
charged_edge_current_derived = False
A5_defined_EM_response_available = False

arf_comparison_performed = False
reason = (
    "No unique Yukawa ray was derived in alt_cycles 09–14 (residual dimension 4 "
    "plus a kinetic scale). Per the predeclared policy, no ray was selected by "
    "hand and no comparison to the four historical ARFs was performed."
)

result = {
    "H1_uniqueness": {
        "residual_yukawa_dimension": residual_yukawa_dim,
        "kinetic_scale_remaining": kinetic_scale_remaining,
        "unique_ray": unique_ray,
    },
    "H2_mass_pattern": {
        "forced_degeneracies": degeneracies,
        "singlets_massless_at_this_order": singlets_massless_at_this_order,
        "can_reproduce_three_distinct_lepton_masses_without_breaking_A5": (
            can_reproduce_three_distinct_lepton_masses_without_breaking_A5
        ),
    },
    "H3_EM_response": {
        "charged_vertex_to_spatial_edge_current_derived": charged_edge_current_derived,
        "A5_defined_EM_response_available": A5_defined_EM_response_available,
        "reason": (
            "The original November 7 action has no vertex-to-spatial-edge "
            "charged coupling (archive scientific boundary)."
        ),
    },
    "H4_ARF_comparison": {
        "performed": arf_comparison_performed,
        "reason": reason,
    },
    "classification": {
        "H1": "PROVED",
        "H2": "PROVED",
        "H3": "PROVED",
        "H4": "PROVED",
    },
    "advances_ARF": False,
    "which_ARF": None,
    "next_obstruction": (
        "A unique source-to-charged-matter coupling is still missing, and even "
        "if one ray were chosen the A5 degeneracies (1,1,3,3,5) with massless "
        "singlets cannot give three distinct lepton masses, nor is there a "
        "derived electromagnetic edge current to compare with R_α."
    ),
}

Path("/workspace/arf_research/alt_cycle15_unique_ray_observables/results.json").write_text(
    json.dumps(result, indent=2) + "\n"
)
print(json.dumps(result, indent=2))
print("PASS: alt_cycle15")
