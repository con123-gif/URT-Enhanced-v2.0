"""Tests for pre-registered falsifiable predictions log."""
import pytest

from urt.falsifiable_log import (
    REGISTRATION_DATE,
    AXION_MASS_UEV, CASIMIR_FRAC_DEV_100NM_PPM, R_TENSOR,
    FalsifiablePrediction, PREDICTIONS,
    get_prediction, all_prediction_names, predictions_as_dicts,
    all_registration_dates_match,
    axion_pinned, casimir_pinned, r_tensor_pinned,
    at_least_3_predictions, every_prediction_has_falsification_criterion,
    falsifiable_log_audit_passes,
)
from urt.shell_closure import D, G


def test_REGISTRATION_DATE_format():
    assert REGISTRATION_DATE == "2026-05-15"


def test_axion_value_pinned():
    """Axion mass must be exactly 60.7 µeV at registration."""
    assert AXION_MASS_UEV == 60.7
    assert axion_pinned()


def test_casimir_value_pinned():
    assert CASIMIR_FRAC_DEV_100NM_PPM == 0.124
    assert casimir_pinned()


def test_r_tensor_value_pinned():
    expected = 12.0 / (G - D)**2
    assert abs(R_TENSOR - expected) < 1e-12
    assert r_tensor_pinned()


def test_r_tensor_formula_equals_12_over_57sq():
    """r = 12 / (G - D)² = 12 / 57² = 0.003693..."""
    assert abs(R_TENSOR - 12.0/57.0/57.0) < 1e-12


def test_at_least_3_predictions():
    assert at_least_3_predictions()


def test_prediction_names_complete():
    names = set(all_prediction_names())
    assert "axion_mass" in names
    assert "casimir_deviation_100nm" in names
    assert "tensor_to_scalar_ratio" in names


def test_get_prediction_lookup():
    p = get_prediction("axion_mass")
    assert p is not None
    assert p.value == 60.7


def test_unknown_prediction_returns_None():
    assert get_prediction("not_a_real_prediction") is None


def test_predictions_have_falsification_criteria():
    assert every_prediction_has_falsification_criterion()


def test_predictions_have_experiment_target():
    for p in PREDICTIONS:
        assert len(p.experiment) > 10


def test_predictions_have_cathedral_origin():
    for p in PREDICTIONS:
        assert "urt." in p.cathedral_origin


def test_predictions_dataclasses_are_frozen():
    """Cannot mutate a prediction (dataclass(frozen=True))."""
    p = PREDICTIONS[0]
    with pytest.raises(Exception):
        p.value = 999.0


def test_all_registration_dates_match():
    assert all_registration_dates_match()


def test_predictions_as_dicts_exportable():
    d = predictions_as_dicts()
    assert isinstance(d, list)
    assert len(d) == len(PREDICTIONS)
    for entry in d:
        assert "name" in entry
        assert "value" in entry


def test_falsifiable_log_audit_passes():
    assert falsifiable_log_audit_passes()
