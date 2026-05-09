"""Tests for the Cathedral Quantum-Lie Tour — fourth-wave connections
in quantum groups, sporadic groups, free Lie algebras, root systems,
Galois theory, and modular form dimensions."""
from math import factorial, sqrt
import pytest

from urt.cathedral_quantum_lie_tour import (
    su2_D_quantum_dimensions,
    sporadic_group_factorizations,
    free_lie_algebra_self_reference,
    lie_root_counts_all_cathedral,
    galois_a5_minimality,
    cusp_form_dimension_at_N,
    all_quantum_lie_tour_audit,
    all_quantum_lie_tour_verify,
)


class TestSU2DQuantumDimensions:
    def test_dim_2_is_phi(self):
        from math import sqrt
        phi = (1 + sqrt(5)) / 2
        a = su2_D_quantum_dimensions()
        assert abs(a["quantum_dimensions"][1] - phi) < 1e-12

    def test_dim_3_is_phi(self):
        from math import sqrt
        phi = (1 + sqrt(5)) / 2
        a = su2_D_quantum_dimensions()
        assert abs(a["quantum_dimensions"][2] - phi) < 1e-12

    def test_dim_1_and_4_are_one(self):
        a = su2_D_quantum_dimensions()
        assert abs(a["quantum_dimensions"][0] - 1) < 1e-12
        assert abs(a["quantum_dimensions"][3] - 1) < 1e-12


class TestSporadicGroupFactorizations:
    def test_M11_factorization(self):
        from urt.shell_closure import D, q
        assert 2**(D+1) * D**2 * q * 11 == 7920

    def test_M12_is_V_times_M11(self):
        from urt.shell_closure import V
        assert V * 7920 == 95040

    def test_M24_factorization(self):
        from urt.shell_closure import D, q
        assert 2**(2*q) * D**3 * q * 7 * 11 * 23 == 244823040


class TestFreeLieAlgebraSelfReference:
    def test_L1_D_equals_D(self):
        from urt.shell_closure import D
        assert free_lie_algebra_self_reference()["L_1_D"] == D

    def test_L2_D_equals_D(self):
        from urt.shell_closure import D
        assert free_lie_algebra_self_reference()["L_2_D"] == D

    def test_L3_D_equals_2_to_D(self):
        from urt.shell_closure import D
        assert free_lie_algebra_self_reference()["L_3_D"] == 2 ** D


class TestLieRootCountsCathedral:
    def test_G2_roots_is_V(self):
        from urt.shell_closure import V
        assert lie_root_counts_all_cathedral()["G_2"]["roots"] == V

    def test_A4_roots_is_F(self):
        from urt.shell_closure import F
        assert lie_root_counts_all_cathedral()["A_4"]["roots"] == F

    def test_A5_roots_is_E(self):
        from urt.shell_closure import E
        assert lie_root_counts_all_cathedral()["A_5"]["roots"] == E

    def test_D4_roots_is_2V(self):
        from urt.shell_closure import V
        assert lie_root_counts_all_cathedral()["D_4"]["roots"] == 2 * V

    def test_E6_roots_is_D_factorial_V(self):
        from urt.shell_closure import D, V
        assert lie_root_counts_all_cathedral()["E_6"]["roots"] == factorial(D) * V

    def test_E7_roots_is_2G_plus_D_factorial(self):
        """126 = 2G + D!."""
        from urt.shell_closure import D, G
        assert lie_root_counts_all_cathedral()["E_7"]["roots"] == 2 * G + factorial(D)

    def test_E8_roots_is_VF(self):
        from urt.shell_closure import V, F
        assert lie_root_counts_all_cathedral()["E_8"]["roots"] == V * F

    def test_all_eleven_root_systems_are_cathedral(self):
        for name, v in lie_root_counts_all_cathedral().items():
            assert v["match"], f"{name} doesn't match its Cathedral form"


class TestGaloisA5Minimality:
    def test_G_is_60(self):
        from urt.shell_closure import G
        assert G == 60

    def test_smallest_insoluble_polynomial_degree_is_q(self):
        from urt.shell_closure import q
        a = galois_a5_minimality()
        assert a["smallest_insoluble_polynomial_degree"] == q


class TestCuspFormDim:
    def test_dim_S2_Gamma0_13_is_zero(self):
        a = cusp_form_dimension_at_N()
        assert a["dim_S2_Gamma0_N"] == 0

    def test_genus_X0_13_is_zero(self):
        a = cusp_form_dimension_at_N()
        assert a["genus_X0_N"] == 0


class TestEndToEndAudit:
    def test_audit_returns_six_clusters(self):
        a = all_quantum_lie_tour_audit()
        assert len(a) == 6

    def test_all_quantum_lie_tour_verify(self):
        assert all_quantum_lie_tour_verify()
