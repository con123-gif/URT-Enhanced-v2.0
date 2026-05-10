"""Tests for urt/freudenthal_magic_square_cathedral.py — Freudenthal magic square."""
import pytest
from math import factorial, comb

from urt.freudenthal_magic_square_cathedral import (
    DIM_R, DIM_C, DIM_H, DIM_O, N_NDA_MAGIC,
    IDENTITY_DIM_C_IS_D_MINUS_1, IDENTITY_DIM_H_IS_D_PLUS_1,
    IDENTITY_DIM_O_IS_2_TO_D, IDENTITY_N_NDA_IS_D_PLUS_1,
    M_RR, M_RC, M_RH, M_RO,
    M_CC, M_CH, M_CO,
    M_HH, M_HO, M_OO,
    RANK_RR, RANK_RC, RANK_RH, RANK_RO,
    RANK_CC, RANK_CH, RANK_CO, RANK_HH, RANK_HO, RANK_OO,
    ROW_R_SUM, ROW_C_SUM, ROW_H_SUM, ROW_O_SUM,
    MAGIC_MATRIX_SUM, FIB_N_PLUS_D,
    MAGIC_UNIQUE_SUM, PSL_2_11_ORDER,
    MAGIC_DIAGONAL_SUM, MAGIC_OFF_DIAG_SUM,
    IDENTITY_M_RR_IS_D, IDENTITY_M_RC_IS_2D,
    IDENTITY_M_RH_IS_D_TIMES_D_FACT1, IDENTITY_M_RO_IS_4N,
    IDENTITY_M_CC_IS_N_PLUS_D, IDENTITY_M_CC_IS_2_TO_D1,
    IDENTITY_M_CH_IS_E_PLUS_q, IDENTITY_M_CO_IS_DFACT_N,
    IDENTITY_M_HH_IS_COMB_V_2, IDENTITY_M_HO_IS_N_SQ_MINUS_VD,
    IDENTITY_M_OO_IS_2D_2Q_1,
    IDENTITY_RANK_CH_IS_q, IDENTITY_RANK_CO_IS_DFACT,
    IDENTITY_RANK_HO_IS_DFACT1, IDENTITY_RANK_OO_IS_2D,
    IDENTITY_ROW_R_IS_DFACT_N1, IDENTITY_ROW_C_IS_BARE_ALPHA,
    IDENTITY_ROW_H_IS_D_q_N1, IDENTITY_ROW_O_IS_2_D2_MINUS_1,
    IDENTITY_MAGIC_SUM_IS_FIB_ND, IDENTITY_UNIQUE_SUM_IS_PSL211,
    IDENTITY_A5_DIM_IS_E_PLUS_q, IDENTITY_A5_RANK_IS_q,
    IDENTITY_E8_RANK_IS_2D,
    ALL_MAGIC_IDENTITIES, ALL_MAGIC_EXACT, N_MAGIC_IDENTITIES,
    magic_square_matrix, magic_summary, print_magic_report,
    A5_IN_MAGIC, E8_DIM_MAGIC, E8_RANK_MAGIC,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Division algebra input dimensions ────────────────────────────────────────

class TestDivisionAlgebraDims:
    def test_dim_R_is_1(self):
        assert DIM_R == 1

    def test_dim_C_is_D_minus_1(self):
        assert IDENTITY_DIM_C_IS_D_MINUS_1
        assert DIM_C == D - 1 == 2

    def test_dim_H_is_D_plus_1(self):
        assert IDENTITY_DIM_H_IS_D_PLUS_1
        assert DIM_H == D + 1 == 4

    def test_dim_O_is_2_to_D(self):
        assert IDENTITY_DIM_O_IS_2_TO_D
        assert DIM_O == 2**D == 8

    def test_N_NDA_is_D_plus_1(self):
        assert IDENTITY_N_NDA_IS_D_PLUS_1
        assert N_NDA_MAGIC == D + 1 == 4

    def test_dims_are_powers_of_2(self):
        for d in [DIM_R, DIM_C, DIM_H, DIM_O]:
            assert d > 0 and (d & (d - 1)) == 0


# ── Individual magic square entry identities ──────────────────────────────────

class TestMagicEntries:
    def test_M_RR_is_D(self):
        assert IDENTITY_M_RR_IS_D
        assert M_RR == D == 3

    def test_M_RC_is_2_to_D(self):
        assert IDENTITY_M_RC_IS_2D
        assert M_RC == 2**D == 8

    def test_M_RH_is_D_times_Dfact1(self):
        assert IDENTITY_M_RH_IS_D_TIMES_D_FACT1
        assert M_RH == D * (factorial(D) + 1) == 21

    def test_M_RO_is_4N(self):
        assert IDENTITY_M_RO_IS_4N
        assert M_RO == 4 * N == 52

    def test_M_CC_is_N_plus_D(self):
        assert IDENTITY_M_CC_IS_N_PLUS_D
        assert M_CC == N + D == 16

    def test_M_CC_is_2_to_D_plus_1(self):
        assert IDENTITY_M_CC_IS_2_TO_D1
        assert M_CC == 2**(D + 1) == 16

    def test_M_CH_is_E_plus_q(self):
        """M(C,H) = A₅ = E+q = ARF denominator D35."""
        assert IDENTITY_M_CH_IS_E_PLUS_q
        assert M_CH == E + q == 35

    def test_M_CO_is_Dfact_N(self):
        assert IDENTITY_M_CO_IS_DFACT_N
        assert M_CO == factorial(D) * N == 78

    def test_M_HH_is_comb_V_2(self):
        assert IDENTITY_M_HH_IS_COMB_V_2
        assert M_HH == comb(V, 2) == 66

    def test_M_HO_is_N_sq_minus_VD(self):
        assert IDENTITY_M_HO_IS_N_SQ_MINUS_VD
        assert M_HO == N**2 - V * D == 133

    def test_M_OO_is_2D_times_2q_minus_1(self):
        """E₈ dimension."""
        assert IDENTITY_M_OO_IS_2D_2Q_1
        assert M_OO == 2**D * (2**q - 1) == 248


# ── Euler-characteristic / rank identities ────────────────────────────────────

class TestRanks:
    def test_rank_CH_is_q(self):
        """A₅ rank = q = 5."""
        assert IDENTITY_RANK_CH_IS_q
        assert RANK_CH == q == 5

    def test_rank_CO_is_Dfact(self):
        """E₆ rank = D! = 6."""
        assert IDENTITY_RANK_CO_IS_DFACT
        assert RANK_CO == factorial(D) == 6

    def test_rank_HO_is_Dfact1(self):
        """E₇ rank = D!+1 = 7."""
        assert IDENTITY_RANK_HO_IS_DFACT1
        assert RANK_HO == factorial(D) + 1 == 7

    def test_rank_OO_is_2D(self):
        """E₈ rank = 2^D = 8."""
        assert IDENTITY_RANK_OO_IS_2D
        assert RANK_OO == 2**D == 8

    def test_rank_sequence(self):
        """Ranks grow monotonically across the diagonal."""
        diag_ranks = [RANK_RR, RANK_CC, RANK_HH, RANK_OO]
        assert diag_ranks == [1, D + 1, factorial(D), 2**D]


# ── Row sums — the Cathedral miracle ─────────────────────────────────────────

class TestRowSums:
    def test_row_R_is_Dfact_times_N1(self):
        assert IDENTITY_ROW_R_IS_DFACT_N1
        assert ROW_R_SUM == factorial(D) * (N + 1) == 84

    def test_row_C_is_137_BARE_ALPHA(self):
        """THE CROWN JEWEL: C-row sum = N²−E−(D−1) = 137 = bare 1/α."""
        assert IDENTITY_ROW_C_IS_BARE_ALPHA
        assert ROW_C_SUM == N**2 - E - (D - 1) == 137

    def test_row_C_arithmetic(self):
        """Verify: 8 + 16 + 35 + 78 = 137."""
        assert M_RC + M_CC + M_CH + M_CO == 137

    def test_row_H_is_D_q_N_plus_D_plus_1(self):
        assert IDENTITY_ROW_H_IS_D_q_N1
        assert ROW_H_SUM == D * q * (N + D + 1) == 255

    def test_row_O_is_2_to_D_sq_minus_1(self):
        assert IDENTITY_ROW_O_IS_2_D2_MINUS_1
        assert ROW_O_SUM == 2**(D**2) - 1 == 511

    def test_row_sums_values(self):
        assert [ROW_R_SUM, ROW_C_SUM, ROW_H_SUM, ROW_O_SUM] == [84, 137, 255, 511]


# ── Total matrix sum = F_{N+D} ────────────────────────────────────────────────

class TestMatrixSum:
    def test_magic_matrix_sum_is_987(self):
        assert MAGIC_MATRIX_SUM == 987

    def test_FIB_N_plus_D_is_987(self):
        """F_{16} = F_{N+D} = 987 — Fibonacci miracle."""
        assert FIB_N_PLUS_D == 987
        assert N + D == 16

    def test_matrix_sum_is_fib_ND(self):
        assert IDENTITY_MAGIC_SUM_IS_FIB_ND
        assert MAGIC_MATRIX_SUM == FIB_N_PLUS_D

    def test_matrix_sum_is_row_total(self):
        assert MAGIC_MATRIX_SUM == ROW_R_SUM + ROW_C_SUM + ROW_H_SUM + ROW_O_SUM

    def test_unique_sum_is_PSL_2_11(self):
        """10 unique entries sum to |PSL(2,11)| = 660."""
        assert IDENTITY_UNIQUE_SUM_IS_PSL211
        assert MAGIC_UNIQUE_SUM == PSL_2_11_ORDER == 660

    def test_diagonal_plus_off_diagonal(self):
        """Full matrix = diagonal + 2×off_diagonal."""
        assert MAGIC_DIAGONAL_SUM + 2 * MAGIC_OFF_DIAG_SUM == MAGIC_MATRIX_SUM


# ── A₅ and E₈ special entries ────────────────────────────────────────────────

class TestSpecialEntries:
    def test_A5_is_in_magic_square(self):
        """A₅ = M(C,H) — the icosahedral symmetry group appears in the magic square."""
        assert IDENTITY_A5_DIM_IS_E_PLUS_q
        assert A5_IN_MAGIC == E + q == 35

    def test_A5_rank_is_q(self):
        assert IDENTITY_A5_RANK_IS_q
        assert RANK_CH == q == 5

    def test_E8_rank_is_2D(self):
        assert IDENTITY_E8_RANK_IS_2D
        assert E8_RANK_MAGIC == 2**D == 8

    def test_E8_dim_is_248(self):
        assert E8_DIM_MAGIC == 248

    def test_symmetry(self):
        """Magic square is symmetric: M(A,B) = M(B,A)."""
        mat = magic_square_matrix()
        for i in range(4):
            for j in range(4):
                assert mat[i][j] == mat[j][i]


# ── Matrix structure ──────────────────────────────────────────────────────────

class TestMatrixStructure:
    def test_matrix_shape(self):
        mat = magic_square_matrix()
        assert len(mat) == 4
        assert all(len(row) == 4 for row in mat)

    def test_matrix_diagonal(self):
        mat = magic_square_matrix()
        assert [mat[i][i] for i in range(4)] == [M_RR, M_CC, M_HH, M_OO]
        assert [mat[i][i] for i in range(4)] == [3, 16, 66, 248]

    def test_matrix_row_C(self):
        mat = magic_square_matrix()
        assert mat[1] == [M_RC, M_CC, M_CH, M_CO]
        assert sum(mat[1]) == 137

    def test_all_entries_positive(self):
        mat = magic_square_matrix()
        assert all(x > 0 for row in mat for x in row)

    def test_entries_strictly_increasing_on_antidiag(self):
        """Dimensions grow toward E₈ corner."""
        assert M_RR < M_CC < M_HH < M_OO


# ── All identities ────────────────────────────────────────────────────────────

def test_all_magic_exact():
    assert ALL_MAGIC_EXACT

def test_n_magic_identities():
    assert N_MAGIC_IDENTITIES == len(ALL_MAGIC_IDENTITIES)
    assert N_MAGIC_IDENTITIES >= 25


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = magic_summary()
    assert isinstance(s, dict)

def test_summary_row_C():
    s = magic_summary()
    assert s["row_C_sum"] == 137
    assert s["row_C_is_137"] is True

def test_summary_matrix_total():
    s = magic_summary()
    assert s["matrix_total"] == 987
    assert s["matrix_total_is_F16"] is True

def test_summary_all_exact():
    s = magic_summary()
    assert s["all_magic_exact"] is True

def test_print_report_runs(capsys):
    print_magic_report()
    out = capsys.readouterr().out
    assert len(out) > 400

def test_print_report_contains_137(capsys):
    print_magic_report()
    out = capsys.readouterr().out
    assert "137" in out

def test_print_report_contains_987(capsys):
    print_magic_report()
    out = capsys.readouterr().out
    assert "987" in out

def test_print_report_contains_CATHEDRAL(capsys):
    print_magic_report()
    out = capsys.readouterr().out
    assert "CATHEDRAL" in out or "1/α" in out or "alpha" in out.lower()

def test_print_report_contains_F16(capsys):
    print_magic_report()
    out = capsys.readouterr().out
    assert "F_16" in out or "F_{16}" in out or "Fibonacci" in out
