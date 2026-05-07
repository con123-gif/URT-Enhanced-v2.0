"""Tests for urt/geophysics_cathedral.py — Earth, seismology, and Cathedral integers."""

import pytest
from math import isfinite, sqrt


def test_imports():
    from urt.geophysics_cathedral import (
        N_SEISMIC_BODY, N_SEISMIC_SURFACE, N_SEISMIC_TOTAL,
        SEISMIC_TOTAL_EQ_D1,
        EARTH_LAYERS, N_TECTONIC_PLATES,
        VP_FACTOR, VP_VS_POISSON, POISSON_RATIO, LAME_RATIO,
        N_NORMAL_MODES_SUM,
        GUTENBERG_RICHTER_B,
        seismic_waves, earth_structure, wave_velocities,
        normal_modes, gutenberg_richter,
        geophysics_summary, print_geophysics_report,
    )


# ── Seismic waves ─────────────────────────────────────────────────────────────

def test_seismic_body_waves_eq_D1():
    """Body waves (P and S) = D-1 = 2."""
    from urt.geophysics_cathedral import N_SEISMIC_BODY
    from urt.shell_closure import D
    assert N_SEISMIC_BODY == D - 1
    assert N_SEISMIC_BODY == 2


def test_seismic_surface_waves_eq_D1():
    """Surface waves = D-1 = 2."""
    from urt.geophysics_cathedral import N_SEISMIC_SURFACE
    from urt.shell_closure import D
    assert N_SEISMIC_SURFACE == D - 1
    assert N_SEISMIC_SURFACE == 2


def test_seismic_total_eq_D1():
    """Total seismic wave types = D+1 = 4."""
    from urt.geophysics_cathedral import N_SEISMIC_TOTAL
    from urt.shell_closure import D
    assert N_SEISMIC_TOTAL == D + 1
    assert N_SEISMIC_TOTAL == 4


def test_seismic_total_eq_D1_flag():
    """SEISMIC_TOTAL_EQ_D1 flag is True."""
    from urt.geophysics_cathedral import SEISMIC_TOTAL_EQ_D1
    assert SEISMIC_TOTAL_EQ_D1 is True


# ── Earth structure ───────────────────────────────────────────────────────────

def test_earth_layers_eq_D1():
    """Earth has D+1 = 4 main layers."""
    from urt.geophysics_cathedral import EARTH_LAYERS
    from urt.shell_closure import D
    assert EARTH_LAYERS == D + 1
    assert EARTH_LAYERS == 4


def test_tectonic_plates_approx_N():
    """Major tectonic plates ≈ N = 13."""
    from urt.geophysics_cathedral import N_TECTONIC_PLATES
    from urt.shell_closure import N
    assert N_TECTONIC_PLATES == N
    assert N_TECTONIC_PLATES == 13


# ── Wave velocities ───────────────────────────────────────────────────────────

def test_vp_factor():
    """P-wave velocity factor = (D+1)/D = 4/3."""
    from urt.geophysics_cathedral import VP_FACTOR
    from urt.shell_closure import D
    assert abs(VP_FACTOR - (D + 1.0) / D) < 1e-10


def test_vp_vs_ratio_poisson_solid():
    """For Poisson solid, vP/vS = √D = √3."""
    from urt.geophysics_cathedral import VP_VS_POISSON
    from urt.shell_closure import D
    assert abs(VP_VS_POISSON - sqrt(D)) < 1e-10


# ── Normal modes ──────────────────────────────────────────────────────────────

def test_normal_modes_sum_eq_N2():
    """Normal modes sum = N² = 169."""
    from urt.geophysics_cathedral import N_NORMAL_MODES_SUM
    from urt.shell_closure import N
    assert N_NORMAL_MODES_SUM == N**2
    assert N_NORMAL_MODES_SUM == 169


# ── Functions ─────────────────────────────────────────────────────────────────

def test_seismic_waves_function():
    from urt.geophysics_cathedral import seismic_waves
    r = seismic_waves()
    assert r["n_body_waves"] == 2
    assert r["n_surface_waves"] == 2
    assert r["total_eq_D1"] is True


def test_earth_structure_function():
    from urt.geophysics_cathedral import earth_structure
    r = earth_structure()
    assert r["layers"] == 4
    assert r["plates"] == 13


def test_wave_velocities_function():
    from urt.geophysics_cathedral import wave_velocities
    r = wave_velocities()
    assert "vp_factor" in r
    assert "vp_vs_poisson" in r


def test_normal_modes_function():
    from urt.geophysics_cathedral import normal_modes
    r = normal_modes()
    assert r["sum_modes"] == 169
    assert r["sum_eq_N2"] is True


def test_gutenberg_richter_function():
    from urt.geophysics_cathedral import gutenberg_richter
    r = gutenberg_richter()
    assert "b_value" in r
    assert abs(r["b_value"] - 1.0) < 0.01


def test_geophysics_summary():
    from urt.geophysics_cathedral import geophysics_summary
    r = geophysics_summary()
    assert "seismic" in r
    assert "earth" in r
    assert len(r["KEY_EXACT_RESULTS"]) >= 3


def test_print_geophysics_report(capsys):
    from urt.geophysics_cathedral import print_geophysics_report
    print_geophysics_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "4" in out
    assert "13" in out
