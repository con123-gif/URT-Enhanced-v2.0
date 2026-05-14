"""
Tests for urt.cathedral_mass — M★ refactor validation suite.

Five validation programs are checked here:

  Test 1 — multi-anchor cross-consistency (G_N, M_Pl, ρ_Λ, m_e, m_p, v_EW)
  Test 2 — Cathedral coefficient extraction in M★ units
  Test 3 — mathematical identity search for √(2^q π²)
  Test 4 — anchor-independence on the full predictions registry
  Test 5 — gravitational Cathedral identity G_N · M★² = δ★² · 2^q · π²
"""
from math import pi, sqrt
import pytest

from urt.shell_closure import DELTA_STAR, q
from urt.cathedral_mass import (
    DYNAMICAL_NORMALISATION,
    M_STAR_DIMENSIONLESS,
    M_STAR_OVER_M_PL,
    M_PL_OVER_M_STAR,
    GRAV_COUPLING_AT_M_STAR,
    gravitational_cathedral_identity,
    cathedral_gravitational_coupling,
    M_star_from_M_Pl, M_star_from_G_N,
    M_star_from_rho_Lambda, M_star_from_m_e,
    M_star_from_m_p, M_star_from_v_EW,
    multi_anchor_M_star_table,
    multi_anchor_consistency_max_deviation,
    multi_anchor_consistent,
    mathematical_identity_candidates,
    has_close_mathematical_match,
    predictions_anchor_independent,
    compton_schwarzschild_crossover_mass_GeV,
    hawking_temperature_at_M_star_GeV,
    planck_area_in_M_star_units,
    cathedral_coefficients_in_M_star,
    cathedral_mass_audit,
    cathedral_mass_audit_passes,
)


# ── Definitions and closed forms ──────────────────────────────────────────

class TestDefinitions:

    def test_dynamical_normalisation_equals_two_to_q_times_pi_sq(self):
        assert DYNAMICAL_NORMALISATION == 2 ** q * pi ** 2
        # 2^5 = 32; 32 * π² ≈ 315.83
        assert abs(DYNAMICAL_NORMALISATION - 315.8273) < 1e-3

    def test_M_star_dimensionless_is_sqrt_dyn_norm(self):
        assert M_STAR_DIMENSIONLESS == sqrt(DYNAMICAL_NORMALISATION)

    def test_M_star_equals_4_pi_sqrt_2(self):
        # M★ = √(2^q π²) = √(32 π²) = 4π√2
        assert abs(M_STAR_DIMENSIONLESS - 4 * pi * sqrt(2)) < 1e-12

    def test_M_star_dimensionless_numerical(self):
        # 4 · π · √2 to machine precision
        assert abs(M_STAR_DIMENSIONLESS - 17.771531752633464) < 1e-12

    def test_ratio_M_star_over_M_Pl(self):
        # M★/M_Pl = δ★ · √(2^q π²)
        assert M_STAR_OVER_M_PL == DELTA_STAR * M_STAR_DIMENSIONLESS
        assert abs(M_STAR_OVER_M_PL - 2.621493) < 1e-5

    def test_reciprocal_ratio(self):
        assert abs(M_STAR_OVER_M_PL * M_PL_OVER_M_STAR - 1.0) < 1e-15


# ── Test 5: gravitational Cathedral identity ──────────────────────────────

class TestGravitationalIdentity:

    def test_identity_holds_at_machine_precision(self):
        # G_N · M★² = δ★² · 2^q · π²  in dimensionless natural units
        identity = GRAV_COUPLING_AT_M_STAR
        expected = DELTA_STAR ** 2 * 2 ** q * pi ** 2
        assert abs(identity - expected) < 1e-15

    def test_identity_numerical(self):
        # δ★² · 2^q · π² ≈ 0.02176 · 315.83 ≈ 6.872
        assert abs(GRAV_COUPLING_AT_M_STAR - 6.87222) < 1e-4

    def test_identity_dict_structure(self):
        ident = gravitational_cathedral_identity()
        assert "G_N_times_M_star_sq" in ident
        assert "delta_star_sq" in ident
        assert "two_to_the_q" in ident
        assert "pi_sq" in ident
        assert ident["two_to_the_q"] == 32

    def test_gravitational_coupling_function(self):
        assert cathedral_gravitational_coupling() == GRAV_COUPLING_AT_M_STAR

    def test_planck_area_equals_grav_coupling(self):
        # A_Pl · M★² = G_N · M★² (in natural units, A_Pl ~ G_N)
        assert planck_area_in_M_star_units() == GRAV_COUPLING_AT_M_STAR


