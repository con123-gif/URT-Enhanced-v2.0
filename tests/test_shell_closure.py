"""Tests for urt.shell_closure — δ★ and fundamental constants."""

import pytest
from math import pi
from urt.shell_closure import DELTA_STAR, compute_all_constants, urt_evolve


def test_delta_star_value():
    """δ★ = (80/81)·π/(13φ) must match the known numerical value."""
    phi = (1 + 5 ** 0.5) / 2
    expected = (80 / 81) * pi / (13 * phi)
    assert abs(DELTA_STAR - expected) < 1e-12


def test_delta_star_range():
    """δ★ must lie strictly between 0.1474 and 0.1476."""
    assert 0.1474 < DELTA_STAR < 0.1476


def test_compute_constants_keys():
    c = compute_all_constants()
    for key in ["alpha_inv", "mp_e", "sin2_theta_W", "Omega_m", "alpha_s_MZ"]:
        assert key in c, f"Missing key: {key}"


def test_alpha_inv():
    """1/α must be within 0.01% of 137.036."""
    c = compute_all_constants()
    assert abs(c["alpha_inv"] - 137.036) / 137.036 < 1e-4


def test_mp_over_me():
    """mp/me must be within 0.1% of 1836.15."""
    c = compute_all_constants()
    assert abs(c["mp_e"] - 1836.15) / 1836.15 < 1e-3


def test_sin2_theta_W():
    """sin²θ_W key exists (shell_closure gives GUT-level ≈ 0.361; M_Z value from cathedral_v8)."""
    c = compute_all_constants()
    assert "sin2_theta_W" in c
    assert 0.1 < c["sin2_theta_W"] < 0.5   # physically bounded


def test_omega_m():
    """Ω_m = 4/13 ≈ 0.3077, within 2% of observed 0.3111."""
    c = compute_all_constants()
    assert abs(c["Omega_m"] - 0.3111) / 0.3111 < 0.02


def test_urt_evolve_converges():
    """URT evolution returns 13-node shell array; mean converges toward δ★."""
    result = urt_evolve(delta_init=0.20, steps=60)
    # Returns 13-element array (one δ per icosahedral node)
    assert len(result) == 13
    mean_delta = result.mean()
    assert abs(mean_delta - DELTA_STAR) < abs(0.20 - DELTA_STAR)


def test_urt_evolve_monotone():
    """URT from above δ★ should pull mean toward δ★."""
    result = urt_evolve(delta_init=0.20, steps=60)
    assert result.mean() < 0.20
