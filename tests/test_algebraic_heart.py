"""Tests for Algebraic Heart — 29 pure identities among Cathedral integers."""
import pytest
from math import factorial, pi

from urt.algebraic_heart import (
    D, N, V, E, F, q, G, GAMMA, GAMMA_INV,
    # booleans
    IDENTITY_Q_FROM_D, IDENTITY_N_PROJECTIVE, IDENTITY_N_CONSECUTIVE_SQ,
    IDENTITY_PYTHAGOREAN, PYTHAGOREAN_TRIPLE,
    IDENTITY_V_4D, IDENTITY_V_QSQ, IDENTITY_V_DD1, IDENTITY_V_THREE_FORMS,
    IDENTITY_E_MERSENNE, IDENTITY_E_10D,
    IDENTITY_G_2E, IDENTITY_G_DF, IDENTITY_G_QV, IDENTITY_G_20D,
    IDENTITY_F_FORMULA, IDENTITY_F_PLUS_V, F_PLUS_V,
    IDENTITY_G_MINUS_F, G_MINUS_F,
    IDENTITY_GAMMA_INV, IDENTITY_NQ, NQ_DIFF,
    IDENTITY_EULER_CHI, EULER_CHI,
    IDENTITY_CHECKSUM, CATHEDRAL_CHECKSUM,
    IDENTITY_D_FACTORIAL_HALF_V, D_FACTORIAL,
    IDENTITY_D_SQ, D_SQUARED, TWO_TO_D,
    IDENTITY_SO_D_SELF, DIM_SO_D,
    IDENTITY_G_TRIPLE_RATIO,
    IDENTITY_E8_ROOTS, E8_ROOTS,
    IDENTITY_E8_DIM, E8_DIM,
    IDENTITY_GV_FACTORIAL, GV_PRODUCT,
    IDENTITY_STRINGS,
    D_BOSONIC_STRING, D_SUPER_STRING, D_LEECH_LATTICE,
    ALL_TIER1_IDENTITIES, ALL_TIER2_IDENTITIES, ALL_IDENTITIES_EXACT,
    OMEGA_B_FRAC_INT_APPROX, OMEGA_B_FRAC_OBS, OMEGA_B_INT_ERR_PCT,
    OMEGA_M_INT, OMEGA_M_OBS, OMEGA_M_INT_ERR_PCT,
    SIN2_TW_INT, SIN2_TW_OBS, SIN2_TW_INT_ERR_PCT,
    ETA_B_INT, ETA_B_OBS, ETA_B_INT_ERR_PCT,
    ALPHA_S_INT, ALPHA_S_OBS, ALPHA_S_INT_ERR_PCT,
    LAMBDA_EXP_INT,
    D_UNIQUENESS,
    algebraic_summary, print_algebraic_report,
)


# ── Cathedral integers are correct ───────────────────────────────────────────

def test_cathedral_integers():
    assert D == 3 and N == 13 and V == 12 and E == 30
    assert F == 20 and q == 5 and G == 60

def test_gamma_is_1_over_81():
    assert abs(GAMMA - 1.0/81.0) < 1e-15
    assert GAMMA_INV == 81


# ── Tier-1: structural identities ────────────────────────────────────────────

def test_q_from_d():
    """q = 2D−1 = 5."""
    assert IDENTITY_Q_FROM_D
    assert q == 2*D - 1

def test_n_projective():
    """N = D²+D+1 (projective plane formula over F_D)."""
    assert IDENTITY_N_PROJECTIVE
    assert N == D**2 + D + 1

def test_n_consecutive_squares():
    """N = D² + (D−1)² — sum of two consecutive squares."""
    assert IDENTITY_N_CONSECUTIVE_SQ
    assert N == D**2 + (D-1)**2

def test_pythagorean_triple():
    """(q, V, N) = (5, 12, 13) is a Pythagorean triple."""
    assert IDENTITY_PYTHAGOREAN
    assert PYTHAGOREAN_TRIPLE == (5, 12, 13)
    assert q**2 + V**2 == N**2

def test_v_four_d():
    """V = 4D."""
    assert IDENTITY_V_4D
    assert V == 4 * D

def test_v_qsq():
    """V = (q²−1)/2."""
    assert IDENTITY_V_QSQ
    assert V == (q**2 - 1) // 2

