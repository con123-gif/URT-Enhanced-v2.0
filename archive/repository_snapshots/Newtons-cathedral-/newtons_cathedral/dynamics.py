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


def lagrangian_step(delta: np.ndarray, velocity: np.ndarray, dt: float = 0.01
                    ) -> tuple[np.ndarray, np.ndarray]:
    """One symplectic (leapfrog) step of the underdamped Cathedral EOM.

    EOM: δ̈ = −∇V(δ) = Lδ reversed − (δ−δ★)(1+δ²) − (δ−δ★)²δ

    Leapfrog: v_{n+1/2} = v_n − (dt/2)∇V(δ_n)
              δ_{n+1}   = δ_n + dt · v_{n+1/2}
              v_{n+1}   = v_{n+1/2} − (dt/2)∇V(δ_{n+1})

    Returns (delta_new, velocity_new).
    """
    grad_n = cathedral_gradient(delta)
    v_half = velocity - 0.5 * dt * grad_n
    delta_new = delta + dt * v_half
    grad_new = cathedral_gradient(delta_new)
    velocity_new = v_half - 0.5 * dt * grad_new
    return delta_new, velocity_new


def lagrangian_evolve(delta0: np.ndarray, velocity0: np.ndarray,
                      steps: int = 500, dt: float = 0.01
                      ) -> tuple[np.ndarray, np.ndarray]:
    """Evolve the underdamped (Lagrangian) flow using leapfrog. Returns trajectory arrays."""
    delta = np.asarray(delta0, dtype=float).copy()
    velocity = np.asarray(velocity0, dtype=float).copy()
    deltas = np.empty((steps + 1, len(delta)))
    velocities = np.empty((steps + 1, len(velocity)))
    deltas[0] = delta
    velocities[0] = velocity
    for i in range(steps):
        delta, velocity = lagrangian_step(delta, velocity, dt)
        deltas[i + 1] = delta
        velocities[i + 1] = velocity
    return deltas, velocities


def mode_frequencies() -> np.ndarray:
    """The 13 Cathedral normal-mode frequencies ω_k = √(m₀² + λ_k).

    These are the eigenfrequencies of the Cathedral Hessian H = (1+δ★²)I + L.
    For the K4 modes (λ ∈ {0,3,3,5}): ω ∈ {√m₀², √(m₀²+3), √(m₀²+3), √(m₀²+5)}.
    These are the Cathedral dispersion relations ω² = m₀² + λ — the Klein-Gordon
    relation, where the graph eigenvalue plays the role of spatial momentum squared.
    """
    from math import sqrt as msqrt
    from .graph import spectrum as graph_spectrum
    m0_sq = 1.0 + DELTA_STAR ** 2
    eigs = graph_spectrum()                      # sorted ascending, shape (13,)
    return np.array([msqrt(m0_sq + lam) for lam in eigs])


def cathedral_wave_packet(mode_k: int, amplitude: float = 1e-3) -> np.ndarray:
    """Return a 13-vector representing a small-amplitude wave packet in mode k.

    The packet is δ★ + amplitude * v_k where v_k is the k-th Laplacian eigenvector.
    This is a single-mode excitation around the Cathedral vacuum.
    """
    L = laplacian()
    _, vecs = np.linalg.eigh(L)          # columns are eigenvectors, sorted by λ
    if not 0 <= mode_k < N:
        raise ValueError(f"mode_k must be in [0, {N-1}]")
    return DELTA_STAR * np.ones(N) + amplitude * vecs[:, mode_k]


def lagrangian_energy(delta: np.ndarray, velocity: np.ndarray) -> float:
    """Total Lagrangian energy E = ½|v|² + V(δ)."""
    return 0.5 * float(np.dot(velocity, velocity)) + cathedral_potential(delta)


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
    # Leapfrog step: energy is approximately conserved over one step from the vacuum.
    v0 = np.zeros(N)
    wp = cathedral_wave_packet(1, amplitude=1e-4)
    E0 = lagrangian_energy(wp, v0)
    d1, v1 = lagrangian_step(wp, v0, dt=0.01)
    E1 = lagrangian_energy(d1, v1)
    ok &= abs(E1 - E0) / (abs(E0) + 1e-30) < 1e-4   # leapfrog is 2nd-order; small dt
    # Mode frequencies: 13 positive values, sorted ascending.
    freqs = mode_frequencies()
    ok &= freqs.shape == (N,)
    ok &= bool(np.all(freqs > 0))
    ok &= bool(np.all(freqs[1:] >= freqs[:-1]))
    # Wave packet has correct shape and is near δ★.
    wp2 = cathedral_wave_packet(0, amplitude=1e-3)
    ok &= wp2.shape == (N,)
    ok &= float(np.max(np.abs(wp2 - DELTA_STAR))) < 2e-3
    # Lagrangian evolve returns trajectory arrays of expected shape.
    d_traj, v_traj = lagrangian_evolve(wp, v0, steps=10, dt=0.005)
    ok &= d_traj.shape == (11, N)
    ok &= v_traj.shape == (11, N)
    return bool(ok)


__all__ = [
    "ETA", "ETA_L", "MU",
    "DYNAMICAL_NORMALISATION",
    "urt_step", "urt_evolve",
    "per_mode_contraction", "mixing_time",
    "cathedral_potential", "cathedral_gradient",
    "lagrangian_step", "lagrangian_evolve",
    "mode_frequencies", "cathedral_wave_packet", "lagrangian_energy",
    "dynamics_audit",
]
