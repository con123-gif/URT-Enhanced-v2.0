#!/usr/bin/env python3
"""
Combine the working relative-entropy map with the frozen 4Δ / four channels.
No free parameter.
"""

import numpy as np
from math import log, sqrt

DELTA = 0.002489189840420375
ETA = -log(DELTA)
FOUR_DELTA = 4 * DELTA
PHI = (1 + sqrt(5)) / 2
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

def run():
    print(f"η_Δ = {ETA:.4f}, 4Δ = {FOUR_DELTA:.6f}")
    # Relative entropy (already partial)
    rel = np.exp(-(SIGMAS[0] - SIGMAS) * ETA)
    # Extra four-channel suppression on the differences
    rel4 = np.exp(-(SIGMAS[0] - SIGMAS) * ETA / FOUR_DELTA)
    # Mild: relative entropy times golden on the lightest gap
    rel_phi = rel * PHI ** (-(SIGMAS[0] - SIGMAS))
    # Stiffness only on lightest
    gap = SIGMAS[0] - SIGMAS
    mixed = np.exp(-gap * ETA) * np.exp(-gap**2 / FOUR_DELTA)
    for name, m in [("rel η", rel), ("rel η/4Δ", rel4),
                    ("rel η * φ", rel_phi), ("mixed gap", mixed)]:
        m = m / m[0]
        print(f"{name:12s} {np.round(m, 8)}")
    print("Observed u:  [1.0, 0.007341, 1.27e-5]")

if __name__ == "__main__":
    run()
