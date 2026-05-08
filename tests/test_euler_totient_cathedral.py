"""Tests for urt/euler_totient_cathedral.py — Cathedral arithmetic functions.

Covers: Euler totient φ, divisor sum σ, divisor count d,
        Jordan totient J₂, Ramanujan sums, multiplicativity,
        sum/composite identities, aggregate flag, summary dict,
        and print report.

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.
"""

import pytest
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports_all():
    """All public names import without error."""
    from urt.euler_totient_cathedral import (
        # Functions
        euler_phi, sigma, divisor_count, jordan_totient_j2, ramanujan_sum,
        # φ values
        PHI_D, PHI_q, PHI_N, PHI_V, PHI_2V, PHI_G, PHI_E, PHI_F,
        # φ identity flags
        IDENTITY_PHI_D, IDENTITY_PHI_q, IDENTITY_PHI_N_EQ_V,
        IDENTITY_PHI_V_EQ_Dp1, IDENTITY_PHI_2V_EQ_2pD, IDENTITY_PHI_G_EQ_2pDp1,
        IDENTITY_PHI_E_EQ_2pD, IDENTITY_PHI_F_EQ_2pD,
        IDENTITY_PHI_V_EQ_PHI_q, IDENTITY_PHI_2V_EQ_PHI_E,
        IDENTITY_PHI_2V_EQ_PHI_F, IDENTITY_PHI_TRIPLE_8,
        # σ values
        SIGMA_D, SIGMA_q, SIGMA_N, SIGMA_Dfac, SIGMA_V, SIGMA_G,
        # σ identity flags
        IDENTITY_SIGMA_D_EQ_Dp1, IDENTITY_SIGMA_q_EQ_Dfac, IDENTITY_SIGMA_N_EQ_Np1,
        IDENTITY_SIGMA_Dfac_EQ_V, IDENTITY_SIGMA_V_EQ_PERFECT, IDENTITY_SIGMA_V_IS_28,
        IDENTITY_SIGMA_G_EQ_FORMULA, IDENTITY_SIGMA_G_IS_168, IDENTITY_SIGMA_Dfac_OVER_V,
        # d values
        DIVCOUNT_D, DIVCOUNT_q, DIVCOUNT_N, DIVCOUNT_Dfac, DIVCOUNT_V, DIVCOUNT_G,
        # d identity flags
        IDENTITY_DIVCOUNT_D_EQ_Dm1, IDENTITY_DIVCOUNT_q_EQ_Dm1, IDENTITY_DIVCOUNT_N_EQ_Dm1,
        IDENTITY_DIVCOUNT_Dfac_EQ_Dp1, IDENTITY_DIVCOUNT_V_EQ_Dfac, IDENTITY_DIVCOUNT_G_EQ_V,
        # J₂ and Ramanujan values
        J2_N, J2_D, J2_q, C_N_1, C_q_1, C_D_1,
        # J₂ and Ramanujan flags
        IDENTITY_J2_N_EQ_SIGMA_G, IDENTITY_J2_N_IS_168,
        IDENTITY_J2_D_EQ_2pD, IDENTITY_J2_q_EQ_2V,
        IDENTITY_RAMANUJAN_N_EQ_V, IDENTITY_RAMANUJAN_N_EQ_PHI_N,
        IDENTITY_RAMANUJAN_q_EQ_Dp1, IDENTITY_RAMANUJAN_D_EQ_Dm1,
        # Multiplicativity values
        PHI_Dq, PHI_DN, SIGMA_Dq, DIVCOUNT_Dq,
        # Multiplicativity flags
        IDENTITY_PHI_MULT_Dq, IDENTITY_PHI_MULT_Dq_VAL,
        IDENTITY_PHI_MULT_DN, IDENTITY_PHI_MULT_DN_VAL,
        IDENTITY_SIGMA_MULT_Dq, IDENTITY_SIGMA_MULT_Dq_VAL,
        IDENTITY_DIVCOUNT_MULT_Dq, IDENTITY_DIVCOUNT_MULT_Dq_VAL,
        # Sum/composite values
        PHI_SUM_DqN, PHI_PROD_DqN, SIGMA_V_PLUS_PHI_N,
        # Sum/composite flags
        IDENTITY_PHI_SUM_DqN, IDENTITY_PHI_SUM_DqN_IS_18,
        IDENTITY_PHI_PROD_DqN, IDENTITY_PHI_PROD_DqN_IS_96,
        IDENTITY_SIGMA_V_PLUS_PHI_N, IDENTITY_SIGMA_V_PLUS_PHI_N_IS_40,
        IDENTITY_PHI_N_TIMES_DIVCOUNT_Dfac, IDENTITY_SIGMA_Dfac_RATIO_1,
        # Aggregate
        ALL_TOTIENT_IDENTITIES, ALL_TOTIENT_EXACT,
        # Summary / report
        totient_summary, print_totient_report,
    )


