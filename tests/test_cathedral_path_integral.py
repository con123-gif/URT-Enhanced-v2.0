"""Tests for `urt.cathedral_path_integral`.

The path-integral derivation closes the gap that `iron_proof.py` flags
as remaining speculative: the propagator is derived from the chaos→δ★
dynamics rather than postulated.  Tests verify the empirical correlation
matrix from Langevin URT matches the analytical inverse-Hessian
prediction mode-by-mode.
"""
from __future__ import annotations

import numpy as np
import pytest

from urt.cathedral_engine import (
    cathedral_laplacian, delta_star, ETA_RAT, N,
)
from urt.cathedral_path_integral import (
    hessian_at_delta_star,
    analytical_propagator_matrix,
    per_mode_masses_analytical,
    langevin_step,
    equilibrium_samples,
    empirical_correlation_matrix,
    per_mode_masses_empirical,
    cathedral_path_integral_audit,
    cathedral_path_integral_audit_passes,
    print_cathedral_path_integral_report,
)


# ─── Hessian + analytical propagator ─────────────────────────────────────

class TestHessian:
    def test_hessian_is_symmetric(self):
        H = hessian_at_delta_star()
        assert np.max(np.abs(H - H.T)) < 1e-14

    def test_hessian_is_positive_definite(self):
        eigs = np.linalg.eigvalsh(hessian_at_delta_star())
        assert eigs.min() > 0

    def test_hessian_equals_quartic_plus_laplacian(self):
        H = hessian_at_delta_star()
        L = cathedral_laplacian()
        expected = (1 + delta_star ** 2) * np.eye(N) + L
        np.testing.assert_allclose(H, expected, atol=1e-14)


class TestAnalyticalPropagator:
    def test_propagator_matrix_is_symmetric(self):
        C = analytical_propagator_matrix(T=1e-4)
        assert np.max(np.abs(C - C.T)) < 1e-14

    def test_propagator_is_positive_definite(self):
        C = analytical_propagator_matrix(T=1e-4)
        eigs = np.linalg.eigvalsh(C)
        assert eigs.min() > 0

    def test_propagator_per_mode_formula(self):
        """In the L-eigenbasis the propagator is T/(m²·(1−η·m²/2)) per mode."""
        L = cathedral_laplacian()
        eigvals_L, V = np.linalg.eigh(L)
        T = 1e-4
        C = analytical_propagator_matrix(T=T)
        diag_mode = np.diag(V.T @ C @ V)
        m_sq = (1 + delta_star ** 2) + eigvals_L
        expected = T / (m_sq * (1 - ETA_RAT * m_sq / 2))
        np.testing.assert_allclose(diag_mode, expected, rtol=1e-10)

    def test_per_mode_masses_analytical_shape(self):
        masses = per_mode_masses_analytical()
        assert masses.shape == (N,)
        assert (masses > 0).all()

    def test_per_mode_masses_scale_linearly_with_T(self):
        m1 = per_mode_masses_analytical(T=1e-4)
        m2 = per_mode_masses_analytical(T=2e-4)
        np.testing.assert_allclose(m2, 2 * m1, rtol=1e-14)


# ─── Langevin dynamics ────────────────────────────────────────────────────

class TestLangevin:
    def test_step_shape(self):
        rng = np.random.default_rng(0)
        x = np.full(N, delta_star)
        x1 = langevin_step(x, T=1e-4, rng=rng)
        assert x1.shape == (N,)

    def test_zero_temperature_step_is_deterministic_gradient_descent(self):
        """At T=0 the noise term vanishes; the step is pure gradient descent."""
        from urt.cathedral_engine import cathedral_potential_gradient
        rng = np.random.default_rng(0)
        x = np.array([0.18] * N)
        grad = cathedral_potential_gradient(x)
        x1 = langevin_step(x, T=0.0, rng=rng)
        np.testing.assert_allclose(x1, x - ETA_RAT * grad, atol=1e-14)

    def test_step_at_delta_star_with_noise_stays_near_delta_star(self):
        """One Langevin step from δ★ moves at most O(sqrt(T·η))."""
        rng = np.random.default_rng(0)
        x = np.full(N, delta_star)
        x1 = langevin_step(x, T=1e-4, rng=rng)
        # Expected noise scale per coordinate is sqrt(2·T·η) ≈ 3e-3
        assert np.max(np.abs(x1 - delta_star)) < 0.02


