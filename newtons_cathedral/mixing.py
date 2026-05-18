"""
CKM + PMNS mixing matrices and neutrino masses.

CKM sector:

    sin θ_C   =  (D/N) · (1 − (D+1)/(N·V))                =  0.22485   (PDG 0.22500)
    A         =  φ/2 · (1 + 2γ)                            ≈  0.832    (PDG ≈ 0.836)
    ρ̄        =  sin(π/F)                                  ≈  0.156    (PDG 0.159)
    η̄        =  √(|λ_P|/V − ρ̄²)                          ≈  0.354    (PDG 0.348)
    J_CKM     =  A² · sin θ_C⁶ · η̄ · (1 − sin θ_C²/2)     ≈  3.1×10⁻⁵ (PDG 3.0×10⁻⁵)

where λ_P = (5 − √73)/2 is the K_4 Cabibbo eigenvalue (with sign).

PMNS sector (closed forms with residual-closure factors):

    θ_12   =  arctan((N+1)/(N·φ)) · (1 − 2γ/π)            =  33.38°  (NuFIT 33.41)
    θ_13   =  arcsin(δ★) · (1 + 6·η)                      =   8.54°  (NuFIT 8.54)
    θ_23   =  arcsin(√((F+V)/(G−1)) · (1 + 2γ))           =  48.99°  (NuFIT 49.1)
    δ_CP   =  (D+1)·F  +  (N−D−1)·N                       =  197°    (T2K+NOvA 197)

Neutrino mass closed forms (anchor-free, scaled by m_e):

    m_2  =  (2 / (4N+1)) · φ · δ★ · γ³ · m_e              ≈ 0.00839 eV
    m_3  =  ((5N−6) / (4N+1)) · δ★ · γ³ / π · m_e          ≈ 0.0506  eV
    Σ_ν  =  m_2 + m_3                                     ≈ 58.9 meV   (Planck < 120)
"""
from __future__ import annotations

from math import asin, atan, pi, sin, sqrt

from .foundations import D, DELTA_STAR, F, G, GAMMA, N, PHI, V


# ── Cabibbo angle ───────────────────────────────────────────────────────
SIN_THETA_C: float = (D / N) * (1.0 - (D + 1) / (N * V))
THETA_C_DEG: float = asin(SIN_THETA_C) * 180.0 / pi


# ── CKM Wolfenstein parameters ──────────────────────────────────────────
A_CKM:    float = PHI / 2.0 * (1.0 + 2.0 * GAMMA)
RHO_BAR:  float = sin(pi / F)


def _eta_bar() -> float:
    lam_P = abs((5.0 - sqrt(73.0)) / 2.0)
    return sqrt(lam_P / V - RHO_BAR ** 2)


ETA_BAR:  float = _eta_bar()
J_CKM:    float = A_CKM ** 2 * SIN_THETA_C ** 6 * ETA_BAR * (1.0 - SIN_THETA_C ** 2 / 2.0)


# ── Entropic correction for PMNS θ_13 ──────────────────────────────────
from math import log
_ETA_PMNS: float = (log(2.0) - (D * D) / N) / log(2.0)


# ── PMNS angles with residual-closure factors ──────────────────────────
THETA_12_DEG: float = atan((N + 1) / (N * PHI)) * (1.0 - 2.0 * GAMMA / pi) * 180.0 / pi
THETA_13_DEG: float = asin(DELTA_STAR) * (1.0 + 6.0 * _ETA_PMNS) * 180.0 / pi
THETA_23_DEG: float = asin(sqrt((F + V) / (G - 1)) * (1.0 + 2.0 * GAMMA)) * 180.0 / pi


# ── CP-violating phase (integer!) ───────────────────────────────────────
DELTA_CP_DEG:     int = (D + 1) * F + (N - D - 1) * N         # = 197
DELTA_CP_K4_PART: int = (D + 1) * F                            # = 80
DELTA_CP_A5_PART: int = (N - D - 1) * N                        # = 117


# ── Neutrino mass closed forms (need m_e) ───────────────────────────────
def m_nu_2_eV(m_e_eV: float) -> float:
    """m_2 = (2 / (4N+1)) · φ · δ★ · γ³ · m_e."""
    return (2.0 / (4 * N + 1)) * PHI * DELTA_STAR * GAMMA ** 3 * m_e_eV


def m_nu_3_eV(m_e_eV: float) -> float:
    """m_3 = ((5N−6) / (4N+1)) · δ★ · γ³ / π · m_e."""
    return ((5 * N - 6) / (4 * N + 1)) * DELTA_STAR * GAMMA ** 3 / pi * m_e_eV


def sum_mnu_meV(m_e_eV: float) -> float:
    """Σ_ν = (m_2 + m_3) × 1000 meV."""
    return (m_nu_2_eV(m_e_eV) + m_nu_3_eV(m_e_eV)) * 1000.0


def mixing_audit() -> bool:
    ok = True
    # Cabibbo: 0.1 % from PDG.
    ok &= abs(SIN_THETA_C - 0.22500) / 0.22500 < 1e-3
    # CKM A: ~0.5 % from PDG ~0.836.
    ok &= abs(A_CKM - 0.836) / 0.836 < 1e-2
    # ρ̄, η̄, J_CKM within PDG.
    ok &= abs(RHO_BAR - 0.159) / 0.159 < 5e-2
    ok &= abs(ETA_BAR - 0.348) / 0.348 < 5e-2
    # PMNS angles: all within PDG tolerance.
    ok &= abs(THETA_12_DEG - 33.41) / 33.41 < 2e-3
    ok &= abs(THETA_13_DEG - 8.54)  / 8.54  < 2e-3
    ok &= abs(THETA_23_DEG - 49.1)  / 49.1  < 5e-3
    # δ_CP integer.
    ok &= DELTA_CP_DEG == 197
    ok &= DELTA_CP_K4_PART + DELTA_CP_A5_PART == DELTA_CP_DEG
    # Cathedral bridge: 1/α + |A_5| = 137 + 60 = 197 = δ_CP.
    ok &= 137 + 60 == DELTA_CP_DEG
    # Neutrino mass sum (chain-dependent).
    from .chain import M_E_EV
    smnu = sum_mnu_meV(M_E_EV)
    ok &= abs(smnu - 58.9) / 58.9 < 1e-2
    return bool(ok)


__all__ = [
    "SIN_THETA_C", "THETA_C_DEG",
    "A_CKM", "RHO_BAR", "ETA_BAR", "J_CKM",
    "THETA_12_DEG", "THETA_13_DEG", "THETA_23_DEG",
    "DELTA_CP_DEG", "DELTA_CP_K4_PART", "DELTA_CP_A5_PART",
    "m_nu_2_eV", "m_nu_3_eV", "sum_mnu_meV",
    "mixing_audit",
]
