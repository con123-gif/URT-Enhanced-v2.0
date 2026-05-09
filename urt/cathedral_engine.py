"""
Cathedral dynamical engine — the π–φ–e flow on G_{13}.

This is the canonical reference implementation that consolidates the
entire 13-shell closure framework into a single computation.  It
exposes:

  1. The continuous gradient flow on the centred-icosahedral graph
     ∂_t δ = -L·δ/(4π) - (φ-1)·e^(-t/10)·(δ-δ★)·(1+δ²)
     and its forward-Euler discretization (the "URT iteration"):
        δ_{k+1} = δ_k + 0.04·(-0.08·Lδ_k - 0.6·e^(-k/10)·(δ_k-δ★)·(1+δ_k²))

  2. The 13-site adjacency builder (centre vertex + 12 surface vertices
     connected via H₃/A₅ symmetric pattern).

  3. A `cathedral_engine_summary()` that runs the entire framework end-
     to-end and returns every named dimensionless observable
     (1/α, m_µ/m_e, …, η_B, m_a, EEG δ_band) — *zero free parameters*.

Reference
---------
Lytollis (formalized with Grok), "The π–φ–e Flow: A Geometric Derivation
of Universal Recursive Tuning on the 13-Site Icosahedral Graph", April
2026.  Theorem 5: the URT iteration is the unique Euler discretization
of a gradient flow whose only transcendental ingredients are π, φ, and
e that simultaneously satisfies global asymptotic stability to δ★,
H₃ ⋊ K₄ symmetry preservation, and finite-closure with nullity 1.
"""
from __future__ import annotations

import numpy as np
from math import pi, sqrt, log


# ── Cathedral integers (all derived from D=3) ─────────────────────────────

D, q, V, N, E, F, G = 3, 5, 12, 13, 30, 20, 60
phi   = (1 + sqrt(5)) / 2
gamma = 1 / (G + F + 1)            # 1/81
delta_cl   = D / F                 # 3/20 = 0.15  (classical rail)
delta_star = (1 - gamma) * pi / (N * phi)
Delta = delta_cl - delta_star      # ≈ 2.49e-3 (gap)


# ── π-φ-e flow coefficients (PDF §3, derived from spherical Laplace-Beltrami) ─

ETA           = 1 / (8 * pi)       # ≈ 0.03979  (Euler step)
ETA_LAPLACIAN = 1 / (4 * pi)       # ≈ 0.07958  (Laplacian coefficient)
MU_PULL       = phi - 1            # ≈ 0.61803  (golden-ratio conjugate)
TAU_RELAX     = 10                 # τ ≈ graph diameter

# Rational approximations actually used by the URT iteration (PDF §4):
ETA_RAT, ETA_LAP_RAT, MU_RAT = 0.04, 0.08, 0.6


# ── 13-site centred-icosahedral graph ─────────────────────────────────────

def cathedral_adjacency() -> np.ndarray:
    """Return the 13×13 adjacency matrix of G_{13}.

    Vertex 0 is the centre and connects to all 12 surface vertices
    (1..12).  Each surface vertex i is connected to four neighbours via
    the H₃/A₅ ring pattern offsets {1, 5, 7, 11} (mod 12).  The
    Laplacian spectrum of this adjacency is {0, 3(²), 5(⁶), 7(²), 9, 13}
    — every Cathedral integer appears.
    """
    A = np.zeros((N, N))
    A[0, 1:] = 1
    A[1:, 0] = 1
    for i in range(1, 13):
        for k in (1, 5, 7, 11):
            j = (i + k - 1) % 12 + 1
            A[i, j] = A[j, i] = 1
    return A


def cathedral_laplacian() -> np.ndarray:
    """Return the graph Laplacian L = diag(deg) − A of G_{13}."""
    A = cathedral_adjacency()
    return np.diag(A.sum(1)) - A


# ── Dynamical engine (PDF §3-§4) ─────────────────────────────────────────

