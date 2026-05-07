"""Tests for urt/eeg_cathedral.py — EEG brainwave bands and neural oscillations."""

import pytest
from math import isfinite


# ── Imports ──────────────────────────────────────────────────────────────────

def test_module_imports():
    from urt.eeg_cathedral import (
        DELTA_BAND, THETA_BAND, ALPHA_BAND, BETA_BAND, GAMMA_BAND,
        ALPHA_BETA_BOUNDARY_HZ,
        GAMMA_40_HZ, GAMMA_40_Q_CHECK,
        AVALANCHE_EXPONENT,
        F_NOISE_EXPONENT,
        K_C_KURAMOTO, SYNC_ORDER_RESTING,
        SCHUMANN_FUNDAMENTAL_HZ, SCHUMANN_MODES_EMPIRICAL,
        SCHUMANN_PHI_PRODUCT, SCHUMANN_PHI_DEVIATION,
        DELTA_CENTER, THETA_CENTER, ALPHA_CENTER,
        RATIO_ALPHA_THETA, PHI_DEVIATION_AT,
        RATIO_ALPHA_THETA_LO,
        eeg_bands, frequency_ratios,
        neural_avalanche, schumann_resonance,
        kuramoto_eeg, eeg_summary, print_eeg_report,
    )


# ── EEG band constants ────────────────────────────────────────────────────────

def test_alpha_upper_boundary_equals_N():
    """Upper α boundary = N = 13 Hz (clinical definition)."""
    from urt.eeg_cathedral import ALPHA_BAND, ALPHA_BETA_BOUNDARY_HZ
    from urt.shell_closure import N
    assert ALPHA_BAND[1] == N
    assert ALPHA_BETA_BOUNDARY_HZ == float(N)
    assert ALPHA_BETA_BOUNDARY_HZ == 13.0


def test_beta_lower_boundary_equals_N():
    """Lower β boundary = N = 13 Hz (same as α upper)."""
    from urt.eeg_cathedral import BETA_BAND
    from urt.shell_closure import N
    assert BETA_BAND[0] == float(N)
    assert BETA_BAND[0] == 13.0


def test_alpha_beta_boundary_continuous():
    """α upper = β lower (no gap in frequency coverage)."""
    from urt.eeg_cathedral import ALPHA_BAND, BETA_BAND
    assert ALPHA_BAND[1] == BETA_BAND[0]


def test_band_ordering():
    """Bands are ordered (no overlaps at lower boundaries)."""
    from urt.eeg_cathedral import DELTA_BAND, THETA_BAND, ALPHA_BAND, BETA_BAND, GAMMA_BAND
    assert DELTA_BAND[1] == THETA_BAND[0]
    assert THETA_BAND[1] == ALPHA_BAND[0]
    assert ALPHA_BAND[1] == BETA_BAND[0]
    assert BETA_BAND[1] == GAMMA_BAND[0]


def test_band_positive_frequencies():
    """All band boundaries are positive."""
    from urt.eeg_cathedral import DELTA_BAND, THETA_BAND, ALPHA_BAND, BETA_BAND, GAMMA_BAND
    for band in [DELTA_BAND, THETA_BAND, ALPHA_BAND, BETA_BAND, GAMMA_BAND]:
        assert band[0] > 0
        assert band[1] > band[0]


# ── 40 Hz gamma ───────────────────────────────────────────────────────────────

def test_gamma_40_equals_8q():
    """40 Hz = 8 × q = 8 × 5 = 40 (exact)."""
    from urt.eeg_cathedral import GAMMA_40_HZ, GAMMA_40_Q_CHECK
    from urt.shell_closure import q
    assert GAMMA_40_HZ == 8 * q
    assert GAMMA_40_HZ == 40
    assert GAMMA_40_Q_CHECK is True


def test_gamma_40_in_gamma_band():
    """40 Hz lies within the γ-band (30–100 Hz)."""
    from urt.eeg_cathedral import GAMMA_40_HZ, GAMMA_BAND
    assert GAMMA_BAND[0] <= GAMMA_40_HZ <= GAMMA_BAND[1]


# ── Neural avalanche exponent ─────────────────────────────────────────────────

def test_avalanche_exponent_equals_minus_D_over_2():
    """Avalanche exponent = −D/2 = −3/2."""
    from urt.eeg_cathedral import AVALANCHE_EXPONENT
    from urt.shell_closure import D
    assert abs(AVALANCHE_EXPONENT - (-D / 2.0)) < 1e-12
    assert abs(AVALANCHE_EXPONENT - (-1.5)) < 1e-12


def test_avalanche_exponent_negative():
    """Avalanche exponent is negative (power-law decay)."""
    from urt.eeg_cathedral import AVALANCHE_EXPONENT
    assert AVALANCHE_EXPONENT < 0


