"""
Tests for urt/partition_function_cathedral.py
Partition Function Cathedral — 60+ tests covering all identities.
"""

import pytest
from math import factorial

from urt.partition_function_cathedral import (
    # Core function
    partition_count,
    # Pre-computed table
    P_TABLE,
    P_0, P_1, P_2, P_3, P_4, P_5, P_6, P_7,
    P_8, P_9, P_10, P_11, P_12, P_13,
    # Self-referential identity flags
    IDENTITY_P_Dm1_IS_Dm1,
    IDENTITY_P_D_IS_D,
    IDENTITY_P_qm1_IS_q,
    IDENTITY_P_q_IS_DFACT1,
    IDENTITY_P_DFACT1_IS_VD,
    PARTITION_CASCADE,
    IDENTITY_CASCADE,
    # Further Cathedral values
    IDENTITY_P8_IS_2N4,
    IDENTITY_P9_IS_E,
    IDENTITY_P10_DFACT,
    IDENTITY_P11_E7,
    IDENTITY_P_V_IS_77,
    IDENTITY_P_V_MOD_N,
    IDENTITY_P_N_IS_101,
    # Ramanujan congruences
    IDENTITY_RAMANUJAN_MOD5,
    IDENTITY_RAMANUJAN_MOD7,
    ramanujan_check_5,
    ramanujan_check_7,
    # Euler pentagonal
    euler_pentagonal,
    PENT_k1, PENT_km1, PENT_k2, PENT_km2, PENT_k3, PENT_km3,
    PENTAGONAL_D_COEFF,
    IDENTITY_PENT_k2_IS_q,
    IDENTITY_PENT_km2_IS_DFACT1,
    IDENTITY_PENT_k3_IS_V,
    IDENTITY_PENT_km3_IS_VD,
    IDENTITY_PENT_km1_IS_Dm1,
    IDENTITY_PENT_COEFF_IS_D,
    # Dedekind η
    ETA_POWER, ETA_WEIGHT, ETA_EXPONENT_DENOM,
    IDENTITY_ETA_POWER_IS_2V,
    IDENTITY_ETA_WEIGHT_IS_V,
    IDENTITY_ETA_DENOM_IS_2V,
    # Self-referential counts
    N_SELF_REF_PARTITIONS,
    SELF_REF_COUNT,
    IDENTITY_SELF_REF_COUNT_IS_q,
    IDENTITY_SELF_REF_IS_D,
    # Sum identities
    SUM_P0_TO_D,
    SUM_P0_TO_q,
    IDENTITY_SUM_P0_D_IS_DFACT1,
    IDENTITY_SUM_P0_q_IS_19,
    # All identities
    ALL_PARTITION_IDENTITIES,
    ALL_PARTITION_EXACT,
    # Summary and report
    partition_summary,
    print_partition_report,
    # Constants
    GAMMA_INV,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Section 1: partition_count function ───────────────────────────────────────

class TestPartitionCountFunction:
    """Tests for the partition_count(n) dynamic programming function."""

    def test_p0_equals_1(self):
        assert partition_count(0) == 1

    def test_p1_equals_1(self):
        assert partition_count(1) == 1

    def test_p2_equals_2(self):
        assert partition_count(2) == 2

    def test_p3_equals_3(self):
        assert partition_count(3) == 3

    def test_p4_equals_5(self):
        assert partition_count(4) == 5

    def test_p5_equals_7(self):
        assert partition_count(5) == 7

    def test_p6_equals_11(self):
        assert partition_count(6) == 11

    def test_p7_equals_15(self):
        assert partition_count(7) == 15

    def test_p8_equals_22(self):
        assert partition_count(8) == 22

    def test_p9_equals_30(self):
        assert partition_count(9) == 30

    def test_p10_equals_42(self):
        assert partition_count(10) == 42

    def test_p11_equals_56(self):
        assert partition_count(11) == 56

    def test_p12_equals_77(self):
        assert partition_count(12) == 77

    def test_p13_equals_101(self):
        assert partition_count(13) == 101

    def test_negative_returns_0(self):
        assert partition_count(-1) == 0

    def test_table_matches_function(self):
        """P_TABLE values match partition_count for all n in [0..20]."""
        for n, pn in enumerate(P_TABLE):
            assert pn == partition_count(n), f"Mismatch at n={n}"


# ── Section 2: Pre-computed constants ─────────────────────────────────────────

class TestPrecomputedConstants:
    """Tests for the P_0..P_13 pre-computed constants."""

    def test_P_0(self):  assert P_0 == 1
    def test_P_1(self):  assert P_1 == 1
    def test_P_2(self):  assert P_2 == 2
    def test_P_3(self):  assert P_3 == 3
    def test_P_4(self):  assert P_4 == 5
    def test_P_5(self):  assert P_5 == 7
    def test_P_6(self):  assert P_6 == 11
    def test_P_7(self):  assert P_7 == 15
    def test_P_8(self):  assert P_8 == 22
    def test_P_9(self):  assert P_9 == 30
    def test_P_10(self): assert P_10 == 42
    def test_P_11(self): assert P_11 == 56
    def test_P_12(self): assert P_12 == 77
    def test_P_13(self): assert P_13 == 101


# ── Section 3: Self-referential identity flags ────────────────────────────────

class TestSelfReferentialIdentities:
    """The central self-referential miracles."""

    def test_p_Dm1_is_Dm1_flag(self):
        """p(D-1) = D-1: flag is True."""
        assert IDENTITY_P_Dm1_IS_Dm1 is True

    def test_p_Dm1_is_Dm1_value(self):
        """p(2) = 2 = D-1 numerically."""
        assert P_2 == D - 1

    def test_p_D_is_D_flag(self):
        """p(D) = D: central self-referential miracle flag."""
        assert IDENTITY_P_D_IS_D is True

    def test_p_D_is_D_value(self):
        """p(3) = 3 = D numerically."""
        assert P_3 == D == 3

    def test_p_qm1_is_q_flag(self):
        """p(q-1) = q: self-referential miracle flag."""
        assert IDENTITY_P_qm1_IS_q is True

    def test_p_qm1_is_q_value(self):
        """p(4) = 5 = q numerically."""
        assert P_4 == q == 5

    def test_p_q_is_DFACT1_flag(self):
        """p(q) = D!+1: Cathedral flag."""
        assert IDENTITY_P_q_IS_DFACT1 is True

    def test_p_q_is_DFACT1_value(self):
        """p(5) = 7 = D!+1 numerically."""
        assert P_5 == factorial(D) + 1 == 7

    def test_p_DFACT1_is_VD_flag(self):
        """p(D!+1) = V+D: Cathedral flag."""
        assert IDENTITY_P_DFACT1_IS_VD is True

    def test_p_DFACT1_is_VD_value(self):
        """p(7) = 15 = V+D numerically."""
        assert P_7 == V + D == 15

    def test_cascade_flag(self):
        """[p(D), p(q-1), p(q)] = [D, q, D!+1] cascade flag."""
        assert IDENTITY_CASCADE is True

    def test_cascade_value(self):
        """Cascade list equals [3, 5, 7] = [D, q, D!+1]."""
        assert PARTITION_CASCADE == [D, q, factorial(D) + 1]
        assert PARTITION_CASCADE == [3, 5, 7]


# ── Section 4: Further Cathedral values ───────────────────────────────────────

class TestFurtherCathedralValues:
    """Additional Cathedral identities at key partition values."""

    def test_p8_is_2N4_flag(self):
        assert IDENTITY_P8_IS_2N4 is True

    def test_p8_is_2N4_value(self):
        """p(8) = 22 = 2N-4."""
        assert P_8 == 2 * N - 4 == 22

    def test_p9_is_E_flag(self):
        assert IDENTITY_P9_IS_E is True

    def test_p9_is_E_value(self):
        """p(9) = 30 = E = icosahedral edge count."""
        assert P_9 == E == 30

    def test_p10_dfact_flag(self):
        assert IDENTITY_P10_DFACT is True

    def test_p10_dfact_value(self):
        """p(10) = 42 = D!*(D!+1) = 6*7."""
        assert P_10 == factorial(D) * (factorial(D) + 1) == 42

    def test_p11_e7_flag(self):
        assert IDENTITY_P11_E7 is True

    def test_p11_e7_value(self):
        """p(11) = 56 = 2^D*(D!+1) = 8*7 = E7 first rep dim."""
        assert P_11 == 2**D * (factorial(D) + 1) == 56

    def test_p_V_is_77_flag(self):
        assert IDENTITY_P_V_IS_77 is True

    def test_p_V_is_77_value(self):
        """p(V) = p(12) = 77 = (D!+1)*(2D+q) = 7*11."""
        assert P_12 == (factorial(D) + 1) * (2 * D + q) == 77

    def test_p_V_mod_N_flag(self):
        assert IDENTITY_P_V_MOD_N is True

    def test_p_V_mod_N_value(self):
        """p(V) mod N = 77 mod 13 = 12 = V."""
        assert P_12 % N == V == 12

    def test_p_N_is_101_flag(self):
        assert IDENTITY_P_N_IS_101 is True

    def test_p_N_is_101_value(self):
        """p(N) = p(13) = 101 (prime at Cathedral index N)."""
        assert P_13 == 101


# ── Section 5: Ramanujan congruences ─────────────────────────────────────────

class TestRamanujanCongruences:
    """Ramanujan's famous partition congruences with Cathedral moduli."""

    def test_ramanujan_mod5_flag(self):
        """Flag: p(5n+4) ≡ 0 (mod 5=q) for all tested n."""
        assert IDENTITY_RAMANUJAN_MOD5 is True

    def test_ramanujan_mod7_flag(self):
        """Flag: p(7n+5) ≡ 0 (mod 7=D!+1) for all tested n."""
        assert IDENTITY_RAMANUJAN_MOD7 is True

    @pytest.mark.parametrize("n", [0, 1, 2, 3, 4, 5])
    def test_p_5n4_mod5(self, n):
        """p(5n+4) ≡ 0 (mod 5) for specific n values."""
        assert partition_count(5 * n + 4) % 5 == 0

    @pytest.mark.parametrize("n", [0, 1, 2, 3, 4, 5])
    def test_p_7n5_mod7(self, n):
        """p(7n+5) ≡ 0 (mod 7) for specific n values."""
        assert partition_count(7 * n + 5) % 7 == 0

    def test_ramanujan_check_5_function(self):
        """ramanujan_check_5 helper returns True for n_max=10."""
        assert ramanujan_check_5(10) is True

    def test_ramanujan_check_7_function(self):
        """ramanujan_check_7 helper returns True for n_max=10."""
        assert ramanujan_check_7(10) is True

    def test_ramanujan_check_5_small(self):
        """ramanujan_check_5 with n_max=0: just p(4)=5≡0(5)."""
        assert ramanujan_check_5(0) is True

    def test_ramanujan_check_7_small(self):
        """ramanujan_check_7 with n_max=0: just p(5)=7≡0(7)."""
        assert ramanujan_check_7(0) is True

    def test_p4_is_q_mod5(self):
        """p(4)=5=q is divisible by q=5: base case."""
        assert P_4 % q == 0

    def test_p5_is_Dfact1_mod7(self):
        """p(5)=7=D!+1 is divisible by 7: base case."""
        assert P_5 % (factorial(D) + 1) == 0


# ── Section 6: Euler pentagonal numbers ───────────────────────────────────────

class TestEulerPentagonal:
    """Euler pentagonal numbers — Cathedral integers appear as pentagonal values."""

    def test_euler_pentagonal_k1(self):
        """ω_1 = 1."""
        assert euler_pentagonal(1) == 1

    def test_euler_pentagonal_km1(self):
        """ω_{-1} = 2 = D-1."""
        assert euler_pentagonal(-1) == 2

    def test_euler_pentagonal_k2(self):
        """ω_2 = 5 = q."""
        assert euler_pentagonal(2) == q == 5

    def test_euler_pentagonal_km2(self):
        """ω_{-2} = 7 = D!+1."""
        assert euler_pentagonal(-2) == factorial(D) + 1 == 7

    def test_euler_pentagonal_k3(self):
        """ω_3 = 12 = V."""
        assert euler_pentagonal(3) == V == 12

    def test_euler_pentagonal_km3(self):
        """ω_{-3} = 15 = V+D."""
        assert euler_pentagonal(-3) == V + D == 15

    def test_euler_pentagonal_k4(self):
        """ω_4 = 22."""
        assert euler_pentagonal(4) == 22

    def test_euler_pentagonal_k0(self):
        """ω_0 = 0."""
        assert euler_pentagonal(0) == 0

    def test_pent_k2_is_q_flag(self):
        assert IDENTITY_PENT_k2_IS_q is True

    def test_pent_k2_is_q_value(self):
        assert PENT_k2 == q

    def test_pent_km2_is_DFACT1_flag(self):
        assert IDENTITY_PENT_km2_IS_DFACT1 is True

    def test_pent_km2_is_DFACT1_value(self):
        assert PENT_km2 == factorial(D) + 1

    def test_pent_k3_is_V_flag(self):
        assert IDENTITY_PENT_k3_IS_V is True

    def test_pent_k3_is_V_value(self):
        assert PENT_k3 == V

    def test_pent_km3_is_VD_flag(self):
        assert IDENTITY_PENT_km3_IS_VD is True

    def test_pent_km3_is_VD_value(self):
        assert PENT_km3 == V + D

    def test_pent_km1_is_Dm1_flag(self):
        assert IDENTITY_PENT_km1_IS_Dm1 is True

    def test_pent_km1_is_Dm1_value(self):
        assert PENT_km1 == D - 1

    def test_pentagonal_D_coeff_flag(self):
        """The coefficient 3 in k(3k-1)/2 equals D."""
        assert IDENTITY_PENT_COEFF_IS_D is True

    def test_pentagonal_D_coeff_value(self):
        assert PENTAGONAL_D_COEFF == D == 3

    def test_pent_k1_value(self):
        assert PENT_k1 == 1

    def test_pent_km1_value(self):
        assert PENT_km1 == 2


# ── Section 7: Dedekind η connection ─────────────────────────────────────────

class TestDedekindEta:
    """η(τ)^{2V} = Δ(τ): the partition product and modular forms."""

    def test_eta_power_flag(self):
        assert IDENTITY_ETA_POWER_IS_2V is True

    def test_eta_power_is_24(self):
        """η^{2V} = η^24: the famous power in Δ = η^24."""
        assert ETA_POWER == 24

    def test_eta_power_is_2V(self):
        assert ETA_POWER == 2 * V

    def test_eta_weight_flag(self):
        assert IDENTITY_ETA_WEIGHT_IS_V is True

    def test_eta_weight_is_12(self):
        """Discriminant Δ has modular weight 12 = V."""
        assert ETA_WEIGHT == 12

    def test_eta_weight_is_V(self):
        assert ETA_WEIGHT == V

    def test_eta_denom_flag(self):
        assert IDENTITY_ETA_DENOM_IS_2V is True

    def test_eta_denom_is_24(self):
        """The '24' in x^{1/24} equals 2V."""
        assert ETA_EXPONENT_DENOM == 24

    def test_eta_denom_is_2V(self):
        assert ETA_EXPONENT_DENOM == 2 * V


# ── Section 8: Self-referential counts ───────────────────────────────────────

class TestSelfRefCounts:
    """Counts of self-referential partition values."""

    def test_N_self_ref_partitions_flag(self):
        """N_SELF_REF_PARTITIONS = q: flag is True."""
        assert IDENTITY_SELF_REF_COUNT_IS_q is True

    def test_N_self_ref_partitions_value(self):
        """N_SELF_REF_PARTITIONS = 5 = q (in range [0..7])."""
        assert N_SELF_REF_PARTITIONS == q == 5

    def test_SELF_REF_COUNT_flag(self):
        """SELF_REF_COUNT = D: flag is True."""
        assert IDENTITY_SELF_REF_IS_D is True

    def test_SELF_REF_COUNT_value(self):
        """SELF_REF_COUNT = 3 = D (three truly self-referential cases)."""
        assert SELF_REF_COUNT == D == 3


# ── Section 9: Sum identities ─────────────────────────────────────────────────

class TestSumIdentities:
    """Sums of consecutive partition values."""

    def test_sum_p0_to_D_flag(self):
        assert IDENTITY_SUM_P0_D_IS_DFACT1 is True

    def test_sum_p0_to_D_value(self):
        """p(0)+p(1)+p(2)+p(3) = 7 = D!+1."""
        assert SUM_P0_TO_D == factorial(D) + 1 == 7

    def test_sum_p0_to_D_manual(self):
        """Manual check: 1+1+2+3 = 7."""
        assert P_0 + P_1 + P_2 + P_3 == 7

    def test_sum_p0_to_q_flag(self):
        assert IDENTITY_SUM_P0_q_IS_19 is True

    def test_sum_p0_to_q_value(self):
        """p(0)+...+p(5) = 19 (prime after N=13)."""
        assert SUM_P0_TO_q == 19

    def test_sum_p0_to_q_manual(self):
        """Manual check: 1+1+2+3+5+7 = 19."""
        assert P_0 + P_1 + P_2 + P_3 + P_4 + P_5 == 19


# ── Section 10: All identities aggregate ─────────────────────────────────────

class TestAllIdentities:
    """Tests for the ALL_PARTITION_IDENTITIES aggregate."""

    def test_all_partition_exact_is_true(self):
        """ALL_PARTITION_EXACT is True (all 28+ identities pass)."""
        assert ALL_PARTITION_EXACT is True

    def test_all_identities_is_dict(self):
        assert isinstance(ALL_PARTITION_IDENTITIES, dict)

    def test_all_identities_values_are_bool(self):
        for key, val in ALL_PARTITION_IDENTITIES.items():
            assert isinstance(val, bool), f"Key '{key}' has non-bool value {val}"

    def test_all_identities_all_true(self):
        for key, val in ALL_PARTITION_IDENTITIES.items():
            assert val is True, f"Identity '{key}' is False"

    def test_n_identities_at_least_28(self):
        """Module must contain at least 28 identities."""
        assert len(ALL_PARTITION_IDENTITIES) >= 28

    def test_gamma_inv(self):
        """GAMMA_INV = 81 = G + F + 1."""
        assert GAMMA_INV == G + F + 1 == 81


# ── Section 11: Summary dict ──────────────────────────────────────────────────

class TestPartitionSummary:
    """Tests for the partition_summary() function."""

    def test_summary_is_dict(self):
        assert isinstance(partition_summary(), dict)

    def test_summary_all_exact_key(self):
        assert partition_summary()["all_partition_exact"] is True

    def test_summary_p3_key(self):
        assert partition_summary()["p_3"] == D == 3

    def test_summary_p4_key(self):
        assert partition_summary()["p_4"] == q == 5

    def test_summary_p5_key(self):
        assert partition_summary()["p_5"] == factorial(D) + 1 == 7

    def test_summary_p12_key(self):
        assert partition_summary()["p_12"] == 77

    def test_summary_p9_is_E(self):
        assert partition_summary()["p_9"] == E

    def test_summary_p_D_is_D_flag(self):
        assert partition_summary()["p_D_is_D"] is True

    def test_summary_p_V_is_77_flag(self):
        assert partition_summary()["p_V_is_77"] is True

    def test_summary_ramanujan_mod5(self):
        assert partition_summary()["ramanujan_mod5"] is True

    def test_summary_ramanujan_mod7(self):
        assert partition_summary()["ramanujan_mod7"] is True

    def test_summary_eta_power(self):
        assert partition_summary()["eta_power"] == 24

    def test_summary_N_self_ref(self):
        assert partition_summary()["N_self_ref_partitions"] == q

    def test_summary_self_ref_count(self):
        assert partition_summary()["self_ref_count"] == D

    def test_summary_sum_p0_D(self):
        assert partition_summary()["sum_p0_to_D"] == factorial(D) + 1

    def test_summary_sum_p0_q(self):
        assert partition_summary()["sum_p0_to_q"] == 19

    def test_summary_cathedral_integers(self):
        s = partition_summary()
        assert s["D"] == D
        assert s["N"] == N
        assert s["V"] == V
        assert s["q"] == q
        assert s["G"] == G

    def test_summary_n_identities(self):
        assert partition_summary()["n_identities"] >= 28


# ── Section 12: print_partition_report ───────────────────────────────────────

class TestPrintReport:
    """Tests for the print_partition_report() output."""

    def test_report_runs_without_error(self, capsys):
        print_partition_report()
        out = capsys.readouterr().out
        assert len(out) > 0

    def test_report_length_exceeds_300_chars(self, capsys):
        print_partition_report()
        out = capsys.readouterr().out
        assert len(out) > 300

    def test_report_contains_self_referential(self, capsys):
        print_partition_report()
        out = capsys.readouterr().out
        assert "SELF-REFERENTIAL" in out

    def test_report_contains_77(self, capsys):
        print_partition_report()
        out = capsys.readouterr().out
        assert "77" in out

    def test_report_contains_ramanujan(self, capsys):
        print_partition_report()
        out = capsys.readouterr().out
        assert "Ramanujan" in out or "ramanujan" in out.lower()

    def test_report_contains_pentagonal(self, capsys):
        print_partition_report()
        out = capsys.readouterr().out
        assert "pentagonal" in out.lower()

    def test_report_contains_eta(self, capsys):
        print_partition_report()
        out = capsys.readouterr().out
        assert "η" in out or "eta" in out.lower() or "Dedekind" in out

    def test_report_contains_cathedral(self, capsys):
        print_partition_report()
        out = capsys.readouterr().out
        assert "Cathedral" in out or "CATHEDRAL" in out

    def test_report_contains_all_exact(self, capsys):
        print_partition_report()
        out = capsys.readouterr().out
        assert "exact" in out.lower() or "True" in out

    def test_report_contains_p_D_equals_D(self, capsys):
        """Report mentions p(3) = 3 = D."""
        print_partition_report()
        out = capsys.readouterr().out
        assert "p(3)" in out or "p(D)" in out


# ── Section 13: Edge cases and cross-checks ───────────────────────────────────

class TestEdgeCasesAndCrossChecks:
    """Edge cases and cross-checks between identities."""

    def test_p_D_and_cascade_agree(self):
        """P_3 and PARTITION_CASCADE[0] are both D."""
        assert P_3 == PARTITION_CASCADE[0] == D

    def test_pent_k2_and_p4_agree(self):
        """ω_2 = 5 = p(4) = q: pentagonal and partition meet at q."""
        assert PENT_k2 == P_4 == q

    def test_pent_km2_and_p5_agree(self):
        """ω_{-2} = 7 = p(5) = D!+1: pentagonal and partition meet at D!+1."""
        assert PENT_km2 == P_5 == factorial(D) + 1

    def test_pent_k3_and_P_12_index(self):
        """ω_3 = 12 = V, and V is the index of p(V) = 77."""
        assert PENT_k3 == V
        assert partition_count(PENT_k3) == 77

    def test_pent_km3_and_P_7(self):
        """ω_{-3} = 15 = V+D = p(7) = p(D!+1)."""
        assert PENT_km3 == V + D == P_7

    def test_P_9_and_E_edges(self):
        """p(9) = E = 30 = icosahedral edge count."""
        assert P_9 == E

    def test_P_11_factorization(self):
        """p(11) = 56 = 8*7 = 2^3 * 7 = 2^D * (D!+1)."""
        assert P_11 == 8 * 7
        assert P_11 == 2**D * (factorial(D) + 1)

    def test_eta_power_equals_2_times_V(self):
        assert ETA_POWER == 2 * V

    def test_gamma_inv_is_81(self):
        """γ = 1/81, so GAMMA_INV = 81."""
        assert GAMMA_INV == 81

    def test_sum_p0_D_is_D_factorial_plus_1(self):
        """Σp(0..D) = D!+1 connects partition sums to factorial."""
        assert SUM_P0_TO_D == factorial(D) + 1

    def test_p12_mod13_is_12(self):
        """p(V) mod N = 77 mod 13 = 12 = V: circular Cathedral identity."""
        assert P_12 % N == V
