"""Tests for urt/baryon_asymmetry.py — Cathedral leptogenesis."""

import pytest
from math import pi
from urt.baryon_asymmetry import (
    eta_b_miracle, leptogenesis_mechanism, sakharov_conditions,
    baryon_asymmetry_summary, print_baryon_report,
    ETA_B_OBSERVED, DELTA_CP_DEG, DELTA_CP_RAD, EPSILON_1, KAPPA,
    ETA_B_LEPTO, M1_HEAVY_GEV,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, q, gamma


class TestMiracleFormula:
    def setup_method(self):
        self.mir = eta_b_miracle()

    def test_formula_value(self):
        expected = (q - D) * gamma**q
        assert abs(self.mir["prediction"] - expected) < 1e-25

    def test_q_minus_D(self):
        assert self.mir["q_minus_D"] == q - D == 2

    def test_gamma_power(self):
        assert self.mir["gamma_power"] == q == 5

    def test_order_of_magnitude(self):
        # Should be O(10⁻¹⁰)
        pred = self.mir["prediction"]
        assert 1e-11 < pred < 1e-9

    def test_error_within_10pct(self):
        # 6% off — note this is a rough match (η_B measured to 0.7% precision)
        assert abs(self.mir["error_pct"]) < 10.0

    def test_observed_value(self):
        assert abs(ETA_B_OBSERVED - 6.12e-10) < 1e-12

    def test_gamma_to_q(self):
        assert abs(self.mir["gamma_q"] - gamma**5) < 1e-25

    def test_3_to_20(self):
        assert self.mir["3_to_20"] == 3**20

    def test_zero_free_params(self):
        assert self.mir["free_parameters"] == 0


class TestDeltaCP:
    def test_delta_CP_value(self):
        expected = (D + 1) * F + (N - D - 1) * N
        assert DELTA_CP_DEG == expected == 197

    def test_delta_CP_radians(self):
        import math
        assert abs(DELTA_CP_RAD - 197 * pi / 180) < 1e-12

    def test_sin_not_zero(self):
        from math import sin
        assert abs(sin(DELTA_CP_RAD)) > 0.2   # |sin(197°)| ≈ 0.292


class TestLeptogenesis:
    def setup_method(self):
        self.lep = leptogenesis_mechanism()

    def test_delta_CP(self):
        assert self.lep["delta_CP_deg"] == 197

    def test_M1_reasonable(self):
        # Should be very heavy (>> EW scale, << Planck scale)
        assert 1e15 < M1_HEAVY_GEV < 1e18

    def test_epsilon_1_small(self):
        assert abs(EPSILON_1) < 1e-8   # tiny CP asymmetry

    def test_kappa_formula(self):
        expected = 1 / (1 + DELTA_STAR * N)
        assert abs(KAPPA - expected) < 1e-14

    def test_kappa_range(self):
        assert 0 < KAPPA < 1  # physical washout factor

    def test_eta_B_leptogenesis_nonzero(self):
        assert abs(ETA_B_LEPTO) > 0


class TestSakharovConditions:
    def setup_method(self):
        self.sak = sakharov_conditions()

    def test_all_satisfied(self):
        assert self.sak["all_satisfied"] is True

    def test_condition_1_B_violation(self):
        assert self.sak["condition_1_B_violation"]["satisfied"] is True

    def test_condition_2_CP_violation(self):
        cond = self.sak["condition_2_CP_violation"]
        assert cond["satisfied"] is True
        assert cond["sin_dcp"] > 0.1   # significant CP violation

    def test_condition_3_non_equilibrium(self):
        assert self.sak["condition_3_non_equilibrium"]["satisfied"] is True


class TestBaryonSummary:
    def test_summary_keys(self):
        s = baryon_asymmetry_summary()
        for k in ["miracle_formula", "leptogenesis", "sakharov",
                  "best_prediction", "observed", "zero_free_params"]:
            assert k in s

    def test_zero_free_params(self):
        s = baryon_asymmetry_summary()
        assert s["zero_free_params"] is True

    def test_best_prediction_order(self):
        s = baryon_asymmetry_summary()
        assert 1e-11 < s["best_prediction"] < 1e-9


def test_print_baryon_report_runs(capsys):
    print_baryon_report()
    out = capsys.readouterr().out
    assert "BARYON" in out
    assert "MIRACLE" in out or "miracle" in out.lower()
    assert "SAKHAROV" in out or "Sakharov" in out or "sphaleron" in out.lower() or "condition" in out.lower()
