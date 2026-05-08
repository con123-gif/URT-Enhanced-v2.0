"""Tests for urt/lie_reps_cathedral.py — Exceptional Lie algebra reps, Cathedral integers."""

import pytest
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_imports():
    from urt.lie_reps_cathedral import (
        G2_REPS, F4_REPS_KEY, E6_REPS_KEY, E7_REPS_KEY, E8_REPS_KEY,
        IDENTITY_G2_7, IDENTITY_G2_14, IDENTITY_G2_27, IDENTITY_G2_64,
        IDENTITY_G2_77, IDENTITY_G2_182, IDENTITY_G2_189, IDENTITY_G2_273,
        IDENTITY_G2_729, IDENTITY_G2_1728,
        IDENTITY_F4_26, IDENTITY_F4_52, IDENTITY_F4_273, IDENTITY_F4_324,
        IDENTITY_F4_1053, IDENTITY_F4_4096, IDENTITY_F4_8424,
        IDENTITY_E6_27, IDENTITY_E6_78, IDENTITY_E6_351, IDENTITY_E6_2925,
        IDENTITY_E7_56, IDENTITY_E7_133, IDENTITY_E7_912,
        IDENTITY_E8_248,
        IDENTITY_F4_26_EQ_BOSONIC_STRING, IDENTITY_G2_64_EQ_CC_EXP,
        IDENTITY_G2_1728_EQ_J_INVARIANT, IDENTITY_E7_912_NS_DENOMINATOR,
        IDENTITY_G2_F4_SHARED_273, IDENTITY_E6_78_TRIANGULAR_V,
        lie_reps_summary, print_lie_reps_report,
    )


# ── G₂ representation identities ─────────────────────────────────────────────

def test_G2_reps_list_contains_all():
    from urt.lie_reps_cathedral import G2_REPS
    for expected in [7, 14, 27, 64, 77, 182, 189, 273, 729, 1728]:
        assert expected in G2_REPS


def test_G2_7_eq_Dfact_plus1():
    """G₂ dim-7 rep: 7 = D! + 1 = 3! + 1."""
    from urt.lie_reps_cathedral import IDENTITY_G2_7, G2_DIM_7
    from urt.shell_closure import D
    assert IDENTITY_G2_7
    assert G2_DIM_7 == factorial(D) + 1
    assert G2_DIM_7 == 7


def test_G2_14_eq_N_plus1():
    """G₂ adjoint dim-14: 14 = N + 1 = 13 + 1."""
    from urt.lie_reps_cathedral import IDENTITY_G2_14, G2_DIM_14
    from urt.shell_closure import N
    assert IDENTITY_G2_14
    assert G2_DIM_14 == N + 1
    assert G2_DIM_14 == 14


def test_G2_27_eq_D_cubed():
    """G₂ dim-27: 27 = D^D = 3^3."""
    from urt.lie_reps_cathedral import IDENTITY_G2_27, G2_DIM_27
    from urt.shell_closure import D
    assert IDENTITY_G2_27
    assert G2_DIM_27 == D**D
    assert G2_DIM_27 == 27


def test_G2_64_eq_D1_to_D():
    """G₂ dim-64: 64 = (D+1)^D = 4^3 = CC exponent."""
    from urt.lie_reps_cathedral import IDENTITY_G2_64, G2_DIM_64
    from urt.shell_closure import D
    assert IDENTITY_G2_64
    assert G2_DIM_64 == (D + 1)**D
    assert G2_DIM_64 == 64


def test_G2_77_identity():
    """G₂ dim-77: 77 = (D!+1)(2D+q) = 7×11."""
    from urt.lie_reps_cathedral import IDENTITY_G2_77, G2_DIM_77
    from urt.shell_closure import D, q
    assert IDENTITY_G2_77
    assert G2_DIM_77 == (factorial(D) + 1) * (2 * D + q)
    assert G2_DIM_77 == 77


def test_G2_182_identity():
    """G₂ dim-182: 182 = 2×(D!+1)×N = 2×7×13."""
    from urt.lie_reps_cathedral import IDENTITY_G2_182, G2_DIM_182
    from urt.shell_closure import D, N
    assert IDENTITY_G2_182
    assert G2_DIM_182 == 2 * (factorial(D) + 1) * N
    assert G2_DIM_182 == 182


