#!/usr/bin/env python3
"""
Direct map from the original singular scales (artistic license).
"""

import numpy as np
from math import sqrt, log, exp

PHI = (1 + sqrt(5)) / 2
DELTA = 0.002489189840420375
ETA = -log(DELTA)
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

def maps(sig):
    out = {}
    out["exp_eta"] = np.exp(-ETA * sig)
    out["exp_phi_eta"] = np.exp(-PHI * ETA * sig)
    out["phi_power"] = PHI ** (-1/sig)
    out["delta_power"] = DELTA ** (sig)
    out["inv_sig"] = np.exp(-1/sig)
    for k in out:
        out[k] = out[k] / out[k][0]
    return out

def run():
    print("Direct singular-scale maps")
    print(maps(SIGMAS))
    obs_u = np.array([1.0, 0.007341, 1.27e-5])
    print("Observed u:", obs_u)

if __name__ == "__main__":
    run()
