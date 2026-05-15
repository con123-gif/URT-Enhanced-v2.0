"""Tests for correction projection onto perturbation orders."""
import pytest

from urt.correction_projection import (
    CORRECTION_ORDERS, CorrectionForm, CORRECTION_TABLE,
    correction_order_for, correction_orders_used,
    all_corrections_classified,
    correction_dof_per_slot_bits, correction_savings_bits,
    total_correction_savings_bits,
    all_orders_used, correction_projection_audit_passes,
)


def test_correction_orders_named():
    expected = {"IDENTITY", "ORDER_GAMMA", "ORDER_ETA",
                "ORDER_DELTASTAR", "SECTOR_RATIO"}
    assert set(CORRECTION_ORDERS) == expected


def test_correction_table_nonempty():
    assert len(CORRECTION_TABLE) >= 10


def test_every_correction_classified():
    assert all_corrections_classified()


def test_all_5_orders_used():
    """Classification is non-degenerate — uses every named order."""
    assert all_orders_used()


def test_correction_order_for_known_observables():
    assert correction_order_for("sin2_thetaW") == "ORDER_GAMMA"
    assert correction_order_for("Omega_m") == "ORDER_GAMMA"
    assert correction_order_for("m_mu/m_e") == "ORDER_ETA"
    assert correction_order_for("theta_13") == "ORDER_ETA"
    assert correction_order_for("eta_B") == "SECTOR_RATIO"
    assert correction_order_for("delta_CP_deg") == "IDENTITY"


def test_unknown_observable_returns_None():
    assert correction_order_for("not_a_real_observable") is None


def test_savings_positive():
    assert correction_savings_bits() > 0
    assert total_correction_savings_bits() > 0


def test_correction_dof_strictly_below_2_bits():
    assert correction_dof_per_slot_bits() < 2.0


def test_correction_projection_audit_passes():
    assert correction_projection_audit_passes()


def test_per_order_coverage_balanced():
    """At least 2 observables per order, except IDENTITY which has special role."""
    cov = correction_orders_used()
    for order in ("ORDER_GAMMA", "ORDER_ETA", "ORDER_DELTASTAR"):
        assert cov.get(order, 0) >= 2, f"{order} has too few observables"


def test_identity_corrections_value_zero():
    """IDENTITY-class corrections have value 0 (no shift)."""
    for cf in CORRECTION_TABLE:
        if cf.order == "IDENTITY":
            assert cf.value == 0.0


def test_correction_values_finite():
    for cf in CORRECTION_TABLE:
        assert -1.0 < cf.value < 10.0, f"{cf.name} value out of expected range"
