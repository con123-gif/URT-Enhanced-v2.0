#!/usr/bin/env python3
"""
1/(4Δ) ≈ 100.43 as generation stiffness.
Only frozen objects.
"""

import numpy as np
from math import sqrt, exp

PHI = (1 + sqrt(5)) / 2
DELTA = 0.002489189840420375
STIFF = 1 / (4 * DELTA)          # ≈ 100.434
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

def run():
    print(f"Stiffness 1/(4Δ) = {STIFF:.6f}")
    pure = np.exp(-SIGMAS * STIFF)
    pure /= pure[0]
    mixed = (PHI ** (-1/SIGMAS)) * np.exp(-SIGMAS * STIFF / 10)
    mixed /= mixed[0]
    print("Pure stiffness:  ", np.round(pure, 10))
    print("Mixed (mild):    ", np.round(mixed, 8))
    print("Observed u-type: ", [1.0, 7.341e-3, 1.27e-5])
    print()
    # Also try relative
    rel = np.exp(-(SIGMAS - SIGMAS[0]) * STIFF)
    print("Relative to heaviest:", np.round(rel, 10))

if __name__ == "__main__":
    run()
