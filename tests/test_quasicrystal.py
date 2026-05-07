"""Tests for urt.quasicrystal — IKT transform and icosahedral quasicrystal."""

import pytest
import numpy as np
from urt.quasicrystal import (
    ikt_forward,
    ikt_inverse,
    ikt_matrix,
    ikt_sector_power,
    phi_scaled_radii,
    quasicrystal_structure_factor,
    icosahedral_quasicrystal_info,
    phi_phase,
    K4_SECTOR,
    A5_SECTOR,
    N_SITE,
    phi_gr,
)


# ── Sector structure ──────────────────────────────────────────────────────────

def test_sector_sizes():
    """K₄ has 4 modes, A₅ has 9 modes, total 13."""
    assert len(K4_SECTOR) == 4
    assert len(A5_SECTOR) == 9
    assert len(K4_SECTOR) + len(A5_SECTOR) == N_SITE


def test_sectors_partition():
    """K₄ and A₅ sectors must partition {0..12} without overlap."""
    all_k = set(K4_SECTOR) | set(A5_SECTOR)
    assert all_k == set(range(N_SITE))
    assert len(set(K4_SECTOR) & set(A5_SECTOR)) == 0


# ── Phase factors ─────────────────────────────────────────────────────────────

def test_K4_phases_are_fourth_roots():
    """K₄ phases e^{iπk/2} must be 4th roots of unity."""
    for k in K4_SECTOR:
        p = phi_phase(k)
        assert abs(p ** 4 - 1.0) < 1e-10, f"k={k}: p^4 = {p**4}"


def test_A5_phases_are_fifth_roots():
    """A₅ phases e^{i·2π(k-4)/5} must be 5th roots of unity."""
    for k in A5_SECTOR:
        p = phi_phase(k)
        assert abs(p ** 5 - 1.0) < 1e-10, f"k={k}: p^5 = {p**5}"


# ── IKT forward/inverse round-trip ───────────────────────────────────────────

def test_ikt_roundtrip_real():
    """IKT → inverse must recover original real signal."""
    x = np.array([1.0, 0.5, -0.3, 0.8, 0.1, -0.6, 0.4, 0.2,
                  -0.9, 0.7, -0.1, 0.3, 0.6])
    C = ikt_forward(x)
    x_rec = ikt_inverse(C).real
    assert np.max(np.abs(x_rec - x)) < 1e-10


def test_ikt_roundtrip_random():
    """IKT round-trip on 10 random signals."""
    rng = np.random.default_rng(0)
    for _ in range(10):
        x = rng.normal(size=13)
        C = ikt_forward(x)
        x_rec = ikt_inverse(C).real
        assert np.max(np.abs(x_rec - x)) < 1e-10


def test_ikt_input_validation():
    """IKT must reject signals of wrong length."""
    with pytest.raises(ValueError):
        ikt_forward(np.ones(12))
    with pytest.raises(ValueError):
        ikt_inverse(np.ones(14))


# ── IKT matrix ────────────────────────────────────────────────────────────────

def test_ikt_matrix_shape():
    Psi = ikt_matrix()
    assert Psi.shape == (13, 13)


# ── Sector power ──────────────────────────────────────────────────────────────

def test_sector_power_sums_correctly():
    """P_K4 + P_A5 must equal P_total."""
    x = np.random.randn(13)
    result = ikt_sector_power(x)
    assert abs(result["P_K4"] + result["P_A5"] - result["P_total"]) < 1e-10


def test_omega_m_ikt_for_flat_signal():
    """For constant signal, coherent fraction should be 4/13 ≈ 0.3077."""
    result = ikt_sector_power(np.ones(13))
    assert abs(result["Omega_m_ikt"] - 4 / 13) < 0.01


# ── Quasicrystal structure ────────────────────────────────────────────────────

def test_phi_scaled_radii():
    """First radius must be 1, subsequent radii must scale by φ."""
    radii = phi_scaled_radii(6)
    assert abs(radii[0] - 1.0) < 1e-10
    for i in range(1, len(radii)):
        assert abs(radii[i] / radii[i - 1] - phi_gr) < 1e-10


def test_structure_factor_positive():
    """Structure factor must be non-negative everywhere."""
    q = np.linspace(0.1, 20, 200)
    S = quasicrystal_structure_factor(q)
    assert np.all(S >= 0)


def test_quasicrystal_info_keys():
    info = icosahedral_quasicrystal_info()
    for key in ["symmetry_group", "embedding_dimension", "inflation_ratio",
                "Omega_m", "Omega_Lambda"]:
        assert key in info


def test_quasicrystal_omega_sum():
    """Ω_m + Ω_Λ = 1."""
    info = icosahedral_quasicrystal_info()
    assert abs(info["Omega_m"] + info["Omega_Lambda"] - 1.0) < 1e-10


def test_quasicrystal_embedding_dimension():
    info = icosahedral_quasicrystal_info()
    assert info["embedding_dimension"] == 6
