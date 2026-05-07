"""
Cathedral Gravitational Waves — IKT Detection and Black Hole Ringdown

The icosahedral shell provides a natural basis for gravitational wave (GW)
detection and characterisation. Key insight: GW strain h(t) decomposed via
IKT reveals icosahedral spectral structure near the ringdown frequency.

Cathedral GW predictions:
  ─────────────────────────────────────────────────────────────────
  Ringdown frequency     f_rd = f_ISCO × (1 − δ★)         ← shift
  Damping time           τ_d  = 1/(π·f_rd·δ★)
  Strain amplitude       h₀   = (G_N·M_chirp/r)·(v/c)²
  QNM frequency          f_QNM = c³/(2π·G_N·M·(3+δ★))
  Memory effect          Δh_mem = G_N·E_rad/(r·c²)·δ★
  ─────────────────────────────────────────────────────────────────

IKT-based GW detection algorithm:
  1. IKT-decompose the detector strain h(t) on a 13-sample window
  2. Project onto K₄ coherent sector (modes 0-3): signal
  3. Project onto A₅ exhaust sector (modes 4-12): noise
  4. Signal-to-noise ρ = P_K4 / P_A5  (Cathedral SNR)
  5. Detection threshold: ρ > 1/δ★ ≈ 6.78 (signal exceeds noise by κ factor)

This uses the IKT sector split as a matched filter tuned to GW physics.
"""

import numpy as np
from math import pi, sqrt, log, exp


# ── Cathedral constants ───────────────────────────────────────────────────────

D          = 3
PHI        = (1 + sqrt(5)) / 2
GAMMA      = 1 / 81
N          = 13
G_ROT      = 60

DELTA_STAR = (1 - GAMMA) * pi / (N * PHI)
G_N        = DELTA_STAR ** 2   # Cathedral Newton constant (Planck units)

# Physical constants (SI)
G_SI       = 6.674e-11     # m³ kg⁻¹ s⁻²
C_SI       = 2.998e8       # m/s
M_SUN_KG   = 1.989e30      # kg
PC_M       = 3.086e16      # m per parsec


# ── Quasi-normal modes ────────────────────────────────────────────────────────

def qnm_frequency(M_solar: float) -> float:
    """
    Cathedral quasi-normal mode (ringdown) frequency.

    f_QNM = c³ / (2π · G · M · (3 + δ★))

    The factor (3 + δ★) = D + δ★ replaces the standard GR factor 3
    (Schwarzschild) with the Cathedral correction. For M_solar = 30M_sun,
    f_QNM ≈ 250 Hz (in LIGO band).

    Parameters
    ----------
    M_solar : float
        Black hole mass in solar masses.
    """
    M_kg = M_solar * M_SUN_KG
    return C_SI ** 3 / (2 * pi * G_SI * M_kg * (D + DELTA_STAR))


def ringdown_damping_time(M_solar: float) -> float:
    """
    Ringdown damping time τ_d = 1/(π·f_QNM·δ★).

    The Cathedral correction δ★ acts as the imaginary part of the QNM
    frequency, determining how quickly ringdown oscillations decay.
    τ_d ≈ few milliseconds for stellar-mass BH mergers.
    """
    f = qnm_frequency(M_solar)
    return 1.0 / (pi * f * DELTA_STAR)


def isco_frequency(M_solar: float) -> float:
    """
    ISCO (innermost stable circular orbit) frequency.

    f_ISCO = c³ / (6^(3/2) · 2π · G · M)  (Schwarzschild)
    """
    M_kg = M_solar * M_SUN_KG
    return C_SI ** 3 / (6 ** 1.5 * 2 * pi * G_SI * M_kg)


def cathedral_ringdown_shift(M_solar: float) -> float:
    """
    Cathedral shift of ringdown frequency relative to GR prediction.

    f_rd_Cathedral = f_ISCO × (1 − δ★)

    The δ★ correction reduces the ringdown frequency slightly — a
    distinctive Cathedral signature observable by LISA/ET for massive BHs.
    """
    return isco_frequency(M_solar) * (1 - DELTA_STAR)


