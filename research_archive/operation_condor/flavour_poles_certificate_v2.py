#!/usr/bin/env python3
"""
Operation Condor v2 — Inject frozen 13-site spectrum into the visible kernel.
Still no observed targets. Still species loading before reduction.
"""

import numpy as np
from math import sqrt, log

PHI = (1 + sqrt(5)) / 2
DELTA = 0.002489189840420375

# Canonical centred 13-site spectrum (multiplicities)
# 0^(1), (6-√5)^(3), 7^(5), (6+√5)^(3), 13^(1)
SPECTRUM = [
    (0.0, 1),
    (6 - sqrt(5), 3),
    (7.0, 5),
    (6 + sqrt(5), 3),
    (13.0, 1),
]

CHARGE_WORDS = {
    "u": np.array([1., 3., -4.]),
    "d": np.array([1., -3., 2.]),
    "e": np.array([-3., -3., 6.]),
    "nu": np.array([-3., 3., 0.]),
}

SINGULAR_SCALES = np.array([0.8555395192, 0.3168292207, 0.03208091744])

def build_spectrum_diagonal(dim=13):
    """Place the 13-site spectrum on the diagonal."""
    diag = []
    for val, mult in SPECTRUM:
        diag.extend([val] * mult)
    return np.array(diag[:dim])

def build_kernel_v2(species, z, dim=13):
    K = np.diag(build_spectrum_diagonal(dim)) * 0.01  # scale to dimensionless
    K += np.eye(dim) * z

    # Species loading on the lowest three modes
    cw = CHARGE_WORDS[species]
    for i in range(3):
        K[i, i] += 0.02 * cw[i]

    # Singular scales as soft projectors
    for i, s in enumerate(SINGULAR_SCALES):
        K[i, i] -= 0.5 * s

    # Small Delta modulation
    K += DELTA * np.eye(dim) * 0.005
    return K

def find_poles_v2(species, z_range=(-1.0, 5.0), n=3000):
    zs = np.linspace(z_range[0], z_range[1], n)
    abs_dets = []
    for z in zs:
        abs_dets.append(np.abs(np.linalg.det(build_kernel_v2(species, z))))
    abs_dets = np.array(abs_dets)
    # Local minima of |det|
    minima = np.where(
        (abs_dets[1:-1] < abs_dets[:-2]) &
        (abs_dets[1:-1] < abs_dets[2:]) &
        (abs_dets[1:-1] < 0.5)
    )[0] + 1
    return zs[minima], abs_dets

def run_v2():
    print("Operation Condor v2 — 13-site spectrum injection")
    print("=" * 60)
    for species in CHARGE_WORDS:
        poles, _ = find_poles_v2(species)
        # Keep three smallest |det| poles
        if len(poles):
            scores = [np.abs(np.linalg.det(build_kernel_v2(species, z))) for z in poles]
            top = poles[np.argsort(scores)][:3]
        else:
            top = []
        print(f"{species:2s}: {len(poles):3d} local minima, top-3 ≈ {np.round(top, 4)}")
    print("\nNo observed targets used. Gate remains OPEN pending full Feshbach.")

if __name__ == "__main__":
    run_v2()
