"""Tests for urt.gravity_deficit — topological deficit and Cathedral gravity."""

import pytest
from math import pi
from urt.gravity_deficit import (
    DELTA_STAR_RAD,
    DELTA_STAR_DEG,
    PHYSICAL_RAIL_DEG,
    IDEAL_PLANE_DEG,
    GRAVITATIONAL_DEFICIT_DEG,
    GRAVITATIONAL_DEFICIT_RAD,
    HOLONOMY_VORTEX_DEG,
    schwarzschild_area,
    cathedral_bh_entropy,
    hawking_temperature,
    hawking_temperature_modified,
    newton_G_from_deficit,
    compare_deficit_to_gauss_bonnet,
    deficit_summary,
)


def test_physical_rail_is_double_delta_star():
    """Physical rail = 2 × δ★ in degrees."""
    assert abs(PHYSICAL_RAIL_DEG - 2 * DELTA_STAR_DEG) < 1e-10


def test_gravitational_deficit_value():
    """Gravitational deficit = 18° − physical rail ≈ 1.0977°."""
    assert abs(GRAVITATIONAL_DEFICIT_DEG - (18.0 - PHYSICAL_RAIL_DEG)) < 1e-10


def test_holonomy_vortex():
    """Holonomy vortex = 360° + physical rail."""
    assert abs(HOLONOMY_VORTEX_DEG - (360.0 + PHYSICAL_RAIL_DEG)) < 1e-10


def test_holonomy_exceeds_360():
    """Holonomy vortex must exceed a full rotation (curvature > 0)."""
    assert HOLONOMY_VORTEX_DEG > 360.0


def test_gravitational_deficit_positive():
    """The ideal flat-space angle must exceed the physical rail (positive curvature)."""
    assert GRAVITATIONAL_DEFICIT_DEG > 0


def test_schwarzschild_area():
    """A = 16π M² in Planck units."""
    M = 2.0
    A = schwarzschild_area(M)
    assert abs(A - 16 * pi * M ** 2) < 1e-10


def test_bh_entropy_area_law():
    """
    Cathedral S_BH must equal A/4 (Bekenstein-Hawking) to within 1%.
    This is the calibration condition on area_per_cell.
    """
    M = 5.0
    A = schwarzschild_area(M)
    S_bh_standard = A / 4
    S_cathedral = cathedral_bh_entropy(M)
    assert abs(S_cathedral - S_bh_standard) / S_bh_standard < 0.01


def test_hawking_temperature():
    """T = 1/(8π M) in Planck units."""
    M = 1.0
    T = hawking_temperature(M)
    assert abs(T - 1 / (8 * pi)) < 1e-12


def test_hawking_temperature_modified_smaller():
    """Modified Hawking temperature should be ≤ classical (RG damping)."""
    M = 10.0
    T_classical = hawking_temperature(M)
    T_modified = hawking_temperature_modified(M)
    assert T_modified <= T_classical


def test_hawking_temperature_modified_at_planck():
    """At M = 1 (Planck mass), modification should be negligible."""
    T_c = hawking_temperature(1.0)
    T_m = hawking_temperature_modified(1.0)
    assert abs(T_m - T_c) / T_c < 0.02


def test_newton_G_from_deficit():
    """G_N = δ★² in Planck units."""
    G = newton_G_from_deficit()
    expected = DELTA_STAR_RAD ** 2
    assert abs(G - expected) < 1e-15


def test_gauss_bonnet_ratio():
    """Cathedral deficit / (4π/13) should be O(1)."""
    ratio = compare_deficit_to_gauss_bonnet()
    assert 0.01 < ratio < 100.0


def test_deficit_summary_complete():
    d = deficit_summary()
    for key in [
        "delta_star_rad", "delta_star_deg", "physical_rail_deg",
        "ideal_plane_deg", "gravitational_deficit_deg",
        "gravitational_deficit_rad", "holonomy_vortex_deg", "holonomy_vortex_rad"
    ]:
        assert key in d