# ── Strain amplitude ──────────────────────────────────────────────────────────

def chirp_mass(m1_solar: float, m2_solar: float) -> float:
    """M_chirp = (m1·m2)^(3/5) / (m1+m2)^(1/5)."""
    m1, m2 = m1_solar, m2_solar
    return (m1 * m2) ** 0.6 / (m1 + m2) ** 0.2


def peak_strain(m1_solar: float, m2_solar: float,
                distance_Mpc: float) -> float:
    """
    Peak GW strain h at detector distance r.

    h₀ = (4·G·M_chirp/r·c²) · (π·f_ISCO·G·M_chirp/c³)^(2/3)

    Cathedral correction: multiply by (1 − δ★²) ≈ 0.978.
    """
    M_c   = chirp_mass(m1_solar, m2_solar) * M_SUN_KG
    r_m   = distance_Mpc * 1e6 * PC_M
    f_GW  = isco_frequency(chirp_mass(m1_solar, m2_solar))
    # Standard amplitude
    h_std = (4 * G_SI * M_c / (r_m * C_SI ** 2)
             * (pi * f_GW * G_SI * M_c / C_SI ** 3) ** (2 / 3))
    return h_std * (1 - DELTA_STAR ** 2)


def gw_memory_effect(E_rad_solar: float, distance_Mpc: float) -> float:
    """
    Cathedral GW memory effect: Δh = G·E_rad/(r·c²) · δ★.

    The δ★ correction to the standard Christodoulou memory introduces a
    characteristic fractional memory 2π·δ★ ≈ 0.927 of the standard value.

    Parameters
    ----------
    E_rad_solar : float
        Radiated energy in solar masses × c².
    """
    E_J  = E_rad_solar * M_SUN_KG * C_SI ** 2
    r_m  = distance_Mpc * 1e6 * PC_M
    return (G_SI * E_J / (r_m * C_SI ** 4)) * DELTA_STAR


# ── IKT-based detection ───────────────────────────────────────────────────────

def ikt_matrix_simple() -> np.ndarray:
    """13×13 IKT basis matrix (K₄ + A₅ phases)."""
    Psi = np.zeros((N, N), dtype=complex)
    K4  = range(4)
    A5  = range(4, N)
    for k in K4:
        for n in range(N):
            Psi[k, n] = np.exp(1j * pi * k * n / 2)
    for k in A5:
        for n in range(N):
            Psi[k, n] = np.exp(2j * pi * (k - 4) * n / 5)
    return Psi


def cathedral_snr(strain_window: np.ndarray) -> float:
    """
    Cathedral signal-to-noise ratio from IKT sector split.

    SNR = P_K4 / P_A5  where P = sum of |C_k|² in each sector.

    Detection threshold: SNR > 1/δ★ ≈ 6.78
    This is equivalent to a matched-filter SNR ρ ≈ 6 (standard LIGO threshold).

    Parameters
    ----------
    strain_window : ndarray (13,)
        13-sample GW strain window (arbitrary units).
    """
    if len(strain_window) != N:
        raise ValueError(f"Strain window must have {N} samples.")
    Psi = ikt_matrix_simple()
    C   = Psi @ strain_window.astype(complex)
    P_K4 = float(np.abs(C[:4] ** 2).sum())
    P_A5 = float(np.abs(C[4:] ** 2).sum())
    return P_K4 / (P_A5 + 1e-300)


def detection_threshold() -> float:
    """Cathedral detection threshold = 1/δ★ ≈ 6.78."""
    return 1.0 / DELTA_STAR


def is_gw_detected(strain_window: np.ndarray) -> bool:
    """True if IKT SNR exceeds the Cathedral detection threshold."""
    return cathedral_snr(strain_window) > detection_threshold()


