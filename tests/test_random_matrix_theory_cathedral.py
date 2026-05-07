"""Tests for urt/random_matrix_theory_cathedral.py — Dyson classes, Wigner semicircle, Cathedral integers."""

import pytest
from math import pi, sqrt, isclose, isfinite


# ── Import test ────────────────────────────────────────────────────────────────

def test_imports():
    from urt.random_matrix_theory_cathedral import (
        N_DYSON_CLASSES, N_DYSON_EQ_D,
        BETA_GOE, BETA_GOE_EQ_D2,
        BETA_GUE, BETA_GUE_EQ_D1,
        BETA_GSE, BETA_GSE_EQ_D1,
        BETA_PRODUCT, BETA_PRODUCT_EQ_2D,
        BETA_SUM, BETA_SUM_EQ_2D1,
        WIGNER_SEMICIRCLE_RADIUS, WIGNER_RADIUS_EQ_D1, WIGNER_DENSITY_MAX,
        N_CIRCULAR_ENSEMBLES, N_CIRCULAR_EQ_D,
        LARGEST_BETA, LARGEST_BETA_EQ_D1,
        MP_EDGE_GOE, MP_EDGE_GOE_EQ_D1,
        wigner_surmise_goe, wigner_surmise_gue, wigner_surmise_gse,
        wigner_semicircle_density,
        dyson_classes, wigner_semicircle, rmt_summary, print_rmt_report,
    )


# ── Dyson class count ──────────────────────────────────────────────────────────

def test_n_dyson_classes_eq_D():
    """Number of Dyson symmetry classes = D = 3."""
    from urt.random_matrix_theory_cathedral import N_DYSON_CLASSES, N_DYSON_EQ_D
    from urt.shell_closure import D
    assert N_DYSON_CLASSES == D
    assert N_DYSON_CLASSES == 3
    assert N_DYSON_EQ_D is True


# ── β parameters ──────────────────────────────────────────────────────────────

def test_beta_goe_eq_D2():
    """β_GOE = D-2 = 1 EXACT (orthogonal ensemble)."""
    from urt.random_matrix_theory_cathedral import BETA_GOE, BETA_GOE_EQ_D2
    from urt.shell_closure import D
    assert BETA_GOE == D - 2
    assert BETA_GOE == 1
    assert BETA_GOE_EQ_D2 is True


def test_beta_gue_eq_D1():
    """β_GUE = D-1 = 2 EXACT (unitary ensemble)."""
    from urt.random_matrix_theory_cathedral import BETA_GUE, BETA_GUE_EQ_D1
    from urt.shell_closure import D
    assert BETA_GUE == D - 1
    assert BETA_GUE == 2
    assert BETA_GUE_EQ_D1 is True


def test_beta_gse_eq_D1():
    """β_GSE = D+1 = 4 EXACT (symplectic ensemble)."""
    from urt.random_matrix_theory_cathedral import BETA_GSE, BETA_GSE_EQ_D1
    from urt.shell_closure import D
    assert BETA_GSE == D + 1
    assert BETA_GSE == 4
    assert BETA_GSE_EQ_D1 is True


def test_beta_values_are_1_2_4():
    """The three β values are exactly {1, 2, 4}."""
    from urt.random_matrix_theory_cathedral import BETA_GOE, BETA_GUE, BETA_GSE
    assert set([BETA_GOE, BETA_GUE, BETA_GSE]) == {1, 2, 4}


def test_beta_goe_lt_beta_gue_lt_beta_gse():
    """β_GOE < β_GUE < β_GSE (ordered by symmetry class)."""
    from urt.random_matrix_theory_cathedral import BETA_GOE, BETA_GUE, BETA_GSE
    assert BETA_GOE < BETA_GUE < BETA_GSE


# ── β product ─────────────────────────────────────────────────────────────────

def test_beta_product_eq_2_to_D():
    """β_GOE × β_GUE × β_GSE = 1×2×4 = 8 = 2^D EXACT."""
    from urt.random_matrix_theory_cathedral import BETA_PRODUCT, BETA_PRODUCT_EQ_2D
    from urt.shell_closure import D
    assert BETA_PRODUCT == 2**D
    assert BETA_PRODUCT == 8
    assert BETA_PRODUCT_EQ_2D is True


def test_beta_product_computed_correctly():
    """Product matches individual β values."""
    from urt.random_matrix_theory_cathedral import BETA_PRODUCT, BETA_GOE, BETA_GUE, BETA_GSE
    assert BETA_PRODUCT == BETA_GOE * BETA_GUE * BETA_GSE


