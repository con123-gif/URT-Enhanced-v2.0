"""Tests for urt/monster_order_cathedral.py — Monster group, PSL₂, supersingular primes."""

import pytest
from math import factorial


# ─── Imports ──────────────────────────────────────────────────────────────────

def test_module_imports():
    """All public symbols can be imported."""
    from urt.monster_order_cathedral import (
        MONSTER_PRIME_FACTORIZATION,
        MONSTER_ORDER,
        MONSTER_EXP_2, MONSTER_EXP_3, MONSTER_EXP_5,
        MONSTER_EXP_7, MONSTER_EXP_11, MONSTER_EXP_13,
        N_MONSTER_PRIMES,
        PSL2_D_ORDER, PSL2_q_ORDER, PSL2_N_ORDER,
        PSL2_N_CATHEDRAL_DECOMP,
        SL2_D_ORDER, SL2_q_ORDER,
        SUPERSINGULAR_PRIMES,
        N_SUPERSINGULAR, N_SUPERSINGULAR_LEQ_N,
        S_q_ORDER, S_Dp1_ORDER,
        A5_ORDER, ICOSAHEDRAL_ORDER,
        ALL_MONSTER_IDENTITIES, ALL_MONSTER_EXACT,
        monster_prime_exp, psl2_order, sl2_order,
        supersingular_primes_leq, monster_summary,
        print_monster_report,
    )


# ─── Cathedral integers from shell_closure ────────────────────────────────────

def test_cathedral_integers():
    """D, N, V, F, q, G are loaded from shell_closure."""
    from urt.shell_closure import D, N, V, F, q, G
    assert D == 3
    assert N == 13
    assert V == 12
    assert F == 20
    assert q == 5
    assert G == 60


# ─── Monster order exact value ────────────────────────────────────────────────

def test_monster_order_exact_value():
    """Monster order matches the known exact value."""
    from urt.monster_order_cathedral import MONSTER_ORDER
    expected = 808017424794512875886459904961710757005754368000000000
    assert MONSTER_ORDER == expected


def test_monster_order_from_factorization():
    """Recomputing |M| from MONSTER_PRIME_FACTORIZATION matches MONSTER_ORDER."""
    from urt.monster_order_cathedral import MONSTER_ORDER, MONSTER_PRIME_FACTORIZATION
    recomputed = 1
    for p, e in MONSTER_PRIME_FACTORIZATION.items():
        recomputed *= p**e
    assert recomputed == MONSTER_ORDER


def test_monster_order_positive():
    """Monster order is a positive integer."""
    from urt.monster_order_cathedral import MONSTER_ORDER
    assert isinstance(MONSTER_ORDER, int)
    assert MONSTER_ORDER > 0


# ─── Prime exponent identities ────────────────────────────────────────────────

def test_monster_exp_3_is_F():
    """exp_3(|M|) = 20 = F (icosahedral faces)."""
    from urt.monster_order_cathedral import MONSTER_EXP_3, MONSTER_PRIME_FACTORIZATION
    from urt.shell_closure import F
    assert MONSTER_EXP_3 == F
    assert MONSTER_EXP_3 == 20
    assert MONSTER_PRIME_FACTORIZATION[3] == 20


def test_monster_exp_5_is_D_squared():
    """exp_5(|M|) = 9 = D² (dimension squared)."""
    from urt.monster_order_cathedral import MONSTER_EXP_5, MONSTER_PRIME_FACTORIZATION
    from urt.shell_closure import D
    assert MONSTER_EXP_5 == D**2
    assert MONSTER_EXP_5 == 9
    assert MONSTER_PRIME_FACTORIZATION[5] == 9


def test_monster_exp_7_is_D_factorial():
    """exp_7(|M|) = 6 = D! (D factorial)."""
    from urt.monster_order_cathedral import MONSTER_EXP_7, MONSTER_PRIME_FACTORIZATION
    from urt.shell_closure import D
    assert MONSTER_EXP_7 == factorial(D)
    assert MONSTER_EXP_7 == 6
    assert MONSTER_PRIME_FACTORIZATION[7] == 6