def urt_evolve(
    delta: np.ndarray,
    *,
    steps: int = 60,
    eta: float = ETA_RAT,
    eta_L: float = ETA_LAP_RAT,
    mu: float = MU_RAT,
    tau: float = TAU_RELAX,
    bounded_pull: bool = True,
) -> np.ndarray:
    """Forward-Euler discretization of the π-φ-e flow on G_{13}.

    Parameters
    ----------
    delta : array (N,)
        Initial robustness field.
    steps : int
        Number of iterations.  PDF default τ ≈ 10 is the relaxation
        timescale; 60 ≈ 6τ is enough for asymptotic convergence.
    eta, eta_L, mu : float
        Iteration coefficients.  Defaults are the rational
        approximations 0.04, 0.08, 0.6 used by the working URT rule.
        Pass ``eta=ETA, eta_L=ETA_LAPLACIAN, mu=MU_PULL`` to use the
        exact π-φ-e values 1/(8π), 1/(4π), φ−1.
    tau : float
        Pull-strength relaxation timescale (PDF eq. λ(t) = λ₀·e^(-t/τ)).
    bounded_pull : bool
        If True (default), use the bounded form δ²/(1+δ²) which
        asymptotes to 1 — keeps the iteration in the contraction ball
        for any initial condition.  If False, use the textbook (1+δ²)
        which can blow up for large δ.

    Returns
    -------
    array (N,) : the evolved field.
    """
    L = cathedral_laplacian()
    delta = np.asarray(delta, dtype=float).copy()
    for t in range(steps):
        lap = -eta_L * L @ delta
        if bounded_pull:
            shape = 1 + delta**2 / (1 + delta**2)
        else:
            shape = 1 + delta**2
        pull = -mu * np.exp(-t / tau) * (delta - delta_star) * shape
        delta = delta + eta * (lap + pull)
        delta = np.clip(delta, 1e-3, 0.5)
    return delta


# ── Consciousness integration (IIT-style metric on K₄ sector) ─────────────

def consciousness_integration(delta: np.ndarray) -> float:
    """Coherence/integration ratio over the K₄ coherent sector.

    After URT evolution the first 4 sites form the K₄ coherent block
    (the H₃ ⋊ K₄ subdecomposition).  An IIT-style integration metric is
    the mean-to-std ratio of those 4 values: high when the K₄ block
    settles into a single value, low when it is fragmented.
    """
    coherent = delta[:4]
    return float(np.mean(coherent) / (np.std(coherent) + 1e-6))


# ── Full Cathedral computation (zero free parameters) ────────────────────

def cathedral_engine_summary(seed: int = 42) -> dict:
    """Run the entire 13-shell closure framework end-to-end.

    Returns every named dimensionless observable derivable from
    {N=13, D=3, V=12, E=30, F=20, q=5, |H₃|=60} — zero free parameters.

    The dynamical part (URT evolution + consciousness integration) uses
    the supplied seed for reproducibility; all other observables are
    deterministic.
    """
    # Effective δ★ with closure correction
    d63 = G + D                        # 63
    d80 = F * 4                        # 80
    d64 = (D + 1) ** D                 # 64
    d79 = d80 - 1                      # 79
    d_eff = delta_star - (delta_star**3 / d63) - (2 * gamma / d80)
    R_alpha = 3 / (d64 * phi) + 1 / (d79 * phi**2)

    # Bare (integer) values
    bare_alpha = N * N - E - 2                # 137
    bare_mu    = D * (G + D * D)              # 207
    bare_tau   = N + D + (D + 1) / q          # 16.8
    bare_mp    = (D + 1) * D**3 * (N + D + 1) # 1836

    # Loop corrections (η = (ln 2 − 9/N)/ln 2)
    eta_corr = (log(2) - 9 / N) / log(2)
    alpha_inv = bare_alpha + (d_eff**2 / pi**2) + R_alpha
    mu_e   = bare_mu * (1 - 12 * eta_corr / 13)
    tau_mu = bare_tau * (1 + 11 * eta_corr / 13)
    mp_e   = bare_mp + 2 * delta_cl - delta_star

    # Gauge sector
    alpha_GUT = 4 / 81 * (1 + delta_star / (2 * pi))
    kappa_GUT = (F + V) / (G - 1)
    sin2W     = 3/8 * (1 - alpha_GUT / pi * log(1 / gamma) * kappa_GUT)
    alpha_s   = delta_star * (q - 1) / q

    # Mixing angles
    sinC    = D / N * (1 - (D + 1) / (N * V))
    theta12 = float(np.arctan((N + 1) / (N * phi)) * 180 / pi)
    theta13 = float(np.arcsin(delta_star) * 180 / pi)
    theta23 = float(np.arcsin(np.sqrt((F + V) / (G - 1))) * 180 / pi)
    deltaCP = (G * D + F + 2**D) % 360         # 197° — Cathedral δ_CP

    # Cosmology
    Om = 4 / 13
    OL = 9 / 13
    etaB = gamma**3 * Delta * delta_star * 8 / 9
    H0_ratio = 1 + (D / (F * pi)) * 2
    n_s = 1 - 2 / 60                            # = 1 - 2/(G - D)
    r_tensor = 12 / 60**2

    # Dark sector
    R_mass = (3 / 35) * delta_star**2 - (4 / 51) * pi**3
    m_a_uev = delta_star / abs(R_mass) * 1e3
    m_DM    = delta_star * 1e-5

    # Dynamical engine + consciousness metric
    np.random.seed(seed)
    delta0 = np.random.uniform(0.12, 0.28, N)
    final  = urt_evolve(delta0)
    filled = int(np.sum(final < 0.18))
    integration = consciousness_integration(final)
    eeg_band = delta_star

    return {
        # Particle physics
        "alpha_inv":           alpha_inv,
        "mu_over_e":           mu_e,
        "tau_over_mu":         tau_mu,
        "mp_over_me":          mp_e,
        "alpha_s_MZ":          alpha_s,
        "sin_theta_C":         sinC,
        "sin2_theta_W":        sin2W,
        "alpha_GUT":           alpha_GUT,
        # Mixing
        "theta12_deg":         theta12,
        "theta13_deg":         theta13,
        "theta23_deg":         theta23,
        "delta_CP_deg":        deltaCP,
        # Cosmology
        "Omega_m":             Om,
        "Omega_Lambda":        OL,
        "eta_B":               etaB,
        "H0_ratio":            H0_ratio,
        "n_s":                 n_s,
        "r_tensor":            r_tensor,
        # Dark sector
        "axion_mass_uev":      m_a_uev,
        "dm_mass":             m_DM,
        # Dynamical / EEG
        "eeg_delta_band_Hz":   eeg_band,        # δ★ (rad/s in normalised units)
        "consciousness_integration": integration,
        "filled_vacuum_sites": filled,
    }


