"""Tests for Exceptional Lie Algebras from Cathedral Integers."""
import pytest
from math import factorial

from urt.exceptional_lie import (
    D, N, V, E, F, q, G,
    DIM_G2, DIM_G2_ALT, RANK_G2, IDENTITY_G2,
    DIM_F4, RANK_F4, IDENTITY_F4,
    DIM_E6_V1, DIM_E6_V2, DIM_E6, RANK_E6, IDENTITY_E6_V1, IDENTITY_E6_V2, IDENTITY_E6_EQUAL,
    DIM_E7, RANK_E7_EXACT, IDENTITY_E7,
    DIM_E8, ROOTS_E8, RANK_E8_EXACT, IDENTITY_E8, IDENTITY_E8_ROOTS_MINUS_DIM,
    EXCEPTIONAL_LIE_DIMS, EXCEPTIONAL_LIE_CATHEDRAL, ALL_EXCEPTIONAL_EXACT,
    triangular, T_D, T_Q, T_V, T_N,
    IDENTITY_T_D_EQ_DFACT, IDENTITY_T_Q_EQ_VD, IDENTITY_T_V_EQ_E6,
    T_Q_TIMES_2, IDENTITY_E_IS_2TQ, TRIANGULAR_CHAIN,
    MAGIC_28, MAGIC_50, MAGIC_20, MAGIC_126,
    IDENTITY_MAGIC_126, IDENTITY_MAGIC_28, IDENTITY_MAGIC_50, IDENTITY_MAGIC_20,
    MAGIC_CATHEDRAL, MAGIC_CATHEDRAL_COUNT,
    NS_DENOM, N_S, N_S_OBS, N_S_ERR_PCT, IDENTITY_NS, IDENTITY_NS_FROM_E6,
    MCKAY_A5_IS_E8_HAT,
    exceptional_lie_summary, print_exceptional_lie_report,
)


# ── G₂ ───────────────────────────────────────────────────────────────────────

def test_dim_g2_equals_14():
    assert DIM_G2 == 14

def test_dim_g2_is_n_plus_1():
    assert DIM_G2 == N + 1

def test_dim_g2_alt_formula():
    """Also V+D-1 = 14."""
    assert DIM_G2_ALT == 14
    assert DIM_G2_ALT == V + D - 1

def test_identity_g2():
    assert IDENTITY_G2

def test_rank_g2():
    assert RANK_G2 == 2
    assert RANK_G2 == D - 1


# ── F₄ ───────────────────────────────────────────────────────────────────────

def test_dim_f4_equals_52():
    assert DIM_F4 == 52

def test_dim_f4_is_n_times_d1():
    """dim(F₄) = N×(D+1) = 13×4 = 52."""
    assert DIM_F4 == N * (D + 1)

def test_dim_f4_is_pg2_incidences():
    """F₄ dimension = projective plane PG(2,F_D) incidence count."""
    pg2_incidences = N * (D + 1)
    assert DIM_F4 == pg2_incidences

def test_identity_f4():
    assert IDENTITY_F4

def test_rank_f4():
    assert RANK_F4 == 4
    assert RANK_F4 == D + 1


# ── E₆ ───────────────────────────────────────────────────────────────────────

def test_dim_e6_equals_78():
    assert DIM_E6 == 78

def test_dim_e6_formula_v1():
    """G+F+1-D = 78."""
    assert IDENTITY_E6_V1
    assert DIM_E6_V1 == 78

def test_dim_e6_formula_v2():
    """T_V = V(V+1)/2 = 78 — the V-th triangular number."""
    assert IDENTITY_E6_V2
    assert DIM_E6_V2 == 78
    assert DIM_E6_V2 == V * (V + 1) // 2

def test_dim_e6_two_formulas_agree():
    """Both formulas give the same 78."""
    assert IDENTITY_E6_EQUAL

def test_rank_e6():
    assert RANK_E6 == 6
    assert RANK_E6 == V // 2


# ── E₇ ───────────────────────────────────────────────────────────────────────

def test_dim_e7_equals_133():
    assert DIM_E7 == 133

def test_dim_e7_is_2g_plus_n():
    """dim(E₇) = 2G+N = 120+13 = 133."""
    assert DIM_E7 == 2 * G + N

def test_identity_e7():
    assert IDENTITY_E7

def test_rank_e7():
    assert RANK_E7_EXACT == 7


# ── E₈ ───────────────────────────────────────────────────────────────────────

def test_dim_e8_equals_248():
    assert DIM_E8 == 248

def test_dim_e8_cathedral_formula():
    """dim(E₈) = 2^D × (2^q - 1) = 8 × 31 = 248."""
    assert DIM_E8 == 2**D * (2**q - 1)

def test_roots_e8():
    """Roots of E₈ = 240 = 2^D × E = 8 × 30."""
    assert ROOTS_E8 == 240
    assert ROOTS_E8 == 2**D * E

def test_e8_roots_dim_relation():
    """dim(E₈) = roots(E₈) + rank(E₈): 248 = 240 + 8."""
    assert IDENTITY_E8_ROOTS_MINUS_DIM
    assert DIM_E8 == ROOTS_E8 + RANK_E8_EXACT
    assert RANK_E8_EXACT == 8

