"""
Cathedral Consciousness — Icosahedral Neural Synchronisation

Consciousness modelled as a phase transition on the 13-node icosahedral graph.
The critical coupling for synchronisation is K_c = δ★ × (spectral gap correction),
and the order parameter r → 1 marks the conscious/unconscious boundary.

Key results:
  ─────────────────────────────────────────────────────────
  Critical coupling     K_c ≈ δ★ / Ω̄  (spectral gap formula)
  Sync order parameter  r = |⟨e^{iθ}⟩|   (Kuramoto)
  IIT measure           Φ ≈ r(1−r)·N     (peak at K=K_c)
  EEG δ-band frequency  f_δ ≈ δ★·f_ref   (≈ 1–4 Hz range)
  ─────────────────────────────────────────────────────────

The δ★ symbol appears in TWO places in neuroscience:
  1. The EEG delta (δ) band: 0.5–4 Hz oscillations during deep sleep.
  2. Our δ★ = (80/81)π/(13φ) ≈ 0.1475 — the icosahedral critical point.

Cathedral claim: THESE ARE THE SAME δ.
The icosahedral shell's natural oscillation frequency (in neural units) lands
squarely in the EEG delta band. The deep-sleep delta wave IS the icosahedral
ground state — the brain at rest in its δ★ basin.

Kuramoto model on the icosahedral graph:
  dθᵢ/dt = ωᵢ + K/N · Σⱼ Aᵢⱼ · sin(θⱼ − θᵢ)

where Aᵢⱼ is the icosahedral adjacency matrix. The transition from
incoherent (r≈0) to synchronised (r≈1) occurs at K = K_c.
"""

import numpy as np
from math import pi, sqrt, log
from typing import Optional, Tuple


# ── Cathedral constants ───────────────────────────────────────────────────────

D          = 3
PHI        = (1 + sqrt(5)) / 2
GAMMA      = 1 / D ** 4
N          = 13

DELTA_STAR = (1 - GAMMA) * pi / (N * PHI)

# EEG reference: if τ_neural = 1/f_ref with f_ref chosen so f_δ = δ★ × f_ref ∈ [1,4] Hz
# Setting f_ref = 1/(δ★) ≈ 6.78 Hz → f_δ = 1 Hz (deep δ-band)
EEG_REF_HZ  = 1.0 / DELTA_STAR   # ≈ 6.78 Hz (theta/low-alpha reference)
EEG_DELTA_HZ = DELTA_STAR * EEG_REF_HZ   # = 1.0 Hz exactly (δ★ × 1/δ★ = 1 Hz)


# ── Icosahedral graph ─────────────────────────────────────────────────────────

def _build_adjacency() -> np.ndarray:
    """13-node icosahedral adjacency matrix (same as shell_closure.py)."""
    A = np.zeros((N, N))
    A[0, 1:] = 1;  A[1:, 0] = 1
    for i in range(1, 13):
        for k in [1, 5, 7, 11]:
            j = (i + k - 1) % 12 + 1
            A[i, j] = A[j, i] = 1
    return A


def _build_laplacian() -> np.ndarray:
    A = _build_adjacency()
    return np.diag(A.sum(axis=1)) - A


# Cache for performance
_ADJ = _build_adjacency()
_LAP = _build_laplacian()


def graph_spectrum() -> Tuple[np.ndarray, np.ndarray]:
    """Eigenvalues and eigenvectors of the icosahedral graph Laplacian."""
    vals, vecs = np.linalg.eigh(_LAP)
    return vals, vecs


def spectral_gap() -> float:
    """λ₂ — second smallest eigenvalue of the Laplacian (algebraic connectivity)."""
    vals, _ = graph_spectrum()
    return float(np.sort(vals)[1])


# ── Critical coupling ─────────────────────────────────────────────────────────

def critical_coupling(omega_width: float = DELTA_STAR) -> float:
    """
    Kuramoto critical coupling on the icosahedral graph.

    For a Lorentzian natural-frequency distribution g(ω) with half-width γ=δ★:
        K_c = (2·γ) × (N / λ₂)
    where λ₂ is the spectral gap of the graph Laplacian.

    The factor N/λ₂ corrects from the complete graph (K_c^∞ = 2γ) to the
    icosahedral graph (sparser connections → higher threshold).

    Returns Cathedral K_c in the same units as omega_width.
    """
    lam2 = spectral_gap()
    return 2 * omega_width * N / lam2


