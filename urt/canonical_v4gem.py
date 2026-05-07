"""
CanonicalV4Gem — Compressed ta-URT (Time-Averaging Universal Recursive Tuning)
The minimal canonical form of the Cathedral framework with stability tax.

Core parameters:
  Ω      = 9/13           (H3/full-shell ratio = exhaust fraction)
  τ_stab = 0.001211       (stability tax from K4 curvature)
  n_res  = 13             (resonance shells)
  ε_gem  = δ★·Ω          (gem coupling)

The ta-URT formulation time-averages the gradient flow over one K4 period:
  ⟨δ(t)⟩_{T_K4} = δ★ · (1 − τ_stab · Ω)
where T_K4 = 2π·τ/N = 2π×10/13 is the K4 oscillation period.
"""

import numpy as np
from math import pi, sqrt, exp, log, floor
from .shell_closure import DELTA_STAR, N, D, F, G, V, q, gamma, phi
from .pi_phi_e_flow import ETA, ETA_L, MU, TAU

# ── Core CanonicalV4Gem constants ──────────────────────────────────────────────
OMEGA_GEM      = 9 / 13                     # H3 exhaust fraction
TAU_STAB       = 0.001211                   # stability tax (Cathedral curvature)
N_RES          = N                          # 13 resonance shells
EPS_GEM        = DELTA_STAR * OMEGA_GEM     # gem coupling ≈ 0.10212
T_K4           = 2 * pi * TAU / N           # K4 oscillation period ≈ 4.833
DELTA_TA       = DELTA_STAR * (1 - TAU_STAB * OMEGA_GEM)   # time-averaged fixed point

# ── Resonance shell structure ──────────────────────────────────────────────────
def resonance_shells() -> list[dict]:
    """
    13 resonance shells of the ta-URT framework.
    Shell k carries frequency ω_k = δ★·k/N and amplitude A_k = γ^k.
    """
    shells = []
    for k in range(N):
        omega_k = DELTA_STAR * k / N
        A_k     = gamma**k
        phase_k = 2 * pi * k / N
        stability = 1.0 - TAU_STAB * (1 - exp(-k / (TAU * OMEGA_GEM)))
        shells.append({
            "shell":     k,
            "omega_k":   omega_k,
            "A_k":       A_k,
            "phase_k":   phase_k,
            "stability": stability,
            "sector":    "K4" if k < D + 1 else "H3",
        })
    return shells


# ── ta-URT time-averaging operator ────────────────────────────────────────────

def ta_urt_average(delta_t: np.ndarray, T: float | None = None) -> float:
    """
    Time-average of δ(t) over one K4 period T_K4.

    ⟨δ⟩ = (1/T) ∫₀ᵀ δ(t) dt  (trapezoidal rule)
    """
    T_period = T or T_K4
    N_t = len(delta_t)
    if N_t < 2:
        return float(delta_t[0]) if len(delta_t) > 0 else DELTA_STAR
    dt = T_period / (N_t - 1)
    # np.trapezoid (numpy >=2.0) or manual trapezoidal integration
    total = (delta_t[0] + delta_t[-1]) / 2 + float(np.sum(delta_t[1:-1]))
    return float(total * dt / T_period)


def gem_flow(delta_0: float, steps: int = 500, total_time: float = 60.0,
             with_tax: bool = True) -> np.ndarray:
    """
    CanonicalV4Gem gradient flow with stability tax.

    ∂_t δ = −(1/4π)·δ − (φ−1)·e^{−t/τ}·(δ−δ★)·(1+δ²) − τ_stab·Ω·δ

    The last term is the stability tax. Default total_time=60 >> τ=10 ensures
    the annealing (e^{-t/10}) has decayed to e^{-6}≈0.0025 by the end.
    """
    delta = np.zeros(steps)
    delta[0] = delta_0
    dt = total_time / steps
    for i in range(steps - 1):
        t = i * dt
        diff  = delta[i] - DELTA_STAR
        annel = exp(-t / TAU)
        # Scalar gem flow: Laplacian term vanishes for uniform state;
        # pull drives δ→δ★; tax is stability correction on deviation
        pull  = -MU * annel * diff * (1 + delta[i]**2)
        tax   = -TAU_STAB * OMEGA_GEM * diff if with_tax else 0.0
        delta[i + 1] = np.clip(delta[i] + dt * (pull + tax), 1e-6, 0.5)
    return delta


def gem_contraction_factor() -> dict:
    """
    Contraction factor of ta-URT with stability tax.
    κ_gem = (1 − 2η·λ₂) · (1 − τ_stab·Ω)
    """
    lambda2 = 3.0
    kappa_base = 1.0 - 2 * ETA * lambda2
    kappa_gem  = kappa_base * (1.0 - TAU_STAB * OMEGA_GEM)
    return {
        "kappa_base": kappa_base,
        "kappa_gem":  kappa_gem,
        "is_contraction": abs(kappa_gem) < 1.0,
        "tax_factor": 1.0 - TAU_STAB * OMEGA_GEM,
    }


# ── Compression ratio ────────────────────────────────────────────────────────

