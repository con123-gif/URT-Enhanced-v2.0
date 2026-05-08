"""Tests for urt/ramanujan_cathedral.py — Ramanujan's Mathematics & Cathedral Integers."""

import pytest
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    """All public names importable without error."""
    from urt.ramanujan_cathedral import (
        # helper functions
        sigma, num_divisors, euler_phi, mobius, ramanujan_sum,
        omega, r3, fibonacci, lucas, pisano_period, partition,
        # tau function
        tau, TAU_VALUES, TAU_1, TAU_2, TAU_3, TAU_5, TAU_7,
        TAU_4, TAU_6, TAU_8, TAU_9, TAU_10, TAU_V, TAU_N,
        B_V_BERNOULLI_NUMERATOR,
        # tau identities
        IDENTITY_TAU_2_IS_NEG_2V, IDENTITY_TAU_3_CATHEDRAL,
        IDENTITY_TAU_5_CATHEDRAL, IDENTITY_TAU_7_CATHEDRAL,
        IDENTITY_TAU_4_HECKE, IDENTITY_TAU_9_HECKE, IDENTITY_TAU_8_HECKE,
        IDENTITY_TAU_MULT_6, IDENTITY_TAU_MULT_10, IDENTITY_TAU_MULT_V,
        IDENTITY_TAU_MOD_691_D, IDENTITY_TAU_MOD_691_q, IDENTITY_TAU_MOD_691_N,
        # taxicab
        TAXICAB_2,
        IDENTITY_TAXICAB_2_IS_V3_PLUS_1, IDENTITY_TAXICAB_2_IS_2Q3_PLUS_D6,
        IDENTITY_TAXICAB_2_CATHEDRAL_FACTORS, IDENTITY_TAXICAB_2_MOD_N_ZERO,
        IDENTITY_TAXICAB_2_OMEGA_IS_D,
        # Ramanujan constant
        RAMANUJAN_CONST_ARG, IDENTITY_163_CATHEDRAL,
        # mock theta
        N_MOCK_THETA_ORDER3_FUNCS, N_MOCK_THETA_ORDER5_FUNCS,
        IDENTITY_MOCK_3_COUNT_IS_D, IDENTITY_MOCK_5_COUNT_IS_q,
        # Rogers-Ramanujan
        RR_MODULUS, IDENTITY_RR_MODULUS_IS_q,
        # sigma
        SIGMA_D, SIGMA_q, SIGMA_N, SIGMA_V, SIGMA_DFACT, SIGMA_F, SIGMA_G,
        IDENTITY_SIGMA_D_IS_D_PLUS_1, IDENTITY_SIGMA_q_IS_DFACT,
        IDENTITY_SIGMA_N_IS_N_PLUS_1, IDENTITY_SIGMA_V_IS_D_PLUS_1_DFACT_PLUS_1,
        IDENTITY_SIGMA_DFACT_IS_V, IDENTITY_SIGMA_F_IS_DFACT_DFACT_PLUS_1,
        IDENTITY_SIGMA_G_CATHEDRAL,
        # num_divisors
        NDIV_D, NDIV_q, NDIV_N, NDIV_V, NDIV_DFACT, NDIV_F, NDIV_G,
        IDENTITY_NDIV_D_IS_D_MINUS_1, IDENTITY_NDIV_q_IS_D_MINUS_1,
        IDENTITY_NDIV_N_IS_D_MINUS_1, IDENTITY_NDIV_V_IS_DFACT,
        IDENTITY_NDIV_DFACT_IS_D_PLUS_1, IDENTITY_NDIV_F_IS_DFACT,
        IDENTITY_NDIV_G_IS_V,
        # euler phi
        PHI_D, PHI_q, PHI_N, PHI_DFACT, PHI_V, PHI_G,
        IDENTITY_PHI_D_IS_D_MINUS_1, IDENTITY_PHI_q_IS_D_PLUS_1,
        IDENTITY_PHI_N_IS_V, IDENTITY_PHI_DFACT_IS_D_MINUS_1,
        IDENTITY_PHI_V_IS_D_PLUS_1, IDENTITY_PHI_G_IS_2_D_PLUS_1,
        # Ramanujan sums
        C_D_1, C_q_1, C_N_1, C_D_D, C_q_q, C_N_N,
        IDENTITY_C_D_1_IS_MU_D, IDENTITY_C_q_1_IS_MU_q, IDENTITY_C_N_1_IS_MU_N,
        IDENTITY_C_D_D_IS_PHI_D, IDENTITY_C_q_q_IS_D_PLUS_1, IDENTITY_C_N_N_IS_V,
        # r3
        R3_1, R3_D, IDENTITY_R3_1_IS_DFACT, IDENTITY_R3_D_IS_2_TO_D,
        # Fibonacci/Lucas
        FIB_q, FIB_DFACT_PLUS_1, LUC_D,
        IDENTITY_FIB_q_IS_q, IDENTITY_FIB_DFACT_PLUS_1_IS_N,
        IDENTITY_LUC_D_IS_D_PLUS_1, IDENTITY_CASSINI_D,
        # Pisano
        PISANO_q, PISANO_2, IDENTITY_PISANO_q_IS_F, IDENTITY_PISANO_2_IS_D,
        # pentagonal
        PENT_D, PENT_D_MINUS_1,
        IDENTITY_PENT_D_IS_V, IDENTITY_PENT_D_MINUS_1_IS_q,
        # partition
        PART_D, PART_D_PLUS_1, PART_q,
        IDENTITY_PART_D_IS_D, IDENTITY_PART_D_PLUS_1_IS_q,
        IDENTITY_PART_q_IS_DFACT_PLUS_1, IDENTITY_PART_CONG_MOD_q,
        # perfect
        IDENTITY_DFACT_IS_PERFECT, IDENTITY_D_PLUS_1_DFACT_PLUS_1_IS_PERFECT,
        # sum of squares
        SUM_D_SQUARES, IDENTITY_SUM_D_SQUARES_IS_N_PLUS_1,
        # master list
        ALL_RAMANUJAN_IDENTITIES, ALL_RAMANUJAN_EXACT,
        # summary functions
        tau_function_summary, taxicab_summary, divisor_summary,
        fibonacci_summary, partition_summary,
        ramanujan_cathedral_summary, print_ramanujan_report,
    )


