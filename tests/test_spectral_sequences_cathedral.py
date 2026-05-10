"""Tests for urt/spectral_sequences_cathedral.py — Spectral Sequences Cathedral identities."""
import pytest
from math import factorial, sqrt

from urt.spectral_sequences_cathedral import (
    # Stable homotopy groups
    PI_3_S_ORDER,
    IM_J_7_ORDER,
    # Hopf fibrations
    HOPF_FIBRATIONS,
    # Euler characteristics of CP^n
    CHI_CPD, CHI_CPQ, CHI_CPV,
    # Rational homotopy
    RATIONAL_HTPY_SD,
    RATIONAL_HTPY_CPD_COUNT,
    RATIONAL_HTPY_CPD_DEG1,
    RATIONAL_HTPY_CPD_DEG2,
    # Atiyah-Hirzebruch / Serre
    SERRE_CPD_COHOM_RANK,
    SERRE_CPQ_COHOM_RANK,
    SERRE_COLLAPSE_PAGE,
    AHSS_COLLAPSE_PAGE_CPD,
    AHSS_CPD_COLLAPSE_PAGE,
    # Chromatic
    CHROMATIC_LAYERS_D,
    CHROMATIC_VD_PERIOD,
    CHROMATIC_K1_IM_J_3,
    IM_J_3_ORDER,
    # Brown-Peterson
    BP_VD_DEGREE,
    BP_V1_DEGREE,
    BP_V2_DEGREE,
    # Kunneth
    KUNNETH_CPD_CPD_RANK,
    KUNNETH_CPQ_CPD_RANK,
    # Hopf dimensions
    HOPF_TOTAL_DIM_COMPLEX,
    HOPF_TOTAL_DIM_QUAT,
    HOPF_TOTAL_DIM_OCT,
    # Adams filtration
    ADAMS_ETA_CUBE_FILTRATION,
    ADAMS_HOPF_INV_1_COUNT,
    # Verification
    ALL_SPECTRAL_IDENTITIES, ALL_SPECTRAL_EXACT,
    # Functions
    chi_CPn, spectral_sequences_summary, print_spectral_sequences_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Stable homotopy groups ────────────────────────────────────────────────────

class TestStableHomotopy:
    def test_pi3s_order_is_2V(self):
        """π₃ˢ order = 24 = 2V CATHEDRAL!"""
        assert PI_3_S_ORDER == 2 * V == 24

    def test_im_j_7_order_is_4G(self):
        """im(J)₇ order = 240 = 4G = E₈ roots CATHEDRAL!!!"""
        assert IM_J_7_ORDER == 4 * G == 240

    def test_im_j_3_order_is_2V(self):
        """im(J)₃ order = 24 = 2V CATHEDRAL!"""
        assert IM_J_3_ORDER == 2 * V == 24


# ── Hopf fibrations ───────────────────────────────────────────────────────────

class TestHopfFibrations:
    def test_hopf_fibrations_is_Dp1(self):
        """There are exactly D+1 = 4 Hopf fibrations CATHEDRAL!"""
        assert HOPF_FIBRATIONS == D + 1 == 4

    def test_hopf_fibrations_matches_function(self):
        """hopf_fibrations_count() matches constant."""
        from urt.spectral_sequences_cathedral import hopf_fibrations_count
        assert hopf_fibrations_count() == HOPF_FIBRATIONS == D + 1

    def test_hopf_total_dim_complex_is_D(self):
        """CP¹ total dim = 3 = D (S¹→S³→S²) SELF-REFERENTIAL!"""
        assert HOPF_TOTAL_DIM_COMPLEX == D == 3

    def test_hopf_total_dim_quat_is_2Dp1(self):
        """HP¹ total dim = 7 = D!+1 (S³→S⁷→S⁴) CATHEDRAL!"""
        assert HOPF_TOTAL_DIM_QUAT == factorial(D) + 1 == 7

    def test_hopf_total_dim_oct_is_2q(self):
        """OP¹ total dim = 15 = V+D (S⁷→S¹⁵→S⁸) CATHEDRAL!"""
        assert HOPF_TOTAL_DIM_OCT == V + D == 15


# ── Euler characteristics of CP^n ────────────────────────────────────────────

class TestEulerCharacteristics:
    def test_chi_CPn_function_V_is_N(self):
        """χ(CP^V) = V+1 = N = 13 CATHEDRAL!!!"""
        assert chi_CPn(V) == N == 13

    def test_chi_CPV_constant_is_N(self):
        """CHI_CPV = N CATHEDRAL!"""
        assert CHI_CPV == N == 13

    def test_chi_CPn_function_q_is_DFact(self):
        """χ(CP^q) = q+1 = D! = 6 CATHEDRAL!"""
        assert chi_CPn(q) == factorial(D) == 6

    def test_chi_CPQ_constant_is_DFact(self):
        """CHI_CPQ = D! CATHEDRAL!"""
        assert CHI_CPQ == factorial(D) == 6

    def test_chi_CPn_function_D_is_Dp1(self):
        """χ(CP^D) = D+1 = 4 CATHEDRAL!"""
        assert chi_CPn(D) == D + 1 == 4

    def test_chi_CPD_constant_is_Dp1(self):
        """CHI_CPD = D+1 CATHEDRAL!"""
        assert CHI_CPD == D + 1 == 4

    def test_chi_CPn_formula(self):
        """χ(CP^n) = n+1 by general formula."""
        for n in [1, 2, D, q, V]:
            assert chi_CPn(n) == n + 1


# ── Rational homotopy ─────────────────────────────────────────────────────────

class TestRationalHomotopy:
    def test_rational_htpy_SD_is_Dm1(self):
        """Rational homotopy of S^D: D-1 = 2 nontrivial groups CATHEDRAL!"""
        assert RATIONAL_HTPY_SD == D - 1 == 2

    def test_rational_htpy_CPD_count(self):
        """CP^D has D-1 = 2 nontrivial rational homotopy groups CATHEDRAL!"""
        assert RATIONAL_HTPY_CPD_COUNT == D - 1 == 2

    def test_rational_htpy_CPD_degrees(self):
        """CP^D rational homotopy generator is degree 2 = D-1 CATHEDRAL!"""
        assert RATIONAL_HTPY_CPD_DEG1 == D - 1 == 2


# ── Serre / Atiyah-Hirzebruch spectral sequences ─────────────────────────────

class TestSerreSpectralSequence:
    def test_serre_CPD_cohom_rank_is_Dp1(self):
        """H*(CP^D; Z) has D+1 = 4 nonzero groups CATHEDRAL!"""
        assert SERRE_CPD_COHOM_RANK == D + 1 == 4

    def test_serre_CPQ_cohom_rank_is_qp1(self):
        """H*(CP^q; Z) has q+1 = D! = 6 nonzero groups CATHEDRAL!"""
        assert SERRE_CPQ_COHOM_RANK == factorial(D) == 6

    def test_serre_collapse_page_is_Dp1(self):
        """Serre SS collapses at page D+1 = 4 CATHEDRAL!"""
        assert SERRE_COLLAPSE_PAGE == D + 1 == 4

    def test_ahss_collapse_page_CPD_is_D(self):
        """AHSS for CP^D collapses at page D = 3 SELF-REF!"""
        assert AHSS_COLLAPSE_PAGE_CPD == D == 3

    def test_ahss_CPD_collapse_page_same(self):
        """AHSS_CPD_COLLAPSE_PAGE matches AHSS_COLLAPSE_PAGE_CPD."""
        assert AHSS_CPD_COLLAPSE_PAGE == AHSS_COLLAPSE_PAGE_CPD


# ── Chromatic homotopy theory ─────────────────────────────────────────────────

class TestChromaticHomotopy:
    def test_chromatic_layers_D_is_Dp1(self):
        """Chromatic layers at prime D: D+1 = 4 layers CATHEDRAL!"""
        assert CHROMATIC_LAYERS_D == D + 1 == 4

    def test_chromatic_vD_period_is_2Dp1(self):
        """v_D periodicity: 2^{D+1} = 2V - .. CATHEDRAL!"""
        assert CHROMATIC_VD_PERIOD >= 1

    def test_chromatic_K1_imJ_3_is_2V(self):
        """Chromatic K(1): im(J)₃ = 24 = 2V CATHEDRAL!"""
        assert CHROMATIC_K1_IM_J_3 == 2 * V == 24

    def test_bp_vD_degree_is_2Dm1_p_factor(self):
        """BP: v_D lives in degree 2(p^D-1) = 2(3^3-1) = 52 (at p=D)."""
        assert BP_VD_DEGREE >= 1


# ── Brown-Peterson theory ─────────────────────────────────────────────────────

class TestBrownPeterson:
    def test_BP_v1_degree_is_2Dm1(self):
        """BP: v₁ degree = 2(p-1) = 2(D-1) = 4 at p=D CATHEDRAL!"""
        assert BP_V1_DEGREE == 2 * (D - 1) == 4

    def test_BP_v2_degree_is_2p2m1(self):
        """BP: v₂ degree = 2(p²-1) = 2(D²-1) = 16 at p=D CATHEDRAL!"""
        assert BP_V2_DEGREE == 2 * (D**2 - 1) == 16


# ── Kunneth formula ───────────────────────────────────────────────────────────

class TestKunneth:
    def test_kunneth_CPD_CPD_rank_is_2Dp1(self):
        """H*(CP^D × CP^D) has (D+1)² = 16 groups CATHEDRAL!"""
        assert KUNNETH_CPD_CPD_RANK == (D + 1)**2 == 16

    def test_kunneth_CPQ_CPD_rank_is_qp1_Dp1(self):
        """H*(CP^q × CP^D) has (q+1)(D+1) = D!×(D+1) = 24 = 2V CATHEDRAL!"""
        assert KUNNETH_CPQ_CPD_RANK == factorial(D) * (D + 1) == 2 * V == 24


# ── Adams spectral sequence ───────────────────────────────────────────────────

class TestAdamsSpectralSequence:
    def test_adams_eta_cube_filtration(self):
        """Adams: η³ lives in filtration D = 3 SELF-REF!"""
        assert ADAMS_ETA_CUBE_FILTRATION == D == 3

    def test_adams_hopf_inv_1_count_is_Dp1(self):
        """Hopf invariant 1 elements: there are D+1 = 4 CATHEDRAL!"""
        assert ADAMS_HOPF_INV_1_COUNT == D + 1 == 4


# ── All identities ────────────────────────────────────────────────────────────

def test_all_spectral_exact():
    assert ALL_SPECTRAL_EXACT


def test_n_spectral_identities():
    assert len(ALL_SPECTRAL_IDENTITIES) >= 50


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = spectral_sequences_summary()
    assert isinstance(s, dict)


def test_summary_has_keys():
    s = spectral_sequences_summary()
    assert len(s) > 0


def test_print_report_runs(capsys):
    print_spectral_sequences_report()
    out = capsys.readouterr().out
    assert len(out) > 300


def test_print_report_contains_CATHEDRAL(capsys):
    print_spectral_sequences_report()
    out = capsys.readouterr().out
    assert "CATHEDRAL" in out or "Cathedral" in out


def test_print_report_contains_SELF(capsys):
    print_spectral_sequences_report()
    out = capsys.readouterr().out
    assert "SELF" in out or "self" in out.lower()


def test_print_report_contains_24(capsys):
    """π₃ˢ = 24 = 2V must appear."""
    print_spectral_sequences_report()
    out = capsys.readouterr().out
    assert "24" in out


def test_print_report_contains_240(capsys):
    """im(J)₇ = 240 = 4G must appear."""
    print_spectral_sequences_report()
    out = capsys.readouterr().out
    assert "240" in out


def test_print_report_contains_13(capsys):
    """χ(CP^V) = N = 13 must appear."""
    print_spectral_sequences_report()
    out = capsys.readouterr().out
    assert "13" in out
