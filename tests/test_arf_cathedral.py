"""Tests for urt/arf_cathedral.py — ARF Cathedral integer structure."""
import pytest
from fractions import Fraction
from math import factorial, pi, log

from urt.arf_cathedral import (
    BARE_ALPHA_INV, BARE_ALPHA_INV_EXACT, ALPHA_N_SQ, ALPHA_MINUS_E,
    D64, D63, D79, D35, D51,
    D35_FACTORED, R_ALPHA,
    MP_ME_INTEGER, MP_ME_INT_FACTOR1, MP_ME_INT_FACTOR2, MP_ME_INT_FACTOR3,
    MP_ME_108, MP_ME_FACTOR3_IS_PRIME,
    MU_E_BARE, N_PLUS_D, N_PLUS_D_IS_2_D1,
    SIN2_TW_BARE_FRAC, SIN2_TW_BARE, SIN2_TW_FULL, SIN2_TW_CORRECTION,
    ALPHA_S_FRACTION, ALPHA_S,
    GAMMA_EXP_GAUGE, GAMMA_EXP_BARYON, GAMMA_EXP_EW, GAMMA_EXP_CC, GAMMA_EXP_GUT,
    LAMBDA_PREFACTOR, LAMBDA_EXPONENT, LAMBDA_OVER_MPL4,
    N_E_EFOLDS, N_S, R_TENSOR, OMEGA_M, OMEGA_M_FRAC,
    IDENTITY_BARE_ALPHA_137, IDENTITY_BARE_ALPHA_EXACT,
    IDENTITY_ALPHA_FROM_N2_E_D, IDENTITY_ALPHA_FROM_VQ,
    IDENTITY_D64_IS_D1_TO_D, IDENTITY_D63_IS_G_PLUS_D,
    IDENTITY_D35_IS_E_PLUS_q, IDENTITY_D35_FACTORS,
    IDENTITY_MP_ME_1836, IDENTITY_MP_ME_FACTORS,
    IDENTITY_MP_ME_FACTOR2_SELF_REF, IDENTITY_MP_ME_FACTOR3_PRIME,
    IDENTITY_MU_E_BARE, IDENTITY_N_PLUS_D_IS_2_DP1,
    IDENTITY_SIN2_TW_IS_D_OVER_N, IDENTITY_SIN2_TW_PRECISE,
    IDENTITY_ALPHA_S_FRAC, IDENTITY_ALPHA_S_VAL,
    IDENTITY_GAMMA_EXP_GAUGE_IS_D, IDENTITY_GAMMA_EXP_BARYON_IS_q,
    IDENTITY_GAMMA_EXP_EW_IS_D_SQ, IDENTITY_GAMMA_EXP_CC_IS_D1D,
    IDENTITY_GAMMA_EXP_GUT_IS_DF1,
    IDENTITY_LAMBDA_EXPO_CATHEDRAL, IDENTITY_LAMBDA_PREFACTOR,
    IDENTITY_LAMBDA_VAL,
    IDENTITY_N_E_IS_G_MINUS_D, IDENTITY_N_S_PLANCK, IDENTITY_OMEGA_M_FRAC,
    IDENTITY_N_SQ_MINUS_E_IS_139, IDENTITY_139_PRIME, IDENTITY_137_PRIME,
    ALL_ARF_IDENTITIES, ALL_ARF_EXACT, N_ARF_IDENTITIES,
    arf_cathedral_summary, print_arf_cathedral_report,
)
from urt.shell_closure import D, N, V, E, F, q, G, DELTA_STAR, gamma


# ── THE CENTRAL IDENTITY: 1/α = 137 ──────────────────────────────────────────

