"""Tests for the Cathedral Geometric-Combinatorial Tour — fifth-wave
connections in algebraic geometry, polyhedral geometry, discrete
geometry, combinatorics, number theory, knot theory, topology."""
from math import factorial
import pytest

from urt.cathedral_geometric_tour import (
    del_pezzo_minus_one_curves,
    platonic_schlafli_symbols,
    kissing_numbers_all_cathedral,
    euler_totient_at_N_is_V,
    latin_squares_at_D,
    small_knot_invariants,
    hopf_fibration_dimensions,
    all_geometric_tour_audit,
    all_geometric_tour_verify,
)


class TestDelPezzo:
    def test_d1_is_VF(self):
        from urt.shell_closure import V, F
        assert del_pezzo_minus_one_curves()["counts"][1] == V * F == 240

    def test_d3_is_DpD(self):
        from urt.shell_closure import D
        assert del_pezzo_minus_one_curves()["counts"][3] == D ** D == 27

    def test_d4_is_2_to_Dp1(self):
        from urt.shell_closure import D
        assert del_pezzo_minus_one_curves()["counts"][4] == 2 ** (D + 1) == 16

    def test_d5_is_2q(self):
        from urt.shell_closure import q
        assert del_pezzo_minus_one_curves()["counts"][5] == 2 * q == 10

    def test_d6_is_D_factorial(self):
        from urt.shell_closure import D
        assert del_pezzo_minus_one_curves()["counts"][6] == factorial(D) == 6


class TestPlatonicSchlafli:
    def test_tetrahedron_is_DD(self):
        from urt.shell_closure import D
        assert platonic_schlafli_symbols()["tetrahedron"][1] == (D, D)

    def test_icosahedron_is_Dq(self):
        from urt.shell_closure import D, q
        assert platonic_schlafli_symbols()["icosahedron"][1] == (D, q)

    def test_dodecahedron_is_qD(self):
        from urt.shell_closure import D, q
        assert platonic_schlafli_symbols()["dodecahedron"][1] == (q, D)

    def test_all_five_are_Cathedral(self):
        assert platonic_schlafli_symbols()["all_Cathedral"]


class TestKissingNumbers:
    def test_K_3_is_V(self):
        from urt.shell_closure import V
        assert kissing_numbers_all_cathedral()["K_3"]["value"] == V

    def test_K_4_is_2V(self):
        from urt.shell_closure import V
        assert kissing_numbers_all_cathedral()["K_4"]["value"] == 2 * V

    def test_K_8_is_VF(self):
        from urt.shell_closure import V, F
        assert kissing_numbers_all_cathedral()["K_8"]["value"] == V * F

    def test_K_7_is_2G_plus_D_factorial(self):
        from urt.shell_closure import D, G
        assert (
            kissing_numbers_all_cathedral()["K_7"]["value"] == 2 * G + factorial(D)
        )

    def test_K_2_is_D_factorial(self):
        from urt.shell_closure import D
        assert kissing_numbers_all_cathedral()["K_2"]["value"] == factorial(D)


class TestEulerTotient:
    def test_phi_N_is_V(self):
        from urt.shell_closure import V
        assert euler_totient_at_N_is_V()["phi_N"] == V

    def test_phi_F_is_2_to_D(self):
        from urt.shell_closure import D
        assert euler_totient_at_N_is_V()["phi_F"] == 2 ** D

    def test_phi_81_is_2_DpD(self):
        from urt.shell_closure import D
        assert euler_totient_at_N_is_V()["phi_81"] == 2 * D ** D == 54


class TestLatinSquares:
    def test_L_3_is_V(self):
        """The number of 3×3 Latin squares is exactly V = 12."""
        from urt.shell_closure import V
        assert latin_squares_at_D()["L_D"] == V


class TestKnotInvariants:
    def test_trefoil_crossings_is_D(self):
        from urt.shell_closure import D
        assert small_knot_invariants()["trefoil_crossings"] == D

    def test_trefoil_det_is_D(self):
        from urt.shell_closure import D
        assert small_knot_invariants()["trefoil_det"] == D

    def test_figure_8_det_is_q(self):
        from urt.shell_closure import q
        assert small_knot_invariants()["figure_8_det"] == q

    def test_figure_8_crossings_is_Dp1(self):
        from urt.shell_closure import D
        assert small_knot_invariants()["figure_8_crossings"] == D + 1


class TestHopfFibrations:
    def test_targets_are_1_2_4_8(self):
        assert hopf_fibration_dimensions()["targets"] == [1, 2, 4, 8]

    def test_dim_2_is_Dm1(self):
        from urt.shell_closure import D
        assert hopf_fibration_dimensions()["dim_2_is_Dm1"]
        assert 2 == D - 1

    def test_dim_4_is_Dp1(self):
        from urt.shell_closure import D
        assert 4 == D + 1

    def test_dim_8_is_2_to_D(self):
        from urt.shell_closure import D
        assert 8 == 2 ** D


class TestEndToEndAudit:
    def test_audit_returns_seven_clusters(self):
        a = all_geometric_tour_audit()
        assert len(a) == 7

    def test_all_geometric_tour_verify(self):
        assert all_geometric_tour_verify()
