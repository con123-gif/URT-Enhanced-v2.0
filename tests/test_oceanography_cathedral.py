"""Tests for urt/oceanography_cathedral.py — Physical oceanography and Cathedral integers."""

import pytest
from math import isfinite, log


# ── Imports ────────────────────────────────────────────────────────────────────

def test_imports():
    from urt.oceanography_cathedral import (
        N_OCEAN_BASINS, N_BASINS_EQ_D,
        N_THERMO_DRIVERS, N_THERMO_EQ_D1,
        N_MOMENTUM_HORIZONTAL, N_MOMENTUM_EQ_D1,
        ENSO_PERIOD_YR, ENSO_EQ_Q,
        N_OCEAN_LAYERS, N_LAYERS_EQ_D1,
        N_TIDAL_MAJOR, N_TIDAL_EQ_Q,
        N_SOUND_SPEED_VARIABLES, N_SOUND_EQ_D,
        N_UPWELLING_EASTERN, N_UPWELLING_EQ_D,
        N_DEEPWATER_SITES, N_DEEPWATER_EQ_D,
        N_STOMMEL_DIM, N_STOMMEL_EQ_D1,
        KOLMOGOROV_OCEAN_EXP, KOLMOGOROV_OCEAN_EQ_5_3,
        N_ROSSBY_DIMS, N_ROSSBY_EQ_D,
        N_ICOS_FLOAT_NODES, N_ICOS_FLOAT_EDGES,
        H_MAX_OCEAN, CATHEDRAL_OCEANIC_RATE,
        SVERDRUP_HORIZONTAL_DIM, SHALLOW_WATER_DIMS,
        ocean_circulation, ocean_structure,
        oceanography_summary, print_oceanography_report,
    )


# ── Ocean basins ───────────────────────────────────────────────────────────────

def test_ocean_basins_eq_D():
    """Ocean basins = D = 3 [EXACT: Atlantic, Pacific, Indian]."""
    from urt.oceanography_cathedral import N_OCEAN_BASINS, N_BASINS_EQ_D
    from urt.shell_closure import D
    assert N_OCEAN_BASINS == D
    assert N_OCEAN_BASINS == 3
    assert N_BASINS_EQ_D is True


# ── Thermohaline drivers ───────────────────────────────────────────────────────

def test_thermo_drivers_eq_D_minus_1():
    """Thermohaline drivers = D-1 = 2 [EXACT: T and S]."""
    from urt.oceanography_cathedral import N_THERMO_DRIVERS, N_THERMO_EQ_D1
    from urt.shell_closure import D
    assert N_THERMO_DRIVERS == D - 1
    assert N_THERMO_DRIVERS == 2
    assert N_THERMO_EQ_D1 is True


# ── Sverdrup momentum ──────────────────────────────────────────────────────────

def test_momentum_horizontal_eq_D_minus_1():
    """Sverdrup horizontal momentum equations = D-1 = 2 [EXACT]."""
    from urt.oceanography_cathedral import N_MOMENTUM_HORIZONTAL, N_MOMENTUM_EQ_D1
    from urt.shell_closure import D
    assert N_MOMENTUM_HORIZONTAL == D - 1
    assert N_MOMENTUM_HORIZONTAL == 2
    assert N_MOMENTUM_EQ_D1 is True


# ── ENSO period ────────────────────────────────────────────────────────────────

def test_enso_period_eq_q():
    """ENSO period ≈ q = 5 years [APPROXIMATE]."""
    from urt.oceanography_cathedral import ENSO_PERIOD_YR, ENSO_EQ_Q
    from urt.shell_closure import q
    assert ENSO_PERIOD_YR == q
    assert ENSO_PERIOD_YR == 5
    assert ENSO_EQ_Q is True


# ── Ocean layers ───────────────────────────────────────────────────────────────

def test_ocean_layers_eq_D_plus_1():
    """Ocean layers = D+1 = 4 [EXACT: mixed, thermocline, deep, abyssal]."""
    from urt.oceanography_cathedral import N_OCEAN_LAYERS, N_LAYERS_EQ_D1
    from urt.shell_closure import D
    assert N_OCEAN_LAYERS == D + 1
    assert N_OCEAN_LAYERS == 4
    assert N_LAYERS_EQ_D1 is True


