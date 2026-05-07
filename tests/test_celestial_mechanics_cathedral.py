"""Tests for urt/celestial_mechanics_cathedral.py — Kepler, Lagrange, orbital elements."""

import pytest


def test_imports():
    from urt.celestial_mechanics_cathedral import (
        N_KEPLER_LAWS, KEPLER_THIRD_POWER,
        N_BODY_PROBLEM_DOF, LAGRANGE_POINTS, STABILITY_LAGRANGE,
        N_ORBITAL_ELEMENTS, N_CONSERVED_2BODY,
        HOHMANN_BURNS, N_TROJAN_GROUPS, N_PLANETARY_RESONANCES_APPROX,
        kepler_laws, orbital_mechanics, celestial_summary, print_celestial_report,
    )


def test_kepler_laws_eq_D():
    """Kepler's D=3 laws."""
    from urt.celestial_mechanics_cathedral import N_KEPLER_LAWS
    from urt.shell_closure import D
    assert N_KEPLER_LAWS == D
    assert N_KEPLER_LAWS == 3


def test_kepler_third_power_eq_D():
    """Kepler's 3rd law: r^D ∝ T² → power = D = 3."""
    from urt.celestial_mechanics_cathedral import KEPLER_THIRD_POWER
    from urt.shell_closure import D
    assert KEPLER_THIRD_POWER == D
    assert KEPLER_THIRD_POWER == 3


def test_lagrange_points_eq_q():
    """Five Lagrange points = q = 5."""
    from urt.celestial_mechanics_cathedral import LAGRANGE_POINTS
    from urt.shell_closure import q
    assert LAGRANGE_POINTS == q
    assert LAGRANGE_POINTS == 5


def test_orbital_elements_eq_V2():
    """Six orbital elements = V/2 = 6."""
    from urt.celestial_mechanics_cathedral import N_ORBITAL_ELEMENTS
    from urt.shell_closure import V
    assert N_ORBITAL_ELEMENTS == V // 2
    assert N_ORBITAL_ELEMENTS == 6


def test_dof_per_body_eq_V2():
    """DOF per body (D+D) = 2D = V//2 = 6."""
    from urt.celestial_mechanics_cathedral import N_BODY_PROBLEM_DOF
    from urt.shell_closure import D, V
    assert N_BODY_PROBLEM_DOF == 2 * D
    assert N_BODY_PROBLEM_DOF == V // 2


def test_hohmann_burns_eq_D1():
    """Hohmann transfer = D-1 = 2 engine burns."""
    from urt.celestial_mechanics_cathedral import HOHMANN_BURNS
    from urt.shell_closure import D
    assert HOHMANN_BURNS == D - 1
    assert HOHMANN_BURNS == 2


def test_kepler_laws_function():
    from urt.celestial_mechanics_cathedral import kepler_laws
    r = kepler_laws()
    assert r["n_laws_eq_D"] is True
    assert r["n_laws"] == 3


def test_orbital_mechanics_function():
    from urt.celestial_mechanics_cathedral import orbital_mechanics
    r = orbital_mechanics()
    assert r["lagrange_eq_q"] is True
    assert r["n_elements_eq_V2"] is True
    assert r["hohmann_eq_D1"] is True


def test_celestial_summary():
    from urt.celestial_mechanics_cathedral import celestial_summary
    r = celestial_summary()
    assert "kepler" in r
    assert "orbital" in r
    assert len(r["key_results"]) >= 4


def test_print_celestial_report(capsys):
    from urt.celestial_mechanics_cathedral import print_celestial_report
    print_celestial_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "3" in out