def test_identity_e8():
    assert IDENTITY_E8

def test_rank_e8():
    assert RANK_E8_EXACT == 8
    assert RANK_E8_EXACT == 2 * D + 2


# ── All five exceptional ──────────────────────────────────────────────────────

def test_all_exceptional_exact():
    """All 5 exceptional Lie algebra dimensions are Cathedral integers."""
    assert ALL_EXCEPTIONAL_EXACT

def test_exceptional_dims_dict():
    assert EXCEPTIONAL_LIE_DIMS["G2"] == 14
    assert EXCEPTIONAL_LIE_DIMS["F4"] == 52
    assert EXCEPTIONAL_LIE_DIMS["E6"] == 78
    assert EXCEPTIONAL_LIE_DIMS["E7"] == 133
    assert EXCEPTIONAL_LIE_DIMS["E8"] == 248

def test_exceptional_dims_strictly_increasing():
    dims = list(EXCEPTIONAL_LIE_DIMS.values())
    for i in range(len(dims)-1):
        assert dims[i] < dims[i+1]

def test_mckay_correspondence():
    """McKay graph of A₅ = extended Ê₈ (ADE theorem)."""
    assert MCKAY_A5_IS_E8_HAT is True


# ── Triangular numbers ────────────────────────────────────────────────────────

def test_triangular_function():
    assert triangular(1) == 1
    assert triangular(3) == 6
    assert triangular(5) == 15
    assert triangular(12) == 78

def test_t_d_equals_factorial():
    """T_D = D! = V/2."""
    assert IDENTITY_T_D_EQ_DFACT
    assert T_D == factorial(D)
    assert T_D == 6

def test_t_q_equals_v_plus_d():
    """T_q = V+D = 15."""
    assert IDENTITY_T_Q_EQ_VD
    assert T_Q == V + D
    assert T_Q == 15

def test_t_v_equals_dim_e6():
    """T_V = V(V+1)/2 = 78 = dim(E₆) — the triangular miracle."""
    assert IDENTITY_T_V_EQ_E6
    assert T_V == 78
    assert T_V == DIM_E6

def test_e_is_2_times_t_q():
    """E = 2T_q = 2×15 = 30."""
    assert IDENTITY_E_IS_2TQ
    assert T_Q_TIMES_2 == E

def test_triangular_chain():
    assert TRIANGULAR_CHAIN == [6, 15, 78]
    assert len(TRIANGULAR_CHAIN) == D


# ── Nuclear magic numbers ─────────────────────────────────────────────────────

def test_magic_20_is_F():
    """20 = F (directly a Cathedral integer)."""
    assert IDENTITY_MAGIC_20
    assert MAGIC_20 == 20

def test_magic_28():
    """28 = N+V+D."""
    assert IDENTITY_MAGIC_28
    assert MAGIC_28 == 28

def test_magic_50():
    """50 = E+F."""
    assert IDENTITY_MAGIC_50
    assert MAGIC_50 == 50

def test_magic_126():
    """126 = 2G+q+1."""
    assert IDENTITY_MAGIC_126
    assert MAGIC_126 == 126

def test_magic_cathedral_count():
    """At least 4 of 7 magic numbers are directly expressible."""
    assert MAGIC_CATHEDRAL_COUNT == 4


# ── Spectral index ────────────────────────────────────────────────────────────

def test_ns_denom_is_g_minus_d():
    """Denominator = G-D = 57."""
    assert IDENTITY_NS
    assert NS_DENOM == G - D
    assert NS_DENOM == 57

def test_ns_value():
    """n_s = 1-2/57 ≈ 0.9649."""
    assert abs(N_S - (1.0 - 2.0/57.0)) < 1e-14

def test_ns_error_tiny():
    """n_s prediction error < 0.01%."""
    assert N_S_ERR_PCT < 0.01

def test_ns_from_e6():
    """n_s = 1-2/(dim(E₆)-F-1) [G-D = dim(E₆)-F-1]."""
    assert IDENTITY_NS_FROM_E6


# ── Summary ───────────────────────────────────────────────────────────────────

def test_exceptional_lie_summary():
    s = exceptional_lie_summary()
    assert isinstance(s, dict)
    assert s["all_exceptional_exact"] is True
    assert s["dim_e8"] == 248
    assert s["t_v_eq_e6"] is True

def test_print_exceptional_lie_report(capsys):
    print_exceptional_lie_report()
    out = capsys.readouterr().out
    assert "EXCEPTIONAL" in out or "exceptional" in out.lower()

def test_print_report_contains_e8(capsys):
    print_exceptional_lie_report()
    out = capsys.readouterr().out
    assert "248" in out

def test_print_report_contains_nuclear(capsys):
    print_exceptional_lie_report()
    out = capsys.readouterr().out
    assert "28" in out and "50" in out

def test_print_report_contains_triangular(capsys):
    print_exceptional_lie_report()
    out = capsys.readouterr().out
    assert "78" in out and ("T_V" in out or "triangular" in out.lower() or "Triangular" in out)
