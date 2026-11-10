#!/usr/bin/env python3
"""alt_cycle20: run the one-loop observable pipeline only if cycle 16 derived a ray."""
from __future__ import annotations

import json
from pathlib import Path

c16_path = Path("/workspace/arf_research/alt_cycle16_path_integral_logdet/results.json")
assert c16_path.exists(), "alt_cycle16 must be run first"
c16 = json.loads(c16_path.read_text())
pure_alpha_ray_derived = bool(c16.get("pure_alpha_ray_derived", False))

# Independent obstruction from alt_cycle18 / alt_cycle15, restated not re-fitted.
degeneracies = [1, 1, 3, 3, 5]
singlets_massless = True
three_distinct_lepton_masses_without_breaking_A5 = False

pipeline_run = False
arf_comparison_performed = False

if pure_alpha_ray_derived:
    # This branch is not expected to run. If it ever does, we still refuse to
    # invent lepton masses from a (1,1,3,3,5) pattern, and we do not compare
    # to ARFs without a finite EM ratio (alt_cycle19).
    pipeline_run = False
    reason = (
        "Cycle 16 set pure_alpha_ray_derived=true, but the A5 mass pattern "
        "(1,1,3,3,5) with massless singlets still cannot give three distinct "
        "lepton masses (alt_cycle18), and alt_cycle19 found no finite "
        "parameter-free EM response. The observable pipeline therefore has "
        "nothing well-defined to compare with the historical ARFs."
    )
else:
    reason = (
        "Cycle 16 did not derive the pure 3⊗5 → 4_3 ray (it remains CONDITIONAL "
        "on an extra variational principle that the coupled path integral does "
        "not supply). Per the predeclared policy, no ray was selected by hand "
        "and the one-loop observable pipeline was not run."
    )

result = {
    "H1_cycle16_status": {
        "pure_alpha_ray_derived": pure_alpha_ray_derived,
        "cycle16_H6_classification_of_the_ray": c16.get("H6_ray_status", {}).get(
            "classification_of_the_ray"
        ),
    },
    "H2_pipeline": {
        "pipeline_run": pipeline_run,
        "arf_comparison_performed": arf_comparison_performed,
        "reason": reason,
        "independent_mass_pattern": {
            "forced_degeneracies": degeneracies,
            "singlets_massless_at_this_order": singlets_massless,
            "can_reproduce_three_distinct_lepton_masses_without_breaking_A5": (
                three_distinct_lepton_masses_without_breaking_A5
            ),
        },
    },
    "classification": {
        "H1": "PROVED",
        "H2": "PROVED",
    },
    "advances_ARF": False,
    "which_ARF": None,
    "next_obstruction": (
        "Still missing: a derived unique source-to-charged-matter coupling that "
        "selects a Yukawa ray, an A5-breaking mechanism that produces three "
        "nondegenerate charged masses without new parameters, and a finite "
        "parameter-free electromagnetic response. None of alt_cycles 16–19 "
        "provides all three."
    ),
}

out = Path("/workspace/arf_research/alt_cycle20_pipeline_if_ray/results.json")
out.write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
print("PASS: alt_cycle20")
