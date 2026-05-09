"""Tests for the Cathedral Modular Tour — third-wave connections in
modular forms, invariant theory, modular curves, J-homomorphism, and
class number theory."""
from math import factorial, sqrt
import pytest

from urt.cathedral_modular_tour import (
    eisenstein_leading_coefficients,
    modular_discriminant_weight,
    E8_theta_coefficients,
    a5_invariant_ring_degrees,
    modular_curve_X013,
    j_homomorphism_completeness,
    cathedral_class_numbers,
    golden_ratio_in_A5_character_table,
    all_modular_tour_audit,
    all_modular_tour_verify,
)


class TestEisensteinCoefficients:
    def test_E4_coef_is_VF_equals_E8_root_count(self):
        from urt.shell_closure import V, F
        assert eisenstein_leading_coefficients()["E4_coef"] == V * F == 240

    def test_E4_coef_is_K4_G(self):
        from urt.shell_closure import D, G
        assert eisenstein_leading_coefficients()["E4_coef"] == (D + 1) * G

    def test_E6_coef_is_2pD_times_GpD(self):
        from urt.shell_closure import D, G
        assert eisenstein_leading_coefficients()["E6_coef"] == 2**D * (G + D)

    def test_E8_coef_is_2VF(self):
        from urt.shell_closure import V, F
        assert eisenstein_leading_coefficients()["E8_coef"] == 2 * V * F


class TestModularDiscriminantWeight:
    def test_weight_is_V(self):
        from urt.shell_closure import V
        assert modular_discriminant_weight()["delta_weight"] == V

    def test_exponent_is_2V(self):
        from urt.shell_closure import V
        assert modular_discriminant_weight()["exponent_in_product"] == 2 * V


class TestE8Theta:
    def test_q1_coef_is_VF(self):
        from urt.shell_closure import V, F
        assert E8_theta_coefficients()["coef_q1"] == V * F

    def test_q2_coef_is_DD_VF(self):
        from urt.shell_closure import D, V, F
        assert E8_theta_coefficients()["coef_q2"] == D * D * V * F

    def test_q3_coef_is_sigmaV_VF(self):
        """6720 = σ(V) · V · F = 28 · 240."""
        from urt.shell_closure import V, F
        assert E8_theta_coefficients()["coef_q3"] == 28 * V * F


class TestA5InvariantRing:
    def test_generator_degrees_are_2_6_10_15(self):
        assert a5_invariant_ring_degrees()["degrees"] == [2, 6, 10, 15]

    def test_degree_2_is_Dm1(self):
        from urt.shell_closure import D
        d = a5_invariant_ring_degrees()
        assert d["degrees"][0] == D - 1

    def test_degree_6_is_D_factorial(self):
        from urt.shell_closure import D
        d = a5_invariant_ring_degrees()
        assert d["degrees"][1] == factorial(D)

    def test_degree_10_is_2q(self):
        from urt.shell_closure import q
        assert a5_invariant_ring_degrees()["degrees"][2] == 2 * q

    def test_degree_15_is_Dq(self):
        from urt.shell_closure import D, q
        assert a5_invariant_ring_degrees()["degrees"][3] == D * q


class TestModularCurveX013:
    def test_N_in_genus_0_list(self):
        assert modular_curve_X013()["N_in_genus_0_list"]

    def test_n_cusps_is_Dm1(self):
        from urt.shell_closure import D
        assert modular_curve_X013()["n_cusps_X013"] == D - 1


class TestJHomomorphism:
    def test_image_pi3s_is_2V(self):
        from urt.shell_closure import V
        assert j_homomorphism_completeness()["J_image_pi3s"] == 2 * V

    def test_image_pi7s_is_VF(self):
        from urt.shell_closure import V, F
        assert j_homomorphism_completeness()["J_image_pi7s"] == V * F

    def test_J_is_surjective_on_pi3_and_pi7(self):
        a = j_homomorphism_completeness()
        assert a["J_surjective_pi3s"]
        assert a["J_surjective_pi7s"]


class TestClassNumbers:
    def test_h_minus_3_is_one(self):
        assert cathedral_class_numbers()["h_minus_3"] == 1

    def test_class_numbers_match_documented_pattern(self):
        a = cathedral_class_numbers()
        assert a["h_minus_5_is_Dm1"]
        assert a["h_minus_13_is_Dm1"]
        assert a["h_minus_15_is_Dm1"]
        assert a["h_minus_20_is_Dm1"]
        assert a["h_minus_30_is_Dp1"]


class TestGoldenRatioInA5CharTable:
    def test_phi_value(self):
        a = golden_ratio_in_A5_character_table()
        assert abs(a["phi_value"] - (1 + sqrt(5)) / 2) < 1e-15

    def test_smallest_n_is_q(self):
        from urt.shell_closure import q
        a = golden_ratio_in_A5_character_table()
        assert a["smallest_n_with_phi_in_An"] == q
        assert a["smallest_n_is_q"]


class TestEndToEndAudit:
    def test_audit_returns_eight_clusters(self):
        a = all_modular_tour_audit()
        assert len(a) == 8

    def test_all_modular_tour_verify(self):
        assert all_modular_tour_verify()
