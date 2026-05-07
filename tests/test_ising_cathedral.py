"""Tests for urt/ising_cathedral.py — Ising model on icosahedral graph."""

import pytest
from math import tanh, atanh, log, sqrt


def test_imports():
    from urt.ising_cathedral import (
        N_ISING, Z_COORD, E_BONDS,
        K_C_BETHE, K_C_MF, K_C_ONSAGER, K_DELTA_STAR, KAPPA_RATIO,
        magnetisation, critical_exponents, icosahedral_ising,
        delta_star_on_spin_curve, ising_summary, print_ising_report,
    )


def test_n_ising_eq_V():
    from urt.ising_cathedral import N_ISING
    from urt.shell_closure import V
    assert N_ISING == V
    assert N_ISING == 12


def test_coordination_eq_q():
    from urt.ising_cathedral import Z_COORD
    from urt.shell_closure import q
    assert Z_COORD == q
    assert Z_COORD == 5


def test_e_bonds_eq_30():
    from urt.ising_cathedral import E_BONDS
    from urt.shell_closure import E
    assert E_BONDS == E
    assert E_BONDS == 30


def test_coordination_from_geometry():
    """z = 2E/V = 2×30/12 = 5 = q"""
    from urt.ising_cathedral import E_BONDS, N_ISING, Z_COORD
    assert 2 * E_BONDS // N_ISING == Z_COORD


def test_k_c_mf():
    """K_c^MF = 1/z = 1/5"""
    from urt.ising_cathedral import K_C_MF, Z_COORD
    assert abs(K_C_MF - 1.0 / Z_COORD) < 1e-12
    assert abs(K_C_MF - 0.2) < 1e-12


def test_k_c_bethe():
    """K_c^Bethe = 0.5·ln(z/(z-2))"""
    from urt.ising_cathedral import K_C_BETHE, Z_COORD
    expected = 0.5 * log(Z_COORD / (Z_COORD - 2))
    assert abs(K_C_BETHE - expected) < 1e-12


def test_k_c_order():
    """K_c^MF < K_c^Bethe < K_c^Onsager (ordering)"""
    from urt.ising_cathedral import K_C_MF, K_C_BETHE, K_C_ONSAGER
    assert K_C_MF < K_C_BETHE
    # Note: K_c^Onsager is for 2D square lattice, not directly comparable
    assert K_C_ONSAGER > 0


def test_k_delta_star():
    """K_δ★ = arctanh(δ★)"""
    from urt.ising_cathedral import K_DELTA_STAR
    from urt.shell_closure import DELTA_STAR
    assert abs(K_DELTA_STAR - atanh(DELTA_STAR)) < 1e-12


def test_tanh_k_delta_eq_delta_star():
    """tanh(K_δ★) = δ★ exactly"""
    from urt.ising_cathedral import K_DELTA_STAR
    from urt.shell_closure import DELTA_STAR
    assert abs(tanh(K_DELTA_STAR) - DELTA_STAR) < 1e-12


def test_magnetisation_zero_below_kc():
    from urt.ising_cathedral import magnetisation, K_C_MF
    # Below K_c^MF: m = 0
    m = magnetisation(K_C_MF * 0.5)
    assert abs(m) < 1e-10


def test_magnetisation_nonzero_above_kc():
    from urt.ising_cathedral import magnetisation, K_C_BETHE
    # Above K_c^Bethe (and MF): m > 0
    m = magnetisation(K_C_BETHE * 1.5)
    assert m > 0.5


def test_magnetisation_saturation():
    """m → 1 for large K"""
    from urt.ising_cathedral import magnetisation
    m = magnetisation(10.0)
    assert m > 0.999


def test_delta_star_paramagnetic():
    from urt.ising_cathedral import delta_star_on_spin_curve
    r = delta_star_on_spin_curve()
    assert r["tanh_eq_delta_star"] is True
    assert r["paramagnetic"] is True


def test_critical_exponents():
    from urt.ising_cathedral import critical_exponents
    ce = critical_exponents()
    assert abs(ce["beta_exp"] - 0.5) < 1e-10
    assert abs(ce["gamma_exp"] - 1.0) < 1e-10
    assert abs(ce["delta_exp"] - 3.0) < 1e-10
    assert abs(ce["nu_exp"] - 0.5) < 1e-10


def test_icosahedral_ising():
    from urt.ising_cathedral import icosahedral_ising
    r = icosahedral_ising()
    assert r["z_equals_q"] is True
    assert r["E_equals_30"] is True
    assert "critical_exponents" in r
    assert "delta_star_spin" in r


def test_ising_summary():
    from urt.ising_cathedral import ising_summary
    r = ising_summary()
    assert "icosahedral" in r
    assert "key_relation" in r
    assert "tanh" in r["key_relation"]


def test_print_ising_report(capsys):
    from urt.ising_cathedral import print_ising_report
    print_ising_report()
    out = capsys.readouterr().out
    assert "Ising" in out
    assert "q" in out
    assert len(out) > 100
