"""
Tests for Exceptional Lie Algebras — Cathedral Framework (v2.9.30)

Covers:
  - Exceptional Lie algebra dimensions (G₂, F₄, E₆, E₇, E₈)
  - Exceptional Lie algebra ranks
  - Total root counts
  - Positive root counts (including self-referential A_D identity)
  - McKay correspondence flags
  - Cartan matrix determinants
  - Classical Lie algebras at D=3 (A₃, B₃, C₃, D₃)
  - Sum/ratio miracles
  - ALL_LIE_EXACT flag
  - Helper functions: lie_dim, lie_rank, lie_roots
  - exceptional_lie_summary dict
  - print_exceptional_lie_report output
"""

import pytest
from math import factorial

from urt.exceptional_lie_cathedral import (
    # Cathedral integers
    D, N, V, E, F, q, G, DFACT, TWO_D, TWO_Q,
    # Dimensions
    DIM_G2, DIM_F4, DIM_E6, DIM_E7, DIM_E8,
    # Ranks
    RANK_G2, RANK_F4, RANK_E6, RANK_E7, RANK_E8,
    # Total roots
    ROOTS_G2, ROOTS_F4, ROOTS_E6, ROOTS_E7, ROOTS_E8,
    # Positive roots
    POS_ROOTS_A_D, POS_ROOTS_G2, POS_ROOTS_F4,
    POS_ROOTS_E6, POS_ROOTS_E7, POS_ROOTS_E8,
    # Classical Lie algebras
    DIM_A_D, RANK_A_D, DIM_B_D, RANK_B_D,
    DIM_C_D, RANK_C_D, DIM_D_D, RANK_D_D,
    D3_ISO_A3, T_Q, DIM_B_D_TRIG,
    # McKay correspondence
    ORDER_BIN_ICO, ORDER_BIN_OCT, ORDER_BIN_TET,
    MCKAY_E8_BINARY_ICO, MCKAY_E7_BINARY_OCT, MCKAY_E6_BINARY_TET,
    MCKAY_A5_IS_E8_HAT, E8_IS_ICOSAHEDRAL_AVATAR,
    # Cartan determinants
    DET_E6, DET_E7, DET_E8, DET_A_D, DET_G2,
    # Sum / ratio miracles
    N_EXCEPTIONAL, SUM_EXCEPTIONAL_RANKS, SUM_EXCEPTIONAL_DIMS,
    E8_F4_ROOTS_RATIO, G2_AD_ROOTS_EQUAL,
    # Identity booleans
    IDENTITY_DIM_G2, IDENTITY_DIM_F4, IDENTITY_DIM_E6,
    IDENTITY_DIM_E7, IDENTITY_DIM_E8,
    IDENTITY_RANK_G2, IDENTITY_RANK_F4, IDENTITY_RANK_E6,
    IDENTITY_RANK_E7, IDENTITY_RANK_E8,
    IDENTITY_ROOTS_G2, IDENTITY_ROOTS_F4, IDENTITY_ROOTS_E6,
    IDENTITY_ROOTS_E7, IDENTITY_ROOTS_E8,
    IDENTITY_POS_ROOTS_AD, IDENTITY_POS_ROOTS_G2,
    IDENTITY_POS_ROOTS_F4, IDENTITY_POS_ROOTS_E6,
    IDENTITY_POS_ROOTS_E7, IDENTITY_POS_ROOTS_E8,
    IDENTITY_BIN_ICO_ORDER, IDENTITY_BIN_OCT_ORDER, IDENTITY_BIN_TET_ORDER,
    IDENTITY_DET_E6, IDENTITY_DET_E7, IDENTITY_DET_E8, IDENTITY_DET_AD,
    IDENTITY_N_EXCEPTIONAL, IDENTITY_SUM_RANKS, IDENTITY_SUM_DIMS,
    IDENTITY_E8_F4_RATIO, IDENTITY_D3_ISO_A3,
    IDENTITY_DIM_A_D, IDENTITY_DIM_B_D, IDENTITY_DIM_D_D,
    IDENTITY_RANK_A_D_SELF_REF,
    # Master
    ALL_LIE_IDENTITIES, ALL_LIE_EXACT,
    # Helpers
    lie_dim, lie_rank, lie_roots,
    # Summary / report
    exceptional_lie_summary, print_exceptional_lie_report,
)


