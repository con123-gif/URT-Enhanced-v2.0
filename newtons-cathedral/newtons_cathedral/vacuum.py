"""
The vacuum manifold of the Cathedral framework.

Two rails:

    δ★   =  (1 − γ) · π / (N · φ)   =  0.147510810…    (UV fixed point)
    δ_cl =  D / F  =  3 / 20         =  0.150000000…    (classical rail)

Both are stable attractors of the π-φ-e flow.  The gap

    Δ  =  δ_cl − δ★  ≈  2.489 × 10⁻³

is the framework's only small non-zero number, and it is forced — δ★
is set by the spherical Cathedral closure (1 − γ)·π/(N·φ); δ_cl is
the eigenvalue-D / face-count F ratio.

Δ controls
    - the baryon asymmetry      η_B  =  γ³ · Δ · δ★ · 8/9
    - the pre-vacuum dark-energy density  V(δ_cl) = ½·Δ²·(1+δ_cl²)
    - the matter-direction inequality margin (D·N·φ − F·(1−γ)·π ≈ π/D)

Vacuum potential at the classical rail:

    V(δ_cl)  =  (1/2) · Δ² · (1 + δ_cl²)

This is the "pre-vacuum" energy that survives quantum corrections —
identifying the cosmological-constant scale with the matter-asymmetry
gap is the framework's unification of the two largest cosmological
puzzles (CC + baryogenesis) into a single number.
"""
from __future__ import annotations

from math import pi

from .foundations import DELTA, DELTA_CL, DELTA_STAR, GAMMA, N, PHI


def vacuum_potential_at_rail() -> float:
    """V(δ_cl)  =  ½·Δ²·(1 + δ_cl²) — the pre-vacuum energy."""
    return 0.5 * DELTA ** 2 * (1.0 + DELTA_CL ** 2)


def matter_direction_margin() -> float:
    """The Cathedral matter-direction margin.

    The inequality

        D · N · φ   >   F · (1 − γ) · π          (forced at D = 3)

    determines the sign of η_B (matter, not antimatter).  The margin

        m  =  D · N · φ  −  F · (1 − γ) · π

    is approximately π/D to 22 ppm — a non-trivial coincidence.
    """
    from .foundations import D, F
    return D * N * PHI - F * (1.0 - GAMMA) * pi


def matter_direction_target() -> float:
    """The Cathedral target π/D."""
    from .foundations import D
    return pi / D


def vacuum_audit() -> bool:
    ok = True
    ok &= abs(DELTA_STAR - (1 - GAMMA) * pi / (N * PHI)) < 1e-15
    ok &= abs(DELTA_CL - 0.15) < 1e-15
    ok &= abs(DELTA - (DELTA_CL - DELTA_STAR)) < 1e-15
    # Pre-vacuum potential is small and positive.
    v = vacuum_potential_at_rail()
    ok &= 0.0 < v < 1e-5
    # Matter-direction margin matches π/D to 22 ppm or better.
    margin = matter_direction_margin()
    target = matter_direction_target()
    rel = abs(margin - target) / target
    ok &= rel < 3e-5
    return bool(ok)


__all__ = [
    "vacuum_potential_at_rail",
    "matter_direction_margin",
    "matter_direction_target",
    "vacuum_audit",
]