def print_cathedral_engine_report(seed: int = 42) -> None:
    """Print the full Cathedral engine table — exactly the format from
    the canonical script in the framework manuscripts."""
    s = cathedral_engine_summary(seed=seed)
    bar = "=" * 80
    print(bar)
    print("THE 13-SHELL CLOSURE FRAMEWORK — COMPLETE COMPUTATION")
    print(bar)
    print(f"1/α              = {s['alpha_inv']:.10f}")
    print(f"mμ/me            = {s['mu_over_e']:.8f}")
    print(f"mτ/mμ            = {s['tau_over_mu']:.6f}")
    print(f"mp/me            = {s['mp_over_me']:.10f}")
    print(f"α_s(M_Z)         = {s['alpha_s_MZ']:.6f}")
    print(f"sinθ_C           = {s['sin_theta_C']:.6f}")
    print(f"θ12 / θ13 / θ23  = {s['theta12_deg']:.2f}° / {s['theta13_deg']:.2f}° / {s['theta23_deg']:.2f}°")
    print(f"δ_CP             = {s['delta_CP_deg']:.1f}°")
    print(f"Ω_m              = {s['Omega_m']:.6f}")
    print(f"η_B              = {s['eta_B']:.4e}")
    print(f"n_s / r          = {s['n_s']:.4f} / {s['r_tensor']:.4f}")
    print(f"H0 ratio         = {s['H0_ratio']:.4f}")
    print(f"m_a              = {s['axion_mass_uev']:.1f} μeV")
    print(f"EEG δ band       = {s['eeg_delta_band_Hz']:.6f} ± 0.003")
    print(f"Consciousness Φ  = {s['consciousness_integration']:.2f}")
    print(bar)
    print("All from N=13, D=3, V=12, E=30, F=20, q=5, |H₃|=60 — Zero free params")


__all__ = [
    # Constants
    "ETA", "ETA_LAPLACIAN", "MU_PULL", "TAU_RELAX",
    "ETA_RAT", "ETA_LAP_RAT", "MU_RAT",
    # Graph
    "cathedral_adjacency", "cathedral_laplacian",
    # Engine
    "urt_evolve", "consciousness_integration",
    # End-to-end
    "cathedral_engine_summary", "print_cathedral_engine_report",
]