def test_v_dd1():
    """V = D(D+1)."""
    assert IDENTITY_V_DD1
    assert V == D * (D+1)

def test_v_three_forms_simultaneously():
    """All three V-formulas are simultaneously equal — unique to D=3."""
    assert IDENTITY_V_THREE_FORMS
    assert V == 4*D == (q**2 - 1)//2 == D*(D+1)

def test_e_mersenne():
    """E = 2(2^(D+1) − 1)."""
    assert IDENTITY_E_MERSENNE
    assert E == 2 * (2**(D+1) - 1)

def test_e_10d():
    """E = 10D."""
    assert IDENTITY_E_10D

def test_g_2e():
    """G = 2E (group order = twice the edge count)."""
    assert IDENTITY_G_2E
    assert G == 2 * E

def test_g_df():
    """G = D·F."""
    assert IDENTITY_G_DF

def test_g_qv():
    """G = q·V."""
    assert IDENTITY_G_QV

def test_g_20d():
    """G = 20D."""
    assert IDENTITY_G_20D

def test_f_formula():
    """F = 2^(D+1) + D + 1."""
    assert IDENTITY_F_FORMULA
    assert F == 2**(D+1) + D + 1

def test_f_plus_v_is_2_to_q():
    """F + V = 2^q."""
    assert IDENTITY_F_PLUS_V
    assert F_PLUS_V == 32
    assert F_PLUS_V == 2**q

def test_g_minus_f():
    """G − F = 2^D·q = 40."""
    assert IDENTITY_G_MINUS_F
    assert G_MINUS_F == 40
    assert G_MINUS_F == 2**D * q

def test_gamma_inv_formula():
    """1/γ = N·q + 2^(D+1) = 81."""
    assert IDENTITY_GAMMA_INV
    assert GAMMA_INV == N * q + 2**(D+1)

def test_nq_formula():
    """N·q = D^(D+1) − 2^(D+1) = 65."""
    assert IDENTITY_NQ
    assert NQ_DIFF == 65
    assert N * q == NQ_DIFF

def test_euler_characteristic():
    """Euler characteristic χ = V − E + F = 2 = D−1."""
    assert IDENTITY_EULER_CHI
    assert EULER_CHI == 2
    assert EULER_CHI == D - 1

def test_cathedral_checksum():
    """D + N + V + E + F + q + G = 143 = N(N−2)."""
    assert IDENTITY_CHECKSUM
    assert CATHEDRAL_CHECKSUM == 143
    assert CATHEDRAL_CHECKSUM == N * (N - 2)

def test_all_tier1():
    """All 21 tier-1 identities pass."""
    assert all(ALL_TIER1_IDENTITIES)
    assert len(ALL_TIER1_IDENTITIES) == 21


# ── Tier-2: exceptional (unique to D=3) ──────────────────────────────────────

def test_d_factorial_half_v():
    """D! = V/2 — exactly 6 = 12/2."""
    assert IDENTITY_D_FACTORIAL_HALF_V
    assert D_FACTORIAL == 6
    assert D_FACTORIAL == V // 2

def test_d_squared_exceptional():
    """D² = 2^D + 1 — only true for D=3."""
    assert IDENTITY_D_SQ
    assert D_SQUARED == 9
    assert TWO_TO_D == 8
    assert D_SQUARED == TWO_TO_D + 1

def test_so_d_self_reference():
    """dim(SO(D)) = D(D−1)/2 = D — Lie algebra is self-referential at D=3."""
    assert IDENTITY_SO_D_SELF
    assert DIM_SO_D == 3
    assert DIM_SO_D == D

def test_g_triple_ratio():
    """G/D=F, G/q=V, G/E=D−1 simultaneously."""
    assert IDENTITY_G_TRIPLE_RATIO
    assert G // D == F
    assert G // q == V
    assert G // E == D - 1

def test_e8_roots():
    """2^D · E = 240 = number of E₈ roots."""
    assert IDENTITY_E8_ROOTS
    assert E8_ROOTS == 240

def test_e8_dim():
    """2^D · (2^q − 1) = 248 = dim(E₈)."""
    assert IDENTITY_E8_DIM
    assert E8_DIM == 248

