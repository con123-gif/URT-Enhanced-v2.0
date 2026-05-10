"""Tests for urt/modular_forms_cathedral.py — Modular Forms, Leech Lattice, Perfect Numbers."""

import pytest
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    """Module and all public names import without error."""
    from urt.modular_forms_cathedral import (
        EISENSTEIN_E4_WEIGHT,
        EISENSTEIN_E6_WEIGHT,
        DELTA_WEIGHT,
        ETA_POWER_DELTA,
        ETA_POWER_DENOMINATOR,
        DIM_S_V,
        DIM_M_4, DIM_M_6, DIM_M_8, DIM_M_10, DIM_M_V, DIM_S_12,
        E8_DIM,
        J_CONST_TERM, J_CONST_TERM_LITERAL, J_AT_I, J_AT_I_LITERAL,
        J_AT_RHO_LITERAL,
        RELATION_1728,
        MSLZ_GENERATOR_WEIGHTS, GRADED_RING_NUM_GENERATORS,
        UNIQUE_HECKE_EIGENFORM_WEIGHT,
        TAU_RAMANUJAN, TAU_AT_2, TAU_AT_N,
        LEECH_DIM, LEECH_KISSING, LEECH_KISSING_EXACT,
        E8_KISSING, N_NIEMEIER,
        PERFECT_1, PERFECT_2, PERFECT_3, PERFECT_4,
        J_COEFF_Q1, MONSTER_LOWEST_REP, MOONSHINE_IDENTITY,
        ALL_MOD_FORMS_EXACT,
        modular_forms_summary,
        print_modular_forms_report,
    )


def test_all_mod_forms_exact_flag():
    """ALL_MOD_FORMS_EXACT is True at import time."""
    from urt.modular_forms_cathedral import ALL_MOD_FORMS_EXACT
    assert ALL_MOD_FORMS_EXACT is True


# ── Eisenstein series weights ──────────────────────────────────────────────────

def test_e4_weight_is_d_plus_1():
    """E_4 weight = D+1 = 4."""
    from urt.modular_forms_cathedral import EISENSTEIN_E4_WEIGHT
    from urt.shell_closure import D
    assert EISENSTEIN_E4_WEIGHT == D + 1
    assert EISENSTEIN_E4_WEIGHT == 4


def test_e6_weight_is_d_factorial():
    """E_6 weight = D! = 6."""
    from urt.modular_forms_cathedral import EISENSTEIN_E6_WEIGHT
    from urt.shell_closure import D
    assert EISENSTEIN_E6_WEIGHT == factorial(D)
    assert EISENSTEIN_E6_WEIGHT == 6


def test_eisenstein_weights_are_even():
    """Both Eisenstein generator weights are even (required for modular forms on SL₂ℤ)."""
    from urt.modular_forms_cathedral import EISENSTEIN_E4_WEIGHT, EISENSTEIN_E6_WEIGHT
    assert EISENSTEIN_E4_WEIGHT % 2 == 0
    assert EISENSTEIN_E6_WEIGHT % 2 == 0


def test_identity_e4_weight():
    from urt.modular_forms_cathedral import IDENTITY_E4_WEIGHT_IS_D_PLUS_1
    assert IDENTITY_E4_WEIGHT_IS_D_PLUS_1 is True


def test_identity_e6_weight():
    from urt.modular_forms_cathedral import IDENTITY_E6_WEIGHT_IS_D_FACT
    assert IDENTITY_E6_WEIGHT_IS_D_FACT is True


# ── Delta function ─────────────────────────────────────────────────────────────

def test_delta_weight_is_v():
    """Ramanujan Δ has weight V = 12."""
    from urt.modular_forms_cathedral import DELTA_WEIGHT
    from urt.shell_closure import V
    assert DELTA_WEIGHT == V
    assert DELTA_WEIGHT == 12


def test_eta_power_is_2v():
    """η(τ)^24 = Δ(τ): the exponent 24 = 2V."""
    from urt.modular_forms_cathedral import ETA_POWER_DELTA
    from urt.shell_closure import V
    assert ETA_POWER_DELTA == 2 * V
    assert ETA_POWER_DELTA == 24


def test_eta_power_denominator():
    """The 1/(2V) prefactor denominator of η is 2V = 24."""
    from urt.modular_forms_cathedral import ETA_POWER_DENOMINATOR
    from urt.shell_closure import V
    assert ETA_POWER_DENOMINATOR == 2 * V


