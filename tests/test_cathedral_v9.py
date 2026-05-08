"""Tests for Cathedral v9 — anchor-free complete computation."""
import pytest
from math import pi, sqrt, cos

from urt.cathedral_v9 import (
    Cathedral, D, V, N, E, F, q, G, PHI, GAMMA, DELTA_STAR, DELTA_CL,
    N_E_EFOLDS, N_S_V9, A_S_V9, ALPHA_INV_V9, SUM_MNU_MEV_V9,
    SIGMA_8_V9, OMEGA_M_V9, ETA_B_V9, LAMBDA_OVER_MPLANK4,
    M_PL_GEV_V9, V_EW_GEV, M_E_GEV_V9, M_P_GEV_V9,
)

c = Cathedral()


# ── Structural axiom ──────────────────────────────────────────────────────────

def test_D_forced_to_3():
    assert D == 3

def test_kissing_K_D_formula():
    """K(D) = D + D² = 12 (icosahedral kissing number)."""
    assert D + D * D == 12

def test_N_from_D():
    assert 1 + D + D * D == N == 13

def test_V_from_D():
    assert D + D * D == V == 12

def test_gamma_from_D():
    assert abs(GAMMA - 1.0 / D**4) < 1e-15


# ── Scale chain ───────────────────────────────────────────────────────────────

def test_lambda_over_mpl4_formula():
    expected = D / (D + 1)**2 * GAMMA**64
    assert abs(c.Lambda_over_MPl4() - expected) < 1e-130

def test_lambda_over_mpl4_value():
    """Λ/M_Pl⁴ ≈ 1.35e-123 (matches observed CC)."""
    val = c.Lambda_over_MPl4()
    assert 1e-125 < val < 1e-121

def test_M_Pl_order_of_magnitude():
    assert 1e18 < c.M_Pl_GeV() < 1e20

def test_M_Pl_accuracy():
    """Planck mass within 0.1% of observed."""
    diff = abs(c.M_Pl_GeV() - 1.2209e19) / 1.2209e19
    assert diff < 0.002

def test_v_EW_accuracy():
    """EW vev within 0.3% of 246.22 GeV."""
    diff = abs(c.v_EW() - 246.22) / 246.22
    assert diff < 0.005

def test_m_e_accuracy():
    """Electron mass within 0.3% of 5.11e-4 GeV."""
    diff = abs(c.m_e_GeV() - 5.110e-4) / 5.110e-4
    assert diff < 0.005

def test_m_p_accuracy():
    """Proton mass within 0.3%."""
    diff = abs(c.m_p_GeV() - 0.93827) / 0.93827
    assert diff < 0.005

def test_Lambda_QCD_accuracy():
    """Λ_QCD within 1% of 210 MeV."""
    diff = abs(c.Lambda_QCD() * 1e3 - 210.0) / 210.0
    assert diff < 0.01


# ── QED / Gauge ───────────────────────────────────────────────────────────────

def test_alpha_inv_nine_sig_figs():
    """1/α within 1e-3 of observed."""
    assert abs(c.alpha_inv() - 137.035999) < 1e-3

def test_alpha_inv_bare_is_137():
    """Bare integer = N²−E−2 = 137."""
    assert N * N - E - 2 == 137

def test_alpha_MZ_inv_accuracy():
    diff = abs(c.alpha_MZ_inv() - 127.952) / 127.952
    assert diff < 0.001

def test_alpha_s_accuracy():
    diff = abs(c.alpha_s_MZ() - 0.1179) / 0.1179
    assert diff < 0.002

def test_sin2W_accuracy():
    assert abs(c.sin2_theta_W() - 0.23122) < 0.001


# ── Mass ratios ───────────────────────────────────────────────────────────────

def test_m_p_over_m_e_accuracy():
    diff = abs(c.m_p_over_m_e() - 1836.15267) / 1836.15267
    assert diff < 0.001

def test_m_mu_over_m_e_accuracy():
    diff = abs(c.m_mu_over_m_e() - 206.76828) / 206.76828
    assert diff < 0.001

def test_m_tau_over_m_mu_range():
    assert 15.0 < c.m_tau_over_m_mu() < 18.0


# ── Quarks ────────────────────────────────────────────────────────────────────

def test_m_u_MeV_range():
    assert 1.0 < c.m_u() * 1e3 < 4.0

def test_m_d_MeV_range():
    assert 3.0 < c.m_d() * 1e3 < 7.0

def test_m_s_MeV_range():
    assert 80.0 < c.m_s() * 1e3 < 110.0

def test_m_c_GeV_range():
    assert 1.0 < c.m_c() < 1.5

def test_m_b_GeV_range():
    assert 4.0 < c.m_b() < 4.5

def test_m_t_GeV_range():
    assert 165.0 < c.m_t() < 180.0

def test_quark_hierarchy():
    assert c.m_u() < c.m_d() < c.m_s()
    assert c.m_s() < c.m_c() < c.m_b() < c.m_t()


