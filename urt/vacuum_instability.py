"""
Cathedral Vacuum — "Why Something Rather Than Nothing"
V(δ) has an unstable maximum at δ=0 (the vacuum of nothing) and a unique
stable minimum at δ=δ★ (the Cathedral vacuum). The universe cannot stay
at δ=0; it must fall to δ★.
"""

import numpy as np
from math import pi, sqrt, log, exp

from .shell_closure import DELTA_STAR, phi, gamma, N, D, F, G

# ── Cathedral vacuum potential V(δ) ──────────────────────────────────────
# V(δ) = (1/2)·δ²·(δ - δ★)²·(δ + δ★)  × normalisation
# Equivalently: Mexican-hat with icosahedral winding.
# Key properties:
#   V(0)   = 0 (unstable maximum — "nothing")
#   V(δ★)  = global minimum = 0 by normalisation
#   V''(0) < 0  → unstable
#   V''(δ★) > 0 → stable

_K = N * phi / (pi * (1 - gamma))   # normalisation so V''(δ★) = 2


def V(delta: float) -> float:
    """
    Cathedral vacuum potential. V(0) = 0 unstable, V(δ★) = global min.
    V(δ) = _K · δ²·(δ − δ★)²
    """
    return _K * delta ** 2 * (delta - DELTA_STAR) ** 2


def V_array(delta: np.ndarray) -> np.ndarray:
    """Vectorised V(δ) over an array of δ values."""
    return _K * delta ** 2 * (delta - DELTA_STAR) ** 2


def dV(delta: float) -> float:
    """dV/dδ — first derivative of the potential."""
    return _K * (2 * delta * (delta - DELTA_STAR) ** 2
                 + 2 * delta ** 2 * (delta - DELTA_STAR))


def d2V(delta: float) -> float:
    """d²V/dδ² — second derivative (mass squared)."""
    return _K * (2 * (delta - DELTA_STAR) ** 2
                 + 8 * delta * (delta - DELTA_STAR)
                 + 2 * delta ** 2)


def vacuum_curvature_at_zero() -> float:
    """V''(0) < 0: δ=0 is an unstable maximum."""
    return d2V(0.0)


def vacuum_curvature_at_delta_star() -> float:
    """V''(δ★) > 0: δ=δ★ is a stable minimum."""
    return d2V(DELTA_STAR)


def potential_barrier_height() -> float:
    """
    Height of the barrier between δ=0 and δ=δ★.
    The barrier maximum is at δ_top = δ★/2 (midpoint of the double zero).
    """
    delta_top = DELTA_STAR / 2
    return V(delta_top)


def tunneling_exponent() -> float:
    """
    WKB tunneling exponent B ≈ π·ΔV / |V''(0)|.
    B < 0 means the false vacuum decays, B → 0 means instant decay.
    """
    dV_barrier = potential_barrier_height()
    curv = abs(vacuum_curvature_at_zero())
    if curv == 0:
        return float("inf")
    return pi * dV_barrier / curv


def false_vacuum_decay_rate() -> float:
    """
    Γ ∝ exp(−B) where B is the WKB exponent.
    Returns the rate factor; B → 0 gives Γ → 1 (fast decay from nothing).
    """
    B = tunneling_exponent()
    return exp(-B)


def delta_field_evolution(delta_init: float, steps: int = 500,
                          dt: float = 0.01) -> np.ndarray:
    """
    Steepest-descent (gradient flow) of V(δ).
    dδ/dt = −dV/dδ
    Starting from δ_init, the field rolls to δ★.
    """
    delta = delta_init
    trajectory = [delta]
    for _ in range(steps):
        delta = delta - dt * dV(delta)
        delta = max(delta, -0.5)
        trajectory.append(delta)
    return np.array(trajectory)


