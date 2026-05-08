"""Tests for urt/continued_fractions_cathedral.py — Cathedral CF identities.

Covers: cf_sqrt, cf_period_length, cf_convergents, all period/quotient
identities for √D, √q, √N, √V, √E, √G and φ, Pell equation solutions,
convergent miracle, aggregate flags, summary dict, and print report.
"""

import pytest
from math import factorial, isqrt


# ── Cathedral constants used in assertions ─────────────────────────────────────
_D  = 3
_N  = 13
_V  = 12
_E  = 30
_q  = 5
_G  = 60
_DFACT = factorial(_D)   # 6


# ── Imports ────────────────────────────────────────────────────────────────────

def test_module_imports():
    """All public names import without error."""
    from urt.continued_fractions_cathedral import (
        # functions
        cf_sqrt, cf_period_length, cf_convergents,
        # CF(phi)
        CF_PHI_QUOT, N_CF_PHI_QUOT,
        # CF(sqrt(D))
        CF_SQRT_D_A0, CF_SQRT_D_PERIOD, PERIOD_SQRT_D,
        # CF(sqrt(q))
        CF_SQRT_q_A0, CF_SQRT_q_PERIOD, PERIOD_SQRT_q, CF_SQRT_q_QUOT,
        # CF(sqrt(N))
        CF_SQRT_N_A0, CF_SQRT_N_PERIOD, PERIOD_SQRT_N,
        LAST_QUOT_SQRT_N, SUM_PERIOD_SQRT_N,
        # CF(sqrt(V))
        CF_SQRT_V_A0, CF_SQRT_V_PERIOD, PERIOD_SQRT_V, CF_SQRT_V_A0_VAL,
        # CF(sqrt(E))
        CF_SQRT_E_A0, CF_SQRT_E_PERIOD, PERIOD_SQRT_E, CF_SQRT_E_A0_VAL,
        # CF(sqrt(G))
        CF_SQRT_G_A0, CF_SQRT_G_PERIOD, PERIOD_SQRT_G, CF_SQRT_G_A0_VAL,
        # Convergent
        CONVERGENT_K4_SQRT_N,
        # Pell
        PELL_D_X, PELL_D_Y, PELL_q_X, PELL_q_Y, PELL_N_X, PELL_N_Y,
        # Identity flags
        IDENTITY_CF_PHI_QUOT,
        IDENTITY_PERIOD_SQRT_D, IDENTITY_CF_SQRT_D_A0, IDENTITY_CF_SQRT_D_QUOTS,
        IDENTITY_PERIOD_SQRT_q, IDENTITY_CF_SQRT_q_QUOT,
        IDENTITY_PERIOD_SQRT_N, IDENTITY_CF_SQRT_N_A0,
        IDENTITY_LAST_QUOT_SQRT_N, IDENTITY_SUM_PERIOD_SQRT_N,
        IDENTITY_FIRST_QUOTS_SQRT_N,
        IDENTITY_PERIOD_SQRT_V, IDENTITY_CF_SQRT_V_A0, IDENTITY_CF_SQRT_V_QUOTS,
        IDENTITY_CF_SQRT_E_A0, IDENTITY_PERIOD_SQRT_E, IDENTITY_LAST_QUOT_SQRT_E,
        IDENTITY_CF_SQRT_G_A0, IDENTITY_PERIOD_SQRT_G,
        IDENTITY_CF_SQRT_G_FIRST_QUOT, IDENTITY_CF_SQRT_G_SECOND_QUOT,
        IDENTITY_CF_SQRT_G_LAST_QUOT,
        IDENTITY_CONVERGENT_K4,
        IDENTITY_PELL_D_X, IDENTITY_PELL_D_SOLUTION,
        IDENTITY_PELL_q_X, IDENTITY_PELL_q_Y, IDENTITY_PELL_q_SOLUTION,
        IDENTITY_PELL_N_SOLUTION,
        # Aggregate
        ALL_CF_IDENTITIES, ALL_CF_EXACT,
        # Summary / report
        cf_summary, print_cf_report,
    )


# ── Section 1: cf_sqrt() helper ───────────────────────────────────────────────

