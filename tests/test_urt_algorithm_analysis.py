"""Tests for the URT algorithm analysis module (corrected gradient-flow engine).

The pre-2026-05 URT iteration had a separate exp(-t/τ)-decaying pull
term that broke the attractor selection on the constant mode.  The
corrected iteration is the over-damped gradient flow on V(δ); the tests
below verify the resulting attractor-selecting behaviour.
"""
import pytest
import numpy as np

from urt.urt_algorithm_analysis import (
    per_mode_contraction_factors,
    all_modes_contracting,
    null_mode_contracts_toward_delta_star,
    null_mode_factor_is_one,                  # deprecated alias
    variance_decays_geometrically,
    uniform_init_stays_uniform,
    uniform_init_drifts_to_delta_star,
    convergence_steps_for_tolerance,
    basin_for_uniform_init,
    urt_algorithm_audit,
    urt_algorithm_audit_passes,
)


class TestLinearStability:
    def test_all_modes_contracting(self):
        """Every Laplacian eigenmode contracts (including the null mode)."""
        assert all_modes_contracting()

    def test_null_mode_contracts_toward_delta_star(self):
        """λ=0 mode: c(0) = 1 − η·(1+δ★²) ≈ 0.96 (mean → δ★ at quartic rate)."""
        assert null_mode_contracts_toward_delta_star()

    def test_deprecated_null_mode_factor_is_one_returns_false(self):
        """The pre-fix engine had c(0)=1; the corrected engine has c(0)<1."""
        assert null_mode_factor_is_one() is False

    def test_factor_at_lambda_0_is_about_0_975(self):
        """Null-mode factor c(0) = 1 − η·μ·(1+δ★²) ≈ 0.9755."""
        from urt.cathedral_engine import delta_star, ETA_RAT, MU_RAT
        cf = per_mode_contraction_factors()
        expected = 1.0 - ETA_RAT * MU_RAT * (1 + delta_star ** 2)
        assert abs(cf[0.0] - expected) < 1e-12
        assert 0.97 < cf[0.0] < 0.98

    def test_factor_at_lambda_3_is_about_0_97(self):
        """Fiedler λ=3:  c = 1 − η·η_L·3 − η·μ·(1+δ★²) ≈ 0.966."""
        cf = per_mode_contraction_factors()
        assert 0.96 < cf[3.0] < 0.97

    def test_factor_at_lambda_13_is_smallest(self):
        """λ_max = 13 contracts fastest (smallest factor)."""
        cf = per_mode_contraction_factors()
        assert min(cf, key=cf.get) == 13.0
        assert 0.92 < cf[13.0] < 0.95

    def test_contraction_factors_decrease_with_lambda(self):
        """Higher Laplacian eigenvalues → faster contraction."""
        cf = per_mode_contraction_factors()
        ordered = sorted(cf.items(), key=lambda kv: kv[0])
        factors = [v for _, v in ordered]
        assert factors == sorted(factors, reverse=True)


class TestVarianceContraction:
    def test_variance_decreases_monotonically(self):
        vd = variance_decays_geometrically()
        assert vd["monotonic_decrease"]

    def test_per_step_rate_is_about_0_97(self):
        """Geometric decay rate matches the Fiedler-mode factor (~0.97)."""
        vd = variance_decays_geometrically()
        assert 0.94 < vd["rho_estimated"] < 0.99


class TestSymmetryAndDriftPreservation:
    def test_uniform_initial_stays_uniform_in_std(self):
        """Std stays at machine zero for any uniform init."""
        assert uniform_init_stays_uniform()

    def test_uniform_initial_drifts_to_delta_star_in_mean(self):
        """The mean of a uniform init converges to δ★ (selection works)."""
        assert uniform_init_drifts_to_delta_star()

    def test_uniform_at_different_values_drift_to_delta_star(self):
        """For any uniform initial value in the stability ball, mean → δ★."""
        from urt.cathedral_engine import urt_evolve, delta_star
        for c in [0.001, 0.05, 0.10, 0.20, 0.49]:
            x0 = np.full(13, c)
            xf = urt_evolve(x0, steps=400)
            # Std stays at zero (uniform preserved)
            assert np.std(xf) < 1e-12, f"uniform init {c} broke uniformity"
            # Mean drifts to δ★
            assert abs(float(np.mean(xf)) - delta_star) < 5e-3, \
                f"uniform init {c} didn't drift to δ★"


class TestConvergence:
    def test_converges_to_1e3_in_under_500_steps(self):
        """std < 1e-3 reached under the corrected (no-decay) URT iteration."""
        steps = convergence_steps_for_tolerance(1e-3)
        assert 0 < steps <= 500

    def test_converges_to_1e5_in_under_1000_steps(self):
        """std < 1e-5 reached within ~1000 steps."""
        steps = convergence_steps_for_tolerance(1e-5)
        assert 0 < steps <= 1000


class TestBasinOfAttraction:
    def test_basin_uniformly_lands_at_delta_star(self):
        """Every uniform-c initial value drifts to δ★ to high precision."""
        from urt.cathedral_engine import delta_star
        basin = basin_for_uniform_init([0.05, 0.10, 0.20, 0.30, 0.40])
        for c, fm in basin.items():
            assert abs(fm - delta_star) < 5e-3, \
                f"basin[{c}] = {fm:.6f} did not reach δ★ = {delta_star:.6f}"

    def test_basin_finals_are_all_near_delta_star(self):
        """The map c → final_mean is the constant function δ★ (within tolerance)."""
        basin = basin_for_uniform_init([0.05, 0.10, 0.20, 0.30])
        finals = list(basin.values())
        assert max(finals) - min(finals) < 1e-3


class TestEndToEndAudit:
    def test_audit_returns_complete_dict(self):
        a = urt_algorithm_audit()
        assert "all_modes_contracting" in a
        assert "null_mode_contracts_to_delta_star" in a
        assert "uniform_stays_uniform" in a
        assert "uniform_drifts_to_delta_star" in a
        assert "variance_decay" in a

    def test_full_audit_passes(self):
        assert urt_algorithm_audit_passes()
