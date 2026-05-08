"""Tests for urt/zeta_g13.py — Spectral zeta function of the G₁₃ icosahedral graph."""

import pytest
from math import factorial, isclose, sqrt


# ── Import guard ──────────────────────────────────────────────────────────────

def test_imports():
    from urt.zeta_g13 import (
        SPECTRUM, ZETA_MINUS_1, ZETA_ZERO,
        DET_L_PRIME_VALUE, SPANNING_TREES, SPANNING_TREE_SQRT,
        GAMMA_INV, IHARA_FORMULA_EXISTS,
        IDENTITY_ZETA_MINUS_1, IDENTITY_ZETA_ZERO,
        IDENTITY_DET_CATHEDRAL, IDENTITY_PERFECT_SQUARE, IDENTITY_SQRT_CATHEDRAL,
        spectral_zeta, spectral_zeta_integer,
        cathedral_factorization, spanning_tree_analysis,
        zeta_summary, print_zeta_report,
    )


# ── Cathedral integer constants ───────────────────────────────────────────────

def test_gamma_inv():
    from urt.zeta_g13 import GAMMA_INV
    assert GAMMA_INV == 81
    assert GAMMA_INV == 3**4


def test_gamma_inv_matches_shell_closure():
    from urt.zeta_g13 import GAMMA_INV
    from urt.shell_closure import gamma
    assert abs(1.0 / GAMMA_INV - gamma) < 1e-15


# ── Spectrum ──────────────────────────────────────────────────────────────────

def test_spectrum_structure():
    from urt.zeta_g13 import SPECTRUM
    eigenvalues = [lam for lam, _ in SPECTRUM]
    multiplicities = [m for _, m in SPECTRUM]
    assert eigenvalues == [3, 5, 7, 9, 13]
    assert multiplicities == [2, 6, 2, 1, 1]


def test_spectrum_eigenvalues_are_cathedral_integers():
    from urt.zeta_g13 import SPECTRUM
    from urt.shell_closure import D, N, q
    evals = {lam for lam, _ in SPECTRUM}
    # λ₂ = D = 3
    assert D in evals
    # λ₃ = q = 5
    assert q in evals
    # λ_max = N = 13
    assert N in evals
    # D² = 9
    assert D**2 in evals
    # D!+1 = 7
    assert factorial(D) + 1 in evals


def test_total_multiplicity_plus_zero_mode():
    """Total nodes = 1 (zero mode) + sum of nonzero multiplicities = 13 = N."""
    from urt.zeta_g13 import SPECTRUM
    from urt.shell_closure import N
    total = 1 + sum(m for _, m in SPECTRUM)
    assert total == N


# ── ζ(−1): spectral energy sum ────────────────────────────────────────────────

def test_zeta_minus_1_value():
    from urt.zeta_g13 import ZETA_MINUS_1
    assert ZETA_MINUS_1 == 72


def test_zeta_minus_1_cathedral():
    """ζ(-1) = 2^D × D² = 8 × 9 = 72."""
    from urt.zeta_g13 import ZETA_MINUS_1
    from urt.shell_closure import D
    assert ZETA_MINUS_1 == (2**D) * (D**2)


def test_zeta_minus_1_identity_flag():
    from urt.zeta_g13 import IDENTITY_ZETA_MINUS_1
    assert IDENTITY_ZETA_MINUS_1 is True


def test_zeta_minus_1_manual():
    """Manual sum: 2×3 + 6×5 + 2×7 + 9 + 13 = 6+30+14+9+13 = 72."""
    total = 2*3 + 6*5 + 2*7 + 1*9 + 1*13
    assert total == 72


def test_spectral_zeta_at_minus_1():
    """spectral_zeta(-1) should equal ZETA_MINUS_1 = 72."""
    from urt.zeta_g13 import spectral_zeta, ZETA_MINUS_1
    result = spectral_zeta(-1.0)
    assert isclose(result, ZETA_MINUS_1, rel_tol=1e-12)


def test_spectral_zeta_integer_at_1():
    """spectral_zeta_integer(1) = ζ(-1) = 72."""
    from urt.zeta_g13 import spectral_zeta_integer, ZETA_MINUS_1
    assert isclose(spectral_zeta_integer(1), ZETA_MINUS_1, rel_tol=1e-12)


# ── ζ(0): total multiplicity = V ─────────────────────────────────────────────

