"""
Tests for urt.gr_emergence — diffeomorphism invariance and GR from G_{13}.

Headline: |Aut(G_{13})| = V · (D+1)^D = 768 — the framework's native
discrete diffeomorphism group factorises into the icosahedral surface
(V) and the K_4-cube (the same (D+1)^D = 64 that controls Λ/M_Pl⁴).
"""
from math import pi, factorial
import numpy as np
import pytest

from urt.gr_emergence import (
    G_NEWTON_CATH,
    aut_g13_order, aut_g13_cathedral_factorisation,
    laplacian_invariant_under_sample_auts,
    urt_iteration_commutes_with_aut,
    continuum_diffeomorphism_dim,
    lorentz_boost_matrix, k4_lagrangian_density,
    lorentz_invariance_residual, all_lorentz_boosts_invariant,
    local_kinetic_hessian_minkowski, equivalence_principle_holds,
    newton_constant, schwarzschild_radius_cath,
    hawking_temperature_cath, bekenstein_hawking_entropy_cath,
    gr_component_counts,
    urt_iteration_time_translation_invariant,
    sakharov_visser_coefficient,
    gr_emergence_audit_passes, gr_emergence_summary,
)


D, V_INT, F, N = 3, 12, 20, 13


# ── SECTION A — discrete diffeomorphism group |Aut(G_{13})| ──────────────

class TestAutG13Order:
    def test_order_is_768(self):
        assert aut_g13_order() == 768

    def test_order_via_closed_form(self):
        assert aut_g13_order(use_networkx=False) == 768

    def test_factorisation_value(self):
        fact = aut_g13_cathedral_factorisation()
        assert fact["value"] == 768

    def test_V_times_D_plus_1_to_D(self):
        fact = aut_g13_cathedral_factorisation()
        assert fact["V_times_D_plus_1_to_D"] == V_INT * (D + 1) ** D
        assert fact["V_times_D_plus_1_to_D"] == 768

    def test_V_times_2_to_Dfac(self):
        """768 = V · 2^(D!) — alternate Cathedral form."""
        fact = aut_g13_cathedral_factorisation()
        assert fact["V_times_2_to_Dfac"] == V_INT * 2 ** factorial(D)
        assert fact["V_times_2_to_Dfac"] == 768

    def test_matches_CC_exponent(self):
        """The (D+1)^D = 64 in Aut matches the Λ/M_Pl⁴ exponent."""
        fact = aut_g13_cathedral_factorisation()
        assert fact["matches_CC_exponent"]
        assert fact["twin_swap_subgroup"] == 64

    def test_closed_form_string(self):
        fact = aut_g13_cathedral_factorisation()
        assert "V" in fact["closed_form"]
        assert "(D+1)^D" in fact["closed_form"]


class TestAutInvariance:
    def test_laplacian_invariant(self):
        assert laplacian_invariant_under_sample_auts(n_sample=20)

    def test_urt_commutes_with_aut(self):
        diff = urt_iteration_commutes_with_aut(n_sample=10)
        assert diff < 1e-14

    def test_urt_commutes_machine_eps(self):
        """The commutativity is machine-precision exact."""
        diff = urt_iteration_commutes_with_aut(n_sample=5)
        assert diff < 1e-15

    def test_commutativity_multiple_seeds(self):
        for seed in (0, 1, 42):
            diff = urt_iteration_commutes_with_aut(seed=seed, n_sample=5)
            assert diff < 1e-13


# ── SECTION B — continuum diffeomorphism ────────────────────────────────

class TestContinuumDiffeo:
    def test_keys(self):
        cd = continuum_diffeomorphism_dim()
        assert {"discrete_order", "continuum_dim", "continuum_group"} <= set(cd.keys())

    def test_discrete_order_is_768(self):
        cd = continuum_diffeomorphism_dim()
        assert cd["discrete_order"] == 768

    def test_continuum_infinite(self):
        cd = continuum_diffeomorphism_dim()
        assert cd["continuum_dim"] == "infinite"


# ── SECTION C — local Lorentz invariance ────────────────────────────────

class TestLorentzInvariance:
    def test_boost_is_lorentz(self):
        """Λ^T·η·Λ = η for a boost matrix."""
        Lam = lorentz_boost_matrix(0.5, axis=1)
        eta = np.diag([1.0, -1.0, -1.0, -1.0])
        np.testing.assert_allclose(Lam.T @ eta @ Lam, eta, atol=1e-12)

    def test_boost_at_beta_zero_is_identity(self):
        Lam = lorentz_boost_matrix(0.0, axis=1)
        np.testing.assert_allclose(Lam, np.eye(4))

    def test_lorentz_residual_axis_1(self):
        assert lorentz_invariance_residual(beta=0.5, axis=1) < 1e-12

    def test_lorentz_residual_all_axes(self):
        for axis in (1, 2, 3):
            assert lorentz_invariance_residual(beta=0.7, axis=axis) < 1e-12

    def test_lorentz_residual_all_velocities(self):
        for beta in (0.1, 0.3, 0.5, 0.7, 0.9):
            assert lorentz_invariance_residual(beta=beta, axis=1) < 1e-12

    def test_all_boosts_invariant(self):
        assert all_lorentz_boosts_invariant()

    def test_kg_lagrangian_density(self):
        p = np.array([2.0, 1.0, 0.0, 0.0])
        # L = (1/2)(p^0² - p^1² - p^2² - p^3²) = (1/2)(4 - 1) = 1.5
        # Using k4_lagrangian_density signature
        L = k4_lagrangian_density(p, np.zeros(0))
        assert L == pytest.approx(1.5)


