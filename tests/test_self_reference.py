"""Tests for the self-reference cluster module."""
from math import factorial

from urt.self_reference import (
    number_theory_self_refs,
    group_theory_self_refs,
    cf_self_refs,
    all_self_references,
    self_reference_count,
    self_reference_audit,
    self_reference_audit_passes,
)


class TestNumberTheorySelfRefs:
    def test_p_D_eq_D(self):
        """p(D) = p(3) = 3 — partition function self-reference."""
        from urt.shell_closure import D
        actual, expected, holds = number_theory_self_refs()["p_D_eq_D"]
        assert actual == D == 3
        assert holds

    def test_p_q_eq_Dfact_plus_1(self):
        """p(q) = p(5) = 7 = D!+1."""
        from urt.shell_closure import D
        actual, expected, holds = number_theory_self_refs()["p_q_eq_Dfact_p_1"]
        assert actual == factorial(D) + 1 == 7
        assert holds

    def test_F_q_eq_q(self):
        """F_q = F_5 = 5 = q — Fibonacci self-reference."""
        from urt.shell_closure import q
        actual, expected, holds = number_theory_self_refs()["F_q_eq_q"]
        assert actual == q == 5
        assert holds

    def test_F_V_eq_V_sq(self):
        """F_V = F_12 = 144 = V² — Fibonacci doubling miracle."""
        from urt.shell_closure import V
        actual, expected, holds = number_theory_self_refs()["F_V_eq_V_sq"]
        assert actual == V * V == 144
        assert holds

    def test_F_7_eq_N(self):
        """F_7 = 13 = N — Fibonacci hits N."""
        from urt.shell_closure import N
        actual, expected, holds = number_theory_self_refs()["F_7_eq_N"]
        assert actual == N == 13
        assert holds

    def test_L_3_eq_D_p_1(self):
        """L_3 = 4 = D+1 = |K_4|."""
        from urt.shell_closure import D
        actual, expected, holds = number_theory_self_refs()["L_3_eq_D_p_1"]
        assert actual == D + 1 == 4
        assert holds

    def test_pisano_q_eq_F(self):
        """π(q) = 20 = F — Pisano period of 5 is 20."""
        from urt.shell_closure import F
        actual, expected, holds = number_theory_self_refs()["pisano_q_eq_F"]
        assert actual == F == 20
        assert holds

    def test_B_D_eq_q(self):
        """B_D = B_3 = 5 = q — Bell number self-reference."""
        from urt.shell_closure import q
        actual, expected, holds = number_theory_self_refs()["B_D_eq_q"]
        assert actual == q == 5
        assert holds

    def test_C_D_eq_q(self):
        """C_D = C_3 = 5 = q — Catalan self-reference."""
        from urt.shell_closure import q
        actual, expected, holds = number_theory_self_refs()["C_D_eq_q"]
        assert actual == q == 5
        assert holds


class TestGroupTheorySelfRefs:
    def test_alt_D_order_eq_D(self):
        """|A_D| = |A_3| = 3 = D — alternating group self-reference."""
        from urt.shell_closure import D
        actual, expected, holds = group_theory_self_refs()["alt_D_order_eq_D"]
        assert actual == D == 3
        assert holds

    def test_dim_SO_D_eq_D(self):
        """dim SO(D) = D(D-1)/2 = 3 = D — Lie algebra self-reference."""
        from urt.shell_closure import D
        actual, expected, holds = group_theory_self_refs()["dim_SO_D_eq_D"]
        assert actual == D == 3
        assert holds

    def test_psl2_q_order_eq_G(self):
        """|PSL_2(F_q)| = 60 = G = |A_5|."""
        from urt.shell_closure import G
        actual, expected, holds = group_theory_self_refs()["psl2_q_order_eq_G"]
        assert actual == G == 60
        assert holds

    def test_totient_N_eq_V(self):
        """φ(N) = φ(13) = 12 = V — Euler totient hits V."""
        from urt.shell_closure import V
        actual, expected, holds = group_theory_self_refs()["totient_N_eq_V"]
        assert actual == V == 12
        assert holds


class TestContinuedFractionSelfRefs:
    def test_period_sqrt_N_eq_q(self):
        """period CF(√13) = 5 = q."""
        from urt.shell_closure import q
        actual, expected, holds = cf_self_refs()["period_sqrt_N_eq_q"]
        assert actual == q == 5
        assert holds


class TestCount:
    def test_at_least_14_identities(self):
        """The catalogue has at least 14 self-references."""
        c = self_reference_count()
        assert c["total"] >= 14

    def test_no_failures(self):
        """Every catalogued self-reference holds."""
        c = self_reference_count()
        assert c["fails"] == 0


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert self_reference_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = self_reference_audit()
        assert "number_theory" in a
        assert "group_theory" in a
        assert "continued_fractions" in a
        assert "count" in a

    def test_all_hold_at_machine_precision(self):
        """Every self-reference holds — no floating-point fudges."""
        refs = all_self_references()
        assert all(v[2] for v in refs.values())
