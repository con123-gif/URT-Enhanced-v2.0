"""Tests for the NS-form of the URT iteration on G_{13}."""
import math
import numpy as np

from urt.shell_closure import D, q, V, N, DELTA_STAR
from urt.ns_microscopic_exhaust import (
    NU, RE,
    laplacian_spectrum,
    sector_traces,
    dissipation_fractions,
    reynolds_number,
    mixing_time_continuous,
    mixing_time_hierarchy,
    ns_iteration_step,
    viscous_dissipation_rate,
    sector_dissipation,
    ns_microscopic_exhaust_audit,
    ns_microscopic_exhaust_audit_passes,
)


class TestViscosityAndReynolds:
    def test_viscosity_is_one_over_four_pi(self):
        assert NU == 1.0 / (4.0 * math.pi)

    def test_reynolds_equals_delta_star_over_viscosity(self):
        assert abs(RE - DELTA_STAR / NU) < 1e-15

    def test_reynolds_closed_form_4pi_delta_star(self):
        assert abs(RE - 4.0 * math.pi * DELTA_STAR) < 1e-15

    def test_reynolds_in_transition_regime(self):
        """Re ≈ O(1) — laminar-turbulent transition."""
        re = reynolds_number()
        assert 1.0 < re["Re"] < 10.0
        assert "transition" in re["regime"]


class TestSpectrumAndTraces:
    def test_spectrum_has_13_eigenvalues(self):
        eigs = laplacian_spectrum()
        assert len(eigs) == N == 13

    def test_spectrum_is_all_cathedral(self):
        """Every eigenvalue is in {0, 3, 5, 7, 9, 13}."""
        cathedral = {0, D, q, D + q - 1, D ** 2, N}    # {0, 3, 5, 7, 9, 13}
        assert set(int(e) for e in laplacian_spectrum()) <= cathedral

    def test_trace_K4_is_11(self):
        """tr(L|K_4) = 0+3+3+5 = 11."""
        assert sector_traces()["trace_K4"] == 11

    def test_trace_A5_is_61(self):
        """tr(L|A_5) = 5×5 + 7×2 + 9 + 13 = 61."""
        assert sector_traces()["trace_A5"] == 61

    def test_trace_total_is_DF_times_V(self):
        """tr(L) = 11 + 61 = 72 = D!·V."""
        from math import factorial
        assert sector_traces()["trace_total"] == 11 + 61 == factorial(D) * V == 72


class TestDissipationFractions:
    def test_K4_fraction_is_11_over_72(self):
        df = dissipation_fractions()
        assert abs(df["K4_fraction"] - 11 / 72) < 1e-15

    def test_A5_fraction_is_61_over_72(self):
        df = dissipation_fractions()
        assert abs(df["A5_fraction"] - 61 / 72) < 1e-15

    def test_A5_dominates(self):
        """The A_5 exhaust sector carries > 80 % of viscous dissipation."""
        df = dissipation_fractions()
        assert df["A5_fraction"] > 0.80

    def test_fractions_sum_to_one(self):
        df = dissipation_fractions()
        assert abs(df["K4_fraction"] + df["A5_fraction"] - 1.0) < 1e-15


class TestMixingHierarchy:
    def test_mixing_at_lambda_3_is_4pi_over_3(self):
        assert abs(mixing_time_continuous(3) - 4 * math.pi / 3) < 1e-15

    def test_mixing_at_lambda_5_is_4pi_over_5(self):
        assert abs(mixing_time_continuous(5) - 4 * math.pi / 5) < 1e-15

    def test_K4_slowest_is_at_lambda_D(self):
        """The slowest K_4 mode is the Fiedler eigenvalue λ = D = 3."""
        mh = mixing_time_hierarchy()
        assert abs(mh["tau_K4_slowest"] - 4 * math.pi / D) < 1e-15

    def test_A5_slowest_is_at_lambda_q(self):
        """The slowest A_5 mode is at λ = q = 5."""
        mh = mixing_time_hierarchy()
        assert abs(mh["tau_A5_slowest"] - 4 * math.pi / q) < 1e-15

    def test_ratio_is_q_over_D(self):
        """τ_K4_slowest / τ_A5_slowest = q/D = 5/3 = Kolmogorov ratio."""
        mh = mixing_time_hierarchy()
        assert abs(mh["ratio"] - q / D) < 1e-15
        assert abs(mh["ratio"] - 5 / 3) < 1e-15

    def test_ratio_equals_minus_kolmogorov_exponent(self):
        """The Kolmogorov inertial-range exponent is −5/3 = −q/D."""
        mh = mixing_time_hierarchy()
        assert abs(mh["ratio"] - (-mh["kolmogorov_exponent"])) < 1e-15


class TestNSIteration:
    def test_step_preserves_mean_for_zero_forcing(self):
        """Pure viscous step preserves the mean (incompressibility)."""
        rng = np.random.default_rng(42)
        delta = rng.uniform(0, 0.5, N)
        # one step, but at very late time so e^{-t/τ} ≈ 0 (forcing vanishes)
        delta1 = ns_iteration_step(delta, t=1000.0)
        assert abs(np.mean(delta) - np.mean(delta1)) < 1e-10

    def test_uniform_field_is_fixed_point_of_diffusion(self):
        """L acts trivially on the constant mode."""
        delta = np.full(N, DELTA_STAR)
        # at t=∞ the forcing vanishes; uniform δ★ is preserved exactly
        delta1 = ns_iteration_step(delta, t=1e6)
        assert np.allclose(delta1, delta, atol=1e-10)


class TestDissipation:
    def test_uniform_field_zero_dissipation(self):
        """Constant mode is in the kernel of L."""
        delta = np.ones(N)
        assert abs(viscous_dissipation_rate(delta)) < 1e-12

    def test_dissipation_nonneg(self):
        """ε(δ) = ν · δᵀ L δ ≥ 0 (L is PSD)."""
        rng = np.random.default_rng(42)
        for _ in range(20):
            delta = rng.standard_normal(N)
            assert viscous_dissipation_rate(delta) >= -1e-12

    def test_sector_dissipation_sums_to_total(self):
        rng = np.random.default_rng(42)
        delta = rng.standard_normal(N)
        sd = sector_dissipation(delta)
        total = viscous_dissipation_rate(delta)
        assert abs(sd["epsilon_total"] - total) < 1e-12

    def test_sector_fractions_sum_to_one(self):
        rng = np.random.default_rng(42)
        delta = rng.standard_normal(N)
        sd = sector_dissipation(delta)
        assert abs(sd["K4_fraction"] + sd["A5_fraction"] - 1.0) < 1e-12


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert ns_microscopic_exhaust_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = ns_microscopic_exhaust_audit()
        for key in ("viscosity", "reynolds", "sector_traces",
                    "dissipation_fractions", "mixing_hierarchy", "spectrum"):
            assert key in a

    def test_audit_spectrum_matches_function(self):
        a = ns_microscopic_exhaust_audit()
        assert a["spectrum"] == laplacian_spectrum().tolist()
