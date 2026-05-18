"""K_4 ⊕ A_5 = 4 + 9 = 13 sector decomposition."""
import numpy as np

from urt.foundations import D, N
from urt.sectors import (
    A5_EIGENVALUES, A5_SIZE, ETA_B_PREFACTOR, K4_EIGENVALUES, K4_SIZE,
    OMEGA_L_BARE, OMEGA_M_BARE, SECTOR_RATIO, TR_L_A5, TR_L_K4, TR_L_TOTAL,
    sector_decomposition, sector_power, sector_ratio_at, sectors_audit,
)


def test_sector_sizes():
    assert K4_SIZE == D + 1 == 4
    assert A5_SIZE == D ** 2 == 9
    assert K4_SIZE + A5_SIZE == N == 13


def test_sector_ratio_is_four_ninths():
    assert SECTOR_RATIO == 4 / 9
    assert ETA_B_PREFACTOR == 8 / 9


def test_d3_is_unique_dimension_for_order_unity_ratio():
    # D = 2 → 3/4, D = 3 → 4/9, D = 4 → 5/28, D = 5 → 6/125
    assert sector_ratio_at(2) == 3 / 4
    assert sector_ratio_at(3) == 4 / 9
    assert sector_ratio_at(4) == 5 / 28
    # Only D = 3 has the ratio order unity AND A_{D+2} = A_5 non-solvable.


def test_trace_split():
    assert TR_L_K4 == 11
    assert TR_L_A5 == 61
    assert TR_L_TOTAL == 72


def test_eigenvalues_match_full_spectrum():
    combined = sorted(list(K4_EIGENVALUES) + list(A5_EIGENVALUES))
    assert combined == [0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13]


def test_bare_cosmology_fractions():
    assert OMEGA_M_BARE == 4 / 13
    assert OMEGA_L_BARE == 9 / 13
    assert OMEGA_M_BARE + OMEGA_L_BARE == 1.0


def test_sector_decomposition_is_orthogonal():
    rng = np.random.default_rng(0)
    x = rng.normal(size=N)
    p4, p9 = sector_power(x)
    # Parseval: total power = sum of squared components.
    assert abs((p4 + p9) - float(np.sum(x ** 2))) < 1e-10


def test_audit_passes():
    assert sectors_audit()