def test_cf_sqrt_perfect_square():
    """Perfect squares return empty period."""
    from urt.continued_fractions_cathedral import cf_sqrt
    a0, period = cf_sqrt(4)
    assert a0 == 2
    assert period == []


def test_cf_sqrt_9():
    """cf_sqrt(9) is perfect square."""
    from urt.continued_fractions_cathedral import cf_sqrt
    a0, period = cf_sqrt(9)
    assert a0 == 3
    assert period == []


def test_cf_sqrt_2():
    """CF(√2) = [1; 2, 2, 2, ...] period=[2]."""
    from urt.continued_fractions_cathedral import cf_sqrt
    a0, period = cf_sqrt(2)
    assert a0 == 1
    assert period == [2]


def test_cf_sqrt_3():
    """CF(√3) = [1; 1, 2] period=[1,2]."""
    from urt.continued_fractions_cathedral import cf_sqrt
    a0, period = cf_sqrt(3)
    assert a0 == 1
    assert period == [1, 2]


def test_cf_sqrt_5():
    """CF(√5) = [2; 4] period=[4]."""
    from urt.continued_fractions_cathedral import cf_sqrt
    a0, period = cf_sqrt(5)
    assert a0 == 2
    assert period == [4]


def test_cf_sqrt_13():
    """CF(√13) = [3; 1,1,1,1,6] — the star expansion."""
    from urt.continued_fractions_cathedral import cf_sqrt
    a0, period = cf_sqrt(13)
    assert a0 == 3
    assert period == [1, 1, 1, 1, 6]


def test_cf_sqrt_12():
    """CF(√12) = [3; 2, 6]."""
    from urt.continued_fractions_cathedral import cf_sqrt
    a0, period = cf_sqrt(12)
    assert a0 == 3
    assert period == [2, 6]


def test_cf_sqrt_30():
    """CF(√30) = [5; 2, 10]."""
    from urt.continued_fractions_cathedral import cf_sqrt
    a0, period = cf_sqrt(30)
    assert a0 == 5
    assert period == [2, 10]


def test_cf_sqrt_60():
    """CF(√60) = [7; 1, 2, 1, 14]."""
    from urt.continued_fractions_cathedral import cf_sqrt
    a0, period = cf_sqrt(60)
    assert a0 == 7
    assert period == [1, 2, 1, 14]


# ── Section 2: cf_period_length() ─────────────────────────────────────────────

def test_cf_period_length_perfect_square():
    """Period length is 0 for perfect squares."""
    from urt.continued_fractions_cathedral import cf_period_length
    assert cf_period_length(4) == 0
    assert cf_period_length(9) == 0
    assert cf_period_length(16) == 0


def test_cf_period_length_sqrt3():
    """Period of √3 = 2."""
    from urt.continued_fractions_cathedral import cf_period_length
    assert cf_period_length(3) == 2


def test_cf_period_length_sqrt5():
    """Period of √5 = 1."""
    from urt.continued_fractions_cathedral import cf_period_length
    assert cf_period_length(5) == 1


def test_cf_period_length_sqrt13():
    """Period of √13 = 5."""
    from urt.continued_fractions_cathedral import cf_period_length
    assert cf_period_length(13) == 5


# ── Section 3: cf_convergents() ───────────────────────────────────────────────

def test_cf_convergents_sqrt2_first():
    """First convergent of √2 is 1/1."""
    from urt.continued_fractions_cathedral import cf_convergents
    convs = cf_convergents(1, [2], 1)
    assert convs[0] == (1, 1)


def test_cf_convergents_sqrt2_list():
    """Convergents of √2: 1/1, 3/2, 7/5, 17/12, 41/29."""
    from urt.continued_fractions_cathedral import cf_convergents
    convs = cf_convergents(1, [2], 5)
    expected = [(1, 1), (3, 2), (7, 5), (17, 12), (41, 29)]
    assert convs == expected


def test_cf_convergents_empty_period():
    """Convergents with empty period returns only a0/1."""
    from urt.continued_fractions_cathedral import cf_convergents
    convs = cf_convergents(3, [], 1)
    assert convs[0] == (3, 1)


