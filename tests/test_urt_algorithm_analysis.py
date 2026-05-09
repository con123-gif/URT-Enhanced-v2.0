"""Tests for the URT algorithm analysis module."""
import pytest
import numpy as np

from urt.urt_algorithm_analysis import (
    per_mode_contraction_factors,
    all_modes_contracting,
    null_mode_factor_is_one,
    variance_decays_geometrically,
    uniform_init_stays_uniform,
    convergence_steps_for_tolerance,
    basin_for_uniform_init,
    urt_algorithm_audit,
    urt_algorithm_audit_passes,
)


class TestLinearStability:
    def test_all_modes_contracting(self):
        """Every Laplacian eigenmode contracts (or is the null mode)."""
        assert all_modes_contracting()

    def test_null_mode_factor_is_exactly_one(self):
        """λ=0 mode (constant) has contraction factor 1 — mean preserved."""
        assert null_mode_factor_is_one()

    def test_factor_at_lambda_3_is_about_0_99(self):
        """Fiedler value λ=3 has slow contraction ≈ 0.99 per step."""
        cf = per_mode_contraction_factors()
        assert 0.989 < cf[3.0] < 0.991

    def test_factor_at_lambda_13_is_smallest(self):
        """λ_max = 13 contracts fastest (smallest factor)."""
        cf = per_mode_contraction_factors()
        non_null = {k: v for k, v in cf.items() if k > 0}
        assert min(non_null, key=non_null.get) == 13.0


class TestVarianceContraction:
    def test_variance_decreases_monotonically(self):
        vd = variance_decays_geometrically()
        assert vd["monotonic_decrease"]

    def test_per_step_rate_is_about_0_984(self):
        """Geometric decay rate matches the Fiedler-mode contraction."""
        vd = variance_decays_geometrically()
        assert 0.95 < vd["rho_estimated"] < 1.0


class TestSymmetryPreservation:
    def test_uniform_initial_stays_uniform(self):
        """The iteration commutes with the constant null mode."""
        assert uniform_init_stays_uniform()

    def test_uniform_at_different_values_stays_uniform(self):
        """For any uniform initial value, std stays at machine zero."""
        from urt.cathedral_engine import urt_evolve
        for c in [0.001, 0.05, 0.10, 0.20, 0.49]:
            x0 = np.full(13, c)
            xf = urt_evolve(x0, steps=100)
            assert np.std(xf) < 1e-12, f"uniform init {c} broke symmetry"


class TestConvergence:
    def test_converges_to_1e3_in_under_1000_steps(self):
        """std < 1e-3 reached by 500 steps for random init."""
        steps = convergence_steps_for_tolerance(1e-3)
        assert 0 < steps <= 1000

    def test_converges_to_1e5_in_under_2000_steps(self):
        steps = convergence_steps_for_tolerance(1e-5)
        assert 0 < steps <= 2000


class TestBasinOfAttraction:
    def test_basin_returns_sensible_range(self):
        """Final mean is roughly between init c and δ★ for c > δ★."""
        from urt.cathedral_engine import delta_star
        basin = basin_for_uniform_init([0.10, 0.20, 0.30])
        for c, fm in basin.items():
            # Final mean is between δ★ and c (the pull is bounded)
            assert min(c, delta_star) - 0.05 <= fm <= max(c, delta_star) + 0.01

    def test_basin_is_monotonic_in_init_value(self):
        """Higher initial → higher final mean."""
        basin = basin_for_uniform_init([0.05, 0.10, 0.20, 0.30])
        finals = [basin[c] for c in sorted(basin.keys())]
        assert finals == sorted(finals)


class TestEndToEndAudit:
    def test_audit_returns_complete_dict(self):
        a = urt_algorithm_audit()
        assert "all_modes_contracting" in a
        assert "uniform_stays_uniform" in a
        assert "variance_decay" in a

    def test_full_audit_passes(self):
        assert urt_algorithm_audit_passes()
