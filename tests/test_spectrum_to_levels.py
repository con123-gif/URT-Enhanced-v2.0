"""Tests for L_{G_{13}} spectrum → γ-ladder level correspondence."""
import pytest

from urt.spectrum_to_levels import (
    icosahedral_adjacency_matrix, icosahedral_laplacian,
    laplacian_spectrum, distinct_eigenvalues_rounded,
    is_spectral_eigenvalue, level_origin,
    levels_with_spectral_origin, levels_with_combinatorial_origin,
    spectrum_matches_expected, spectrum_contains_cathedral_integers,
    at_least_three_spectral_levels, spectrum_to_levels_audit_passes,
)


def test_adjacency_matrix_shape():
    A = icosahedral_adjacency_matrix()
    assert A.shape == (13, 13)


def test_laplacian_shape():
    L = icosahedral_laplacian()
    assert L.shape == (13, 13)


def test_laplacian_is_symmetric():
    L = icosahedral_laplacian()
    import numpy as np
    assert np.allclose(L, L.T)


def test_laplacian_kernel_dimension_one():
    """The all-ones vector is in the kernel (graph is connected)."""
    L = icosahedral_laplacian()
    eigs = laplacian_spectrum()
    # smallest eigenvalue is ~0 (constant mode)
    assert abs(eigs[0]) < 1e-9


def test_distinct_eigenvalues_match_framework():
    """L_{G_13} has exactly 6 distinct eigenvalues: {0, 3, 5, 7, 9, 13}."""
    assert distinct_eigenvalues_rounded() == [0, 3, 5, 7, 9, 13]


def test_spectrum_matches_expected():
    assert spectrum_matches_expected()


def test_spectrum_contains_cathedral_integers():
    assert spectrum_contains_cathedral_integers()


def test_spectral_levels_set():
    """k ∈ {0, 3, 5, 9} are Laplacian eigenvalues."""
    sp = sorted(levels_with_spectral_origin())
    # at minimum these 4 are spectral
    for k in (0, 3, 5, 9):
        assert k in sp


def test_combinatorial_levels_include_64_and_minus7():
    """k = 64 = (D+1)^D and k = -7 = -(D!+1) are NOT Laplacian eigenvalues."""
    co = sorted(levels_with_combinatorial_origin())
    assert 64 in co
    assert -7 in co


def test_is_spectral_eigenvalue():
    assert is_spectral_eigenvalue(0)
    assert is_spectral_eigenvalue(3)
    assert is_spectral_eigenvalue(5)
    assert is_spectral_eigenvalue(7)
    assert is_spectral_eigenvalue(9)
    assert is_spectral_eigenvalue(13)
    assert not is_spectral_eigenvalue(64)
    assert not is_spectral_eigenvalue(-7)


def test_level_origin_classification():
    info_spectral = level_origin(3)
    assert info_spectral["origin"] == "spectral"
    assert "L_{G_{13}}" in info_spectral["eigenvalue_of"]

    info_comb = level_origin(64)
    assert info_comb["origin"] == "combinatorial"


def test_at_least_three_spectral_levels():
    assert at_least_three_spectral_levels()


def test_spectrum_to_levels_audit_passes():
    assert spectrum_to_levels_audit_passes()
