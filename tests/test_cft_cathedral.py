"""Tests for urt/cft_cathedral.py — 2D CFT central charges, Cathedral integers."""

import pytest
from fractions import Fraction
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_imports():
    from urt.cft_cathedral import (
        c_minimal, c_wzw_sun,
        C_ISING, C_TRICRIT, C_POTTS, C_YANG_LEE, C_M35,
        C_SU2_D, C_SU3_D, C_SUQ_D,
        MONSTER_CFT_C, BOSONIC_STRING_C, SUPERSTRING_C,
        RR_INDEX,
        IDENTITY_ISING_C, IDENTITY_TRICRITICAL_C, IDENTITY_POTTS_C,
        IDENTITY_YANG_LEE_C, IDENTITY_M35_C, IDENTITY_YANG_LEE_SQ,
        IDENTITY_TRICRIT_DENOM, IDENTITY_TRICRIT_NUM,
        IDENTITY_SU2_D_C, IDENTITY_SU3_D_C, IDENTITY_SUQ_D_C,
        IDENTITY_D_PLUS_Q_EQ_2D,
        IDENTITY_MONSTER_C, IDENTITY_BOSONIC_C, IDENTITY_SUPER_C,
        IDENTITY_RR_INDEX,
        C_SU2_WZW, C_SU3_WZW, C_SUQ_WZW, C_MONSTER, C_BOSONIC, C_SUPER,
        cft_summary, print_cft_report,
    )


# ── c_minimal formula ─────────────────────────────────────────────────────────

def test_c_minimal_formula_basic():
    """c(p,p') = 1 - 6(p-p')^2/(p×p') as a Fraction."""
    from urt.cft_cathedral import c_minimal
    # M(3,4): c = 1 - 6/12 = 1/2
    assert c_minimal(3, 4) == Fraction(1, 2)
    # M(4,5): c = 1 - 6/20 = 7/10
    assert c_minimal(4, 5) == Fraction(7, 10)
    # M(5,6): c = 1 - 6/30 = 4/5
    assert c_minimal(5, 6) == Fraction(4, 5)


def test_c_minimal_yang_lee():
    """M(2,5): c = 1 - 6×9/10 = -22/5."""
    from urt.cft_cathedral import c_minimal
    assert c_minimal(2, 5) == Fraction(-22, 5)


def test_c_minimal_m35():
    """M(3,5): c = 1 - 6×4/15 = -3/5."""
    from urt.cft_cathedral import c_minimal
    assert c_minimal(3, 5) == Fraction(-3, 5)


def test_c_minimal_returns_fraction():
    """c_minimal always returns a Fraction."""
    from urt.cft_cathedral import c_minimal
    result = c_minimal(3, 4)
    assert isinstance(result, Fraction)


# ── Ising model M(D, D+1) = M(3,4) ──────────────────────────────────────────

def test_ising_c_value():
    """Ising c = 1/2."""
    from urt.cft_cathedral import C_ISING
    assert C_ISING == Fraction(1, 2)


def test_ising_c_eq_1_over_D_minus1():
    """Ising c = 1/2 = 1/(D-1) where D-1=2."""
    from urt.cft_cathedral import IDENTITY_ISING_C, C_ISING
    from urt.shell_closure import D
    assert IDENTITY_ISING_C
    assert C_ISING == Fraction(1, D - 1)
    assert C_ISING == Fraction(1, 2)


def test_ising_labels_are_cathedral():
    """Ising model M(D, D+1): p=D=3, p'=D+1=4."""
    from urt.shell_closure import D
    assert D == 3
    assert D + 1 == 4


# ── Tricritical Ising M(D+1, D+2) = M(4,5) ──────────────────────────────────

def test_tricrit_c_value():
    """Tricritical Ising c = 7/10."""
    from urt.cft_cathedral import C_TRICRIT
    assert C_TRICRIT == Fraction(7, 10)


def test_tricrit_c_eq_Dfact1_over_2q():
    """Tricritical c = (D!+1)/(2q) = 7/10."""
    from urt.cft_cathedral import IDENTITY_TRICRITICAL_C, C_TRICRIT
    from urt.shell_closure import D, q
    assert IDENTITY_TRICRITICAL_C
    assert C_TRICRIT == Fraction(factorial(D) + 1, 2 * q)