def test_zeta_zero_value():
    from urt.zeta_g13 import ZETA_ZERO
    assert ZETA_ZERO == 12


def test_zeta_zero_eq_V():
    from urt.zeta_g13 import ZETA_ZERO
    from urt.shell_closure import V
    assert ZETA_ZERO == V


def test_zeta_zero_identity_flag():
    from urt.zeta_g13 import IDENTITY_ZETA_ZERO
    assert IDENTITY_ZETA_ZERO is True


def test_spectral_zeta_at_0():
    from urt.zeta_g13 import spectral_zeta, ZETA_ZERO
    assert isclose(spectral_zeta(0.0), ZETA_ZERO, rel_tol=1e-12)


def test_spectral_zeta_integer_at_0():
    """spectral_zeta_integer(0) = ζ(0) = 12 = V."""
    from urt.zeta_g13 import spectral_zeta_integer, ZETA_ZERO
    assert isclose(spectral_zeta_integer(0), ZETA_ZERO, rel_tol=1e-12)


# ── ζ(1) and ζ(2) numerical values ───────────────────────────────────────────

def test_zeta_1_numerical():
    """ζ(1) = 2/3 + 6/5 + 2/7 + 1/9 + 1/13."""
    from urt.zeta_g13 import spectral_zeta
    expected = 2/3 + 6/5 + 2/7 + 1/9 + 1/13
    assert isclose(spectral_zeta(1.0), expected, rel_tol=1e-12)


def test_zeta_2_numerical():
    """ζ(2) = 2/9 + 6/25 + 2/49 + 1/81 + 1/169."""
    from urt.zeta_g13 import spectral_zeta
    expected = 2/9 + 6/25 + 2/49 + 1/81 + 1/169
    assert isclose(spectral_zeta(2.0), expected, rel_tol=1e-12)


def test_zeta_positive_s_decreasing():
    """ζ(s) is strictly decreasing for s > 0."""
    from urt.zeta_g13 import spectral_zeta
    assert spectral_zeta(0.5) > spectral_zeta(1.0) > spectral_zeta(2.0)


# ── Spectral determinant det'(L) ──────────────────────────────────────────────

def test_det_prime_L_value():
    from urt.zeta_g13 import DET_L_PRIME_VALUE
    assert DET_L_PRIME_VALUE == 806_203_125


def test_det_prime_cathedral_factorization():
    """det'(L) = 3⁴ × 5⁶ × 7² × 13 = GAMMA_INV × q^{D!} × (D!+1)² × N."""
    from urt.zeta_g13 import DET_L_PRIME_VALUE, GAMMA_INV
    from urt.shell_closure import D, N, q
    d_fact = factorial(D)
    d_fact_p1 = d_fact + 1
    cathedral = GAMMA_INV * (q**d_fact) * (d_fact_p1**2) * N
    assert cathedral == DET_L_PRIME_VALUE


def test_det_prime_identity_flag():
    from urt.zeta_g13 import IDENTITY_DET_CATHEDRAL
    assert IDENTITY_DET_CATHEDRAL is True


def test_det_prime_prime_factorization():
    """det'(L) = 3⁴ × 5⁶ × 7² × 13."""
    from urt.zeta_g13 import DET_L_PRIME_VALUE
    assert DET_L_PRIME_VALUE == (3**4) * (5**6) * (7**2) * 13


# ── Spanning trees ────────────────────────────────────────────────────────────

def test_spanning_trees_value():
    from urt.zeta_g13 import SPANNING_TREES
    assert SPANNING_TREES == 62_015_625


def test_spanning_trees_kirchhoff():
    """κ(G₁₃) = det'(L) / N."""
    from urt.zeta_g13 import SPANNING_TREES, DET_L_PRIME_VALUE
    from urt.shell_closure import N
    assert DET_L_PRIME_VALUE // N == SPANNING_TREES


def test_spanning_trees_perfect_square():
    """κ(G₁₃) is a perfect square."""
    from urt.zeta_g13 import SPANNING_TREES, SPANNING_TREE_SQRT, IDENTITY_PERFECT_SQUARE
    assert SPANNING_TREE_SQRT**2 == SPANNING_TREES
    assert IDENTITY_PERFECT_SQUARE is True


