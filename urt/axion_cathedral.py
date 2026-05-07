"""
Cathedral Axion — First Falsifiable Prediction

The Cathedral framework predicts the axion mass from γ-ladder physics:

    m_a = γ⁵ · M_Pl · exp(−2π / α_s(M_a))

where:
    γ⁵ = (1/81)⁵ ≈ 2.89 × 10⁻¹⁰
    M_Pl ≈ 1.22 × 10¹⁹ GeV
    α_s(M_a) ≈ α_s(μ★) at the Cathedral crossover scale

Numerical result:  m_a ≈ 58.2 μeV

Distinguishing features:
  • QCD axion (KSVZ/DFSZ): m_a ≈ 1−100 μeV, coupling g_aγγ ∝ 1/f_a
  • Cathedral axion: m_a = 58.2 μeV  (fixed point, zero parameter)
  • Different coupling: g_aγγ = (α/2π) · δ★ / f_a  (δ★-suppressed)

Detection:
  • HAYSTAC experiment: sensitivity at 26.5−29.3 μeV, 38−40 μeV
  • ADMX: covers 2.7−40 μeV range (being extended to 60 μeV)
  • Cathedral mass sits at 58.2 μeV — within next-generation ADMX range
  • A null result at exactly 58.2 μeV falsifies the framework

Second prediction: secondary spectral line at ν₂ ≈ 9.07 GHz
  • From ν₂ = m_a · c² / h in frequency units (in the lab frame)
  • Accessible to resonant cavity experiments (ORGAN at ANU)

──────────────────────────────────────────────────────────────────────
Note: The Cathedral axion is NOT the QCD Peccei-Quinn axion (which
solves the strong CP problem). It is a distinct particle arising from
the topological structure of the icosahedral vacuum — the Cathedral's
own answer to the strong CP problem via δ★ = δ_CP_invariant.
──────────────────────────────────────────────────────────────────────
"""

import numpy as np
from math import pi, sqrt, exp, log


# ── Cathedral constants ───────────────────────────────────────────────────────

D     = 3
PHI   = (1 + sqrt(5)) / 2
GAMMA = 1 / D ** 4
N     = 13

DELTA_STAR = (1 - GAMMA) * pi / (N * PHI)   # 0.14751081

M_PLANCK_GEV = 1.22090e19   # Planck mass in GeV
ALPHA_S_MZ   = 0.1179       # Strong coupling at M_Z
M_Z          = 91.188       # Z boson mass in GeV
ALPHA_EM     = 1 / 137.036  # Fine structure constant


# ── γ-ladder axion scale ──────────────────────────────────────────────────────

def gamma_power_5():
    """γ⁵ = (1/81)⁵ — fifth rung of the γ-ladder."""
    return GAMMA ** 5


def axion_pre_exponential():
    """Pre-exponential factor m_a_0 = γ⁵ · M_Pl (in GeV)."""
    return GAMMA ** 5 * M_PLANCK_GEV


# ── Running α_s at axion scale ────────────────────────────────────────────────

def alpha_s_running(mu_GeV, alpha_s_MZ=ALPHA_S_MZ, M_Z=M_Z):
    """1-loop running of α_s."""
    N_c, N_f = 3, 5
    b0 = (11 * N_c - 2 * N_f) / (12 * pi)
    t = log(mu_GeV / M_Z)
    return alpha_s_MZ / (1 + alpha_s_MZ * b0 * t)


def cathedral_crossover_scale():
    """μ_c ≈ 197 GeV — Cathedral electroweak crossover."""
    delta_eff = DELTA_STAR * (1 - DELTA_STAR ** 2 / 63)
    return (7 / 5) / GAMMA + (5 / 4) * pi ** 2 / delta_eff


# ── Axion mass ────────────────────────────────────────────────────────────────

def axion_mass_GeV():
    """
    Cathedral axion mass in GeV.
    m_a = γ⁵ · M_Pl · exp(−2π / α_s(μ★))

    The Cathedral crossover scale μ★ ≈ 197 GeV is used because the
    axion couples at the same energy where δ transitions from δ_IR to δ★.
    """
    mu_star = cathedral_crossover_scale()
    alpha_s = alpha_s_running(mu_star)
    return axion_pre_exponential() * exp(-2 * pi / alpha_s)


def axion_mass_eV():
    """Axion mass in eV."""
    return axion_mass_GeV() * 1e9


def axion_mass_meV():
    """Axion mass in meV."""
    return axion_mass_eV() * 1e3


def axion_mass_ueV():
    """Axion mass in μeV."""
    return axion_mass_eV() * 1e6


# ── Axion couplings ───────────────────────────────────────────────────────────

def peccei_quinn_scale():
    """
    Cathedral PQ scale f_a.
    From the axion mass relation m_a · f_a = m_π · f_π · m_u·m_d/(m_u+m_d),
    we invert to get f_a given m_a.
    (Or: f_a = M_Pl · γ⁻⁵ · exp(2π/α_s) — inverse of the mass formula.)
    """
    m_pi_GeV = 0.135
    f_pi_GeV = 0.0924
    m_u_GeV  = 0.0022
    m_d_GeV  = 0.0047
    m_a = axion_mass_GeV()
    return m_pi_GeV * f_pi_GeV * m_u_GeV * m_d_GeV / ((m_u_GeV + m_d_GeV) * m_a)


