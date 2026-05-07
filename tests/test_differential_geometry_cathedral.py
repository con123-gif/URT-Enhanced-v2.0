"""Tests for urt/differential_geometry_cathedral.py — Curvature, manifolds, Cathedral integers."""

import pytest
from math import isfinite, factorial, pi


def test_imports():
    from urt.differential_geometry_cathedral import (
        EULER_CHAR_S2, EULER_CHAR_EQ_D1, N_RIEMANN_INDEP, N_RIEMANN_EQ_V2,
        N_RICCI_INDEP, N_RICCI_EQ_V2, N_METRIC_INDEP, N_METRIC_EQ_V2,
        N_CHRISTOFFEL, SPHERE_DIM, LEVI_CIVITA_NONZERO, LEVI_EQ_V2,
        KISSING_NUMBER_D3, KISSING_EQ_V, HOLONOMY_PER_VERTEX_DEG,
        TOTAL_ANGULAR_DEFICIT_RAD, TOTAL_DEFICIT_EQ_4PI,
        HOLONOMY_GROUP_ORDER, HOLONOMY_EQ_G,
        DIM_SO3, DIM_SO3_EQ_D, N_CONNECTION_FORMS, WEYL_ZERO_D3,
        GAUSS_BONNET_S2, GB_EQ_2PI_CHI,
        riemann_geometry, icosahedral_geometry, lie_theory,
        diff_geom_summary, print_diff_geom_report,
    )


# ── Euler characteristic ──────────────────────────────────────────────────────

def test_euler_char_icosahedron():
    """Icosahedron V-E+F = 12-30+20 = 2 = D-1."""
    from urt.differential_geometry_cathedral import EULER_CHAR_S2, EULER_CHAR_EQ_D1
    from urt.shell_closure import V, E, F, D
    assert EULER_CHAR_S2 == V - E + F
    assert EULER_CHAR_S2 == 2
    assert EULER_CHAR_S2 == D - 1
    assert EULER_CHAR_EQ_D1 is True


# ── Riemann tensor ────────────────────────────────────────────────────────────

def test_riemann_indep_eq_V2():
    """Riemann tensor D²(D²-1)/12 = 6 = V//2 in D=3."""
    from urt.differential_geometry_cathedral import N_RIEMANN_INDEP, N_RIEMANN_EQ_V2
    from urt.shell_closure import D, V
    assert N_RIEMANN_INDEP == D**2 * (D**2 - 1) // 12
    assert N_RIEMANN_INDEP == 6
    assert N_RIEMANN_INDEP == V // 2
    assert N_RIEMANN_EQ_V2 is True


def test_ricci_indep_eq_V2():
    """Ricci tensor D(D+1)/2 = 6 = V//2 independent components."""
    from urt.differential_geometry_cathedral import N_RICCI_INDEP, N_RICCI_EQ_V2
    from urt.shell_closure import D, V
    assert N_RICCI_INDEP == D * (D + 1) // 2
    assert N_RICCI_INDEP == 6
    assert N_RICCI_EQ_V2 is True


def test_metric_indep_eq_V2():
    """Metric tensor D(D+1)/2 = 6 = V//2 independent components."""
    from urt.differential_geometry_cathedral import N_METRIC_INDEP, N_METRIC_EQ_V2
    from urt.shell_closure import D, V
    assert N_METRIC_INDEP == D * (D + 1) // 2
    assert N_METRIC_INDEP == V // 2
    assert N_METRIC_EQ_V2 is True


def test_christoffel_count():
    """Christoffel symbols: D²(D+1)/2 = 18 in D=3."""
    from urt.differential_geometry_cathedral import N_CHRISTOFFEL, N_CHRISTOFFEL_EQ_18
    from urt.shell_closure import D
    assert N_CHRISTOFFEL == D * D * (D + 1) // 2
    assert N_CHRISTOFFEL == 18
    assert N_CHRISTOFFEL_EQ_18 is True


def test_weyl_zero_in_D3():
    """Weyl tensor vanishes in D=3."""
    from urt.differential_geometry_cathedral import N_WEYL_INDEP_D3, WEYL_ZERO_D3
    assert N_WEYL_INDEP_D3 == 0
    assert WEYL_ZERO_D3 is True


# ── Sphere and Levi-Civita ────────────────────────────────────────────────────

def test_sphere_dim_eq_D1():
    """Sphere S^{D-1} = S² has dimension D-1=2."""
    from urt.differential_geometry_cathedral import SPHERE_DIM, SPHERE_EQ_D1
    from urt.shell_closure import D
    assert SPHERE_DIM == D - 1
    assert SPHERE_DIM == 2
    assert SPHERE_EQ_D1 is True


