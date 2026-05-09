"""Tests for the Matter Direction Theorem — η_B sign forced by D=3."""
from math import pi, sqrt
import pytest

from urt.matter_direction import (
    matter_direction_inequality,
    eta_B_prefactor_decomposition,
    matter_direction_sensitivity,
    matter_direction_audit,
    matter_direction_audit_passes,
)


class TestMatterDirectionInequality:
    def test_LHS_greater_than_RHS(self):
        """D·N·φ > F·(1-γ)·π — the matter-direction inequality."""
        ineq = matter_direction_inequality()
        assert ineq["LHS_DNphi"] > ineq["RHS_F_1mγ_π"]

    def test_LHS_is_about_63_1(self):
        ineq = matter_direction_inequality()
        assert 63.0 < ineq["LHS_DNphi"] < 63.2

    def test_RHS_is_about_62_06(self):
        ineq = matter_direction_inequality()
        assert 62.0 < ineq["RHS_F_1mγ_π"] < 62.1

    def test_margin_is_about_1_05(self):
        """The matter-direction margin: 63.10 - 62.06 ≈ 1.05."""
        ineq = matter_direction_inequality()
        assert 1.0 < ineq["margin"] < 1.1

    def test_matter_direction_is_True(self):
        ineq = matter_direction_inequality()
        assert ineq["matter_direction"]


class TestEtaBPrefactor:
    def test_8_over_9_is_2D_over_DfpD(self):
        """8/9 = 2^D / (D!+D) = 8/9 — Cathedral closed form."""
        from urt.shell_closure import D
        pf = eta_B_prefactor_decomposition()
        assert pf["value"] == 8 / 9
        assert pf["as_2pD_over_DfpD"] == 2**D / (D + 6)
        assert pf["matches"]

    def test_K4_doubled_is_8(self):
        """Doubled K_4 size = 2(D+1) = 8 when D=3."""
        from urt.shell_closure import D
        pf = eta_B_prefactor_decomposition()
        assert pf["K4_doubled"] == 2 * (D + 1) == 8

    def test_A5_size_is_9(self):
        """A_5 size = D! + D = 6 + 3 = 9 when D=3."""
        from urt.shell_closure import D
        pf = eta_B_prefactor_decomposition()
        assert pf["A5_size"] == D + 6 == 9

    def test_eta_B_factor_is_K4_doubled_over_A5(self):
        pf = eta_B_prefactor_decomposition()
        assert pf["ratio_K4_doubled_over_A5"] == 8 / 9


class TestSensitivity:
    def test_framework_predicts_matter(self):
        sens = matter_direction_sensitivity()
        assert sens["framework_matter"]

    def test_F21_would_give_anti_matter(self):
        """If F were 21 instead of 20, η_B would flip negative."""
        sens = matter_direction_sensitivity()
        assert sens["F21_anti_matter"]

    def test_N12_would_give_anti_matter(self):
        """If N were 12 instead of 13, η_B would flip negative."""
        sens = matter_direction_sensitivity()
        assert sens["N12_anti_matter"]

    def test_framework_sits_just_inside_matter_band(self):
        """At N=13, the matter side is F ≤ 20.  F=20 is the boundary."""
        sens = matter_direction_sensitivity()
        from urt.shell_closure import N
        assert sens["by_N_F"][(N, 20)]["matter_wins"]
        assert not sens["by_N_F"][(N, 21)]["matter_wins"]


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert matter_direction_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = matter_direction_audit()
        assert "inequality" in a
        assert "eta_B_prefactor" in a
        assert "sensitivity" in a