def test_dim_s_v_is_one():
    """dim S_V(SL₂ℤ) = 1: Δ is the unique weight-12 cusp form."""
    from urt.modular_forms_cathedral import DIM_S_V
    assert DIM_S_V == 1


def test_identity_delta_weight():
    from urt.modular_forms_cathedral import IDENTITY_DELTA_WEIGHT_IS_V
    assert IDENTITY_DELTA_WEIGHT_IS_V is True


def test_identity_eta_power():
    from urt.modular_forms_cathedral import IDENTITY_ETA_POWER_IS_2V
    assert IDENTITY_ETA_POWER_IS_2V is True


def test_identity_dim_s_v():
    from urt.modular_forms_cathedral import IDENTITY_DIM_S_V_IS_ONE
    assert IDENTITY_DIM_S_V_IS_ONE is True


# ── Dimension of M_k ──────────────────────────────────────────────────────────

def test_dim_m4():
    """dim M_4(SL₂ℤ) = 1."""
    from urt.modular_forms_cathedral import DIM_M_4
    assert DIM_M_4 == 1


def test_dim_m6():
    """dim M_6(SL₂ℤ) = 1."""
    from urt.modular_forms_cathedral import DIM_M_6
    assert DIM_M_6 == 1


def test_dim_m8():
    """dim M_8(SL₂ℤ) = 1 (only E_4²)."""
    from urt.modular_forms_cathedral import DIM_M_8
    assert DIM_M_8 == 1


def test_dim_m10():
    """dim M_10(SL₂ℤ) = 1 (only E_4·E_6)."""
    from urt.modular_forms_cathedral import DIM_M_10
    assert DIM_M_10 == 1


def test_dim_m_v_is_2():
    """dim M_V(SL₂ℤ) = dim M_12 = 2 (E_4³ and Δ)."""
    from urt.modular_forms_cathedral import DIM_M_V
    assert DIM_M_V == 2


def test_dim_s12_is_1():
    """dim S_12 = 1 (Δ alone spans the cusp subspace)."""
    from urt.modular_forms_cathedral import DIM_S_12
    assert DIM_S_12 == 1


def test_identity_dim_m4():
    from urt.modular_forms_cathedral import IDENTITY_DIM_M4_IS_1
    assert IDENTITY_DIM_M4_IS_1 is True


def test_identity_dim_m6():
    from urt.modular_forms_cathedral import IDENTITY_DIM_M6_IS_1
    assert IDENTITY_DIM_M6_IS_1 is True


def test_identity_dim_m12_is_2():
    from urt.modular_forms_cathedral import IDENTITY_DIM_M12_IS_2
    assert IDENTITY_DIM_M12_IS_2 is True


def test_identity_dim_s12_is_1():
    from urt.modular_forms_cathedral import IDENTITY_DIM_S12_IS_1
    assert IDENTITY_DIM_S12_IS_1 is True


# ── j-function ─────────────────────────────────────────────────────────────────

def test_j_at_i_is_1728():
    """j(i) = 1728 (exact classical result)."""
    from urt.modular_forms_cathedral import J_AT_I, J_AT_I_LITERAL
    assert J_AT_I == 1728
    assert J_AT_I_LITERAL == 1728


def test_j_at_i_is_v_cubed():
    """j(i) = V³ = 12³ = 1728."""
    from urt.modular_forms_cathedral import J_AT_I
    from urt.shell_closure import V
    assert J_AT_I == V**3


def test_j_at_i_is_v_to_d():
    """j(i) = V^D = 12^3 = 1728."""
    from urt.modular_forms_cathedral import J_AT_I
    from urt.shell_closure import V, D
    assert J_AT_I == V**D


def test_j_const_term_is_744():
    """The constant term of j is 744."""
    from urt.modular_forms_cathedral import J_CONST_TERM, J_CONST_TERM_LITERAL
    assert J_CONST_TERM == 744
    assert J_CONST_TERM_LITERAL == 744


def test_j_const_term_is_d_times_e8():
    """744 = D × dim(E₈) = 3 × 248."""
    from urt.modular_forms_cathedral import J_CONST_TERM, E8_DIM
    from urt.shell_closure import D
    assert J_CONST_TERM == D * E8_DIM