class TestBareAlpha137:
    def test_bare_alpha_is_137(self):
        """N² − E − (D−1) = 137 — the bare fine structure constant EXACT."""
        assert IDENTITY_BARE_ALPHA_137
        assert BARE_ALPHA_INV == 137

    def test_bare_alpha_formula_exact(self):
        assert IDENTITY_ALPHA_FROM_N2_E_D
        assert N**2 - E - (D-1) == 137

    def test_bare_alpha_from_VQ(self):
        """Also: N² − V×q/2 − (D−1) = 137 since E = V×q/2."""
        assert IDENTITY_ALPHA_FROM_VQ
        assert N**2 - V*q//2 - (D-1) == 137

    def test_N_sq_is_169(self):
        assert ALPHA_N_SQ == N**2 == 169

    def test_N_sq_minus_E_is_139(self):
        """N²−E = 139 (prime) — the intermediate step."""
        assert IDENTITY_N_SQ_MINUS_E_IS_139
        assert ALPHA_MINUS_E == 139

    def test_139_is_prime(self):
        assert IDENTITY_139_PRIME

    def test_137_is_prime(self):
        """137 is prime — Nature chose a prime for 1/α."""
        assert IDENTITY_137_PRIME

    def test_bare_alpha_matches_known(self):
        assert BARE_ALPHA_INV == BARE_ALPHA_INV_EXACT == 137


# ── ARF residue denominators ──────────────────────────────────────────────────

class TestARFDenominators:
    def test_D64_is_D1_to_D(self):
        """(D+1)^D = 4³ = 64."""
        assert IDENTITY_D64_IS_D1_TO_D
        assert D64 == (D+1)**D == 64

    def test_D63_is_G_plus_D(self):
        """G+D = 60+3 = 63 = A₅ order + spatial dim."""
        assert IDENTITY_D63_IS_G_PLUS_D
        assert D63 == G + D == 63

    def test_D35_is_E_plus_q(self):
        """E+q = 30+5 = 35."""
        assert IDENTITY_D35_IS_E_PLUS_q
        assert D35 == E + q == 35

    def test_D35_factored(self):
        """35 = q×(D!+1) = 5×7 — Cathedral product."""
        assert IDENTITY_D35_FACTORS
        assert D35 == q * (factorial(D)+1)

    def test_D79_is_4F_minus_1(self):
        assert D79 == 4*F - 1 == 79

    def test_D51_is_G_minus_D_sq(self):
        assert D51 == G - D**2 == 51


# ── Proton mass: 1836 = (D+1)×D^D×(N+D+1) ───────────────────────────────────

class TestProtonMass:
    def test_mp_me_integer_is_1836(self):
        """(D+1)×D^D×(N+D+1) = 4×27×17 = 1836 EXACT."""
        assert IDENTITY_MP_ME_1836
        assert MP_ME_INTEGER == 1836

    def test_mp_me_factors(self):
        assert IDENTITY_MP_ME_FACTORS
        assert MP_ME_INT_FACTOR1 == D + 1 == 4
        assert MP_ME_INT_FACTOR2 == D**D == 27
        assert MP_ME_INT_FACTOR3 == N + D + 1 == 17

    def test_D_to_D_is_27_self_ref(self):
        """D^D = 3³ = 27 — SELF-REFERENTIAL."""
        assert IDENTITY_MP_ME_FACTOR2_SELF_REF
        assert D**D == 27

    def test_factor3_is_prime(self):
        """N+D+1 = 17 is prime."""
        assert IDENTITY_MP_ME_FACTOR3_PRIME
        assert MP_ME_INT_FACTOR3 == 17

    def test_108_is_D1_times_DD(self):
        """(D+1)×D^D = 4×27 = 108."""
        assert MP_ME_108 == 108
        assert MP_ME_108 == (D+1) * D**D

    def test_product_arithmetic(self):
        assert 4 * 27 * 17 == 1836


# ── Lepton mass structure ─────────────────────────────────────────────────────