def test_cf_convergents_sqrt13_k4_denom():
    """4th-index convergent denominator of √13 = 5 = q."""
    from urt.continued_fractions_cathedral import cf_convergents, CF_SQRT_N_A0, CF_SQRT_N_PERIOD
    convs = cf_convergents(CF_SQRT_N_A0, CF_SQRT_N_PERIOD, 6)
    # k_4 denominator (0-indexed index 4)
    assert convs[4][1] == _q


# ── Section 4: CF(φ) ──────────────────────────────────────────────────────────

def test_cf_phi_quot_value():
    """CF(φ) all quotients = 1."""
    from urt.continued_fractions_cathedral import CF_PHI_QUOT
    assert CF_PHI_QUOT == 1


def test_cf_phi_quot_eq_D_minus_2():
    """CF(φ) quotient = D−2 (Cathedral connection)."""
    from urt.continued_fractions_cathedral import N_CF_PHI_QUOT
    assert N_CF_PHI_QUOT == _D - 2


def test_identity_cf_phi_quot():
    """IDENTITY_CF_PHI_QUOT is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_PHI_QUOT
    assert IDENTITY_CF_PHI_QUOT


# ── Section 5: CF(√D) = CF(√3) ────────────────────────────────────────────────

def test_period_sqrt_D_equals_D_minus_1():
    """CF(√3) has period = 2 = D−1."""
    from urt.continued_fractions_cathedral import PERIOD_SQRT_D
    assert PERIOD_SQRT_D == _D - 1


def test_cf_sqrt_D_a0():
    """CF(√3) a₀ = 1 = D−2."""
    from urt.continued_fractions_cathedral import CF_SQRT_D_A0
    assert CF_SQRT_D_A0 == _D - 2


def test_cf_sqrt_D_quotients():
    """CF(√3) period quotients = {D−2, D−1} = {1, 2}."""
    from urt.continued_fractions_cathedral import CF_SQRT_D_PERIOD
    assert set(CF_SQRT_D_PERIOD) == {_D - 2, _D - 1}


def test_identity_period_sqrt_D():
    """IDENTITY_PERIOD_SQRT_D is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PERIOD_SQRT_D
    assert IDENTITY_PERIOD_SQRT_D


def test_identity_cf_sqrt_D_a0():
    """IDENTITY_CF_SQRT_D_A0 is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_D_A0
    assert IDENTITY_CF_SQRT_D_A0


def test_identity_cf_sqrt_D_quots():
    """IDENTITY_CF_SQRT_D_QUOTS is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_D_QUOTS
    assert IDENTITY_CF_SQRT_D_QUOTS


# ── Section 6: CF(√q) = CF(√5) ────────────────────────────────────────────────

def test_period_sqrt_q_equals_D_minus_2():
    """CF(√5) period = 1 = D−2."""
    from urt.continued_fractions_cathedral import PERIOD_SQRT_q
    assert PERIOD_SQRT_q == _D - 2


def test_cf_sqrt_q_recurring_quot():
    """CF(√5) recurring quotient = 4 = D+1."""
    from urt.continued_fractions_cathedral import CF_SQRT_q_QUOT
    assert CF_SQRT_q_QUOT == _D + 1


def test_identity_period_sqrt_q():
    """IDENTITY_PERIOD_SQRT_q is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PERIOD_SQRT_q
    assert IDENTITY_PERIOD_SQRT_q


def test_identity_cf_sqrt_q_quot():
    """IDENTITY_CF_SQRT_q_QUOT is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_q_QUOT
    assert IDENTITY_CF_SQRT_q_QUOT


# ── Section 7: CF(√N) = CF(√13) — STAR IDENTITY ──────────────────────────────

def test_period_sqrt_N_equals_q():
    """THE STAR TEST: CF(√13) period = q = 5."""
    from urt.continued_fractions_cathedral import PERIOD_SQRT_N
    assert PERIOD_SQRT_N == _q


def test_period_sqrt_N_numeric():
    """CF(√13) period is exactly 5."""
    from urt.continued_fractions_cathedral import PERIOD_SQRT_N
    assert PERIOD_SQRT_N == 5


