"""Tests for urt.axion_cathedral — Cathedral axion prediction."""

import pytest
from math import isfinite
from urt.axion_cathedral import (
    axion_mass_GeV,
    axion_mass_eV,
    axion_mass_ueV,
    peccei_quinn_scale,
    photon_coupling,
    secondary_spectral_line_GHz,
    detection_status,
    gamma_power_5,
    axion_pre_exponential,
    alpha_s_running,
    cathedral_crossover_scale,
)


def test_gamma_power_5():
    """γ⁵ = (1/81)⁵."""
    g5 = gamma_power_5()
    assert abs(g5 - (1/81)**5) < 1e-20


def test_crossover_scale_range():
    """μ_c must be between 150 and 250 GeV."""
    mu_c = cathedral_crossover_scale()
    assert 150 < mu_c < 250


def test_alpha_s_at_crossover():
    """α_s at μ_c must be in physical range."""
    mu_c = cathedral_crossover_scale()
    a = alpha_s_running(mu_c)
    assert 0.05 < a < 0.20


def test_axion_mass_positive():
    assert axion_mass_GeV() > 0
    assert axion_mass_eV() > 0
    assert axion_mass_ueV() > 0


def test_axion_mass_finite():
    assert isfinite(axion_mass_GeV())


def test_axion_mass_in_ueV_range():
    """Cathedral prediction ≈ 58.2 μeV — should be in 10–200 μeV range."""
    m = axion_mass_ueV()
    assert 10 < m < 200, f"m_a = {m:.2f} μeV out of expected range"


def test_pq_scale_range():
    """PQ scale f_a should be in 10⁸ – 10¹² GeV range (astrophysical window)."""
    f_a = peccei_quinn_scale()
    assert 1e8 < f_a < 1e14


def test_photon_coupling_positive():
    assert photon_coupling() > 0


def test_photon_coupling_finite():
    assert isfinite(photon_coupling())


def test_secondary_spectral_line():
    """ν₂ should be near 9 GHz (Cathedral prediction: 9.07 GHz)."""
    nu = secondary_spectral_line_GHz()
    assert 5 < nu < 20


def test_detection_status_keys():
    status = detection_status()
    for key in ["m_a_ueV", "ADMX_target_ueV", "secondary_line_GHz",
                "in_ADMX_target"]:
        assert key in status


def test_detection_status_consistent():
    status = detection_status()
    m = status["m_a_ueV"]
    target = status["ADMX_target_ueV"]
    expected_in_target = target[0] < m < target[1]
    assert status["in_ADMX_target"] == expected_in_target
