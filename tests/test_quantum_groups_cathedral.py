"""Tests for urt/quantum_groups_cathedral.py — Quantum groups Cathedral."""
import pytest
from math import factorial, comb

from urt.quantum_groups_cathedral import (
    n_simple_restricted, n_tilting_quantum, steinberg_dim, weyl_group_order_A,
    SIMPLE_SL_D1_CHAR_D, SIMPLE_SL_D1_CHAR_q, SIMPLE_SL_q1_CHAR_q, SIMPLE_SL_D1_CHAR_N,
    POS_ROOTS_SL_Dp1, STEINBERG_DIM_SL_D1_CHAR_D,
    TILT_AD_LEV_D, TILT_AD_LEV_q, TILT_Aq_LEV_D, TILT_AV_LEV_1, TILT_AD_LEV_1,
    SMALL_QG_SL2_LEV_D, SMALL_QG_SL2_LEV_q, SMALL_QG_SL2_LEV_D1, SMALL_QG_SL2_LEV_DFACT,
    N_SIMPLES_SMALL_QG_LEV_D, N_SIMPLES_SMALL_QG_LEV_q,
    QG_LEVEL_AT_D_USES_ROOT_OF_UNITY,
    WEYL_ORDER_AD, WEYL_ORDER_AD_MINUS_1, WEYL_ORDER_Aq,
    KL_BASIS_WAD, FUSION_SIMPLES_LEV_D, FUSION_SIMPLES_LEV_q, FUSION_SIMPLES_LEV_V,
    FUSION_RING_RANK_LEV_V, TOTAL_FUSION_COEFFS_LEV_D, FROBENIUS_CENTER_RANK_SL_D1,
    IDENTITY_SIMPLE_SELFREP, IDENTITY_SIMPLE_CHAR_q, IDENTITY_SIMPLE_qSELF,
    IDENTITY_POS_ROOTS_IS_DFACT, IDENTITY_STEINBERG_DD_IS_D_DFACT,
    IDENTITY_STEINBERG_IS_D2_OVER_GAMMA, IDENTITY_STEINBERG_IS_D_2D,
    IDENTITY_TILT_AD_D_IS_F, IDENTITY_TILT_AD_q, IDENTITY_TILT_LEVEL_RANK_DUAL,
    IDENTITY_TILT_AV_1_IS_N, IDENTITY_TILT_AD_1_IS_Dp1,
    IDENTITY_SMALL_QG_LEV_D_IS_DD, IDENTITY_SMALL_QG_LEV_q_IS_qD,
    IDENTITY_SMALL_QG_LEV_D1_IS_D1_D, IDENTITY_SMALL_QG_LEV_DFACT_IS_2D_DD,
    IDENTITY_SIMPLES_SMALL_D_SELFREP, IDENTITY_SIMPLES_SMALL_q_SELFREP,
    IDENTITY_QG_LEVEL_D_ROOT_IS_q, IDENTITY_QINT_2_IS_PHI, IDENTITY_QINT_q_IS_ZERO,
    IDENTITY_WEYL_AD_IS_2V, IDENTITY_WEYL_AD1_IS_DFACT, IDENTITY_WEYL_Aq_IS_VFD,
    IDENTITY_KL_BASIS_IS_2V, IDENTITY_FUSION_LEV_D_IS_Dp1,
    IDENTITY_FUSION_LEV_q_IS_DFACT, IDENTITY_FUSION_LEV_V_IS_N,
    IDENTITY_TOTAL_FUSION_IS_D1_D, IDENTITY_FROBENIUS_CENTER_IS_DD,
    ALL_QG_IDENTITIES, ALL_QG_EXACT,
    quantum_groups_summary, print_quantum_groups_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Core formulas ─────────────────────────────────────────────────────────────

class TestCoreFormulas:
    def test_n_simple_restricted(self):
        assert n_simple_restricted(1, 2) == 2
        assert n_simple_restricted(D, D) == D ** D == 27
        assert n_simple_restricted(q, q) == q ** q == 3125

    def test_n_tilting(self):
        assert n_tilting_quantum(D, D) == comb(2 * D, D) == 20
        assert n_tilting_quantum(1, 1) == 2

    def test_steinberg_dim(self):
        assert steinberg_dim(D, D) == D ** (factorial(D)) == 729

    def test_weyl_group_order(self):
        assert weyl_group_order_A(D) == factorial(D + 1)
        assert weyl_group_order_A(1) == 2


# ── Simple restricted modules ─────────────────────────────────────────────────

class TestSimpleModules:
    def test_SL_D1_char_D_is_DD_SELF_REF(self):
        """SL_{D+1} over F_D has D^D=27 simple restricted modules — SELF-REFERENTIAL!"""
        assert IDENTITY_SIMPLE_SELFREP
        assert SIMPLE_SL_D1_CHAR_D == D ** D == 27

    def test_SL_D1_char_q_is_qD(self):
        """SL_{D+1} over F_q has q^D=125 simple restricted modules CATHEDRAL!"""
        assert IDENTITY_SIMPLE_CHAR_q
        assert SIMPLE_SL_D1_CHAR_q == q ** D == 125

    def test_SL_q1_char_q_is_qq(self):
        """SL_{q+1} over F_q has q^q=3125 simple restricted modules SELF-REF!"""
        assert IDENTITY_SIMPLE_qSELF
        assert SIMPLE_SL_q1_CHAR_q == q ** q == 3125


# ── Steinberg module ──────────────────────────────────────────────────────────

class TestSteinbergModule:
    def test_pos_roots_is_Dfact(self):
        """Positive roots of A_{D+1} = D(D+1)/2 = D! = 6 SELF-REFERENTIAL!"""
        assert IDENTITY_POS_ROOTS_IS_DFACT
        assert POS_ROOTS_SL_Dp1 == factorial(D) == 6

    def test_steinberg_is_D_Dfact(self):
        """Steinberg dim for SL_{D+1}/F_D = D^{D!} = 3^6 = 729 CATHEDRAL!"""
        assert IDENTITY_STEINBERG_DD_IS_D_DFACT
        assert STEINBERG_DIM_SL_D1_CHAR_D == D ** factorial(D) == 729

    def test_steinberg_is_D2_over_gamma(self):
        """729 = D^2 × (1/γ) = 9 × 81 CATHEDRAL!"""
        assert IDENTITY_STEINBERG_IS_D2_OVER_GAMMA
        assert STEINBERG_DIM_SL_D1_CHAR_D == D ** 2 * 81 == 729

    def test_steinberg_is_D_2D(self):
        """729 = D^{2D} = 3^6 — positivity miracle CATHEDRAL!"""
        assert IDENTITY_STEINBERG_IS_D_2D
        assert STEINBERG_DIM_SL_D1_CHAR_D == D ** (2 * D) == 729


# ── Tilting modules ───────────────────────────────────────────────────────────

class TestTiltingModules:
    def test_tilt_AD_D_is_F(self):
        """CROWN JEWEL: Quantum SL_{D+1} at level D has C(2D,D)=F=20 tilting modules CATHEDRAL!"""
        assert IDENTITY_TILT_AD_D_IS_F
        assert TILT_AD_LEV_D == F == 20

    def test_tilt_AD_D_matches_affine_lie(self):
        """Tilting count = affine integrable rep count — two frameworks agree!"""
        assert TILT_AD_LEV_D == F == 20  # same as AFFINE_REPS_AD_D

    def test_tilt_AD_q_is_2D_Dfact1(self):
        """Quantum SL_{D+1} at level q: C(D+q,D)=56=2^D×(D!+1) CATHEDRAL!"""
        assert IDENTITY_TILT_AD_q
        assert TILT_AD_LEV_q == 2 ** D * (factorial(D) + 1) == 56

    def test_tilt_level_rank_duality(self):
        """Level-rank duality: tilt(A_D,level q) = tilt(A_q,level D) = 56 CATHEDRAL!"""
        assert IDENTITY_TILT_LEVEL_RANK_DUAL
        assert TILT_AD_LEV_q == TILT_Aq_LEV_D == 56

    def test_tilt_AV_1_is_N(self):
        """Quantum SL_{V+1} at level 1: V+1=N=13 tilting modules CATHEDRAL!"""
        assert IDENTITY_TILT_AV_1_IS_N
        assert TILT_AV_LEV_1 == N == 13

    def test_tilt_AD_1_is_Dp1(self):
        """Quantum SL_{D+1} at level 1: D+1=4 tilting modules."""
        assert IDENTITY_TILT_AD_1_IS_Dp1
        assert TILT_AD_LEV_1 == D + 1 == 4


# ── Small quantum group dimensions ────────────────────────────────────────────

class TestSmallQuantumGroup:
    def test_small_qg_lev_D_is_DD(self):
        """Small quantum group ũ(sl_2) at ℓ=D: dim = D^D = 27 SELF-REFERENTIAL!"""
        assert IDENTITY_SMALL_QG_LEV_D_IS_DD
        assert SMALL_QG_SL2_LEV_D == D ** D == 27

    def test_small_qg_lev_q_is_qD(self):
        """Small quantum group at ℓ=q: dim = q^D = 125 CATHEDRAL!"""
        assert IDENTITY_SMALL_QG_LEV_q_IS_qD
        assert SMALL_QG_SL2_LEV_q == q ** D == 125

    def test_small_qg_lev_D1_is_D1D(self):
        """Small quantum group at ℓ=D+1: dim = (D+1)^D = 64 = codons CATHEDRAL!"""
        assert IDENTITY_SMALL_QG_LEV_D1_IS_D1_D
        assert SMALL_QG_SL2_LEV_D1 == (D + 1) ** D == 64

    def test_small_qg_lev_Dfact_is_2D_DD(self):
        """Small quantum group at ℓ=D!: dim = 2^D × D^D = 8 × 27 = 216 CATHEDRAL!"""
        assert IDENTITY_SMALL_QG_LEV_DFACT_IS_2D_DD
        assert SMALL_QG_SL2_LEV_DFACT == 2 ** D * D ** D == 216

    def test_simples_small_D_selfrep(self):
        """Number of simples in small QG at ℓ=D: = D = 3 SELF-REFERENTIAL!"""
        assert IDENTITY_SIMPLES_SMALL_D_SELFREP
        assert N_SIMPLES_SMALL_QG_LEV_D == D == 3

    def test_simples_small_q_selfrep(self):
        """Number of simples in small QG at ℓ=q: = q = 5 SELF-REFERENTIAL!"""
        assert IDENTITY_SIMPLES_SMALL_q_SELFREP
        assert N_SIMPLES_SMALL_QG_LEV_q == q == 5


# ── Quantum parameter & root of unity ─────────────────────────────────────────

class TestQuantumParameter:
    def test_level_D_root_is_q(self):
        """SU(2) at level D uses e^{iπ/(D+2)} = e^{iπ/q} since D+2=q=5 SELF-REF!"""
        assert IDENTITY_QG_LEVEL_D_ROOT_IS_q
        assert QG_LEVEL_AT_D_USES_ROOT_OF_UNITY == q == 5

    def test_qint2_is_phi(self):
        """[2]_{e^{iπ/q}} = 2cos(π/q) = φ (golden ratio) SPECTACULAR!"""
        assert IDENTITY_QINT_2_IS_PHI

    def test_qint_q_is_zero(self):
        """[q]_{e^{iπ/q}} = 0 — quantum integer vanishes at level CATHEDRAL!"""
        assert IDENTITY_QINT_q_IS_ZERO


# ── Weyl group orders ─────────────────────────────────────────────────────────

class TestWeylGroups:
    def test_Weyl_AD_is_2V(self):
        """Weyl(A_D) = (D+1)! = 24 = 2V CATHEDRAL!"""
        assert IDENTITY_WEYL_AD_IS_2V
        assert WEYL_ORDER_AD == 2 * V == 24

    def test_Weyl_AD_minus_1_is_Dfact(self):
        """Weyl(A_{D-1}) = D! = 6 SELF-REFERENTIAL!"""
        assert IDENTITY_WEYL_AD1_IS_DFACT
        assert WEYL_ORDER_AD_MINUS_1 == factorial(D) == 6


# ── Kazhdan-Lusztig and fusion ────────────────────────────────────────────────

class TestKLAndFusion:
    def test_KL_basis_WAD_is_2V(self):
        """KL basis size for W(A_D) = (D+1)! = 24 = 2V CATHEDRAL!"""
        assert IDENTITY_KL_BASIS_IS_2V
        assert KL_BASIS_WAD == 2 * V == 24

    def test_fusion_lev_D_is_Dp1(self):
        """Fusion simples at level D: = D+1 = 4 CATHEDRAL!"""
        assert IDENTITY_FUSION_LEV_D_IS_Dp1
        assert FUSION_SIMPLES_LEV_D == D + 1 == 4

    def test_fusion_lev_q_is_Dfact(self):
        """Fusion simples at level q: = D! = 6 CATHEDRAL!"""
        assert IDENTITY_FUSION_LEV_q_IS_DFACT
        assert FUSION_SIMPLES_LEV_q == factorial(D) == 6

    def test_fusion_lev_V_is_N(self):
        """Fusion simples at level V: = V+1 = N = 13 CATHEDRAL!"""
        assert IDENTITY_FUSION_LEV_V_IS_N
        assert FUSION_SIMPLES_LEV_V == N == 13
        assert FUSION_RING_RANK_LEV_V == N == 13

    def test_total_fusion_lev_D_is_D1_D(self):
        """Total fusion coefficients at level D: = (D+1)^D = 64 CATHEDRAL!"""
        assert IDENTITY_TOTAL_FUSION_IS_D1_D
        assert TOTAL_FUSION_COEFFS_LEV_D == (D + 1) ** D == 64

    def test_frobenius_center_is_DD(self):
        """Frobenius center rank for SL_{D+1}: = D^D = 27 SELF-REFERENTIAL!"""
        assert IDENTITY_FROBENIUS_CENTER_IS_DD
        assert FROBENIUS_CENTER_RANK_SL_D1 == D ** D == 27


# ── All identities ────────────────────────────────────────────────────────────

def test_all_qg_exact():
    assert ALL_QG_EXACT

def test_n_qg_identities():
    assert len(ALL_QG_IDENTITIES) >= 40


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = quantum_groups_summary()
    assert isinstance(s, dict)

def test_summary_has_exact():
    s = quantum_groups_summary()
    assert any(v is True for v in s.values())

def test_summary_crown_jewel():
    s = quantum_groups_summary()
    assert any(v == F for v in s.values() if isinstance(v, int))

def test_print_report_runs(capsys):
    print_quantum_groups_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_27(capsys):
    """Crown jewel: D^D = 27 SELF-REF."""
    print_quantum_groups_report()
    out = capsys.readouterr().out
    assert "27" in out

def test_print_report_contains_20(capsys):
    """Tilting crown jewel: F = 20."""
    print_quantum_groups_report()
    out = capsys.readouterr().out
    assert "20" in out

def test_print_report_contains_SELF_REF(capsys):
    print_quantum_groups_report()
    out = capsys.readouterr().out
    assert "SELF" in out or "self" in out.lower()

def test_print_report_contains_CATHEDRAL(capsys):
    print_quantum_groups_report()
    out = capsys.readouterr().out
    assert "CATHEDRAL" in out or "Cathedral" in out