# ── Cathedral integer fixtures ────────────────────────────────────────────────

@pytest.fixture
def cathedral():
    from urt.shell_closure import D, N, V, E, F, q, G
    return {"D": D, "N": N, "V": V, "E": E, "F": F, "q": q, "G": G}


# ── ALL identities True ───────────────────────────────────────────────────────

def test_all_ramanujan_identities_true():
    """ALL_RAMANUJAN_EXACT must be True — every identity in the master list holds."""
    from urt.ramanujan_cathedral import ALL_RAMANUJAN_EXACT, ALL_RAMANUJAN_IDENTITIES
    failed = [i for i, v in enumerate(ALL_RAMANUJAN_IDENTITIES) if not v]
    assert ALL_RAMANUJAN_EXACT, f"Failed identity indices: {failed}"


def test_master_list_has_at_least_30_identities():
    """There are at least 30 Cathedral Ramanujan identities."""
    from urt.ramanujan_cathedral import ALL_RAMANUJAN_IDENTITIES
    assert len(ALL_RAMANUJAN_IDENTITIES) >= 30


# ── Tau function ──────────────────────────────────────────────────────────────

def test_tau_values_correct():
    """Spot-check a few τ values against the known table."""
    from urt.ramanujan_cathedral import tau
    assert tau(1) == 1
    assert tau(2) == -24
    assert tau(3) == 252
    assert tau(5) == 4830
    assert tau(13) == -577738


def test_tau_2_is_neg_2V(cathedral):
    """τ(2) = −2V = −24 (icosahedral vertex count)."""
    from urt.ramanujan_cathedral import TAU_2, IDENTITY_TAU_2_IS_NEG_2V
    assert TAU_2 == -24
    assert TAU_2 == -2 * cathedral["V"]
    assert IDENTITY_TAU_2_IS_NEG_2V


def test_tau_3_cathedral(cathedral):
    """τ(3) = (D+1)×(D!+1)×D² = 4×7×9 = 252."""
    from urt.ramanujan_cathedral import TAU_3, IDENTITY_TAU_3_CATHEDRAL
    D = cathedral["D"]
    assert TAU_3 == 252
    assert TAU_3 == (D + 1) * (factorial(D) + 1) * D ** 2
    assert IDENTITY_TAU_3_CATHEDRAL


def test_tau_5_cathedral(cathedral):
    """τ(5) = (D−1)×D×q×(D!+1)×(N+2q) = 2×3×5×7×23 = 4830."""
    from urt.ramanujan_cathedral import TAU_5, IDENTITY_TAU_5_CATHEDRAL
    D, N, q = cathedral["D"], cathedral["N"], cathedral["q"]
    assert TAU_5 == 4830
    assert TAU_5 == (D - 1) * D * q * (factorial(D) + 1) * (N + 2 * q)
    assert IDENTITY_TAU_5_CATHEDRAL


def test_tau_7_cathedral(cathedral):
    """τ(7) = −2^D×(D!+1)×N×(N+2q) = −8×7×13×23 = −16744."""
    from urt.ramanujan_cathedral import TAU_7, IDENTITY_TAU_7_CATHEDRAL
    D, N, q = cathedral["D"], cathedral["N"], cathedral["q"]
    assert TAU_7 == -16744
    assert TAU_7 == -(2 ** D) * (factorial(D) + 1) * N * (N + 2 * q)
    assert IDENTITY_TAU_7_CATHEDRAL


