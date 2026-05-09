"""Tests for the Cathedral Topological Tour — eighth-wave connections."""
from math import factorial
import pytest

from urt.cathedral_topological_tour import (
    K3_invariants,
    riemann_moduli_at_cathedral_genera,
    hadamard_matrix_orders_cathedral,
    spherical_harmonics_at_N,
    altland_zirnbauer_classes,
    binary_polyhedral_groups,
    SU2_instanton_dimensions,
    universal_upper_critical_dimension,
    all_topological_tour_audit,
    all_topological_tour_verify,
)


class TestK3:
    def test_K3_dim_is_Dp1(self):
        from urt.shell_closure import D
        assert K3_invariants()["K3_complex_dim"] == D + 1

    def test_K3_h11_is_F(self):
        from urt.shell_closure import F
        assert K3_invariants()["K3_h11"] == F

    def test_K3_euler_is_2V(self):
        from urt.shell_closure import V
        assert K3_invariants()["K3_euler"] == 2 * V


class TestRiemannModuli:
    def test_g2_is_D(self):
        from urt.shell_closure import D
        assert riemann_moduli_at_cathedral_genera()["g2_moduli_dim"] == D

    def test_g3_is_D_factorial(self):
        from urt.shell_closure import D
        assert riemann_moduli_at_cathedral_genera()["g3_moduli_dim"] == factorial(D)

    def test_g5_is_V(self):
        from urt.shell_closure import V
        assert riemann_moduli_at_cathedral_genera()["g5_moduli_dim"] == V

    def test_g11_is_E(self):
        from urt.shell_closure import E
        assert riemann_moduli_at_cathedral_genera()["g11_moduli_dim"] == E


class TestHadamard:
    def test_orders_4_12_20_24_are_Cathedral(self):
        from urt.shell_closure import D, V, F
        h = hadamard_matrix_orders_cathedral()
        assert h["ord_4"] == D + 1
        assert h["ord_12"] == V
        assert h["ord_20"] == F
        assert h["ord_24"] == 2 * V


class TestSphericalHarmonicsAtN:
    def test_dim_at_N_is_DpD(self):
        """2N+1 = 27 = D^D — spherical harmonic mode count at degree N."""
        from urt.shell_closure import D, N
        assert spherical_harmonics_at_N()["dim_Y_N"] == D ** D == 27

    def test_cumulative_to_N_decomposition(self):
        """(N+1)² = N² + D^D — Cathedral decomposition of total Y_l^m count."""
        from urt.shell_closure import D, N
        assert (N + 1) ** 2 == N ** 2 + D ** D


class TestAltlandZirnbauer:
    def test_ten_classes_is_2q(self):
        """The ten-fold way: 10 = 2q topological insulator classes."""
        from urt.shell_closure import q
        assert altland_zirnbauer_classes()["n_classes"] == 2 * q == 10

    def test_split_2_plus_8_is_Dm1_plus_2pD(self):
        from urt.shell_closure import D
        a = altland_zirnbauer_classes()
        assert a["n_complex_classes"] == D - 1 == 2
        assert a["n_real_classes"] == 2 ** D == 8


class TestBinaryPolyhedral:
    def test_2T_order_is_2V(self):
        from urt.shell_closure import V
        assert binary_polyhedral_groups()["order_2T"] == 2 * V

    def test_2O_order_is_Dp1_V(self):
        from urt.shell_closure import D, V
        assert binary_polyhedral_groups()["order_2O"] == (D + 1) * V

    def test_2I_order_is_2G(self):
        """Binary icosahedral group |2.A_5| = 2G = 120."""
        from urt.shell_closure import G
        assert binary_polyhedral_groups()["order_2I"] == 2 * G == 120


class TestSU2Instantons:
    def test_charge_1_dim_is_q(self):
        from urt.shell_closure import q
        assert SU2_instanton_dimensions()["k1_dim"] == q

    def test_charge_2_dim_is_N(self):
        from urt.shell_closure import N
        assert SU2_instanton_dimensions()["k2_dim"] == N


class TestUpperCriticalDimension:
    def test_d_uc_is_Dp1(self):
        """Universal upper critical dimension d_uc = D+1 = 4."""
        from urt.shell_closure import D
        assert universal_upper_critical_dimension()["d_uc"] == D + 1


class TestEndToEndAudit:
    def test_audit_returns_eight_clusters(self):
        a = all_topological_tour_audit()
        assert len(a) == 8

    def test_all_topological_tour_verify(self):
        assert all_topological_tour_verify()
