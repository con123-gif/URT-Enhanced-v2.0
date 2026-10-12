#!/usr/bin/env python3
"""
Operation Condor — Artistic License: Singular scales as generation projectors.
No free continuous parameters. Coefficients drawn only from frozen constants.
"""

import numpy as np
from math import sqrt, log

PHI = (1 + sqrt(5)) / 2
DELTA = 0.002489189840420375
SIGMAS = np.array([0.8555395192, 0.3168292207, 0.03208091744])

CHARGE_WORDS = {
    "u": np.array([1., 3., -4.]),
    "d": np.array([1., -3., 2.]),
    "e": np.array([-3., -3., 6.]),
    "nu": np.array([-3., 3., 0.]),
}

# Candidate pure coefficients already present in the closed data
CANDIDATES = {
    "phi": PHI,
    "1/phi": 1/PHI,
    "delta": DELTA,
    "1/13": 1/13,
    "3/20": 3/20,
    "phi**-2": PHI**(-2),
}

def golden_S():
    return PHI * np.eye(3) - (1/PHI) * np.ones((3,3))/3

def build_G(species, eps_name, lam_name):
    cw = CHARGE_WORDS[species]
    cw = cw / np.linalg.norm(cw)  # dimensionless direction only
    G = np.diag(SIGMAS)
    G += CANDIDATES[eps_name] * golden_S()
    G += CANDIDATES[lam_name] * np.diag(cw)
    return G

def evaluate():
    print("Artistic-license generation projector scan")
    print("="*60)
    stable = []
    for eps in CANDIDATES:
        for lam in CANDIDATES:
            good = True
            triples = {}
            for sp in CHARGE_WORDS:
                G = build_G(sp, eps, lam)
                ev = np.sort(np.real(np.linalg.eigvals(G)))[::-1]
                triples[sp] = ev
                if not (np.all(ev > 0) and ev[0] > ev[1] > ev[2]):
                    good = False
            if good:
                stable.append((eps, lam, triples))
    print(f"Stable (eps, lam) pairs found: {len(stable)}")
    for eps, lam, triples in stable[:5]:
        print(f"  eps={eps}, lam={lam}")
        for sp, ev in triples.items():
            print(f"    {sp}: {np.round(ev,5)}")
    if not stable:
        print("No stable ordered positive triple under pure frozen coefficients.")
        print("Obstruction recorded. No new parameter introduced.")
    return stable

if __name__ == "__main__":
    evaluate()
