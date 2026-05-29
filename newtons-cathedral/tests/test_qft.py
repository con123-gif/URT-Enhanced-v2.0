"""QFT on G_{13}: pole masses, propagators, one-loop finiteness."""
from math import pi

import numpy as np

from newtons_cathedral.foundations import DELTA_STAR, N
from newtons_cathedral.qft import (
    LAMBDA_SQ_MATCH_OVER_MPL_SQ, cubic_coupling_tensor,
    functional_determinant, hessian, pole_masses, propagator, qft_audit,
)


def test_thirteen_pole_masses():
    m = pole_masses()
    assert m.shape == (N,)
    assert np.all(m > 0)


def test_lightest_mode_is_one_plus_delta_star_sq():
    m = pole_masses()
    assert abs(m[0] ** 2 - (1.0 + DELTA_STAR ** 2)) < 1e-12


def test_heaviest_mode_eigenvalue_N():
    m = pole_masses()
    assert abs(m[-1] ** 2 - (1.0 + DELTA_STAR ** 2 + N)) < 1e-10


def test_propagator_pole_structure():
    """Off-pole: G is finite.  Far from pole: |G| ~ 1/p²."""
    m = pole_masses()
    G_far = propagator(1000.0, k=0)
    G_near = propagator(float(m[0] ** 2 * 2.0), k=0)
    # |G_far| < |G_near|: propagator falls off at large p².
    assert abs(G_far) < abs(G_near)


def test_cubic_tensor_symmetric():
    W = cubic_coupling_tensor()
    assert np.allclose(W, W.transpose(1, 0, 2))
    assert np.allclose(W, W.transpose(0, 2, 1))


def test_functional_determinant_cathedral_form():
    """det' L = γ⁻¹ · q^(D!) · (D!+1)² · N = 81·15625·49·13 = 806,203,125."""
    det = functional_determinant()
    assert abs(det - 806_203_125) / 806_203_125 < 1e-9


def test_matching_scale_is_6pi():
    assert LAMBDA_SQ_MATCH_OVER_MPL_SQ == 6.0 * pi


def test_audit_passes():
    assert qft_audit()