def test_gv_factorial():
    """G · V = 720 = (V/2)! = 6!"""
    assert IDENTITY_GV_FACTORIAL
    assert GV_PRODUCT == 720
    assert GV_PRODUCT == factorial(V // 2)

def test_string_critical_dims():
    """2N=26 (bosonic), 2q=10 (super), 2V=24 (Leech lattice)."""
    assert IDENTITY_STRINGS
    assert D_BOSONIC_STRING == 26
    assert D_SUPER_STRING   == 10
    assert D_LEECH_LATTICE  == 24

def test_all_tier2():
    """All 8 tier-2 identities pass."""
    assert all(ALL_TIER2_IDENTITIES)
    assert len(ALL_TIER2_IDENTITIES) == 8


# ── Master truth ──────────────────────────────────────────────────────────────

def test_all_identities_exact():
    """Every single algebraic identity holds — the Cathedral is arithmetically closed."""
    assert ALL_IDENTITIES_EXACT


# ── Tier-3: physical accuracy ─────────────────────────────────────────────────

def test_omega_b_fraction_err():
    """δ★/D predicts Ω_b/Ω_m within 1%."""
    assert OMEGA_B_INT_ERR_PCT < 1.0

def test_omega_m_err():
    """(D+1)/N · (1+2γ) predicts Ω_m within 0.2%."""
    assert OMEGA_M_INT_ERR_PCT < 0.2

def test_sin2_theta_w_err():
    """D/N · (1+γ/2π) predicts sin²θ_W within 0.05%."""
    assert SIN2_TW_INT_ERR_PCT < 0.05

def test_sin2_theta_w_value():
    assert abs(SIN2_TW_INT - 0.23122) < 0.0001

def test_eta_b_err():
    """(q−D)·γ^q predicts η_B within 10%."""
    assert ETA_B_INT_ERR_PCT < 10.0

def test_eta_b_order_of_magnitude():
    """Baryon asymmetry is ~ 6×10⁻¹⁰."""
    assert 1e-10 < ETA_B_INT < 1e-9

def test_lambda_exp_is_64():
    """Cosmological constant exponent (D+1)^D = 64."""
    assert LAMBDA_EXP_INT == 64

def test_omega_b_frac_positive():
    assert OMEGA_B_FRAC_INT_APPROX > 0

def test_omega_m_positive():
    assert OMEGA_M_INT > 0.3


# ── Uniqueness ────────────────────────────────────────────────────────────────

def test_d2_fails_exceptional():
    """D=2 fails the tier-2 tests."""
    assert D_UNIQUENESS[2]["D_sq=2^D+1"] is False
    assert D_UNIQUENESS[2]["SO_self"] is False

def test_d4_fails_exceptional():
    """D=4 fails the tier-2 tests."""
    assert D_UNIQUENESS[4]["D_sq=2^D+1"] is False
    assert D_UNIQUENESS[4]["SO_self"] is False


# ── Summary functions ─────────────────────────────────────────────────────────

def test_algebraic_summary_is_dict():
    s = algebraic_summary()
    assert isinstance(s, dict)

def test_algebraic_summary_keys():
    s = algebraic_summary()
    for key in ["all_tier1_exact", "all_tier2_exact", "pythagorean_triple",
                "e8_roots", "e8_dim", "cathedral_checksum",
                "omega_m_err_pct", "sin2_tw_err_pct", "d_bosonic_string"]:
        assert key in s

def test_algebraic_summary_tier1_exact():
    assert algebraic_summary()["all_tier1_exact"] is True

def test_algebraic_summary_tier2_exact():
    assert algebraic_summary()["all_tier2_exact"] is True

def test_print_algebraic_report_runs(capsys):
    print_algebraic_report()
    out = capsys.readouterr().out
    assert "ALGEBRAIC HEART" in out or "algebraic" in out.lower()

def test_print_report_contains_pythagorean(capsys):
    print_algebraic_report()
    out = capsys.readouterr().out
    assert "Pythagorean" in out or "pythagorean" in out.lower() or "5,12,13" in out

def test_print_report_contains_e8(capsys):
    print_algebraic_report()
    out = capsys.readouterr().out
    assert "E₈" in out or "E8" in out or "248" in out

def test_print_report_contains_checksum(capsys):
    print_algebraic_report()
    out = capsys.readouterr().out
    assert "143" in out or "checksum" in out.lower()
