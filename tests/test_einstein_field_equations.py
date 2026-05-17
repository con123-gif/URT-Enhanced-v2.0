"""
Tests for urt.einstein_field_equations — full Einstein equations from
the Cathedral framework with G_N = δ★² and Λ = (D+1)·γ^((D+1)^D)·M_Pl⁴.

Verifies:
  - Schwarzschild satisfies the vacuum Einstein equation R_μν = 0
  - FRW metric + Cathedral coupling reproduces both Friedmann equations
  - Newtonian limit: Φ = -G_N·M/r with the right ∇² behavior
  - Kepler's third law ω² = G_N·M/r³ holds (a Cathedral identity)
  - Bianchi identity ∇^μ G_μν = 0
  - All component counts, coefficients, and closed forms.
"""
from math import pi, sqrt
import numpy as np
import pytest

from urt.einstein_field_equations import (
    G_N, LAMBDA_OVER_MPL4, DELTA_STAR,
    cathedral_einstein_hilbert_action_coefficient,
    cathedral_action_density,
    stress_energy_delta,
    schwarzschild_metric, schwarzschild_christoffel,
    schwarzschild_riemann_kretschmann, schwarzschild_ricci,
    schwarzschild_einstein_tensor, schwarzschild_is_vacuum_solution,
    schwarzschild_radius_cathedral,
    frw_einstein_tensor, friedmann_equations,
    friedmann_from_einstein_equations,
    newtonian_potential, newtonian_poisson_residual,
    newton_law_at_infinity,
    kepler_third_law_schwarzschild, kepler_third_law_holds,
    bianchi_residual_schwarzschild,
    cosmological_constant_cathedral,
    linearised_einstein_wave_equation_coefficient,
    cathedral_einstein_equation_correspondence,
    einstein_field_equations_audit_passes,
    einstein_field_equations_summary,
)


D, V_INT, F, N_INT = 3, 12, 20, 13


# ── Constants are Cathedral-canonical ────────────────────────────────────

class TestCathedralConstants:
    def test_G_N_is_delta_star_squared(self):
        assert G_N == pytest.approx(DELTA_STAR ** 2, rel=1e-14)

    def test_Lambda_over_MPl4_closed_form(self):
        assert LAMBDA_OVER_MPL4 == pytest.approx(4 * (1 / 81) ** 64, rel=1e-14)

    def test_Lambda_planck_match(self):
        cc = cosmological_constant_cathedral()
        assert cc["matches_Planck18"]


# ── Section A — Einstein-Hilbert action ──────────────────────────────────

class TestActionCoefficient:
    def test_prefactor_value(self):
        eh = cathedral_einstein_hilbert_action_coefficient()
        assert eh["EH_prefactor"] == pytest.approx(1 / (16 * pi * G_N))

    def test_closed_form_string(self):
        eh = cathedral_einstein_hilbert_action_coefficient()
        assert "1/(16π" in eh["EH_closed_form"]

    def test_action_density_at_minkowski_with_R_zero(self):
        """In flat Minkowski with R = 0 and matter = 0, action density = 0."""
        assert cathedral_action_density(R=0.0, L_matter=0.0,
                                        Lambda=0.0, g_det=-1.0) == 0.0


# ── Section B — Stress-energy tensor of the δ-field ──────────────────────

class TestStressEnergyDelta:
    def test_T_is_4x4(self):
        T = stress_energy_delta(delta_dot=0.1, grad_delta=np.zeros(3), delta=DELTA_STAR)
        assert T.shape == (4, 4)

    def test_T_symmetric(self):
        T = stress_energy_delta(delta_dot=0.5, grad_delta=np.array([0.1, 0.2, 0.3]),
                                delta=0.16)
        np.testing.assert_allclose(T, T.T, atol=1e-14)

    def test_T_at_vacuum_is_zero(self):
        """At δ = δ★ at rest with no gradient, T_μν = 0."""
        T = stress_energy_delta(delta_dot=0.0, grad_delta=np.zeros(3), delta=DELTA_STAR)
        np.testing.assert_allclose(T, 0.0, atol=1e-14)

    def test_T00_is_energy_density(self):
        """T^00 = ρ = (1/2)·δ̇² + (1/2)·|∇δ|² + V(δ)"""
        delta_dot, grad = 0.5, np.array([0.1, 0.0, 0.0])
        delta = DELTA_STAR + 0.001
        T = stress_energy_delta(delta_dot, grad, delta)
        V = 0.5 * (delta - DELTA_STAR) ** 2 * (1 + delta ** 2)
        expected = 0.5 * delta_dot ** 2 + 0.5 * 0.01 + V
        assert T[0, 0] == pytest.approx(expected)


# ── Section C — Schwarzschild solution ───────────────────────────────────