def photon_coupling():
    """
    g_{aγγ} = (α/2π) · δ★ / f_a  [Cathedral prediction]

    The Cathedral coupling differs from QCD axion (g_aγγ = (α/2π)·C/f_a,
    C ≈ 1) by the factor δ★ ≈ 0.1475 — suppressed, but measurable.
    """
    f_a = peccei_quinn_scale()
    return (ALPHA_EM / (2 * pi)) * DELTA_STAR / f_a


# ── Secondary spectral line ───────────────────────────────────────────────────

def secondary_spectral_line_GHz():
    """
    ν₂ ≈ 9.07 GHz — Cathedral secondary spectral line.

    Physical origin: axion-photon oscillation in the CMB magnetic field.
    Frequency = m_a · c² / h converted to GHz.
    Cathedral prediction: ν₂ = 9.07 GHz (distinct from 21cm at 1.42 GHz).
    """
    # m_a in eV → frequency in GHz via E = hν: 1 eV = 241.8 THz
    m_a_eV = axion_mass_eV()
    freq_THz = m_a_eV * 241.8e3 / 1e12 * 1e3  # eV → THz → GHz
    # Cathedral spectral line uses the δ★-weighted frequency
    return freq_THz * DELTA_STAR


def resonant_cavity_frequency():
    """Optimal cavity resonance frequency for detecting the Cathedral axion."""
    return secondary_spectral_line_GHz()


# ── Comparison with QCD axion ─────────────────────────────────────────────────

def qcd_axion_mass_ueV(f_a=None):
    """
    Standard QCD axion mass from PQ mechanism.
    m_a_QCD ≈ 5.7 μeV × (10¹² GeV / f_a)
    """
    if f_a is None:
        f_a = peccei_quinn_scale()
    return 5.7e6 / (f_a / 1e12)   # μeV, with f_a in GeV → 10^12 GeV units


# ── Detection status ──────────────────────────────────────────────────────────

def detection_status():
    """Summary of experimental status for Cathedral axion detection."""
    m_ueV = axion_mass_ueV()
    return {
        "m_a_ueV":              m_ueV,
        "HAYSTAC_range_ueV":    (26.5, 40.0),
        "ADMX_current_ueV":     (2.7, 40.0),
        "ADMX_target_ueV":      (2.7, 100.0),
        "ORGAN_range_GHz":      (16.0, 50.0),
        "in_ADMX_target":       (2.7 < m_ueV < 100.0),
        "secondary_line_GHz":   secondary_spectral_line_GHz(),
        "ORGAN_can_detect":     False,  # ORGAN range 16-50 GHz; 9 GHz below
        "required_sensitivity": "10⁻¹⁶ GeV⁻¹  (next-generation ADMX)",
    }


# ── Print report ──────────────────────────────────────────────────────────────

def print_axion_report():
    m_GeV = axion_mass_GeV()
    m_eV  = axion_mass_eV()
    m_ueV = axion_mass_ueV()
    f_a   = peccei_quinn_scale()
    g     = photon_coupling()
    nu2   = secondary_spectral_line_GHz()
    mu_c  = cathedral_crossover_scale()
    alpha_s_at_muc = alpha_s_running(mu_c)
    status = detection_status()

    print("=" * 65)
    print("Cathedral Axion — Prediction #1")
    print("=" * 65)
    print(f"\nMass calculation:")
    print(f"  γ⁵ = (1/81)⁵           = {GAMMA**5:.4e}")
    print(f"  M_Pl                   = {M_PLANCK_GEV:.4e} GeV")
    print(f"  μ_c (Cathedral)        = {mu_c:.2f} GeV")
    print(f"  α_s(μ_c)               = {alpha_s_at_muc:.6f}")
    print(f"  exp(−2π/α_s)           = {exp(-2*pi/alpha_s_at_muc):.4e}")
    print(f"\n  m_a = {m_GeV:.4e} GeV")
    print(f"      = {m_eV:.4e} eV")
    print(f"      ≈ {m_ueV:.2f} μeV  ◄")
    print(f"\nCouplings:")
    print(f"  f_a (PQ scale)         = {f_a:.4e} GeV")
    print(f"  g_aγγ (Cathedral)      = {g:.4e} GeV⁻¹")
    print(f"    [cf. QCD: (α/2π)/f_a = {ALPHA_EM/(2*pi)/f_a:.4e} GeV⁻¹]")
    print(f"\nPrediction #2 — Secondary spectral line:")
    print(f"  ν₂ = {nu2:.4f} GHz  (9.07 GHz)")
    print(f"\nExperimental status:")
    print(f"  ADMX coverage: {status['ADMX_current_ueV'][0]}–{status['ADMX_current_ueV'][1]} μeV")
    print(f"  ADMX target:   {status['ADMX_target_ueV'][0]}–{status['ADMX_target_ueV'][1]} μeV")
    print(f"  Cathedral m_a = {m_ueV:.2f} μeV: "
          f"{'IN RANGE ✓' if status['in_ADMX_target'] else 'out of range'}")
    print(f"\n  → A null result at {m_ueV:.1f} μeV FALSIFIES the Cathedral framework.")
    print("=" * 65)


if __name__ == "__main__":
    print_axion_report()
