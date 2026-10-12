#!/usr/bin/env python3
"""
4 * Delta from the dual rails.
Four channels / four forces / four orbits of overlaid icosahedra.
No free parameter.
"""

import numpy as np
from math import sqrt, log

PHI = (1 + sqrt(5)) / 2
D_CL = 0.15
D_STAR = 0.14751081015957962
DELTA = D_CL - D_STAR
FOUR_DELTA = 4 * DELTA
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

def maps(sig):
    out = {}
    # Golden power modulated by 4*Delta
    out["phi_4delta"] = PHI ** (-1/sig) * np.exp(-FOUR_DELTA / sig)
    out["phi_4delta_lin"] = PHI ** (-1/sig) * (1 - FOUR_DELTA * sig)
    out["exp_4delta"] = np.exp(-1/(sig * FOUR_DELTA))
    out["sig_over_4delta"] = np.exp(-sig / FOUR_DELTA)
    for k in list(out.keys()):
        out[k] = out[k] / out[k][0]
    return out

def run():
    print(f"Delta     = {DELTA:.12f}")
    print(f"4*Delta   = {FOUR_DELTA:.12f}")
    print()
    res = maps(SIGMAS)
    obs = np.array([1.0, 0.007341, 1.27e-5])
    for name, r in res.items():
        print(f"{name:20s} {np.round(r, 8)}")
    print()
    print("Observed u-type:    ", obs)
    print("Four channels / four orbits — frozen.")

if __name__ == "__main__":
    run()