# ── Test 1: multi-anchor cross-consistency ────────────────────────────────

class TestMultiAnchorConsistency:

    def test_M_star_from_M_Pl_matches_identity(self):
        # round-trip: M★ = M_Pl · δ★ · √(2^q π²) ≈ 3.20e19 GeV
        ms = M_star_from_M_Pl(1.0)
        assert abs(ms - M_STAR_OVER_M_PL) < 1e-12

    def test_M_star_from_G_N_matches_M_Pl_anchor(self):
        # G_N = 1/M_Pl² (by definition of M_Pl), so both routes must agree
        ms_g  = M_star_from_G_N()
        ms_pl = M_star_from_M_Pl()
        assert abs(ms_g - ms_pl) / ms_pl < 1e-9

    def test_M_star_from_rho_Lambda_within_v9_tolerance(self):
        # v9 chain claims sub-0.1% on Λ/M_Pl⁴, so M★ via ρ_Λ should
        # agree with M★ via G_N to <0.5 %
        ms_rho = M_star_from_rho_Lambda()
        ms_g   = M_star_from_G_N()
        assert abs(ms_rho - ms_g) / ms_g < 5e-3

    def test_M_star_from_m_e_within_v9_tolerance(self):
        # v9 chain claims sub-1% on m_e, so M★ via m_e should
        # agree with M★ via G_N to <1 %
        ms_me = M_star_from_m_e()
        ms_g  = M_star_from_G_N()
        assert abs(ms_me - ms_g) / ms_g < 0.01

    def test_M_star_from_m_p_within_v9_tolerance(self):
        ms_mp = M_star_from_m_p()
        ms_g  = M_star_from_G_N()
        assert abs(ms_mp - ms_g) / ms_g < 0.01

    def test_M_star_from_v_EW_within_v9_tolerance(self):
        ms_v  = M_star_from_v_EW()
        ms_g  = M_star_from_G_N()
        assert abs(ms_v - ms_g) / ms_g < 0.01

    def test_all_anchors_agree_within_5_percent(self):
        assert multi_anchor_consistent(rel_tol=0.05)

    def test_all_anchors_agree_within_1_percent(self):
        # framework-level claim: sub-1% match to PDG/Planck
        assert multi_anchor_consistency_max_deviation() < 0.01

    def test_anchor_table_has_six_routes(self):
        table = multi_anchor_M_star_table()
        assert len(table) == 6

    def test_anchor_table_M_star_around_3e19_GeV(self):
        table = multi_anchor_M_star_table()
        for name, ms, _ in table:
            assert 3.0e19 < ms < 3.5e19, f"{name} gave M★={ms:.3e}"


# ── Test 3: mathematical identity search ──────────────────────────────────

class TestMathematicalIdentitySearch:

    def test_M_star_matches_no_classical_constant_at_1em4(self):
        # 4π√2 ≈ 17.77 — not Catalan, not ζ(2)·D!, not Coxeter h·ζ(2)·D/G…
        # If it accidentally matched a known constant, this test would
        # catch it.  The expected outcome is: no match (M★ is a new
        # Cathedral constant).
        match = has_close_mathematical_match(rel_tol=1e-4)
        assert match is None

    def test_M_star_does_match_trivial_self_identifications(self):
        # 4π√2, π·2^(q/2), √(32π²) — all the same number.
        cands = mathematical_identity_candidates()
        trivials = [c for c in cands if abs(c[2]) < 1e-12]
        assert len(trivials) >= 3      # at least three trivial restatements

    def test_no_classical_match_at_1pct_either(self):
        # Looser tolerance: still no accidental coincidence.
        match = has_close_mathematical_match(rel_tol=0.01)
        assert match is None