def test_tau_hecke_p_squared(cathedral):
    """τ(p²) = τ(p)² − p^11 for primes p=2 and p=3."""
    from urt.ramanujan_cathedral import (
        TAU_4, TAU_9, IDENTITY_TAU_4_HECKE, IDENTITY_TAU_9_HECKE,
        TAU_2, TAU_3,
    )
    assert TAU_4 == TAU_2 ** 2 - 2 ** 11
    assert TAU_9 == TAU_3 ** 2 - 3 ** 11
    assert IDENTITY_TAU_4_HECKE
    assert IDENTITY_TAU_9_HECKE


def test_tau_hecke_p_cubed():
    """τ(8) = τ(2)×τ(4) − 2^11×τ(2)."""
    from urt.ramanujan_cathedral import TAU_8, TAU_2, TAU_4, IDENTITY_TAU_8_HECKE
    assert TAU_8 == TAU_2 * TAU_4 - 2 ** 11 * TAU_2
    assert IDENTITY_TAU_8_HECKE


def test_tau_multiplicativity(cathedral):
    """τ is multiplicative: τ(mn) = τ(m)×τ(n) for gcd(m,n)=1."""
    from urt.ramanujan_cathedral import (
        TAU_6, TAU_10, TAU_V,
        IDENTITY_TAU_MULT_6, IDENTITY_TAU_MULT_10, IDENTITY_TAU_MULT_V,
        TAU_2, TAU_3, TAU_4, TAU_5,
    )
    assert TAU_6 == TAU_2 * TAU_3      # gcd(2,3)=1
    assert TAU_10 == TAU_2 * TAU_5     # gcd(2,5)=1
    assert TAU_V == TAU_4 * TAU_3      # tau(12)=tau(4)×tau(3), gcd(4,3)=1
    assert IDENTITY_TAU_MULT_6
    assert IDENTITY_TAU_MULT_10
    assert IDENTITY_TAU_MULT_V


def test_tau_ramanujan_congruence_mod_691(cathedral):
    """τ(p) ≡ 1+p^11 (mod 691) for Cathedral primes p = D, q, N."""
    from urt.ramanujan_cathedral import (
        IDENTITY_TAU_MOD_691_D, IDENTITY_TAU_MOD_691_q, IDENTITY_TAU_MOD_691_N,
        B_V_BERNOULLI_NUMERATOR,
    )
    assert B_V_BERNOULLI_NUMERATOR == 691
    assert IDENTITY_TAU_MOD_691_D
    assert IDENTITY_TAU_MOD_691_q
    assert IDENTITY_TAU_MOD_691_N


def test_tau_function_raises_out_of_range():
    """tau(n) raises ValueError for n outside tabulated range."""
    from urt.ramanujan_cathedral import tau
    with pytest.raises(ValueError):
        tau(0)
    with pytest.raises(ValueError):
        tau(14)


# ── Taxicab number ────────────────────────────────────────────────────────────

def test_taxicab_2_value():
    """TAXICAB_2 = 1729."""
    from urt.ramanujan_cathedral import TAXICAB_2
    assert TAXICAB_2 == 1729


def test_taxicab_2_cube_decompositions(cathedral):
    """1729 = 12³+1³ = 10³+9³ (the Hardy-Ramanujan pair)."""
    from urt.ramanujan_cathedral import TAXICAB_2
    V = cathedral["V"]
    assert 12 ** 3 + 1 ** 3 == TAXICAB_2
    assert 10 ** 3 + 9 ** 3 == TAXICAB_2
    assert V ** 3 + 1 == TAXICAB_2


def test_taxicab_2_is_v3_plus_1(cathedral):
    """1729 = V³ + 1 exactly."""
    from urt.ramanujan_cathedral import IDENTITY_TAXICAB_2_IS_V3_PLUS_1
    assert IDENTITY_TAXICAB_2_IS_V3_PLUS_1


def test_taxicab_2_is_2q3_plus_d6(cathedral):
    """1729 = (2q)³ + D⁶."""
    from urt.ramanujan_cathedral import IDENTITY_TAXICAB_2_IS_2Q3_PLUS_D6
    D, q = cathedral["D"], cathedral["q"]
    assert (2 * q) ** 3 + D ** 6 == 1729
    assert IDENTITY_TAXICAB_2_IS_2Q3_PLUS_D6


def test_taxicab_2_cathedral_factors(cathedral):
    """1729 = N × (D!+1) × (2D+N) = 13×7×19."""
    from urt.ramanujan_cathedral import IDENTITY_TAXICAB_2_CATHEDRAL_FACTORS
    D, N = cathedral["D"], cathedral["N"]
    assert N * (factorial(D) + 1) * (2 * D + N) == 1729
    assert IDENTITY_TAXICAB_2_CATHEDRAL_FACTORS


def test_taxicab_2_mod_n_zero(cathedral):
    """1729 is divisible by N=13."""
    from urt.ramanujan_cathedral import IDENTITY_TAXICAB_2_MOD_N_ZERO
    assert 1729 % cathedral["N"] == 0
    assert IDENTITY_TAXICAB_2_MOD_N_ZERO


