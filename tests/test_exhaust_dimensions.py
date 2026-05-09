"""Tests for the exhaust = 9-dimensional dark sector hypothesis."""
from math import factorial
import pytest

from urt.exhaust_dimensions import (
    visible_and_exhaust_dimensions,
    string_theory_dimension_comparison,
    gauge_boson_decomposition,
    exhaust_dimensions_audit,
    exhaust_dimensions_audit_passes,
)


class TestVisibleAndExhaust:
    def test_visible_is_4(self):
        from urt.shell_closure import D
        assert visible_and_exhaust_dimensions()["visible_dim"] == D + 1 == 4

    def test_exhaust_is_9(self):
        """A_5 = 9 = D! + D = D² extra dimensions."""
        from urt.shell_closure import D
        v = visible_and_exhaust_dimensions()
        assert v["exhaust_dim"] == 9
        assert v["exhaust_dim"] == factorial(D) + D
        assert v["exhaust_dim"] == D * D

    def test_total_is_N(self):
        """4 + 9 = 13 = N."""
        from urt.shell_closure import N
        assert visible_and_exhaust_dimensions()["total_dim"] == N

    def test_icosahedral_closure_DD_p_D_p_1(self):
        """N = D² + D + 1 — the icosahedral closure identity."""
        from urt.shell_closure import D, N
        assert D ** 2 + D + 1 == N


class TestStringTheoryComparison:
    def test_bosonic_is_2N(self):
        """Bosonic string D_crit = 26 = 2N."""
        from urt.shell_closure import N
        assert string_theory_dimension_comparison()["bosonic_total"] == 2 * N

    def test_super_is_2q(self):
        """Superstring D_crit = 10 = 2q."""
        from urt.shell_closure import q
        assert string_theory_dimension_comparison()["super_total"] == 2 * q

    def test_M_theory_is_Dfact_q(self):
        """M-theory D = 11 = D! + q."""
        from urt.shell_closure import D, q
        assert string_theory_dimension_comparison()["M_theory_total"] == factorial(D) + q

    def test_cathedral_visible_is_4(self):
        from urt.shell_closure import D
        assert string_theory_dimension_comparison()["cathedral_visible"] == D + 1

    def test_cathedral_extra_is_9(self):
        from urt.shell_closure import D
        assert string_theory_dimension_comparison()["cathedral_extra"] == D + factorial(D) == 9


class TestGaugeBosonDecomposition:
    def test_photon_count_is_1(self):
        assert gauge_boson_decomposition()["n_photon"] == 1

    def test_EW_count_is_D(self):
        from urt.shell_closure import D
        assert gauge_boson_decomposition()["n_EW_gauge"] == D

    def test_gluon_count_is_D2_minus_1_equals_2pD(self):
        """D² - 1 = 8 = 2^D — gluons live in the A_5 exhaust."""
        from urt.shell_closure import D
        g = gauge_boson_decomposition()
        assert g["n_gluons"] == D * D - 1 == 2 ** D
        assert g["n_gluons_is_2pD"]

    def test_total_is_V(self):
        """1 + D + (D²-1) = V = 12 — total Standard Model gauge bosons."""
        from urt.shell_closure import V
        assert gauge_boson_decomposition()["total"] == V


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert exhaust_dimensions_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = exhaust_dimensions_audit()
        assert "visible_and_exhaust" in a
        assert "string_comparison" in a
        assert "gauge_decomposition" in a