# ── Helper function tests ──────────────────────────────────────────────────────

def test_euler_phi_basic():
    """euler_phi returns correct values for small inputs."""
    from urt.euler_totient_cathedral import euler_phi
    assert euler_phi(1) == 1
    assert euler_phi(2) == 1
    assert euler_phi(3) == 2
    assert euler_phi(4) == 2
    assert euler_phi(5) == 4
    assert euler_phi(6) == 2
    assert euler_phi(12) == 4
    assert euler_phi(13) == 12


def test_euler_phi_prime_formula():
    """For prime p, φ(p) = p-1."""
    from urt.euler_totient_cathedral import euler_phi
    for p in [2, 3, 5, 7, 11, 13, 17, 19]:
        assert euler_phi(p) == p - 1, f"φ({p}) ≠ {p}-1"


def test_sigma_basic():
    """sigma returns correct values for small inputs."""
    from urt.euler_totient_cathedral import sigma
    assert sigma(1) == 1
    assert sigma(2) == 3
    assert sigma(3) == 4
    assert sigma(4) == 7
    assert sigma(6) == 12
    assert sigma(12) == 28
    assert sigma(13) == 14


def test_divisor_count_basic():
    """divisor_count returns correct values for small inputs."""
    from urt.euler_totient_cathedral import divisor_count
    assert divisor_count(1) == 1
    assert divisor_count(2) == 2
    assert divisor_count(3) == 2
    assert divisor_count(6) == 4
    assert divisor_count(12) == 6
    assert divisor_count(13) == 2
    assert divisor_count(60) == 12


def test_jordan_totient_j2_basic():
    """jordan_totient_j2 returns correct values."""
    from urt.euler_totient_cathedral import jordan_totient_j2
    # For prime p: J₂(p) = p²-1
    assert jordan_totient_j2(3) == 8
    assert jordan_totient_j2(5) == 24
    assert jordan_totient_j2(13) == 168
    assert jordan_totient_j2(1) == 1


def test_ramanujan_sum_basic():
    """ramanujan_sum(n,1) = φ(n) for primes and squarefree n."""
    from urt.euler_totient_cathedral import ramanujan_sum, euler_phi
    # For prime p, c_p(1) = p-1 = φ(p)
    assert ramanujan_sum(3, 1) == euler_phi(3)
    assert ramanujan_sum(5, 1) == euler_phi(5)
    assert ramanujan_sum(13, 1) == euler_phi(13)


def test_helper_invalid_input():
    """Helper functions raise ValueError for n < 1."""
    from urt.euler_totient_cathedral import euler_phi, sigma, divisor_count
    with pytest.raises(ValueError):
        euler_phi(0)
    with pytest.raises(ValueError):
        sigma(0)
    with pytest.raises(ValueError):
        divisor_count(0)


# ── Section 1: Euler Totient φ ────────────────────────────────────────────────

def test_phi_D_eq_Dm1():
    """φ(D) = φ(3) = 2 = D-1."""
    from urt.euler_totient_cathedral import PHI_D, IDENTITY_PHI_D
    assert PHI_D == 2
    assert IDENTITY_PHI_D is True


def test_phi_q_eq_Dp1():
    """φ(q) = φ(5) = 4 = D+1."""
    from urt.euler_totient_cathedral import PHI_q, IDENTITY_PHI_q
    assert PHI_q == 4
    assert IDENTITY_PHI_q is True


