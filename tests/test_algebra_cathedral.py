"""Tests for urt/algebra_cathedral.py — Groups, fields, Galois theory, Lie algebras."""

import pytest
from math import factorial


def test_imports():
    from urt.algebra_cathedral import (
        ORDER_A5, ORDER_IH, ORDER_SD, ORDER_SD1, ORDER_AD, ORDER_ZN,
        GF2_ORDER, GF4_ORDER, GF5_ORDER, GF13_ORDER, GF2D_ORDER, GF2Q_ORDER,
        DEGREE_Q_PHI, GALOIS_Z13_ORDER, GALOIS_Z5_ORDER,
        EULER_TOTIENT_V, EULER_TOTIENT_N,
        DIM_SU2, DIM_SUD, DIM_SOD, DIM_SOD1,
        group_theory_analysis, field_theory_analysis,
        galois_theory_analysis, lie_algebra_analysis,
        algebra_summary, print_algebra_report,
    )


# ── Group orders ──────────────────────────────────────────────────────────────

def test_A5_order_eq_G():
    """|A₅| = G = 60."""
    from urt.algebra_cathedral import ORDER_A5
    from urt.shell_closure import G
    assert ORDER_A5 == G
    assert ORDER_A5 == 60


def test_Ih_order_eq_2G():
    """|I_h| = 2G = 120."""
    from urt.algebra_cathedral import ORDER_IH
    from urt.shell_closure import G
    assert ORDER_IH == 2 * G
    assert ORDER_IH == 120


def test_SD_order_eq_V2():
    """|S_D| = D! = 6 = V/2."""
    from urt.algebra_cathedral import ORDER_SD
    from urt.shell_closure import D, V
    assert ORDER_SD == factorial(D)
    assert ORDER_SD == V // 2
    assert ORDER_SD == 6


def test_SD1_order():
    """|S_{D+1}| = (D+1)! = 24."""
    from urt.algebra_cathedral import ORDER_SD1
    from urt.shell_closure import D
    assert ORDER_SD1 == factorial(D + 1)
    assert ORDER_SD1 == 24


def test_AD_order_eq_D():
    """|A_D| = |A₃| = D!/2 = D = 3 (self-referential!)."""
    from urt.algebra_cathedral import ORDER_AD
    from urt.shell_closure import D
    assert ORDER_AD == factorial(D) // 2
    assert ORDER_AD == D
    assert ORDER_AD == 3


# ── Finite fields ─────────────────────────────────────────────────────────────

def test_GF2_eq_D1():
    """GF(2) order = D-1 = 2."""
    from urt.algebra_cathedral import GF2_ORDER
    from urt.shell_closure import D
    assert GF2_ORDER == D - 1
    assert GF2_ORDER == 2


def test_GF4_eq_D1():
    """GF(4) order = D+1 = 4."""
    from urt.algebra_cathedral import GF4_ORDER
    from urt.shell_closure import D
    assert GF4_ORDER == D + 1
    assert GF4_ORDER == 4


def test_GF5_eq_q():
    """GF(5) order = q = 5."""
    from urt.algebra_cathedral import GF5_ORDER
    from urt.shell_closure import q
    assert GF5_ORDER == q
    assert GF5_ORDER == 5


def test_GF13_eq_N():
    """GF(13) prime field order = N = 13."""
    from urt.algebra_cathedral import GF13_ORDER
    from urt.shell_closure import N
    assert GF13_ORDER == N
    assert GF13_ORDER == 13


def test_GF2D_eq_2D():
    """GF(2^D) = GF(8) has 2^D = 8 elements."""
    from urt.algebra_cathedral import GF2D_ORDER
    from urt.shell_closure import D
    assert GF2D_ORDER == 2**D
    assert GF2D_ORDER == 8


def test_GF2Q_eq_2q():
    """GF(2^q) = GF(32) has 2^q = 32 elements."""
    from urt.algebra_cathedral import GF2Q_ORDER
    from urt.shell_closure import q
    assert GF2Q_ORDER == 2**q
    assert GF2Q_ORDER == 32


# ── Galois theory ─────────────────────────────────────────────────────────────

def test_phi_degree_eq_D1():
    """[Q(φ):Q] = D-1 = 2 (golden ratio is quadratic)."""
    from urt.algebra_cathedral import DEGREE_Q_PHI
    from urt.shell_closure import D
    assert DEGREE_Q_PHI == D - 1
    assert DEGREE_Q_PHI == 2


