"""Tests for urt.axion_cathedral — the Cathedral axion (60.7 µeV)."""
from math import pi

import pytest

from urt.axion_cathedral import (
    DELTA_STAR,
    GAMMA,
    M_PLANCK_GEV,
    M_Z,
    ALPHA_S_MZ,
    ALPHA_EM,
    gamma_power_5,
    axion_pre_exponential,
    alpha_s_running,
    cathedral_crossover_scale,
    axion_mass_GeV,
    axion_mass_eV,
    axion_mass_ueV,
    peccei_quinn_scale,
    photon_coupling,
    secondary_spectral_line_GHz,
    detection_status,
)


# ── Cathedral constants ───────────────────────────────────────────────────

def test_gamma_is_one_over_81():
    """γ = D^{-(D+1)} = 1/81."""
    assert GAMMA == pytest.approx(1 / 81, rel=1e-15)


def test_delta_star_canonical():
    """δ★ = (1-γ)·π/(N·φ)."""
    from math import sqrt
    phi = (1 + sqrt(5)) / 2
    expected = (1 - 1 / 81) * pi / (13 * phi)
    assert DELTA_STAR == pytest.approx(expected, rel=1e-15)


def test_gamma_power_5():
    """γ⁵ = (1/81)⁵."""
    assert gamma_power_5() == pytest.approx((1 / 81) ** 5, rel=1e-15)


def test_axion_pre_exponential():
    """m_a_0 = γ⁵ · M_Pl in GeV."""
    assert axion_pre_exponential() == pytest.approx((1 / 81) ** 5 * M_PLANCK_GEV,
                                                     rel=1e-12)


# ── α_s running ───────────────────────────────────────────────────────────

def test_alpha_s_at_MZ_is_input():
    """α_s(M_Z) recovers ALPHA_S_MZ at the input scale."""
    assert alpha_s_running(M_Z) == pytest.approx(ALPHA_S_MZ, rel=1e-12)


def test_alpha_s_runs_up_at_lower_scale():
    """1-loop α_s should increase below M_Z."""
    assert alpha_s_running(M_Z / 10) > ALPHA_S_MZ


def test_alpha_s_runs_down_at_higher_scale():
    """1-loop α_s should decrease above M_Z."""
    assert alpha_s_running(M_Z * 10) < ALPHA_S_MZ


# ── Cathedral crossover ───────────────────────────────────────────────────

def test_crossover_scale_positive():
    assert cathedral_crossover_scale() > 0


# ── Axion mass — the falsifiable prediction ───────────────────────────────

def test_axion_mass_60_7_microeV():
    """The headline falsifiable claim: m_a ≈ 60.7 μeV."""
    m_ueV = axion_mass_ueV()
    assert 60.0 < m_ueV < 61.5


def test_axion_mass_unit_consistency():
    """μeV / eV / GeV must scale by 10^6 and 10^9."""
    m_GeV = axion_mass_GeV()
    m_eV = axion_mass_eV()
    m_ueV = axion_mass_ueV()
    assert m_eV == pytest.approx(m_GeV * 1e9, rel=1e-12)
    assert m_ueV == pytest.approx(m_eV * 1e6, rel=1e-12)


def test_axion_mass_closed_form():
    """m_a = δ★ / |R_mass| × 10⁻⁶ GeV with R_mass = (3/35)·δ★² − (4/51)·π³."""
    R_mass = (3 / 35) * DELTA_STAR ** 2 - (4 / 51) * pi ** 3
    expected_ueV = DELTA_STAR / abs(R_mass) * 1e3
    assert axion_mass_ueV() == pytest.approx(expected_ueV, rel=1e-12)


# ── Couplings ─────────────────────────────────────────────────────────────

def test_peccei_quinn_scale_positive():
    """f_a > 0."""
    assert peccei_quinn_scale() > 0


def test_photon_coupling_is_delta_star_suppressed():
    """g_aγγ = (α/2π)·δ★/f_a — Cathedral's δ★ suppression."""
    f_a = peccei_quinn_scale()
    expected = (ALPHA_EM / (2 * pi)) * DELTA_STAR / f_a
    assert photon_coupling() == pytest.approx(expected, rel=1e-12)


# ── Secondary spectral line ───────────────────────────────────────────────

def test_secondary_line_uses_codata_conversion():
    """ν = m_a(eV) · 2.41798934e5 GHz/eV · δ★ (δ★-dressed)."""
    EV_TO_GHZ = 2.41798934e5
    expected = axion_mass_eV() * EV_TO_GHZ * DELTA_STAR
    assert secondary_spectral_line_GHz() == pytest.approx(expected, rel=1e-12)


def test_secondary_line_above_zero():
    """The line is finite-positive (not the v2.9.37 ~10⁻⁹ unit bug)."""
    assert 0.1 < secondary_spectral_line_GHz() < 100.0


# ── Detection status ──────────────────────────────────────────────────────

def test_detection_status_in_admx_target():
    """Cathedral axion at ~60.7 μeV is inside ADMX target (2.7-100 μeV)."""
    s = detection_status()
    assert s["in_ADMX_target"] is True
    assert 2.7 <= s["m_a_ueV"] <= 100.0


def test_detection_status_keys_complete():
    s = detection_status()
    for k in ("m_a_ueV", "HAYSTAC_range_ueV", "ADMX_current_ueV",
              "ADMX_target_ueV", "ORGAN_range_GHz", "in_ADMX_target",
              "secondary_line_GHz", "ORGAN_can_detect",
              "required_sensitivity"):
        assert k in s
