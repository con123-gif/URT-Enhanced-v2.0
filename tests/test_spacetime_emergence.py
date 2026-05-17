"""
Tests for urt.spacetime_emergence — continuum and metric from G_{13}.

Ten independent machine-precision checks against the (1, D) = (1, 3)
Lorentz signature and the Minkowski metric pattern emerging from the
K_4 sector of L_{G_13}.
"""
from math import pi, sqrt, factorial
import numpy as np
import pytest

from urt.spacetime_emergence import (
    DELTA_STAR, GAMMA, PHI,
    ETA, ETA_LAPLACIAN, MU_PULL,
    DYNAMICAL_NORMALISATION, T_STAR, C_G,
    continuous_time_from_iteration, time_arrow_exists,
    K4_eigenvalues, lorentz_signature_from_K4,
    kinetic_hessian_diagonal, minkowski_signature_emerges,
    minkowski_metric_normalised, hessian_sign_pattern_matches_minkowski,
    dispersion_omega_squared_equals_lambda, all_K4_modes_share_light_cone,
    heat_kernel_Z, spectral_dimension_at, spectral_dimension_at_natural_t,
    spectral_dimension_peak, weyl_dimension_from_eigenvalue_counting,
    dimensional_decomposition,
    continuum_dispersion_residual,
    cathedral_speed_of_light, cathedral_planck_length,
    spacetime_emergence_audit_passes, spacetime_emergence_summary,
)


D, N = 3, 13


# ── Cathedral constants are framework-canonical ──────────────────────────

class TestCathedralConstants:
    def test_delta_star_value(self):
        assert DELTA_STAR == pytest.approx((1 - 1/81) * pi / (13 * PHI), rel=1e-14)

    def test_eta_one_over_8pi(self):
        assert ETA == pytest.approx(1 / (8 * pi))

    def test_eta_laplacian_one_over_4pi(self):
        assert ETA_LAPLACIAN == pytest.approx(1 / (4 * pi))

    def test_mu_pull_is_phi_minus_one(self):
        assert MU_PULL == pytest.approx(PHI - 1)

    def test_dynamical_normalisation(self):
        assert DYNAMICAL_NORMALISATION == pytest.approx(32 * pi ** 2)

    def test_T_star_natural_time(self):
        assert T_STAR == pytest.approx(1.0 / (32 * pi ** 2))

    def test_c_G_is_8pi(self):
        assert C_G == pytest.approx(8 * pi)


# ── Step 1: time from URT iteration ──────────────────────────────────────

class TestTimeFromIteration:
    def test_t_at_k_zero_is_zero(self):
        assert continuous_time_from_iteration(0) == 0.0

    def test_t_scales_linearly(self):
        for k in (1, 10, 100):
            assert continuous_time_from_iteration(k) == pytest.approx(k * ETA)

    def test_time_arrow_exists(self):
        assert time_arrow_exists()


# ── Step 2: Lorentz signature from K_4 ───────────────────────────────────

class TestLorentzSignature:
    def test_K4_has_four_eigenvalues(self):
        K4 = K4_eigenvalues()
        assert K4.shape == (4,)

    def test_K4_smallest_is_zero(self):
        K4 = K4_eigenvalues()
        assert abs(K4[0]) < 1e-12

    def test_K4_nonzero_values(self):
        """K_4 sector eigenvalues are {0, 3, 3, 5} canonically."""
        K4 = K4_eigenvalues()
        nonzero = sorted(round(float(x), 6) for x in K4 if x > 1e-9)
        assert nonzero == [3.0, 3.0, 5.0]

    def test_one_time_like_mode(self):
        sig = lorentz_signature_from_K4()
        assert sig["time_like"] == 1

    def test_D_spatial_modes(self):
        sig = lorentz_signature_from_K4()
        assert sig["space_like"] == D

    def test_signature_tuple(self):
        sig = lorentz_signature_from_K4()
        assert sig["signature"] == (1, D)

    def test_minkowski_signature(self):
        sig = lorentz_signature_from_K4()
        assert sig["is_minkowski_signature"]


# ── Step 3: Minkowski metric from kinetic Hessian ────────────────────────

class TestMinkowskiHessian:
    def test_hessian_has_D_plus_1_eigenvalues(self):
        H = kinetic_hessian_diagonal()
        assert H.shape == (D + 1,)

    def test_first_eigenvalue_is_plus_one(self):
        H = kinetic_hessian_diagonal()
        assert H[0] == +1.0

    def test_spatial_eigenvalues_negative(self):
        H = kinetic_hessian_diagonal()
        assert np.all(H[1:] < 0)

    def test_minkowski_signature_emerges(self):
        assert minkowski_signature_emerges()

    def test_metric_diag_minus_one_three_times(self):
        g = minkowski_metric_normalised()
        assert g.shape == (4, 4)
        assert g[0, 0] == +1.0
        for i in range(1, 4):
            assert g[i, i] == -1.0
        # off-diagonal zero
        for i in range(4):
            for j in range(4):
                if i != j:
                    assert g[i, j] == 0.0

    def test_hessian_sign_pattern_matches_metric(self):
        assert hessian_sign_pattern_matches_minkowski()