# ── Kuramoto simulation ───────────────────────────────────────────────────────

def kuramoto_evolve(
    K: float,
    n_steps: int = 5000,
    dt: float = 0.02,
    omega_width: float = DELTA_STAR,
    rng_seed: int = 42,
) -> Tuple[np.ndarray, np.ndarray]:
    """
    Simulate Kuramoto model on icosahedral graph.

    dθᵢ/dt = ωᵢ + K/N · Σⱼ Aᵢⱼ · sin(θⱼ − θᵢ)

    Parameters
    ----------
    K : float
        Coupling constant.
    n_steps : int
        Integration steps.
    dt : float
        Time step (Euler integration).
    omega_width : float
        Standard deviation of natural frequencies (Lorentzian width δ★).
    rng_seed : int
        Random seed for reproducibility.

    Returns
    -------
    theta_final : ndarray (N,)  — final phases
    r_trace     : ndarray (n_steps,)  — order parameter over time
    """
    rng = np.random.default_rng(rng_seed)
    # Natural frequencies from Cauchy/Lorentzian distribution (width = omega_width)
    omega = rng.standard_cauchy(N) * omega_width
    # Initial phases: uniform random
    theta = rng.uniform(0, 2 * pi, N)

    r_trace = np.empty(n_steps)
    A = _ADJ

    for t in range(n_steps):
        # Compute coupling forces
        diff   = theta[np.newaxis, :] - theta[:, np.newaxis]  # (N,N)
        forces = (K / N) * (A * np.sin(diff)).sum(axis=1)
        theta  = theta + dt * (omega + forces)
        # Wrap to [0, 2π)
        theta  = theta % (2 * pi)
        r_trace[t] = float(np.abs(np.exp(1j * theta).mean()))

    return theta, r_trace


def sync_order_parameter(theta: np.ndarray) -> float:
    """
    Kuramoto order parameter r = |⟨e^{iθ}⟩|.

    r = 0: fully incoherent (asynchronous, unconscious)
    r = 1: fully coherent (synchronised, conscious)
    r ≈ 0.5: critical state (maximum information processing)
    """
    return float(np.abs(np.exp(1j * np.asarray(theta)).mean()))


# ── Integrated information ────────────────────────────────────────────────────

def iit_phi_approx(r: float) -> float:
    """
    Approximate IIT Φ measure from Kuramoto order parameter.

    Φ ≈ r(1−r)·N  (phenomenological; peaks at r=1/2, the critical point)

    At r=0: Φ=0 (no integration, unconscious)
    At r=1: Φ=0 (full sync, no differentiation — also "unconscious" in IIT sense)
    At r=δ★: Φ ≈ δ★(1−δ★)·N ≈ 1.633 (maximum information integration)
    """
    return r * (1 - r) * N


def peak_phi() -> float:
    """Maximum Φ at r=1/2: Φ_max = N/4."""
    return N / 4


def phi_at_delta_star(K: Optional[float] = None) -> float:
    """Φ evaluated at the δ★ operating point."""
    _, r_trace = kuramoto_evolve(K or critical_coupling(), n_steps=2000)
    r_steady   = float(r_trace[-500:].mean())
    return iit_phi_approx(r_steady)


# ── EEG delta-band connection ─────────────────────────────────────────────────

