"""Tests for urt/partition_cathedral.py — Integer Partition Function Cathedral."""
import pytest
from math import factorial

from urt.partition_cathedral import (
    partition, P_VALUES, P_D, P_D1, P_q, P_V, P_N, P_F,
    P_8, P_9, P_10, P_11,
    IDENTITY_P_D_IS_D, IDENTITY_P_D1_IS_q, IDENTITY_P_q_IS_DFACT1,
    IDENTITY_P_V_CATHEDRAL, IDENTITY_SELF_REF, IDENTITY_TRIPLE,
    IDENTITY_P8_EQ_2N_MINUS4, IDENTITY_P9_IS_E,
    IDENTITY_P10_DFACT, IDENTITY_P11_E7, IDENTITY_P_V_MOD_N,
    PARTITION_CATHEDRAL_TRIPLE, P_V_FORMULA,
    PENTAGONAL_D_COEFF, IDENTITY_PENTAGONAL_D,
    PENT_k2, PENT_km2, PENT_k3,
    IDENTITY_PENT_k2_IS_q, IDENTITY_PENT_km2_IS_DFACT1, IDENTITY_PENT_k3_IS_V,
    PARTITION_ASYM_AT_D, PARTITION_ASYM_AT_V,
    IDENTITY_ASYM_D_APPROX, IDENTITY_ASYM_V_APPROX,
    partition_asymptotic,
    IDENTITY_G_SQUARE_PARTITION, E_PARTITION_DFACT_q, IDENTITY_G_3PARTS_F,
    ALL_PARTITION_IDENTITIES, ALL_PARTITION_EXACT, N_PARTITION_IDENTITIES,
    partitions_into_parts, PARTS_N_INTO_D_q,
    partition_summary, print_partition_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Basic partition values ─────────────────────────────────────────────────────

class TestPartitionValues:
    def test_p0(self):
        assert partition(0) == 1

    def test_p1(self):
        assert partition(1) == 1

    def test_p2(self):
        assert partition(2) == 2

    def test_p3_is_D(self):
        assert partition(D) == D == 3

    def test_p4_is_q(self):
        assert partition(D + 1) == q == 5

    def test_p5_is_dfact_plus1(self):
        assert partition(q) == factorial(D) + 1 == 7

    def test_p6(self):
        assert partition(6) == 11

    def test_p12_is_77(self):
        assert partition(V) == 77

    def test_p13_is_101(self):
        assert partition(N) == 101

    def test_p_values_list(self):
        for n, pn in enumerate(P_VALUES):
            assert pn == partition(n)


# ── Self-referential and Cathedral identity tests ─────────────────────────────

class TestSelfReferential:
    def test_p_D_is_D(self):
        """p(D) = p(3) = 3 = D — the ultimate self-referential identity."""
        assert IDENTITY_P_D_IS_D
        assert P_D == D

    def test_p_D1_is_q(self):
        """p(D+1) = p(4) = 5 = q."""
        assert IDENTITY_P_D1_IS_q
        assert P_D1 == q

    def test_p_q_is_dfact_plus1(self):
        """p(q) = p(5) = 7 = D!+1."""
        assert IDENTITY_P_q_IS_DFACT1
        assert P_q == factorial(D) + 1

    def test_p_V_cathedral(self):
        """p(V) = p(12) = 77 = (D!+1)(2D+q) = 7×11."""
        assert IDENTITY_P_V_CATHEDRAL
        assert P_V == P_V_FORMULA == 77
        assert P_V_FORMULA == (factorial(D) + 1) * (2 * D + q)

    def test_cathedral_triple(self):
        """[p(D), p(D+1), p(q)] = [D, q, D!+1] = [3, 5, 7]."""
        assert IDENTITY_TRIPLE
        assert PARTITION_CATHEDRAL_TRIPLE == [D, q, factorial(D) + 1]


# ── Further Cathedral partition values ────────────────────────────────────────

class TestFurtherValues:
    def test_p8_is_2N_minus4(self):
        """p(8) = 22 = 2N-4 (also K3 second Betti number)."""
        assert IDENTITY_P8_EQ_2N_MINUS4
        assert P_8 == 2 * N - 4 == 22

    def test_p9_is_E(self):
        """p(9) = 30 = E = number of edges of G₁₃."""
        assert IDENTITY_P9_IS_E
        assert P_9 == E == 30

    def test_p10_dfact(self):
        """p(10) = 42 = D!×(D!+1) = 6×7."""
        assert IDENTITY_P10_DFACT
        assert P_10 == factorial(D) * (factorial(D) + 1) == 42

    def test_p11_e7(self):
        """p(11) = 56 = 2^D×(D!+1) = 8×7 = E₇ first fundamental rep."""
        assert IDENTITY_P11_E7
        assert P_11 == 2**D * (factorial(D) + 1) == 56

    def test_p_V_mod_N_is_V(self):
        """p(V) mod N = 77 mod 13 = 12 = V."""
        assert IDENTITY_P_V_MOD_N
        assert P_V % N == V == 12


# ── Pentagonal theorem ────────────────────────────────────────────────────────

class TestPentagonal:
    def test_pentagonal_coeff_is_D(self):
        """The '3' in generalized pentagonal numbers k(3k-1)/2 is D=3."""
        assert IDENTITY_PENTAGONAL_D
        assert PENTAGONAL_D_COEFF == D

    def test_pent_k2_is_q(self):
        """ω_2 = 2(3×2-1)/2 = 5 = q."""
        assert IDENTITY_PENT_k2_IS_q
        assert PENT_k2 == q == 5

    def test_pent_km2_is_dfact1(self):
        """ω_{-2} = 7 = D!+1."""
        assert IDENTITY_PENT_km2_IS_DFACT1
        assert PENT_km2 == factorial(D) + 1 == 7

    def test_pent_k3_is_V(self):
        """ω_3 = 3(3×3-1)/2 = 12 = V."""
        assert IDENTITY_PENT_k3_IS_V
        assert PENT_k3 == V == 12

    def test_pentagonal_recurrence_correctness(self):
        """Euler's pentagonal recurrence gives correct p values."""
        known = {0: 1, 1: 1, 2: 2, 3: 3, 4: 5, 5: 7, 12: 77}
        for n, expected in known.items():
            assert partition(n) == expected


# ── Hardy-Ramanujan asymptotic ────────────────────────────────────────────────

class TestAsymptotic:
    def test_asymptotic_positive(self):
        assert partition_asymptotic(D) > 0
        assert partition_asymptotic(V) > 0

    def test_asymptotic_at_D_approx(self):
        assert IDENTITY_ASYM_D_APPROX

    def test_asymptotic_at_V_approx(self):
        assert IDENTITY_ASYM_V_APPROX

    def test_asymptotic_increases(self):
        prev = partition_asymptotic(D)
        for n in range(D + 1, V + 1):
            curr = partition_asymptotic(n)
            assert curr > prev
            prev = curr


# ── Partition of G and E ──────────────────────────────────────────────────────

class TestCathedralPartitions:
    def test_G_square_partition(self):
        """G = 1² + 3² + 3² + 4² + 5² = 60 (A₅ irrep squares)."""
        assert IDENTITY_G_SQUARE_PARTITION
        assert sum([1, 9, 9, 16, 25]) == G

    def test_E_dfact_q(self):
        """E = D! × q = 6 × 5 = 30."""
        assert E_PARTITION_DFACT_q
        assert factorial(D) * q == E

    def test_G_three_parts_F(self):
        """G / D = F: G splits into D=3 equal parts of F=20 each."""
        assert IDENTITY_G_3PARTS_F
        assert G // D == F

    def test_partitions_N_into_D_q(self):
        """Partitions of N=13 using only parts {D=3, q=5}."""
        assert PARTS_N_INTO_D_q == 1  # only 3+5+5=13

    def test_partitions_function_trivial(self):
        assert partitions_into_parts(0, [1, 2, 3]) == 1
        assert partitions_into_parts(3, [1, 2, 3]) == 3


# ── All identities ────────────────────────────────────────────────────────────

def test_all_partition_exact():
    assert ALL_PARTITION_EXACT

def test_n_partition_identities():
    assert N_PARTITION_IDENTITIES == len(ALL_PARTITION_IDENTITIES)
    assert N_PARTITION_IDENTITIES >= 15


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = partition_summary()
    assert isinstance(s, dict)

def test_summary_self_referential():
    s = partition_summary()
    assert s["p_D"] == D
    assert s["p_D_is_D"] is True

def test_summary_p9_is_E():
    s = partition_summary()
    assert s["p_9"] == E

def test_summary_all_exact():
    s = partition_summary()
    assert s["all_partition_exact"] is True

def test_print_report_runs(capsys):
    print_partition_report()
    out = capsys.readouterr().out
    assert len(out) > 200

def test_print_report_contains_self_ref(capsys):
    print_partition_report()
    out = capsys.readouterr().out
    assert "SELF-REFERENTIAL" in out or "self" in out.lower()

def test_print_report_contains_77(capsys):
    print_partition_report()
    out = capsys.readouterr().out
    assert "77" in out

def test_print_report_contains_pentagonal(capsys):
    print_partition_report()
    out = capsys.readouterr().out
    assert "Pentagonal" in out or "pentagonal" in out.lower()