# =============================================================================
# Cathedral integer sanity
# =============================================================================

def test_cathedral_integers():
    """Confirm Cathedral integers match expected values."""
    assert D == 3
    assert N == 13
    assert V == 12
    assert E == 30
    assert F == 20
    assert q == 5
    assert G == 60


def test_derived_scalars():
    assert DFACT == factorial(3)   # = 6
    assert TWO_D == 8
    assert TWO_Q == 32


# =============================================================================
# Exceptional Lie algebra dimensions
# =============================================================================

class TestDimensions:
    def test_dim_g2_equals_14(self):
        assert DIM_G2 == 14

    def test_dim_g2_is_n_plus_1(self):
        assert DIM_G2 == N + 1

    def test_identity_dim_g2(self):
        assert IDENTITY_DIM_G2

    def test_dim_f4_equals_52(self):
        assert DIM_F4 == 52

    def test_dim_f4_is_4n(self):
        assert DIM_F4 == 4 * N

    def test_identity_dim_f4(self):
        assert IDENTITY_DIM_F4

    def test_dim_e6_equals_78(self):
        assert DIM_E6 == 78

    def test_dim_e6_is_n_times_dfact(self):
        assert DIM_E6 == N * factorial(D)

    def test_identity_dim_e6(self):
        assert IDENTITY_DIM_E6

    def test_dim_e7_equals_133(self):
        assert DIM_E7 == 133

    def test_dim_e7_is_7_times_19(self):
        assert DIM_E7 == 7 * 19

    def test_dim_e7_cathedral_formula(self):
        """(D!+1) × 19 = 7 × 19 = 133."""
        assert DIM_E7 == (DFACT + 1) * 19

    def test_identity_dim_e7(self):
        assert IDENTITY_DIM_E7

    def test_dim_e8_equals_248(self):
        assert DIM_E8 == 248

    def test_dim_e8_cathedral_formula(self):
        """2^D × (2^q − 1) = 8 × 31 = 248."""
        assert DIM_E8 == TWO_D * (TWO_Q - 1)

    def test_identity_dim_e8(self):
        assert IDENTITY_DIM_E8

    def test_exceptional_dims_strictly_increasing(self):
        dims = [DIM_G2, DIM_F4, DIM_E6, DIM_E7, DIM_E8]
        for i in range(len(dims) - 1):
            assert dims[i] < dims[i + 1]


# =============================================================================
# Exceptional Lie algebra ranks
# =============================================================================

class TestRanks:
    def test_rank_g2_equals_2(self):
        assert RANK_G2 == 2

    def test_rank_g2_is_d_minus_1(self):
        assert RANK_G2 == D - 1

    def test_identity_rank_g2(self):
        assert IDENTITY_RANK_G2

    def test_rank_f4_equals_4(self):
        assert RANK_F4 == 4

    def test_rank_f4_is_d_plus_1(self):
        assert RANK_F4 == D + 1

    def test_identity_rank_f4(self):
        assert IDENTITY_RANK_F4

    def test_rank_e6_equals_6(self):
        assert RANK_E6 == 6

    def test_rank_e6_is_dfact(self):
        assert RANK_E6 == DFACT

    def test_identity_rank_e6(self):
        assert IDENTITY_RANK_E6

    def test_rank_e7_equals_7(self):
        assert RANK_E7 == 7

    def test_rank_e7_is_dfact_plus_1(self):
        assert RANK_E7 == DFACT + 1

    def test_identity_rank_e7(self):
        assert IDENTITY_RANK_E7

    def test_rank_e8_equals_8(self):
        assert RANK_E8 == 8

    def test_rank_e8_is_2_to_d(self):
        assert RANK_E8 == 2 ** D

    def test_identity_rank_e8(self):
        assert IDENTITY_RANK_E8


# =============================================================================
# Total root counts
# =============================================================================

