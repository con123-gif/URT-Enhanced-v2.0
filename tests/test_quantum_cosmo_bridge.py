"""Tests for Quantum-to-Cosmology Bridge — Cathedral solution to CC and η_B."""
import pytest
from math import log10, pi, log

from urt.quantum_cosmo_bridge import (
    D, N, V, E, F, q, G, GAMMA, GAMMA_INV,
    CC_EXPONENT, CC_LOG10_DENOM, CC_OOM,
    IDENTITY_CC_EXP, IDENTITY_CC_LOG, IDENTITY_CC_OOM,
    GAMMA_64, LAMBDA_PRED, LAMBDA_OBS, LAMBDA_ERR_PCT, CC_SOLVED,
    LAMBDA_QFT_NAIVE, LAMBDA_REDUCTION, LAMBDA_OOM_SOLVED,
    ETA_B_EXPONENT, ETA_B_PRED, ETA_B_OBS, ETA_B_ERR_PCT,
    EXPONENT_MAP, GAMMA_POWERS, ENERGY_SCALES,
    EXPONENT_PRODUCT, EXPONENT_RATIO, EXPONENT_CHAIN,
    IDENTITY_EXP_CHAIN_D, IDENTITY_EXP_CHAIN_Q, IDENTITY_EXP_CHAIN_64,
    HOLOGRAPHIC_RECIPROCAL, HOLOGRAPHIC_OOM, HOLOGRAPHIC_IDENTITY_APPROX,
    N_HOLO,
    M_SUN_PLANCK, S_BH_SUN_STD, S_BH_SUN_CAT, BH_ENTROPY_RATIO,
    BEKENSTEIN_MUKHANOV_AREA_QUANTUM, IDENTITY_BM_AREA,
    UV_IR_RATIO, UV_IR_OOM, N_GAMMA_LOG,
    cc_solution_steps, quantum_cosmo_summary, print_quantum_cosmo_report,
)


# ── Cathedral integers ────────────────────────────────────────────────────────

def test_d_is_3():
    assert D == 3

def test_gamma_is_1_over_81():
    assert abs(GAMMA - 1.0/81.0) < 1e-15

def test_gamma_inv_is_81():
    assert GAMMA_INV == 81


# ── Critical exponent: (D+1)^D = 64 ──────────────────────────────────────────

def test_cc_exponent_value():
    assert CC_EXPONENT == 64

def test_cc_exponent_from_cathedral():
    """CC exponent = (D+1)^D = 4^3 = 64."""
    assert CC_EXPONENT == (D + 1)**D

def test_identity_cc_exp():
    assert IDENTITY_CC_EXP

def test_cc_log10_denom_approx_122():
    """log10(81^64) ≈ 122.14 — the famous 122 orders of magnitude."""
    assert abs(CC_LOG10_DENOM - 122.14) < 0.02

def test_cc_log10_exact_formula():
    """CC_LOG10_DENOM = 64 × log10(81)."""
    assert abs(CC_LOG10_DENOM - 64 * log10(81)) < 1e-10

def test_identity_cc_log():
    assert IDENTITY_CC_LOG

def test_cc_oom_is_122():
    """The 122 orders of magnitude follow from D=3 alone."""
    assert CC_OOM == 122

def test_identity_cc_oom():
    assert IDENTITY_CC_OOM


# ── Cosmological constant solution ───────────────────────────────────────────

def test_gamma_64_is_positive():
    assert GAMMA_64 > 0

def test_gamma_64_is_tiny():
    """γ^64 is astronomically small — that's the point."""
    assert GAMMA_64 < 1e-120

def test_lambda_pred_formula():
    """Λ/M_Pl⁴ = (D+1)·γ^64 = 4·γ^64."""
    assert abs(LAMBDA_PRED - (D + 1) * GAMMA**64) < 1e-135

def test_lambda_pred_near_observed():
    """Cathedral prediction within 5% of observed CC."""
    assert LAMBDA_ERR_PCT < 5.0

def test_cc_solved():
    assert CC_SOLVED

def test_lambda_qft_naive():
    """Naive QFT predicts Λ ~ M_Pl^4 = 1 (Planck units)."""
    assert LAMBDA_QFT_NAIVE == 1.0

def test_lambda_reduction_is_huge():
    """Cathedral suppresses Λ by ~10^122 relative to QFT naive."""
    assert LAMBDA_REDUCTION > 1e100

