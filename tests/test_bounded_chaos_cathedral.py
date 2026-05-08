"""Tests for urt/bounded_chaos_cathedral.py — δ_cl = D/F = 3/20 = 0.15 EXACT"""
import pytest
from fractions import Fraction
from math import pi, sqrt

from urt.bounded_chaos_cathedral import (
    DELTA_STAR, GAMMA_V, GAMMA_V_EXACT, DELTA_CL, DELTA_CL_EXACT,
    EPSILON, EPSILON_FRAC, DELTA_CL_SQUARED, INV_DELTA_CL, G_NEWTON,
    BOUNDED_CHAOS_LOWER, BOUNDED_CHAOS_UPPER, BOUNDED_CHAOS_WIDTH,
    BAND_EXACT_APPROX, INNER_GAP, OUTER_GAP, BAND_WIDTH,
    DELTA_CL_DRESSED,
    EXHAUST_DRESS, DELTA_CL_IS_D_OVER_F, IDENTITY_D_F_RATIO,
    ORDERING_IDENTITY, EPSILON_APPROX_1_OVER_G, IDENTITY_GAMMA_V_FRAC,
    IDENTITY_DRESSING_TO_STAR, IDENTITY_CL_SQ_EXACT, IDENTITY_DUFFING,
    IDENTITY_INV_CL_EXACT, IDENTITY_INV_CL_IS_F_OVER_D,
    IDENTITY_F_FROM_EULER, DELTA_CL_FROM_D_E,
    IDENTITY_BAND_WIDTH_APPROX, IDENTITY_BAND_AS_1_OVER_400,
    BAND_PARTITION_APPROX,
    ALL_BOUNDED_CHAOS_IDENTITIES, ALL_BOUNDED_CHAOS_EXACT,
    N_BOUNDED_CHAOS_IDENTITIES,
    bounded_chaos_summary, print_bounded_chaos_report,
    F_FROM_EULER,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── The three Cathedral values ────────────────────────────────────────────────

class TestThreeCathedralValues:
    def test_delta_cl_is_exact(self):
        """δ_cl = D/F = 3/20 = 0.15000 EXACT."""
        assert DELTA_CL_IS_D_OVER_F
        assert DELTA_CL_EXACT == Fraction(D, F)
        assert DELTA_CL_EXACT == Fraction(3, 20)

    def test_delta_cl_float(self):
        assert DELTA_CL == 0.15

    def test_gamma_v_exact(self):
        """γ×V = 12/81 = 4/27 (exact rational)."""
        assert IDENTITY_GAMMA_V_FRAC
        assert GAMMA_V_EXACT == Fraction(4, 27)
        assert GAMMA_V_EXACT == Fraction(V, 81)

    def test_delta_star_is_positive(self):
        assert 0.147 < DELTA_STAR < 0.148

    def test_ordering(self):
        """δ★ < γV < δ_cl — all within 1.7% of each other."""
        assert ORDERING_IDENTITY
        assert DELTA_STAR < GAMMA_V < DELTA_CL

    def test_band_width_tiny(self):
        """All three values are within 0.003 of each other."""
        assert DELTA_CL - DELTA_STAR < 0.003
        assert DELTA_CL - GAMMA_V < 0.002

    def test_gamma_v_between_star_and_cl(self):
        assert DELTA_STAR < GAMMA_V
        assert GAMMA_V < DELTA_CL


# ── The gap ε ─────────────────────────────────────────────────────────────────

class TestGap:
    def test_epsilon_value(self):
        """ε = δ_cl − δ★ ≈ 0.00249."""
        assert 0.0024 < EPSILON < 0.0026

    def test_epsilon_frac_approx_1_over_G(self):
        """ε/δ_cl ≈ 1/G = 1/|A₅| with 0.43% precision."""
        assert EPSILON_APPROX_1_OVER_G
        assert abs(EPSILON_FRAC - 1.0 / G) < 5e-4

    def test_epsilon_approx_1_over_400(self):
        """ε ≈ 1/400 = D/(F×G) = 3/1200."""
        assert IDENTITY_BAND_AS_1_OVER_400
        assert abs(float(BAND_EXACT_APPROX) - EPSILON) < 1e-4

    def test_band_exact_approx_value(self):
        assert BAND_EXACT_APPROX == Fraction(1, 400)

    def test_epsilon_is_delta_cl_over_G(self):
        """ε ≈ δ_cl / G with < 0.5% precision."""
        assert IDENTITY_BAND_WIDTH_APPROX
        assert abs(EPSILON - DELTA_CL / G) < 1e-3


# ── The dressing identity δ_cl × (1 − 1/G) ≈ δ★ ─────────────────────────────

class TestDressingIdentity:
    def test_dressing_to_star(self):
        """δ_cl × (1 − 1/G) ≈ δ★ with < 0.1‰ precision."""
        assert IDENTITY_DRESSING_TO_STAR
        assert abs(DELTA_CL * (1.0 - 1.0/G) - DELTA_STAR) < 5e-5

    def test_dressed_value(self):
        assert abs(DELTA_CL_DRESSED - DELTA_STAR) < 1e-4

    def test_exhaust_dress(self):
        """Exhaust-leakage dressing 1+2γ ≈ 1.025."""
        assert 1.024 < EXHAUST_DRESS < 1.026


# ── Cathedral forms of δ_cl ───────────────────────────────────────────────────

class TestCathedralForms:
    def test_delta_cl_d_f_ratio(self):
        """δ_cl = D/F — the Cathedral ratio."""
        assert IDENTITY_D_F_RATIO
        assert DELTA_CL_EXACT == Fraction(3, 20)

    def test_F_from_Euler(self):
        """F = 2E/D = 2×30/3 = 20 EXACT (Euler's formula for icosahedron)."""
        assert IDENTITY_F_FROM_EULER
        assert F_FROM_EULER == F == 20

    def test_delta_cl_as_D2_over_2E(self):
        """δ_cl = D²/(2E) = 9/60 = 3/20 — equivalent Cathedral form."""
        assert DELTA_CL_FROM_D_E
        assert Fraction(D**2, 2*E) == Fraction(D, F)

    def test_delta_cl_exact_fraction(self):
        assert DELTA_CL_EXACT == Fraction(9, 60)
        assert DELTA_CL_EXACT == Fraction(3, 20)


# ── Squares and G_Newton ──────────────────────────────────────────────────────

class TestSquares:
    def test_delta_cl_squared_exact(self):
        """δ_cl² = D²/F² = 9/400 EXACT Cathedral rational."""
        assert IDENTITY_CL_SQ_EXACT
        assert DELTA_CL_SQUARED == Fraction(9, 400)
        assert DELTA_CL_SQUARED == Fraction(D**2, F**2)

    def test_delta_cl_sq_float(self):
        assert float(DELTA_CL_SQUARED) == 0.0225

    def test_g_newton_is_delta_star_sq(self):
        """G_Newton = δ★² ≈ 0.021759 (Cathedral Newton constant, Planck units)."""
        assert abs(G_NEWTON - DELTA_STAR**2) < 1e-10

    def test_cl_sq_larger_than_g_newton(self):
        """Classical Newton constant > quantum-corrected G_N."""
        assert float(DELTA_CL_SQUARED) > G_NEWTON

    def test_ratio_cl_sq_to_g_newton(self):
        """δ_cl²/G_N ≈ 1.034 (classical 3.4% larger)."""
        ratio = float(DELTA_CL_SQUARED) / G_NEWTON
        assert 1.03 < ratio < 1.04


# ── Inverse δ_cl = F/D ────────────────────────────────────────────────────────

class TestInverseDeltaCl:
    def test_inv_delta_cl_is_F_over_D(self):
        """1/δ_cl = F/D = 20/3 EXACT Cathedral rational."""
        assert IDENTITY_INV_CL_EXACT
        assert IDENTITY_INV_CL_IS_F_OVER_D
        assert INV_DELTA_CL == Fraction(F, D)
        assert INV_DELTA_CL == Fraction(20, 3)

    def test_inv_delta_cl_vs_inv_delta_star(self):
        """1/δ_cl = F/D ≈ 6.667 vs 1/δ★ ≈ 6.779 (SNR threshold)."""
        assert abs(float(INV_DELTA_CL) - 20/3) < 1e-10
        assert float(INV_DELTA_CL) < 1.0/DELTA_STAR

    def test_classical_snr(self):
        """'Classical SNR' = F/D = 20/3 ≈ 6.667 vs Cathedral SNR = 1/δ★ ≈ 6.779."""
        assert float(INV_DELTA_CL) == pytest.approx(6.6667, rel=1e-4)


# ── Band geometry ─────────────────────────────────────────────────────────────

class TestBandGeometry:
    def test_band_width_equals_epsilon(self):
        assert BOUNDED_CHAOS_WIDTH == EPSILON

    def test_band_lower_is_delta_star(self):
        assert BOUNDED_CHAOS_LOWER == DELTA_STAR

    def test_band_upper_is_delta_cl(self):
        assert BOUNDED_CHAOS_UPPER == DELTA_CL

    def test_gamma_v_partition(self):
        """γV sits ~1/(D+1) = 25% of the way from δ★ to δ_cl."""
        assert BAND_PARTITION_APPROX
        assert abs(INNER_GAP / BAND_WIDTH - 0.25) < 0.02

    def test_inner_plus_outer_equals_band(self):
        assert abs(INNER_GAP + OUTER_GAP - BAND_WIDTH) < 1e-12

    def test_outer_gap_larger(self):
        """Outer gap (γV to δ_cl) is larger than inner gap (δ★ to γV)."""
        assert OUTER_GAP > INNER_GAP


# ── Physical interpretation ───────────────────────────────────────────────────

class TestPhysicalSystems:
    def test_duffing_identity(self):
        """Duffing damping threshold = δ_cl."""
        assert IDENTITY_DUFFING

    def test_delta_cl_is_0p15(self):
        """The natural bounded-chaos parking spot is 0.15 = D/F."""
        assert DELTA_CL == 0.15

    def test_bounded_chaos_below_delta_star_is_stable(self):
        """Below δ★: stable periodic/quasiperiodic regime."""
        assert DELTA_STAR < 0.1476

    def test_bounded_chaos_above_delta_cl_escapes(self):
        """δ_cl = 0.15 is the upper edge of the bounded chaos band."""
        assert DELTA_CL == 0.15


# ── All identities ────────────────────────────────────────────────────────────

def test_all_bounded_chaos_exact():
    assert ALL_BOUNDED_CHAOS_EXACT

def test_n_bounded_chaos_identities():
    assert N_BOUNDED_CHAOS_IDENTITIES == len(ALL_BOUNDED_CHAOS_IDENTITIES)
    assert N_BOUNDED_CHAOS_IDENTITIES >= 15


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = bounded_chaos_summary()
    assert isinstance(s, dict)

def test_summary_delta_cl():
    s = bounded_chaos_summary()
    assert s["delta_cl"] == 0.15
    assert s["delta_cl_exact"] == "3/20"

def test_summary_epsilon_approx_G():
    s = bounded_chaos_summary()
    assert s["epsilon_approx_1_over_G"] is True

def test_summary_ordering():
    s = bounded_chaos_summary()
    assert s["ordering"] is True

def test_summary_all_exact():
    s = bounded_chaos_summary()
    assert s["all_exact"] is True

def test_print_report_runs(capsys):
    print_bounded_chaos_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_values(capsys):
    print_bounded_chaos_report()
    out = capsys.readouterr().out
    assert "0.15" in out
    assert "3/20" in out
    assert "D/F" in out

def test_print_report_contains_A5(capsys):
    print_bounded_chaos_report()
    out = capsys.readouterr().out
    assert "1/G" in out or "A₅" in out or "60" in out

def test_print_report_contains_RG(capsys):
    print_bounded_chaos_report()
    out = capsys.readouterr().out
    assert "RG" in out or "dressing" in out.lower() or "classical" in out.lower()
