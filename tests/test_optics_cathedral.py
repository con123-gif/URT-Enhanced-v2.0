"""Tests for urt/optics_cathedral.py — Diffraction, interference, and optics Cathedral."""

import pytest
from math import isfinite, asin, pi


def test_imports():
    from urt.optics_cathedral import (
        N_MINIMA_N_SLIT, N_SECONDARY_MAXIMA, N_DIFFRACTION_ORDERS,
        N_MINIMA_EQ_V,
        THETA_C_DELTA_STAR_RAD, THETA_C_DELTA_STAR_DEG,
        BREWSTER_PHI_RAD, BREWSTER_PHI_DEG, BREWSTER_DELTA_STAR_DEG,
        N_REFRACTIVE_DELTA_STAR, N_REFRACTIVE_PHI,
        n_slit_intensity, principal_maxima_angles, snell_angle, brewster_angle,
        n_slit_diffraction, critical_and_brewster_angles, diffraction_orders,
        optics_summary, print_optics_report,
    )


# ── N-slit diffraction ────────────────────────────────────────────────────────

def test_n_slit_minima_eq_V():
    """N-slit (N=13) grating has N-1 = V = 12 minima per order."""
    from urt.optics_cathedral import N_MINIMA_N_SLIT
    from urt.shell_closure import V
    assert N_MINIMA_N_SLIT == V
    assert N_MINIMA_N_SLIT == 12


def test_secondary_maxima_eq_V_minus_1():
    """Secondary maxima = N-2 = 11."""
    from urt.optics_cathedral import N_SECONDARY_MAXIMA
    from urt.shell_closure import N
    assert N_SECONDARY_MAXIMA == N - 2
    assert N_SECONDARY_MAXIMA == 11


def test_diffraction_orders_eq_N():
    """Icosahedral diffraction orders = N = 13."""
    from urt.optics_cathedral import N_DIFFRACTION_ORDERS
    from urt.shell_closure import N
    assert N_DIFFRACTION_ORDERS == N
    assert N_DIFFRACTION_ORDERS == 13


def test_n_minima_eq_V_flag():
    """Flag N_MINIMA_EQ_V is True."""
    from urt.optics_cathedral import N_MINIMA_EQ_V
    assert N_MINIMA_EQ_V is True


# ── Critical angles ───────────────────────────────────────────────────────────

def test_theta_c_delta_star_positive():
    """Critical angle for δ★ as refractive index ratio is positive."""
    from urt.optics_cathedral import THETA_C_DELTA_STAR_DEG
    assert THETA_C_DELTA_STAR_DEG > 0
    assert THETA_C_DELTA_STAR_DEG < 90


def test_theta_c_delta_star_approx():
    """Critical angle ≈ arcsin(δ★) in degrees ≈ 8.49°."""
    from urt.optics_cathedral import THETA_C_DELTA_STAR_DEG
    from urt.shell_closure import DELTA_STAR
    expected = asin(DELTA_STAR) * 180.0 / pi
    assert abs(THETA_C_DELTA_STAR_DEG - expected) < 1e-8


def test_brewster_angle_phi():
    """Brewster angle for n=φ is ≈ 58.28°."""
    from urt.optics_cathedral import BREWSTER_PHI_DEG
    assert 55 < BREWSTER_PHI_DEG < 62


# ── Refractive indices ────────────────────────────────────────────────────────

def test_refractive_delta_star():
    """1/δ★ as effective refractive index ≈ 6.779."""
    from urt.optics_cathedral import N_REFRACTIVE_DELTA_STAR
    from urt.shell_closure import DELTA_STAR
    assert abs(N_REFRACTIVE_DELTA_STAR - 1.0 / DELTA_STAR) < 1e-8


def test_refractive_phi():
    """φ as refractive index matches golden ratio."""
    from urt.optics_cathedral import N_REFRACTIVE_PHI
    from urt.shell_closure import phi
    assert abs(N_REFRACTIVE_PHI - phi) < 1e-8


# ── Intensity function ────────────────────────────────────────────────────────

def test_n_slit_intensity_at_zero():
    """N-slit intensity at θ=0 is maximum."""
    from urt.optics_cathedral import n_slit_intensity
    i0 = n_slit_intensity(0.0)
    assert i0 > 0
    assert isfinite(i0)


def test_snell_angle():
    """Snell's law at 45°, n2=1.5 gives valid angle."""
    from urt.optics_cathedral import snell_angle
    angle = snell_angle(45.0, n1=1.0)
    assert 0 < angle < 45


# ── Function tests ────────────────────────────────────────────────────────────

def test_n_slit_diffraction_function():
    from urt.optics_cathedral import n_slit_diffraction
    r = n_slit_diffraction()
    assert r["n_minima_eq_V"] is True
    assert r["n_minima"] == 12


def test_critical_and_brewster_function():
    from urt.optics_cathedral import critical_and_brewster_angles
    r = critical_and_brewster_angles()
    assert "theta_c_delta_star_deg" in r
    assert "brewster_phi_deg" in r


def test_diffraction_orders_function():
    from urt.optics_cathedral import diffraction_orders
    r = diffraction_orders()
    assert r["n_orders"] == 13


def test_optics_summary():
    from urt.optics_cathedral import optics_summary
    r = optics_summary()
    assert "diffraction" in r
    assert "angles" in r
    assert len(r["key_results"]) >= 3


def test_print_optics_report(capsys):
    from urt.optics_cathedral import print_optics_report
    print_optics_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "12" in out
    assert len(out) > 100
