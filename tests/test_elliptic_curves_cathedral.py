"""Tests for urt/elliptic_curves_cathedral.py — Elliptic curves and Cathedral integers."""

import pytest
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    from urt.elliptic_curves_cathedral import (
        EC_DISCRIMINANT_COEFF_27, IDENTITY_EC_DISC_27,
        EC_J_NUMERATOR_COEFF, IDENTITY_EC_J_COEFF,
        EC_QUARTIC_COEFF, IDENTITY_EC_QUARTIC,
        N_WEIERSTRASS_COEFFS, IDENTITY_WEIERSTRASS_N,
        N_MAZUR_TORSION, IDENTITY_MAZUR,
        MAX_CYCLIC_TORSION, IDENTITY_MAX_TORSION,
        MAX_PRODUCT_TORSION_n, IDENTITY_MAX_PROD_TORSION,
        MAX_MAZUR_ORDER, IDENTITY_MAX_MAZUR_ORDER,
        CM_DISC_EISENSTEIN, IDENTITY_CM_EISENSTEIN,
        CM_J_GAUSSIAN, IDENTITY_CM_J_GAUSSIAN,
        N_HEEGNER, IDENTITY_HEEGNER,
        HEEGNER_163, IDENTITY_HEEGNER_163,
        RAMANUJAN_APPROX_163, IDENTITY_RAMANUJAN_163_DIV,
        TRACE_COUNT_GFq, IDENTITY_TRACE_GFq,
        TRACE_COUNT_GFN, IDENTITY_TRACE_GFN,
        BSD_TORS_DENOM_MAX, IDENTITY_BSD_TORS_MAX,
        BSD_AVG_RANK_DEN, IDENTITY_BSD_AVG_RANK,
        X0_N_GENUS, IDENTITY_X0_N_GENUS,
        N_PRIMES_X0_GENUS0, IDENTITY_N_PRIMES_GENUS0,
        X0_N_CUSPS, IDENTITY_X0_N_CUSPS,
        X_N_KEY_NUM, IDENTITY_X_N_168,
        MIN_CONDUCTOR, IDENTITY_MIN_CONDUCTOR,
        CONDUCTOR_11_TORS, IDENTITY_COND11_TORS,
        TANIYAMA_WEIGHT, IDENTITY_TANIYAMA_WEIGHT,
        WILES_PRIME_1, WILES_PRIME_2, IDENTITY_WILES_PRIMES,
        GROUP_LAW_3, GROUP_LAW_4, IDENTITY_GROUP_LAW,
        EC_DEGREE, IDENTITY_EC_DEGREE,
        ALL_EC_IDENTITIES, ALL_EC_EXACT, N_EC_IDENTITIES,
        ec_summary, print_ec_report,
    )


# ── Section 1: Elliptic curve basics ─────────────────────────────────────────

def test_discriminant_coeff_27():
    """D^D = 3^3 = 27 is the coefficient in Δ = −16(4a³ + 27b²)."""
    from urt.elliptic_curves_cathedral import EC_DISCRIMINANT_COEFF_27
    assert EC_DISCRIMINANT_COEFF_27 == 27


def test_discriminant_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_EC_DISC_27
    assert IDENTITY_EC_DISC_27 is True


def test_j_numerator_coeff_1728():
    """V³ = 12³ = 1728 is the j-invariant numerator coefficient."""
    from urt.elliptic_curves_cathedral import EC_J_NUMERATOR_COEFF
    assert EC_J_NUMERATOR_COEFF == 1728


def test_j_coeff_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_EC_J_COEFF
    assert IDENTITY_EC_J_COEFF is True


def test_quartic_coeff_4():
    """D+1 = 4 is the quartic coefficient in the j-invariant."""
    from urt.elliptic_curves_cathedral import EC_QUARTIC_COEFF
    assert EC_QUARTIC_COEFF == 4


def test_weierstrass_n_coeffs():
    """The general Weierstrass form has q=5 coefficients."""
    from urt.elliptic_curves_cathedral import N_WEIERSTRASS_COEFFS
    assert N_WEIERSTRASS_COEFFS == 5


# ── Section 2: Mordell-Weil / Mazur ──────────────────────────────────────────

def test_mazur_torsion_count():
    """Mazur: exactly V+D = 15 possible torsion groups for E over Q."""
    from urt.elliptic_curves_cathedral import N_MAZUR_TORSION
    assert N_MAZUR_TORSION == 15


def test_mazur_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_MAZUR
    assert IDENTITY_MAZUR is True


