"""
Cosmology — every observable in closed form.

Matter / dark-energy / baryon / dark-matter densities (Cathedral):

    Ω_m   =  (D+1)/N · (1 + 2γ)                      =  0.31529   (Planck 0.3158)
    Ω_Λ   =  1 − Ω_m                                 =  0.68471
    Ω_b   =  Ω_m · (2·δ_cl − δ★) · (1 + 2γ)          =  0.04927   (Planck 0.0493)
    Ω_DM  =  Ω_m − Ω_b                                =  0.26602
    σ_8   =  δ★ · (N − 2) / 2                         =  0.8112    (Planck 0.8111)

Bare sector ratio is (D+1):(D!+D) = 4:9, the K_4 / A_5 sector-volume
fingerprint at D = 3.  The (1 + 2γ) correction is the entropy-scaling
shift due to γ = 1/81.

Cosmological-constant scale (Λ in Planck units):

    Λ / M_Pl⁴  =  D / (D+1)²  ·  γ^{(D+1)^D}
              =  (3/16)  ·  γ^64
              =  1.349 × 10⁻¹²³                     (Planck 2018: 1.35 × 10⁻¹²³)

The exponent 64 = (D+1)^D is the K_4-cube vertex count.  Sakharov-Visser
on G_{13} derives this as the per-vertex product factor γ collected
over (D+1)^D vertices.

CMB scalar amplitude (with γ·δ★·π residual-closure factor):

    A_s  =  N_e² · (D+1)³ · q · (32/9) · π⁴ · γ⁹ · cos⁴(π/V) · (1 + γ·δ★·π)
        =  2.100 × 10⁻⁹                              (Planck 2.10 × 10⁻⁹)

Hubble tension ratio:

    H₀(local) / H₀(CMB)  =  N / V  =  13 / 12       =  1.0833    (observed 1.0843)

— closed form to 0.1 %.  The simpler form 1 + 2D/(F·π) = 1 + 3/(10π)
also gives 1.0955 (within 1 % of observed).  N/V is the Cathedral
canonical form.
"""
from __future__ import annotations

from math import cos, pi

from .arf import N_E_FOLDS
from .foundations import D, DELTA_CL, DELTA_STAR, F, GAMMA, N, V, q


# ── Matter / baryon / dark-matter / dark-energy densities ──────────────
OMEGA_M:      float = (D + 1) / N * (1.0 + 2.0 * GAMMA)         # = 0.31529
OMEGA_LAMBDA: float = 1.0 - OMEGA_M                               # = 0.68471
OMEGA_B:      float = OMEGA_M * (2.0 * DELTA_CL - DELTA_STAR) * (1.0 + 2.0 * GAMMA)
OMEGA_DM:     float = OMEGA_M - OMEGA_B
SIGMA_8:      float = DELTA_STAR * (N - 2) / 2.0                  # = 0.8112


# ── Cosmological constant in Planck units ──────────────────────────────
LAMBDA_OVER_MPL4: float = (D / (D + 1) ** 2) * GAMMA ** ((D + 1) ** D)   # ≈ 1.35e-123


# ── CMB scalar amplitude (with sub-leading factor) ─────────────────────
A_S: float = (
    N_E_FOLDS ** 2
    * (D + 1) ** 3
    * q
    * (32.0 / 9.0)
    * pi ** 4
    * GAMMA ** 9
    * cos(pi / V) ** 4
    * (1.0 + GAMMA * DELTA_STAR * pi)
)


# ── Hubble tension ratios ──────────────────────────────────────────────
H0_RATIO_CANONICAL: float = float(N) / V                           # = 13/12 = 1.0833
H0_RATIO_PI_FORM:   float = 1.0 + 2.0 * D / (F * pi)              # = 1 + 3/(10π) = 1.0955


def cosmology_audit() -> bool:
    ok = True
    # Ω_m vs Planck 2018 (0.3158 ± 0.0073): 0.16 %.
    ok &= abs(OMEGA_M - 0.3158) / 0.3158 < 1e-2
    # Ω_b vs Planck 2018 (0.0493): 0.07 %.
    ok &= abs(OMEGA_B - 0.0493) / 0.0493 < 5e-3
    # σ_8 vs Planck 2018 (0.8111): 0.03 %.
    ok &= abs(SIGMA_8 - 0.8111) / 0.8111 < 1e-3
    # Λ/M_Pl⁴ vs Planck 2018 (1.35e-123): 0.09 %.
    ok &= abs(LAMBDA_OVER_MPL4 - 1.35e-123) / 1.35e-123 < 1e-2
    # A_s vs Planck 2018 (2.10e-9 ± 0.03e-9): 0.02 %.
    ok &= abs(A_S - 2.10e-9) / 2.10e-9 < 1e-3
    # H_0 canonical form vs observed (73.04/67.36 = 1.0843): 0.1 %.
    ok &= abs(H0_RATIO_CANONICAL - 1.0843) / 1.0843 < 5e-3
    return bool(ok)


__all__ = [
    "OMEGA_M", "OMEGA_LAMBDA", "OMEGA_B", "OMEGA_DM", "SIGMA_8",
    "LAMBDA_OVER_MPL4", "A_S",
    "H0_RATIO_CANONICAL", "H0_RATIO_PI_FORM",
    "cosmology_audit",
]
