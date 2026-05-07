"""Tests for urt/inflation_cathedral.py — Cathedral inflation: the flagship prediction."""

import pytest
from math import log, log10, pi

# ── Module-level constant tests ────────────────────────────────────────────────

def test_n_efolds_value():
    from urt.inflation_cathedral import N_EFOLDS
    assert N_EFOLDS == 57

def test_n_efolds_eq_GD():
    from urt.inflation_cathedral import N_EFOLDS_EQ_GD
    assert N_EFOLDS_EQ_GD is True

def test_n_efolds_is_57():
    from urt.inflation_cathedral import N_EFOLDS_IS_57
    assert N_EFOLDS_IS_57 is True

def test_cross_check_G():
    from urt.inflation_cathedral import CROSS_CHECK_G
    assert CROSS_CHECK_G == 60

def test_cross_check_D():
    from urt.inflation_cathedral import CROSS_CHECK_D
    assert CROSS_CHECK_D == 3

def test_slow_roll_eps():
    from urt.inflation_cathedral import SLOW_ROLL_EPS, N_EFOLDS
    expected = 3.0 / (4.0 * N_EFOLDS**2)
    assert abs(SLOW_ROLL_EPS - expected) < 1e-15

def test_slow_roll_eta():
    from urt.inflation_cathedral import SLOW_ROLL_ETA, N_EFOLDS
    expected = -1.0 / N_EFOLDS
    assert abs(SLOW_ROLL_ETA - expected) < 1e-15

def test_n_s_cathedral_value():
    from urt.inflation_cathedral import N_S_CATHEDRAL
    expected = 1.0 - 2.0 / 57
    assert abs(N_S_CATHEDRAL - expected) < 1e-15

def test_n_s_cathedral_numerics():
    from urt.inflation_cathedral import N_S_CATHEDRAL
    assert abs(N_S_CATHEDRAL - 0.964912) < 1e-5

def test_n_s_planck_2018():
    from urt.inflation_cathedral import N_S_PLANCK_2018
    assert N_S_PLANCK_2018 == 0.9649

def test_n_s_within_1sigma():
    from urt.inflation_cathedral import N_S_WITHIN_1SIGMA
    assert N_S_WITHIN_1SIGMA is True

def test_n_s_deviation_sigma():
    from urt.inflation_cathedral import N_S_DEVIATION_SIGMA
    assert N_S_DEVIATION_SIGMA < 1.0

def test_n_s_numerator():
    from urt.inflation_cathedral import N_S_NUMERATOR
    assert N_S_NUMERATOR == 55

def test_n_s_denominator():
    from urt.inflation_cathedral import N_S_DENOMINATOR
    assert N_S_DENOMINATOR == 57

def test_n_s_rational():
    from urt.inflation_cathedral import N_S_NUMERATOR, N_S_DENOMINATOR, N_S_CATHEDRAL
    assert abs(N_S_CATHEDRAL - N_S_NUMERATOR / N_S_DENOMINATOR) < 1e-15

def test_r_tensor_value():
    from urt.inflation_cathedral import R_TENSOR_CATHEDRAL, N_EFOLDS
    expected = 12.0 / N_EFOLDS**2
    assert abs(R_TENSOR_CATHEDRAL - expected) < 1e-15

def test_r_tensor_numerics():
    from urt.inflation_cathedral import R_TENSOR_CATHEDRAL
    assert abs(R_TENSOR_CATHEDRAL - 0.003693) < 1e-4

def test_r_tensor_bound():
    from urt.inflation_cathedral import R_TENSOR_BOUND_CURRENT
    assert R_TENSOR_BOUND_CURRENT == 0.036

def test_r_within_bounds():
    from urt.inflation_cathedral import R_TENSOR_WITHIN_BOUNDS
    assert R_TENSOR_WITHIN_BOUNDS is True

def test_r_litbird_sensitivity():
    from urt.inflation_cathedral import R_TENSOR_LITBIRD_SENSITIVITY
    assert R_TENSOR_LITBIRD_SENSITIVITY == 0.001

def test_r_cmbs4_sensitivity():
    from urt.inflation_cathedral import R_TENSOR_CMBS4_SENSITIVITY
    assert R_TENSOR_CMBS4_SENSITIVITY == 0.0003

def test_r_detectable_litbird():
    from urt.inflation_cathedral import R_DETECTABLE_LITBIRD
    assert R_DETECTABLE_LITBIRD is True

def test_r_detectable_cmbs4():
    from urt.inflation_cathedral import R_DETECTABLE_CMBS4
    assert R_DETECTABLE_CMBS4 is True

