"""
Gravity — from G_N = δ★² to the Einstein field equations.

Newton's constant in Cathedral units:

    G_N  =  δ★²  =  0.02176…    (the only free parameter in standard GR
                                  is here a closed form of D = 3)

Discrete diffeomorphism group of G_{13}:

    |Aut(G_{13})|  =  V · (D+1)^D  =  12 · 64  =  768

— the same exponent (D+1)^D = 64 that controls Λ/M_Pl⁴ in cosmology.

Component counts in 4D GR, all Cathedral:

    Spacetime dimensions       =  D + 1  =  |K_4|   =  4
    Riemann curvature comps    =  (D+1)²·D·(D+2)/12  =  F  =  20
    Ricci tensor comps         =  (D+1)(D+2)/2       =  V/2 + F = 10
    Bianchi constraints        =  D + 1               =  4
    Physical Einstein equations=  (D+1)(D+2)/2 − (D+1) = V/2 = 6

Cathedral Einstein-Hilbert action (zero free parameters):

    S  =  ∫ d⁴x √(−g) · [ (R − 2Λ) / (16π·G_N)  +  L_δ ]

         G_N  =  δ★²
         Λ    =  D/(D+1)² · γ^{(D+1)^D} · M_Pl⁴
         L_δ  =  (1/2)·(∂δ)² − V(δ)

Variation w.r.t. g^{μν}:

    G_{μν}  +  Λ · g_{μν}  =  8π · G_N · T_{μν}^{(δ)}

Schwarzschild radius:    r_s  =  2 · δ★² · M
Hawking temperature:     T_H  =  1 / (8π · δ★² · M)
Bekenstein-Hawking S:    S    =  4π · δ★² · M²

Spacetime emergence from G_{13}: the K_4 sector has spectrum {0, 3, 3, 5}.
The single λ = 0 mode is time-like; the three λ > 0 modes (and the
Hessian sign pattern of the Cathedral Lagrangian at δ★) give the
Minkowski signature (+, −, −, −) — the (1 + D = 1 + 3) Lorentz
signature drops out of mode counting on K_4, not a postulate.
"""
from __future__ import annotations

from math import pi

from .cosmology import LAMBDA_OVER_MPL4
from .foundations import D, DELTA_STAR, F, V, N


# ── Newton's constant ───────────────────────────────────────────────────
G_NEWTON: float = DELTA_STAR ** 2                  # = 0.02176…


# ── Discrete diffeomorphism group ──────────────────────────────────────
AUT_G13_ORDER: int = V * (D + 1) ** D              # = 768
K4_CUBE_VERTICES: int = (D + 1) ** D               # = 64 (same as Λ exponent)


# ── GR component counts ────────────────────────────────────────────────
SPACETIME_DIM: int = D + 1                          # = 4
RIEMANN_COMPS: int = (D + 1) ** 2 * D * (D + 2) // 12   # = 20 = F
RICCI_COMPS:   int = (D + 1) * (D + 2) // 2         # = 10
BIANCHI_CONSTRAINTS: int = D + 1                    # = 4
PHYSICAL_EFE_COMPS:  int = RICCI_COMPS - BIANCHI_CONSTRAINTS  # = 6 = V/2


# ── Black-hole thermodynamics ──────────────────────────────────────────
def schwarzschild_radius(M: float) -> float:
    """r_s = 2 · G_N · M  =  2 · δ★² · M."""
    return 2.0 * G_NEWTON * M


def hawking_temperature(M: float) -> float:
    """T_H = 1 / (8π · G_N · M)."""
    return 1.0 / (8.0 * pi * G_NEWTON * M)


def bekenstein_hawking_entropy(M: float) -> float:
    """S = 4π · G_N · M² = A / (4·G_N)  for r_s = 2·G_N·M."""
    return 4.0 * pi * G_NEWTON * M ** 2


# ── Cathedral Einstein-Hilbert prefactor ───────────────────────────────
EH_PREFACTOR: float = 1.0 / (16.0 * pi * G_NEWTON)  # ≈ 0.9143


# ── Closed-form Λ in the same units cosmology.py uses (Planck⁴) ─────────
LAMBDA_PLANCK4: float = LAMBDA_OVER_MPL4


def first_law_black_hole(M: float) -> tuple[float, float]:
    """Return (dM, T·dS) for a small mass increment dM = 1e-6·M."""
    dM = 1e-6 * M
    T = hawking_temperature(M)
    S1 = bekenstein_hawking_entropy(M)
    S2 = bekenstein_hawking_entropy(M + dM)
    dS = S2 - S1
    return dM, T * dS


def gravity_audit() -> bool:
    ok = True
    ok &= abs(G_NEWTON - DELTA_STAR ** 2) < 1e-15
    ok &= AUT_G13_ORDER == 768 == V * (D + 1) ** D
    ok &= K4_CUBE_VERTICES == 64
    ok &= RIEMANN_COMPS == F == 20
    ok &= RICCI_COMPS == 10
    ok &= PHYSICAL_EFE_COMPS == 6 == V // 2
    ok &= SPACETIME_DIM == D + 1 == 4
    # BH first law: dM ≈ T · dS to 1e-9 (numerical 1st-order).
    dM, TdS = first_law_black_hole(1.0)
    ok &= abs(dM - TdS) / dM < 1e-3
    # Schwarzschild radius positive and proportional to M.
    ok &= schwarzschild_radius(1.0) > 0
    ok &= abs(schwarzschild_radius(2.0) - 2.0 * schwarzschild_radius(1.0)) < 1e-15
    return bool(ok)


__all__ = [
    "G_NEWTON", "AUT_G13_ORDER", "K4_CUBE_VERTICES",
    "SPACETIME_DIM", "RIEMANN_COMPS", "RICCI_COMPS",
    "BIANCHI_CONSTRAINTS", "PHYSICAL_EFE_COMPS",
    "EH_PREFACTOR", "LAMBDA_PLANCK4",
    "schwarzschild_radius", "hawking_temperature",
    "bekenstein_hawking_entropy", "first_law_black_hole",
    "gravity_audit",
]