class TestTotalRoots:
    def test_roots_g2_equals_12(self):
        assert ROOTS_G2 == 12

    def test_roots_g2_is_v(self):
        assert ROOTS_G2 == V

    def test_identity_roots_g2(self):
        assert IDENTITY_ROOTS_G2

    def test_roots_f4_equals_48(self):
        assert ROOTS_F4 == 48

    def test_roots_f4_is_4v(self):
        assert ROOTS_F4 == 4 * V

    def test_identity_roots_f4(self):
        assert IDENTITY_ROOTS_F4

    def test_roots_e6_equals_72(self):
        assert ROOTS_E6 == 72

    def test_roots_e6_is_6v(self):
        assert ROOTS_E6 == 6 * V

    def test_identity_roots_e6(self):
        assert IDENTITY_ROOTS_E6

    def test_roots_e7_equals_126(self):
        """126 is a nuclear magic number."""
        assert ROOTS_E7 == 126

    def test_identity_roots_e7(self):
        assert IDENTITY_ROOTS_E7

    def test_roots_e7_is_twice_positive_roots(self):
        """Total = 2 × positive roots for E₇."""
        assert ROOTS_E7 == 2 * POS_ROOTS_E7

    def test_roots_e8_equals_240(self):
        assert ROOTS_E8 == 240

    def test_roots_e8_is_4g(self):
        assert ROOTS_E8 == 4 * G

    def test_identity_roots_e8(self):
        assert IDENTITY_ROOTS_E8

    def test_roots_e8_plus_rank_is_dim(self):
        """dim(E₈) = roots(E₈) + rank(E₈): 248 = 240 + 8."""
        assert DIM_E8 == ROOTS_E8 + RANK_E8


# =============================================================================
# Positive root counts
# =============================================================================

class TestPositiveRoots:
    def test_pos_roots_ad_equals_6(self):
        assert POS_ROOTS_A_D == 6

    def test_pos_roots_ad_is_dfact(self):
        """A_D = A₃: D(D+1)/2 = 6 = D! — self-referential!"""
        assert POS_ROOTS_A_D == DFACT

    def test_identity_pos_roots_ad(self):
        assert IDENTITY_POS_ROOTS_AD

    def test_pos_roots_ad_formula(self):
        assert POS_ROOTS_A_D == D * (D + 1) // 2

    def test_pos_roots_g2_equals_6(self):
        assert POS_ROOTS_G2 == 6

    def test_pos_roots_g2_is_dfact(self):
        assert POS_ROOTS_G2 == DFACT

    def test_identity_pos_roots_g2(self):
        assert IDENTITY_POS_ROOTS_G2

    def test_pos_roots_f4_equals_24(self):
        assert POS_ROOTS_F4 == 24

    def test_pos_roots_f4_is_2v(self):
        assert POS_ROOTS_F4 == 2 * V

    def test_identity_pos_roots_f4(self):
        assert IDENTITY_POS_ROOTS_F4

    def test_pos_roots_e6_equals_36(self):
        assert POS_ROOTS_E6 == 36

    def test_pos_roots_e6_is_d_times_v(self):
        assert POS_ROOTS_E6 == D * V

    def test_identity_pos_roots_e6(self):
        assert IDENTITY_POS_ROOTS_E6

    def test_pos_roots_e7_equals_63(self):
        assert POS_ROOTS_E7 == 63

    def test_pos_roots_e7_cathedral_formula(self):
        """(D!+1) × D² = 7 × 9 = 63."""
        assert POS_ROOTS_E7 == (DFACT + 1) * D**2

    def test_identity_pos_roots_e7(self):
        assert IDENTITY_POS_ROOTS_E7

    def test_pos_roots_e8_equals_120(self):
        assert POS_ROOTS_E8 == 120

    def test_pos_roots_e8_is_2g(self):
        assert POS_ROOTS_E8 == 2 * G

    def test_identity_pos_roots_e8(self):
        assert IDENTITY_POS_ROOTS_E8

    def test_pos_roots_equal_half_total_for_all(self):
        """Positive roots = total roots / 2 for all five exceptional algebras."""
        assert 2 * POS_ROOTS_G2 == ROOTS_G2
        assert 2 * POS_ROOTS_F4 == ROOTS_F4
        assert 2 * POS_ROOTS_E6 == ROOTS_E6
        assert 2 * POS_ROOTS_E7 == ROOTS_E7
        assert 2 * POS_ROOTS_E8 == ROOTS_E8


# =============================================================================
# McKay correspondence
# =============================================================================

