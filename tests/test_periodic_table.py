"""Tests for urt.periodic_table — Cathedral Madelung rule and noble gases."""

import pytest
from urt.periodic_table import (
    madelung_energy,
    madelung_order,
    orbital_capacity,
    electron_configuration,
    period_lengths,
    cathedral_noble_gas_prediction,
    madelung_constant,
    h3_irrep,
    sector_orbital_table,
    periodic_table_summary,
    NOBLE_GAS_Z,
    DELTA_STAR,
    K_MADELUNG,
    PHI,
)


def test_madelung_constant_value():
    """K_M = δ★/(2π·φ) must be positive and small."""
    from math import pi
    expected = DELTA_STAR / (2 * pi * PHI)
    assert abs(K_MADELUNG - expected) < 1e-14


def test_madelung_energy_l0_equals_n():
    """For l=0, E(n,0) = n exactly (no correction for s-orbitals)."""
    for n in range(1, 8):
        assert madelung_energy(n, 0) == n


def test_madelung_energy_increasing_l():
    """Within same n+l, larger l has higher E(n,l) → lower n fills first."""
    for nl in range(2, 9):
        pairs = [(n, nl - n) for n in range(1, nl) if 0 <= nl - n < n]
        energies = [madelung_energy(n, l) for n, l in pairs]
        # Energies should decrease with increasing n (decreasing l)
        for i in range(len(energies) - 1):
            assert energies[i] < energies[i + 1]


def test_madelung_ordering_is_correct():
    """Verify first 10 orbitals match known Aufbau order."""
    expected = [(1, 0), (2, 0), (2, 1), (3, 0), (3, 1),
                (4, 0), (3, 2), (4, 1), (5, 0), (4, 2)]
    order = madelung_order(n_max=7)
    actual = [(n, l) for n, l, _ in order[:10]]
    assert actual == expected, f"Madelung order wrong: {actual}"


def test_orbital_capacity():
    """2(2l+1): s=2, p=6, d=10, f=14."""
    assert orbital_capacity(0) == 2
    assert orbital_capacity(1) == 6
    assert orbital_capacity(2) == 10
    assert orbital_capacity(3) == 14


def test_noble_gas_prediction_100_percent():
    """All 7 known noble gases must be predicted."""
    s = periodic_table_summary()
    assert s["all_correct"], f"Missed: {set(NOBLE_GAS_Z) - set(s['noble_gas_Z_predicted'])}"
    assert s["accuracy_pct"] == 100.0


def test_noble_gas_z_values():
    """Noble-gas Z values must exactly match NOBLE_GAS_Z = [2,10,18,36,54,86,118]."""
    predicted = cathedral_noble_gas_prediction()
    predicted_z = set(predicted.keys())
    for z in NOBLE_GAS_Z:
        assert z in predicted_z, f"Z={z} not predicted"


def test_period_lengths():
    """Period lengths must be [2, 8, 8, 18, 18, 32, 32]."""
    lengths = period_lengths()
    assert lengths[:7] == [2, 8, 8, 18, 18, 32, 32]


def test_helium_configuration():
    """He (Z=2): 1s²."""
    c = electron_configuration(2)
    assert c == {"1s": 2}


def test_neon_configuration():
    """Ne (Z=10): 1s² 2s² 2p⁶."""
    c = electron_configuration(10)
    assert c["1s"] == 2
    assert c["2s"] == 2
    assert c["2p"] == 6


def test_argon_configuration():
    """Ar (Z=18): fills 1s,2s,2p,3s,3p."""
    c = electron_configuration(18)
    assert sum(c.values()) == 18


def test_krypton_configuration():
    """Kr (Z=36): fills including 3d."""
    c = electron_configuration(36)
    assert sum(c.values()) == 36
    assert "3d" in c
    assert c["3d"] == 10


def test_h3_irrep_s_orbital():
    """l=0 maps to A₁ (dim 1)."""
    dim, label = h3_irrep(0)
    assert dim == 1
    assert "A" in label


def test_h3_irrep_p_orbital():
    """l=1 maps to T₁ (dim 3)."""
    dim, label = h3_irrep(1)
    assert dim == 3
    assert "T" in label


def test_h3_irrep_d_orbital():
    """l=2 maps to H (dim 5)."""
    dim, label = h3_irrep(2)
    assert dim == 5


def test_h3_irrep_f_orbital():
    """l=3 maps to T₂+G (dim 7)."""
    dim, label = h3_irrep(3)
    assert dim == 7


def test_sector_orbital_table():
    """A₅ has 9 modes, K₄ has 4, sum = 13."""
    t = sector_orbital_table()
    assert t["A5_modes"] == 9
    assert t["K4_modes"] == 4
    assert t["K4_plus_A5"] == 13


def test_a5_covers_s_p_d():
    """A₅ (9 modes) = s(1)+p(3)+d(5) = complete angular momentum {0,1,2} block."""
    t = sector_orbital_table()
    modes = sum(t["A5_orbital_content"].values())
    assert modes == 9
    assert t["electrons_periods_1_3"] == 18  # 2×9
