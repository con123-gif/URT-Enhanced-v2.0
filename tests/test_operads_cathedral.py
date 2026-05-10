"""Tests for urt/operads_cathedral.py — Operads, associahedra, permutohedra Cathedral."""
import pytest
from math import factorial, comb

from urt.operads_cathedral import (
    catalan, perm_vertices, perm_edges, assoc_total_cells,
    triangulations_convex_polygon,
    CATALAN_D, CATALAN_Dm1, CATALAN_Dp1, CATALAN_q,
    ASSOC_K_D_VERTICES, ASSOC_K_D_EDGES, ASSOC_K_D_DIM, ASSOC_K_D_TOTAL,
    ASSOC_K_Dp1_VERTICES, ASSOC_K_Dp1_TOTAL,
    ASSOC_K_q_VERTICES,
    ASSOC_TIMES_PERM_D,
    PERM_PI_D, PERM_PI_D_EDGES, PERM_PI_D_TOTAL,
    PERM_PI_Dp1, PERM_PI_Dp1_EDGES, PERM_PI_q,
    BINARY_TREES_D_LEAVES, BINARY_TREES_DF_LEAVES,
    TRIANGULATIONS_q_GON,
    EN_DISKS_SELFREP, ASSOCIATOR_ARITY, SCHUBERT_CROWN_MATCH,
    IDENTITY_CATALAN_D_IS_q, IDENTITY_CATALAN_Dm1_IS_Dm1,
    IDENTITY_CATALAN_q_IS_DF_DFp1, IDENTITY_CATALAN_SUM_IS_DFp1,
    IDENTITY_K_D_VERTICES_IS_q, IDENTITY_K_D_EDGES_IS_q,
    IDENTITY_K_D_DIM_IS_Dm1, IDENTITY_K_D_TOTAL_IS_Nm2,
    IDENTITY_K_D_TOTAL_IS_DFpq,
    IDENTITY_K_Dp1_DIM_IS_D, IDENTITY_K_Dp1_TOTAL_IS_D_VpD,
    IDENTITY_K_q_VERTICES_IS_DF_DFp1, IDENTITY_K_q_DIM_IS_Dp1,
    IDENTITY_PI_D_IS_DFACT, IDENTITY_PI_D_EDGES_IS_DFACT,
    IDENTITY_PI_D_TOTAL_IS_N,
    IDENTITY_PI_Dp1_IS_2V, IDENTITY_PI_Dp1_EDGES_IS_DFsq,
    IDENTITY_PI_q_IS_2G, IDENTITY_PI_q_IS_PI_Dp2,
    IDENTITY_K_TIMES_PI_D_IS_E,
    IDENTITY_EN_DISKS_IS_D, IDENTITY_ASSOCIATOR_ARITY_IS_D,
    IDENTITY_TRIANG_q_GON_IS_q, IDENTITY_SCHUBERT_CROWN,
    IDENTITY_TREES_D1_LEAVES_IS_q, IDENTITY_q_IS_Dp2,
    ALL_OPERAD_IDENTITIES, ALL_OPERAD_EXACT,
    operad_summary, print_operad_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Core formulas ─────────────────────────────────────────────────────────────

class TestCoreFormulas:
    def test_catalan(self):
        assert catalan(1) == 1
        assert catalan(2) == 2
        assert catalan(D) == q == 5
        assert catalan(q) == factorial(D) * (factorial(D)+1) == 42

    def test_perm_vertices(self):
        assert perm_vertices(D) == factorial(D) == 6
        assert perm_vertices(D+1) == factorial(D+1) == 24

    def test_triangulations(self):
        assert triangulations_convex_polygon(q) == q == 5
        assert triangulations_convex_polygon(4) == 2


# ── Catalan numbers ───────────────────────────────────────────────────────────

class TestCatalan:
    def test_Catalan_D_is_q(self):
        """Catalan(D) = 5 = q SELF-REFERENTIAL!!!"""
        assert IDENTITY_CATALAN_D_IS_q
        assert CATALAN_D == q == 5

    def test_Catalan_Dm1_is_Dm1(self):
        """Catalan(D-1) = 2 = D-1 CATHEDRAL!"""
        assert IDENTITY_CATALAN_Dm1_IS_Dm1
        assert CATALAN_Dm1 == D - 1 == 2

    def test_Catalan_q_is_DF_DFp1(self):
        """Catalan(q) = 42 = D!×(D!+1) CATHEDRAL!"""
        assert IDENTITY_CATALAN_q_IS_DF_DFp1
        assert CATALAN_q == factorial(D) * (factorial(D)+1) == 42

    def test_Catalan_sum_D_Dm1_is_DFp1(self):
        """Catalan(D) + Catalan(D-1) = 5+2 = 7 = D!+1 CATHEDRAL!"""
        assert IDENTITY_CATALAN_SUM_IS_DFp1
        assert CATALAN_D + CATALAN_Dm1 == factorial(D)+1 == 7


# ── Stasheff Associahedron K_D (pentagon) ─────────────────────────────────────

class TestAssociahedronKD:
    def test_K_D_vertices_is_q(self):
        """K_D = pentagon: Catalan(D)=q=5 vertices SELF-REFERENTIAL!!!"""
        assert IDENTITY_K_D_VERTICES_IS_q
        assert ASSOC_K_D_VERTICES == q == 5

    def test_K_D_edges_is_q(self):
        """K_D = pentagon: q=5 edges SELF-REFERENTIAL! (it's the q-gon!)"""
        assert IDENTITY_K_D_EDGES_IS_q
        assert ASSOC_K_D_EDGES == q == 5

    def test_K_D_dim_is_Dm1(self):
        """K_D is a 2D polygon: dim = D-1 = 2 CATHEDRAL!"""
        assert IDENTITY_K_D_DIM_IS_Dm1
        assert ASSOC_K_D_DIM == D - 1 == 2

    def test_K_D_total_is_Nm2(self):
        """K_D total cells: 5+5+1=11 = N-2 CATHEDRAL!"""
        assert IDENTITY_K_D_TOTAL_IS_Nm2
        assert ASSOC_K_D_TOTAL == N - 2 == 11

    def test_K_D_total_is_DFpq(self):
        """K_D total cells = D!+q = 11 CATHEDRAL!"""
        assert IDENTITY_K_D_TOTAL_IS_DFpq
        assert ASSOC_K_D_TOTAL == factorial(D) + q == 11


# ── K_{D+1} (3D associahedron) ────────────────────────────────────────────────

class TestAssociahedronKDp1:
    def test_K_Dp1_vertices(self):
        """K_{D+1} = K_4: Catalan(D+1)=14 vertices CATHEDRAL!"""
        assert ASSOC_K_Dp1_VERTICES == catalan(D+1) == 14

    def test_K_Dp1_dim_is_D(self):
        """K_{D+1} is D-dimensional polytope SELF-REFERENTIAL!"""
        assert IDENTITY_K_Dp1_DIM_IS_D

    def test_K_Dp1_total_is_D_VpD(self):
        """K_{D+1} total: 14+21+9+1=45 = D×(V+D) CATHEDRAL!"""
        assert IDENTITY_K_Dp1_TOTAL_IS_D_VpD
        assert ASSOC_K_Dp1_TOTAL == D*(V+D) == 45


# ── K_q associahedron ─────────────────────────────────────────────────────────

class TestAssociahedronKq:
    def test_K_q_vertices_is_DF_DFp1(self):
        """K_q: Catalan(q)=42=D!×(D!+1) vertices CATHEDRAL!"""
        assert IDENTITY_K_q_VERTICES_IS_DF_DFp1
        assert ASSOC_K_q_VERTICES == factorial(D) * (factorial(D)+1) == 42

    def test_K_q_dim_is_Dp1(self):
        """K_q is (q-1)=D+1=4-dimensional CATHEDRAL!"""
        assert IDENTITY_K_q_DIM_IS_Dp1


# ── Permutohedron Π_D (hexagon) ───────────────────────────────────────────────

class TestPermutohedronPiD:
    def test_Pi_D_vertices_is_DFACT(self):
        """Π_D = hexagon: D!=6 vertices SELF-REFERENTIAL!"""
        assert IDENTITY_PI_D_IS_DFACT
        assert PERM_PI_D == factorial(D) == 6

    def test_Pi_D_edges_is_DFACT(self):
        """Π_D = hexagon: D!=6 edges SELF-REFERENTIAL!"""
        assert IDENTITY_PI_D_EDGES_IS_DFACT
        assert PERM_PI_D_EDGES == factorial(D) == 6

    def test_Pi_D_total_is_N(self):
        """Π_D hexagon total: 6+6+1=13 = N CATHEDRAL!!!"""
        assert IDENTITY_PI_D_TOTAL_IS_N
        assert PERM_PI_D_TOTAL == N == 13


# ── Permutohedron Π_{D+1} and Π_q ────────────────────────────────────────────

class TestPermutohedraLarger:
    def test_Pi_Dp1_is_2V(self):
        """Π_{D+1}: (D+1)!=24=2V vertices CATHEDRAL!"""
        assert IDENTITY_PI_Dp1_IS_2V
        assert PERM_PI_Dp1 == 2*V == 24

    def test_Pi_Dp1_edges_is_DFsq(self):
        """Π_{D+1}: D×(D+1)!/2=36=(D!)² edges CATHEDRAL!"""
        assert IDENTITY_PI_Dp1_EDGES_IS_DFsq
        assert PERM_PI_Dp1_EDGES == factorial(D)**2 == 36

    def test_Pi_q_is_2G(self):
        """Π_q: q!=120=2G=|I*| vertices CATHEDRAL!"""
        assert IDENTITY_PI_q_IS_2G
        assert PERM_PI_q == 2*G == 120

    def test_Pi_q_is_Pi_Dp2(self):
        """Π_q = Π_{D+2} since q=D+2 SELF-REFERENTIAL!!!"""
        assert IDENTITY_PI_q_IS_PI_Dp2


# ── Cross-structure miracles ──────────────────────────────────────────────────

class TestCrossStructure:
    def test_K_times_Pi_D_is_E(self):
        """K_D vertices × Π_D vertices = q×D! = 5×6 = 30 = E CATHEDRAL!"""
        assert IDENTITY_K_TIMES_PI_D_IS_E
        assert ASSOC_TIMES_PERM_D == E == 30

    def test_q_equals_Dp2(self):
        """q = D+2 — the fundamental self-referential identity!"""
        assert IDENTITY_q_IS_Dp2
        assert q == D + 2 == 5


# ── Triangulations and binary trees ──────────────────────────────────────────

class TestTriangulations:
    def test_triangulations_q_gon(self):
        """Triangulations of the q-gon = Catalan(D) = q SELF-REFERENTIAL!"""
        assert IDENTITY_TRIANG_q_GON_IS_q
        assert TRIANGULATIONS_q_GON == q == 5

    def test_binary_trees_D_leaves(self):
        """Binary trees with D+1=4 leaves: Catalan(D)=q=5 CATHEDRAL!"""
        assert IDENTITY_TREES_D1_LEAVES_IS_q
        assert BINARY_TREES_D_LEAVES == q == 5

    def test_schubert_crown_match(self):
        """Triangulations = deg G(2,D+2) = Catalan(D) = q: Schubert crown jewel!"""
        assert IDENTITY_SCHUBERT_CROWN
        assert SCHUBERT_CROWN_MATCH == q == 5


# ── E_n operads ───────────────────────────────────────────────────────────────

class TestOperads:
    def test_E_n_disks_is_D(self):
        """E_D operad governs D-fold loops in D-space SELF-REFERENTIAL!"""
        assert IDENTITY_EN_DISKS_IS_D
        assert EN_DISKS_SELFREP == D == 3

    def test_associator_arity_is_D(self):
        """The D-ary associator has arity D SELF-REFERENTIAL!"""
        assert IDENTITY_ASSOCIATOR_ARITY_IS_D
        assert ASSOCIATOR_ARITY == D == 3


# ── All identities ────────────────────────────────────────────────────────────

def test_all_operad_exact():
    assert ALL_OPERAD_EXACT

def test_n_operad_identities():
    assert len(ALL_OPERAD_IDENTITIES) >= 40


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = operad_summary()
    assert isinstance(s, dict)

def test_print_report_runs(capsys):
    print_operad_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_pentagon(capsys):
    """The pentagon (K_D = q-gon) must appear."""
    print_operad_report()
    out = capsys.readouterr().out
    assert "pentagon" in out.lower() or "5" in out

def test_print_report_contains_120(capsys):
    """Π_q = 120 = 2G must appear."""
    print_operad_report()
    out = capsys.readouterr().out
    assert "120" in out

def test_print_report_contains_SELF(capsys):
    print_operad_report()
    out = capsys.readouterr().out
    assert "SELF" in out or "self" in out.lower()

def test_print_report_contains_CATHEDRAL(capsys):
    print_operad_report()
    out = capsys.readouterr().out
    assert "CATHEDRAL" in out or "Cathedral" in out
