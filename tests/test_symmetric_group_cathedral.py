"""Tests for urt/symmetric_group_cathedral.py — Symmetric group Cathedral identities."""
import pytest
from math import factorial

from urt.symmetric_group_cathedral import (
    S_D_ORDER, S_D1_ORDER, S_q_ORDER,
    A_D_ORDER, A_D1_ORDER, A_q_ORDER,
    IDENTITY_SD_ORDER, IDENTITY_SD1_ORDER, IDENTITY_Sq_ORDER,
    IDENTITY_AD_ORDER, IDENTITY_AD1_ORDER, IDENTITY_Aq_ORDER,
    N_IRREPS_SD, N_IRREPS_SD1, N_IRREPS_Sq, N_IRREPS_SV, N_IRREPS_SN,
    IDENTITY_NIRREPS_SD, IDENTITY_NIRREPS_SD1, IDENTITY_NIRREPS_Sq,
    IDENTITY_NIRREPS_SV, IDENTITY_NIRREPS_SN,
    SD_IRREP_DIMS, IDENTITY_SD_IRREPS, IDENTITY_SD_FROBENIUS,
    S_D1_IRREP_DIMS, IDENTITY_SD1_SUM_SQ,
    Sq_IRREP_DIMS, IDENTITY_Sq_SUM_SQ, IDENTITY_Sq_HAS_DFACT,
    IDENTITY_Sq_HAS_D1, IDENTITY_Sq_HAS_q,
    A5_IRREP_DIMS, IDENTITY_A5_NIRREPS, IDENTITY_A5_SUM_SQ,
    DIM_21_S3, DIM_22_S4, IDENTITY_HOOK_21, IDENTITY_HOOK_22,
    hook_length_formula, _partition,
    IDENTITY_SCHUR_VARS, IDENTITY_BRANCHING, IDENTITY_INDUCTION,
    ALL_SYM_IDENTITIES, ALL_SYM_EXACT, N_SYM_IDENTITIES,
    sym_group_summary, print_sym_group_report,
)
from urt.shell_closure import D, N, V, q, G


# ── Group orders ──────────────────────────────────────────────────────────────

class TestGroupOrders:
    def test_SD_order_is_V_half(self):
        """|S_D| = D! = V/2."""
        assert IDENTITY_SD_ORDER
        assert S_D_ORDER == factorial(D) == V // 2 == 6

    def test_SD1_order_is_2D_D(self):
        """|(S_{D+1}| = (D+1)! = 2^D × D = 24."""
        assert IDENTITY_SD1_ORDER
        assert S_D1_ORDER == 2**D * D == 24

    def test_Sq_order_is_2G(self):
        """|(S_q| = q! = 2G = 120."""
        assert IDENTITY_Sq_ORDER
        assert S_q_ORDER == 2 * G == 120

    def test_AD_order_is_D_SELF_REFERENTIAL(self):
        """THE KEY MIRACLE: |A_D| = D!/2 = 3 = D — self-referential!"""
        assert IDENTITY_AD_ORDER
        assert A_D_ORDER == D == 3

    def test_AD1_order_is_V(self):
        """|A_{D+1}| = (D+1)!/2 = 12 = V."""
        assert IDENTITY_AD1_ORDER
        assert A_D1_ORDER == V == 12

    def test_Aq_order_is_G(self):
        """|A_q| = |A_5| = 60 = G = icosahedral rotation group order."""
        assert IDENTITY_Aq_ORDER
        assert A_q_ORDER == G == 60


# ── Number of irreducible representations ────────────────────────────────────

class TestNIrreps:
    def test_irreps_SD_is_D_self_referential(self):
        """#irreps(S_D) = p(D) = D — both input and output are D."""
        assert IDENTITY_NIRREPS_SD
        assert N_IRREPS_SD == D == 3

    def test_irreps_SD1_is_q(self):
        """#irreps(S_{D+1}) = p(D+1) = 5 = q."""
        assert IDENTITY_NIRREPS_SD1
        assert N_IRREPS_SD1 == q == 5

    def test_irreps_Sq_is_dfact_plus1(self):
        """#irreps(S_q) = p(q) = 7 = D!+1."""
        assert IDENTITY_NIRREPS_Sq
        assert N_IRREPS_Sq == factorial(D) + 1 == 7

    def test_irreps_SV_is_77(self):
        """#irreps(S_V) = p(V) = 77 = (D!+1)(2D+q)."""
        assert IDENTITY_NIRREPS_SV
        assert N_IRREPS_SV == (factorial(D) + 1) * (2 * D + q) == 77

    def test_irreps_SN_is_101(self):
        """#irreps(S_N) = p(N) = 101."""
        assert IDENTITY_NIRREPS_SN
        assert N_IRREPS_SN == 101


# ── S_3 irreps ────────────────────────────────────────────────────────────────

class TestS3Irreps:
    def test_S3_has_3_irreps(self):
        assert len(SD_IRREP_DIMS) == D == 3

    def test_S3_dims_are_1_1_2(self):
        assert sorted(SD_IRREP_DIMS) == [1, 1, D - 1]

    def test_S3_frobenius_identity(self):
        """Σ dim² = |S_3| = D! = 6."""
        assert IDENTITY_SD_FROBENIUS
        assert sum(d**2 for d in SD_IRREP_DIMS) == factorial(D)


