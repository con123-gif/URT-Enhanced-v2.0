"""Tests for urt/economics_cathedral.py — Power laws, markets, and δ★."""

import pytest
from math import isfinite, log, sqrt


# ── Imports ──────────────────────────────────────────────────────────────────

def test_module_imports():
    from urt.economics_cathedral import (
        PARETO_8020, PARETO_DELTA_RATIO, PARETO_DELTA_DEV,
        PARETO_SHAPE_ABOVE1,
        H_CATHEDRAL, H_RANDOM_WALK,
        TAIL_EXPONENT,
        SPREAD_RELATIVE,
        KELLY_WIN_PROB, KELLY_LOSE_PROB, KELLY_FRACTION,
        SIGMA_CATHEDRAL,
        ZIPF_EXPONENT, GINI_PARETO,
        pareto_analysis, hurst_analysis,
        market_microstructure, kelly_criterion,
        tail_distribution, economics_summary,
        print_economics_report,
    )


# ── Pareto constants ──────────────────────────────────────────────────────────

def test_pareto_8020_value():
    """log(0.8)/log(0.2) ≈ 0.1386."""
    from urt.economics_cathedral import PARETO_8020
    expected = log(0.8) / log(0.2)
    assert abs(PARETO_8020 - expected) < 1e-10


def test_pareto_8020_positive():
    from urt.economics_cathedral import PARETO_8020
    assert PARETO_8020 > 0
    assert isfinite(PARETO_8020)


def test_pareto_delta_deviation_under_10pct():
    """Pareto 80/20 exponent within 10% of δ★."""
    from urt.economics_cathedral import PARETO_DELTA_DEV
    assert PARETO_DELTA_DEV < 0.10


def test_pareto_delta_deviation_approx_6pct():
    """Deviation ≈ 6% (4–8% window)."""
    from urt.economics_cathedral import PARETO_DELTA_DEV
    assert 0.04 < PARETO_DELTA_DEV < 0.08


def test_pareto_ratio_lt_1():
    """Pareto exponent < δ★ (ratio < 1)."""
    from urt.economics_cathedral import PARETO_DELTA_RATIO
    assert PARETO_DELTA_RATIO < 1.0
    assert PARETO_DELTA_RATIO > 0.8


def test_pareto_analysis_function():
    from urt.economics_cathedral import pareto_analysis
    r = pareto_analysis()
    assert "pareto_8020" in r
    assert "delta_star" in r
    assert "deviation_pct" in r
    assert "APPROXIMATE" in r["status"]
    assert r["deviation_pct"] < 10.0
    # Better match: 1% owns 50%
    assert r["delta_dev_1pct_50"] < 5.0


# ── Hurst exponent ────────────────────────────────────────────────────────────

def test_hurst_cathedral_formula():
    """H = (D+1)/(2D) = 4/6 = 2/3."""
    from urt.economics_cathedral import H_CATHEDRAL
    from urt.shell_closure import D
    expected = (D + 1) / (2 * D)
    assert abs(H_CATHEDRAL - expected) < 1e-10
    assert abs(H_CATHEDRAL - 2.0/3.0) < 1e-10


def test_hurst_cathedral_gt_half():
    """H > 0.5: persistent (trending) regime."""
    from urt.economics_cathedral import H_CATHEDRAL, H_RANDOM_WALK
    assert H_CATHEDRAL > H_RANDOM_WALK


def test_hurst_in_empirical_range():
    """H_C = 0.667 is within empirical equity range 0.55–0.75."""
    from urt.economics_cathedral import H_CATHEDRAL
    assert 0.55 <= H_CATHEDRAL <= 0.75


def test_hurst_analysis_function():
    from urt.economics_cathedral import hurst_analysis
    r = hurst_analysis()
    assert r["in_empirical_range"] is True
    assert "APPROXIMATE" in r["status"]
    assert r["H_random_walk"] == 0.5


# ── Fat tail exponent ─────────────────────────────────────────────────────────

def test_tail_exponent_equals_D():
    """Fat tail exponent = D = 3."""
    from urt.economics_cathedral import TAIL_EXPONENT
    from urt.shell_closure import D
    assert TAIL_EXPONENT == float(D)
    assert TAIL_EXPONENT == 3.0


def test_tail_in_empirical_range():
    """D=3 is within Mantegna-Stanley empirical range (1.4–4.0)."""
    from urt.economics_cathedral import TAIL_EXPONENT
    assert 1.4 <= TAIL_EXPONENT <= 4.0