def test_cf_sqrt_N_a0_equals_D():
    """CF(√13) a₀ = 3 = D."""
    from urt.continued_fractions_cathedral import CF_SQRT_N_A0
    assert CF_SQRT_N_A0 == _D


def test_cf_sqrt_N_last_quot_equals_D_fact():
    """Last quotient of CF(√13) period = 6 = D!."""
    from urt.continued_fractions_cathedral import LAST_QUOT_SQRT_N
    assert LAST_QUOT_SQRT_N == _DFACT


def test_cf_sqrt_N_sum_period_equals_2q():
    """Sum of CF(√13) period = 10 = 2q."""
    from urt.continued_fractions_cathedral import SUM_PERIOD_SQRT_N
    assert SUM_PERIOD_SQRT_N == 2 * _q


def test_cf_sqrt_N_first_quots_all_one():
    """First four quotients of CF(√13) period are all 1 = D−2."""
    from urt.continued_fractions_cathedral import CF_SQRT_N_PERIOD
    assert all(x == _D - 2 for x in CF_SQRT_N_PERIOD[:-1])


def test_cf_sqrt_N_period_list():
    """CF(√13) period is exactly [1, 1, 1, 1, 6]."""
    from urt.continued_fractions_cathedral import CF_SQRT_N_PERIOD
    assert CF_SQRT_N_PERIOD == [1, 1, 1, 1, 6]


def test_identity_period_sqrt_N():
    """IDENTITY_PERIOD_SQRT_N is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PERIOD_SQRT_N
    assert IDENTITY_PERIOD_SQRT_N


def test_identity_cf_sqrt_N_a0():
    """IDENTITY_CF_SQRT_N_A0 is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_N_A0
    assert IDENTITY_CF_SQRT_N_A0


def test_identity_last_quot_sqrt_N():
    """IDENTITY_LAST_QUOT_SQRT_N is True."""
    from urt.continued_fractions_cathedral import IDENTITY_LAST_QUOT_SQRT_N
    assert IDENTITY_LAST_QUOT_SQRT_N


def test_identity_sum_period_sqrt_N():
    """IDENTITY_SUM_PERIOD_SQRT_N is True."""
    from urt.continued_fractions_cathedral import IDENTITY_SUM_PERIOD_SQRT_N
    assert IDENTITY_SUM_PERIOD_SQRT_N


def test_identity_first_quots_sqrt_N():
    """IDENTITY_FIRST_QUOTS_SQRT_N is True."""
    from urt.continued_fractions_cathedral import IDENTITY_FIRST_QUOTS_SQRT_N
    assert IDENTITY_FIRST_QUOTS_SQRT_N


# ── Section 8: CF(√V) = CF(√12) ───────────────────────────────────────────────

def test_period_sqrt_V_equals_D_minus_1():
    """CF(√12) period = 2 = D−1."""
    from urt.continued_fractions_cathedral import PERIOD_SQRT_V
    assert PERIOD_SQRT_V == _D - 1


def test_cf_sqrt_V_a0_equals_D():
    """CF(√12) a₀ = 3 = D."""
    from urt.continued_fractions_cathedral import CF_SQRT_V_A0_VAL
    assert CF_SQRT_V_A0_VAL == _D


def test_cf_sqrt_V_quotients():
    """CF(√12) period quotients = {D−1, D!} = {2, 6}."""
    from urt.continued_fractions_cathedral import CF_SQRT_V_PERIOD
    assert set(CF_SQRT_V_PERIOD) == {_D - 1, _DFACT}


def test_identity_period_sqrt_V():
    """IDENTITY_PERIOD_SQRT_V is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PERIOD_SQRT_V
    assert IDENTITY_PERIOD_SQRT_V


def test_identity_cf_sqrt_V_a0():
    """IDENTITY_CF_SQRT_V_A0 is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_V_A0
    assert IDENTITY_CF_SQRT_V_A0