def test_taxicab_2_omega_is_d(cathedral):
    """ω(1729) = D = 3 (three distinct prime factors: 7, 13, 19)."""
    from urt.ramanujan_cathedral import IDENTITY_TAXICAB_2_OMEGA_IS_D, omega
    assert omega(1729) == cathedral["D"]
    assert IDENTITY_TAXICAB_2_OMEGA_IS_D


# ── Ramanujan's constant ──────────────────────────────────────────────────────

def test_heegner_163_cathedral(cathedral):
    """163 = V×N + (D!+1) = 12×13 + 7."""
    from urt.ramanujan_cathedral import RAMANUJAN_CONST_ARG, IDENTITY_163_CATHEDRAL
    D, N, V = cathedral["D"], cathedral["N"], cathedral["V"]
    assert RAMANUJAN_CONST_ARG == 163
    assert 163 == V * N + factorial(D) + 1
    assert IDENTITY_163_CATHEDRAL


# ── Mock theta functions ──────────────────────────────────────────────────────

def test_mock_theta_order3_count_is_d(cathedral):
    """There are D=3 third-order mock theta functions."""
    from urt.ramanujan_cathedral import N_MOCK_THETA_ORDER3_FUNCS, IDENTITY_MOCK_3_COUNT_IS_D
    assert N_MOCK_THETA_ORDER3_FUNCS == cathedral["D"]
    assert IDENTITY_MOCK_3_COUNT_IS_D


def test_mock_theta_order5_count_is_q(cathedral):
    """There are q=5 fifth-order mock theta functions."""
    from urt.ramanujan_cathedral import N_MOCK_THETA_ORDER5_FUNCS, IDENTITY_MOCK_5_COUNT_IS_q
    assert N_MOCK_THETA_ORDER5_FUNCS == cathedral["q"]
    assert IDENTITY_MOCK_5_COUNT_IS_q


# ── Rogers-Ramanujan ──────────────────────────────────────────────────────────

def test_rr_modulus_is_q(cathedral):
    """Rogers-Ramanujan identities have modulus q=5."""
    from urt.ramanujan_cathedral import RR_MODULUS, IDENTITY_RR_MODULUS_IS_q
    assert RR_MODULUS == cathedral["q"]
    assert IDENTITY_RR_MODULUS_IS_q


# ── Sigma (sum of divisors) ───────────────────────────────────────────────────

def test_sigma_d_is_d_plus_1(cathedral):
    """σ(D) = σ(3) = 4 = D+1."""
    from urt.ramanujan_cathedral import SIGMA_D, IDENTITY_SIGMA_D_IS_D_PLUS_1
    D = cathedral["D"]
    assert SIGMA_D == D + 1
    assert IDENTITY_SIGMA_D_IS_D_PLUS_1


def test_sigma_q_is_dfact(cathedral):
    """σ(q) = σ(5) = 6 = D!."""
    from urt.ramanujan_cathedral import SIGMA_q, IDENTITY_SIGMA_q_IS_DFACT
    D = cathedral["D"]
    assert SIGMA_q == factorial(D)
    assert IDENTITY_SIGMA_q_IS_DFACT


def test_sigma_n_is_n_plus_1(cathedral):
    """σ(N) = σ(13) = 14 = N+1 (N is prime)."""
    from urt.ramanujan_cathedral import SIGMA_N, IDENTITY_SIGMA_N_IS_N_PLUS_1
    N = cathedral["N"]
    assert SIGMA_N == N + 1
    assert IDENTITY_SIGMA_N_IS_N_PLUS_1


def test_sigma_v_is_d_plus_1_dfact_plus_1(cathedral):
    """σ(V) = σ(12) = 28 = (D+1)(D!+1)."""
    from urt.ramanujan_cathedral import SIGMA_V, IDENTITY_SIGMA_V_IS_D_PLUS_1_DFACT_PLUS_1
    D = cathedral["D"]
    assert SIGMA_V == (D + 1) * (factorial(D) + 1)
    assert IDENTITY_SIGMA_V_IS_D_PLUS_1_DFACT_PLUS_1


def test_sigma_dfact_is_v(cathedral):
    """σ(D!) = σ(6) = 12 = V."""
    from urt.ramanujan_cathedral import SIGMA_DFACT, IDENTITY_SIGMA_DFACT_IS_V
    V = cathedral["V"]
    assert SIGMA_DFACT == V
    assert IDENTITY_SIGMA_DFACT_IS_V


def test_sigma_f_is_dfact_dfact_plus_1(cathedral):
    """σ(F) = σ(20) = 42 = D!×(D!+1)."""
    from urt.ramanujan_cathedral import SIGMA_F, IDENTITY_SIGMA_F_IS_DFACT_DFACT_PLUS_1
    D = cathedral["D"]
    df = factorial(D)
    assert SIGMA_F == df * (df + 1)
    assert IDENTITY_SIGMA_F_IS_DFACT_DFACT_PLUS_1


