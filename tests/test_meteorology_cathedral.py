"""Tests for urt/meteorology_cathedral.py — Atmospheric science and Cathedral integers."""

import pytest
from math import isfinite, log, pi


# ── Imports ────────────────────────────────────────────────────────────────────

def test_imports():
    from urt.meteorology_cathedral import (
        N_WIND_COMPONENTS, N_WIND_EQ_D,
        N_ATMOSPHERE_LAYERS, N_LAYERS_EQ_Q,
        N_BEAUFORT_SCALE, N_BEAUFORT_EQ_N,
        N_LORENZ_EQNS, N_LORENZ_EQ_D,
        N_JET_STREAMS, N_JET_EQ_D1,
        N_THERMAL_WIND_COMPONENTS, N_THERMAL_EQ_D1,
        RICHARDSON_CRITICAL, RI_C_EQ_1_D1,
        KOLMOGOROV_VELOCITY_EXP, KOLMOGOROV_EXP_EQ_3_4,
        KOLMOGOROV_ENERGY_EXP, KOLMOGOROV_ENERGY_EQ_5_3,
        N_PRIMITIVE_EQNS, N_PRIM_EQ_D1,
        N_SYNOPTIC_PRESSURE_LEVELS, N_SYNOPTIC_EQ_Q,
        N_CORIOLIS_COMPONENTS, N_CORIOLIS_EQ_D,
        ROSSBY_DOMINANT_WAVENUMBER, ROSSBY_EQ_Q,
        DALR_K_PER_KM, DALR_CATHEDRAL_SCALED,
        N_ICOS_WEATHER_NODES, N_ICOS_WEATHER_EDGES,
        H_MAX_ATM, CATHEDRAL_ATM_RATE,
        atmospheric_dynamics, atmospheric_structure,
        meteorology_summary, print_meteorology_report,
    )


# ── Wind components ────────────────────────────────────────────────────────────

def test_wind_components_eq_D():
    """Wind components = D = 3 [EXACT: u, v, w]."""
    from urt.meteorology_cathedral import N_WIND_COMPONENTS, N_WIND_EQ_D
    from urt.shell_closure import D
    assert N_WIND_COMPONENTS == D
    assert N_WIND_COMPONENTS == 3
    assert N_WIND_EQ_D is True


# ── Atmosphere layers ──────────────────────────────────────────────────────────

def test_atmosphere_layers_eq_q():
    """Atmosphere layers = q = 5 [EXACT: trop,strat,meso,thermo,exo]."""
    from urt.meteorology_cathedral import N_ATMOSPHERE_LAYERS, N_LAYERS_EQ_Q
    from urt.shell_closure import q
    assert N_ATMOSPHERE_LAYERS == q
    assert N_ATMOSPHERE_LAYERS == 5
    assert N_LAYERS_EQ_Q is True


# ── Beaufort scale ─────────────────────────────────────────────────────────────

def test_beaufort_scale_eq_N():
    """Beaufort scale = N = 13 [EXACT: Force 0-12]."""
    from urt.meteorology_cathedral import N_BEAUFORT_SCALE, N_BEAUFORT_EQ_N
    from urt.shell_closure import N
    assert N_BEAUFORT_SCALE == N
    assert N_BEAUFORT_SCALE == 13
    assert N_BEAUFORT_EQ_N is True


# ── Lorenz attractor ───────────────────────────────────────────────────────────

def test_lorenz_eqns_eq_D():
    """Lorenz ODEs = D = 3 [EXACT]."""
    from urt.meteorology_cathedral import N_LORENZ_EQNS, N_LORENZ_EQ_D
    from urt.shell_closure import D
    assert N_LORENZ_EQNS == D
    assert N_LORENZ_EQNS == 3
    assert N_LORENZ_EQ_D is True


# ── Jet streams ────────────────────────────────────────────────────────────────

def test_jet_streams_eq_D_minus_1():
    """Jet streams = D-1 = 2 [EXACT: polar + subtropical]."""
    from urt.meteorology_cathedral import N_JET_STREAMS, N_JET_EQ_D1
    from urt.shell_closure import D
    assert N_JET_STREAMS == D - 1
    assert N_JET_STREAMS == 2
    assert N_JET_EQ_D1 is True


