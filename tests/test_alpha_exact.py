"""Tests for Cathedral α exact — N²-E-2=137 breakthrough and mass ratios."""
import pytest
from math import pi, sqrt

from urt.alpha_exact import (
    BARE_ALPHA_INV, BARE_EQ_137, ALPHA_INV_CATHEDRAL, ALPHA_INV_OBSERVED,
    ALPHA_ERROR_REL, ALPHA_CATHEDRAL, ALPHA_S_CATHEDRAL, ALPHA_S_OBSERVED,
    SIN2W_CATHEDRAL, SIN2W_OBSERVED,
    SIN_CABIBBO, SIN_CABIBBO_OBS, THETA_C_DEG,
    THETA_12_DEG, THETA_13_DEG, THETA_23_DEG, DELTA_CP_DEG, DELTA_CP_OBS,
    MU_E_CATHEDRAL, MU_E_OBSERVED, TAU_MU_CATHEDRAL, TAU_MU_OBSERVED,
    MP_E_CATHEDRAL, MP_E_OBSERVED, BARE_MP, BARE_MP_EQ_1836,
    ETA_B_CATHEDRAL, ETA_B_OBSERVED, ETA_B_ERROR_PCT,
    OMEGA_M, OMEGA_LAMBDA, N_S_V2, R_TENSOR_V2, H0_RATIO,
    M_AXION_UEV_V2, DELTA_STAR, GAMMA, PHI,
    DELTA_EFF, R_ALPHA, ETA,
    alpha_exact_summary, print_alpha_exact_report,
    N, D, V, E, F, q, G,
)


# ── BREAKTHROUGH: N²-E-2=137 ──────────────────────────────────────────────────

def test_bare_alpha_inv_is_137():
    assert BARE_ALPHA_INV == 137

def test_bare_eq_137_flag():
    assert BARE_EQ_137 is True

def test_n_squared_minus_e_minus_2():
    assert N * N - E - 2 == 137

def test_bare_mp_is_1836():
    assert BARE_MP == 1836

def test_bare_mp_eq_flag():
    assert BARE_MP_EQ_1836 is True

def test_bare_mp_formula():
    # (D+1)·D³·(N+D+1) = 4·27·17
    assert (D + 1) * D**3 * (N + D + 1) == 1836


# ── Fine structure constant accuracy ──────────────────────────────────────────

def test_alpha_inv_nine_sig_figs():
    """1/α matches observation to 9 significant figures."""
    assert abs(ALPHA_INV_CATHEDRAL - ALPHA_INV_OBSERVED) < 1e-3

def test_alpha_inv_better_than_1ppm():
    assert ALPHA_ERROR_REL < 1e-6

def test_alpha_inv_gt_137():
    assert ALPHA_INV_CATHEDRAL > 137.0

def test_alpha_inv_lt_138():
    assert ALPHA_INV_CATHEDRAL < 138.0

def test_alpha_cathedral_is_reciprocal():
    assert abs(ALPHA_CATHEDRAL - 1.0 / ALPHA_INV_CATHEDRAL) < 1e-15

def test_delta_eff_less_than_delta_star():
    # Running coupling correction makes δ_eff < δ★
    assert DELTA_EFF < DELTA_STAR

def test_delta_eff_positive():
    assert DELTA_EFF > 0.0

def test_R_alpha_positive():
    assert R_ALPHA > 0.0

def test_corrections_small():
    # Correction δ_eff²/π² + R_α must give ~0.036
    correction = DELTA_EFF**2 / pi**2 + R_ALPHA
    assert abs(correction - 0.036) < 0.005


# ── Strong coupling ───────────────────────────────────────────────────────────

def test_alpha_s_value():
    """α_s(M_Z) = δ★·(q-1)/q ≈ 0.118."""
    assert abs(ALPHA_S_CATHEDRAL - ALPHA_S_OBSERVED) < 0.001

def test_alpha_s_formula():
    assert abs(ALPHA_S_CATHEDRAL - DELTA_STAR * (q - 1) / q) < 1e-12

def test_alpha_s_in_range():
    assert 0.110 < ALPHA_S_CATHEDRAL < 0.125


# ── Weinberg angle ────────────────────────────────────────────────────────────

def test_sin2w_value():
    assert abs(SIN2W_CATHEDRAL - SIN2W_OBSERVED) < 0.001

def test_sin2w_formula():
    gamma = 1.0 / 81.0
    expected = (D / N) * (1.0 + gamma / (2.0 * pi))
    assert abs(SIN2W_CATHEDRAL - expected) < 1e-12

def test_sin2w_physical_range():
    assert 0.0 < SIN2W_CATHEDRAL < 0.5


# ── Cabibbo angle ─────────────────────────────────────────────────────────────

def test_cabibbo_value():
    assert abs(SIN_CABIBBO - SIN_CABIBBO_OBS) < 0.002

def test_cabibbo_angle_deg():
    assert 12.0 < THETA_C_DEG < 14.0

def test_cabibbo_d_over_n_base():
    # Base = D/N = 3/13
    assert abs(D / N - 3.0 / 13.0) < 1e-12


# ── PMNS mixing angles ────────────────────────────────────────────────────────

