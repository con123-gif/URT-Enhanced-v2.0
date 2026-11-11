#!/usr/bin/env python3
"""Audit of the 2025 "universal chaos invariant" measurement behind delta* ~ 0.1475.

Source: Google Drive `LYTOLLIS_LAW_COMPLETE_EVIDENCE.ipynb` (file id 1h9E4RbE4A5ijn2kZetxZx67OdYPC5CWk,
created 2025-11-27), paper "Lytollis's Law" (25 Nov 2025), Law 1 and the listing "Chaos Universality
Validator". The notebook's code cells only write the LaTeX paper; none of them executes the listings and
none has stored output. This script executes the listing's `compute_delta_from_trajectory` VERBATIM
(only re-indented). The listing calls generate_logistic / generate_tent / generate_henon without defining
them; the standard maps with the parameter ranges the listing states are used.

Claim under test (paper, Law 1): "19,343 systems converged (96.7%), delta_chaos = 0.1523 +- 0.0005,
CV 0.33% (exceptional universality)".

Certified here:
  1. The listing's "URTF refinement" is a fixed map R(delta0) that does not depend on the trajectory:
     delta <- delta - 0.5 exp(-i/8) (delta - 0.15)(1 + delta^2/(1+delta^2)), 30 times, with clipping.
     Its image over EVERY admissible raw value delta0 in [0.01, 1.0] is a narrow interval around the
     hard-coded 0.15 (printed below), fixed before any data is seen.
  2. White noise, a constant-free control with no chaos at all, gives the same "invariant".
  3. Replacing the hard-coded 0.15 by c moves the "universal invariant" to ~c.
  4. The raw estimator (D_KY from a sigmoid of the 1/e autocorrelation time, tau from std/mean of
     increments) is spread widely; the 0.33% CV is produced by step 1.
Scope: this concerns only the 2025 survey offered as evidence. The frozen Cathedral inputs
delta* = 80 pi/(1053 phi) and delta_cl = 3/20 are definitions and are NOT changed here.
Also checked: the listing's URTF example urt(10.0) "= 4.2e-12"; and the Law 6 ARF approximations.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
PI = np.pi
PHI = (1 + np.sqrt(5)) / 2
DELTA_STAR_2025 = 0.1475


# ---- listing "Chaos Universality Validator": compute_delta_from_trajectory, verbatim ------------------
def compute_delta_from_trajectory(traj, use_urt=True, setpoint=0.15):
    # `setpoint` is the listing's literal 0.15; it is a parameter here only for test 3.
    if traj is None or len(traj) < 100:
        return None
    traj_norm = (traj - np.mean(traj)) / (np.std(traj) + 1e-10)
    acf = np.correlate(traj_norm, traj_norm, 'full')
    acf = acf[len(acf)//2:] / acf[len(acf)//2]
    decay_indices = np.where(acf < np.exp(-1))[0]
    if len(decay_indices) == 0:
        return None
    decay_length = decay_indices[0]
    D_KY = 1 + 2 / (1 + np.exp(-decay_length/10))
    D_KY = np.clip(D_KY, 1.0, 5.0)
    fluctuations = np.abs(np.diff(traj_norm))
    tau = 2 + 0.5 * np.std(fluctuations) / (np.mean(fluctuations) + 1e-10)
    tau = np.clip(tau, 1.5, 3.5)
    delta = (D_KY - 1) * (tau - 2)
    delta = np.clip(delta, 0.01, 1.0)
    if use_urt:
        delta = refine(delta, setpoint)
    return delta


def refine(delta, setpoint=0.15):
    # the listing's "URTF refinement" loop, verbatim apart from the named setpoint
    for iter in range(30):
        kappa = delta**2 / (1 + delta**2)
        delta_update = 0.5 * np.exp(-iter/8) * (delta - setpoint) * (1 + kappa)
        delta -= delta_update
        delta = np.clip(delta, 0.001, 0.5)
    return delta


# ---- standard maps with the listing's parameter ranges (helpers not defined in the notebook) ----------
def generate_logistic(r, n_iter=1000, x0=0.4):
    x = np.empty(n_iter); x[0] = x0
    for i in range(1, n_iter):
        x[i] = r * x[i-1] * (1 - x[i-1])
    return x


def generate_tent(m, n_iter=1000, x0=0.4):
    x = np.empty(n_iter); x[0] = x0
    for i in range(1, n_iter):
        x[i] = m * min(x[i-1], 1 - x[i-1])
    return x


def generate_henon(a, b, n_iter=1000):
    x, y = 0.1, 0.1
    out = np.empty(n_iter)
    for i in range(n_iter):
        x, y = 1 - a * x * x + y, b * x
        if not np.isfinite(x) or abs(x) > 1e6:
            return None
        out[i] = x
    return out


def survey(rng, n_each, use_urt=True, setpoint=0.15):
    vals = []
    for _ in range(n_each):
        for traj in (generate_logistic(rng.uniform(3.6, 4.0)),
                     generate_tent(rng.uniform(1.5, 2.0)),
                     generate_henon(rng.uniform(1.0, 1.4), 0.3)):
            d = compute_delta_from_trajectory(traj, use_urt=use_urt, setpoint=setpoint)
            if d is not None:
                vals.append(float(d))
    return np.array(vals)


def stats(v):
    return {"n": int(v.size), "mean": float(v.mean()), "std": float(v.std()),
            "cv_percent": float(100 * v.std() / v.mean()), "min": float(v.min()), "max": float(v.max())}


def urt_listing(x, delta=DELTA_STAR_2025, max_iter=30, tol=1e-10):
    # listing "URTF Core Algorithm", verbatim
    pi_ratio = PI / PHI
    for iteration in range(max_iter):
        x_contracted = x - delta * np.tanh(x / delta)
        x_new = x_contracted * (1 + pi_ratio * delta**2)
        if np.allclose(x, x_new, rtol=tol):
            return x_new
        x = x_new
    return x


def main() -> int:
    out = {}
    # 1. the refinement is a data-independent map; its image over every admissible raw value
    grid = np.linspace(0.01, 1.0, 9901)
    img = np.array([refine(d) for d in grid])
    out["refinement_image_over_raw_0.01_to_1.0"] = [float(img.min()), float(img.max())]
    out["refinement_contraction_dR_ddelta0_at_0.15"] = float((refine(0.15 + 1e-6) - refine(0.15 - 1e-6)) / 2e-6)

    rng = np.random.default_rng(42)
    raw = survey(rng, 400, use_urt=False)
    rng = np.random.default_rng(42)
    ref = survey(rng, 400, use_urt=True)
    out["raw_estimator"] = stats(raw)
    out["refined_estimator"] = stats(ref)

    # 2. control: white noise (no dynamics at all)
    rng = np.random.default_rng(7)
    noise = np.array([compute_delta_from_trajectory(rng.standard_normal(1000)) for _ in range(300)], float)
    out["white_noise_refined"] = stats(noise)

    # 3. move the hard-coded setpoint
    out["setpoint_scan"] = {}
    for c in (0.10, 0.15, 0.30, 0.40):
        rng = np.random.default_rng(42)
        out["setpoint_scan"][str(c)] = stats(survey(rng, 100, use_urt=True, setpoint=c))

    # listing URTF example: docstring says urt(10.0) -> 4.2e-12
    out["urt_listing"] = {str(x0): float(urt_listing(x0)) for x0 in (0.5, 1.0, 5.0, 10.0, 100.0)}
    out["urt_listing_escape_threshold"] = float(DELTA_STAR_2025 * (1 + PI / PHI * DELTA_STAR_2025**2)
                                                / (PI / PHI * DELTA_STAR_2025**2))

    # Law 6 approximations versus the residues the paper calls empirical
    d = DELTA_STAR_2025
    approx = {"Delta_delta": -(d / PI)**2 / (2 * PI), "C_mass": 3 * PI**2 * d,
              "R_alpha": d**2 * PHI * (1 - d / 4), "R_mass": -PI**2 * PHI * d}
    emp = {"Delta_delta": -3.5959e-4, "C_mass": 4.4468, "R_alpha": 0.03380537, "R_mass": -2.43}
    out["law6_arf_percent_error"] = {k: float(100 * abs(approx[k] - emp[k]) / abs(emp[k])) for k in emp}

    print(json.dumps(out, indent=2))
    (HERE / "CHAOS_INVARIANT_REFINEMENT_AUDIT_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")

    lo, hi = out["refinement_image_over_raw_0.01_to_1.0"]
    assert 0.145 < lo and hi < 0.16, "refinement image is not pinned near 0.15"
    assert out["raw_estimator"]["cv_percent"] > 10 * out["refined_estimator"]["cv_percent"]
    assert abs(out["white_noise_refined"]["mean"] - 0.15) < 0.01, "noise control does not land on 0.15"
    for c, s in out["setpoint_scan"].items():
        assert abs(s["mean"] - float(c)) < 0.02 * max(1.0, float(c) / 0.15), f"setpoint {c} not tracked"
    assert abs(out["urt_listing"]["10.0"]) > 1.0, "urt(10) unexpectedly converges"
    print(f"PASS: the 2025 refinement maps every raw value in [0.01,1] into [{lo:.5f}, {hi:.5f}]; "
          f"white noise gives {out['white_noise_refined']['mean']:.5f}; the 'invariant' tracks the hard-coded setpoint.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