class TestMcKay:
    def test_order_binary_icosahedral(self):
        """Binary icosahedral group has order 2G = 120 = |SL₂(A₅)|."""
        assert ORDER_BIN_ICO == 2 * G
        assert ORDER_BIN_ICO == 120

    def test_identity_bin_ico_order(self):
        assert IDENTITY_BIN_ICO_ORDER

    def test_order_binary_octahedral(self):
        """Binary octahedral group has order 4V = 48."""
        assert ORDER_BIN_OCT == 4 * V
        assert ORDER_BIN_OCT == 48

    def test_identity_bin_oct_order(self):
        assert IDENTITY_BIN_OCT_ORDER

    def test_order_binary_tetrahedral(self):
        """Binary tetrahedral group has order 2V = 24."""
        assert ORDER_BIN_TET == 2 * V
        assert ORDER_BIN_TET == 24

    def test_identity_bin_tet_order(self):
        assert IDENTITY_BIN_TET_ORDER

    def test_mckay_e8_binary_icosahedral(self):
        assert MCKAY_E8_BINARY_ICO is True

    def test_mckay_e7_binary_octahedral(self):
        assert MCKAY_E7_BINARY_OCT is True

    def test_mckay_e6_binary_tetrahedral(self):
        assert MCKAY_E6_BINARY_TET is True

    def test_mckay_a5_is_e8_hat(self):
        """McKay graph of A₅ (icosahedral) = extended Ê₈ Dynkin diagram."""
        assert MCKAY_A5_IS_E8_HAT is True

    def test_e8_is_icosahedral_avatar(self):
        assert E8_IS_ICOSAHEDRAL_AVATAR is True


# =============================================================================
# Cartan matrix determinants
# =============================================================================

class TestCartanDets:
    def test_det_e6_equals_d(self):
        assert DET_E6 == D
        assert DET_E6 == 3

    def test_identity_det_e6(self):
        assert IDENTITY_DET_E6

    def test_det_e7_equals_d_minus_1(self):
        assert DET_E7 == D - 1
        assert DET_E7 == 2

    def test_identity_det_e7(self):
        assert IDENTITY_DET_E7

    def test_det_e8_equals_1(self):
        assert DET_E8 == 1

    def test_identity_det_e8(self):
        assert IDENTITY_DET_E8

    def test_det_ad_equals_d_plus_1(self):
        assert DET_A_D == D + 1
        assert DET_A_D == 4

    def test_identity_det_ad(self):
        assert IDENTITY_DET_AD

    def test_det_g2_equals_1(self):
        assert DET_G2 == 1


# =============================================================================
# Classical Lie algebras at D=3
# =============================================================================

class TestClassicalLie:
    def test_dim_a3_equals_15(self):
        assert DIM_A_D == 15

    def test_dim_a3_is_d_times_d_plus_2(self):
        assert DIM_A_D == D * (D + 2)

    def test_dim_a3_is_v_plus_d(self):
        assert DIM_A_D == V + D

    def test_identity_dim_ad(self):
        assert IDENTITY_DIM_A_D

    def test_rank_a3_equals_d(self):
        """rank(A₃) = D = 3 — self-referential."""
        assert RANK_A_D == D

    def test_identity_rank_ad_self_ref(self):
        assert IDENTITY_RANK_A_D_SELF_REF

    def test_dim_b3_equals_21(self):
        assert DIM_B_D == 21

    def test_dim_b3_is_d_times_2d_plus_1(self):
        assert DIM_B_D == D * (2 * D + 1)

    def test_identity_dim_bd(self):
        assert IDENTITY_DIM_B_D

    def test_dim_b3_trig_formula(self):
        """dim(B₃) = D! + T_q = 6 + 15 = 21."""
        assert DIM_B_D_TRIG == DFACT + T_Q
        assert DIM_B_D_TRIG == 21

    def test_t_q_equals_15(self):
        """T_q = q(q+1)/2 = 15."""
        assert T_Q == q * (q + 1) // 2
        assert T_Q == 15

    def test_dim_c3_equals_21(self):
        assert DIM_C_D == 21

    def test_dim_d3_equals_15(self):
        assert DIM_D_D == 15

    def test_dim_d3_is_d_times_2d_minus_1(self):
        assert DIM_D_D == D * (2 * D - 1)

    def test_dim_d3_is_v_plus_d(self):
        assert DIM_D_D == V + D

    def test_identity_dim_dd(self):
        assert IDENTITY_DIM_D_D

    def test_d3_iso_a3(self):
        """D₃ ≅ A₃ (accidental isomorphism at D=3): same dimension."""
        assert D3_ISO_A3
        assert DIM_D_D == DIM_A_D

    def test_rank_b3_c3_d3_all_equal_d(self):
        assert RANK_B_D == D
        assert RANK_C_D == D
        assert RANK_D_D == D


