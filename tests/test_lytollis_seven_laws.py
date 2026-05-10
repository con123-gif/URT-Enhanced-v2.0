"""Tests for the Seven Lytollis Laws taxonomy."""
from math import pi
import pytest

from urt.shell_closure import phi, DELTA_STAR, q
from urt.lytollis_seven_laws import (
    KAPPA_URTF, MU_TURB, H_LYTOLLIS, M_N_OVER_M_P_CATHEDRAL,
    urtf_step, urtf_iterate,
    urtf_convergence_rate, bounded_chaos_scaling,
    fixed_point_manifold_5D, neutron_proton_mass_ratio,
    seven_laws_taxonomy,
    lytollis_seven_laws_audit, lytollis_seven_laws_audit_passes,
)


class TestLaw2_URTF:
    def test_kappa_is_pi_over_phi(self):
        assert abs(KAPPA_URTF - pi / phi) < 1e-15

    def test_kappa_value(self):
        assert abs(KAPPA_URTF - 1.94161103873) < 1e-9

    def test_zero_is_fixed_point(self):
        assert abs(urtf_step(0.0)) < 1e-15

    def test_contracts_within_basin(self):
        for x0 in (0.05, 0.1, 0.3, 0.5):
            traj = urtf_iterate(x0, 80)
            assert abs(traj[-1]) < 1e-6, f"x0={x0} did not contract: {traj[-1]}"

    def test_outside_basin_does_not_contract(self):
        """Honest disclosure: x ≫ δ does NOT contract under URTF."""
        traj = urtf_iterate(10.0, 30)
        # Should NOT have reached 0; in fact should have grown
        assert abs(traj[-1]) > 1.0

    def test_convergence_rate_dict(self):
        d = urtf_convergence_rate()
        assert d["is_pi_over_phi"]
        assert d["test_contraction"]


class TestLaw3_BoundedChaosScaling:
    def test_mu_turb_is_2_delta_star_squared(self):
        assert abs(MU_TURB - 2 * DELTA_STAR ** 2) < 1e-15

    def test_mu_turb_matches_kolmogorov(self):
        """Lytollis claim: μ_turb ≈ 0.0435 (turbulence dissipation)."""
        d = bounded_chaos_scaling()
        assert d["matches_kolmogorov"]
        assert abs(MU_TURB - 0.0435) < 5e-4

    def test_hurst_lytollis_form(self):
        assert abs(H_LYTOLLIS - (1 - DELTA_STAR)) < 1e-15
        assert abs(H_LYTOLLIS - 0.8525) < 1e-3

    def test_two_hurst_candidates_documented(self):
        d = bounded_chaos_scaling()
        # Both Lytollis (1−δ★) and (D+1)/(2D) candidates surfaced
        assert "Hurst_lytollis" in d
        assert "Hurst_alt" in d
        assert d["Hurst_lytollis"] != d["Hurst_alt"]


class TestLaw4_FixedPointManifold:
    def test_5d_components(self):
        d = fixed_point_manifold_5D()
        assert d["manifold_dim"] == 5
        assert d["components_all_closed_form"]

    def test_delta_star_at_center(self):
        d = fixed_point_manifold_5D()
        assert abs(d["delta_star"] - DELTA_STAR) < 1e-15


class TestLaw7_NeutronProtonMassRatio:
    def test_cathedral_form(self):
        d = neutron_proton_mass_ratio()
        assert abs(d["cathedral_value"] - (1 + DELTA_STAR ** 3 / q)) < 1e-15

    def test_within_0p1_pct(self):
        d = neutron_proton_mass_ratio()
        assert d["passes_0p1_pct"]
        assert abs(d["rel_error"]) < 1e-3


class TestTaxonomy:
    def test_seven_laws(self):
        t = seven_laws_taxonomy()
        assert len(t) == 7

    def test_law_numbers_contiguous(self):
        t = seven_laws_taxonomy()
        nums = sorted(law["law_number"] for law in t)
        assert nums == [1, 2, 3, 4, 5, 6, 7]

    def test_required_fields(self):
        t = seven_laws_taxonomy()
        required = ("law_number", "name", "statement", "cathedral_form",
                    "in_framework", "module")
        for law in t:
            for k in required:
                assert k in law


class TestAudit:
    def test_audit_passes(self):
        assert lytollis_seven_laws_audit_passes()

    def test_audit_complete(self):
        a = lytollis_seven_laws_audit()
        for k in ("law_1_constant", "law_2_urtf", "law_3_scaling",
                  "law_4_manifold", "law_7_mn_over_mp", "taxonomy"):
            assert k in a
