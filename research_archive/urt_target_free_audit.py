#!/usr/bin/env python3
"""
Target-free audit of the archived URT rail claim.

Tests:
1. Reproduce the archived raw estimator
       delta = (D - 1)(tau - 2)
   without the later iteration that explicitly pulls delta toward 0.15.
2. Sweep logistic, tent, and Henon systems.
3. Analyse the original URT contraction map around beta=0.1475 and beta=0.150.

This script deliberately contains no icosahedral constants, no golden ratio,
and no target value inside the raw estimator.
"""

from __future__ import annotations

import math
from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

ALPHA = 1.155
THETA_H = 2.4


def raw_urt_estimator(x: np.ndarray) -> tuple[float, float, float]:
    """Archived estimator before the explicit 0.15 refinement loop."""
    x = np.asarray(x, dtype=float).ravel()
    if x.size < 40 or not np.all(np.isfinite(x)):
        return math.nan, math.nan, math.nan

    sigma = float(np.std(x))
    if sigma < 1e-12:
        return math.nan, math.nan, math.nan

    x = (x - np.mean(x)) / (sigma + 1e-10)

    acf = np.correlate(x - np.mean(x), x - np.mean(x), mode="full")
    acf = acf[acf.size // 2:]
    if abs(acf[0]) < 1e-15:
        return math.nan, math.nan, math.nan
    acf /= acf[0]

    hits = np.where(acf < math.exp(-1))[0]
    decay_lag = int(hits[0]) if hits.size else len(acf) // 10

    D = 1.0 + 2.0 / (1.0 + math.exp(-decay_lag / 10.0))
    D = max(1.0, min(D, 5.0))

    variances = [np.var(x[i::20]) for i in range(20)]
    tau = 2.0 + 0.5 * np.mean(variances) / (np.std(variances) + 1e-10)
    tau = max(1.5, min(tau, 3.5))

    delta = (D - 1.0) * (tau - 2.0)
    delta = max(0.01, min(delta, 1.0))
    return float(delta), float(D), float(tau)


def archived_refinement(delta: float) -> float:
    """The later loop that explicitly attracts estimates toward 0.15."""
    delta = float(delta)
    for i in range(30):
        kappa = delta**2 / (1.0 + delta**2)
        delta -= 0.5 * math.exp(-i / 8.0) * (delta - 0.15) * (1.0 + kappa)
        delta = max(0.001, min(delta, 0.5))
    return delta


def logistic_map(r: float, n: int = 3000, x0: float = 0.123456) -> np.ndarray:
    x = np.empty(n)
    x[0] = x0
    for i in range(1, n):
        x[i] = r * x[i - 1] * (1.0 - x[i - 1])
    return x


def tent_map(m: float, n: int = 3000, x0: float = 0.123456) -> np.ndarray:
    x = np.empty(n)
    x[0] = x0
    for i in range(1, n):
        x[i] = m * x[i - 1] if x[i - 1] < 0.5 else m * (1.0 - x[i - 1])
    return x


def henon_map(
    a: float, b: float = 0.3, n: int = 3000,
    x0: float = 0.1, y0: float = 0.1
) -> np.ndarray | None:
    x = np.empty(n)
    y = np.empty(n)
    x[0], y[0] = x0, y0
    for i in range(1, n):
        x[i] = 1.0 - a * x[i - 1] ** 2 + y[i - 1]
        y[i] = b * x[i - 1]
        if not np.isfinite(x[i]) or abs(x[i]) > 1e6:
            return None
    return x


def phi(p: np.ndarray) -> np.ndarray:
    return np.where(np.abs(p) <= np.pi, np.sin(p), np.sign(p))


def urt_step(p: np.ndarray, beta: float, u: float = 0.0) -> np.ndarray:
    return beta * (ALPHA * (p - THETA_H * phi(p)) + u)


def run() -> tuple[pd.DataFrame, pd.DataFrame]:
    rows: list[dict[str, float | str]] = []

    for r in np.linspace(3.57, 4.0, 220):
        delta, D, tau = raw_urt_estimator(logistic_map(float(r))[500:])
        rows.append({"system": "logistic", "parameter": r, "delta_raw": delta, "D": D, "tau": tau})

    for m in np.linspace(1.5, 1.999, 220):
        delta, D, tau = raw_urt_estimator(tent_map(float(m))[500:])
        rows.append({"system": "tent", "parameter": m, "delta_raw": delta, "D": D, "tau": tau})

    for a in np.linspace(1.1, 1.42, 220):
        x = henon_map(float(a))
        if x is not None:
            delta, D, tau = raw_urt_estimator(x[500:])
            rows.append({"system": "henon", "parameter": a, "delta_raw": delta, "D": D, "tau": tau})

    raw = pd.DataFrame(rows)
    summary = raw.groupby("system")["delta_raw"].agg(
        count="count", mean="mean", std="std", minimum="min",
        median="median", maximum="max"
    ).reset_index()

    # Original URT contraction map: exact thresholds.
    beta_global_sufficient = 1.0 / (ALPHA * (1.0 + THETA_H))
    beta_local_zero = 1.0 / (ALPHA * abs(1.0 - THETA_H))

    audit = pd.DataFrame([
        {
            "quantity": "global sufficient contraction threshold beta",
            "value": beta_global_sufficient,
            "meaning": "beta below this satisfies the archived global norm bound",
        },
        {
            "quantity": "local zero fixed-point stability threshold beta",
            "value": beta_local_zero,
            "meaning": "the zero fixed point loses local stability here",
        },
        {
            "quantity": "local multiplier magnitude at beta=0.1475",
            "value": abs(0.1475 * ALPHA * (1.0 - THETA_H)),
            "meaning": "well inside contraction",
        },
        {
            "quantity": "local multiplier magnitude at beta=0.1500",
            "value": abs(0.1500 * ALPHA * (1.0 - THETA_H)),
            "meaning": "well inside contraction",
        },
    ])

    return raw, summary, audit


if __name__ == "__main__":
    output = Path(".")
    raw, summary, audit = run()

    print("\nRAW ESTIMATOR SUMMARY")
    print(summary.to_string(index=False))

    print("\nORIGINAL URT MAP THRESHOLDS")
    print(audit.to_string(index=False))

    print("\nARCHIVED REFINEMENT TEST")
    for initial in (0.001, 0.01, 0.05, 0.1475, 0.15, 0.3, 0.5, 1.0):
        print(f"{initial:8.4f} -> {archived_refinement(initial):.12f}")

    summary.to_csv(output / "urt_target_free_audit_summary.csv", index=False)

    fig, ax = plt.subplots(figsize=(8, 5))
    for system, group in raw.groupby("system"):
        ax.scatter(group["parameter"], group["delta_raw"], s=9, alpha=0.55, label=system)
    ax.axhline(0.1475, linestyle="--", linewidth=1.2, label="claimed lower rail")
    ax.axhline(0.1500, linestyle=":", linewidth=1.2, label="claimed upper rail")
    ax.set_xlabel("system parameter")
    ax.set_ylabel("raw archived delta estimator")
    ax.set_title("Target-free archived URT estimator")
    ax.legend()
    ax.grid(alpha=0.25)
    fig.tight_layout()
    fig.savefig(output / "urt_target_free_audit.png", dpi=180)