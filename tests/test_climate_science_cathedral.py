"""Tests for urt/climate_science_cathedral.py — Milankovitch, atmosphere, circulation."""

import pytest
from math import isfinite


# ── Import test ───────────────────────────────────────────────────────────────

def test_imports():
    from urt.climate_science_cathedral import (
        N_MILANKOVITCH_CYCLES, N_MILANKOVITCH_EQ_D,
        MILANKOVITCH_PERIODS_KY, MILANKOVITCH_NAMES,
        MILANKOVITCH_PERIOD_COUNT_EQ_D,
        N_ATMOSPHERE_LAYERS, N_ATMOSPHERE_EQ_Q,
        ATMOSPHERE_LAYERS,
        N_EARTH_SPHERES, N_EARTH_SPHERES_EQ_Q,
        EARTH_SPHERES,
        N_WIND_BELTS_PER_HEMISPHERE, WIND_BELTS_PER_HEMI_EQ_D,
        N_WIND_BELTS_TOTAL, WIND_BELTS_TOTAL_EQ_2D, WIND_BELTS_TOTAL_EQ_V2,
        WIND_BELT_NAMES,
        N_CIRCULATION_CELLS_PER_HEMISPHERE, CELLS_PER_HEMI_EQ_D,
        N_CIRCULATION_CELLS_TOTAL, CELLS_TOTAL_EQ_2D, CELLS_TOTAL_EQ_V2,
        CIRCULATION_CELL_NAMES,
        N_GREENHOUSE_GASES_MAJOR, GREENHOUSE_GAS_NAMES,
        INSOLATION_POWER_LAW, INSOLATION_EQ_D1,
        KOLMOGOROV_EXPONENT, KOLMOGOROV_EQ_QD,
        SOLAR_CONSTANT_W_M2, ECS_IPCC_BEST_C,
        CLIMATE_SENSITIVITY_CATHEDRAL,
        milankovitch_cycles, atmosphere_structure, circulation_patterns,
        climate_science_summary, print_climate_science_report,
    )


# ── Milankovitch cycles ───────────────────────────────────────────────────────

def test_milankovitch_eq_D():
    """Three Milankovitch cycles = D = 3  [EXACT!!!]."""
    from urt.climate_science_cathedral import N_MILANKOVITCH_CYCLES, N_MILANKOVITCH_EQ_D
    from urt.shell_closure import D
    assert N_MILANKOVITCH_CYCLES == D
    assert N_MILANKOVITCH_CYCLES == 3
    assert N_MILANKOVITCH_EQ_D is True


def test_milankovitch_periods_count():
    """Number of periods in list = D = 3."""
    from urt.climate_science_cathedral import (
        MILANKOVITCH_PERIODS_KY, MILANKOVITCH_PERIOD_COUNT_EQ_D,
    )
    from urt.shell_closure import D
    assert len(MILANKOVITCH_PERIODS_KY) == D
    assert MILANKOVITCH_PERIOD_COUNT_EQ_D is True


def test_milankovitch_periods_positive():
    """All Milankovitch periods are positive."""
    from urt.climate_science_cathedral import MILANKOVITCH_PERIODS_KY
    for p in MILANKOVITCH_PERIODS_KY:
        assert p > 0


def test_milankovitch_names_count():
    """Names list has D = 3 entries."""
    from urt.climate_science_cathedral import MILANKOVITCH_NAMES
    from urt.shell_closure import D
    assert len(MILANKOVITCH_NAMES) == D


# ── Atmospheric layers ────────────────────────────────────────────────────────

def test_atmosphere_layers_eq_q():
    """Five atmospheric layers = q = 5  [EXACT]."""
    from urt.climate_science_cathedral import N_ATMOSPHERE_LAYERS, N_ATMOSPHERE_EQ_Q
    from urt.shell_closure import q
    assert N_ATMOSPHERE_LAYERS == q
    assert N_ATMOSPHERE_LAYERS == 5
    assert N_ATMOSPHERE_EQ_Q is True


def test_atmosphere_layers_list_count():
    """ATMOSPHERE_LAYERS list has q = 5 entries."""
    from urt.climate_science_cathedral import ATMOSPHERE_LAYERS
    from urt.shell_closure import q
    assert len(ATMOSPHERE_LAYERS) == q