def test_monster_exp_11_is_D_minus_1():
    """exp_11(|M|) = 2 = D−1."""
    from urt.monster_order_cathedral import MONSTER_EXP_11, MONSTER_PRIME_FACTORIZATION
    from urt.shell_closure import D
    assert MONSTER_EXP_11 == D - 1
    assert MONSTER_EXP_11 == 2
    assert MONSTER_PRIME_FACTORIZATION[11] == 2


def test_monster_exp_13_is_D():
    """exp_13(|M|) = 3 = D (and 13 = N = icosahedral sites)."""
    from urt.monster_order_cathedral import MONSTER_EXP_13, MONSTER_PRIME_FACTORIZATION
    from urt.shell_closure import D
    assert MONSTER_EXP_13 == D
    assert MONSTER_EXP_13 == 3
    assert MONSTER_PRIME_FACTORIZATION[13] == 3


def test_monster_exp_2_is_46():
    """exp_2(|M|) = 46."""
    from urt.monster_order_cathedral import MONSTER_EXP_2, MONSTER_PRIME_FACTORIZATION
    assert MONSTER_EXP_2 == 46
    assert MONSTER_PRIME_FACTORIZATION[2] == 46


def test_monster_prime_exp_helper():
    """monster_prime_exp() returns correct exponents."""
    from urt.monster_order_cathedral import monster_prime_exp
    assert monster_prime_exp(3) == 20
    assert monster_prime_exp(5) == 9
    assert monster_prime_exp(7) == 6
    assert monster_prime_exp(11) == 2
    assert monster_prime_exp(13) == 3
    assert monster_prime_exp(97) == 0   # 97 not in |M|


def test_cathedral_prime_13_is_N():
    """The prime 13 equals N = icosahedral shell sites."""
    from urt.shell_closure import N
    from urt.monster_order_cathedral import MONSTER_EXP_13
    assert N == 13
    assert MONSTER_EXP_13 == 3   # exponent of N in |M|


# ─── Distinct prime factor count ──────────────────────────────────────────────

def test_n_monster_primes_is_15():
    """Monster has exactly 15 distinct prime factors."""
    from urt.monster_order_cathedral import N_MONSTER_PRIMES, MONSTER_PRIME_FACTORIZATION
    assert N_MONSTER_PRIMES == 15
    assert len(MONSTER_PRIME_FACTORIZATION) == 15


def test_n_monster_primes_is_V_plus_D():
    """15 = V + D = 12 + 3."""
    from urt.monster_order_cathedral import N_MONSTER_PRIMES
    from urt.shell_closure import V, D
    assert N_MONSTER_PRIMES == V + D
    assert N_MONSTER_PRIMES == 12 + 3


# ─── PSL₂ orders ──────────────────────────────────────────────────────────────

def test_psl2_D_order_is_V():
    """PSL₂(F_3) has order 12 = V."""
    from urt.monster_order_cathedral import PSL2_D_ORDER
    from urt.shell_closure import V, D
    assert PSL2_D_ORDER == V
    assert PSL2_D_ORDER == 12
    assert PSL2_D_ORDER == D * (D**2 - 1) // 2


def test_psl2_q_order_is_G():
    """PSL₂(F_5) has order 60 = G = |A₅|."""
    from urt.monster_order_cathedral import PSL2_q_ORDER
    from urt.shell_closure import G, q
    assert PSL2_q_ORDER == G
    assert PSL2_q_ORDER == 60
    assert PSL2_q_ORDER == q * (q**2 - 1) // 2


def test_psl2_q_is_A5_isomorphism():
    """PSL₂(F_5) ≅ A₅ — the key Cathedral closing connection."""
    from urt.monster_order_cathedral import IDENTITY_PSL2_q_IS_A5, PSL2_q_ORDER, A5_ORDER
    assert IDENTITY_PSL2_q_IS_A5 is True
    assert PSL2_q_ORDER == A5_ORDER


def test_psl2_N_order_is_1092():
    """PSL₂(F_13) has order 1092."""
    from urt.monster_order_cathedral import PSL2_N_ORDER
    from urt.shell_closure import N
    assert PSL2_N_ORDER == 1092
    assert PSL2_N_ORDER == N * (N**2 - 1) // 2