# ── Tidal constituents ─────────────────────────────────────────────────────────

def test_tidal_major_eq_q():
    """Major tidal constituents = q = 5 [EXACT: M2,S2,N2,K1,O1]."""
    from urt.oceanography_cathedral import N_TIDAL_MAJOR, N_TIDAL_EQ_Q
    from urt.shell_closure import q
    assert N_TIDAL_MAJOR == q
    assert N_TIDAL_MAJOR == 5
    assert N_TIDAL_EQ_Q is True


# ── Sound speed variables ──────────────────────────────────────────────────────

def test_sound_speed_variables_eq_D():
    """Sound speed variables = D = 3 [EXACT: T, S, P]."""
    from urt.oceanography_cathedral import N_SOUND_SPEED_VARIABLES, N_SOUND_EQ_D
    from urt.shell_closure import D
    assert N_SOUND_SPEED_VARIABLES == D
    assert N_SOUND_SPEED_VARIABLES == 3
    assert N_SOUND_EQ_D is True


# ── Eastern boundary upwelling ─────────────────────────────────────────────────

def test_upwelling_eastern_eq_D():
    """Eastern boundary upwelling systems ≈ D = 3 [APPROXIMATE]."""
    from urt.oceanography_cathedral import N_UPWELLING_EASTERN, N_UPWELLING_EQ_D
    from urt.shell_closure import D
    assert N_UPWELLING_EASTERN == D
    assert N_UPWELLING_EASTERN == 3
    assert N_UPWELLING_EQ_D is True


# ── Deep water formation sites ─────────────────────────────────────────────────

def test_deepwater_sites_eq_D():
    """Deep water formation sites ≈ D = 3 [APPROXIMATE]."""
    from urt.oceanography_cathedral import N_DEEPWATER_SITES, N_DEEPWATER_EQ_D
    from urt.shell_closure import D
    assert N_DEEPWATER_SITES == D
    assert N_DEEPWATER_SITES == 3
    assert N_DEEPWATER_EQ_D is True


# ── Stommel gyre dimension ─────────────────────────────────────────────────────

def test_stommel_dim_eq_D_minus_1():
    """Stommel gyre model dimension = D-1 = 2 [EXACT: 2D horizontal]."""
    from urt.oceanography_cathedral import N_STOMMEL_DIM, N_STOMMEL_EQ_D1
    from urt.shell_closure import D
    assert N_STOMMEL_DIM == D - 1
    assert N_STOMMEL_DIM == 2
    assert N_STOMMEL_EQ_D1 is True


# ── Kolmogorov ocean exponent ──────────────────────────────────────────────────

def test_kolmogorov_ocean_exp_eq_5_3():
    """Oceanic Kolmogorov exponent = q/D = 5/3 [EXACT]."""
    from urt.oceanography_cathedral import KOLMOGOROV_OCEAN_EXP, KOLMOGOROV_OCEAN_EQ_5_3
    from urt.shell_closure import q, D
    assert abs(KOLMOGOROV_OCEAN_EXP - float(q) / D) < 1e-10
    assert abs(KOLMOGOROV_OCEAN_EXP - 5.0 / 3.0) < 1e-10
    assert KOLMOGOROV_OCEAN_EQ_5_3 is True


# ── Rossby wave dimensions ─────────────────────────────────────────────────────

def test_rossby_dims_eq_D():
    """Rossby wave dimensions = D = 3 [EXACT: 3D rotating ocean]."""
    from urt.oceanography_cathedral import N_ROSSBY_DIMS, N_ROSSBY_EQ_D
    from urt.shell_closure import D
    assert N_ROSSBY_DIMS == D
    assert N_ROSSBY_DIMS == 3
    assert N_ROSSBY_EQ_D is True


# ── Icosahedral float network ──────────────────────────────────────────────────

