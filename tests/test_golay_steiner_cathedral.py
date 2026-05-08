"""
Tests for urt/golay_steiner_cathedral.py

Covers all IDENTITY_* booleans (must be True), numerical values,
formula derivations, the steiner_blocks() helper, summary dict,
and the print report.

55+ tests across 9 test classes.
"""

import pytest
from math import factorial, comb

from urt.shell_closure import DELTA_STAR, D, N, V, E, F, q, G
from urt.golay_steiner_cathedral import (
    # Binary extended Golay G24
    BINARY_EXT_LENGTH,
    BINARY_EXT_DIM,
    BINARY_EXT_DIST,
    BINARY_EXT_FIELD,
    BINARY_EXT_CODEWORDS,
    BINARY_EXT_RATE_NUM,
    BINARY_EXT_RATE_DENOM,
    IDENTITY_BINARY_EXT_LENGTH,
    IDENTITY_BINARY_EXT_DIM,
    IDENTITY_BINARY_EXT_DIST,
    IDENTITY_BINARY_EXT_CODEWORDS,
    ALL_BINARY_EXT_CATHEDRAL,
    # Binary perfect Golay G23
    BINARY_PERF_LENGTH,
    BINARY_PERF_DIM,
    BINARY_PERF_DIST,
    BINARY_PERF_FIELD,
    BINARY_PERF_CODEWORDS,
    BINARY_PERF_ERROR_CORRECTION,
    IDENTITY_BINARY_PERF_DIM,
    IDENTITY_BINARY_PERF_DIST,
    IDENTITY_BINARY_PERF_ERROR_IS_D,
    ALL_BINARY_PERF_CATHEDRAL,
    IDENTITY_BINARY_SHARED_DIM,
    IDENTITY_BINARY_PUNCTURE,
    # Ternary extended Golay G12
    TERNARY_EXT_LENGTH,
    TERNARY_EXT_DIM,
    TERNARY_EXT_DIST,
    TERNARY_EXT_FIELD,
    TERNARY_EXT_CODEWORDS,
    TERNARY_EXT_RATE_NUM,
    TERNARY_EXT_RATE_DENOM,
    IDENTITY_TERNARY_EXT_LENGTH,
    IDENTITY_TERNARY_EXT_DIM,
    IDENTITY_TERNARY_EXT_DIST,
    IDENTITY_TERNARY_EXT_FIELD,
    IDENTITY_TERNARY_SELF_REF,
    IDENTITY_TERNARY_EXT_DIST_EQ_DIM,
    ALL_TERNARY_EXT_CATHEDRAL,
    # Ternary perfect Golay G11
    TERNARY_PERF_LENGTH,
    TERNARY_PERF_DIM,
    TERNARY_PERF_DIST,
    TERNARY_PERF_FIELD,
    TERNARY_PERF_CODEWORDS,
    TERNARY_PERF_ERROR_CORRECTION,
    IDENTITY_TERNARY_PERF_DIM,
    IDENTITY_TERNARY_PERF_DIST,
    IDENTITY_TERNARY_PERF_FIELD,
    ALL_TERNARY_PERF_CATHEDRAL,
    IDENTITY_TERNARY_SHARED_DIM,
    IDENTITY_TERNARY_PUNCTURE,
    # Steiner small S(5,6,12)
    STEINER_SMALL_T,
    STEINER_SMALL_K,
    STEINER_SMALL_N,
    STEINER_SMALL_BLOCKS,
    IDENTITY_STEINER_SMALL_T,
    IDENTITY_STEINER_SMALL_K,
    IDENTITY_STEINER_SMALL_N,
    IDENTITY_STEINER_SMALL_BLOCKS,
    IDENTITY_STEINER_SMALL_T_IS_q,
    ALL_STEINER_SMALL_CATHEDRAL,
    # Steiner large S(5,8,24)
    STEINER_LARGE_T,
    STEINER_LARGE_K,
    STEINER_LARGE_N,
    STEINER_LARGE_BLOCKS,
    IDENTITY_STEINER_LARGE_T,
    IDENTITY_STEINER_LARGE_K,
    IDENTITY_STEINER_LARGE_N,
    IDENTITY_STEINER_LARGE_BLOCKS,
    IDENTITY_STEINER_BOTH_T_IS_q,
    ALL_STEINER_LARGE_CATHEDRAL,
    # Code-Steiner connections
    IDENTITY_TERNARY_GENERATES_SMALL_WITT,
    IDENTITY_BINARY_GENERATES_LARGE_WITT,
    # Mathieu groups
    M12_ORDER,
    M12_POINTS,
    M12_2_EXP,
    M12_3_EXP,
    M12_PRIME_5,
    M12_PRIME_11,
    M12_FORMULA,
    IDENTITY_M12_ORDER,
    IDENTITY_M12_POINTS,
    IDENTITY_M12_2_EXP,
    IDENTITY_M12_PRIME_11,
    ALL_M12_CATHEDRAL,
    M11_ORDER,
    M11_POINTS,
    M11_2_EXP,
    M11_3_EXP,
    M11_PRIME_5,
    M11_PRIME_11,
    M11_FORMULA,
    IDENTITY_M11_ORDER,
    IDENTITY_M11_2_EXP,
    IDENTITY_M11_3_EXP,
    IDENTITY_M11_PRIME_11,
    ALL_M11_CATHEDRAL,
    IDENTITY_MATHIEU_SHARED_11,
    # Perfect code identities
    IDENTITY_BINARY_PERF_COVERS_D,
    IDENTITY_TERNARY_PERF_COVERS_D_MINUS_1,
    # Cross-connections
    IDENTITY_BOTH_RATES_HALF,
    IDENTITY_BINARY_SAME_CODEWORDS,
    IDENTITY_TERNARY_SAME_CODEWORDS,
    IDENTITY_BINARY_LENGTH_IS_STEINER_LARGE_N,
    IDENTITY_TERNARY_LENGTH_IS_STEINER_SMALL_N,
    # Master flag and dict
    ALL_GOLAY_IDENTITIES,
    ALL_GOLAY_EXACT,
    # Functions
    steiner_blocks,
    golay_steiner_summary,
    print_golay_steiner_report,
)


