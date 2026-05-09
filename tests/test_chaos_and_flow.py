"""Tests for the chaos-and-flow Cathedral closed forms."""
from math import pi

import numpy as np

from urt.chaos_and_flow import (
    DYNAMICAL_NORMALISATION,
    dynamical_normalisation_cathedral,
    per_step_factor_cathedral,
    mixing_time_cathedral,
    cathedral_contraction_table,
    slowest_mixing_time,
    fastest_mixing_time,
    slowest_to_fastest_ratio,
    universe_from_chaos_arc,
    chaos_and_flow_audit,
    chaos_and_flow_audit_passes,
)


class TestDynamicalNormalisation:
    def test_value_is_32_pi_squared(self):
        """2^q · π² = 32π² ≈ 315.83."""
        assert abs(DYNAMICAL_NORMALISATION - 32 * pi ** 2) < 1e-12

    def test_two_to_q_is_32(self):
        """2^q = 2^5 = 32 — the crystallographic 3D point-group count."""
        from urt.shell_closure import q
        assert 2 ** q == 32

    def test_factorisation_eta_inv_eta_L_inv(self):
        """2^q · π² = (1/η)·(1/η_L) = 8π · 4π = 32π²."""
        n = dynamical_normalisation_cathedral()
        assert abs(n["product"] - 32 * pi ** 2) < 1e-12
        assert abs(n["as_eta_inv"] - 8 * pi) < 1e-12
        assert abs(n["as_eta_L_inv"] - 4 * pi) < 1e-12


class TestPerModeContraction:
    def test_lambda_zero_is_unity(self):
        """The constant mode (λ=0) is preserved exactly."""
        assert per_step_factor_cathedral(0.0) == 1.0

    def test_factor_at_Fiedler_exact(self):
        """Cathedral closed form at λ=D=3:  1 − 3/(32π²)."""
        expected = 1.0 - 3.0 / (32 * pi ** 2)
        assert abs(per_step_factor_cathedral(3.0) - expected) < 1e-15

    def test_factor_at_max_exact(self):
        """Cathedral closed form at λ=N=13:  1 − 13/(32π²)."""
        expected = 1.0 - 13.0 / (32 * pi ** 2)
        assert abs(per_step_factor_cathedral(13.0) - expected) < 1e-15

    def test_closed_form_close_to_rounded_implementation(self):
        """The Cathedral closed form uses EXACT 1/(8π)·1/(4π) = 1/(32π²),
        while the legacy `per_mode_contraction_factors()` uses the
        rationalized (0.04, 0.08) ≈ rounded coefficients.  The two agree
        to ~1e-3 (the rounding noise of 0.04 vs 1/(8π))."""
        from urt.urt_algorithm_analysis import per_mode_contraction_factors
        legacy = per_mode_contraction_factors()
        for lam, fac, _ in cathedral_contraction_table():
            if lam in legacy:
                assert abs(legacy[lam] - fac) < 1e-3

    def test_all_modes_contract(self):
        """Every Laplacian eigenvalue gives a per-step factor in [0,1]."""
        for lam, fac, _ in cathedral_contraction_table():
            assert 0 <= fac <= 1


class TestMixingTimes:
    def test_slowest_at_Fiedler(self):
        """Slowest non-trivial mixing is at the Fiedler eigenvalue λ=D=3."""
        from urt.shell_closure import D
        s = slowest_mixing_time()
        assert s["lambda"] == D
        assert s["lambda_eq_D"]

    def test_slowest_value(self):
        """τ_D = (2^q · π²) / D ≈ 105.28."""
        from urt.shell_closure import D
        s = slowest_mixing_time()
        assert abs(s["tau"] - 32 * pi ** 2 / D) < 1e-12
        assert 105.0 < s["tau"] < 106.0

    def test_fastest_at_max(self):
        """Fastest mixing is at λ_max = N = 13."""
        from urt.shell_closure import N
        f = fastest_mixing_time()
        assert f["lambda"] == N
        assert f["lambda_eq_N"]

    def test_fastest_value(self):
        """τ_N = (2^q · π²) / N ≈ 24.29."""
        from urt.shell_closure import N
        f = fastest_mixing_time()
        assert abs(f["tau"] - 32 * pi ** 2 / N) < 1e-12
        assert 24.0 < f["tau"] < 24.5

    def test_ratio_is_N_over_D(self):
        """τ_slow / τ_fast = N/D = 13/3 — Cathedral, no transcendentals."""
        from urt.shell_closure import D, N
        r = slowest_to_fastest_ratio()
        assert r["is_N_over_D"]
        assert abs(r["ratio"] - N / D) < 1e-12

    def test_lambda_zero_is_infinite(self):
        """The constant mode never decays."""
        assert mixing_time_cathedral(0.0) == float("inf")


class TestUniverseArc:
    def test_six_stages(self):
        """The arc has exactly 6 stages."""
        arc = universe_from_chaos_arc()
        assert len(arc) == 6

    def test_stages_named_in_order(self):
        """Stages are 1-Chaos, 2-Flow, 3-Structure, 4-Rails-split, 5-Gap, 6-Matter."""
        arc = universe_from_chaos_arc()
        names = [s["name"] for s in arc]
        assert names == ["Chaos", "Flow", "Structure", "Rails split",
                         "Gap forms", "Matter wins"]

    def test_each_stage_has_cathedral_form(self):
        """Every stage carries a Cathedral closed form."""
        arc = universe_from_chaos_arc()
        for s in arc:
            assert "cathedral" in s
            assert s["cathedral"]


class TestRunningTheArc:
    def test_chaos_to_structure_within_5_tau_D(self):
        """Empirical check: variance falls below 0.01 within 5·τ_D ≈ 525 steps.

        This is the *Cathedral* prediction for the structure-formation
        timescale of the URT iteration.
        """
        from urt.cathedral_engine import urt_evolve
        rng = np.random.default_rng(0)
        x0 = rng.uniform(0, 0.5, 13)
        steps = int(5 * slowest_mixing_time()["tau"]) + 1
        xf = urt_evolve(x0, steps=steps)
        assert np.std(xf) < 0.01


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert chaos_and_flow_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = chaos_and_flow_audit()
        assert "dynamical_normalisation" in a
        assert "contraction_table" in a
        assert "slowest_mixing" in a
        assert "fastest_mixing" in a
        assert "ratio" in a
        assert "universe_arc" in a