def test_phi_N_eq_V_THE_MIRACLE():
    """φ(N) = φ(13) = 12 = V — THE Cathedral miracle."""
    from urt.euler_totient_cathedral import PHI_N, IDENTITY_PHI_N_EQ_V
    assert PHI_N == 12, "φ(13) must be 12 = V"
    assert IDENTITY_PHI_N_EQ_V is True


def test_phi_V_eq_Dp1():
    """φ(V) = φ(12) = 4 = D+1."""
    from urt.euler_totient_cathedral import PHI_V, IDENTITY_PHI_V_EQ_Dp1
    assert PHI_V == 4
    assert IDENTITY_PHI_V_EQ_Dp1 is True


def test_phi_2V_eq_2pD():
    """φ(2V) = φ(24) = 8 = 2^D."""
    from urt.euler_totient_cathedral import PHI_2V, IDENTITY_PHI_2V_EQ_2pD
    assert PHI_2V == 8
    assert IDENTITY_PHI_2V_EQ_2pD is True


def test_phi_G_eq_2pDp1():
    """φ(G) = φ(60) = 16 = 2^(D+1)."""
    from urt.euler_totient_cathedral import PHI_G, IDENTITY_PHI_G_EQ_2pDp1
    assert PHI_G == 16
    assert IDENTITY_PHI_G_EQ_2pDp1 is True


def test_phi_E_eq_2pD():
    """φ(E) = φ(30) = 8 = 2^D."""
    from urt.euler_totient_cathedral import PHI_E, IDENTITY_PHI_E_EQ_2pD
    assert PHI_E == 8
    assert IDENTITY_PHI_E_EQ_2pD is True


def test_phi_F_eq_2pD():
    """φ(F) = φ(20) = 8 = 2^D."""
    from urt.euler_totient_cathedral import PHI_F, IDENTITY_PHI_F_EQ_2pD
    assert PHI_F == 8
    assert IDENTITY_PHI_F_EQ_2pD is True


def test_phi_V_eq_phi_q_same_value():
    """φ(V) = φ(q) = 4 = D+1: two Cathedral integers share totient."""
    from urt.euler_totient_cathedral import PHI_V, PHI_q, IDENTITY_PHI_V_EQ_PHI_q
    assert PHI_V == PHI_q
    assert IDENTITY_PHI_V_EQ_PHI_q is True


def test_phi_triple_8_three_cathedral_integers():
    """φ(2V) = φ(E) = φ(F) = 8 = 2^D: three Cathedral integers → same totient."""
    from urt.euler_totient_cathedral import (
        PHI_2V, PHI_E, PHI_F,
        IDENTITY_PHI_2V_EQ_PHI_E, IDENTITY_PHI_2V_EQ_PHI_F, IDENTITY_PHI_TRIPLE_8,
    )
    assert PHI_2V == PHI_E == PHI_F == 8
    assert IDENTITY_PHI_2V_EQ_PHI_E is True
    assert IDENTITY_PHI_2V_EQ_PHI_F is True
    assert IDENTITY_PHI_TRIPLE_8 is True


# ── Section 2: Divisor sum σ ──────────────────────────────────────────────────

def test_sigma_D_eq_Dp1():
    """σ(D) = σ(3) = 4 = D+1."""
    from urt.euler_totient_cathedral import SIGMA_D, IDENTITY_SIGMA_D_EQ_Dp1
    assert SIGMA_D == 4
    assert IDENTITY_SIGMA_D_EQ_Dp1 is True


def test_sigma_q_eq_Dfac():
    """σ(q) = σ(5) = 6 = D! = 3!."""
    from urt.euler_totient_cathedral import SIGMA_q, IDENTITY_SIGMA_q_EQ_Dfac
    assert SIGMA_q == 6
    assert IDENTITY_SIGMA_q_EQ_Dfac is True


def test_sigma_N_eq_Np1():
    """σ(N) = σ(13) = 14 = N+1."""
    from urt.euler_totient_cathedral import SIGMA_N, IDENTITY_SIGMA_N_EQ_Np1
    assert SIGMA_N == 14
    assert IDENTITY_SIGMA_N_EQ_Np1 is True


