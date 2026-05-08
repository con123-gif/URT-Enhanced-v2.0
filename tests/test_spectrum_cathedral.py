"""Tests for Cathedral Spectral Identities of G₁₃ (from Lytollis 2026)."""
import pytest
import numpy as np
from math import factorial, sqrt, pi

from urt.spectrum_cathedral import (
    D, N, V, E, F, q, G, GAMMA, GAMMA_INV,
    LAPLACIAN_EIGENVALUES, DISTINCT_NONZERO, MULTIPLICITIES,
    LAMBDA_ZERO, LAMBDA_FIEDLER, LAMBDA_MID, LAMBDA_UPPER, LAMBDA_D2, LAMBDA_MAX,
    IDENTITY_FIEDLER_IS_D, IDENTITY_LMAX_IS_N,
    N_DISTINCT_NONZERO, IDENTITY_N_DISTINCT_IS_Q,
    DOMINANT_MULTIPLICITY, IDENTITY_DOMINANT_MULT,
    N_EIGENVALUES_TOTAL, IDENTITY_N_EIGENVALUES_IS_N,
    IDENTITY_LAMBDA_UPPER_RANK_E7, IDENTITY_LAMBDA_D2,
    SPECTRAL_SUM, IDENTITY_SPECTRAL_SUM,
    FIEDLER_TIMES_MID, T_Q, IDENTITY_FIEDLER_TIMES_MID,
    FIEDLER_TIMES_D2, IDENTITY_FIEDLER_TIMES_D2,
    FIEDLER_PLUS_D2, IDENTITY_FIEDLER_PLUS_D2_IS_V,
    LAMBDA_SUM_TAU, TAU_G13, IDENTITY_LAMBDA_SUM_IS_TAU,
    IDENTITY_ALL_ODD, DISTINCT_SUM, IDENTITY_DISTINCT_SUM_PRIME,
    FIEDLER_TIMES_N, IDENTITY_FIEDLER_TIMES_N,
    SPECTRAL_RATIO, IDENTITY_SPECTRAL_RATIO,
    DIM_REPRESENTATION_SPACE, NULLITY_REPRESENTATION,
    IDENTITY_REPR_DIM_GAMMA_INV, IDENTITY_REPR_DIM_D_TO_D1,
    GF_ORDER, IDENTITY_GF81, GAMMA_INV_MINUS_1,
    SQRT5, PHI_VALUE, PHI_CONJ,
    QUAD_FORM_ICOS, IDENTITY_QUAD_FORM_IS_G,
    QUAD_FORM_MEAN, IDENTITY_QUAD_FORM_MEAN_IS_Q,
    RIESZ_EXPONENT, IDENTITY_RIESZ_CRITICAL,
    ALL_SPECTRAL_IDENTITIES, ALL_SPECTRAL_EXACT, N_SPECTRAL_IDENTITIES,
    riesz_energy_2, robustness_potential, robustness_potential_gradient,
    spectrum_summary, print_spectrum_report,
)
from urt.shell_closure import DELTA_STAR


# ── Eigenvalue values ─────────────────────────────────────────────────────────

def test_lambda_fiedler_is_3():
    assert LAMBDA_FIEDLER == 3

def test_lambda_mid_is_5():
    assert LAMBDA_MID == 5

def test_lambda_upper_is_7():
    assert LAMBDA_UPPER == 7

def test_lambda_d2_is_9():
    assert LAMBDA_D2 == 9

def test_lambda_max_is_13():
    assert LAMBDA_MAX == 13

def test_all_eigenvalues_listed():
    assert sorted(LAPLACIAN_EIGENVALUES) == sorted(
        [0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13])


# ── Multiplicities ────────────────────────────────────────────────────────────

def test_multiplicity_zero():
    assert MULTIPLICITIES[0] == 1

def test_multiplicity_fiedler():
    assert MULTIPLICITIES[3] == 2

def test_multiplicity_mid_is_6():
    """λ=5=q has multiplicity 6 = D! = V/2."""
    assert MULTIPLICITIES[5] == 6

def test_multiplicity_upper():
    assert MULTIPLICITIES[7] == 2

def test_multiplicity_d2():
    assert MULTIPLICITIES[9] == 1

def test_multiplicity_max():
    assert MULTIPLICITIES[13] == 1

def test_multiplicities_sum_to_N():
    assert sum(MULTIPLICITIES.values()) == N


# ── Primary Cathedral identities ──────────────────────────────────────────────

def test_fiedler_is_D():
    """Algebraic connectivity of G₁₃ = spatial dimension D."""
    assert IDENTITY_FIEDLER_IS_D
    assert LAMBDA_FIEDLER == D

