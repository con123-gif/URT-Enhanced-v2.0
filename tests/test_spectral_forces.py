"""Tests for urt/spectral_forces.py — G₁₃ Laplacian spectrum and fundamental forces."""

import pytest
from math import pi, isclose, factorial


# ── Import guard ──────────────────────────────────────────────────────────────

def test_imports():
    from urt.spectral_forces import (
        EIGENVALUES, LAMBDA_FIEDLER, LAMBDA_MAX,
        SPECTRAL_RATIO, SIN2_TW_CATHEDRAL, SIN2_TW_PDG,
        IDENTITY_WEINBERG_FROM_SPECTRUM,
        ETA, KAPPA_ARF, IDENTITY_KAPPA_ARF,
        N_FUNDAMENTAL_FORCES, K4_ORDER, IDENTITY_FOUR_FORCES,
        FIEDLER_EQ_D, LAMBDA_MAX_EQ_N,
        SPECTRAL_PRODUCT_14, IDENTITY_SPECTRAL_D3,
        SPECTRAL_PRODUCT_13, DIM_B3, IDENTITY_SO7,
        SPECTRAL_SUM_13, GRAPH_DIAMETER, IDENTITY_GRAPH_DIAMETER,
        G_NEWTON_CATHEDRAL, ALPHA_S_MZ, LAMBDA_CC_COUPLING,
        weinberg_from_spectrum, force_coupling_hierarchy,
        k4_force_decomposition, arf_convergence_rate,
        spectral_forces_summary, print_spectral_forces_report,
    )


# ── Eigenvalue spectrum ───────────────────────────────────────────────────────

def test_eigenvalues_list():
    from urt.spectral_forces import EIGENVALUES
    assert EIGENVALUES == [3, 5, 7, 9, 13]


def test_lambda_fiedler():
    from urt.spectral_forces import LAMBDA_FIEDLER
    assert LAMBDA_FIEDLER == 3


def test_lambda_max():
    from urt.spectral_forces import LAMBDA_MAX
    assert LAMBDA_MAX == 13


def test_fiedler_eq_D():
    from urt.spectral_forces import LAMBDA_FIEDLER, FIEDLER_EQ_D
    from urt.shell_closure import D
    assert LAMBDA_FIEDLER == D
    assert FIEDLER_EQ_D is True


def test_lambda_max_eq_N():
    from urt.spectral_forces import LAMBDA_MAX, LAMBDA_MAX_EQ_N
    from urt.shell_closure import N
    assert LAMBDA_MAX == N
    assert LAMBDA_MAX_EQ_N is True


# ── Weinberg angle from spectral ratio ───────────────────────────────────────

def test_spectral_ratio_value():
    from urt.spectral_forces import SPECTRAL_RATIO
    from urt.shell_closure import D, N
    assert isclose(SPECTRAL_RATIO, D / N, rel_tol=1e-12)


def test_spectral_ratio_is_D_over_N():
    from urt.spectral_forces import SPECTRAL_RATIO
    assert isclose(SPECTRAL_RATIO, 3 / 13, rel_tol=1e-12)


def test_sin2_tw_cathedral_value():
    """sin²θ_W = (D/N)(1+γ/(2π)) ≈ 0.23122."""
    from urt.spectral_forces import SIN2_TW_CATHEDRAL
    from urt.shell_closure import D, N, gamma
    expected = (D / N) * (1.0 + gamma / (2.0 * pi))
    assert isclose(SIN2_TW_CATHEDRAL, expected, rel_tol=1e-12)


def test_sin2_tw_pdg_value():
    from urt.spectral_forces import SIN2_TW_PDG
    assert isclose(SIN2_TW_PDG, 0.23122, rel_tol=1e-6)


def test_sin2_tw_within_01pct_of_pdg():
    """sin²θ_W Cathedral within 0.1% of PDG."""
    from urt.spectral_forces import SIN2_TW_CATHEDRAL, SIN2_TW_PDG
    error_pct = abs(SIN2_TW_CATHEDRAL - SIN2_TW_PDG) / SIN2_TW_PDG * 100
    assert error_pct < 0.1


