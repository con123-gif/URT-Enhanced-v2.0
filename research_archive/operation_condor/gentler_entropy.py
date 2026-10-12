#!/usr/bin/env python3
"""
Gentler combinations: relative entropy plus small frozen powers.
"""

import numpy as np
from math import log, sqrt

DELTA = 0.002489189840420375
ETA = -log(DELTA)
PHI = (1 + sqrt(5)) / 2
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

def run():
    gap = SIGMAS[0] - SIGMAS
    rel = np.exp(-gap * ETA)
    # Extra suppressions with small frozen numbers
    variants = {
        "rel": rel,
        "rel * φ^gap": rel * PHI**(-gap),
        "rel * φ^(2gap)": rel * PHI**(-2*gap),
        "rel * exp(-gap*4)": rel * np.exp(-gap*4),
        "rel * exp(-gap/φ)": rel * np.exp(-gap/PHI),
        "rel * (1-gap)**13": rel * (1-gap)**13,
    }
    obs = np.array([1.0, 0.007341, 1.27e-5])
    print("Map                  ratios                     |log dist to u|")
    for name, m in variants.items():
        m = m / m[0]
        dist = np.mean(np.abs(np.log10(m[1:]+1e-30) - np.log10(obs[1:]+1e-30)))
        print(f"{name:20s} {np.round(m,8)}   {dist:.3f}")
    print("Observed:           ", obs)

if __name__ == "__main__":
    run()
