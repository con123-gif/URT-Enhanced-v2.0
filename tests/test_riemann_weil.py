"""Tests for urt.riemann_weil — finite Cathedral Weil-positivity infrastructure."""
import math
import numpy as np
import pytest
from urt.riemann_weil import (
    cathedral_laplacian,
    prime_kernel_eigenvalues,
    K4_A5_split,
    A_cath,
    weil_quadratic,
    cross_basis_certificate,
    riemann_weil_audit_passes,
    cathedral_laplacian_trace,
)


def test_spectrum_is_canonical():
    """G_{13} Laplacian spectrum must be {0, 3, 3, 5×6, 7×2, 9, 13}."""
    spec = prime_kernel_eigenvalues()
    expected = [0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13]
    assert np.allclose(spec, expected, atol=1e-9)


def test_trace_equals_DfacV():
    """tr(L) = D!·V = 72."""
    assert cathedral_laplacian_trace() == pytest.approx(72.0, abs=1e-9)


def test_sector_split_4_plus_9():
    s = K4_A5_split()
    assert s["K4_eigvals"].size == 4
    assert s["A5_eigvals"].size == 9


def test_K4_contains_zero_mode():
    s = K4_A5_split()
    assert s["K4_eigvals"][0] == pytest.approx(0.0, abs=1e-9)


def test_A_cath_always_positive():
    """A_Cath(u) = δ★·(1 + (u/N)²) must be > 0 for all real u."""
    for u in [-50, -10, -1, 0, 1, 10, 50]:
        assert A_cath(float(u)) > 0


def test_A_cath_minimum_at_zero():
    """A_Cath minimised at u=0."""
    assert A_cath(0.0) < A_cath(1.0)


def test_weil_quadratic_returns_four_components():
    h = lambda u: math.exp(-(u / 2.0) ** 2)
    result = weil_quadratic(h)
    assert set(result.keys()) == {"pole", "gamma", "prime", "cathedral",
                                  "W_Cath_total"}


def test_cathedral_counterterm_non_negative():
    """∫ A_cath·h² ≥ 0 since both factors ≥ 0."""
    h = lambda u: math.exp(-(u / 2.0) ** 2)
    result = weil_quadratic(h)
    assert result["cathedral"] >= 0


def test_cross_basis_all_finite():
    for row in cross_basis_certificate():
        assert math.isfinite(row["W_Cath_total"])
        assert math.isfinite(row["pole"])
        assert math.isfinite(row["gamma"])
        assert math.isfinite(row["prime"])
        assert math.isfinite(row["cathedral"])


def test_audit_passes():
    assert riemann_weil_audit_passes()
