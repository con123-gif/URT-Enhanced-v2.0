"""Tests for urt/del_pezzo_cathedral.py — del Pezzo surfaces Cathedral."""
import pytest
from math import factorial, comb

from urt.del_pezzo_cathedral import (
    exceptional_curve_count, del_pezzo_anticanonical_sq, del_pezzo_picard,
    beilinson_exceptional_count,
    EXC_D_D, EXC_D_q, EXC_D_DFACT, EXC_D_DFp1, EXC_D_2D,
    KC_D0, KC_D_D, KC_D_q, KC_D_DFACT, KC_D_DFp1,
    RHO_D0, RHO_D_D, RHO_D_q, RHO_D_DFACT, RHO_D_DFp1, RHO_D_2D,
    BEIL_P2, BEIL_P4, BEIL_P11, BEIL_P12,
    K0_RANK_P2, K0_RANK_P4, K0_RANK_P11, K0_RANK_P12,
    H0_TP2, H0_TP4,
    HILB_P2_DEG_D, HILB_P2_DEG_q,
    LINES_CUBIC, NOETHER_CONSTANT,
    IDENTITY_EXC_D_D_IS_DFACT, IDENTITY_EXC_D_DFACT_IS_DD,
    IDENTITY_EXC_D_DFp1_IS_2D_DFp1, IDENTITY_EXC_D_2D_IS_4G,
    IDENTITY_EXC_D_q_IS_2Dp1,
    IDENTITY_KC_D0_IS_Dsq, IDENTITY_KC_D_D_IS_DFACT,
    IDENTITY_KC_D_q_IS_Dp1, IDENTITY_KC_D_DFACT_IS_D,
    IDENTITY_RHO_D_D_IS_Dp1, IDENTITY_RHO_D_q_IS_DFACT,
    IDENTITY_RHO_D_DFACT_IS_DFp1, IDENTITY_RHO_D_DFp1_IS_2D,
    IDENTITY_RHO_D_2D_IS_Dsq,
    IDENTITY_DUALITY_KC_D_EQ_RHO_q, IDENTITY_DUALITY_KC_q_EQ_RHO_D,
    IDENTITY_NOETHER_IS_V, IDENTITY_NOETHER_ALL_K,
    IDENTITY_BEIL_P2_IS_D, IDENTITY_BEIL_P4_IS_q,
    IDENTITY_BEIL_P11_IS_V, IDENTITY_BEIL_P12_IS_N,
    IDENTITY_H0_TP2_IS_2D, IDENTITY_H0_TP4_IS_2V,
    IDENTITY_HILB_P2_D_IS_FLq, IDENTITY_HILB_P2_q_IS_D_DFp1,
    IDENTITY_27_LINES_IS_DD,
    ALL_DEL_PEZZO_IDENTITIES, ALL_DEL_PEZZO_EXACT,
    del_pezzo_summary, print_del_pezzo_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Core formulas ─────────────────────────────────────────────────────────────

class TestCoreFormulas:
    def test_exc_curves_known(self):
        assert exceptional_curve_count(0) == 0
        assert exceptional_curve_count(3) == 6
        assert exceptional_curve_count(6) == 27
        assert exceptional_curve_count(8) == 240

    def test_anticanonical_formula(self):
        assert del_pezzo_anticanonical_sq(0) == 9
        assert del_pezzo_anticanonical_sq(D) == 9 - D

    def test_picard_formula(self):
        assert del_pezzo_picard(0) == 1
        assert del_pezzo_picard(D) == D + 1

    def test_beilinson_formula(self):
        assert beilinson_exceptional_count(1) == 2
        assert beilinson_exceptional_count(D-1) == D


# ── Exceptional curves ────────────────────────────────────────────────────────

class TestExcCurves:
    def test_D_D_is_DFACT(self):
        """del Pezzo D_D: 6 = D! exceptional curves SELF-REFERENTIAL!"""
        assert IDENTITY_EXC_D_D_IS_DFACT
        assert EXC_D_D == factorial(D) == 6

    def test_D_DFACT_is_DD(self):
        """del Pezzo D_{D!}: 27 = D^D — THE FAMOUS 27 LINES ON A CUBIC! CATHEDRAL!"""
        assert IDENTITY_EXC_D_DFACT_IS_DD
        assert EXC_D_DFACT == D**D == 27
        assert LINES_CUBIC == 27

    def test_27_lines_is_DD(self):
        """27 lines on a cubic surface = D^D = D³ CATHEDRAL!!!"""
        assert IDENTITY_27_LINES_IS_DD
        assert LINES_CUBIC == D**D == 27

    def test_D_DFp1_is_2D_DFp1(self):
        """del Pezzo D_{D!+1}: 56 = 2^D×(D!+1) CATHEDRAL!"""
        assert IDENTITY_EXC_D_DFp1_IS_2D_DFp1
        assert EXC_D_DFp1 == 2**D * (factorial(D)+1) == 56

    def test_D_2D_is_4G(self):
        """del Pezzo D_{2^D}: 240 = 4G = E_8 roots CATHEDRAL!"""
        assert IDENTITY_EXC_D_2D_IS_4G
        assert EXC_D_2D == 4 * G == 240

    def test_D_q_is_2Dp1(self):
        """del Pezzo D_q: 16 = 2^{D+1} CATHEDRAL!"""
        assert IDENTITY_EXC_D_q_IS_2Dp1
        assert EXC_D_q == 2**(D+1) == 16


# ── Anti-canonical self-intersection ─────────────────────────────────────────

class TestAnticanonical:
    def test_KC_D0_is_Dsq(self):
        """P^2: (-K)^2 = 9 = D^2 CATHEDRAL!"""
        assert IDENTITY_KC_D0_IS_Dsq
        assert KC_D0 == D**2 == 9

    def test_KC_D_D_is_DFACT(self):
        """del Pezzo D_D: (-K)^2 = 6 = D! CATHEDRAL!"""
        assert IDENTITY_KC_D_D_IS_DFACT
        assert KC_D_D == factorial(D) == 6

    def test_KC_D_q_is_Dp1(self):
        """del Pezzo D_q: (-K)^2 = 4 = D+1 CATHEDRAL!"""
        assert IDENTITY_KC_D_q_IS_Dp1
        assert KC_D_q == D + 1 == 4

    def test_KC_D_DFACT_is_D(self):
        """del Pezzo D_{D!}: (-K)^2 = 3 = D SELF-REFERENTIAL!"""
        assert IDENTITY_KC_D_DFACT_IS_D
        assert KC_D_DFACT == D == 3


# ── Picard numbers ────────────────────────────────────────────────────────────

class TestPicard:
    def test_RHO_D_D_is_Dp1(self):
        """ρ(D_D) = D+1 = 4 CATHEDRAL!"""
        assert IDENTITY_RHO_D_D_IS_Dp1
        assert RHO_D_D == D + 1 == 4

    def test_RHO_D_q_is_DFACT(self):
        """ρ(D_q) = D! = 6 CATHEDRAL!"""
        assert IDENTITY_RHO_D_q_IS_DFACT
        assert RHO_D_q == factorial(D) == 6

    def test_RHO_D_DFACT_is_DFp1(self):
        """ρ(D_{D!}) = D!+1 = 7 CATHEDRAL!"""
        assert IDENTITY_RHO_D_DFACT_IS_DFp1
        assert RHO_D_DFACT == factorial(D)+1 == 7

    def test_RHO_D_DFp1_is_2D(self):
        """ρ(D_{D!+1}) = D!+2 = 8 = 2^D CATHEDRAL!"""
        assert IDENTITY_RHO_D_DFp1_IS_2D
        assert RHO_D_DFp1 == 2**D == 8

    def test_RHO_D_2D_is_Dsq(self):
        """ρ(D_{2^D}) = 2^D+1 = 9 = D^2 CATHEDRAL!"""
        assert IDENTITY_RHO_D_2D_IS_Dsq
        assert RHO_D_2D == D**2 == 9


# ── Duality miracle ───────────────────────────────────────────────────────────

class TestDuality:
    def test_KC_D_equals_RHO_q(self):
        """KC(D_D) = ρ(D_q) = D! = 6 CATHEDRAL MIRROR SYMMETRY!"""
        assert IDENTITY_DUALITY_KC_D_EQ_RHO_q
        assert KC_D_D == RHO_D_q == factorial(D) == 6

    def test_KC_q_equals_RHO_D(self):
        """KC(D_q) = ρ(D_D) = D+1 = 4 CATHEDRAL MIRROR SYMMETRY!"""
        assert IDENTITY_DUALITY_KC_q_EQ_RHO_D
        assert KC_D_q == RHO_D_D == D+1 == 4


# ── Noether's formula ─────────────────────────────────────────────────────────

def test_noether_is_V():
    """Noether: (-K)^2 + χ_top = V = 12 for ALL del Pezzo surfaces CATHEDRAL!"""
    assert IDENTITY_NOETHER_IS_V
    assert NOETHER_CONSTANT == V == 12

def test_noether_all_k():
    """Noether formula holds for all k=0,...,8 del Pezzo surfaces."""
    assert IDENTITY_NOETHER_ALL_K


# ── Beilinson's theorem ───────────────────────────────────────────────────────

class TestBeilinson:
    def test_P2_is_D(self):
        """D^b(Coh(P^2)): D exceptional bundles SELF-REFERENTIAL!"""
        assert IDENTITY_BEIL_P2_IS_D
        assert BEIL_P2 == D == 3

    def test_P4_is_q(self):
        """D^b(Coh(P^4)): q exceptional bundles SELF-REFERENTIAL!"""
        assert IDENTITY_BEIL_P4_IS_q
        assert BEIL_P4 == q == 5

    def test_P11_is_V(self):
        """D^b(Coh(P^11)): V exceptional bundles SELF-REFERENTIAL!"""
        assert IDENTITY_BEIL_P11_IS_V
        assert BEIL_P11 == V == 12

    def test_P12_is_N(self):
        """D^b(Coh(P^12)): N exceptional bundles SELF-REFERENTIAL!"""
        assert IDENTITY_BEIL_P12_IS_N
        assert BEIL_P12 == N == 13


# ── Tangent sheaf and Hilbert series ──────────────────────────────────────────

class TestSheaves:
    def test_H0_TP2_is_2D(self):
        """H^0(T_{P^2}) = D^2-1 = 8 = 2^D CATHEDRAL!"""
        assert IDENTITY_H0_TP2_IS_2D
        assert H0_TP2 == 2**D == 8

    def test_H0_TP4_is_2V(self):
        """H^0(T_{P^4}) = q^2-1 = 24 = 2V CATHEDRAL!"""
        assert IDENTITY_H0_TP4_IS_2V
        assert H0_TP4 == 2 * V == 24

    def test_hilb_P2_deg_D(self):
        """Hilbert fn of P^2 at degree D: C(2D-1,D-1)=10 = dim(Fl(q)) CATHEDRAL!"""
        assert IDENTITY_HILB_P2_D_IS_FLq
        assert HILB_P2_DEG_D == q*(q-1)//2 == 10

    def test_hilb_P2_deg_q(self):
        """Hilbert fn of P^2 at degree q: C(q+D-1,D-1)=21=D×(D!+1) CATHEDRAL!"""
        assert IDENTITY_HILB_P2_q_IS_D_DFp1
        assert HILB_P2_DEG_q == D*(factorial(D)+1) == 21


# ── All identities ────────────────────────────────────────────────────────────

def test_all_del_pezzo_exact():
    assert ALL_DEL_PEZZO_EXACT

def test_n_del_pezzo_identities():
    assert len(ALL_DEL_PEZZO_IDENTITIES) >= 45


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = del_pezzo_summary()
    assert isinstance(s, dict)

def test_summary_has_27(capsys):
    s = del_pezzo_summary()
    assert any(v == 27 for v in s.values() if isinstance(v, int))

def test_print_report_runs(capsys):
    print_del_pezzo_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_27(capsys):
    """The 27 lines on a cubic surface = D^D must appear."""
    print_del_pezzo_report()
    out = capsys.readouterr().out
    assert "27" in out

def test_print_report_contains_240(capsys):
    """E_8 roots = 240 = 4G must appear."""
    print_del_pezzo_report()
    out = capsys.readouterr().out
    assert "240" in out

def test_print_report_contains_CATHEDRAL(capsys):
    print_del_pezzo_report()
    out = capsys.readouterr().out
    assert "CATHEDRAL" in out or "Cathedral" in out

def test_print_report_contains_SELF(capsys):
    print_del_pezzo_report()
    out = capsys.readouterr().out
    assert "SELF" in out or "self" in out.lower()