def test_tail_distribution_function():
    from urt.economics_cathedral import tail_distribution
    from urt.shell_closure import D
    r = tail_distribution()
    assert r["tail_exponent"] == D
    assert r["D_in_typical_range"] is True
    assert "Mantegna" in r["empirical_source"]


# ── Market microstructure ─────────────────────────────────────────────────────

def test_spread_relative_formula():
    """Bid-ask spread ∝ 1/√N."""
    from urt.economics_cathedral import SPREAD_RELATIVE
    from urt.shell_closure import N
    expected = 1.0 / sqrt(N)
    assert abs(SPREAD_RELATIVE - expected) < 1e-10


def test_sigma_cathedral_formula():
    """σ_C = δ★ × √2."""
    from urt.economics_cathedral import SIGMA_CATHEDRAL
    from urt.shell_closure import DELTA_STAR
    expected = DELTA_STAR * sqrt(2)
    assert abs(SIGMA_CATHEDRAL - expected) < 1e-10


def test_sigma_cathedral_approx_0pt21():
    """σ_C ≈ 0.2086 (≈ 21% annual volatility)."""
    from urt.economics_cathedral import SIGMA_CATHEDRAL
    assert 0.20 < SIGMA_CATHEDRAL < 0.22


def test_microstructure_function():
    from urt.economics_cathedral import market_microstructure
    r = market_microstructure()
    assert r["sigma_same_as_neff"] is True
    assert r["N_venues"] == 13


# ── Kelly criterion ───────────────────────────────────────────────────────────

def test_kelly_probabilities_sum_to_1():
    """Win + lose prob = 1."""
    from urt.economics_cathedral import KELLY_WIN_PROB, KELLY_LOSE_PROB
    assert abs(KELLY_WIN_PROB + KELLY_LOSE_PROB - 1.0) < 1e-12


def test_kelly_lose_prob_equals_delta_star():
    """Loss probability = δ★."""
    from urt.economics_cathedral import KELLY_LOSE_PROB
    from urt.shell_closure import DELTA_STAR
    assert abs(KELLY_LOSE_PROB - DELTA_STAR) < 1e-12


def test_kelly_fraction_formula():
    """f★ = 1 − 2δ★."""
    from urt.economics_cathedral import KELLY_FRACTION
    from urt.shell_closure import DELTA_STAR
    expected = 1.0 - 2 * DELTA_STAR
    assert abs(KELLY_FRACTION - expected) < 1e-12


def test_kelly_fraction_positive():
    """f★ > 0: positive position (δ★ < 0.5)."""
    from urt.economics_cathedral import KELLY_FRACTION
    assert KELLY_FRACTION > 0
    assert KELLY_FRACTION < 1.0


def test_kelly_criterion_function():
    from urt.economics_cathedral import kelly_criterion
    r = kelly_criterion()
    assert "SPECULATIVE" in r["note"]
    assert "EXACT given p=1−δ★" in r["status"]
    assert r["log_growth_rate"] > 0   # positive expected log-growth


# ── Summary / report ──────────────────────────────────────────────────────────

def test_economics_summary_structure():
    from urt.economics_cathedral import economics_summary
    r = economics_summary()
    assert "pareto" in r
    assert "hurst" in r
    assert "microstructure" in r
    assert "kelly" in r
    assert "tail" in r
    assert "key_results" in r
    assert "cathedral_integers" in r


def test_economics_summary_cathedral_integers():
    from urt.economics_cathedral import economics_summary
    from urt.shell_closure import D, N
    r = economics_summary()
    assert r["cathedral_integers"]["D"] == D
    assert r["cathedral_integers"]["N"] == N


def test_print_economics_report(capsys):
    from urt.economics_cathedral import print_economics_report
    print_economics_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "CATHEDRAL ECONOMICS" in out
    assert "Pareto" in out or "pareto" in out.lower()


def test_zipf_exponent_unity():
    """Zipf exponent = 1.0 (Zipf's law)."""
    from urt.economics_cathedral import ZIPF_EXPONENT
    assert ZIPF_EXPONENT == 1.0


def test_gini_value_range():
    """Gini coefficient is in (0, 1)."""
    from urt.economics_cathedral import GINI_PARETO
    assert 0 < GINI_PARETO < 1
    assert isfinite(GINI_PARETO)
