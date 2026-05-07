"""Tests for urt/quantum_chaos.py — Icosahedral spectrum, RMT, MSS bound."""

import pytest
from math import pi, isfinite


# ── Imports ──────────────────────────────────────────────────────────────────

def test_module_imports():
    from urt.quantum_chaos import (
        ICOS_EIGENVALUES, DISTINCT_EIGENVALUES, MULTIPLICITIES,
        LEVEL_SPACINGS, MEAN_SPACING, DELTA3_CATHEDRAL,
        DELTA3_POISSON_REF, DELTA3_GOE_REF,
        MSS_BOUND_M1, LOGISTIC_R_STAR, LOGISTIC_CYCLE_LEN,
        LOGISTIC_LYAPUNOV, IS_EDGE_OF_CHAOS,
        icosahedral_spectrum, level_spacing_distribution,
        spectral_rigidity, mss_bound, logistic_chaos_connection,
        quantum_chaos_summary, print_chaos_report,
    )


# ── Icosahedral spectrum ──────────────────────────────────────────────────────

def test_eigenvalue_count():
    """13 eigenvalues (one per icosahedral site)"""
    from urt.quantum_chaos import ICOS_EIGENVALUES
    assert len(ICOS_EIGENVALUES) == 13


def test_eigenvalue_sum_multiplicities():
    """Sum of multiplicities = N = 13"""
    from urt.quantum_chaos import MULTIPLICITIES
    assert sum(MULTIPLICITIES) == 13


def test_spectral_gap_equals_D():
    """λ₂ = 3 = D (spectral gap = spatial dimension)"""
    from urt.quantum_chaos import DISTINCT_EIGENVALUES
    gap = DISTINCT_EIGENVALUES[1] - DISTINCT_EIGENVALUES[0]
    assert gap == 3


def test_max_eigenvalue_equals_N():
    """λ_max = 13 = N"""
    from urt.quantum_chaos import DISTINCT_EIGENVALUES
    assert DISTINCT_EIGENVALUES[-1] == 13


def test_zero_eigenvalue():
    """λ_0 = 0 (constant mode / translational zero mode)"""
    from urt.quantum_chaos import ICOS_EIGENVALUES
    assert ICOS_EIGENVALUES[0] == 0


def test_distinct_eigenvalues():
    """Distinct eigenvalues: 0, 3, 5, 7, 9, 13"""
    from urt.quantum_chaos import DISTINCT_EIGENVALUES
    assert DISTINCT_EIGENVALUES == [0, 3, 5, 7, 9, 13]


def test_spectrum_function():
    from urt.quantum_chaos import icosahedral_spectrum
    r = icosahedral_spectrum()
    assert r["spectral_gap_equals_D"] is True
    assert r["max_equals_N"] is True
    assert r["N_eigenvalues"] == 13


# ── Level spacing ─────────────────────────────────────────────────────────────

def test_level_spacings_positive():
    from urt.quantum_chaos import LEVEL_SPACINGS
    assert all(s > 0 for s in LEVEL_SPACINGS)


def test_mean_spacing_positive():
    from urt.quantum_chaos import MEAN_SPACING
    assert MEAN_SPACING > 0
    assert isfinite(MEAN_SPACING)


def test_level_spacing_function():
    from urt.quantum_chaos import level_spacing_distribution
    r = level_spacing_distribution()
    assert "spacings" in r
    assert "goe_comparison" in r
    assert "poisson_comparison" in r
    assert "regime" in r


# ── Spectral rigidity ─────────────────────────────────────────────────────────

def test_delta3_cathedral_finite():
    from urt.quantum_chaos import DELTA3_CATHEDRAL
    assert isfinite(DELTA3_CATHEDRAL)
    assert DELTA3_CATHEDRAL >= 0


def test_delta3_references():
    from urt.quantum_chaos import DELTA3_POISSON_REF, DELTA3_GOE_REF
    assert isfinite(DELTA3_POISSON_REF)
    assert isfinite(DELTA3_GOE_REF)
    assert DELTA3_POISSON_REF > 0
    assert DELTA3_GOE_REF > 0


def test_spectral_rigidity_function():
    from urt.quantum_chaos import spectral_rigidity
    r = spectral_rigidity()
    assert "delta3_cathedral" in r
    assert "delta3_poisson_ref" in r
    assert "delta3_goe_ref" in r
    assert "regime" in r


# ── MSS bound ─────────────────────────────────────────────────────────────────

def test_mss_bound_formula():
    """MSS bound = 1/(4·δ★²·M) at M=1 in Planck units with G_N=δ★²"""
    from urt.quantum_chaos import MSS_BOUND_M1
    from urt.shell_closure import DELTA_STAR
    expected = 1.0 / (4 * DELTA_STAR**2 * 1.0)
    assert abs(MSS_BOUND_M1 - expected) < 1e-10


def test_mss_bound_positive():
    from urt.quantum_chaos import MSS_BOUND_M1
    assert MSS_BOUND_M1 > 0
    assert isfinite(MSS_BOUND_M1)


def test_mss_bound_function():
    from urt.quantum_chaos import mss_bound
    r = mss_bound()
    assert r["saturated_at_delta_star"] is True
    assert "cathedral_temperature" in r
    assert "formula" in r


# ── Logistic map ─────────────────────────────────────────────────────────────

def test_logistic_cycle_len():
    """6-cycle: V/2 = 12/2 = 6"""
    from urt.quantum_chaos import LOGISTIC_CYCLE_LEN
    from urt.shell_closure import V
    assert LOGISTIC_CYCLE_LEN == V // 2
    assert LOGISTIC_CYCLE_LEN == 6


def test_edge_of_chaos():
    from urt.quantum_chaos import IS_EDGE_OF_CHAOS
    assert IS_EDGE_OF_CHAOS is True


def test_logistic_lyapunov_contracting():
    """Lyapunov < 0 means contracting (stable 6-cycle)"""
    from urt.quantum_chaos import LOGISTIC_LYAPUNOV
    assert LOGISTIC_LYAPUNOV < 0


def test_logistic_connection_function():
    from urt.quantum_chaos import logistic_chaos_connection
    r = logistic_chaos_connection()
    assert r["cycle_length"] == 6
    assert r["is_edge_of_chaos"] is True
    assert r["is_contracting"] is True


# ── Summary ──────────────────────────────────────────────────────────────────

def test_summary_structure():
    from urt.quantum_chaos import quantum_chaos_summary
    r = quantum_chaos_summary()
    assert "spectrum" in r
    assert "mss_bound" in r
    assert "logistic" in r
    assert "level_spacing" in r


def test_print_chaos_report(capsys):
    from urt.quantum_chaos import print_chaos_report
    print_chaos_report()
    out = capsys.readouterr().out
    assert len(out) > 50


def test_delta_star_in_summary():
    from urt.quantum_chaos import quantum_chaos_summary
    from urt.shell_closure import DELTA_STAR
    r = quantum_chaos_summary()
    assert abs(r["delta_star"] - DELTA_STAR) < 1e-12