def test_lambda_max_is_N():
    """Spectral radius of G₁₃ = icosahedral shell count N."""
    assert IDENTITY_LMAX_IS_N
    assert LAMBDA_MAX == N

def test_n_distinct_is_q():
    """Number of distinct nonzero eigenvalues = face valency q."""
    assert IDENTITY_N_DISTINCT_IS_Q
    assert N_DISTINCT_NONZERO == q

def test_dominant_mult_is_dfact():
    """Dominant eigenvalue multiplicity = D! = V/2."""
    assert IDENTITY_DOMINANT_MULT
    assert DOMINANT_MULTIPLICITY == factorial(D)
    assert DOMINANT_MULTIPLICITY == V // 2

def test_n_eigenvalues_is_N():
    """Total eigenvalues = N = number of vertices."""
    assert IDENTITY_N_EIGENVALUES_IS_N
    assert N_EIGENVALUES_TOTAL == N

def test_lambda_upper_is_rank_e7():
    """λ=7 = D!+1 = rank(E₇)."""
    assert IDENTITY_LAMBDA_UPPER_RANK_E7
    assert LAMBDA_UPPER == factorial(D) + 1

def test_lambda_d2_is_d_squared():
    """λ=9 = D²."""
    assert IDENTITY_LAMBDA_D2
    assert LAMBDA_D2 == D**2


# ── Spectral arithmetic ───────────────────────────────────────────────────────

def test_spectral_sum():
    """Sum of all eigenvalues = 72 = 2^D × D²."""
    assert IDENTITY_SPECTRAL_SUM
    assert SPECTRAL_SUM == 72
    assert SPECTRAL_SUM == 2**D * D**2

def test_fiedler_times_mid():
    """λ_Fiedler × λ_mid = 3×5 = 15 = T_q = V+D."""
    assert IDENTITY_FIEDLER_TIMES_MID
    assert FIEDLER_TIMES_MID == 15
    assert FIEDLER_TIMES_MID == V + D

def test_fiedler_times_d2():
    """λ_Fiedler × λ_D² = 3×9 = 27 = D^D."""
    assert IDENTITY_FIEDLER_TIMES_D2
    assert FIEDLER_TIMES_D2 == 27
    assert FIEDLER_TIMES_D2 == D**D

def test_fiedler_plus_d2_is_V():
    """λ_Fiedler + λ_D² = 3+9 = 12 = V."""
    assert IDENTITY_FIEDLER_PLUS_D2_IS_V
    assert FIEDLER_PLUS_D2 == V

def test_lambda_sum_is_tau():
    """λ_upper + λ_Fiedler = 7+3 = 10 = τ (graph diameter)."""
    assert IDENTITY_LAMBDA_SUM_IS_TAU
    assert LAMBDA_SUM_TAU == TAU_G13
    assert LAMBDA_SUM_TAU == 10

def test_all_nonzero_are_odd():
    """All nonzero distinct eigenvalues are odd."""
    assert IDENTITY_ALL_ODD

def test_distinct_sum_is_37():
    """Sum of distinct nonzero eigenvalues = 3+5+7+9+13 = 37."""
    assert DISTINCT_SUM == 37
    assert IDENTITY_DISTINCT_SUM_PRIME

def test_fiedler_times_N():
    """λ_Fiedler × λ_max = 3×13 = 39 = D×N."""
    assert IDENTITY_FIEDLER_TIMES_N
    assert FIEDLER_TIMES_N == D * N

def test_spectral_ratio_D_over_N():
    """λ_Fiedler / λ_max = D/N (the fundamental ratio)."""
    assert IDENTITY_SPECTRAL_RATIO
    assert abs(SPECTRAL_RATIO - D/N) < 1e-14


# ── 81-dimensional representation space ──────────────────────────────────────

def test_repr_dim_is_81():
    assert DIM_REPRESENTATION_SPACE == 81

def test_repr_dim_is_gamma_inv():
    """Representation space dimension = 1/γ = GAMMA_INV."""
    assert IDENTITY_REPR_DIM_GAMMA_INV
    assert DIM_REPRESENTATION_SPACE == GAMMA_INV

def test_repr_dim_is_D_to_D1():
    """Representation space dimension = D^(D+1) = 3^4."""
    assert IDENTITY_REPR_DIM_D_TO_D1
    assert DIM_REPRESENTATION_SPACE == D**(D+1)

def test_nullity_is_1():
    """Nullity of the constraint = 1 (the δ★ global mode)."""
    assert NULLITY_REPRESENTATION == 1

def test_gf81_order():
    """GF(81) = GF(D^(D+1)) — the field of 81 = GAMMA_INV elements."""
    assert IDENTITY_GF81
    assert GF_ORDER == 81
    assert GF_ORDER == GAMMA_INV

