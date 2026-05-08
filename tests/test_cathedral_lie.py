"""Tests for Cathedral Lie Algebras — ADE series + Fibonacci connections."""
import pytest
from math import factorial

from urt.cathedral_lie import (
    D, N, V, E, F, q, G, CATHEDRAL_CHECKSUM,
    dim_An, dim_Bn, dim_Cn, dim_Dn,
    DIM_A_D1, IDENTITY_A_D1, N_GLUONS,
    DIM_D_D1, IDENTITY_D_D1,
    DIM_B_Q, IDENTITY_B_Q,
    DIM_A_V1, IDENTITY_A_V1,
    DIM_B_D, DIM_D_Q,
    ALL_CLASSICAL_EXACT,
    DIM_G2, DIM_F4, DIM_E6, DIM_E7, DIM_E8, ROOTS_E8,
    ALL_EXCEPTIONAL_EXACT, ALL_LIE_EXACT,
    RANK_E6, RANK_E7, RANK_E8,
    IDENTITY_RANK_E6, IDENTITY_RANK_E7, IDENTITY_RANK_E8,
    LIE_DIMENSIONS, CATHEDRAL_LIE_COUNT,
    fibonacci, FIB_4, FIB_5, FIB_6, FIB_7, FIB_V,
    FIB_SEQUENCE, FIB_CATHEDRAL,
    IDENTITY_FIB4_D, IDENTITY_FIB5_Q, IDENTITY_FIB6_2D, IDENTITY_FIB7_N,
    IDENTITY_FOUR_CONSECUTIVE_FIBS, IDENTITY_FIB_V, IDENTITY_CHECKSUM_FIB,
    WEYL_A_D1_ORDER, MCKAY_A5_E8,
    cathedral_lie_summary, print_cathedral_lie_report,
)


# ── Dimension formulas ────────────────────────────────────────────────────────

def test_dim_an_su2():
    assert dim_An(1) == 3  # SU(2)

def test_dim_an_su3():
    assert dim_An(2) == 8  # SU(3)

def test_dim_bn_so3():
    assert dim_Bn(1) == 3  # SO(3)

def test_dim_dn_so8():
    assert dim_Dn(4) == 28  # SO(8)


# ── Classical series ──────────────────────────────────────────────────────────

def test_dim_a2_is_8():
    """dim(A_2) = dim(SU(3)) = D²-1 = 8."""
    assert DIM_A_D1 == 8

def test_dim_a2_is_2_to_d():
    """dim(SU(3)) = 2^D = 8 — extraordinary coincidence!"""
    assert IDENTITY_A_D1
    assert DIM_A_D1 == 2**D

def test_dim_a2_is_d_squared_minus_1():
    assert DIM_A_D1 == D**2 - 1

def test_n_gluons():
    """There are 8 gluons = dim(SU(3)) = 2^D."""
    assert N_GLUONS == 8
    assert N_GLUONS == DIM_A_D1

def test_dim_d4_is_28():
    """dim(D_4) = dim(SO(8)) = 28 = N+V+D = nuclear magic."""
    assert DIM_D_D1 == 28

def test_dim_d4_is_nvd():
    assert IDENTITY_D_D1
    assert DIM_D_D1 == N + V + D

def test_dim_b5_is_55():
    """dim(B_5) = dim(SO(11)) = 55 = N+V+E."""
    assert DIM_B_Q == 55

def test_dim_b5_is_nve():
    assert IDENTITY_B_Q
    assert DIM_B_Q == N + V + E

def test_dim_a11_is_143():
    """dim(A_11) = dim(SU(12)) = 143 = Cathedral checksum."""
    assert DIM_A_V1 == 143

def test_dim_a11_is_checksum():
    assert IDENTITY_A_V1
    assert DIM_A_V1 == CATHEDRAL_CHECKSUM
    assert DIM_A_V1 == V**2 - 1

def test_all_classical_exact():
    assert ALL_CLASSICAL_EXACT


# ── Exceptional series ────────────────────────────────────────────────────────

def test_dim_g2():
    assert DIM_G2 == 14
    assert DIM_G2 == N + 1

def test_dim_f4():
    assert DIM_F4 == 52
    assert DIM_F4 == N * (D + 1)

def test_dim_e6():
    assert DIM_E6 == 78
    assert DIM_E6 == V * (V + 1) // 2

def test_dim_e7():
    assert DIM_E7 == 133
    assert DIM_E7 == 2 * G + N

def test_dim_e8():
    assert DIM_E8 == 248
    assert DIM_E8 == 2**D * (2**q - 1)

def test_roots_e8():
    assert ROOTS_E8 == 240
    assert ROOTS_E8 == 2**D * E

def test_e8_dim_minus_roots():
    """dim(E₈) = roots + rank: 248 = 240 + 8."""
    assert DIM_E8 == ROOTS_E8 + 8

