"""Tests for urt/fibonacci_lucas_cathedral.py — Fibonacci & Lucas Cathedral identities.

Covers: fib(), lucas(), pisano_period(), all IDENTITY_* flags, module-level
        constants, aggregate flag ALL_FIB_EXACT, summary dict, and report.
"""

import pytest
from math import factorial, sqrt, gcd, isclose


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    """All public names import without error."""
    from urt.fibonacci_lucas_cathedral import (
        # functions
        fib, lucas, pisano_period,
        # Cathedral integer aliases
        GAMMA_INV, PHI,
        # Fibonacci constants
        F_D, F_D1, F_q, F_DFACT, F_2D, F_7, F_8, F_V, F_N, F_E,
        # Lucas constants
        L_0, L_1, L_2, L_3, L_4, L_5, L_D, L_D1,
        # Pisano periods
        PISANO_D, PISANO_q, PISANO_N,
        # GCD values
        GCD_FV_FD1, GCD_FV_Fq, GCD_IDX_V_D1,
        # Fibonacci identity flags
        IDENTITY_FIB_D_IS_DM1, IDENTITY_FIB_D1_IS_D, IDENTITY_FIB_q_SELF_REF,
        IDENTITY_FIB_DFACT_IS_2D, IDENTITY_FIB_2D_IS_2D,
        IDENTITY_FIB_7_IS_N, IDENTITY_FIB_8_IS_D_DFp1,
        IDENTITY_FIB_V_SQUARE, IDENTITY_FIB_N_PRIME, IDENTITY_FIB_N_QUAD,
        # Lucas identity flags
        IDENTITY_LUC_0_IS_DM1, IDENTITY_LUC_2_IS_D,
        IDENTITY_LUC_D_IS_DP1, IDENTITY_LUC_D1_IS_DFp1,
        IDENTITY_LUC_PROD_PISANO_N, IDENTITY_LUC_SUM_IS_q, IDENTITY_LUC_PROD_IS_DFACT,
        # Pisano identity flags
        IDENTITY_PISANO_D_IS_2D, IDENTITY_PISANO_q_IS_F,
        IDENTITY_PISANO_N_IS_LDLD1, IDENTITY_PISANO_N_CATHEDRAL,
        # GCD identity flags
        IDENTITY_GCD_FV_FD1_IS_D, IDENTITY_GCD_FV_Fq_IS_1, IDENTITY_GCD_FV_FD1_VIA_IDX,
        # Golden ratio identity flags
        IDENTITY_PHI_FROM_q, IDENTITY_PHI_SQUARED, IDENTITY_LUC_FIB_RATIO_TO_SQRTq,
        # Relation identity flags
        IDENTITY_LUCAS_FROM_FIB_D, IDENTITY_LUCAS_FROM_FIB_q,
        IDENTITY_DOCAGNE_D, IDENTITY_DOCAGNE_q, IDENTITY_DOCAGNE_V,
        IDENTITY_CASSINI_D, IDENTITY_CASSINI_q, IDENTITY_CASSINI_V,
        # Aggregate
        ALL_FIB_IDENTITIES, N_FIB_IDENTITIES, ALL_FIB_EXACT,
        # Summary / report
        fibonacci_lucas_summary, print_fibonacci_lucas_report,
    )


# ── Cathedral integer baseline ────────────────────────────────────────────────

def test_gamma_inv():
    from urt.fibonacci_lucas_cathedral import GAMMA_INV
    assert GAMMA_INV == 81


def test_phi_value():
    from urt.fibonacci_lucas_cathedral import PHI
    assert isclose(PHI, (1 + sqrt(5)) / 2, rel_tol=1e-14)


# ── fib() helper ─────────────────────────────────────────────────────────────

def test_fib_base_cases():
    from urt.fibonacci_lucas_cathedral import fib
    assert fib(0) == 0
    assert fib(1) == 1
    assert fib(2) == 1


def test_fib_sequence():
    from urt.fibonacci_lucas_cathedral import fib
    expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
    for i, v in enumerate(expected):
        assert fib(i) == v, f"fib({i}): expected {v}, got {fib(i)}"