def test_identity_cf_sqrt_V_quots():
    """IDENTITY_CF_SQRT_V_QUOTS is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_V_QUOTS
    assert IDENTITY_CF_SQRT_V_QUOTS


# ── Section 9: CF(√E) = CF(√30) ───────────────────────────────────────────────

def test_cf_sqrt_E_a0_equals_q():
    """CF(√30) a₀ = 5 = q — Cathedral: floor(√30) = q."""
    from urt.continued_fractions_cathedral import CF_SQRT_E_A0_VAL
    assert CF_SQRT_E_A0_VAL == _q


def test_period_sqrt_E_equals_D_minus_1():
    """CF(√30) period = 2 = D−1."""
    from urt.continued_fractions_cathedral import PERIOD_SQRT_E
    assert PERIOD_SQRT_E == _D - 1


def test_cf_sqrt_E_last_quot():
    """CF(√30) last quotient = 10 = 2q."""
    from urt.continued_fractions_cathedral import CF_SQRT_E_PERIOD
    assert CF_SQRT_E_PERIOD[-1] == 2 * _q


def test_identity_cf_sqrt_E_a0():
    """IDENTITY_CF_SQRT_E_A0 is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_E_A0
    assert IDENTITY_CF_SQRT_E_A0


def test_identity_period_sqrt_E():
    """IDENTITY_PERIOD_SQRT_E is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PERIOD_SQRT_E
    assert IDENTITY_PERIOD_SQRT_E


def test_identity_last_quot_sqrt_E():
    """IDENTITY_LAST_QUOT_SQRT_E is True."""
    from urt.continued_fractions_cathedral import IDENTITY_LAST_QUOT_SQRT_E
    assert IDENTITY_LAST_QUOT_SQRT_E


# ── Section 10: CF(√G) = CF(√60) ──────────────────────────────────────────────

def test_cf_sqrt_G_a0_equals_D_fact_plus_1():
    """CF(√60) a₀ = 7 = D!+1."""
    from urt.continued_fractions_cathedral import CF_SQRT_G_A0_VAL
    assert CF_SQRT_G_A0_VAL == _DFACT + 1


def test_period_sqrt_G_equals_D_plus_1():
    """CF(√60) period = 4 = D+1."""
    from urt.continued_fractions_cathedral import PERIOD_SQRT_G
    assert PERIOD_SQRT_G == _D + 1


def test_cf_sqrt_G_first_quot():
    """CF(√60) first period quotient = 1 = D−2."""
    from urt.continued_fractions_cathedral import CF_SQRT_G_PERIOD
    assert CF_SQRT_G_PERIOD[0] == _D - 2


def test_cf_sqrt_G_second_quot():
    """CF(√60) second period quotient = 2 = D−1."""
    from urt.continued_fractions_cathedral import CF_SQRT_G_PERIOD
    assert CF_SQRT_G_PERIOD[1] == _D - 1


def test_cf_sqrt_G_last_quot():
    """CF(√60) last quotient = 14 = 2(D!+1) = 2a₀."""
    from urt.continued_fractions_cathedral import CF_SQRT_G_PERIOD
    assert CF_SQRT_G_PERIOD[-1] == 2 * (_DFACT + 1)


def test_cf_sqrt_G_period_list():
    """CF(√60) period is exactly [1, 2, 1, 14]."""
    from urt.continued_fractions_cathedral import CF_SQRT_G_PERIOD
    assert CF_SQRT_G_PERIOD == [1, 2, 1, 14]


def test_identity_cf_sqrt_G_a0():
    """IDENTITY_CF_SQRT_G_A0 is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_G_A0
    assert IDENTITY_CF_SQRT_G_A0


def test_identity_period_sqrt_G():
    """IDENTITY_PERIOD_SQRT_G is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PERIOD_SQRT_G
    assert IDENTITY_PERIOD_SQRT_G


def test_identity_cf_sqrt_G_first_quot():
    """IDENTITY_CF_SQRT_G_FIRST_QUOT is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_G_FIRST_QUOT
    assert IDENTITY_CF_SQRT_G_FIRST_QUOT


def test_identity_cf_sqrt_G_second_quot():
    """IDENTITY_CF_SQRT_G_SECOND_QUOT is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_G_SECOND_QUOT
    assert IDENTITY_CF_SQRT_G_SECOND_QUOT


def test_identity_cf_sqrt_G_last_quot():
    """IDENTITY_CF_SQRT_G_LAST_QUOT is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CF_SQRT_G_LAST_QUOT
    assert IDENTITY_CF_SQRT_G_LAST_QUOT