class TestEquilibriumSampling:
    def test_samples_shape(self):
        samples = equilibrium_samples(n_samples=200, burn_in=200, seed=0)
        assert samples.shape == (200, N)

    def test_samples_mean_near_delta_star(self):
        """At low T, samples are centred on δ★."""
        samples = equilibrium_samples(T=1e-4, n_samples=2000, burn_in=500, seed=0)
        mean = samples.mean(axis=0)
        assert np.max(np.abs(mean - delta_star)) < 1e-3

    def test_samples_have_nonzero_variance(self):
        samples = equilibrium_samples(T=1e-4, n_samples=500, burn_in=500, seed=0)
        assert samples.var(axis=0).min() > 0

    def test_zero_temperature_samples_collapse_to_delta_star(self):
        samples = equilibrium_samples(T=0.0, n_samples=100, burn_in=2000, seed=0)
        # With no noise, deterministic gradient descent → δ★
        assert np.max(np.abs(samples.mean(axis=0) - delta_star)) < 1e-3


# ─── Empirical correlation matrix ────────────────────────────────────────

class TestEmpiricalCorrelation:
    def test_correlation_matrix_shape(self):
        samples = equilibrium_samples(n_samples=500, burn_in=200, seed=0)
        C = empirical_correlation_matrix(samples)
        assert C.shape == (N, N)

    def test_correlation_matrix_is_symmetric(self):
        samples = equilibrium_samples(n_samples=500, burn_in=200, seed=0)
        C = empirical_correlation_matrix(samples)
        assert np.max(np.abs(C - C.T)) < 1e-14

    def test_correlation_matrix_is_positive_semidefinite(self):
        samples = equilibrium_samples(n_samples=1000, burn_in=500, seed=0)
        C = empirical_correlation_matrix(samples)
        eigs = np.linalg.eigvalsh(C)
        assert eigs.min() > -1e-14    # allow tiny negative noise


# ─── Per-mode mass spectrum (the headline result) ────────────────────────

class TestPerModeMasses:
    def test_per_mode_empirical_matches_analytical(self):
        """The empirical variance per L-eigenmode matches T/(m²·(1−η·m²/2))."""
        T = 1e-4
        samples = equilibrium_samples(T=T, n_samples=8000, burn_in=2000, seed=0)
        emp = per_mode_masses_empirical(samples)
        ana = per_mode_masses_analytical(T=T)
        rel_errs = np.abs(emp - ana) / ana
        # All 13 modes within 25 % (loose to absorb high-λ MC bias)
        assert rel_errs.max() < 0.25

    def test_null_mode_tightly_matches(self):
        """The slowest-decorrelating mode (λ=0) should match analytical
        very precisely — it dominates the sample chain."""
        T = 1e-4
        samples = equilibrium_samples(T=T, n_samples=8000, burn_in=2000, seed=0)
        emp = per_mode_masses_empirical(samples)
        ana = per_mode_masses_analytical(T=T)
        rel_err = abs(emp[0] - ana[0]) / ana[0]
        assert rel_err < 0.05

    def test_decreasing_variance_with_lambda(self):
        """Higher Laplacian eigenvalues → smaller stationary variance."""
        ana = per_mode_masses_analytical()
        # Sorted by L-eigenvalue → variance should be (monotonically) decreasing
        assert all(ana[i] >= ana[i + 1] - 1e-10 for i in range(N - 1))


# ─── Audit gate ──────────────────────────────────────────────────────────

class TestAudit:
    def test_audit_returns_dataclass(self):
        a = cathedral_path_integral_audit(n_samples=2000, seed=0)
        assert hasattr(a, "all_modes_converged")
        assert hasattr(a, "trace_rel_err")
        assert hasattr(a, "null_mode_rel_err")

    def test_audit_passes(self):
        """CI gate: path-integral derivation closes."""
        assert cathedral_path_integral_audit_passes() is True

    def test_print_report_does_not_crash(self, capsys):
        print_cathedral_path_integral_report()
        captured = capsys.readouterr()
        assert "CATHEDRAL PATH INTEGRAL" in captured.out
        assert "Audit passes:" in captured.out
