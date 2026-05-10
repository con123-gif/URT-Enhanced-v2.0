"""Tests for urt/grassmannian_cathedral.py — Grassmannian Cathedral structure."""
import pytest
from math import factorial, comb

from urt.grassmannian_cathedral import (
    grassmannian_dim, euler_characteristic,
    GRASS_DIM_D_V, GRASS_DIM_D_N, GRASS_DIM_2_V, GRASS_DIM_D1_N,
    GRASS_DIM_2_N, GRASS_DIM_q_N, GRASS_DIM_q_V, GRASS_DIM_D1_V, GRASS_DIM_D_Dq,
    IDENTITY_DIM_D_V_IS_DD, IDENTITY_DIM_D_N_IS_E,
    IDENTITY_DIM_2_V_IS_F, IDENTITY_DIM_D1_N_IS_DFACT_SQ,
    IDENTITY_DIM_2_N_IS_2_DFACT_Q, IDENTITY_DIM_q_N_IS_2D_q,
    IDENTITY_DIM_q_V_IS_q_DFACT1, IDENTITY_DIM_D1_V_IS_2Q,
    IDENTITY_DIM_D_Dq_IS_VD,
    TOP_COHOM_D_N, IDENTITY_TOP_COHOM_D_N_IS_G, IDENTITY_TOP_COHOM_D_N_IS_2E,
    DIM_OG_D_2N, DIM_LG_D_2V,
    IDENTITY_DIM_OG_D_2N, IDENTITY_OG_EQ_CHI_2V,
    IDENTITY_DUALITY_D_N, IDENTITY_DUALITY_D_V,
    IDENTITY_G1N_IS_PV, IDENTITY_G1V_IS_P_DFACT_Q,
    IDENTITY_N_MINUS_2_IS_DFACT_Q,
    ALL_GRASS_IDENTITIES, ALL_GRASS_EXACT, N_GRASS_IDENTITIES,
    grassmannian_summary, print_grassmannian_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Core formula ──────────────────────────────────────────────────────────────

class TestGrassmannianFormula:
    def test_formula_basic(self):
        assert grassmannian_dim(1, 4) == 3
        assert grassmannian_dim(2, 4) == 4
        assert grassmannian_dim(2, 5) == 6

    def test_formula_cathedral_inputs(self):
        assert grassmannian_dim(D, V) == D * (V - D)
        assert grassmannian_dim(D, N) == D * (N - D)
        assert grassmannian_dim(2, V) == 2 * (V - 2)

    def test_grassmannian_symmetry(self):
        """G(k,n) = G(n-k,n) by duality."""
        for k, n in [(D, N), (D, V), (2, V), (q, N)]:
            assert grassmannian_dim(k, n) == grassmannian_dim(n - k, n)


# ── Cathedral dimension hits ──────────────────────────────────────────────────

class TestCathedralDimensions:
    def test_G_D_V_is_D_cubed(self):
        """G(D,V) dim = D(V-D) = 3×9 = 27 = D^D SELF-REFERENTIAL!"""
        assert IDENTITY_DIM_D_V_IS_DD
        assert GRASS_DIM_D_V == D**D == 27

    def test_G_D_N_is_E(self):
        """G(D,N) dim = D(N-D) = 3×10 = 30 = E CATHEDRAL!"""
        assert IDENTITY_DIM_D_N_IS_E
        assert GRASS_DIM_D_N == E == 30

    def test_G_2_V_is_F(self):
        """G(2,V) dim = 2(V-2) = 2×10 = 20 = F CATHEDRAL!"""
        assert IDENTITY_DIM_2_V_IS_F
        assert GRASS_DIM_2_V == F == 20

    def test_G_D1_N_is_Dfact_sq(self):
        """G(D+1,N) dim = 4×9 = 36 = (D!)² CATHEDRAL!"""
        assert IDENTITY_DIM_D1_N_IS_DFACT_SQ
        assert GRASS_DIM_D1_N == factorial(D)**2 == 36

    def test_G_2_N_is_2_Dfact_q(self):
        """G(2,N) dim = 2×11 = 22 = 2(D!+q) CATHEDRAL!"""
        assert IDENTITY_DIM_2_N_IS_2_DFACT_Q
        assert GRASS_DIM_2_N == 2 * (factorial(D) + q) == 22

    def test_G_q_N_is_2D_times_q(self):
        """G(q,N) dim = 5×8 = 40 = 2^D × q CATHEDRAL!"""
        assert IDENTITY_DIM_q_N_IS_2D_q
        assert GRASS_DIM_q_N == 2**D * q == 40

    def test_G_q_V_is_q_Dfact1(self):
        """G(q,V) dim = 5×7 = 35 = q×(D!+1) CATHEDRAL!"""
        assert IDENTITY_DIM_q_V_IS_q_DFACT1
        assert GRASS_DIM_q_V == q * (factorial(D) + 1) == 35

    def test_G_D1_V_is_2q(self):
        """G(D+1,V) dim = 4×8 = 32 = 2^q CATHEDRAL!"""
        assert IDENTITY_DIM_D1_V_IS_2Q
        assert GRASS_DIM_D1_V == 2**q == 32

    def test_G_D_Dq_is_VD(self):
        """G(D, D+q) = G(3,8) dim = 15 = V+D CATHEDRAL!"""
        assert IDENTITY_DIM_D_Dq_IS_VD
        assert GRASS_DIM_D_Dq == V + D == 15

    def test_dimension_values(self):
        """Quick sanity check of all dimension values."""
        assert GRASS_DIM_D_V == 27
        assert GRASS_DIM_D_N == 30
        assert GRASS_DIM_2_V == 20
        assert GRASS_DIM_D1_N == 36
        assert GRASS_DIM_q_V == 35
        assert GRASS_DIM_D1_V == 32


# ── Top cohomology ────────────────────────────────────────────────────────────

class TestTopCohomology:
    def test_top_cohom_D_N_is_G(self):
        """G(D,N) top cohomology degree = 2×dim = 60 = G = |A₅| CATHEDRAL!"""
        assert IDENTITY_TOP_COHOM_D_N_IS_G
        assert TOP_COHOM_D_N == G == 60

    def test_top_cohom_D_N_is_2E(self):
        """G(D,N) top cohomology = 2E = 60 = G."""
        assert IDENTITY_TOP_COHOM_D_N_IS_2E
        assert TOP_COHOM_D_N == 2 * E == 60


# ── Orthogonal/Lagrangian Grassmannians ───────────────────────────────────────

class TestIsotropicGrassmannians:
    def test_OG_dim_is_DfactDfactq(self):
        """OG(D, 2N) dim = 66 = D!(D!+q) CATHEDRAL!"""
        assert IDENTITY_DIM_OG_D_2N
        assert DIM_OG_D_2N == factorial(D) * (factorial(D) + q) == 66

    def test_OG_equals_chi_G2V(self):
        """OG(D,2N) dim = χ(G(2,V)) — orthogonal dim = Euler char miracle."""
        assert IDENTITY_OG_EQ_CHI_2V

    def test_LG_dim(self):
        """LG(D, 2V) Lagrangian Grassmannian dim = 33 = D(D!+q)."""
        assert DIM_LG_D_2V == D * (factorial(D) + q) == 33


# ── Duality and projective space identities ───────────────────────────────────

class TestDuality:
    def test_G_D_N_duality(self):
        """G(D,N) ≅ G(N-D,N): dim preserved under duality."""
        assert IDENTITY_DUALITY_D_N

    def test_G_D_V_duality(self):
        assert IDENTITY_DUALITY_D_V

    def test_G1_N_is_PN_1(self):
        """G(1,N) = P^{N-1} = P^{V}: N-1 = V = 12."""
        assert IDENTITY_G1N_IS_PV

    def test_G1_V_is_P_Dfact_q(self):
        """G(1,V) = P^{V-1}: V-1 = D!+q = 11."""
        assert IDENTITY_G1V_IS_P_DFACT_Q


# ── N-2 miracle ───────────────────────────────────────────────────────────────

def test_N_minus_2_is_Dfact_plus_q():
    """N-2 = 11 = D!+q — this number appears in ALL Euler characteristic formulas."""
    assert IDENTITY_N_MINUS_2_IS_DFACT_Q
    assert N - 2 == factorial(D) + q == 11


# ── All identities ────────────────────────────────────────────────────────────

def test_all_grass_exact():
    assert ALL_GRASS_EXACT

def test_n_grass_identities():
    assert N_GRASS_IDENTITIES == len(ALL_GRASS_IDENTITIES)
    assert N_GRASS_IDENTITIES >= 25


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = grassmannian_summary()
    assert isinstance(s, dict)

def test_summary_G_D_V():
    s = grassmannian_summary()
    assert s["GRASS_DIM_D_V"] == D**D == 27

def test_summary_G_D_N():
    s = grassmannian_summary()
    assert s["GRASS_DIM_D_N"] == E == 30

def test_summary_all_exact():
    s = grassmannian_summary()
    assert s["ALL_GRASS_EXACT"] is True

def test_print_report_runs(capsys):
    print_grassmannian_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_27(capsys):
    print_grassmannian_report()
    out = capsys.readouterr().out
    assert "27" in out

def test_print_report_contains_60(capsys):
    print_grassmannian_report()
    out = capsys.readouterr().out
    assert "60" in out

def test_print_report_contains_SELF_REF(capsys):
    print_grassmannian_report()
    out = capsys.readouterr().out
    assert "SELF" in out or "self" in out.lower()

def test_print_report_contains_CATHEDRAL(capsys):
    print_grassmannian_report()
    out = capsys.readouterr().out
    assert "CATHEDRAL" in out or "Cathedral" in out