# ── SECTION D — equivalence principle ───────────────────────────────────

class TestEquivalencePrinciple:
    def test_hessian_signs_minkowski(self):
        info = local_kinetic_hessian_minkowski()
        assert info["exactly_minkowski_signs"]

    def test_hessian_signs_pattern(self):
        info = local_kinetic_hessian_minkowski()
        assert info["H_signs"] == [1.0, -1.0, -1.0, -1.0]

    def test_equivalence_principle_holds(self):
        assert equivalence_principle_holds()


# ── SECTION E — Newton's constant ───────────────────────────────────────

class TestNewtonConstant:
    def test_G_N_is_delta_star_squared(self):
        nc = newton_constant()
        assert nc["G_N"] == pytest.approx(nc["delta_star"] ** 2, rel=1e-14)

    def test_G_N_closed_form_string(self):
        nc = newton_constant()
        assert nc["closed_form"] == "δ★²"

    def test_schwarzschild_radius_scales(self):
        for M in (0.5, 1.0, 2.0, 10.0):
            assert schwarzschild_radius_cath(M) == pytest.approx(2 * G_NEWTON_CATH * M)

    def test_hawking_temperature_scales_inverse(self):
        T1 = hawking_temperature_cath(1.0)
        T2 = hawking_temperature_cath(2.0)
        assert T1 == pytest.approx(2 * T2)

    def test_bekenstein_hawking_scales_M_squared(self):
        S1 = bekenstein_hawking_entropy_cath(1.0)
        S2 = bekenstein_hawking_entropy_cath(2.0)
        assert S2 == pytest.approx(4 * S1)

    def test_first_law_dM_TdS_consistency(self):
        """ΔM = T·ΔS holds for Schwarzschild thermodynamics."""
        M = 1.0
        T = hawking_temperature_cath(M)
        S = bekenstein_hawking_entropy_cath(M)
        # dS/dM = 8π·G_N·M, so T·dS/dM = 1/(8π·G_N·M) · 8π·G_N·M = 1
        dSdM = 8 * pi * G_NEWTON_CATH * M
        assert T * dSdM == pytest.approx(1.0, rel=1e-12)


# ── SECTION F — Riemann/Einstein component counts ───────────────────────

class TestComponentCounts:
    def test_spacetime_dim_is_D_plus_1(self):
        c = gr_component_counts()
        assert c["spacetime_dim"] == D + 1

    def test_riemann_equals_F(self):
        c = gr_component_counts()
        assert c["riemann_equals_F"]
        assert c["riemann_components"] == F
        assert c["riemann_components"] == 20

    def test_ricci_is_10(self):
        c = gr_component_counts()
        assert c["ricci_components"] == 10

    def test_weyl_is_10(self):
        c = gr_component_counts()
        assert c["weyl_components"] == 10

    def test_ricci_plus_weyl_equals_riemann(self):
        c = gr_component_counts()
        assert c["ricci_components"] + c["weyl_components"] == c["riemann_components"]

    def test_bianchi_constraints(self):
        c = gr_component_counts()
        assert c["bianchi_constraints"] == D + 1

    def test_physical_efe_equals_V_over_2(self):
        c = gr_component_counts()
        assert c["physical_efe_equals_V2"]
        assert c["physical_efe"] == V_INT // 2
        assert c["physical_efe"] == 6


# ── SECTION G — time translation invariance ─────────────────────────────

class TestTimeTranslation:
    def test_urt_autonomous(self):
        assert urt_iteration_time_translation_invariant()


# ── SECTION H — induced gravity sketch ──────────────────────────────────

class TestSakharovVisser:
    def test_C1_closed_form(self):
        sv = sakharov_visser_coefficient()
        assert sv["C1_proportional"] == pytest.approx(1 / (16 * pi * G_NEWTON_CATH))

    def test_keys(self):
        sv = sakharov_visser_coefficient()
        required = {"C1_proportional", "closed_form", "G_N", "status",
                    "research_direction"}
        assert required <= set(sv.keys())

    def test_C1_positive(self):
        sv = sakharov_visser_coefficient()
        assert sv["C1_proportional"] > 0


# ── End-to-end CI gate ───────────────────────────────────────────────────

class TestSummary:
    def test_summary_has_all_keys(self):
        s = gr_emergence_summary()
        required = {
            "aut_g13_order", "aut_g13_factorisation",
            "laplacian_aut_invariant", "urt_aut_commutativity",
            "lorentz_invariant", "equivalence_principle",
            "newton_constant", "component_counts",
            "time_translation", "sakharov_visser",
            "continuum_diff", "audit_passes",
        }
        assert required <= set(s.keys())

    def test_summary_passes(self):
        s = gr_emergence_summary()
        assert s["audit_passes"]


def test_audit_passes():
    assert gr_emergence_audit_passes()
