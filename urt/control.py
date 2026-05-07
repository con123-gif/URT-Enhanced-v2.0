"""
Universal Recursive Tuning (URT) — control law and operator.

Core dynamics:  P_{n+1} = β(α(P_n − θ_h·φ(P_n)) + u)
Stability:      κ = β·α·(1 + θ_h) < 1  (Lyapunov-verified contraction)
"""

import numpy as np
from .shell_closure import DELTA_STAR


# ── Default parameters ────────────────────────────────────────────────
_ALPHA  = 1.155
_THETA  = 2.4
_BETA   = 0.235
_KAPPA  = _BETA * _ALPHA * (1 + _THETA)   # contraction rate < 1


def _phi(p):
    return np.where(np.abs(p) <= np.pi, np.sin(p), np.sign(p))


def urt_step(state, u=0.0, alpha=_ALPHA, theta_h=_THETA, beta=_BETA):
    """Single URT update step."""
    return beta * (alpha * (state - theta_h * _phi(state)) + u)


def urt_operator(x, window=30, learning_rate=0.01):
    """
    Compute the URT scalar δ_u from a raw time series x.
    Returns a float in [0.01, 1.0]; proximity to DELTA_STAR indicates stability.
    """
    x = np.asarray(x, float).ravel()
    x = (x - np.mean(x)) / (np.std(x) + 1e-10)

    # Autocorrelation decay → embedding dimension proxy D
    acf = np.correlate(x, x, "full")[len(x):]
    acf = acf / (acf[0] + 1e-12)
    d_idx = np.where(acf < np.exp(-1))[0]
    d = d_idx[0] if len(d_idx) else len(acf)
    D = float(np.clip(1 + 2 / (1 + np.exp(-d / 10)), 1.0, 3.0))

    # Fractal variance (volatility of volatility)
    segs = np.array_split(x, 20)
    v_mean = np.mean([np.var(s) for s in segs if len(s) > 1])

    # Avalanche exponent proxy τ
    tau = float(np.clip(2 + 0.5 * v_mean / (np.var(x) + 1e-10), 1.5, 3.5))

    delta_u = float(np.clip((D - 1) * (tau - 2), 0.01, 1.0))

    # ARF refinement
    A = 1 / 6
    for _ in range(window):
        correction = -A * (delta_u / np.pi) ** 2
        delta_u = float(np.clip(delta_u + learning_rate * correction, 0.01, 1.0))

    return delta_u


def is_critical(delta_u, threshold=0.02):
    """Return True if system is within threshold of δ★ (stable/locked)."""
    return abs(delta_u - DELTA_STAR) <= threshold
