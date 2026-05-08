"""Tests for urt/exceptional_structures_cathedral.py

All identities are exact integer arithmetic — no tolerances needed.
Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.
"""

import pytest
from math import factorial

from urt.shell_closure import D, N, V, E, F, q, G, DELTA_STAR

from urt.exceptional_structures_cathedral import (
    # Normed division algebras
    NORMED_DIV_DIMS,
    NDA_DIM_R,
    NDA_DIM_C,
    NDA_DIM_H,
    NDA_DIM_O,
    PRODUCT_DIV_DIMS,
    SUM_DIV_DIMS,
    IDENTITY_PRODUCT_IS_CC_EXP,
    IDENTITY_SUM_IS_TQ,
    IDENTITY_SUM_TQ_TRIANGULAR,
    IDENTITY_NDA_C_IS_D_MINUS_1,
    IDENTITY_NDA_H_IS_D_PLUS_1,
    IDENTITY_NDA_O_IS_2_POW_D,
    # Fano plane
    FANO_POINTS,
    FANO_LINES,
    FANO_PTS_PER_LINE,
    FANO_LINES_THRU_PT,
    FANO_AUT_ORDER,
    IDENTITY_FANO_POINTS,
    IDENTITY_FANO_LINES,
    IDENTITY_FANO_PTS_PER_LINE,
    IDENTITY_FANO_AUT_ORDER,
    # Octonions
    OCT_DIM,
    OCT_IMAG_DIM,
    G2_DIM,
    OCT_MULT_TABLES,
    D4_DIM,
    TRIALITY_DIM,
    IDENTITY_DIM_OCT,
    IDENTITY_DIM_OCT_IMAG,
    IDENTITY_DIM_G2,
    IDENTITY_OCT_MULT_TABLES,
    IDENTITY_FANO_IS_IMAG_OCT,
    IDENTITY_D4_DIM,
    IDENTITY_TRIALITY,
    # Albert algebra
    ALBERT_DIM,
    ALBERT_DIAGONAL,
    ALBERT_OFFDIAG,
    F4_DIM,
    E6_DIM,
    IDENTITY_ALBERT,
    IDENTITY_ALBERT_DECOMP,
    IDENTITY_ALBERT_DIAG_IS_D,
    IDENTITY_ALBERT_OFFDIAG,
    IDENTITY_F4_DIM,
    IDENTITY_E6_DIM,
    # Magic square
    E8_MS_DIM,
    E7_MS_DIM,
    E6_MS_DIM,
    F4_MS_DIM,
    D4_MS_DIM,
    A2_MS_DIM,
    MAGIC_SQUARE_DIMS,
    ALL_MAGIC_CATHEDRAL,
    IDENTITY_MS_E8,
    IDENTITY_MS_E7,
    IDENTITY_MS_E6,
    IDENTITY_MS_F4,
    IDENTITY_MS_D4,
    IDENTITY_MS_A2,
    # E8 root decomposition
    ROOTS_D8_SECTOR,
    ROOTS_SPINOR_SECTOR,
    E8_TOTAL_ROOTS,
    IDENTITY_ROOTS_D8,
    IDENTITY_ROOTS_SPINOR,
    IDENTITY_ROOTS_TOTAL,
    IDENTITY_ROOTS_SUM,
    # String dimensions
    MTHEORY_DIM,
    FTHEORY_DIM,
    IDENTITY_MTHEORY,
    IDENTITY_FTHEORY,
    # Functions
    normed_division_algebras,
    fano_plane,
    octonions,
    albert_algebra,
    magic_square,
    e8_root_decomposition,
    string_m_theory_dims,
    exceptional_structures_summary,
    print_exceptional_report,
    _ALL_IDENTITIES,
)


# ═══════════════════════════════════════════════════════════════════════════════
# 1. Normed Division Algebras
# ═══════════════════════════════════════════════════════════════════════════════

