"""Tests for urt/pi_phi_e_flow.py — π–φ–e geometric URT derivation."""

import pytest
import numpy as np
from math import pi, sqrt

from urt.pi_phi_e_flow import (
    ETA, ETA_L, MU, TAU,
    ETA_URT, ETA_L_URT, MU_URT,
    ERR_ETA, ERR_ETA_L, ERR_MU,
    continuous_flow, urt_evolve_exact,
    urt_evolve_continuous, lyapunov_value,
    contraction_factor, discretization_errors,
    uniqueness_theorem, flow_coefficient_table,
    print_pi_phi_e_report,
)
from urt.shell_closure import DELTA_STAR, phi, N


class TestExactCoefficients:
    def test_eta_is_one_over_8pi(self):
        assert abs(ETA - 1 / (8 * pi)) < 1e-14

    def test_eta_L_is_one_over_4pi(self):
        assert abs(ETA_L - 1 / (4 * pi)) < 1e-14

    def test_eta_L_is_twice_eta(self):
        assert abs(ETA_L - 2 * ETA) < 1e-14

    def test_mu_is_phi_minus_one(self):
        assert abs(MU - (phi - 1)) < 1e-14

    def test_mu_is_one_over_phi(self):
        # φ−1 = 1/φ (golden ratio identity)
        assert abs(MU - 1 / phi) < 1e-12

    def test_tau_is_ten(self):
        assert TAU == 10.0


class TestUrtApproximations:
    def test_eta_urt_is_004(self):
        assert abs(ETA_URT - 0.04) < 1e-14

    def test_eta_L_urt_is_008(self):
        assert abs(ETA_L_URT - 0.08) < 1e-14

    def test_mu_urt_is_06(self):
        assert abs(MU_URT - 0.6) < 1e-14

    def test_eta_error_less_than_1pct(self):
        assert ERR_ETA < 0.01

    def test_mu_error_less_than_5pct(self):
        assert ERR_MU < 0.05


class TestContinuousFlow:
    def test_flow_returns_array(self):
        delta = np.full(N, DELTA_STAR)
        f = continuous_flow(delta, 0.0)
        assert isinstance(f, np.ndarray)
        assert f.shape == (N,)

    def test_flow_at_fixed_point_is_zero(self):
        # At δ=δ★, both terms vanish → flow = 0
        delta = np.full(N, DELTA_STAR)
        f = continuous_flow(delta, 0.0)
        assert np.allclose(f, 0.0, atol=1e-12)

    def test_flow_pulls_toward_delta_star(self):
        # Start above δ★ → flow should be negative
        delta = np.full(N, DELTA_STAR + 0.05)
        f = continuous_flow(delta, 0.0)
        assert np.mean(f) < 0


class TestLyapunovFunction:
    def test_lyapunov_zero_at_fixed_point(self):
        delta = np.full(N, DELTA_STAR)
        V = lyapunov_value(delta)
        assert abs(V) < 1e-20

    def test_lyapunov_positive_away_from_fixed_point(self):
        delta = np.full(N, DELTA_STAR + 0.05)
        V = lyapunov_value(delta)
        assert V > 0

    def test_lyapunov_decreases_along_flow(self):
        delta = np.full(N, 0.20)
        V0 = lyapunov_value(delta)
        # One step of continuous flow
        dt = 0.01
        delta_new = np.clip(delta + dt * continuous_flow(delta, 0.0), 0.001, 0.5)
        V1 = lyapunov_value(delta_new)
        assert V1 <= V0


class TestContractionFactor:
    def test_contraction_factor_less_than_one(self):
        beta = contraction_factor()
        assert beta < 1.0

    def test_contraction_factor_positive(self):
        assert contraction_factor() > 0