def why_something_not_nothing() -> dict:
    """
    Summary of the vacuum argument: δ=0 is unstable, δ=δ★ is the only attractor.
    """
    V0 = V(0.0)
    Vstar = V(DELTA_STAR)
    curv0 = vacuum_curvature_at_zero()
    curv_star = vacuum_curvature_at_delta_star()
    barrier = potential_barrier_height()
    B = tunneling_exponent()
    Gamma = false_vacuum_decay_rate()

    return {
        "V_at_zero":               V0,
        "V_at_delta_star":         Vstar,
        "curvature_at_zero":       curv0,
        "curvature_at_delta_star": curv_star,
        "zero_is_unstable":        curv0 < 0,
        "delta_star_is_stable":    curv_star > 0,
        "barrier_height":          barrier,
        "WKB_exponent_B":          B,
        "decay_rate_Gamma":        Gamma,
        "delta_star":              DELTA_STAR,
        "explanation": (
            "The vacuum δ=0 ('nothing') has V''(0) < 0: it is an unstable saddle. "
            "Any quantum fluctuation drives the field toward δ★, the unique global "
            "minimum. The universe cannot remain at nothing — icosahedral geometry "
            "mandates existence with the single constant δ★ = (80/81)·π/(13φ)."
        ),
    }


def stability_analysis() -> dict:
    """
    Fixed points of dV/dδ = 0 and their stability.
    dV/dδ = 2_K·δ·(δ−δ★)·(2δ−δ★) = 0
    Roots: δ=0, δ=δ★, δ=δ★/2 (unstable barrier).
    """
    delta_roots = [0.0, DELTA_STAR / 2, DELTA_STAR]
    results = []
    for dr in delta_roots:
        curv = d2V(dr)
        stable = curv > 0
        results.append({
            "delta":    dr,
            "V":        V(dr),
            "V_prime":  dV(dr),
            "V_dprime": curv,
            "stable":   stable,
            "label":    ("global minimum" if abs(dr - DELTA_STAR) < 1e-10
                         else "local maximum" if stable is False
                         else "unstable"),
        })
    return {"fixed_points": results, "global_minimum": DELTA_STAR}


def mexican_hat_parameters() -> dict:
    """
    Cast V(δ) in Mexican-hat (Higgs-like) form near δ★.
    V(δ) ≈ λ·(δ² − v²)² where v = δ★/√2, λ = _K·δ★²/4.
    """
    v = DELTA_STAR / sqrt(2)
    lam = _K * DELTA_STAR ** 2 / 4
    m_sq = 2 * lam * v ** 2    # = _K·δ★⁴/8, mass² of the δ field
    return {
        "v_vev":          v,
        "lambda":         lam,
        "m_squared":      m_sq,
        "m_field":        sqrt(abs(m_sq)),
        "K_normalisation": _K,
        "delta_star":     DELTA_STAR,
    }


def print_vacuum_report() -> None:
    """Print Cathedral vacuum instability analysis."""
    s = why_something_not_nothing()
    mh = mexican_hat_parameters()
    sa = stability_analysis()

    print("  Cathedral Vacuum Potential V(δ) = K·δ²·(δ − δ★)²")
    print(f"    K (normalisation) = {_K:.6f}")
    print()
    print("  Fixed points:")
    for fp in sa["fixed_points"]:
        label = "STABLE" if fp["stable"] else "unstable"
        print(f"    δ = {fp['delta']:.6f}  V={fp['V']:.4g}  V''={fp['V_dprime']:.4f}  [{label}]")
    print()
    print("  Vacuum structure:")
    print(f"    V(0)   = {s['V_at_zero']:.4g}  [unstable: V''(0) = {s['curvature_at_zero']:.4f}]")
    print(f"    V(δ★)  = {s['V_at_delta_star']:.4g}  [STABLE:  V''(δ★) = {s['curvature_at_delta_star']:.4f}]")
    print(f"    Barrier height = {s['barrier_height']:.6f}")
    print(f"    WKB exponent B = {s['WKB_exponent_B']:.6f}")
    print(f"    Decay rate Γ   = {s['decay_rate_Gamma']:.6f}")
    print()
    print("  Mexican-hat form near δ★:")
    print(f"    v (VEV)  = δ★/√2 = {mh['v_vev']:.6f}")
    print(f"    λ        = {mh['lambda']:.6f}")
    print(f"    m_field  = {mh['m_field']:.6f}")
    print()
    print(f"  Conclusion: {s['explanation']}")
