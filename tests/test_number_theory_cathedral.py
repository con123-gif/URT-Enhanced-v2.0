"""Tests for urt/number_theory_cathedral.py — Primes, Mersenne, Fibonacci, Ramanujan."""

import pytest
from math import isfinite


# ── Imports ──────────────────────────────────────────────────────────────────

def test_module_imports():
    from urt.number_theory_cathedral import (
        FIBONACCI, FIBONACCI_INDEX_N,
        MERSENNE_N, MERSENNE_N_IS_PRIME,
        TAU_RAMANUJAN, TAU_2_EQUALS_MINUS_2V, TAU_N,
        QR_13, QNR_13, NUM_QR_13,
        CATALAN_D, T_N, GAUSS_SUM_MODULUS_SQUARED,
        prime_properties, mersenne_check,
        fibonacci_N, ramanujan_tau,
        quadratic_residues_13, catalan_connection,
        number_theory_summary, print_number_theory_report,
    )


# ── Fibonacci ─────────────────────────────────────────────────────────────────

def test_fibonacci_F7_equals_N():
    """F_7 = 13 = N (1-based indexing)."""
    from urt.number_theory_cathedral import FIBONACCI, FIBONACCI_INDEX_N
    from urt.shell_closure import N
    assert FIBONACCI_INDEX_N == 7
    assert FIBONACCI[FIBONACCI_INDEX_N] == N
    assert FIBONACCI[7] == 13


def test_fibonacci_sequence_values():
    """First 8 Fibonacci values (1-based) are correct."""
    from urt.number_theory_cathedral import FIBONACCI
    expected = [0, 1, 1, 2, 3, 5, 8, 13, 21]
    for i, exp in enumerate(expected):
        assert FIBONACCI[i] == exp


def test_fibonacci_recurrence():
    """Each Fibonacci number = sum of previous two (from index 3)."""
    from urt.number_theory_cathedral import FIBONACCI
    for i in range(3, len(FIBONACCI)):
        assert FIBONACCI[i] == FIBONACCI[i-1] + FIBONACCI[i-2]


def test_fibonacci_8_13_consecutive():
    """8 and 13 are consecutive Fibonacci numbers."""
    from urt.number_theory_cathedral import FIBONACCI
    from urt.shell_closure import N
    assert FIBONACCI[6] == 8
    assert FIBONACCI[7] == N    # = 13


# ── Mersenne prime ────────────────────────────────────────────────────────────

def test_mersenne_value():
    """2^13 − 1 = 8191."""
    from urt.number_theory_cathedral import MERSENNE_N
    from urt.shell_closure import N
    assert MERSENNE_N == 2**N - 1
    assert MERSENNE_N == 8191


def test_mersenne_is_prime():
    """8191 is prime."""
    from urt.number_theory_cathedral import MERSENNE_N_IS_PRIME
    assert MERSENNE_N_IS_PRIME is True


def test_mersenne_binary_ones():
    """Binary representation of 2^13 − 1 has exactly 13 ones."""
    from urt.number_theory_cathedral import MERSENNE_N
    from urt.shell_closure import N
    assert bin(MERSENNE_N).count('1') == N


def test_mersenne_check_function():
    from urt.number_theory_cathedral import mersenne_check
    r = mersenne_check()
    assert r["value"] == 8191
    assert r["is_prime"] is True
    assert r["mersenne_index"] == 5   # 5th Mersenne prime
    assert r["binary_ones"] == 13


# ── Ramanujan tau ─────────────────────────────────────────────────────────────

def test_tau_2_equals_minus_24():
    """τ(2) = −24 (exact value from OEIS A000594)."""
    from urt.number_theory_cathedral import TAU_RAMANUJAN
    assert TAU_RAMANUJAN[2] == -24


def test_tau_2_equals_minus_2V():
    """τ(2) = −24 = −2V where V=12."""
    from urt.number_theory_cathedral import TAU_2_EQUALS_MINUS_2V
    from urt.shell_closure import V
    assert TAU_2_EQUALS_MINUS_2V is True
    assert -2 * V == -24


def test_tau_1_equals_1():
    """τ(1) = 1 (normalization)."""
    from urt.number_theory_cathedral import TAU_RAMANUJAN
    assert TAU_RAMANUJAN[1] == 1


def test_tau_N_value():
    """τ(13) = −577738."""
    from urt.number_theory_cathedral import TAU_N
    assert TAU_N == -577738


def test_ramanujan_tau_function():
    from urt.number_theory_cathedral import ramanujan_tau
    r = ramanujan_tau()
    assert r["tau_2"] == -24
    assert r["minus_2V"] == -24
    assert r["tau_2_equals_minus_2V"] is True
    assert r["leech_dim"] == 24


def test_tau_13_values_all_integers():
    """All 13 tau values are integers."""
    from urt.number_theory_cathedral import TAU_RAMANUJAN
    assert len(TAU_RAMANUJAN) == 13
    for k, v in TAU_RAMANUJAN.items():
        assert isinstance(v, int)


# ── Quadratic residues mod 13 ─────────────────────────────────────────────────

def test_num_qr_13():
    """Exactly 6 = (N−1)/2 quadratic residues mod 13."""
    from urt.number_theory_cathedral import NUM_QR_13, QR_13
    from urt.shell_closure import N
    assert NUM_QR_13 == (N - 1) // 2
    assert NUM_QR_13 == 6
    assert len(QR_13) == 6


def test_qr_13_values():
    """QR mod 13 = {1, 3, 4, 9, 10, 12}."""
    from urt.number_theory_cathedral import QR_13
    assert QR_13 == [1, 3, 4, 9, 10, 12]


def test_sum_qr_equals_3N():
    """Sum of quadratic residues mod 13 = 39 = 3N."""
    from urt.number_theory_cathedral import QR_13
    from urt.shell_closure import N
    assert sum(QR_13) == 3 * N


def test_qr_qnr_partition_mod13():
    """QR and QNR partition {1, …, 12}."""
    from urt.number_theory_cathedral import QR_13, QNR_13
    from urt.shell_closure import N
    all_nonzero = set(range(1, N))
    assert set(QR_13) | set(QNR_13) == all_nonzero
    assert set(QR_13) & set(QNR_13) == set()


# ── Catalan number ────────────────────────────────────────────────────────────

def test_catalan_D_equals_q():
    """C_D = C_3 = 5 = q."""
    from urt.number_theory_cathedral import CATALAN_D
    from urt.shell_closure import q
    assert CATALAN_D == 5
    assert CATALAN_D == q


def test_catalan_connection_function():
    from urt.number_theory_cathedral import catalan_connection
    r = catalan_connection()
    assert r["C_D_equals_q"] is True
    assert r["C_D"] == 5
    assert r["catalan_seq"][3] == 5   # C_3 = 5 (0-indexed)


# ── Summary / report ──────────────────────────────────────────────────────────

def test_number_theory_summary_structure():
    from urt.number_theory_cathedral import number_theory_summary
    r = number_theory_summary()
    assert "prime_properties" in r
    assert "mersenne_check" in r
    assert "fibonacci_N" in r
    assert "ramanujan_tau" in r
    assert "quadratic_residues_13" in r
    assert "catalan_connection" in r
    assert "key_results" in r


def test_print_number_theory_report(capsys):
    from urt.number_theory_cathedral import print_number_theory_report
    print_number_theory_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "CATHEDRAL NUMBER THEORY" in out
    assert "8191" in out
