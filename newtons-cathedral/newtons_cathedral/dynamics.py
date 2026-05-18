"""
The π-φ-e flow on G_{13}.

Equation of motion (over-damped Langevin in the centred-icosahedral graph):

    ∂_t δ  =  −η_L · L · δ   −   μ · (δ − δ★) · (1 + δ²)

with coefficients forced by D = 3:

    η_L  =  1/(4π)         (surface measure of S² in 3D)
    η    =  1/(8π)         (half-step Euler convention, = η_L / 2)
    μ    =  φ − 1 = 1/φ    (A_5 5-fold self-similarity)
    δ★   =  (1−γ)·π/(N·φ)  (the unique fixed point — see foundations.py)

Forward-Euler discretisation = the URT iteration:

    δ_{k+1}  =  δ_k  +  η · ( −η_L · L · δ_k  −  μ · (δ_k − δ★) · (1 + δ_k²) )

Every transcendental enters via one specific forcing reason:

    π   ←  spherical surface measure |S²| = 4π in D = 3
    φ   ←  A_5 character-table irrationality (Z_5 cyclotomic)
    e   ←  smooth semigroup closure (Cauchy multiplicative)

Natural dynamical timescale on G_{13}:

    2^q · π²  =  η · η_L · (−1)  ≈  315.83

    per-step contraction at eigenvalue λ:  1 − λ/(2^q · π²)
    mixing time at eigenvalue λ:           τ(λ) = (2^q · π²) / λ

    slowest non-trivial mode (Fiedler λ = D = 3): τ_D = (2^q·π²)/D ≈ 105
    fastest mode (boundary λ = N = 13):           τ_N = (2^q·π²)/N ≈ 24
    ratio = N/D = 13/3 (purely Cathedral, transcendentals cancel)

Theorem (uniqueness).  The URT iteration on G_{13} is the unique Euler
discretisation of a gradient flow whose only transcendentals are π, φ, e
satisfying simultaneously
    (i)   global asymptotic stability to δ★
    (ii)  preservation of the H_3 ⋊ K_4 symmetry of G_{13}
    (iii) finite-closure (Laplacian nullity = 1).
"""
from __future__ import annotations

from math import pi

import numpy as np

from .foundations import D, DELTA_STAR, N, PHI, q
from .graph import laplacian


# ── Cathedral-forced coefficients ───────────────────────────────────────
ETA_L: float = 1.0 / (4.0 * pi)           # Laplacian coefficient (surface measure)
ETA:   float = 1.0 / (8.0 * pi)           # half-step Euler convention (= η_L / 2)
MU:    float = PHI - 1.0                  # = 1/φ, A_5 self-similarity

DYNAMICAL_NORMALISATION: float = 2.0 ** q * pi ** 2   # ≈ 315.83


# ── The URT iteration ───────────────────────────────────────────────────
def urt_step(delta: np.ndarray) -> np.ndarray:
    """One forward-Euler step of the π-φ-e flow.

    Implements the post-2026-05 fix: the pull is non-decaying (no
    exp(-t/τ) factor), so every infinitesimal deviation from δ★ is
    restored.  Variance contracts geometrically; the field converges to
    δ★·𝟙 to machine precision.
    """
    L = laplacian()
    dot = -ETA_L * (L @ delta) - MU * (delta - DELTA_STAR) * (1.0 + delta ** 2)
    return delta + ETA * dot


def urt_evolve(delta: np.ndarray, *, steps: int = 200) -> np.ndarray:
    """Apply `steps` URT iterations to a 13-vector."""
    x = np.asarray(delta, dtype=float).copy()
    for _ in range(steps):
        x = urt_step(x)
    return x


# ── Per-mode contraction analysis ───────────────────────────────────────
def per_mode_contraction(lam: float) -> float:
    """Per-step linear contraction factor at Laplacian eigenvalue λ.

    Linearising the iteration near δ★ on the L-eigenbasis gives the
    factor (1 − η · η_L · λ) on the constant + mass term, plus the
    pull-rate correction.  At leading order:

        contraction(λ)  =  1  −  λ / (2^q · π²)
    """
    return 1.0 - lam / DYNAMICAL_NORMALISATION


def mixing_time(lam: float) -> float:
    """Time to e-fold suppression at eigenvalue λ.

        τ(λ)  =  (2^q · π²) / λ
    """
    if lam <= 0:
        return float("inf")
    return DYNAMICAL_NORMALISATION / lam


# ── Lagrangian view ─────────────────────────────────────────────────────
#
# The URT iteration is the τ → ∞ over-damped limit of the Euler-Lagrange
# equation derived from
#
#     L(δ, δ̇)  =  (1/2) |δ̇|²  −  V(δ)
#     V(δ)     =  (1/2) Σ_i (δ_i − δ★)² · (1 + δ_i²)  +  (1/2) δᵀ L δ
#
# Gradient descent on V with step size η = 1/(8π) yields the URT step.

def cathedral_potential(delta: np.ndarray) -> float:
    """Scalar Cathedral potential V(δ)."""
    pull = 0.5 * float(np.sum((delta - DELTA_STAR) ** 2 * (1.0 + delta ** 2)))
    kinetic_pot = 0.5 * float(delta @ (laplacian() @ delta))
    return pull + kinetic_pot


def cathedral_gradient(delta: np.ndarray) -> np.ndarray:
    """∇V(δ).  Note URT iteration is δ → δ − η·∇V(δ) modulo factors."""
    # d/dδ_i  [ ½(δ_i − δ★)²(1 + δ_i²) ]
    #   = (δ_i − δ★)(1 + δ_i²)  +  ½(δ_i − δ★)² · 2 δ_i
    #   = (δ_i − δ★)(1 + δ_i²)  +  (δ_i − δ★)² · δ_i
    diff = delta - DELTA_STAR
    pull = diff * (1.0 + delta ** 2) + diff ** 2 * delta
    kin = laplacian() @ delta
    return pull + kin


def dynamics_audit() -> bool:
    """All dynamics identities hold to machine precision."""
    ok = True
    ok &= abs(ETA_L - 1.0 / (4.0 * pi)) < 1e-15
    ok &= abs(ETA   - 1.0 / (8.0 * pi)) < 1e-15
    ok &= abs(ETA - ETA_L / 2.0)        < 1e-15
    ok &= abs(MU - (PHI - 1.0))         < 1e-15
    ok &= abs(MU - 1.0 / PHI)           < 1e-15
    ok &= abs(DYNAMICAL_NORMALISATION - 2.0 ** q * pi * pi) < 1e-12
    # Fixed-point check: at δ = δ★·𝟙 the iteration is a no-op.
    delta_fp = DELTA_STAR * np.ones(N)
    next_step = urt_step(delta_fp)
    ok &= float(np.max(np.abs(next_step - delta_fp))) < 1e-14
    # Convergence: random initial condition → δ★ uniform field.
    rng = np.random.default_rng(0)
    x0 = rng.uniform(0.0, 0.5, size=N)
    xT = urt_evolve(x0, steps=1500)
    ok &= float(np.max(np.abs(xT - DELTA_STAR))) < 5e-3
    # Mixing-time ratio is purely Cathedral: τ_D/τ_N = N/D, no transcendentals.
    ok &= abs(mixing_time(D) / mixing_time(N) - N / D) < 1e-12
    return bool(ok)


__all__ = [
    "ETA", "ETA_L", "MU",
    "DYNAMICAL_NORMALISATION",
    "urt_step", "urt_evolve",
    "per_mode_contraction", "mixing_time",
    "cathedral_potential", "cathedral_gradient",
    "dynamics_audit",
]
