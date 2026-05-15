"""Tests for the consolidated master audit."""
import pytest

from urt.master_audit import (
    PHASES, phase_results, all_phases_pass,
    framework_metrics, master_audit_passes,
)


def test_phases_list_has_at_least_9_entries():
    """The 9-phase investigation must have at least 9 entries (plus DOF)."""
    assert len(PHASES) >= 10


def test_every_phase_has_label_and_gate():
    for label, desc, gate in PHASES:
        assert isinstance(label, str)
        assert isinstance(desc, str)
        assert callable(gate)


def test_phase_results_complete():
    results = phase_results()
    assert len(results) == len(PHASES)
    for r in results:
        assert "phase" in r
        assert "desc" in r
        assert "passes" in r
        assert isinstance(r["passes"], bool)


def test_all_phases_pass():
    assert all_phases_pass()


def test_framework_metrics_complete():
    m = framework_metrics()
    expected_keys = {
        "info_delivered_bits", "brute_force_budget_bits",
        "free_budget_bits", "forced_budget_bits",
        "net_info_bits", "n_v9_observables", "n_registry_rows",
        "n_levels_used",
        "n_spectral_levels", "n_combinatorial_levels",
        "n_coefficient_table", "n_correction_table",
        "n_a5_dark_filled", "n_a5_dark_open", "n_falsifiable_preds",
        "registration_date", "n_as_factors", "a_s_predicted",
        "L_trace", "K_4_trace", "A_5_trace", "distinct_eigenvalues",
    }
    assert set(m.keys()) == expected_keys


def test_net_info_decisively_tight():
    """The master audit reports >40 bits net info (decisive tightness)."""
    m = framework_metrics()
    assert m["net_info_bits"] > 40.0


def test_structural_savings_positive():
    m = framework_metrics()
    assert m["free_budget_bits"] > m["forced_budget_bits"]


def test_a5_count_equals_9():
    m = framework_metrics()
    assert m["n_a5_dark_filled"] + m["n_a5_dark_open"] == 9


def test_spectral_plus_combinatorial_equals_levels():
    m = framework_metrics()
    assert m["n_spectral_levels"] + m["n_combinatorial_levels"] == m["n_levels_used"]


def test_master_audit_passes():
    assert master_audit_passes()


def test_at_least_3_falsifiable_predictions():
    m = framework_metrics()
    assert m["n_falsifiable_preds"] >= 3


def test_registration_date_2026():
    m = framework_metrics()
    assert m["registration_date"].startswith("2026")