def test_galois_Z13_eq_V():
    """|Gal(Q(ζ_13)/Q)| = φ(13) = N-1 = 12 = V."""
    from urt.algebra_cathedral import GALOIS_Z13_ORDER
    from urt.shell_closure import N, V
    assert GALOIS_Z13_ORDER == N - 1
    assert GALOIS_Z13_ORDER == V
    assert GALOIS_Z13_ORDER == 12


def test_galois_Z5_eq_D1():
    """|Gal(Q(ζ_5)/Q)| = φ(5) = q-1 = 4 = D+1."""
    from urt.algebra_cathedral import GALOIS_Z5_ORDER
    from urt.shell_closure import q, D
    assert GALOIS_Z5_ORDER == q - 1
    assert GALOIS_Z5_ORDER == D + 1
    assert GALOIS_Z5_ORDER == 4


def test_euler_totient_V_eq_D1():
    """φ(V) = φ(12) = 4 = D+1."""
    from urt.algebra_cathedral import EULER_TOTIENT_V
    from urt.shell_closure import D
    assert EULER_TOTIENT_V == D + 1
    assert EULER_TOTIENT_V == 4


def test_euler_totient_N_eq_V():
    """φ(N=13) = N-1 = 12 = V (N is prime)."""
    from urt.algebra_cathedral import EULER_TOTIENT_N
    from urt.shell_closure import N, V
    assert EULER_TOTIENT_N == N - 1
    assert EULER_TOTIENT_N == V


# ── Lie algebras ──────────────────────────────────────────────────────────────

def test_dim_su2_eq_D():
    """dim su(2) = D = 3."""
    from urt.algebra_cathedral import DIM_SU2
    from urt.shell_closure import D
    assert DIM_SU2 == D
    assert DIM_SU2 == 3


def test_dim_su3():
    """dim su(3) = D²-1 = 8."""
    from urt.algebra_cathedral import DIM_SUD
    from urt.shell_closure import D
    assert DIM_SUD == D**2 - 1
    assert DIM_SUD == 8


def test_dim_so3_eq_D():
    """dim so(D) = so(3) = D(D-1)/2 = 3 = D (self-referential!)."""
    from urt.algebra_cathedral import DIM_SOD
    from urt.shell_closure import D
    assert DIM_SOD == D * (D - 1) // 2
    assert DIM_SOD == D
    assert DIM_SOD == 3


def test_dim_so4_eq_V2():
    """dim so(D+1) = so(4) = (D+1)D/2 = 6 = V/2."""
    from urt.algebra_cathedral import DIM_SOD1
    from urt.shell_closure import D, V
    assert DIM_SOD1 == (D + 1) * D // 2
    assert DIM_SOD1 == V // 2
    assert DIM_SOD1 == 6


# ── Function tests ────────────────────────────────────────────────────────────

def test_group_theory_function():
    from urt.algebra_cathedral import group_theory_analysis
    r = group_theory_analysis()
    assert r["A5_eq_G"] is True
    assert r["SD_eq_V2"] is True
    assert r["AD_eq_D"] is True


def test_field_theory_function():
    from urt.algebra_cathedral import field_theory_analysis
    r = field_theory_analysis()
    assert r["GF5_eq_q"] is True
    assert r["GF13_eq_N"] is True
    assert r["GF2D_eq_2D"] is True


def test_galois_function():
    from urt.algebra_cathedral import galois_theory_analysis
    r = galois_theory_analysis()
    assert r["phi_degree_eq_D1"] is True
    assert r["galois_z13_eq_V"] is True
    assert r["euler_N_eq_V"] is True


def test_lie_algebra_function():
    from urt.algebra_cathedral import lie_algebra_analysis
    r = lie_algebra_analysis()
    assert r["dim_sod_eq_D"] is True
    assert r["dim_sod1_eq_V2"] is True


def test_algebra_summary():
    from urt.algebra_cathedral import algebra_summary
    r = algebra_summary()
    assert "groups" in r
    assert "fields" in r
    assert "galois" in r
    assert "lie" in r
    assert len(r["key_results"]) >= 8


def test_print_algebra_report(capsys):
    from urt.algebra_cathedral import print_algebra_report
    print_algebra_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "Cathedral" in out
    assert "self-referential" in out
    assert len(out) > 300
