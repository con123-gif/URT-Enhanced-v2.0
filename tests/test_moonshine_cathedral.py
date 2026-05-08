"""
Tests for urt/moonshine_cathedral.py — Monster Moonshine and Cathedral integers.

Covers:
  - Module imports
  - j-invariant identities (j(i)=1728, 1729 taxicab, j(ω)=0)
  - Fourier constant 744 = D × dim(E₈)
  - Monster group order and prime-power exponents
  - Ramanujan tau function: τ(2)=-24, τ(3)=252
  - Bernoulli denominators via von Staudt–Clausen
  - Supersingular (moonshine) primes
  - Leech lattice / bosonic string connection
  - All IDENTITY_* boolean flags
  - moonshine_summary() return values
  - print_moonshine_report() runs without error
  - _bernoulli_denominator() helper
"""

import pytest
from math import factorial


# ── Module imports ─────────────────────────────────────────────────────────────

class TestImports:
    def test_constants_importable(self):
        from urt.moonshine_cathedral import (
            D, N, V, E, F, q, G, GAMMA,
            J_AT_I, V_CUBED, TWO_D_SQUARED, D_TO_D,
            TAXICAB_1729, TAXICAB_ALT_DECOMP,
            DIM_E8, J_CONSTANT_744, J_CONSTANT_FROM_CATHEDRAL,
            J_COEFF_196884, MONSTER_SMALLEST_REP,
            MONSTER_ORDER,
            MONSTER_EXP_2, MONSTER_EXP_3, MONSTER_EXP_5,
            MONSTER_EXP_7, MONSTER_EXP_11, MONSTER_EXP_13,
            EXP_2_FROM_CATHEDRAL, EXP_3_FROM_CATHEDRAL,
            EXP_5_FROM_CATHEDRAL, EXP_7_FROM_CATHEDRAL,
            EXP_13_FROM_CATHEDRAL,
            TAU_2, TAU_3,
            TAU_2_FROM_CATHEDRAL, TAU_2_AS_MINUS_2V, TAU_3_FROM_CATHEDRAL,
            BERN_DENOM_B2, BERN_DENOM_B4, BERN_DENOM_B6, BERN_DENOM_B12,
            BERN_PRIMES_B2, BERN_PRIMES_B4, BERN_PRIMES_B6, BERN_PRIMES_B12,
            N_MINUS_1_EQUALS_V,
            MOONSHINE_PRIMES, N_MOONSHINE_PRIMES,
            CATHEDRAL_MOONSHINE_PRIMES, N_CATHEDRAL_MOONSHINE,
            LEECH_DIM, BOSONIC_STRING_DIM,
            TAU_2_EQUALS_MINUS_LEECH,
            J_AT_OMEGA,
        )

    def test_identity_flags_importable(self):
        from urt.moonshine_cathedral import (
            IDENTITY_J_AT_I_IS_1728,
            IDENTITY_1728_IS_V_CUBED,
            IDENTITY_1728_IS_2D2_TIMES_DD,
            IDENTITY_1729_IS_V3_PLUS_1,
            IDENTITY_1729_TAXICAB_ALT,
            IDENTITY_1729_TAXICAB_12_1,
            IDENTITY_DIM_E8_IS_248,
            IDENTITY_744_IS_D_TIMES_E8,
            IDENTITY_MONSTER_EXP_2_IS_G_N_1,
            IDENTITY_MONSTER_EXP_3_IS_F,
            IDENTITY_MONSTER_EXP_5_IS_D2,
            IDENTITY_MONSTER_EXP_7_IS_DFAC,
            IDENTITY_MONSTER_EXP_13_IS_D,
            IDENTITY_TAU2_IS_MINUS_24,
            IDENTITY_TAU2_FROM_CATHEDRAL,
            IDENTITY_TAU2_IS_MINUS_2V,
            IDENTITY_TAU3_IS_252,
            IDENTITY_TAU3_FROM_CATHEDRAL,
            IDENTITY_BERN_B2_IS_6,
            IDENTITY_BERN_B2_IS_DFAC,
            IDENTITY_BERN_B4_IS_30,
            IDENTITY_BERN_B4_IS_E,
            IDENTITY_BERN_B6_IS_42,
            IDENTITY_BERN_B6_IS_DFAC_DFAC1,
            IDENTITY_BERN_B12_IS_2730,
            IDENTITY_BERN_B12_CONTAINS_N,
            IDENTITY_N_MINUS_1_EQUALS_V,
            IDENTITY_15_MOONSHINE_PRIMES,
            IDENTITY_4_CATHEDRAL_MOONSHINE,
            IDENTITY_TAU2_EQUALS_MINUS_LEECH,
            IDENTITY_BOSONIC_DIM_IS_2N,
        )

    def test_functions_importable(self):
        from urt.moonshine_cathedral import (
            moonshine_summary,
            print_moonshine_report,
            _bernoulli_denominator,
            _is_prime,
        )

    def test_delta_star_importable(self):
        from urt.moonshine_cathedral import DELTA_STAR
        assert DELTA_STAR > 0


