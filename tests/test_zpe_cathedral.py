"""Tests for ZPE Cathedral — Casimir force, Scharnhorst effect, EHD thrust."""
import pytest
from math import pi, sqrt

from urt.zpe_cathedral import (
    DELTA_STAR, GAMMA, PHI,
    RHO_ZPE_CATHEDRAL, RHO_LAMBDA_OBS, ZPE_TO_LAMBDA_RATIO,
    D_OPT_CASIMIR, A0_BOHR, LAMBDA_C, LAMBDA_THERMAL, D_THERMAL_STAR,
    SCHARNHORST_100NM, SCHARNHORST_CAT,
    T_EHD_PRACTICAL, T_EHD_BREAKDOWN, T_EHD_STANDARD,
    THRUST_ENHANCEMENT, P_EHD_PRACTICAL, THRUST_TO_POWER,
    E_DIELECTRIC_BREAKDOWN, A_DEMO, E_PRACTICAL,
    OMEGA_RESONANCE, P_CASIMIR_ENGINE, DF_DD,
    CASIMIR_CATHEDRAL_CORRECTION_PPM,
    casimir_force, casimir_force_cathedral, casimir_pressure,
    scharnhorst_shift, scharnhorst_shift_cathedral,
    ehd_thrust_cathedral, ehd_thrust_standard, ehd_power,
    zpe_summary, print_zpe_report,
    HBAR, C_LIGHT, EPSILON_0,
)


# ── ZPE density ───────────────────────────────────────────────────────────────

def test_rho_zpe_cathedral_positive():
    assert RHO_ZPE_CATHEDRAL > 0.0

def test_rho_zpe_cathedral_formula():
    from urt.zpe_cathedral import RHO_PLANCK
    expected = DELTA_STAR**2 * RHO_PLANCK / (4.0 * pi)
    assert abs(RHO_ZPE_CATHEDRAL - expected) / expected < 1e-10

def test_rho_lambda_obs_positive():
    assert RHO_LAMBDA_OBS > 0.0

def test_zpe_to_lambda_ratio_large():
    # ZPE density >> cosmological constant density
    assert ZPE_TO_LAMBDA_RATIO > 1e50


# ── Casimir force ─────────────────────────────────────────────────────────────

def test_casimir_force_attractive():
    F = casimir_force(100e-9, 1e-4)
    assert F < 0.0

def test_casimir_force_millinewton_at_100nm():
    """Casimir force at 100nm, 1cm² is ~1 mN."""
    F = casimir_force(100e-9, 1e-4)
    assert abs(F) > 1e-4   # > 0.1 mN
    assert abs(F) < 1e-1   # < 100 mN

def test_casimir_force_scales_as_d4():
    """Force scales as d⁻⁴."""
    F1 = casimir_force(100e-9, 1e-4)
    F2 = casimir_force(200e-9, 1e-4)
    ratio = abs(F1 / F2)
    assert abs(ratio - 16.0) < 0.01   # (200/100)⁴ = 16

def test_casimir_force_formula():
    d = 100e-9; A = 1e-4
    expected = -(pi**2 * HBAR * C_LIGHT) / (240.0 * d**4) * A
    assert abs(casimir_force(d, A) - expected) < 1e-20

def test_casimir_cathedral_correction_positive():
    assert CASIMIR_CATHEDRAL_CORRECTION_PPM > 0.0

def test_casimir_cathedral_differs_from_std():
    d = 100e-9; A = 1e-4
    F_std = casimir_force(d, A)
    F_cat = casimir_force_cathedral(d, A)
    assert F_cat != F_std

def test_casimir_pressure_negative():
    assert casimir_pressure(100e-9) < 0.0

def test_d_opt_casimir_bohr_scaled():
    """Cathedral optimal cavity = a₀/δ★."""
    expected = A0_BOHR / DELTA_STAR
    assert abs(D_OPT_CASIMIR - expected) < 1e-20

def test_d_opt_casimir_sub_nm():
    assert D_OPT_CASIMIR < 1e-9   # sub-nanometre

def test_lambda_thermal_micrometres():
    assert 5e-6 < LAMBDA_THERMAL < 10e-6

def test_d_thermal_star_lt_thermal():
    assert D_THERMAL_STAR < LAMBDA_THERMAL


# ── Scharnhorst effect ────────────────────────────────────────────────────────