def test_tricrit_numerator_7():
    """Tricritical numerator D!+1 = 7."""
    from urt.cft_cathedral import IDENTITY_TRICRIT_NUM
    from urt.shell_closure import D
    assert IDENTITY_TRICRIT_NUM
    assert factorial(D) + 1 == 7


def test_tricrit_denominator_10():
    """Tricritical denominator 2q = 10."""
    from urt.cft_cathedral import IDENTITY_TRICRIT_DENOM
    from urt.shell_closure import q
    assert IDENTITY_TRICRIT_DENOM
    assert 2 * q == 10


# ── 3-state Potts M(q, D!) = M(5,6) ─────────────────────────────────────────

def test_potts_c_value():
    """3-state Potts c = 4/5."""
    from urt.cft_cathedral import C_POTTS
    assert C_POTTS == Fraction(4, 5)


def test_potts_c_eq_D1_over_q():
    """Potts c = (D+1)/q = 4/5."""
    from urt.cft_cathedral import IDENTITY_POTTS_C, C_POTTS
    from urt.shell_closure import D, q
    assert IDENTITY_POTTS_C
    assert C_POTTS == Fraction(D + 1, q)


def test_potts_labels_cathedral():
    """Potts model M(q, D!): p=q=5, p'=D!=6."""
    from urt.shell_closure import D, q
    assert q == 5
    assert factorial(D) == 6


# ── Yang-Lee M(2, q) = M(2,5) ────────────────────────────────────────────────

def test_yang_lee_c_value():
    """Yang-Lee c = -22/5."""
    from urt.cft_cathedral import C_YANG_LEE
    assert C_YANG_LEE == Fraction(-22, 5)


def test_yang_lee_c_eq_neg22_over_q():
    """Yang-Lee c = -22/q."""
    from urt.cft_cathedral import IDENTITY_YANG_LEE_C, C_YANG_LEE
    from urt.shell_closure import q
    assert IDENTITY_YANG_LEE_C
    assert C_YANG_LEE == Fraction(-22, q)


def test_yang_lee_sq_eq_D2():
    """(q-2)^2 = (5-2)^2 = 9 = D^2 = 3^2."""
    from urt.cft_cathedral import IDENTITY_YANG_LEE_SQ
    from urt.shell_closure import D, q
    assert IDENTITY_YANG_LEE_SQ
    assert (q - 2)**2 == D**2 == 9


# ── M(D, q) = M(3,5) ─────────────────────────────────────────────────────────

def test_m35_c_value():
    """M(3,5) c = -3/5."""
    from urt.cft_cathedral import C_M35
    assert C_M35 == Fraction(-3, 5)


def test_m35_c_eq_neg_D_over_q():
    """M(3,5) c = -D/q."""
    from urt.cft_cathedral import IDENTITY_M35_C, C_M35
    from urt.shell_closure import D, q
    assert IDENTITY_M35_C
    assert C_M35 == Fraction(-D, q)


# ── WZW models at level k=D ───────────────────────────────────────────────────

def test_c_wzw_sun_formula():
    """c_wzw_sun(n,k) = k(n²-1)/(k+n) as Fraction."""
    from urt.cft_cathedral import c_wzw_sun
    # SU(2) at k=1: c = 1×3/(1+2) = 1
    assert c_wzw_sun(2, 1) == Fraction(1, 1)
    # SU(2) at k=3: c = 3×3/(3+2) = 9/5
    assert c_wzw_sun(2, 3) == Fraction(9, 5)


def test_c_wzw_returns_fraction():
    from urt.cft_cathedral import c_wzw_sun
    result = c_wzw_sun(2, 3)
    assert isinstance(result, Fraction)


def test_su2_D_c_value():
    """SU(2)_D at k=D=3: c = 9/5."""
    from urt.cft_cathedral import C_SU2_D
    assert C_SU2_D == Fraction(9, 5)


