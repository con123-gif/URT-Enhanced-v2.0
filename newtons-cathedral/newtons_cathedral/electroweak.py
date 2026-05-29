"""
Electroweak sector — gauge bosons, Higgs, Weinberg angle, running α.

Headline closed forms:

    sin² θ_W   =  (D/N) · (1 + γ/(2π))            =  0.23122    (PDG 0.23122)
    1/α(M_Z)   =  1/α₀  −  (N − D − 1)  −  2·δ★/π =  127.94     (PDG 127.95)
    m_H        =  q^D  =  q³                       =  125 GeV   (PDG 125.10)
    m_W        =  ½·√g²·v_EW                       (PDG 80.38)
    m_Z        =  ½·√(g² + g'²)·v_EW               (PDG 91.19)
    λ_H        =  δ★·(D+1)·N · (1 + γ) / (F·D)    (Higgs self-coupling)
    m_top      =  (N+1)·V + q                     =  173 GeV   (PDG 172.69)

with g², g'² obtained from running α and sin² θ_W at M_Z.

Gauge-boson decomposition on G_{13}:
    K_4 sector  (D+1 = 4 modes):  graviton + photon + W± / Z
    A_5 sector  (D² = 9 modes):   8 gluons + 1 trace singlet
    Total = V SM gauge bosons + 1 graviton = N = 13.
"""
from __future__ import annotations

from math import pi, sqrt

from .arf import ALPHA_INV_FULL
from .foundations import D, DELTA_STAR, F, GAMMA, N, V, q


# ── Weinberg angle ──────────────────────────────────────────────────────
SIN2_THETA_W: float = (D / N) * (1.0 + GAMMA / (2.0 * pi))   # = 0.23122…


# ── Running α at M_Z ───────────────────────────────────────────────────
ALPHA_INV_MZ: float = ALPHA_INV_FULL - (N - D - 1) - 2.0 * DELTA_STAR / pi


# ── Higgs and top integer predictions ──────────────────────────────────
M_H_GEV:     int   = q ** D                                  # = 125
M_TOP_GEV:   int   = (N + 1) * V + q                         # = 173
LAMBDA_H:    float = DELTA_STAR * (D + 1) * N * (1.0 + GAMMA) / (F * D)


# ── Muon anomalous magnetic moment (leading QED Schwinger) ─────────────
A_MU_LEADING: float = 1.0 / (2.0 * pi * ALPHA_INV_FULL)


# ── Gauge-boson decomposition counts ────────────────────────────────────
SM_GAUGE_BOSON_COUNT: int = 1 + D + (D * D - 1)               # 1 + 3 + 8 = 12 = V
GRAVITON_PLUS_GAUGE:  int = SM_GAUGE_BOSON_COUNT + 1           # = N = 13
GLUON_COUNT:          int = D * D - 1                          # = 8
EW_BOSON_COUNT:       int = D                                  # = 3


def gauge_couplings() -> tuple[float, float]:
    """g², g'² at M_Z."""
    a_MZ = 1.0 / ALPHA_INV_MZ
    s2 = SIN2_THETA_W
    g2 = 4.0 * pi * a_MZ / s2
    gp2 = g2 * s2 / (1.0 - s2)
    return g2, gp2


def m_W_GeV(v_EW_GeV: float) -> float:
    """m_W = ½ √g² · v_EW."""
    g2, _ = gauge_couplings()
    return 0.5 * sqrt(g2) * v_EW_GeV


def m_Z_GeV(v_EW_GeV: float) -> float:
    """m_Z = ½ √(g² + g'²) · v_EW."""
    g2, gp2 = gauge_couplings()
    return 0.5 * sqrt(g2 + gp2) * v_EW_GeV


def m_H_chain_GeV(v_EW_GeV: float) -> float:
    """m_H = √(2 λ_H) · v_EW (running-corrected Higgs mass)."""
    return sqrt(2.0 * LAMBDA_H) * v_EW_GeV


def electroweak_audit() -> bool:
    ok = True
    # Weinberg angle: 4 ppm from PDG.
    ok &= abs(SIN2_THETA_W - 0.23122) / 0.23122 < 1e-4
    # Higgs integer mass: 0.08 % from PDG.
    ok &= M_H_GEV == q ** D == 125
    # Top integer mass: 0.18 % from PDG.
    ok &= M_TOP_GEV == 173
    # Running α: 0.01 % from PDG running value.
    ok &= abs(ALPHA_INV_MZ - 127.952) / 127.952 < 1e-3
    # a_µ leading Schwinger: 0.4 % from Fermilab measured value.
    ok &= abs(A_MU_LEADING - 1.16592e-3) / 1.16592e-3 < 5e-3
    # Gauge-boson count.
    ok &= SM_GAUGE_BOSON_COUNT == V == 12
    ok &= GRAVITON_PLUS_GAUGE == N == 13
    # Chain-dependent m_W, m_Z, m_H within 0.5 % of PDG.
    from .chain import V_EW_GEV
    ok &= abs(m_W_GeV(V_EW_GEV) - 80.379) / 80.379 < 5e-3
    ok &= abs(m_Z_GeV(V_EW_GEV) - 91.188) / 91.188 < 5e-3
    ok &= abs(m_H_chain_GeV(V_EW_GEV) - 125.10) / 125.10 < 5e-3
    return bool(ok)


__all__ = [
    "SIN2_THETA_W", "ALPHA_INV_MZ",
    "M_H_GEV", "M_TOP_GEV", "LAMBDA_H", "A_MU_LEADING",
    "SM_GAUGE_BOSON_COUNT", "GRAVITON_PLUS_GAUGE",
    "GLUON_COUNT", "EW_BOSON_COUNT",
    "gauge_couplings", "m_W_GeV", "m_Z_GeV", "m_H_chain_GeV",
    "electroweak_audit",
]