def test_max_cyclic_torsion():
    """Maximum cyclic torsion is Z/12Z, order V=12."""
    from urt.elliptic_curves_cathedral import MAX_CYCLIC_TORSION
    assert MAX_CYCLIC_TORSION == 12


def test_max_product_torsion_n():
    """For Z/2Z × Z/2nZ, Mazur allows n ≤ D+1 = 4."""
    from urt.elliptic_curves_cathedral import MAX_PRODUCT_TORSION_n
    assert MAX_PRODUCT_TORSION_n == 4


def test_max_mazur_order():
    """Max order from product-type torsion: 2×2×4 = 16 = 2^(D+1)."""
    from urt.elliptic_curves_cathedral import MAX_MAZUR_ORDER
    assert MAX_MAZUR_ORDER == 16


def test_max_mazur_order_is_power_of_2():
    """16 = 2^4 = 2^(D+1)."""
    from urt.elliptic_curves_cathedral import MAX_MAZUR_ORDER, IDENTITY_MAX_MAZUR_ORDER
    assert MAX_MAZUR_ORDER == 2**4
    assert IDENTITY_MAX_MAZUR_ORDER is True


# ── Section 3: CM elliptic curves ────────────────────────────────────────────

def test_cm_disc_eisenstein():
    """Eisenstein integers Q(√−3): discriminant = −D = −3."""
    from urt.elliptic_curves_cathedral import CM_DISC_EISENSTEIN
    assert CM_DISC_EISENSTEIN == -3


def test_cm_disc_eisenstein_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_CM_EISENSTEIN
    assert IDENTITY_CM_EISENSTEIN is True


def test_cm_j_gaussian():
    """j(Q(√−1)) = 1728 = V³."""
    from urt.elliptic_curves_cathedral import CM_J_GAUSSIAN
    assert CM_J_GAUSSIAN == 1728


def test_n_heegner():
    """There are 9 = D² = 3² imaginary quadratic fields with class number 1."""
    from urt.elliptic_curves_cathedral import N_HEEGNER
    assert N_HEEGNER == 9


def test_heegner_163_value():
    """163 = V×N + D!+1 = 12×13 + 7."""
    from urt.elliptic_curves_cathedral import HEEGNER_163
    assert HEEGNER_163 == 163


def test_heegner_163_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_HEEGNER_163
    assert IDENTITY_HEEGNER_163 is True


def test_heegner_163_cathedral_formula():
    """Verify arithmetic: 12×13 + factorial(3) + 1 = 156 + 6 + 1 = 163."""
    D, V, N_val = 3, 12, 13
    assert V * N_val + factorial(D) + 1 == 163


def test_ramanujan_640320_div_60():
    """640320 is divisible by V×q = 12×5 = 60."""
    from urt.elliptic_curves_cathedral import RAMANUJAN_APPROX_163, IDENTITY_RAMANUJAN_163_DIV
    assert RAMANUJAN_APPROX_163 % 60 == 0
    assert IDENTITY_RAMANUJAN_163_DIV is True


# ── Section 4: Finite fields ──────────────────────────────────────────────────

def test_trace_count_gfq():
    """Over GF(5): 2q−1 = 9 = D² possible Hasse trace values."""
    from urt.elliptic_curves_cathedral import TRACE_COUNT_GFq
    assert TRACE_COUNT_GFq == 9


def test_trace_count_gfq_is_D_squared():
    from urt.elliptic_curves_cathedral import TRACE_COUNT_GFq, IDENTITY_TRACE_GFq
    assert TRACE_COUNT_GFq == 3**2
    assert IDENTITY_TRACE_GFq is True


def test_trace_count_gfN():
    """Over GF(13): 2(D!+1)+1 = 15 = V+D possible Hasse trace values."""
    from urt.elliptic_curves_cathedral import TRACE_COUNT_GFN
    assert TRACE_COUNT_GFN == 15


def test_trace_count_gfN_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_TRACE_GFN
    assert IDENTITY_TRACE_GFN is True


# ── Section 5: BSD ────────────────────────────────────────────────────────────

def test_bsd_tors_denom_max():
    """BSD denominator max = V² = 144."""
    from urt.elliptic_curves_cathedral import BSD_TORS_DENOM_MAX
    assert BSD_TORS_DENOM_MAX == 144


def test_bsd_tors_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_BSD_TORS_MAX
    assert IDENTITY_BSD_TORS_MAX is True


def test_bsd_avg_rank_den():
    """Average rank denominator = D−1 = 2."""
    from urt.elliptic_curves_cathedral import BSD_AVG_RANK_DEN
    assert BSD_AVG_RANK_DEN == 2


