"""Tests for urt.riemann_zero_solver — Hardy-Z bracket refinement."""
import pytest
from urt.riemann_zero_solver import (
    first_n_zeros,
    CANONICAL_ZEROS_FIRST_10,
    riemann_zero_audit_passes,
    hardy_Z,
)


def test_first_zero_matches_canonical():
    zs = first_n_zeros(1, digits=30)
    assert abs(float(zs[0]) - CANONICAL_ZEROS_FIRST_10[0]) < 1e-8


def test_first_five_zeros_match_canonical():
    zs = first_n_zeros(5, digits=30)
    for computed, canonical in zip(zs, CANONICAL_ZEROS_FIRST_10[:5]):
        assert abs(float(computed) - canonical) < 1e-8


def test_zeros_are_strictly_increasing():
    zs = first_n_zeros(5, digits=30)
    for i in range(len(zs) - 1):
        assert zs[i] < zs[i + 1]


def test_hardy_Z_changes_sign_near_first_zero():
    """Hardy Z should change sign across t = 14.1347."""
    z_left  = hardy_Z(14.0)
    z_right = hardy_Z(14.3)
    assert z_left * z_right < 0


def test_audit_passes_n_5():
    assert riemann_zero_audit_passes(n=5)