def test_all_exceptional_exact():
    assert ALL_EXCEPTIONAL_EXACT

def test_all_lie_exact():
    """ALL simple Lie dims match Cathedral integers."""
    assert ALL_LIE_EXACT


# ── Ranks ─────────────────────────────────────────────────────────────────────

def test_rank_e6():
    """rank(E₆) = 6 = D! = V/2."""
    assert IDENTITY_RANK_E6
    assert RANK_E6 == 6
    assert RANK_E6 == factorial(D)

def test_rank_e7():
    """rank(E₇) = 7 = D!+1."""
    assert IDENTITY_RANK_E7
    assert RANK_E7 == 7

def test_rank_e8():
    """rank(E₈) = 8 = 2D+2."""
    assert IDENTITY_RANK_E8
    assert RANK_E8 == 8
    assert RANK_E8 == 2 * D + 2

def test_weyl_a2_order():
    """Weyl group of A_2 has order D! = V/2 = 6."""
    assert WEYL_A_D1_ORDER == factorial(D)
    assert WEYL_A_D1_ORDER == V // 2

def test_mckay_correspondence():
    """McKay graph of A₅ = Ê₈ (ADE theorem)."""
    assert MCKAY_A5_E8 is True


# ── Lie dimension table ───────────────────────────────────────────────────────

def test_lie_dimensions_dict_completeness():
    for name in ["A2=SU(3)", "D4=SO(8)", "B5=SO(11)", "A11=SU(12)",
                 "G2", "F4", "E6", "E7", "E8"]:
        assert name in LIE_DIMENSIONS

def test_cathedral_lie_count():
    """At least 9 out of 10 entries are Cathedral integers."""
    assert CATHEDRAL_LIE_COUNT >= 9


# ── Fibonacci ─────────────────────────────────────────────────────────────────

def test_fibonacci_function():
    assert fibonacci(1) == 1
    assert fibonacci(2) == 1
    assert fibonacci(4) == 3
    assert fibonacci(7) == 13

def test_fib4_is_d():
    """F_4 = 3 = D."""
    assert IDENTITY_FIB4_D
    assert FIB_4 == D
    assert FIB_4 == 3

def test_fib5_is_q():
    """F_5 = 5 = q."""
    assert IDENTITY_FIB5_Q
    assert FIB_5 == q
    assert FIB_5 == 5

def test_fib6_is_2d():
    """F_6 = 8 = 2^D."""
    assert IDENTITY_FIB6_2D
    assert FIB_6 == 2**D
    assert FIB_6 == 8

def test_fib7_is_n():
    """F_7 = 13 = N."""
    assert IDENTITY_FIB7_N
    assert FIB_7 == N
    assert FIB_7 == 13

def test_four_consecutive_fibonacci():
    """F_4, F_5, F_6, F_7 = D, q, 2^D, N — four consecutive Fibonacci."""
    assert IDENTITY_FOUR_CONSECUTIVE_FIBS

def test_fib_v_is_v_squared():
    """F_V = F_12 = 144 = V²."""
    assert IDENTITY_FIB_V
    assert FIB_V == V**2
    assert FIB_V == 144

def test_checksum_is_fib_v_minus_1():
    """Cathedral checksum = F_V - 1 = 143."""
    assert IDENTITY_CHECKSUM_FIB
    assert CATHEDRAL_CHECKSUM == FIB_V - 1

def test_fib_cathedral_dict():
    """Four Cathedral integers appear as consecutive Fibonacci numbers."""
    assert FIB_CATHEDRAL[4] == (D, "D")
    assert FIB_CATHEDRAL[5] == (q, "q")
    assert FIB_CATHEDRAL[7] == (N, "N")

def test_fib_sequence_length():
    assert len(FIB_SEQUENCE) == 14


# ── Summary ───────────────────────────────────────────────────────────────────

def test_cathedral_lie_summary():
    s = cathedral_lie_summary()
    assert isinstance(s, dict)
    assert s["all_lie_exact"] is True
    assert s["four_consec_fibs"] is True
    assert s["fib_v_is_v_sq"] is True

def test_print_cathedral_lie_report(capsys):
    print_cathedral_lie_report()
    out = capsys.readouterr().out
    assert "LIE" in out or "Lie" in out

def test_print_report_contains_gluons(capsys):
    print_cathedral_lie_report()
    out = capsys.readouterr().out
    assert "gluon" in out.lower() or "8" in out

def test_print_report_contains_fibonacci(capsys):
    print_cathedral_lie_report()
    out = capsys.readouterr().out
    assert "Fibonacci" in out or "fibonacci" in out.lower() or "F_4" in out

def test_print_report_contains_checksum(capsys):
    print_cathedral_lie_report()
    out = capsys.readouterr().out
    assert "143" in out or "checksum" in out.lower()