def test_e8_dim_is_248():
    """dim(E₈) = 2^D × (2^q − 1) = 8 × 31 = 248."""
    from urt.modular_forms_cathedral import E8_DIM
    from urt.shell_closure import D, q
    assert E8_DIM == 2**D * (2**q - 1)
    assert E8_DIM == 248


def test_relation_1728():
    """Coefficient in 1728·Δ = E_4³ − E_6² equals V^D = 1728."""
    from urt.modular_forms_cathedral import RELATION_1728
    from urt.shell_closure import V, D
    assert RELATION_1728 == V**D
    assert RELATION_1728 == 1728


def test_identity_j_at_i_v_cubed():
    from urt.modular_forms_cathedral import IDENTITY_J_AT_I_IS_V_CUBED
    assert IDENTITY_J_AT_I_IS_V_CUBED is True


def test_identity_j_at_i_v_to_d():
    from urt.modular_forms_cathedral import IDENTITY_J_AT_I_IS_V_TO_D
    assert IDENTITY_J_AT_I_IS_V_TO_D is True


def test_identity_j_const_d_times_e8():
    from urt.modular_forms_cathedral import IDENTITY_J_CONST_IS_D_TIMES_E8
    assert IDENTITY_J_CONST_IS_D_TIMES_E8 is True


def test_identity_e8_dim_formula():
    from urt.modular_forms_cathedral import IDENTITY_E8_DIM_FORMULA
    assert IDENTITY_E8_DIM_FORMULA is True


# ── Ring generators ────────────────────────────────────────────────────────────

def test_ring_generator_weights():
    """M(SL₂ℤ) = ℂ[E_4, E_6] with generator weights [4, 6] = [D+1, D!]."""
    from urt.modular_forms_cathedral import MSLZ_GENERATOR_WEIGHTS
    from urt.shell_closure import D
    assert MSLZ_GENERATOR_WEIGHTS == [D + 1, factorial(D)]
    assert MSLZ_GENERATOR_WEIGHTS == [4, 6]


def test_ring_num_generators():
    """The graded ring has 2 generators."""
    from urt.modular_forms_cathedral import GRADED_RING_NUM_GENERATORS
    assert GRADED_RING_NUM_GENERATORS == 2


def test_identity_ring_generators():
    from urt.modular_forms_cathedral import IDENTITY_RING_GENERATORS
    assert IDENTITY_RING_GENERATORS is True


def test_identity_ring_num_generators():
    from urt.modular_forms_cathedral import IDENTITY_RING_NUM_GENERATORS
    assert IDENTITY_RING_NUM_GENERATORS is True


# ── Ramanujan tau ──────────────────────────────────────────────────────────────

def test_tau_at_2_is_minus_24():
    """τ(2) = -24 = -2V."""
    from urt.modular_forms_cathedral import TAU_AT_2, TAU_RAMANUJAN
    from urt.shell_closure import V
    assert TAU_AT_2 == -24
    assert TAU_AT_2 == -2 * V
    assert TAU_RAMANUJAN[2] == -24


def test_tau_at_1_is_one():
    """τ(1) = 1 (normalisation of Δ)."""
    from urt.modular_forms_cathedral import TAU_RAMANUJAN
    assert TAU_RAMANUJAN[1] == 1


def test_tau_at_3():
    """τ(3) = 252 (standard value)."""
    from urt.modular_forms_cathedral import TAU_RAMANUJAN
    assert TAU_RAMANUJAN[3] == 252


def test_tau_at_n_is_correct():
    """τ(13) = -577738 (OEIS A000594)."""
    from urt.modular_forms_cathedral import TAU_AT_N
    assert TAU_AT_N == -577738


def test_identity_tau_2():
    from urt.modular_forms_cathedral import IDENTITY_TAU_2_IS_MINUS_2V
    assert IDENTITY_TAU_2_IS_MINUS_2V is True


# ── Leech lattice ──────────────────────────────────────────────────────────────

def test_leech_dim_is_24():
    """Leech lattice lives in R^24 = R^{2V}."""
    from urt.modular_forms_cathedral import LEECH_DIM
    from urt.shell_closure import V
    assert LEECH_DIM == 24
    assert LEECH_DIM == 2 * V