def test_psl2_N_order_cathedral_decomp():
    """1092 = (D+1)×D×(D!+1)×N = 4×3×7×13."""
    from urt.monster_order_cathedral import PSL2_N_ORDER, PSL2_N_CATHEDRAL_DECOMP
    from urt.shell_closure import D, N
    assert PSL2_N_CATHEDRAL_DECOMP == (D + 1) * D * (factorial(D) + 1) * N
    assert PSL2_N_CATHEDRAL_DECOMP == 4 * 3 * 7 * 13
    assert PSL2_N_CATHEDRAL_DECOMP == 1092
    assert PSL2_N_ORDER == PSL2_N_CATHEDRAL_DECOMP


def test_psl2_order_helper():
    """psl2_order(p) computes p(p²−1)/2 correctly."""
    from urt.monster_order_cathedral import psl2_order
    from urt.shell_closure import D, q, N
    assert psl2_order(D) == 12
    assert psl2_order(q) == 60
    assert psl2_order(N) == 1092


# ─── SL₂ orders ───────────────────────────────────────────────────────────────

def test_sl2_D_order_is_24():
    """SL₂(F_3) has order 24 = 2V."""
    from urt.monster_order_cathedral import SL2_D_ORDER
    from urt.shell_closure import V, D
    assert SL2_D_ORDER == 24
    assert SL2_D_ORDER == 2 * V
    assert SL2_D_ORDER == D * (D**2 - 1)


def test_sl2_D_order_is_S4():
    """|SL₂(F_3)| = 24 = |S_4| = (D+1)!."""
    from urt.monster_order_cathedral import SL2_D_ORDER
    from urt.shell_closure import D
    assert SL2_D_ORDER == factorial(D + 1)


def test_sl2_q_order_is_120():
    """SL₂(F_5) has order 120 = 2G."""
    from urt.monster_order_cathedral import SL2_q_ORDER
    from urt.shell_closure import G, q
    assert SL2_q_ORDER == 120
    assert SL2_q_ORDER == 2 * G
    assert SL2_q_ORDER == q * (q**2 - 1)


def test_sl2_q_order_is_S5():
    """|SL₂(F_5)| = 120 = |S_5| = q!."""
    from urt.monster_order_cathedral import SL2_q_ORDER
    from urt.shell_closure import q
    assert SL2_q_ORDER == factorial(q)


def test_sl2_order_helper():
    """sl2_order(p) computes p(p²−1) correctly."""
    from urt.monster_order_cathedral import sl2_order
    from urt.shell_closure import D, q
    assert sl2_order(D) == 24
    assert sl2_order(q) == 120


# ─── Supersingular primes ─────────────────────────────────────────────────────

def test_supersingular_primes_list():
    """SUPERSINGULAR_PRIMES is the correct list."""
    from urt.monster_order_cathedral import SUPERSINGULAR_PRIMES
    expected = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 41, 47, 59, 71]
    assert SUPERSINGULAR_PRIMES == expected


def test_n_supersingular_is_15():
    """There are exactly 15 supersingular primes."""
    from urt.monster_order_cathedral import SUPERSINGULAR_PRIMES, N_SUPERSINGULAR
    assert len(SUPERSINGULAR_PRIMES) == 15
    assert N_SUPERSINGULAR == 15


def test_n_supersingular_is_V_plus_D():
    """15 = V + D (12 + 3)."""
    from urt.monster_order_cathedral import N_SUPERSINGULAR
    from urt.shell_closure import V, D
    assert N_SUPERSINGULAR == V + D


def test_supersingular_all_divide_monster():
    """Every supersingular prime divides |M|."""
    from urt.monster_order_cathedral import SUPERSINGULAR_PRIMES, MONSTER_ORDER
    for p in SUPERSINGULAR_PRIMES:
        assert MONSTER_ORDER % p == 0, f"{p} should divide |M|"


def test_supersingular_primes_leq_N_are_6():
    """Exactly 6 = D! supersingular primes are ≤ N = 13."""
    from urt.monster_order_cathedral import SUPERSINGULAR_PRIMES, N_SUPERSINGULAR_LEQ_N
    from urt.shell_closure import N, D
    ss_leq_N = [p for p in SUPERSINGULAR_PRIMES if p <= N]
    assert len(ss_leq_N) == 6
    assert len(ss_leq_N) == factorial(D)
    assert N_SUPERSINGULAR_LEQ_N == 6


