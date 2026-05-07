"""Tests for urt.consciousness — Kuramoto synchronisation on icosahedral graph."""

import numpy as np
import pytest
from math import isfinite
from urt.consciousness import (
    graph_spectrum,
    spectral_gap,
    critical_coupling,
    kuramoto_evolve,
    sync_order_parameter,
    iit_phi_approx,
    peak_phi,
    eeg_frequencies,
    consciousness_phase_diagram,
    DELTA_STAR,
    N,
)


def test_spectral_gap_is_three():
    """λ₂ of the icosahedral Laplacian must be exactly 3 = D."""
    assert spectral_gap() == pytest.approx(3.0, abs=1e-10)


def test_laplacian_has_zero():
    """Laplacian has one zero eigenvalue (connected graph)."""
    vals, _ = graph_spectrum()
    assert abs(vals[0]) < 1e-10


def test_laplacian_all_nonnegative():
    vals, _ = graph_spectrum()
    assert np.all(vals >= -1e-10)


def test_critical_coupling_positive():
    K_c = critical_coupling()
    assert K_c > 0
    assert isfinite(K_c)


def test_critical_coupling_formula():
    """K_c = 2·δ★·N/λ₂."""
    lam2 = spectral_gap()
    expected = 2 * DELTA_STAR * N / lam2
    assert abs(critical_coupling() - expected) < 1e-10


def test_sync_order_coherent():
    """Perfectly synchronized state has r=1."""
    theta = np.zeros(N)  # all phases = 0 → fully coherent
    assert sync_order_parameter(theta) == pytest.approx(1.0, abs=1e-10)


def test_sync_order_random_low():
    """Random phases → low order parameter."""
    rng = np.random.default_rng(123)
    r_vals = []
    for _ in range(10):
        theta = rng.uniform(0, 2 * np.pi, N)
        r_vals.append(sync_order_parameter(theta))
    assert np.mean(r_vals) < 0.5


def test_iit_phi_peak_at_half():
    """Φ peaks at r=0.5."""
    phi_half = iit_phi_approx(0.5)
    for r in [0.1, 0.3, 0.7, 0.9]:
        assert phi_half >= iit_phi_approx(r)


def test_iit_phi_zero_at_extremes():
    """Φ=0 at r=0 and r=1."""
    assert iit_phi_approx(0.0) == pytest.approx(0.0, abs=1e-10)
    assert iit_phi_approx(1.0) == pytest.approx(0.0, abs=1e-10)


def test_peak_phi():
    """Φ_max = N/4."""
    assert peak_phi() == pytest.approx(N / 4, abs=1e-10)


def test_kuramoto_below_critical_incoherent():
    """Below K_c, oscillators stay incoherent (r < 0.5)."""
    K_c = critical_coupling()
    _, r_trace = kuramoto_evolve(K=K_c * 0.1, n_steps=3000)
    r_steady = r_trace[-500:].mean()
    assert r_steady < 0.5


def test_kuramoto_above_critical_coherent():
    """Well above K_c, oscillators synchronize (r > 0.5)."""
    K_c = critical_coupling()
    _, r_trace = kuramoto_evolve(K=K_c * 10.0, n_steps=3000)
    r_steady = r_trace[-500:].mean()
    assert r_steady > 0.5


def test_eeg_delta_star_is_1hz():
    """f_delta = δ★ × 1/δ★ = 1 Hz exactly."""
    freqs = eeg_frequencies()
    assert abs(freqs["f_delta_star_Hz"] - 1.0) < 1e-10


def test_eeg_phi_in_delta_band():
    """f_φ = φ Hz ≈ 1.618 Hz — in δ-band [0.5, 4] Hz."""
    freqs = eeg_frequencies()
    lo, hi = freqs["delta_band"]
    assert lo < freqs["f_phi_Hz"] < hi


def test_eeg_k4_in_delta_band():
    """K₄ frequency (4/13)/δ★ Hz is in δ-band."""
    freqs = eeg_frequencies()
    lo, hi = freqs["delta_band"]
    assert lo < freqs["f_K4_Hz"] < hi


def test_phase_diagram_keys():
    phase = consciousness_phase_diagram()
    for key in ["K_critical", "delta_star", "phi_max",
                "regime_unconscious", "regime_conscious", "regime_seizure"]:
        assert key in phase


def test_phase_diagram_delta_star():
    phase = consciousness_phase_diagram()
    assert abs(phase["delta_star"] - DELTA_STAR) < 1e-12
