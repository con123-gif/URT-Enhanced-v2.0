"""Tests for urt/combinatorics2_cathedral.py — Deeper combinatorics Cathedral identities.

Covers: Fibonacci, Stirling (1st & 2nd kind), Narayana, Motzkin, Pell,
        Bell, Bernoulli denominators, summary dict, and print report.
"""

import pytest
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    """All public names import without error."""
    from urt.combinatorics2_cathedral import (
        # functions
        fib, stirling2, stirling1, narayana, motzkin, pell, bell,
        # Fibonacci constants
        F_D, F_D1, F_q, F_V, F_N, F_E,
        # Fibonacci identity flags
        IDENTITY_FIB_D, IDENTITY_FIB_D1, IDENTITY_FIB_q_SELF_REF,
        IDENTITY_FIB_V_SQUARE, IDENTITY_FIB_N_PRIME,
        # Stirling 2nd kind constants & flags
        S2_D_Dm1, S2_D1_Dm1, S2_q_D, S2_D_2, S2_Dfact_D,
        IDENTITY_S2_D_Dm1, IDENTITY_S2_D1_Dm1, IDENTITY_S2_q_D,
        IDENTITY_S2_D_2, IDENTITY_S2_DFACT_D,
        # Stirling 1st kind constants & flags
        S1_D_Dm1, S1_q_D, S1_Dfact_D,
        IDENTITY_S1_D_Dm1, IDENTITY_S1_q_D, IDENTITY_S1_DFACT_D,
        # Narayana constants & flags
        NAR_D_2, NAR_q_D, NAR_D1_3, NAR_SUM_D,
        IDENTITY_NAR_D_2, IDENTITY_NAR_q_D, IDENTITY_NAR_D1_3, IDENTITY_NAR_SUM_D,
        # Motzkin constants & flags
        M_D, M_D1, M_q,
        IDENTITY_MOTZKIN_D, IDENTITY_MOTZKIN_D1, IDENTITY_MOTZKIN_q,
        # Pell constants & flags
        P_D_PELL, P_D1_PELL, P_q_PELL,
        IDENTITY_PELL_D, IDENTITY_PELL_D1, IDENTITY_PELL_q,
        # Bell constants & flags
        B_Dm1_BELL, B_D_BELL, B_D1_BELL,
        IDENTITY_BELL_Dm1, IDENTITY_BELL_D, IDENTITY_BELL_D1,
        # Bernoulli denom constants & flags
        BERN_DENOM_2, BERN_DENOM_4, BERN_DENOM_6, BERN_DENOM_12,
        IDENTITY_BERN2_DENOM, IDENTITY_BERN4_DENOM,
        IDENTITY_BERN6_DENOM, IDENTITY_BERN12_HAS_N,
        # Aggregate
        ALL_COMB2_IDENTITIES, ALL_COMB2_EXACT, N_COMB2_IDENTITIES,
        GAMMA_INV,
        # Summary / report
        comb2_summary, print_comb2_report,
    )


def test_gamma_inv():
    """GAMMA_INV = 81."""
    from urt.combinatorics2_cathedral import GAMMA_INV
    assert GAMMA_INV == 81


# ── Section 1: fib() helper ───────────────────────────────────────────────────

def test_fib_base_cases():
    from urt.combinatorics2_cathedral import fib
    assert fib(0) == 0
    assert fib(1) == 1
    assert fib(2) == 1


def test_fib_sequence():
    from urt.combinatorics2_cathedral import fib
    expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
    for i, v in enumerate(expected):
        assert fib(i) == v, f"fib({i}) expected {v}, got {fib(i)}"


# ── Section 2: Fibonacci Cathedral identities ─────────────────────────────────

def test_fib_D_eq_Dm1():
    """F(3) = 2 = D-1."""
    from urt.combinatorics2_cathedral import F_D, IDENTITY_FIB_D
    from urt.shell_closure import D
    assert F_D == D - 1
    assert F_D == 2
    assert IDENTITY_FIB_D is True


def test_fib_D1_eq_D():
    """F(4) = 3 = D."""
    from urt.combinatorics2_cathedral import F_D1, IDENTITY_FIB_D1
    from urt.shell_closure import D
    assert F_D1 == D
    assert F_D1 == 3
    assert IDENTITY_FIB_D1 is True


