"""
Baryon asymmetry from the gap Δ.

The framework's closed form for the matter / antimatter ratio of the
universe is

    η_B  =  γ³ · Δ · δ★ · (8/9)

    where
        γ    =  D^{-(D+1)} = 1/81
        Δ    =  δ_cl − δ★ ≈ 2.49 × 10⁻³
        8/9  =  2 · (D+1) / (D! + D)  =  2 · |K_4| / |A_5|  (sector ratio)

Numerical value:  η_B  ≈  6.14 × 10⁻¹⁰    (Planck 2018: 6.12 × 10⁻¹⁰; 0.35 % match)

The matter-direction inequality forces η_B > 0 at D = 3:

    D · N · φ    >    F · (1 − γ) · π
    63.103        >    62.056              margin 1.047 ≈ π/D  (22 ppm)

At any other dimension the inequality reverses or vanishes; D = 3 is
the unique spatial dimension whose icosahedral closure puts the
universe ~5 % above the matter / antimatter equilibrium boundary.

The factor 8/9 in η_B is the same 4/9 sector ratio that controls the
Casimir +0.124 ppm prediction — doubled.
"""
from __future__ import annotations

from .foundations import DELTA, DELTA_STAR, GAMMA
from .sectors import ETA_B_PREFACTOR
from .vacuum import matter_direction_margin, matter_direction_target


# ── Closed-form baryon asymmetry ─────────────────────────────────────────
ETA_B: float = GAMMA ** 3 * DELTA * DELTA_STAR * ETA_B_PREFACTOR    # ≈ 6.14e-10


# ── Sakharov conditions in Cathedral form ──────────────────────────────
# 1. B-violation:  γ³ gives the rare process suppression (1/81³ ≈ 5.7e-7)
# 2. C/CP-violation: δ_CP = 197° (see mixing.py)
# 3. Departure from equilibrium: Δ = δ_cl − δ★ ≠ 0 (the gap)


def baryogenesis_audit() -> bool:
    ok = True
    # Planck 2018: η_B = (6.12 ± 0.04) × 10⁻¹⁰
    pdg = 6.12e-10
    ok &= abs(ETA_B - pdg) / pdg < 5e-3                # 0.35 %
    # Matter-direction margin matches π/D to ~22 ppm.
    margin = matter_direction_margin()
    target = matter_direction_target()
    ok &= abs(margin - target) / target < 3e-5
    # ETA_B should match the framework's verified value to machine precision.
    ok &= abs(ETA_B - 6.141497634651684e-10) < 1e-20
    return bool(ok)


__all__ = ["ETA_B", "baryogenesis_audit"]