def test_sigma_g_cathedral(cathedral):
    """σ(G) = σ(60) = 168 = D!×(D+1)×(D!+1)."""
    from urt.ramanujan_cathedral import SIGMA_G, IDENTITY_SIGMA_G_CATHEDRAL
    D = cathedral["D"]
    df = factorial(D)
    assert SIGMA_G == df * (D + 1) * (df + 1)
    assert IDENTITY_SIGMA_G_CATHEDRAL


# ── Number of divisors d(n) ───────────────────────────────────────────────────

def test_ndiv_primes_are_d_minus_1(cathedral):
    """d(D) = d(q) = d(N) = D−1 = 2 (all three are prime)."""
    from urt.ramanujan_cathedral import (
        NDIV_D, NDIV_q, NDIV_N,
        IDENTITY_NDIV_D_IS_D_MINUS_1, IDENTITY_NDIV_q_IS_D_MINUS_1,
        IDENTITY_NDIV_N_IS_D_MINUS_1,
    )
    D = cathedral["D"]
    assert NDIV_D == D - 1
    assert NDIV_q == D - 1
    assert NDIV_N == D - 1
    assert IDENTITY_NDIV_D_IS_D_MINUS_1
    assert IDENTITY_NDIV_q_IS_D_MINUS_1
    assert IDENTITY_NDIV_N_IS_D_MINUS_1


def test_ndiv_v_is_dfact(cathedral):
    """d(V) = d(12) = 6 = D!."""
    from urt.ramanujan_cathedral import NDIV_V, IDENTITY_NDIV_V_IS_DFACT
    D = cathedral["D"]
    assert NDIV_V == factorial(D)
    assert IDENTITY_NDIV_V_IS_DFACT


def test_ndiv_dfact_is_d_plus_1(cathedral):
    """d(D!) = d(6) = 4 = D+1."""
    from urt.ramanujan_cathedral import NDIV_DFACT, IDENTITY_NDIV_DFACT_IS_D_PLUS_1
    D = cathedral["D"]
    assert NDIV_DFACT == D + 1
    assert IDENTITY_NDIV_DFACT_IS_D_PLUS_1


def test_ndiv_f_is_dfact(cathedral):
    """d(F) = d(20) = 6 = D!."""
    from urt.ramanujan_cathedral import NDIV_F, IDENTITY_NDIV_F_IS_DFACT
    D = cathedral["D"]
    assert NDIV_F == factorial(D)
    assert IDENTITY_NDIV_F_IS_DFACT


def test_ndiv_g_is_v(cathedral):
    """d(G) = d(60) = 12 = V."""
    from urt.ramanujan_cathedral import NDIV_G, IDENTITY_NDIV_G_IS_V
    V = cathedral["V"]
    assert NDIV_G == V
    assert IDENTITY_NDIV_G_IS_V


# ── Euler totient φ(n) ────────────────────────────────────────────────────────

def test_phi_d_is_d_minus_1(cathedral):
    """φ(D) = φ(3) = 2 = D−1."""
    from urt.ramanujan_cathedral import PHI_D, IDENTITY_PHI_D_IS_D_MINUS_1
    D = cathedral["D"]
    assert PHI_D == D - 1
    assert IDENTITY_PHI_D_IS_D_MINUS_1


def test_phi_q_is_d_plus_1(cathedral):
    """φ(q) = φ(5) = 4 = D+1."""
    from urt.ramanujan_cathedral import PHI_q, IDENTITY_PHI_q_IS_D_PLUS_1
    D = cathedral["D"]
    assert PHI_q == D + 1
    assert IDENTITY_PHI_q_IS_D_PLUS_1


def test_phi_n_is_v(cathedral):
    """φ(N) = φ(13) = 12 = V."""
    from urt.ramanujan_cathedral import PHI_N, IDENTITY_PHI_N_IS_V
    V = cathedral["V"]
    assert PHI_N == V
    assert IDENTITY_PHI_N_IS_V


def test_phi_dfact_is_d_minus_1(cathedral):
    """φ(D!) = φ(6) = 2 = D−1."""
    from urt.ramanujan_cathedral import PHI_DFACT, IDENTITY_PHI_DFACT_IS_D_MINUS_1
    D = cathedral["D"]
    assert PHI_DFACT == D - 1
    assert IDENTITY_PHI_DFACT_IS_D_MINUS_1


def test_phi_v_is_d_plus_1(cathedral):
    """φ(V) = φ(12) = 4 = D+1."""
    from urt.ramanujan_cathedral import PHI_V, IDENTITY_PHI_V_IS_D_PLUS_1
    D = cathedral["D"]
    assert PHI_V == D + 1
    assert IDENTITY_PHI_V_IS_D_PLUS_1


def test_phi_g_is_2_d_plus_1(cathedral):
    """φ(G) = φ(60) = 16 = 2^(D+1)."""
    from urt.ramanujan_cathedral import PHI_G, IDENTITY_PHI_G_IS_2_D_PLUS_1
    D = cathedral["D"]
    assert PHI_G == 2 ** (D + 1)
    assert IDENTITY_PHI_G_IS_2_D_PLUS_1


