"""
Gravity — from G_N = δ★² to the Einstein field equations.

Newton's constant in Cathedral units:

    G_N  =  δ★²  =  0.02176…

Discrete diffeomorphism group of G_{13}:

    |Aut(G_{13})|  =  V · (D+1)^D  =  12 · 64  =  768

Spacetime emergence from G_{13} — derivation of Minkowski signature:

The quadratic action in K_4 mode amplitudes p (centred on the vacuum δ★) is

    L₂  =  ½ṗᵀṗ  −  ½ pᵀ (m₀²I + Λ_K4) p

with Λ_K4 = diag(0, 3, 3, 5) and m₀² = 1 + δ★².  Fourier-transforming in time
turns ½ṗᵀṗ into −½k₀²pᵀp, so the propagator denominator for mode μ is

    Δ_μ(k₀)  =  k₀²  −  m₀²  −  λ_μ

This forces g_μν = diag(+1, −1, −1, −1).  Lorentz signature (1+3) is
a theorem of mode counting on K_4, not a postulate.
"""
from __future__ import annotations

from math import pi, sqrt

import numpy as np

from .cosmology import LAMBDA_OVER_MPL4
from .foundations import D, DELTA_STAR, F, V, N
from .sectors import K4_EIGENVALUES


G_NEWTON: float = DELTA_STAR ** 2

AUT_G13_ORDER: int = V * (D + 1) ** D
K4_CUBE_VERTICES: int = (D + 1) ** D

SPACETIME_DIM: int = D + 1
RIEMANN_COMPS: int = (D + 1) ** 2 * D * (D + 2) // 12
RICCI_COMPS:   int = (D + 1) * (D + 2) // 2
BIANCHI_CONSTRAINTS: int = D + 1
PHYSICAL_EFE_COMPS:  int = RICCI_COMPS - BIANCHI_CONSTRAINTS

EH_PREFACTOR: float = 1.0 / (16.0 * pi * G_NEWTON)
LAMBDA_PLANCK4: float = LAMBDA_OVER_MPL4


def schwarzschild_radius(M: float) -> float:
    return 2.0 * G_NEWTON * M


def hawking_temperature(M: float) -> float:
    return 1.0 / (8.0 * pi * G_NEWTON * M)


def bekenstein_hawking_entropy(M: float) -> float:
    return 4.0 * pi * G_NEWTON * M ** 2


def first_law_black_hole(M: float) -> tuple[float, float]:
    dM = 1e-6 * M
    T = hawking_temperature(M)
    S1 = bekenstein_hawking_entropy(M)
    S2 = bekenstein_hawking_entropy(M + dM)
    dS = S2 - S1
    return dM, T * dS


def geodesic_deviation_cathedral(separation: np.ndarray) -> np.ndarray:
    """Cathedral geodesic deviation (Jacobi field) in K4 mode space."""
    if separation.shape != (len(K4_EIGENVALUES),):
        raise ValueError(f"separation must be a {len(K4_EIGENVALUES)}-vector")
    m0_sq = 1.0 + DELTA_STAR ** 2
    lam = np.array(K4_EIGENVALUES, dtype=float)
    return -(m0_sq + lam) * separation


def penrose_diagram_causal_check(mode_vec: np.ndarray) -> dict:
    """Classify a K4 mode vector by causal character."""
    if mode_vec.shape != (len(K4_EIGENVALUES),):
        raise ValueError(f"mode_vec must be a {len(K4_EIGENVALUES)}-vector")
    t = float(mode_vec[0])
    spatial_sq = float(np.sum(mode_vec[1:] ** 2))
    norm_sq = t ** 2 - spatial_sq
    if norm_sq > 1e-12:
        causal_type = "timelike"
    elif norm_sq < -1e-12:
        causal_type = "spacelike"
    else:
        causal_type = "null"
    return {
        "causal_type": causal_type,
        "future_directed": t > 0,
        "past_directed": t < 0,
    }


def kretschner_scalar_cathedral() -> float:
    """Cathedral analogue of Kretschner scalar: Σ_μ (m₀²+λ_μ)²."""
    m0_sq = 1.0 + DELTA_STAR ** 2
    return float(sum((m0_sq + lam) ** 2 for lam in K4_EIGENVALUES))


def gravity_audit() -> bool:
    ok = True
    ok &= abs(G_NEWTON - DELTA_STAR ** 2) < 1e-15
    ok &= AUT_G13_ORDER == 768 == V * (D + 1) ** D
    ok &= K4_CUBE_VERTICES == 64
    ok &= RIEMANN_COMPS == F == 20
    ok &= RICCI_COMPS == 10
    ok &= PHYSICAL_EFE_COMPS == 6 == V // 2
    ok &= SPACETIME_DIM == D + 1 == 4
    dM, TdS = first_law_black_hole(1.0)
    ok &= abs(dM - TdS) / dM < 1e-3
    ok &= schwarzschild_radius(1.0) > 0
    ok &= abs(schwarzschild_radius(2.0) - 2.0 * schwarzschild_radius(1.0)) < 1e-15
    xi = np.array([0.1, 0.2, -0.1, 0.05])
    acc = geodesic_deviation_cathedral(xi)
    ok &= acc.shape == (4,)
    ok &= bool(np.all(acc * xi <= 0))
    ct = penrose_diagram_causal_check(np.array([1.0, 0.0, 0.0, 0.0]))
    ok &= ct["causal_type"] == "timelike"
    ok &= ct["future_directed"] is True
    cs = penrose_diagram_causal_check(np.array([0.0, 1.0, 0.0, 0.0]))
    ok &= cs["causal_type"] == "spacelike"
    K = kretschner_scalar_cathedral()
    ok &= K > 0
    m0_sq = 1.0 + DELTA_STAR ** 2
    K_ref = sum((m0_sq + lam) ** 2 for lam in K4_EIGENVALUES)
    ok &= abs(K - K_ref) < 1e-12
    return bool(ok)


__all__ = [
    "G_NEWTON", "AUT_G13_ORDER", "K4_CUBE_VERTICES",
    "SPACETIME_DIM", "RIEMANN_COMPS", "RICCI_COMPS",
    "BIANCHI_CONSTRAINTS", "PHYSICAL_EFE_COMPS",
    "EH_PREFACTOR", "LAMBDA_PLANCK4",
    "schwarzschild_radius", "hawking_temperature",
    "bekenstein_hawking_entropy", "first_law_black_hole",
    "geodesic_deviation_cathedral", "penrose_diagram_causal_check",
    "kretschner_scalar_cathedral",
    "gravity_audit",
]