# ── Cathedral local integers ───────────────────────────────────────────────────

class TestLocalIntegers:
    def test_D(self):
        from urt.moonshine_cathedral import D
        assert D == 3

    def test_N(self):
        from urt.moonshine_cathedral import N
        assert N == 13

    def test_V(self):
        from urt.moonshine_cathedral import V
        assert V == 12

    def test_E(self):
        from urt.moonshine_cathedral import E
        assert E == 30

    def test_F(self):
        from urt.moonshine_cathedral import F
        assert F == 20

    def test_q(self):
        from urt.moonshine_cathedral import q
        assert q == 5

    def test_G(self):
        from urt.moonshine_cathedral import G
        assert G == 60

    def test_GAMMA(self):
        from urt.moonshine_cathedral import GAMMA
        assert abs(GAMMA - 1/81) < 1e-15


# ── j-invariant identities ─────────────────────────────────────────────────────

class TestJInvariant:
    def test_j_at_i_equals_1728(self):
        from urt.moonshine_cathedral import J_AT_I
        assert J_AT_I == 1728

    def test_v_cubed_equals_1728(self):
        from urt.moonshine_cathedral import V_CUBED, V
        assert V_CUBED == 1728
        assert V_CUBED == V ** 3

    def test_1728_is_2d2_times_dd(self):
        from urt.moonshine_cathedral import TWO_D_SQUARED, D_TO_D, D
        assert TWO_D_SQUARED == (2 ** D) ** 2
        assert D_TO_D == D ** D
        assert TWO_D_SQUARED * D_TO_D == 1728

    def test_j_at_i_equals_v_cubed(self):
        from urt.moonshine_cathedral import J_AT_I, V_CUBED
        assert J_AT_I == V_CUBED

    def test_j_at_omega_is_zero(self):
        from urt.moonshine_cathedral import J_AT_OMEGA
        assert J_AT_OMEGA == 0

    def test_taxicab_1729_value(self):
        from urt.moonshine_cathedral import TAXICAB_1729
        assert TAXICAB_1729 == 1729

    def test_1729_is_v3_plus_1(self):
        from urt.moonshine_cathedral import TAXICAB_1729, V_CUBED
        assert TAXICAB_1729 == V_CUBED + 1

    def test_1729_is_10_cubed_plus_9_cubed(self):
        from urt.moonshine_cathedral import TAXICAB_1729
        assert 10**3 + 9**3 == TAXICAB_1729

    def test_1729_is_12_cubed_plus_1_cubed(self):
        from urt.moonshine_cathedral import TAXICAB_1729
        assert 12**3 + 1**3 == TAXICAB_1729

    def test_identity_j_at_i_is_1728(self):
        from urt.moonshine_cathedral import IDENTITY_J_AT_I_IS_1728
        assert IDENTITY_J_AT_I_IS_1728 is True

    def test_identity_1728_is_v_cubed(self):
        from urt.moonshine_cathedral import IDENTITY_1728_IS_V_CUBED
        assert IDENTITY_1728_IS_V_CUBED is True

    def test_identity_1728_is_2d2_times_dd(self):
        from urt.moonshine_cathedral import IDENTITY_1728_IS_2D2_TIMES_DD
        assert IDENTITY_1728_IS_2D2_TIMES_DD is True

    def test_identity_1729_is_v3_plus_1(self):
        from urt.moonshine_cathedral import IDENTITY_1729_IS_V3_PLUS_1
        assert IDENTITY_1729_IS_V3_PLUS_1 is True

    def test_identity_1729_taxicab_alt(self):
        from urt.moonshine_cathedral import IDENTITY_1729_TAXICAB_ALT
        assert IDENTITY_1729_TAXICAB_ALT is True

    def test_identity_1729_taxicab_12_1(self):
        from urt.moonshine_cathedral import IDENTITY_1729_TAXICAB_12_1
        assert IDENTITY_1729_TAXICAB_12_1 is True