# ══════════════════════════════════════════════════════════════════════════════
#  1. Binary Extended Golay Code G₂₄  [24, 12, 8]₂
# ══════════════════════════════════════════════════════════════════════════════

class TestBinaryExtendedGolay:
    """Extended binary Golay code G₂₄  [24, 12, 8]₂."""

    def test_length_value(self):
        """G₂₄ length = 24."""
        assert BINARY_EXT_LENGTH == 24

    def test_length_is_2V(self):
        """G₂₄ length = 2V = 2×12."""
        assert IDENTITY_BINARY_EXT_LENGTH is True
        assert BINARY_EXT_LENGTH == 2 * V

    def test_dim_value(self):
        """G₂₄ dimension = 12."""
        assert BINARY_EXT_DIM == 12

    def test_dim_is_V(self):
        """G₂₄ dimension = V = 12."""
        assert IDENTITY_BINARY_EXT_DIM is True
        assert BINARY_EXT_DIM == V

    def test_dist_value(self):
        """G₂₄ minimum distance = 8."""
        assert BINARY_EXT_DIST == 8

    def test_dist_is_2_power_D(self):
        """G₂₄ distance = 2^D = 2^3 = 8."""
        assert IDENTITY_BINARY_EXT_DIST is True
        assert BINARY_EXT_DIST == 2**D

    def test_field_is_binary(self):
        """G₂₄ is a binary code (field = 2)."""
        assert BINARY_EXT_FIELD == 2

    def test_codewords_is_2_power_V(self):
        """G₂₄ has 2^V = 4096 codewords."""
        assert IDENTITY_BINARY_EXT_CODEWORDS is True
        assert BINARY_EXT_CODEWORDS == 2**V
        assert BINARY_EXT_CODEWORDS == 4096

    def test_rate_is_half(self):
        """G₂₄ rate = k/n = V/2V = 1/2 exactly."""
        assert BINARY_EXT_DIM * BINARY_EXT_RATE_DENOM == BINARY_EXT_LENGTH * BINARY_EXT_RATE_NUM
        assert BINARY_EXT_DIM * 2 == BINARY_EXT_LENGTH

    def test_all_cathedral_flag(self):
        """ALL_BINARY_EXT_CATHEDRAL is True."""
        assert ALL_BINARY_EXT_CATHEDRAL is True