# ── β sum ─────────────────────────────────────────────────────────────────────

def test_beta_sum_eq_2D_plus_1():
    """β_GOE + β_GUE + β_GSE = 1+2+4 = 7 = 2D+1 EXACT."""
    from urt.random_matrix_theory_cathedral import BETA_SUM, BETA_SUM_EQ_2D1
    from urt.shell_closure import D
    assert BETA_SUM == 2 * D + 1
    assert BETA_SUM == 7
    assert BETA_SUM_EQ_2D1 is True


def test_beta_sum_computed_correctly():
    """Sum matches individual β values."""
    from urt.random_matrix_theory_cathedral import BETA_SUM, BETA_GOE, BETA_GUE, BETA_GSE
    assert BETA_SUM == BETA_GOE + BETA_GUE + BETA_GSE


# ── Wigner semicircle radius ───────────────────────────────────────────────────

def test_wigner_semicircle_radius_eq_D1():
    """Wigner semicircle radius = D-1 = 2 EXACT (support [-2,2])."""
    from urt.random_matrix_theory_cathedral import WIGNER_SEMICIRCLE_RADIUS, WIGNER_RADIUS_EQ_D1
    from urt.shell_closure import D
    assert WIGNER_SEMICIRCLE_RADIUS == D - 1
    assert WIGNER_SEMICIRCLE_RADIUS == 2
    assert WIGNER_RADIUS_EQ_D1 is True


def test_wigner_density_max_positive():
    """Wigner semicircle peak density is positive and finite."""
    from urt.random_matrix_theory_cathedral import WIGNER_DENSITY_MAX, WIGNER_SEMICIRCLE_RADIUS
    assert WIGNER_DENSITY_MAX > 0
    assert isfinite(WIGNER_DENSITY_MAX)
    # ρ(0) = (2/πR²)×R = 2/(πR) with R=2: ρ(0) = 2/(2π) = 1/π ≈ 0.31831
    assert abs(WIGNER_DENSITY_MAX - 2.0 / (pi * WIGNER_SEMICIRCLE_RADIUS)) < 1e-12


def test_wigner_density_outside_support():
    """Wigner semicircle density is zero outside [-R, R]."""
    from urt.random_matrix_theory_cathedral import wigner_semicircle_density, WIGNER_SEMICIRCLE_RADIUS
    R = WIGNER_SEMICIRCLE_RADIUS
    assert wigner_semicircle_density(R + 0.1) == 0.0
    assert wigner_semicircle_density(-R - 0.5) == 0.0


def test_wigner_density_at_zero():
    """Wigner semicircle density at x=0 equals 2/(πR) [maximum value on support]."""
    from urt.random_matrix_theory_cathedral import wigner_semicircle_density, WIGNER_SEMICIRCLE_RADIUS
    R = WIGNER_SEMICIRCLE_RADIUS
    # ρ(0) = (2/πR²)√(R²-0²) = (2/πR²)×R = 2/(πR)
    expected = 2.0 / (pi * R)
    assert abs(wigner_semicircle_density(0.0) - expected) < 1e-12


def test_wigner_density_at_edge():
    """Wigner semicircle density is zero at the edge x=R."""
    from urt.random_matrix_theory_cathedral import wigner_semicircle_density, WIGNER_SEMICIRCLE_RADIUS
    R = WIGNER_SEMICIRCLE_RADIUS
    assert abs(wigner_semicircle_density(float(R))) < 1e-12


def test_wigner_density_nonnegative():
    """Wigner semicircle density is non-negative for x in [-R, R]."""
    from urt.random_matrix_theory_cathedral import wigner_semicircle_density, WIGNER_SEMICIRCLE_RADIUS
    R = WIGNER_SEMICIRCLE_RADIUS
    for x in [-1.5, -1.0, 0.0, 0.5, 1.0, 1.5]:
        assert wigner_semicircle_density(x) >= 0.0


# ── Circular ensembles ─────────────────────────────────────────────────────────

def test_n_circular_ensembles_eq_D():
    """Number of circular ensembles = D = 3 EXACT (COE, CUE, CSE)."""
    from urt.random_matrix_theory_cathedral import N_CIRCULAR_ENSEMBLES, N_CIRCULAR_EQ_D
    from urt.shell_closure import D
    assert N_CIRCULAR_ENSEMBLES == D
    assert N_CIRCULAR_ENSEMBLES == 3
    assert N_CIRCULAR_EQ_D is True