# ── Ramanujan sums ────────────────────────────────────────────────────────────

def test_ramanujan_sum_primes_equal_mobius(cathedral):
    """c_p(1) = μ(p) = −1 for primes p = D, q, N."""
    from urt.ramanujan_cathedral import (
        C_D_1, C_q_1, C_N_1,
        IDENTITY_C_D_1_IS_MU_D, IDENTITY_C_q_1_IS_MU_q, IDENTITY_C_N_1_IS_MU_N,
    )
    assert C_D_1 == -1
    assert C_q_1 == -1
    assert C_N_1 == -1
    assert IDENTITY_C_D_1_IS_MU_D
    assert IDENTITY_C_q_1_IS_MU_q
    assert IDENTITY_C_N_1_IS_MU_N


def test_ramanujan_sum_c_p_p_equals_phi_p(cathedral):
    """c_p(p) = φ(p) = p−1 for prime p."""
    from urt.ramanujan_cathedral import (
        C_D_D, C_q_q, C_N_N,
        IDENTITY_C_D_D_IS_PHI_D, IDENTITY_C_q_q_IS_D_PLUS_1, IDENTITY_C_N_N_IS_V,
    )
    D, V = cathedral["D"], cathedral["V"]
    assert C_D_D == D - 1        # φ(3) = 2 = D-1
    assert C_q_q == D + 1        # φ(5) = 4 = D+1
    assert C_N_N == V            # φ(13) = 12 = V
    assert IDENTITY_C_D_D_IS_PHI_D
    assert IDENTITY_C_q_q_IS_D_PLUS_1
    assert IDENTITY_C_N_N_IS_V


# ── Three-square representations r₃(n) ───────────────────────────────────────

def test_r3_1_is_dfact(cathedral):
    """r₃(1) = 6 = D! (six signed-unit vectors in R³)."""
    from urt.ramanujan_cathedral import R3_1, IDENTITY_R3_1_IS_DFACT
    D = cathedral["D"]
    assert R3_1 == factorial(D)
    assert IDENTITY_R3_1_IS_DFACT


def test_r3_d_is_2_to_d(cathedral):
    """r₃(D) = r₃(3) = 8 = 2^D (all sign combinations of (1,1,1))."""
    from urt.ramanujan_cathedral import R3_D, IDENTITY_R3_D_IS_2_TO_D
    D = cathedral["D"]
    assert R3_D == 2 ** D
    assert IDENTITY_R3_D_IS_2_TO_D


# ── Fibonacci/Lucas ───────────────────────────────────────────────────────────

def test_fib_q_is_q(cathedral):
    """F(q) = F(5) = 5 = q (Fibonacci self-referential at Cathedral index q)."""
    from urt.ramanujan_cathedral import FIB_q, IDENTITY_FIB_q_IS_q, fibonacci
    q = cathedral["q"]
    assert fibonacci(q) == q
    assert FIB_q == q
    assert IDENTITY_FIB_q_IS_q


def test_fib_dfact_plus_1_is_n(cathedral):
    """F(D!+1) = F(7) = 13 = N."""
    from urt.ramanujan_cathedral import FIB_DFACT_PLUS_1, IDENTITY_FIB_DFACT_PLUS_1_IS_N, fibonacci
    D, N = cathedral["D"], cathedral["N"]
    assert fibonacci(factorial(D) + 1) == N
    assert FIB_DFACT_PLUS_1 == N
    assert IDENTITY_FIB_DFACT_PLUS_1_IS_N


def test_lucas_d_is_d_plus_1(cathedral):
    """L(D) = L(3) = 4 = D+1."""
    from urt.ramanujan_cathedral import LUC_D, IDENTITY_LUC_D_IS_D_PLUS_1, lucas
    D = cathedral["D"]
    assert lucas(D) == D + 1
    assert LUC_D == D + 1
    assert IDENTITY_LUC_D_IS_D_PLUS_1


def test_cassini_identity_at_d(cathedral):
    """Cassini identity: F(D−1)×F(D+1) − F(D)² = (−1)^D."""
    from urt.ramanujan_cathedral import IDENTITY_CASSINI_D, fibonacci
    D = cathedral["D"]
    lhs = fibonacci(D - 1) * fibonacci(D + 1) - fibonacci(D) ** 2
    rhs = (-1) ** D
    assert lhs == rhs
    assert IDENTITY_CASSINI_D


# ── Pisano periods ────────────────────────────────────────────────────────────

def test_pisano_q_is_f(cathedral):
    """π(q) = π(5) = 20 = F (Pisano period of Fibonacci mod 5 equals F=20)."""
    from urt.ramanujan_cathedral import PISANO_q, IDENTITY_PISANO_q_IS_F
    F = cathedral["F"]
    assert PISANO_q == F
    assert IDENTITY_PISANO_q_IS_F


