"""Tests for urt/epidemiology_cathedral.py — SIR model and Cathedral integers."""

import pytest


def test_imports():
    from urt.epidemiology_cathedral import (
        N_SIR_COMPARTMENTS, N_SEIR_COMPARTMENTS, HERD_IMMUNITY_THRESHOLD,
        BASIC_REPRODUCTION_NUMBER_ICOS, AGE_GROUPS_SIMPLE,
        N_PANDEMIC_WAVES, MORTALITY_SCALING_DIM,
        sir_model, seir_model, herd_immunity,
        epidemiology_summary, print_epidemiology_report,
    )


def test_sir_compartments_eq_D():
    """SIR model has D = 3 compartments."""
    from urt.epidemiology_cathedral import N_SIR_COMPARTMENTS
    from urt.shell_closure import D
    assert N_SIR_COMPARTMENTS == D
    assert N_SIR_COMPARTMENTS == 3


def test_seir_compartments_eq_D1():
    """SEIR model has D+1 = 4 compartments."""
    from urt.epidemiology_cathedral import N_SEIR_COMPARTMENTS
    from urt.shell_closure import D
    assert N_SEIR_COMPARTMENTS == D + 1
    assert N_SEIR_COMPARTMENTS == 4


def test_herd_immunity_threshold():
    """Herd immunity threshold = (D-1)/D = 2/3."""
    from urt.epidemiology_cathedral import HERD_IMMUNITY_THRESHOLD
    from urt.shell_closure import D
    assert abs(HERD_IMMUNITY_THRESHOLD - (D - 1) / D) < 1e-10
    assert abs(HERD_IMMUNITY_THRESHOLD - 2.0 / 3.0) < 1e-10


def test_sir_model_function():
    from urt.epidemiology_cathedral import sir_model
    r = sir_model()
    assert r["n_compartments_eq_D"] is True
    assert r["n_compartments"] == 3


def test_seir_model_function():
    from urt.epidemiology_cathedral import seir_model
    r = seir_model()
    assert r["n_compartments_eq_D1"] is True
    assert r["n_compartments"] == 4


def test_herd_immunity_function():
    from urt.epidemiology_cathedral import herd_immunity
    r = herd_immunity()
    assert r["threshold_eq_D1_D"] is True
    assert abs(r["threshold"] - 2.0 / 3.0) < 1e-10


def test_epidemiology_summary():
    from urt.epidemiology_cathedral import epidemiology_summary
    r = epidemiology_summary()
    assert "sir" in r
    assert "seir" in r
    assert "herd" in r
    assert len(r["key_results"]) >= 3


def test_print_epidemiology_report(capsys):
    from urt.epidemiology_cathedral import print_epidemiology_report
    print_epidemiology_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "3" in out
