"""
Tests for urt.cathedral_engine — the dynamical engine of the framework.

The engine consolidates the entire 13-shell closure framework into a
single end-to-end computation derived from the π-φ-e flow on G_{13}
(see Lytollis 2026, "The π-φ-e Flow", PDF reference in repo).
"""
import numpy as np
import pytest
from math import pi, sqrt

from urt.cathedral_engine import (
    ETA, ETA_LAPLACIAN, MU_PULL, TAU_RELAX,
    ETA_RAT, ETA_LAP_RAT, MU_RAT,
    cathedral_adjacency,
    cathedral_laplacian,
    urt_evolve,
    consciousness_integration,
    cathedral_engine_summary,
)


class TestPiPhiEFlowCoefficients:
    def test_eta_is_one_over_8pi(self):
        assert ETA == 1 / (8 * pi)
        assert ETA == pytest.approx(0.03979, abs=1e-4)

    def test_eta_L_is_one_over_4pi(self):
        assert ETA_LAPLACIAN == 1 / (4 * pi)
        assert ETA_LAPLACIAN == 2 * ETA

    def test_mu_is_phi_minus_one(self):
        phi = (1 + sqrt(5)) / 2
        assert MU_PULL == phi - 1
        assert MU_PULL == pytest.approx(0.618033, abs=1e-5)

    def test_rational_approximations_are_within_1pct(self):
        assert abs(ETA_RAT     - ETA)           / ETA           < 0.02
        assert abs(ETA_LAP_RAT - ETA_LAPLACIAN) / ETA_LAPLACIAN < 0.02
        assert abs(MU_RAT      - MU_PULL)       / MU_PULL       < 0.04

    def test_tau_is_graph_diameter(self):
        assert TAU_RELAX == 10


class TestGraphStructure:
    def test_adjacency_is_symmetric(self):
        A = cathedral_adjacency()
        assert np.allclose(A, A.T)

    def test_adjacency_has_zero_diagonal(self):
        A = cathedral_adjacency()
        assert np.all(np.diag(A) == 0)

    def test_centre_connects_to_all_12_surface(self):
        A = cathedral_adjacency()
        assert A[0, 0] == 0
        assert A[0, 1:].sum() == 12

    def test_laplacian_smallest_eigenvalue_is_zero(self):
        L = cathedral_laplacian()
        eigs = np.linalg.eigvalsh(L)
        assert eigs[0] == pytest.approx(0, abs=1e-10)

    def test_laplacian_fiedler_value_is_3(self):
        L = cathedral_laplacian()
        eigs = np.sort(np.linalg.eigvalsh(L))
        assert eigs[1] == pytest.approx(3.0, abs=1e-9)


class TestUrtEvolve:
    def test_converges_to_a_rail(self):
        from urt.cathedral_engine import delta_star, delta_cl
        np.random.seed(0)
        x0 = np.random.uniform(0.1, 0.3, 13)
        x_final = urt_evolve(x0, steps=200)
        m = np.mean(x_final)
        assert delta_star * 0.5 < m < 0.30
        assert np.std(x_final) < 0.05

    def test_output_inside_clamp_bounds(self):
        x0 = np.random.uniform(0.1, 0.3, 13)
        x_final = urt_evolve(x0, steps=50)
        assert np.all(x_final >= 1e-3)
        assert np.all(x_final <= 0.5)

    def test_evolution_is_deterministic(self):
        x0 = np.array([0.15] * 13)
        a = urt_evolve(x0.copy(), steps=20)
        b = urt_evolve(x0.copy(), steps=20)
        assert np.allclose(a, b)

    def test_exact_coefficients_also_settle(self):
        np.random.seed(1)
        x0 = np.random.uniform(0.1, 0.3, 13)
        x_final = urt_evolve(x0, steps=200,
                              eta=ETA, eta_L=ETA_LAPLACIAN, mu=MU_PULL)
        assert np.std(x_final) < 0.05


class TestNarrativeArc:
    """chaos → 13-shell → rails → gap → η_B (universe from chaos)."""

    def test_step1_chaotic_initial_condition_has_high_variance(self):
        np.random.seed(7)
        x0 = np.random.uniform(0.0, 0.5, 13)
        assert np.std(x0) > 0.10

    def test_step2_urt_evolution_collapses_variance(self):
        np.random.seed(7)
        x0 = np.random.uniform(0.0, 0.5, 13)
        x_final = urt_evolve(x0, steps=200)
        assert np.std(x_final) < 0.5 * np.std(x0)

    def test_step3_evolved_field_lands_in_rails_band(self):
        from urt.cathedral_engine import delta_star
        np.random.seed(7)
        x0 = np.random.uniform(0.0, 0.5, 13)
        x_final = urt_evolve(x0, steps=200)
        m = np.mean(x_final)
        assert delta_star * 0.5 < m < 3 * delta_star

    def test_step4_two_rails_are_well_separated(self):
        from urt.cathedral_engine import delta_star, delta_cl
        assert delta_cl > delta_star
        assert (delta_cl - delta_star) > 1e-3

    def test_step5_gap_drives_eta_b(self):
        from urt.cathedral_engine import delta_star, delta_cl, gamma, Delta
        eta_B = gamma**3 * Delta * delta_star * 8 / 9
        assert abs(eta_B - 6.12e-10) / 6.12e-10 < 0.01


