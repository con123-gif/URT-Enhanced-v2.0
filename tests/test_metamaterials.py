"""Tests for urt.metamaterials — icosahedral photonic/phononic crystal design."""

import pytest
import numpy as np
from math import pi, sqrt
from urt.metamaterials import (
    photonic_band_gap_frequency,
    photonic_gap_width,
    gap_to_midgap_ratio,
    fill_fraction,
    effective_refractive_index,
    negative_index_condition,
    z2_topological_invariant,
    edge_state_frequency,
    topological_protection_length,
    capsid_binding_sites,
    phononic_dispersion,
    sound_velocity_ratio,
    metamaterial_summary,
    DELTA_STAR,
    Delta,
    N,
)


def test_photonic_gap_at_delta_star():
    """Band gap centre = δ★ × ω_ref."""
    assert photonic_band_gap_frequency(1.0) == pytest.approx(DELTA_STAR, rel=1e-10)
    assert photonic_band_gap_frequency(2.0) == pytest.approx(2 * DELTA_STAR, rel=1e-10)


def test_photonic_gap_width_positive():
    """Gap width must be positive."""
    assert photonic_gap_width() > 0


def test_photonic_gap_width_formula():
    """Δω = 2·Δ × ω_ref."""
    assert photonic_gap_width(1.0) == pytest.approx(2 * Delta, rel=1e-10)


def test_gap_midgap_ratio():
    """Gap/midgap = 2Δ/δ★."""
    expected = 2 * Delta / DELTA_STAR
    assert gap_to_midgap_ratio() == pytest.approx(expected, rel=1e-10)


def test_gap_midgap_about_3_percent():
    """Gap/midgap ratio ≈ 3.4% (metamaterial quality)."""
    ratio_pct = gap_to_midgap_ratio() * 100
    assert 3.0 < ratio_pct < 4.0


def test_fill_fraction():
    """Optimal fill fraction = K₄/N = 4/13."""
    assert fill_fraction() == pytest.approx(4 / N, rel=1e-10)


def test_fill_fraction_value():
    """Fill fraction ≈ 0.308."""
    assert 0.30 < fill_fraction() < 0.32


def test_effective_refractive_index():
    """n_eff = 1/(δ★·√2)."""
    expected = 1.0 / (DELTA_STAR * sqrt(2))
    assert effective_refractive_index() == pytest.approx(expected, rel=1e-10)


def test_effective_n_high_index():
    """n_eff ≈ 4.8 — high-index metamaterial regime."""
    n = effective_refractive_index()
    assert 4.0 < n < 6.0


def test_negative_index_condition_keys():
    nic = negative_index_condition()
    for key in ["omega_gap", "omega_lo", "omega_hi", "n_eff", "bandwidth"]:
        assert key in nic


def test_negative_index_is_negative():
    """Negative-index band n_eff < 0."""
    nic = negative_index_condition()
    assert nic["n_eff"] < 0


def test_negative_index_bandwidth():
    """Bandwidth equals gap width."""
    nic = negative_index_condition()
    assert nic["bandwidth"] == pytest.approx(photonic_gap_width(), rel=1e-10)


def test_negative_index_window():
    """omega_lo < omega_gap < omega_hi."""
    nic = negative_index_condition()
    assert nic["omega_lo"] < nic["omega_gap"] < nic["omega_hi"]


def test_z2_topological_invariant():
    """Z₂ = 1 (non-trivial topology)."""
    assert z2_topological_invariant() == 1


def test_edge_state_at_gap():
    """Edge state lives at mid-gap = ω_gap."""
    assert edge_state_frequency() == pytest.approx(photonic_band_gap_frequency(), rel=1e-10)


def test_topological_protection_length():
    """ξ = 1/Δω — should be positive and large (long-range protection)."""
    xi = topological_protection_length()
    assert xi > 0
    assert xi > 100  # Δω ≪ 1 → ξ ≫ 1


def test_capsid_binding_keys():
    b = capsid_binding_sites(15.0)
    for key in ["R_capsid_nm", "r_binding_nm", "r_groove_nm",
                "n_binding_sites", "delta_star"]:
        assert key in b


def test_capsid_binding_radius():
    """r_bind = δ★ × R_capsid."""
    b = capsid_binding_sites(15.0)
    assert b["r_binding_nm"] == pytest.approx(DELTA_STAR * 15.0, rel=1e-10)


def test_capsid_groove_larger_than_binding():
    """Groove site is further out than primary binding site."""
    b = capsid_binding_sites(15.0)
    assert b["r_groove_nm"] > b["r_binding_nm"]


def test_capsid_binding_sites_count():
    """12 icosahedral vertices → 12 binding sites."""
    b = capsid_binding_sites(15.0)
    assert b["n_binding_sites"] == 12


def test_phononic_dispersion_zero_at_zero():
    """ω(k=0) = 0 (acoustic mode)."""
    omega = phononic_dispersion(np.array([0.0]), 343.0)
    assert omega[0] == pytest.approx(0.0, abs=1e-10)


def test_phononic_dispersion_positive():
    """ω(k) > 0 for k > 0."""
    k = np.array([1.0, 10.0, 100.0])
    omega = phononic_dispersion(k)
    assert np.all(omega > 0)


def test_phononic_dispersion_monotone():
    """Dispersion is monotonically increasing in |k|."""
    k = np.linspace(0.1, 100.0, 50)
    omega = phononic_dispersion(k)
    assert np.all(np.diff(omega) > 0)


def test_sound_velocity_ratio():
    """v_g/c = Δ/δ★ ≪ 1 (slow-sound factor)."""
    ratio = sound_velocity_ratio()
    assert ratio == pytest.approx(Delta / DELTA_STAR, rel=1e-10)
    assert 0.01 < ratio < 0.05


def test_metamaterial_summary_keys():
    s = metamaterial_summary()
    for key in ["photonic_gap_centre", "photonic_gap_width", "fill_fraction",
                "effective_n", "z2_invariant", "delta_star", "Delta"]:
        assert key in s


def test_metamaterial_summary_delta_star():
    s = metamaterial_summary()
    assert s["delta_star"] == pytest.approx(DELTA_STAR, rel=1e-12)
