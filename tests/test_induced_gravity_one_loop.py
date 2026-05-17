"""
Tests for urt.induced_gravity_one_loop — Sakharov-Visser one-loop
induced gravity on G_{13} with Cathedral closed forms.

Headline closed forms:
  - det' L = γ⁻¹ · q^(D!) · (D!+1)² · N = 806,203,125
  - Λ²_match / M_Pl² = D! · π (the SV matching cutoff)
  - ζ_L(0) = V; ζ_L(-1) = D!·V = tr(L) = 72; ζ_L(-2) = tr(L²) = 516
"""
from math import pi, log, sqrt, factorial
import pytest

from urt.induced_gravity_one_loop import (
    G_N, M_PL_SQUARED, DELTA_STAR, GAMMA,
    SPECTRUM_NONZERO, spectrum_with_multiplicities,
    spectral_zeta, zeta_0_is_V, zeta_minus_one_is_trL,
    zeta_minus_two_is_trL2, zeta_one_rational,
    det_prime_L_closed_form, det_prime_L_numerical,
    det_prime_L_factorisation,
    log_det_prime_L, log_det_cathedral_closed_form,
    sakharov_visser_matching_scale_squared,
    sakharov_visser_matching_cathedral,
    induced_newton_constant,
    induced_gravity_matches_cathedral_GN,
    one_loop_effective_action,
    cathedral_mass_squared, cathedral_mass_squared_closed,
    heat_kernel_seeley_dewitt_coefficients,
    induced_gravity_summary,
    induced_gravity_audit_passes,
)


D, q_INT, V_INT, N_INT, F_INT = 3, 5, 12, 13, 20
D_FAC = factorial(D)   # = 6


# ── Spectrum ─────────────────────────────────────────────────────────────

class TestSpectrum:
    def test_spectrum_is_canonical(self):
        """Non-zero eigenvalues with multiplicities: {3(²), 5(⁶), 7(²), 9, 13}."""
        spec = dict(SPECTRUM_NONZERO)
        assert spec == {3: 2, 5: 6, 7: 2, 9: 1, 13: 1}

    def test_total_nonzero_count_is_V(self):
        total = sum(m for _, m in SPECTRUM_NONZERO)
        assert total == V_INT   # 12 = V

    def test_every_eigenvalue_is_cathedral(self):
        for lam, _ in SPECTRUM_NONZERO:
            assert lam in {D, q_INT, D_FAC + 1, D ** 2, N_INT}


# ── Spectral zeta function ──────────────────────────────────────────────

class TestSpectralZeta:
    def test_zeta_zero_is_V(self):
        assert int(spectral_zeta(0)) == V_INT
        assert zeta_0_is_V()

    def test_zeta_minus_one_is_trace_L(self):
        assert int(spectral_zeta(-1)) == D_FAC * V_INT   # = 72
        assert zeta_minus_one_is_trL()

    def test_zeta_minus_two_is_trace_L_squared(self):
        assert int(spectral_zeta(-2)) == 516
        assert zeta_minus_two_is_trL2() == 516

    def test_zeta_one_rational_form(self):
        num, den = zeta_one_rational()
        assert num == 9584
        assert den == 4095
        # The decimal value must match the explicit sum
        assert num / den == pytest.approx(spectral_zeta(1), rel=1e-14)

    def test_zeta_one_denominator_factorisation(self):
        """4095 = D² · q · (D!+1) · N = 9 · 5 · 7 · 13 (Cathedral)."""
        assert 4095 == D ** 2 * q_INT * (D_FAC + 1) * N_INT


# ── Functional determinant ──────────────────────────────────────────────

class TestFunctionalDeterminant:
    def test_det_prime_value(self):
        assert det_prime_L_numerical() == 806_203_125

    def test_det_prime_closed_form(self):
        det_closed = int(round(1 / GAMMA)) * q_INT ** D_FAC * (D_FAC + 1) ** 2 * N_INT
        assert det_closed == 806_203_125

    def test_det_prime_closed_equals_direct(self):
        assert det_prime_L_closed_form() == det_prime_L_numerical()

    def test_det_factorisation(self):
        """det' L = γ⁻¹ · q^(D!) · (D!+1)² · N = 81 · 5⁶ · 7² · 13."""
        det_value = 81 * 5 ** 6 * 7 ** 2 * 13
        assert det_value == det_prime_L_numerical()

    def test_log_det_matches(self):
        assert log_det_prime_L() == pytest.approx(
            log_det_cathedral_closed_form(), rel=1e-13
        )

    def test_log_det_closed_form_expansion(self):
        """log det' L = log(γ⁻¹) + D!·log q + 2·log(D!+1) + log N."""
        expected = log(1 / GAMMA) + D_FAC * log(q_INT) + 2 * log(D_FAC + 1) + log(N_INT)
        assert log_det_cathedral_closed_form() == pytest.approx(expected)


