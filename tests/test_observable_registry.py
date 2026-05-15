"""Tests for the cross-cutting observable registry."""
import pytest

from urt.observable_registry import (
    ObservableRow, build_registry, get_row, all_names,
    rows_by_family, coverage_summary,
    every_row_has_family_and_channel,
    observable_registry_audit_passes,
)


def test_registry_has_at_least_20_rows():
    rows = build_registry()
    assert len(rows) >= 20


def test_each_row_has_family():
    for r in build_registry():
        assert r.family in ("INT", "GAMMA_LADDER", "DELTA_STAR_LIN", "TRIG_WRAPPER")


def test_each_row_has_k4_channel():
    for r in build_registry():
        assert 0 <= r.k4_channel <= 3


def test_INT_rows_in_K4_0():
    for r in build_registry():
        if r.family == "INT":
            assert r.k4_channel == 0


def test_GAMMA_LADDER_rows_in_K4_1():
    for r in build_registry():
        if r.family == "GAMMA_LADDER":
            assert r.k4_channel == 1


def test_DELTA_STAR_LIN_rows_in_K4_2():
    for r in build_registry():
        if r.family == "DELTA_STAR_LIN":
            assert r.k4_channel == 2


def test_TRIG_WRAPPER_rows_in_K4_3():
    for r in build_registry():
        if r.family == "TRIG_WRAPPER":
            assert r.k4_channel == 3


def test_gamma_ladder_rows_have_gamma_level():
    """Every γ-ladder observable should have a non-None gamma_level."""
    rows = build_registry()
    gladder = [r for r in rows if r.family == "GAMMA_LADDER"]
    # at least half should have gamma_level mapped
    with_glevel = [r for r in gladder if r.gamma_level is not None]
    assert len(with_glevel) >= len(gladder) // 2


def test_get_row_lookup():
    r = get_row("Λ/M_Pl⁴")
    assert r is not None
    assert r.family == "GAMMA_LADDER"
    assert r.k4_channel == 1


def test_unknown_observable_returns_None():
    assert get_row("not_a_real_observable") is None


def test_rows_by_family_keys():
    families = set(rows_by_family().keys())
    assert families <= {"INT", "GAMMA_LADDER", "DELTA_STAR_LIN", "TRIG_WRAPPER"}


def test_coverage_summary_keys():
    cov = coverage_summary()
    for key in ("total", "have_family", "have_k4_channel",
                "have_gamma_level", "have_coefficient",
                "have_correction", "have_observed"):
        assert key in cov


def test_full_coverage_for_family_and_channel():
    cov = coverage_summary()
    assert cov["have_family"] == cov["total"]
    assert cov["have_k4_channel"] == cov["total"]


def test_every_row_has_family_and_channel_gate():
    assert every_row_has_family_and_channel()


def test_observable_registry_audit_passes():
    assert observable_registry_audit_passes()