# ── Thermal wind ───────────────────────────────────────────────────────────────

def test_thermal_wind_components_eq_D_minus_1():
    """Thermal wind horizontal components = D-1 = 2 [EXACT]."""
    from urt.meteorology_cathedral import N_THERMAL_WIND_COMPONENTS, N_THERMAL_EQ_D1
    from urt.shell_closure import D
    assert N_THERMAL_WIND_COMPONENTS == D - 1
    assert N_THERMAL_WIND_COMPONENTS == 2
    assert N_THERMAL_EQ_D1 is True


# ── Richardson number ──────────────────────────────────────────────────────────

def test_richardson_critical_value():
    """Critical Richardson number = 1/(D+1) = 0.25 [EXACT]."""
    from urt.meteorology_cathedral import RICHARDSON_CRITICAL, RI_C_EQ_1_D1
    from urt.shell_closure import D
    assert abs(RICHARDSON_CRITICAL - 1.0 / (D + 1)) < 1e-10
    assert abs(RICHARDSON_CRITICAL - 0.25) < 1e-10
    assert RI_C_EQ_1_D1 is True


def test_richardson_critical_eq_025():
    """Ri_c == 0.25 exactly."""
    from urt.meteorology_cathedral import RICHARDSON_CRITICAL
    assert RICHARDSON_CRITICAL == 0.25


# ── Kolmogorov velocity exponent ───────────────────────────────────────────────

def test_kolmogorov_velocity_exp_eq_3_4():
    """Kolmogorov ν exponent = D/(D+1) = 3/4 = 0.75 [EXACT]."""
    from urt.meteorology_cathedral import KOLMOGOROV_VELOCITY_EXP, KOLMOGOROV_EXP_EQ_3_4
    from urt.shell_closure import D
    assert abs(KOLMOGOROV_VELOCITY_EXP - float(D) / (D + 1)) < 1e-10
    assert abs(KOLMOGOROV_VELOCITY_EXP - 0.75) < 1e-10
    assert KOLMOGOROV_EXP_EQ_3_4 is True


# ── Kolmogorov energy exponent ─────────────────────────────────────────────────

def test_kolmogorov_energy_exp_eq_5_3():
    """Kolmogorov energy spectrum exponent = q/D = 5/3 [EXACT]."""
    from urt.meteorology_cathedral import KOLMOGOROV_ENERGY_EXP, KOLMOGOROV_ENERGY_EQ_5_3
    from urt.shell_closure import q, D
    assert abs(KOLMOGOROV_ENERGY_EXP - float(q) / D) < 1e-10
    assert abs(KOLMOGOROV_ENERGY_EXP - 5.0 / 3.0) < 1e-10
    assert KOLMOGOROV_ENERGY_EQ_5_3 is True


# ── Primitive equations ────────────────────────────────────────────────────────

def test_primitive_eqns_eq_D_plus_1():
    """Primitive equations ≈ D+1 = 4 [APPROXIMATE]."""
    from urt.meteorology_cathedral import N_PRIMITIVE_EQNS, N_PRIM_EQ_D1
    from urt.shell_closure import D
    assert N_PRIMITIVE_EQNS == D + 1
    assert N_PRIMITIVE_EQNS == 4
    assert N_PRIM_EQ_D1 is True


# ── Synoptic pressure levels ───────────────────────────────────────────────────

def test_synoptic_pressure_levels_eq_q():
    """Synoptic pressure levels ≈ q = 5 [APPROXIMATE: 850,700,500,300,200 hPa]."""
    from urt.meteorology_cathedral import N_SYNOPTIC_PRESSURE_LEVELS, N_SYNOPTIC_EQ_Q
    from urt.shell_closure import q
    assert N_SYNOPTIC_PRESSURE_LEVELS == q
    assert N_SYNOPTIC_PRESSURE_LEVELS == 5
    assert N_SYNOPTIC_EQ_Q is True


# ── Coriolis components ────────────────────────────────────────────────────────