# ── Fourier constant 744 ───────────────────────────────────────────────────────

class TestFourierConstant744:
    def test_dim_e8_is_248(self):
        from urt.moonshine_cathedral import DIM_E8
        assert DIM_E8 == 248

    def test_dim_e8_from_cathedral(self):
        from urt.moonshine_cathedral import DIM_E8, D, q
        assert DIM_E8 == (2 ** D) * ((2 ** q) - 1)
        assert DIM_E8 == 8 * 31

    def test_j_constant_744(self):
        from urt.moonshine_cathedral import J_CONSTANT_744
        assert J_CONSTANT_744 == 744

    def test_744_is_d_times_e8(self):
        from urt.moonshine_cathedral import J_CONSTANT_FROM_CATHEDRAL, D, DIM_E8
        assert J_CONSTANT_FROM_CATHEDRAL == D * DIM_E8
        assert J_CONSTANT_FROM_CATHEDRAL == 744

    def test_identity_dim_e8_is_248(self):
        from urt.moonshine_cathedral import IDENTITY_DIM_E8_IS_248
        assert IDENTITY_DIM_E8_IS_248 is True

    def test_identity_744_is_d_times_e8(self):
        from urt.moonshine_cathedral import IDENTITY_744_IS_D_TIMES_E8
        assert IDENTITY_744_IS_D_TIMES_E8 is True

    def test_mcKay_identity_196884(self):
        """196884 = 196883 + 1 (McKay identity)."""
        from urt.moonshine_cathedral import J_COEFF_196884, MONSTER_SMALLEST_REP
        assert J_COEFF_196884 == MONSTER_SMALLEST_REP + 1
        assert J_COEFF_196884 == 196884


# ── Monster group ──────────────────────────────────────────────────────────────

class TestMonsterGroup:
    def test_monster_exp_2(self):
        from urt.moonshine_cathedral import MONSTER_EXP_2
        assert MONSTER_EXP_2 == 46

    def test_monster_exp_2_is_g_minus_n_minus_1(self):
        from urt.moonshine_cathedral import MONSTER_EXP_2, G, N
        assert MONSTER_EXP_2 == G - N - 1
        assert 60 - 13 - 1 == 46

    def test_monster_exp_3(self):
        from urt.moonshine_cathedral import MONSTER_EXP_3
        assert MONSTER_EXP_3 == 20

    def test_monster_exp_3_is_f(self):
        from urt.moonshine_cathedral import MONSTER_EXP_3, F
        assert MONSTER_EXP_3 == F

    def test_monster_exp_5(self):
        from urt.moonshine_cathedral import MONSTER_EXP_5
        assert MONSTER_EXP_5 == 9

    def test_monster_exp_5_is_d_squared(self):
        from urt.moonshine_cathedral import MONSTER_EXP_5, D
        assert MONSTER_EXP_5 == D * D

    def test_monster_exp_7(self):
        from urt.moonshine_cathedral import MONSTER_EXP_7
        assert MONSTER_EXP_7 == 6

    def test_monster_exp_7_is_factorial_d(self):
        from urt.moonshine_cathedral import MONSTER_EXP_7, D
        assert MONSTER_EXP_7 == factorial(D)

    def test_monster_exp_7_is_v_over_2(self):
        from urt.moonshine_cathedral import MONSTER_EXP_7, V
        assert MONSTER_EXP_7 == V // 2

    def test_monster_exp_11(self):
        from urt.moonshine_cathedral import MONSTER_EXP_11
        assert MONSTER_EXP_11 == 2

    def test_monster_exp_13(self):
        from urt.moonshine_cathedral import MONSTER_EXP_13
        assert MONSTER_EXP_13 == 3

    def test_monster_exp_13_is_d(self):
        from urt.moonshine_cathedral import MONSTER_EXP_13, D
        assert MONSTER_EXP_13 == D

    def test_monster_order_factorization(self):
        """Verify |Monster| has the correct prime-power factorization."""
        from urt.moonshine_cathedral import MONSTER_ORDER
        expected = (
            2**46 * 3**20 * 5**9 * 7**6 * 11**2 * 13**3 * 17 * 19
            * 23 * 29 * 31 * 41 * 47 * 59 * 71
        )
        assert MONSTER_ORDER == expected

    def test_identity_monster_exp_2_is_g_n_1(self):
        from urt.moonshine_cathedral import IDENTITY_MONSTER_EXP_2_IS_G_N_1
        assert IDENTITY_MONSTER_EXP_2_IS_G_N_1 is True

    def test_identity_monster_exp_3_is_f(self):
        from urt.moonshine_cathedral import IDENTITY_MONSTER_EXP_3_IS_F
        assert IDENTITY_MONSTER_EXP_3_IS_F is True

    def test_identity_monster_exp_5_is_d2(self):
        from urt.moonshine_cathedral import IDENTITY_MONSTER_EXP_5_IS_D2
        assert IDENTITY_MONSTER_EXP_5_IS_D2 is True

    def test_identity_monster_exp_7_is_dfac(self):
        from urt.moonshine_cathedral import IDENTITY_MONSTER_EXP_7_IS_DFAC
        assert IDENTITY_MONSTER_EXP_7_IS_DFAC is True

    def test_identity_monster_exp_13_is_d(self):
        from urt.moonshine_cathedral import IDENTITY_MONSTER_EXP_13_IS_D
        assert IDENTITY_MONSTER_EXP_13_IS_D is True


