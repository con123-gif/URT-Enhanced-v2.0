"""Tests for Lytollis's Law (dynamical bounded-chaos)."""
import pytest

from urt.shell_closure import D, q, V, N, gamma
from urt.lytollis_bounded_chaos import (
    lytollis_delta,
    lytollis_check,
    cross_system_validation,
    all_seven_systems_satisfy_law,
    out_of_sample_prediction,
    urt_as_lytollis_system,
    fine_structure_at_M_Z,
    cosmological_constant_as_RG_fixed_point,
    CKM_flavour_hierarchy,
    lytollis_bounded_chaos_audit,
    lytollis_bounded_chaos_audit_passes,
)


class TestLawStatement:
    def test_simple_case(self):
        """δ = (D_KY−1)(τ−2). At D_KY=2, τ=3: δ = 1·1 = 1."""
        assert lytollis_delta(2.0, 3.0) == 1.0

    def test_critical_case(self):
        """At D_KY=1 the law gives δ = 0 (boundary of bounded chaos)."""
        assert lytollis_delta(1.0, 5.0) == 0.0

    def test_logistic_map_value(self):
        """Paper Table 1: Logistic D_KY=1.07, τ=3.30 → δ = 0.0910."""
        assert abs(lytollis_delta(1.07, 3.30) - 0.0910) < 1e-12

    def test_check_function_works(self):
        """lytollis_check returns True iff law holds."""
        assert lytollis_check(1.07, 3.30, 0.0910)
        assert not lytollis_check(1.07, 3.30, 0.5)


class TestCrossSystemValidation:
    def test_seven_systems(self):
        """Paper validates across exactly 7 canonical systems."""
        rows = cross_system_validation()
        assert len(rows) == 7

    def test_all_hold_to_machine_precision(self):
        """All 7 satisfy δ_obs = (D_KY−1)(τ−2) to <1e-12."""
        rows = cross_system_validation()
        for r in rows:
            assert r["holds"], f"{r['system']} failed: error={r['error']}"

    def test_aggregate_passes(self):
        assert all_seven_systems_satisfy_law()

    def test_logistic_in_table(self):
        """Logistic map is in the validation table."""
        rows = cross_system_validation()
        names = [r["system"] for r in rows]
        assert "Logistic Map" in names

    def test_SOC_has_negative_delta(self):
        """SOC sandpile is unique in having δ < 0 (sub-critical)."""
        rows = cross_system_validation()
        soc = next(r for r in rows if r["system"] == "SOC Sandpile")
        assert soc["delta_obs"] < 0

    def test_two_EEG_states(self):
        """Both EEG (awake) and EEG (filtered) are validated."""
        rows = cross_system_validation()
        names = [r["system"] for r in rows]
        assert "EEG (awake)" in names
        assert "EEG (filtered)" in names


class TestOutOfSamplePrediction:
    def test_below_one_percent(self):
        """Cortex RNN N=200→N=600 prediction is <1% error."""
        o = out_of_sample_prediction()
        assert o["below_1_pct"]

    def test_predicted_close_to_measured(self):
        o = out_of_sample_prediction()
        assert abs(o["D_KY_predicted"] - o["D_KY_measured"]) < 0.05


class TestURTAsLytollisSystem:
    def test_gamma_equals_D_to_negative_Dp1(self):
        """The URT γ = 1/81 = D^(−(D+1)) IS Lytollis's γ."""
        u = urt_as_lytollis_system()
        assert u["gamma_eq_one_over_D_to_Dp1"]
        assert u["gamma_URT"] == gamma == 1 / D ** (D + 1)

    def test_kappa_max_below_unity(self):
        """The κ-margin κ_max = 1 − N/(2^q·π²) < 1 — strict contraction."""
        u = urt_as_lytollis_system()
        assert u["kappa_max"] < 1.0
        assert u["kappa_max"] > 0.0


class TestFineStructure:
    def test_alpha_M_Z_within_0_1_pct(self):
        """1/α(M_Z) = 127.955 vs PDG 127.918 — agreement <0.1 %."""
        f = fine_structure_at_M_Z()
        assert f["agreement_within_0_1_pct"]

    def test_alpha_M_Z_predicted_value(self):
        """The predicted value is 127.955."""
        f = fine_structure_at_M_Z()
        assert f["alpha_M_Z_inv_predicted"] == 127.955


class TestCosmologicalConstant:
    def test_120_RG_steps(self):
        """Λ runs from Planck (k=0) to Hubble (k=120) — 120 RG steps."""
        c = cosmological_constant_as_RG_fixed_point()
        assert c["RG_step_Hubble"] == 120

    def test_planck_lambda_unstable(self):
        c = cosmological_constant_as_RG_fixed_point()
        assert c["Lambda_at_Planck"] > c["Lambda_at_Hubble"]


class TestCKM:
    def test_sin_theta_12_close(self):
        """sin θ_12 prediction (0.222) is close to observation (0.225)."""
        ck = CKM_flavour_hierarchy()
        assert abs(ck["sin_theta_12_predicted"] - ck["sin_theta_12_observed"]) < 0.01


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert lytollis_bounded_chaos_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = lytollis_bounded_chaos_audit()
        for key in ("law_statement", "cross_system", "out_of_sample",
                    "urt_identification", "fine_structure",
                    "cosmological_const", "CKM"):
            assert key in a
