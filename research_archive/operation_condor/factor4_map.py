#!/usr/bin/env python3
"""
Incorporate the frozen factor of 4 (geometry sector / M4 diagonal).
Artistic license, no free parameter.
"""

import numpy as np
from math import sqrt

PHI = (1 + sqrt(5)) / 2
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

def base_map(sig):
    return PHI ** (-1/sig)

def with_factor4(sig):
    # Frozen 4 from the geometry/coframe sector
    return (PHI ** (-1/sig)) * (4 ** (-sig))

def run():
    base = base_map(SIGMAS)
    base = base / base[0]
    f4 = with_factor4(SIGMAS)
    f4 = f4 / f4[0]
    print("Base golden-power:     ", np.round(base, 8))
    print("With frozen factor 4:  ", np.round(f4, 8))
    print("Observed u-type:       ", [1.0, 0.007341, 1.27e-5])
    print()
    print("Lightest ratio (factor4):", f4[2])
    print("Observed lightest:      ", 1.27e-5)
    print("Ratio obs/pred:         ", 1.27e-5 / f4[2])

if __name__ == "__main__":
    run()