class TestLeptonMass:
    def test_mu_e_bare_is_3_times_69(self):
        """D×(G+D²) = 3×69 = 207 ≈ mμ/me (before correction)."""
        assert IDENTITY_MU_E_BARE
        assert MU_E_BARE == D * (G + D**2) == 207

    def test_G_plus_D_sq(self):
        """G+D² = 60+9 = 69 — A₅ order + squared spatial dimension."""
        assert G + D**2 == 69

    def test_N_plus_D_is_16(self):
        assert N_PLUS_D == N + D == 16

    def test_N_plus_D_is_2_to_Dp1(self):
        """N+D = 13+3 = 16 = 2^{D+1} — Cathedral!"""
        assert IDENTITY_N_PLUS_D_IS_2_DP1
        assert N + D == 2**(D+1)


# ── Weinberg angle ────────────────────────────────────────────────────────────

class TestWeinbergAngle:
    def test_sin2_tw_bare_frac_is_D_over_N(self):
        """sin²θ_W bare = D/N = 3/13 EXACT rational."""
        assert IDENTITY_SIN2_TW_IS_D_OVER_N
        assert SIN2_TW_BARE_FRAC == Fraction(D, N) == Fraction(3, 13)

    def test_sin2_tw_precise_value(self):
        """Full sin²θ_W = (D/N)×(1+γ/2π) ≈ 0.23122 to 0.01%."""
        assert IDENTITY_SIN2_TW_PRECISE
        assert abs(SIN2_TW_FULL - 0.23122) < 5e-5

    def test_sin2_tw_correction_involves_gamma(self):
        assert abs(SIN2_TW_CORRECTION - (1 + gamma/(2*pi))) < 1e-12


# ── Strong coupling ───────────────────────────────────────────────────────────

class TestStrongCoupling:
    def test_alpha_s_fraction_is_q_minus_1_over_q(self):
        """α_s = δ★ × (q−1)/q = δ★ × 4/5 EXACT."""
        assert IDENTITY_ALPHA_S_FRAC
        assert ALPHA_S_FRACTION == Fraction(q-1, q) == Fraction(4, 5)

    def test_alpha_s_value(self):
        """α_s ≈ 0.11801, obs = 0.1179 (0.09% error)."""
        assert IDENTITY_ALPHA_S_VAL
        assert abs(ALPHA_S - 0.11801) < 1e-4


# ── γ-power ladder exponents ──────────────────────────────────────────────────

class TestGammaLadder:
    def test_gauge_exponent_is_D(self):
        """γ^D = γ^3 — gauge correction exponent = D."""
        assert IDENTITY_GAMMA_EXP_GAUGE_IS_D
        assert GAMMA_EXP_GAUGE == D == 3

    def test_baryon_exponent_is_q(self):
        """γ^q = γ^5 — baryon/axion exponent = q."""
        assert IDENTITY_GAMMA_EXP_BARYON_IS_q
        assert GAMMA_EXP_BARYON == q == 5

    def test_EW_exponent_is_D_squared(self):
        """γ^{D²} = γ^9 — EW vev exponent = D²."""
        assert IDENTITY_GAMMA_EXP_EW_IS_D_SQ
        assert GAMMA_EXP_EW == D**2 == 9

    def test_CC_exponent_is_D1_to_D(self):
        """γ^{(D+1)^D} = γ^64 — cosmological constant exponent."""
        assert IDENTITY_GAMMA_EXP_CC_IS_D1D
        assert GAMMA_EXP_CC == (D+1)**D == 64

    def test_GUT_exponent_is_minus_Dfact1(self):
        """γ^{-(D!+1)} = γ^{-7} — GUT threshold exponent = -(D!+1)."""
        assert IDENTITY_GAMMA_EXP_GUT_IS_DF1
        assert GAMMA_EXP_GUT == -(factorial(D)+1) == -7

    def test_all_exponents_cathedral(self):
        exps = [GAMMA_EXP_GAUGE, GAMMA_EXP_BARYON, GAMMA_EXP_EW, GAMMA_EXP_CC]
        assert exps == [D, q, D**2, (D+1)**D]