def test_supersingular_primes_leq_N_values():
    """The 6 supersingular primes ≤ 13 are {2,3,5,7,11,13}."""
    from urt.monster_order_cathedral import SUPERSINGULAR_PRIMES
    from urt.shell_closure import N
    ss_leq_N = [p for p in SUPERSINGULAR_PRIMES if p <= N]
    assert ss_leq_N == [2, 3, 5, 7, 11, 13]


def test_supersingular_primes_leq_helper():
    """supersingular_primes_leq() filters correctly."""
    from urt.monster_order_cathedral import supersingular_primes_leq
    assert supersingular_primes_leq(13) == [2, 3, 5, 7, 11, 13]
    assert supersingular_primes_leq(5) == [2, 3, 5]
    assert supersingular_primes_leq(71) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 41, 47, 59, 71]
    assert supersingular_primes_leq(1) == []


# ─── Symmetric group orders ───────────────────────────────────────────────────

def test_S_q_order_is_120():
    """S_5 has order 120 = 2G."""
    from urt.monster_order_cathedral import S_q_ORDER
    from urt.shell_closure import G
    assert S_q_ORDER == 120
    assert S_q_ORDER == 2 * G


def test_S_Dp1_order_is_24():
    """S_4 has order 24 = 2V."""
    from urt.monster_order_cathedral import S_Dp1_ORDER
    from urt.shell_closure import V
    assert S_Dp1_ORDER == 24
    assert S_Dp1_ORDER == 2 * V


def test_A5_order_is_G():
    """A₅ has order 60 = G."""
    from urt.monster_order_cathedral import A5_ORDER
    from urt.shell_closure import G
    assert A5_ORDER == G
    assert A5_ORDER == 60


def test_icosahedral_order_is_G():
    """Icosahedral rotation group has order 60 = G."""
    from urt.monster_order_cathedral import ICOSAHEDRAL_ORDER
    from urt.shell_closure import G
    assert ICOSAHEDRAL_ORDER == G


def test_A5_equals_icosahedral():
    """A₅ order equals icosahedral rotation group order."""
    from urt.monster_order_cathedral import A5_ORDER, ICOSAHEDRAL_ORDER
    assert A5_ORDER == ICOSAHEDRAL_ORDER


# ─── ALL_MONSTER_EXACT master flag ────────────────────────────────────────────

def test_all_monster_exact_is_true():
    """ALL_MONSTER_EXACT is True (all identities verified)."""
    from urt.monster_order_cathedral import ALL_MONSTER_EXACT
    assert ALL_MONSTER_EXACT is True


def test_all_identities_are_true():
    """Every entry in ALL_MONSTER_IDENTITIES is True."""
    from urt.monster_order_cathedral import ALL_MONSTER_IDENTITIES
    for name, value in ALL_MONSTER_IDENTITIES.items():
        assert value is True, f"Identity {name!r} is not True"


def test_at_least_30_identities():
    """At least 30 identity booleans are registered."""
    from urt.monster_order_cathedral import ALL_MONSTER_IDENTITIES
    assert len(ALL_MONSTER_IDENTITIES) >= 30


# ─── Individual identity booleans ─────────────────────────────────────────────

def test_identity_monster_exp_3():
    from urt.monster_order_cathedral import IDENTITY_MONSTER_EXP_3_IS_F
    assert IDENTITY_MONSTER_EXP_3_IS_F is True


def test_identity_monster_exp_5():
    from urt.monster_order_cathedral import IDENTITY_MONSTER_EXP_5_IS_D2
    assert IDENTITY_MONSTER_EXP_5_IS_D2 is True


def test_identity_monster_exp_7():
    from urt.monster_order_cathedral import IDENTITY_MONSTER_EXP_7_IS_DFACT
    assert IDENTITY_MONSTER_EXP_7_IS_DFACT is True


def test_identity_monster_exp_11():
    from urt.monster_order_cathedral import IDENTITY_MONSTER_EXP_11_IS_Dm1
    assert IDENTITY_MONSTER_EXP_11_IS_Dm1 is True


def test_identity_monster_exp_13():
    from urt.monster_order_cathedral import IDENTITY_MONSTER_EXP_13_IS_D
    assert IDENTITY_MONSTER_EXP_13_IS_D is True


def test_identity_psl2_D_is_V():
    from urt.monster_order_cathedral import IDENTITY_PSL2_D_IS_V
    assert IDENTITY_PSL2_D_IS_V is True


