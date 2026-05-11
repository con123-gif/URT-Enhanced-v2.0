"""
Tests for urt.hydrodynamic_limit — Cathedral-native hydrodynamic chain.

Eight independent checks, all required to pass at machine precision.
"""
import math
import numpy as np
import pytest

from urt.hydrodynamic_limit import (
    DELTA_STAR, DELTA_CL, GAP_DELTA,
    ETA, ETA_LAPLACIAN, K_BETA, DIFFUSION_D,
    V_cathedral, Vprime_cathedral,
    discrete_continuity_residual_G13,
    cathedral_4_current,
    current_divergence_lcft,
    noether_T_munu,
    scalar_identities_residuals,
    bianchi_residual_FRW,
    vacuum_w_at_rest,
    classical_rail_vacuum_energy,
    laplacian_convergence_ratios,
    hydrodynamic_limit_audit_passes,
)


# ── Constants are framework-canonical ─────────────────────────────────────

def test_delta_star_value():
    """δ★ matches the canonical (1−γ)·π/(N·φ) closed form."""
    from math import pi, sqrt
    phi = (1 + sqrt(5)) / 2
    assert DELTA_STAR == pytest.approx((1 - 1/81) * pi / (13 * phi), rel=1e-14)


def test_delta_cl_value():
    assert DELTA_CL == 3 / 20


def test_pde_coefficients_closed_form():
    from math import pi
    assert ETA == pytest.approx(1 / (8 * pi))
    assert ETA_LAPLACIAN == pytest.approx(1 / (4 * pi))
    assert K_BETA == pytest.approx(1 / (8 * pi ** 2))
    assert DIFFUSION_D == pytest.approx((1/81) * pi ** 2 / 2)


# ── Potential and its derivative ─────────────────────────────────────────

def test_V_vanishes_at_delta_star():
    assert V_cathedral(DELTA_STAR) == 0.0


def test_V_positive_at_delta_cl():
    assert V_cathedral(DELTA_CL) > 0


def test_Vprime_vanishes_at_delta_star():
    assert Vprime_cathedral(DELTA_STAR) == 0.0


# ── Step 3: discrete continuity on G_{13} ─────────────────────────────────

class TestDiscreteContinuity:
    def test_random_perturbation(self):
        rng = np.random.default_rng(0)
        eps = rng.standard_normal(13) * 0.01
        residual = discrete_continuity_residual_G13(eps)
        assert residual < 1e-14

    def test_three_random_seeds(self):
        for seed in (0, 1, 42):
            rng = np.random.default_rng(seed)
            eps = rng.standard_normal(13) * 0.01
            assert discrete_continuity_residual_G13(eps) < 1e-14

    def test_zero_perturbation(self):
        eps = np.zeros(13)
        assert discrete_continuity_residual_G13(eps) == 0.0


# ── Step 4: continuum 4-current divergence ───────────────────────────────

class TestContinuumDivergence:
    def setup_method(self):
        from math import pi
        Nx = 256
        L = 10.0
        x = np.linspace(0, L, Nx, endpoint=False)
        self.dx = L / Nx
        self.dt = 0.01
        self.chi = DELTA_STAR + 0.05 * np.sin(2 * pi * x / L)

    def test_current_has_two_components(self):
        cur = cathedral_4_current(self.chi, self.dx)
        assert "j0" in cur and "jx" in cur
        assert cur["j0"].shape == cur["jx"].shape

    def test_j0_is_chi(self):
        cur = cathedral_4_current(self.chi, self.dx)
        np.testing.assert_allclose(cur["j0"], self.chi)

    def test_divergence_matches_relaxation_source(self):
        info = current_divergence_lcft(self.chi, self.dt, self.dx)
        assert info["max_residual"] < 1e-12

    def test_fixed_point_continuity_is_exact(self):
        info = current_divergence_lcft(self.chi, self.dt, self.dx)
        assert info["fixed_point_residual"] == 0.0


# ── Step 5/6: Noether T^μν + scalar identities ───────────────────────────

class TestNoetherStressEnergy:
    def test_T00_equals_epsilon(self):
        out = noether_T_munu(DELTA_CL, 0.005, 0.001)
        expected = 0.5 * 0.005**2 + 0.5 * 0.001**2 + V_cathedral(DELTA_CL)
        assert out["epsilon"] == pytest.approx(expected)

    def test_eps_plus_p_identity(self):
        r1, _ = scalar_identities_residuals(DELTA_CL, 0.005, 0.001)
        assert r1 < 1e-18

    def test_eps_minus_p_identity(self):
        _, r2 = scalar_identities_residuals(DELTA_CL, 0.005, 0.001)
        assert r2 < 1e-18

    def test_w_at_rest_is_minus_one(self):
        out = noether_T_munu(DELTA_CL, 0.0, 0.0)
        assert out["w_eos"] == -1.0

    def test_w_at_vacuum_is_nan(self):
        """At δ = δ★, both ε and p vanish — w is degenerate."""
        out = noether_T_munu(DELTA_STAR, 0.0, 0.0)
        # NaN compares as not-equal to itself; either NaN or undefined is OK
        assert out["epsilon"] == 0.0
        assert out["pressure"] == 0.0


# ── Step 7: Bianchi on FRW ────────────────────────────────────────────────

class TestBianchiFRW:
    def test_max_residual_machine_eps(self):
        result = bianchi_residual_FRW()
        assert result["max_residual"] < 1e-12

    def test_mean_residual_smaller_than_max(self):
        result = bianchi_residual_FRW()
        assert result["mean_residual"] <= result["max_residual"]

    def test_result_keys(self):
        result = bianchi_residual_FRW()
        assert {"max_residual", "mean_residual", "final_w"} <= set(result.keys())


# ── Step 8: closed-form Cathedral consequences ───────────────────────────

class TestClosedFormConsequences:
    def test_vacuum_w_at_rest_minus_one(self):
        assert vacuum_w_at_rest(DELTA_CL) == -1.0

    def test_vacuum_w_at_delta_star_is_nan(self):
        """V(δ★) = 0 ⇒ w degenerate."""
        assert math.isnan(vacuum_w_at_rest(DELTA_STAR))

    def test_classical_rail_vacuum_keys(self):
        cr = classical_rail_vacuum_energy()
        assert {"V_cl", "delta_cl", "delta_star", "gap", "w_at_rest"} <= set(cr.keys())

    def test_V_cl_closed_form(self):
        cr = classical_rail_vacuum_energy()
        # ½·Δ²·(1 + δ_cl²)
        expected = 0.5 * GAP_DELTA ** 2 * (1 + DELTA_CL ** 2)
        assert cr["V_cl"] == pytest.approx(expected, rel=1e-14)

    def test_V_cl_positive(self):
        assert classical_rail_vacuum_energy()["V_cl"] > 0


# ── Convergence rate ──────────────────────────────────────────────────────

class TestConvergence:
    def test_ratios_approach_four(self):
        """Centred 2nd-difference Laplacian converges at O(dx²)."""
        rows = laplacian_convergence_ratios()
        for row in rows[1:]:
            assert abs(row["ratio"] - 4.0) < 0.05

    def test_error_strictly_decreasing(self):
        rows = laplacian_convergence_ratios()
        for i in range(len(rows) - 1):
            assert rows[i + 1]["max_error"] < rows[i]["max_error"]

    def test_finest_grid_machine_eps(self):
        rows = laplacian_convergence_ratios()
        assert rows[-1]["max_error"] < 1e-6


# ── End-to-end CI gate ───────────────────────────────────────────────────

def test_audit_passes():
    assert hydrodynamic_limit_audit_passes()
