"""Tests for urt.logistic_verification — δ★ on logistic 6-cycle."""

import pytest
from urt.logistic_verification import (
    verify_delta_star_logistic,
    DELTA_STAR_THEORY,
    six_cycle_branches,
    lyapunov_logistic,
)


def test_delta_star_theory_value():
    """DELTA_STAR_THEORY must match the icosahedral formula."""
    from math import pi
    phi = (1 + 5 ** 0.5) / 2
    expected = (1 - 1/81) * pi / (13 * phi)
    assert abs(DELTA_STAR_THEORY - expected) < 1e-15


def test_six_cycle_period():
    """Logistic orbit at r★ must have period 6."""
    result = verify_delta_star_logistic()
    assert result.period == 6


def test_six_cycle_minimum_matches_delta_star():
    """Minimum branch of 6-cycle must be within 1e-3 of δ★."""
    result = verify_delta_star_logistic()
    assert result.residual < 1e-3


def test_lyapunov_is_negative():
    """Lyapunov exponent at r★ must be strictly negative (stable orbit)."""
    result = verify_delta_star_logistic()
    assert result.lyapunov < 0


def test_lyapunov_value():
    """λ ≈ −0.011275 at r★."""
    lam = lyapunov_logistic(3.8417002878419497)
    assert abs(lam - (-0.011275)) < 5e-4


def test_verification_flag():
    """verify flag must be True for tolerance 1e-3."""
    result = verify_delta_star_logistic(tol=1e-3)
    assert result.verified


def test_six_branches_count():
    """Must find exactly 6 distinct branches."""
    branches = six_cycle_branches()
    assert len(branches) == 6


def test_branches_all_in_unit_interval():
    """All 6-cycle branches must lie in (0, 1)."""
    branches = six_cycle_branches()
    for b in branches:
        assert 0 < b < 1
