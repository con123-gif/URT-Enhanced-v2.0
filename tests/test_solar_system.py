"""Tests for urt/solar_system.py — Planetary resonances and Titius-Bode."""

import pytest
from math import isfinite


# ── Imports ──────────────────────────────────────────────────────────────────

def test_module_imports():
    from urt.solar_system import (
        AU_METERS, T_EARTH_K, T_VENUS_K,
        T_MERCURY, T_VENUS, T_EARTH, T_MARS, T_JUPITER,
        T_SATURN, T_URANUS, T_NEPTUNE, T_PLUTO,
        A_MERCURY, A_VENUS, A_EARTH, A_MARS,
        A_JUPITER, A_SATURN, A_URANUS, A_NEPTUNE,
        VENUS_EARTH_PERIOD_RATIO, PHI_INVERSE,
        VENUS_EARTH_PHI_DEVIATION, VENUS_13_EARTH,
        VENUS_RESONANCE_DEVIATION,
        NEPTUNE_PLUTO_RATIO, NEPTUNE_PLUTO_OBSERVED,
        LAGRANGE_ANGLE_DEG, LAGRANGE_EQUALS_G,
        LAPLACE_RATIO_OUTER, LAPLACE_RATIO_MIDDLE,
        JUPITER_SATURN_OBSERVED, JUPITER_SATURN_RATIO,
        orbital_resonances, titius_bode,
        venus_earth_phi, lagrange_geometry,
        solar_summary, print_solar_report,
    )


# ── Orbital period constants ──────────────────────────────────────────────────

def test_earth_period_unity():
    """T_Earth = 1.0 by definition."""
    from urt.solar_system import T_EARTH
    assert T_EARTH == 1.0


def test_period_ordering():
    """Periods increase from Mercury to Neptune."""
    from urt.solar_system import T_MERCURY, T_VENUS, T_EARTH, T_MARS, T_JUPITER, T_SATURN
    assert T_MERCURY < T_VENUS < T_EARTH < T_MARS < T_JUPITER < T_SATURN


def test_venus_earth_ratio_value():
    """T_Venus / T_Earth ≈ 0.6152 (measured)."""
    from urt.solar_system import VENUS_EARTH_PERIOD_RATIO
    assert abs(VENUS_EARTH_PERIOD_RATIO - 0.6152) < 1e-6


# ── Venus / Earth / φ connection ─────────────────────────────────────────────

def test_phi_inverse_value():
    """1/φ ≈ 0.6180."""
    from urt.solar_system import PHI_INVERSE
    from urt.shell_closure import phi
    assert abs(PHI_INVERSE - 1.0 / phi) < 1e-10


def test_venus_phi_deviation_lt_1pct():
    """Venus/Earth period ratio deviates from 1/φ by < 1%."""
    from urt.solar_system import VENUS_EARTH_PHI_DEVIATION
    assert VENUS_EARTH_PHI_DEVIATION < 0.01   # < 1%


def test_venus_phi_deviation_approx_0pt46pct():
    """Deviation ≈ 0.46%."""
    from urt.solar_system import VENUS_EARTH_PHI_DEVIATION
    assert 0.003 < VENUS_EARTH_PHI_DEVIATION < 0.007


def test_13_venus_approx_8_earth():
    """13 Venus orbits ≈ 8 Earth years (Δ < 0.1%)."""
    from urt.solar_system import VENUS_13_EARTH, VENUS_RESONANCE_DEVIATION
    assert abs(VENUS_13_EARTH - 8.0) < 0.01
    assert VENUS_RESONANCE_DEVIATION < 0.001


def test_venus_earth_phi_function():
    from urt.solar_system import venus_earth_phi
    r = venus_earth_phi()
    assert "deviation_pct" in r
    assert "N_13_connection" in r
    assert "fibonacci_pair" in r
    assert r["13_Venus_years"] > 7.9 and r["13_Venus_years"] < 8.1


# ── Lagrange geometry ─────────────────────────────────────────────────────────

def test_lagrange_angle_exact():
    """Lagrange L4/L5 angle = 60° exactly."""
    from urt.solar_system import LAGRANGE_ANGLE_DEG
    assert LAGRANGE_ANGLE_DEG == 60.0