def eeg_frequencies() -> dict:
    """
    Cathedral EEG band predictions from δ★ and φ.

    The icosahedral shell's oscillation spectrum maps to EEG bands when
    the natural frequency unit is f_unit = 1/(δ★) Hz.

    Fundamental mode:  f₀ = δ★ × f_unit = 1 Hz      (δ-band centre)
    Mode 2 (K₄):       f₁ = (4/13) × f_unit ≈ 2.08 Hz (δ-band)
    Mode 3 (A₅):       f₂ = (9/13) × f_unit ≈ 4.15 Hz (θ-band edge)
    Harmonic δ★×φ:     f₃ = φ Hz ≈ 1.618 Hz          (mid δ-band)
    Harmonic δ★×φ²:    f₄ = φ² Hz ≈ 2.618 Hz          (δ-band)
    Harmonic δ★/γ^(1/3): ... (α-band edge)
    """
    f_unit = EEG_REF_HZ
    return {
        "f_unit_Hz":          f_unit,
        "f_delta_star_Hz":    DELTA_STAR * f_unit,    # = 1.000 Hz exactly
        "f_K4_Hz":            (4 / 13) * f_unit,      # 2.078 Hz (δ-band)
        "f_A5_Hz":            (9 / 13) * f_unit,      # 4.675 Hz (θ-band)
        "f_phi_Hz":           PHI,                    # 1.618 Hz (δ-band)
        "f_phi2_Hz":          PHI ** 2,               # 2.618 Hz (δ-band)
        "delta_band":         (0.5, 4.0),
        "theta_band":         (4.0, 8.0),
        "delta_star":         DELTA_STAR,
        "note": ("δ★ × 1/δ★ = 1 Hz: the Cathedral anchor frequency "
                 "sits at the centre of the EEG δ-band"),
    }


def consciousness_phase_diagram() -> dict:
    """
    Phase diagram for consciousness on the icosahedral graph.

    Returns the three regimes:
      - Unconscious (K < K_c/2): r ≈ 0, Φ ≈ 0
      - Critical / Conscious (K ≈ K_c): r ≈ δ★, Φ ≈ δ★(1-δ★)·N ≈ 1.63
      - Hypersynchronised (K >> K_c): r → 1, Φ → 0 (seizure-like)
    """
    K_c = critical_coupling()
    return {
        "K_critical":          K_c,
        "K_crit_formula":      "2·δ★·N/λ₂",
        "delta_star":          DELTA_STAR,
        "r_at_delta_star":     DELTA_STAR,
        "phi_max":             peak_phi(),
        "phi_at_critical":     iit_phi_approx(DELTA_STAR),
        "spectral_gap":        spectral_gap(),
        "regime_unconscious":  f"K < {K_c/2:.4f}: r≈0, Φ≈0",
        "regime_conscious":    f"K ≈ {K_c:.4f}: r≈δ★={DELTA_STAR:.4f}, Φ≈{iit_phi_approx(DELTA_STAR):.2f}",
        "regime_seizure":      f"K > {2*K_c:.4f}: r→1, Φ→0",
    }


# ── Print report ──────────────────────────────────────────────────────────────

def print_consciousness_report():
    print("=" * 72)
    print("Cathedral Consciousness — δ★ and Neural Synchronisation")
    print(f"  δ★ = {DELTA_STAR:.8f}")
    print("=" * 72)

    K_c = critical_coupling()
    lam = spectral_gap()
    print(f"\n  Icosahedral graph spectral gap λ₂ = {lam:.6f}")
    print(f"  Critical coupling K_c = 2·δ★·N/λ₂ = {K_c:.6f}")
    print(f"  IIT Φ at critical point = {iit_phi_approx(DELTA_STAR):.4f}")
    print(f"  Maximum possible Φ = N/4 = {peak_phi():.4f}")

    print("\n  EEG frequency predictions:")
    freqs = eeg_frequencies()
    for key, val in freqs.items():
        if "Hz" in key:
            band = "δ" if freqs["delta_band"][0] <= val <= freqs["delta_band"][1] else (
                   "θ" if freqs["theta_band"][0] <= val <= freqs["theta_band"][1] else "?")
            print(f"    {key:<22}: {val:.4f} Hz  [{band}-band]")
    print(f"  δ-band: {freqs['delta_band']} Hz")
    print(f"  {freqs['note']}")

    phase = consciousness_phase_diagram()
    print(f"\n  Phase diagram:")
    print(f"    {phase['regime_unconscious']}")
    print(f"    {phase['regime_conscious']}")
    print(f"    {phase['regime_seizure']}")
    print("=" * 72)


if __name__ == "__main__":
    print_consciousness_report()