def test_su2_D_c_eq_D2_over_q():
    """SU(2)_D c = D²/q = 9/5."""
    from urt.cft_cathedral import IDENTITY_SU2_D_C, C_SU2_D
    from urt.shell_closure import D, q
    assert IDENTITY_SU2_D_C
    assert C_SU2_D == Fraction(D**2, q)


def test_su3_D_c_value():
    """SU(3)_D at k=D=3: c = 4."""
    from urt.cft_cathedral import C_SU3_D
    assert C_SU3_D == Fraction(4, 1)


def test_su3_D_c_eq_D_plus1():
    """SU(3)_D c = D+1 = 4."""
    from urt.cft_cathedral import IDENTITY_SU3_D_C, C_SU3_D
    from urt.shell_closure import D
    assert IDENTITY_SU3_D_C
    assert C_SU3_D == Fraction(D + 1, 1)


def test_suq_D_c_value():
    """SU(q)_D = SU(5)_3: c = 9."""
    from urt.cft_cathedral import C_SUQ_D
    assert C_SUQ_D == Fraction(9, 1)


def test_suq_D_c_eq_D_squared():
    """SU(q)_D c = D² = 9."""
    from urt.cft_cathedral import IDENTITY_SUQ_D_C, C_SUQ_D
    from urt.shell_closure import D
    assert IDENTITY_SUQ_D_C
    assert C_SUQ_D == Fraction(D**2, 1)


def test_D_plus_q_eq_2_to_D():
    """D + q = 3 + 5 = 8 = 2^D: Cathedral miracle for WZW denominator."""
    from urt.cft_cathedral import IDENTITY_D_PLUS_Q_EQ_2D
    from urt.shell_closure import D, q
    assert IDENTITY_D_PLUS_Q_EQ_2D
    assert D + q == 2**D == 8


# ── Monster CFT ───────────────────────────────────────────────────────────────

def test_monster_c_value():
    """Monster CFT c = 24."""
    from urt.cft_cathedral import MONSTER_CFT_C
    assert MONSTER_CFT_C == 24


def test_monster_c_eq_2V():
    """Monster CFT c = 2V = 2×12 = 24."""
    from urt.cft_cathedral import IDENTITY_MONSTER_C, MONSTER_CFT_C
    from urt.shell_closure import V
    assert IDENTITY_MONSTER_C
    assert MONSTER_CFT_C == 2 * V


def test_C_MONSTER_fraction():
    """C_MONSTER alias is a Fraction equal to 24."""
    from urt.cft_cathedral import C_MONSTER
    assert C_MONSTER == Fraction(24, 1)


# ── String theory central charges ─────────────────────────────────────────────

def test_bosonic_string_c_value():
    """Bosonic string c = 26."""
    from urt.cft_cathedral import BOSONIC_STRING_C
    assert BOSONIC_STRING_C == 26


def test_bosonic_c_eq_2N():
    """Bosonic string c = 2N = 2×13 = 26."""
    from urt.cft_cathedral import IDENTITY_BOSONIC_C, BOSONIC_STRING_C
    from urt.shell_closure import N
    assert IDENTITY_BOSONIC_C
    assert BOSONIC_STRING_C == 2 * N


def test_C_BOSONIC_fraction():
    """C_BOSONIC alias is a Fraction equal to 26."""
    from urt.cft_cathedral import C_BOSONIC
    assert C_BOSONIC == Fraction(26, 1)


def test_superstring_c_value():
    """Superstring c = 10."""
    from urt.cft_cathedral import SUPERSTRING_C
    assert SUPERSTRING_C == 10


def test_superstring_c_eq_2q():
    """Superstring c = 2q = 2×5 = 10."""
    from urt.cft_cathedral import IDENTITY_SUPER_C, SUPERSTRING_C
    from urt.shell_closure import q
    assert IDENTITY_SUPER_C
    assert SUPERSTRING_C == 2 * q


def test_C_SUPER_fraction():
    """C_SUPER alias is a Fraction equal to 10."""
    from urt.cft_cathedral import C_SUPER
    assert C_SUPER == Fraction(10, 1)


# ── Rogers-Ramanujan connection ───────────────────────────────────────────────

