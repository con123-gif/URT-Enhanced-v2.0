#!/usr/bin/env python3
"""
Strict Geometric Icosahedral G13 + External/Internal Analysis
===========================================================

Explores what happens when the icosahedron is used as **strict geometry**
(actual 3D embedding) with clear separation between:

- **Internal**: The central vacuum node (0)
- **External**: The icosahedral surface shell (nodes 1-12)

Key demonstration: Energy starting in the internal center rapidly
flows outward to the external icosahedral shell — the "vacuum exhaust"
mechanism working geometrically.

This version uses golden-ratio coordinates on the unit sphere.
"""

import numpy as np
from scipy.linalg import expm


def build_strict_geometric_g13():
    phi = (1 + np.sqrt(5)) / 2
    raw_verts = np.array([
        [0, -1,  phi], [0,  1,  phi], [0, -1, -phi], [0,  1, -phi],
        [-1, phi, 0], [1, phi, 0], [-1, -phi, 0], [1, -phi, 0],
        [phi, 0, -1], [phi, 0, 1], [-phi, 0, -1], [-phi, 0, 1],
    ])
    verts = raw_verts / np.linalg.norm(raw_verts[0])

    N = 13
    A = np.zeros((N, N))
    A[0, 1:] = 1
    A[1:, 0] = 1

    edge_length = np.min([np.linalg.norm(verts[i] - verts[j]) 
                          for i in range(12) for j in range(i+1, 12)])
    for i in range(12):
        for j in range(i + 1, 12):
            if np.linalg.norm(verts[i] - verts[j]) < edge_length * 1.05:
                A[i+1, j+1] = 1
                A[j+1, i+1] = 1

    D = np.diag(A.sum(axis=1))
    L = D - A
    return A, L, verts


def analyze_external_internal_flow(L, times=None):
    """
    Track how energy flows from Internal (center) to External (surface).
    This demonstrates the vacuum exhaust mechanism in strict geometry.
    """
    if times is None:
        times = [0.0, 0.05, 0.1, 0.2, 0.5]

    rng = np.random.RandomState(42)
    initial = rng.rand(13) * 0.1
    initial[0] += 1.0
    initial = initial / initial.sum()

    print("Initial energy distribution:")
    print(f"  Internal (center): {initial[0]:.4f}")
    print(f"  External (surface avg): {initial[1:].mean():.4f}")

    print("\nEnergy flow from Internal → External shell:")
    for t in times:
        E_t = expm(-L * t) @ initial
        internal = E_t[0]
        external_total = E_t[1:].sum()
        external_mean = E_t[1:].mean()
        print(f"t = {t:<4.2f} | Internal: {internal:.4f} | "
              f"External total: {external_total:.4f} | External mean: {external_mean:.4f}")


def main():
    print("=== STRICT GEOMETRIC ICOSAHEDRON: EXTERNAL vs INTERNAL ===\n")
    
    A, L, verts = build_strict_geometric_g13()
    
    print("Graph Properties (Strict Geometry):")
    print(f"  Total edges: {int(A.sum() // 2)}")
    print(f"  External icosahedral shell: 12 vertices on unit sphere")
    print(f"  Internal center: fully connected to external shell")
    
    analyze_external_internal_flow(L)
    
    print("\n=== Interpretation ===")
    print("The internal center rapidly exhausts energy outward to the")
    print("external icosahedral geometry. This is the vacuum exhaust")
    print("mechanism operating on strict 3D icosahedral geometry.")
    print("Both the external shell and internal center work harmoniously.")


if __name__ == "__main__":
    main()