# ── Ramanujan tau function ─────────────────────────────────────────────────────

class TestRamanujanTau:
    def test_tau_2_value(self):
        from urt.moonshine_cathedral import TAU_2
        assert TAU_2 == -24

    def test_tau_2_is_minus_d_times_2d(self):
        from urt.moonshine_cathedral import TAU_2, D
        assert TAU_2 == -(D * (2 ** D))
        assert TAU_2 == -(3 * 8)

    def test_tau_2_is_minus_2v(self):
        from urt.moonshine_cathedral import TAU_2, V
        assert TAU_2 == -2 * V

    def test_tau_3_value(self):
        from urt.moonshine_cathedral import TAU_3
        assert TAU_3 == 252

    def test_tau_3_is_d1_d2_dfac1(self):
        from urt.moonshine_cathedral import TAU_3, D
        assert TAU_3 == (D + 1) * (D ** 2) * (factorial(D) + 1)
        assert TAU_3 == 4 * 9 * 7

    def test_tau_2_from_cathedral(self):
        from urt.moonshine_cathedral import TAU_2_FROM_CATHEDRAL, TAU_2
        assert TAU_2_FROM_CATHEDRAL == TAU_2

    def test_tau_2_as_minus_2v(self):
        from urt.moonshine_cathedral import TAU_2_AS_MINUS_2V, TAU_2
        assert TAU_2_AS_MINUS_2V == TAU_2

    def test_tau_3_from_cathedral(self):
        from urt.moonshine_cathedral import TAU_3_FROM_CATHEDRAL, TAU_3
        assert TAU_3_FROM_CATHEDRAL == TAU_3

    def test_identity_tau2_is_minus_24(self):
        from urt.moonshine_cathedral import IDENTITY_TAU2_IS_MINUS_24
        assert IDENTITY_TAU2_IS_MINUS_24 is True

    def test_identity_tau2_from_cathedral(self):
        from urt.moonshine_cathedral import IDENTITY_TAU2_FROM_CATHEDRAL
        assert IDENTITY_TAU2_FROM_CATHEDRAL is True

    def test_identity_tau2_is_minus_2v(self):
        from urt.moonshine_cathedral import IDENTITY_TAU2_IS_MINUS_2V
        assert IDENTITY_TAU2_IS_MINUS_2V is True

    def test_identity_tau3_is_252(self):
        from urt.moonshine_cathedral import IDENTITY_TAU3_IS_252
        assert IDENTITY_TAU3_IS_252 is True

    def test_identity_tau3_from_cathedral(self):
        from urt.moonshine_cathedral import IDENTITY_TAU3_FROM_CATHEDRAL
        assert IDENTITY_TAU3_FROM_CATHEDRAL is True


# ── Bernoulli denominators ─────────────────────────────────────────────────────

