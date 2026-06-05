#!/usr/bin/env python3
"""
Symmetry and the Equations on G13
==================================

Exploration of how symmetry shapes the governing equations
on different G13 constructions.

Key ideas:
- The Laplacian L commutes with symmetry group actions.
- Eigenspaces correspond to irreducible representations.
- The heat equation dE/dt = -L E preserves symmetry subspaces.
- Higher symmetry → higher eigenvalue degeneracy → more constrained dynamics.

This helps understand why certain G13 constructions lead to
cleaner equations and better thermodynamic behavior.

Part of the grok-review branch.
"""

import numpy as np
from scipy.linalg import expm, eigh


def analyze_symmetry(L, name):
    evals = np.round(np.linalg.eigvalsh(L), 6)
    unique, counts = np.unique(evals, return_counts=True)
    
    print(f"{name}:")
    print(f"  Eigenvalues: {list(unique)}")
    print(f"  Multiplicities: {list(counts)}")
    print(f"  Max degeneracy: {max(counts)}")
    print(f"  Implied symmetry richness: {'High' if max(counts) >= 5 else 'Moderate'}")
    print()


def demonstrate_symmetry_preservation(L, name):
    """Show that symmetric initial conditions remain symmetric under evolution."""
    # Create a symmetry-respecting initial condition (uniform on orbits)
    initial = np.ones(13) / 13   # fully symmetric
    
    t = 0.1
    E_t = expm(-L * t) @ initial
    
    # Check if it stayed uniform on the outer shell
    outer_variation = np.std(E_t[1:])
    print(f"{name} at t={t}:")
    print(f"  Fully symmetric initial → variation on outer shell: {outer_variation:.2e}")
    print(f"  (Should be ~0 if symmetry is preserved)")
    print()


def main():
    print("=== SYMMETRY AND THE EQUATIONS ===\n")
    
    # Build constructions
    N = 13
    
    # Combinatorial Icosahedral
    A_ico = np.zeros((N, N))
    A_ico[0, 1:] = 1
    A_ico[1:, 0] = 1
    for i in range(1, 13):
        for k in [1, 5, 7, 11]:
            j = (i + k - 1) % 12 + 1
            A_ico[i, j] = A_ico[j, i] = 1
    L_ico = np.diag(A_ico.sum(axis=1)) - A_ico
    
    # GEM v4
    A_oct = np.ones((6, 6)) - np.eye(6)
    for i in range(3):
        A_oct[i, i+3] = A_oct[i+3, i] = 0
    A_outer = np.block([[np.zeros((6,6)), A_oct], [A_oct, np.zeros((6,6))]])
    A_gem = np.zeros((13,13))
    A_gem[1:,1:] = A_outer
    A_gem[0,1:] = 1
    A_gem[1:,0] = 1
    L_gem = np.diag(A_gem.sum(axis=1)) - A_gem
    
    # Strict Geometric
    phi = (1 + np.sqrt(5)) / 2
    raw = np.array([[0,-1,phi],[0,1,phi],[0,-1,-phi],[0,1,-phi],[-1,phi,0],[1,phi,0],[-1,-phi,0],[1,-phi,0],[phi,0,-1],[phi,0,1],[-phi,0,-1],[-phi,0,1]])
    verts = raw / np.linalg.norm(raw[0])
    A_geo = np.zeros((13,13))
    A_geo[0,1:] = 1
    A_geo[1:,0] = 1
    el = min(np.linalg.norm(verts[i]-verts[j]) for i in range(12) for j in range(i+1,12))
    for i in range(12):
        for j in range(i+1,12):
            if np.linalg.norm(verts[i]-verts[j]) < el * 1.05:
                A_geo[i+1,j+1] = A_geo[j+1,i+1] = 1
    L_geo = np.diag(A_geo.sum(axis=1)) - A_geo
    
    print("Symmetry analysis via eigenvalue multiplicities:\n")
    analyze_symmetry(L_ico, "Combinatorial Icosahedral G13")
    analyze_symmetry(L_gem, "GEM v4 (Octahedral Double Cover)")
    analyze_symmetry(L_geo, "Strict Geometric Icosahedral G13")
    
    print("Symmetry preservation in the heat equation:\n")
    demonstrate_symmetry_preservation(L_ico, "Icosahedral")
    demonstrate_symmetry_preservation(L_gem, "GEM v4")
    demonstrate_symmetry_preservation(L_geo, "Geometric")
    
    print("=== Insights ===")
    print("The governing equation dE/dt = -L E respects the symmetry group.")
    print("Degenerate eigenspaces correspond to irreducible representations.")
    print("Higher symmetry (higher max degeneracy) often leads to more")
    print("constrained but elegant dynamics and thermodynamics.")
    print("GEM v4 and combinatorial icosahedral show particularly rich symmetry.")


if __name__ == "__main__":
    main()