def test_earth_spheres_eq_q():
    """Five Earth spheres = q = 5  [EXACT]."""
    from urt.climate_science_cathedral import N_EARTH_SPHERES, N_EARTH_SPHERES_EQ_Q
    from urt.shell_closure import q
    assert N_EARTH_SPHERES == q
    assert N_EARTH_SPHERES == 5
    assert N_EARTH_SPHERES_EQ_Q is True


def test_earth_spheres_list_count():
    """EARTH_SPHERES list has q = 5 entries."""
    from urt.climate_science_cathedral import EARTH_SPHERES
    from urt.shell_closure import q
    assert len(EARTH_SPHERES) == q


# ── Wind belts ────────────────────────────────────────────────────────────────

def test_wind_belts_per_hemisphere_eq_D():
    """Wind belts per hemisphere = D = 3  [EXACT]."""
    from urt.climate_science_cathedral import (
        N_WIND_BELTS_PER_HEMISPHERE, WIND_BELTS_PER_HEMI_EQ_D,
    )
    from urt.shell_closure import D
    assert N_WIND_BELTS_PER_HEMISPHERE == D
    assert N_WIND_BELTS_PER_HEMISPHERE == 3
    assert WIND_BELTS_PER_HEMI_EQ_D is True


def test_wind_belts_total_eq_2D():
    """Total wind belts = 2D = 6 = V//2  [EXACT]."""
    from urt.climate_science_cathedral import (
        N_WIND_BELTS_TOTAL, WIND_BELTS_TOTAL_EQ_2D, WIND_BELTS_TOTAL_EQ_V2,
    )
    from urt.shell_closure import D, V
    assert N_WIND_BELTS_TOTAL == 2 * D
    assert N_WIND_BELTS_TOTAL == V // 2
    assert N_WIND_BELTS_TOTAL == 6
    assert WIND_BELTS_TOTAL_EQ_2D is True
    assert WIND_BELTS_TOTAL_EQ_V2 is True


# ── Circulation cells ─────────────────────────────────────────────────────────

def test_circulation_cells_per_hemi_eq_D():
    """Circulation cells per hemisphere = D = 3  [EXACT]."""
    from urt.climate_science_cathedral import (
        N_CIRCULATION_CELLS_PER_HEMISPHERE, CELLS_PER_HEMI_EQ_D,
    )
    from urt.shell_closure import D
    assert N_CIRCULATION_CELLS_PER_HEMISPHERE == D
    assert N_CIRCULATION_CELLS_PER_HEMISPHERE == 3
    assert CELLS_PER_HEMI_EQ_D is True


def test_circulation_cells_total_eq_2D():
    """Total circulation cells = 2D = 6 = V//2  [EXACT]."""
    from urt.climate_science_cathedral import (
        N_CIRCULATION_CELLS_TOTAL, CELLS_TOTAL_EQ_2D, CELLS_TOTAL_EQ_V2,
    )
    from urt.shell_closure import D, V
    assert N_CIRCULATION_CELLS_TOTAL == 2 * D
    assert N_CIRCULATION_CELLS_TOTAL == V // 2
    assert N_CIRCULATION_CELLS_TOTAL == 6
    assert CELLS_TOTAL_EQ_2D is True
    assert CELLS_TOTAL_EQ_V2 is True


def test_circulation_cell_names_count():
    """Cell names list has D = 3 entries."""
    from urt.climate_science_cathedral import CIRCULATION_CELL_NAMES
    from urt.shell_closure import D
    assert len(CIRCULATION_CELL_NAMES) == D


# ── Insolation and turbulence ─────────────────────────────────────────────────

def test_insolation_power_law_eq_D_minus_1():
    """Solar intensity ∝ 1/r^{D-1} = 1/r²  [EXACT]."""
    from urt.climate_science_cathedral import INSOLATION_POWER_LAW, INSOLATION_EQ_D1
    from urt.shell_closure import D
    assert INSOLATION_POWER_LAW == D - 1
    assert INSOLATION_POWER_LAW == 2
    assert INSOLATION_EQ_D1 is True


def test_kolmogorov_exponent_eq_q_over_D():
    """Kolmogorov -5/3 = -q/D  [EXACT]."""
    from urt.climate_science_cathedral import KOLMOGOROV_EXPONENT, KOLMOGOROV_EQ_QD
    from urt.shell_closure import q, D
    expected = -q / D
    assert abs(KOLMOGOROV_EXPONENT - expected) < 1e-12
    assert abs(KOLMOGOROV_EXPONENT - (-5.0 / 3.0)) < 1e-12
    assert KOLMOGOROV_EQ_QD is True