def test_G2_189_identity():
    """G₂ dim-189: 189 = D^D × (D!+1) = 27×7."""
    from urt.lie_reps_cathedral import IDENTITY_G2_189, G2_DIM_189
    from urt.shell_closure import D
    assert IDENTITY_G2_189
    assert G2_DIM_189 == D**D * (factorial(D) + 1)
    assert G2_DIM_189 == 189


def test_G2_273_identity():
    """G₂ dim-273: 273 = D×(D!+1)×N = 3×7×13."""
    from urt.lie_reps_cathedral import IDENTITY_G2_273, G2_DIM_273
    from urt.shell_closure import D, N
    assert IDENTITY_G2_273
    assert G2_DIM_273 == D * (factorial(D) + 1) * N
    assert G2_DIM_273 == 273


def test_G2_729_identity():
    """G₂ dim-729: 729 = D^(D!) = 3^6."""
    from urt.lie_reps_cathedral import IDENTITY_G2_729, G2_DIM_729
    from urt.shell_closure import D
    assert IDENTITY_G2_729
    assert G2_DIM_729 == D**factorial(D)
    assert G2_DIM_729 == 729


def test_G2_1728_eq_V_cubed():
    """G₂ dim-1728: 1728 = V^3 = 12^3 = j-invariant j(i)."""
    from urt.lie_reps_cathedral import IDENTITY_G2_1728, G2_DIM_1728
    from urt.shell_closure import V
    assert IDENTITY_G2_1728
    assert G2_DIM_1728 == V**3
    assert G2_DIM_1728 == 1728


# ── F₄ representation identities ─────────────────────────────────────────────

def test_F4_reps_key_contains_all():
    from urt.lie_reps_cathedral import F4_REPS_KEY
    for expected in [26, 52, 273, 324, 1053, 4096, 8424]:
        assert expected in F4_REPS_KEY


def test_F4_26_eq_2N():
    """F₄ dim-26: 26 = 2N = bosonic string critical dimension."""
    from urt.lie_reps_cathedral import IDENTITY_F4_26, F4_DIM_26
    from urt.shell_closure import N
    assert IDENTITY_F4_26
    assert F4_DIM_26 == 2 * N
    assert F4_DIM_26 == 26


def test_F4_52_eq_N_D1():
    """F₄ adjoint dim-52: 52 = N×(D+1) = 13×4."""
    from urt.lie_reps_cathedral import IDENTITY_F4_52, F4_DIM_52
    from urt.shell_closure import N, D
    assert IDENTITY_F4_52
    assert F4_DIM_52 == N * (D + 1)
    assert F4_DIM_52 == 52


def test_F4_273_identity():
    """F₄ dim-273: 273 = D×(D!+1)×N = 3×7×13."""
    from urt.lie_reps_cathedral import IDENTITY_F4_273, F4_DIM_273
    from urt.shell_closure import D, N
    assert IDENTITY_F4_273
    assert F4_DIM_273 == D * (factorial(D) + 1) * N
    assert F4_DIM_273 == 273


def test_F4_324_eq_D1_times_81():
    """F₄ dim-324: 324 = (D+1)×81 = 4×81."""
    from urt.lie_reps_cathedral import IDENTITY_F4_324, F4_DIM_324, GAMMA_INV
    from urt.shell_closure import D
    assert IDENTITY_F4_324
    assert F4_DIM_324 == (D + 1) * GAMMA_INV
    assert F4_DIM_324 == 324


def test_F4_1053_eq_81_times_N():
    """F₄ dim-1053: 1053 = 81×N = γ_inv × N."""
    from urt.lie_reps_cathedral import IDENTITY_F4_1053, F4_DIM_1053, GAMMA_INV
    from urt.shell_closure import N
    assert IDENTITY_F4_1053
    assert F4_DIM_1053 == GAMMA_INV * N
    assert F4_DIM_1053 == 1053


def test_F4_4096_eq_2_to_V():
    """F₄ dim-4096: 4096 = 2^V = 2^12."""
    from urt.lie_reps_cathedral import IDENTITY_F4_4096, F4_DIM_4096
    from urt.shell_closure import V
    assert IDENTITY_F4_4096
    assert F4_DIM_4096 == 2**V
    assert F4_DIM_4096 == 4096


def test_F4_8424_eq_2D_81_N():
    """F₄ dim-8424: 8424 = 2^D × 81 × N = 8×81×13."""
    from urt.lie_reps_cathedral import IDENTITY_F4_8424, F4_DIM_8424, GAMMA_INV
    from urt.shell_closure import D, N
    assert IDENTITY_F4_8424
    assert F4_DIM_8424 == 2**D * GAMMA_INV * N
    assert F4_DIM_8424 == 8424


