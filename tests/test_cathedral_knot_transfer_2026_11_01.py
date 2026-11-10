"""Regression checks for the 2026-11-01 Cathedral transfer/knot theorem.

These tests check its *algebraic premises*. They cannot replace the analytic
ambient-isotopy proof, and do not imply physical Lorenz-knot production.
"""
from math import isclose

from cathedral_core.constants import DELTA, PHI, D_CLASSICAL, D_STAR


def _matmul(A, B):
    return tuple(
        tuple(sum(A[i][k] * B[k][j] for k in range(3)) for j in range(3))
        for i in range(3)
    )


def _matrix_power(A, n):
    ans = ((1., 0., 0.), (0., 1., 0.), (0., 0., 1.))
    for _ in range(n):
        ans = _matmul(ans, A)
    return ans


def test_gap_is_frozen_and_positive():
    assert PHI > 8 / 5
    assert 0 < DELTA < 1
    assert isclose(DELTA, D_CLASSICAL - D_STAR, abs_tol=1e-15)
    assert isclose(DELTA, 3 / 20 - 80 * __import__("math").pi / (1053 * PHI),
                   abs_tol=1e-15)


def test_projection_relations_and_powers():
    P_c = ((1., 0., 0.), (0., 0., 0.), (0., 0., 0.))
    P_r = ((0., 0., 0.), (0., 1., 0.), (0., 0., 1.))
    assert _matmul(P_c, P_c) == P_c
    assert _matmul(P_r, P_r) == P_r
    assert _matmul(P_c, P_r) == _matmul(P_r, P_c) == ((0.,)*3,)*3
    B = ((1., 0., 0.), (0., DELTA, 0.), (0., 0., DELTA))
    for n in (1, 2, 3, 24):
        actual = _matrix_power(B, n)
        expected = ((1., 0., 0.), (0., DELTA**n, 0.), (0., 0., DELTA**n))
        for i in range(3):
            for j in range(3):
                assert isclose(actual[i][j], expected[i][j],
                               rel_tol=2e-14, abs_tol=0)


def test_isotopy_stays_invertible():
    for n in (1, 2, 24):
        for k in range(101):
            s = k / 100
            a = (1 - s) + s * DELTA**n
            assert a > 0
            assert a * a > 0


def test_24_transfer_determinant_and_amplitude():
    # Reference values are exact (60-digit decimal arithmetic):
    #   Delta^24 = 3.201787273419910e-63,  Delta^48 = 1.025144174423370e-125.
    # (The earlier constants 3.20178727342021e-63 / 1.02514417442356e-125 came from one
    # particular float evaluation and are wrong from the 12th significant digit.)
    # Delta = 3/20 - 80*pi/(1053*phi) cancels ~1.8 digits: ~7 roundings in delta_star,
    # magnified by delta_star/Delta ~ 59, bound the float Delta's relative error by
    # ~5.3e-14, hence Delta^n by n*5.3e-14. The tolerances are that bound, not a fit.
    assert isclose(DELTA**24, 3.201787273419910e-63, rel_tol=1.5e-12)
    assert isclose(DELTA**48, 1.025144174423370e-125, rel_tol=3e-12)
    assert isclose((DELTA**24)**2, DELTA**48, rel_tol=1e-14)