# ── Cosmological constant ─────────────────────────────────────────────────────

class TestCosmologicalConstant:
    def test_exponent_is_D1_to_D(self):
        """Λ exponent = (D+1)^D = 64."""
        assert IDENTITY_LAMBDA_EXPO_CATHEDRAL
        assert LAMBDA_EXPONENT == (D+1)**D == 64

    def test_prefactor_is_D_plus_1(self):
        """Λ prefactor = D+1 = 4."""
        assert IDENTITY_LAMBDA_PREFACTOR
        assert LAMBDA_PREFACTOR == D+1 == 4

    def test_lambda_value_approx(self):
        """Λ/M_Pl⁴ ≈ 2.88e-122, obs ≈ 2.9e-122 (within 1%)."""
        assert IDENTITY_LAMBDA_VAL
        assert abs(LAMBDA_OVER_MPL4 / 2.9e-122 - 1) < 0.01


# ── Inflation / spectral index ────────────────────────────────────────────────

class TestInflation:
    def test_N_efolds_is_G_minus_D(self):
        """N_e = G−D = 60−3 = 57 e-folds."""
        assert IDENTITY_N_E_IS_G_MINUS_D
        assert N_E_EFOLDS == G - D == 57

    def test_n_s_matches_planck(self):
        """n_s = 1−2/57 ≈ 0.96491 matches Planck 2018 n_s=0.9649."""
        assert IDENTITY_N_S_PLANCK
        assert abs(N_S - 0.9649) < 5e-4

    def test_n_s_exact_formula(self):
        assert abs(N_S - (1 - 2/57)) < 1e-10


# ── Omega_m ───────────────────────────────────────────────────────────────────

class TestOmegaM:
    def test_omega_m_fraction(self):
        """Ω_m fraction = (D+1)/N = 4/13."""
        assert IDENTITY_OMEGA_M_FRAC
        assert OMEGA_M_FRAC == Fraction(D+1, N) == Fraction(4, 13)

    def test_omega_m_value(self):
        """Ω_m ≈ 0.315, obs Planck ≈ 0.311."""
        assert 0.30 < OMEGA_M < 0.33


# ── All identities ────────────────────────────────────────────────────────────

def test_all_arf_exact():
    assert ALL_ARF_EXACT

def test_n_arf_identities():
    assert N_ARF_IDENTITIES == len(ALL_ARF_IDENTITIES)
    assert N_ARF_IDENTITIES >= 30


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = arf_cathedral_summary()
    assert isinstance(s, dict)

def test_summary_bare_alpha():
    s = arf_cathedral_summary()
    assert s["bare_alpha_inv"] == 137

def test_summary_mp_me():
    s = arf_cathedral_summary()
    assert s["mp_me_integer"] == 1836

def test_summary_gamma_exponents():
    s = arf_cathedral_summary()
    exps = s["gamma_ladder_exponents"]
    assert exps["gauge"] == D
    assert exps["baryon"] == q
    assert exps["EW"] == D**2
    assert exps["CC"] == (D+1)**D
    assert exps["GUT"] == -(factorial(D)+1)

def test_summary_all_exact():
    s = arf_cathedral_summary()
    assert s["all_arf_exact"] is True

def test_print_report_runs(capsys):
    print_arf_cathedral_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_137(capsys):
    print_arf_cathedral_report()
    out = capsys.readouterr().out
    assert "137" in out

def test_print_report_contains_1836(capsys):
    print_arf_cathedral_report()
    out = capsys.readouterr().out
    assert "1836" in out

def test_print_report_contains_formulas(capsys):
    print_arf_cathedral_report()
    out = capsys.readouterr().out
    assert "N²" in out or "N^2" in out or "13²" in out
    assert "D+1" in out or "(D+1)" in out

def test_print_report_contains_n_s(capsys):
    print_arf_cathedral_report()
    out = capsys.readouterr().out
    assert "57" in out or "n_s" in out or "0.964" in out