def test_neural_avalanche_function():
    from urt.eeg_cathedral import neural_avalanche
    from urt.shell_closure import D
    r = neural_avalanche()
    assert r["avalanche_exponent"] == -D / 2.0
    assert r["agreement"] is True
    assert "EXACT" in r["status"]


# ── 1/f noise ─────────────────────────────────────────────────────────────────

def test_f_noise_exponent_unity():
    """1/f noise exponent = 1 at criticality."""
    from urt.eeg_cathedral import F_NOISE_EXPONENT
    assert F_NOISE_EXPONENT == 1.0


# ── Kuramoto K_c ──────────────────────────────────────────────────────────────

def test_K_c_positive():
    """Kuramoto K_c > 0."""
    from urt.eeg_cathedral import K_C_KURAMOTO
    assert K_C_KURAMOTO > 0
    assert isfinite(K_C_KURAMOTO)


def test_K_c_reasonable_range():
    """K_c ≈ 1.2773 (within 0.1–5 range)."""
    from urt.eeg_cathedral import K_C_KURAMOTO
    assert 0.1 < K_C_KURAMOTO < 5.0


def test_sync_order_resting_is_delta_star_sq():
    """r_rest = δ★² (speculative estimate)."""
    from urt.eeg_cathedral import SYNC_ORDER_RESTING
    from urt.shell_closure import DELTA_STAR
    assert abs(SYNC_ORDER_RESTING - DELTA_STAR**2) < 1e-10


# ── Schumann resonance ────────────────────────────────────────────────────────

def test_schumann_fundamental_positive():
    from urt.eeg_cathedral import SCHUMANN_FUNDAMENTAL_HZ
    assert SCHUMANN_FUNDAMENTAL_HZ > 0


def test_schumann_phi_product():
    """φ × 7.83 ≈ 12.67 (close to N=13, speculative)."""
    from urt.eeg_cathedral import SCHUMANN_PHI_PRODUCT, SCHUMANN_PHI_DEVIATION
    from urt.shell_closure import N
    assert 12.0 < SCHUMANN_PHI_PRODUCT < 13.5
    # Deviation should be less than 10%
    assert SCHUMANN_PHI_DEVIATION < 0.10


def test_schumann_resonance_function():
    from urt.eeg_cathedral import schumann_resonance
    r = schumann_resonance()
    assert "SPECULATIVE" in r["status"]
    assert r["schumann_fundamental_hz"] == 7.83


# ── Frequency ratios ──────────────────────────────────────────────────────────

def test_alpha_lo_over_theta_lo_equals_D_minus_1():
    """α_lo / θ_lo = 8/4 = 2 = D−1 (exact at boundaries)."""
    from urt.eeg_cathedral import RATIO_ALPHA_THETA_LO
    from urt.shell_closure import D
    assert abs(RATIO_ALPHA_THETA_LO - (D - 1)) < 1e-10
    assert abs(RATIO_ALPHA_THETA_LO - 2.0) < 1e-10


def test_alpha_theta_center_ratio():
    """α/θ centre ratio ≈ 1.75 (approximate φ connection)."""
    from urt.eeg_cathedral import RATIO_ALPHA_THETA
    assert abs(RATIO_ALPHA_THETA - 1.75) < 0.01


def test_phi_deviation_at_reasonable():
    """α/θ centre ratio deviates from φ by < 15%."""
    from urt.eeg_cathedral import PHI_DEVIATION_AT
    assert PHI_DEVIATION_AT < 0.15


def test_frequency_ratios_function():
    from urt.eeg_cathedral import frequency_ratios
    r = frequency_ratios()
    assert "alpha_over_theta_center" in r
    assert "phi_value" in r
    assert "boundary_ratios" in r
    assert "APPROXIMATE" in r["status_alpha_theta"]


# ── eeg_bands function ────────────────────────────────────────────────────────

def test_eeg_bands_function():
    from urt.eeg_cathedral import eeg_bands
    r = eeg_bands()
    assert "delta" in r
    assert "theta" in r
    assert "alpha" in r
    assert "beta" in r
    assert "gamma" in r
    # Alpha upper = N
    assert r["alpha"]["upper_equals_N"] is True
    # Beta lower = N
    assert r["beta"]["lower_equals_N"] is True
    # 40 Hz gamma
    assert r["gamma"]["gamma_40"] == 40


# ── Summary / report ──────────────────────────────────────────────────────────

def test_eeg_summary_structure():
    from urt.eeg_cathedral import eeg_summary
    r = eeg_summary()
    assert "bands" in r
    assert "ratios" in r
    assert "avalanche" in r
    assert "schumann" in r
    assert "kuramoto" in r
    assert "key_results" in r


def test_print_eeg_report(capsys):
    from urt.eeg_cathedral import print_eeg_report
    print_eeg_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "CATHEDRAL EEG" in out
    assert "13" in out