# ── Section 11: Convergent miracle ────────────────────────────────────────────

def test_convergent_K4_sqrt_N_equals_q():
    """Denominator k₄ of CF(√13) convergents = 5 = q."""
    from urt.continued_fractions_cathedral import CONVERGENT_K4_SQRT_N
    assert CONVERGENT_K4_SQRT_N == _q


def test_identity_convergent_K4():
    """IDENTITY_CONVERGENT_K4 is True."""
    from urt.continued_fractions_cathedral import IDENTITY_CONVERGENT_K4
    assert IDENTITY_CONVERGENT_K4


# ── Section 12: Pell equations ────────────────────────────────────────────────

def test_pell_D_solution_is_valid():
    """(2,1) is a valid solution of x²−3y²=1."""
    from urt.continued_fractions_cathedral import PELL_D_X, PELL_D_Y
    assert PELL_D_X ** 2 - _D * PELL_D_Y ** 2 == 1


def test_pell_D_x_equals_D_minus_1():
    """Pell(D) fundamental solution x = 2 = D−1."""
    from urt.continued_fractions_cathedral import PELL_D_X
    assert PELL_D_X == _D - 1


def test_pell_q_solution_is_valid():
    """(9,4) is a valid solution of x²−5y²=1."""
    from urt.continued_fractions_cathedral import PELL_q_X, PELL_q_Y
    assert PELL_q_X ** 2 - _q * PELL_q_Y ** 2 == 1


def test_pell_q_x_equals_D_squared():
    """Pell(q) fundamental solution x = 9 = D²."""
    from urt.continued_fractions_cathedral import PELL_q_X
    assert PELL_q_X == _D ** 2


def test_pell_q_y_equals_D_plus_1():
    """Pell(q) fundamental solution y = 4 = D+1."""
    from urt.continued_fractions_cathedral import PELL_q_Y
    assert PELL_q_Y == _D + 1


def test_pell_N_solution_is_valid():
    """(649, 180) is a valid solution of x²−13y²=1."""
    from urt.continued_fractions_cathedral import PELL_N_X, PELL_N_Y
    assert PELL_N_X ** 2 - _N * PELL_N_Y ** 2 == 1


def test_pell_N_values():
    """Pell(N) fundamental solution is (649, 180)."""
    from urt.continued_fractions_cathedral import PELL_N_X, PELL_N_Y
    assert PELL_N_X == 649
    assert PELL_N_Y == 180


def test_identity_pell_D_x():
    """IDENTITY_PELL_D_X is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PELL_D_X
    assert IDENTITY_PELL_D_X


def test_identity_pell_D_solution():
    """IDENTITY_PELL_D_SOLUTION is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PELL_D_SOLUTION
    assert IDENTITY_PELL_D_SOLUTION


def test_identity_pell_q_x():
    """IDENTITY_PELL_q_X is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PELL_q_X
    assert IDENTITY_PELL_q_X


def test_identity_pell_q_y():
    """IDENTITY_PELL_q_Y is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PELL_q_Y
    assert IDENTITY_PELL_q_Y


