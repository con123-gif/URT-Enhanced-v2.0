"""Tests for Cathedral Repunit Tower — N=(D^D-1)/(D-1), PG(2,F_D), prime tower."""
import pytest
from math import factorial

from urt.cathedral_repunit import (
    D, N, V, E, F, q, G, GAMMA, GAMMA_INV,
    repunit, REPUNIT_TOWER, REPUNIT_N, REPUNIT_N_PLUS_1,
    IDENTITY_REPUNIT_N, IDENTITY_REPUNIT_GMF,
    POWER_TOWER, D_TO_D, D_TO_D1, D1_TO_D, IDENTITY_D3_POWER,
    decimal_expansion_period,
    GAMMA_INV_DECIMAL, GAMMA_INV_MISSING_DIGIT, IDENTITY_MISSING_8,
    N_DECIMAL, IDENTITY_N_PERIOD_6,
    PG2_POINTS, PG2_LINES, PG2_PTS_PER_LINE, PG2_LINES_THRU_PT, PG2_INCIDENCES,
    IDENTITY_PG2_POINTS, IDENTITY_PG2_SYMMETRIC, IDENTITY_PG2_VALENCY,
    nth_prime, PRIMES_OF_INTEGERS, P_D, P_V2, P_N,
    IDENTITY_PD_EQ_Q, IDENTITY_PV2_EQ_N,
    PRIME_SEQUENCE_FROM_D, PRIME_GAPS_FROM_D,
    ORD_N_10, IDENTITY_ORD_N10_DFACT, IS_FULL_REPTEND,
    RAMANUJAN_SUM_EXACT, RAMANUJAN_SUM_APPROX, RAMANUJAN_CLOSE,
    is_prime, REPUNIT_PRIMALITY, REPUNIT_N_IS_PRIME,
    repunit_summary, print_repunit_report,
)


# ── Repunit function ──────────────────────────────────────────────────────────

def test_repunit_base10():
    """repunit(k, 10) = 1, 11, 111, 1111, ..."""
    assert repunit(1, 10) == 1
    assert repunit(2, 10) == 11
    assert repunit(3, 10) == 111

def test_repunit_base_d():
    """repunit(D, D) = 13 = N."""
    assert repunit(D, D) == N

def test_repunit_tower_length():
    assert len(REPUNIT_TOWER) == D + 2

def test_repunit_tower_values():
    assert REPUNIT_TOWER[0] == 1           # R(1,3)=1
    assert REPUNIT_TOWER[1] == 4           # R(2,3)=4
    assert REPUNIT_TOWER[2] == N           # R(3,3)=13=N
    assert REPUNIT_TOWER[3] == G - F       # R(4,3)=40=G-F

def test_repunit_n_identity():
    """R(D, D) = N."""
    assert IDENTITY_REPUNIT_N
    assert REPUNIT_N == N

def test_repunit_gmf_identity():
    """R(D+1, D) = G - F = 40."""
    assert IDENTITY_REPUNIT_GMF
    assert REPUNIT_N_PLUS_1 == G - F
    assert REPUNIT_N_PLUS_1 == 40

def test_repunit_strictly_increasing():
    for i in range(len(REPUNIT_TOWER)-1):
        assert REPUNIT_TOWER[i] < REPUNIT_TOWER[i+1]


# ── Power tower ───────────────────────────────────────────────────────────────

def test_d_to_d():
    """D^D = 27."""
    assert D_TO_D == 27

def test_d_to_d1():
    """D^(D+1) = 81 = 1/γ."""
    assert D_TO_D1 == GAMMA_INV
    assert D_TO_D1 == 81

def test_d1_to_d():
    """(D+1)^D = 64 = Λ-exponent."""
    assert D1_TO_D == 64

def test_power_tower_identity():
    assert IDENTITY_D3_POWER

def test_power_tower_keys():
    assert "D^3" in POWER_TOWER
    assert "D^4" in POWER_TOWER
    assert "(D+1)^D" in POWER_TOWER


# ── Decimal expansion ─────────────────────────────────────────────────────────

def test_decimal_period_1_over_9():
    """1/9 = 0.111... period = 1."""
    assert decimal_expansion_period(9) == [1]

def test_decimal_period_1_over_7():
    """1/7 = 0.142857... period = 6."""
    assert len(decimal_expansion_period(7)) == 6

def test_gamma_inv_decimal_length():
    """1/81 has period 9 = D²."""
    assert len(GAMMA_INV_DECIMAL) == D**2
    assert len(GAMMA_INV_DECIMAL) == 9

def test_gamma_inv_missing_8():
    """1/81 decimal block is missing the digit 8."""
    assert IDENTITY_MISSING_8
    assert GAMMA_INV_MISSING_DIGIT == 8
    assert 8 not in GAMMA_INV_DECIMAL

def test_gamma_inv_has_digits_0_to_9_minus_8():
    """1/81 block contains exactly digits 0,1,2,3,4,5,6,7,9."""
    expected = {0, 1, 2, 3, 4, 5, 6, 7, 9}
    assert set(GAMMA_INV_DECIMAL) == expected

def test_n_decimal_period_6():
    """1/13 has period 6 = D!."""
    assert IDENTITY_N_PERIOD_6
    assert len(N_DECIMAL) == factorial(D)
    assert len(N_DECIMAL) == 6

def test_n_decimal_block():
    """1/13 = 0.076923... repeating."""
    assert N_DECIMAL == [0, 7, 6, 9, 2, 3]


# ── Projective plane PG(2, F_D) ──────────────────────────────────────────────