def test_identity_weinberg_from_spectrum():
    from urt.spectral_forces import IDENTITY_WEINBERG_FROM_SPECTRUM
    assert IDENTITY_WEINBERG_FROM_SPECTRUM is True


def test_weinberg_from_spectrum_function():
    from urt.spectral_forces import weinberg_from_spectrum
    w = weinberg_from_spectrum()
    assert isclose(w["spectral_ratio"], 3 / 13, rel_tol=1e-12)
    assert isclose(w["sin2_tw_cathedral"], w["sin2_tw_pdg"], rel_tol=1e-3)
    assert w["error_pct"] < 0.1
    assert w["identity_weinberg_from_spectrum"] is True
    assert w["lambda_fiedler"] == 3
    assert w["lambda_max"] == 13


# ── ARF convergence rate ──────────────────────────────────────────────────────

def test_eta_value():
    """η = 1/(8π)."""
    from urt.spectral_forces import ETA
    assert isclose(ETA, 1.0 / (8.0 * pi), rel_tol=1e-12)


def test_kappa_arf_formula():
    """κ_ARF = 1 − 3/(4π)."""
    from urt.spectral_forces import KAPPA_ARF
    expected = 1.0 - 3.0 / (4.0 * pi)
    assert isclose(KAPPA_ARF, expected, rel_tol=1e-12)


def test_kappa_arf_approx_value():
    """κ_ARF ≈ 0.761 (three significant figures)."""
    from urt.spectral_forces import KAPPA_ARF
    assert isclose(KAPPA_ARF, 0.761, rel_tol=1e-2)


def test_kappa_arf_in_unit_interval():
    from urt.spectral_forces import KAPPA_ARF
    assert 0.0 < KAPPA_ARF < 1.0


def test_identity_kappa_arf():
    from urt.spectral_forces import IDENTITY_KAPPA_ARF
    assert IDENTITY_KAPPA_ARF is True


def test_arf_convergence_rate_function():
    from urt.spectral_forces import arf_convergence_rate, KAPPA_ARF
    assert isclose(arf_convergence_rate(), KAPPA_ARF, rel_tol=1e-12)


# ── Four forces = K4 decomposition ───────────────────────────────────────────

def test_n_fundamental_forces():
    from urt.spectral_forces import N_FUNDAMENTAL_FORCES
    assert N_FUNDAMENTAL_FORCES == 4


def test_n_fundamental_forces_eq_D_plus_1():
    from urt.spectral_forces import N_FUNDAMENTAL_FORCES
    from urt.shell_closure import D
    assert N_FUNDAMENTAL_FORCES == D + 1


def test_k4_order():
    from urt.spectral_forces import K4_ORDER
    assert K4_ORDER == 4


def test_identity_four_forces():
    from urt.spectral_forces import IDENTITY_FOUR_FORCES
    assert IDENTITY_FOUR_FORCES is True


def test_k4_force_decomposition_function():
    from urt.spectral_forces import k4_force_decomposition
    kd = k4_force_decomposition()
    assert kd["k4_order"] == 4
    assert kd["n_fundamental_forces"] == 4
    assert kd["identity_four_forces"] is True
    assert len(kd["force_map"]) == 4
    assert "identity" in kd["force_map"]
    assert kd["spectral_gap_eq_D"] is True
    assert kd["lambda_max_eq_N"] is True


# ── Spectral coupling ratios ──────────────────────────────────────────────────

def test_spectral_product_14_eq_D3():
    """λ₁×λ₄ = 3×9 = 27 = D^D."""
    from urt.spectral_forces import SPECTRAL_PRODUCT_14, IDENTITY_SPECTRAL_D3
    from urt.shell_closure import D
    assert SPECTRAL_PRODUCT_14 == D**D
    assert SPECTRAL_PRODUCT_14 == 27
    assert IDENTITY_SPECTRAL_D3 is True


