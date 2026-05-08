"""
Tests for urt/leech_golay_cathedral.py

Covers all IDENTITY_* booleans (must be True), numerical values, formula
derivations, summary functions, and the print report.

~50 tests across 7 test classes.
"""

import pytest
from math import factorial

from urt.shell_closure import DELTA_STAR, D, N, V, E, F, q, G
from urt.leech_golay_cathedral import (
    # Leech lattice
    LEECH_DIM,
    LEECH_KISSING,
    LEECH_KISSING_FORMULA,
    LEECH_J_LINK_BASE,
    LEECH_J_COEFF,
    LEECH_J_CORRECTION,
    IDENTITY_LEECH_KISSING,
    IDENTITY_LEECH_FROM_J,
    # Golay G24
    GOLAY24_LENGTH,
    GOLAY24_DIM,
    GOLAY24_DIST,
    GOLAY24_CODEWORDS,
    IDENTITY_GOLAY24_LENGTH,
    IDENTITY_GOLAY24_DIM,
    IDENTITY_GOLAY24_DIST,
    ALL_GOLAY24_CATHEDRAL,
    # Golay G23
    GOLAY23_LENGTH,
    GOLAY23_DIM,
    GOLAY23_DIST,
    GOLAY23_CODEWORDS,
    GOLAY23_ERROR_CORRECTION,
    IDENTITY_GOLAY23_LENGTH,
    IDENTITY_GOLAY23_DIM,
    IDENTITY_GOLAY23_DIST,
    ALL_GOLAY23_CATHEDRAL,
    # M24
    M24_ORDER,
    M24_PRIME_2_EXP,
    M24_PRIME_3_EXP,
    M24_PRIME_5,
    M24_PRIME_7,
    M24_PRIME_11,
    M24_PRIME_23,
    M24_FORMULA,
    IDENTITY_M24_ORDER,
    IDENTITY_M24_2,
    IDENTITY_M24_3,
    IDENTITY_M24_5,
    IDENTITY_M24_7,
    IDENTITY_M24_11,
    IDENTITY_M24_23,
    # Co1
    CO1_ORDER,
    CO1_2_EXP,
    CO1_3_EXP,
    CO1_5_EXP,
    CO1_7_EXP,
    CO1_11,
    CO1_13,
    CO1_23,
    CO1_FORMULA,
    IDENTITY_CO1_ORDER,
    IDENTITY_CO1_2,
    IDENTITY_CO1_3,
    IDENTITY_CO1_5,
    IDENTITY_CO1_7,
    IDENTITY_CO1_11,
    IDENTITY_CO1_13,
    IDENTITY_CO1_23,
    # E8
    E8_LATTICE_DIM,
    E8_KISSING,
    E8_RANK,
    IDENTITY_E8_LATTICE,
    IDENTITY_E8_KISSING,
    IDENTITY_E8_RANK_IS_q,
    # Ratios
    LEECH_TO_E8_KISSING_RATIO,
    LEECH_KISSING_OVER_N,
    IDENTITY_KISSING_RATIO,
    IDENTITY_LEECH_OVER_N,
    # Cross-connections
    IDENTITY_GOLAY_SHARED_DIM,
    IDENTITY_GOLAY_PUNCTURE,
    IDENTITY_M24_PRIME23_IS_GOLAY23_LENGTH,
    IDENTITY_CO1_PRIME23_IS_GOLAY23_LENGTH,
    # Functions
    leech_lattice_summary,
    golay_code_summary,
    mathieu_m24_summary,
    conway_co1_summary,
    e8_lattice_summary,
    kissing_ratios_summary,
    leech_golay_summary,
    print_leech_golay_report,
)


# ══════════════════════════════════════════════════════════════════════════════
#  1. Leech Lattice Λ₂₄
# ══════════════════════════════════════════════════════════════════════════════