def test_lambda_oom_solved_near_122():
    """The CC puzzle: ~121.5 orders of magnitude explained."""
    assert 119 < LAMBDA_OOM_SOLVED < 123


# ── Baryon asymmetry ──────────────────────────────────────────────────────────

def test_eta_b_exponent_is_q():
    """Baryon asymmetry uses γ^q = γ^5."""
    assert ETA_B_EXPONENT == q
    assert ETA_B_EXPONENT == 5

def test_eta_b_pred_formula():
    """η_B = (q−D)·γ^q = 2·γ^5."""
    assert abs(ETA_B_PRED - (q - D) * GAMMA**q) < 1e-20

def test_eta_b_prefactor():
    """Prefactor = q − D = 2."""
    assert q - D == 2

def test_eta_b_order_of_magnitude():
    """η_B predicted ~ 10^{-10} order."""
    assert 1e-11 < ETA_B_PRED < 1e-9

def test_eta_b_error_under_10pct():
    """η_B prediction within 10% of PDG value."""
    assert ETA_B_ERR_PCT < 10.0

def test_two_problems_same_gamma():
    """CC uses γ^64, baryon uses γ^5 — same γ, different Cathedral exponents."""
    assert abs(GAMMA_64 - GAMMA**CC_EXPONENT) < 1e-135
    assert abs(ETA_B_PRED - (q - D) * GAMMA**ETA_B_EXPONENT) < 1e-20


# ── Exponent chain ────────────────────────────────────────────────────────────

def test_exponent_chain_starts_with_D():
    assert IDENTITY_EXP_CHAIN_D
    assert EXPONENT_CHAIN[0] == D

def test_exponent_chain_has_q():
    assert IDENTITY_EXP_CHAIN_Q
    assert q in EXPONENT_CHAIN

def test_exponent_chain_ends_with_64():
    assert IDENTITY_EXP_CHAIN_64
    assert EXPONENT_CHAIN[-1] == 64

def test_exponent_chain_is_sorted():
    assert EXPONENT_CHAIN == sorted(EXPONENT_CHAIN)

def test_exponent_chain_values():
    """Chain = [3, 4, 5, 9, 15, 27, 64]."""
    assert EXPONENT_CHAIN == [3, 4, 5, 9, 15, 27, 64]

def test_exponent_chain_length():
    assert len(EXPONENT_CHAIN) == 7

def test_exponent_product():
    """q × 64 = 5 × 64 = 320."""
    assert EXPONENT_PRODUCT == 320
    assert EXPONENT_PRODUCT == q * CC_EXPONENT

def test_exponent_map_keys():
    for k in [D, q, D**2, CC_EXPONENT]:
        assert k in EXPONENT_MAP

def test_gamma_powers_are_decreasing():
    """Higher exponents give smaller γ^k."""
    keys = sorted(GAMMA_POWERS.keys())
    for i in range(len(keys) - 1):
        assert GAMMA_POWERS[keys[i]] > GAMMA_POWERS[keys[i+1]]

def test_energy_scales_positive():
    for k, e in ENERGY_SCALES.items():
        assert e > 0


# ── Holographic identity ──────────────────────────────────────────────────────

def test_holographic_reciprocal():
    assert abs(HOLOGRAPHIC_RECIPROCAL - 1.0 / LAMBDA_PRED) < 1e100

def test_holographic_oom_near_122():
    """log10(1/Λ_Cathedral) ≈ 121.5 — cosmic information content."""
    assert 119 < HOLOGRAPHIC_OOM < 123

def test_holographic_identity_approx():
    assert HOLOGRAPHIC_IDENTITY_APPROX

def test_n_holo_is_enormous():
    """N_holo = 81^64 / 4 — maximum quantum states in observable universe."""
    assert log10(N_HOLO) > 120

def test_n_holo_formula():
    """N_holo = (1/γ)^64 / (D+1) = 81^64 / 4."""
    assert abs(N_HOLO - GAMMA_INV**CC_EXPONENT / (D + 1)) < 1.0


# ── Black hole entropy ────────────────────────────────────────────────────────

def test_bm_area_quantum_value():
    """ΔA = 8π·δ★³ ≈ 0.0807."""
    assert IDENTITY_BM_AREA
    assert abs(BEKENSTEIN_MUKHANOV_AREA_QUANTUM - 0.0807) < 0.001

def test_bm_area_quantum_positive():
    assert BEKENSTEIN_MUKHANOV_AREA_QUANTUM > 0