# =============================================================================
# Sum / ratio miracles
# =============================================================================

class TestSumMiracles:
    def test_n_exceptional_equals_q(self):
        """There are q=5 exceptional Lie algebras: G₂,F₄,E₆,E₇,E₈."""
        assert N_EXCEPTIONAL == q
        assert N_EXCEPTIONAL == 5

    def test_identity_n_exceptional(self):
        assert IDENTITY_N_EXCEPTIONAL

    def test_sum_exceptional_ranks_equals_d_to_d(self):
        """2+4+6+7+8 = 27 = D^D — Cathedral miracle!"""
        assert SUM_EXCEPTIONAL_RANKS == D ** D
        assert SUM_EXCEPTIONAL_RANKS == 27

    def test_identity_sum_ranks(self):
        assert IDENTITY_SUM_RANKS

    def test_sum_exceptional_dims_equals_525(self):
        assert SUM_EXCEPTIONAL_DIMS == 525

    def test_sum_exceptional_dims_cathedral_formula(self):
        """525 = D × q² × (D!+1) = 3 × 25 × 7."""
        assert SUM_EXCEPTIONAL_DIMS == D * q**2 * (DFACT + 1)

    def test_identity_sum_dims(self):
        assert IDENTITY_SUM_DIMS

    def test_e8_f4_roots_ratio_equals_q(self):
        """E₈ roots / F₄ roots = 240/48 = 5 = q."""
        assert E8_F4_ROOTS_RATIO == q
        assert E8_F4_ROOTS_RATIO == 5

    def test_identity_e8_f4_ratio(self):
        assert IDENTITY_E8_F4_RATIO

    def test_g2_ad_roots_equal(self):
        """G₂ and A_D have the same root count (V=12) and positive roots (D!=6)."""
        assert G2_AD_ROOTS_EQUAL

    def test_identity_d3_iso_a3(self):
        assert IDENTITY_D3_ISO_A3


# =============================================================================
# ALL_LIE_EXACT master flag
# =============================================================================

class TestMasterFlag:
    def test_all_lie_exact_is_true(self):
        assert ALL_LIE_EXACT is True

    def test_all_lie_identities_is_dict(self):
        assert isinstance(ALL_LIE_IDENTITIES, dict)

    def test_all_lie_identities_has_30_plus(self):
        assert len(ALL_LIE_IDENTITIES) >= 30

    def test_all_lie_identities_all_true(self):
        false_ids = {k: v for k, v in ALL_LIE_IDENTITIES.items() if not v}
        assert false_ids == {}, f"Failed identities: {false_ids}"

    def test_all_lie_exact_consistent_with_dict(self):
        assert ALL_LIE_EXACT == all(ALL_LIE_IDENTITIES.values())


# =============================================================================
# Helper functions
# =============================================================================

class TestHelpers:
    def test_lie_dim_g2(self):
        assert lie_dim("G2") == 14

    def test_lie_dim_f4(self):
        assert lie_dim("F4") == 52

    def test_lie_dim_e6(self):
        assert lie_dim("E6") == 78

    def test_lie_dim_e7(self):
        assert lie_dim("E7") == 133

    def test_lie_dim_e8(self):
        assert lie_dim("E8") == 248

    def test_lie_dim_a3(self):
        assert lie_dim("A3") == 15

    def test_lie_dim_ad(self):
        assert lie_dim("AD") == 15

    def test_lie_dim_b3(self):
        assert lie_dim("B3") == 21

    def test_lie_dim_c3(self):
        assert lie_dim("C3") == 21

    def test_lie_dim_d3(self):
        assert lie_dim("D3") == 15

    def test_lie_dim_unknown_raises(self):
        with pytest.raises(ValueError):
            lie_dim("X99")

    def test_lie_rank_g2(self):
        assert lie_rank("G2") == 2

    def test_lie_rank_f4(self):
        assert lie_rank("F4") == 4

    def test_lie_rank_e6(self):
        assert lie_rank("E6") == 6

    def test_lie_rank_e7(self):
        assert lie_rank("E7") == 7

    def test_lie_rank_e8(self):
        assert lie_rank("E8") == 8

    def test_lie_rank_a3(self):
        assert lie_rank("A3") == D

    def test_lie_rank_unknown_raises(self):
        with pytest.raises(ValueError):
            lie_rank("Z100")

    def test_lie_roots_g2(self):
        assert lie_roots("G2") == 12

    def test_lie_roots_f4(self):
        assert lie_roots("F4") == 48

    def test_lie_roots_e6(self):
        assert lie_roots("E6") == 72

    def test_lie_roots_e7(self):
        assert lie_roots("E7") == 126

    def test_lie_roots_e8(self):
        assert lie_roots("E8") == 240

    def test_lie_roots_classical_raises(self):
        """Root count not defined for classical algebras in this module."""
        with pytest.raises(ValueError):
            lie_roots("A3")

    def test_lie_roots_unknown_raises(self):
        with pytest.raises(ValueError):
            lie_roots("B3")