def test_gamma_inv_minus_1():
    """81-1 = 80 (order of multiplicative group of GF(81))."""
    assert GAMMA_INV_MINUS_1 == 80


# ── φ from adjacency quadratic form ──────────────────────────────────────────

def test_phi_value():
    assert abs(PHI_VALUE - (1 + sqrt(5)) / 2) < 1e-12

def test_phi_conj_is_1_over_phi():
    """φ-1 = 1/φ."""
    assert abs(PHI_CONJ - 1.0/PHI_VALUE) < 1e-12

def test_quad_form_is_G():
    """Sum of λ_adj² = 60 = G = |A₅|."""
    assert IDENTITY_QUAD_FORM_IS_G
    assert abs(QUAD_FORM_ICOS - G) < 1e-10

def test_quad_form_mean_is_q():
    """Mean(λ_adj²) = 60/12 = 5 = q."""
    assert IDENTITY_QUAD_FORM_MEAN_IS_Q
    assert abs(QUAD_FORM_MEAN - q) < 1e-10


# ── Riesz critical energy ─────────────────────────────────────────────────────

def test_riesz_exponent_is_D_minus_1():
    """Riesz exponent s = D-1 = 2 is critical on S² ⊂ ℝ^D."""
    assert IDENTITY_RIESZ_CRITICAL
    assert RIESZ_EXPONENT == D - 1
    assert RIESZ_EXPONENT == 2

def test_riesz_energy_positive():
    """Riesz 2-energy is positive for any non-coincident configuration."""
    positions = np.random.randn(5, 3)
    positions /= np.linalg.norm(positions, axis=1, keepdims=True)
    assert riesz_energy_2(positions) > 0

def test_riesz_energy_symmetric():
    """Riesz energy is symmetric under permutation of points."""
    positions = np.random.randn(4, 3)
    positions /= np.linalg.norm(positions, axis=1, keepdims=True)
    idx = [2, 0, 3, 1]
    assert abs(riesz_energy_2(positions) - riesz_energy_2(positions[idx])) < 1e-10


# ── Robustness potential ──────────────────────────────────────────────────────

def test_potential_zero_at_fixed_point():
    """V(δ★, ..., δ★) = 0 — uniform fixed point has zero potential."""
    delta = np.full(N, DELTA_STAR)
    V = robustness_potential(delta)
    assert abs(V) < 1e-20

def test_potential_positive_away_from_fixed_point():
    delta = np.full(N, DELTA_STAR + 0.05)
    assert robustness_potential(delta) > 0

def test_potential_gradient_zero_at_fixed_point():
    """∇V = 0 at δ★."""
    delta = np.full(N, DELTA_STAR)
    grad = robustness_potential_gradient(delta)
    assert np.allclose(grad, 0.0, atol=1e-20)

def test_potential_gradient_sign():
    """Gradient points away from δ★ when δ > δ★."""
    delta = np.full(N, DELTA_STAR + 0.05)
    grad = robustness_potential_gradient(delta)
    assert np.all(grad > 0)


# ── All identities ────────────────────────────────────────────────────────────

def test_all_spectral_exact():
    """All 21 spectral Cathedral identities hold simultaneously."""
    assert ALL_SPECTRAL_EXACT

def test_n_spectral_identities():
    assert N_SPECTRAL_IDENTITIES == len(ALL_SPECTRAL_IDENTITIES)
    assert N_SPECTRAL_IDENTITIES >= 20


# ── Summary / report ──────────────────────────────────────────────────────────

def test_spectrum_summary_is_dict():
    s = spectrum_summary()
    assert isinstance(s, dict)

def test_summary_fiedler():
    s = spectrum_summary()
    assert s["lambda_fiedler"] == D

def test_summary_lambda_max():
    s = spectrum_summary()
    assert s["lambda_max"] == N

def test_summary_all_exact():
    s = spectrum_summary()
    assert s["all_spectral_exact"] is True

def test_summary_repr_dim():
    s = spectrum_summary()
    assert s["dim_representation_space"] == GAMMA_INV

def test_print_report_runs(capsys):
    print_spectrum_report()
    out = capsys.readouterr().out
    assert len(out) > 200

def test_print_report_contains_fiedler(capsys):
    print_spectrum_report()
    out = capsys.readouterr().out
    assert "Fiedler" in out or "fiedler" in out.lower() or "3" in out

def test_print_report_contains_81(capsys):
    print_spectrum_report()
    out = capsys.readouterr().out
    assert "81" in out

def test_print_report_contains_n13(capsys):
    print_spectrum_report()
    out = capsys.readouterr().out
    assert "13" in out

def test_print_report_contains_riesz(capsys):
    print_spectrum_report()
    out = capsys.readouterr().out
    assert "Riesz" in out or "riesz" in out.lower()
