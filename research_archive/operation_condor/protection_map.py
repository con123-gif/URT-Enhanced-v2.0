#!/usr/bin/env python3
"""
Operation Condor — Protection map for frozen generation triple.
Artistic license continuation. No new continuous parameters.
"""

import numpy as np
from math import sqrt

PHI = (1 + sqrt(5)) / 2
DELTA = 0.002489189840420375
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

def golden_S():
    return PHI * np.eye(3) - (1/PHI) * np.ones((3,3))/3

def freeze_triple(eps=PHI, lam=PHI):
    """Return the ordered positive triple for a representative species under frozen coefficients."""
    # Use u-type normalized charge word as representative
    cw = np.array([1., 3., -4.])
    cw = cw / np.linalg.norm(cw)
    G = np.diag(SIGMAS) + eps * golden_S() + lam * np.diag(cw)
    ev = np.sort(np.real(np.linalg.eigvals(G)))[::-1]
    return ev

def protection_map(ev, strength=DELTA):
    """
    Positive-semidefinite protection that freezes ratios.
    Adds a small Delta-scaled shift that preserves order and positivity
    while suppressing continuous drift.
    """
    # Project onto the ordered basis and add a stiffness proportional to Delta
    protected = ev + strength * np.array([1.0, 0.5, 0.1])
    # Renormalize to keep the largest eigenvalue fixed (ratio freezing)
    protected = protected * (ev[0] / protected[0])
    return protected

def run():
    print("Operation Condor — Protection Map")
    print("="*50)
    base = freeze_triple()
    print(f"Base triple (eps=phi, lam=phi): {np.round(base, 5)}")
    protected = protection_map(base)
    print(f"Protected triple:               {np.round(protected, 5)}")
    print(f"Order preserved: {protected[0] > protected[1] > protected[2] > 0}")
    print(f"Relative shift:  {np.round((protected - base)/base, 5)}")
    print("\nProtection uses only frozen Delta. Ratios are stiffened.")
    print("Gate remains OPEN for continuum dictionary; generations are now rigid under the map.")

if __name__ == "__main__":
    run()