# ── Test 4: anchor-independence of predictions registry ───────────────────

class TestPredictionsAnchorIndependence:

    def test_round_trip_is_machine_precision(self):
        result = predictions_anchor_independent(rel_tol=1e-10)
        assert result["all_consistent"]
        assert result["max_deviation"] < 1e-10

    def test_all_registry_rows_were_checked(self):
        result = predictions_anchor_independent()
        # registry currently has ~27 entries
        assert result["n_checked"] >= 20


# ── Test 2: Cathedral coefficient extraction in M★ units ──────────────────

class TestCathedralCoefficientsInMStar:

    def test_coefficients_dict_has_expected_entries(self):
        coefs = cathedral_coefficients_in_M_star()
        assert "v_EW" in coefs
        assert "m_e"  in coefs
        assert "m_p"  in coefs
        assert "Lambda_QCD" in coefs
        assert "M_GUT" in coefs
        assert "rho_Lambda_over_M_star4" in coefs

    def test_v_EW_in_M_star_units_is_small_positive(self):
        coefs = cathedral_coefficients_in_M_star()
        x = coefs["v_EW"]["in_M_star_units"]
        # v_EW ≈ 246 GeV, M★ ≈ 3.2e19 GeV → x ≈ 7.7e-18
        assert 1e-18 < x < 1e-16

    def test_m_p_in_M_star_units_lighter_than_v_EW(self):
        coefs = cathedral_coefficients_in_M_star()
        x_p   = coefs["m_p"]["in_M_star_units"]
        x_ew  = coefs["v_EW"]["in_M_star_units"]
        assert x_p < x_ew

    def test_rho_Lambda_M_star4_around_10_to_minus_124(self):
        coefs = cathedral_coefficients_in_M_star()
        x = coefs["rho_Lambda_over_M_star4"]["value"]
        # Λ/M★⁴ ≈ Λ/M_Pl⁴ × (M_Pl/M★)⁴
        #        ≈ 1.35e-123 × (0.381)⁴
        #        ≈ 1.35e-123 × 0.0211
        #        ≈ 2.8e-125 → order 10^-125 to 10^-124
        assert 1e-127 < x < 1e-123


# ── Test 5 (continued): new prediction candidates ─────────────────────────

class TestNewPredictionCandidates:

    def test_compton_schwarzschild_crossover_is_M_Pl_over_sqrt_2(self):
        # crossover mass m_c = 1/√(2 G_N) = M_Pl/√2
        m_c = compton_schwarzschild_crossover_mass_GeV()
        # ≈ 8.63 × 10^18 GeV
        assert abs(m_c - 8.63e18) / 8.63e18 < 0.01

    def test_hawking_temperature_at_M_star_is_below_Planck(self):
        # T_H = 1/(8π G M★) — at M★ slightly above M_Pl, T_H slightly
        # below T_Pl.  Order of magnitude check.
        T = hawking_temperature_at_M_star_GeV()
        # T_Pl ≈ 1.4e19 GeV / (8π) ≈ 5.6e17
        # T at M★ ≈ T_Pl / (M★/M_Pl) ≈ 5.6e17 / 2.6 ≈ 2.1e17
        assert 1e17 < T < 5e17


# ── Audit gate ────────────────────────────────────────────────────────────

class TestAuditGate:

    def test_audit_passes(self):
        assert cathedral_mass_audit_passes()

    def test_audit_dict_complete(self):
        a = cathedral_mass_audit()
        for key in [
            "G_N_M_star_sq", "identity_value_check",
            "anchor_routes", "max_anchor_deviation",
            "anchors_consistent", "predictions_round_trip_max",
            "predictions_consistent", "n_predictions_checked",
            "M_star_value", "classical_match",
            "is_new_cathedral_constant",
        ]:
            assert key in a, f"audit missing key: {key}"

    def test_M_star_is_new_cathedral_constant(self):
        # The framework gains a new closed-form constant, not a
        # relabeling of one that already lives in classical math.
        a = cathedral_mass_audit()
        assert a["is_new_cathedral_constant"] is True
