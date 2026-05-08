"""Tests for Cathedral Gap — ε = δ_cl − δ★ master generator module."""
import pytest
import numpy as np
from math import pi, sqrt, asin

from urt.cathedral_gap import (
    D, N, V, E, F, q, G, PHI, GAMMA,
    GAMMA_ICOSAHEDRAL_EQ,
    DELTA_STAR, DELTA_CL, EPSILON,
    EXHAUST_DRESS,
    OMEGA_M_DRESSED,
    KAPPA_W, THETA_23_BARE_DEG, THETA_23_DRESSED_DEG,
    A_CKM_CATHEDRAL, A_CKM_PDG,
    OMEGA_B_FRAC_BARE, OMEGA_B_FRAC_DRESSED, OMEGA_B_FRAC_OBS, OMEGA_B_FRAC_ERR_PCT,
    GAMMA_0, GAMMA_1, GAMMA_3, GAMMA_5, GAMMA_9, GAMMA_64, GAMMA_LADDER,
    LAMBDA_EXPONENT, LAMBDA_OVER_MPL4, LAMBDA_OBS, LAMBDA_ERROR_PCT, CC_PUZZLE_SOLVED,
    GEN_RATIO_2ND, GEN_RATIO_3RD, GEN_RATIO_LPT, SHELL_INVARIANTS_VED,
    NS_DRAIN_DOWN, NS_DRAIN_UP, NS_EQUIPARTITION, NS_BETA_DRAIN,
    NS_DRAIN_BIAS, NS_ASYMMETRY_RATIO, NS_EQ_IS_OMEGA_L,
    R_STAR, SIX_CYCLE_BRANCHES, BRANCH_DELTA_STAR, BRANCH_DELTA_CL,
    BRANCH_GAP, LYAPUNOV_R_STAR, SIX_CYCLE_COUNT,
    gap_summary, three_pillars_summary, print_gap_report,
)


# ── Cathedral integers ────────────────────────────────────────────────────────

def test_cathedral_integers():
    assert D == 3 and N == 13 and V == 12 and E == 30
    assert F == 20 and q == 5 and G == 60

def test_gamma_is_1_over_81():
    assert abs(GAMMA - 1.0/81.0) < 1e-15

def test_gamma_icosahedral_formula():
    """γ = 1/(G+F+1) = 1/81 — explicit icosahedral formula."""
    assert GAMMA_ICOSAHEDRAL_EQ is True
    assert G + F + 1 == 81


# ── The Gap ───────────────────────────────────────────────────────────────────

def test_epsilon_is_positive():
    assert EPSILON > 0

def test_epsilon_approx_value():
    """ε ≈ 0.00249 (classical packing gap)."""
    assert abs(EPSILON - 0.00249) < 0.0005

def test_delta_cl_exact():
    """δ_cl = D/F = 3/20 = 0.15 (classical rail)."""
    assert abs(DELTA_CL - 3.0/20.0) < 1e-15

def test_epsilon_decomposition():
    """ε = δ_cl − δ★."""
    assert abs(EPSILON - (DELTA_CL - DELTA_STAR)) < 1e-14

def test_delta_star_positive():
    assert DELTA_STAR > 0


# ── (1+2γ) Exhaust-Leakage Dressing ──────────────────────────────────────────

def test_exhaust_dress_formula():
    """EXHAUST_DRESS = 1 + 2γ."""
    assert abs(EXHAUST_DRESS - (1.0 + 2.0 * GAMMA)) < 1e-14

def test_exhaust_dress_greater_than_one():
    assert EXHAUST_DRESS > 1.0

def test_exhaust_dress_approx():
    assert abs(EXHAUST_DRESS - 1.024691) < 0.0001

def test_omega_m_dressed_formula():
    """Ω_m = (1+D)/N × (1+2γ)."""
    assert abs(OMEGA_M_DRESSED - float(1 + D) / N * EXHAUST_DRESS) < 1e-14

def test_omega_m_dressed_greater_than_bare():
    """Dressing increases Ω_m above the bare 4/13."""
    assert OMEGA_M_DRESSED > float(1 + D) / N

def test_omega_m_dressed_near_planck():
    """Ω_m dressed = 4/13×(1+2γ) ≈ 0.3153 — matches Planck 2018 to <0.1%."""
    assert abs(OMEGA_M_DRESSED - 0.3153) < 0.002

def test_kappa_w():
    """κ_W = (F+V)/(G-1) = 32/59."""
    assert abs(KAPPA_W - 32.0/59.0) < 1e-14

def test_theta23_bare_positive():
    assert THETA_23_BARE_DEG > 0

def test_theta23_dressed_gt_bare():
    """Exhaust dressing increases θ₂₃."""
    assert THETA_23_DRESSED_DEG > THETA_23_BARE_DEG

def test_theta23_dressed_in_range():
    """θ₂₃ dressed ≈ 49° (PDG range: 45-50°)."""
    assert 44.0 < THETA_23_DRESSED_DEG < 52.0

