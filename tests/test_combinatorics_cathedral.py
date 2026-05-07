"""Tests for urt/combinatorics_cathedral.py — Platonic solids, Bell, Ramsey."""

import pytest


def test_imports():
    from urt.combinatorics_cathedral import (
        N_PLATONIC_SOLIDS_D3, N_POLYTOPES_D4, N_POLYTOPES_D5,
        ORDER_A5, ORDER_IH, ROTATION_ORDERS,
        TETRAHEDRON_ROTATIONS_EQ_V,
        BELL_D, CATALAN_D, P_D, P_N,
        R_33, R_34, STIRLING_N_D, STIRLING_N_Q,
        platonic_polytopes, partition_numbers, bell_catalan,
        ramsey_numbers, stirling_numbers, combinatorics_summary,
        print_combinatorics_report,
    )


# ── Platonic solids ───────────────────────────────────────────────────────────

def test_platonic_D3_eq_q():
    """5 Platonic solids in D=3 = q."""
    from urt.combinatorics_cathedral import N_PLATONIC_SOLIDS_D3
    from urt.shell_closure import q
    assert N_PLATONIC_SOLIDS_D3 == q
    assert N_PLATONIC_SOLIDS_D3 == 5


def test_polytopes_D4_eq_V2():
    """6 regular polytopes in D=4 = V/2."""
    from urt.combinatorics_cathedral import N_POLYTOPES_D4
    from urt.shell_closure import V
    assert N_POLYTOPES_D4 == V // 2
    assert N_POLYTOPES_D4 == 6


def test_polytopes_D5_eq_D():
    """3 regular polytopes in D≥5 = D."""
    from urt.combinatorics_cathedral import N_POLYTOPES_D5
    from urt.shell_closure import D
    assert N_POLYTOPES_D5 == D
    assert N_POLYTOPES_D5 == 3


def test_tetrahedron_rotations_eq_V():
    """Tetrahedron rotational symmetry = V = 12."""
    from urt.combinatorics_cathedral import ROTATION_ORDERS, TETRAHEDRON_ROTATIONS_EQ_V
    from urt.shell_closure import V
    assert ROTATION_ORDERS["tetrahedron"] == V
    assert TETRAHEDRON_ROTATIONS_EQ_V is True


def test_cube_octahedron_rotations():
    """Cube/octahedron rotations = 2V = 24."""
    from urt.combinatorics_cathedral import ROTATION_ORDERS
    from urt.shell_closure import V
    assert ROTATION_ORDERS["cube_octahedron"] == 2 * V
    assert ROTATION_ORDERS["cube_octahedron"] == 24


def test_icosahedron_rotations_eq_G():
    """Icosahedron rotations = G = 60."""
    from urt.combinatorics_cathedral import ROTATION_ORDERS
    from urt.shell_closure import G
    assert ROTATION_ORDERS["dodecahedron_icosahedron"] == G
    assert ROTATION_ORDERS["dodecahedron_icosahedron"] == 60


def test_order_a5():
    """|A₅| = G = 60."""
    from urt.combinatorics_cathedral import ORDER_A5
    from urt.shell_closure import G
    assert ORDER_A5 == G


def test_order_ih():
    """Full icosahedral |Ih| = 2G = 120."""
    from urt.combinatorics_cathedral import ORDER_IH
    from urt.shell_closure import G
    assert ORDER_IH == 2 * G


# ── Bell and Catalan ──────────────────────────────────────────────────────────

def test_bell_D_eq_q():
    """B_D = B_3 = 5 = q (Bell number!)."""
    from urt.combinatorics_cathedral import BELL_D
    from urt.shell_closure import q
    assert BELL_D == q
    assert BELL_D == 5


def test_catalan_D_eq_q():
    """C_D = C_3 = 5 = q (Catalan number!)."""
    from urt.combinatorics_cathedral import CATALAN_D
    from urt.shell_closure import q
    assert CATALAN_D == q
    assert CATALAN_D == 5


def test_bell_eq_catalan_at_D():
    """B_D = C_D = q: both equal q at D=3."""
    from urt.combinatorics_cathedral import BELL_D, CATALAN_D
    assert BELL_D == CATALAN_D


# ── Partition numbers ─────────────────────────────────────────────────────────

def test_partition_D_eq_D():
    """p(D) = p(3) = 3 = D (self-referential!)."""
    from urt.combinatorics_cathedral import P_D
    from urt.shell_closure import D
    assert P_D == D
    assert P_D == 3


def test_partition_N_is_101():
    """p(N) = p(13) = 101."""
    from urt.combinatorics_cathedral import P_N
    assert P_N == 101


def test_partition_q_is_7():
    """p(q) = p(5) = 7."""
    from urt.combinatorics_cathedral import P_Q
    assert P_Q == 7


# ── Ramsey numbers ────────────────────────────────────────────────────────────

def test_ramsey_33_eq_V2():
    """R(3,3) = 6 = V/2."""
    from urt.combinatorics_cathedral import R_33
    from urt.shell_closure import V
    assert R_33 == V // 2
    assert R_33 == 6


def test_ramsey_34_eq_H3():
    """R(3,4) = 9 = N - D - 1 = H₃ dimension."""
    from urt.combinatorics_cathedral import R_34
    from urt.shell_closure import N, D
    assert R_34 == N - D - 1
    assert R_34 == 9


# ── Stirling numbers ──────────────────────────────────────────────────────────

def test_stirling_N_D_positive():
    from urt.combinatorics_cathedral import STIRLING_N_D
    assert STIRLING_N_D > 0


def test_stirling_N_Q_positive():
    from urt.combinatorics_cathedral import STIRLING_N_Q
    assert STIRLING_N_Q > 0


# ── Function tests ────────────────────────────────────────────────────────────

def test_platonic_polytopes_function():
    from urt.combinatorics_cathedral import platonic_polytopes
    r = platonic_polytopes()
    assert r["platonic_D3_eq_q"] is True
    assert r["polytopes_D4_eq_V2"] is True
    assert r["polytopes_D5_eq_D"] is True
    assert r["tetrahedron_eq_V"] is True


def test_partition_numbers_function():
    from urt.combinatorics_cathedral import partition_numbers
    r = partition_numbers()
    assert r["p_D_eq_D"] is True
    assert r["p_N_is_101"] is True


def test_bell_catalan_function():
    from urt.combinatorics_cathedral import bell_catalan
    r = bell_catalan()
    assert r["bell_D_eq_q"] is True
    assert r["catalan_D_eq_q"] is True


def test_ramsey_numbers_function():
    from urt.combinatorics_cathedral import ramsey_numbers
    r = ramsey_numbers()
    assert r["R_33_eq_V2"] is True
    assert r["R_34_eq_H3"] is True


def test_combinatorics_summary():
    from urt.combinatorics_cathedral import combinatorics_summary
    r = combinatorics_summary()
    assert "platonic" in r
    assert "bell_catalan" in r
    assert "ramsey" in r
    assert len(r["key_results"]) >= 5


def test_print_combinatorics_report(capsys):
    from urt.combinatorics_cathedral import print_combinatorics_report
    print_combinatorics_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "Bell" in out
    assert len(out) > 200