# ══════════════════════════════════════════════════════════════════════════════
#  2. Binary Perfect Golay Code G₂₃  [23, 12, 7]₂
# ══════════════════════════════════════════════════════════════════════════════

class TestBinaryPerfectGolay:
    """Perfect binary Golay code G₂₃  [23, 12, 7]₂."""

    def test_length_value(self):
        """G₂₃ length = 23 (prime)."""
        assert BINARY_PERF_LENGTH == 23

    def test_dim_value(self):
        """G₂₃ dimension = 12."""
        assert BINARY_PERF_DIM == 12

    def test_dim_is_V(self):
        """G₂₃ dimension = V = 12."""
        assert IDENTITY_BINARY_PERF_DIM is True
        assert BINARY_PERF_DIM == V

    def test_dist_value(self):
        """G₂₃ minimum distance = 7."""
        assert BINARY_PERF_DIST == 7

    def test_dist_is_Dfact_plus_1(self):
        """G₂₃ distance = D! + 1 = 3! + 1 = 7."""
        assert IDENTITY_BINARY_PERF_DIST is True
        assert BINARY_PERF_DIST == factorial(D) + 1

    def test_error_correction_value(self):
        """G₂₃ corrects exactly 3 errors."""
        assert BINARY_PERF_ERROR_CORRECTION == 3

    def test_error_correction_is_D(self):
        """G₂₃ error correction t = D = 3."""
        assert IDENTITY_BINARY_PERF_ERROR_IS_D is True
        assert BINARY_PERF_ERROR_CORRECTION == D

    def test_codewords_same_as_extended(self):
        """G₂₃ has same number of codewords as G₂₄ (4096 = 2^V)."""
        assert IDENTITY_BINARY_SAME_CODEWORDS is True
        assert BINARY_PERF_CODEWORDS == BINARY_EXT_CODEWORDS
        assert BINARY_PERF_CODEWORDS == 4096

    def test_all_cathedral_flag(self):
        """ALL_BINARY_PERF_CATHEDRAL is True."""
        assert ALL_BINARY_PERF_CATHEDRAL is True

    def test_shared_dim(self):
        """G₂₄ and G₂₃ share dimension k = V."""
        assert IDENTITY_BINARY_SHARED_DIM is True
        assert BINARY_EXT_DIM == BINARY_PERF_DIM == V

    def test_puncture_relation(self):
        """Lengths differ by 1: G₂₃ = G₂₄ punctured."""
        assert IDENTITY_BINARY_PUNCTURE is True
        assert BINARY_EXT_LENGTH - BINARY_PERF_LENGTH == 1

    def test_perfect_code_covers_D_errors(self):
        """Binary perfect Golay corrects D=3 errors — Cathedral!"""
        assert IDENTITY_BINARY_PERF_COVERS_D is True
        assert BINARY_PERF_ERROR_CORRECTION == D


# ══════════════════════════════════════════════════════════════════════════════
#  3. Ternary Extended Golay Code G₁₂  [12, 6, 6]₃
# ══════════════════════════════════════════════════════════════════════════════

