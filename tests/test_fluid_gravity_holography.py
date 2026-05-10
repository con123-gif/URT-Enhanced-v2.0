"""Tests for the fluid-gravity-BH-QG Cathedral correspondence."""
import math
from math import factorial, log, pi, sqrt

from urt.shell_closure import D, q, V, N, E, F, G, DELTA_STAR
from urt.fluid_gravity_holography import (
    GN_CATHEDRAL, LP2_CATHEDRAL, KSS_BOUND, NU_CATHEDRAL, ADS_RADIUS,
    riemann_components, ricci_components, weyl_components, bianchi_identities,
    curvature_table_3d, curvature_table_4d,
    bh_entropy_coefficient, bh_area_quantum,
    hawking_temperature_factor, ads3_central_charge_brown_henneaux,
    kss_bound, cathedral_saturates_kss,
    barbero_immirzi_domagala_lewandowski,
    spin_network_icosahedral,
    holographic_dimension_ladder,
    string_theory_critical_dimensions,
    fluid_gravity_holography_table,
    fluid_gravity_holography_audit_passes,
)


class TestCurvatureCounts3D:
    """3D space curvature: Riemann = Ricci = D!, Weyl = 0."""

    def test_riemann_3d_is_DF(self):
        assert riemann_components(D) == factorial(D) == 6

    def test_ricci_3d_is_DF(self):
        assert ricci_components(D) == factorial(D) == 6

    def test_weyl_3d_is_zero(self):
        """Weyl tensor identically zero in 3D — no propagating gravitons."""
        assert weyl_components(D) == 0

    def test_bianchi_3d_is_D(self):
        assert bianchi_identities(D) == D == 3

    def test_table_consistent(self):
        c = curvature_table_3d()
        assert c["Riemann"] == c["Ricci"] == 6
        assert c["Weyl"] == 0
        assert c["Bianchi"] == 3


class TestCurvatureCounts4D:
    """4D spacetime curvature: Riemann = F, Ricci = Weyl = 2q, Bianchi = D+1."""

    def test_riemann_4d_is_F(self):
        assert riemann_components(D + 1) == F == 20

    def test_ricci_4d_is_2q(self):
        assert ricci_components(D + 1) == 2 * q == 10

    def test_weyl_4d_is_2q(self):
        assert weyl_components(D + 1) == 2 * q == 10

    def test_bianchi_4d_is_Dp1(self):
        assert bianchi_identities(D + 1) == D + 1 == 4

    def test_table_consistent(self):
        c = curvature_table_4d()
        assert c["Riemann"] == 20
        assert c["Ricci"] == c["Weyl"] == 10
        assert c["Bianchi"] == 4


class TestBlackHoleClosedForms:
    def test_GN_is_delta_star_squared(self):
        assert GN_CATHEDRAL == DELTA_STAR ** 2
        assert LP2_CATHEDRAL == DELTA_STAR ** 2

    def test_entropy_coefficient(self):
        """S = A · 1/(4·δ★²)."""
        assert abs(bh_entropy_coefficient() - 1 / (4 * DELTA_STAR ** 2)) < 1e-15

    def test_area_quantum_is_8pi_ds3(self):
        """ΔA = 8π · δ★³ — Bekenstein-Mukhanov."""
        a = bh_area_quantum()
        assert abs(a["delta_A"] - 8 * pi * DELTA_STAR ** 3) < 1e-15

    def test_hawking_T_M_factor(self):
        """T · M = 1/(8π · δ★²)."""
        h = hawking_temperature_factor()
        assert abs(h["T_times_M"] - 1 / (8 * pi * DELTA_STAR ** 2)) < 1e-15

    def test_ads3_central_charge_is_about_467(self):
        """Brown-Henneaux: c = 3/(2·δ★³)."""
        c = ads3_central_charge_brown_henneaux()
        assert abs(c["c"] - 3 / (2 * DELTA_STAR ** 3)) < 1e-12
        assert 460 < c["c"] < 475


class TestKSSBound:
    def test_bound_is_one_over_4pi(self):
        b = kss_bound()
        assert abs(b["eta_over_s_min"] - 1 / (4 * pi)) < 1e-15

    def test_cathedral_viscosity_is_kss_bound(self):
        """ν_Cathedral = 1/(4π) saturates the KSS bound exactly."""
        s = cathedral_saturates_kss()
        assert s["saturated"]
        assert abs(NU_CATHEDRAL - KSS_BOUND) < 1e-15

    def test_implication_is_holographic_duality(self):
        s = cathedral_saturates_kss()
        assert "dual" in s["implication"]


class TestQuantumGravity:
    def test_barbero_immirzi_cathedral_form(self):
        """γ_BI = ln(2)/(π · √D) — Domagala-Lewandowski form."""
        b = barbero_immirzi_domagala_lewandowski()
        assert abs(b["gamma_BI"] - log(2) / (pi * sqrt(D))) < 1e-15

    def test_spin_network_is_icosahedral(self):
        """Cathedral spin network: V=12 nodes, E=30 edges, F=20 faces, |A_5|=60."""
        s = spin_network_icosahedral()
        assert s["nodes"] == V == 12
        assert s["edges"] == E == 30
        assert s["faces"] == F == 20
        assert s["symmetry_order"] == G == 60


class TestHolographicLadder:
    def test_dimension_ladder_lands_on_q(self):
        """d = D, D+1, D+2 = 3, 4, 5 = q.  AdS bulk dim is the Cathedral prime q."""
        dl = holographic_dimension_ladder()
        assert dl["spatial"] == D
        assert dl["spacetime"] == D + 1
        assert dl["ads_bulk"] == D + 2 == q
        assert dl["ads_bulk_is_q"]

    def test_string_critical_dimensions(self):
        """Bosonic 26, super 10, M-theory 11 — all Cathedral."""
        sd = string_theory_critical_dimensions()
        assert sd["bosonic"] == 2 * N == 26
        assert sd["super"] == 2 * q == 10
        assert sd["m_theory"] == factorial(D) + q == 11


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert fluid_gravity_holography_audit_passes()

    def test_audit_table_has_12_rows(self):
        t = fluid_gravity_holography_table()
        assert len(t) == 12

    def test_table_keys_in_order(self):
        """Sorted keys are 01_… through 12_… for stable presentation."""
        t = fluid_gravity_holography_table()
        keys = sorted(t.keys())
        assert all(k.startswith(f"{i:02d}_") for i, k in enumerate(keys, 1))