class TestNormedDivisionAlgebras:

    def test_four_dims_list(self):
        """Frobenius-Hurwitz gives exactly {1, 2, 4, 8}."""
        assert NORMED_DIV_DIMS == [1, 2, 4, 8]

    def test_nda_r_is_1(self):
        """dim(ℝ) = 1."""
        assert NDA_DIM_R == 1

    def test_nda_c_is_2(self):
        """dim(ℂ) = 2 = D−1."""
        assert NDA_DIM_C == 2

    def test_nda_h_is_4(self):
        """dim(ℍ) = 4 = D+1."""
        assert NDA_DIM_H == 4

    def test_nda_o_is_8(self):
        """dim(𝕆) = 8 = 2^D."""
        assert NDA_DIM_O == 8

    def test_nda_c_is_d_minus_1(self):
        """dim(ℂ) = D−1 = 2."""
        assert NDA_DIM_C == D - 1
        assert IDENTITY_NDA_C_IS_D_MINUS_1 is True

    def test_nda_h_is_d_plus_1(self):
        """dim(ℍ) = D+1 = 4."""
        assert NDA_DIM_H == D + 1
        assert IDENTITY_NDA_H_IS_D_PLUS_1 is True

    def test_nda_o_is_2_pow_d(self):
        """dim(𝕆) = 2^D = 8."""
        assert NDA_DIM_O == 2 ** D
        assert IDENTITY_NDA_O_IS_2_POW_D is True

    def test_product_is_64(self):
        """1 × 2 × 4 × 8 = 64."""
        assert PRODUCT_DIV_DIMS == 64

    def test_product_is_cc_exponent(self):
        """Product 64 = (D+1)^D — cosmological constant exponent."""
        assert PRODUCT_DIV_DIMS == (D + 1) ** D
        assert IDENTITY_PRODUCT_IS_CC_EXP is True

    def test_sum_is_15(self):
        """1 + 2 + 4 + 8 = 15."""
        assert SUM_DIV_DIMS == 15

    def test_sum_is_v_plus_d(self):
        """Sum = 15 = V+D = 12+3."""
        assert SUM_DIV_DIMS == V + D
        assert IDENTITY_SUM_IS_TQ is True

    def test_sum_is_triangular_q(self):
        """Sum = 15 = T_q = q(q+1)/2 = 5×6/2."""
        assert SUM_DIV_DIMS == q * (q + 1) // 2
        assert IDENTITY_SUM_TQ_TRIANGULAR is True

    def test_normed_div_algebras_function(self):
        """normed_division_algebras() returns correct values."""
        d = normed_division_algebras()
        assert d["product"] == 64
        assert d["sum"] == 15
        assert d["identity_product"] is True
        assert d["identity_sum"] is True
        assert d["identity_nda_C"] is True
        assert d["identity_nda_H"] is True
        assert d["identity_nda_O"] is True


# ═══════════════════════════════════════════════════════════════════════════════
# 2. Fano Plane
# ═══════════════════════════════════════════════════════════════════════════════

class TestFanoPlane:

    def test_fano_points_is_7(self):
        """Fano plane has 7 points."""
        assert FANO_POINTS == 7

    def test_fano_points_is_d_factorial_plus_1(self):
        """7 = D!+1 = 3!+1 = 7."""
        assert FANO_POINTS == factorial(D) + 1
        assert IDENTITY_FANO_POINTS is True

    def test_fano_lines_is_7(self):
        """Fano plane has 7 lines."""
        assert FANO_LINES == 7

    def test_fano_lines_is_d_factorial_plus_1(self):
        """7 = D!+1."""
        assert FANO_LINES == factorial(D) + 1
        assert IDENTITY_FANO_LINES is True

    def test_fano_pts_per_line_is_d(self):
        """3 points per line = D."""
        assert FANO_PTS_PER_LINE == D
        assert FANO_LINES_THRU_PT == D
        assert IDENTITY_FANO_PTS_PER_LINE is True

    def test_fano_aut_order_is_168(self):
        """Automorphism group has order 168."""
        assert FANO_AUT_ORDER == 168

    def test_fano_aut_cathedral_formula(self):
        """168 = 2^D × D × (D!+1) = 8×3×7."""
        assert FANO_AUT_ORDER == 2 ** D * D * (factorial(D) + 1)
        assert IDENTITY_FANO_AUT_ORDER is True

    def test_fano_plane_function(self):
        """fano_plane() dict is self-consistent."""
        d = fano_plane()
        assert d["points"] == 7
        assert d["aut_order"] == 168
        assert d["identity_points"] is True
        assert d["identity_aut"] is True


# ═══════════════════════════════════════════════════════════════════════════════
# 3. Octonions
# ═══════════════════════════════════════════════════════════════════════════════