class TestTernaryExtendedGolay:
    """Extended ternary Golay code G₁₂  [12, 6, 6]₃."""

    def test_length_value(self):
        """G₁₂ length = 12."""
        assert TERNARY_EXT_LENGTH == 12

    def test_length_is_V(self):
        """G₁₂ length = V = 12 (icosahedral vertex count!)."""
        assert IDENTITY_TERNARY_EXT_LENGTH is True
        assert TERNARY_EXT_LENGTH == V

    def test_dim_value(self):
        """G₁₂ dimension = 6."""
        assert TERNARY_EXT_DIM == 6

    def test_dim_is_Dfact(self):
        """G₁₂ dimension = D! = 3! = 6."""
        assert IDENTITY_TERNARY_EXT_DIM is True
        assert TERNARY_EXT_DIM == factorial(D)

    def test_dist_value(self):
        """G₁₂ minimum distance = 6."""
        assert TERNARY_EXT_DIST == 6

    def test_dist_is_Dfact(self):
        """G₁₂ distance = D! = 6 (same as dimension!)."""
        assert IDENTITY_TERNARY_EXT_DIST is True
        assert TERNARY_EXT_DIST == factorial(D)

    def test_dist_equals_dim(self):
        """G₁₂ has dist = dim = D! (exceptional property)."""
        assert IDENTITY_TERNARY_EXT_DIST_EQ_DIM is True
        assert TERNARY_EXT_DIST == TERNARY_EXT_DIM

    def test_field_is_D(self):
        """G₁₂ is over GF(3) = GF(D) — SELF-REFERENTIAL!"""
        assert IDENTITY_TERNARY_EXT_FIELD is True
        assert TERNARY_EXT_FIELD == D

    def test_self_referential(self):
        """Ternary codes are ternary because D=3 — SELF-REFERENTIAL!"""
        assert IDENTITY_TERNARY_SELF_REF is True
        assert TERNARY_EXT_FIELD == D == 3

    def test_codewords_value(self):
        """G₁₂ has 3^(D!) = 3^6 = 729 codewords."""
        assert TERNARY_EXT_CODEWORDS == 3**factorial(D)
        assert TERNARY_EXT_CODEWORDS == 729

    def test_rate_is_half(self):
        """G₁₂ rate = k/n = D!/V = 6/12 = 1/2."""
        assert TERNARY_EXT_DIM * TERNARY_EXT_RATE_DENOM == TERNARY_EXT_LENGTH * TERNARY_EXT_RATE_NUM
        assert TERNARY_EXT_DIM * 2 == TERNARY_EXT_LENGTH

    def test_all_cathedral_flag(self):
        """ALL_TERNARY_EXT_CATHEDRAL is True."""
        assert ALL_TERNARY_EXT_CATHEDRAL is True


# ══════════════════════════════════════════════════════════════════════════════
#  4. Ternary Perfect Golay Code G₁₁  [11, 6, 5]₃
# ══════════════════════════════════════════════════════════════════════════════

class TestTernaryPerfectGolay:
    """Perfect ternary Golay code G₁₁  [11, 6, 5]₃."""

    def test_length_value(self):
        """G₁₁ length = 11 (prime)."""
        assert TERNARY_PERF_LENGTH == 11

    def test_dim_value(self):
        """G₁₁ dimension = 6."""
        assert TERNARY_PERF_DIM == 6

    def test_dim_is_Dfact(self):
        """G₁₁ dimension = D! = 6."""
        assert IDENTITY_TERNARY_PERF_DIM is True
        assert TERNARY_PERF_DIM == factorial(D)

    def test_dist_value(self):
        """G₁₁ minimum distance = 5."""
        assert TERNARY_PERF_DIST == 5

    def test_dist_is_q(self):
        """G₁₁ distance = q = 5."""
        assert IDENTITY_TERNARY_PERF_DIST is True
        assert TERNARY_PERF_DIST == q

    def test_field_is_D(self):
        """G₁₁ is over GF(3) = GF(D) — SELF-REFERENTIAL!"""
        assert IDENTITY_TERNARY_PERF_FIELD is True
        assert TERNARY_PERF_FIELD == D

    def test_error_correction(self):
        """G₁₁ corrects (d-1)/2 = 2 = D-1 errors."""
        assert TERNARY_PERF_ERROR_CORRECTION == 2
        assert TERNARY_PERF_ERROR_CORRECTION == D - 1

    def test_perfect_covers_D_minus_1(self):
        """Ternary perfect Golay corrects D-1=2 errors — Cathedral!"""
        assert IDENTITY_TERNARY_PERF_COVERS_D_MINUS_1 is True

    def test_codewords_same_as_extended(self):
        """G₁₁ has same codewords as G₁₂ (729 = 3^(D!))."""
        assert IDENTITY_TERNARY_SAME_CODEWORDS is True
        assert TERNARY_PERF_CODEWORDS == TERNARY_EXT_CODEWORDS

    def test_all_cathedral_flag(self):
        """ALL_TERNARY_PERF_CATHEDRAL is True."""
        assert ALL_TERNARY_PERF_CATHEDRAL is True

    def test_shared_dim_with_extended(self):
        """G₁₁ and G₁₂ share dimension k = D!."""
        assert IDENTITY_TERNARY_SHARED_DIM is True
        assert TERNARY_EXT_DIM == TERNARY_PERF_DIM == factorial(D)

    def test_puncture_relation(self):
        """G₁₁ = G₁₂ punctured: lengths differ by 1."""
        assert IDENTITY_TERNARY_PUNCTURE is True
        assert TERNARY_EXT_LENGTH - TERNARY_PERF_LENGTH == 1