def test_solar_constant_positive():
    """Solar constant > 0."""
    from urt.climate_science_cathedral import SOLAR_CONSTANT_W_M2
    assert SOLAR_CONSTANT_W_M2 > 0
    assert isfinite(SOLAR_CONSTANT_W_M2)
    assert 1300 < SOLAR_CONSTANT_W_M2 < 1400


def test_ecs_approx_D():
    """ECS best estimate ≈ D = 3 °C  [APPROXIMATE]."""
    from urt.climate_science_cathedral import ECS_IPCC_BEST_C
    from urt.shell_closure import D
    assert abs(ECS_IPCC_BEST_C - D) < 1e-10


# ── Greenhouse gases ──────────────────────────────────────────────────────────

def test_greenhouse_gases_approx_q():
    """Major greenhouse gases ≈ q = 5  [APPROXIMATE]."""
    from urt.climate_science_cathedral import N_GREENHOUSE_GASES_MAJOR, GREENHOUSE_GAS_NAMES
    from urt.shell_closure import q
    assert N_GREENHOUSE_GASES_MAJOR == q
    assert len(GREENHOUSE_GAS_NAMES) == q


# ── Function tests ────────────────────────────────────────────────────────────

def test_milankovitch_cycles_function():
    from urt.climate_science_cathedral import milankovitch_cycles
    r = milankovitch_cycles()
    assert r["n_cycles"] == 3
    assert r["n_eq_D"] is True
    assert len(r["periods_ky"]) == 3
    assert len(r["names"]) == 3
    assert r["period_count_eq_D"] is True
    assert "EXACT" in r["status"]


def test_atmosphere_structure_function():
    from urt.climate_science_cathedral import atmosphere_structure
    r = atmosphere_structure()
    assert r["n_layers"] == 5
    assert r["n_layers_eq_q"] is True
    assert r["n_spheres"] == 5
    assert r["n_spheres_eq_q"] is True
    assert len(r["layers"]) == 5
    assert len(r["spheres"]) == 5
    assert "EXACT" in r["status_layers"]


def test_circulation_patterns_function():
    from urt.climate_science_cathedral import circulation_patterns
    r = circulation_patterns()
    assert r["cells_per_hemisphere"] == 3
    assert r["cells_per_hemi_eq_D"] is True
    assert r["total_cells"] == 6
    assert r["total_eq_2D"] is True
    assert r["total_eq_V2"] is True
    assert r["wind_belts_per_hemi"] == 3
    assert r["wind_belts_total"] == 6
    assert r["wind_belts_total_eq_V2"] is True
    assert len(r["cell_names"]) == 3
    assert "EXACT" in r["status_cells"]


def test_climate_science_summary_keys():
    from urt.climate_science_cathedral import climate_science_summary
    s = climate_science_summary()
    assert "milankovitch" in s
    assert "atmosphere" in s
    assert "circulation" in s
    assert "key_results" in s
    assert len(s["key_results"]) >= 8
    assert s["D"] == 3
    assert s["q"] == 5
    assert s["V"] == 12
    assert abs(s["kolmogorov"] - (-5.0 / 3.0)) < 1e-12


def test_print_climate_science_report(capsys):
    from urt.climate_science_cathedral import print_climate_science_report
    print_climate_science_report()
    captured = capsys.readouterr()
    assert "EXACT" in captured.out
    assert "D = 3" in captured.out or "D=3" in captured.out


# ── Cross-consistency ─────────────────────────────────────────────────────────

def test_wind_belts_eq_circulation_cells():
    """Wind belts total = circulation cells total."""
    from urt.climate_science_cathedral import N_WIND_BELTS_TOTAL, N_CIRCULATION_CELLS_TOTAL
    assert N_WIND_BELTS_TOTAL == N_CIRCULATION_CELLS_TOTAL


def test_atmosphere_layers_eq_earth_spheres():
    """Atmospheric layers = Earth spheres = q = 5."""
    from urt.climate_science_cathedral import N_ATMOSPHERE_LAYERS, N_EARTH_SPHERES
    assert N_ATMOSPHERE_LAYERS == N_EARTH_SPHERES


def test_climate_sensitivity_is_delta_star():
    """Cathedral climate sensitivity = δ★."""
    from urt.climate_science_cathedral import CLIMATE_SENSITIVITY_CATHEDRAL
    from urt.shell_closure import DELTA_STAR
    assert abs(CLIMATE_SENSITIVITY_CATHEDRAL - DELTA_STAR) < 1e-12