class TestLagrangianView:
    """The engine is the over-damped limit of L = (1/2)|δ̇|² − V(δ)."""

    def test_potential_at_uniform_delta_star_is_minimum(self):
        from urt.cathedral_engine import cathedral_potential, delta_star
        x_star  = np.full(13, delta_star)
        x_other = np.full(13, 0.20)
        assert cathedral_potential(x_star) < cathedral_potential(x_other)

    def test_potential_at_uniform_delta_star_is_machine_zero(self):
        from urt.cathedral_engine import cathedral_potential, delta_star
        v = cathedral_potential(np.full(13, delta_star))
        assert abs(v) < 1e-12

    def test_gradient_is_zero_at_uniform_delta_star(self):
        from urt.cathedral_engine import cathedral_potential_gradient, delta_star
        x = np.full(13, delta_star)
        g = cathedral_potential_gradient(x)
        assert np.max(np.abs(g)) < 1e-12

    def test_lagrangian_returns_finite_number(self):
        from urt.cathedral_engine import cathedral_flow_lagrangian, delta_star
        x = np.full(13, delta_star)
        v = np.zeros(13)
        L = cathedral_flow_lagrangian(x, v)
        assert np.isfinite(L)


class TestUnificationView:
    """K₄ ⊕ A₅ = 13 is one object viewed many ways."""

    def test_size_split_is_4_and_9(self):
        from urt.cathedral_engine import cathedral_unification
        u = cathedral_unification()
        assert u["size"]["K4"] == 4
        assert u["size"]["A5"] == 9
        assert u["size"]["sum"] == 13

    def test_spectrum_split_first_four_is_K4(self):
        from urt.cathedral_engine import cathedral_unification
        u = cathedral_unification()
        K4_lams = u["spectrum_split"]["K4_lambdas"]
        assert K4_lams[0] == pytest.approx(0,  abs=1e-9)
        assert K4_lams[3] <= 5 + 1e-9

    def test_cosmology_split_is_omega_m_omega_lambda(self):
        from urt.cathedral_engine import cathedral_unification
        u = cathedral_unification()
        assert u["cosmology_split"]["Omega_m"] == 4 / 13
        assert u["cosmology_split"]["Omega_Lambda"] == 9 / 13
        assert (u["cosmology_split"]["Omega_m"] +
                u["cosmology_split"]["Omega_Lambda"]) == 13/13

    def test_casimir_ratio_is_4_over_9(self):
        from urt.cathedral_engine import cathedral_unification
        u = cathedral_unification()
        assert u["casimir_ratio"]["ratio"] == 4 / 9

    def test_unifying_axiom_present(self):
        from urt.cathedral_engine import cathedral_unification
        u = cathedral_unification()
        assert "K₄ ⊕ A₅" in u["unifying_axiom"]
        assert "single Cathedral object" in u["unifying_axiom"]


class TestConsciousnessIntegration:
    def test_high_for_constant_field(self):
        x = np.full(13, 0.15)
        Phi = consciousness_integration(x)
        assert Phi > 1000

    def test_low_for_random_field(self):
        np.random.seed(2)
        x = np.random.uniform(0, 1, 13)
        Phi = consciousness_integration(x)
        assert Phi < 50

    def test_only_uses_K4_block(self):
        x = np.full(13, 0.15)
        a = consciousness_integration(x)
        x[5] = 100
        b = consciousness_integration(x)
        assert a == b


class TestCathedralEngineSummary:
    def test_returns_dict_with_all_observables(self):
        s = cathedral_engine_summary()
        for key in (
            "alpha_inv", "mu_over_e", "tau_over_mu", "mp_over_me",
            "alpha_s_MZ", "sin_theta_C", "sin2_theta_W", "alpha_GUT",
            "theta12_deg", "theta13_deg", "theta23_deg", "delta_CP_deg",
            "Omega_m", "Omega_Lambda", "eta_B", "H0_ratio",
            "n_s", "r_tensor", "axion_mass_uev", "dm_mass",
            "eeg_delta_band_Hz", "consciousness_integration",
            "filled_vacuum_sites",
        ):
            assert key in s, f"missing observable: {key}"

    @pytest.mark.physics
    def test_alpha_inv_matches_pdg(self):
        s = cathedral_engine_summary()
        assert abs(s["alpha_inv"] - 137.036) < 0.01

    @pytest.mark.physics
    def test_proton_electron_mass_ratio_matches_pdg(self):
        s = cathedral_engine_summary()
        assert abs(s["mp_over_me"] - 1836.15) < 0.05

    @pytest.mark.physics
    def test_eta_B_matches_planck(self):
        s = cathedral_engine_summary()
        assert abs(s["eta_B"] - 6.12e-10) / 6.12e-10 < 0.01

    @pytest.mark.physics
    def test_axion_mass_60_uev(self):
        s = cathedral_engine_summary()
        assert 60.0 < s["axion_mass_uev"] < 61.5

    @pytest.mark.physics
    def test_omega_m_is_4_over_13(self):
        s = cathedral_engine_summary()
        assert s["Omega_m"] == pytest.approx(4 / 13, abs=1e-12)

    @pytest.mark.physics
    def test_n_s_matches_planck_2018(self):
        s = cathedral_engine_summary()
        assert abs(s["n_s"] - 0.9649) < 0.005

    @pytest.mark.physics
    def test_alpha_s_MZ_matches_pdg(self):
        s = cathedral_engine_summary()
        assert abs(s["alpha_s_MZ"] - 0.118) < 0.005

    def test_reproducible_with_fixed_seed(self):
        a = cathedral_engine_summary(seed=42)
        b = cathedral_engine_summary(seed=42)
        assert a["consciousness_integration"] == b["consciousness_integration"]

    def test_consciousness_integration_is_positive(self):
        s = cathedral_engine_summary()
        assert s["consciousness_integration"] > 0
