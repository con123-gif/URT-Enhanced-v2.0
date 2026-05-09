"""Tests for the 4/9 sector-ratio fingerprint module."""
from math import factorial

from urt.sector_ratio import (
    sector_ratio_general,
    sector_ratio_table,
    sector_ratio_uniqueness,
    k4_a5_sector_volumes,
    casimir_4_over_9,
    cosmology_4_over_9,
    eta_b_prefactor_8_over_9,
    sector_ratio_audit,
    sector_ratio_audit_passes,
)


class TestUniqueness:
    def test_D_3_is_4_over_9(self):
        """At D=3 the ratio is exactly 4/9."""
        assert sector_ratio_general(3) == 4/9

    def test_D_2_is_3_over_4(self):
        """At D=2 the ratio is 3/4 — but A_4 is solvable."""
        assert sector_ratio_general(2) == 3/4

    def test_D_4_collapses(self):
        """At D=4 the ratio falls below 20 %."""
        assert sector_ratio_general(4) < 0.20

    def test_D_5_collapses_further(self):
        """At D=5 the ratio falls below 5 %."""
        assert sector_ratio_general(5) < 0.05

    def test_D_3_is_sweet_spot(self):
        """D=3 is the unique order-unity ratio."""
        u = sector_ratio_uniqueness()
        assert u["D_3_is_4_over_9"]
        assert u["D_4_ratio_below_20_pct"]
        assert u["D_5_ratio_below_5_pct"]

    def test_table_has_six_rows(self):
        """Default table covers D=1..6."""
        rows = sector_ratio_table(6)
        assert len(rows) == 6
        assert rows[2] == (3, "4/9", 4/9)


class TestSectorVolumes:
    def test_K_4_order_is_D_plus_1(self):
        """|K_4| = D+1 = 4."""
        from urt.shell_closure import D
        s = k4_a5_sector_volumes()
        assert s["K_4_order"] == D + 1 == 4

    def test_A_5_exhaust_is_D_fact_plus_D(self):
        """|A_5 exhaust| = D!+D = 9 = D²."""
        from urt.shell_closure import D
        s = k4_a5_sector_volumes()
        assert s["A_5_exhaust_dim"] == factorial(D) + D == 9
        assert s["A_5_exhaust_dim"] == D * D

    def test_ratio_is_4_over_9(self):
        s = k4_a5_sector_volumes()
        assert s["is_4_over_9"]
        assert s["ratio"] == 4/9


class TestCasimir:
    def test_coefficient_is_4_over_9(self):
        """ΔF/F coefficient = 4/9."""
        c = casimir_4_over_9()
        assert c["is_4_over_9"]
        assert c["coefficient"] == 4/9

    def test_falsifiable(self):
        """Casimir is one of the framework's three falsifiable predictions."""
        c = casimir_4_over_9()
        assert c["falsifiable"]


class TestCosmology:
    def test_omega_m_bare_is_4_over_13(self):
        """Bare Ω_m = (D+1)/N = 4/13."""
        from urt.shell_closure import D, N
        cm = cosmology_4_over_9()
        assert cm["Omega_m_bare"] == (D + 1) / N == 4/13

    def test_omega_lambda_bare_is_9_over_13(self):
        """Bare Ω_Λ = (D!+D)/N = 9/13."""
        from urt.shell_closure import D, N
        cm = cosmology_4_over_9()
        assert cm["Omega_Lambda_bare"] == (factorial(D) + D) / N == 9/13

    def test_sum_is_one(self):
        """Bare Ω_m + Ω_Λ = 1 — closure."""
        cm = cosmology_4_over_9()
        assert cm["sum_is_one"]

    def test_ratio_is_4_over_9(self):
        """Bare Ω_m / Ω_Λ = 4/9."""
        cm = cosmology_4_over_9()
        assert cm["ratio_is_4_over_9"]

    def test_gamma_corrected_within_2_pct_of_Planck(self):
        """Γ-corrected Ω_m matches Planck 2018 to 2 %."""
        cm = cosmology_4_over_9()
        rel_err = abs(cm["gamma_corrected_Omega_m"] - cm["Planck_2018"]) / cm["Planck_2018"]
        assert rel_err < 0.02


class TestEtaBPrefactor:
    def test_prefactor_is_8_over_9(self):
        """η_B prefactor = 8/9 = 2·(4/9)."""
        e = eta_b_prefactor_8_over_9()
        assert e["is_8_over_9"]
        assert e["prefactor"] == 8/9

    def test_factor_of_2_decomposition(self):
        """8/9 = 2·(D+1)/(D!+D)."""
        from urt.shell_closure import D
        e = eta_b_prefactor_8_over_9()
        assert e["prefactor"] == 2 * (D + 1) / (factorial(D) + D)


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert sector_ratio_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = sector_ratio_audit()
        assert "uniqueness" in a
        assert "K_4_A_5_volumes" in a
        assert "casimir" in a
        assert "cosmology" in a
        assert "eta_b" in a

    def test_four_observables_share_the_same_signature(self):
        """The same 4/9 ratio appears in 4 independent observables."""
        a = sector_ratio_audit()
        assert a["K_4_A_5_volumes"]["ratio"] == 4/9
        assert a["casimir"]["coefficient"] == 4/9
        assert abs(a["cosmology"]["ratio"] - 4/9) < 1e-15
        # η_B carries 8/9 = 2·(4/9)
        assert a["eta_b"]["prefactor"] / 2 == 4/9
