"""ARF Cathedral: 1/α, m_p/m_e, n_s, r from integers."""
from newtons_cathedral.arf import (
    ALPHA_INV_BARE, ALPHA_INV_FULL, D64, MP_ME_BARE, MP_ME_FULL,
    MU_E_BARE, N_E_FOLDS, R_ALPHA, SPECTRAL_INDEX_NS, TENSOR_TO_SCALAR_R,
    arf_audit,
)
from newtons_cathedral.foundations import D, E, F, G, N, q


def test_alpha_inv_bare_is_137():
    assert ALPHA_INV_BARE == 137
    assert ALPHA_INV_BARE == N * N - E - (D - 1)


def test_alpha_inv_full_matches_codata_ppm_level():
    codata = 137.035999084
    assert abs(ALPHA_INV_FULL - codata) / codata < 2e-7   # ~ 0.0001 %


def test_mp_me_bare_is_1836():
    assert MP_ME_BARE == 1836
    assert MP_ME_BARE == (D + 1) * D ** D * (N + D + 1)


def test_mp_me_full_matches_codata():
    codata = 1836.15267
    assert abs(MP_ME_FULL - codata) / codata < 2e-7


def test_mu_e_bare_integer():
    assert MU_E_BARE == 207
    assert MU_E_BARE == D * (G + D * D)


def test_n_e_folds_is_57():
    assert N_E_FOLDS == 57
    assert N_E_FOLDS == G - D


def test_spectral_index_55_over_57():
    assert SPECTRAL_INDEX_NS == 55 / 57
    assert abs(SPECTRAL_INDEX_NS - 0.9649) < 1e-3       # Planck 2018


def test_tensor_to_scalar_ratio():
    assert TENSOR_TO_SCALAR_R == 12 / 57 ** 2
    assert TENSOR_TO_SCALAR_R < 0.036                    # below BICEP/Keck bound


def test_d64_equals_k4_cube():
    # The ARF residue d_64 = (D+1)^D is the K_4-cube vertex count.
    assert D64 == (D + 1) ** D == 64


def test_audit_passes():
    assert arf_audit()