# ── S_4 irreps ────────────────────────────────────────────────────────────────

class TestS4Irreps:
    def test_S4_has_q_irreps(self):
        assert len(S_D1_IRREP_DIMS) == q == 5

    def test_S4_sum_sq_is_order(self):
        assert IDENTITY_SD1_SUM_SQ
        assert sum(d**2 for d in S_D1_IRREP_DIMS) == factorial(D + 1) == 24

    def test_S4_has_D_dim_irrep(self):
        assert D in S_D1_IRREP_DIMS

    def test_S4_has_Dm1_dim_irrep(self):
        assert D - 1 in S_D1_IRREP_DIMS


# ── S_5 irreps ────────────────────────────────────────────────────────────────

class TestS5Irreps:
    def test_S5_has_7_irreps(self):
        assert len(Sq_IRREP_DIMS) == factorial(D) + 1 == 7

    def test_S5_sum_sq_is_order(self):
        assert IDENTITY_Sq_SUM_SQ
        assert sum(d**2 for d in Sq_IRREP_DIMS) == factorial(q) == 120

    def test_S5_has_Dfact_dim(self):
        """S_5 has a 6=D! dimensional irrep."""
        assert IDENTITY_Sq_HAS_DFACT
        assert factorial(D) in Sq_IRREP_DIMS

    def test_S5_has_D1_dim(self):
        """S_5 has a 4=D+1 dimensional irrep."""
        assert IDENTITY_Sq_HAS_D1
        assert D + 1 in Sq_IRREP_DIMS

    def test_S5_has_q_dim(self):
        """S_5 has a 5=q dimensional irrep."""
        assert IDENTITY_Sq_HAS_q
        assert q in Sq_IRREP_DIMS


# ── A_5 irreps ────────────────────────────────────────────────────────────────

class TestA5Irreps:
    def test_A5_has_q_irreps(self):
        """A_5 has q=5 irreducible representations."""
        assert IDENTITY_A5_NIRREPS
        assert len(A5_IRREP_DIMS) == q == 5

    def test_A5_dims_are_cathedral(self):
        """A_5 irrep dims = {1, D, D, D+1, q} = {1,3,3,4,5}."""
        assert sorted(A5_IRREP_DIMS) == [1, D, D, D + 1, q]

    def test_A5_sum_sq_is_G(self):
        """Σ(dim)² = 60 = G = |A_5|."""
        assert IDENTITY_A5_SUM_SQ
        assert sum(d**2 for d in A5_IRREP_DIMS) == G == 60


# ── Hook length formula ───────────────────────────────────────────────────────

class TestHookLength:
    def test_trivial_partition(self):
        """dim({n}) = 1 (trivial rep)."""
        assert hook_length_formula([3]) == 1
        assert hook_length_formula([1]) == 1

    def test_sign_partition(self):
        """dim({1^n}) = 1 (sign rep)."""
        assert hook_length_formula([1, 1, 1]) == 1

    def test_shape_21_S3(self):
        """dim(2,1) = 2 = D-1 for S_3."""
        assert IDENTITY_HOOK_21
        assert DIM_21_S3 == D - 1 == 2

    def test_shape_22_S4(self):
        """dim(2,2) = 2 = D-1 for S_4."""
        assert IDENTITY_HOOK_22
        assert DIM_22_S4 == D - 1 == 2

    def test_shape_31_S4(self):
        """dim(3,1) = 3 = D for S_4."""
        dim = hook_length_formula([3, 1])
        assert dim == D

    def test_shape_111_S3(self):
        """sign rep of S_3 has dim 1."""
        assert hook_length_formula([1, 1, 1]) == 1


# ── Branching and Schur ───────────────────────────────────────────────────────

class TestBranchingSchur:
    def test_schur_vars_is_D(self):
        assert IDENTITY_SCHUR_VARS

    def test_branching_is_D_minus1(self):
        assert IDENTITY_BRANCHING

    def test_induction_pieces_is_D(self):
        assert IDENTITY_INDUCTION


# ── All identities ────────────────────────────────────────────────────────────

def test_all_sym_exact():
    assert ALL_SYM_EXACT

def test_n_sym_identities():
    assert N_SYM_IDENTITIES == len(ALL_SYM_IDENTITIES)
    assert N_SYM_IDENTITIES >= 20


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = sym_group_summary()
    assert isinstance(s, dict)

def test_summary_A_D_is_D():
    s = sym_group_summary()
    assert s["A_D_order"] == D

def test_summary_S_q_is_2G():
    s = sym_group_summary()
    assert s["S_q_order"] == 2 * G

def test_summary_all_exact():
    s = sym_group_summary()
    assert s["all_sym_exact"] is True

def test_print_report_runs(capsys):
    print_sym_group_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_self_referential(capsys):
    print_sym_group_report()
    out = capsys.readouterr().out
    assert "SELF-REFERENTIAL" in out

def test_print_report_contains_A5(capsys):
    print_sym_group_report()
    out = capsys.readouterr().out
    assert "A_5" in out or "A5" in out or "60" in out

def test_print_report_contains_77(capsys):
    print_sym_group_report()
    out = capsys.readouterr().out
    assert "77" in out