def test_fib_q_self_referential():
    """F(5) = 5 = q -- self-referential!"""
    from urt.combinatorics2_cathedral import F_q, IDENTITY_FIB_q_SELF_REF
    from urt.shell_closure import q
    assert F_q == q
    assert F_q == 5
    assert IDENTITY_FIB_q_SELF_REF is True


def test_fib_V_square():
    """F(12) = 144 = V^2 = 12^2."""
    from urt.combinatorics2_cathedral import F_V, IDENTITY_FIB_V_SQUARE
    from urt.shell_closure import V
    assert F_V == V ** 2
    assert F_V == 144
    assert IDENTITY_FIB_V_SQUARE is True


def test_fib_N_prime():
    """F(13) = 233 (Fibonacci prime at N)."""
    from urt.combinatorics2_cathedral import F_N, IDENTITY_FIB_N_PRIME
    assert F_N == 233
    assert IDENTITY_FIB_N_PRIME is True


def test_fib_E_positive():
    """F(30) is a large positive integer."""
    from urt.combinatorics2_cathedral import F_E
    assert F_E > 0
    assert F_E == 832040


# ── Section 3: Stirling 2nd kind helper ──────────────────────────────────────

def test_stirling2_boundary_cases():
    from urt.combinatorics2_cathedral import stirling2
    assert stirling2(0, 0) == 1
    assert stirling2(1, 0) == 0
    assert stirling2(0, 1) == 0
    assert stirling2(3, 4) == 0   # k > n


def test_stirling2_small_values():
    from urt.combinatorics2_cathedral import stirling2
    assert stirling2(1, 1) == 1
    assert stirling2(2, 1) == 1
    assert stirling2(2, 2) == 1
    assert stirling2(3, 1) == 1
    assert stirling2(3, 2) == 3
    assert stirling2(3, 3) == 1
    assert stirling2(4, 2) == 7


# ── Section 4: Stirling 2nd kind Cathedral identities ────────────────────────

def test_S2_D_Dm1_eq_D():
    """S(D,D-1) = S(3,2) = 3 = D -- self-referential!"""
    from urt.combinatorics2_cathedral import S2_D_Dm1, IDENTITY_S2_D_Dm1
    from urt.shell_closure import D
    assert S2_D_Dm1 == D
    assert S2_D_Dm1 == 3
    assert IDENTITY_S2_D_Dm1 is True


def test_S2_D1_Dm1_eq_Dfact1():
    """S(D+1,D-1) = S(4,2) = 7 = D!+1."""
    from urt.combinatorics2_cathedral import S2_D1_Dm1, IDENTITY_S2_D1_Dm1
    from urt.shell_closure import D
    assert S2_D1_Dm1 == factorial(D) + 1
    assert S2_D1_Dm1 == 7
    assert IDENTITY_S2_D1_Dm1 is True


def test_S2_q_D_eq_q2():
    """S(q,D) = S(5,3) = 25 = q^2."""
    from urt.combinatorics2_cathedral import S2_q_D, IDENTITY_S2_q_D
    from urt.shell_closure import q
    assert S2_q_D == q ** 2
    assert S2_q_D == 25
    assert IDENTITY_S2_q_D is True


def test_S2_D_2_eq_D():
    """S(D,2) = S(3,2) = 3 = D."""
    from urt.combinatorics2_cathedral import S2_D_2, IDENTITY_S2_D_2
    from urt.shell_closure import D
    assert S2_D_2 == D
    assert S2_D_2 == 3
    assert IDENTITY_S2_D_2 is True


def test_S2_Dfact_D_eq_2qD2():
    """S(D!,D) = S(6,3) = 90 = 2*q*D^2."""
    from urt.combinatorics2_cathedral import S2_Dfact_D, IDENTITY_S2_DFACT_D
    from urt.shell_closure import D, q
    assert S2_Dfact_D == 2 * q * D ** 2
    assert S2_Dfact_D == 90
    assert IDENTITY_S2_DFACT_D is True


# ── Section 5: Stirling 1st kind helper ──────────────────────────────────────

def test_stirling1_boundary_cases():
    from urt.combinatorics2_cathedral import stirling1
    assert stirling1(0, 0) == 1
    assert stirling1(1, 0) == 0
    assert stirling1(0, 1) == 0
    assert stirling1(2, 3) == 0


