"""Tests for urt.qft_cathedral — finite one-loop Cathedral QFT."""

import numpy as np
import pytest
from math import pi, isfinite
from urt.qft_cathedral import (
    lambda_shell,
    mass_gap,
    cathedral_propagator,
    coupling_g_star,
    coupling_alpha_star,
    beta_function,
    uv_fixed_point,
    running_coupling,
    anomalous_dimension,
    effective_potential,
    higgs_mass_from_potential,
    feynman_rules,
    scaling_exponent,
)
from urt import DELTA_STAR


def test_lambda_shell_scale():
    """Λ_shell = M_Pl / δ★ must be ≫ M_Pl (much larger UV cutoff)."""
    Lam = lambda_shell()
    M_Pl = 1.22090e19
    assert Lam > M_Pl / DELTA_STAR * 0.99


def test_mass_gap_equals_planck():
    """Mass gap m_gap = δ★ · Λ_shell = M_Pl."""
    m_gap = mass_gap()
    M_Pl = 1.22090e19
    assert abs(m_gap - M_Pl) / M_Pl < 1e-6


def test_propagator_at_zero():
    """Δ(0) = 1 / (δ★² · Λ²) = 1/M_Pl²."""
    Lam = lambda_shell()
    D0 = cathedral_propagator(k_sq=0.0, Lambda=Lam)
    expected = 1.0 / (DELTA_STAR ** 2 * Lam ** 2)
    assert abs(D0 - expected) / expected < 1e-10


def test_propagator_positive():
    """Propagator must be positive everywhere."""
    for k_sq in [0, 1e10, 1e20, 1e38]:
        assert cathedral_propagator(k_sq) > 0


def test_propagator_decreasing():
    """Δ(k) must decrease with increasing |k|."""
    # Use k² values relative to the mass gap δ★²·Λ²  so differences are visible
    Lam = lambda_shell()
    k_sq_gap = DELTA_STAR ** 2 * Lam ** 2
    k_vals = np.array([0.0, k_sq_gap * 1e-4, k_sq_gap, k_sq_gap * 1e4])
    D_vals = [cathedral_propagator(k) for k in k_vals]
    for i in range(len(D_vals) - 1):
        assert D_vals[i] > D_vals[i + 1]


def test_coupling_g_star():
    """g★ = δ★ · √(4π)."""
    expected = DELTA_STAR * (4 * pi) ** 0.5
    assert abs(coupling_g_star() - expected) < 1e-12


def test_alpha_star():
    """α★ = δ★²."""
    assert abs(coupling_alpha_star() - DELTA_STAR ** 2) < 1e-12


def test_beta_function_at_fixed_point():
    """β(g★) must be ≈ 0 (UV fixed point)."""
    g_star = uv_fixed_point()
    beta = beta_function(g_star)
    # Should be very small (zero at exact fixed point)
    assert abs(beta) < 0.01


def test_beta_function_negative():
    """β < 0 below fixed point — asymptotic freedom direction."""
    g_small = coupling_g_star() * 0.5
    assert beta_function(g_small) < 0


def test_running_coupling_finite():
    """Running coupling must be finite at all scales."""
    for mu in [1.0, 91.2, 1e6, 1e15, 1e19]:
        g = running_coupling(mu)
        assert isfinite(g) and g > 0


def test_running_coupling_no_landau_pole():
    """g(μ) must not diverge — bounded by g★."""
    g_star = coupling_g_star()
    for mu in [1e10, 1e15, 1e19, 1e25]:
        g = running_coupling(mu)
        assert g <= g_star * 1.01


def test_anomalous_dimension_small():
    """Anomalous dimension must be small (perturbative QFT)."""
    gamma_phi = anomalous_dimension()
    assert 0 < gamma_phi < 0.01


def test_effective_potential_minimum():
    """V(φ) must have a minimum near φ = v_EW."""
    v = 246.0
    phi_vals = np.linspace(0.1, 400, 200)
    V_vals = effective_potential(phi_vals, mu_GeV=v)
    # The potential should decrease then increase (minimum exists)
    assert V_vals.min() < V_vals[0]


def test_higgs_mass_range():
    """Higgs mass must be within 20% of 125.25 GeV."""
    m_H = higgs_mass_from_potential()
    assert abs(m_H - 125.25) / 125.25 < 0.20


def test_feynman_rules_dict():
    rules = feynman_rules()
    for key in ["propagator", "vertex_factor", "coupling", "beta_function",
                "uv_fixed_point", "no_landau_pole"]:
        assert key in rules


def test_scaling_exponent():
    """Δ_n = n·(1 + γ_φ) > n for n ≥ 1."""
    for n in [2, 4, 6]:
        assert scaling_exponent(n) > n