def test_leech_kissing_value():
    """Leech kissing number = 196560."""
    from urt.modular_forms_cathedral import LEECH_KISSING, LEECH_KISSING_EXACT
    assert LEECH_KISSING == 196560
    assert LEECH_KISSING == LEECH_KISSING_EXACT


def test_leech_kissing_formula():
    """196560 = 2^(D+1) × D^D × q × (D!+1) × N."""
    from urt.modular_forms_cathedral import LEECH_KISSING
    from urt.shell_closure import D, N, q
    assert LEECH_KISSING == 2**(D+1) * D**D * q * (factorial(D)+1) * N


def test_leech_kissing_factorisation():
    """196560 = 16 × 27 × 5 × 7 × 13."""
    from urt.modular_forms_cathedral import LEECH_KISSING
    assert LEECH_KISSING == 16 * 27 * 5 * 7 * 13


def test_e8_kissing_is_4g():
    """E₈ kissing number = 240 = 4G."""
    from urt.modular_forms_cathedral import E8_KISSING
    from urt.shell_closure import G
    assert E8_KISSING == 4 * G
    assert E8_KISSING == 240


def test_identity_leech_dim():
    from urt.modular_forms_cathedral import IDENTITY_LEECH_DIM_IS_2V
    assert IDENTITY_LEECH_DIM_IS_2V is True


def test_identity_leech_kissing_value():
    from urt.modular_forms_cathedral import IDENTITY_LEECH_KISSING_VALUE
    assert IDENTITY_LEECH_KISSING_VALUE is True


def test_identity_leech_kissing_formula():
    from urt.modular_forms_cathedral import IDENTITY_LEECH_KISSING_FORMULA
    assert IDENTITY_LEECH_KISSING_FORMULA is True


# ── Niemeier lattices ──────────────────────────────────────────────────────────

def test_niemeier_count():
    """There are 24 = 2V Niemeier lattices in R^24."""
    from urt.modular_forms_cathedral import N_NIEMEIER
    from urt.shell_closure import V
    assert N_NIEMEIER == 24
    assert N_NIEMEIER == 2 * V


def test_identity_niemeier():
    from urt.modular_forms_cathedral import IDENTITY_NIEMEIER_IS_2V
    assert IDENTITY_NIEMEIER_IS_2V is True


# ── Perfect numbers ────────────────────────────────────────────────────────────

def test_perfect_1_value():
    """PERFECT_1 = 6 = D!."""
    from urt.modular_forms_cathedral import PERFECT_1
    from urt.shell_closure import D
    assert PERFECT_1 == 6
    assert PERFECT_1 == factorial(D)


def test_perfect_2_value():
    """PERFECT_2 = 28 = (D+1)×(D!+1)."""
    from urt.modular_forms_cathedral import PERFECT_2
    from urt.shell_closure import D
    assert PERFECT_2 == 28
    assert PERFECT_2 == (D + 1) * (factorial(D) + 1)


def test_perfect_3_value():
    """PERFECT_3 = 496 = 2^(D+1) × (2^q − 1)."""
    from urt.modular_forms_cathedral import PERFECT_3
    from urt.shell_closure import D, q
    assert PERFECT_3 == 496
    assert PERFECT_3 == 2**(D+1) * (2**q - 1)


def test_perfect_4_value():
    """PERFECT_4 = 8128 = 2^{D!} × (2^{D!+1} − 1)."""
    from urt.modular_forms_cathedral import PERFECT_4
    from urt.shell_closure import D
    df = factorial(D)
    assert PERFECT_4 == 8128
    assert PERFECT_4 == 2**df * (2**(df+1) - 1)


def test_perfect_numbers_are_even():
    """All four perfect numbers are even."""
    from urt.modular_forms_cathedral import PERFECT_1, PERFECT_2, PERFECT_3, PERFECT_4
    for p in [PERFECT_1, PERFECT_2, PERFECT_3, PERFECT_4]:
        assert p % 2 == 0


def test_perfect_numbers_euclid_euler():
    """Each perfect number satisfies the Euclid-Euler form 2^(p-1)(2^p-1) for Mersenne p."""
    # p=2 → P1=6, p=3 → P2=28, p=5 → P3=496, p=7 → P4=8128
    from urt.modular_forms_cathedral import PERFECT_1, PERFECT_2, PERFECT_3, PERFECT_4
    assert PERFECT_1 == 2**(2-1) * (2**2 - 1)
    assert PERFECT_2 == 2**(3-1) * (2**3 - 1)
    assert PERFECT_3 == 2**(5-1) * (2**5 - 1)
    assert PERFECT_4 == 2**(7-1) * (2**7 - 1)


