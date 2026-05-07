"""Tests for urt/muon_g2.py — Muon anomalous magnetic moment (Cathedral EW prediction)."""

import pytest
from math import pi, sqrt, log, isfinite
from urt.muon_g2 import (
    qed_contribution,
    ew_contribution,
    np_h3_constraint,
    g2_summary,
    print_g2_report,
    A_MU_1LOOP,
    A_MU_2LOOP,
    A_MU_EW_1L,
    A_MU_EW,
    A_MU_EXP,
    A_MU_EXP_ERR,
    A_MU_DISCREPANCY,
    M_WIMP_GEV,
    M_MU_GEV,
    ALPHA_EM,
    C2_QED,
    EW_2LOOP_FACTOR,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi
from urt.electroweak import G_FERMI, SIN2_THETA_W, M_Z_GEV


class TestQEDContribution:
    def setup_method(self):
        self.qed = qed_contribution()

    def test_1loop_schwinger(self):
        """Schwinger 1-loop term = α/(2π)."""
        expected = ALPHA_EM / (2 * pi)
        assert abs(self.qed["1loop"] - expected) < 1e-18

    def test_1loop_order_of_magnitude(self):
        """α/2π ≈ 1.16e-3."""
        assert 1.1e-3 < self.qed["1loop"] < 1.2e-3

    def test_2loop_positive(self):
        """2-loop QED correction is positive."""
        assert self.qed["2loop"] > 0

    def test_2loop_much_smaller_than_1loop(self):
        """2-loop is much smaller than 1-loop (suppressed by α/π)."""
        assert self.qed["2loop"] < self.qed["1loop"] * 1e-2

    def test_total_qed_equals_sum(self):
        """total_qed = 1loop + 2loop."""
        assert abs(self.qed["total_qed"] - (self.qed["1loop"] + self.qed["2loop"])) < 1e-20

    def test_c2_coefficient_petermann(self):
        """C₂ ≈ 1.382 (Petermann 1957: 197/144 + π²/12 - π²/4·ln2 + 3ζ(3)/4)."""
        assert 1.0 < self.qed["C2_qed"] < 2.0

    def test_alpha_used_is_cathedral(self):
        """Fine-structure constant = Cathedral α = 1/137.035999084."""
        assert abs(self.qed["alpha_used"] - 1 / 137.035999084) < 1e-15

    def test_keys_present(self):
        """All required keys present."""
        for key in ("1loop", "2loop", "C2_qed", "total_qed", "alpha_used"):
            assert key in self.qed


class TestEWContribution:
    def setup_method(self):
        self.ew = ew_contribution()

    def test_ew_1loop_formula_structure(self):
        """EW 1-loop uses G_F, m_μ, sin²θ_W from Cathedral."""
        # Check value is ~194×10⁻¹¹
        assert 100e-11 < self.ew["1loop"] < 300e-11

    def test_sin2w_is_cathedral_value(self):
        """sin²θ_W used is the Cathedral value (D/N)(1+γ/2π)."""
        expected = (D / N) * (1 + gamma / (2 * pi))
        assert abs(self.ew["sin2w_used"] - expected) < 1e-14

    def test_sin2w_sensitivity(self):
        """Sensitivity d(a_EW)/d(sin²θ_W) is finite and nonzero."""
        assert isfinite(self.ew["sensitivity"])
        assert self.ew["sensitivity"] != 0

    def test_2loop_factor_value(self):
        """EW 2-loop factor = 0.788."""
        assert abs(self.ew["factor_2loop"] - 0.788) < 1e-10

    def test_total_ew_equals_1loop_times_factor(self):
        """total_ew = 1loop × factor_2loop."""
        expected = self.ew["1loop"] * self.ew["factor_2loop"]
        assert abs(self.ew["total_ew"] - expected) < 1e-20

    def test_ew_total_positive(self):
        """EW total contribution is positive."""
        assert self.ew["total_ew"] > 0

    def test_bracket_greater_than_1(self):
        """Bracket [1+(1/5)(1-4sin²θ_W)²] > 1."""
        assert self.ew["bracket"] > 1

    def test_g_fermi_used(self):
        """G_F used is the correct Fermi constant."""
        assert abs(self.ew["G_fermi_used"] - G_FERMI) < 1e-15

    def test_range_of_ew_correction(self):
        """EW correction is in expected range 100-300×10⁻¹¹."""
        assert 100e-11 < self.ew["total_ew"] < 300e-11

    def test_keys_present(self):
        """All required keys present."""
        for key in ("1loop", "factor_2loop", "total_ew", "sin2w_used", "bracket", "sensitivity"):
            assert key in self.ew


class TestNPH3Constraint:
    def setup_method(self):
        self.np = np_h3_constraint()

    def test_wimp_mass_used(self):
        """WIMP mass = δ★·m_Z."""
        expected = DELTA_STAR * M_Z_GEV
        assert abs(self.np["wimp_mass_gev"] - expected) < 1e-10

    def test_wimp_mass_range(self):
        """WIMP mass is in 10–20 GeV range."""
        assert 10.0 < self.np["wimp_mass_gev"] < 20.0

    def test_constraint_keys(self):
        """All required keys present."""
        for key in ("delta_a_mu_target", "wimp_mass_gev", "y_np_required",
                    "log_factor", "loop_factor", "perturbative"):
            assert key in self.np

    def test_log_factor_positive(self):
        """ln(M²/m_μ²) > 0 since M >> m_μ."""
        assert self.np["log_factor"] > 0

    def test_y_np_positive(self):
        """Required coupling y_NP > 0."""
        assert self.np["y_np_required"] > 0

    def test_perturbativity_check(self):
        """perturbative key is boolean."""
        assert isinstance(self.np["perturbative"], bool)

    def test_loop_factor_scaling(self):
        """Loop factor = m_μ²/(4π²M²)·ln(M²/m_μ²) — check rough magnitude."""
        lf = self.np["loop_factor"]
        assert 0 < lf < 1.0  # dimensionless, should be much < 1


class TestG2Summary:
    def setup_method(self):
        self.s = g2_summary()

    def test_keys_present(self):
        """All major keys present."""
        for key in ("qed", "electroweak", "np_h3", "a_mu_exp",
                    "delta_star_used", "alpha_em_used"):
            assert key in self.s

    def test_cathedral_alpha_used(self):
        """Cathedral α = 1/137.035999084 is used."""
        assert abs(self.s["alpha_em_used"] - 1 / 137.035999084) < 1e-15

    def test_experimental_value(self):
        """Experimental value matches Fermilab 2023."""
        assert abs(self.s["a_mu_exp"] - 1.16592061e-3) < 1e-15

    def test_discrepancy_finite(self):
        """Discrepancy is finite."""
        assert isfinite(self.s["discrepancy"])

    def test_significance_positive(self):
        """Statistical significance is positive."""
        assert self.s["significance_sigma"] > 0

    def test_qed_sub_dict(self):
        """QED sub-dict present and has 1loop."""
        assert "1loop" in self.s["qed"]

    def test_ew_sub_dict(self):
        """EW sub-dict present and has total_ew."""
        assert "total_ew" in self.s["electroweak"]

    def test_delta_star_used(self):
        """δ★ used matches shell_closure."""
        assert abs(self.s["delta_star_used"] - DELTA_STAR) < 1e-15


class TestPrintReport:
    def test_print_does_not_raise(self, capsys):
        """print_g2_report() runs without error."""
        print_g2_report()
        captured = capsys.readouterr()
        assert "MUON" in captured.out
        assert "EW" in captured.out.upper() or "Electroweak" in captured.out
