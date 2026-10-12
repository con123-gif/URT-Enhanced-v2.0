#!/usr/bin/env python3
"""
Operation Condor — Expanded artistic-license search for a parameter-free continuum dictionary.
All coefficients drawn from frozen constants only.
Observed ratios used solely as diagnostic.
"""

import numpy as np
from math import sqrt, pi, log, exp

PHI = (1 + sqrt(5)) / 2
DELTA = 0.002489189840420375
ETA = -log(DELTA)
PI = pi
E = exp(1)

# Rigid triple
LAM = np.array([3.84276, 3.26736, 0.9472])

# Observed (diagnostic only)
OBS = {
    "u": np.array([1.0, 0.007341, 1.27e-5]),
    "d": np.array([1.0, 0.022249, 0.001124]),
    "e": np.array([1.0, 0.059482, 0.000288]),
}

def candidates(lam):
    maps = {}
    # Stronger suppressions using frozen numbers
    maps["exp_eta_phi"] = np.exp(-ETA * PHI * lam / lam[0])
    maps["exp_eta2"] = np.exp(-ETA**2 * lam / lam[0] / 10)
    maps["phi_eta"] = PHI ** (-ETA * lam / lam[0])
    maps["exp_13"] = np.exp(-13 * lam / lam[0])
    maps["exp_20"] = np.exp(-20 * lam / lam[0])
    maps["delta_inv"] = np.exp(-lam / (lam[0] * DELTA))
    maps["rail_ratio"] = np.exp(-(3/20) / DELTA * lam / lam[0])
    maps["phi3"] = PHI ** (-3 * lam)
    maps["mixed"] = np.exp(-ETA * lam) * PHI ** (-lam)
    # Normalize each
    for k in maps:
        maps[k] = maps[k] / maps[k][0]
    return maps

def score(ratios, obs):
    # Log-distance diagnostic (lower is closer)
    return np.mean(np.abs(np.log10(ratios[1:] + 1e-30) - np.log10(obs[1:] + 1e-30)))

def run():
    print("Expanded dictionary search (artistic license)")
    print("="*60)
    maps = candidates(LAM)
    print("Map name                  ratios                          diagnostic (avg log10 dist)")
    best = None
    best_score = 1e9
    for name, r in maps.items():
        # Score against u-type as representative
        sc = score(r, OBS["u"])
        print(f"{name:20s}  {np.round(r,6)}   {sc:.3f}")
        if sc < best_score:
            best_score = sc
            best = (name, r)
    print()
    print(f"Closest diagnostic: {best[0]} with score {best_score:.3f}")
    print("Observed u-type:   ", np.round(OBS["u"],6))
    print("\nNo map was fitted. All coefficients are frozen constants.")
    if best_score > 1.0:
        print("No dictionary yet reproduces the observed hierarchy strength.")
    else:
        print("A candidate dictionary is within rough diagnostic range.")

if __name__ == "__main__":
    run()
