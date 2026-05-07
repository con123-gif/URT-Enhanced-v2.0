"""Tests for urt/spectroscopy_cathedral.py — Zeeman, hydrogen series, Stokes."""

import pytest


def test_imports():
    from urt.spectroscopy_cathedral import (
        N_HYDROGEN_SERIES, N_SODIUM_D_LINES, ZEEMAN_NORMAL_LINES,
        ZEEMAN_COMPONENTS_FOR_L1, SELECTION_RULE_DM, N_STOKES_PARAMETERS,
        N_LARMOR_PRECESSION_DIM,
        zeeman_effect, hydrogen_series, stokes_parameters,
        spectroscopy_summary, print_spectroscopy_report,
    )


def test_hydrogen_series_eq_q():
    """Five hydrogen spectral series = q = 5."""
    from urt.spectroscopy_cathedral import N_HYDROGEN_SERIES
    from urt.shell_closure import q
    assert N_HYDROGEN_SERIES == q
    assert N_HYDROGEN_SERIES == 5


def test_sodium_doublet_eq_D1():
    """Sodium D doublet = D-1 = 2 lines."""
    from urt.spectroscopy_cathedral import N_SODIUM_D_LINES
    from urt.shell_closure import D
    assert N_SODIUM_D_LINES == D - 1
    assert N_SODIUM_D_LINES == 2


def test_zeeman_normal_lines_eq_D():
    """Normal Zeeman: D = 3 components (π, σ+, σ-)."""
    from urt.spectroscopy_cathedral import ZEEMAN_NORMAL_LINES
    from urt.shell_closure import D
    assert ZEEMAN_NORMAL_LINES == D
    assert ZEEMAN_NORMAL_LINES == 3


def test_selection_rule_dm_eq_D():
    """Δm ∈ {-1, 0, +1} = D = 3 values."""
    from urt.spectroscopy_cathedral import SELECTION_RULE_DM
    from urt.shell_closure import D
    assert SELECTION_RULE_DM == D
    assert SELECTION_RULE_DM == 3


def test_stokes_parameters_eq_D1():
    """Stokes parameters = D+1 = 4."""
    from urt.spectroscopy_cathedral import N_STOKES_PARAMETERS
    from urt.shell_closure import D
    assert N_STOKES_PARAMETERS == D + 1
    assert N_STOKES_PARAMETERS == 4


def test_zeeman_function():
    from urt.spectroscopy_cathedral import zeeman_effect
    r = zeeman_effect()
    assert r["n_eq_D"] is True
    assert r["n_components"] == 3


def test_hydrogen_series_function():
    from urt.spectroscopy_cathedral import hydrogen_series
    r = hydrogen_series()
    assert r["n_eq_q"] is True
    assert r["n_series"] == 5


def test_stokes_parameters_function():
    from urt.spectroscopy_cathedral import stokes_parameters
    r = stokes_parameters()
    assert r["n_eq_D1"] is True
    assert r["n_params"] == 4


def test_spectroscopy_summary():
    from urt.spectroscopy_cathedral import spectroscopy_summary
    r = spectroscopy_summary()
    assert "zeeman" in r
    assert "hydrogen" in r
    assert "stokes" in r
    assert len(r["key_results"]) >= 4


def test_print_spectroscopy_report(capsys):
    from urt.spectroscopy_cathedral import print_spectroscopy_report
    print_spectroscopy_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "3" in out