def test_identity_pell_q_solution():
    """IDENTITY_PELL_q_SOLUTION is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PELL_q_SOLUTION
    assert IDENTITY_PELL_q_SOLUTION


def test_identity_pell_N_solution():
    """IDENTITY_PELL_N_SOLUTION is True."""
    from urt.continued_fractions_cathedral import IDENTITY_PELL_N_SOLUTION
    assert IDENTITY_PELL_N_SOLUTION


# ── Section 13: Aggregate flags ───────────────────────────────────────────────

def test_all_cf_exact():
    """ALL_CF_EXACT is True."""
    from urt.continued_fractions_cathedral import ALL_CF_EXACT
    assert ALL_CF_EXACT


def test_all_cf_identities_dict_all_true():
    """Every entry in ALL_CF_IDENTITIES is True."""
    from urt.continued_fractions_cathedral import ALL_CF_IDENTITIES
    failed = [k for k, v in ALL_CF_IDENTITIES.items() if not v]
    assert not failed, f"Failed identities: {failed}"


def test_all_cf_identities_count():
    """ALL_CF_IDENTITIES contains at least 25 entries."""
    from urt.continued_fractions_cathedral import ALL_CF_IDENTITIES
    assert len(ALL_CF_IDENTITIES) >= 25


def test_all_cf_identities_star_present():
    """PERIOD_SQRT_N is present in ALL_CF_IDENTITIES dict."""
    from urt.continued_fractions_cathedral import ALL_CF_IDENTITIES
    assert "PERIOD_SQRT_N" in ALL_CF_IDENTITIES
    assert ALL_CF_IDENTITIES["PERIOD_SQRT_N"]


# ── Section 14: cf_summary() ──────────────────────────────────────────────────

def test_cf_summary_returns_dict():
    """cf_summary() returns a dict."""
    from urt.continued_fractions_cathedral import cf_summary
    s = cf_summary()
    assert isinstance(s, dict)


def test_cf_summary_all_cf_exact():
    """cf_summary() has ALL_CF_EXACT=True."""
    from urt.continued_fractions_cathedral import cf_summary
    s = cf_summary()
    assert s["ALL_CF_EXACT"] is True


def test_cf_summary_period_sqrt_N():
    """cf_summary() has PERIOD_SQRT_N = q."""
    from urt.continued_fractions_cathedral import cf_summary
    s = cf_summary()
    assert s["PERIOD_SQRT_N"] == _q


def test_cf_summary_cathedral_params():
    """cf_summary() includes Cathedral integers D, N, q."""
    from urt.continued_fractions_cathedral import cf_summary
    s = cf_summary()
    assert s["D"] == _D
    assert s["N"] == _N
    assert s["q"] == _q


def test_cf_summary_pell_N():
    """cf_summary() has Pell N solution (649, 180)."""
    from urt.continued_fractions_cathedral import cf_summary
    s = cf_summary()
    assert s["PELL_N_X"] == 649
    assert s["PELL_N_Y"] == 180


def test_cf_summary_cf_sqrt_N_period():
    """cf_summary() has CF_SQRT_N_PERIOD = [1,1,1,1,6]."""
    from urt.continued_fractions_cathedral import cf_summary
    s = cf_summary()
    assert s["CF_SQRT_N_PERIOD"] == [1, 1, 1, 1, 6]


def test_cf_summary_n_identities():
    """cf_summary() has N_CF_IDENTITIES >= 25."""
    from urt.continued_fractions_cathedral import cf_summary
    s = cf_summary()
    assert s["N_CF_IDENTITIES"] >= 25


# ── Section 15: print_cf_report() ─────────────────────────────────────────────

def test_print_cf_report_runs(capsys):
    """print_cf_report() runs without error and produces output."""
    from urt.continued_fractions_cathedral import print_cf_report
    print_cf_report()
    captured = capsys.readouterr()
    assert len(captured.out) >= 300


def test_print_cf_report_contains_period(capsys):
    """print_cf_report() output mentions 'period'."""
    from urt.continued_fractions_cathedral import print_cf_report
    print_cf_report()
    out = capsys.readouterr().out
    assert "period" in out.lower()


def test_print_cf_report_mentions_sqrt_N(capsys):
    """print_cf_report() output mentions the star identity (√13 or sqrt(13))."""
    from urt.continued_fractions_cathedral import print_cf_report
    print_cf_report()
    out = capsys.readouterr().out
    assert "13" in out


def test_print_cf_report_mentions_miracle(capsys):
    """print_cf_report() output mentions the Cathedral Miracle."""
    from urt.continued_fractions_cathedral import print_cf_report
    print_cf_report()
    out = capsys.readouterr().out
    assert "MIRACLE" in out or "miracle" in out.lower()


def test_print_cf_report_mentions_pell(capsys):
    """print_cf_report() output mentions Pell equations."""
    from urt.continued_fractions_cathedral import print_cf_report
    print_cf_report()
    out = capsys.readouterr().out
    assert "PELL" in out or "pell" in out.lower()