class TestLeechLattice:
    """Leech lattice dimension and kissing number."""

    def test_leech_dim_is_2V(self):
        """Leech lattice dimension = 2V = 24."""
        assert LEECH_DIM == 2 * V
        assert LEECH_DIM == 24

    def test_leech_kissing_known_value(self):
        """Kissing number of Leech lattice is 196560."""
        assert LEECH_KISSING == 196560

    def test_leech_kissing_formula_equals_known(self):
        """Cathedral formula reproduces exact kissing number."""
        assert LEECH_KISSING_FORMULA == 196560

    def test_identity_leech_kissing(self):
        """IDENTITY_LEECH_KISSING is True."""
        assert IDENTITY_LEECH_KISSING is True

    def test_kissing_formula_step_by_step(self):
        """Step-by-step Cathedral factorisation of 196560."""
        assert 2**(D+1) == 16
        assert D**D == 27
        assert q == 5
        assert factorial(D)+1 == 7
        assert N == 13
        assert 16 * 27 * 5 * 7 * 13 == 196560

    def test_leech_j_link_base(self):
        """j-link base = 2D² = 18."""
        assert LEECH_J_LINK_BASE == 2 * D**2
        assert LEECH_J_LINK_BASE == 18

    def test_leech_j_correction(self):
        """j correction = 18² = 324."""
        assert LEECH_J_CORRECTION == 18**2
        assert LEECH_J_CORRECTION == 324

    def test_identity_leech_from_j(self):
        """196884 − 324 = 196560 (j-function link)."""
        assert IDENTITY_LEECH_FROM_J is True
        assert LEECH_J_COEFF - LEECH_J_CORRECTION == LEECH_KISSING

    def test_leech_summary_keys(self):
        """leech_lattice_summary() has expected keys."""
        s = leech_lattice_summary()
        for key in ("dim", "kissing", "kissing_formula_val",
                    "identity_kissing", "identity_from_j"):
            assert key in s

    def test_leech_summary_values(self):
        """leech_lattice_summary() returns correct values."""
        s = leech_lattice_summary()
        assert s["dim"] == 24
        assert s["kissing"] == 196560
        assert s["identity_kissing"] is True
        assert s["identity_from_j"] is True


# ══════════════════════════════════════════════════════════════════════════════
#  2. Extended Golay Code G₂₄  [24, 12, 8]
# ══════════════════════════════════════════════════════════════════════════════

class TestGolay24:
    """Extended binary Golay code G₂₄."""

    def test_length_value(self):
        """G₂₄ length = 24."""
        assert GOLAY24_LENGTH == 24

    def test_length_is_2V(self):
        """G₂₄ length = 2V = 2×12 = 24."""
        assert IDENTITY_GOLAY24_LENGTH is True
        assert GOLAY24_LENGTH == 2 * V

    def test_dim_value(self):
        """G₂₄ dimension = 12."""
        assert GOLAY24_DIM == 12

    def test_dim_is_V(self):
        """G₂₄ dimension = V = 12."""
        assert IDENTITY_GOLAY24_DIM is True
        assert GOLAY24_DIM == V

    def test_dist_value(self):
        """G₂₄ minimum distance = 8."""
        assert GOLAY24_DIST == 8

    def test_dist_is_2D(self):
        """G₂₄ distance = 2^D = 2^3 = 8."""
        assert IDENTITY_GOLAY24_DIST is True
        assert GOLAY24_DIST == 2**D

    def test_all_cathedral(self):
        """ALL_GOLAY24_CATHEDRAL is True."""
        assert ALL_GOLAY24_CATHEDRAL is True

    def test_codewords(self):
        """G₂₄ has 2^12 = 4096 codewords."""
        assert GOLAY24_CODEWORDS == 2**V
        assert GOLAY24_CODEWORDS == 4096

    def test_rate_is_half(self):
        """G₂₄ rate = k/n = 12/24 = 1/2."""
        assert GOLAY24_DIM * 2 == GOLAY24_LENGTH


# ══════════════════════════════════════════════════════════════════════════════
#  3. Perfect Golay Code G₂₃  [23, 12, 7]
# ══════════════════════════════════════════════════════════════════════════════