def test_stirling1_small_values():
    from urt.combinatorics2_cathedral import stirling1
    assert stirling1(1, 1) == 1
    assert stirling1(2, 1) == 1
    assert stirling1(2, 2) == 1
    assert stirling1(3, 2) == 3
    assert stirling1(3, 3) == 1
    assert stirling1(4, 2) == 11
    assert stirling1(4, 3) == 6


# ── Section 6: Stirling 1st kind Cathedral identities ────────────────────────

def test_S1_D_Dm1_eq_D():
    """c(D,D-1) = c(3,2) = 3 = D -- self-referential!"""
    from urt.combinatorics2_cathedral import S1_D_Dm1, IDENTITY_S1_D_Dm1
    from urt.shell_closure import D
    assert S1_D_Dm1 == D
    assert S1_D_Dm1 == 3
    assert IDENTITY_S1_D_Dm1 is True


def test_S1_q_D_eq_qDfact1():
    """c(q,D) = c(5,3) = 35 = q*(D!+1)."""
    from urt.combinatorics2_cathedral import S1_q_D, IDENTITY_S1_q_D
    from urt.shell_closure import D, q
    assert S1_q_D == q * (factorial(D) + 1)
    assert S1_q_D == 35
    assert IDENTITY_S1_q_D is True


def test_S1_Dfact_D_eq_VD2():
    """c(D!,D) = c(6,3) = 225 = (V+D)^2."""
    from urt.combinatorics2_cathedral import S1_Dfact_D, IDENTITY_S1_DFACT_D
    from urt.shell_closure import D, V
    assert S1_Dfact_D == (V + D) ** 2
    assert S1_Dfact_D == 225
    assert IDENTITY_S1_DFACT_D is True


# ── Section 7: narayana() helper ─────────────────────────────────────────────

def test_narayana_boundary():
    from urt.combinatorics2_cathedral import narayana
    assert narayana(1, 1) == 1
    assert narayana(2, 1) == 1
    assert narayana(2, 2) == 1
    assert narayana(3, 0) == 0   # k=0 out of range
    assert narayana(3, 4) == 0   # k > n


def test_narayana_row_sums_catalan():
    """Sum over k of Nar(n,k) = Catalan(n)."""
    from urt.combinatorics2_cathedral import narayana
    from math import comb
    for n in range(1, 7):
        catalan_n = comb(2 * n, n) // (n + 1)
        total = sum(narayana(n, k) for k in range(1, n + 1))
        assert total == catalan_n, f"Nar row sum at n={n}: {total} != Catalan {catalan_n}"


# ── Section 8: Narayana Cathedral identities ──────────────────────────────────

def test_NAR_D_2_eq_D():
    """Nar(D,2) = Nar(3,2) = 3 = D -- self-referential!"""
    from urt.combinatorics2_cathedral import NAR_D_2, IDENTITY_NAR_D_2
    from urt.shell_closure import D
    assert NAR_D_2 == D
    assert NAR_D_2 == 3
    assert IDENTITY_NAR_D_2 is True


def test_NAR_q_D_eq_F():
    """Nar(q,D) = Nar(5,3) = 20 = F."""
    from urt.combinatorics2_cathedral import NAR_q_D, IDENTITY_NAR_q_D
    from urt.shell_closure import F
    assert NAR_q_D == F
    assert NAR_q_D == 20
    assert IDENTITY_NAR_q_D is True


def test_NAR_D1_3_eq_V2():
    """Nar(D+1,3) = Nar(4,3) = 6 = V//2."""
    from urt.combinatorics2_cathedral import NAR_D1_3, IDENTITY_NAR_D1_3
    from urt.shell_closure import V
    assert NAR_D1_3 == V // 2
    assert NAR_D1_3 == 6
    assert IDENTITY_NAR_D1_3 is True


def test_NAR_SUM_D_eq_q():
    """Sum_k Nar(D,k) = C_D = q."""
    from urt.combinatorics2_cathedral import NAR_SUM_D, IDENTITY_NAR_SUM_D
    from urt.shell_closure import q
    assert NAR_SUM_D == q
    assert NAR_SUM_D == 5
    assert IDENTITY_NAR_SUM_D is True