def test_consistency_check():
    from urt.inflation_cathedral import CONSISTENCY_CHECK
    assert CONSISTENCY_CHECK is True

def test_r_from_ns_equals_r_tensor():
    from urt.inflation_cathedral import R_FROM_NS, R_TENSOR_CATHEDRAL
    assert abs(R_FROM_NS - R_TENSOR_CATHEDRAL) < 1e-15

def test_cc_exponent_value():
    from urt.inflation_cathedral import CC_EXPONENT
    assert CC_EXPONENT == 64

def test_cc_exponent_eq_64():
    from urt.inflation_cathedral import CC_EXPONENT_EQ_64
    assert CC_EXPONENT_EQ_64 is True

def test_cc_exponent_codons():
    from urt.inflation_cathedral import CC_EXPONENT_CODONS
    assert CC_EXPONENT_CODONS is True

def test_cc_prefactor():
    from urt.inflation_cathedral import CC_PREFACTOR
    expected = 3.0 / 16.0
    assert abs(CC_PREFACTOR - expected) < 1e-15

def test_cc_cathedral_positive():
    from urt.inflation_cathedral import CC_CATHEDRAL
    assert CC_CATHEDRAL > 0

def test_cc_cathedral_order_of_magnitude():
    from urt.inflation_cathedral import CC_LOG10_CATHEDRAL
    assert abs(CC_LOG10_CATHEDRAL - (-122.87)) < 0.1

def test_cc_ratio_to_observed():
    from urt.inflation_cathedral import CC_RATIO_TO_OBSERVED
    assert 1.0 < CC_RATIO_TO_OBSERVED < 1.5

def test_cc_error_pct():
    from urt.inflation_cathedral import CC_ERROR_PCT
    assert 0 < CC_ERROR_PCT < 30

def test_dns_dlnk():
    from urt.inflation_cathedral import DNS_DLNK, N_EFOLDS
    expected = -2.0 / N_EFOLDS**2
    assert abs(DNS_DLNK - expected) < 1e-15

def test_dns_consistent_with_planck():
    from urt.inflation_cathedral import DNS_DLNK
    planck_central = -0.0045
    planck_err = 0.0067
    assert abs(DNS_DLNK - planck_central) < 2 * planck_err

def test_l_first_peak_approx():
    from urt.inflation_cathedral import L_FIRST_PEAK_APPROX, L_FIRST_PEAK_OBSERVED
    assert abs(L_FIRST_PEAK_APPROX - L_FIRST_PEAK_OBSERVED) < 5.0

def test_inflation_energy_gev():
    from urt.inflation_cathedral import INFLATION_ENERGY_GEV
    assert 1e15 < INFLATION_ENERGY_GEV < 1e17

def test_comparison_dict_keys():
    from urt.inflation_cathedral import COMPARISON
    for key in ["n_s", "r", "CC", "dns"]:
        assert key in COMPARISON, f"Missing key: {key}"

# ── Function tests ─────────────────────────────────────────────────────────────

def test_inflation_derivation_returns_dict():
    from urt.inflation_cathedral import inflation_derivation
    assert isinstance(inflation_derivation(), dict)

def test_inflation_derivation_keys():
    from urt.inflation_cathedral import inflation_derivation
    r = inflation_derivation()
    for key in ["n_efolds", "efolds_eq_GD", "efolds_is_57", "A5_order",
                "slow_roll_eps", "slow_roll_eta", "n_s", "n_s_within_1sigma",
                "r_tensor", "r_within_bounds", "r_detectable_litbird",
                "r_detectable_cmbs4", "consistency_r_ns", "dns_dlnk"]:
        assert key in r, f"Missing key: {key}"

def test_inflation_derivation_n_efolds():
    from urt.inflation_cathedral import inflation_derivation
    r = inflation_derivation()
    assert r["n_efolds"] == 57

def test_inflation_derivation_booleans():
    from urt.inflation_cathedral import inflation_derivation
    r = inflation_derivation()
    assert r["efolds_eq_GD"] is True
    assert r["efolds_is_57"] is True
    assert r["n_s_within_1sigma"] is True
    assert r["r_within_bounds"] is True
    assert r["r_detectable_litbird"] is True
    assert r["r_detectable_cmbs4"] is True
    assert r["consistency_r_ns"] is True

def test_inflation_derivation_a5():
    from urt.inflation_cathedral import inflation_derivation
    r = inflation_derivation()
    assert r["A5_order"] == 60

def test_cosmological_constant_returns_dict():
    from urt.inflation_cathedral import cosmological_constant
    assert isinstance(cosmological_constant(), dict)