class TestGolay23:
    """Perfect binary Golay code G₂₃."""

    def test_length_value(self):
        """G₂₃ length = 23."""
        assert GOLAY23_LENGTH == 23

    def test_length_is_2N_minus_3(self):
        """G₂₃ length = 2N − 3 = 2×13 − 3 = 23."""
        assert IDENTITY_GOLAY23_LENGTH is True
        assert GOLAY23_LENGTH == 2 * N - 3

    def test_dim_value(self):
        """G₂₃ dimension = 12."""
        assert GOLAY23_DIM == 12

    def test_dim_is_V(self):
        """G₂₃ dimension = V = 12."""
        assert IDENTITY_GOLAY23_DIM is True
        assert GOLAY23_DIM == V

    def test_dist_value(self):
        """G₂₃ minimum distance = 7."""
        assert GOLAY23_DIST == 7

    def test_dist_is_Dfact_plus_1(self):
        """G₂₃ distance = D! + 1 = 3! + 1 = 7."""
        assert IDENTITY_GOLAY23_DIST is True
        assert GOLAY23_DIST == factorial(D) + 1

    def test_all_cathedral(self):
        """ALL_GOLAY23_CATHEDRAL is True."""
        assert ALL_GOLAY23_CATHEDRAL is True

    def test_error_correction(self):
        """G₂₃ corrects 3 errors: t = (d-1)/2 = 3."""
        assert GOLAY23_ERROR_CORRECTION == 3
        assert GOLAY23_ERROR_CORRECTION == (GOLAY23_DIST - 1) // 2

    def test_codewords(self):
        """G₂₃ has 2^12 = 4096 codewords (same as G₂₄)."""
        assert GOLAY23_CODEWORDS == GOLAY24_CODEWORDS
        assert GOLAY23_CODEWORDS == 4096


# ══════════════════════════════════════════════════════════════════════════════
#  4. Mathieu Group M₂₄
# ══════════════════════════════════════════════════════════════════════════════

class TestMathieuM24:
    """Mathieu group M₂₄ Cathedral factorisation."""

    def test_order_value(self):
        """M₂₄ order is 244823040."""
        assert M24_ORDER == 244_823_040

    def test_identity_m24_order(self):
        """IDENTITY_M24_ORDER is True."""
        assert IDENTITY_M24_ORDER is True
        assert M24_ORDER == M24_FORMULA

    def test_prime_2_exp_is_2q(self):
        """2-adic exponent = 2q = 10."""
        assert IDENTITY_M24_2 is True
        assert M24_PRIME_2_EXP == 2 * q
        assert M24_PRIME_2_EXP == 10

    def test_prime_3_exp_is_D(self):
        """3-adic exponent = D = 3 (factor 3^D = 27)."""
        assert IDENTITY_M24_3 is True
        assert M24_PRIME_3_EXP == D
        assert M24_PRIME_3_EXP == 3

    def test_prime_5_is_q(self):
        """Prime factor 5 = q."""
        assert IDENTITY_M24_5 is True
        assert M24_PRIME_5 == q
        assert M24_PRIME_5 == 5

    def test_prime_7_is_Dfact_plus_1(self):
        """Prime factor 7 = D! + 1."""
        assert IDENTITY_M24_7 is True
        assert M24_PRIME_7 == factorial(D) + 1
        assert M24_PRIME_7 == 7

    def test_prime_11_is_2D_plus_q(self):
        """Prime factor 11 = 2D + q."""
        assert IDENTITY_M24_11 is True
        assert M24_PRIME_11 == 2*D + q
        assert M24_PRIME_11 == 11

    def test_prime_23_is_2N_minus_3(self):
        """Prime factor 23 = 2N − 3."""
        assert IDENTITY_M24_23 is True
        assert M24_PRIME_23 == 2*N - 3
        assert M24_PRIME_23 == 23

    def test_m24_summary(self):
        """mathieu_m24_summary() has correct values and all_cathedral=True."""
        s = mathieu_m24_summary()
        assert s["order"] == 244_823_040
        assert s["identity_order"] is True
        assert s["all_cathedral"] is True
        assert s["prime_2_exp"] == 10
        assert s["prime_11"] == 11
        assert s["prime_23"] == 23


# ══════════════════════════════════════════════════════════════════════════════
#  5. Conway Group Co₁
# ══════════════════════════════════════════════════════════════════════════════

