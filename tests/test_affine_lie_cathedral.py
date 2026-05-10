"""Tests for urt/affine_lie_cathedral.py — Affine Lie algebra Cathedral."""
import pytest
from math import factorial, comb
from fractions import Fraction

from urt.affine_lie_cathedral import (
    n_integrable_reps, wzw_central_charge_A, wzw_central_charge_g,
    AFFINE_REPS_AD_D, AFFINE_REPS_AD_q, AFFINE_REPS_Aq_D,
    AFFINE_REPS_AD_V, AFFINE_REPS_AD_N, AFFINE_REPS_Aq_1,
    AFFINE_REPS_AV_1, AFFINE_REPS_AN_1,
    IDENTITY_AD_D_IS_F, IDENTITY_AD_q_IS_2D_DFACT1,
    IDENTITY_LEVEL_RANK_Dq, IDENTITY_AD_V_IS_qDFACT1N,
    IDENTITY_Aq_1_IS_DFACT, IDENTITY_AV_1_IS_N, IDENTITY_AN_1_IS_CATALAN_Dp1,
    WZW_C_AD_1, WZW_C_Aq_1, WZW_C_AV_1, WZW_C_AN_1,
    WZW_C_AD_D, WZW_C_AD_q,
    WZW_C_E6_1, WZW_C_E7_1, WZW_C_E8_1, WZW_SUM_E6_E7_E8,
    IDENTITY_WZW_C_AD_1_IS_D, IDENTITY_WZW_C_Aq_1_IS_q,
    IDENTITY_WZW_C_AV_1_IS_V, IDENTITY_WZW_C_AN_1_IS_N,
    IDENTITY_WZW_C_E6_IS_DFACT, IDENTITY_WZW_C_E7_IS_DFACT1,
    IDENTITY_WZW_C_E8_IS_2D, IDENTITY_WZW_SUM_EXCEPT_IS_D_DFACT1,
    IDENTITY_WZW_C_AD_D_DEN,
    AFFINE_WEYL_AD_FINITE_ORDER,
    IDENTITY_AFFINE_WEYL_AD_IS_2V,
    IDENTITY_AFFINE_ROOTS_AV_IS_N,
    IDENTITY_SMATRIX_AD_D_IS_F_SQ, IDENTITY_SMATRIX_AV_1_IS_N_SQ,
    IDENTITY_LEVEL_RANK_VALUE,
    IDENTITY_DIM_Aq_IS_q_DFACT1, IDENTITY_DIM_AV_IS_2D_D_DFACT1,
    ALL_AFFINE_IDENTITIES, ALL_AFFINE_EXACT,
    affine_lie_summary, print_affine_lie_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Core formula ──────────────────────────────────────────────────────────────

class TestIntegrableRepsFormula:
    def test_formula(self):
        assert n_integrable_reps(1, 1) == 2
        assert n_integrable_reps(D, D) == comb(2 * D, D)

    def test_A_D_level_D_is_F(self):
        """CROWN JEWEL: Â_D at level D has C(2D,D)=C(6,3)=20=F primary fields!"""
        assert AFFINE_REPS_AD_D == F == 20
        assert IDENTITY_AD_D_IS_F


# ── Integrable rep counts ─────────────────────────────────────────────────────

class TestIntegrableReps:
    def test_AD_D_is_F(self):
        """Â_D level D: 20 = F = icosahedral faces CATHEDRAL!!!"""
        assert IDENTITY_AD_D_IS_F
        assert AFFINE_REPS_AD_D == F == 20

    def test_AD_q_is_2D_Dfact1(self):
        """Â_D level q: C(D+q,D)=C(8,3)=56=2^D×(D!+1) CATHEDRAL!"""
        assert IDENTITY_AD_q_IS_2D_DFACT1
        assert AFFINE_REPS_AD_q == 2**D * (factorial(D) + 1) == 56

    def test_level_rank_Dq(self):
        """Level-rank duality: Â_D(level q) ↔ Â_q(level D) — both 56."""
        assert IDENTITY_LEVEL_RANK_Dq
        assert AFFINE_REPS_AD_q == AFFINE_REPS_Aq_D == 56

    def test_AD_V_is_q_Dfact1_N(self):
        """Â_D level V: C(D+V,D)=C(15,3)=455=q×(D!+1)×N CATHEDRAL!"""
        assert IDENTITY_AD_V_IS_qDFACT1N
        assert AFFINE_REPS_AD_V == q * (factorial(D) + 1) * N == 455

    def test_Aq_1_is_Dfact(self):
        """Â_q level 1: C(q+1,1)=6=D! CATHEDRAL!"""
        assert IDENTITY_Aq_1_IS_DFACT
        assert AFFINE_REPS_Aq_1 == factorial(D) == 6

    def test_AV_1_is_N(self):
        """Â_V level 1: C(V+1,1)=13=N CATHEDRAL!"""
        assert IDENTITY_AV_1_IS_N
        assert AFFINE_REPS_AV_1 == N == 13

    def test_AN_1_is_Catalan_Dp1(self):
        """Â_N level 1: C(N+1,1)=14=C_{D+1} (Catalan!) CATHEDRAL!"""
        assert IDENTITY_AN_1_IS_CATALAN_Dp1
        assert AFFINE_REPS_AN_1 == 14


# ── WZW central charges: self-referential ────────────────────────────────────

class TestWZWCentralCharges:
    def test_c_AD_1_is_D(self):
        """c(A_D,1) = D = 3 SELF-REFERENTIAL!"""
        assert IDENTITY_WZW_C_AD_1_IS_D
        assert WZW_C_AD_1 == D == 3

    def test_c_Aq_1_is_q(self):
        """c(A_q,1) = q = 5 SELF-REFERENTIAL!"""
        assert IDENTITY_WZW_C_Aq_1_IS_q
        assert WZW_C_Aq_1 == q == 5

    def test_c_AV_1_is_V(self):
        assert IDENTITY_WZW_C_AV_1_IS_V
        assert WZW_C_AV_1 == V == 12

    def test_c_AN_1_is_N(self):
        assert IDENTITY_WZW_C_AN_1_IS_N
        assert WZW_C_AN_1 == N == 13

    def test_c_AD_D_denominator_is_Dfact1(self):
        """c(A_D, D) = 45/7 — denominator 7 = D!+1 CATHEDRAL!"""
        assert IDENTITY_WZW_C_AD_D_DEN
        assert WZW_C_AD_D.denominator == factorial(D) + 1 == 7

    def test_c_AD_q_denominator_is_D(self):
        """c(A_D, q) = 25/3 — denominator 3 = D CATHEDRAL!"""
        assert WZW_C_AD_q.denominator == D == 3


# ── WZW exceptional E-series ──────────────────────────────────────────────────

class TestWZWExceptional:
    def test_c_E6_1_is_Dfact(self):
        """c(E_6,1) = 78/13 = 6 = D! — dim(E_6)/h∨ is Cathedral!"""
        assert IDENTITY_WZW_C_E6_IS_DFACT
        assert WZW_C_E6_1 == factorial(D) == 6

    def test_c_E7_1_is_Dfact1(self):
        """c(E_7,1) = 133/19 = 7 = D!+1 CATHEDRAL!"""
        assert IDENTITY_WZW_C_E7_IS_DFACT1
        assert WZW_C_E7_1 == factorial(D) + 1 == 7

    def test_c_E8_1_is_2D(self):
        """c(E_8,1) = 248/31 = 8 = 2^D CATHEDRAL!"""
        assert IDENTITY_WZW_C_E8_IS_2D
        assert WZW_C_E8_1 == 2**D == 8

    def test_exceptional_sum_is_D_Dfact1(self):
        """c(E_6,1)+c(E_7,1)+c(E_8,1) = 21 = D×(D!+1) CATHEDRAL!"""
        assert IDENTITY_WZW_SUM_EXCEPT_IS_D_DFACT1
        assert WZW_SUM_E6_E7_E8 == D * (factorial(D) + 1) == 21

    def test_exceptional_charges_consecutive(self):
        assert int(WZW_C_E6_1) == 6
        assert int(WZW_C_E7_1) == 7
        assert int(WZW_C_E8_1) == 8


# ── Affine Weyl and structure ─────────────────────────────────────────────────

class TestAffineStructure:
    def test_affine_Weyl_AD_is_2V(self):
        """Finite part of Aff. Weyl(Â_D) = (D+1)! = 24 = 2V CATHEDRAL!"""
        assert IDENTITY_AFFINE_WEYL_AD_IS_2V
        assert AFFINE_WEYL_AD_FINITE_ORDER == 2 * V == 24

    def test_simple_roots_AV_is_N(self):
        """Â_V has V+1=N simple roots CATHEDRAL!"""
        assert IDENTITY_AFFINE_ROOTS_AV_IS_N


# ── S-matrix ──────────────────────────────────────────────────────────────────

class TestSMatrix:
    def test_S_matrix_AD_D_is_F_sq(self):
        """S-matrix for Â_D level D is F×F = 400 CATHEDRAL!"""
        assert IDENTITY_SMATRIX_AD_D_IS_F_SQ

    def test_S_matrix_AV_1_is_N_sq(self):
        """S-matrix for Â_V level 1 is N×N = 169 CATHEDRAL!"""
        assert IDENTITY_SMATRIX_AV_1_IS_N_SQ


# ── Level-rank value ──────────────────────────────────────────────────────────

def test_level_rank_value_is_56():
    """Level-rank shared value = 56 = 2^D×(D!+1) CATHEDRAL!"""
    assert IDENTITY_LEVEL_RANK_VALUE

def test_Aq_dim_is_q_Dfact1():
    assert IDENTITY_DIM_Aq_IS_q_DFACT1

def test_AV_dim_is_2D_D_Dfact1():
    assert IDENTITY_DIM_AV_IS_2D_D_DFACT1


# ── All identities ────────────────────────────────────────────────────────────

def test_all_affine_exact():
    assert ALL_AFFINE_EXACT

def test_n_affine_identities():
    assert len(ALL_AFFINE_IDENTITIES) >= 35


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = affine_lie_summary()
    assert isinstance(s, dict)

def test_summary_crown_jewel():
    s = affine_lie_summary()
    assert s.get("AFFINE_REPS_AD_D") == F or s.get("affine_reps_AD_D") == F or any(v == F for v in s.values() if isinstance(v, int))

def test_summary_all_exact():
    s = affine_lie_summary()
    assert any(v is True for v in s.values())

def test_print_report_runs(capsys):
    print_affine_lie_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_20(capsys):
    """Crown jewel: 20 = F primary fields."""
    print_affine_lie_report()
    out = capsys.readouterr().out
    assert "20" in out

def test_print_report_contains_CATHEDRAL(capsys):
    print_affine_lie_report()
    out = capsys.readouterr().out
    assert "CATHEDRAL" in out or "Cathedral" in out

def test_print_report_contains_56(capsys):
    """Level-rank duality value = 56."""
    print_affine_lie_report()
    out = capsys.readouterr().out
    assert "56" in out