def test_fib_additive_recurrence():
    from urt.fibonacci_lucas_cathedral import fib
    for n in range(2, 20):
        assert fib(n) == fib(n - 1) + fib(n - 2), f"recurrence fails at n={n}"


def test_fib_negative_zero():
    from urt.fibonacci_lucas_cathedral import fib
    assert fib(0) == 0


# ── lucas() helper ────────────────────────────────────────────────────────────

def test_lucas_base_cases():
    from urt.fibonacci_lucas_cathedral import lucas
    assert lucas(0) == 2
    assert lucas(1) == 1
    assert lucas(2) == 3


def test_lucas_sequence():
    from urt.fibonacci_lucas_cathedral import lucas
    expected = [2, 1, 3, 4, 7, 11, 18, 29, 47, 76]
    for i, v in enumerate(expected):
        assert lucas(i) == v, f"lucas({i}): expected {v}, got {lucas(i)}"


def test_lucas_additive_recurrence():
    from urt.fibonacci_lucas_cathedral import lucas
    for n in range(2, 20):
        assert lucas(n) == lucas(n - 1) + lucas(n - 2), f"Lucas recurrence fails at n={n}"


# ── Fibonacci Cathedral constants ─────────────────────────────────────────────

def test_F_D_value():
    from urt.fibonacci_lucas_cathedral import F_D
    assert F_D == 2


def test_F_D1_value():
    from urt.fibonacci_lucas_cathedral import F_D1
    assert F_D1 == 3


def test_F_q_value():
    from urt.fibonacci_lucas_cathedral import F_q
    assert F_q == 5


def test_F_DFACT_value():
    from urt.fibonacci_lucas_cathedral import F_DFACT
    assert F_DFACT == 8


def test_F_2D_value():
    from urt.fibonacci_lucas_cathedral import F_2D
    assert F_2D == 8


def test_F_7_value():
    from urt.fibonacci_lucas_cathedral import F_7
    assert F_7 == 13


def test_F_8_value():
    from urt.fibonacci_lucas_cathedral import F_8
    assert F_8 == 21


def test_F_V_value():
    from urt.fibonacci_lucas_cathedral import F_V
    assert F_V == 144


def test_F_N_value():
    from urt.fibonacci_lucas_cathedral import F_N
    assert F_N == 233


# ── Fibonacci identity flags ──────────────────────────────────────────────────

def test_identity_fib_D_is_Dm1():
    """F_D = F_3 = 2 = D−1."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_D_IS_DM1
    assert IDENTITY_FIB_D_IS_DM1


def test_identity_fib_D1_self_referential():
    """F_{D+1} = F_4 = 3 = D — SELF-REFERENTIAL."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_D1_IS_D, F_D1
    assert IDENTITY_FIB_D1_IS_D
    assert F_D1 == 3   # D = 3


def test_identity_fib_q_self_referential():
    """F_q = F_5 = 5 = q — SELF-REFERENTIAL MIRACLE (unique for n > 1)."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_q_SELF_REF, F_q
    assert IDENTITY_FIB_q_SELF_REF
    assert F_q == 5   # q = 5


def test_identity_fib_Dfact_is_2D():
    """F_{D!} = F_6 = 8 = 2^D."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_DFACT_IS_2D, F_DFACT
    assert IDENTITY_FIB_DFACT_IS_2D
    assert F_DFACT == 2 ** 3


def test_identity_fib_2D_is_2D():
    """F_{2D} = F_6 = 8 = 2^D (and 2D = D! = 6, double coincidence)."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_2D_IS_2D, F_2D
    assert IDENTITY_FIB_2D_IS_2D
    assert F_2D == 8
    assert 2 * 3 == factorial(3)   # 2D = D! = 6


def test_identity_fib_7_is_N():
    """F_7 = 13 = N (icosahedral prime as Fibonacci number)."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_7_IS_N, F_7
    assert IDENTITY_FIB_7_IS_N
    assert F_7 == 13


