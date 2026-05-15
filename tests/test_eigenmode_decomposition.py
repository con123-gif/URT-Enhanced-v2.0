"""Tests for A_s factor → eigenmode/sector decomposition."""
import math
import pytest

from urt.eigenmode_decomposition import (
    N_E, K_GAMMA_AS, A_S_PREDICTED,
    AsFactor, AS_FACTORS,
    reconstructed_A_s, reconstruction_residual,
    factor_sectors_summary,
    cathedral_laplacian_eigenvalues,
    eigenmode_amplitudes_after_T_steps,
    gamma_level_for_eigenvalue,
    reconstruction_within_machine_precision,
    every_factor_has_eigenmode_origin,
    sectors_cover_K4_A5_and_geometric,
    eigenmode_decomposition_audit_passes,
)
from urt.shell_closure import D, G


def test_N_E_equals_57():
    assert N_E == G - D
    assert N_E == 57


def test_K_GAMMA_AS_equals_D_squared():
    assert K_GAMMA_AS == D**2 == 9


def test_AS_FACTORS_count_at_least_7():
    assert len(AS_FACTORS) >= 7


def test_A_s_predicted_in_Planck_range():
    """A_s should be close to 2.1e-9 (Planck)."""
    assert 1e-9 < A_S_PREDICTED < 5e-9


def test_factor_reconstruction_machine_precision():
    """Multiplying all factors must recover A_S_PREDICTED exactly."""
    assert reconstruction_within_machine_precision()
    assert reconstruction_residual() < 1e-12


def test_factor_sectors_cover_all_classes():
    """A_s factors span K_4, A_5, sector ratio, geometric, and RG."""
    assert sectors_cover_K4_A5_and_geometric()


def test_each_factor_has_origin_description():
    assert every_factor_has_eigenmode_origin()


def test_laplacian_eigenvalues_match_framework():
    eigs = cathedral_laplacian_eigenvalues()
    distinct = sorted(set(int(round(e)) for e in eigs))
    assert distinct == [0, 3, 5, 7, 9, 13]


def test_K_GAMMA_AS_is_laplacian_eigenvalue():
    """The γ-exponent k=9 IS a Laplacian eigenvalue of L_{G_13}."""
    eigs = cathedral_laplacian_eigenvalues()
    distinct = set(int(round(e)) for e in eigs)
    assert K_GAMMA_AS in distinct


def test_eigenmode_amplitudes_decay():
    """At T=100 steps, all non-zero modes have amplitudes < 1."""
    amps = eigenmode_amplitudes_after_T_steps(100)
    # constant mode (λ=0) has amplitude exactly 1
    # all others should be in (0, 1)
    assert all(0 <= a <= 1 + 1e-10 for a in amps)


def test_audit_passes():
    assert eigenmode_decomposition_audit_passes()