def test_sigma_Dfac_eq_V_miracle():
    """σ(D!) = σ(6) = 12 = V — EXACT Cathedral miracle."""
    from urt.euler_totient_cathedral import SIGMA_Dfac, IDENTITY_SIGMA_Dfac_EQ_V
    assert SIGMA_Dfac == 12, "σ(6) must equal 12 = V"
    assert IDENTITY_SIGMA_Dfac_EQ_V is True


def test_sigma_V_eq_28_perfect_number():
    """σ(V) = σ(12) = 28 — the second perfect number, encoded Cathedral-ally."""
    from urt.euler_totient_cathedral import SIGMA_V, IDENTITY_SIGMA_V_IS_28, IDENTITY_SIGMA_V_EQ_PERFECT
    assert SIGMA_V == 28
    assert IDENTITY_SIGMA_V_IS_28 is True
    assert IDENTITY_SIGMA_V_EQ_PERFECT is True


def test_sigma_V_perfect_formula():
    """σ(V) = (D+1)(D!+1) = 4×7 = 28."""
    from urt.euler_totient_cathedral import SIGMA_V
    D = 3
    assert SIGMA_V == (D + 1) * (factorial(D) + 1)


def test_sigma_G_eq_168_formula():
    """σ(G) = σ(60) = 168 = D×2^D×(D!+1) = 3×8×7."""
    from urt.euler_totient_cathedral import SIGMA_G, IDENTITY_SIGMA_G_EQ_FORMULA, IDENTITY_SIGMA_G_IS_168
    assert SIGMA_G == 168
    assert IDENTITY_SIGMA_G_IS_168 is True
    assert IDENTITY_SIGMA_G_EQ_FORMULA is True


def test_sigma_G_formula_explicit():
    """Verify σ(60) = 3×8×7 explicitly."""
    from urt.euler_totient_cathedral import sigma
    D = 3
    assert sigma(60) == D * (2 ** D) * (factorial(D) + 1)


def test_sigma_Dfac_over_V_eq_1():
    """σ(D!) / V = 12 / 12 = 1 exactly."""
    from urt.euler_totient_cathedral import SIGMA_Dfac, IDENTITY_SIGMA_Dfac_OVER_V
    assert SIGMA_Dfac == 12
    assert IDENTITY_SIGMA_Dfac_OVER_V is True


# ── Section 3: Divisor count d ────────────────────────────────────────────────

def test_divcount_D_prime():
    """d(D) = d(3) = 2 = D-1 (prime has exactly 2 divisors)."""
    from urt.euler_totient_cathedral import DIVCOUNT_D, IDENTITY_DIVCOUNT_D_EQ_Dm1
    assert DIVCOUNT_D == 2
    assert IDENTITY_DIVCOUNT_D_EQ_Dm1 is True


def test_divcount_q_prime():
    """d(q) = d(5) = 2 = D-1 (prime)."""
    from urt.euler_totient_cathedral import DIVCOUNT_q, IDENTITY_DIVCOUNT_q_EQ_Dm1
    assert DIVCOUNT_q == 2
    assert IDENTITY_DIVCOUNT_q_EQ_Dm1 is True


def test_divcount_N_prime():
    """d(N) = d(13) = 2 = D-1 (prime)."""
    from urt.euler_totient_cathedral import DIVCOUNT_N, IDENTITY_DIVCOUNT_N_EQ_Dm1
    assert DIVCOUNT_N == 2
    assert IDENTITY_DIVCOUNT_N_EQ_Dm1 is True


def test_divcount_Dfac_eq_Dp1():
    """d(D!) = d(6) = 4 = D+1. Divisors of 6: {1,2,3,6}."""
    from urt.euler_totient_cathedral import DIVCOUNT_Dfac, IDENTITY_DIVCOUNT_Dfac_EQ_Dp1
    assert DIVCOUNT_Dfac == 4
    assert IDENTITY_DIVCOUNT_Dfac_EQ_Dp1 is True


def test_divcount_V_eq_Dfac_miracle():
    """d(V) = d(12) = 6 = D! — number of divisors of V equals D!."""
    from urt.euler_totient_cathedral import DIVCOUNT_V, IDENTITY_DIVCOUNT_V_EQ_Dfac
    assert DIVCOUNT_V == 6, "d(12) must equal 6 = D! = 3!"
    assert IDENTITY_DIVCOUNT_V_EQ_Dfac is True


