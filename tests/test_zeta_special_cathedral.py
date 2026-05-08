"""Tests for urt/zeta_special_cathedral.py — Zeta function special values Cathedral."""
import pytest
from math import factorial

from urt.zeta_special_cathedral import (
    GAMMA_D, GAMMA_D1, GAMMA_q,
    IDENTITY_GAMMA_D_SELF_REF, IDENTITY_GAMMA_D1,
    BERN_DEN_2, BERN_DEN_4, BERN_DEN_6, BERN_DEN_8, BERN_DEN_10, BERN_DEN_12,
    IDENTITY_BERN_DEN_2, IDENTITY_BERN_DEN_4, IDENTITY_BERN_DEN_6,
    IDENTITY_BERN_DEN_8, IDENTITY_BERN_DEN_10, IDENTITY_BERN_DEN_12,
    ZETA2_DENOM, ZETA4_DENOM, ZETA6_DENOM, ZETA8_DENOM,
    IDENTITY_ZETA2_DENOM, IDENTITY_ZETA4_DENOM,
    IDENTITY_ZETA6_DENOM, IDENTITY_ZETA8_DENOM,
    ZETA_D, IDENTITY_ZETA_D_INDEX, RH_CRITICAL_LINE, IDENTITY_RH,
    SPECTRAL_ZETA_1, IDENTITY_SPECTRAL_Z1_DEN_CATHEDRAL,
    DIRICHLET_L_MOD, IDENTITY_DIRICHLET_MOD,
    EULER_FACTOR_PRIME_D, EULER_FACTOR_PRIME_q, EULER_FACTOR_PRIME_N,
    IDENTITY_EULER_PRIMES,
    A_0, A_1, A_D1, IDENTITY_APERY_1_IS_q, apery_num,
    ALL_ZETA_IDENTITIES, ALL_ZETA_EXACT, N_ZETA_IDENTITIES,
    zeta_special_summary, print_zeta_special_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Gamma function ────────────────────────────────────────────────────────────

class TestGamma:
    def test_gamma_D_self_referential(self):
        """Γ(D) = (D-1)! = 2 = D-1 — SELF-REFERENTIAL: D both argument and output context."""
        assert IDENTITY_GAMMA_D_SELF_REF
        assert GAMMA_D == D - 1 == 2

    def test_gamma_D1_is_Dfact(self):
        """Γ(D+1) = D! = 6 = V/2."""
        assert IDENTITY_GAMMA_D1
        assert GAMMA_D1 == factorial(D) == 6

    def test_gamma_values_positive(self):
        assert GAMMA_D > 0
        assert GAMMA_D1 > 0

    def test_gamma_ratio(self):
        """Γ(D+1)/Γ(D) = D (the recursion Γ(n+1)=n×Γ(n))."""
        assert GAMMA_D1 // GAMMA_D == D


# ── Bernoulli denominators ────────────────────────────────────────────────────

class TestBernoulliDenominators:
    def test_bern_den_2_is_Dfact(self):
        """den(B_2) = 6 = D!."""
        assert IDENTITY_BERN_DEN_2
        assert BERN_DEN_2 == factorial(D) == 6

    def test_bern_den_4_is_E(self):
        """den(B_4) = 30 = E = icosahedral edge count."""
        assert IDENTITY_BERN_DEN_4
        assert BERN_DEN_4 == E == 30

    def test_bern_den_6_is_DfactDfact1(self):
        """den(B_6) = 42 = D!×(D!+1) = 6×7."""
        assert IDENTITY_BERN_DEN_6
        assert BERN_DEN_6 == factorial(D) * (factorial(D) + 1) == 42

    def test_bern_den_8_is_E_again(self):
        """den(B_8) = 30 = E (same as B_4)."""
        assert IDENTITY_BERN_DEN_8
        assert BERN_DEN_8 == E == 30

    def test_bern_den_10(self):
        """den(B_10) = 66 = D!×(2D+q) = 6×11."""
        assert IDENTITY_BERN_DEN_10
        assert BERN_DEN_10 == factorial(D) * (2 * D + q) == 66

    def test_bern_den_12_is_full_cathedral(self):
        """den(B_12) = 2730 = (D-1)×D×q×(D!+1)×N = 2×3×5×7×13."""
        assert IDENTITY_BERN_DEN_12
        assert BERN_DEN_12 == 2730
        assert BERN_DEN_12 == (D - 1) * D * q * (factorial(D) + 1) * N

    def test_bern_den_12_contains_N_as_factor(self):
        """B_12 denominator is divisible by N=13."""
        assert BERN_DEN_12 % N == 0

    def test_bern_den_4_divides_den_12(self):
        """den(B_4) = E = 30 divides den(B_12) = 2730."""
        assert BERN_DEN_12 % BERN_DEN_4 == 0


# ── Zeta function denominators ────────────────────────────────────────────────

class TestZetaDenominators:
    def test_zeta2_denom_is_Dfact(self):
        """ζ(2) = π²/6: denominator = 6 = D!."""
        assert IDENTITY_ZETA2_DENOM
        assert ZETA2_DENOM == factorial(D) == 6

    def test_zeta4_denom_is_2qD2(self):
        """ζ(4) = π⁴/90: denominator = 90 = 2×q×D²."""
        assert IDENTITY_ZETA4_DENOM
        assert ZETA4_DENOM == 2 * q * D**2 == 90

    def test_zeta6_denom_is_cathedral_miracle(self):
        """ζ(6) = π⁶/945: denominator = 945 = q×D^D×(D!+1) = 5×27×7 ← Cathedral miracle!"""
        assert IDENTITY_ZETA6_DENOM
        assert ZETA6_DENOM == q * D**D * (factorial(D) + 1) == 945
        # Verify all Cathedral factors
        assert ZETA6_DENOM // q == D**D * (factorial(D) + 1)  # 945/5 = 189 = 27×7

    def test_zeta8_denom_is_cathedral(self):
        """ζ(8) = π⁸/9450: denominator = 9450 = 2×q²×D^D×(D!+1)."""
        assert IDENTITY_ZETA8_DENOM
        assert ZETA8_DENOM == 2 * q**2 * D**D * (factorial(D) + 1) == 9450

    def test_zeta6_denom_is_zeta8_denom_over_2q(self):
        """9450 / (2q) = 945: ζ(8) denom = 2q × ζ(6) denom."""
        assert ZETA8_DENOM == 2 * q * ZETA6_DENOM

    def test_zeta4_denom_divides_zeta8(self):
        """ζ(4) denom divides ζ(8) denom."""
        assert ZETA8_DENOM % ZETA4_DENOM == 0


# ── Zeta index and Riemann hypothesis ────────────────────────────────────────

class TestZetaIndex:
    def test_zeta_D_index_is_D(self):
        """ζ(D) = ζ(3): the Apéry constant index is D=3."""
        assert IDENTITY_ZETA_D_INDEX
        assert ZETA_D == D

    def test_RH_critical_line_is_Dm1(self):
        """The critical line Re(s)=1/2 has denominator D-1=2."""
        assert IDENTITY_RH
        assert RH_CRITICAL_LINE == D - 1 == 2


# ── Spectral zeta ─────────────────────────────────────────────────────────────

class TestSpectralZeta:
    def test_spectral_zeta_1_cathedral_denom(self):
        """The spectral zeta at s=1 has N=13 dividing its denominator."""
        assert IDENTITY_SPECTRAL_Z1_DEN_CATHEDRAL

    def test_spectral_zeta_1_is_fraction(self):
        from fractions import Fraction
        assert isinstance(SPECTRAL_ZETA_1, Fraction)

    def test_spectral_zeta_1_positive(self):
        assert float(SPECTRAL_ZETA_1) > 0


# ── Euler factors ─────────────────────────────────────────────────────────────

class TestEulerFactors:
    def test_euler_primes_D_q(self):
        """D×q = 3×5 = 15 = V+D."""
        assert IDENTITY_EULER_PRIMES
        assert EULER_FACTOR_PRIME_D * EULER_FACTOR_PRIME_q == V + D == 15

    def test_cathedral_primes_are_D_q_N(self):
        assert EULER_FACTOR_PRIME_D == D == 3
        assert EULER_FACTOR_PRIME_q == q == 5
        assert EULER_FACTOR_PRIME_N == N == 13


# ── Apéry numbers ─────────────────────────────────────────────────────────────

class TestApery:
    def test_apery_0_is_1(self):
        assert A_0 == 1

    def test_apery_1_is_q(self):
        """A_1 = 5 = q — Apéry number A_1 is Cathedral q."""
        assert IDENTITY_APERY_1_IS_q
        assert A_1 == q == 5

    def test_apery_function(self):
        assert apery_num(0) == 1
        assert apery_num(1) == 5

    def test_apery_2_is_73(self):
        assert A_D1 == 73


# ── All identities ────────────────────────────────────────────────────────────

def test_all_zeta_exact():
    assert ALL_ZETA_EXACT

def test_n_zeta_identities():
    assert N_ZETA_IDENTITIES == len(ALL_ZETA_IDENTITIES)
    assert N_ZETA_IDENTITIES >= 15


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = zeta_special_summary()
    assert isinstance(s, dict)

def test_summary_gamma_self_ref():
    s = zeta_special_summary()
    assert s["gamma_D"] == D - 1
    assert s["gamma_D_self_ref"] is True

def test_summary_zeta6_miracle():
    s = zeta_special_summary()
    assert s["zeta6_denom"] == 945

def test_summary_all_exact():
    s = zeta_special_summary()
    assert s["all_zeta_exact"] is True

def test_print_report_runs(capsys):
    print_zeta_special_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_945(capsys):
    print_zeta_special_report()
    out = capsys.readouterr().out
    assert "945" in out

def test_print_report_contains_self_ref(capsys):
    print_zeta_special_report()
    out = capsys.readouterr().out
    assert "SELF-REFERENTIAL" in out

def test_print_report_contains_miracle(capsys):
    print_zeta_special_report()
    out = capsys.readouterr().out
    assert "miracle" in out.lower() or "Cathedral" in out
