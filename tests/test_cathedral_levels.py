"""Tests for Cathedral level enumeration + γ-exponent forcing."""
import math
import pytest

from urt.cathedral_levels import (
    CathedralLevel, LEVELS, LEVELS_BY_K, LEVELS_BY_REGIME,
    gamma_exponent_for_regime, gamma_exponent_is_cathedral,
    OBSERVABLE_REGIME, regime_for_observable, gamma_exponent_for_observable,
    gamma_exponent_dof_per_slot_bits,
    all_levels_consistent, all_observed_gamma_exponents_are_cathedral,
    cathedral_levels_audit_passes,
)
from urt.shell_closure import D, q, F, G


def test_levels_self_consistent():
    """Every CathedralLevel expression evaluates to its declared k."""
    assert all_levels_consistent()


def test_LEVELS_has_at_least_5_entries():
    assert len(LEVELS) >= 5


def test_LEVELS_BY_K_indexes_by_integer_value():
    for lv in LEVELS:
        assert LEVELS_BY_K[lv.k].k == lv.k


def test_gamma_exponent_for_known_regimes():
    assert gamma_exponent_for_regime("counting") == 0
    assert gamma_exponent_for_regime("gauge") == D
    assert gamma_exponent_for_regime("baryon") == q
    assert gamma_exponent_for_regime("EW") == D**2
    assert gamma_exponent_for_regime("cosmol_const") == (D + 1)**D
    assert gamma_exponent_for_regime("GUT") == -(math.factorial(D) + 1)


def test_unknown_regime_raises():
    with pytest.raises(KeyError):
        gamma_exponent_for_regime("nonsense")


def test_gamma_exponent_is_cathedral():
    for lv in LEVELS:
        assert gamma_exponent_is_cathedral(lv.k)
    assert not gamma_exponent_is_cathedral(42)


def test_OBSERVABLE_REGIME_all_known():
    """Every observable maps to a defined Cathedral level."""
    for name, regime in OBSERVABLE_REGIME.items():
        assert regime in LEVELS_BY_REGIME, f"observable {name} has unknown regime {regime}"


def test_gamma_exponent_for_observable_consistent():
    for name in OBSERVABLE_REGIME:
        k = gamma_exponent_for_observable(name)
        assert k is not None
        assert gamma_exponent_is_cathedral(k)


def test_gamma_exponent_dof_is_zero():
    """γ-exponent is structurally forced — 0 bits."""
    assert gamma_exponent_dof_per_slot_bits() == 0.0


def test_specific_observable_gamma_exponents():
    # Λ/M_Pl⁴ at the cosmological-constant level
    assert gamma_exponent_for_observable("Lambda/M_Pl^4") == 64
    # η_B at gauge level
    assert gamma_exponent_for_observable("eta_B") == 3
    # A_s at EW level
    assert gamma_exponent_for_observable("A_s") == 9
    # M_GUT at GUT level (negative)
    assert gamma_exponent_for_observable("M_GUT") == -7


def test_cathedral_levels_audit_passes():
    assert cathedral_levels_audit_passes()