class TestDiscretizationErrors:
    def setup_method(self):
        self.errs = discretization_errors()

    def test_globally_contracting(self):
        assert self.errs["globally_contracting"] is True

    def test_all_errors_small(self):
        assert self.errs["eta_error_pct"] < 2.0
        assert self.errs["eta_L_error_pct"] < 2.0
        assert self.errs["mu_error_pct"] < 5.0

    def test_exact_values_present(self):
        assert abs(self.errs["eta_exact"] - 1 / (8 * pi)) < 1e-14
        assert abs(self.errs["mu_exact"] - (phi - 1)) < 1e-14


class TestUniquenessTheorem:
    def setup_method(self):
        self.u = uniqueness_theorem()

    def test_building_blocks(self):
        blocks = self.u["unique_building_blocks"]
        assert "π" in blocks
        assert "φ" in blocks
        assert "e" in blocks

    def test_fixed_point_is_delta_star(self):
        assert abs(self.u["stable_fixed_point"] - DELTA_STAR) < 1e-12

    def test_all_conditions_satisfied(self):
        for cond, val in self.u["conditions"].items():
            assert val is True, f"Condition failed: {cond}"

    def test_is_euler_discretisation(self):
        assert self.u["URT_is_euler_discretisation"] is True

    def test_conclusion_is_string(self):
        assert isinstance(self.u["conclusion"], str)
        assert len(self.u["conclusion"]) > 50


class TestFlowCoefficientTable:
    def setup_method(self):
        self.table = flow_coefficient_table()

    def test_four_rows(self):
        assert len(self.table) == 4

    def test_symbols(self):
        syms = {row["symbol"] for row in self.table}
        assert "η" in syms
        assert "µ" in syms

    def test_errors_match_module_constants(self):
        eta_row = next(r for r in self.table if r["symbol"] == "η")
        assert abs(eta_row["error_pct"] - ERR_ETA * 100) < 1e-8

    def test_exact_values_correct(self):
        eta_row = next(r for r in self.table if r["symbol"] == "η")
        assert abs(eta_row["exact"] - 1 / (8 * pi)) < 1e-14


class TestUrtEvolveExact:
    def test_converges_to_delta_star(self):
        delta_init = np.full(N, 0.20)
        delta_final = urt_evolve_exact(delta_init, steps=100)
        assert abs(np.mean(delta_final) - DELTA_STAR) < 0.05

    def test_output_shape(self):
        delta_init = np.full(N, 0.20)
        out = urt_evolve_exact(delta_init, steps=60)
        assert out.shape == (N,)

    def test_output_bounded(self):
        delta_init = np.full(N, 0.20)
        out = urt_evolve_exact(delta_init, steps=100)
        assert np.all(out >= 0.001)
        assert np.all(out <= 0.5)


class TestContinuousIntegration:
    def test_returns_times_and_trajectory(self):
        delta_init = np.full(N, 0.20)
        times, traj = urt_evolve_continuous(delta_init, T=10.0, n_steps=50)
        assert len(times) == 51
        assert traj.shape == (51, N)

    def test_trajectory_moves_toward_delta_star(self):
        delta_init = np.full(N, 0.25)
        times, traj = urt_evolve_continuous(delta_init, T=20.0, n_steps=100)
        err_initial = abs(np.mean(traj[0]) - DELTA_STAR)
        err_final = abs(np.mean(traj[-1]) - DELTA_STAR)
        assert err_final < err_initial

    def test_lyapunov_decreases(self):
        delta_init = np.full(N, 0.25)
        times, traj = urt_evolve_continuous(delta_init, T=5.0, n_steps=50)
        V_start = lyapunov_value(traj[0])
        V_end = lyapunov_value(traj[-1])
        assert V_end <= V_start


def test_print_pi_phi_e_report_runs(capsys):
    print_pi_phi_e_report()
    captured = capsys.readouterr()
    assert "π" in captured.out
    assert "φ" in captured.out
    assert "URT" in captured.out
    assert "Uniqueness" in captured.out or "uniqueness" in captured.out.lower()