def test_icos_float_nodes_eq_N():
    """Icosahedral float network = N = 13 nodes [EXACT]."""
    from urt.oceanography_cathedral import N_ICOS_FLOAT_NODES
    from urt.shell_closure import N
    assert N_ICOS_FLOAT_NODES == N
    assert N_ICOS_FLOAT_NODES == 13


def test_icos_float_edges_eq_E():
    """Icosahedral float network = E = 30 edges [EXACT]."""
    from urt.oceanography_cathedral import N_ICOS_FLOAT_EDGES
    from urt.shell_closure import E
    assert N_ICOS_FLOAT_EDGES == E
    assert N_ICOS_FLOAT_EDGES == 30


# ── Shannon entropy ────────────────────────────────────────────────────────────

def test_h_max_ocean():
    """H_max for N=13 tidal states = log₂(13) ≈ 3.70 bits."""
    from urt.oceanography_cathedral import H_MAX_OCEAN
    from urt.shell_closure import N
    assert abs(H_MAX_OCEAN - log(N) / log(2)) < 1e-10
    assert 3.5 < H_MAX_OCEAN < 4.0


# ── Cathedral oceanic rate ─────────────────────────────────────────────────────

def test_cathedral_oceanic_rate_eq_delta_star():
    """CATHEDRAL_OCEANIC_RATE == DELTA_STAR."""
    from urt.oceanography_cathedral import CATHEDRAL_OCEANIC_RATE
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_OCEANIC_RATE - DELTA_STAR) < 1e-15


# ── Sverdrup horizontal dim & shallow water dims ───────────────────────────────

def test_sverdrup_horizontal_dim_eq_D_minus_1():
    """Sverdrup horizontal dimension = D-1 = 2."""
    from urt.oceanography_cathedral import SVERDRUP_HORIZONTAL_DIM
    from urt.shell_closure import D
    assert SVERDRUP_HORIZONTAL_DIM == D - 1
    assert SVERDRUP_HORIZONTAL_DIM == 2


def test_shallow_water_dims_eq_D():
    """Shallow water embedding space = D = 3."""
    from urt.oceanography_cathedral import SHALLOW_WATER_DIMS
    from urt.shell_closure import D
    assert SHALLOW_WATER_DIMS == D
    assert SHALLOW_WATER_DIMS == 3


# ── Function: ocean_circulation ───────────────────────────────────────────────

def test_ocean_circulation_returns_dict():
    from urt.oceanography_cathedral import ocean_circulation
    result = ocean_circulation()
    assert isinstance(result, dict)


def test_ocean_circulation_required_keys():
    from urt.oceanography_cathedral import ocean_circulation
    r = ocean_circulation()
    required = [
        "n_ocean_basins", "basins_eq_D",
        "n_thermo_drivers", "thermo_eq_D1",
        "n_momentum_horizontal", "momentum_eq_D1",
        "enso_period_yr", "enso_eq_q",
        "n_deepwater_sites", "deepwater_eq_D",
        "n_stommel_dim", "stommel_eq_D1",
        "n_rossby_dims", "rossby_eq_D",
        "kolmogorov_ocean_exp", "kolmogorov_ocean_eq_5_3",
    ]
    for key in required:
        assert key in r, f"Missing key: {key}"


def test_ocean_circulation_values():
    from urt.oceanography_cathedral import ocean_circulation
    r = ocean_circulation()
    assert r["n_ocean_basins"] == 3
    assert r["basins_eq_D"] is True
    assert r["n_thermo_drivers"] == 2
    assert r["thermo_eq_D1"] is True
    assert r["n_momentum_horizontal"] == 2
    assert r["momentum_eq_D1"] is True
    assert r["enso_period_yr"] == 5
    assert r["enso_eq_q"] is True
    assert r["n_deepwater_sites"] == 3
    assert r["deepwater_eq_D"] is True
    assert r["n_stommel_dim"] == 2
    assert r["stommel_eq_D1"] is True
    assert r["n_rossby_dims"] == 3
    assert r["rossby_eq_D"] is True
    assert abs(r["kolmogorov_ocean_exp"] - 5.0 / 3.0) < 1e-10
    assert r["kolmogorov_ocean_eq_5_3"] is True


