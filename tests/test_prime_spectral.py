"""Tests for urt.prime_spectral — icosahedral eigenvalues and Riemann zeros."""

import pytest
import numpy as np
from urt.prime_spectral import (
    laplacian_spectrum,
    adjacency_spectrum,
    distinct_eigenvalues,
    spectral_gap,
    ramanujan_bound,
    riemann_scaling_constant,
    cathedral_kappa_formula,
    riemann_zero_matches,
    ihara_determinant,
    RIEMANN_ZEROS,
    D, N,
)


def test_laplacian_eigenvalues_are_integers():
    """All eigenvalues must be non-negative integers."""
    spec = laplacian_spectrum()
    for v in spec:
        assert v >= 0
        assert v == int(v)


def test_laplacian_has_zero():
    """Connected graph → one zero eigenvalue."""
    spec = laplacian_spectrum()
    assert spec[0] == 0


def test_laplacian_eigenvalue_count():
    """Must have exactly 13 eigenvalues."""
    assert len(laplacian_spectrum()) == N


def test_distinct_eigenvalues():
    """Distinct nonzero eigenvalues: {3, 5, 7, 9, 13}."""
    de = distinct_eigenvalues()
    assert set(de.keys()) == {3, 5, 7, 9, 13}


def test_eigenvalue_d():
    """D=3 must appear as an eigenvalue."""
    de = distinct_eigenvalues()
    assert D in de


def test_eigenvalue_n():
    """N=13 must appear as an eigenvalue."""
    de = distinct_eigenvalues()
    assert N in de


def test_eigenvalue_q():
    """q=5 must appear as an eigenvalue with multiplicity 6."""
    de = distinct_eigenvalues()
    assert de[5] == 6


def test_spectral_gap_equals_d():
    """Spectral gap λ₂ = D = 3."""
    assert spectral_gap() == D


def test_spectral_gap_multiplicity():
    """λ₂ = 3 has multiplicity 2."""
    de = distinct_eigenvalues()
    assert de[D] == 2


def test_ramanujan_bound():
    """2√(d−1) = 2√4 = 4.0 for degree-5 shell sites."""
    assert abs(ramanujan_bound() - 4.0) < 1e-10


def test_adjacency_ramanujan():
    """Shell adjacency eigenvalues must be ≤ Ramanujan bound 4."""
    adj_spec = adjacency_spectrum()
    bound = ramanujan_bound()
    # Central site eigenvalue (6) exceeds bound (it's the hub), shell eigenvalues ≤ 4
    shell_eigenvalues = [v for v in adj_spec if abs(v) < 6]
    for v in shell_eigenvalues:
        assert abs(v) <= bound + 1e-10


def test_kappa_formula_close_to_definition():
    """D·π/2 must agree with t₁/D to within 0.1%."""
    kappa_def = riemann_scaling_constant()
    kappa_cat = cathedral_kappa_formula()
    error_pct = abs(kappa_def - kappa_cat) / kappa_def * 100
    assert error_pct < 0.1


def test_riemann_match_d():
    """D·κ ≈ t₁ to < 0.01%."""
    matches = riemann_zero_matches()
    m = next(m for m in matches if m["eigenvalue"] == D)
    assert m["error_pct"] < 0.01


def test_riemann_match_7():
    """7·κ ≈ t₅ to < 0.5%."""
    matches = riemann_zero_matches()
    m = next(m for m in matches if m["eigenvalue"] == 7)
    assert m["error_pct"] < 0.5


def test_riemann_match_n():
    """N·κ ≈ t₁₄ to < 1%."""
    matches = riemann_zero_matches()
    m = next(m for m in matches if m["eigenvalue"] == N)
    assert m["error_pct"] < 1.0


def test_ihara_det_at_zero():
    """det(I) = 1 at u=0."""
    assert abs(ihara_determinant(0.0) - 1.0) < 1e-10


def test_ihara_det_finite():
    for u in [0.01, 0.1, 0.5]:
        assert np.isfinite(ihara_determinant(u))


def test_riemann_zeros_first_value():
    """First Riemann zero must be ≈ 14.1347."""
    assert abs(RIEMANN_ZEROS[0] - 14.134725) < 1e-4