def test_divcount_G_eq_V_miracle():
    """d(G) = d(60) = 12 = V — number of divisors of G equals V."""
    from urt.euler_totient_cathedral import DIVCOUNT_G, IDENTITY_DIVCOUNT_G_EQ_V
    assert DIVCOUNT_G == 12, "d(60) must equal 12 = V"
    assert IDENTITY_DIVCOUNT_G_EQ_V is True


def test_divisors_of_12_list():
    """Verify the 6 divisors of 12 are {1,2,3,4,6,12}."""
    from urt.euler_totient_cathedral import divisor_count, sigma
    divisors_12 = [i for i in range(1, 13) if 12 % i == 0]
    assert sorted(divisors_12) == [1, 2, 3, 4, 6, 12]
    assert len(divisors_12) == 6
    assert sum(divisors_12) == 28


def test_divisors_of_60_list():
    """Verify the 12 divisors of 60 are {1,2,3,4,5,6,10,12,15,20,30,60}."""
    from urt.euler_totient_cathedral import divisor_count, sigma
    divisors_60 = [i for i in range(1, 61) if 60 % i == 0]
    assert sorted(divisors_60) == [1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60]
    assert len(divisors_60) == 12
    assert sum(divisors_60) == 168


# ── Section 4: Jordan J₂ and Ramanujan sums ───────────────────────────────────

def test_j2_N_is_168():
    """J₂(N) = J₂(13) = 13²-1 = 168."""
    from urt.euler_totient_cathedral import J2_N, IDENTITY_J2_N_IS_168
    assert J2_N == 168
    assert IDENTITY_J2_N_IS_168 is True


def test_j2_N_eq_sigma_G_amazing():
    """THE AMAZING COINCIDENCE: J₂(N) = σ(G) = 168."""
    from urt.euler_totient_cathedral import J2_N, SIGMA_G, IDENTITY_J2_N_EQ_SIGMA_G
    assert J2_N == SIGMA_G, "J₂(N) must equal σ(G)!"
    assert J2_N == 168
    assert SIGMA_G == 168
    assert IDENTITY_J2_N_EQ_SIGMA_G is True


def test_j2_D_eq_2pD():
    """J₂(D) = J₂(3) = 8 = 2^D."""
    from urt.euler_totient_cathedral import J2_D, IDENTITY_J2_D_EQ_2pD
    assert J2_D == 8
    assert IDENTITY_J2_D_EQ_2pD is True


def test_j2_q_eq_2V():
    """J₂(q) = J₂(5) = 24 = 2V."""
    from urt.euler_totient_cathedral import J2_q, IDENTITY_J2_q_EQ_2V
    assert J2_q == 24
    assert IDENTITY_J2_q_EQ_2V is True


def test_ramanujan_N_eq_V():
    """c_N(1) = φ(N) = V = 12."""
    from urt.euler_totient_cathedral import C_N_1, IDENTITY_RAMANUJAN_N_EQ_V, IDENTITY_RAMANUJAN_N_EQ_PHI_N
    assert C_N_1 == 12
    assert IDENTITY_RAMANUJAN_N_EQ_V is True
    assert IDENTITY_RAMANUJAN_N_EQ_PHI_N is True


def test_ramanujan_q_eq_Dp1():
    """c_q(1) = φ(q) = 4 = D+1."""
    from urt.euler_totient_cathedral import C_q_1, IDENTITY_RAMANUJAN_q_EQ_Dp1
    assert C_q_1 == 4
    assert IDENTITY_RAMANUJAN_q_EQ_Dp1 is True


def test_ramanujan_D_eq_Dm1():
    """c_D(1) = φ(D) = 2 = D-1."""
    from urt.euler_totient_cathedral import C_D_1, IDENTITY_RAMANUJAN_D_EQ_Dm1
    assert C_D_1 == 2
    assert IDENTITY_RAMANUJAN_D_EQ_Dm1 is True


# ── Section 5: Multiplicativity ───────────────────────────────────────────────

