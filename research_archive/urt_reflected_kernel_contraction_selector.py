#!/usr/bin/env python3
"""Uniform-contraction audit on the full reflected overlap family.

The pre-reflection Cathedral coefficient was selected on an A4-root symbol.
It cannot be copied unchanged to the reflection-closed cubic-slice symbol.
This script therefore re-runs the same target-blind condition-number rule on

  F(w,p)=S^2+c_t^2 C^2 sin^2(w)
         +[r B+1-C cos(w)-M]^2,

where B=sum_i(1-cos p_i), S^2=sum_i sin^2 p_i and
C=prod_i cos(p_i/2).  The temporal Wilson coefficient is one.

On the low-height free-OS region,

  0<c_t<=1,  0<M<=1-sqrt(1-c_t^2),

the radicand is monotone in y=cos(w): its minimum is at y=+1 and
its maximum at y=-1.  Both endpoint values are independent of c_t.
Consequently uniform contraction cannot select c_t.  It can at most select
(r,M) and leave a continuous interval

  sqrt(2M-M^2) <= c_t <= 1.

The (r,M) extremum is found from its active KKT system and independently
checked by full three-variable global searches.  This numerical selection is
kept N; the flat c_t direction is an exact algebraic no-go.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np
from scipy.optimize import differential_evolution, root


def one_axis_minimum(t: float, r_value: float, height: float) -> float:
    a_value = 1.0 - height
    return 4.0 * t * t * (1.0 - t * t) + (
        a_value + 2.0 * r_value * (1.0 - t * t) - t
    ) ** 2


def symmetric_maximum(t: float, r_value: float, height: float) -> float:
    a_value = 1.0 - height
    return 12.0 * t * t * (1.0 - t * t) + (
        a_value + 6.0 * r_value * (1.0 - t * t) + t**3
    ) ** 2


def contraction_kkt(values: np.ndarray) -> np.ndarray:
    r_value, height, u_value, v_value, multiplier = values
    a_value = 1.0 - height

    g_min = a_value + 2.0 * r_value * (1.0 - u_value**2) - u_value
    f_min = 4.0 * u_value**2 * (1.0 - u_value**2) + g_min**2
    f_min_u = (
        8.0 * u_value
        - 16.0 * u_value**3
        + 2.0 * g_min * (-4.0 * r_value * u_value - 1.0)
    )
    constraint = f_min - height**2
    constraint_r = 4.0 * (1.0 - u_value**2) * g_min
    constraint_height = -2.0 * g_min - 2.0 * height

    g_max = a_value + 6.0 * r_value * (1.0 - v_value**2) + v_value**3
    f_max = 12.0 * v_value**2 * (1.0 - v_value**2) + g_max**2
    f_max_v = (
        24.0 * v_value
        - 48.0 * v_value**3
        + 2.0 * g_max * (-12.0 * r_value * v_value + 3.0 * v_value**2)
    )
    f_max_r = 12.0 * (1.0 - v_value**2) * g_max
    f_max_height = -2.0 * g_max

    return np.array(
        [
            constraint,
            f_min_u,
            f_max_v,
            f_max_r / f_max + multiplier * constraint_r,
            f_max_height / f_max
            - 2.0 / height
            + multiplier * constraint_height,
        ]
    )


def inherited_os_kkt(values: np.ndarray) -> np.ndarray:
    r_value, height, t_value, v_value, multiplier = values
    c_squared = 4.0 / 5.0
    delta = 1.0 / 5.0
    a_value = 1.0 - height

    b_value = 6.0 * (1.0 - t_value**2)
    s_squared = 12.0 * t_value**2 * (1.0 - t_value**2)
    incidence = t_value**3
    a_spatial = a_value + r_value * b_value
    os_margin = c_squared * a_spatial**2 - delta * (
        s_squared + c_squared * incidence**2
    )
    os_margin_t = (
        2.0 * c_squared * a_spatial * (-12.0 * r_value * t_value)
        - delta
        * (
            24.0 * t_value
            - 48.0 * t_value**3
            + 6.0 * c_squared * t_value**5
        )
    )
    os_margin_r = 2.0 * c_squared * a_spatial * b_value
    os_margin_height = -2.0 * c_squared * a_spatial

    g_max = a_value + 6.0 * r_value * (1.0 - v_value**2) + v_value**3
    f_max = 12.0 * v_value**2 * (1.0 - v_value**2) + g_max**2
    f_max_v = (
        24.0 * v_value
        - 48.0 * v_value**3
        + 2.0 * g_max * (-12.0 * r_value * v_value + 3.0 * v_value**2)
    )
    f_max_r = 12.0 * (1.0 - v_value**2) * g_max
    f_max_height = -2.0 * g_max

    return np.array(
        [
            os_margin,
            os_margin_t,
            f_max_v,
            f_max_r / f_max + multiplier * os_margin_r,
            f_max_height / f_max
            - 2.0 / height
            + multiplier * os_margin_height,
        ]
    )


def spatial_endpoint_value(
    x_values: np.ndarray, r_value: float, height: float, sign: int
) -> float:
    b_value = float(np.sum(1.0 - x_values))
    s_squared = float(np.sum(1.0 - x_values**2))
    incidence = math.sqrt(max(0.0, float(np.prod((1.0 + x_values) / 2.0))))
    a_value = 1.0 - height + r_value * b_value
    return s_squared + (a_value + sign * incidence) ** 2


def os_discriminant_margin(
    x_values: np.ndarray,
    r_value: float,
    height: float,
    temporal_kinetic: float,
) -> float:
    c_squared = temporal_kinetic**2
    delta = 1.0 - c_squared
    b_value = float(np.sum(1.0 - x_values))
    s_squared = float(np.sum(1.0 - x_values**2))
    incidence_squared = max(0.0, float(np.prod((1.0 + x_values) / 2.0)))
    a_value = 1.0 - height + r_value * b_value
    return c_squared * a_value**2 - delta * (
        s_squared + c_squared * incidence_squared
    )


def global_searches(
    r_value: float,
    height: float,
    temporal_kinetic: float,
    seeds: int = 12,
) -> dict[str, Any]:
    min_rows = []
    max_rows = []
    os_rows = []
    for seed in range(seeds):
        minimum = differential_evolution(
            lambda x: spatial_endpoint_value(x, r_value, height, -1),
            [(-1.0, 1.0)] * 3,
            seed=1000 + seed,
            popsize=18,
            tol=1.0e-11,
            polish=True,
            workers=1,
        )
        maximum = differential_evolution(
            lambda x: -spatial_endpoint_value(x, r_value, height, +1),
            [(-1.0, 1.0)] * 3,
            seed=2000 + seed,
            popsize=18,
            tol=1.0e-11,
            polish=True,
            workers=1,
        )
        os_result = differential_evolution(
            lambda x: os_discriminant_margin(
                x, r_value, height, temporal_kinetic
            ),
            [(-1.0, 1.0)] * 3,
            seed=3000 + seed,
            popsize=18,
            tol=1.0e-11,
            polish=True,
            workers=1,
        )
        min_rows.append({"value": float(minimum.fun), "x": minimum.x.tolist()})
        max_rows.append({"value": float(-maximum.fun), "x": maximum.x.tolist()})
        os_rows.append({"value": float(os_result.fun), "x": os_result.x.tolist()})

    # Differential evolution does not always retain boundary points, so include
    # all exact corners explicitly in the certified comparison.
    corners = [
        np.array([x, y, z], dtype=float)
        for x in (-1.0, 1.0)
        for y in (-1.0, 1.0)
        for z in (-1.0, 1.0)
    ]
    corner_minimum = min(
        spatial_endpoint_value(x, r_value, height, -1) for x in corners
    )
    corner_maximum = max(
        spatial_endpoint_value(x, r_value, height, +1) for x in corners
    )
    corner_os = min(
        os_discriminant_margin(x, r_value, height, temporal_kinetic)
        for x in corners
    )
    return {
        "minimum": min(corner_minimum, *(row["value"] for row in min_rows)),
        "maximum": max(corner_maximum, *(row["value"] for row in max_rows)),
        "minimum_OS_margin": min(corner_os, *(row["value"] for row in os_rows)),
        "minimum_multistarts": min_rows,
        "maximum_multistarts": max_rows,
        "OS_multistarts": os_rows,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    selected = root(
        contraction_kkt,
        np.array([0.3555, 0.79094, 0.24224, 0.54201, -1.10]),
        method="lm",
        options={"ftol": 1.0e-14, "xtol": 1.0e-14, "gtol": 1.0e-14},
    )
    if not selected.success:
        raise RuntimeError(selected.message)
    r_value, height, u_value, v_value, multiplier = selected.x
    kkt_residual = float(np.max(np.abs(contraction_kkt(selected.x))))

    minimum = height**2
    active_minimum = one_axis_minimum(u_value, r_value, height)
    maximum = symmetric_maximum(v_value, r_value, height)
    condition_number = maximum / minimum
    optimal_step = 2.0 / (minimum + maximum)
    contraction_factor = (condition_number - 1.0) / (condition_number + 1.0)

    c_min = math.sqrt(2.0 * height - height**2)
    tau_max = 1.0 / c_min
    gauge_ratio_max = 8.0 * tau_max**2 - 4.0
    sufficient_os_lhs = c_min**2 * (1.0 - height) * r_value
    sufficient_os_rhs = 1.0 - c_min**2
    if sufficient_os_lhs < sufficient_os_rhs:
        raise AssertionError((sufficient_os_lhs, sufficient_os_rhs))

    global_checks = global_searches(r_value, height, c_min, seeds=12)
    global_min_residual = abs(global_checks["minimum"] - minimum)
    global_max_residual = abs(global_checks["maximum"] - maximum)
    if global_checks["minimum_OS_margin"] < -1.0e-9:
        raise AssertionError(global_checks["minimum_OS_margin"])

    inherited = root(
        inherited_os_kkt,
        np.array([0.2741, 0.51794, 0.95948, 0.63260, -4.54]),
        method="lm",
        options={"ftol": 1.0e-14, "xtol": 1.0e-14, "gtol": 1.0e-14},
    )
    if not inherited.success:
        raise RuntimeError(inherited.message)
    inherited_r, inherited_m, inherited_t, inherited_v, inherited_multiplier = inherited.x
    inherited_kkt_residual = float(np.max(np.abs(inherited_os_kkt(inherited.x))))
    inherited_minimum = inherited_m**2
    inherited_maximum = symmetric_maximum(inherited_v, inherited_r, inherited_m)
    inherited_condition = inherited_maximum / inherited_minimum
    inherited_c = 2.0 / math.sqrt(5.0)
    inherited_checks = global_searches(
        inherited_r, inherited_m, inherited_c, seeds=8
    )

    # Directly verify the exact c_t-flat endpoint identity at random momenta.
    rng = np.random.default_rng(20260904)
    c_flat_residual = 0.0
    for _ in range(100_000):
        x_values = rng.uniform(-1.0, 1.0, size=3)
        b_value = float(np.sum(1.0 - x_values))
        s_squared = float(np.sum(1.0 - x_values**2))
        incidence = math.sqrt(max(0.0, float(np.prod((1.0 + x_values) / 2.0))))
        a_value = 1.0 - height + r_value * b_value
        for y_value in (-1.0, 1.0):
            endpoint_reference = s_squared + (a_value - incidence * y_value) ** 2
            for c_value in (c_min, (1.0 + c_min) / 2.0, 1.0):
                direct = (
                    s_squared
                    + c_value**2 * incidence**2 * (1.0 - y_value**2)
                    + (a_value - incidence * y_value) ** 2
                )
                c_flat_residual = max(c_flat_residual, abs(direct - endpoint_reference))

    out: dict[str, Any] = {
        "certificate": "URT reflected-kernel uniform-contraction selector",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "exact_reduction": {
            "radicand": (
                "F(y,p)=S^2+c_t^2 C^2(1-y^2)+[rB+1-M-Cy]^2"
            ),
            "OS_low_height_condition": (
                "0<c_t<=1 and 0<M<=1-sqrt(1-c_t^2), with full R_p>=0"
            ),
            "monotonicity": (
                "A=rB+1-M>=sqrt(1-c_t^2)>=(1-c_t^2)C, "
                "so dF/dy<=0 on [-1,1]"
            ),
            "minimum_time_face": "y=+1",
            "maximum_time_face": "y=-1",
            "endpoint_values": "S^2+[rB+1-M-/+C]^2",
            "temporal_kinetic_cancels": True,
            "random_endpoint_identity_residual": c_flat_residual,
            "status": "E",
        },
        "global_numerical_selector": {
            "spatial_wilson_r": r_value,
            "overlap_height_M": height,
            "active_one_axis_minimum_t": u_value,
            "active_symmetric_maximum_t": v_value,
            "KKT_multiplier": multiplier,
            "KKT_residual": kkt_residual,
            "minimum_XdaggerX": minimum,
            "equal_active_minimum": active_minimum,
            "maximum_XdaggerX": maximum,
            "condition_number": condition_number,
            "optimal_relaxation_step": optimal_step,
            "optimal_contraction_factor": contraction_factor,
            "full_search_minimum": global_checks["minimum"],
            "full_search_maximum": global_checks["maximum"],
            "full_search_minimum_residual": global_min_residual,
            "full_search_maximum_residual": global_max_residual,
            "full_search_minimum_OS_margin": global_checks["minimum_OS_margin"],
            "multistarts": global_checks,
            "status": "N strong KKT plus independent multistart; global algebraic proof open",
        },
        "exact_flat_direction": {
            "c_t_interval": [c_min, 1.0],
            "exact_interval_formula": "sqrt(2M_*-M_*^2)<=c_t<=1",
            "tau_interval": [1.0, tau_max],
            "gauge_spatial_to_electric_ratio_interval": [4.0, gauge_ratio_max],
            "sufficient_full_OS_lhs": sufficient_os_lhs,
            "sufficient_full_OS_rhs": sufficient_os_rhs,
            "all_points_have_same_condition_number": condition_number,
            "status": "E conditional on the selected numerical (r,M): c_t is not selected",
        },
        "inherited_metric_comparison": {
            "c_t": inherited_c,
            "tau": math.sqrt(5.0) / 2.0,
            "spatial_wilson_r": inherited_r,
            "overlap_height_M": inherited_m,
            "active_OS_symmetric_t": inherited_t,
            "active_maximum_t": inherited_v,
            "KKT_multiplier": inherited_multiplier,
            "KKT_residual": inherited_kkt_residual,
            "minimum_XdaggerX": inherited_minimum,
            "maximum_XdaggerX": inherited_maximum,
            "condition_number": inherited_condition,
            "contraction_factor": (inherited_condition - 1.0)
            / (inherited_condition + 1.0),
            "full_search_minimum": inherited_checks["minimum"],
            "full_search_maximum": inherited_checks["maximum"],
            "full_search_minimum_OS_margin": inherited_checks[
                "minimum_OS_margin"
            ],
            "comparison": "strictly worse than the global contraction minimum",
            "status": "N constrained optimum on the inherited c_t slice",
        },
        "verdict": {
            "old_A4_root_r_may_be_reused": False,
            "uniform_contraction_selects_r_and_M": "N within the reflected family",
            "uniform_contraction_selects_time_aspect": False,
            "inherited_A4_metric_is_global_minimizer": False,
            "surviving_exact_modulus": "c_t in a nonzero closed interval",
            "next_calculation": (
                "Audit whether a target-blind locality or positive-transfer criterion "
                "is constant on, or uniquely resolves, the c_t interval."
            ),
            "status": "E continuous no-go for the time aspect; N for numerical bounds",
        },
    }

    text = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text, encoding="utf-8")
    else:
        print(text, end="")


if __name__ == "__main__":
    main()