def test_scharnhorst_positive():
    assert SCHARNHORST_100NM > 0.0

def test_scharnhorst_tiny():
    """Scharnhorst shift is extremely small — below current detection."""
    assert SCHARNHORST_100NM < 1e-20

def test_scharnhorst_cathedral_positive():
    assert SCHARNHORST_CAT > 0.0

def test_scharnhorst_scales_as_d4():
    s1 = scharnhorst_shift(100e-9)
    s2 = scharnhorst_shift(200e-9)
    assert abs(s1 / s2 - 16.0) < 0.01

def test_scharnhorst_cathedral_differs_from_std():
    assert SCHARNHORST_CAT != SCHARNHORST_100NM


# ── EHD thrust ────────────────────────────────────────────────────────────────

def test_ehd_thrust_positive():
    assert T_EHD_PRACTICAL > 0.0

def test_ehd_thrust_millinewton_range():
    """At 1MV/m, 100cm²: T in mN range."""
    assert T_EHD_PRACTICAL > 1e-4   # > 0.1 mN
    assert T_EHD_PRACTICAL < 1.0    # < 1 N

def test_ehd_thrust_cathedral_formula():
    expected = EPSILON_0 * E_PRACTICAL**2 * A_DEMO * DELTA_STAR
    assert abs(T_EHD_PRACTICAL - expected) < 1e-20

def test_ehd_thrust_scales_as_e2():
    T1 = ehd_thrust_cathedral(1e6, 1e-4)
    T2 = ehd_thrust_cathedral(2e6, 1e-4)
    assert abs(T2 / T1 - 4.0) < 0.001

def test_ehd_thrust_vs_standard():
    """Cathedral thrust = standard × 2δ★."""
    ratio = T_EHD_PRACTICAL / T_EHD_STANDARD
    assert abs(ratio - 2.0 * DELTA_STAR) < 1e-10

def test_thrust_enhancement_is_2delta_star():
    assert abs(THRUST_ENHANCEMENT - 2.0 * DELTA_STAR) < 1e-10

def test_thrust_enhancement_lt_1():
    """Cathedral EHD enhancement < 1 (not violating Maxwell stress)."""
    assert THRUST_ENHANCEMENT < 1.0

def test_ehd_breakdown_field():
    """E_c = π·φ·10⁷ V/m."""
    expected = pi * PHI * 1e7
    assert abs(E_DIELECTRIC_BREAKDOWN - expected) < 1.0

def test_ehd_breakdown_thrust_larger():
    assert T_EHD_BREAKDOWN > T_EHD_PRACTICAL

def test_ehd_power_positive():
    assert P_EHD_PRACTICAL > 0.0

def test_thrust_to_power_positive():
    assert THRUST_TO_POWER > 0.0


# ── Cathedral vacuum engine ───────────────────────────────────────────────────

def test_omega_resonance_optical():
    """Resonance at 100nm cavity is in optical range."""
    assert 1e13 < OMEGA_RESONANCE < 1e16

def test_df_dd_positive():
    assert DF_DD > 0.0

def test_casimir_engine_power_positive():
    assert P_CASIMIR_ENGINE > 0.0


# ── Summary / print ───────────────────────────────────────────────────────────

def test_zpe_summary_returns_dict():
    s = zpe_summary()
    assert isinstance(s, dict)

def test_zpe_summary_keys():
    s = zpe_summary()
    assert "F_casimir_100nm_1cm2_N" in s
    assert "T_ehd_practical_N" in s
    assert "scharnhorst_100nm" in s

def test_zpe_summary_casimir_negative():
    s = zpe_summary()
    assert s["F_casimir_100nm_1cm2_N"] < 0.0

def test_zpe_summary_thrust_positive():
    s = zpe_summary()
    assert s["T_ehd_practical_N"] > 0.0

def test_print_zpe_report_runs(capsys):
    print_zpe_report()
    out = capsys.readouterr().out
    assert "Casimir" in out

def test_print_zpe_report_contains_ehd(capsys):
    print_zpe_report()
    out = capsys.readouterr().out
    assert "EHD" in out or "thrust" in out.lower()

def test_print_zpe_report_contains_scharnhorst(capsys):
    print_zpe_report()
    out = capsys.readouterr().out
    assert "Scharnhorst" in out or "scharnhorst" in out.lower()