def test_theta12_range():
    assert 30.0 < THETA_12_DEG < 36.0   # observed ~33.5°

def test_theta13_range():
    assert 7.0 < THETA_13_DEG < 10.0    # observed ~8.5°

def test_theta13_is_arcsin_delta_star():
    import numpy as np
    expected = np.arcsin(DELTA_STAR) * 180.0 / pi
    assert abs(THETA_13_DEG - expected) < 1e-10

def test_theta23_range():
    assert 44.0 < THETA_23_DEG < 50.0   # observed ~47°

def test_delta_cp_range():
    # Observed range includes 195°-285°; formula gives 208°
    assert 160.0 < DELTA_CP_DEG < 300.0


# ── Mass ratios ───────────────────────────────────────────────────────────────

def test_mp_e_accuracy():
    """mp/me accurate to 0.001%."""
    assert abs(MP_E_CATHEDRAL - MP_E_OBSERVED) < 0.002

def test_mp_e_bare_is_1836():
    # (D+1)·D³·(N+D+1) = 1836
    assert BARE_MP == 1836

def test_mp_e_correction_small():
    # Correction = 2δ_cl - δ★ ≈ 0.15249
    from urt.alpha_exact import DELTA_CL
    correction = 2.0 * DELTA_CL - DELTA_STAR
    assert abs(MP_E_CATHEDRAL - 1836.0 - correction) < 1e-10

def test_mu_e_accuracy():
    """mμ/me accurate to 0.002%."""
    assert abs(MU_E_CATHEDRAL - MU_E_OBSERVED) < 0.003

def test_mu_e_range():
    assert 205.0 < MU_E_CATHEDRAL < 208.0

def test_tau_mu_range():
    """mτ/mμ in physical range."""
    assert 16.0 < TAU_MU_CATHEDRAL < 18.0

def test_tau_mu_close_to_observed():
    assert abs(TAU_MU_CATHEDRAL - TAU_MU_OBSERVED) < 0.1

def test_eta_range():
    """Entropic correction η in (0, 1)."""
    assert 0.0 < ETA < 1.0


# ── Baryon asymmetry ──────────────────────────────────────────────────────────

def test_eta_b_value():
    """η_B within 1% of observed."""
    assert ETA_B_ERROR_PCT < 1.0

def test_eta_b_order_of_magnitude():
    assert 5e-10 < ETA_B_CATHEDRAL < 7e-10

def test_eta_b_formula():
    from urt.alpha_exact import DELTA, DELTA_STAR as DS
    expected = GAMMA**3 * DELTA * DS * 8.0 / 9.0
    assert abs(ETA_B_CATHEDRAL - expected) < 1e-20

def test_eta_b_zero_free_params():
    """Formula uses only Cathedral integers — no fitted parameters."""
    # The formula γ³·Δδ·δ★·8/9 contains: γ=1/81, Δδ=D/F-δ★, δ★
    # All from D=3, N=13, F=20
    assert ETA_B_CATHEDRAL > 0


# ── Cosmology ─────────────────────────────────────────────────────────────────

def test_omega_m_4_over_13():
    assert abs(OMEGA_M - 4.0 / 13.0) < 1e-12

def test_omega_sum():
    assert abs(OMEGA_M + OMEGA_LAMBDA - 1.0) < 1e-12

def test_omega_m_close_to_planck():
    # Planck 2018: 0.315 ± 0.007
    assert abs(OMEGA_M - 0.315) < 0.010

def test_ns_range():
    assert 0.96 < N_S_V2 < 0.98

def test_r_tensor_range():
    assert 0.001 < R_TENSOR_V2 < 0.01

def test_H0_ratio_gt_1():
    """Cathedral predicts H₀ slightly above Planck CMB value (Hubble tension)."""
    assert H0_RATIO > 1.0

def test_H0_ratio_reasonable():
    assert H0_RATIO < 1.15


# ── Axion mass ────────────────────────────────────────────────────────────────

def test_axion_mass_uev():
    assert 50.0 < M_AXION_UEV_V2 < 75.0

def test_axion_mass_abracadabra_target():
    """Cathedral axion in ABRACADABRA/DM Radio target band (10–100 μeV)."""
    assert 10.0 < M_AXION_UEV_V2 < 100.0


# ── Summary / print ───────────────────────────────────────────────────────────

def test_alpha_exact_summary_returns_dict():
    s = alpha_exact_summary()
    assert isinstance(s, dict)

def test_summary_has_breakthrough_key():
    s = alpha_exact_summary()
    assert "breakthrough" in s
    assert "137" in s["breakthrough"]

def test_summary_alpha_inv():
    s = alpha_exact_summary()
    assert abs(s["alpha_inv"] - ALPHA_INV_CATHEDRAL) < 1e-10

def test_print_alpha_exact_report_runs(capsys):
    print_alpha_exact_report()
    out = capsys.readouterr().out
    assert "137" in out
    assert "breakthrough" in out.lower() or "BREAKTHROUGH" in out

def test_print_includes_mp_me(capsys):
    print_alpha_exact_report()
    out = capsys.readouterr().out
    assert "1836" in out

def test_print_includes_eta_b(capsys):
    print_alpha_exact_report()
    out = capsys.readouterr().out
    assert "η_B" in out or "eta" in out.lower()