class TestBernoulliDenominators:
    def test_bern_denom_b2_value(self):
        from urt.moonshine_cathedral import BERN_DENOM_B2
        assert BERN_DENOM_B2 == 6

    def test_bern_denom_b2_is_dfac(self):
        from urt.moonshine_cathedral import BERN_DENOM_B2, D
        assert BERN_DENOM_B2 == factorial(D)

    def test_bern_primes_b2(self):
        from urt.moonshine_cathedral import BERN_PRIMES_B2
        assert set(BERN_PRIMES_B2) == {2, 3}

    def test_bern_denom_b4_value(self):
        from urt.moonshine_cathedral import BERN_DENOM_B4
        assert BERN_DENOM_B4 == 30

    def test_bern_denom_b4_is_e(self):
        from urt.moonshine_cathedral import BERN_DENOM_B4, E
        assert BERN_DENOM_B4 == E

    def test_bern_primes_b4(self):
        from urt.moonshine_cathedral import BERN_PRIMES_B4
        assert set(BERN_PRIMES_B4) == {2, 3, 5}

    def test_bern_denom_b6_value(self):
        from urt.moonshine_cathedral import BERN_DENOM_B6
        assert BERN_DENOM_B6 == 42

    def test_bern_denom_b6_is_dfac_times_dfac_plus_1(self):
        from urt.moonshine_cathedral import BERN_DENOM_B6, D
        assert BERN_DENOM_B6 == factorial(D) * (factorial(D) + 1)
        assert BERN_DENOM_B6 == 6 * 7

    def test_bern_primes_b6(self):
        from urt.moonshine_cathedral import BERN_PRIMES_B6
        assert set(BERN_PRIMES_B6) == {2, 3, 7}

    def test_bern_denom_b12_value(self):
        from urt.moonshine_cathedral import BERN_DENOM_B12
        assert BERN_DENOM_B12 == 2730

    def test_bern_denom_b12_factorization(self):
        from urt.moonshine_cathedral import BERN_DENOM_B12
        # 2730 = 2 × 3 × 5 × 7 × 13
        assert BERN_DENOM_B12 == 2 * 3 * 5 * 7 * 13

    def test_bern_primes_b12_contains_n(self):
        from urt.moonshine_cathedral import BERN_PRIMES_B12, N
        assert N in BERN_PRIMES_B12

    def test_bern_primes_b12_set(self):
        from urt.moonshine_cathedral import BERN_PRIMES_B12
        assert set(BERN_PRIMES_B12) == {2, 3, 5, 7, 13}

    def test_n_minus_1_equals_v(self):
        from urt.moonshine_cathedral import N_MINUS_1_EQUALS_V, N, V
        assert N_MINUS_1_EQUALS_V is True
        assert N - 1 == V

    def test_identity_bern_b2_is_6(self):
        from urt.moonshine_cathedral import IDENTITY_BERN_B2_IS_6
        assert IDENTITY_BERN_B2_IS_6 is True

    def test_identity_bern_b2_is_dfac(self):
        from urt.moonshine_cathedral import IDENTITY_BERN_B2_IS_DFAC
        assert IDENTITY_BERN_B2_IS_DFAC is True

    def test_identity_bern_b4_is_30(self):
        from urt.moonshine_cathedral import IDENTITY_BERN_B4_IS_30
        assert IDENTITY_BERN_B4_IS_30 is True

    def test_identity_bern_b4_is_e(self):
        from urt.moonshine_cathedral import IDENTITY_BERN_B4_IS_E
        assert IDENTITY_BERN_B4_IS_E is True

    def test_identity_bern_b6_is_42(self):
        from urt.moonshine_cathedral import IDENTITY_BERN_B6_IS_42
        assert IDENTITY_BERN_B6_IS_42 is True

    def test_identity_bern_b6_is_dfac_dfac1(self):
        from urt.moonshine_cathedral import IDENTITY_BERN_B6_IS_DFAC_DFAC1
        assert IDENTITY_BERN_B6_IS_DFAC_DFAC1 is True

    def test_identity_bern_b12_is_2730(self):
        from urt.moonshine_cathedral import IDENTITY_BERN_B12_IS_2730
        assert IDENTITY_BERN_B12_IS_2730 is True

    def test_identity_bern_b12_contains_n(self):
        from urt.moonshine_cathedral import IDENTITY_BERN_B12_CONTAINS_N
        assert IDENTITY_BERN_B12_CONTAINS_N is True

    def test_identity_n_minus_1_equals_v(self):
        from urt.moonshine_cathedral import IDENTITY_N_MINUS_1_EQUALS_V
        assert IDENTITY_N_MINUS_1_EQUALS_V is True