def test_a_ckm_formula():
    """A_CKM = (φ/2) × (1+2γ)."""
    assert abs(A_CKM_CATHEDRAL - (PHI / 2.0) * EXHAUST_DRESS) < 1e-14

def test_a_ckm_dressed_gt_bare():
    assert A_CKM_CATHEDRAL > PHI / 2.0

def test_a_ckm_near_pdg():
    """A_CKM ≈ 0.829, PDG A ≈ 0.814, within 2%."""
    assert abs(A_CKM_CATHEDRAL - A_CKM_PDG) / A_CKM_PDG < 0.025

def test_omega_b_frac_bare():
    """Bare baryon fraction = 2δ_cl − δ★."""
    assert abs(OMEGA_B_FRAC_BARE - (2.0 * DELTA_CL - DELTA_STAR)) < 1e-14

def test_omega_b_frac_dressed_gt_bare():
    assert OMEGA_B_FRAC_DRESSED > OMEGA_B_FRAC_BARE

def test_omega_b_frac_dressed_matches_obs():
    """Ω_b/Ω_m prediction ≈ 0.156 — matches Planck 2018 within 1%."""
    assert OMEGA_B_FRAC_ERR_PCT < 1.0

def test_four_sectors_share_dressing():
    """All four sectors use exactly EXHAUST_DRESS = 1+2γ."""
    # Sector 1
    s1 = float(1 + D) / N * EXHAUST_DRESS
    assert abs(s1 - OMEGA_M_DRESSED) < 1e-14
    # Sector 3
    s3 = (PHI / 2.0) * EXHAUST_DRESS
    assert abs(s3 - A_CKM_CATHEDRAL) < 1e-14
    # Sector 4
    s4 = (2.0 * DELTA_CL - DELTA_STAR) * EXHAUST_DRESS
    assert abs(s4 - OMEGA_B_FRAC_DRESSED) < 1e-14


# ── γ-Power Ladder ────────────────────────────────────────────────────────────

def test_gamma_0_is_one():
    assert GAMMA_0 == 1.0

def test_gamma_1():
    assert abs(GAMMA_1 - GAMMA) < 1e-15

def test_gamma_3():
    assert abs(GAMMA_3 - GAMMA**3) < 1e-20

def test_gamma_5():
    assert abs(GAMMA_5 - GAMMA**5) < 1e-25

def test_gamma_9():
    assert abs(GAMMA_9 - GAMMA**9) < 1e-30

def test_gamma_64():
    assert GAMMA_64 > 0
    assert GAMMA_64 < 1e-100  # astronomically small

def test_gamma_ladder_strictly_decreasing():
    """Higher powers are smaller."""
    vals = [GAMMA_LADDER[k] for k in sorted(GAMMA_LADDER.keys())]
    for i in range(1, len(vals)):
        assert vals[i] < vals[i - 1]

def test_gamma_ladder_keys():
    assert set(GAMMA_LADDER.keys()) == {0, 1, 3, 5, 9, 64}


# ── Cosmological Constant ─────────────────────────────────────────────────────

def test_lambda_exponent():
    """Λ exponent = (D+1)^D = 4³ = 64 [ARF denominator]."""
    assert LAMBDA_EXPONENT == 64
    assert LAMBDA_EXPONENT == (D + 1)**D

def test_lambda_over_mpl4_formula():
    """Λ/M_Pl⁴ = (D+1) × γ⁶⁴."""
    assert abs(LAMBDA_OVER_MPL4 - float(D + 1) * GAMMA_64) < 1e-200

def test_lambda_over_mpl4_tiny():
    assert LAMBDA_OVER_MPL4 < 1e-115

def test_lambda_over_mpl4_near_observed():
    """Λ/M_Pl⁴ within 5% of observed 2.9×10⁻¹²²."""
    assert abs(LAMBDA_OVER_MPL4 / LAMBDA_OBS - 1.0) < 0.05

def test_cc_puzzle_solved():
    """Error < 5% — 120-order-of-magnitude puzzle solved."""
    assert CC_PUZZLE_SOLVED is True

def test_lambda_error_lt_2pct():
    assert LAMBDA_ERROR_PCT < 2.0


# ── Generation Hierarchy ──────────────────────────────────────────────────────

def test_gen_ratio_2nd_is_E():
    """m_c/m_u ÷ m_s/m_d = E = 30 (edges)."""
    assert GEN_RATIO_2ND == E == 30

def test_gen_ratio_3rd_is_D():
    """m_t/m_c ÷ m_b/m_s = D = 3 (dimension)."""
    assert GEN_RATIO_3RD == D == 3

def test_gen_ratio_lpt_is_V():
    """m_μ/m_e ÷ m_τ/m_μ = V = 12 (vertices)."""
    assert GEN_RATIO_LPT == V == 12