def test_perfect_3_equals_hetero_gauge():
    """PERFECT_3 = 496 = dim(E₈×E₈) / heterotic gauge."""
    from urt.modular_forms_cathedral import PERFECT_3
    assert PERFECT_3 == 496


def test_identity_perfect_1():
    from urt.modular_forms_cathedral import IDENTITY_PERFECT_1_IS_D_FACT
    assert IDENTITY_PERFECT_1_IS_D_FACT is True


def test_identity_perfect_2():
    from urt.modular_forms_cathedral import IDENTITY_PERFECT_2_CATHEDRAL
    assert IDENTITY_PERFECT_2_CATHEDRAL is True


def test_identity_perfect_3():
    from urt.modular_forms_cathedral import IDENTITY_PERFECT_3_CATHEDRAL
    assert IDENTITY_PERFECT_3_CATHEDRAL is True


def test_identity_perfect_4():
    from urt.modular_forms_cathedral import IDENTITY_PERFECT_4_CATHEDRAL
    assert IDENTITY_PERFECT_4_CATHEDRAL is True


# ── Moonshine / Monster ────────────────────────────────────────────────────────

def test_j_coeff_q1():
    """The coefficient of q in j(τ) is 196884."""
    from urt.modular_forms_cathedral import J_COEFF_Q1
    assert J_COEFF_Q1 == 196884


def test_monster_lowest_rep():
    """Smallest non-trivial Monster irrep has dimension 196883."""
    from urt.modular_forms_cathedral import MONSTER_LOWEST_REP
    assert MONSTER_LOWEST_REP == 196883


def test_moonshine_mckay():
    """McKay's observation: 196884 = 196883 + 1."""
    from urt.modular_forms_cathedral import J_COEFF_Q1, MONSTER_LOWEST_REP
    assert J_COEFF_Q1 == MONSTER_LOWEST_REP + 1


def test_identity_moonshine():
    from urt.modular_forms_cathedral import IDENTITY_MOONSHINE_MONSTER
    assert IDENTITY_MOONSHINE_MONSTER is True


# ── Summary function ───────────────────────────────────────────────────────────

def test_summary_returns_dict():
    """modular_forms_summary() returns a dict with expected keys."""
    from urt.modular_forms_cathedral import modular_forms_summary
    s = modular_forms_summary()
    assert isinstance(s, dict)
    assert s["eisenstein_e4_weight"] == 4
    assert s["eisenstein_e6_weight"] == 6
    assert s["delta_weight"] == 12
    assert s["eta_power_delta"] == 24
    assert s["dim_s_v"] == 1
    assert s["dim_m_v"] == 2
    assert s["j_at_i"] == 1728
    assert s["j_const_term"] == 744
    assert s["e8_dim"] == 248
    assert s["leech_dim"] == 24
    assert s["leech_kissing"] == 196560
    assert s["n_niemeier"] == 24
    assert s["perfect_numbers"] == [6, 28, 496, 8128]
    assert s["tau_at_2"] == -24
    assert s["all_exact"] is True


def test_print_report_runs(capsys):
    """print_modular_forms_report() produces output without error."""
    from urt.modular_forms_cathedral import print_modular_forms_report
    print_modular_forms_report()
    out = capsys.readouterr().out
    assert "Cathedral" in out
    assert "ALL_MOD_FORMS_EXACT = True" in out


# ── Cross-module consistency ───────────────────────────────────────────────────

import pytest


@pytest.mark.skip(reason="pure-math branch: string_landscape lives on main only")
def test_e8_dim_agrees_with_string_landscape():
    pass


def test_tau_at_2_agrees_with_number_theory():
    """τ(2) = -24 agrees with number_theory_cathedral.TAU_RAMANUJAN[2]."""
    from urt.modular_forms_cathedral import TAU_AT_2
    from urt.number_theory_cathedral import TAU_RAMANUJAN
    assert TAU_AT_2 == TAU_RAMANUJAN[2]


@pytest.mark.skip(reason="pure-math branch: string_landscape lives on main only")
def test_leech_dim_agrees_with_string_landscape():
    pass