def test_spectral_product_13_eq_dim_B3():
    """λ₁×λ₃ = 3×7 = 21 = dim(SO(7))."""
    from urt.spectral_forces import SPECTRAL_PRODUCT_13, DIM_B3, IDENTITY_SO7
    assert SPECTRAL_PRODUCT_13 == 21
    assert DIM_B3 == 21
    assert IDENTITY_SO7 is True


def test_spectral_sum_13_eq_graph_diameter():
    """λ₁+λ₃ = 3+7 = 10 = graph diameter."""
    from urt.spectral_forces import SPECTRAL_SUM_13, GRAPH_DIAMETER, IDENTITY_GRAPH_DIAMETER
    assert SPECTRAL_SUM_13 == 10
    assert GRAPH_DIAMETER == 10
    assert IDENTITY_GRAPH_DIAMETER is True


# ── Coupling constants ────────────────────────────────────────────────────────

def test_G_newton_cathedral():
    """G_N = δ★²."""
    from urt.spectral_forces import G_NEWTON_CATHEDRAL
    from urt.shell_closure import DELTA_STAR
    assert isclose(G_NEWTON_CATHEDRAL, DELTA_STAR**2, rel_tol=1e-12)


def test_alpha_s_MZ():
    """α_s(M_Z) = δ★·(q−1)/q ≈ 0.118."""
    from urt.spectral_forces import ALPHA_S_MZ
    from urt.shell_closure import DELTA_STAR, q
    expected = DELTA_STAR * (q - 1) / q
    assert isclose(ALPHA_S_MZ, expected, rel_tol=1e-12)
    # Should be in reasonable range for strong coupling
    assert 0.10 < ALPHA_S_MZ < 0.14


# ── force_coupling_hierarchy function ────────────────────────────────────────

def test_force_coupling_hierarchy_structure():
    from urt.spectral_forces import force_coupling_hierarchy
    fch = force_coupling_hierarchy()
    assert fch["n_forces"] == 4
    assert "gravity" in fch
    assert "electroweak" in fch
    assert "strong" in fch
    assert "cosmological" in fch


def test_force_coupling_hierarchy_weinberg():
    from urt.spectral_forces import force_coupling_hierarchy, SIN2_TW_CATHEDRAL
    fch = force_coupling_hierarchy()
    assert isclose(fch["electroweak"]["sin2_theta_W"], SIN2_TW_CATHEDRAL, rel_tol=1e-12)


# ── Summary ───────────────────────────────────────────────────────────────────

def test_spectral_forces_summary_keys():
    from urt.spectral_forces import spectral_forces_summary
    s = spectral_forces_summary()
    required = [
        "D", "N", "V", "q", "G", "gamma", "GAMMA_INV", "delta_star",
        "eigenvalues", "lambda_fiedler", "lambda_max",
        "fiedler_eq_D", "lambda_max_eq_N",
        "spectral_ratio", "sin2_tw_cathedral", "sin2_tw_pdg",
        "sin2_tw_error_pct", "identity_weinberg_from_spectrum",
        "eta", "kappa_arf", "kappa_arf_exact", "identity_kappa_arf",
        "n_fundamental_forces", "k4_order", "identity_four_forces",
        "spectral_product_14", "D_to_D", "identity_spectral_D3",
        "spectral_product_13", "dim_B3", "identity_so7",
        "spectral_sum_13", "graph_diameter", "identity_graph_diameter",
        "G_newton", "alpha_em", "alpha_s_MZ", "lambda_cc",
    ]
    for key in required:
        assert key in s, f"Missing key: {key}"


def test_spectral_forces_summary_all_identities_true():
    from urt.spectral_forces import spectral_forces_summary
    s = spectral_forces_summary()
    assert s["fiedler_eq_D"] is True
    assert s["lambda_max_eq_N"] is True
    assert s["identity_weinberg_from_spectrum"] is True
    assert s["identity_kappa_arf"] is True
    assert s["identity_four_forces"] is True
    assert s["identity_spectral_D3"] is True
    assert s["identity_so7"] is True
    assert s["identity_graph_diameter"] is True


def test_print_spectral_forces_report_runs():
    """print_spectral_forces_report should execute without error."""
    from urt.spectral_forces import print_spectral_forces_report
    print_spectral_forces_report()