# ══════════════════════════════════════════════════════════════════════════════
#  5. Steiner System S(5, 6, 12) — Small Witt Design
# ══════════════════════════════════════════════════════════════════════════════

class TestSteinerSmall:
    """Steiner system S(5, 6, 12) — small Witt design."""

    def test_t_value(self):
        """Strength t = 5."""
        assert STEINER_SMALL_T == 5

    def test_t_is_q(self):
        """Strength t = q = 5 — SELF-REFERENTIAL!"""
        assert IDENTITY_STEINER_SMALL_T is True
        assert IDENTITY_STEINER_SMALL_T_IS_q is True
        assert STEINER_SMALL_T == q

    def test_k_value(self):
        """Block size k = 6."""
        assert STEINER_SMALL_K == 6

    def test_k_is_Dfact(self):
        """Block size k = D! = 6."""
        assert IDENTITY_STEINER_SMALL_K is True
        assert STEINER_SMALL_K == factorial(D)

    def test_n_value(self):
        """Total points n = 12."""
        assert STEINER_SMALL_N == 12

    def test_n_is_V(self):
        """Total points n = V = 12 (icosahedral vertex count!)."""
        assert IDENTITY_STEINER_SMALL_N is True
        assert STEINER_SMALL_N == V

    def test_blocks_value(self):
        """Number of blocks = 132."""
        assert STEINER_SMALL_BLOCKS == 132

    def test_blocks_is_V_times_11(self):
        """132 blocks = V × 11 = 12 × 11."""
        assert IDENTITY_STEINER_SMALL_BLOCKS is True
        assert STEINER_SMALL_BLOCKS == V * 11

    def test_blocks_via_comb(self):
        """Block count via C(n,t)/C(k,t) = C(12,5)/C(6,5) = 792/6 = 132."""
        assert comb(12, 5) == 792
        assert comb(6, 5) == 6
        assert 792 // 6 == 132

    def test_all_cathedral_flag(self):
        """ALL_STEINER_SMALL_CATHEDRAL is True."""
        assert ALL_STEINER_SMALL_CATHEDRAL is True


# ══════════════════════════════════════════════════════════════════════════════
#  6. Steiner System S(5, 8, 24) — Large Witt Design
# ══════════════════════════════════════════════════════════════════════════════