# ── Section 6: Modular curves ─────────────────────────────────────────────────

def test_X0_N_genus_zero():
    """g(X_0(13)) = 0; Cathedral N=13 is the only prime >7 with this property."""
    from urt.elliptic_curves_cathedral import X0_N_GENUS
    assert X0_N_GENUS == 0


def test_X0_N_genus_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_X0_N_GENUS
    assert IDENTITY_X0_N_GENUS is True


def test_n_primes_genus0():
    """Exactly q=5 primes give g(X_0(p))=0: {2,3,5,7,13}."""
    from urt.elliptic_curves_cathedral import N_PRIMES_X0_GENUS0
    assert N_PRIMES_X0_GENUS0 == 5


def test_primes_genus0_include_13():
    """The set of genus-0 primes includes Cathedral N=13."""
    primes = [2, 3, 5, 7, 13]
    assert 13 in primes
    assert len(primes) == 5


def test_X0_N_cusps():
    """X_0(13) has D−1 = 2 cusps."""
    from urt.elliptic_curves_cathedral import X0_N_CUSPS
    assert X0_N_CUSPS == 2


def test_X_N_168():
    """168 = 2^D × D × (D!+1) = 8×3×7 = order of PSL(2,7)."""
    from urt.elliptic_curves_cathedral import X_N_KEY_NUM
    assert X_N_KEY_NUM == 168


def test_X_N_168_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_X_N_168
    assert IDENTITY_X_N_168 is True


def test_X_N_168_cathedral_formula():
    """Verify: 2^3 × 3 × (3!+1) = 8 × 3 × 7 = 168."""
    D = 3
    assert 2**D * D * (factorial(D) + 1) == 168


# ── Section 7: L-functions / Wiles ───────────────────────────────────────────

def test_min_conductor():
    """Minimum conductor of an elliptic curve over Q is 11 = 2D+q."""
    from urt.elliptic_curves_cathedral import MIN_CONDUCTOR
    assert MIN_CONDUCTOR == 11


def test_min_conductor_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_MIN_CONDUCTOR
    assert IDENTITY_MIN_CONDUCTOR is True


def test_conductor_11_tors():
    """The conductor-11 curve y²+y=x³−x² has torsion of order q=5."""
    from urt.elliptic_curves_cathedral import CONDUCTOR_11_TORS
    assert CONDUCTOR_11_TORS == 5


def test_taniyama_weight():
    """Modular forms in Taniyama-Shimura have weight 2 = D−1."""
    from urt.elliptic_curves_cathedral import TANIYAMA_WEIGHT
    assert TANIYAMA_WEIGHT == 2


def test_wiles_prime_1():
    """Wiles first prime is D=3 (used in 3-5 switch)."""
    from urt.elliptic_curves_cathedral import WILES_PRIME_1
    assert WILES_PRIME_1 == 3


def test_wiles_prime_2():
    """Wiles second prime is q=5 (used in 3-5 switch)."""
    from urt.elliptic_curves_cathedral import WILES_PRIME_2
    assert WILES_PRIME_2 == 5


def test_wiles_primes_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_WILES_PRIMES
    assert IDENTITY_WILES_PRIMES is True


# ── Section 8: Group law ──────────────────────────────────────────────────────

def test_group_law_3():
    """The '3' in the doubling formula numerator = D = 3."""
    from urt.elliptic_curves_cathedral import GROUP_LAW_3
    assert GROUP_LAW_3 == 3


def test_group_law_4():
    """The '4' in the doubling formula denominator = D+1 = 4."""
    from urt.elliptic_curves_cathedral import GROUP_LAW_4
    assert GROUP_LAW_4 == 4


def test_group_law_identity():
    from urt.elliptic_curves_cathedral import IDENTITY_GROUP_LAW
    assert IDENTITY_GROUP_LAW is True


def test_ec_degree():
    """An elliptic curve is a degree-3 curve: EC_DEGREE = D = 3."""
    from urt.elliptic_curves_cathedral import EC_DEGREE
    assert EC_DEGREE == 3


# ── Aggregate: all identities ─────────────────────────────────────────────────

def test_all_ec_identities_true():
    """All 27 Cathedral elliptic curve identities hold."""
    from urt.elliptic_curves_cathedral import ALL_EC_IDENTITIES
    failing = [i for i, v in enumerate(ALL_EC_IDENTITIES) if not v]
    assert failing == [], f"Identity indices failed: {failing}"