class TestConwayCo1:
    """Conway group Co₁ Cathedral factorisation."""

    def test_order_value(self):
        """Co₁ order is 4157776806543360000."""
        assert CO1_ORDER == 4_157_776_806_543_360_000

    def test_identity_co1_order(self):
        """IDENTITY_CO1_ORDER is True."""
        assert IDENTITY_CO1_ORDER is True
        assert CO1_ORDER == CO1_FORMULA

    def test_prime_2_exp_is_D_times_2D_plus_1(self):
        """2-adic exponent = D(2D+1) = 3×7 = 21."""
        assert IDENTITY_CO1_2 is True
        assert CO1_2_EXP == D * (2*D + 1)
        assert CO1_2_EXP == 21

    def test_prime_3_exp_is_D_squared(self):
        """3-adic exponent = D² = 9."""
        assert IDENTITY_CO1_3 is True
        assert CO1_3_EXP == D**2
        assert CO1_3_EXP == 9

    def test_prime_5_exp_is_D_plus_1(self):
        """5-adic exponent = D+1 = 4."""
        assert IDENTITY_CO1_5 is True
        assert CO1_5_EXP == D + 1
        assert CO1_5_EXP == 4

    def test_prime_7_exp_is_2(self):
        """7-adic exponent = 2."""
        assert IDENTITY_CO1_7 is True
        assert CO1_7_EXP == 2

    def test_prime_11_is_2D_plus_q(self):
        """Prime 11 = 2D + q."""
        assert IDENTITY_CO1_11 is True
        assert CO1_11 == 2*D + q
        assert CO1_11 == 11

    def test_prime_13_is_N(self):
        """Prime 13 = N."""
        assert IDENTITY_CO1_13 is True
        assert CO1_13 == N
        assert CO1_13 == 13

    def test_prime_23_is_2N_minus_3(self):
        """Prime 23 = 2N − 3."""
        assert IDENTITY_CO1_23 is True
        assert CO1_23 == 2*N - 3
        assert CO1_23 == 23

    def test_co1_formula_manual(self):
        """Manual prime factorisation: 2^21·3^9·5^4·7^2·11·13·23."""
        manual = 2**21 * 3**9 * 5**4 * 7**2 * 11 * 13 * 23
        assert CO1_ORDER == manual

    def test_co1_summary(self):
        """conway_co1_summary() correct and all_cathedral=True."""
        s = conway_co1_summary()
        assert s["order"] == CO1_ORDER
        assert s["identity_order"] is True
        assert s["all_cathedral"] is True
        assert s["prime_2_exp"] == 21
        assert s["prime_13"] == 13


# ══════════════════════════════════════════════════════════════════════════════
#  6. E₈ Lattice
# ══════════════════════════════════════════════════════════════════════════════

class TestE8Lattice:
    """E₈ lattice Cathedral identities."""

    def test_e8_dim_is_2D(self):
        """E₈ dimension = 2^D = 8."""
        assert IDENTITY_E8_LATTICE is True
        assert E8_LATTICE_DIM == 2**D
        assert E8_LATTICE_DIM == 8

    def test_e8_kissing_is_2D_times_E(self):
        """E₈ kissing number = 2^D × E = 8×30 = 240."""
        assert IDENTITY_E8_KISSING is True
        assert E8_KISSING == 2**D * E
        assert E8_KISSING == 240

    def test_e8_rank_is_q(self):
        """E₈ rank = 2^D − D = 5 = q."""
        assert IDENTITY_E8_RANK_IS_q is True
        assert E8_RANK == q
        assert E8_RANK == 5

    def test_e8_summary(self):
        """e8_lattice_summary() has correct values."""
        s = e8_lattice_summary()
        assert s["dim"] == 8
        assert s["kissing"] == 240
        assert s["rank"] == 5
        assert s["identity_dim"] is True
        assert s["identity_kissing"] is True
        assert s["identity_rank_q"] is True


# ══════════════════════════════════════════════════════════════════════════════
#  7. Kissing Ratios & Cross-Connections
# ══════════════════════════════════════════════════════════════════════════════