def test_identity_fib_8_D_times_DFp1():
    """F_8 = 21 = D×(D!+1) = 3×7."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_8_IS_D_DFp1, F_8
    assert IDENTITY_FIB_8_IS_D_DFp1
    assert F_8 == 3 * 7
    assert F_8 == 3 * (factorial(3) + 1)


def test_identity_fib_V_square_spectacular():
    """F_V = F_12 = 144 = V² = 12² — THE SPECTACULAR IDENTITY."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_V_SQUARE, F_V
    assert IDENTITY_FIB_V_SQUARE
    assert F_V == 12 ** 2   # V = 12
    assert F_V == 144


def test_identity_fib_N_prime():
    """F_N = F_13 = 233 (prime)."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_N_PRIME, F_N

    def is_prime(n):
        if n < 2:
            return False
        for i in range(2, int(n ** 0.5) + 1):
            if n % i == 0:
                return False
        return True

    assert IDENTITY_FIB_N_PRIME
    assert F_N == 233
    assert is_prime(F_N)


def test_identity_fib_N_quad():
    """F_N − N² = (D+1)^D = 4^3 = 64."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_FIB_N_QUAD, F_N
    assert IDENTITY_FIB_N_QUAD
    assert F_N - 13 ** 2 == 4 ** 3
    assert F_N - 169 == 64


# ── Lucas Cathedral constants ─────────────────────────────────────────────────

def test_L_0_value():
    from urt.fibonacci_lucas_cathedral import L_0
    assert L_0 == 2


def test_L_2_value():
    from urt.fibonacci_lucas_cathedral import L_2
    assert L_2 == 3


def test_L_D_value():
    from urt.fibonacci_lucas_cathedral import L_D
    assert L_D == 4


def test_L_D1_value():
    from urt.fibonacci_lucas_cathedral import L_D1
    assert L_D1 == 7


# ── Lucas identity flags ──────────────────────────────────────────────────────

def test_identity_luc_0_is_Dm1():
    """L_0 = 2 = D−1."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUC_0_IS_DM1
    assert IDENTITY_LUC_0_IS_DM1


def test_identity_luc_2_is_D():
    """L_2 = 3 = D."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUC_2_IS_D
    assert IDENTITY_LUC_2_IS_D


def test_identity_luc_D_is_Dp1():
    """L_D = L_3 = 4 = D+1."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUC_D_IS_DP1, L_D
    assert IDENTITY_LUC_D_IS_DP1
    assert L_D == 4


def test_identity_luc_D1_is_DFp1():
    """L_{D+1} = L_4 = 7 = D!+1."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUC_D1_IS_DFp1, L_D1
    assert IDENTITY_LUC_D1_IS_DFp1
    assert L_D1 == 7


def test_identity_luc_prod_pisano_N():
    """L_D × L_{D+1} = 4 × 7 = 28 = π(N)."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUC_PROD_PISANO_N, L_D, L_D1, PISANO_N
    assert IDENTITY_LUC_PROD_PISANO_N
    assert L_D * L_D1 == 28
    assert L_D * L_D1 == PISANO_N


def test_identity_luc_sum_is_q():
    """L_0 + L_2 = 2 + 3 = 5 = q."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUC_SUM_IS_q, L_0, L_2
    assert IDENTITY_LUC_SUM_IS_q
    assert L_0 + L_2 == 5


def test_identity_luc_prod_is_Dfact():
    """L_0 × L_2 = 2 × 3 = 6 = D!."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUC_PROD_IS_DFACT, L_0, L_2
    assert IDENTITY_LUC_PROD_IS_DFACT
    assert L_0 * L_2 == 6
    assert L_0 * L_2 == factorial(3)


# ── Pisano period function ────────────────────────────────────────────────────

def test_pisano_period_D():
    from urt.fibonacci_lucas_cathedral import pisano_period
    assert pisano_period(3) == 8


def test_pisano_period_q():
    from urt.fibonacci_lucas_cathedral import pisano_period
    assert pisano_period(5) == 20


def test_pisano_period_N():
    from urt.fibonacci_lucas_cathedral import pisano_period
    assert pisano_period(13) == 28


def test_pisano_period_2():
    from urt.fibonacci_lucas_cathedral import pisano_period
    # π(2) = 3 (known base case)
    assert pisano_period(2) == 3


# ── Pisano identity flags ─────────────────────────────────────────────────────

def test_identity_pisano_D_is_2D():
    """π(D) = π(3) = 8 = 2^D."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_PISANO_D_IS_2D, PISANO_D
    assert IDENTITY_PISANO_D_IS_2D
    assert PISANO_D == 8
    assert PISANO_D == 2 ** 3


