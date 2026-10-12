#!/usr/bin/env python3
"""
Attack the residual factor ~21 on the lightest generation
using only frozen counts.
"""

import numpy as np
from math import log, sqrt

DELTA = 0.002489189840420375
ETA = -log(DELTA)
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])
PHI = (1 + sqrt(5))/2

def best_so_far():
    gap = SIGMAS[0] - SIGMAS
    return np.exp(-gap * ETA) * np.exp(-4 * gap)

def run():
    base = best_so_far()
    base /= base[0]
    print("Current best:", np.round(base, 8))
    # Residual attack with frozen integers
    for n in [13, 12, 20, 5, 9, 81, 4, 3]:
        trial = base * np.exp(- (SIGMAS[0]-SIGMAS) * n / 10)
        trial /= trial[0]
        print(f"extra /{n:2d}: {np.round(trial, 8)}")
    print("Target lightest ~1.27e-5")

if __name__ == "__main__":
    run()
