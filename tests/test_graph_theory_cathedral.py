"""Tests for urt/graph_theory_cathedral.py — Graph invariants and Cathedral integers."""

import pytest


def test_imports():
    from urt.graph_theory_cathedral import (
        ICOS_VERTICES, ICOS_EDGES, ICOS_FACES, ICOS_EULER_CHI,
        ICOS_VERTEX_DEGREE, FOUR_COLOR_THEOREM_BOUND,
        K3_CHROMATIC, K4_CHROMATIC, K_LAST_PLANAR, K_FIRST_NONPLANAR,
        K_D_EDGES, K_D1_EDGES,
        N_PETERSEN_VERTICES, N_PETERSEN_EDGES, PETERSEN_GIRTH, PETERSEN_DIAMETER,
        R_33, R_34, ICOS_SPECTRAL_GAP,
        icosahedral_graph, graph_colorings, petersen_properties,
        ramsey_theory, spectral_theory, graph_theory_summary, print_graph_theory_report,
    )


# ── Icosahedral graph ─────────────────────────────────────────────────────────

def test_icos_vertices_eq_V():
    """Icosahedral graph has V = 12 vertices."""
    from urt.graph_theory_cathedral import ICOS_VERTICES
    from urt.shell_closure import V
    assert ICOS_VERTICES == V
    assert ICOS_VERTICES == 12


def test_icos_edges_eq_E():
    """Icosahedral graph has E = 30 edges."""
    from urt.graph_theory_cathedral import ICOS_EDGES
    from urt.shell_closure import E
    assert ICOS_EDGES == E
    assert ICOS_EDGES == 30


def test_icos_faces_eq_F():
    """Icosahedral graph has F = 20 faces."""
    from urt.graph_theory_cathedral import ICOS_FACES
    from urt.shell_closure import F
    assert ICOS_FACES == F
    assert ICOS_FACES == 20


def test_euler_chi_eq_D1():
    """Euler χ = V-E+F = 2 = D-1."""
    from urt.graph_theory_cathedral import ICOS_EULER_CHI
    from urt.shell_closure import D
    assert ICOS_EULER_CHI == D - 1
    assert ICOS_EULER_CHI == 2


def test_icos_vertex_degree_eq_q():
    """Every icosahedral vertex has degree 2E/V = 5 = q.  [EXACT]"""
    from urt.graph_theory_cathedral import ICOS_VERTEX_DEGREE
    from urt.shell_closure import q, V, E
    assert ICOS_VERTEX_DEGREE == 2 * E // V
    assert ICOS_VERTEX_DEGREE == q
    assert ICOS_VERTEX_DEGREE == 5


# ── Graph colorings ───────────────────────────────────────────────────────────

def test_four_color_theorem_eq_D1():
    """Four Color Theorem bound = D+1 = 4."""
    from urt.graph_theory_cathedral import FOUR_COLOR_THEOREM_BOUND
    from urt.shell_closure import D
    assert FOUR_COLOR_THEOREM_BOUND == D + 1
    assert FOUR_COLOR_THEOREM_BOUND == 4


def test_k3_chromatic_eq_D():
    """K_3 chromatic number = D = 3."""
    from urt.graph_theory_cathedral import K3_CHROMATIC
    from urt.shell_closure import D
    assert K3_CHROMATIC == D


def test_k_d_edges_eq_D():
    """K_D = K_3 has D(D-1)/2 = D = 3 edges (self-referential!)."""
    from urt.graph_theory_cathedral import K_D_EDGES
    from urt.shell_closure import D
    assert K_D_EDGES == D
    assert K_D_EDGES == 3


def test_k_d1_edges_eq_V2():
    """K_{D+1} = K_4 has (D+1)D/2 = V/2 = 6 edges (tetrahedron)."""
    from urt.graph_theory_cathedral import K_D1_EDGES
    from urt.shell_closure import V
    assert K_D1_EDGES == V // 2
    assert K_D1_EDGES == 6