# =============================================================================
# Summary dict
# =============================================================================

class TestSummaryDict:
    def setup_method(self):
        self.s = exceptional_lie_summary()

    def test_returns_dict(self):
        assert isinstance(self.s, dict)

    def test_dim_g2(self):
        assert self.s["dim_g2"] == 14

    def test_dim_f4(self):
        assert self.s["dim_f4"] == 52

    def test_dim_e6(self):
        assert self.s["dim_e6"] == 78

    def test_dim_e7(self):
        assert self.s["dim_e7"] == 133

    def test_dim_e8(self):
        assert self.s["dim_e8"] == 248

    def test_roots_e8(self):
        assert self.s["roots_e8"] == 240

    def test_mckay_a5_is_e8_hat(self):
        assert self.s["mckay_a5_is_e8_hat"] is True

    def test_e8_is_icosahedral_avatar(self):
        assert self.s["e8_is_icosahedral_avatar"] is True

    def test_all_lie_exact_in_summary(self):
        assert self.s["all_lie_exact"] is True

    def test_sum_exceptional_ranks(self):
        assert self.s["sum_exceptional_ranks"] == 27

    def test_sum_exceptional_dims(self):
        assert self.s["sum_exceptional_dims"] == 525

    def test_n_exceptional(self):
        assert self.s["n_exceptional"] == q

    def test_order_bin_ico(self):
        assert self.s["order_bin_ico"] == 120

    def test_order_bin_oct(self):
        assert self.s["order_bin_oct"] == 48

    def test_order_bin_tet(self):
        assert self.s["order_bin_tet"] == 24

    def test_pos_roots_ad(self):
        assert self.s["pos_roots_ad"] == DFACT

    def test_pos_roots_e8(self):
        assert self.s["pos_roots_e8"] == 2 * G


# =============================================================================
# Print report
# =============================================================================

class TestPrintReport:
    def test_report_runs(self, capsys):
        print_exceptional_lie_report()
        out = capsys.readouterr().out
        assert len(out) > 300

    def test_report_contains_e8(self, capsys):
        print_exceptional_lie_report()
        out = capsys.readouterr().out
        assert "E₈" in out or "248" in out

    def test_report_contains_icosahedral(self, capsys):
        print_exceptional_lie_report()
        out = capsys.readouterr().out
        assert "icosahedral" in out.lower() or "McKay" in out

    def test_report_contains_all_lie_exact(self, capsys):
        print_exceptional_lie_report()
        out = capsys.readouterr().out
        assert "PASS" in out or "ALL_LIE_EXACT" in out

    def test_report_contains_dim_e6(self, capsys):
        print_exceptional_lie_report()
        out = capsys.readouterr().out
        assert "78" in out

    def test_report_contains_sum_ranks_miracle(self, capsys):
        print_exceptional_lie_report()
        out = capsys.readouterr().out
        assert "27" in out

    def test_report_contains_dim_g2(self, capsys):
        print_exceptional_lie_report()
        out = capsys.readouterr().out
        assert "14" in out

    def test_report_contains_mckay(self, capsys):
        print_exceptional_lie_report()
        out = capsys.readouterr().out
        assert "McKay" in out or "ADE" in out