def test_all_ec_exact():
    from urt.elliptic_curves_cathedral import ALL_EC_EXACT
    assert ALL_EC_EXACT is True


def test_n_ec_identities():
    """There are exactly 27 Cathedral elliptic curve identities."""
    from urt.elliptic_curves_cathedral import N_EC_IDENTITIES
    assert N_EC_IDENTITIES == 27


# ── ec_summary() ─────────────────────────────────────────────────────────────

def test_ec_summary_returns_dict():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    assert isinstance(s, dict)


def test_ec_summary_sections():
    """ec_summary has all expected top-level sections."""
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    expected = {
        "basics", "mordell_weil", "cm_curves", "finite_fields",
        "bsd", "modular_curves", "l_functions", "group_law", "meta",
    }
    assert set(s.keys()) == expected


def test_ec_summary_meta_all_exact():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    assert s["meta"]["all_exact"] is True


def test_ec_summary_meta_n_identities():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    assert s["meta"]["n_identities"] == 27


def test_ec_summary_meta_cathedral_integers():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    ci = s["meta"]["cathedral_integers"]
    assert ci["D"] == 3
    assert ci["N"] == 13
    assert ci["V"] == 12
    assert ci["q"] == 5
    assert ci["G"] == 60
    assert ci["gamma_inv"] == 81


def test_ec_summary_basics_section():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    b = s["basics"]
    assert b["discriminant_coeff_27"] == 27
    assert b["j_coeff_1728"] == 1728
    assert b["quartic_coeff"] == 4
    assert b["weierstrass_n_coeffs"] == 5


def test_ec_summary_mordell_weil_section():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    mw = s["mordell_weil"]
    assert mw["n_mazur_torsion"] == 15
    assert mw["max_cyclic_torsion"] == 12
    assert mw["max_product_n"] == 4
    assert mw["max_mazur_order"] == 16


def test_ec_summary_cm_curves_section():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    cm = s["cm_curves"]
    assert cm["cm_disc_eisenstein"] == -3
    assert cm["j_gaussian"] == 1728
    assert cm["n_heegner"] == 9
    assert cm["heegner_163"] == 163


def test_ec_summary_finite_fields_section():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    ff = s["finite_fields"]
    assert ff["trace_count_GFq"] == 9
    assert ff["trace_count_GFN"] == 15


def test_ec_summary_bsd_section():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    bsd = s["bsd"]
    assert bsd["tors_denom_max"] == 144
    assert bsd["avg_rank_denom"] == 2


def test_ec_summary_modular_curves_section():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    mc = s["modular_curves"]
    assert mc["X0_N_genus"] == 0
    assert mc["n_primes_genus0"] == 5
    assert mc["primes_genus0_list"] == [2, 3, 5, 7, 13]
    assert mc["X0_N_cusps"] == 2
    assert mc["X_N_168"] == 168


def test_ec_summary_l_functions_section():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    lf = s["l_functions"]
    assert lf["min_conductor"] == 11
    assert lf["conductor_11_tors"] == 5
    assert lf["taniyama_weight"] == 2
    assert lf["wiles_prime_1"] == 3
    assert lf["wiles_prime_2"] == 5


def test_ec_summary_group_law_section():
    from urt.elliptic_curves_cathedral import ec_summary
    s = ec_summary()
    gl = s["group_law"]
    assert gl["slope_coeff_3"] == 3
    assert gl["denom_coeff_4"] == 4
    assert gl["ec_degree"] == 3


# ── print_ec_report() ─────────────────────────────────────────────────────────

def test_print_ec_report_runs(capsys):
    """print_ec_report() runs without errors and produces output."""
    from urt.elliptic_curves_cathedral import print_ec_report
    print_ec_report()
    captured = capsys.readouterr()
    assert len(captured.out) > 0


def test_print_ec_report_contains_key_values(capsys):
    """Report output contains key Cathedral values."""
    from urt.elliptic_curves_cathedral import print_ec_report
    print_ec_report()
    out = capsys.readouterr().out
    assert "1728" in out
    assert "163" in out
    assert "168" in out
    assert "11" in out
    assert "EXACT" in out


def test_print_ec_report_contains_section_headers(capsys):
    """Report contains all 8 section headers."""
    from urt.elliptic_curves_cathedral import print_ec_report
    print_ec_report()
    out = capsys.readouterr().out
    assert "BASICS" in out
    assert "MORDELL" in out or "MAZUR" in out
    assert "CM CURVES" in out or "HEEGNER" in out
    assert "BSD" in out or "BIRCH" in out
    assert "MODULAR" in out
    assert "GROUP LAW" in out