def test_phi_multiplicative_Dq():
    """φ(D×q) = φ(D)×φ(q) = 8 = 2^D (since gcd(3,5)=1)."""
    from urt.euler_totient_cathedral import PHI_Dq, PHI_D, PHI_q, IDENTITY_PHI_MULT_Dq, IDENTITY_PHI_MULT_Dq_VAL
    assert PHI_Dq == PHI_D * PHI_q
    assert PHI_Dq == 8
    assert IDENTITY_PHI_MULT_Dq is True
    assert IDENTITY_PHI_MULT_Dq_VAL is True


def test_phi_multiplicative_DN():
    """φ(D×N) = φ(D)×φ(N) = 24 = 2V (since gcd(3,13)=1)."""
    from urt.euler_totient_cathedral import PHI_DN, PHI_D, PHI_N, IDENTITY_PHI_MULT_DN, IDENTITY_PHI_MULT_DN_VAL
    assert PHI_DN == PHI_D * PHI_N
    assert PHI_DN == 24
    assert IDENTITY_PHI_MULT_DN is True
    assert IDENTITY_PHI_MULT_DN_VAL is True


def test_sigma_multiplicative_Dq():
    """σ(D×q) = σ(D)×σ(q) = 24 = 2V (since gcd(3,5)=1)."""
    from urt.euler_totient_cathedral import SIGMA_Dq, SIGMA_D, SIGMA_q, IDENTITY_SIGMA_MULT_Dq, IDENTITY_SIGMA_MULT_Dq_VAL
    assert SIGMA_Dq == SIGMA_D * SIGMA_q
    assert SIGMA_Dq == 24
    assert IDENTITY_SIGMA_MULT_Dq is True
    assert IDENTITY_SIGMA_MULT_Dq_VAL is True


def test_divcount_multiplicative_Dq():
    """d(D×q) = d(D)×d(q) = 4 = D+1 (since gcd(3,5)=1)."""
    from urt.euler_totient_cathedral import DIVCOUNT_Dq, DIVCOUNT_D, DIVCOUNT_q, IDENTITY_DIVCOUNT_MULT_Dq, IDENTITY_DIVCOUNT_MULT_Dq_VAL
    assert DIVCOUNT_Dq == DIVCOUNT_D * DIVCOUNT_q
    assert DIVCOUNT_Dq == 4
    assert IDENTITY_DIVCOUNT_MULT_Dq is True
    assert IDENTITY_DIVCOUNT_MULT_Dq_VAL is True


def test_phi_15_value():
    """φ(15) = 8: independent check using euler_phi function."""
    from urt.euler_totient_cathedral import euler_phi
    assert euler_phi(15) == 8


def test_phi_39_value():
    """φ(39) = 24: independent check using euler_phi function."""
    from urt.euler_totient_cathedral import euler_phi
    assert euler_phi(39) == 24


def test_sigma_15_value():
    """σ(15) = 24 = 2V: divisors of 15 are {1,3,5,15}, sum=24."""
    from urt.euler_totient_cathedral import sigma
    assert sigma(15) == 24


def test_divcount_15_value():
    """d(15) = 4: divisors of 15 are {1,3,5,15}."""
    from urt.euler_totient_cathedral import divisor_count
    assert divisor_count(15) == 4


# ── Section 6: Sum and composite identities ──────────────────────────────────

def test_phi_sum_DqN_eq_18():
    """φ(D)+φ(q)+φ(N) = 2+4+12 = 18 = (D-1)×D²."""
    from urt.euler_totient_cathedral import PHI_SUM_DqN, IDENTITY_PHI_SUM_DqN, IDENTITY_PHI_SUM_DqN_IS_18
    assert PHI_SUM_DqN == 18
    assert IDENTITY_PHI_SUM_DqN_IS_18 is True
    assert IDENTITY_PHI_SUM_DqN is True


def test_phi_sum_DqN_formula():
    """Sum = (D-1)×D² = 2×9 = 18."""
    from urt.euler_totient_cathedral import PHI_SUM_DqN
    D = 3
    assert PHI_SUM_DqN == (D - 1) * D ** 2


