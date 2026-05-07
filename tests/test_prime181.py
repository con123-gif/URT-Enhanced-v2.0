"""Tests for urt/prime181.py — Corollary 11.1: Prime 181."""

import pytest
from urt.prime181 import (
    P181, PHI_P181, FLOOR_PHI_P, RESIDUE_81,
    is_prime, legendre_symbol, golden_ratio_residue_test,
    k4_compatibility_test, multiplicative_order,
    closure_representation_test, scan_primes_for_prime181,
    prime181_properties, corollary_111_statement,
    prime181_ascii_diagram, print_prime181_report,
)
from urt.shell_closure import gamma, phi


class TestPrimality:
    def test_181_is_prime(self):
        assert is_prime(P181)

    def test_182_not_prime(self):
        assert not is_prime(182)

    def test_small_primes(self):
        for p in [2, 3, 5, 7, 11, 13]:
            assert is_prime(p)

    def test_composites(self):
        for n in [4, 6, 9, 15, 25, 100]:
            assert not is_prime(n)


class TestLegendreSymbol:
    def test_quadratic_residue(self):
        # 1² mod 5 = 1, so (1/5) = 1
        assert legendre_symbol(1, 5) == 1

    def test_non_residue(self):
        # 2 is not a QR mod 5
        assert legendre_symbol(2, 5) == -1

    def test_zero(self):
        assert legendre_symbol(5, 5) == 0


class TestPrime181Tests:
    def test_golden_qr(self):
        gr = golden_ratio_residue_test(P181)
        assert gr["p"] == P181
        assert gr["floor_phi_p"] == FLOOR_PHI_P

    def test_k4_compat(self):
        k4 = k4_compatibility_test(P181)
        assert k4["k4_compat"] is True
        assert k4["p_mod_4"] == 1

    def test_closure_rep(self):
        cl = closure_representation_test(P181)
        assert cl["has_81_subgroup"] is True
        assert cl["residue_is_81"] is True   # 181 - 100 = 81

    def test_group_order(self):
        cl = closure_representation_test(P181)
        assert cl["group_order"] == P181 - 1   # = 180


class TestMultiplicativeOrder:
    def test_order_1_for_identity(self):
        assert multiplicative_order(1, 7) == 1

    def test_order_divides_p_minus_1(self):
        for a in [2, 3, 5, 7]:
            if a < P181:
                ord_a = multiplicative_order(a, P181)
                assert (P181 - 1) % ord_a == 0


class TestPrime181Properties:
    def setup_method(self):
        self.props = prime181_properties()

    def test_p_value(self):
        assert self.props["p"] == P181

    def test_all_three_conditions(self):
        assert self.props["all_three"] is True

    def test_connection_to_gamma(self):
        assert self.props["connection_to_gamma"] is True   # 181-100=81=1/γ

    def test_subgroup_81_exists(self):
        assert self.props["subgroup_81"] is True

    def test_p_mod_g(self):
        from urt.shell_closure import G
        assert self.props["p_mod_G"] == P181 % G   # = 1

    def test_phi_p181(self):
        import math
        assert abs(self.props["phi_p"] - phi * P181) < 1e-10


class TestScanPrimes:
    def test_181_found_first(self):
        candidates = scan_primes_for_prime181(250)
        all_three = [c for c in candidates if c["all_three"]]
        assert len(all_three) >= 1
        assert all_three[0]["p"] == P181

    def test_score_3_for_181(self):
        candidates = scan_primes_for_prime181(200)
        p181_entry = next((c for c in candidates if c["p"] == P181), None)
        assert p181_entry is not None
        assert p181_entry["score"] == 3


class TestCorollaryStatement:
    def test_statement_is_string(self):
        s = corollary_111_statement()
        assert isinstance(s, str)

    def test_mentions_181(self):
        s = corollary_111_statement()
        assert "181" in s

    def test_mentions_81(self):
        s = corollary_111_statement()
        assert "81" in s


def test_print_prime181_report_runs(capsys):
    print_prime181_report()
    out = capsys.readouterr().out
    assert "181" in out
    assert "81" in out