def test_spanning_tree_sqrt_value():
    from urt.zeta_g13 import SPANNING_TREE_SQRT
    assert SPANNING_TREE_SQRT == 7875


def test_spanning_tree_sqrt_cathedral():
    """√κ = D² × q^D × (D!+1) = 9 × 125 × 7 = 7875."""
    from urt.zeta_g13 import SPANNING_TREE_SQRT, IDENTITY_SQRT_CATHEDRAL
    from urt.shell_closure import D, q
    d_fact_p1 = factorial(D) + 1
    assert (D**2) * (q**D) * d_fact_p1 == SPANNING_TREE_SQRT
    assert IDENTITY_SQRT_CATHEDRAL is True


def test_7875_squared_eq_62015625():
    """Explicit check: 7875² == 62_015_625."""
    assert 7875**2 == 62_015_625


def test_sqrt_cathedral_decomposition():
    """9 × 125 × 7 = 7875."""
    from urt.shell_closure import D, q
    d_fact_p1 = factorial(D) + 1
    assert D**2 == 9
    assert q**D == 125
    assert d_fact_p1 == 7
    assert 9 * 125 * 7 == 7875


# ── Ihara zeta flag ───────────────────────────────────────────────────────────

def test_ihara_formula_exists():
    from urt.zeta_g13 import IHARA_FORMULA_EXISTS
    assert IHARA_FORMULA_EXISTS is True


# ── Summary and factorization functions ──────────────────────────────────────

def test_cathedral_factorization_keys():
    from urt.zeta_g13 import cathedral_factorization
    cf = cathedral_factorization()
    for key in [
        "D", "N", "V", "q", "GAMMA_INV",
        "det_prime_L", "spanning_trees", "spanning_tree_sqrt",
        "is_perfect_square", "identity_sqrt_cathedral", "identity_det_cathedral",
        "zeta_minus_1", "zeta_zero",
    ]:
        assert key in cf, f"Missing key: {key}"


def test_cathedral_factorization_values():
    from urt.zeta_g13 import cathedral_factorization
    cf = cathedral_factorization()
    assert cf["det_prime_L"] == 806_203_125
    assert cf["spanning_trees"] == 62_015_625
    assert cf["spanning_tree_sqrt"] == 7875
    assert cf["is_perfect_square"] is True
    assert cf["identity_sqrt_cathedral"] is True
    assert cf["identity_det_cathedral"] is True
    assert cf["zeta_minus_1"] == 72
    assert cf["zeta_zero"] == 12


def test_spanning_tree_analysis_keys():
    from urt.zeta_g13 import spanning_tree_analysis
    sa = spanning_tree_analysis()
    for key in [
        "spanning_trees", "det_prime_L", "N",
        "kirchhoff_check", "sqrt_kappa", "is_perfect_square",
        "cathedral_decomposition",
    ]:
        assert key in sa, f"Missing key: {key}"


def test_spanning_tree_analysis_values():
    from urt.zeta_g13 import spanning_tree_analysis
    sa = spanning_tree_analysis()
    assert sa["spanning_trees"] == 62_015_625
    assert sa["sqrt_kappa"] == 7875
    assert sa["is_perfect_square"] is True
    assert sa["kirchhoff_check"] is True


def test_zeta_summary_keys():
    from urt.zeta_g13 import zeta_summary
    s = zeta_summary()
    for key in [
        "spectrum", "eigenvalues",
        "zeta_minus_1", "zeta_zero", "zeta_1", "zeta_2",
        "identity_zeta_minus_1", "identity_zeta_zero",
        "det_prime_L", "spanning_trees", "spanning_tree_sqrt",
        "is_perfect_square", "identity_sqrt_cathedral", "identity_det_cathedral",
        "ihara_formula_exists",
    ]:
        assert key in s, f"Missing key: {key}"


def test_zeta_summary_all_identities_true():
    from urt.zeta_g13 import zeta_summary
    s = zeta_summary()
    assert s["identity_zeta_minus_1"] is True
    assert s["identity_zeta_zero"] is True
    assert s["is_perfect_square"] is True
    assert s["identity_sqrt_cathedral"] is True
    assert s["identity_det_cathedral"] is True
    assert s["ihara_formula_exists"] is True


def test_print_zeta_report_runs():
    """print_zeta_report should execute without error."""
    from urt.zeta_g13 import print_zeta_report
    print_zeta_report()