def test_identity_pisano_q_is_F():
    """π(q) = π(5) = 20 = F (icosahedral faces)."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_PISANO_q_IS_F, PISANO_q
    assert IDENTITY_PISANO_q_IS_F
    assert PISANO_q == 20


def test_identity_pisano_N_is_LDLD1():
    """π(N) = π(13) = 28 = L_D × L_{D+1}."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_PISANO_N_IS_LDLD1, PISANO_N
    assert IDENTITY_PISANO_N_IS_LDLD1
    assert PISANO_N == 28


def test_identity_pisano_N_cathedral():
    """π(N) = π(13) = 28 = (D+1)×(D!+1) = 4×7."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_PISANO_N_CATHEDRAL, PISANO_N
    assert IDENTITY_PISANO_N_CATHEDRAL
    assert PISANO_N == (3 + 1) * (factorial(3) + 1)


# ── GCD identities ────────────────────────────────────────────────────────────

def test_identity_gcd_FV_FD1_is_D():
    """gcd(F_V, F_{D+1}) = gcd(F_12, F_4) = gcd(144, 3) = 3 = D."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_GCD_FV_FD1_IS_D, GCD_FV_FD1
    assert IDENTITY_GCD_FV_FD1_IS_D
    assert GCD_FV_FD1 == 3
    assert GCD_FV_FD1 == gcd(144, 3)


def test_identity_gcd_FV_Fq_is_1():
    """gcd(F_V, F_q) = gcd(144, 5) = 1 (coprime)."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_GCD_FV_Fq_IS_1, GCD_FV_Fq
    assert IDENTITY_GCD_FV_Fq_IS_1
    assert GCD_FV_Fq == 1


def test_gcd_index_law():
    """gcd(F_m, F_n) = F_{gcd(m,n)}: gcd(F_12, F_4) = F_{gcd(12,4)} = F_4 = 3."""
    from urt.fibonacci_lucas_cathedral import fib, GCD_FV_FD1, GCD_IDX_V_D1
    assert GCD_FV_FD1 == GCD_IDX_V_D1
    assert GCD_IDX_V_D1 == fib(gcd(12, 4))
    assert gcd(12, 4) == 4
    assert fib(4) == 3


def test_identity_gcd_FV_FD1_via_idx():
    """Verify the GCD index law identity flag."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_GCD_FV_FD1_VIA_IDX
    assert IDENTITY_GCD_FV_FD1_VIA_IDX


# ── Golden ratio identities ───────────────────────────────────────────────────

def test_identity_phi_from_q():
    """φ = (1+√q)/2 — Cathedral: φ uses q under radical."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_PHI_FROM_q, PHI
    assert IDENTITY_PHI_FROM_q
    assert isclose(PHI, (1 + sqrt(5)) / 2, rel_tol=1e-14)


def test_identity_phi_squared():
    """φ² = φ+1 — minimal polynomial x²−x−1=0."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_PHI_SQUARED, PHI
    assert IDENTITY_PHI_SQUARED
    assert isclose(PHI ** 2, PHI + 1, rel_tol=1e-14)


