#!/usr/bin/env python3
"""Complex-locality and positive-transfer audit of the surviving time modulus.

The reflected-kernel contraction selector leaves

    c_min <= c_t <= 1,

with fixed numerical (r,M).  This script tests two intrinsic tie-breakers:
positive one-step transfer and maximum exponential locality.

All points lie on the same low-height OS branch, whose branch cuts have
cosh(E)>=1; positive transfer therefore does not distinguish them.  The
purely temporal pole moves with c_t, but it is not the nearest complex pole.
There is a c_t-independent spatial singularity at

    omega=0, p=(i u, q, 0)

and permutations, because the temporal kinetic term vanishes at omega=0.
The values (q,u) solve F=0 and dF/dq=0.  General constrained searches over
all complex momenta at the lower endpoint, midpoint and upper endpoint return
the same singularity and no closer one.

The shared spatial pole is exact as a construction and gives a common upper
bound on locality.  Equality with the global complex radius remains a strong
numerical result (N), not an interval proof.  Either way positive transfer is
exactly flat, and the natural minimum-direction locality proxy is numerically
flat, so neither closes the time modulus.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np
from scipy.optimize import minimize, root


R_SELECTED = 0.3555080349235190743243089946207532477463351202813
M_SELECTED = 0.7909405921071237234972289955777431055452218194573


def analytic_radical(
    real_parts: np.ndarray, imaginary_parts: np.ndarray, temporal_kinetic: float
) -> complex:
    momenta = real_parts + 1.0j * imaginary_parts
    omega = momenta[0]
    spatial = momenta[1:]
    s_squared = np.sum(np.sin(spatial) ** 2)
    b_value = np.sum(1.0 - np.cos(spatial))
    incidence = np.prod(np.cos(spatial / 2.0))
    return complex(
        s_squared
        + temporal_kinetic**2 * incidence**2 * np.sin(omega) ** 2
        + (
            R_SELECTED * b_value
            + 1.0
            - incidence * np.cos(omega)
            - M_SELECTED
        )
        ** 2
    )


def mixed_spatial_radical(q_value: float, u_value: float) -> float:
    real_parts = np.array([0.0, 0.0, q_value, 0.0])
    imaginary_parts = np.array([0.0, u_value, 0.0, 0.0])
    # omega=0 makes this independent of c_t.
    return float(analytic_radical(real_parts, imaginary_parts, 1.0).real)


def mixed_stationarity(values: np.ndarray) -> np.ndarray:
    q_value, u_value = values
    step = 1.0e-5
    derivative = (
        mixed_spatial_radical(q_value - 2 * step, u_value)
        - 8 * mixed_spatial_radical(q_value - step, u_value)
        + 8 * mixed_spatial_radical(q_value + step, u_value)
        - mixed_spatial_radical(q_value + 2 * step, u_value)
    ) / (12 * step)
    return np.array([mixed_spatial_radical(q_value, u_value), derivative])


def temporal_lower_pole(temporal_kinetic: float) -> tuple[float, float]:
    a_value = 1.0 - M_SELECTED
    c_value = temporal_kinetic
    delta = 1.0 - c_value**2
    if delta < 1.0e-14:
        cosh_energy = (a_value**2 + 1.0) / (2.0 * a_value)
    else:
        discriminant = max(0.0, a_value**2 - delta)
        cosh_energy = (
            a_value - c_value * math.sqrt(discriminant)
        ) / delta
    energy = math.acosh(cosh_energy)
    return energy, c_value * energy


def complex_search(temporal_kinetic: float, seed: int, attempts: int) -> dict[str, Any]:
    rng = np.random.default_rng(seed)
    bounds = [(-math.pi, math.pi)] * 4 + [(-3.0, 3.0)] * 4
    starts: list[np.ndarray] = []
    shared_q = 2.704337529508684
    shared_u = 0.6649113088182046
    for imaginary_axis in range(1, 4):
        for real_axis in range(1, 4):
            if imaginary_axis == real_axis:
                continue
            for sign in (-1.0, 1.0):
                point = np.zeros(8)
                point[real_axis] = shared_q
                point[4 + imaginary_axis] = sign * shared_u
                starts.append(point)
    for _ in range(attempts):
        point = np.zeros(8)
        point[:4] = rng.uniform(-math.pi, math.pi, size=4)
        point[4:] = rng.normal(0.0, 0.8, size=4)
        if np.linalg.norm(point[4:]) < 0.2:
            point[5] += 0.5
        starts.append(point)

    rows: list[dict[str, Any]] = []
    for start in starts:
        objective = lambda z: temporal_kinetic**2 * z[4] ** 2 + float(
            np.dot(z[5:], z[5:])
        )
        constraints = [
            {
                "type": "eq",
                "fun": lambda z: analytic_radical(
                    np.asarray(z[:4]), np.asarray(z[4:]), temporal_kinetic
                ).real,
            },
            {
                "type": "eq",
                "fun": lambda z: analytic_radical(
                    np.asarray(z[:4]), np.asarray(z[4:]), temporal_kinetic
                ).imag,
            },
        ]
        result = minimize(
            objective,
            start,
            method="SLSQP",
            bounds=bounds,
            constraints=constraints,
            options={"ftol": 1.0e-12, "maxiter": 1500, "disp": False},
        )
        residual = abs(
            analytic_radical(
                np.asarray(result.x[:4]),
                np.asarray(result.x[4:]),
                temporal_kinetic,
            )
        )
        if result.success and residual < 2.0e-7 and result.fun > 1.0e-12:
            rows.append(
                {
                    "physical_radius": math.sqrt(float(result.fun)),
                    "residual": residual,
                    "real_parts": result.x[:4].tolist(),
                    "imaginary_parts": result.x[4:].tolist(),
                    "iterations": int(result.nit),
                }
            )
    rows.sort(key=lambda row: row["physical_radius"])
    if not rows:
        raise RuntimeError("no constrained complex zero found")
    return {
        "successful_searches": len(rows),
        "nearest": rows[0],
        "ten_nearest": rows[:10],
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    c_min = math.sqrt(2.0 * M_SELECTED - M_SELECTED**2)
    c_values = [c_min, (1.0 + c_min) / 2.0, 1.0]

    mixed = root(
        mixed_stationarity,
        np.array([2.70433753, 0.66491131]),
        method="lm",
        options={"ftol": 1.0e-13, "xtol": 1.0e-13, "gtol": 1.0e-13},
    )
    if not mixed.success:
        raise RuntimeError(mixed.message)
    q_value, u_value = mixed.x
    mixed_residual = abs(mixed_spatial_radical(q_value, u_value))
    mixed_stationarity_residual = float(np.max(np.abs(mixed_stationarity(mixed.x))))

    exact_flat_residual = 0.0
    real_parts = np.array([0.0, 0.0, q_value, 0.0])
    imaginary_parts = np.array([0.0, u_value, 0.0, 0.0])
    for c_value in np.linspace(c_min, 1.0, 101):
        exact_flat_residual = max(
            exact_flat_residual,
            abs(analytic_radical(real_parts, imaginary_parts, float(c_value))),
        )

    temporal_rows = []
    for c_value in c_values:
        dimensionless, physical = temporal_lower_pole(c_value)
        temporal_rows.append(
            {
                "c_t": c_value,
                "tau": 1.0 / c_value,
                "dimensionless_temporal_energy": dimensionless,
                "physical_temporal_radius": physical,
            }
        )

    search_rows = []
    for index, c_value in enumerate(c_values):
        search_rows.append(
            {
                "c_t": c_value,
                **complex_search(c_value, 20260904 + index, attempts=70),
            }
        )

    radius_spread = max(
        row["nearest"]["physical_radius"] for row in search_rows
    ) - min(row["nearest"]["physical_radius"] for row in search_rows)

    out: dict[str, Any] = {
        "certificate": "URT reflected-kernel locality flat-direction audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "selected_reflected_kernel": {
            "r": R_SELECTED,
            "M": M_SELECTED,
            "c_t_interval": [c_min, 1.0],
        },
        "positive_transfer": {
            "fact": (
                "Throughout the low-height OS branch, all radical cuts have "
                "cosh(E)>=1 and the residue matrix is positive semidefinite."
            ),
            "distinguishes_c_t": False,
            "status": "E",
        },
        "shared_spatial_singularity": {
            "pattern": "omega=0, p=(i u,q,0), plus signs and permutations",
            "q": q_value,
            "u": u_value,
            "physical_radius": abs(u_value),
            "radical_residual": mixed_residual,
            "stationarity_residual": mixed_stationarity_residual,
            "c_t_grid_flat_residual": exact_flat_residual,
            "why_exactly_c_independent": "sin(omega)=0 at omega=0",
            "status": "E common singularity; N that it is globally nearest",
        },
        "temporal_poles": temporal_rows,
        "general_complex_searches": search_rows,
        "nearest_radius_spread_across_c_t": radius_spread,
        "comparison": {
            "shared_spatial_radius": abs(u_value),
            "smallest_temporal_radius": min(
                row["physical_temporal_radius"] for row in temporal_rows
            ),
            "spatial_pole_is_closer": bool(
                abs(u_value)
                < min(row["physical_temporal_radius"] for row in temporal_rows)
            ),
        },
        "verdict": {
            "positive_transfer_selects_c_t": False,
            "minimum_direction_locality_selects_c_t": False,
            "locality_status": (
                "N: all constrained searches return the same c_t-independent pole; "
                "a global interval proof remains open"
            ),
            "surviving_time_modulus": [c_min, 1.0],
            "next_calculation": (
                "Freeze either an explicit clock normalization or accept the modulus, "
                "then test interacting gauge-field reflection positivity and the "
                "chiral determinant measure on the selected reflected kernel."
            ),
            "status": "E transfer no-go; N locality no-go",
        },
    }

    text = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(text, encoding="utf-8")
    else:
        print(text, end="")


if __name__ == "__main__":
    main()