def test_phi_prod_DqN_eq_96():
    """φ(D)×φ(q)×φ(N) = 2×4×12 = 96 = 2^D×V."""
    from urt.euler_totient_cathedral import PHI_PROD_DqN, IDENTITY_PHI_PROD_DqN, IDENTITY_PHI_PROD_DqN_IS_96
    assert PHI_PROD_DqN == 96
    assert IDENTITY_PHI_PROD_DqN_IS_96 is True
    assert IDENTITY_PHI_PROD_DqN is True


def test_phi_prod_DqN_formula():
    """Product = 2^D × V = 8×12 = 96."""
    from urt.euler_totient_cathedral import PHI_PROD_DqN
    D, V = 3, 12
    assert PHI_PROD_DqN == (2 ** D) * V


def test_sigma_V_plus_phi_N_eq_40():
    """σ(V)+φ(N) = 28+12 = 40 = 2^D×q."""
    from urt.euler_totient_cathedral import SIGMA_V_PLUS_PHI_N, IDENTITY_SIGMA_V_PLUS_PHI_N, IDENTITY_SIGMA_V_PLUS_PHI_N_IS_40
    assert SIGMA_V_PLUS_PHI_N == 40
    assert IDENTITY_SIGMA_V_PLUS_PHI_N_IS_40 is True
    assert IDENTITY_SIGMA_V_PLUS_PHI_N is True


def test_sigma_V_plus_phi_N_formula():
    """28+12=40 = 2^D × q = 8×5."""
    from urt.euler_totient_cathedral import SIGMA_V_PLUS_PHI_N
    D, q = 3, 5
    assert SIGMA_V_PLUS_PHI_N == (2 ** D) * q


def test_phi_N_times_divcount_Dfac():
    """φ(N)×d(D!) = 12×4 = 48 = 4V."""
    from urt.euler_totient_cathedral import IDENTITY_PHI_N_TIMES_DIVCOUNT_Dfac
    assert IDENTITY_PHI_N_TIMES_DIVCOUNT_Dfac is True


def test_sigma_Dfac_ratio():
    """σ(D!)/V = 12/12 = 1 exactly."""
    from urt.euler_totient_cathedral import IDENTITY_SIGMA_Dfac_RATIO_1
    assert IDENTITY_SIGMA_Dfac_RATIO_1 is True


# ── Aggregate flag ────────────────────────────────────────────────────────────

def test_all_totient_identities_dict_keys():
    """ALL_TOTIENT_IDENTITIES has >= 30 entries."""
    from urt.euler_totient_cathedral import ALL_TOTIENT_IDENTITIES
    assert len(ALL_TOTIENT_IDENTITIES) >= 30


def test_all_totient_identities_all_true():
    """Every entry in ALL_TOTIENT_IDENTITIES is True."""
    from urt.euler_totient_cathedral import ALL_TOTIENT_IDENTITIES
    failed = [k for k, v in ALL_TOTIENT_IDENTITIES.items() if not v]
    assert failed == [], f"Failed identities: {failed}"


def test_all_totient_exact_flag():
    """ALL_TOTIENT_EXACT is True."""
    from urt.euler_totient_cathedral import ALL_TOTIENT_EXACT
    assert ALL_TOTIENT_EXACT is True


# ── Summary dict ──────────────────────────────────────────────────────────────

def test_totient_summary_returns_dict():
    """totient_summary() returns a dict."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    assert isinstance(s, dict)


def test_totient_summary_keys():
    """Summary dict contains expected keys."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    for key in ["PHI_N", "SIGMA_V", "DIVCOUNT_G", "J2_N", "C_N_1",
                "ALL_TOTIENT_EXACT", "N_IDENTITIES", "N_PASSING",
                "D", "N", "V", "E", "F", "q", "G", "DELTA_STAR"]:
        assert key in s, f"Key '{key}' missing from summary"


def test_totient_summary_phi_N_eq_V():
    """Summary PHI_N == V == 12."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    assert s["PHI_N"] == 12
    assert s["PHI_N"] == s["V"]


def test_totient_summary_sigma_V_eq_28():
    """Summary SIGMA_V == 28."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    assert s["SIGMA_V"] == 28