def test_coriolis_components_eq_D():
    """Coriolis force has D=3 vector components [EXACT]."""
    from urt.meteorology_cathedral import N_CORIOLIS_COMPONENTS, N_CORIOLIS_EQ_D
    from urt.shell_closure import D
    assert N_CORIOLIS_COMPONENTS == D
    assert N_CORIOLIS_COMPONENTS == 3
    assert N_CORIOLIS_EQ_D is True


# ── Rossby wavenumber ──────────────────────────────────────────────────────────

def test_rossby_wavenumber_eq_q():
    """Dominant Rossby wavenumber ≈ q = 5 [APPROXIMATE]."""
    from urt.meteorology_cathedral import ROSSBY_DOMINANT_WAVENUMBER, ROSSBY_EQ_Q
    from urt.shell_closure import q
    assert ROSSBY_DOMINANT_WAVENUMBER == q
    assert ROSSBY_DOMINANT_WAVENUMBER == 5
    assert ROSSBY_EQ_Q is True


# ── Icosahedral weather network ────────────────────────────────────────────────

def test_icos_weather_nodes_eq_N():
    """Icosahedral weather network = N = 13 nodes [EXACT]."""
    from urt.meteorology_cathedral import N_ICOS_WEATHER_NODES
    from urt.shell_closure import N
    assert N_ICOS_WEATHER_NODES == N
    assert N_ICOS_WEATHER_NODES == 13


def test_icos_weather_edges_eq_E():
    """Icosahedral weather network = E = 30 edges [EXACT]."""
    from urt.meteorology_cathedral import N_ICOS_WEATHER_EDGES
    from urt.shell_closure import E
    assert N_ICOS_WEATHER_EDGES == E
    assert N_ICOS_WEATHER_EDGES == 30


# ── DALR ───────────────────────────────────────────────────────────────────────

def test_dalr_value():
    """DALR_K_PER_KM = 9.8 K/km."""
    from urt.meteorology_cathedral import DALR_K_PER_KM
    assert abs(DALR_K_PER_KM - 9.8) < 1e-10


def test_dalr_cathedral_scaled_finite():
    """DALR × δ★ is a finite positive number."""
    from urt.meteorology_cathedral import DALR_CATHEDRAL_SCALED
    assert isfinite(DALR_CATHEDRAL_SCALED)
    assert DALR_CATHEDRAL_SCALED > 0


# ── Shannon entropy ────────────────────────────────────────────────────────────

def test_h_max_atm():
    """H_max for N=13 states = log₂(13) ≈ 3.70 bits."""
    from urt.meteorology_cathedral import H_MAX_ATM
    from urt.shell_closure import N
    assert abs(H_MAX_ATM - log(N) / log(2)) < 1e-10
    assert 3.5 < H_MAX_ATM < 4.0


# ── Cathedral rate ─────────────────────────────────────────────────────────────

def test_cathedral_atm_rate_eq_delta_star():
    """CATHEDRAL_ATM_RATE == DELTA_STAR."""
    from urt.meteorology_cathedral import CATHEDRAL_ATM_RATE
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_ATM_RATE - DELTA_STAR) < 1e-15


# ── Function: atmospheric_dynamics ────────────────────────────────────────────

def test_atmospheric_dynamics_returns_dict():
    from urt.meteorology_cathedral import atmospheric_dynamics
    result = atmospheric_dynamics()
    assert isinstance(result, dict)


def test_atmospheric_dynamics_required_keys():
    from urt.meteorology_cathedral import atmospheric_dynamics
    r = atmospheric_dynamics()
    required = [
        "n_wind_components", "wind_eq_D",
        "n_lorenz_eqns", "lorenz_eq_D",
        "n_jet_streams", "jet_eq_D1",
        "n_thermal_wind", "thermal_eq_D1",
        "richardson_critical", "ri_c_eq_025",
        "kolmogorov_velocity_exp", "kolmogorov_exp_eq_075",
        "kolmogorov_energy_exp", "kolmogorov_energy_eq_5_3",
        "rossby_wavenumber", "rossby_eq_q",
    ]
    for key in required:
        assert key in r, f"Missing key: {key}"


