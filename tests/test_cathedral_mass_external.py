"""
Tests for urt.cathedral_mass_external — external-physics validation of M★.

These tests check the framework's claim that M★ as the natural unit
makes the γ-ladder structure of measured physics visible.  They are
NOT calibration tests — they check whether external (PDG/Planck)
measurements arrange themselves cleanly in M★ units.
"""
from math import pi, log
import pytest

from urt.shell_closure import D, q, V, N, G, gamma
from urt.cathedral_mass_external import (
    M_STAR_GEV,
    SM_MASSES_GEV, COSMO_SCALES_GEV,
    gamma_exponent_in_M_star,
    closest_cathedral_integer,
    gamma_ladder_table,
    cathedral_natural_placements,
    prefactor_extraction_table,
    clean_prefactor_count,
    best_prefactor_match,
    M_star_ratios_to_natural_units,
    search_cathedral_ratio,
    M_star_bh_entropy,
    M_star_bh_thermo_summary,
    thorough_classical_identity_search,
    best_classical_match_for_M_star,
    external_validation_audit,
    external_validation_passes,
)


# ── γ-ladder placement ────────────────────────────────────────────────────

class TestGammaLadderPlacement:

    def test_M_star_GeV_around_3e19(self):
        assert 3.0e19 < M_STAR_GEV < 3.5e19

    def test_v_EW_at_gamma_9_within_005(self):
        # v_EW / M★ should fall within 0.05 of γ^9 = γ^(D²)
        k = gamma_exponent_in_M_star(SM_MASSES_GEV["v_EW"])
        assert abs(k - D ** 2) < 0.05

    def test_m_top_at_gamma_9_within_010(self):
        k = gamma_exponent_in_M_star(SM_MASSES_GEV["m_t"])
        assert abs(k - D ** 2) < 0.10

    def test_m_Higgs_at_gamma_9(self):
        k = gamma_exponent_in_M_star(SM_MASSES_GEV["m_H"])
        assert abs(k - D ** 2) < 0.15

    def test_m_W_at_gamma_9(self):
        k = gamma_exponent_in_M_star(SM_MASSES_GEV["m_W"])
        assert abs(k - D ** 2) < 0.25

    def test_m_electron_at_gamma_V(self):
        # m_e / M★ ≈ γ^V = γ^12
        k = gamma_exponent_in_M_star(SM_MASSES_GEV["m_e"])
        assert abs(k - V) < 0.10

    def test_T_CMB_at_gamma_17(self):
        # T_CMB / M★ ≈ γ^(N+D+1) = γ^17
        k = gamma_exponent_in_M_star(COSMO_SCALES_GEV["T_CMB"])
        assert abs(k - 17) < 0.25

    def test_H_0_at_gamma_2_to_q(self):
        # H_0 / M★ ≈ γ^(2^q) = γ^32
        k = gamma_exponent_in_M_star(COSMO_SCALES_GEV["H_0"])
        assert abs(k - 2 ** q) < 0.25

    def test_at_least_eight_cathedral_placements(self):
        # Of the 18 scales tested, at least 8 should land at a
        # Cathedral integer to |Δ|<0.5.
        n = len(cathedral_natural_placements(tolerance=0.5))
        assert n >= 8, f"only {n} scales landed at a Cathedral integer"

    def test_gamma_ladder_table_has_18_rows(self):
        # All SM masses + cosmological scales.
        assert len(gamma_ladder_table()) == len(SM_MASSES_GEV) + len(COSMO_SCALES_GEV)


# ── Prefactor extraction (Cathedral O(1) ID for residues) ─────────────────