def test_levi_civita_eq_factorial_D():
    """Levi-Civita nonzero entries = D! = 6 = V//2."""
    from urt.differential_geometry_cathedral import LEVI_CIVITA_NONZERO, LEVI_EQ_V2
    from urt.shell_closure import D, V
    assert LEVI_CIVITA_NONZERO == factorial(D)
    assert LEVI_CIVITA_NONZERO == 6
    assert LEVI_CIVITA_NONZERO == V // 2
    assert LEVI_EQ_V2 is True


# ── Kissing number ────────────────────────────────────────────────────────────

def test_kissing_number_eq_V():
    """Kissing number in D=3 = V = 12 (Kepler-Hales)."""
    from urt.differential_geometry_cathedral import KISSING_NUMBER_D3, KISSING_EQ_V
    from urt.shell_closure import V
    assert KISSING_NUMBER_D3 == V
    assert KISSING_NUMBER_D3 == 12
    assert KISSING_EQ_V is True


# ── Angular deficit ───────────────────────────────────────────────────────────

def test_total_angular_deficit_eq_4pi():
    """Total icosahedral angular deficit = 4π."""
    from urt.differential_geometry_cathedral import TOTAL_ANGULAR_DEFICIT_RAD, TOTAL_DEFICIT_EQ_4PI
    assert abs(TOTAL_ANGULAR_DEFICIT_RAD - 4 * pi) < 1e-9
    assert TOTAL_DEFICIT_EQ_4PI is True


def test_holonomy_per_vertex():
    """Icosahedral holonomy per vertex = 2π/q = 72°."""
    from urt.differential_geometry_cathedral import HOLONOMY_PER_VERTEX_DEG
    from urt.shell_closure import q
    assert abs(HOLONOMY_PER_VERTEX_DEG - 360.0 / q) < 1e-10
    assert abs(HOLONOMY_PER_VERTEX_DEG - 72.0) < 1e-10


def test_holonomy_group_order_eq_G():
    """Holonomy group A₅ has order G = 60."""
    from urt.differential_geometry_cathedral import HOLONOMY_GROUP_ORDER, HOLONOMY_EQ_G
    from urt.shell_closure import G
    assert HOLONOMY_GROUP_ORDER == G
    assert HOLONOMY_GROUP_ORDER == 60
    assert HOLONOMY_EQ_G is True


# ── Gauss-Bonnet ──────────────────────────────────────────────────────────────

def test_gauss_bonnet():
    """Gauss-Bonnet: ∫K dA = 4π for S²."""
    from urt.differential_geometry_cathedral import GAUSS_BONNET_S2, GB_EQ_2PI_CHI
    assert abs(GAUSS_BONNET_S2 - 4 * pi) < 1e-10
    assert GB_EQ_2PI_CHI is True


# ── Lie theory ────────────────────────────────────────────────────────────────

def test_dim_so3_eq_D():
    """dim(SO(3)) = D(D-1)/2 = D = 3 (self-referential!)."""
    from urt.differential_geometry_cathedral import DIM_SO3, DIM_SO3_EQ_D
    from urt.shell_closure import D
    assert DIM_SO3 == D * (D - 1) // 2
    assert DIM_SO3 == D
    assert DIM_SO3 == 3
    assert DIM_SO3_EQ_D is True


def test_connection_forms_eq_D():
    """Connection forms = D(D-1)/2 = D = 3."""
    from urt.differential_geometry_cathedral import N_CONNECTION_FORMS, N_CONNECTION_EQ_D
    from urt.shell_closure import D
    assert N_CONNECTION_FORMS == D
    assert N_CONNECTION_EQ_D is True


# ── Function tests ────────────────────────────────────────────────────────────

def test_riemann_geometry_function():
    from urt.differential_geometry_cathedral import riemann_geometry
    r = riemann_geometry()
    assert r["euler_char"] == 2
    assert r["euler_eq_D1"] is True
    assert r["n_riemann"] == 6
    assert r["riemann_eq_V2"] is True
    assert r["weyl_zero_D3"] is True


def test_icosahedral_geometry_function():
    from urt.differential_geometry_cathedral import icosahedral_geometry
    r = icosahedral_geometry()
    assert r["kissing_number"] == 12
    assert r["kissing_eq_V"] is True
    assert r["total_deficit_eq_4pi"] is True
    assert r["holonomy_eq_G"] is True
    assert r["gb_eq_2pi_chi"] is True


def test_lie_theory_function():
    from urt.differential_geometry_cathedral import lie_theory
    r = lie_theory()
    assert r["dim_so3"] == 3
    assert r["dim_so3_eq_D"] is True
    assert r["connection_eq_D"] is True
    assert r["levi_eq_V2"] is True


def test_diff_geom_summary():
    from urt.differential_geometry_cathedral import diff_geom_summary
    r = diff_geom_summary()
    assert "riemannian" in r
    assert "icosahedral" in r
    assert "lie" in r
    assert len(r["KEY_EXACT_RESULTS"]) >= 5


def test_print_diff_geom_report(capsys):
    from urt.differential_geometry_cathedral import print_diff_geom_report
    print_diff_geom_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "EXACT" in out
    assert "12" in out