# ── E₆ representation identities ─────────────────────────────────────────────

def test_E6_reps_key_contains_all():
    from urt.lie_reps_cathedral import E6_REPS_KEY
    for expected in [27, 78, 351, 2925]:
        assert expected in E6_REPS_KEY


def test_E6_27_eq_D_cubed():
    """E₆ fundamental dim-27: 27 = D^D (Albert algebra dimension)."""
    from urt.lie_reps_cathedral import IDENTITY_E6_27, E6_DIM_27
    from urt.shell_closure import D
    assert IDENTITY_E6_27
    assert E6_DIM_27 == D**D
    assert E6_DIM_27 == 27


def test_E6_78_eq_triangular_V():
    """E₆ adjoint dim-78: 78 = V(V+1)/2 = triangular number T_V."""
    from urt.lie_reps_cathedral import IDENTITY_E6_78, E6_DIM_78
    from urt.shell_closure import V
    assert IDENTITY_E6_78
    assert E6_DIM_78 == V * (V + 1) // 2
    assert E6_DIM_78 == 78


def test_E6_351_eq_D3_N():
    """E₆ dim-351: 351 = D^D × N = 27×13."""
    from urt.lie_reps_cathedral import IDENTITY_E6_351, E6_DIM_351
    from urt.shell_closure import D, N
    assert IDENTITY_E6_351
    assert E6_DIM_351 == D**D * N
    assert E6_DIM_351 == 351


def test_E6_2925_eq_q2_D2_N():
    """E₆ dim-2925: 2925 = q² × D² × N = 25×9×13."""
    from urt.lie_reps_cathedral import IDENTITY_E6_2925, E6_DIM_2925
    from urt.shell_closure import D, N, q
    assert IDENTITY_E6_2925
    assert E6_DIM_2925 == q**2 * D**2 * N
    assert E6_DIM_2925 == 2925


# ── E₇ representation identities ─────────────────────────────────────────────

def test_E7_reps_key_contains_all():
    from urt.lie_reps_cathedral import E7_REPS_KEY
    for expected in [56, 133, 912]:
        assert expected in E7_REPS_KEY


def test_E7_56_eq_2D_Dfact1():
    """E₇ dim-56: 56 = 2^D × (D!+1) = 8×7."""
    from urt.lie_reps_cathedral import IDENTITY_E7_56, E7_DIM_56
    from urt.shell_closure import D
    assert IDENTITY_E7_56
    assert E7_DIM_56 == 2**D * (factorial(D) + 1)
    assert E7_DIM_56 == 56


def test_E7_133_eq_2G_plus_N():
    """E₇ adjoint dim-133: 133 = 2G + N = 120 + 13."""
    from urt.lie_reps_cathedral import IDENTITY_E7_133, E7_DIM_133
    from urt.shell_closure import G, N
    assert IDENTITY_E7_133
    assert E7_DIM_133 == 2 * G + N
    assert E7_DIM_133 == 133


def test_E7_912_eq_2D1_times_GmD():
    """E₇ dim-912: 912 = 2^(D+1) × (G−D) = 16×57."""
    from urt.lie_reps_cathedral import IDENTITY_E7_912, E7_DIM_912
    from urt.shell_closure import D, G
    assert IDENTITY_E7_912
    assert E7_DIM_912 == 2**(D + 1) * (G - D)
    assert E7_DIM_912 == 912


def test_E7_912_factor_57():
    """G − D = 57 = the n_s spectral-tilt denominator."""
    from urt.lie_reps_cathedral import IDENTITY_E7_912_NS_DENOMINATOR
    from urt.shell_closure import G, D
    assert IDENTITY_E7_912_NS_DENOMINATOR
    assert G - D == 57


# ── E₈ representation identity ────────────────────────────────────────────────

def test_E8_248_eq_2D_2q_minus1():
    """E₈ adjoint dim-248: 248 = 2^D × (2^q − 1) = 8×31."""
    from urt.lie_reps_cathedral import IDENTITY_E8_248, E8_DIM_248
    from urt.shell_closure import D, q
    assert IDENTITY_E8_248
    assert E8_DIM_248 == 2**D * (2**q - 1)
    assert E8_DIM_248 == 248


def test_E8_reps_key_contains_248():
    from urt.lie_reps_cathedral import E8_REPS_KEY
    assert 248 in E8_REPS_KEY


