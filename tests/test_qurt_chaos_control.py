"""
Tests for urt.qurt_chaos_control — QURT-bounded quantum chaos.

Verifies, in code:

  1. The Cathedral closed forms for the maximum stabilisable Lyapunov
     rate  λ_L_max = D / (2^(q+1) π²) ≈ 0.00475  per step.
  2. The Cathedral scrambling time  τ_scramble = 2·2^q·π²/D ≈ 210 steps.
  3. Haar-random unitaries → QURT-controlled channel is strictly
     contractive; any two initial states converge to the same fixed point.
  4. Quantum kicked-top in the chaotic regime → same Cauchy property.
  5. OTOC-bound predictor: 2λ_L ≤ log(1/κ) ⇔ controlled chaos.
"""
from math import pi, log, sqrt
import numpy as np
import pytest

from urt.qurt_chaos_control import (
    qurt_lyapunov_bound, qurt_scrambling_time,
    haar_random_unitary, kicked_top_unitary,
    controlled_chaos_evolution, chaos_contraction_rate,
    cauchy_convergence, otoc_bound_with_qurt,
    qurt_chaos_audit, qurt_chaos_audit_passes,
)
from urt.quantum_urt import (
    DYN_NORM, KAPPA_QURT, qurt_fixed_point, trace_distance, purity,
)
from urt.shell_closure import D, q, N


# ── Cathedral closed forms for chaos control ─────────────────────────────

class TestLyapunovBound:
    def test_lambda_max_cathedral_value(self):
        """λ_L_max = D / (2^(q+1) π²) — every factor a Cathedral integer."""
        b = qurt_lyapunov_bound(beta=1.0)
        rebuilt = D / (2 ** (q + 1) * pi ** 2)
        assert b["Cathedral_value"] == pytest.approx(rebuilt, abs=1e-15)

    def test_exact_and_linear_agree_at_small_beta(self):
        """log(1/κ_β)/2 ≈ β·D/(2·2^q π²) for small β·D/(2^q π²)."""
        b = qurt_lyapunov_bound(beta=1.0)
        assert b["agreement_small_beta"] < 0.01

    def test_zero_beta_no_chaos_capacity(self):
        """β = 0 ⇒ κ = 1 ⇒ no chaos can be stabilised."""
        b = qurt_lyapunov_bound(beta=0.0)
        assert b["lambda_L_max_exact"] == pytest.approx(0.0, abs=1e-15)

    def test_lambda_max_positive_at_beta_one(self):
        b = qurt_lyapunov_bound(beta=1.0)
        assert b["lambda_L_max_exact"] > 0


class TestScramblingTime:
    def test_scrambling_time_is_about_210(self):
        s = qurt_scrambling_time(beta=1.0)
        assert 200 < s["tau_scramble_from_lambda"] < 220

    def test_cathedral_form_2x_fiedler(self):
        """τ_scramble ≈ 2 · τ_Fiedler (Cathedral closed-form ratio)."""
        s = qurt_scrambling_time(beta=1.0)
        assert s["ratio_to_fiedler"] == pytest.approx(2.0, abs=0.05)

    def test_scramble_uses_dynamical_norm(self):
        """τ_scramble closed form = 2 · 2^q · π² / D."""
        s = qurt_scrambling_time(beta=1.0)
        assert s["Cathedral_value"] == pytest.approx(
            2 * DYN_NORM / D, abs=1e-12
        )


# ── Test unitaries are unitary ───────────────────────────────────────────

class TestTestUnitaries:
    def test_haar_random_unitary(self):
        rng = np.random.default_rng(0)
        U = haar_random_unitary(rng, dim=N)
        assert U.shape == (N, N)
        assert np.allclose(U @ U.conj().T, np.eye(N), atol=1e-12)

    def test_kicked_top_is_13d(self):
        """At J = 6 the kicked-top space has 2J+1 = 13 = N dimensions."""
        U = kicked_top_unitary(p=pi / 2, k=3.0, J=6.0)
        assert U.shape == (N, N)
        # And it's unitary
        assert np.allclose(U @ U.conj().T, np.eye(N), atol=1e-10)

    def test_kicked_top_rejects_wrong_J(self):
        with pytest.raises(ValueError):
            kicked_top_unitary(p=pi / 2, k=3.0, J=5.0)


