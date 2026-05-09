"""
Tests for the Cathedral Grand Tour module — five new clusters of
connections between Cathedral integers and classical mathematical
sequences.
"""
import pytest

from urt.cathedral_grand_tour import (
    is_prime, nth_prime,
    cathedral_prime_ladder,
    coxeter_quartet,
    bernoulli_zeta_connections,
    square_stirling_partition_hits,
    lie_mathieu_hits,
    all_grand_tour_audit,
    all_grand_tour_verify,
)


# ── Primality helpers ────────────────────────────────────────────────────

class TestPrimalityHelpers:
    def test_is_prime_basic(self):
        assert not is_prime(0)
        assert not is_prime(1)
        assert is_prime(2)
        assert is_prime(3)
        assert not is_prime(4)
        assert is_prime(13)
        assert is_prime(197)
        assert is_prime(137)
        assert not is_prime(81)

    def test_nth_prime_first_six(self):
        assert [nth_prime(n) for n in range(1, 7)] == [2, 3, 5, 7, 11, 13]


# ── Cluster 1: Cathedral Prime Ladder ────────────────────────────────────

class TestCathedralPrimeLadder:
    def test_p_D_minus_1_is_D(self):
        from urt.shell_closure import D
        assert nth_prime(D - 1) == D

    def test_p_D_is_q(self):
        from urt.shell_closure import D, q
        assert nth_prime(D) == q

    def test_p_D_factorial_is_N(self):
        from math import factorial
        from urt.shell_closure import D, N
        assert nth_prime(factorial(D)) == N

    def test_p_DDq_is_197(self):
        from urt.shell_closure import D, q
        assert nth_prime(D * D * q) == 197

    def test_audit_passes(self):
        a = cathedral_prime_ladder()
        assert all([
            a["p_(D-1)_is_D"], a["p_D_is_q"],
            a["p_(D!)_is_N"], a["p_(D²·q)_is_dCP"],
        ])


# ── Cluster 2: Coxeter Quartet ───────────────────────────────────────────

class TestCoxeterQuartet:
    def test_A4_coxeter_is_q(self):
        """h(A_4) = 5 = q."""
        from urt.shell_closure import q
        assert coxeter_quartet()["h(A_4)"] == q

    def test_D4_coxeter_is_D_factorial(self):
        from math import factorial
        from urt.shell_closure import D
        assert coxeter_quartet()["h(D_4)"] == factorial(D)

    def test_E6_coxeter_is_V(self):
        from urt.shell_closure import V
        assert coxeter_quartet()["h(E_6)"] == V

    def test_E8_coxeter_is_E(self):
        from urt.shell_closure import E
        assert coxeter_quartet()["h(E_8)"] == E

    def test_quartet_ordering_matches_Cathedral_chain(self):
        from math import factorial
        from urt.shell_closure import D, q, V, E
        ordering = coxeter_quartet()["ordering"]
        assert ordering == [q, factorial(D), V, E]


# ── Cluster 3: Bernoulli + Zeta ──────────────────────────────────────────

class TestBernoulliZeta:
    def test_B2_denominator_is_D_factorial(self):
        from math import factorial
        from urt.shell_closure import D
        assert bernoulli_zeta_connections()["B_2_denominator"] == factorial(D)

    def test_B4_denominator_is_E(self):
        from urt.shell_closure import E
        assert bernoulli_zeta_connections()["B_4_denominator"] == E

    def test_zeta_2_denominator_is_D_factorial(self):
        from math import factorial
        from urt.shell_closure import D
        assert bernoulli_zeta_connections()["zeta_2_denominator"] == factorial(D)

    def test_zeta_4_denominator_is_D_times_E(self):
        from urt.shell_closure import D, E
        assert bernoulli_zeta_connections()["zeta_4_denominator"] == D * E

    def test_zeta_6_denominator_is_q_DD_Dfact_plus_1(self):
        """ζ(6) = π⁶/945, and 945 = q · D^D · (D!+1) — every factor Cathedral."""
        from math import factorial
        from urt.shell_closure import D, q
        assert q * D**D * (factorial(D) + 1) == 945
        assert bernoulli_zeta_connections()["zeta_6_denom_matches"]


# ── Cluster 4: Squares + Stirling + Partition ────────────────────────────

class TestSquaresStirlingPartition:
    def test_eight_squared_is_d64_equals_K4_to_the_D(self):
        """(2^D)² = (D+1)^D for D=3, both equal 64 = d_64."""
        from urt.shell_closure import D
        assert (2 ** D) ** 2 == (D + 1) ** D == 64

    def test_pythagorean_q_V_N(self):
        from urt.shell_closure import q, V, N
        assert q * q + V * V == N * N

    def test_S_3_2_is_D(self):
        from urt.shell_closure import D
        assert square_stirling_partition_hits()["S(3,2)"] == D

    def test_S_4_3_is_D_factorial(self):
        from math import factorial
        from urt.shell_closure import D
        assert square_stirling_partition_hits()["S(4,3)"] == factorial(D)

    def test_partition_function_hits(self):
        from urt.shell_closure import D, q, E
        a = square_stirling_partition_hits()
        assert a["p(3)"] == D
        assert a["p(4)"] == q
        assert a["p(9)"] == E


# ── Cluster 5: Lie roots + Mathieu transitivities ────────────────────────

class TestLieMathieu:
    def test_G2_root_count_is_V(self):
        from urt.shell_closure import V
        assert lie_mathieu_hits()["G_2_root_count"] == V

    def test_su2_dim_is_D(self):
        from urt.shell_closure import D
        assert lie_mathieu_hits()["su2_dim"] == D

    def test_so4_dim_is_D_factorial(self):
        from math import factorial
        from urt.shell_closure import D
        assert lie_mathieu_hits()["so4_dim"] == factorial(D)

    def test_su5_dim_is_2V(self):
        from urt.shell_closure import V
        assert lie_mathieu_hits()["su5_dim"] == 2 * V

    def test_E8_roots_is_K4_G_and_VF(self):
        """E_8 has 240 roots = (D+1)·G = V·F."""
        from urt.shell_closure import D, V, F, G
        a = lie_mathieu_hits()
        assert a["E8_root_count"] == 240
        assert (D + 1) * G == 240
        assert V * F == 240

    def test_Mathieu_transitivities_are_V_and_2V(self):
        from urt.shell_closure import V
        a = lie_mathieu_hits()
        assert a["M12_transitivity_n"] == V
        assert a["M24_transitivity_n"] == 2 * V


# ── End-to-end ───────────────────────────────────────────────────────────

class TestEndToEndAudit:
    def test_audit_returns_five_clusters(self):
        a = all_grand_tour_audit()
        assert set(a.keys()) == {
            "cathedral_prime_ladder",
            "coxeter_quartet",
            "bernoulli_zeta_connections",
            "square_stirling_partition_hits",
            "lie_mathieu_hits",
        }

    def test_all_grand_tour_verify(self):
        assert all_grand_tour_verify()
