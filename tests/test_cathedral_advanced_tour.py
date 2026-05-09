"""Tests for the Cathedral Advanced Tour — seventh-wave connections."""
from math import factorial
import pytest

from urt.cathedral_advanced_tour import (
    quillen_K_theory_Z,
    crystallographic_group_counts,
    ising_2D_critical_exponents,
    stiefel_SO_dimensions,
    stirling_first_kind_hits_d35,
    topological_modular_forms_period,
    PSL_2_7_and_337_triangle,
    all_advanced_tour_audit,
    all_advanced_tour_verify,
)


class TestQuillenKTheory:
    def test_K3_torsion_is_Kp1_V(self):
        from urt.shell_closure import D, V
        assert quillen_K_theory_Z()["K3_torsion"] == (D + 1) * V == 48

    def test_K7_torsion_is_VF(self):
        """K_7(Z) = Z/240 — same as |π_7^s| = E_8 root count."""
        from urt.shell_closure import V, F
        assert quillen_K_theory_Z()["K7_torsion"] == V * F == 240

    def test_K15_torsion_is_2VF(self):
        from urt.shell_closure import V, F
        assert quillen_K_theory_Z()["K15_torsion"] == 2 * V * F


class TestCrystallographicGroups:
    def test_230_space_groups_is_VF_minus_2q(self):
        from urt.shell_closure import V, F, q
        assert crystallographic_group_counts()["n_space_groups"] == V * F - 2 * q

    def test_17_wallpaper_groups_is_N_p_D_p_1(self):
        from urt.shell_closure import N, D
        assert crystallographic_group_counts()["n_wallpaper"] == N + D + 1

    def test_7_frieze_groups_is_Df_p_1(self):
        from urt.shell_closure import D
        assert crystallographic_group_counts()["n_frieze"] == factorial(D) + 1

    def test_32_point_groups_is_2_to_q(self):
        from urt.shell_closure import q
        assert crystallographic_group_counts()["n_point_groups"] == 2 ** q

    def test_14_bravais_is_N_p_1(self):
        from urt.shell_closure import N
        assert crystallographic_group_counts()["n_bravais"] == N + 1


class TestIsingExponents:
    def test_delta_is_Dq(self):
        """2D Ising critical exponent δ = 15 = D·q."""
        from urt.shell_closure import D, q
        assert ising_2D_critical_exponents()["delta_int"] == D * q == 15


class TestStiefelSO:
    def test_dim_SO3_is_D(self):
        from urt.shell_closure import D
        assert stiefel_SO_dimensions()["dim_SO3"] == D

    def test_dim_SO4_is_D_factorial(self):
        from urt.shell_closure import D
        assert stiefel_SO_dimensions()["dim_SO4"] == factorial(D)

    def test_dim_SO5_is_2q(self):
        from urt.shell_closure import q
        assert stiefel_SO_dimensions()["dim_SO5"] == 2 * q

    def test_dim_SO6_is_Dq(self):
        from urt.shell_closure import D, q
        assert stiefel_SO_dimensions()["dim_SO6"] == D * q


class TestStirling1Hits_d35:
    def test_c_q_D_is_35(self):
        """Stirling first kind c(q, D) = 35 — equals ARF residue d_35."""
        from urt.shell_closure import E, q
        assert stirling_first_kind_hits_d35()["c_q_D"] == 35
        assert 35 == E + q


class TestTMFAndHopf:
    def test_TMF_period_is_2V_squared(self):
        from urt.shell_closure import V
        assert topological_modular_forms_period()["TMF_period"] == (2 * V) ** 2

    def test_hopf_nu_order_is_2V(self):
        from urt.shell_closure import V
        assert topological_modular_forms_period()["Hopf_nu_order"] == 2 * V

    def test_hopf_sigma_order_is_VF(self):
        from urt.shell_closure import V, F
        assert topological_modular_forms_period()["Hopf_sigma_order"] == V * F


class TestPSL27:
    def test_order_is_2pD_D_Dfp1(self):
        """|PSL(2, 7)| = 168 = 2^D · D · (D!+1)."""
        from urt.shell_closure import D
        assert PSL_2_7_and_337_triangle()["PSL_2_7_order"] == 2**D * D * (factorial(D) + 1)
        assert 2**3 * 3 * 7 == 168

    def test_order_is_Dfp1_times_2V(self):
        from urt.shell_closure import D, V
        assert PSL_2_7_and_337_triangle()["PSL_2_7_order"] == (factorial(D) + 1) * 2 * V


class TestEndToEndAudit:
    def test_audit_returns_seven_clusters(self):
        a = all_advanced_tour_audit()
        assert len(a) == 7

    def test_all_advanced_tour_verify(self):
        assert all_advanced_tour_verify()