def test_rr_index_is_q():
    """Rogers-Ramanujan index = q = 5."""
    from urt.cft_cathedral import RR_INDEX, IDENTITY_RR_INDEX
    from urt.shell_closure import q
    assert IDENTITY_RR_INDEX
    assert RR_INDEX == q
    assert RR_INDEX == 5


# ── WZW aliases ───────────────────────────────────────────────────────────────

def test_wzw_aliases():
    """C_SU2_WZW, C_SU3_WZW, C_SUQ_WZW match the primary constants."""
    from urt.cft_cathedral import C_SU2_WZW, C_SU3_WZW, C_SUQ_WZW, C_SU2_D, C_SU3_D, C_SUQ_D
    assert C_SU2_WZW == C_SU2_D
    assert C_SU3_WZW == C_SU3_D
    assert C_SUQ_WZW == C_SUQ_D


# ── Cross-consistency checks ──────────────────────────────────────────────────

def test_bosonic_eq_f4_rep_26():
    """Bosonic string c = 26 = F₄ dim-26 = 2N (cross-module)."""
    from urt.cft_cathedral import BOSONIC_STRING_C
    from urt.shell_closure import N
    assert BOSONIC_STRING_C == 2 * N == 26


def test_superstring_eq_wzw_suq():
    """Superstring c = 10 = 2q; SU(q)_D WZW has c = D² = 9 (distinct)."""
    from urt.cft_cathedral import SUPERSTRING_C, C_SUQ_D
    from urt.shell_closure import q
    assert SUPERSTRING_C == 2 * q
    # Different: c=10 vs c=9 (both Cathedral)
    assert SUPERSTRING_C != C_SUQ_D


def test_monster_bosonic_super_order():
    """Monster c=24 < bosonic c=26, both larger than superstring c=10."""
    from urt.cft_cathedral import MONSTER_CFT_C, BOSONIC_STRING_C, SUPERSTRING_C
    assert SUPERSTRING_C < MONSTER_CFT_C < BOSONIC_STRING_C


# ── Summary function ──────────────────────────────────────────────────────────

def test_cft_summary_returns_dict():
    from urt.cft_cathedral import cft_summary
    s = cft_summary()
    assert isinstance(s, dict)


def test_cft_summary_all_identities_true():
    from urt.cft_cathedral import cft_summary
    s = cft_summary()
    for key, val in s.items():
        if isinstance(val, bool):
            assert val, f"Summary identity {key!r} is False"


def test_cft_summary_keys():
    from urt.cft_cathedral import cft_summary
    s = cft_summary()
    required = [
        "c_ising", "c_tricrit", "c_potts", "c_yang_lee", "c_m35",
        "c_su2_D", "c_su3_D", "c_suq_D",
        "monster_c", "bosonic_string_c", "superstring_c",
        "rr_index", "D", "N", "V", "q", "G",
    ]
    for key in required:
        assert key in s, f"Missing key {key!r} in summary"


def test_cft_summary_cathedral_integers():
    from urt.cft_cathedral import cft_summary
    s = cft_summary()
    assert s["D"] == 3
    assert s["N"] == 13
    assert s["V"] == 12
    assert s["q"] == 5
    assert s["G"] == 60
    assert s["D_factorial"] == 6


def test_cft_summary_c_strings():
    """Summary c_ entries are string-form fractions."""
    from urt.cft_cathedral import cft_summary
    s = cft_summary()
    # Parse back and check values
    assert Fraction(s["c_ising"]) == Fraction(1, 2)
    assert Fraction(s["c_tricrit"]) == Fraction(7, 10)
    assert Fraction(s["c_potts"]) == Fraction(4, 5)
    assert Fraction(s["c_yang_lee"]) == Fraction(-22, 5)
    assert Fraction(s["c_m35"]) == Fraction(-3, 5)


def test_print_cft_report_runs(capsys):
    from urt.cft_cathedral import print_cft_report
    print_cft_report()
    out = capsys.readouterr().out
    assert "CFT CATHEDRAL" in out
    assert "Ising" in out
    assert "Monster" in out
    assert "Bosonic" in out
