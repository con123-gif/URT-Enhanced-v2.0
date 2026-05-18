"""Anchor-free scale chain: ρ_Λ → M_Pl → v_EW → m_e → m_p → Λ_QCD → r_p."""
from newtons_cathedral.chain import (
    LAMBDA_OVER_MPL4, LAMBDA_QCD_MEV, M_E_MEV, M_PL_GEV, M_P_MEV,
    R_PROTON_FM, V_EW_GEV, chain_audit,
)


def test_lambda_over_mpl4_planck_match():
    assert abs(LAMBDA_OVER_MPL4 - 1.35e-123) / 1.35e-123 < 1e-2

def test_m_pl_within_1ppt_of_codata():
    assert abs(M_PL_GEV - 1.2209e19) / 1.2209e19 < 1e-3

def test_v_EW_within_1ppt_of_pdg():
    assert abs(V_EW_GEV - 246.22) / 246.22 < 1e-3

def test_m_e_within_1ppt_of_codata():
    assert abs(M_E_MEV - 0.5109989) / 0.5109989 < 1e-3

def test_m_p_within_1ppt_of_codata():
    assert abs(M_P_MEV - 938.272) / 938.272 < 1e-3

def test_lambda_qcd_within_1pct_of_pdg():
    assert abs(LAMBDA_QCD_MEV - 210.0) / 210.0 < 1e-2

def test_r_p_within_1ppt_of_codata():
    assert abs(R_PROTON_FM - 0.8409) / 0.8409 < 1e-3

def test_audit_passes():
    assert chain_audit()