# ── Section 9: motzkin() helper ───────────────────────────────────────────────

def test_motzkin_small_values():
    from urt.combinatorics2_cathedral import motzkin
    # M_0=1, M_1=1, M_2=2, M_3=4, M_4=9, M_5=21, M_6=51, M_7=127
    expected = [1, 1, 2, 4, 9, 21, 51, 127]
    for i, v in enumerate(expected):
        assert motzkin(i) == v, f"motzkin({i}) expected {v}, got {motzkin(i)}"


# ── Section 10: Motzkin Cathedral identities ──────────────────────────────────

def test_MOTZKIN_D_eq_D1():
    """M_D = M_3 = 4 = D+1."""
    from urt.combinatorics2_cathedral import M_D, IDENTITY_MOTZKIN_D
    from urt.shell_closure import D
    assert M_D == D + 1
    assert M_D == 4
    assert IDENTITY_MOTZKIN_D is True


def test_MOTZKIN_D1_eq_D2():
    """M_{D+1} = M_4 = 9 = D^2."""
    from urt.combinatorics2_cathedral import M_D1, IDENTITY_MOTZKIN_D1
    from urt.shell_closure import D
    assert M_D1 == D ** 2
    assert M_D1 == 9
    assert IDENTITY_MOTZKIN_D1 is True


def test_MOTZKIN_q_eq_DDfact1():
    """M_q = M_5 = 21 = D*(D!+1)."""
    from urt.combinatorics2_cathedral import M_q, IDENTITY_MOTZKIN_q
    from urt.shell_closure import D
    assert M_q == D * (factorial(D) + 1)
    assert M_q == 21
    assert IDENTITY_MOTZKIN_q is True


# ── Section 11: pell() helper ─────────────────────────────────────────────────

def test_pell_base_cases():
    from urt.combinatorics2_cathedral import pell
    assert pell(0) == 0
    assert pell(1) == 1


def test_pell_sequence():
    from urt.combinatorics2_cathedral import pell
    # P_0=0, P_1=1, P_2=2, P_3=5, P_4=12, P_5=29, P_6=70
    expected = [0, 1, 2, 5, 12, 29, 70]
    for i, v in enumerate(expected):
        assert pell(i) == v, f"pell({i}) expected {v}, got {pell(i)}"


# ── Section 12: Pell Cathedral identities ────────────────────────────────────

def test_PELL_D_eq_q():
    """P(D) = P(3) = 5 = q."""
    from urt.combinatorics2_cathedral import P_D_PELL, IDENTITY_PELL_D
    from urt.shell_closure import q
    assert P_D_PELL == q
    assert P_D_PELL == 5
    assert IDENTITY_PELL_D is True


def test_PELL_D1_eq_V():
    """P(D+1) = P(4) = 12 = V."""
    from urt.combinatorics2_cathedral import P_D1_PELL, IDENTITY_PELL_D1
    from urt.shell_closure import V
    assert P_D1_PELL == V
    assert P_D1_PELL == 12
    assert IDENTITY_PELL_D1 is True


def test_PELL_q_eq_2ND():
    """P(q) = P(5) = 29 = 2N+D."""
    from urt.combinatorics2_cathedral import P_q_PELL, IDENTITY_PELL_q
    from urt.shell_closure import N, D
    assert P_q_PELL == 2 * N + D
    assert P_q_PELL == 29
    assert IDENTITY_PELL_q is True


# ── Section 13: bell() helper ─────────────────────────────────────────────────

def test_bell_small_values():
    from urt.combinatorics2_cathedral import bell
    # B_0=1, B_1=1, B_2=2, B_3=5, B_4=15, B_5=52
    expected = [1, 1, 2, 5, 15, 52]
    for i, v in enumerate(expected):
        assert bell(i) == v, f"bell({i}) expected {v}, got {bell(i)}"


# ── Section 14: Bell Cathedral identities ────────────────────────────────────

def test_BELL_Dm1_eq_Dm1():
    """B(D-1) = B(2) = 2 = D-1."""
    from urt.combinatorics2_cathedral import B_Dm1_BELL, IDENTITY_BELL_Dm1
    from urt.shell_closure import D
    assert B_Dm1_BELL == D - 1
    assert B_Dm1_BELL == 2
    assert IDENTITY_BELL_Dm1 is True