# ── Function: ocean_structure ──────────────────────────────────────────────────

def test_ocean_structure_returns_dict():
    from urt.oceanography_cathedral import ocean_structure
    result = ocean_structure()
    assert isinstance(result, dict)


def test_ocean_structure_required_keys():
    from urt.oceanography_cathedral import ocean_structure
    r = ocean_structure()
    required = [
        "n_ocean_layers", "layers_eq_D1",
        "n_tidal_major", "tidal_eq_q",
        "n_sound_speed_variables", "sound_eq_D",
        "n_upwelling_eastern", "upwelling_eq_D",
        "n_icos_float_nodes", "n_icos_float_edges",
        "h_max_ocean", "sverdrup_horizontal_dim",
        "shallow_water_dims",
    ]
    for key in required:
        assert key in r, f"Missing key: {key}"


def test_ocean_structure_values():
    from urt.oceanography_cathedral import ocean_structure
    r = ocean_structure()
    assert r["n_ocean_layers"] == 4
    assert r["layers_eq_D1"] is True
    assert r["n_tidal_major"] == 5
    assert r["tidal_eq_q"] is True
    assert r["n_sound_speed_variables"] == 3
    assert r["sound_eq_D"] is True
    assert r["n_upwelling_eastern"] == 3
    assert r["upwelling_eq_D"] is True
    assert r["n_icos_float_nodes"] == 13
    assert r["n_icos_float_edges"] == 30
    assert 3.5 < r["h_max_ocean"] < 4.0
    assert r["sverdrup_horizontal_dim"] == 2
    assert r["shallow_water_dims"] == 3


# ── Function: oceanography_summary ────────────────────────────────────────────

def test_oceanography_summary_returns_dict():
    from urt.oceanography_cathedral import oceanography_summary
    result = oceanography_summary()
    assert isinstance(result, dict)


def test_oceanography_summary_required_keys():
    from urt.oceanography_cathedral import oceanography_summary
    r = oceanography_summary()
    assert "circulation" in r
    assert "structure" in r
    assert "KEY_EXACT_RESULTS" in r
    assert "delta_star" in r
    assert "N" in r
    assert "D" in r


def test_oceanography_summary_key_exact_results():
    from urt.oceanography_cathedral import oceanography_summary
    r = oceanography_summary()
    results = r["KEY_EXACT_RESULTS"]
    assert isinstance(results, list)
    assert len(results) >= 5
    for item in results:
        assert isinstance(item, str)


def test_oceanography_summary_N_D_values():
    from urt.oceanography_cathedral import oceanography_summary
    r = oceanography_summary()
    assert r["N"] == 13
    assert r["D"] == 3


def test_oceanography_summary_delta_star():
    from urt.oceanography_cathedral import oceanography_summary
    from urt.shell_closure import DELTA_STAR
    r = oceanography_summary()
    assert abs(r["delta_star"] - DELTA_STAR) < 1e-15


def test_oceanography_summary_subdicts():
    from urt.oceanography_cathedral import oceanography_summary
    r = oceanography_summary()
    assert isinstance(r["circulation"], dict)
    assert isinstance(r["structure"], dict)


def test_oceanography_summary_exact_labels():
    """KEY_EXACT_RESULTS contains both EXACT and APPROXIMATE labels."""
    from urt.oceanography_cathedral import oceanography_summary
    r = oceanography_summary()
    full_text = " ".join(r["KEY_EXACT_RESULTS"])
    assert "EXACT" in full_text
    assert "APPROXIMATE" in full_text


# ── Function: print_oceanography_report ───────────────────────────────────────

def test_print_oceanography_report(capsys):
    from urt.oceanography_cathedral import print_oceanography_report
    print_oceanography_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "OCEANOGRAPHY" in out
    assert "EXACT" in out


def test_print_oceanography_report_contains_key_values(capsys):
    from urt.oceanography_cathedral import print_oceanography_report
    print_oceanography_report()
    out = capsys.readouterr().out
    assert "13" in out     # N = 13 float nodes
    assert "5" in out      # tidal = q = 5
    assert "3" in out      # ocean basins = D = 3
    assert "4" in out      # ocean layers = D+1 = 4


