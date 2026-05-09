"""Tests for the Cathedral Codes-and-Algebras Tour — ninth-wave connections."""
from math import factorial
import pytest

from urt.cathedral_codes_tour import (
    classical_codes_cathedral_parameters,
    quantum_error_correction,
    operad_dimensions,
    cluster_algebra_clusters,
    quaternion_algebra_cathedral,
    tropical_moduli_cathedral,
    qec_threshold_is_gamma,
    all_codes_tour_audit,
    all_codes_tour_verify,
)


class TestClassicalCodes:
    def test_hamming_n_is_D_factorial_plus_1(self):
        from urt.shell_closure import D
        assert classical_codes_cathedral_parameters()["hamming_n"] == factorial(D) + 1 == 7

    def test_hamming_k_is_Dp1(self):
        from urt.shell_closure import D
        assert classical_codes_cathedral_parameters()["hamming_k"] == D + 1

    def test_ext_hamming_n_is_2pD(self):
        from urt.shell_closure import D
        assert classical_codes_cathedral_parameters()["ext_hamming_n"] == 2 ** D

    def test_ext_golay_n_is_2V(self):
        from urt.shell_closure import V
        assert classical_codes_cathedral_parameters()["ext_golay_n"] == 2 * V == 24

    def test_ext_golay_k_is_V(self):
        from urt.shell_closure import V
        assert classical_codes_cathedral_parameters()["ext_golay_k"] == V

    def test_ext_golay_d_is_2pD(self):
        """Ext Golay [24, V, 8] — distance 8 = 2^D, all Cathedral."""
        from urt.shell_closure import D
        assert classical_codes_cathedral_parameters()["ext_golay_d"] == 2 ** D


class TestQuantumECC:
    def test_5qubit_n_is_q(self):
        from urt.shell_closure import q
        assert quantum_error_correction()["five_qubit_n"] == q

    def test_steane_n_is_D_factorial_plus_1(self):
        from urt.shell_closure import D
        assert quantum_error_correction()["steane_n"] == factorial(D) + 1

    def test_shor_n_is_DD(self):
        """Shor 9-qubit code length = D² = 9."""
        from urt.shell_closure import D
        assert quantum_error_correction()["shor_n"] == D * D

    def test_all_distances_are_D(self):
        from urt.shell_closure import D
        a = quantum_error_correction()
        assert a["five_qubit_d"] == D
        assert a["steane_d"] == D
        assert a["shor_d"] == D


class TestOperads:
    def test_Ass_q_is_2V(self):
        """Associative operad arity-q dimension = (q-1)! = 24 = 2V."""
        from urt.shell_closure import q, V
        assert operad_dimensions()["Ass_q"] == factorial(q - 1) == 2 * V == 24

    def test_PreLie_D_is_DD(self):
        """Pre-Lie operad arity-D dimension = D^(D-1) = 9 = D²."""
        from urt.shell_closure import D
        assert operad_dimensions()["PreLie_D"] == D ** (D - 1) == D * D == 9


class TestClusterAlgebras:
    def test_C_D_is_q(self):
        """Catalan number C_D = q — counts type A_(D-1) clusters."""
        from urt.shell_closure import q
        assert cluster_algebra_clusters()["C_D"] == q

    def test_C_4_is_N_plus_1(self):
        """C_4 = 14 = N+1 — same as Bravais lattice count."""
        from urt.shell_closure import N
        assert cluster_algebra_clusters()["C_4"] == N + 1


class TestQuaternionAlgebra:
    def test_dim_H_is_Dp1(self):
        from urt.shell_closure import D
        assert quaternion_algebra_cathedral()["dim_H"] == D + 1

    def test_hurwitz_units_is_2V(self):
        """|Hurwitz units in H| = 24 = 2V = |2T binary tetrahedral|."""
        from urt.shell_closure import V
        assert quaternion_algebra_cathedral()["hurwitz_units"] == 2 * V

    def test_lipschitz_units_is_2pD(self):
        from urt.shell_closure import D
        assert quaternion_algebra_cathedral()["lipschitz_units"] == 2 ** D

    def test_lagrange_4_square_theorem(self):
        """Every n is a sum of D+1 = 4 integer squares."""
        from urt.shell_closure import D
        assert quaternion_algebra_cathedral()["lagrange_count"] == D + 1


class TestTropicalModuli:
    def test_g5_is_V(self):
        from urt.shell_closure import V
        assert tropical_moduli_cathedral()["g5_trop"] == V

    def test_g11_is_E(self):
        from urt.shell_closure import E
        assert tropical_moduli_cathedral()["g11_trop"] == E


class TestQECThreshold:
    def test_gamma_is_one_over_D4(self):
        from urt.shell_closure import D
        assert qec_threshold_is_gamma()["gamma_value"] == 1 / D ** 4

    def test_gamma_pct_is_about_one_percent(self):
        v = qec_threshold_is_gamma()["qec_threshold_pct"]
        assert 1.0 < v < 1.5    # ≈ 1.23 %


class TestEndToEndAudit:
    def test_audit_returns_seven_clusters(self):
        a = all_codes_tour_audit()
        assert len(a) == 7

    def test_all_codes_tour_verify(self):
        assert all_codes_tour_verify()