def test_BELL_D_eq_q():
    """B(D) = B(3) = 5 = q."""
    from urt.combinatorics2_cathedral import B_D_BELL, IDENTITY_BELL_D
    from urt.shell_closure import q
    assert B_D_BELL == q
    assert B_D_BELL == 5
    assert IDENTITY_BELL_D is True


def test_BELL_D1_eq_VD():
    """B(D+1) = B(4) = 15 = V+D."""
    from urt.combinatorics2_cathedral import B_D1_BELL, IDENTITY_BELL_D1
    from urt.shell_closure import V, D
    assert B_D1_BELL == V + D
    assert B_D1_BELL == 15
    assert IDENTITY_BELL_D1 is True


def test_bell_is_stirling_sum():
    """B(n) = Sum_k S(n,k): Bell matches Stirling sum for several n."""
    from urt.combinatorics2_cathedral import bell, stirling2
    for n in range(6):
        s_sum = sum(stirling2(n, k) for k in range(n + 1))
        assert bell(n) == s_sum, f"B({n}) mismatch: {bell(n)} vs Stirling sum {s_sum}"


# ── Section 15: Bernoulli denominators ───────────────────────────────────────

def test_bern_denom_2_eq_Dfact():
    """denom(B_2) = 6 = D!"""
    from urt.combinatorics2_cathedral import BERN_DENOM_2, IDENTITY_BERN2_DENOM
    from urt.shell_closure import D
    assert BERN_DENOM_2 == factorial(D)
    assert BERN_DENOM_2 == 6
    assert IDENTITY_BERN2_DENOM is True


def test_bern_denom_4_eq_E():
    """denom(B_4) = 30 = E."""
    from urt.combinatorics2_cathedral import BERN_DENOM_4, IDENTITY_BERN4_DENOM
    from urt.shell_closure import E
    assert BERN_DENOM_4 == E
    assert BERN_DENOM_4 == 30
    assert IDENTITY_BERN4_DENOM is True


def test_bern_denom_6_eq_42():
    """denom(B_6) = 42 = D!*(D!+1)."""
    from urt.combinatorics2_cathedral import BERN_DENOM_6, IDENTITY_BERN6_DENOM
    from urt.shell_closure import D
    assert BERN_DENOM_6 == factorial(D) * (factorial(D) + 1)
    assert BERN_DENOM_6 == 42
    assert IDENTITY_BERN6_DENOM is True


def test_bern_denom_12_has_N():
    """denom(B_12) = 2730 contains factor N=13."""
    from urt.combinatorics2_cathedral import BERN_DENOM_12, IDENTITY_BERN12_HAS_N
    from urt.shell_closure import N
    assert BERN_DENOM_12 % N == 0
    assert BERN_DENOM_12 == 2730
    assert IDENTITY_BERN12_HAS_N is True


# ── Section 16: Aggregate identity list ──────────────────────────────────────

def test_all_identities_list():
    """ALL_COMB2_IDENTITIES is a list of booleans, all True."""
    from urt.combinatorics2_cathedral import ALL_COMB2_IDENTITIES
    assert isinstance(ALL_COMB2_IDENTITIES, list)
    assert len(ALL_COMB2_IDENTITIES) > 0
    assert all(v is True for v in ALL_COMB2_IDENTITIES)


def test_all_comb2_exact():
    """ALL_COMB2_EXACT is True."""
    from urt.combinatorics2_cathedral import ALL_COMB2_EXACT
    assert ALL_COMB2_EXACT is True


def test_n_comb2_identities_count():
    """N_COMB2_IDENTITIES matches length of ALL_COMB2_IDENTITIES."""
    from urt.combinatorics2_cathedral import N_COMB2_IDENTITIES, ALL_COMB2_IDENTITIES
    assert N_COMB2_IDENTITIES == len(ALL_COMB2_IDENTITIES)
    assert N_COMB2_IDENTITIES >= 28


# ── Section 17: comb2_summary() ──────────────────────────────────────────────