# ── Cross-module consistency ───────────────────────────────────────────────────

def test_thermo_equals_momentum_equals_stommel_dim():
    """Thermohaline drivers, momentum equations, and Stommel dim all = D-1 = 2."""
    from urt.oceanography_cathedral import (
        N_THERMO_DRIVERS, N_MOMENTUM_HORIZONTAL,
        N_STOMMEL_DIM, SVERDRUP_HORIZONTAL_DIM,
    )
    assert N_THERMO_DRIVERS == N_MOMENTUM_HORIZONTAL
    assert N_THERMO_DRIVERS == N_STOMMEL_DIM
    assert N_THERMO_DRIVERS == SVERDRUP_HORIZONTAL_DIM
    assert N_THERMO_DRIVERS == 2


def test_basins_equals_sound_variables_equals_deepwater():
    """Ocean basins, sound speed variables, and deepwater sites all = D = 3."""
    from urt.oceanography_cathedral import (
        N_OCEAN_BASINS, N_SOUND_SPEED_VARIABLES,
        N_DEEPWATER_SITES, N_UPWELLING_EASTERN, N_ROSSBY_DIMS,
    )
    assert N_OCEAN_BASINS == N_SOUND_SPEED_VARIABLES
    assert N_OCEAN_BASINS == N_DEEPWATER_SITES
    assert N_OCEAN_BASINS == N_UPWELLING_EASTERN
    assert N_OCEAN_BASINS == N_ROSSBY_DIMS
    assert N_OCEAN_BASINS == 3


def test_tidal_equals_enso():
    """Tidal constituents and ENSO period both = q = 5."""
    from urt.oceanography_cathedral import N_TIDAL_MAJOR, ENSO_PERIOD_YR
    assert N_TIDAL_MAJOR == ENSO_PERIOD_YR
    assert N_TIDAL_MAJOR == 5


def test_ocean_layers_eq_4():
    """Ocean layers = D+1 = 4."""
    from urt.oceanography_cathedral import N_OCEAN_LAYERS
    from urt.shell_closure import D
    assert N_OCEAN_LAYERS == D + 1
    assert N_OCEAN_LAYERS == 4


def test_kolmogorov_ocean_times_D_eq_q():
    """KOLMOGOROV_OCEAN_EXP * D = q = 5."""
    from urt.oceanography_cathedral import KOLMOGOROV_OCEAN_EXP
    from urt.shell_closure import q, D
    assert abs(KOLMOGOROV_OCEAN_EXP * D - q) < 1e-10


def test_icos_float_nodes_eq_beaufort_in_meteo():
    """Icosahedral float nodes = 13, consistent with Beaufort scale in meteorology."""
    from urt.oceanography_cathedral import N_ICOS_FLOAT_NODES
    from urt.meteorology_cathedral import N_BEAUFORT_SCALE
    assert N_ICOS_FLOAT_NODES == N_BEAUFORT_SCALE
    assert N_ICOS_FLOAT_NODES == 13


def test_cross_module_kolmogorov_consistent():
    """Meteorology and oceanography Kolmogorov energy exponents are equal."""
    from urt.meteorology_cathedral import KOLMOGOROV_ENERGY_EXP
    from urt.oceanography_cathedral import KOLMOGOROV_OCEAN_EXP
    assert abs(KOLMOGOROV_ENERGY_EXP - KOLMOGOROV_OCEAN_EXP) < 1e-10
    assert abs(KOLMOGOROV_ENERGY_EXP - 5.0 / 3.0) < 1e-10


def test_h_max_ocean_eq_h_max_atm():
    """Both ocean and atmosphere H_max = log₂(13) (N=13 icosahedral)."""
    from urt.meteorology_cathedral import H_MAX_ATM
    from urt.oceanography_cathedral import H_MAX_OCEAN
    assert abs(H_MAX_ATM - H_MAX_OCEAN) < 1e-10