# ── Cross-module miracles ─────────────────────────────────────────────────────

def test_F4_26_equals_bosonic_string_dim():
    """F₄ rep 26 = bosonic string critical dimension = 2N."""
    from urt.lie_reps_cathedral import IDENTITY_F4_26_EQ_BOSONIC_STRING
    assert IDENTITY_F4_26_EQ_BOSONIC_STRING


def test_G2_64_equals_CC_exponent():
    """G₂ rep 64 = (D+1)^D = CC exponent."""
    from urt.lie_reps_cathedral import IDENTITY_G2_64_EQ_CC_EXP
    assert IDENTITY_G2_64_EQ_CC_EXP


def test_G2_1728_equals_j_invariant():
    """G₂ rep 1728 = V^3 = j(i), the j-invariant at i."""
    from urt.lie_reps_cathedral import IDENTITY_G2_1728_EQ_J_INVARIANT
    assert IDENTITY_G2_1728_EQ_J_INVARIANT


def test_G2_F4_share_dim_273():
    """Both G₂ and F₄ have a 273-dimensional representation."""
    from urt.lie_reps_cathedral import IDENTITY_G2_F4_SHARED_273, G2_DIM_273, F4_DIM_273
    assert IDENTITY_G2_F4_SHARED_273
    assert G2_DIM_273 == F4_DIM_273 == 273


def test_E6_78_is_triangular():
    """E₆ adjoint dim-78 is the triangular number T₁₂ = V(V+1)/2."""
    from urt.lie_reps_cathedral import IDENTITY_E6_78_TRIANGULAR_V
    assert IDENTITY_E6_78_TRIANGULAR_V


# ── Numerical sanity checks ────────────────────────────────────────────────────

def test_G2_7_value():
    from urt.lie_reps_cathedral import G2_DIM_7
    assert G2_DIM_7 == 7


def test_G2_14_value():
    from urt.lie_reps_cathedral import G2_DIM_14
    assert G2_DIM_14 == 14


def test_F4_26_value():
    from urt.lie_reps_cathedral import F4_DIM_26
    assert F4_DIM_26 == 26


def test_F4_52_value():
    from urt.lie_reps_cathedral import F4_DIM_52
    assert F4_DIM_52 == 52


def test_E6_78_value():
    from urt.lie_reps_cathedral import E6_DIM_78
    assert E6_DIM_78 == 78


def test_E7_56_value():
    from urt.lie_reps_cathedral import E7_DIM_56
    assert E7_DIM_56 == 56


def test_E7_133_value():
    from urt.lie_reps_cathedral import E7_DIM_133
    assert E7_DIM_133 == 133


# ── Summary function ──────────────────────────────────────────────────────────

def test_lie_reps_summary_returns_dict():
    from urt.lie_reps_cathedral import lie_reps_summary
    s = lie_reps_summary()
    assert isinstance(s, dict)


def test_lie_reps_summary_all_identities_true():
    from urt.lie_reps_cathedral import lie_reps_summary
    s = lie_reps_summary()
    identity_keys = [k for k in s if k.startswith("G2_") or k.startswith("F4_")
                     or k.startswith("E6_") or k.startswith("E7_") or k.startswith("E8_")]
    for key in identity_keys:
        val = s[key]
        if isinstance(val, bool):
            assert val, f"Summary identity {key!r} is False"


def test_lie_reps_summary_keys():
    from urt.lie_reps_cathedral import lie_reps_summary
    s = lie_reps_summary()
    for key in ["G2_reps", "F4_reps_key", "E6_reps_key", "E7_reps_key", "E8_reps_key",
                "D", "N", "V", "q", "G", "D_factorial", "GAMMA_INV"]:
        assert key in s, f"Missing key {key!r} in summary"


def test_lie_reps_summary_cathedral_integers():
    from urt.lie_reps_cathedral import lie_reps_summary
    s = lie_reps_summary()
    assert s["D"] == 3
    assert s["N"] == 13
    assert s["V"] == 12
    assert s["q"] == 5
    assert s["G"] == 60
    assert s["D_factorial"] == 6
    assert s["GAMMA_INV"] == 81


def test_print_lie_reps_report_runs(capsys):
    from urt.lie_reps_cathedral import print_lie_reps_report
    print_lie_reps_report()
    out = capsys.readouterr().out
    assert "LIE REPRESENTATION CATHEDRAL" in out
    assert "G₂" in out
    assert "F₄" in out
    assert "E₈" in out