class TestSchwarzschild:
    def test_metric_shape(self):
        g, g_inv = schwarzschild_metric(r_s=0.1, r=1.0, theta=pi / 3)
        assert g.shape == (4, 4)
        assert g_inv.shape == (4, 4)

    def test_metric_inverse_correct(self):
        g, g_inv = schwarzschild_metric(r_s=0.1, r=1.0, theta=pi / 3)
        np.testing.assert_allclose(g @ g_inv, np.eye(4), atol=1e-12)

    def test_metric_signature(self):
        """At r >> r_s: g_tt < 0, g_rr > 0, g_θθ > 0, g_φφ > 0."""
        g, _ = schwarzschild_metric(r_s=0.1, r=100.0, theta=pi / 2)
        assert g[0, 0] < 0   # time-like
        assert g[1, 1] > 0
        assert g[2, 2] > 0
        assert g[3, 3] > 0

    def test_metric_asymptotic_flat(self):
        """At r → ∞, g → η (Minkowski in spherical coords)."""
        r = 1e10
        g, _ = schwarzschild_metric(r_s=1.0, r=r, theta=pi / 2)
        assert g[0, 0] == pytest.approx(-1.0, rel=1e-9)
        assert g[1, 1] == pytest.approx(+1.0, rel=1e-9)

    def test_christoffel_shape(self):
        Gamma = schwarzschild_christoffel(r_s=0.1, r=1.0, theta=pi / 3)
        assert Gamma.shape == (4, 4, 4)

    def test_kretschmann_closed_form(self):
        r_s, r = 0.5, 2.0
        K = schwarzschild_riemann_kretschmann(r_s, r)
        assert K == pytest.approx(12 * r_s ** 2 / r ** 6, rel=1e-14)

    def test_ricci_vanishes_at_sample_points(self):
        for r_factor in (1.5, 2.0, 5.0, 10.0):
            r = 0.1 * r_factor
            R = schwarzschild_ricci(r_s=0.1, r=r, theta=pi / 3)
            assert np.max(np.abs(R)) < 1e-7

    def test_is_vacuum_solution(self):
        assert schwarzschild_is_vacuum_solution(r_s=0.1, tol=1e-7)

    def test_einstein_tensor_vanishes(self):
        G = schwarzschild_einstein_tensor(r_s=0.1, r=1.0, theta=pi / 3)
        assert np.max(np.abs(G)) < 1e-7

    def test_schwarzschild_radius_2GM(self):
        for M in (0.5, 1.0, 2.0, 10.0):
            assert schwarzschild_radius_cathedral(M) == pytest.approx(2 * G_N * M)


# ── Section D — Friedmann from full Einstein equations ───────────────────

class TestFriedmannEquations:
    def test_frw_G00_is_3Hsquared(self):
        a, a_dot, a_ddot = 1.5, 0.3, 0.1
        G = frw_einstein_tensor(a, a_dot, a_ddot)
        H = a_dot / a
        assert G[0, 0] == pytest.approx(3 * H ** 2)

    def test_frw_Gii_matches_formula(self):
        a, a_dot, a_ddot = 1.5, 0.3, 0.1
        G = frw_einstein_tensor(a, a_dot, a_ddot)
        H = a_dot / a
        expected = -a ** 2 * (2 * a_ddot / a + H ** 2)
        for i in (1, 2, 3):
            assert G[i, i] == pytest.approx(expected)

    def test_friedmann_first_eq(self):
        """H² = (8πG_N/3)·ρ + Λ/3 from G_00 + Λ·g_00 = 8πG_N·T_00."""
        rho, Lambda = 1.0, 0.01
        fr = friedmann_equations(rho=rho, p=0.0, a=1.0, Lambda=Lambda)
        expected = (8 * pi * G_N / 3) * rho + Lambda / 3
        assert fr["H_squared"] == pytest.approx(expected)

    def test_friedmann_second_eq(self):
        """ä/a = -(4πG_N/3)(ρ+3p) + Λ/3."""
        rho, p, Lambda = 1.0, 0.5, 0.01
        fr = friedmann_equations(rho=rho, p=p, a=1.0, Lambda=Lambda)
        expected = -(4 * pi * G_N / 3) * (rho + 3 * p) + Lambda / 3
        assert fr["a_ddot_over_a"] == pytest.approx(expected)

    def test_full_einstein_equation_matter(self):
        assert friedmann_from_einstein_equations(rho=0.5, p=0.0,
                                                 Lambda=0.01, a=1.5)

    def test_full_einstein_equation_radiation(self):
        # Radiation: p = ρ/3
        rho = 0.7
        assert friedmann_from_einstein_equations(rho=rho, p=rho / 3,
                                                 Lambda=0.005, a=1.2)

    def test_full_einstein_equation_de_sitter(self):
        """de Sitter: w = -1, p = -ρ."""
        rho = 1.0
        assert friedmann_from_einstein_equations(rho=rho, p=-rho,
                                                 Lambda=0.0, a=1.0)


