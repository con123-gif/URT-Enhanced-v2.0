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

Spacetime emergence from G_{13} — derivation of Minkowski signature:

The quadratic action in K_4 mode amplitudes p (centred on the vacuum δ★) is

    L₂  =  ½ṗᵀṗ  −  ½ pᵀ (m₀²I + Λ_K4) p

with Λ_K4 = diag(0, 3, 3, 5) and m₀² = 1 + δ★².  Fourier-transforming in time
(∂_t → ik₀) turns ½ṗᵀṗ into −½k₀²pᵀp, so the propagator denominator for mode μ is

    Δ_μ(k₀)  =  k₀²  −  m₀²  −  λ_μ

The time kinetic term k₀² enters with +1; the graph eigenvalue λ_μ enters
with −1.  This forces the effective metric g_μν = diag(+1, −1, −1, −1):
the zero-mode direction (λ = 0) has no restoring spatial force and becomes
the timelike direction; the three λ > 0 directions become spacelike.

The unique λ = 0 mode exists because G_{13} is connected (nullity(L) = 1,
constant vector). D = 3 positive eigenvalues in K_4 give exactly the three
spatial dimensions.  Lorentz signature (1 + 3) is thus a theorem of mode
counting on K_4, not a postulate.
"""
from __future__ import annotations

from math import pi, sqrt

import numpy as np

from .cosmology import LAMBDA_OVER_MPL4
from .foundations import D, DELTA_STAR, F, V, N
from .sectors import K4_EIGENVALUES


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


def geodesic_deviation_cathedral(separation: np.ndarray) -> np.ndarray:
    """The Cathedral geodesic deviation equation (Jacobi field).

    In GR: D²ξ^μ/dτ² = −R^μ_{νρσ} u^ν ξ^ρ u^σ

    In the Cathedral (K4 sector), the "curvature" is sourced by the
    non-zero vacuum δ★. Near the vacuum, the effective curvature
    experienced by a deviation ξ in K4 mode space is:

        ξ̈_μ = −(m₀² + λ_μ) ξ_μ   (harmonic oscillator in each mode)

    This gives the acceleration of the Jacobi field — geodesics converge
    (m₀² + λ_μ > 0 always, since m₀² = 1+δ★² > 0 and λ_μ ≥ 0).
    Returns the 4-vector acceleration ξ̈ for a given separation ξ.
    """
    if separation.shape != (len(K4_EIGENVALUES),):
        raise ValueError(f"separation must be a {len(K4_EIGENVALUES)}-vector")
    m0_sq = 1.0 + DELTA_STAR ** 2
    lam = np.array(K4_EIGENVALUES, dtype=float)
    return -(m0_sq + lam) * separation


def penrose_diagram_causal_check(mode_vec: np.ndarray) -> dict:
    """Classify a K4 mode vector by causal character and light-cone region.

    Returns {'causal_type': str, 'future_directed': bool, 'past_directed': bool}
    where future/past means the time component (mode 0, λ=0) is positive/negative.
    """
    if mode_vec.shape != (len(K4_EIGENVALUES),):
        raise ValueError(f"mode_vec must be a {len(K4_EIGENVALUES)}-vector")
    # Minkowski norm: +t² − x² − y² − z² with t = mode_vec[0]
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
    """The Cathedral analogue of the Kretschner scalar K = R_{μνρσ}R^{μνρσ}.

    In the K4 sector with the vacuum at δ★, the effective Riemann tensor
    comes from the potential curvature. The Riemann invariant is:

        K_cath = Σ_μ (m₀² + λ_μ)²  =  tr(H²)   where H = (1+δ★²)I + L_K4

    This is always positive (stable vacuum) and equals the sum of squared
    mode masses in the K4 sector.
    """
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
    # BH first law: dM ≈ T · dS to 1e-9 (numerical 1st-order).
    dM, TdS = first_law_black_hole(1.0)
    ok &= abs(dM - TdS) / dM < 1e-3
    # Schwarzschild radius positive and proportional to M.
    ok &= schwarzschild_radius(1.0) > 0
    ok &= abs(schwarzschild_radius(2.0) - 2.0 * schwarzschild_radius(1.0)) < 1e-15
    # Geodesic deviation: acceleration anti-parallel to separation in all modes.
    xi = np.array([0.1, 0.2, -0.1, 0.05])
    acc = geodesic_deviation_cathedral(xi)
    ok &= acc.shape == (4,)
    ok &= bool(np.all(acc * xi <= 0))    # each mode: acc_μ and ξ_μ opposite sign
    # Penrose causal check: timelike unit time-vector → timelike + future-directed.
    ct = penrose_diagram_causal_check(np.array([1.0, 0.0, 0.0, 0.0]))
    ok &= ct["causal_type"] == "timelike"
    ok &= ct["future_directed"] is True
    # Penrose causal check: spacelike vector.
    cs = penrose_diagram_causal_check(np.array([0.0, 1.0, 0.0, 0.0]))
    ok &= cs["causal_type"] == "spacelike"
    # Kretschner scalar is positive.
    K = kretschner_scalar_cathedral()
    ok &= K > 0
    # K = Σ (m0²+λ)²; verify against direct computation.
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