# ── Sakharov-Visser matching ────────────────────────────────────────────

class TestSakharovVisserMatching:
    def test_matching_scale_value(self):
        Lam_sq = sakharov_visser_matching_scale_squared()
        assert Lam_sq == pytest.approx(6 * pi / G_N)

    def test_matching_scale_over_MPl_is_DfacPi(self):
        """Λ² / M_Pl² = D!·π — the headline Cathedral closed form."""
        sv = sakharov_visser_matching_cathedral()
        assert sv["Lambda_over_MPl_squared"] == pytest.approx(D_FAC * pi)
        assert sv["matches_DfacPi"]

    def test_induced_G_N_matches_cathedral(self):
        assert induced_gravity_matches_cathedral_GN()

    def test_induced_G_N_formula(self):
        """G_N^ind = 6π / Λ² (standard SV one-loop result)."""
        for Lam_sq in (10.0, 100.0, 1000.0):
            assert induced_newton_constant(Lam_sq) == pytest.approx(6 * pi / Lam_sq)

    def test_matching_closes_loop(self):
        """If Λ² = D!·π/δ★², then G^ind = δ★² exactly."""
        Lam_sq = D_FAC * pi / G_N
        G_ind = induced_newton_constant(Lam_sq)
        assert G_ind == pytest.approx(G_N, rel=1e-15)

    def test_Lambda_match_is_4_34_MPl(self):
        """Λ_match ≈ √(6π)·M_Pl ≈ 4.34·M_Pl."""
        sv = sakharov_visser_matching_cathedral()
        ratio = sqrt(sv["Lambda_over_MPl_squared"])
        assert ratio == pytest.approx(sqrt(6 * pi))
        assert ratio == pytest.approx(4.342, rel=1e-3)


# ── δ-field mass and one-loop effective action ─────────────────────────

class TestEffectiveAction:
    def test_mass_squared_closed_form(self):
        M_sq = cathedral_mass_squared_closed()
        assert M_sq["closed_form"] == "1 + δ★²"
        assert M_sq["M_squared"] == pytest.approx(1 + DELTA_STAR ** 2)

    def test_mass_squared_value(self):
        """V''(δ★) = 1 + δ★² ≈ 1.022."""
        assert cathedral_mass_squared() == pytest.approx(1 + DELTA_STAR ** 2)

    def test_one_loop_zero_mass_is_log_det(self):
        """At M² = 0, Γ_1 = (1/2)·log det' L."""
        assert one_loop_effective_action(M_squared=0.0) == pytest.approx(
            0.5 * log_det_prime_L()
        )

    def test_one_loop_positive_mass_shifts_action(self):
        Gamma_0 = one_loop_effective_action(M_squared=0.0)
        Gamma_1 = one_loop_effective_action(M_squared=0.5)
        # log(λ + M²) > log(λ) ⇒ Γ_1 increases with M²
        assert Gamma_1 > Gamma_0


# ── Seeley-DeWitt heat-kernel coefficients ─────────────────────────────

class TestSeeleyDeWitt:
    def test_a_0_is_N(self):
        sd = heat_kernel_seeley_dewitt_coefficients()
        assert sd["a_0_volume"] == N_INT

    def test_a_1_is_DfacV(self):
        sd = heat_kernel_seeley_dewitt_coefficients()
        assert sd["a_1_curvature"] == D_FAC * V_INT   # = 72

    def test_a_2_is_516(self):
        sd = heat_kernel_seeley_dewitt_coefficients()
        assert sd["a_2_R_squared"] == 516

    def test_coefficients_match_traces(self):
        """a_1 = tr(L), a_2 = tr(L²)."""
        sd = heat_kernel_seeley_dewitt_coefficients()
        assert sd["a_1_curvature"] == sd["trace_L"]
        assert sd["a_2_R_squared"] == sd["trace_L_squared"]


# ── Summary ──────────────────────────────────────────────────────────────

class TestSummary:
    def test_summary_keys(self):
        s = induced_gravity_summary()
        required = {
            "spectral_zeta", "spectral_zeta_closed",
            "functional_determinant", "delta_field_mass",
            "matching_scale", "induced_G_N", "seeley_dewitt",
            "audit_passes",
        }
        assert required <= set(s.keys())

    def test_summary_passes(self):
        s = induced_gravity_summary()
        assert s["audit_passes"]

    def test_induced_G_N_in_summary_matches_target(self):
        s = induced_gravity_summary()
        assert s["induced_G_N"]["matches_G_N"]


# ── End-to-end CI gate ───────────────────────────────────────────────────

def test_audit_passes():
    assert induced_gravity_audit_passes()
