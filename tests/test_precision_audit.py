"""Tests for urt.precision_audit — Decimal-80 cross-check CI gate."""
import math
import pytest
import mpmath as mp
from urt.precision_audit import (
    cathedral_constants_mp,
    integer_identities_hold,
    cross_check_against_float64,
    precision_audit_passes,
)


def test_integer_identities_exact():
    """All five integer identities must hold exactly at Decimal-80."""
    res = integer_identities_hold(digits=80)
    assert all(res.values()), res


def test_alpha_inv_bare_exactly_137():
    c = cathedral_constants_mp(80)
    assert c["alpha_inv_bare"] == 137


def test_mp_me_int_exactly_1836():
    c = cathedral_constants_mp(80)
    assert c["mp_me_int"] == 1836


def test_deltaCP_exactly_197():
    c = cathedral_constants_mp(80)
    assert c["deltaCP"] == 197


def test_gamma_exactly_one_over_81():
    c = cathedral_constants_mp(80)
    assert c["gamma"] == mp.mpf(1) / 81


def test_cross_check_rows_finite():
    """Every cross-check row must have a finite rel-err."""
    for row in cross_check_against_float64():
        assert math.isfinite(row.rel_err)


def test_cross_check_within_1e_12():
    """All comparable constants agree to within 1e-12 between float-64 and Decimal-80."""
    for row in cross_check_against_float64():
        assert row.rel_err < 1e-12, (row.key, row.rel_err)


def test_precision_audit_passes():
    assert precision_audit_passes()


def test_higher_precision_still_passes():
    """Audit must still pass when the Decimal precision is bumped to 100."""
    res = integer_identities_hold(digits=100)
    assert all(res.values())