# ── Supersingular primes ───────────────────────────────────────────────────────

class TestMoonshinePrimes:
    def test_15_moonshine_primes(self):
        from urt.moonshine_cathedral import MOONSHINE_PRIMES, N_MOONSHINE_PRIMES
        assert N_MOONSHINE_PRIMES == 15
        assert len(MOONSHINE_PRIMES) == 15

    def test_moonshine_primes_values(self):
        from urt.moonshine_cathedral import MOONSHINE_PRIMES
        expected = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 41, 47, 59, 71]
        assert MOONSHINE_PRIMES == expected

    def test_moonshine_primes_all_prime(self):
        from urt.moonshine_cathedral import MOONSHINE_PRIMES, _is_prime
        for p in MOONSHINE_PRIMES:
            assert _is_prime(p), f"{p} is not prime"

    def test_cathedral_moonshine_primes(self):
        from urt.moonshine_cathedral import CATHEDRAL_MOONSHINE_PRIMES
        assert set(CATHEDRAL_MOONSHINE_PRIMES) == {3, 5, 7, 13}

    def test_cathedral_moonshine_prime_count(self):
        from urt.moonshine_cathedral import N_CATHEDRAL_MOONSHINE, D
        assert N_CATHEDRAL_MOONSHINE == 4
        assert N_CATHEDRAL_MOONSHINE == D + 1

    def test_cathedral_moonshine_are_d_q_dfac1_n(self):
        from urt.moonshine_cathedral import CATHEDRAL_MOONSHINE_PRIMES, D, q, N
        assert D in CATHEDRAL_MOONSHINE_PRIMES           # 3
        assert q in CATHEDRAL_MOONSHINE_PRIMES           # 5
        assert factorial(D) + 1 in CATHEDRAL_MOONSHINE_PRIMES  # 7
        assert N in CATHEDRAL_MOONSHINE_PRIMES           # 13

    def test_cathedral_moonshine_subset_of_moonshine(self):
        from urt.moonshine_cathedral import CATHEDRAL_MOONSHINE_PRIMES, MOONSHINE_PRIMES
        for p in CATHEDRAL_MOONSHINE_PRIMES:
            assert p in MOONSHINE_PRIMES

    def test_identity_15_moonshine_primes(self):
        from urt.moonshine_cathedral import IDENTITY_15_MOONSHINE_PRIMES
        assert IDENTITY_15_MOONSHINE_PRIMES is True

    def test_identity_4_cathedral_moonshine(self):
        from urt.moonshine_cathedral import IDENTITY_4_CATHEDRAL_MOONSHINE
        assert IDENTITY_4_CATHEDRAL_MOONSHINE is True


# ── Leech lattice / bosonic string ────────────────────────────────────────────

class TestLeechBosonic:
    def test_leech_dim(self):
        from urt.moonshine_cathedral import LEECH_DIM, V
        assert LEECH_DIM == 24
        assert LEECH_DIM == 2 * V

    def test_tau2_equals_minus_leech(self):
        from urt.moonshine_cathedral import TAU_2, LEECH_DIM
        assert TAU_2 == -LEECH_DIM

    def test_bosonic_string_dim(self):
        from urt.moonshine_cathedral import BOSONIC_STRING_DIM, N
        assert BOSONIC_STRING_DIM == 26
        assert BOSONIC_STRING_DIM == 2 * N

    def test_bosonic_is_leech_plus_2(self):
        from urt.moonshine_cathedral import BOSONIC_STRING_DIM, LEECH_DIM
        assert BOSONIC_STRING_DIM == LEECH_DIM + 2

    def test_identity_tau2_equals_minus_leech(self):
        from urt.moonshine_cathedral import IDENTITY_TAU2_EQUALS_MINUS_LEECH
        assert IDENTITY_TAU2_EQUALS_MINUS_LEECH is True

    def test_identity_bosonic_dim_is_2n(self):
        from urt.moonshine_cathedral import IDENTITY_BOSONIC_DIM_IS_2N
        assert IDENTITY_BOSONIC_DIM_IS_2N is True


# ── _bernoulli_denominator helper ─────────────────────────────────────────────