class TestPrefactorExtraction:

    def test_v_EW_prefactor_matches_D_fact_V_over_G(self):
        # v_EW / M★ = α · γ^9 ; the framework gives α ≈ D!·V/G = 1.2
        rows = prefactor_extraction_table()
        for name, _, k, alpha, _, err in rows:
            if name == "v_EW":
                assert k == D ** 2
                assert err < 10.0           # <10 % match to D!·V/G
                return
        pytest.fail("v_EW row missing")

    def test_T_CMB_prefactor_is_2(self):
        rows = prefactor_extraction_table()
        for name, _, k, alpha, match, err in rows:
            if name == "T_CMB":
                assert match == "2"
                assert err < 5.0
                return
        pytest.fail("T_CMB row missing")

    def test_at_least_four_clean_prefactors(self):
        # At least 4 of the 12 EW-scale + cosmology rows have prefactors
        # matching a Cathedral O(1) primitive to <10 %.
        assert clean_prefactor_count(tol_pct=10.0) >= 4


# ── Mathematical identity search ──────────────────────────────────────────

class TestMathematicalIdentitySearch:

    def test_no_classical_constant_matches_M_star(self):
        # 4π√2 is not equal to Catalan, Apéry, Khinchin, Glaisher,
        # Feigenbaum, Silver, Plastic, Omega, or any combination
        # tested.
        match = best_classical_match_for_M_star(tol_rel=1e-3)
        assert match is None

    def test_49_classical_constants_tested(self):
        # Confirm the thorough search actually runs over a wide
        # variety of constants, not a token few.
        rows = thorough_classical_identity_search()
        assert len(rows) >= 40


# ── Cross-comparison with other natural-unit systems ──────────────────────

class TestCrossComparisonNaturalUnits:

    def test_M_star_over_M_Pl_ratio_is_2_62(self):
        # First row is always M_Pl; ratio = 2.6215
        rows = M_star_ratios_to_natural_units()
        for name, r, _ in rows:
            if "1/√G" in name:
                assert abs(r - 2.6215) < 1e-3
                return
        pytest.fail("M_Pl row missing")

    def test_M_star_over_M_reduced_is_13_14(self):
        # M★/M̄_Pl = δ★·√(2^q·8π³) ≈ 13.14
        rows = M_star_ratios_to_natural_units()
        for name, r, _ in rows:
            if "reduced" in name:
                assert abs(r - 13.14) < 0.01
                return
        pytest.fail("reduced row missing")

    def test_search_cathedral_ratio_finds_M_star_over_M_red_Pl(self):
        from math import sqrt
        ratio = M_STAR_GEV / (1.22091e19 / sqrt(8 * pi))
        match = search_cathedral_ratio(ratio, tol_pct=1.0)
        assert match is not None


# ── M★-mass black-hole thermodynamics ─────────────────────────────────────

class TestMStarBHThermodynamics:

    def test_bh_entropy_equals_2_to_q_plus_2_pi3_delta_star_sq(self):
        # S_BH(M★) = 4π · G·M★² = 4π · δ★²·2^q·π² = 2^(q+2) · π³ · δ★²
        from urt.shell_closure import DELTA_STAR
        S = M_star_bh_entropy()
        expected = 2 ** (q + 2) * pi ** 3 * DELTA_STAR ** 2
        assert abs(S - expected) < 1e-12

    def test_bh_entropy_around_86(self):
        S = M_star_bh_entropy()
        assert abs(S - 86.36) < 0.1

    def test_thermo_summary_has_all_quantities(self):
        t = M_star_bh_thermo_summary()
        assert "S_BH_kB" in t
        assert "T_Hawking_GeV" in t
        assert "kappa_GeV" in t
        # T_Hawking of M★-mass BH is well below M_Pl
        assert t["T_Hawking_GeV"] < 1e18


# ── Top-level audit ────────────────────────────────────────────────────────

class TestExternalAudit:

    def test_audit_dict_complete(self):
        a = external_validation_audit()
        for key in [
            "n_scales_tested", "n_cathedral_placements",
            "n_prefactors_clean", "n_prefactors_examined",
            "best_classical_match", "M_star_BH_entropy",
        ]:
            assert key in a

    def test_external_validation_passes_default_thresholds(self):
        # At least 8 Cathedral placements and 4 clean prefactors.
        assert external_validation_passes()

    def test_eighteen_scales_tested(self):
        a = external_validation_audit()
        assert a["n_scales_tested"] == 18