def test_cosmological_constant_keys():
    from urt.inflation_cathedral import cosmological_constant
    r = cosmological_constant()
    for key in ["cc_exponent", "cc_exponent_eq_64", "cc_prefactor",
                "cc_cathedral", "cc_observed", "cc_ratio_to_observed", "cc_error_pct"]:
        assert key in r, f"Missing key: {key}"

def test_cosmological_constant_exponent():
    from urt.inflation_cathedral import cosmological_constant
    r = cosmological_constant()
    assert r["cc_exponent"] == 64
    assert r["cc_exponent_eq_64"] is True

def test_cosmological_constant_ratio():
    from urt.inflation_cathedral import cosmological_constant
    r = cosmological_constant()
    assert 1.0 < r["cc_ratio_to_observed"] < 1.5

def test_inflation_summary_returns_dict():
    from urt.inflation_cathedral import inflation_summary
    assert isinstance(inflation_summary(), dict)

def test_inflation_summary_keys():
    from urt.inflation_cathedral import inflation_summary
    r = inflation_summary()
    for key in ["derivation", "cc", "comparison", "KEY_EXACT_RESULTS",
                "delta_star", "D", "N", "G", "N_EFOLDS"]:
        assert key in r, f"Missing key: {key}"

def test_inflation_summary_D_G():
    from urt.inflation_cathedral import inflation_summary
    r = inflation_summary()
    assert r["D"] == 3
    assert r["N"] == 13
    assert r["G"] == 60
    assert r["N_EFOLDS"] == 57

def test_inflation_summary_key_results():
    from urt.inflation_cathedral import inflation_summary
    r = inflation_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5

def test_print_inflation_report_runs(capsys):
    from urt.inflation_cathedral import print_inflation_report
    print_inflation_report()
    out = capsys.readouterr().out
    assert len(out) > 200
    assert "0.003" in out
    assert "LiteBIRD" in out

# ── Cross-module consistency ───────────────────────────────────────────────────

def test_efolds_eq_G_minus_D():
    from urt.inflation_cathedral import N_EFOLDS
    from urt.shell_closure import D, G
    assert N_EFOLDS == G - D

def test_efolds_matches_shell_closure():
    from urt.inflation_cathedral import N_EFOLDS
    from urt.shell_closure import D, G
    assert N_EFOLDS == G - D

def test_n_s_matches_cosmology():
    from urt.inflation_cathedral import N_S_CATHEDRAL
    from urt.cosmology_cathedral import N_S
    assert abs(N_S_CATHEDRAL - N_S) < 1e-10

def test_r_tensor_consistent_starobinsky():
    from urt.inflation_cathedral import R_TENSOR_CATHEDRAL, N_S_CATHEDRAL
    r_check = 3.0 * (1.0 - N_S_CATHEDRAL)**2
    assert abs(r_check - R_TENSOR_CATHEDRAL) < 1e-15

def test_cc_exponent_matches_genetics():
    from urt.inflation_cathedral import CC_EXPONENT
    from urt.genetics_cathedral import N_CODONS
    assert CC_EXPONENT == N_CODONS

def test_r_less_than_current_bound():
    from urt.inflation_cathedral import R_TENSOR_CATHEDRAL, R_TENSOR_BOUND_CURRENT
    assert R_TENSOR_CATHEDRAL < R_TENSOR_BOUND_CURRENT

def test_r_greater_than_litbird_sensitivity():
    from urt.inflation_cathedral import R_TENSOR_CATHEDRAL, R_TENSOR_LITBIRD_SENSITIVITY
    assert R_TENSOR_CATHEDRAL > R_TENSOR_LITBIRD_SENSITIVITY

def test_r_greater_than_cmbs4_sensitivity():
    from urt.inflation_cathedral import R_TENSOR_CATHEDRAL, R_TENSOR_CMBS4_SENSITIVITY
    assert R_TENSOR_CATHEDRAL > R_TENSOR_CMBS4_SENSITIVITY

def test_n_s_within_0p1_sigma():
    from urt.inflation_cathedral import N_S_DEVIATION_SIGMA
    assert N_S_DEVIATION_SIGMA < 0.1

def test_g_is_a5_order():
    from urt.shell_closure import G
    assert G == 60

def test_n_efolds_derivation_chain():
    """Full chain: D=3 → A₅ → G=60 → N_e=G-D=57."""
    from urt.shell_closure import D, G
    from urt.inflation_cathedral import N_EFOLDS
    assert D == 3
    assert G == 60
    assert N_EFOLDS == G - D == 57