def test_pg2_points_equal_n():
    """PG(2, F_D) has N = 13 points."""
    assert IDENTITY_PG2_POINTS
    assert PG2_POINTS == N

def test_pg2_symmetric():
    """PG(2, F_D) has equal number of points and lines (symmetric design)."""
    assert IDENTITY_PG2_SYMMETRIC
    assert PG2_POINTS == PG2_LINES

def test_pg2_valency():
    """D+1 = 4 points per line and 4 lines through each point."""
    assert IDENTITY_PG2_VALENCY
    assert PG2_PTS_PER_LINE == D + 1
    assert PG2_LINES_THRU_PT == D + 1

def test_pg2_incidences():
    """Total incidences = N(D+1) = 52."""
    assert PG2_INCIDENCES == N * (D+1)
    assert PG2_INCIDENCES == 52


# ── Prime tower ───────────────────────────────────────────────────────────────

def test_nth_prime_basic():
    assert nth_prime(1) == 2
    assert nth_prime(2) == 3
    assert nth_prime(3) == 5
    assert nth_prime(6) == 13

def test_prime_d_equals_q():
    """The D-th prime = q = 5."""
    assert IDENTITY_PD_EQ_Q
    assert P_D == q
    assert P_D == 5

def test_prime_v2_equals_n():
    """The (V/2)-th prime = p_6 = 13 = N."""
    assert IDENTITY_PV2_EQ_N
    assert P_V2 == N
    assert P_V2 == 13

def test_prime_n():
    """The N-th prime p_13 = 41."""
    assert P_N == 41

def test_prime_sequence_from_d():
    """Primes starting at p_D: [5, 7, 11, 13] = [q, q+2, q+6, N]."""
    assert PRIME_SEQUENCE_FROM_D[0] == q
    assert PRIME_SEQUENCE_FROM_D[-1] == N
    assert len(PRIME_SEQUENCE_FROM_D) == D + 1

def test_prime_gaps_symmetric():
    """Gaps from p_D: [2, 4, 2] — palindromic."""
    assert PRIME_GAPS_FROM_D == list(reversed(PRIME_GAPS_FROM_D))

def test_primes_of_integers_keys():
    for key in ["p_1", "p_D", "p_q", "p_V2", "p_N", "p_D!"]:
        assert key in PRIMES_OF_INTEGERS


# ── Decimal period (ord) ──────────────────────────────────────────────────────

def test_ord_n_10_equals_d_factorial():
    """ord_N(10) = D! = 6 (10 has multiplicative order 6 mod 13)."""
    assert IDENTITY_ORD_N10_DFACT
    assert ORD_N_10 == factorial(D)
    assert ORD_N_10 == 6

def test_full_reptend():
    """ord_N(10) = (N-1)/2 — N=13 is a full reptend prime in base 10."""
    assert IS_FULL_REPTEND
    assert ORD_N_10 == (N - 1) // 2


# ── Ramanujan generating function ─────────────────────────────────────────────

def test_ramanujan_sum_exact():
    """sum_{k=1}^∞ k/10^k = 10/81 (closed form)."""
    assert abs(RAMANUJAN_SUM_EXACT - 10.0/GAMMA_INV) < 1e-15

def test_ramanujan_sum_approx_matches():
    """Partial sum converges to the closed form."""
    assert RAMANUJAN_CLOSE
    assert abs(RAMANUJAN_SUM_APPROX - RAMANUJAN_SUM_EXACT) < 1e-15

def test_ramanujan_gives_gamma_inv():
    """10/81 × 1/10 = 1/81 = γ."""
    assert abs(RAMANUJAN_SUM_EXACT / 10.0 - GAMMA) < 1e-15


# ── Repunit primality ─────────────────────────────────────────────────────────

def test_repunit_n_is_prime():
    """R(D, D) = N = 13 is prime."""
    assert REPUNIT_N_IS_PRIME
    assert is_prime(N)

def test_repunit_1_not_prime():
    """R(1, D) = 1 is not prime."""
    assert not REPUNIT_PRIMALITY[1]

def test_repunit_2_not_prime():
    """R(2, D) = 4 is not prime."""
    assert not REPUNIT_PRIMALITY[2]

def test_is_prime_basics():
    assert not is_prime(1)
    assert is_prime(2)
    assert is_prime(13)
    assert not is_prime(81)


# ── Summary ───────────────────────────────────────────────────────────────────

def test_repunit_summary_dict():
    s = repunit_summary()
    assert isinstance(s, dict)

def test_repunit_summary_keys():
    s = repunit_summary()
    for key in ["repunit_n", "pg2_points", "prime_d", "ord_n_10",
                "repunit_primality", "all_repunit_ok", "all_prime_ok", "all_pg2_ok"]:
        assert key in s

def test_repunit_summary_all_ok():
    s = repunit_summary()
    assert s["all_repunit_ok"] is True
    assert s["all_prime_ok"] is True
    assert s["all_pg2_ok"] is True

def test_print_repunit_report_runs(capsys):
    print_repunit_report()
    out = capsys.readouterr().out
    assert "REPUNIT" in out or "repunit" in out.lower()

def test_print_report_contains_n(capsys):
    print_repunit_report()
    out = capsys.readouterr().out
    assert "13" in out

def test_print_report_contains_pg2(capsys):
    print_repunit_report()
    out = capsys.readouterr().out
    assert "PG" in out or "projective" in out.lower() or "Projective" in out

def test_print_report_contains_missing_8(capsys):
    print_repunit_report()
    out = capsys.readouterr().out
    assert "8" in out and ("missing" in out.lower() or "!" in out)