def test_identity_lucas_fib_ratio_to_sqrt_q():
    """L_n / F_n converges to √q = √5 as n→∞."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUC_FIB_RATIO_TO_SQRTq, lucas, fib
    assert IDENTITY_LUC_FIB_RATIO_TO_SQRTq
    ratio = lucas(20) / fib(20)
    assert isclose(ratio, sqrt(5), rel_tol=1e-5)


def test_lucas_fib_ratio_improves():
    """Convergence to √5 improves with larger n."""
    from urt.fibonacci_lucas_cathedral import lucas, fib
    r10 = abs(lucas(10) / fib(10) - sqrt(5))
    r20 = abs(lucas(20) / fib(20) - sqrt(5))
    assert r20 < r10, "Convergence did not improve from n=10 to n=20"


# ── Relation identities ───────────────────────────────────────────────────────

def test_identity_lucas_from_fib_D():
    """L_D = F_{D-1} + F_{D+1}: L_3 = F_2 + F_4 = 1 + 3 = 4."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUCAS_FROM_FIB_D, lucas, fib
    assert IDENTITY_LUCAS_FROM_FIB_D
    assert lucas(3) == fib(2) + fib(4)
    assert lucas(3) == 1 + 3


def test_identity_lucas_from_fib_q():
    """L_q = F_{q-1} + F_{q+1}: L_5 = F_4 + F_6 = 3 + 8 = 11."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_LUCAS_FROM_FIB_q, lucas, fib
    assert IDENTITY_LUCAS_FROM_FIB_q
    assert lucas(5) == fib(4) + fib(6)
    assert lucas(5) == 11


def test_identity_docagne_D():
    """F_{2D} = F_D × L_D: F_6 = F_3 × L_3 = 2 × 4 = 8."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_DOCAGNE_D, fib, lucas
    assert IDENTITY_DOCAGNE_D
    assert fib(6) == fib(3) * lucas(3)
    assert 8 == 2 * 4


def test_identity_docagne_q():
    """F_{2q} = F_q × L_q: F_10 = F_5 × L_5 = 5 × 11 = 55."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_DOCAGNE_q, fib, lucas
    assert IDENTITY_DOCAGNE_q
    assert fib(10) == fib(5) * lucas(5)
    assert 55 == 5 * 11


def test_identity_docagne_V():
    """F_{2V} = F_V × L_V: F_24 = F_12 × L_12 = 144 × 322 = 46368."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_DOCAGNE_V, fib, lucas
    assert IDENTITY_DOCAGNE_V
    assert fib(24) == fib(12) * lucas(12)


def test_identity_cassini_D():
    """Cassini identity at n=D=3: F_2×F_4 − F_3² = (-1)^3 = -1."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_CASSINI_D, fib
    assert IDENTITY_CASSINI_D
    assert fib(2) * fib(4) - fib(3) ** 2 == (-1) ** 3


def test_identity_cassini_q():
    """Cassini identity at n=q=5: F_4×F_6 − F_5² = (-1)^5 = -1."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_CASSINI_q, fib
    assert IDENTITY_CASSINI_q
    assert fib(4) * fib(6) - fib(5) ** 2 == (-1) ** 5
    assert 3 * 8 - 25 == -1


def test_identity_cassini_V():
    """Cassini identity at n=V=12: F_11×F_13 − F_12² = (-1)^12 = +1."""
    from urt.fibonacci_lucas_cathedral import IDENTITY_CASSINI_V, fib
    assert IDENTITY_CASSINI_V
    assert fib(11) * fib(13) - fib(12) ** 2 == (-1) ** 12
    assert 89 * 233 - 144 ** 2 == 1


# ── Aggregate flag ────────────────────────────────────────────────────────────

def test_all_fib_exact_flag():
    """ALL_FIB_EXACT must be True — every registered identity holds."""
    from urt.fibonacci_lucas_cathedral import ALL_FIB_EXACT
    assert ALL_FIB_EXACT


def test_all_fib_identities_dict_all_true():
    """Every entry in ALL_FIB_IDENTITIES dict is True."""
    from urt.fibonacci_lucas_cathedral import ALL_FIB_IDENTITIES
    failed = [k for k, v in ALL_FIB_IDENTITIES.items() if not v]
    assert not failed, f"Failed identities: {failed}"


def test_n_fib_identities_count():
    """Module registers at least 25 identities."""
    from urt.fibonacci_lucas_cathedral import N_FIB_IDENTITIES
    assert N_FIB_IDENTITIES >= 25