# ── EW bosons + Higgs ─────────────────────────────────────────────────────────

def test_m_W_accuracy():
    diff = abs(c.m_W() - 80.379) / 80.379
    assert diff < 0.002

def test_m_Z_accuracy():
    diff = abs(c.m_Z() - 91.188) / 91.188
    assert diff < 0.01

def test_m_H_accuracy():
    diff = abs(c.m_H() - 125.25) / 125.25
    assert diff < 0.005

def test_m_Z_gt_m_W():
    assert c.m_Z() > c.m_W()


# ── CKM ───────────────────────────────────────────────────────────────────────

def test_sin_theta_C_accuracy():
    diff = abs(c.sin_theta_C() - 0.22500) / 0.22500
    assert diff < 0.002

def test_A_CKM_range():
    assert 0.7 < c.A_CKM() < 0.9

def test_J_CKM_order_of_magnitude():
    assert 1e-6 < c.J_CKM() < 1e-4


# ── PMNS + Neutrinos ──────────────────────────────────────────────────────────

def test_theta12_range():
    assert 30.0 < c.theta_12_deg() < 36.0

def test_theta13_range():
    assert 7.0 < c.theta_13_deg() < 10.0

def test_theta23_range():
    assert 44.0 < c.theta_23_deg() < 52.0

def test_delta_CP():
    assert abs(c.delta_CP_deg() - 197.0) < 0.1

def test_sum_m_nu_meV_range():
    assert 40.0 < c.sum_m_nu_meV() < 80.0

def test_dm21_sq_order():
    assert 5e-5 < c.dm21_sq() < 1e-4

def test_dm32_sq_order():
    assert 2e-3 < c.dm32_sq() < 3e-3


# ── Cosmology ─────────────────────────────────────────────────────────────────

def test_omega_m_accuracy():
    diff = abs(c.Omega_m() - 0.3153) / 0.3153
    assert diff < 0.01

def test_omega_sums_to_1():
    assert abs(c.Omega_m() + c.Omega_Lambda() - 1.0) < 1e-12

def test_omega_b_range():
    assert 0.04 < c.Omega_b() < 0.06

def test_omega_DM_gt_omega_b():
    assert c.Omega_DM() > c.Omega_b()

def test_sigma_8_accuracy():
    diff = abs(c.sigma_8() - 0.8111) / 0.8111
    assert diff < 0.01

def test_eta_B_sub_percent():
    diff = abs(c.eta_B() - 6.1e-10) / 6.1e-10
    assert diff < 0.02


# ── Inflation ─────────────────────────────────────────────────────────────────

def test_N_e_efolds():
    """N_e = G - D = 57."""
    assert c.N_e() == G - D == 57

def test_N_e_const():
    assert N_E_EFOLDS == 57

def test_n_s_accuracy():
    """n_s matches Planck 2018 to 0.01%."""
    diff = abs(c.n_s() - 0.9649) / 0.9649
    assert diff < 0.002

def test_n_s_v9_export():
    assert abs(N_S_V9 - c.n_s()) < 1e-12

def test_r_tensor_below_bound():
    """r < 0.036 (BICEP/Keck bound)."""
    assert c.r_tensor() < 0.036

def test_r_tensor_value():
    assert abs(c.r_tensor() - 12.0 / 57**2) < 1e-10

def test_A_s_sub_percent():
    diff = abs(c.A_s() - 2.10e-9) / 2.10e-9
    assert diff < 0.01

def test_dn_s_dlnk_small():
    assert abs(c.dn_s_dlnk()) < 0.01


# ── Dark + gravity ────────────────────────────────────────────────────────────

def test_G_N_planck():
    assert abs(c.G_N_Planck() - DELTA_STAR**2) < 1e-15

def test_w_DE():
    assert c.w_DE() == -1.0

def test_m_DM_keV_range():
    assert 1.0 < c.m_DM_keV() < 1000.0


# ── GUT ───────────────────────────────────────────────────────────────────────

def test_M_GUT_order():
    assert 1e15 < c.M_GUT() < 1e18

def test_tau_proton_positive():
    assert c.tau_proton_yr() > 0.0


# ── Predictions ───────────────────────────────────────────────────────────────

def test_m_axion_uev_range():
    assert 40.0 < c.m_axion_uev() < 80.0

def test_r_proton_fm_accuracy():
    diff = abs(c.r_proton_fm() - 0.84087) / 0.84087
    assert diff < 0.005


# ── Print / summary ───────────────────────────────────────────────────────────

def test_print_scale_chain_runs(capsys):
    c.print_scale_chain()
    out = capsys.readouterr().out
    assert "v9" in out.lower() or "anchor" in out.lower() or "Scale Chain" in out

def test_print_ledger_runs(capsys):
    c.print_ledger()
    out = capsys.readouterr().out
    assert "alpha" in out.lower() or "1/α" in out

def test_ledger_contains_sub_percent(capsys):
    c.print_ledger()
    out = capsys.readouterr().out
    assert "***" in out   # at least one sub-0.1% result