def test_largest_beta_eq_D_plus_1():
    """Largest β = D+1 = 4 = β_GSE EXACT."""
    from urt.random_matrix_theory_cathedral import LARGEST_BETA, LARGEST_BETA_EQ_D1, BETA_GSE
    from urt.shell_closure import D
    assert LARGEST_BETA == D + 1
    assert LARGEST_BETA == 4
    assert LARGEST_BETA == BETA_GSE
    assert LARGEST_BETA_EQ_D1 is True


# ── Marchenko-Pastur edge ─────────────────────────────────────────────────────

def test_mp_edge_goe_eq_D_plus_1():
    """Marchenko-Pastur GOE edge = (1+√1)² = 4 = D+1 EXACT."""
    from urt.random_matrix_theory_cathedral import MP_EDGE_GOE, MP_EDGE_GOE_EQ_D1
    from urt.shell_closure import D
    assert abs(MP_EDGE_GOE - (D + 1)) < 1e-12
    assert abs(MP_EDGE_GOE - 4.0) < 1e-12
    assert MP_EDGE_GOE_EQ_D1 is True


def test_mp_edge_formula():
    """MP edge = (1 + √β)²."""
    from urt.random_matrix_theory_cathedral import marchenko_pastur_edge, BETA_GOE, BETA_GUE, BETA_GSE
    assert abs(marchenko_pastur_edge(BETA_GOE) - (1 + sqrt(BETA_GOE))**2) < 1e-12
    assert abs(marchenko_pastur_edge(BETA_GUE) - (1 + sqrt(BETA_GUE))**2) < 1e-12
    assert abs(marchenko_pastur_edge(BETA_GSE) - (1 + sqrt(BETA_GSE))**2) < 1e-12


def test_mp_edges_ordered():
    """MP edges increase with β."""
    from urt.random_matrix_theory_cathedral import MP_EDGE_GOE, MP_EDGE_GUE, MP_EDGE_GSE
    assert MP_EDGE_GOE < MP_EDGE_GUE < MP_EDGE_GSE


# ── Wigner surmise functions ───────────────────────────────────────────────────

def test_wigner_surmise_goe_at_zero():
    """GOE Wigner surmise: P(0) = 0 (level repulsion)."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_goe
    assert abs(wigner_surmise_goe(0.0)) < 1e-15


def test_wigner_surmise_gue_at_zero():
    """GUE Wigner surmise: P(0) = 0 (level repulsion)."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_gue
    assert abs(wigner_surmise_gue(0.0)) < 1e-15


def test_wigner_surmise_gse_at_zero():
    """GSE Wigner surmise: P(0) = 0 (level repulsion)."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_gse
    assert abs(wigner_surmise_gse(0.0)) < 1e-15


def test_wigner_surmise_goe_positive():
    """GOE Wigner surmise is positive for s > 0."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_goe
    for s in [0.5, 1.0, 1.5]:
        assert wigner_surmise_goe(s) > 0.0


def test_wigner_surmise_gue_positive():
    """GUE Wigner surmise is positive for s > 0."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_gue
    for s in [0.5, 1.0, 1.5]:
        assert wigner_surmise_gue(s) > 0.0


def test_wigner_surmise_gse_positive():
    """GSE Wigner surmise is positive for s > 0."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_gse
    for s in [0.5, 1.0, 1.5]:
        assert wigner_surmise_gse(s) > 0.0


def test_wigner_surmise_power_law_goe():
    """GOE P(s) ~ s^β_GOE = s^1 for small s (linear repulsion)."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_goe, BETA_GOE
    # For small s, ratio P(2s)/P(s) ≈ 2^β_GOE = 2^1 = 2
    ratio = wigner_surmise_goe(0.01) / wigner_surmise_goe(0.005)
    assert abs(ratio - 2**BETA_GOE) < 0.01


def test_wigner_surmise_power_law_gue():
    """GUE P(s) ~ s^β_GUE = s^2 for small s (quadratic repulsion)."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_gue, BETA_GUE
    # For small s, ratio P(2s)/P(s) ≈ 2^β_GUE = 2^2 = 4
    ratio = wigner_surmise_gue(0.01) / wigner_surmise_gue(0.005)
    assert abs(ratio - 2**BETA_GUE) < 0.05


