"""Tests for urt.gravitational_waves — IKT detection and black hole ringdown."""

import pytest
import numpy as np
from math import pi
from urt.gravitational_waves import (
    qnm_frequency,
    ringdown_damping_time,
    isco_frequency,
    cathedral_ringdown_shift,
    chirp_mass,
    peak_strain,
    gw_memory_effect,
    ikt_matrix_simple,
    cathedral_snr,
    detection_threshold,
    is_gw_detected,
    gw_power_spectrum,
    gw_event_summary,
    DELTA_STAR,
    D,
    N,
    G_SI,
    C_SI,
    M_SUN_KG,
)


def test_qnm_frequency_positive():
    """QNM frequency is positive for any BH mass."""
    for M in [10, 30, 100, 1e6]:
        assert qnm_frequency(M) > 0


def test_qnm_frequency_scales_with_mass():
    """f_QNM ∝ 1/M."""
    f30 = qnm_frequency(30.0)
    f60 = qnm_frequency(60.0)
    assert f30 / f60 == pytest.approx(2.0, rel=1e-8)


def test_qnm_stellar_mass_in_ligo_band():
    """30 M☉ BH ringdown is in LIGO band (10–2000 Hz)."""
    f = qnm_frequency(30.0)
    assert 10 < f < 2000


def test_ringdown_damping_time_positive():
    assert ringdown_damping_time(30.0) > 0


def test_ringdown_damping_time_milliseconds():
    """Damping time for stellar-mass BH is few ms."""
    tau_ms = ringdown_damping_time(65.0) * 1e3
    assert 1.0 < tau_ms < 50.0


def test_isco_frequency_positive():
    for M in [10, 30, 65, 100]:
        assert isco_frequency(M) > 0


def test_qnm_higher_than_isco():
    """QNM ringdown frequency > ISCO orbital frequency for stellar-mass BHs."""
    M = 65.0
    assert qnm_frequency(M) > isco_frequency(M)


def test_cathedral_ringdown_shift():
    """f_rd = f_ISCO × (1−δ★) < f_ISCO."""
    M = 65.0
    f_rd = cathedral_ringdown_shift(M)
    f_isco = isco_frequency(M)
    assert f_rd < f_isco
    assert f_rd == pytest.approx(f_isco * (1 - DELTA_STAR), rel=1e-10)


def test_chirp_mass_symmetric():
    """Chirp mass is symmetric in m1, m2."""
    assert chirp_mass(30, 29) == pytest.approx(chirp_mass(29, 30), rel=1e-10)


def test_chirp_mass_equal_masses():
    """For equal masses: M_c = m/(2^(1/5))."""
    m = 30.0
    expected = m / 2 ** 0.2
    assert chirp_mass(m, m) == pytest.approx(expected, rel=1e-8)


def test_peak_strain_positive():
    assert peak_strain(36, 29, 410) > 0


def test_peak_strain_gw150914():
    """GW150914-like event: h₀ ~ 1e-21."""
    h = peak_strain(36, 29, 410)
    assert 1e-22 < h < 1e-20


def test_peak_strain_farther_weaker():
    """Strain decreases with distance."""
    h1 = peak_strain(36, 29, 100)
    h2 = peak_strain(36, 29, 1000)
    assert h1 > h2


def test_gw_memory_positive():
    assert gw_memory_effect(3.0, 410) > 0


def test_gw_memory_delta_star_scaling():
    """Memory is proportional to δ★ (Cathedral correction)."""
    mem = gw_memory_effect(3.0, 410)
    E_J = 3.0 * M_SUN_KG * C_SI ** 2
    r_m = 410 * 1e6 * 3.086e16
    expected = (G_SI * E_J / (r_m * C_SI ** 4)) * DELTA_STAR
    assert mem == pytest.approx(expected, rel=1e-8)


def test_ikt_matrix_shape():
    """IKT matrix is 13×13."""
    Psi = ikt_matrix_simple()
    assert Psi.shape == (N, N)


def test_ikt_matrix_k4_rows():
    """First 4 rows use K₄ phases."""
    Psi = ikt_matrix_simple()
    for k in range(4):
        for n in range(N):
            expected = np.exp(1j * pi * k * n / 2)
            assert abs(Psi[k, n] - expected) < 1e-10


def test_cathedral_snr_wrong_size():
    """Raises ValueError for non-13-sample window."""
    with pytest.raises(ValueError):
        cathedral_snr(np.ones(10))


def test_cathedral_snr_returns_float():
    """cathedral_snr returns a finite non-negative float."""
    rng = np.random.default_rng(42)
    signal = rng.standard_normal(N)
    snr = cathedral_snr(signal)
    assert isinstance(snr, float)
    assert np.isfinite(snr)
    assert snr >= 0.0


def test_cathedral_snr_nonnegative():
    rng = np.random.default_rng(99)
    strain = rng.standard_normal(N)
    assert cathedral_snr(strain) >= 0.0


def test_detection_threshold_value():
    """Threshold = 1/δ★ ≈ 6.78."""
    thresh = detection_threshold()
    assert thresh == pytest.approx(1.0 / DELTA_STAR, rel=1e-10)
    assert 6.0 < thresh < 8.0


def test_is_gw_detected_returns_bool():
    """is_gw_detected returns a bool."""
    rng = np.random.default_rng(7)
    signal = rng.standard_normal(N)
    result = is_gw_detected(signal)
    assert isinstance(result, bool)


def test_gw_power_spectrum_shape():
    f = np.linspace(10, 2000, 100)
    psd = gw_power_spectrum(f, 28.3)
    assert psd.shape == (100,)


def test_gw_power_spectrum_zero_at_nonpositive():
    """PSD = 0 for f ≤ 0."""
    f = np.array([-10.0, 0.0, 10.0])
    psd = gw_power_spectrum(f, 30.0)
    assert psd[0] == 0.0
    assert psd[1] == 0.0
    assert psd[2] > 0.0


def test_gw_power_spectrum_decreasing_at_low_f():
    """Power-law decay: PSD decreases as frequency increases (for f < f_ISCO)."""
    f = np.array([10.0, 20.0, 40.0])
    psd = gw_power_spectrum(f, 30.0)
    assert psd[0] > psd[1] > psd[2]


def test_gw_event_summary_keys():
    s = gw_event_summary(36, 29, 410)
    for key in ["chirp_mass_solar", "f_ISCO_Hz", "f_QNM_Hz",
                "tau_damping_ms", "h_peak", "h_memory", "delta_star_shift"]:
        assert key in s


def test_gw_event_summary_delta_star():
    """δ★ shift matches constant."""
    s = gw_event_summary(36, 29, 410)
    assert s["delta_star_shift"] == pytest.approx(DELTA_STAR, rel=1e-12)


def test_gw_event_summary_masses():
    s = gw_event_summary(36, 29, 410)
    assert s["m1_solar"] == 36
    assert s["m2_solar"] == 29
    assert s["total_mass_solar"] == 65


def test_gw_event_summary_snr_threshold():
    """SNR threshold in summary = 1/δ★."""
    s = gw_event_summary(36, 29, 410)
    assert s["snr_threshold"] == pytest.approx(1.0 / DELTA_STAR, rel=1e-10)