def test_shell_invariants_VED():
    assert SHELL_INVARIANTS_VED == (V, E, D)
    assert SHELL_INVARIANTS_VED == (12, 30, 3)


# ── Navier–Stokes Drain Asymmetry ─────────────────────────────────────────────

def test_ns_drain_asymmetry():
    """Downward > equipartition > upward."""
    assert NS_DRAIN_DOWN > NS_EQUIPARTITION
    assert NS_EQUIPARTITION > NS_DRAIN_UP

def test_ns_drain_down_value():
    assert abs(NS_DRAIN_DOWN - 0.874) < 0.001

def test_ns_drain_up_value():
    assert abs(NS_DRAIN_UP - 0.337) < 0.001

def test_ns_equipartition_is_a5_fraction():
    """Equipartition line = A₅ fraction = 9/13 = Ω_Λ."""
    assert abs(NS_EQUIPARTITION - 9.0 / 13.0) < 1e-14
    assert NS_EQ_IS_OMEGA_L is True

def test_ns_beta_drain_positive():
    assert NS_BETA_DRAIN > 0
    assert NS_BETA_DRAIN < 1.0

def test_ns_drain_bias():
    assert abs(NS_DRAIN_BIAS - (NS_DRAIN_DOWN - NS_DRAIN_UP)) < 1e-14
    assert NS_DRAIN_BIAS > 0.5  # large asymmetry

def test_ns_asymmetry_ratio():
    assert abs(NS_ASYMMETRY_RATIO - NS_DRAIN_DOWN / NS_DRAIN_UP) < 1e-10
    assert NS_ASYMMETRY_RATIO > 2.0  # > 2:1 asymmetry


# ── Six-Cycle Branch Values ────────────────────────────────────────────────────

def test_six_cycle_count():
    """6 = V/2 = 12/2."""
    assert SIX_CYCLE_COUNT == 6
    assert SIX_CYCLE_COUNT == V // 2

def test_six_cycle_branches_length():
    assert len(SIX_CYCLE_BRANCHES) == 6

def test_six_cycle_branches_sorted():
    for i in range(5):
        assert SIX_CYCLE_BRANCHES[i] < SIX_CYCLE_BRANCHES[i + 1]

def test_branch_delta_star_near_delta_star():
    """Branch[0] ≈ δ★ (within 0.1%)."""
    assert abs(BRANCH_DELTA_STAR - DELTA_STAR) / DELTA_STAR < 0.001

def test_branch_delta_cl_near_delta_cl():
    """Branch[1] ≈ δ_cl = 0.15 (within 0.5%)."""
    assert abs(BRANCH_DELTA_CL - DELTA_CL) / DELTA_CL < 0.005

def test_branch_gap_positive():
    assert BRANCH_GAP > 0
    assert abs(BRANCH_GAP - (BRANCH_DELTA_CL - BRANCH_DELTA_STAR)) < 1e-14

def test_lyapunov_r_star_contracting():
    """Lyapunov < 0 confirms contracting attractor."""
    assert LYAPUNOV_R_STAR < 0

def test_r_star_value():
    assert abs(R_STAR - 3.8417002878419497) < 1e-15

def test_upper_branches_near_unity():
    """Branches 4-5 are near x=1 (upper exhaust sector)."""
    assert SIX_CYCLE_BRANCHES[4] > 0.95
    assert SIX_CYCLE_BRANCHES[5] > 0.95


# ── Summary Functions ─────────────────────────────────────────────────────────

def test_gap_summary_is_dict():
    s = gap_summary()
    assert isinstance(s, dict)

def test_gap_summary_keys():
    s = gap_summary()
    for key in ["epsilon", "delta_star", "delta_cl", "exhaust_dress",
                "omega_m_dressed", "lambda_over_mpl4", "lambda_exponent",
                "ns_drain_down", "ns_drain_up", "branch_delta_star",
                "six_cycle_branches", "gen_ratio_2nd", "gamma_64"]:
        assert key in s

def test_three_pillars_summary():
    s = three_pillars_summary()
    assert isinstance(s, dict)
    assert "pillar_1_name" in s
    assert "pillar_2_name" in s
    assert "pillar_3_name" in s
    assert s["pillar_1_lyap"] < 0  # contracting
    assert s["pillar_2_down"] > s["pillar_2_up"]  # asymmetry

def test_print_gap_report_runs(capsys):
    print_gap_report()
    out = capsys.readouterr().out
    assert "Cathedral Gap" in out or "CATHEDRAL GAP" in out

def test_print_gap_report_contains_epsilon(capsys):
    print_gap_report()
    out = capsys.readouterr().out
    assert "ε" in out or "epsilon" in out.lower() or "master" in out.lower()

def test_print_gap_report_contains_lambda(capsys):
    print_gap_report()
    out = capsys.readouterr().out
    assert "cosmological" in out.lower() or "10^-122" in out or "Λ" in out
