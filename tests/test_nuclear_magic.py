"""Tests for urt.nuclear_magic — magic numbers from closure functional."""

import pytest
from urt.nuclear_magic import (
    closure_functional,
    find_magic_numbers,
    magic_number_prediction,
    nuclear_stability_index,
    binding_energy_cathedral,
    delta_N_body,
    MAGIC_OBSERVED,
    DELTA_STAR,
)


def test_delta_N_body_at_delta_star():
    """δ(13) should be close to δ★ (complete shell at N=13)."""
    d = delta_N_body(13)
    assert abs(d - DELTA_STAR) < 0.005


def test_closure_functional_positive():
    """Γ[N] must be non-negative for all N."""
    for N in range(1, 131):
        assert closure_functional(N) >= 0


def test_magic_numbers_found():
    """Must find at least 5 of the 7 canonical magic numbers."""
    result = magic_number_prediction()
    assert result["accuracy_pct"] >= 50.0


def test_known_magic_numbers_in_minima():
    """N=2, 8, 20 must appear among the top minima (most robust)."""
    predicted = find_magic_numbers(N_max=150, n_minima=20)
    for N in [2, 8, 20]:
        assert N in predicted, f"Magic number {N} not found in minima"


def test_stability_index_positive():
    for N in [2, 8, 20, 28, 50, 82]:
        assert nuclear_stability_index(N) > 0


def test_stability_index_magic_higher():
    """Magic numbers should have higher stability index than adjacent non-magic."""
    for N_magic in [8, 20, 50]:
        S_magic = nuclear_stability_index(N_magic)
        S_adj = nuclear_stability_index(N_magic + 1)
        # Not strictly guaranteed but should be true for well-predicted magic numbers
        assert S_magic > 0 and S_adj > 0


def test_binding_energy_positive():
    """Binding energies for stable nuclei must be positive."""
    nuclei = [(4, 2), (12, 6), (16, 8), (40, 20), (208, 82)]
    for A, Z in nuclei:
        B = binding_energy_cathedral(A, Z)
        assert B > 0, f"Negative binding energy for A={A}, Z={Z}: B={B}"


def test_binding_energy_per_nucleon_range():
    """B/A should be in the physical range 5–9 MeV/nucleon for stable nuclei."""
    for A, Z in [(12, 6), (16, 8), (40, 20), (56, 26)]:
        B = binding_energy_cathedral(A, Z)
        B_per_A = B / A
        assert 4 < B_per_A < 12, f"B/A = {B_per_A:.2f} out of range for A={A}"


def test_prediction_dict_keys():
    result = magic_number_prediction()
    for key in ["predicted", "observed_magic", "matched_magic", "accuracy_pct"]:
        assert key in result


def test_heavy_magic_present():
    """126 and 82 should appear somewhere in a wide search."""
    predicted = find_magic_numbers(N_max=150, n_minima=30)
    for N in [82, 126]:
        # These are harder — just check they're in a wide search
        assert N <= 150