class TestOctonions:

    def test_oct_dim_is_8(self):
        """dim(𝕆) = 8."""
        assert OCT_DIM == 8

    def test_oct_dim_is_2_pow_d(self):
        """dim(𝕆) = 2^D."""
        assert OCT_DIM == 2 ** D
        assert IDENTITY_DIM_OCT is True

    def test_oct_imag_dim_is_7(self):
        """Imaginary octonions have dimension 7 = D!+1."""
        assert OCT_IMAG_DIM == 7
        assert OCT_IMAG_DIM == factorial(D) + 1
        assert IDENTITY_DIM_OCT_IMAG is True

    def test_g2_dim_is_14(self):
        """dim(G₂) = Aut(𝕆) = 14 = N+1."""
        assert G2_DIM == 14

    def test_g2_dim_is_n_plus_1(self):
        """dim(G₂) = N+1 = 13+1 = 14."""
        assert G2_DIM == N + 1
        assert IDENTITY_DIM_G2 is True

    def test_oct_mult_tables_is_480(self):
        """Number of distinct octonion multiplication tables = 480."""
        assert OCT_MULT_TABLES == 480

    def test_oct_mult_tables_is_2d_times_g(self):
        """480 = 2^D × G = 8×60."""
        assert OCT_MULT_TABLES == 2 ** D * G
        assert IDENTITY_OCT_MULT_TABLES is True

    def test_fano_equals_imag_oct(self):
        """Fano points = imaginary octonion dim = 7."""
        assert FANO_POINTS == OCT_IMAG_DIM
        assert IDENTITY_FANO_IS_IMAG_OCT is True

    def test_d4_dim_is_28(self):
        """dim(D₄) = dim(SO(8)) = 28 = N+V+D."""
        assert D4_DIM == 28
        assert D4_DIM == N + V + D
        assert IDENTITY_D4_DIM is True

    def test_triality_dim_is_8(self):
        """Each D₄ triality representation has dimension 8 = 2^D."""
        assert TRIALITY_DIM == 8
        assert TRIALITY_DIM == 2 ** D
        assert IDENTITY_TRIALITY is True

    def test_octonions_function(self):
        """octonions() dict is self-consistent."""
        d = octonions()
        assert d["oct_dim"] == 8
        assert d["g2_dim"] == 14
        assert d["mult_tables"] == 480
        assert d["identity_dim_oct"] is True
        assert d["identity_dim_g2"] is True
        assert d["identity_mult_tables"] is True


# ═══════════════════════════════════════════════════════════════════════════════
# 4. Albert Algebra
# ═══════════════════════════════════════════════════════════════════════════════

class TestAlbertAlgebra:

    def test_albert_dim_is_27(self):
        """dim(J₃(𝕆)) = 27."""
        assert ALBERT_DIM == 27

    def test_albert_dim_is_d_pow_d(self):
        """27 = D^D = 3^3."""
        assert ALBERT_DIM == D ** D
        assert IDENTITY_ALBERT is True

    def test_albert_diagonal_is_d(self):
        """3 diagonal real entries = D."""
        assert ALBERT_DIAGONAL == D
        assert IDENTITY_ALBERT_DIAG_IS_D is True

    def test_albert_offdiag_is_24(self):
        """Off-diagonal block has dimension 24."""
        assert ALBERT_OFFDIAG == 24

    def test_albert_offdiag_is_d_times_2_pow_d(self):
        """24 = D × 2^D = 3×8."""
        assert ALBERT_OFFDIAG == D * 2 ** D
        assert IDENTITY_ALBERT_OFFDIAG is True

    def test_albert_decomposition(self):
        """Diagonal + off-diagonal = total: 3+24=27."""
        assert ALBERT_DIAGONAL + ALBERT_OFFDIAG == ALBERT_DIM
        assert IDENTITY_ALBERT_DECOMP is True

    def test_f4_dim_is_52(self):
        """dim(F₄) = derivation algebra of J₃(𝕆) = 52."""
        assert F4_DIM == 52

    def test_f4_dim_is_n_times_d_plus_1(self):
        """52 = N(D+1) = 13×4."""
        assert F4_DIM == N * (D + 1)
        assert IDENTITY_F4_DIM is True

    def test_e6_dim_is_78(self):
        """dim(E₆) = structure group of J₃(𝕆) = 78."""
        assert E6_DIM == 78

    def test_e6_dim_is_triangular_v(self):
        """78 = T_V = V(V+1)/2 = 12×13/2."""
        assert E6_DIM == V * (V + 1) // 2
        assert IDENTITY_E6_DIM is True

    def test_albert_function(self):
        """albert_algebra() dict is self-consistent."""
        d = albert_algebra()
        assert d["dim"] == 27
        assert d["f4_dim"] == 52
        assert d["e6_dim"] == 78
        assert d["identity_albert"] is True
        assert d["identity_f4"] is True
        assert d["identity_e6"] is True


# ═══════════════════════════════════════════════════════════════════════════════
# 5. Freudenthal-Tits Magic Square
# ═══════════════════════════════════════════════════════════════════════════════

