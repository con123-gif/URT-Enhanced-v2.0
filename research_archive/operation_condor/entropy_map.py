#!/usr/bin/env python3
"""
Continuum dictionary driven by the frozen entropy.
η_Δ = -ln Δ, responsive entropy structure.
No free parameter.
"""

import numpy as np
from math import log, sqrt

DELTA = 0.002489189840420375
ETA = -log(DELTA)                 # ≈ 5.9958
PHI = (1 + sqrt(5)) / 2
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

# p5 from the master state
p5 = DELTA**2 / (1 + DELTA**2)
# binary entropy (natural units)
def h2(p):
    if p <= 0 or p >= 1:
        return 0.0
    return -p*log(p) - (1-p)*log(1-p)

S = h2(p5)

def run():
    print(f"η_Δ     = {ETA:.6f}")
    print(f"p5      = {p5:.6e}")
    print(f"H2(p5)  = {S:.6f}")
    print()
    # Entropy-driven maps
    m1 = np.exp(-ETA * SIGMAS)
    m2 = np.exp(-ETA * SIGMAS / SIGMAS[0])
    m3 = np.exp(-S * SIGMAS / DELTA)          # strong
    m4 = PHI ** (-ETA * SIGMAS)
    m5 = np.exp(-(SIGMAS[0] - SIGMAS) * ETA)
    for name, m in [("exp(-η σ)", m1), ("exp(-η σ/σ1)", m2),
                    ("exp(-S σ/Δ)", m3), ("φ^(-η σ)", m4),
                    ("rel η", m5)]:
        m = m / m[0]
        print(f"{name:16s} {np.round(m, 8)}")
    print()
    print("Observed u-type: [1.0, 0.007341, 1.27e-5]")
    print("Entropy is frozen. No free parameter.")

if __name__ == "__main__":
    run()
