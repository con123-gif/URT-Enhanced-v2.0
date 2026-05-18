"""Foundations: the iron chain D = 3 → δ★."""
from math import pi, sqrt

import pytest

from newtons_cathedral.foundations import (
    D, DELTA, DELTA_CL, DELTA_STAR, E, F, G, GAMMA, N, PHI,
    cathedral_integers, foundations_audit, iron_chain, q, V,
)


def test_iron_chain_integers():
    assert (D, q, V, E, F, G, N) == (3, 5, 12, 30, 20, 60, 13)


def test_orbit_stabiliser_triple():
    # G = |A_5| = V·q = E·2 = F·D
    assert G == V * q == E * 2 == F * D


def test_centered_icosahedral_closure():
    assert N == D ** 2 + D + 1 == 13
    assert N == V + 1


def test_euler_characteristic_of_S2():
    assert V - E + F == 2


def test_k4_a5_sector_decomposition():
    # 13 = (D+1) + D² = 4 + 9
    assert (D + 1) + D ** 2 == N


def test_gamma_is_one_over_81():
    assert GAMMA == 1 / 81
    assert GAMMA == D ** (-(D + 1))


def test_golden_ratio_identity():
    # φ² = φ + 1
    assert abs(PHI * PHI - PHI - 1) < 1e-15
    assert abs(PHI - (1 + sqrt(5)) / 2) < 1e-15


def test_delta_star_closed_form():
    expected = (1 - GAMMA) * pi / (N * PHI)
    assert DELTA_STAR == expected
    # Match the canonical published value.
    assert abs(DELTA_STAR - 0.14751081015957962) < 1e-15


def test_delta_cl_rail():
    assert DELTA_CL == D / F == 0.15


def test_gap_is_small_and_positive():
    assert DELTA == DELTA_CL - DELTA_STAR
    assert 0 < DELTA < 1e-2


def test_cathedral_integers_dict():
    c = cathedral_integers()
    assert c["D"] == 3
    assert c["N"] == 13
    assert c["DELTA_STAR"] == DELTA_STAR


def test_iron_chain_returns_13_steps():
    chain = iron_chain()
    assert len(chain) == 13           # D + integers + γ + φ + δ★ + δ_cl + Δ


def test_audit_passes():
    assert foundations_audit()
