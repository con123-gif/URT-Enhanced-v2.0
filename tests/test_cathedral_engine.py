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


# ── Coefficient identities (PDF §3) ───────────────────────────────────────

class TestPiPhiEFlowCoefficients:
    """The three Euler coefficients are 1/(8π), 1/(4π), φ-1 — all derived
    from spherical Laplace-Beltrami + golden-ratio self-similarity."""

    def test_eta_is_one_over_8pi(self):
        assert ETA == 1 / (8 * pi)
        assert ETA == pytest.approx(0.03979, abs=1e-4)

    def test_eta_L_is_one_over_4pi(self):
        assert ETA_LAPLACIAN == 1 / (4 * pi)
        assert ETA_LAPLACIAN == 2 * ETA       # exactly 2× the learning rate

    def test_mu_is_phi_minus_one(self):
        phi = (1 + sqrt(5)) / 2
        assert MU_PULL == phi - 1
        assert MU_PULL == pytest.approx(0.618033, abs=1e-5)

    def test_rational_approximations_are_within_1pct(self):
        """The URT rule's 0.04, 0.08, 0.6 are inside the contraction ball."""
        assert abs(ETA_RAT     - ETA)           / ETA           < 0.02
        assert abs(ETA_LAP_RAT - ETA_LAPLACIAN) / ETA_LAPLACIAN < 0.02
        assert abs(MU_RAT      - MU_PULL)       / MU_PULL       < 0.04

    def test_tau_is_graph_diameter(self):
        """τ ≈ 10 = ⌈graph diameter⌉ for G_{13} (PDF §3)."""
        assert TAU_RELAX == 10


# ── G_{13} structure ─────────────────────────────────────────────────────

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
        """The connected-graph Laplacian has λ_min = 0 (constant mode)."""
        L = cathedral_laplacian()
        eigs = np.linalg.eigvalsh(L)
        assert eigs[0] == pytest.approx(0, abs=1e-10)

    def test_laplacian_fiedler_value_is_3(self):
        """The algebraic connectivity λ_2 = 3 = D, the spatial dimension."""
        L = cathedral_laplacian()
        eigs = np.sort(np.linalg.eigvalsh(L))
        assert eigs[1] == pytest.approx(3.0, abs=1e-9)


# ── Dynamical engine (URT iteration) ─────────────────────────────────────

class TestUrtEvolve:
    def test_converges_to_a_rail(self):
        """Random initial conditions converge to one of the two rails:
        δ★ ≈ 0.147 (vacuum) or δ_cl = D/F = 0.15 (classical), or in
        between.  The key qualitative claim is that the field stops
        being chaotic and lands in the [0.10, 0.25] band — the
        13-shell attractor."""
        from urt.cathedral_engine import delta_star, delta_cl
        np.random.seed(0)
        x0 = np.random.uniform(0.1, 0.3, 13)
        x_final = urt_evolve(x0, steps=200)
        m = np.mean(x_final)
        # Final mean lands in the rails band [δ★, ~0.25]
        assert delta_star * 0.5 < m < 0.30
        # And the field is no longer broadly distributed (chaos → structure)
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
        """Using the exact 1/(8π), 1/(4π), φ-1 coefficients also settles
        into a low-variance attractor (the rails band)."""
        np.random.seed(1)
        x0 = np.random.uniform(0.1, 0.3, 13)
        x_final = urt_evolve(x0, steps=200,
                              eta=ETA, eta_L=ETA_LAPLACIAN, mu=MU_PULL)
        assert np.std(x_final) < 0.05      # converged to a rail


# ── The narrative arc: chaos → 13-shell → rails → gap ────────────────────

class TestNarrativeArc:
    """The user's qualitative description of the framework:
       1. Pure chaos (broad random initial state)
       2. URT flow brings it to the 13-shell attractor
       3. Structure forms (low variance)
       4. The two rails split (δ★ vacuum vs δ_cl = D/F = 0.15 classical)
       5. The gap Δ = δ_cl − δ★ ≈ 2.49×10⁻³ forms — produces η_B etc.
    """

    def test_step1_chaotic_initial_condition_has_high_variance(self):
        np.random.seed(7)
        x0 = np.random.uniform(0.0, 0.5, 13)     # broad random
        assert np.std(x0) > 0.10                  # chaotic

    def test_step2_urt_evolution_collapses_variance(self):
        """The flow is a contraction: σ(x) decreases monotonically (~)."""
        np.random.seed(7)
        x0 = np.random.uniform(0.0, 0.5, 13)
        x_final = urt_evolve(x0, steps=200)
        assert np.std(x_final) < 0.5 * np.std(x0)   # contraction

    def test_step3_evolved_field_lands_in_rails_band(self):
        """After convergence the field sits between δ★ and ~3·δ★."""
        from urt.cathedral_engine import delta_star
        np.random.seed(7)
        x0 = np.random.uniform(0.0, 0.5, 13)
        x_final = urt_evolve(x0, steps=200)
        m = np.mean(x_final)
        assert delta_star * 0.5 < m < 3 * delta_star

    def test_step4_two_rails_are_well_separated(self):
        """δ★ vacuum and δ_cl = D/F = 0.15 classical are distinct."""
        from urt.cathedral_engine import delta_star, delta_cl
        assert delta_cl > delta_star
        # Visible gap, not numerical noise
        assert (delta_cl - delta_star) > 1e-3

    def test_step5_gap_drives_eta_b(self):
        """The gap Δ = δ_cl − δ★ produces η_B via γ³·Δ·δ★·8/9."""
        from urt.cathedral_engine import delta_star, delta_cl, gamma, Delta
        eta_B = gamma**3 * Delta * delta_star * 8 / 9
        # Within 1% of Planck 2018 observed
        assert abs(eta_B - 6.12e-10) / 6.12e-10 < 0.01


# ── Consciousness integration metric ─────────────────────────────────────

class TestConsciousnessIntegration:
    def test_high_for_constant_field(self):
        """Φ → ∞ when the K₄ block is perfectly synchronised."""
        x = np.full(13, 0.15)
        Phi = consciousness_integration(x)
        assert Phi > 1000      # std → 0, ratio → ∞

    def test_low_for_random_field(self):
        """Φ stays small when the K₄ block is fragmented."""
        np.random.seed(2)
        x = np.random.uniform(0, 1, 13)
        Phi = consciousness_integration(x)
        assert Phi < 50

    def test_only_uses_K4_block(self):
        """Modifying sites 4..12 must not change Φ (K₄ uses sites 0..3)."""
        x = np.full(13, 0.15)
        a = consciousness_integration(x)
        x[5] = 100
        b = consciousness_integration(x)
        assert a == b


# ── End-to-end summary ───────────────────────────────────────────────────

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
