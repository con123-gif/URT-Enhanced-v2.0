"""Tests for the BT8g Cathedral closures module."""
from fractions import Fraction
from math import factorial

from urt.shell_closure import D, q, V, N
from urt.bt8g_cathedral import (
    GAMMA, GAMMA_INV, M_q,
    ETA_G13, K_G13_PREFACTOR, BETA_SLOPE_COEFF,
    eta_g13_cathedral_factorisation,
    k_g13_cathedral_factorisation,
    k_eta_product,
    half_k_eta_potential_coefficient,
    c1_c2_ratio_is_minus_dstar,
    beta_slope_cathedral_factorisation,
    dstar_three_forms,
    quadratic_potential_at_dstar,
    all_bt8g_closures,
    bt8g_cathedral_audit_passes,
)


class TestConstants:
    def test_gamma_inv(self):
        assert GAMMA_INV == 81 == D ** (D + 1)

    def test_M_q(self):
        assert M_q == 31 == 2 ** q - 1

    def test_eta_value(self):
        assert ETA_G13 == Fraction(5508, 2821)


class TestEtaFactorisation:
    def test_numerator_is_4_81_17(self):
        f = eta_g13_cathedral_factorisation()
        assert f["numerator"] == 5508 == (D + 1) * 81 * (N + D + 1)

    def test_denominator_is_7_13_31(self):
        f = eta_g13_cathedral_factorisation()
        assert f["denominator"] == 2821 == (factorial(D) + 1) * N * M_q

    def test_factor_decomposition(self):
        f = eta_g13_cathedral_factorisation()
        assert f["matches_5508_2821"]


class TestKFactorisation:
    def test_numerator_is_2821(self):
        f = k_g13_cathedral_factorisation()
        assert f["numerator"] == 2821

    def test_denominator_is_918(self):
        f = k_g13_cathedral_factorisation()
        assert f["denominator"] == 918 == (D - 1) * D ** D * (N + D + 1)

    def test_factor_decomposition(self):
        f = k_g13_cathedral_factorisation()
        assert f["matches_2821_918"]


class TestKEtaProduct:
    def test_product_is_Dfact(self):
        """The new BT8g identity: 𝒦 · η = 6 = D!."""
        prod = K_G13_PREFACTOR * ETA_G13
        assert prod == factorial(D) == 6

    def test_first_cancellation_is_two(self):
        kep = k_eta_product()
        assert kep["first_cancellation"] == 2 == Fraction(D + 1, D - 1)

    def test_second_cancellation_is_D(self):
        kep = k_eta_product()
        assert kep["second_cancellation"] == D == Fraction(GAMMA_INV, D ** D)

    def test_derivation_matches_direct(self):
        kep = k_eta_product()
        assert kep["matches_derivation"]
        assert kep["equals_Dfact"]


class TestHalfKEtaPotentialCoefficient:
    def test_coefficient_is_D(self):
        """V_eff^(2) coefficient = (1/2) · 𝒦 · η = D = 3."""
        h = half_k_eta_potential_coefficient()
        assert h["coefficient"] == D == 3
        assert h["equals_D"]


class TestC1C2RatioMinusDstar:
    def test_identity_holds_60_digit(self):
        lhs, neg_dstar, ok = c1_c2_ratio_is_minus_dstar(precision_dps=60)
        assert ok

    def test_high_precision_match(self):
        import mpmath as mp
        saved = mp.mp.dps
        mp.mp.dps = 80
        try:
            lhs, neg_dstar, ok = c1_c2_ratio_is_minus_dstar(precision_dps=80)
            assert abs(lhs - neg_dstar) < mp.mpf("1e-70")
        finally:
            mp.mp.dps = saved


class TestBetaSlope:
    def test_slope_is_six_eta(self):
        assert BETA_SLOPE_COEFF == 6 * ETA_G13 == Fraction(33048, 2821)

    def test_slope_decomposition(self):
        bs = beta_slope_cathedral_factorisation()
        assert bs["matches"]
        assert bs["numerator"] == 33048
        assert bs["denominator"] == 2821


class TestDstarThreeForms:
    def test_all_three_forms_agree(self):
        d3 = dstar_three_forms(precision_dps=60)
        assert d3["all_three_match"]

    def test_matches_framework_dstar(self):
        """All three BT8g forms agree with the framework's DELTA_STAR."""
        from urt.shell_closure import DELTA_STAR
        import mpmath as mp
        d3 = dstar_three_forms(precision_dps=40)
        assert abs(float(d3["form_image_80pi_1053phi"]) - DELTA_STAR) < 1e-15


class TestQuadraticStability:
    def test_V_at_dstar_is_zero(self):
        qp = quadratic_potential_at_dstar()
        assert qp["V_at_dstar"] == 0

    def test_V_prime_at_dstar_is_zero(self):
        qp = quadratic_potential_at_dstar()
        assert qp["V_prime_at_dstar"] == 0

    def test_V_doubleprime_factor_is_Dfact(self):
        """V''(δ★) = D! · m²/κ² = 6 · m²/κ².  Stable minimum."""
        qp = quadratic_potential_at_dstar()
        assert qp["V_doubleprime_factor"] == factorial(D) == 6
        assert qp["V_doubleprime_eq_Dfact_times_msq_kappasq"]


class TestAggregateAudit:
    def test_audit_passes(self):
        assert bt8g_cathedral_audit_passes()

    def test_all_closures_structure(self):
        d = all_bt8g_closures()
        expected_keys = {
            "eta_factorisation",
            "K_factorisation",
            "K_eta_product",
            "half_K_eta_coeff",
            "c1_c2_eq_minus_dstar",
            "beta_slope_form",
            "dstar_three_forms",
            "quadratic_stability",
        }
        assert set(d.keys()) == expected_keys
