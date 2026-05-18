"""Uniqueness proofs — spectral, γ-from-D, and URT-coefficient."""
from newtons_cathedral.uniqueness import (
    PLATONIC_PLUS_CENTRE,
    LAPLACIAN_EIGENVALUES,
    ETA_EXACT, ETA_L_EXACT, MU_EXACT,
    all_modes_contract, gamma_from_dimension, gamma_from_icosahedron,
    gamma_identity_holds, mode_contraction, spectral_uniqueness_winner,
    uniqueness_audit,
)


def test_icosahedron_plus_centre_is_unique():
    assert spectral_uniqueness_winner() == "icosahedron+centre"


def test_only_two_solids_are_simple():
    simples = {n for n, d in PLATONIC_PLUS_CENTRE.items() if d["simple"]}
    assert simples == {"dodecahedron+centre", "icosahedron+centre"}


def test_only_two_solids_have_fiedler_D():
    fiedlers = {n for n, d in PLATONIC_PLUS_CENTRE.items()
                if abs(d["lambda2"] - 3) < 1e-2}
    assert fiedlers == {"cube+centre", "icosahedron+centre"}


def test_gamma_from_dim_equals_gamma_from_icos():
    assert abs(gamma_from_dimension() - gamma_from_icosahedron()) < 1e-15


def test_gamma_identity_holds():
    # |H_3| + F + 1 = D^{D+1} = 81
    assert gamma_identity_holds()


def test_thirteen_laplacian_eigenvalues():
    assert len(LAPLACIAN_EIGENVALUES) == 13
    assert LAPLACIAN_EIGENVALUES[0] == 0
    assert LAPLACIAN_EIGENVALUES[-1] == 13


def test_all_modes_contract():
    # L4: every Laplacian mode has |κ(λ)| < 1.
    assert all_modes_contract()


def test_urt_coefficients_exact():
    from math import pi
    assert abs(ETA_EXACT - 1.0 / (8 * pi)) < 1e-15
    assert abs(ETA_L_EXACT - 1.0 / (4 * pi)) < 1e-15
    # μ = 1/φ
    from newtons_cathedral.foundations import PHI
    assert abs(MU_EXACT - (PHI - 1)) < 1e-15


def test_audit_passes():
    assert uniqueness_audit()
