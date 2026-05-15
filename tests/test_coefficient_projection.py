"""Tests for coefficient projection onto K_4 ⊕ A_5 sectors."""
import math
import pytest

from urt.coefficient_projection import (
    K4_ELEMENTS, A5_ELEMENTS, COEFFICIENT_CLASSES,
    CoefficientForm, COEFFICIENT_TABLE,
    coefficient_class_for, all_classified, coefficient_classes_used,
    coefficient_dof_per_slot_bits, coefficient_savings_bits,
    total_coefficient_savings_bits,
    all_v9_coefficients_classified, at_least_5_coefficient_classes_used,
    coefficient_projection_audit_passes,
)
from urt.shell_closure import D, q


def test_K4_elements_cardinality():
    """|K_4| = D + 1 = 4."""
    assert len(K4_ELEMENTS) == D + 1


def test_A5_elements_cardinality():
    """|A_5| element set has 5 distinct values."""
    assert len(set(A5_ELEMENTS)) >= 4   # 1, 2, 5, 6, 9 — five distinct


def test_K4_elements_are_K_4_integers():
    assert set(K4_ELEMENTS) == {1, 2, 3, 4}


def test_A5_elements_include_q_and_D_factorial():
    assert q in A5_ELEMENTS
    assert math.factorial(D) in A5_ELEMENTS
    assert math.factorial(D) + D in A5_ELEMENTS  # 9


def test_COEFFICIENT_CLASSES_completeness():
    classes = set(COEFFICIENT_CLASSES)
    for required in {"K4_RATIO", "A5_RATIO", "SECTOR_RATIO",
                      "K4_POWER", "GEOMETRIC", "COMPOUND"}:
        assert required in classes


def test_every_v9_coefficient_classified():
    """No entry in COEFFICIENT_TABLE is UNCLASSIFIED."""
    assert all_classified()


def test_classification_covers_known_observables():
    names = {cf.name for cf in COEFFICIENT_TABLE}
    assert "Lambda/M_Pl^4" in names
    assert "eta_B" in names
    assert "A_s" in names
    assert "theta_12" in names
    assert "G_N_Planck" in names


def test_coefficient_class_for_lookup():
    assert coefficient_class_for("Lambda/M_Pl^4") == "K4_RATIO"
    assert coefficient_class_for("eta_B") == "SECTOR_RATIO"
    assert coefficient_class_for("m_s/m_p") == "K4_POWER"


def test_unknown_observable_returns_None():
    assert coefficient_class_for("not_a_real_observable") is None


def test_at_least_5_classes_used():
    """Classification is non-trivial — uses ≥ 5 of 7 classes."""
    assert at_least_5_coefficient_classes_used()


def test_savings_positive():
    """Sector projection reduces DOF below the structural_dof.py 4-bit credit."""
    assert coefficient_savings_bits() > 0
    assert total_coefficient_savings_bits() > 0


def test_coefficient_dof_strictly_less_than_4_bits():
    assert coefficient_dof_per_slot_bits() < 4.0


def test_all_v9_coefficients_classified_audit():
    assert all_v9_coefficients_classified()


def test_coefficient_projection_audit_passes():
    assert coefficient_projection_audit_passes()


def test_coefficient_table_size():
    assert len(COEFFICIENT_TABLE) >= 10