class TestSteinerLarge:
    """Steiner system S(5, 8, 24) — large Witt design."""

    def test_t_value(self):
        """Strength t = 5."""
        assert STEINER_LARGE_T == 5

    def test_t_is_q(self):
        """Strength t = q = 5 — SELF-REFERENTIAL!"""
        assert IDENTITY_STEINER_LARGE_T is True
        assert STEINER_LARGE_T == q

    def test_k_value(self):
        """Block size k = 8."""
        assert STEINER_LARGE_K == 8

    def test_k_is_2_power_D(self):
        """Block size k = 2^D = 2^3 = 8."""
        assert IDENTITY_STEINER_LARGE_K is True
        assert STEINER_LARGE_K == 2**D

    def test_n_value(self):
        """Total points n = 24."""
        assert STEINER_LARGE_N == 24

    def test_n_is_2V(self):
        """Total points n = 2V = 24."""
        assert IDENTITY_STEINER_LARGE_N is True
        assert STEINER_LARGE_N == 2 * V

    def test_blocks_value(self):
        """Number of blocks = 759."""
        assert STEINER_LARGE_BLOCKS == 759

    def test_blocks_is_D_times_11_times_23(self):
        """759 blocks = D × 11 × 23 = 3 × 11 × 23."""
        assert IDENTITY_STEINER_LARGE_BLOCKS is True
        assert STEINER_LARGE_BLOCKS == D * 11 * 23

    def test_blocks_via_comb(self):
        """Block count via C(n,t)/C(k,t) = C(24,5)/C(8,5) = 42504/56 = 759."""
        assert comb(24, 5) == 42504
        assert comb(8, 5) == 56
        assert 42504 // 56 == 759

    def test_both_t_is_q(self):
        """t = q = 5 in BOTH Steiner systems — SELF-REFERENTIAL!"""
        assert IDENTITY_STEINER_BOTH_T_IS_q is True
        assert STEINER_SMALL_T == STEINER_LARGE_T == q

    def test_all_cathedral_flag(self):
        """ALL_STEINER_LARGE_CATHEDRAL is True."""
        assert ALL_STEINER_LARGE_CATHEDRAL is True


# ══════════════════════════════════════════════════════════════════════════════
#  7. Steiner blocks helper
# ══════════════════════════════════════════════════════════════════════════════

class TestSteinerBlocksHelper:
    """steiner_blocks(t, k, n) helper function."""

    def test_small_witt(self):
        """steiner_blocks(5, 6, 12) = 132."""
        assert steiner_blocks(5, 6, 12) == 132

    def test_large_witt(self):
        """steiner_blocks(5, 8, 24) = 759."""
        assert steiner_blocks(5, 8, 24) == 759

    def test_returns_int(self):
        """Return type is int."""
        result = steiner_blocks(5, 6, 12)
        assert isinstance(result, int)

    def test_cathedral_params_small(self):
        """Cathedral params S(q, D!, V) = 132."""
        assert steiner_blocks(q, factorial(D), V) == 132

    def test_cathedral_params_large(self):
        """Cathedral params S(q, 2^D, 2V) = 759."""
        assert steiner_blocks(q, 2**D, 2*V) == 759

    def test_s22111(self):
        """steiner_blocks(2, 3, 7) = 7 (Fano plane)."""
        assert steiner_blocks(2, 3, 7) == 7


# ══════════════════════════════════════════════════════════════════════════════
#  8. Mathieu Groups M₁₂ and M₁₁
# ══════════════════════════════════════════════════════════════════════════════