def test_lagrange_equals_G():
    """60° = G = |A₅| = 60."""
    from urt.solar_system import LAGRANGE_EQUALS_G
    from urt.shell_closure import G
    assert LAGRANGE_EQUALS_G is True
    assert G == 60


def test_lagrange_geometry_function():
    from urt.solar_system import lagrange_geometry
    r = lagrange_geometry()
    assert r["lagrange_angle_deg"] == 60.0
    assert r["G_icosahedral"] == 60
    assert r["angle_equals_G"] is True
    assert "SPECULATIVE" in r["derivation"]


# ── Neptune:Pluto resonance ───────────────────────────────────────────────────

def test_neptune_pluto_ratio():
    """3:2 = D:(D-1)."""
    from urt.solar_system import NEPTUNE_PLUTO_RATIO
    assert NEPTUNE_PLUTO_RATIO == 1.5


def test_neptune_pluto_observed_close_to_3_2():
    """Observed Neptune:Pluto period ratio ≈ 1.5."""
    from urt.solar_system import NEPTUNE_PLUTO_OBSERVED
    assert abs(NEPTUNE_PLUTO_OBSERVED - 1.5) < 0.05


# ── Laplace resonance labels ──────────────────────────────────────────────────

def test_laplace_outer_ratio():
    """Laplace outer:inner = 4 = D+1."""
    from urt.solar_system import LAPLACE_RATIO_OUTER
    from urt.shell_closure import D
    assert LAPLACE_RATIO_OUTER == D + 1


def test_laplace_middle_ratio():
    """Laplace middle:inner = 2 = D-1."""
    from urt.solar_system import LAPLACE_RATIO_MIDDLE
    from urt.shell_closure import D
    assert LAPLACE_RATIO_MIDDLE == D - 1


# ── Orbital resonances function ───────────────────────────────────────────────

def test_orbital_resonances_function():
    from urt.solar_system import orbital_resonances
    r = orbital_resonances()
    assert "venus_earth_13_8" in r
    assert "neptune_pluto_3_2" in r
    assert "laplace_4_2_1" in r
    assert "jupiter_saturn_5_2" in r


def test_orbital_resonances_deviations_finite():
    from urt.solar_system import orbital_resonances
    r = orbital_resonances()
    for name, data in r.items():
        if "deviation_pct" in data:
            assert isfinite(data["deviation_pct"])
            assert data["deviation_pct"] >= 0


def test_orbital_resonances_all_approximate():
    """All resonances should be labelled as not exact (astronomical)."""
    from urt.solar_system import orbital_resonances
    r = orbital_resonances()
    for name, data in r.items():
        assert data["exact"] is False


# ── Titius-Bode ───────────────────────────────────────────────────────────────

def test_titius_bode_predictions_count():
    from urt.solar_system import titius_bode
    r = titius_bode()
    assert len(r["predictions"]) == 9   # Mercury through Neptune


def test_titius_bode_earth_prediction():
    """Titius-Bode Earth: 0.4 + 0.3×2^1 = 1.0 AU exactly."""
    from urt.solar_system import titius_bode
    r = titius_bode()
    earth = next(p for p in r["predictions"] if p["planet"] == "Earth")
    assert abs(earth["predicted_AU"] - 1.0) < 0.01
    assert abs(earth["deviation_pct"]) < 1.0


def test_titius_bode_note_speculative():
    from urt.solar_system import titius_bode
    r = titius_bode()
    assert "SPECULATIVE" in r["note"]


# ── Solar summary function ────────────────────────────────────────────────────

def test_solar_summary_structure():
    from urt.solar_system import solar_summary
    r = solar_summary()
    assert "resonances" in r
    assert "venus_earth_phi" in r
    assert "lagrange" in r
    assert "titius_bode" in r
    assert "accuracy_table" in r
    assert "cathedral_integers" in r


def test_solar_summary_cathedral_integers():
    from urt.solar_system import solar_summary
    from urt.shell_closure import N, D, G
    r = solar_summary()
    assert r["cathedral_integers"]["N"] == N
    assert r["cathedral_integers"]["D"] == D
    assert r["cathedral_integers"]["G"] == G


# ── Print report ─────────────────────────────────────────────────────────────

def test_print_solar_report(capsys):
    from urt.solar_system import print_solar_report
    print_solar_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "CATHEDRAL SOLAR SYSTEM" in out
    assert "Venus" in out or "venus" in out.lower()