def test_bh_entropy_ratio_positive():
    assert BH_ENTROPY_RATIO > 1

def test_m_sun_planck_order():
    """Solar mass ≈ 10^38 Planck masses."""
    assert 1e37 < M_SUN_PLANCK < 1e39


# ── UV/IR mixing ──────────────────────────────────────────────────────────────

def test_uv_ir_ratio_positive():
    assert UV_IR_RATIO > 0

def test_uv_ir_oom_about_30():
    """UV/IR energy ratio: ~30 orders of magnitude."""
    assert 25 < UV_IR_OOM < 40

def test_n_gamma_log_between_0_and_1():
    """log_{1/γ}(N) = log(13)/log(81) ∈ (0,1)."""
    assert 0 < N_GAMMA_LOG < 1

def test_n_gamma_log_value():
    """log₈₁(13) ≈ 0.586."""
    assert abs(N_GAMMA_LOG - log(N) / log(GAMMA_INV)) < 1e-12


# ── cc_solution_steps ─────────────────────────────────────────────────────────

def test_cc_solution_steps_returns_dict():
    s = cc_solution_steps()
    assert isinstance(s, dict)

def test_cc_solution_zero_free_params():
    s = cc_solution_steps()
    assert s["zero_free_params"] is True

def test_cc_solution_step_7_oom():
    s = cc_solution_steps()
    assert "122" in s["step_7_oom"]

def test_cc_solution_steps_keys():
    s = cc_solution_steps()
    for key in ["step_1_D", "step_2_gamma", "step_3_exp", "step_4_pred",
                "step_5_obs", "step_6_err", "step_7_oom"]:
        assert key in s


# ── quantum_cosmo_summary ─────────────────────────────────────────────────────

def test_quantum_cosmo_summary_is_dict():
    s = quantum_cosmo_summary()
    assert isinstance(s, dict)

def test_summary_cc_solved():
    s = quantum_cosmo_summary()
    assert s["cc_solved"] is True

def test_summary_cc_exponent():
    s = quantum_cosmo_summary()
    assert s["cc_exponent"] == 64

def test_summary_cc_oom():
    s = quantum_cosmo_summary()
    assert s["cc_oom"] == 122

def test_summary_cc_exp_identity():
    s = quantum_cosmo_summary()
    assert s["cc_exp_is_64"] is True

def test_summary_cc_oom_identity():
    s = quantum_cosmo_summary()
    assert s["cc_oom_is_122"] is True

def test_summary_lambda_pred():
    s = quantum_cosmo_summary()
    assert abs(s["lambda_pred"] - LAMBDA_PRED) < 1e-135

def test_summary_eta_b():
    s = quantum_cosmo_summary()
    assert abs(s["eta_b_pred"] - ETA_B_PRED) < 1e-20

def test_summary_exponent_chain():
    s = quantum_cosmo_summary()
    assert s["exponent_chain"] == [3, 4, 5, 9, 15, 27, 64]

def test_summary_bm_area():
    s = quantum_cosmo_summary()
    assert abs(s["bm_area_quantum"] - BEKENSTEIN_MUKHANOV_AREA_QUANTUM) < 1e-10


# ── print_quantum_cosmo_report ────────────────────────────────────────────────

def test_print_report_runs(capsys):
    print_quantum_cosmo_report()
    out = capsys.readouterr().out
    assert len(out) > 100

def test_print_report_contains_122(capsys):
    print_quantum_cosmo_report()
    out = capsys.readouterr().out
    assert "122" in out

def test_print_report_contains_cc(capsys):
    print_quantum_cosmo_report()
    out = capsys.readouterr().out
    assert "COSMOLOGICAL" in out or "cosmological" in out.lower() or "Λ" in out

def test_print_report_contains_baryon(capsys):
    print_quantum_cosmo_report()
    out = capsys.readouterr().out
    assert "baryon" in out.lower() or "η_B" in out or "BARYON" in out

def test_print_report_contains_holographic(capsys):
    print_quantum_cosmo_report()
    out = capsys.readouterr().out
    assert "holographic" in out.lower() or "HOLOGRAPHIC" in out or "holo" in out.lower()

def test_print_report_contains_solved(capsys):
    print_quantum_cosmo_report()
    out = capsys.readouterr().out
    assert "SOLVED" in out or "solved" in out.lower()

def test_print_report_contains_64(capsys):
    print_quantum_cosmo_report()
    out = capsys.readouterr().out
    assert "64" in out