def test_comb2_summary_structure():
    """comb2_summary returns dict with expected top-level keys."""
    from urt.combinatorics2_cathedral import comb2_summary
    r = comb2_summary()
    for key in ("fibonacci", "stirling2", "stirling1", "narayana",
                "motzkin", "pell", "bell", "bernoulli_denom",
                "totals", "key_results"):
        assert key in r, f"Missing key: {key}"


def test_comb2_summary_fibonacci():
    from urt.combinatorics2_cathedral import comb2_summary
    fib_data = comb2_summary()["fibonacci"]
    assert fib_data["F_q_self_ref"] is True
    assert fib_data["F_V_square"] is True
    assert fib_data["F_q"] == 5
    assert fib_data["F_V"] == 144


def test_comb2_summary_stirling2():
    from urt.combinatorics2_cathedral import comb2_summary
    s2 = comb2_summary()["stirling2"]
    assert s2["S_D_Dm1_eq_D"] is True
    assert s2["S_q_D_eq_q2"] is True
    assert s2["S_q_D"] == 25


def test_comb2_summary_stirling1():
    from urt.combinatorics2_cathedral import comb2_summary
    s1 = comb2_summary()["stirling1"]
    assert s1["c_D_Dm1_eq_D"] is True
    assert s1["c_q_D_eq_qDfact1"] is True
    assert s1["c_Dfact_D_eq_VD2"] is True
    assert s1["c_Dfact_D"] == 225


def test_comb2_summary_narayana():
    from urt.combinatorics2_cathedral import comb2_summary
    nar = comb2_summary()["narayana"]
    assert nar["Nar_q_D_eq_F"] is True
    assert nar["Nar_q_D"] == 20
    assert nar["Nar_sum_eq_q"] is True


def test_comb2_summary_motzkin():
    from urt.combinatorics2_cathedral import comb2_summary
    mot = comb2_summary()["motzkin"]
    assert mot["M_D_eq_D1"] is True
    assert mot["M_D1_eq_D2"] is True
    assert mot["M_q_eq_DDfact1"] is True


def test_comb2_summary_pell():
    from urt.combinatorics2_cathedral import comb2_summary
    pe = comb2_summary()["pell"]
    assert pe["P_D_eq_q"] is True
    assert pe["P_D1_eq_V"] is True
    assert pe["P_q_eq_2ND"] is True
    assert pe["P_D"] == 5
    assert pe["P_D1"] == 12
    assert pe["P_q"] == 29


def test_comb2_summary_bell():
    from urt.combinatorics2_cathedral import comb2_summary
    be = comb2_summary()["bell"]
    assert be["B_Dm1_eq_Dm1"] is True
    assert be["B_D_eq_q"] is True
    assert be["B_D1_eq_VD"] is True
    assert be["B_D"] == 5
    assert be["B_D1"] == 15


def test_comb2_summary_bernoulli():
    from urt.combinatorics2_cathedral import comb2_summary
    bn = comb2_summary()["bernoulli_denom"]
    assert bn["denom_B2_eq_Dfact"] is True
    assert bn["denom_B4_eq_E"] is True
    assert bn["denom_B6_eq_42"] is True
    assert bn["denom_B12_has_N"] is True
    assert bn["denom_B2"] == 6
    assert bn["denom_B4"] == 30
    assert bn["denom_B6"] == 42
    assert bn["denom_B12"] == 2730


def test_comb2_summary_totals():
    from urt.combinatorics2_cathedral import comb2_summary, N_COMB2_IDENTITIES
    totals = comb2_summary()["totals"]
    assert totals["all_exact"] is True
    assert totals["n_identities"] == N_COMB2_IDENTITIES


def test_comb2_summary_key_results():
    from urt.combinatorics2_cathedral import comb2_summary
    kr = comb2_summary()["key_results"]
    assert isinstance(kr, list)
    assert len(kr) >= 10
    text = "\n".join(kr)
    assert "SELF-REFERENTIAL" in text


# ── Section 18: print_comb2_report() ─────────────────────────────────────────

def test_print_comb2_report_runs(capsys):
    from urt.combinatorics2_cathedral import print_comb2_report
    print_comb2_report()
    out = capsys.readouterr().out
    assert len(out) > 300
    assert "Fibonacci" in out
    assert "Stirling" in out
    assert "Pell" in out
    assert "Bell" in out
    assert "Bernoulli" in out