# ── The QURT-controlled chaos channel is strictly contractive ────────────

class TestControlledChaosContractivity:
    def test_haar_random_cauchy_convergence(self):
        """Under E·U_Haar, any two initial states converge to a
        common fixed point (Cauchy convergence)."""
        rng = np.random.default_rng(7)
        U = haar_random_unitary(rng)
        result = cauchy_convergence(U, beta=1.0, steps=2000, seed=7)
        assert result["converged"]
        assert result["d_final"] < 1e-3

    def test_kicked_top_cauchy_convergence(self):
        U = kicked_top_unitary(p=pi / 2, k=3.0, J=6.0)
        result = cauchy_convergence(U, beta=1.0, steps=2000, seed=11)
        assert result["converged"]
        assert result["d_final"] < 1e-3

    def test_contraction_rate_above_floor(self):
        """Empirical decay rate ≥ Fiedler floor β · D / (2^q π²)."""
        rng = np.random.default_rng(13)
        U = haar_random_unitary(rng)
        result = chaos_contraction_rate(U, beta=1.0, n_pairs=3,
                                          steps=200, seed=13)
        assert result["above_floor"]
        # Mean rate ≥ Fiedler floor (with some slack already in `above_floor`)
        assert result["mean_rate"] > 0


# ── OTOC bound predictor ─────────────────────────────────────────────────

class TestOTOCBound:
    def test_below_critical_lyapunov_is_bounded(self):
        """λ_L < λ_max ⇒ controlled bound is bounded."""
        bound = qurt_lyapunov_bound(beta=1.0)
        lambda_safe = 0.5 * bound["lambda_L_max_exact"]
        r = otoc_bound_with_qurt(t=1000.0, lambda_L=lambda_safe, beta=1.0)
        assert r["is_bounded"]
        assert r["bound"] < 1.0

    def test_above_critical_lyapunov_blows_up(self):
        """λ_L > λ_max ⇒ OTOC bound diverges."""
        bound = qurt_lyapunov_bound(beta=1.0)
        lambda_chaos = 2.0 * bound["lambda_L_max_exact"]
        r = otoc_bound_with_qurt(t=1000.0, lambda_L=lambda_chaos, beta=1.0)
        assert not r["is_bounded"]
        assert r["bound"] > 1.0


# ── End-to-end audit ─────────────────────────────────────────────────────

def test_qurt_chaos_audit_passes():
    assert qurt_chaos_audit_passes()


def test_qurt_chaos_audit_returns_dict_with_expected_keys():
    a = qurt_chaos_audit()
    for key in (
        "lyapunov_bound", "scrambling_time",
        "haar_random_contraction", "kicked_top_contraction",
        "haar_cauchy", "kt_cauchy", "framework_role",
    ):
        assert key in a


# ── Cathedral integration ────────────────────────────────────────────────

class TestCathedralIntegration:
    def test_scramble_time_matches_slowest_mixing(self):
        """Cathedral scrambling time = 2 × slowest URT mixing time."""
        from urt.chaos_and_flow import slowest_mixing_time
        # slowest_mixing_time returns dict-like or scalar; test the relation
        s = qurt_scrambling_time(beta=1.0)
        fiedler_tau = slowest_mixing_time()
        if isinstance(fiedler_tau, dict):
            fiedler_tau = fiedler_tau["tau"]
        elif hasattr(fiedler_tau, "get"):
            fiedler_tau = fiedler_tau.get("tau", fiedler_tau)
        assert s["tau_fiedler_cathedral"] == pytest.approx(
            fiedler_tau, rel=0.01
        )

    def test_lambda_max_is_inverse_2x_dynamical_norm(self):
        """λ_L_max · 2 · 2^q · π² / D ≈ 1."""
        b = qurt_lyapunov_bound(beta=1.0)
        product = b["lambda_L_max_exact"] * 2 * DYN_NORM / D
        # Should be ≈ 1 (at small β·D/dyn_norm) up to log corrections
        assert 0.95 < product < 1.05
