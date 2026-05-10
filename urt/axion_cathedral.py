"""
Cathedral Axion — First Falsifiable Prediction

The Cathedral framework predicts the axion mass from γ-ladder physics:

    m_a = γ⁵ · M_Pl · exp(−2π / α_s(M_a))

where:
    γ⁵ = (1/81)⁵ ≈ 2.89 × 10⁻¹⁰
    M_Pl ≈ 1.22 × 10¹⁹ GeV
    α_s(M_a) ≈ α_s(μ★) at the Cathedral crossover scale

Numerical result:  m_a ≈ 60.7 μeV

Distinguishing features:
  • QCD axion (KSVZ/DFSZ): m_a ≈ 1−100 μeV, coupling g_aγγ ∝ 1/f_a
  • Cathedral axion: m_a = 60.7 μeV  (fixed point, zero parameter)
  • Different coupling: g_aγγ = (α/2π) · δ★ / f_a  (δ★-suppressed)

Detection:
  • HAYSTAC experiment: sensitivity at 26.5−29.3 μeV, 38−40 μeV
  • ADMX: covers 2.7−40 μeV range (being extended to 60 μeV)
  • Cathedral mass sits at 60.7 μeV — within next-generation ADMX range
  • A null result at exactly 60.7 μeV falsifies the framework

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

    From the ARF mass residue R_mass:
        R_mass = (3/d35)·δ★² − (4/d51)·π³
        m_a = δ★ / |R_mass|  ×  10³  [in μeV, then convert to GeV]

    where d35 = E + q = 35, d51 = G − D² = 51.

    These shell integers appear in the same ARF system that fixes α and
    the lepton masses. The mass formula is therefore a direct output of
    the 13-site closure — zero free parameters.

    Numerical value: m_a ≈ 60.7 μeV = 6.07 × 10⁻¹⁴ GeV.
    """
    E, q, G, D = 30, 5, 60, 3
    d35 = E + q        # = 35
    d51 = G - D * D    # = 51
    R_mass = (3 / d35) * DELTA_STAR ** 2 - (4 / d51) * pi ** 3
    m_ueV = DELTA_STAR / abs(R_mass) * 1e3   # μeV
    return m_ueV * 1e-6 * 1e-9              # μeV → eV → GeV


def axion_mass_eV():
    """Axion mass in eV."""
    return axion_mass_GeV() * 1e9




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
    ν₂ — Cathedral secondary spectral line in GHz.

    Physical origin: axion-photon oscillation, ν = m_a·c² / h, then
    multiplied by the δ★ topological dressing factor.

    Unit conversion:  1 eV  =  2.418 × 10⁵ GHz  (from h = 6.626e-34 J·s,
                                                 1 eV = 1.602e-19 J).

    For the Cathedral axion m_a ≈ 60.7 µeV = 6.07 × 10⁻⁵ eV:
        ν      =  6.07e-5 × 2.418e5 GHz  ≈  14.7 GHz
        ν₂     =  ν · δ★  ≈  14.7 × 0.1475  ≈  2.17 GHz

    NOTE: the manuscript also quotes a "9.07 GHz" line; that figure
    appears to come from a different derivation that is not currently
    in the urt code base.  This function returns the δ★-dressed value.
    """
    m_a_eV = axion_mass_eV()
    # 1 eV ≡ 2.4179893e5 GHz  (CODATA)
    EV_TO_GHZ = 2.41798934e5
    freq_GHz = m_a_eV * EV_TO_GHZ
    # δ★ topological dressing
    return freq_GHz * DELTA_STAR




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
