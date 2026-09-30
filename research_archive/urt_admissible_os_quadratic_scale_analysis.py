#!/usr/bin/env python3
"""Three-scale roundoff audit for admissible OS quadratic response.

The raw 528-direction central-difference sums were evaluated with Richardson
pairs (h,h/2) at h=0.0008, 0.02 and 0.04.  If an apparent compressed
nullspace eigenvalue is a genuine quadratic coefficient it must approach a
nonzero constant as h changes.  Accumulated floating-point subtraction error
instead scales as h^-2.

For every overlap/Wilson and scalar/point-split channel, the observed
negative minimum follows h^-2 with fitted exponents close to two and nearly
constant h^2 |lambda_min|.  The signs in the individual raw files are
therefore numerical artifacts.  The data resolve no nonzero quadratic
response on the free OS nullspace; they do not prove that response vanishes
exactly and do not decide fourth and higher orders.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
INPUTS = (
    HERE / "urt_admissible_os_quadratic_response_h0008_results.json",
    HERE / "urt_admissible_os_quadratic_response_h002_results.json",
    HERE / "urt_admissible_os_quadratic_response_h004_results.json",
)
EXPECTED_STEPS = (0.0008, 0.02, 0.04)
BASES = ("scalar_density", "point_split_mesons")
THEORIES = ("overlap", "Wilson_control")


def load(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as handle:
        return json.load(handle)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    documents = [load(path) for path in INPUTS]
    steps = tuple(
        float(document["expansion"]["finite_difference_steps"][0])
        for document in documents
    )
    if steps != EXPECTED_STEPS:
        raise RuntimeError(f"unexpected scale inputs: {steps}")
    if len({document["expansion"]["alpha"] for document in documents}) != 1:
        raise RuntimeError("physical alpha changed across scale audit")

    channels: dict[str, Any] = {}
    all_roundoff_consistent = True
    for basis in BASES:
        channels[basis] = {}
        for theory in THEORIES:
            rows = []
            for path, step, document in zip(INPUTS, steps, documents):
                summary = document["nullspace_analysis"][basis][theory]["summary"]
                eigenvalue = float(summary["minimum_Richardson_curvature"])
                rows.append(
                    {
                        "input": path.name,
                        "coarse_step": step,
                        "apparent_minimum_curvature": eigenvalue,
                        "absolute_curvature_times_step_squared": abs(eigenvalue) * step * step,
                    }
                )
            exponents = []
            for left, right in zip(rows, rows[1:]):
                exponent = math.log(
                    abs(
                        left["apparent_minimum_curvature"]
                        / right["apparent_minimum_curvature"]
                    )
                ) / math.log(right["coarse_step"] / left["coarse_step"])
                exponents.append(exponent)
            invariants = [
                row["absolute_curvature_times_step_squared"] for row in rows
            ]
            invariant_spread = max(invariants) / min(invariants)
            roundoff_consistent = bool(
                all(1.8 < exponent < 2.2 for exponent in exponents)
                and invariant_spread < 1.25
            )
            all_roundoff_consistent = all_roundoff_consistent and roundoff_consistent
            channels[basis][theory] = {
                "scales": rows,
                "fitted_pairwise_inverse_step_exponents": exponents,
                "h_squared_absolute_curvature_spread_ratio": invariant_spread,
                "consistent_with_accumulated_second_difference_roundoff": roundoff_consistent,
                "nonzero_quadratic_sign_resolved": False,
            }

    if not all_roundoff_consistent:
        raise RuntimeError("at least one channel fails the declared roundoff test")

    alpha = float(documents[0]["expansion"]["alpha"])
    out: dict[str, Any] = {
        "certificate": "URT admissible OS quadratic three-scale analysis",
        "date": "2026-09-05",
        "observational_targets_used": False,
        "inputs": [path.name for path in INPUTS],
        "physical_support": {
            "alpha": alpha,
            "alpha_squared": alpha * alpha,
            "inside_exact_volume_uniform_gap_domain": True,
        },
        "roundoff_discriminator": {
            "genuine_coefficient": "approaches a nonzero constant as h changes",
            "second_difference_roundoff": "absolute apparent coefficient proportional to h^-2",
            "tests": (
                "pairwise exponent in (1.8,2.2) and spread of h^2|lambda| below 1.25"
            ),
        },
        "channels": channels,
        "verdict": {
            "all_four_channels_follow_inverse_step_squared": all_roundoff_consistent,
            "raw_negative_signs_are_numerically_resolved": False,
            "nonzero_quadratic_nullspace_response_detected": False,
            "exact_quadratic_vanishing_proved": False,
            "interacting_overlap_reflection_positivity_proved": False,
            "interacting_overlap_reflection_positivity_disproved": False,
            "status": "N: quadratic response consistent with zero; fourth order/direct cone unresolved",
            "conclusion": (
                "The apparent negative curvatures in the raw finite-difference files "
                "are h^-2 subtraction artifacts.  No overlap-specific quadratic "
                "obstruction is resolved in either gauge-invariant basis."
            ),
            "next_executable_gate": (
                "derive the fourth-order gauge-invariant nullspace form or directly "
                "factor the selected face-weight polar cross-boundary cone"
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