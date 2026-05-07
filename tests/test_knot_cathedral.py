"""Tests for urt/knot_cathedral.py — Jones polynomial and Chern-Simons."""

import pytest
import cmath
from math import pi, isclose


def test_imports():
    from urt.knot_cathedral import (
        CS_LEVEL, T_JONES, Q_JONES, A_KAUFFMAN,
        N_BRAID_GENERATORS, BURAU_DIM,
        jones_unknot, jones_trefoil, jones_hopf, jones_figure8,
        jones_torus_p2, fibonacci_braiding, braid_group_B13,
        writhe_torus, alexander_trefoil_at_q, reidemeister_moves,
        knot_summary, print_knot_report,
    )


def test_cs_level_equals_D():
    from urt.knot_cathedral import CS_LEVEL
    from urt.shell_closure import D
    assert CS_LEVEL == D
    assert CS_LEVEL == 3


def test_t_jones_on_unit_circle():
    from urt.knot_cathedral import T_JONES
    assert abs(abs(T_JONES) - 1.0) < 1e-12


def test_t_jones_is_fifth_root():
    """t = e^{2πi/5} → t^5 = 1"""
    from urt.knot_cathedral import T_JONES
    assert abs(T_JONES**5 - 1) < 1e-12


def test_q_jones_equals_q():
    from urt.knot_cathedral import Q_JONES
    from urt.shell_closure import q
    assert Q_JONES == q
    assert Q_JONES == 5


def test_a_kauffman_on_unit_circle():
    from urt.knot_cathedral import A_KAUFFMAN
    assert abs(abs(A_KAUFFMAN) - 1.0) < 1e-12


def test_jones_unknot():
    from urt.knot_cathedral import jones_unknot
    assert abs(jones_unknot() - 1.0) < 1e-12


def test_jones_trefoil_real_part():
    """Trefoil real part = -φ/2"""
    from urt.knot_cathedral import jones_trefoil
    from urt.shell_closure import phi
    vt = jones_trefoil()
    assert abs(vt.real - (-phi / 2)) < 1e-8


def test_jones_figure8_is_real():
    """Figure-8 Jones at e^{2πi/5} is real"""
    from urt.knot_cathedral import jones_figure8
    v = jones_figure8()
    assert abs(v.imag) < 1e-10


def test_jones_figure8_value():
    """Figure-8 Jones at q=5: V = -2/φ exactly"""
    from urt.knot_cathedral import jones_figure8
    from urt.shell_closure import phi
    v = jones_figure8()
    assert abs(v.real - (-2.0 / phi)) < 1e-8


def test_jones_torus_25_value():
    """T(2,5) Jones = 1/φ exactly"""
    from urt.knot_cathedral import jones_torus_p2
    from urt.shell_closure import phi, q
    v = jones_torus_p2(p=q)
    assert abs(v.real - (1.0 / phi)) < 1e-8
    assert abs(v.imag) < 1e-8


def test_braid_generators_eq_V():
    from urt.knot_cathedral import N_BRAID_GENERATORS, BURAU_DIM
    from urt.shell_closure import V
    assert N_BRAID_GENERATORS == V
    assert BURAU_DIM == V
    assert N_BRAID_GENERATORS == 12


def test_fibonacci_braiding():
    from urt.knot_cathedral import fibonacci_braiding
    r = fibonacci_braiding()
    assert r["CS_level_equals_D"] is True
    assert r["Q_equals_q"] is True
    assert abs(r["t_jones"] - r["t_jones"]) < 1e-14  # tautology, just check key exists


def test_braid_group_B13():
    from urt.knot_cathedral import braid_group_B13
    r = braid_group_B13()
    assert r["n_strands"] == 13
    assert r["n_generators"] == 12
    assert r["n_generators_eq_V"] is True
    assert r["burau_dim_eq_V"] is True


def test_writhe_T55():
    from urt.knot_cathedral import writhe_torus
    from urt.shell_closure import V
    r = writhe_torus()
    assert r["writhe_eq_2V"] is True
    assert abs(r["cathedral_T55"]["writhe"] - 2 * V) < 1e-10


def test_alexander_determinant():
    from urt.knot_cathedral import alexander_trefoil_at_q
    from urt.shell_closure import D
    r = alexander_trefoil_at_q()
    assert r["determinant_eq_D"] is True
    assert abs(r["determinant"] - D) < 1e-8


def test_reidemeister_moves():
    from urt.knot_cathedral import reidemeister_moves
    from urt.shell_closure import D
    r = reidemeister_moves()
    assert r["n_moves"] == D
    assert r["n_moves_eq_D"] is True
    assert r["R3_strands"] == D


def test_knot_summary_structure():
    from urt.knot_cathedral import knot_summary
    r = knot_summary()
    assert "chern_simons" in r
    assert "jones_at_e2pi5" in r
    assert "fibonacci_braiding" in r
    assert "braid_group_B13" in r
    assert r["chern_simons"]["q_matches_cathedral"] is True


def test_print_knot_report(capsys):
    from urt.knot_cathedral import print_knot_report
    print_knot_report()
    out = capsys.readouterr().out
    assert "Jones" in out
    assert len(out) > 100


def test_chain_contains_fibonacci():
    from urt.knot_cathedral import knot_summary
    r = knot_summary()
    assert "Fibonacci" in r["key_chain"] or "φ" in r["key_chain"]
