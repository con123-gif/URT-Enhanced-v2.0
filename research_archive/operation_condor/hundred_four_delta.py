#!/usr/bin/env python3
"""
100 * 4 * Delta ≈ 1
Four channels already frozen; 100 examined as diagnostic scale.
"""

import numpy as np
from math import sqrt

PHI = (1 + sqrt(5)) / 2
DELTA = 0.002489189840420375
FOUR_DELTA = 4 * DELTA
SCALE = 1 / FOUR_DELTA   # ≈ 100.43
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

def run():
    print(f"4Δ          = {FOUR_DELTA:.10f}")
    print(f"1/(4Δ)      = {SCALE:.6f}")
    print(f"100*4Δ      = {100*FOUR_DELTA:.6f}")
    print()
    # Apply the scale inside the golden map
    base = PHI ** (-1/SIGMAS)
    scaled = base * np.exp(-SCALE * SIGMAS / 10)   # mild insertion of the ~100
    base /= base[0]
    scaled /= scaled[0]
    print("Base:          ", np.round(base, 8))
    print("With ~100:     ", np.round(scaled, 8))
    print("Observed u:    ", [1.0, 0.007341, 1.27e-5])
    print()
    print("100×4Δ ≈ 0.9957 ≈ 1. Proximity recorded.")

if __name__ == "__main__":
    run()