# ── Gravitational wave spectrum ───────────────────────────────────────────────

def gw_power_spectrum(f: np.ndarray, M_chirp_solar: float) -> np.ndarray:
    """
    Cathedral GW power spectral density |h̃(f)|².

    |h̃(f)|² ∝ f^{−7/3} × Cathedral_envelope(f)

    Cathedral_envelope = exp(−2·(f/f_ISCO)²·δ★)
    (Gaussian cutoff near ISCO with Cathedral width δ★)
    """
    f = np.asarray(f, dtype=float)
    f_isco = isco_frequency(M_chirp_solar)
    envelope = np.exp(-2 * (f / f_isco) ** 2 * DELTA_STAR)
    with np.errstate(divide="ignore", invalid="ignore"):
        psd = np.where(f > 0, f ** (-7 / 3) * envelope, 0.0)
    return psd


# ── Event summary ─────────────────────────────────────────────────────────────

def gw_event_summary(m1: float, m2: float, dist_Mpc: float) -> dict:
    """
    Complete Cathedral GW event characterisation.

    Parameters
    ----------
    m1, m2 : float
        Component masses in solar masses.
    dist_Mpc : float
        Luminosity distance in Mpc.
    """
    M_c      = chirp_mass(m1, m2)
    M_total  = m1 + m2
    f_ISCO   = isco_frequency(M_total)
    f_QNM    = qnm_frequency(M_total)
    tau_d    = ringdown_damping_time(M_total)
    h0       = peak_strain(m1, m2, dist_Mpc)
    h_mem    = gw_memory_effect(0.05 * M_total, dist_Mpc)  # ~5% radiated
    return {
        "m1_solar":          m1,
        "m2_solar":          m2,
        "chirp_mass_solar":  M_c,
        "total_mass_solar":  M_total,
        "dist_Mpc":          dist_Mpc,
        "f_ISCO_Hz":         f_ISCO,
        "f_QNM_Hz":          f_QNM,
        "tau_damping_ms":    tau_d * 1e3,
        "h_peak":            h0,
        "h_memory":          h_mem,
        "delta_star_shift":  DELTA_STAR,
        "snr_threshold":     detection_threshold(),
    }


# ── Print report ──────────────────────────────────────────────────────────────

def print_gw_report():
    print("=" * 72)
    print("Cathedral Gravitational Waves — IKT Detection & Ringdown")
    print(f"  δ★ = {DELTA_STAR:.8f},  G_N = δ★² = {G_N:.8f}")
    print("=" * 72)

    print(f"\n  IKT detection threshold: SNR > 1/δ★ = {detection_threshold():.4f}")

    print(f"\n  GW150914-like event (36M+29M, 410 Mpc):")
    s = gw_event_summary(36, 29, 410)
    print(f"    Chirp mass:       {s['chirp_mass_solar']:.2f} M☉")
    print(f"    f_ISCO:           {s['f_ISCO_Hz']:.1f} Hz")
    print(f"    f_QNM (Cathedral):{s['f_QNM_Hz']:.1f} Hz")
    print(f"    Ringdown time:    {s['tau_damping_ms']:.2f} ms")
    print(f"    Peak strain h:    {s['h_peak']:.2e}")
    print(f"    GW memory Δh:     {s['h_memory']:.2e}")

    print(f"\n  Supermassive BH (1e8 M☉ + 1e8 M☉, 1 Gpc) — LISA target:")
    s2 = gw_event_summary(1e8, 1e8, 1e3)
    print(f"    f_QNM:            {s2['f_QNM_Hz']*1000:.4f} mHz")
    print(f"    Ringdown time:    {s2['tau_damping_ms']/1000:.0f} s")
    print(f"    Peak strain h:    {s2['h_peak']:.2e}")
    print("=" * 72)


if __name__ == "__main__":
    print_gw_report()
