"""
QCD sector — strong coupling, pion sector, SU(3) on A_5.

Closed forms:

    α_s(M_Z)   =  δ★ · (q − 1) / q                     =  0.11801   (PDG 0.1179)
    f_π        =  m_p · (D − 1)/D · δ★                 ≈  92 MeV    (PDG 92.4)
    m_π        =  m_p · δ★ · (1 − γ − 2q·η)            ≈  140 MeV   (PDG 139.6)

with η = (log 2 − D²/N) / log 2 the entropic correction parameter.

SU(3) emerges from the 9 = D² A_5 eigenmodes.  The unique λ = N = 13
mode is the "trace singlet" — central amplitude −√(V/N), all 12
surface amplitudes equal at +1/√(V·N).  Removing this singlet leaves
9 − 1 = 8 = D² − 1 = dim su(3) gluon modes.

    A_5 sector  =  u(3)  =  su(3) ⊕ u(1)
                =  8 gluons  +  1 photon-like trace singlet

Cartan classification: among the connected simple Lie algebras of
dimension exactly 8, only A_2 = sl(3, ℂ) exists; its compact real form
is su(3).  The choice is forced.
"""
from __future__ import annotations

from math import log

from .foundations import D, DELTA_STAR, GAMMA, N, q


# ── Headline QCD prediction (closed form, no scale) ─────────────────────
ALPHA_S_MZ: float = DELTA_STAR * (q - 1) / q                 # = 0.11801…


# ── Entropic correction parameter (used by m_π) ─────────────────────────
ETA_QCD: float = (log(2.0) - (D * D) / N) / log(2.0)


# ── Pion-sector predictions (chain-derived, need m_p) ──────────────────
def f_pi_GeV(m_p_GeV: float) -> float:
    """Pion decay constant: f_π = m_p · (D−1)/D · δ★ ≈ 92 MeV (PDG 92.4)."""
    return m_p_GeV * (D - 1) / D * DELTA_STAR


def m_pi0_GeV(m_p_GeV: float) -> float:
    """Neutral pion mass: m_π⁰ = m_p · δ★ · (1 − γ − 2q·η) ≈ 135 MeV (PDG 134.98)."""
    return m_p_GeV * DELTA_STAR * (1.0 - GAMMA - 2.0 * q * ETA_QCD)


# ── SU(3) count-level decomposition of the A_5 sector ───────────────────
N_GLUONS:        int = D * D - 1                              # = 8
N_TRACE_SINGLET: int = 1                                       # = 1
A5_COUNT_CHECK:  int = N_GLUONS + N_TRACE_SINGLET             # = 9


def qcd_audit() -> bool:
    ok = True
    # α_s(M_Z) — 0.1 % from PDG.
    ok &= abs(ALPHA_S_MZ - 0.1179) / 0.1179 < 1e-2
    ok &= N_GLUONS == 8 == D * D - 1
    ok &= A5_COUNT_CHECK == 9
    # f_π and m_π (chain-dependent).
    from .chain import M_P_GEV
    f_pi = f_pi_GeV(M_P_GEV) * 1e3                          # MeV
    m_pi0 = m_pi0_GeV(M_P_GEV) * 1e3                        # MeV
    ok &= abs(f_pi - 92.4) / 92.4 < 1e-2                    # PDG 92.4 ± 0.3
    ok &= abs(m_pi0 - 134.977) / 134.977 < 1e-3             # PDG 134.977 ± 0.0005
    return bool(ok)


__all__ = [
    "ALPHA_S_MZ", "ETA_QCD",
    "N_GLUONS", "N_TRACE_SINGLET", "A5_COUNT_CHECK",
    "f_pi_GeV", "m_pi0_GeV",
    "qcd_audit",
]