class TestMathieuGroups:
    """Mathieu groups M₁₂ and M₁₁ Cathedral factorisations."""

    def test_m12_order_value(self):
        """M₁₂ order = 95040."""
        assert M12_ORDER == 95040

    def test_m12_order_formula(self):
        """M₁₂ formula: 2^(D!)·D^D·q·(2D+q) = 64·27·5·11 = 95040."""
        assert IDENTITY_M12_ORDER is True
        assert M12_ORDER == M12_FORMULA

    def test_m12_2_exp_is_Dfact(self):
        """M₁₂ 2-adic exponent = D! = 6."""
        assert IDENTITY_M12_2_EXP is True
        assert M12_2_EXP == factorial(D)
        assert M12_2_EXP == 6

    def test_m12_prime_11_is_2D_plus_q(self):
        """M₁₂ prime factor 11 = 2D + q."""
        assert IDENTITY_M12_PRIME_11 is True
        assert M12_PRIME_11 == 2*D + q
        assert M12_PRIME_11 == 11

    def test_m12_points_is_V(self):
        """M₁₂ acts on V = 12 points."""
        assert IDENTITY_M12_POINTS is True
        assert M12_POINTS == V
        assert M12_POINTS == 12

    def test_m12_manual_factorization(self):
        """Manual: 2^6 × 3^3 × 5 × 11 = 64 × 27 × 5 × 11 = 95040."""
        assert 2**6 * 3**3 * 5 * 11 == 95040

    def test_m12_all_cathedral(self):
        """ALL_M12_CATHEDRAL is True."""
        assert ALL_M12_CATHEDRAL is True

    def test_m11_order_value(self):
        """M₁₁ order = 7920."""
        assert M11_ORDER == 7920

    def test_m11_order_formula(self):
        """M₁₁ formula: 2^(D+1)·D^(D-1)·q·(2D+q) = 16·9·5·11 = 7920."""
        assert IDENTITY_M11_ORDER is True
        assert M11_ORDER == M11_FORMULA

    def test_m11_2_exp_is_D_plus_1(self):
        """M₁₁ 2-adic exponent = D+1 = 4."""
        assert IDENTITY_M11_2_EXP is True
        assert M11_2_EXP == D + 1
        assert M11_2_EXP == 4

    def test_m11_3_exp_is_D_minus_1(self):
        """M₁₁ 3-adic exponent = D-1 = 2."""
        assert IDENTITY_M11_3_EXP is True
        assert M11_3_EXP == D - 1
        assert M11_3_EXP == 2

    def test_m11_prime_11_is_2D_plus_q(self):
        """M₁₁ prime factor 11 = 2D + q."""
        assert IDENTITY_M11_PRIME_11 is True
        assert M11_PRIME_11 == 2*D + q
        assert M11_PRIME_11 == 11

    def test_m11_manual_factorization(self):
        """Manual: 2^4 × 3^2 × 5 × 11 = 16 × 9 × 5 × 11 = 7920."""
        assert 2**4 * 3**2 * 5 * 11 == 7920

    def test_m11_all_cathedral(self):
        """ALL_M11_CATHEDRAL is True."""
        assert ALL_M11_CATHEDRAL is True

    def test_mathieu_shared_prime_11(self):
        """M₁₂ and M₁₁ both have prime factor 11 = 2D + q."""
        assert IDENTITY_MATHIEU_SHARED_11 is True
        assert M12_PRIME_11 == M11_PRIME_11 == 2*D + q


# ══════════════════════════════════════════════════════════════════════════════
#  9. ALL_GOLAY_EXACT, summary, and print report
# ══════════════════════════════════════════════════════════════════════════════

