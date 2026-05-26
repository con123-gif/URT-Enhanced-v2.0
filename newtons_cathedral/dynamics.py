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
"""
from __future__ import annotations

from math import pi

import numpy as np

from .foundations import D, DELTA_STAR, N, PHI, q
from .graph import laplacian


ETA_L: float = 1.0 / (4.0 * pi)
ETA:   float = 1.0 / (8.0 * pi)
MU:    float = PHI - 1.0

DYNAMICAL_NORMALISATION: float = 2.0 ** q * pi ** 2


def urt_step(delta: np.ndarray) -> np.ndarray:
    L = laplacian()
    dot = -ETA_L * (L @ delta) - MU * (delta - DELTA_STAR) * (1.0 + delta ** 2)
    return delta + ETA * dot


def urt_evolve(delta: np.ndarray, *, steps: int = 200) -> np.ndarray:
    x = np.asarray(delta, dtype=float).copy()
    for _ in range(steps):
        x = urt_step(x)
    return x


def per_mode_contraction(lam: float) -> float:
    return 1.0 - lam / DYNAMICAL_NORMALISATION


def mixing_time(lam: float) -> float:
    if lam <= 0:
        return float("inf")
    return DYNAMICAL_NORMALISATION / lam


def cathedral_potential(delta: np.ndarray) -> float:
    pull = 0.5 * float(np.sum((delta - DELTA_STAR) ** 2 * (1.0 + delta ** 2)))
    kinetic_pot = 0.5 * float(delta @ (laplacian() @ delta))
    return pull + kinetic_pot


def cathedral_gradient(delta: np.ndarray) -> np.ndarray:
    diff = delta - DELTA_STAR
    pull = diff * (1.0 + delta ** 2) + diff ** 2 * delta
    kin = laplacian() @ delta
    return pull + kin


def lagrangian_step(delta: np.ndarray, velocity: np.ndarray, dt: float = 0.01
                    ) -> tuple[np.ndarray, np.ndarray]:
    """One symplectic (leapfrog) step of the underdamped Cathedral EOM."""
    grad_n = cathedral_gradient(delta)
    v_half = velocity - 0.5 * dt * grad_n
    delta_new = delta + dt * v_half
    grad_new = cathedral_gradient(delta_new)
    velocity_new = v_half - 0.5 * dt * grad_new
    return delta_new, velocity_new


def lagrangian_evolve(delta0: np.ndarray, velocity0: np.ndarray,
                      steps: int = 500, dt: float = 0.01
                      ) -> tuple[np.ndarray, np.ndarray]:
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
    """The 13 Cathedral normal-mode frequencies ω_k = √(m₀² + λ_k)."""
    from math import sqrt as msqrt
    from .graph import spectrum as graph_spectrum
    m0_sq = 1.0 + DELTA_STAR ** 2
    eigs = graph_spectrum()
    return np.array([msqrt(m0_sq + lam) for lam in eigs])


def cathedral_wave_packet(mode_k: int, amplitude: float = 1e-3) -> np.ndarray:
    L = laplacian()
    _, vecs = np.linalg.eigh(L)
    if not 0 <= mode_k < N:
        raise ValueError(f"mode_k must be in [0, {N-1}]")
    return DELTA_STAR * np.ones(N) + amplitude * vecs[:, mode_k]


def lagrangian_energy(delta: np.ndarray, velocity: np.ndarray) -> float:
    return 0.5 * float(np.dot(velocity, velocity)) + cathedral_potential(delta)


def dynamics_audit() -> bool:
    ok = True
    ok &= abs(ETA_L - 1.0 / (4.0 * pi)) < 1e-15
    ok &= abs(ETA   - 1.0 / (8.0 * pi)) < 1e-15
    ok &= abs(ETA - ETA_L / 2.0)        < 1e-15
    ok &= abs(MU - (PHI - 1.0))         < 1e-15
    ok &= abs(MU - 1.0 / PHI)           < 1e-15
    ok &= abs(DYNAMICAL_NORMALISATION - 2.0 ** q * pi * pi) < 1e-12
    delta_fp = DELTA_STAR * np.ones(N)
    next_step = urt_step(delta_fp)
    ok &= float(np.max(np.abs(next_step - delta_fp))) < 1e-14
    rng = np.random.default_rng(0)
    x0 = rng.uniform(0.0, 0.5, size=N)
    xT = urt_evolve(x0, steps=1500)
    ok &= float(np.max(np.abs(xT - DELTA_STAR))) < 5e-3
    ok &= abs(mixing_time(D) / mixing_time(N) - N / D) < 1e-12
    v0 = np.zeros(N)
    wp = cathedral_wave_packet(1, amplitude=1e-4)
    E0 = lagrangian_energy(wp, v0)
    d1, v1 = lagrangian_step(wp, v0, dt=0.01)
    E1 = lagrangian_energy(d1, v1)
    ok &= abs(E1 - E0) / (abs(E0) + 1e-30) < 1e-4
    freqs = mode_frequencies()
    ok &= freqs.shape == (N,)
    ok &= bool(np.all(freqs > 0))
    ok &= bool(np.all(freqs[1:] >= freqs[:-1]))
    wp2 = cathedral_wave_packet(0, amplitude=1e-3)
    ok &= wp2.shape == (N,)
    ok &= float(np.max(np.abs(wp2 - DELTA_STAR))) < 2e-3
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