def test_atmospheric_dynamics_values():
    from urt.meteorology_cathedral import atmospheric_dynamics
    r = atmospheric_dynamics()
    assert r["n_wind_components"] == 3
    assert r["wind_eq_D"] is True
    assert r["n_lorenz_eqns"] == 3
    assert r["lorenz_eq_D"] is True
    assert r["n_jet_streams"] == 2
    assert r["jet_eq_D1"] is True
    assert r["n_thermal_wind"] == 2
    assert r["thermal_eq_D1"] is True
    assert abs(r["richardson_critical"] - 0.25) < 1e-10
    assert r["ri_c_eq_025"] is True
    assert abs(r["kolmogorov_velocity_exp"] - 0.75) < 1e-10
    assert r["kolmogorov_exp_eq_075"] is True
    assert abs(r["kolmogorov_energy_exp"] - 5.0 / 3.0) < 1e-10
    assert r["kolmogorov_energy_eq_5_3"] is True
    assert r["rossby_wavenumber"] == 5
    assert r["rossby_eq_q"] is True


# ── Function: atmospheric_structure ───────────────────────────────────────────

def test_atmospheric_structure_returns_dict():
    from urt.meteorology_cathedral import atmospheric_structure
    result = atmospheric_structure()
    assert isinstance(result, dict)


def test_atmospheric_structure_required_keys():
    from urt.meteorology_cathedral import atmospheric_structure
    r = atmospheric_structure()
    required = [
        "n_atmosphere_layers", "layers_eq_q",
        "n_beaufort_scale", "beaufort_eq_N",
        "n_primitive_eqns", "prim_eq_D1",
        "n_synoptic_levels", "synoptic_eq_q",
        "n_coriolis_components", "coriolis_eq_D",
        "h_max_atm", "icos_weather_nodes",
        "icos_weather_edges", "dalr_cathedral_scaled",
    ]
    for key in required:
        assert key in r, f"Missing key: {key}"


def test_atmospheric_structure_values():
    from urt.meteorology_cathedral import atmospheric_structure
    r = atmospheric_structure()
    assert r["n_atmosphere_layers"] == 5
    assert r["layers_eq_q"] is True
    assert r["n_beaufort_scale"] == 13
    assert r["beaufort_eq_N"] is True
    assert r["n_primitive_eqns"] == 4
    assert r["prim_eq_D1"] is True
    assert r["n_synoptic_levels"] == 5
    assert r["synoptic_eq_q"] is True
    assert r["n_coriolis_components"] == 3
    assert r["coriolis_eq_D"] is True
    assert r["icos_weather_nodes"] == 13
    assert r["icos_weather_edges"] == 30
    assert isfinite(r["dalr_cathedral_scaled"])


# ── Function: meteorology_summary ─────────────────────────────────────────────

def test_meteorology_summary_returns_dict():
    from urt.meteorology_cathedral import meteorology_summary
    result = meteorology_summary()
    assert isinstance(result, dict)


def test_meteorology_summary_required_keys():
    from urt.meteorology_cathedral import meteorology_summary
    r = meteorology_summary()
    assert "dynamics" in r
    assert "structure" in r
    assert "KEY_EXACT_RESULTS" in r
    assert "delta_star" in r
    assert "N" in r
    assert "D" in r


def test_meteorology_summary_key_exact_results():
    from urt.meteorology_cathedral import meteorology_summary
    r = meteorology_summary()
    results = r["KEY_EXACT_RESULTS"]
    assert isinstance(results, list)
    assert len(results) >= 5
    # All should be strings
    for item in results:
        assert isinstance(item, str)


def test_meteorology_summary_N_D_values():
    from urt.meteorology_cathedral import meteorology_summary
    r = meteorology_summary()
    assert r["N"] == 13
    assert r["D"] == 3


def test_meteorology_summary_delta_star():
    from urt.meteorology_cathedral import meteorology_summary
    from urt.shell_closure import DELTA_STAR
    r = meteorology_summary()
    assert abs(r["delta_star"] - DELTA_STAR) < 1e-15