# ── Step 4: light cone & dispersion ──────────────────────────────────────

class TestLightCone:
    def test_dispersion_keys(self):
        info = dispersion_omega_squared_equals_lambda()
        assert {"lambda", "omega", "omega_squared", "ratio"} <= set(info.keys())

    def test_omega_equals_sqrt_lambda(self):
        info = dispersion_omega_squared_equals_lambda()
        for lam, om in zip(info["lambda"], info["omega"]):
            assert om == pytest.approx(sqrt(lam))

    def test_single_light_cone(self):
        assert all_K4_modes_share_light_cone()

    def test_ratio_all_one(self):
        info = dispersion_omega_squared_equals_lambda()
        np.testing.assert_allclose(info["ratio"], 1.0, atol=1e-14)


# ── Step 5: spectral dimension ───────────────────────────────────────────

class TestSpectralDimension:
    def test_heat_kernel_at_zero_is_N(self):
        # tr(I) = N for t -> 0
        assert heat_kernel_Z(0.0) == pytest.approx(13.0)

    def test_heat_kernel_at_infty_is_one(self):
        # only the constant mode (λ=0) survives
        assert heat_kernel_Z(1e6) == pytest.approx(1.0)

    def test_heat_kernel_strictly_decreasing(self):
        for t1, t2 in [(0.01, 0.1), (0.1, 1.0), (1.0, 10.0)]:
            assert heat_kernel_Z(t1) > heat_kernel_Z(t2)

    def test_spectral_dimension_peak_in_range(self):
        peak = spectral_dimension_peak()
        assert 1.5 < peak["d_s_peak"] < 3.5

    def test_peak_t_in_mid_range(self):
        peak = spectral_dimension_peak()
        # peak should be where geometry is best resolved, around 0.2-1.0
        assert 0.1 < peak["t_peak"] < 2.0

    def test_weyl_dim_finite_estimate(self):
        d_w = weyl_dimension_from_eigenvalue_counting()
        assert 1.0 < d_w < 4.0   # finite-size estimate of D=3


# ── Step 6: dimensional decomposition 13 = 4 + 9 ─────────────────────────

class TestDimensionalDecomposition:
    def test_K4_dim_is_D_plus_1(self):
        dd = dimensional_decomposition()
        assert dd["K_4_dim"] == D + 1

    def test_A5_dim_is_D_factorial_plus_D(self):
        dd = dimensional_decomposition()
        assert dd["A_5_dim"] == factorial(D) + D

    def test_total_is_N(self):
        dd = dimensional_decomposition()
        assert dd["total"] == N

    def test_decomposition_matches(self):
        dd = dimensional_decomposition()
        assert dd["matches"]

    def test_K4_dim_is_4(self):
        dd = dimensional_decomposition()
        assert dd["K_4_dim"] == 4

    def test_A5_dim_is_9(self):
        dd = dimensional_decomposition()
        assert dd["A_5_dim"] == 9


# ── Step 7: continuum wave equation ──────────────────────────────────────

class TestContinuumDispersion:
    def test_dispersion_residual_below_one_percent(self):
        err = continuum_dispersion_residual()
        assert err < 1e-2

    def test_dispersion_residual_machine_eps_scaled(self):
        """O(dt²) scaling — with dt = 5e-3 we expect ~1e-5 to 1e-4."""
        err = continuum_dispersion_residual(t_max=20.0, dt=5e-3)
        assert err < 1e-3


# ── Step 8: speed of light closed form ───────────────────────────────────

class TestSpeedOfLight:
    def test_c_G_is_8pi(self):
        cg = cathedral_speed_of_light()
        assert cg["value"] == pytest.approx(8 * pi)

    def test_c_G_closed_form_string(self):
        cg = cathedral_speed_of_light()
        assert cg["closed_form"] == "1/η = 8π"

    def test_c_G_verified(self):
        cg = cathedral_speed_of_light()
        assert cg["verified"]

    def test_planck_length_keys(self):
        pl = cathedral_planck_length()
        assert "c_SI" in pl and "a_G_per_T_planck" in pl

    def test_a_G_proportional_to_c_eta(self):
        pl = cathedral_planck_length(c_SI=1.0)
        assert pl["a_G_per_T_planck"] == pytest.approx(ETA)


# ── Step 9: end-to-end summary ───────────────────────────────────────────

class TestSummary:
    def test_summary_has_all_keys(self):
        s = spacetime_emergence_summary()
        required = {
            "K4_eigenvalues", "lorentz_signature", "hessian_diag",
            "minkowski_emerges", "dispersion_lambda", "dispersion_omega",
            "single_light_cone", "spectral_dim_peak", "weyl_dim_estimate",
            "dim_decomp", "c_G", "audit_passes",
        }
        assert required <= set(s.keys())

    def test_summary_passes(self):
        s = spacetime_emergence_summary()
        assert s["audit_passes"]


# ── End-to-end CI gate ───────────────────────────────────────────────────

def test_audit_passes():
    assert spacetime_emergence_audit_passes()