class TestMagicSquare:

    def test_e8_dim_is_248(self):
        """L(𝕆,𝕆) = E₈ has dim 248."""
        assert E8_MS_DIM == 248

    def test_e8_cathedral_formula(self):
        """248 = 2^D·(2^q−1) = 8×31."""
        assert E8_MS_DIM == 2 ** D * (2 ** q - 1)
        assert IDENTITY_MS_E8 is True

    def test_e7_dim_is_133(self):
        """L(𝕆,ℍ) = E₇ has dim 133."""
        assert E7_MS_DIM == 133

    def test_e7_cathedral_formula(self):
        """133 = 2G+N = 120+13."""
        assert E7_MS_DIM == 2 * G + N
        assert IDENTITY_MS_E7 is True

    def test_e6_dim_is_78(self):
        """L(𝕆,ℂ) = E₆ has dim 78."""
        assert E6_MS_DIM == 78

    def test_e6_cathedral_formula(self):
        """78 = T_V = V(V+1)/2 = 12×13/2."""
        assert E6_MS_DIM == V * (V + 1) // 2
        assert IDENTITY_MS_E6 is True

    def test_f4_dim_is_52(self):
        """L(𝕆,ℝ) = F₄ has dim 52."""
        assert F4_MS_DIM == 52

    def test_f4_cathedral_formula(self):
        """52 = N(D+1) = 13×4."""
        assert F4_MS_DIM == N * (D + 1)
        assert IDENTITY_MS_F4 is True

    def test_d4_dim_is_28(self):
        """L(ℍ,ℍ) = D₄ has dim 28."""
        assert D4_MS_DIM == 28

    def test_d4_cathedral_formula(self):
        """28 = N+V+D = 13+12+3."""
        assert D4_MS_DIM == N + V + D
        assert IDENTITY_MS_D4 is True

    def test_a2_dim_is_8(self):
        """L(ℂ,ℂ) = A₂ = SU(3) has dim 8."""
        assert A2_MS_DIM == 8

    def test_a2_cathedral_formula(self):
        """8 = 2^D = 2^3."""
        assert A2_MS_DIM == 2 ** D
        assert IDENTITY_MS_A2 is True

    def test_all_magic_cathedral(self):
        """ALL_MAGIC_CATHEDRAL flag is True."""
        assert ALL_MAGIC_CATHEDRAL is True

    def test_magic_square_dims_dict(self):
        """MAGIC_SQUARE_DIMS contains all six entries."""
        assert MAGIC_SQUARE_DIMS["(O,O)=E8"] == 248
        assert MAGIC_SQUARE_DIMS["(O,H)=E7"] == 133
        assert MAGIC_SQUARE_DIMS["(O,C)=E6"] == 78
        assert MAGIC_SQUARE_DIMS["(O,R)=F4"] == 52
        assert MAGIC_SQUARE_DIMS["(H,H)=D4"] == 28
        assert MAGIC_SQUARE_DIMS["(C,C)=A2"] == 8

    def test_magic_square_function(self):
        """magic_square() returns all_cathedral=True."""
        d = magic_square()
        assert d["all_cathedral"] is True
        assert d["identity_E8"] is True
        assert d["identity_E7"] is True
        assert d["identity_E6"] is True
        assert d["identity_F4"] is True
        assert d["identity_D4"] is True
        assert d["identity_A2"] is True


# ═══════════════════════════════════════════════════════════════════════════════
# 6. E₈ Root Decomposition
# ═══════════════════════════════════════════════════════════════════════════════

class TestE8RootDecomposition:

    def test_roots_d8_is_112(self):
        """D₈ sector contributes 112 roots."""
        assert ROOTS_D8_SECTOR == 112

    def test_roots_d8_cathedral_formula(self):
        """112 = 2^D × dim(G₂) = 8×14."""
        assert ROOTS_D8_SECTOR == 2 ** D * G2_DIM
        assert IDENTITY_ROOTS_D8 is True

    def test_roots_spinor_is_128(self):
        """Spinor sector contributes 128 roots."""
        assert ROOTS_SPINOR_SECTOR == 128

    def test_roots_spinor_cathedral_formula(self):
        """128 = 2^(D!+1) = 2^7."""
        assert ROOTS_SPINOR_SECTOR == 2 ** (factorial(D) + 1)
        assert IDENTITY_ROOTS_SPINOR is True

    def test_total_roots_is_240(self):
        """Total E₈ roots = 240."""
        assert E8_TOTAL_ROOTS == 240

    def test_roots_total_cathedral_formula(self):
        """240 = 2^D × E = 8×30."""
        assert ROOTS_D8_SECTOR + ROOTS_SPINOR_SECTOR == 2 ** D * E
        assert IDENTITY_ROOTS_TOTAL is True

    def test_roots_sum_consistency(self):
        """112 + 128 = E8_TOTAL_ROOTS."""
        assert ROOTS_D8_SECTOR + ROOTS_SPINOR_SECTOR == E8_TOTAL_ROOTS
        assert IDENTITY_ROOTS_SUM is True

    def test_e8_root_decomposition_function(self):
        """e8_root_decomposition() dict is correct."""
        d = e8_root_decomposition()
        assert d["roots_d8"] == 112
        assert d["roots_spinor"] == 128
        assert d["total_roots"] == 240
        assert d["identity_d8"] is True
        assert d["identity_spinor"] is True
        assert d["identity_total"] is True