def test_meteorology_summary_subdicts():
    from urt.meteorology_cathedral import meteorology_summary
    r = meteorology_summary()
    assert isinstance(r["dynamics"], dict)
    assert isinstance(r["structure"], dict)


def test_meteorology_summary_exact_labels():
    """KEY_EXACT_RESULTS contains EXACT and APPROXIMATE labels."""
    from urt.meteorology_cathedral import meteorology_summary
    r = meteorology_summary()
    full_text = " ".join(r["KEY_EXACT_RESULTS"])
    assert "EXACT" in full_text
    assert "APPROXIMATE" in full_text


# ── Function: print_meteorology_report ────────────────────────────────────────

def test_print_meteorology_report(capsys):
    from urt.meteorology_cathedral import print_meteorology_report
    print_meteorology_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "METEOROLOGY" in out
    assert "EXACT" in out


def test_print_meteorology_report_contains_key_values(capsys):
    from urt.meteorology_cathedral import print_meteorology_report
    print_meteorology_report()
    out = capsys.readouterr().out
    assert "13" in out     # Beaufort = N
    assert "0.25" in out   # Richardson critical
    assert "0.75" in out   # Kolmogorov velocity exp
    assert "5" in out      # atmosphere layers = q


# ── Cross-module consistency ───────────────────────────────────────────────────

def test_jet_plus_thermal_eq_D_minus_1():
    """Both jet streams and thermal wind components equal D-1=2."""
    from urt.meteorology_cathedral import N_JET_STREAMS, N_THERMAL_WIND_COMPONENTS
    assert N_JET_STREAMS == N_THERMAL_WIND_COMPONENTS
    assert N_JET_STREAMS == 2


def test_wind_equals_lorenz():
    """Wind components and Lorenz equations both equal D=3."""
    from urt.meteorology_cathedral import N_WIND_COMPONENTS, N_LORENZ_EQNS
    assert N_WIND_COMPONENTS == N_LORENZ_EQNS
    assert N_WIND_COMPONENTS == 3


def test_atmosphere_layers_equals_synoptic_levels():
    """Atmosphere layers and synoptic pressure levels both equal q=5."""
    from urt.meteorology_cathedral import N_ATMOSPHERE_LAYERS, N_SYNOPTIC_PRESSURE_LEVELS
    assert N_ATMOSPHERE_LAYERS == N_SYNOPTIC_PRESSURE_LEVELS
    assert N_ATMOSPHERE_LAYERS == 5


def test_beaufort_equals_icos_nodes():
    """Beaufort scale levels and icosahedral weather nodes both equal N=13."""
    from urt.meteorology_cathedral import N_BEAUFORT_SCALE, N_ICOS_WEATHER_NODES
    assert N_BEAUFORT_SCALE == N_ICOS_WEATHER_NODES
    assert N_BEAUFORT_SCALE == 13


def test_kolmogorov_velocity_plus_energy_self_consistent():
    """velocity_exp = D/(D+1); energy_exp = q/D; both exact."""
    from urt.meteorology_cathedral import KOLMOGOROV_VELOCITY_EXP, KOLMOGOROV_ENERGY_EXP
    from urt.shell_closure import D, q
    assert abs(KOLMOGOROV_VELOCITY_EXP - 0.75) < 1e-10
    assert abs(KOLMOGOROV_ENERGY_EXP - 5.0 / 3.0) < 1e-10


def test_richardson_times_D_plus_1_equals_1():
    """Ri_c * (D+1) = 1.0 exactly."""
    from urt.meteorology_cathedral import RICHARDSON_CRITICAL
    from urt.shell_closure import D
    assert abs(RICHARDSON_CRITICAL * (D + 1) - 1.0) < 1e-10


def test_turbulence_inertial_exponent():
    """TURBULENCE_INERTIAL_EXPONENT = q/D = 5/3."""
    from urt.meteorology_cathedral import TURBULENCE_INERTIAL_EXPONENT
    from urt.shell_closure import q, D
    assert abs(TURBULENCE_INERTIAL_EXPONENT - float(q) / D) < 1e-10
    assert abs(TURBULENCE_INERTIAL_EXPONENT - 5.0 / 3.0) < 1e-10