def test_pisano_2_is_d(cathedral):
    """π(2) = 3 = D (Pisano period of Fibonacci mod 2 equals D=3)."""
    from urt.ramanujan_cathedral import PISANO_2, IDENTITY_PISANO_2_IS_D
    D = cathedral["D"]
    assert PISANO_2 == D
    assert IDENTITY_PISANO_2_IS_D


# ── Euler pentagonal numbers ──────────────────────────────────────────────────

def test_pentagonal_d_is_v(cathedral):
    """P(D) = D(3D−1)/2 = 3×8/2 = 12 = V."""
    from urt.ramanujan_cathedral import PENT_D, IDENTITY_PENT_D_IS_V
    D, V = cathedral["D"], cathedral["V"]
    assert D * (3 * D - 1) // 2 == V
    assert PENT_D == V
    assert IDENTITY_PENT_D_IS_V


def test_pentagonal_d_minus_1_is_q(cathedral):
    """P(D−1) = (D−1)(3(D−1)−1)/2 = 2×5/2 = 5 = q."""
    from urt.ramanujan_cathedral import PENT_D_MINUS_1, IDENTITY_PENT_D_MINUS_1_IS_q
    D, q = cathedral["D"], cathedral["q"]
    assert (D - 1) * (3 * (D - 1) - 1) // 2 == q
    assert PENT_D_MINUS_1 == q
    assert IDENTITY_PENT_D_MINUS_1_IS_q


# ── Partition function ────────────────────────────────────────────────────────

def test_partition_d_is_d(cathedral):
    """p(D) = p(3) = 3 = D (self-referential!)."""
    from urt.ramanujan_cathedral import PART_D, IDENTITY_PART_D_IS_D
    D = cathedral["D"]
    assert PART_D == D
    assert IDENTITY_PART_D_IS_D


def test_partition_d_plus_1_is_q(cathedral):
    """p(D+1) = p(4) = 5 = q."""
    from urt.ramanujan_cathedral import PART_D_PLUS_1, IDENTITY_PART_D_PLUS_1_IS_q
    q = cathedral["q"]
    assert PART_D_PLUS_1 == q
    assert IDENTITY_PART_D_PLUS_1_IS_q


def test_partition_q_is_dfact_plus_1(cathedral):
    """p(q) = p(5) = 7 = D!+1."""
    from urt.ramanujan_cathedral import PART_q, IDENTITY_PART_q_IS_DFACT_PLUS_1
    D = cathedral["D"]
    assert PART_q == factorial(D) + 1
    assert IDENTITY_PART_q_IS_DFACT_PLUS_1


def test_partition_ramanujan_congruence_mod_q(cathedral):
    """p(qk+q−1) ≡ 0 (mod q) for k = 0..7 (Ramanujan congruence mod q=5)."""
    from urt.ramanujan_cathedral import IDENTITY_PART_CONG_MOD_q, partition
    q = cathedral["q"]
    for k in range(8):
        n = q * k + (q - 1)
        assert partition(n) % q == 0, f"p({n}) = {partition(n)} not ≡ 0 mod {q}"
    assert IDENTITY_PART_CONG_MOD_q


# ── Perfect numbers ───────────────────────────────────────────────────────────

def test_dfact_is_perfect(cathedral):
    """D! = 6 is a perfect number (σ(6) = 12 = 2×6)."""
    from urt.ramanujan_cathedral import IDENTITY_DFACT_IS_PERFECT, sigma
    D = cathedral["D"]
    df = factorial(D)
    assert sigma(df) == 2 * df
    assert IDENTITY_DFACT_IS_PERFECT


def test_28_is_perfect(cathedral):
    """(D+1)(D!+1) = 28 is a perfect number (σ(28) = 56 = 2×28)."""
    from urt.ramanujan_cathedral import IDENTITY_D_PLUS_1_DFACT_PLUS_1_IS_PERFECT, sigma
    D = cathedral["D"]
    n = (D + 1) * (factorial(D) + 1)
    assert n == 28
    assert sigma(n) == 2 * n
    assert IDENTITY_D_PLUS_1_DFACT_PLUS_1_IS_PERFECT


# ── Sum of first D squares ────────────────────────────────────────────────────

def test_sum_d_squares_is_n_plus_1(cathedral):
    """1² + 2² + 3² = 14 = N+1."""
    from urt.ramanujan_cathedral import SUM_D_SQUARES, IDENTITY_SUM_D_SQUARES_IS_N_PLUS_1
    D, N = cathedral["D"], cathedral["N"]
    assert sum(k ** 2 for k in range(1, D + 1)) == N + 1
    assert SUM_D_SQUARES == N + 1
    assert IDENTITY_SUM_D_SQUARES_IS_N_PLUS_1


# ── Helper function correctness ───────────────────────────────────────────────

def test_sigma_function_correct():
    """sigma(n) returns sum of divisors correctly for small values."""
    from urt.ramanujan_cathedral import sigma
    assert sigma(1) == 1
    assert sigma(6) == 12
    assert sigma(12) == 28
    assert sigma(28) == 56