class TestKissingRatiosAndCrossConnections:
    """Ratio and cross-connection identities."""

    def test_leech_to_e8_ratio_value(self):
        """196560 / 240 = 819."""
        assert LEECH_TO_E8_KISSING_RATIO == 819

    def test_leech_to_e8_ratio_cathedral(self):
        """819 = D² × (D!+1) × N = 9×7×13."""
        assert IDENTITY_KISSING_RATIO is True
        assert LEECH_TO_E8_KISSING_RATIO == D**2 * (factorial(D)+1) * N
        assert 9 * 7 * 13 == 819

    def test_leech_over_N_value(self):
        """196560 / 13 = 15120."""
        assert LEECH_KISSING_OVER_N == 15120

    def test_leech_over_N_cathedral(self):
        """15120 = 2^(D+1) × D^D × q × (D!+1) = 16×27×5×7."""
        assert IDENTITY_LEECH_OVER_N is True
        assert LEECH_KISSING_OVER_N == 2**(D+1) * D**D * q * (factorial(D)+1)
        assert 16 * 27 * 5 * 7 == 15120

    def test_golay_shared_dim(self):
        """G₂₄ and G₂₃ share dimension k = V = 12."""
        assert IDENTITY_GOLAY_SHARED_DIM is True
        assert GOLAY24_DIM == GOLAY23_DIM == V

    def test_golay_puncture(self):
        """G₂₄ length − G₂₃ length = 1 (puncturing)."""
        assert IDENTITY_GOLAY_PUNCTURE is True
        assert GOLAY24_LENGTH - GOLAY23_LENGTH == 1

    def test_m24_prime23_is_golay23_length(self):
        """M₂₄ prime factor 23 = G₂₃ length."""
        assert IDENTITY_M24_PRIME23_IS_GOLAY23_LENGTH is True
        assert M24_PRIME_23 == GOLAY23_LENGTH

    def test_co1_prime23_is_golay23_length(self):
        """Co₁ prime factor 23 = G₂₃ length."""
        assert IDENTITY_CO1_PRIME23_IS_GOLAY23_LENGTH is True
        assert CO1_23 == GOLAY23_LENGTH

    def test_kissing_ratios_summary(self):
        """kissing_ratios_summary() has correct values."""
        s = kissing_ratios_summary()
        assert s["leech_kissing"] == 196560
        assert s["e8_kissing"] == 240
        assert s["ratio"] == 819
        assert s["identity_ratio"] is True
        assert s["leech_over_N"] == 15120
        assert s["identity_over_N"] is True


# ══════════════════════════════════════════════════════════════════════════════
#  8. Summary Functions & Print Report
# ══════════════════════════════════════════════════════════════════════════════

class TestSummaryAndReport:
    """Top-level summary and print functions."""

    def test_leech_golay_summary_keys(self):
        """leech_golay_summary() contains all expected sub-dicts."""
        s = leech_golay_summary()
        for key in ("leech", "golay_codes", "mathieu_m24", "conway_co1",
                    "e8", "kissing_ratios", "cathedral_integers", "delta_star"):
            assert key in s

    def test_leech_golay_summary_delta_star(self):
        """delta_star in summary matches shell_closure."""
        s = leech_golay_summary()
        assert abs(s["delta_star"] - DELTA_STAR) < 1e-14

    def test_leech_golay_summary_cathedral_integers(self):
        """Cathedral integers dict has correct values."""
        s = leech_golay_summary()
        ci = s["cathedral_integers"]
        assert ci["D"] == 3
        assert ci["N"] == 13
        assert ci["V"] == 12
        assert ci["E"] == 30
        assert ci["q"] == 5

    def test_golay_code_summary_structure(self):
        """golay_code_summary() has G24 and G23 sub-dicts."""
        s = golay_code_summary()
        assert "G24" in s
        assert "G23" in s
        assert s["G24"]["all_cathedral"] is True
        assert s["G23"]["all_cathedral"] is True
        assert s["shared_dim_identity"] is True
        assert s["puncture_identity"] is True

    def test_print_report_runs(self, capsys):
        """print_leech_golay_report() executes without error."""
        print_leech_golay_report()
        captured = capsys.readouterr()
        out = captured.out
        assert "196560" in out
        assert "Golay" in out or "G₂₄" in out or "G24" in out or "[24" in out
        assert "M₂₄" in out or "M24" in out or "244" in out
        assert "Co₁" in out or "Co1" in out or "819" in out

    def test_print_report_leech_dim(self, capsys):
        """Print report includes Leech dimension 24."""
        print_leech_golay_report()
        captured = capsys.readouterr()
        assert "24" in captured.out

    def test_print_report_delta_star(self, capsys):
        """Print report includes δ★ value."""
        print_leech_golay_report()
        captured = capsys.readouterr()
        assert "0.14751" in captured.out or "δ★" in captured.out