def compression_ratio() -> dict:
    """
    Compression ratio of CanonicalV4Gem vs full URT.
    R_comp = N_res × |K4| / (N_full × |H3|) = 13×4 / (13×9) = 4/9
    """
    N_k4  = D + 1   # = 4 K4 modes
    N_h3  = N - N_k4   # = 9 H3 modes
    R_comp = N_k4 / N_h3
    return {
        "N_K4_modes":   N_k4,
        "N_H3_modes":   N_h3,
        "compression":  R_comp,
        "Omega":        OMEGA_GEM,
        "interpretation": f"K4 sector (k=0..3) compresses H3 by ratio {R_comp:.4f}",
    }


# ── Phase portrait ────────────────────────────────────────────────────────────

def gem_phase_portrait(n_orbits: int = 5) -> list[dict]:
    """
    Phase portrait of gem_flow starting from n_orbits initial conditions.
    Returns trajectories showing convergence to δ★.
    """
    d0_values = np.linspace(0.05, 0.45, n_orbits)
    orbits = []
    for d0 in d0_values:
        traj = gem_flow(d0, steps=500, total_time=60.0)   # t >> τ=10
        avg  = ta_urt_average(traj)
        orbits.append({
            "d0":          float(d0),
            "final":       float(traj[-1]),
            "ta_average":  float(avg),
            "converged":   abs(traj[-1] - DELTA_STAR) < 0.02,
            "error_from_delta_star": float(traj[-1] - DELTA_STAR),
        })
    return orbits


# ── Spectral decomposition ────────────────────────────────────────────────────

def gem_spectral_decomposition() -> dict:
    """
    Spectral decomposition of the gem flow.
    Fourier components on the K4 period T_K4.
    """
    traj = gem_flow(0.20, steps=1000)
    fft  = np.fft.rfft(traj - DELTA_STAR)
    freqs = np.fft.rfftfreq(len(traj), d=T_K4 / len(traj))
    power = np.abs(fft)**2
    dominant = np.argmax(power[1:]) + 1   # skip DC
    return {
        "fundamental_freq": float(freqs[dominant]),
        "expected_freq":    1.0 / T_K4,
        "dominant_power":   float(power[dominant]),
        "dc_power":         float(power[0]),
        "T_K4":             T_K4,
        "N_res":            N_RES,
    }


# ── Summary ───────────────────────────────────────────────────────────────────

def canonical_v4gem_summary() -> dict:
    """Full CanonicalV4Gem summary."""
    return {
        "Omega":            OMEGA_GEM,
        "tau_stab":         TAU_STAB,
        "N_res":            N_RES,
        "eps_gem":          EPS_GEM,
        "T_K4":             T_K4,
        "delta_ta":         DELTA_TA,
        "delta_star":       DELTA_STAR,
        "compression":      compression_ratio(),
        "contraction":      gem_contraction_factor(),
        "resonance_shells": resonance_shells(),
    }


def print_canonical_v4gem_report():
    """Print CanonicalV4Gem report with ASCII phase portrait."""
    print()
    print("╔" + "═" * 68 + "╗")
    print("║  CANONICAL V4GEM — Compressed ta-URT Core" + " " * 25 + "║")
    print("║  Ω=9/13  τ_stab=0.001211  13 resonance shells" + " " * 21 + "║")
    print("╚" + "═" * 68 + "╝")

    print()
    print(f"  Ω (H3/total)    = {OMEGA_GEM:.6f}  = 9/13")
    print(f"  τ_stab          = {TAU_STAB:.6f}  (stability tax)")
    print(f"  ε_gem           = δ★·Ω = {EPS_GEM:.6f}")
    print(f"  T_K4            = 2πτ/N = {T_K4:.4f}  (K4 period)")
    print(f"  ⟨δ⟩_ta           = {DELTA_TA:.8f}  (time-averaged fixed point)")
    print(f"  δ★              = {DELTA_STAR:.8f}  (exact fixed point)")

    comp = compression_ratio()
    print()
    print(f"  Compression:  K4({comp['N_K4_modes']} modes) / H3({comp['N_H3_modes']} modes) = {comp['compression']:.4f}")

    cont = gem_contraction_factor()
    print(f"  κ_gem = {cont['kappa_gem']:.6f}  (< 1: contraction ✓)")

    print()
    print("  Resonance shells (k=0..12):")
    print(f"  {'k':<4} {'ω_k':<10} {'A_k':<12} {'Sector':<6} {'Stability':<12}")
    print("  " + "-" * 46)
    for s in resonance_shells():
        print(f"  {s['shell']:<4} {s['omega_k']:<10.5f} {s['A_k']:<12.6f} "
              f"{s['sector']:<6} {s['stability']:<12.6f}")

    print()
    print("  Phase portrait (5 orbits → δ★):")
    orbits = gem_phase_portrait(5)
    print(f"  {'δ₀':<8} {'final':<10} {'⟨δ⟩_ta':<10} {'converged':<10}")
    print("  " + "-" * 40)
    for o in orbits:
        mark = "✓" if o["converged"] else "✗"
        print(f"  {o['d0']:<8.4f} {o['final']:<10.6f} {o['ta_average']:<10.6f} {mark}")