def test_wigner_surmise_power_law_gse():
    """GSE P(s) ~ s^β_GSE = s^4 for small s (quartic repulsion)."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_gse, BETA_GSE
    # For small s, ratio P(2s)/P(s) ≈ 2^β_GSE = 2^4 = 16
    ratio = wigner_surmise_gse(0.01) / wigner_surmise_gse(0.005)
    assert abs(ratio - 2**BETA_GSE) < 0.5


def test_wigner_surmise_decay_large_s():
    """All Wigner surmise distributions decay for large s."""
    from urt.random_matrix_theory_cathedral import wigner_surmise_goe, wigner_surmise_gue, wigner_surmise_gse
    for fn in [wigner_surmise_goe, wigner_surmise_gue, wigner_surmise_gse]:
        assert fn(5.0) < fn(2.0)
        assert fn(5.0) < 1e-3


# ── Function tests ─────────────────────────────────────────────────────────────

def test_dyson_classes_function():
    """dyson_classes() returns correct dict with all equalities True."""
    from urt.random_matrix_theory_cathedral import dyson_classes
    from urt.shell_closure import D
    r = dyson_classes()
    assert r["n_classes"] == D
    assert r["classes_eq_D"] is True
    assert r["beta_goe"] == 1
    assert r["beta_goe_eq_D2"] is True
    assert r["beta_gue"] == 2
    assert r["beta_gue_eq_D1"] is True
    assert r["beta_gse"] == 4
    assert r["beta_gse_eq_D1"] is True
    assert r["beta_product"] == 8
    assert r["beta_product_eq_2D"] is True
    assert r["beta_sum"] == 7
    assert r["beta_sum_eq_2D1"] is True


def test_wigner_semicircle_function():
    """wigner_semicircle() returns correct dict with all equalities True."""
    from urt.random_matrix_theory_cathedral import wigner_semicircle
    from urt.shell_closure import D
    r = wigner_semicircle()
    assert r["radius"] == D - 1
    assert r["radius"] == 2
    assert r["radius_eq_D1"] is True
    assert r["n_circular"] == D
    assert r["n_circular"] == 3
    assert r["circular_eq_D"] is True
    assert r["largest_beta"] == D + 1
    assert r["largest_beta"] == 4
    assert r["largest_eq_D1"] is True
    assert r["mp_edge_goe_eq_D1"] is True


def test_rmt_summary_structure():
    """rmt_summary() contains expected top-level keys."""
    from urt.random_matrix_theory_cathedral import rmt_summary
    r = rmt_summary()
    assert "dyson" in r
    assert "wigner" in r
    assert "KEY_EXACT_RESULTS" in r
    assert len(r["KEY_EXACT_RESULTS"]) >= 8


def test_rmt_summary_key_results_content():
    """KEY_EXACT_RESULTS contains EXACT and Cathedral identifiers."""
    from urt.random_matrix_theory_cathedral import rmt_summary
    r = rmt_summary()
    full_text = " ".join(r["KEY_EXACT_RESULTS"])
    assert "EXACT" in full_text
    assert "2^D" in full_text or "2^3" in full_text or "8" in full_text


def test_print_rmt_report(capsys):
    """print_rmt_report() produces substantial output with key numbers."""
    from urt.random_matrix_theory_cathedral import print_rmt_report
    print_rmt_report()
    out = capsys.readouterr().out
    assert "3" in out
    assert "EXACT" in out
    assert len(out) > 300


# ── Cross-checks ───────────────────────────────────────────────────────────────

def test_n_dyson_eq_n_circular():
    """Number of Dyson classes equals number of circular ensembles (both = D)."""
    from urt.random_matrix_theory_cathedral import N_DYSON_CLASSES, N_CIRCULAR_ENSEMBLES
    assert N_DYSON_CLASSES == N_CIRCULAR_ENSEMBLES


def test_largest_beta_eq_gse():
    """LARGEST_BETA equals BETA_GSE."""
    from urt.random_matrix_theory_cathedral import LARGEST_BETA, BETA_GSE
    assert LARGEST_BETA == BETA_GSE


def test_beta_product_is_power_of_two():
    """β product is a power of 2."""
    from urt.random_matrix_theory_cathedral import BETA_PRODUCT
    from math import log2
    log = log2(BETA_PRODUCT)
    assert abs(log - round(log)) < 1e-12


def test_wigner_radius_eq_beta_gue():
    """Wigner semicircle radius = β_GUE = D-1 = 2 (same Cathedral integer)."""
    from urt.random_matrix_theory_cathedral import WIGNER_SEMICIRCLE_RADIUS, BETA_GUE
    assert WIGNER_SEMICIRCLE_RADIUS == BETA_GUE