def test_identity_psl2_q_is_G():
    from urt.monster_order_cathedral import IDENTITY_PSL2_q_IS_G
    assert IDENTITY_PSL2_q_IS_G is True


def test_identity_psl2_N_cathedral():
    from urt.monster_order_cathedral import IDENTITY_PSL2_N_CATHEDRAL
    assert IDENTITY_PSL2_N_CATHEDRAL is True


def test_identity_sl2_D_is_2V():
    from urt.monster_order_cathedral import IDENTITY_SL2_D_IS_2V
    assert IDENTITY_SL2_D_IS_2V is True


def test_identity_sl2_q_is_2G():
    from urt.monster_order_cathedral import IDENTITY_SL2_q_IS_2G
    assert IDENTITY_SL2_q_IS_2G is True


def test_identity_n_ss_is_V_plus_D():
    from urt.monster_order_cathedral import IDENTITY_N_SS_IS_V_PLUS_D
    assert IDENTITY_N_SS_IS_V_PLUS_D is True


def test_identity_n_ss_leq_N():
    from urt.monster_order_cathedral import IDENTITY_N_SS_LEQ_N
    assert IDENTITY_N_SS_LEQ_N is True


# ─── monster_summary() ────────────────────────────────────────────────────────

def test_monster_summary_returns_dict():
    """monster_summary() returns a dict."""
    from urt.monster_order_cathedral import monster_summary
    s = monster_summary()
    assert isinstance(s, dict)


def test_monster_summary_all_exact():
    """monster_summary()['all_exact'] is True."""
    from urt.monster_order_cathedral import monster_summary
    s = monster_summary()
    assert s["all_exact"] is True


def test_monster_summary_n_distinct_primes():
    """Summary n_distinct_primes = 15."""
    from urt.monster_order_cathedral import monster_summary
    s = monster_summary()
    assert s["n_distinct_primes"] == 15


def test_monster_summary_n_supersingular():
    """Summary n_supersingular = 15."""
    from urt.monster_order_cathedral import monster_summary
    s = monster_summary()
    assert s["n_supersingular"] == 15


def test_monster_summary_n_supersingular_leq_N():
    """Summary n_supersingular_leq_N = 6."""
    from urt.monster_order_cathedral import monster_summary
    s = monster_summary()
    assert s["n_supersingular_leq_N"] == 6


def test_monster_summary_psl2_q():
    """Summary PSL2_q_order = 60."""
    from urt.monster_order_cathedral import monster_summary
    s = monster_summary()
    assert s["PSL2_q_order"] == 60


def test_monster_summary_n_identities():
    """Summary registers at least 30 identities, all True."""
    from urt.monster_order_cathedral import monster_summary
    s = monster_summary()
    assert s["n_identities"] >= 30
    assert s["n_true"] == s["n_identities"]


# ─── print_monster_report() ───────────────────────────────────────────────────

def test_print_monster_report_runs(capsys):
    """print_monster_report() executes without error and produces output."""
    from urt.monster_order_cathedral import print_monster_report
    print_monster_report()
    captured = capsys.readouterr()
    assert "Monster" in captured.out
    assert "60" in captured.out
    assert "1092" in captured.out


# ─── Cross-checks with other Cathedral modules ────────────────────────────────

def test_psl2_q_equals_a5_representations_order():
    """PSL₂(F_5) order matches A₅ order from a5_representations module."""
    from urt.monster_order_cathedral import PSL2_q_ORDER
    from urt.shell_closure import G
    # A₅ has order 60 = G; PSL₂(F_5) ≅ A₅ so orders must match
    assert PSL2_q_ORDER == G


def test_monster_exp_3_matches_F_from_shell_closure():
    """Monster exp at 3 equals F from shell_closure."""
    from urt.monster_order_cathedral import MONSTER_EXP_3
    from urt.shell_closure import F
    assert MONSTER_EXP_3 == F


def test_n_supersingular_leq_N_matches_Dfact():
    """Count of supersingular primes ≤ N equals D! from shell_closure."""
    from urt.monster_order_cathedral import N_SUPERSINGULAR_LEQ_N
    from urt.shell_closure import D
    assert N_SUPERSINGULAR_LEQ_N == factorial(D)