# ── Section E — Newtonian limit ──────────────────────────────────────────

class TestNewtonianLimit:
    def test_Phi_is_minus_GM_over_r(self):
        M, r = 2.0, 5.0
        Phi = newtonian_potential(M, r)
        assert Phi == pytest.approx(-G_N * M / r)

    def test_laplacian_zero_away_from_source(self):
        """∇²Φ = 0 for r > 0 (point mass solution is harmonic)."""
        for r in (1.0, 5.0, 10.0, 100.0):
            assert newtonian_poisson_residual(M=1.0, r=r) < 1e-8

    def test_newton_from_schwarzschild_large_r(self):
        assert newton_law_at_infinity(M=1.0, r=1e8)

    def test_newton_consistency_at_all_radii(self):
        """g_00 = -(1 + 2Φ) holds identically for Schwarzschild (this is
        a known accident; the Newton limit really shows up in g_rr).
        """
        M = 1.0
        for r in (10.0, 100.0, 1e6):
            assert newton_law_at_infinity(M=M, r=r, tol=1e-12)


# ── Section F — Kepler / geodesic ────────────────────────────────────────

class TestKepler:
    def test_omega_squared_times_r_cubed_equals_GM(self):
        for M, r in [(1.0, 100.0), (2.0, 1000.0), (0.5, 50.0)]:
            omega = kepler_third_law_schwarzschild(M, r)
            assert omega ** 2 * r ** 3 == pytest.approx(G_N * M)

    def test_kepler_holds(self):
        assert kepler_third_law_holds()

    def test_omega_scales_correctly(self):
        omega1 = kepler_third_law_schwarzschild(1.0, 100.0)
        omega2 = kepler_third_law_schwarzschild(1.0, 400.0)
        # ω ∝ r^(-3/2): r → 4r ⇒ ω → ω/8
        assert omega1 / omega2 == pytest.approx(8.0, rel=1e-10)


# ── Section G — Bianchi identity ─────────────────────────────────────────

class TestBianchi:
    def test_bianchi_residual_small(self):
        assert bianchi_residual_schwarzschild(r_s=0.05, r=5.0) < 1e-7

    def test_bianchi_residual_multiple_points(self):
        for r in (1.0, 2.0, 5.0, 10.0):
            assert bianchi_residual_schwarzschild(r_s=0.05, r=r) < 1e-6


# ── Section H — Cosmological constant ────────────────────────────────────

class TestCosmologicalConstant:
    def test_closed_form(self):
        cc = cosmological_constant_cathedral()
        assert cc["Lambda_over_MPl4"] == pytest.approx(
            4 * (1 / 81) ** 64, rel=1e-14
        )

    def test_planck_match(self):
        cc = cosmological_constant_cathedral()
        assert cc["matches_Planck18"]


# ── Section I — Linearised Einstein ──────────────────────────────────────

class TestLinearised:
    def test_coefficient_value(self):
        lw = linearised_einstein_wave_equation_coefficient()
        assert lw["coefficient"] == pytest.approx(16 * pi * G_N)

    def test_closed_form(self):
        lw = linearised_einstein_wave_equation_coefficient()
        assert lw["closed_form"] == "16π · δ★²"


# ── Section J — Cathedral correspondence ─────────────────────────────────

class TestCorrespondence:
    def test_has_required_keys(self):
        corr = cathedral_einstein_equation_correspondence()
        required = {"newton_constant", "cosmological_constant_ratio",
                    "stress_energy_source", "EH_prefactor",
                    "component_counts", "diff_invariance"}
        assert required <= set(corr.keys())

    def test_G_N_in_correspondence(self):
        corr = cathedral_einstein_equation_correspondence()
        assert corr["newton_constant"]["closed_form"] == "δ★²"

    def test_riemann_F(self):
        corr = cathedral_einstein_equation_correspondence()
        assert corr["component_counts"]["riemann"] == F

    def test_physical_efe_V2(self):
        corr = cathedral_einstein_equation_correspondence()
        assert corr["component_counts"]["physical_efe"] == V_INT // 2


# ── Summary ──────────────────────────────────────────────────────────────

class TestSummary:
    def test_summary_keys(self):
        s = einstein_field_equations_summary()
        required = {
            "G_N", "EH_prefactor", "Lambda_over_MPl4",
            "schwarzschild_vacuum", "newtonian_poisson_zero",
            "kepler_third_law_holds", "friedmann_matter",
            "friedmann_de_sitter", "correspondence",
            "audit_passes",
        }
        assert required <= set(s.keys())

    def test_summary_passes(self):
        s = einstein_field_equations_summary()
        assert s["audit_passes"]


# ── End-to-end CI gate ───────────────────────────────────────────────────

def test_audit_passes():
    assert einstein_field_equations_audit_passes()
