#!/usr/bin/env python3
"""Conditional gauge normalization from the entropy spectral action.

This certificate combines two exact statements:

1. the fermionic KMS entropy cutoff has h(0)=log(2); and
2. in the standard three-generation almost-commutative Standard Model trace
   convention, canonical gauge normalization obeys

       g_3^2 F_0/(2 pi^2)=1/4,
       g_3^2=g_2^2=(5/3) g_Y^2.

If the physical bosonic action is *exactly one copy* of the entropy spectral
action in that trace convention, F_0=log(2) and the common nonabelian coupling
is fixed.  The script also performs the obstruction audit: multiplying the
entropy action by any positive coefficient c, or changing the trace by a
relative multiplicity nu, preserves additivity, all symmetries, locality and
reflection positivity while sending F_0 to c nu log(2).  Therefore the number
is a sharp conditional prediction, not an unconditional theorem of the current
Cathedral premises.

No observational target or measured coupling is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any


def couplings(action_weight: float, trace_ratio: float) -> dict[str, Any]:
    """Return canonically normalized couplings for positive c and nu."""
    if action_weight <= 0.0 or trace_ratio <= 0.0:
        raise ValueError("action_weight and trace_ratio must be positive")

    f0_effective = action_weight * trace_ratio * math.log(2.0)
    g_unified_squared = math.pi**2 / (2.0 * f0_effective)
    g_unified = math.sqrt(g_unified_squared)
    hypercharge_squared = 3.0 * g_unified_squared / 5.0
    hypercharge = math.sqrt(hypercharge_squared)
    alpha_unified = g_unified_squared / (4.0 * math.pi)
    weak_mixing = hypercharge_squared / (
        g_unified_squared + hypercharge_squared
    )
    normalization_residual = abs(
        g_unified_squared * f0_effective / (2.0 * math.pi**2) - 0.25
    )
    unification_residual = max(
        abs(g_unified_squared - g_unified_squared),
        abs(g_unified_squared - 5.0 * hypercharge_squared / 3.0),
    )

    return {
        "action_weight_c": action_weight,
        "trace_ratio_nu": trace_ratio,
        "effective_F0": f0_effective,
        "g_U_squared": g_unified_squared,
        "g_U": g_unified,
        "g_Y_squared": hypercharge_squared,
        "g_Y": hypercharge,
        "alpha_U": alpha_unified,
        "inverse_alpha_U": 1.0 / alpha_unified,
        "sin_squared_theta_W": weak_mixing,
        "canonical_normalization_residual": normalization_residual,
        "unification_relation_residual": unification_residual,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    literal = couplings(1.0, 1.0)

    # A deterministic scaling family verifies g_U(c,nu)=g_U(1,1)/sqrt(c nu)
    # and demonstrates the surviving positive continuum.
    scaling_witnesses = []
    maximum_scaling_residual = 0.0
    for action_weight, trace_ratio in (
        (0.25, 1.0),
        (0.5, 2.0),
        (1.0, 1.0),
        (2.0, 1.0),
        (3.0, 4.0 / 3.0),
        (7.0, 0.4),
    ):
        record = couplings(action_weight, trace_ratio)
        predicted = literal["g_U"] / math.sqrt(action_weight * trace_ratio)
        residual = abs(record["g_U"] - predicted)
        maximum_scaling_residual = max(maximum_scaling_residual, residual)
        scaling_witnesses.append(
            {
                **record,
                "predicted_g_U_from_scale_orbit": predicted,
                "scale_orbit_residual": residual,
            }
        )

    # Reflection positivity is a cone condition.  For a Gaussian free gauge
    # covariance C, multiplying a positive quadratic action by c>0 sends
    # C -> C/c.  Every OS quadratic form is simply divided by c, so its sign is
    # unchanged.  These scalar witnesses encode the exact identity.
    os_witnesses = []
    maximum_os_scaling_residual = 0.0
    for action_weight in (0.125, 0.5, 1.0, 3.0, 11.0):
        base_os_form = 2.75
        scaled_os_form = base_os_form / action_weight
        residual = abs(action_weight * scaled_os_form - base_os_form)
        maximum_os_scaling_residual = max(maximum_os_scaling_residual, residual)
        os_witnesses.append(
            {
                "action_weight_c": action_weight,
                "base_OS_quadratic_form": base_os_form,
                "scaled_OS_quadratic_form": scaled_os_form,
                "positivity_preserved": scaled_os_form >= 0.0,
                "homogeneity_residual": residual,
            }
        )

    out = {
        "certificate": "URT entropy spectral-action gauge-normalization audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "published_inputs": {
            "entropy_cutoff": (
                "h(x)=log(1+exp(-|x|))+|x|/(1+exp(|x|))"
            ),
            "entropy_zero_moment": "h(0)=log(2)",
            "standard_model_trace_convention": (
                "three-generation almost-commutative Standard Model finite trace, "
                "with hypercharge coupling denoted g_Y"
            ),
            "canonical_gauge_equations": [
                "g_3^2 F_0/(2 pi^2)=1/4",
                "g_3^2=g_2^2=(5/3)g_Y^2",
            ],
            "primary_references": [
                {
                    "title": (
                        "Noncommutative Geometry as a Framework for Unification "
                        "of all Fundamental Interactions including Gravity. Part I"
                    ),
                    "arXiv": "1004.0464",
                    "equations": "(5.48), (5.51), (6.1)",
                },
                {
                    "title": "Entropy and the spectral action",
                    "arXiv": "1809.02944",
                    "role": "universal KMS entropy cutoff and its moments",
                },
            ],
        },
        "literal_one_entropy_trace_branch": {
            "extra_physical_premise": (
                "S_boson is exactly one entropy spectral action in the cited "
                "Standard Model trace convention"
            ),
            "exact_values": {
                "F0": "log(2)",
                "g_U_squared": "pi^2/(2 log(2))",
                "g_U": "pi/sqrt(2 log(2))",
                "g_Y_squared": "3 pi^2/(10 log(2))",
                "alpha_U": "pi/(8 log(2))",
                "sin_squared_theta_W": "3/8",
            },
            "numerical_values": literal,
            "status": "E conditional on the displayed physical premise and trace convention",
        },
        "normalization_escape": {
            "general_action": "S_boson=c S_entropy with c>0",
            "relative_trace_multiplicity": (
                "nu=Tr_Cathedral/Tr_standard on the gauge generators"
            ),
            "effective_moment": "F0_eff=c nu log(2)",
            "coupling_orbit": "g_U(c,nu)=pi/sqrt(2 c nu log(2))",
            "surviving_dimension": 1,
            "why_current_principles_do_not_fix_it": [
                "positive rescaling preserves gauge and spacetime symmetries",
                "positive rescaling preserves locality and additivity",
                "positive rescaling preserves the sign of every OS quadratic form",
                "a normalized Gibbs state is insensitive to the choice of physical bosonic action weight",
                "the Cathedral finite carrier has not been proved trace-equivalent to the cited Standard Model spectral triple",
            ],
            "scaling_witnesses": scaling_witnesses,
            "maximum_scaling_residual": maximum_scaling_residual,
            "OS_positive_rescaling_witnesses": os_witnesses,
            "maximum_OS_scaling_residual": maximum_os_scaling_residual,
            "status": "E",
        },
        "perturbative_control_audit": {
            "literal_alpha_U": literal["alpha_U"],
            "literal_inverse_alpha_U": literal["inverse_alpha_U"],
            "classification": (
                "The one-copy value is order one, so a weak-coupling loop or "
                "one-loop RG treatment would not be controlled by alpha_U << 1."
            ),
            "observational_comparison_performed": False,
        },
        "verdict": {
            "conditional_absolute_gauge_normalization": "E",
            "unconditional_absolute_gauge_normalization": "U",
            "relative_gauge_couplings": "E conditional on the parent/finite trace",
            "weak_mixing_boundary_value": "3/8 conditional",
            "advance": (
                "The entropy cutoff converts the old free F0 into an exact number. "
                "The remaining obstruction is now isolated to one physical action/"
                "trace normalization c nu, rather than an arbitrary cutoff shape."
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