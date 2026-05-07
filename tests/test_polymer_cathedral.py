"""Tests for urt/polymer_cathedral.py — Polymer physics and Cathedral integers."""

import pytest
from math import isfinite


# ── Imports ───────────────────────────────────────────────────────────────────

def test_imports():
    from urt.polymer_cathedral import (
        N_FLORY_EXPONENTS,
        FLORY_NU_D3,
        FLORY_NU_APPROX,
        FLORY_NU_DEVIATION,
        KUHN_SEGMENTS_ICOS,
        RANDOM_WALK_DIM,
        SELF_AVOIDING_DIM,
        POLYMER_UPPER_CRITICAL_D,
        POLYMER_LOWER_CRITICAL_D,
        BLOB_EXPONENT,
        END_TO_END_SCALING,
        ROUSE_MODES,
        ZIMM_EXPONENT,
        N_TOPOLOGICAL_INVARIANTS_POLYMER,
        ENTANGLEMENT_TUBE_DIM,
        GAUSSIAN_RG_PREFACTOR,
        PERSISTENCE_LENGTH_ICOS,
        BLOB_CORRELATION,
        WLC_BENDING_MODES,
        flory_exponents,
        rouse_zimm_modes,
        polymer_summary,
        print_polymer_report,
    )


# ── Spatial dimensions ────────────────────────────────────────────────────────

def test_random_walk_dim_eq_D():
    from urt.polymer_cathedral import RANDOM_WALK_DIM
    from urt.shell_closure import D
    assert RANDOM_WALK_DIM == D
    assert RANDOM_WALK_DIM == 3


def test_self_avoiding_dim_eq_D():
    from urt.polymer_cathedral import SELF_AVOIDING_DIM
    from urt.shell_closure import D
    assert SELF_AVOIDING_DIM == D


# ── Flory exponents ───────────────────────────────────────────────────────────

def test_n_flory_exponents_eq_D():
    """D=3 independent Flory exponents  [APPROXIMATE]."""
    from urt.polymer_cathedral import N_FLORY_EXPONENTS
    from urt.shell_closure import D
    assert N_FLORY_EXPONENTS == D
    assert N_FLORY_EXPONENTS == 3


def test_flory_nu_d3_value():
    """Exact Flory exponent ν = 0.588 in D=3."""
    from urt.polymer_cathedral import FLORY_NU_D3
    assert abs(FLORY_NU_D3 - 0.588) < 1e-10
    assert FLORY_NU_D3 > 0.5
    assert FLORY_NU_D3 < 1.0


def test_flory_nu_approx_formula():
    """Flory approximation ν_F = D/(D+2) = 3/5 = 0.6."""
    from urt.polymer_cathedral import FLORY_NU_APPROX
    from urt.shell_closure import D
    expected = float(D) / (D + 2)
    assert abs(FLORY_NU_APPROX - expected) < 1e-12
    assert abs(FLORY_NU_APPROX - 0.6) < 1e-10


def test_flory_nu_deviation_lt_5pct():
    """Flory approximation within 5% of exact value."""
    from urt.polymer_cathedral import FLORY_NU_DEVIATION
    assert FLORY_NU_DEVIATION < 0.05


def test_flory_nu_deviation_approx_2pct():
    """Deviation ≈ 2% (1–4% window)."""
    from urt.polymer_cathedral import FLORY_NU_DEVIATION
    assert 0.005 < FLORY_NU_DEVIATION < 0.04


# ── Kuhn segments ─────────────────────────────────────────────────────────────

def test_kuhn_segments_eq_N():
    """Icosahedral chain: N=13 Kuhn segments  [EXACT]."""
    from urt.polymer_cathedral import KUHN_SEGMENTS_ICOS
    from urt.shell_closure import N
    assert KUHN_SEGMENTS_ICOS == N
    assert KUHN_SEGMENTS_ICOS == 13


# ── Critical dimensions ───────────────────────────────────────────────────────

def test_upper_critical_d_eq_D_plus_1():
    """Upper critical dimension = D+1 = 4  [EXACT]."""
    from urt.polymer_cathedral import POLYMER_UPPER_CRITICAL_D
    from urt.shell_closure import D
    assert POLYMER_UPPER_CRITICAL_D == D + 1
    assert POLYMER_UPPER_CRITICAL_D == 4


def test_lower_critical_d_eq_D_minus_2():
    """Lower critical dimension = D-2 = 1  [EXACT]."""
    from urt.polymer_cathedral import POLYMER_LOWER_CRITICAL_D
    from urt.shell_closure import D
    assert POLYMER_LOWER_CRITICAL_D == D - 2
    assert POLYMER_LOWER_CRITICAL_D == 1