def test_n_fib_identities_matches_dict():
    """N_FIB_IDENTITIES equals the length of ALL_FIB_IDENTITIES."""
    from urt.fibonacci_lucas_cathedral import N_FIB_IDENTITIES, ALL_FIB_IDENTITIES
    assert N_FIB_IDENTITIES == len(ALL_FIB_IDENTITIES)


# ── Summary dict ──────────────────────────────────────────────────────────────

def test_summary_returns_dict():
    from urt.fibonacci_lucas_cathedral import fibonacci_lucas_summary
    s = fibonacci_lucas_summary()
    assert isinstance(s, dict)


def test_summary_all_exact_key():
    from urt.fibonacci_lucas_cathedral import fibonacci_lucas_summary
    s = fibonacci_lucas_summary()
    assert s["all_exact"] is True


def test_summary_F_V_value():
    """Summary contains F_V = 144 = V²."""
    from urt.fibonacci_lucas_cathedral import fibonacci_lucas_summary
    s = fibonacci_lucas_summary()
    assert s["F_V"] == 144


def test_summary_F_q_self_ref():
    """Summary contains F_q = 5 = q."""
    from urt.fibonacci_lucas_cathedral import fibonacci_lucas_summary
    s = fibonacci_lucas_summary()
    assert s["F_q"] == 5


def test_summary_pisano_keys():
    """Summary includes all three Pisano periods."""
    from urt.fibonacci_lucas_cathedral import fibonacci_lucas_summary
    s = fibonacci_lucas_summary()
    assert s["pisano_D"] == 8
    assert s["pisano_q"] == 20
    assert s["pisano_N"] == 28


def test_summary_phi_value():
    from urt.fibonacci_lucas_cathedral import fibonacci_lucas_summary
    s = fibonacci_lucas_summary()
    assert isclose(s["phi"], (1 + sqrt(5)) / 2, rel_tol=1e-14)


def test_summary_sqrt_q():
    from urt.fibonacci_lucas_cathedral import fibonacci_lucas_summary
    s = fibonacci_lucas_summary()
    assert isclose(s["sqrt_q"], sqrt(5), rel_tol=1e-14)


def test_summary_n_identities_key():
    from urt.fibonacci_lucas_cathedral import fibonacci_lucas_summary, N_FIB_IDENTITIES
    s = fibonacci_lucas_summary()
    assert s["n_identities"] == N_FIB_IDENTITIES


# ── Print report ──────────────────────────────────────────────────────────────

def test_print_report_runs(capsys):
    from urt.fibonacci_lucas_cathedral import print_fibonacci_lucas_report
    print_fibonacci_lucas_report()
    out = capsys.readouterr().out
    assert len(out) > 300


def test_print_report_contains_self_referential(capsys):
    from urt.fibonacci_lucas_cathedral import print_fibonacci_lucas_report
    print_fibonacci_lucas_report()
    out = capsys.readouterr().out
    assert "self" in out.lower() or "SELF" in out or "self-ref" in out.lower()


def test_print_report_contains_FV_144(capsys):
    from urt.fibonacci_lucas_cathedral import print_fibonacci_lucas_report
    print_fibonacci_lucas_report()
    out = capsys.readouterr().out
    assert "144" in out


def test_print_report_contains_F_V(capsys):
    from urt.fibonacci_lucas_cathedral import print_fibonacci_lucas_report
    print_fibonacci_lucas_report()
    out = capsys.readouterr().out
    assert "F_V" in out or "F_12" in out or "F_{V}" in out


def test_print_report_contains_pisano(capsys):
    from urt.fibonacci_lucas_cathedral import print_fibonacci_lucas_report
    print_fibonacci_lucas_report()
    out = capsys.readouterr().out
    assert "isano" in out   # Pisano or pisano


def test_print_report_contains_phi(capsys):
    from urt.fibonacci_lucas_cathedral import print_fibonacci_lucas_report
    print_fibonacci_lucas_report()
    out = capsys.readouterr().out
    assert "phi" in out.lower() or "φ" in out or "golden" in out.lower()