class TestMasterFlagSummaryAndReport:
    """Master flag, summary dict, and print report."""

    def test_all_golay_exact(self):
        """ALL_GOLAY_EXACT is True — all identities hold."""
        assert ALL_GOLAY_EXACT is True

    def test_all_identities_true(self):
        """Every entry in ALL_GOLAY_IDENTITIES is True."""
        failing = [k for k, v in ALL_GOLAY_IDENTITIES.items() if not v]
        assert failing == [], f"Failing identities: {failing}"

    def test_identity_count(self):
        """At least 40 identities are tracked."""
        assert len(ALL_GOLAY_IDENTITIES) >= 40

    def test_cross_connections(self):
        """Code-Steiner cross-connection identities all hold."""
        assert IDENTITY_TERNARY_GENERATES_SMALL_WITT is True
        assert IDENTITY_BINARY_GENERATES_LARGE_WITT is True
        assert IDENTITY_BOTH_RATES_HALF is True
        assert IDENTITY_BINARY_LENGTH_IS_STEINER_LARGE_N is True
        assert IDENTITY_TERNARY_LENGTH_IS_STEINER_SMALL_N is True

    def test_summary_keys(self):
        """golay_steiner_summary() has all expected top-level keys."""
        s = golay_steiner_summary()
        for key in (
            "binary_extended_golay",
            "binary_perfect_golay",
            "ternary_extended_golay",
            "ternary_perfect_golay",
            "steiner_small",
            "steiner_large",
            "mathieu_m12",
            "mathieu_m11",
            "cross_connections",
            "all_golay_exact",
            "cathedral_integers",
            "delta_star",
        ):
            assert key in s, f"Missing key: {key}"

    def test_summary_all_golay_exact(self):
        """Summary reports ALL_GOLAY_EXACT = True."""
        s = golay_steiner_summary()
        assert s["all_golay_exact"] is True

    def test_summary_cathedral_integers(self):
        """Summary cathedral_integers has correct values."""
        ci = golay_steiner_summary()["cathedral_integers"]
        assert ci["D"] == 3
        assert ci["N"] == 13
        assert ci["V"] == 12
        assert ci["E"] == 30
        assert ci["q"] == 5
        assert ci["G"] == 60

    def test_summary_delta_star(self):
        """Summary delta_star matches shell_closure."""
        s = golay_steiner_summary()
        assert abs(s["delta_star"] - DELTA_STAR) < 1e-14

    def test_summary_binary_extended_parameters(self):
        """Binary extended Golay parameters correct in summary."""
        s = golay_steiner_summary()["binary_extended_golay"]
        assert s["length"] == 24
        assert s["dim"] == 12
        assert s["dist"] == 8
        assert s["all_cathedral"] is True
        assert s["codewords"] == 4096

    def test_summary_ternary_extended_parameters(self):
        """Ternary extended Golay parameters correct in summary."""
        s = golay_steiner_summary()["ternary_extended_golay"]
        assert s["length"] == 12
        assert s["dim"] == 6
        assert s["dist"] == 6
        assert s["field"] == 3
        assert s["all_cathedral"] is True

    def test_summary_steiner_small(self):
        """Steiner S(5,6,12) summary parameters correct."""
        s = golay_steiner_summary()["steiner_small"]
        assert s["t"] == 5
        assert s["k"] == 6
        assert s["n"] == 12
        assert s["blocks"] == 132
        assert s["all_cathedral"] is True

    def test_summary_steiner_large(self):
        """Steiner S(5,8,24) summary parameters correct."""
        s = golay_steiner_summary()["steiner_large"]
        assert s["t"] == 5
        assert s["k"] == 8
        assert s["n"] == 24
        assert s["blocks"] == 759
        assert s["all_cathedral"] is True

    def test_summary_m12(self):
        """M₁₂ summary correct."""
        s = golay_steiner_summary()["mathieu_m12"]
        assert s["order"] == 95040
        assert s["points"] == 12
        assert s["identity_order"] is True
        assert s["all_cathedral"] is True

    def test_summary_m11(self):
        """M₁₁ summary correct."""
        s = golay_steiner_summary()["mathieu_m11"]
        assert s["order"] == 7920
        assert s["identity_order"] is True
        assert s["all_cathedral"] is True

    def test_print_report_runs(self, capsys):
        """print_golay_steiner_report() executes without error."""
        print_golay_steiner_report()
        out = capsys.readouterr().out
        assert len(out) > 300

    def test_print_report_content_binary(self, capsys):
        """Report includes binary Golay parameters."""
        print_golay_steiner_report()
        out = capsys.readouterr().out
        assert "24" in out
        assert "12" in out
        assert "Golay" in out or "G₂₄" in out or "[24," in out

    def test_print_report_content_ternary(self, capsys):
        """Report includes ternary Golay self-referential note."""
        print_golay_steiner_report()
        out = capsys.readouterr().out
        assert "GF(3)" in out or "GF(D)" in out or "ternary" in out.lower() or "Ternary" in out

    def test_print_report_content_steiner(self, capsys):
        """Report includes Steiner system parameters."""
        print_golay_steiner_report()
        out = capsys.readouterr().out
        assert "S(" in out or "Steiner" in out or "132" in out

    def test_print_report_content_mathieu(self, capsys):
        """Report includes Mathieu group orders."""
        print_golay_steiner_report()
        out = capsys.readouterr().out
        assert "95040" in out or "M₁₂" in out or "M12" in out

    def test_print_report_content_delta_star(self, capsys):
        """Report includes δ★ value."""
        print_golay_steiner_report()
        out = capsys.readouterr().out
        assert "0.14751" in out or "δ★" in out

    def test_print_report_content_t_is_q(self, capsys):
        """Report mentions t = q self-referential property."""
        print_golay_steiner_report()
        out = capsys.readouterr().out
        # t=q=5 appears in both Steiner systems
        assert "t = q" in out or "t=q" in out or "q = 5" in out or "SELF-REFERENTIAL" in out