# ── Blob / scaling ────────────────────────────────────────────────────────────

def test_blob_exponent_eq_D():
    from urt.polymer_cathedral import BLOB_EXPONENT
    from urt.shell_closure import D
    assert BLOB_EXPONENT == D


def test_end_to_end_scaling():
    """End-to-end scaling = FLORY_NU_D3."""
    from urt.polymer_cathedral import END_TO_END_SCALING, FLORY_NU_D3
    assert abs(END_TO_END_SCALING - FLORY_NU_D3) < 1e-12


# ── Rouse model ───────────────────────────────────────────────────────────────

def test_rouse_modes_eq_N():
    """N-segment chain has N Rouse modes  [EXACT]."""
    from urt.polymer_cathedral import ROUSE_MODES
    from urt.shell_closure import N
    assert ROUSE_MODES == N
    assert ROUSE_MODES == 13


# ── Zimm model ────────────────────────────────────────────────────────────────

def test_zimm_exponent_formula():
    """Zimm exponent = D/(D+1) = 3/4 = 0.75  [EXACT]."""
    from urt.polymer_cathedral import ZIMM_EXPONENT
    from urt.shell_closure import D
    expected = float(D) / (D + 1)
    assert abs(ZIMM_EXPONENT - expected) < 1e-12
    assert abs(ZIMM_EXPONENT - 0.75) < 1e-10


# ── Entanglement tube ─────────────────────────────────────────────────────────

def test_entanglement_tube_dim_eq_D_minus_1():
    """Reptation tube dimension = D-1 = 2  [EXACT]."""
    from urt.polymer_cathedral import ENTANGLEMENT_TUBE_DIM
    from urt.shell_closure import D
    assert ENTANGLEMENT_TUBE_DIM == D - 1
    assert ENTANGLEMENT_TUBE_DIM == 2


# ── Topological invariants ────────────────────────────────────────────────────

def test_topological_invariants_eq_D_minus_2():
    """Writhe topological invariant = D-2 = 1  [EXACT]."""
    from urt.polymer_cathedral import N_TOPOLOGICAL_INVARIANTS_POLYMER
    from urt.shell_closure import D
    assert N_TOPOLOGICAL_INVARIANTS_POLYMER == D - 2
    assert N_TOPOLOGICAL_INVARIANTS_POLYMER == 1


# ── Gaussian Rg prefactor ─────────────────────────────────────────────────────

def test_gaussian_rg_prefactor():
    """Gaussian chain Rg² prefactor = 1/(D*(D+1)) = 1/12."""
    from urt.polymer_cathedral import GAUSSIAN_RG_PREFACTOR
    from urt.shell_closure import D
    expected = 1.0 / (D * (D + 1))
    assert abs(GAUSSIAN_RG_PREFACTOR - expected) < 1e-12
    assert abs(GAUSSIAN_RG_PREFACTOR - 1.0 / 12.0) < 1e-12


# ── Persistence length ────────────────────────────────────────────────────────

def test_persistence_length():
    """Persistence length = 1/δ★."""
    from urt.polymer_cathedral import PERSISTENCE_LENGTH_ICOS
    from urt.shell_closure import DELTA_STAR
    assert abs(PERSISTENCE_LENGTH_ICOS - 1.0 / DELTA_STAR) < 1e-10
    assert 6.0 < PERSISTENCE_LENGTH_ICOS < 8.0


# ── WLC bending modes ─────────────────────────────────────────────────────────

def test_wlc_bending_modes_eq_V():
    """WLC bending modes = N-1 = 12 = V."""
    from urt.polymer_cathedral import WLC_BENDING_MODES
    from urt.shell_closure import N, V
    assert WLC_BENDING_MODES == N - 1
    assert WLC_BENDING_MODES == V
    assert WLC_BENDING_MODES == 12


# ── flory_exponents() function ────────────────────────────────────────────────

def test_flory_exponents_returns_dict():
    from urt.polymer_cathedral import flory_exponents
    r = flory_exponents()
    assert isinstance(r, dict)


def test_flory_exponents_nu_d3():
    from urt.polymer_cathedral import flory_exponents
    r = flory_exponents()
    assert abs(r["flory_nu_d3"] - 0.588) < 1e-10


def test_flory_exponents_nu_approx():
    from urt.polymer_cathedral import flory_exponents
    r = flory_exponents()
    assert abs(r["flory_nu_approx"] - 0.6) < 1e-10