class TestBernoulliHelper:
    def test_b2_denom(self):
        from urt.moonshine_cathedral import _bernoulli_denominator
        assert _bernoulli_denominator(1) == 6

    def test_b4_denom(self):
        from urt.moonshine_cathedral import _bernoulli_denominator
        assert _bernoulli_denominator(2) == 30

    def test_b6_denom(self):
        from urt.moonshine_cathedral import _bernoulli_denominator
        assert _bernoulli_denominator(3) == 42

    def test_b12_denom(self):
        from urt.moonshine_cathedral import _bernoulli_denominator
        assert _bernoulli_denominator(6) == 2730

    def test_b8_denom(self):
        """denom(B_8) = 2×3×5 = 30 (primes p with p-1|8: p∈{2,3,5})."""
        from urt.moonshine_cathedral import _bernoulli_denominator
        # p-1 | 8: p=2 (1|8✓), p=3 (2|8✓), p=5 (4|8✓), p=17 (16∤8✗)
        assert _bernoulli_denominator(4) == 30

    def test_b10_denom(self):
        """denom(B_10) = 2×3×11 = 66 (p-1|10: p∈{2,3,11})."""
        from urt.moonshine_cathedral import _bernoulli_denominator
        # p-1|10: p=2(1|10✓), p=3(2|10✓), p=11(10|10✓)
        assert _bernoulli_denominator(5) == 66


# ── moonshine_summary() ───────────────────────────────────────────────────────

class TestMoonshineSummary:
    def setup_method(self):
        from urt.moonshine_cathedral import moonshine_summary
        self.s = moonshine_summary()

    def test_returns_dict(self):
        assert isinstance(self.s, dict)

    def test_all_identities_true(self):
        assert self.s["all_identities_true"] is True

    def test_n_identities(self):
        assert self.s["n_identities"] >= 31

    def test_j_at_i_key(self):
        assert self.s["j_at_i"] == 1728

    def test_v_cubed_key(self):
        assert self.s["v_cubed"] == 1728

    def test_dim_e8_key(self):
        assert self.s["dim_e8"] == 248

    def test_j_constant_744_key(self):
        assert self.s["j_constant_744"] == 744

    def test_taxicab_1729_key(self):
        assert self.s["taxicab_1729"] == 1729

    def test_monster_order_key(self):
        expected = (
            2**46 * 3**20 * 5**9 * 7**6 * 11**2 * 13**3 * 17 * 19
            * 23 * 29 * 31 * 41 * 47 * 59 * 71
        )
        assert self.s["monster_order"] == expected

    def test_tau_2_key(self):
        assert self.s["tau_2"] == -24

    def test_tau_3_key(self):
        assert self.s["tau_3"] == 252

    def test_bern_denom_b2_key(self):
        assert self.s["bern_denom_b2"] == 6

    def test_bern_denom_b4_key(self):
        assert self.s["bern_denom_b4"] == 30

    def test_bern_denom_b6_key(self):
        assert self.s["bern_denom_b6"] == 42

    def test_bern_denom_b12_key(self):
        assert self.s["bern_denom_b12"] == 2730

    def test_moonshine_primes_key(self):
        assert self.s["n_moonshine_primes"] == 15

    def test_cathedral_moonshine_count_key(self):
        assert self.s["n_cathedral_moonshine"] == 4

    def test_leech_dim_key(self):
        assert self.s["leech_dim"] == 24

    def test_bosonic_string_dim_key(self):
        assert self.s["bosonic_string_dim"] == 26


# ── print_moonshine_report() ──────────────────────────────────────────────────

class TestPrintReport:
    def test_runs_without_error(self, capsys):
        from urt.moonshine_cathedral import print_moonshine_report
        print_moonshine_report()
        captured = capsys.readouterr()
        assert len(captured.out) > 100

    def test_output_mentions_1728(self, capsys):
        from urt.moonshine_cathedral import print_moonshine_report
        print_moonshine_report()
        captured = capsys.readouterr()
        assert "1728" in captured.out

    def test_output_mentions_744(self, capsys):
        from urt.moonshine_cathedral import print_moonshine_report
        print_moonshine_report()
        captured = capsys.readouterr()
        assert "744" in captured.out

    def test_output_mentions_monster(self, capsys):
        from urt.moonshine_cathedral import print_moonshine_report
        print_moonshine_report()
        captured = capsys.readouterr()
        assert "Monster" in captured.out or "monster" in captured.out.lower()

    def test_output_all_true(self, capsys):
        from urt.moonshine_cathedral import print_moonshine_report
        print_moonshine_report()
        captured = capsys.readouterr()
        assert "True" in captured.out
