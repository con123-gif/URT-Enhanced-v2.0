"""
Baryon asymmetry from the gap Δ.

Cathedral closed form (with residual-closure factor):

    η_B  =  γ³ · Δ · δ★ · (8/9) · (1 − δ★²/π)

    where
        γ    =  D^{−(D+1)} = 1/81
        Δ    =  δ_cl − δ★ ≈ 2.49 × 10⁻³
        8/9  =  2 · (D+1) / (D!+D)  =  2 · |K_4| / |A_5|   (sector ratio)
        (1 − δ★²/π)  is the SAME Yukawa-style sub-leading factor that
                     appears in y_e: both η_B and m_e are γ³·(δ★-scale)
                     observables on the same Cathedral kernel.

Numerical:  η_B  ≈  6.10 × 10⁻¹⁰     (Planck 2018: 6.10 × 10⁻¹⁰; 0.02 %)

Matter-direction inequality forces η_B > 0 at D = 3:

    D · N · φ    >    F · (1 − γ) · π
    63.103       >    62.056          margin 1.047 ≈ π/D  (22 ppm match)

At any other spatial dimension the inequality reverses or vanishes;
D = 3 is the unique dimension whose icosahedral closure puts the
universe ~5 % above the matter / antimatter equilibrium.
"""
from __future__ import annotations

from math import pi

from .foundations import DELTA, DELTA_STAR, GAMMA
from .sectors import ETA_B_PREFACTOR
from .vacuum import matter_direction_margin, matter_direction_target


# ── Closed-form baryon asymmetry (with sub-leading correction) ─────────
ETA_B: float = (
    GAMMA ** 3 * DELTA * DELTA_STAR * ETA_B_PREFACTOR
    * (1.0 - DELTA_STAR ** 2 / pi)
)


def baryogenesis_audit() -> bool:
    ok = True
    # Planck 2018: η_B = (6.10 ± 0.04) × 10⁻¹⁰.  Cathedral closed form
    # with sub-leading (1 − δ★²/π) correction matches to ≤ 0.05 %.
    ok &= abs(ETA_B - 6.10e-10) / 6.10e-10 < 1e-3
    # Matter-direction margin matches π/D to ~22 ppm.
    margin = matter_direction_margin()
    target = matter_direction_target()
    ok &= abs(margin - target) / target < 3e-5
    return bool(ok)


__all__ = ["ETA_B", "baryogenesis_audit"]
