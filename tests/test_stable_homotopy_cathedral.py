"""Tests for urt/stable_homotopy_cathedral.py — stable stems & Cathedral integers."""
import pytest
from math import factorial

from urt.stable_homotopy_cathedral import (
    J_IMAGE_PI3, J_IMAGE_PI7, J_IMAGE_PI11, J_IMAGE_PI15, J_IMAGE_PI19,
    IDENTITY_J_PI3, IDENTITY_J_PI7, IDENTITY_J_PI11, IDENTITY_J_PI15, IDENTITY_J_PI19,
    PI1_S_ORDER, PI2_S_ORDER, PI3_S_ORDER, PI4_S_ORDER, PI5_S_ORDER,
    PI6_S_ORDER, PI7_S_ORDER, PI8_S_ORDER, PI10_S_ORDER, PI11_S_ORDER, PI12_S_ORDER,
    IDENTITY_PI1_ORDER, IDENTITY_PI2_ORDER, IDENTITY_PI3_ORDER,
    IDENTITY_PI6_ORDER, IDENTITY_PI7_ORDER, IDENTITY_PI8_ORDER,
    IDENTITY_PI10_ORDER, IDENTITY_PI11_ORDER,
    PI3_2_PRIMARY, PI3_3_PRIMARY,
    IDENTITY_PI3_2PRIMARY, IDENTITY_PI3_3PRIMARY, IDENTITY_PI3_PRODUCT,
    PI11_POWER2_FACTOR, PI11_DPLUS1_FACTOR, PI11_D2_FACTOR,
    IDENTITY_PI11_POWER2, IDENTITY_PI11_DPLUS1, IDENTITY_PI11_D2, IDENTITY_PI11_PRODUCT,
    HOPF_DIMS, N_HOPF_INV1, HOPF_MAX_DIM,
    IDENTITY_HOPF_DIMS_LEN, IDENTITY_HOPF_DIM_1, IDENTITY_HOPF_DIM_2,
    IDENTITY_HOPF_DIM_4, IDENTITY_HOPF_DIM_8, IDENTITY_N_HOPF_INV1,
    EHP_FIBER, EHP_TOTAL, EHP_BASE,
    IDENTITY_EHP_FIBER, IDENTITY_EHP_TOTAL, IDENTITY_EHP_BASE,
    TODA_ALPHA_D_STEM, TODA_ALPHA_D_ORDER, TODA_ALPHA_q_STEM, TODA_ALPHA_q_ORDER,
    ADAMS_OP_q, ADAMS_OP_q_D,
    IDENTITY_ADAMS_OP_q, IDENTITY_ADAMS_OP_qD, IDENTITY_STABLE_RANGE,
    BOTT_PERIOD, KO_N1_ORDER,
    IDENTITY_BOTT_PERIOD, IDENTITY_KO_N1_ORDER,
    CHROMATIC_HEIGHT, IDENTITY_CHROMATIC_HEIGHT,
    FRAMED_COB_D, FRAMED_COB_7,
    IDENTITY_FRAMED_COB_D, IDENTITY_FRAMED_COB_7,
    IDENTITY_KERVAIRE_J1, IDENTITY_KERVAIRE_J2,
    ALL_STABLE_HOM_EXACT,
    stable_homotopy_summary, print_stable_homotopy_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


class TestJImage:
    def test_j_pi3_is_2V(self):
        """Im(J) in π₃^s has order 24 = 2V."""
        assert IDENTITY_J_PI3
        assert J_IMAGE_PI3 == 2 * V == 24

    def test_j_pi7_is_4G(self):
        """Im(J) in π₇^s has order 240 = 4G."""
        assert IDENTITY_J_PI7
        assert J_IMAGE_PI7 == 4 * G == 240

    def test_j_pi11_cathedral(self):
        """Im(J) in π₁₁^s = 504 = 2^D × (D!+1) × D²."""
        assert IDENTITY_J_PI11
        assert J_IMAGE_PI11 == 2**D * (factorial(D)+1) * D**2 == 504

    def test_j_pi15_is_2D_G(self):
        """Im(J) in π₁₅^s = 480 = 2^D × G."""
        assert IDENTITY_J_PI15
        assert J_IMAGE_PI15 == 2**D * G == 480

    def test_j_pi19_cathedral(self):
        """Im(J) in π₁₉^s = 264 = 2^D × D × (2D+q)."""
        assert IDENTITY_J_PI19
        assert J_IMAGE_PI19 == 2**D * D * (2*D+q) == 264

    def test_j_pi3_divisible_by_V(self):
        assert J_IMAGE_PI3 % V == 0

    def test_j_pi7_divisible_by_G(self):
        assert J_IMAGE_PI7 % G == 0


class TestStableStems:
    def test_pi1_is_Dm1(self):
        assert IDENTITY_PI1_ORDER
        assert PI1_S_ORDER == D - 1 == 2

    def test_pi2_is_Dm1(self):
        assert IDENTITY_PI2_ORDER
        assert PI2_S_ORDER == D - 1 == 2

    def test_pi3_is_2V(self):
        """π₃^s = Z/24 = Z/(2V)."""
        assert IDENTITY_PI3_ORDER
        assert PI3_S_ORDER == 2 * V == 24

    def test_trivial_stems(self):
        assert PI4_S_ORDER == 0
        assert PI5_S_ORDER == 0
        assert PI12_S_ORDER == 0

    def test_pi7_is_4G(self):
        """π₇^s = Z/240 = Z/(4G)."""
        assert IDENTITY_PI7_ORDER
        assert PI7_S_ORDER == 4 * G == 240

    def test_pi10_is_Dfact(self):
        assert IDENTITY_PI10_ORDER
        assert PI10_S_ORDER == factorial(D) == 6

    def test_pi11_is_504(self):
        assert IDENTITY_PI11_ORDER
        assert PI11_S_ORDER == 504


class TestPi3Decomposition:
    def test_2primary_is_2D(self):
        """2-primary π₃^s = 8 = 2^D."""
        assert IDENTITY_PI3_2PRIMARY
        assert PI3_2_PRIMARY == 8

    def test_3primary_is_D(self):
        """3-primary π₃^s = 3 = D."""
        assert IDENTITY_PI3_3PRIMARY
        assert PI3_3_PRIMARY == D == 3

    def test_product_is_2V(self):
        """8 × 3 = 24 = 2V."""
        assert IDENTITY_PI3_PRODUCT
        assert PI3_2_PRIMARY * PI3_3_PRIMARY == 2 * V


class TestPi11Decomposition:
    def test_power2_factor(self):
        assert IDENTITY_PI11_POWER2
        assert PI11_POWER2_FACTOR == 2**D == 8

    def test_dplus1_factor(self):
        assert IDENTITY_PI11_DPLUS1
        assert PI11_DPLUS1_FACTOR == factorial(D) + 1 == 7

    def test_d2_factor(self):
        assert IDENTITY_PI11_D2
        assert PI11_D2_FACTOR == D**2 == 9

    def test_product_is_504(self):
        """8 × 7 × 9 = 504: all three factors Cathedral."""
        assert IDENTITY_PI11_PRODUCT
        assert PI11_POWER2_FACTOR * PI11_DPLUS1_FACTOR * PI11_D2_FACTOR == 504


class TestHopfInvariant:
    def test_hopf_dims(self):
        """Hopf inv-1 dims = {D-2,D-1,D+1,2^D} = {1,2,4,8}."""
        assert HOPF_DIMS == [1, 2, 4, 8]

    def test_n_hopf_is_D1(self):
        """Exactly D+1 = 4 Hopf inv-1 elements."""
        assert IDENTITY_N_HOPF_INV1
        assert N_HOPF_INV1 == D + 1 == 4

    def test_hopf_max_is_2D(self):
        assert HOPF_MAX_DIM == 2**D == 8

    def test_hopf_dim_1(self):
        assert IDENTITY_HOPF_DIM_1

    def test_hopf_dim_2(self):
        assert IDENTITY_HOPF_DIM_2

    def test_hopf_dim_4(self):
        assert IDENTITY_HOPF_DIM_4

    def test_hopf_dim_8(self):
        assert IDENTITY_HOPF_DIM_8

    def test_hopf_dims_length(self):
        assert IDENTITY_HOPF_DIMS_LEN
        assert len(HOPF_DIMS) == D + 1


class TestEHP:
    def test_fiber_is_q(self):
        """EHP fiber for n=D: S^{2D-1}=S^5=S^q."""
        assert IDENTITY_EHP_FIBER
        assert EHP_FIBER == q == 5

    def test_total_is_D(self):
        assert IDENTITY_EHP_TOTAL
        assert EHP_TOTAL == D

    def test_base_is_Dm1(self):
        assert IDENTITY_EHP_BASE
        assert EHP_BASE == D - 1


class TestTodaAlpha:
    def test_D_stem(self):
        assert TODA_ALPHA_D_STEM == D == 3

    def test_D_order(self):
        assert TODA_ALPHA_D_ORDER == D == 3

    def test_q_stem(self):
        """α₁ at p=q lives in π_{D!+1}^s = π_7^s."""
        assert TODA_ALPHA_q_STEM == factorial(D) + 1 == 7

    def test_q_order(self):
        assert TODA_ALPHA_q_ORDER == q == 5


class TestAdamsAndBott:
    def test_adams_op_q(self):
        assert IDENTITY_ADAMS_OP_q
        assert ADAMS_OP_q == q

    def test_adams_op_qD(self):
        assert IDENTITY_ADAMS_OP_qD
        assert ADAMS_OP_q_D == q**D == 125

    def test_stable_range(self):
        assert IDENTITY_STABLE_RANGE

    def test_bott_period(self):
        assert IDENTITY_BOTT_PERIOD
        assert BOTT_PERIOD == 2**D == 8

    def test_ko_n1_order(self):
        assert IDENTITY_KO_N1_ORDER
        assert KO_N1_ORDER == D - 1 == 2


class TestFramedCobordism:
    def test_framed_D_is_2V(self):
        """Ω^fr_3 ≅ Z/24 = Z/(2V)."""
        assert IDENTITY_FRAMED_COB_D
        assert FRAMED_COB_D == 2 * V == 24

    def test_framed_7_is_4G(self):
        """Ω^fr_7 ≅ Z/240 = Z/(4G)."""
        assert IDENTITY_FRAMED_COB_7
        assert FRAMED_COB_7 == 4 * G == 240


def test_kervaire_identities():
    assert IDENTITY_KERVAIRE_J1
    assert IDENTITY_KERVAIRE_J2

def test_chromatic_height():
    assert IDENTITY_CHROMATIC_HEIGHT
    assert CHROMATIC_HEIGHT == D - 1 == 2

def test_all_stable_hom_exact():
    assert ALL_STABLE_HOM_EXACT


def test_summary_is_dict():
    s = stable_homotopy_summary()
    assert isinstance(s, dict)

def test_summary_pi3():
    s = stable_homotopy_summary()
    assert s["pi3_order"] == 24

def test_summary_pi7():
    s = stable_homotopy_summary()
    assert s["pi7_order"] == 240

def test_print_report_runs(capsys):
    print_stable_homotopy_report()
    out = capsys.readouterr().out
    assert len(out) > 200

def test_print_report_240(capsys):
    print_stable_homotopy_report()
    assert "240" in capsys.readouterr().out

def test_print_report_504(capsys):
    print_stable_homotopy_report()
    assert "504" in capsys.readouterr().out

def test_print_report_hopf(capsys):
    print_stable_homotopy_report()
    out = capsys.readouterr().out
    assert "Hopf" in out or "hopf" in out.lower() or "1, 2, 4, 8" in out