def test_flory_upper_critical_eq_D1():
    from urt.polymer_cathedral import flory_exponents
    from urt.shell_closure import D
    r = flory_exponents()
    assert r["upper_critical_d"] == D + 1
    assert r["upper_critical_eq_D1"] is True


def test_flory_lower_critical_eq_D2():
    from urt.polymer_cathedral import flory_exponents
    from urt.shell_closure import D
    r = flory_exponents()
    assert r["lower_critical_d"] == D - 2
    assert r["lower_critical_eq_D2"] is True


def test_flory_kuhn_eq_N():
    from urt.polymer_cathedral import flory_exponents
    from urt.shell_closure import N
    r = flory_exponents()
    assert r["kuhn_segments"] == N
    assert r["kuhn_eq_N"] is True


def test_flory_n_exponents_eq_D():
    from urt.polymer_cathedral import flory_exponents
    from urt.shell_closure import D
    r = flory_exponents()
    assert r["n_exponents"] == D
    assert r["n_exponents_eq_D"] is True


# ── rouse_zimm_modes() function ───────────────────────────────────────────────

def test_rouse_zimm_returns_dict():
    from urt.polymer_cathedral import rouse_zimm_modes
    r = rouse_zimm_modes()
    assert isinstance(r, dict)


def test_rouse_zimm_rouse_eq_N():
    from urt.polymer_cathedral import rouse_zimm_modes
    from urt.shell_closure import N
    r = rouse_zimm_modes()
    assert r["rouse_modes"] == N
    assert r["rouse_eq_N"] is True


def test_rouse_zimm_zimm_exponent():
    from urt.polymer_cathedral import rouse_zimm_modes
    r = rouse_zimm_modes()
    assert abs(r["zimm_exponent"] - 0.75) < 1e-10
    assert r["zimm_eq_D_over_D1"] is True


def test_rouse_zimm_tube_dim():
    from urt.polymer_cathedral import rouse_zimm_modes
    from urt.shell_closure import D
    r = rouse_zimm_modes()
    assert r["tube_dim"] == D - 1
    assert r["tube_dim_eq_D1"] is True


def test_rouse_zimm_topo_inv():
    from urt.polymer_cathedral import rouse_zimm_modes
    from urt.shell_closure import D
    r = rouse_zimm_modes()
    assert r["topological_inv"] == D - 2
    assert r["topo_eq_D2"] is True


def test_rouse_zimm_wlc_eq_V():
    from urt.polymer_cathedral import rouse_zimm_modes
    from urt.shell_closure import V
    r = rouse_zimm_modes()
    assert r["wlc_bending_modes"] == V
    assert r["wlc_eq_V"] is True


# ── polymer_summary() function ────────────────────────────────────────────────

def test_summary_returns_dict():
    from urt.polymer_cathedral import polymer_summary
    s = polymer_summary()
    assert isinstance(s, dict)


def test_summary_has_flory_key():
    from urt.polymer_cathedral import polymer_summary
    s = polymer_summary()
    assert "flory" in s


def test_summary_has_dynamics_key():
    from urt.polymer_cathedral import polymer_summary
    s = polymer_summary()
    assert "dynamics" in s


def test_summary_has_key_results():
    from urt.polymer_cathedral import polymer_summary
    s = polymer_summary()
    assert "key_results" in s
    assert isinstance(s["key_results"], list)
    assert len(s["key_results"]) >= 5


def test_summary_key_results_contain_EXACT():
    from urt.polymer_cathedral import polymer_summary
    s = polymer_summary()
    exact_count = sum(1 for r in s["key_results"] if "EXACT" in r)
    assert exact_count >= 3


def test_summary_delta_star():
    from urt.polymer_cathedral import polymer_summary
    from urt.shell_closure import DELTA_STAR
    s = polymer_summary()
    assert abs(s["delta_star"] - DELTA_STAR) < 1e-12


# ── print_polymer_report() ────────────────────────────────────────────────────

def test_print_report_runs(capsys):
    from urt.polymer_cathedral import print_polymer_report
    print_polymer_report()
    captured = capsys.readouterr()
    assert "POLYMER" in captured.out
    assert "EXACT" in captured.out


def test_print_report_contains_flory(capsys):
    from urt.polymer_cathedral import print_polymer_report
    print_polymer_report()
    captured = capsys.readouterr()
    assert "Flory" in captured.out or "flory" in captured.out.lower()


def test_print_report_contains_rouse(capsys):
    from urt.polymer_cathedral import print_polymer_report
    print_polymer_report()
    captured = capsys.readouterr()
    assert "Rouse" in captured.out or "rouse" in captured.out.lower()