# ═══════════════════════════════════════════════════════════════════════════════
# 7. M-theory and F-theory Dimensions
# ═══════════════════════════════════════════════════════════════════════════════

class TestStringDimensions:

    def test_mtheory_dim_is_11(self):
        """M-theory critical dimension = 11."""
        assert MTHEORY_DIM == 11

    def test_mtheory_cathedral_formula(self):
        """11 = 2D+q = 6+5."""
        assert MTHEORY_DIM == 2 * D + q
        assert IDENTITY_MTHEORY is True

    def test_ftheory_dim_is_12(self):
        """F-theory critical dimension = 12."""
        assert FTHEORY_DIM == 12

    def test_ftheory_cathedral_formula(self):
        """12 = V = 12."""
        assert FTHEORY_DIM == V
        assert IDENTITY_FTHEORY is True

    def test_string_m_theory_function(self):
        """string_m_theory_dims() dict is correct."""
        d = string_m_theory_dims()
        assert d["m_theory"] == 11
        assert d["f_theory"] == 12
        assert d["identity_m_theory"] is True
        assert d["identity_f_theory"] is True


# ═══════════════════════════════════════════════════════════════════════════════
# 8. Global Consistency
# ═══════════════════════════════════════════════════════════════════════════════

class TestGlobalConsistency:

    def test_all_identities_pass(self):
        """Every IDENTITY_* boolean in _ALL_IDENTITIES is True."""
        for i, flag in enumerate(_ALL_IDENTITIES):
            assert flag is True, f"Identity #{i} in _ALL_IDENTITIES is False"

    def test_all_identities_count(self):
        """_ALL_IDENTITIES has at least 36 entries (one per documented identity)."""
        assert len(_ALL_IDENTITIES) >= 36

    def test_summary_all_pass(self):
        """exceptional_structures_summary() reports all_pass=True."""
        s = exceptional_structures_summary()
        assert s["all_pass"] is True

    def test_summary_cathedral_integers(self):
        """Summary carries correct Cathedral integers."""
        s = exceptional_structures_summary()
        ci = s["cathedral_integers_used"]
        assert ci["D"] == 3
        assert ci["N"] == 13
        assert ci["V"] == 12
        assert ci["E"] == 30
        assert ci["q"] == 5
        assert ci["G"] == 60

    def test_print_report_runs(self, capsys):
        """print_exceptional_report() produces output without error."""
        print_exceptional_report()
        captured = capsys.readouterr()
        assert "Cathedral" in captured.out
        assert "PASS" in captured.out

    def test_product_times_sum_relation(self):
        """Cross-check: product=64=(D+1)^D, sum=15=V+D, both from same dim list."""
        assert PRODUCT_DIV_DIMS == (D + 1) ** D
        assert SUM_DIV_DIMS == V + D
        assert PRODUCT_DIV_DIMS * SUM_DIV_DIMS == 64 * 15   # = 960

    def test_fano_aut_factorisation(self):
        """168 = 2^3 × 3 × 7 — verify prime factorisation."""
        assert 168 == 8 * 3 * 7
        assert 168 == 2 ** 3 * 3 * 7

    def test_e8_dim_from_magic_square(self):
        """E₈ from magic square matches root-system dim: roots+rank = 240+8 = 248."""
        e8_roots = 240
        e8_rank  = 8
        assert E8_MS_DIM == e8_roots + e8_rank

    def test_g2_links_oct_and_fano(self):
        """dim(G₂) = N+1 = 14 = 2 × 7 = 2 × (D!+1)."""
        assert G2_DIM == 2 * (factorial(D) + 1)
        assert G2_DIM == N + 1

    def test_albert_dim_links_e6(self):
        """Albert dim 27 appears naturally: E₆ acts on 27-dimensional space."""
        assert ALBERT_DIM == 27
        assert E6_DIM == 78            # structure group of the 27-dim Albert algebra
