from cathedral_core.constants import (
    D_STAR, D_CLASSICAL, DELTA, GAMMA, ALPHA_RESIDUE_INV,
)
from cathedral_core.entropy import (
    rho_star_diagonal, bkm_stiffness_over_kb,
)
from cathedral_core.urt import absorbing_bound, max_piecewise_fibre_derivative

def test_frozen_constants():
    assert abs(GAMMA - 1/81) < 1e-15
    assert abs(D_CLASSICAL - 0.15) < 1e-15
    assert abs(D_STAR - 0.14751081015957962) < 1e-14
    assert abs(DELTA - 0.002489189840420375) < 1e-14

def test_rho_trace():
    assert abs(sum(rho_star_diagonal()) - 1.0) < 1e-14

def test_piecewise_contraction():
    assert max_piecewise_fibre_derivative() < 1.0
    assert abs(absorbing_bound(0.0) - 0.8941015) < 1e-6

def test_internal_alpha_residue():
    assert abs(ALPHA_RESIDUE_INV - 137.035999178195) < 1e-9

def test_bkm_positive():
    assert bkm_stiffness_over_kb() > 0.0