def test_num_divisors_correct():
    """num_divisors(n) is correct for small values."""
    from urt.ramanujan_cathedral import num_divisors
    assert num_divisors(1) == 1
    assert num_divisors(6) == 4
    assert num_divisors(12) == 6
    assert num_divisors(60) == 12


def test_euler_phi_correct():
    """euler_phi(n) is correct for small values."""
    from urt.ramanujan_cathedral import euler_phi
    assert euler_phi(1) == 1
    assert euler_phi(6) == 2
    assert euler_phi(12) == 4
    assert euler_phi(13) == 12


def test_mobius_function_correct():
    """mobius(n) is correct."""
    from urt.ramanujan_cathedral import mobius
    assert mobius(1) == 1
    assert mobius(2) == -1
    assert mobius(3) == -1
    assert mobius(4) == 0   # 4 = 2²
    assert mobius(6) == 1   # 6 = 2×3, two prime factors
    assert mobius(30) == -1  # 30 = 2×3×5, three prime factors


def test_omega_function_correct():
    """omega(n) = number of distinct prime factors."""
    from urt.ramanujan_cathedral import omega
    assert omega(1) == 0
    assert omega(4) == 1
    assert omega(6) == 2
    assert omega(30) == 3
    assert omega(1729) == 3


def test_fibonacci_sequence_correct():
    """fibonacci(n) gives 0-indexed Fibonacci values."""
    from urt.ramanujan_cathedral import fibonacci
    expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    for i, exp in enumerate(expected):
        assert fibonacci(i) == exp, f"fibonacci({i}) = {fibonacci(i)} != {exp}"


def test_lucas_sequence_correct():
    """lucas(n) gives Lucas values."""
    from urt.ramanujan_cathedral import lucas
    expected = [2, 1, 3, 4, 7, 11, 18, 29]
    for i, exp in enumerate(expected):
        assert lucas(i) == exp, f"lucas({i}) = {lucas(i)} != {exp}"


def test_r3_small_values():
    """r3(n) correct for small n."""
    from urt.ramanujan_cathedral import r3
    assert r3(0) == 1   # only (0,0,0)
    assert r3(1) == 6   # (±1,0,0) and permutations
    assert r3(2) == 12
    assert r3(3) == 8   # only (±1,±1,±1)


def test_partition_small_values():
    """partition(n) correct for small n."""
    from urt.ramanujan_cathedral import partition
    assert partition(0) == 1
    assert partition(1) == 1
    assert partition(2) == 2
    assert partition(3) == 3
    assert partition(4) == 5
    assert partition(5) == 7


# ── Summary functions ─────────────────────────────────────────────────────────

def test_tau_function_summary_structure():
    """tau_function_summary() returns expected keys."""
    from urt.ramanujan_cathedral import tau_function_summary
    r = tau_function_summary()
    assert "tau_2_neg_2V" in r
    assert "tau_3_cathedral" in r
    assert "tau_5_cathedral" in r
    assert "tau_7_cathedral" in r
    assert "B_V_numerator" in r
    assert r["B_V_numerator"] == 691


def test_taxicab_summary_structure():
    """taxicab_summary() returns expected keys."""
    from urt.ramanujan_cathedral import taxicab_summary
    r = taxicab_summary()
    assert "taxicab_2" in r
    assert r["taxicab_2"] == 1729
    assert "cathedral_factors" in r
    assert r["cathedral_factors"]["exact"] is True


def test_divisor_summary_structure():
    """divisor_summary() contains sigma, num_divisors, euler_phi sections."""
    from urt.ramanujan_cathedral import divisor_summary
    r = divisor_summary()
    assert "sigma" in r
    assert "num_divisors" in r
    assert "euler_phi" in r


def test_fibonacci_summary_structure():
    """fibonacci_summary() has expected keys."""
    from urt.ramanujan_cathedral import fibonacci_summary
    r = fibonacci_summary()
    assert "F_q_is_q" in r
    assert "F_Dfact_plus_1_is_N" in r
    assert "cassini_D" in r
    assert "pisano_q_is_F" in r


def test_partition_summary_structure():
    """partition_summary() has expected keys."""
    from urt.ramanujan_cathedral import partition_summary
    r = partition_summary()
    assert "p_D_is_D" in r
    assert "p_D_plus_1_is_q" in r
    assert "congruence_mod_q" in r
    assert "pentagonal_D_is_V" in r


def test_ramanujan_cathedral_summary_all_exact():
    """ramanujan_cathedral_summary() reports all_exact = True."""
    from urt.ramanujan_cathedral import ramanujan_cathedral_summary
    r = ramanujan_cathedral_summary()
    assert r["all_exact"] is True
    assert r["total_identities"] >= 30


def test_print_ramanujan_report(capsys):
    """print_ramanujan_report() produces non-trivial output."""
    from urt.ramanujan_cathedral import print_ramanujan_report
    print_ramanujan_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "CATHEDRAL RAMANUJAN" in out
    assert "1729" in out
    assert "163" in out
