"""π-φ-e flow on G_{13}: convergence and Cathedral closed forms."""
from math import pi

import numpy as np

from newtons_cathedral.dynamics import (
    DYNAMICAL_NORMALISATION, ETA, ETA_L, MU, cathedral_potential,
    dynamics_audit, mixing_time, urt_evolve, urt_step,
)
from newtons_cathedral.foundations import D, DELTA_STAR, N, PHI, q


def test_eta_is_one_over_8pi():
    assert ETA == 1 / (8 * pi)


def test_eta_L_is_one_over_4pi():
    assert ETA_L == 1 / (4 * pi)


def test_mu_is_phi_minus_one():
    # φ − 1 = 1/φ
    assert abs(MU - (PHI - 1)) < 1e-15
    assert abs(MU - 1 / PHI) < 1e-15


def test_dynamical_normalisation_is_2q_pi_sq():
    assert abs(DYNAMICAL_NORMALISATION - 2 ** q * pi ** 2) < 1e-12


def test_fixed_point_is_no_op():
    delta_fp = DELTA_STAR * np.ones(N)
    next_step = urt_step(delta_fp)
    # δ★·𝟙 is an exact fixed point.
    assert np.max(np.abs(next_step - delta_fp)) < 1e-14


def test_random_chaos_converges_to_delta_star():
    rng = np.random.default_rng(0)
    x0 = rng.uniform(0.0, 0.5, size=N)
    xT = urt_evolve(x0, steps=1500)
    # Variance collapse + pull → uniform δ★.
    assert np.max(np.abs(xT - DELTA_STAR)) < 5e-3


def test_mixing_time_ratio_purely_cathedral():
    # τ_D / τ_N = N/D, transcendentals cancel.
    ratio = mixing_time(D) / mixing_time(N)
    assert abs(ratio - N / D) < 1e-12


def test_potential_minimum_at_delta_star():
    # Random configurations have higher potential than uniform δ★.
    rng = np.random.default_rng(1)
    delta_fp = DELTA_STAR * np.ones(N)
    V_fp = cathedral_potential(delta_fp)
    for _ in range(20):
        x = DELTA_STAR + 0.01 * rng.normal(size=N)
        assert cathedral_potential(x) > V_fp


def test_audit_passes():
    assert dynamics_audit()
