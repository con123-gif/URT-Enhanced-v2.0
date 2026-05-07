"""Tests for urt.holography — Cathedral AdS/CFT and black hole thermodynamics."""

import pytest
import numpy as np
from math import pi, isfinite
from urt.holography import (
    newton_constant,
    ads_radius,
    central_charge,
    bekenstein_bound,
    rt_area_k4_a5,
    ryu_takayanagi,
    s_rt_k4_a5,
    entanglement_entropy_k4,
    holographic_bound_satisfied,
    bekenstein_hawking,
    hawking_temperature,
    page_time,
    schwarzschild_radius,
    cathedral_bh_from_mass,
    holographic_entanglement_spectrum,
    c_function,
    scrambling_time,
    DELTA_STAR,
    G_N,
    R_ADS,
)


def test_newton_constant():
    """G_N = δ★²."""
    assert abs(newton_constant() - DELTA_STAR ** 2) < 1e-14


def test_ads_radius():
    """R_AdS = 1/δ★."""
    assert abs(ads_radius() - 1.0 / DELTA_STAR) < 1e-12


def test_central_charge_positive():
    """c = 3R/(2G_N) must be positive."""
    c = central_charge()
    assert c > 0
    assert isfinite(c)


def test_central_charge_formula():
    """c = 3/(2δ★³)."""
    expected = 3 * (1 / DELTA_STAR) / (2 * DELTA_STAR ** 2)
    assert abs(central_charge() - expected) / expected < 1e-10


def test_bekenstein_bound_positive():
    for E in [0.1, 1.0, 10.0, 100.0]:
        b = bekenstein_bound(E)
        assert b > 0
        assert isfinite(b)


def test_bekenstein_bound_scaling():
    """Bound scales linearly with energy."""
    b1 = bekenstein_bound(1.0)
    b2 = bekenstein_bound(2.0)
    assert abs(b2 / b1 - 2.0) < 1e-10


def test_rt_area_positive():
    """Ryu-Takayanagi area must be positive."""
    assert rt_area_k4_a5() > 0


def test_ryu_takayanagi_formula():
    """S_RT = n_edges / (4δ★)."""
    n = 18
    expected = n / (4 * DELTA_STAR)
    assert abs(s_rt_k4_a5() - expected) < 1e-10


def test_entanglement_entropy_vacuum():
    """Uniform state p_K4=4/13: S_EE = -(4/13)log(4/13) - (9/13)log(9/13)."""
    from math import log
    uniform = np.ones(13) / 13 ** 0.5
    S = entanglement_entropy_k4(uniform)
    p = 4 / 13
    expected = -(p * log(p) + (1 - p) * log(1 - p))
    assert abs(S - expected) < 1e-10


def test_holographic_bound_satisfied_random():
    """S_EE ≤ S_RT for any normalised state."""
    rng = np.random.default_rng(0)
    for _ in range(20):
        state = rng.normal(size=13)
        assert holographic_bound_satisfied(state)


def test_bekenstein_hawking_scaling():
    """S_BH = A/(4G_N) — proportional to area."""
    A1, A2 = 1.0, 4.0
    S1 = bekenstein_hawking(A1)
    S2 = bekenstein_hawking(A2)
    assert abs(S2 / S1 - A2 / A1) < 1e-10


def test_bekenstein_hawking_formula():
    """S_BH = A / (4δ★²)."""
    A = 10.0
    expected = A / (4 * DELTA_STAR ** 2)
    assert abs(bekenstein_hawking(A) - expected) < 1e-10


def test_hawking_temperature_decreases_with_mass():
    """Heavier black holes are colder."""
    T1 = hawking_temperature(1.0)
    T10 = hawking_temperature(10.0)
    assert T1 > T10


def test_hawking_temperature_formula():
    """T_H = 1/(8π·M·G_N)."""
    M = 5.0
    expected = 1 / (8 * pi * M * G_N)
    assert abs(hawking_temperature(M) - expected) < 1e-10


def test_schwarzschild_radius():
    """r_s = 2G_N·M."""
    M = 3.0
    assert abs(schwarzschild_radius(M) - 2 * G_N * M) < 1e-12


def test_page_time_positive():
    """Page time must be positive and finite."""
    for M in [1.0, 5.0, 10.0]:
        t = page_time(M)
        assert t > 0
        assert isfinite(t)


def test_page_time_increases_with_mass():
    """Heavier black holes take longer to evaporate."""
    assert page_time(10.0) > page_time(1.0)


def test_bh_dict_keys():
    bh = cathedral_bh_from_mass(5.0)
    for key in ["mass_planck", "r_schwarzschild", "area_planck", "S_BH",
                "T_hawking", "page_time_planck"]:
        assert key in bh


def test_entanglement_spectrum():
    spec = holographic_entanglement_spectrum()
    assert spec["p_K4"] == pytest.approx(4 / 13)
    assert spec["p_A5"] == pytest.approx(9 / 13)
    assert spec["bound_sat"] is True


def test_c_function_uv_value():
    """C(μ_UV) = c_UV."""
    mu_UV = 1.0
    assert abs(c_function(mu_UV, scale_UV=mu_UV) - central_charge()) < 1e-10


def test_c_function_decreasing():
    """c-function must decrease from UV to IR."""
    c_UV = c_function(1.0)
    c_IR = c_function(0.1)
    assert c_UV > c_IR


def test_scrambling_time_positive():
    assert scrambling_time(10.0) > 0
    assert isfinite(scrambling_time(10.0))
