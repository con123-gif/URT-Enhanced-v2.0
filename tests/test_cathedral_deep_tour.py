"""Tests for the Cathedral Deep Tour — second-wave connections across
modular forms, stable homotopy, continued fractions, lattices, K-theory,
string theory, and Bernoulli numerators."""
from math import factorial
import pytest

from urt.cathedral_deep_tour import (
    heegner_j_cathedral_cubes,
    stable_homotopy_orders,
    continued_fraction_pi_opening,
    continued_fraction_e_pattern,
    the_2V_cluster,
    bott_periodicity,
    string_critical_dimensions,
    bernoulli_numerator_hits,
    all_deep_tour_audit,
    all_deep_tour_verify,
)


class TestHeegnerJCubes:
    def test_j_i_is_V_cubed(self):
        from urt.shell_closure import V
        assert heegner_j_cathedral_cubes()["j_i"] == V**3 == 1728

    def test_j_minus7_is_negative_Dq_cubed(self):
        from urt.shell_closure import D, q
        assert heegner_j_cathedral_cubes()["j_minus7"] == -(D * q)**3

    def test_j_minus8_is_F_cubed(self):
        from urt.shell_closure import F
        assert heegner_j_cathedral_cubes()["j_minus8"] == F**3

    def test_j_minus43_is_negative_16G_cubed(self):
        from urt.shell_closure import G
        assert heegner_j_cathedral_cubes()["j_minus43"] == -(16 * G)**3


class TestStableHomotopy:
    def test_pi_3_order_is_2V(self):
        from urt.shell_closure import V
        assert stable_homotopy_orders()["pi_3_s_order"] == 2 * V

    def test_pi_7_order_is_VF(self):
        from urt.shell_closure import V, F
        assert stable_homotopy_orders()["pi_7_s_order"] == V * F

    def test_pi_7_order_is_K4_G(self):
        from urt.shell_closure import D, G
        assert stable_homotopy_orders()["pi_7_s_order"] == (D + 1) * G

    def test_pi_7_order_equals_E8_root_count(self):
        assert stable_homotopy_orders()["pi_7_s_order"] == 240


class TestCFPiOpening:
    def test_a0_is_D(self):
        from urt.shell_closure import D
        assert continued_fraction_pi_opening()["CF_pi_a0"] == D

    def test_a1_is_D_factorial_plus_1(self):
        from urt.shell_closure import D
        assert continued_fraction_pi_opening()["CF_pi_a1"] == factorial(D) + 1

    def test_a2_is_D_times_q(self):
        from urt.shell_closure import D, q
        assert continued_fraction_pi_opening()["CF_pi_a2"] == D * q


class TestCFEPattern:
    def test_a3_is_D_minus_1(self):
        from urt.shell_closure import D
        assert continued_fraction_e_pattern()["CF_e_a3"] == D - 1

    def test_a6_is_D_plus_1(self):
        from urt.shell_closure import D
        assert continued_fraction_e_pattern()["CF_e_a6"] == D + 1

    def test_a9_is_D_factorial(self):
        from urt.shell_closure import D
        assert continued_fraction_e_pattern()["CF_e_a9"] == factorial(D)


class Test2VCluster:
    def test_K3_chi_is_2V(self):
        from urt.shell_closure import V
        assert the_2V_cluster()["K3_euler_chi"] == 2 * V

    def test_niemeier_count_is_2V(self):
        from urt.shell_closure import V
        assert the_2V_cluster()["n_niemeier_lattices"] == 2 * V

    def test_leech_dim_is_2V(self):
        from urt.shell_closure import V
        assert the_2V_cluster()["leech_dim"] == 2 * V

    def test_bosonic_string_is_2N(self):
        from urt.shell_closure import N
        assert the_2V_cluster()["bosonic_string_dim"] == 2 * N


class TestBottPeriodicity:
    def test_K_period_is_Dm1(self):
        from urt.shell_closure import D
        assert bott_periodicity()["K_period"] == D - 1

    def test_KO_period_is_2_to_the_D(self):
        from urt.shell_closure import D
        assert bott_periodicity()["KO_period"] == 2 ** D


class TestStringDimensions:
    def test_bosonic_dim_is_2N(self):
        from urt.shell_closure import N
        assert string_critical_dimensions()["bosonic_dim"] == 2 * N

    def test_super_dim_is_2q(self):
        from urt.shell_closure import q
        assert string_critical_dimensions()["super_dim"] == 2 * q

    def test_M_theory_dim_is_D_factorial_plus_q(self):
        from urt.shell_closure import D, q
        assert string_critical_dimensions()["M_theory_dim"] == factorial(D) + q


class TestBernoulliNumerators:
    def test_B10_numer_is_q(self):
        from urt.shell_closure import q
        assert bernoulli_numerator_hits()["B_10_numerator"] == q

    def test_B14_numer_is_D_factorial_plus_1(self):
        from urt.shell_closure import D
        assert bernoulli_numerator_hits()["B_14_numerator"] == factorial(D) + 1


class TestEndToEndAudit:
    def test_audit_returns_eight_clusters(self):
        a = all_deep_tour_audit()
        assert len(a) == 8

    def test_all_deep_tour_verify(self):
        assert all_deep_tour_verify()
