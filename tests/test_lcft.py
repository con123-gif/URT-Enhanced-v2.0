"""Tests for urt.lcft — Lytollis Chaos Field Theory PDE."""
import numpy as np
import pytest
from urt.lcft import (
    K_BETA,
    DIFFUSION_D,
    lcft_evolve_1d,
    lcft_evolve_2d,
    fixed_point_relaxation_rate,
    cathedral_lcft_summary,
    lcft_audit_passes,
    DELTA_STAR,
)


def test_coefficients_positive():
    assert K_BETA > 0
    assert DIFFUSION_D > 0


def test_K_beta_closed_form():
    """K_β = 1/(8π²)."""
    import math
    assert K_BETA == pytest.approx(1 / (8 * math.pi ** 2))


def test_D_closed_form():
    """D = γ·π²/2."""
    import math
    gamma = 1 / 81
    assert DIFFUSION_D == pytest.approx(gamma * math.pi ** 2 / 2)


def test_constant_delta_star_field_preserved():
    """Constant χ = δ★ is the exact fixed point."""
    chi0 = np.full(32, DELTA_STAR)
    chi_final = lcft_evolve_1d(chi0, n_steps=100, dt=0.05)
    assert np.max(np.abs(chi_final - DELTA_STAR)) < 1e-12


def test_1d_relaxation_to_delta_star():
    rng = np.random.default_rng(0)
    chi0 = rng.uniform(0, 0.5, 128)
    chi_final = lcft_evolve_1d(chi0, n_steps=20000, dt=0.05)
    assert abs(chi_final.mean() - DELTA_STAR) / DELTA_STAR < 0.01


def test_relaxation_rate_monotonic_in_k():
    """K_β + D·k² is monotonically increasing in k²."""
    rates = [fixed_point_relaxation_rate(k) for k in (0.0, 1.0, 3.0, 5.0, 13.0)]
    for i in range(len(rates) - 1):
        assert rates[i] < rates[i + 1]


def test_summary_contains_expected_keys():
    s = cathedral_lcft_summary()
    assert "delta_star" in s
    assert "K_beta" in s
    assert "diffusion_D" in s


def test_audit_passes():
    assert lcft_audit_passes()