# ── Petersen graph ────────────────────────────────────────────────────────────

def test_petersen_vertices_eq_2q():
    """Petersen graph has 2q = 10 vertices."""
    from urt.graph_theory_cathedral import N_PETERSEN_VERTICES
    from urt.shell_closure import q
    assert N_PETERSEN_VERTICES == 2 * q
    assert N_PETERSEN_VERTICES == 10


def test_petersen_edges_eq_V_D():
    """Petersen graph has V+D = 15 edges."""
    from urt.graph_theory_cathedral import N_PETERSEN_EDGES
    from urt.shell_closure import V, D
    assert N_PETERSEN_EDGES == V + D
    assert N_PETERSEN_EDGES == 15


def test_petersen_girth_eq_q():
    """Petersen graph girth = q = 5."""
    from urt.graph_theory_cathedral import PETERSEN_GIRTH
    from urt.shell_closure import q
    assert PETERSEN_GIRTH == q
    assert PETERSEN_GIRTH == 5


def test_petersen_diameter_eq_D1():
    """Petersen graph diameter = D-1 = 2."""
    from urt.graph_theory_cathedral import PETERSEN_DIAMETER
    from urt.shell_closure import D
    assert PETERSEN_DIAMETER == D - 1
    assert PETERSEN_DIAMETER == 2


# ── Ramsey numbers ────────────────────────────────────────────────────────────

def test_R33_eq_V2():
    """R(3,3) = V/2 = 6."""
    from urt.graph_theory_cathedral import R_33
    from urt.shell_closure import V
    assert R_33 == V // 2
    assert R_33 == 6


def test_R34_eq_H3():
    """R(3,4) = N-D-1 = 9 = H₃ dimension."""
    from urt.graph_theory_cathedral import R_34
    from urt.shell_closure import N, D
    assert R_34 == N - D - 1
    assert R_34 == 9


# ── Spectral theory ───────────────────────────────────────────────────────────

def test_spectral_gap_eq_q():
    """Icosahedral spectral gap λ₂ = q = 5."""
    from urt.graph_theory_cathedral import ICOS_SPECTRAL_GAP
    from urt.shell_closure import q
    assert ICOS_SPECTRAL_GAP == q
    assert ICOS_SPECTRAL_GAP == 5


# ── Function tests ────────────────────────────────────────────────────────────

def test_icosahedral_graph_function():
    from urt.graph_theory_cathedral import icosahedral_graph
    r = icosahedral_graph()
    assert r["vertex_degree_eq_q"] is True
    assert r["euler_chi_eq_D1"] is True


def test_graph_colorings_function():
    from urt.graph_theory_cathedral import graph_colorings
    r = graph_colorings()
    assert r["four_color_eq_D1"] is True
    assert r["k_d_edges_eq_D"] is True
    assert r["k_d1_edges_eq_V2"] is True


def test_petersen_function():
    from urt.graph_theory_cathedral import petersen_properties
    r = petersen_properties()
    assert r["vertices_eq_2q"] is True
    assert r["girth_eq_q"] is True


def test_ramsey_function():
    from urt.graph_theory_cathedral import ramsey_theory
    r = ramsey_theory()
    assert r["R_33_eq_V2"] is True
    assert r["R_34_eq_H3"] is True


def test_spectral_function():
    from urt.graph_theory_cathedral import spectral_theory
    r = spectral_theory()
    assert r["spectral_gap_eq_q"] is True


def test_graph_theory_summary():
    from urt.graph_theory_cathedral import graph_theory_summary
    r = graph_theory_summary()
    assert "icosahedral" in r
    assert "colorings" in r
    assert "petersen" in r
    assert "ramsey" in r
    assert len(r["key_results"]) >= 6


def test_print_graph_theory_report(capsys):
    from urt.graph_theory_cathedral import print_graph_theory_report
    print_graph_theory_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "5" in out
    assert "Cathedral" in out
    assert len(out) > 200