def test_totient_summary_divcount_G_eq_V():
    """Summary DIVCOUNT_G == V == 12."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    assert s["DIVCOUNT_G"] == 12
    assert s["DIVCOUNT_G"] == s["V"]


def test_totient_summary_j2_N_eq_sigma_G():
    """Summary J2_N == SIGMA_G == 168."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    assert s["J2_N"] == 168


def test_totient_summary_all_exact():
    """Summary ALL_TOTIENT_EXACT is True."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    assert s["ALL_TOTIENT_EXACT"] is True


def test_totient_summary_n_identities():
    """Summary N_IDENTITIES >= 30 and N_PASSING == N_IDENTITIES."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    assert s["N_IDENTITIES"] >= 30
    assert s["N_PASSING"] == s["N_IDENTITIES"]


def test_totient_summary_cathedral_integers():
    """Summary embeds correct Cathedral integers."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    assert s["D"] == 3
    assert s["N"] == 13
    assert s["V"] == 12
    assert s["E"] == 30
    assert s["F"] == 20
    assert s["q"] == 5
    assert s["G"] == 60


def test_totient_summary_delta_star():
    """Summary DELTA_STAR ≈ 0.14751."""
    from urt.euler_totient_cathedral import totient_summary
    s = totient_summary()
    assert abs(s["DELTA_STAR"] - 0.14751) < 1e-4


# ── Print report ──────────────────────────────────────────────────────────────

def test_print_totient_report_runs(capsys):
    """print_totient_report() runs without error and produces > 300 chars."""
    from urt.euler_totient_cathedral import print_totient_report
    print_totient_report()
    out = capsys.readouterr().out
    assert len(out) > 300, f"Report too short: {len(out)} chars"


def test_print_totient_report_contains_miracle(capsys):
    """Report mentions the φ(N)=V miracle."""
    from urt.euler_totient_cathedral import print_totient_report
    print_totient_report()
    out = capsys.readouterr().out
    assert "MIRACLE" in out or "miracle" in out


def test_print_totient_report_contains_168(capsys):
    """Report shows 168 (J₂(N)=σ(G) coincidence)."""
    from urt.euler_totient_cathedral import print_totient_report
    print_totient_report()
    out = capsys.readouterr().out
    assert "168" in out


def test_print_totient_report_contains_perfect(capsys):
    """Report mentions PERFECT number."""
    from urt.euler_totient_cathedral import print_totient_report
    print_totient_report()
    out = capsys.readouterr().out
    assert "PERFECT" in out or "perfect" in out


# ── Cross-reference: module-level asserts already ran ─────────────────────────

def test_module_load_triggers_no_assertion_error():
    """Module-level asserts all pass — import is the test."""
    import importlib
    import urt.euler_totient_cathedral as mod
    importlib.reload(mod)   # reload to re-trigger asserts


# ── Additional numerical spot-checks ─────────────────────────────────────────

def test_euler_phi_24():
    """φ(24) = 8 = 2^3 = 2^D."""
    from urt.euler_totient_cathedral import euler_phi
    assert euler_phi(24) == 8


def test_euler_phi_60():
    """φ(60) = 16 = 2^4 = 2^(D+1)."""
    from urt.euler_totient_cathedral import euler_phi
    assert euler_phi(60) == 16


def test_sigma_6():
    """σ(6) = 12 = V (divisors 1+2+3+6=12)."""
    from urt.euler_totient_cathedral import sigma
    assert sigma(6) == 12


def test_sigma_perfect_numbers():
    """σ(n)=2n for perfect numbers 6 and 28."""
    from urt.euler_totient_cathedral import sigma
    assert sigma(6) == 12 == 2 * 6
    assert sigma(28) == 56 == 2 * 28


def test_divcount_24():
    """d(24) = 8 = 2^D."""
    from urt.euler_totient_cathedral import divisor_count
    assert divisor_count(24) == 8


def test_j2_prime_formula():
    """J₂(p) = p²-1 for primes."""
    from urt.euler_totient_cathedral import jordan_totient_j2
    for p in [3, 5, 7, 11, 13]:
        assert jordan_totient_j2(p) == p * p - 1, f"J₂({p}) ≠ {p}²-1"
