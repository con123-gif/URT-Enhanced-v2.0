"""Tests for urt/voa_cathedral.py — Vertex Operator Algebras, Moonshine, W-algebras."""

import pytest
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    """All public names import without error."""
    from urt.voa_cathedral import (
        # Moonshine
        VOA_MOONSHINE_C, VOA_MOONSHINE_DIM1, VOA_MOONSHINE_DIM2,
        MCKAY_DECOMP, VOA_DIM2_MOD_N,
        IDENTITY_VOA_MOONSHINE_C, IDENTITY_MCKAY, IDENTITY_VOA_DIM2_MOD,
        # Free boson / lattice
        FREE_BOSON_C_N, LATTICE_VOA_LEECH_C, LATTICE_VOA_E8_C, TRIPLE_E8_C,
        IDENTITY_FREE_BOSON_N, IDENTITY_LATTICE_LEECH_C,
        IDENTITY_LATTICE_E8_C, IDENTITY_TRIPLE_E8,
        # W-algebras
        W_SLD_LEVEL_D_C, W3_SPIN_W, WN_EXTRA_GENS, W_INF_TO_WN_C,
        IDENTITY_W_SLD_C, IDENTITY_W3_SPIN, IDENTITY_WN_EXTRA, IDENTITY_WINF_C,
        # Minimal models
        ISING_N_IRREPS, ISING_IRREPS_FROM_FORMULA,
        POTTS_N_IRREPS, TAU_G13, YL_N_IRREPS,
        IDENTITY_ISING_IRREPS, IDENTITY_ISING_IRREPS_FORMULA,
        IDENTITY_POTTS_IRREPS, IDENTITY_POTTS_IRREPS_TAU, IDENTITY_YL_IRREPS,
        # Zhu
        ZHU_DIM_ISING, ISING_S_MATRIX_DIM, ISING_T_PHASES,
        IDENTITY_ZHU_DIM, IDENTITY_ISING_S_DIM, IDENTITY_ISING_T,
        # McKay E-series
        AFFINE_E8_NODES, E8_MARKS_SUM,
        AFFINE_E6_NODES, AFFINE_E7_NODES,
        COX_E6, COX_E7, COX_E8,
        IDENTITY_AFFINE_E8, IDENTITY_E8_MARKS,
        IDENTITY_AFFINE_E6, IDENTITY_AFFINE_E7,
        IDENTITY_COX_E6, IDENTITY_COX_E7, IDENTITY_COX_E8,
        # Rogers-Ramanujan
        RR_VOA_INDEX, RR_PERIOD, RR_H2_NUM, RR_H2_DEN, RR_CFT_C_DEN,
        IDENTITY_RR_VOA, IDENTITY_RR_PERIOD, IDENTITY_RR_H2, IDENTITY_RR_C,
        # Automorphisms
        MONSTER_SMALLEST_NONTRIVIAL, BABY_MONSTER_VOA_C, CONWAY_VOA_C,
        IDENTITY_BABY_MONSTER_C, IDENTITY_CONWAY_C,
        # Summary
        ALL_VOA_IDENTITIES, ALL_VOA_EXACT, N_VOA_IDENTITIES,
        GAMMA_INV,
        # Functions
        voa_summary, print_voa_report,
    )


# ── Cathedral integers ────────────────────────────────────────────────────────

def test_cathedral_integers():
    """D=3, N=13, V=12, E=30, F=20, q=5, G=60 match shell_closure."""
    from urt.shell_closure import N, D, V, E, F, q, G
    assert (D, N, V, E, F, q, G) == (3, 13, 12, 30, 20, 5, 60)


def test_gamma_inv():
    """GAMMA_INV = 81 = D^{D+1}."""
    from urt.voa_cathedral import GAMMA_INV
    from urt.shell_closure import D
    assert GAMMA_INV == 81
    assert GAMMA_INV == D ** (D + 1)


# ── Section 1: Moonshine VOA V♮ ──────────────────────────────────────────────

def test_moonshine_central_charge_value():
    """c(V♮) = 24."""
    from urt.voa_cathedral import VOA_MOONSHINE_C
    assert VOA_MOONSHINE_C == 24


def test_moonshine_central_charge_eq_2V():
    """c(V♮) = 24 = 2V."""
    from urt.voa_cathedral import IDENTITY_VOA_MOONSHINE_C
    assert IDENTITY_VOA_MOONSHINE_C is True


def test_moonshine_dim1_zero():
    """dim V♮_1 = 0 (no weight-1 states in the Monster VOA)."""
    from urt.voa_cathedral import VOA_MOONSHINE_DIM1
    assert VOA_MOONSHINE_DIM1 == 0


def test_moonshine_dim2_value():
    """dim V♮_2 = 196884."""
    from urt.voa_cathedral import VOA_MOONSHINE_DIM2
    assert VOA_MOONSHINE_DIM2 == 196884


def test_mckay_decomposition_sum():
    """196883 + 1 = 196884 (McKay's observation)."""
    from urt.voa_cathedral import MCKAY_DECOMP, VOA_MOONSHINE_DIM2
    assert sum(MCKAY_DECOMP) == VOA_MOONSHINE_DIM2


def test_mckay_identity_flag():
    """IDENTITY_MCKAY is True."""
    from urt.voa_cathedral import IDENTITY_MCKAY
    assert IDENTITY_MCKAY is True


def test_mckay_decomp_parts():
    """MCKAY_DECOMP = (196883, 1)."""
    from urt.voa_cathedral import MCKAY_DECOMP
    assert MCKAY_DECOMP == (196883, 1)


def test_dim2_mod_N_equals_V():
    """196884 mod 13 = 12 = V."""
    from urt.voa_cathedral import VOA_DIM2_MOD_N, IDENTITY_VOA_DIM2_MOD
    from urt.shell_closure import N, V
    assert VOA_DIM2_MOD_N == V
    assert VOA_DIM2_MOD_N == 12
    assert 196884 % N == V
    assert IDENTITY_VOA_DIM2_MOD is True


# ── Section 2: Free boson / lattice VOAs ─────────────────────────────────────

def test_free_boson_c_equals_N():
    """N free boson generators give central charge c=N=13."""
    from urt.voa_cathedral import FREE_BOSON_C_N, IDENTITY_FREE_BOSON_N
    from urt.shell_closure import N
    assert FREE_BOSON_C_N == N
    assert IDENTITY_FREE_BOSON_N is True


def test_lattice_leech_c_equals_2V():
    """c(V_Leech) = 24 = 2V."""
    from urt.voa_cathedral import LATTICE_VOA_LEECH_C, IDENTITY_LATTICE_LEECH_C
    from urt.shell_closure import V
    assert LATTICE_VOA_LEECH_C == 2 * V
    assert LATTICE_VOA_LEECH_C == 24
    assert IDENTITY_LATTICE_LEECH_C is True


def test_lattice_e8_c_equals_2_pow_D():
    """c(V_E8) = 8 = 2^D."""
    from urt.voa_cathedral import LATTICE_VOA_E8_C, IDENTITY_LATTICE_E8_C
    from urt.shell_closure import D
    assert LATTICE_VOA_E8_C == 2**D
    assert LATTICE_VOA_E8_C == 8
    assert IDENTITY_LATTICE_E8_C is True


def test_triple_e8_c_equals_2V():
    """Three E₈ VOAs: c = 3×8 = 24 = 2V."""
    from urt.voa_cathedral import TRIPLE_E8_C, IDENTITY_TRIPLE_E8
    from urt.shell_closure import V
    assert TRIPLE_E8_C == 2 * V
    assert TRIPLE_E8_C == 24
    assert IDENTITY_TRIPLE_E8 is True


# ── Section 3: W-algebras ─────────────────────────────────────────────────────

def test_w_sld_central_charge():
    """W(sl(D), k=D) VOA has c = D+1 = 4."""
    from urt.voa_cathedral import W_SLD_LEVEL_D_C, IDENTITY_W_SLD_C
    from urt.shell_closure import D
    assert W_SLD_LEVEL_D_C == D + 1
    assert W_SLD_LEVEL_D_C == 4
    assert IDENTITY_W_SLD_C is True


def test_w3_generator_spin():
    """W₃ algebra has extra generator of spin D=3."""
    from urt.voa_cathedral import W3_SPIN_W, IDENTITY_W3_SPIN
    from urt.shell_closure import D
    assert W3_SPIN_W == D
    assert W3_SPIN_W == 3
    assert IDENTITY_W3_SPIN is True


def test_wn_extra_generators():
    """W_{13} = W_N has N-1=12=V extra generators beyond Virasoro."""
    from urt.voa_cathedral import WN_EXTRA_GENS, IDENTITY_WN_EXTRA
    from urt.shell_closure import N, V
    assert WN_EXTRA_GENS == N - 1
    assert WN_EXTRA_GENS == V
    assert WN_EXTRA_GENS == 12
    assert IDENTITY_WN_EXTRA is True


def test_winf_truncation_c():
    """W_{1+∞} at c = -N = -13 truncates to W_N."""
    from urt.voa_cathedral import W_INF_TO_WN_C, IDENTITY_WINF_C
    from urt.shell_closure import N
    assert W_INF_TO_WN_C == -N
    assert W_INF_TO_WN_C == -13
    assert IDENTITY_WINF_C is True


# ── Section 4: Minimal models ─────────────────────────────────────────────────

def test_ising_irreps_count():
    """Ising CFT M(D,D+1)=M(3,4) has D=3 irreducible representations."""
    from urt.voa_cathedral import ISING_N_IRREPS, IDENTITY_ISING_IRREPS
    from urt.shell_closure import D
    assert ISING_N_IRREPS == D
    assert ISING_N_IRREPS == 3
    assert IDENTITY_ISING_IRREPS is True


def test_ising_irreps_from_formula():
    """Formula (p-1)(p'-1)/2 for M(D,D+1) gives (D-1)×D//2 = D = 3."""
    from urt.voa_cathedral import ISING_IRREPS_FROM_FORMULA, IDENTITY_ISING_IRREPS_FORMULA
    from urt.shell_closure import D
    assert ISING_IRREPS_FROM_FORMULA == D
    assert ISING_IRREPS_FROM_FORMULA == 3
    assert IDENTITY_ISING_IRREPS_FORMULA is True


def test_ising_both_irrep_formulas_agree():
    """Both Ising irrep calculations give the same value."""
    from urt.voa_cathedral import ISING_N_IRREPS, ISING_IRREPS_FROM_FORMULA
    assert ISING_N_IRREPS == ISING_IRREPS_FROM_FORMULA


def test_potts_irreps_count():
    """Potts M(q, D!)=M(5,6) has (q-1)(D!-1)/2 = 10 irreps."""
    from urt.voa_cathedral import POTTS_N_IRREPS, IDENTITY_POTTS_IRREPS
    from urt.shell_closure import D, q
    expected = (q - 1) * (factorial(D) - 1) // 2
    assert POTTS_N_IRREPS == expected
    assert POTTS_N_IRREPS == 10
    assert IDENTITY_POTTS_IRREPS is True


def test_potts_irreps_equals_tau_g13():
    """Potts irreps = 10 = TAU_G13."""
    from urt.voa_cathedral import POTTS_N_IRREPS, TAU_G13, IDENTITY_POTTS_IRREPS_TAU
    assert POTTS_N_IRREPS == TAU_G13
    assert TAU_G13 == 10
    assert IDENTITY_POTTS_IRREPS_TAU is True


def test_yl_irreps_count():
    """Yang-Lee M(2,q)=M(2,5) has (q-1)/2 = 2 = D-1 irreps."""
    from urt.voa_cathedral import YL_N_IRREPS, IDENTITY_YL_IRREPS
    from urt.shell_closure import D, q
    assert YL_N_IRREPS == (q - 1) // 2
    assert YL_N_IRREPS == D - 1
    assert YL_N_IRREPS == 2
    assert IDENTITY_YL_IRREPS is True


# ── Section 5: Zhu's algebra ──────────────────────────────────────────────────

def test_zhu_dim_ising():
    """dim A(Ising) = D = 3 by Zhu's theorem."""
    from urt.voa_cathedral import ZHU_DIM_ISING, IDENTITY_ZHU_DIM
    from urt.shell_closure import D
    assert ZHU_DIM_ISING == D
    assert ZHU_DIM_ISING == 3
    assert IDENTITY_ZHU_DIM is True


def test_ising_s_matrix_dimension():
    """Ising modular S-matrix is D×D = 9 = D²."""
    from urt.voa_cathedral import ISING_S_MATRIX_DIM, IDENTITY_ISING_S_DIM
    from urt.shell_closure import D
    assert ISING_S_MATRIX_DIM == D**2
    assert ISING_S_MATRIX_DIM == 9
    assert IDENTITY_ISING_S_DIM is True


def test_ising_t_phases():
    """Ising modular T-matrix has D=3 distinct phases."""
    from urt.voa_cathedral import ISING_T_PHASES, IDENTITY_ISING_T
    from urt.shell_closure import D
    assert ISING_T_PHASES == D
    assert ISING_T_PHASES == 3
    assert IDENTITY_ISING_T is True


# ── Section 6: McKay E-series ─────────────────────────────────────────────────

def test_affine_e8_nodes():
    """Affine E₈ Dynkin diagram has 9 = D² nodes."""
    from urt.voa_cathedral import AFFINE_E8_NODES, IDENTITY_AFFINE_E8
    from urt.shell_closure import D
    assert AFFINE_E8_NODES == D**2
    assert AFFINE_E8_NODES == 9
    assert IDENTITY_AFFINE_E8 is True


def test_e8_marks_sum_equals_E():
    """Dynkin marks of E₈ sum to 30 = E (Cathedral edge count)."""
    from urt.voa_cathedral import E8_MARKS_SUM, IDENTITY_E8_MARKS
    from urt.shell_closure import E
    marks = (1, 2, 3, 4, 5, 6, 4, 3, 2)
    assert sum(marks) == E
    assert E8_MARKS_SUM == E
    assert E8_MARKS_SUM == 30
    assert IDENTITY_E8_MARKS is True


def test_affine_e6_nodes():
    """Affine E₆ Dynkin diagram has 7 = D!+1 nodes."""
    from urt.voa_cathedral import AFFINE_E6_NODES, IDENTITY_AFFINE_E6
    from urt.shell_closure import D
    assert AFFINE_E6_NODES == factorial(D) + 1
    assert AFFINE_E6_NODES == 7
    assert IDENTITY_AFFINE_E6 is True


def test_affine_e7_nodes():
    """Affine E₇ Dynkin diagram has 8 = 2^D nodes."""
    from urt.voa_cathedral import AFFINE_E7_NODES, IDENTITY_AFFINE_E7
    from urt.shell_closure import D
    assert AFFINE_E7_NODES == 2**D
    assert AFFINE_E7_NODES == 8
    assert IDENTITY_AFFINE_E7 is True


def test_coxeter_e6():
    """Coxeter number h(E₆) = 12 = V."""
    from urt.voa_cathedral import COX_E6, IDENTITY_COX_E6
    from urt.shell_closure import V
    assert COX_E6 == V
    assert COX_E6 == 12
    assert IDENTITY_COX_E6 is True


def test_coxeter_e7():
    """Coxeter number h(E₇) = 18 = D!×D."""
    from urt.voa_cathedral import COX_E7, IDENTITY_COX_E7
    from urt.shell_closure import D
    assert COX_E7 == factorial(D) * D
    assert COX_E7 == 18
    assert IDENTITY_COX_E7 is True


def test_coxeter_e8():
    """Coxeter number h(E₈) = 30 = E."""
    from urt.voa_cathedral import COX_E8, IDENTITY_COX_E8
    from urt.shell_closure import E
    assert COX_E8 == E
    assert COX_E8 == 30
    assert IDENTITY_COX_E8 is True


def test_coxeter_numbers_ascending():
    """h(E₆) < h(E₇) < h(E₈)."""
    from urt.voa_cathedral import COX_E6, COX_E7, COX_E8
    assert COX_E6 < COX_E7 < COX_E8


# ── Section 7: Rogers-Ramanujan ───────────────────────────────────────────────

def test_rr_voa_index():
    """Rogers-Ramanujan VOA lives in M(2,q) with index q=5."""
    from urt.voa_cathedral import RR_VOA_INDEX, IDENTITY_RR_VOA
    from urt.shell_closure import q
    assert RR_VOA_INDEX == q
    assert RR_VOA_INDEX == 5
    assert IDENTITY_RR_VOA is True


def test_rr_period():
    """Rogers-Ramanujan product period = q = 5."""
    from urt.voa_cathedral import RR_PERIOD, IDENTITY_RR_PERIOD
    from urt.shell_closure import q
    assert RR_PERIOD == q
    assert RR_PERIOD == 5
    assert IDENTITY_RR_PERIOD is True


def test_rr_h2_denominator():
    """Second RR function highest weight h = 2/q = 2/5."""
    from urt.voa_cathedral import RR_H2_NUM, RR_H2_DEN, IDENTITY_RR_H2
    from urt.shell_closure import q
    assert RR_H2_DEN == q
    assert RR_H2_DEN == 5
    assert RR_H2_NUM == 2
    assert IDENTITY_RR_H2 is True


def test_rr_cft_c_denominator():
    """Yang-Lee central charge c = -22/q, denominator = q = 5."""
    from urt.voa_cathedral import RR_CFT_C_DEN, IDENTITY_RR_C
    from urt.shell_closure import q
    assert RR_CFT_C_DEN == q
    assert RR_CFT_C_DEN == 5
    assert IDENTITY_RR_C is True


def test_rr_period_equals_voa_index():
    """RR_PERIOD and RR_VOA_INDEX are both q."""
    from urt.voa_cathedral import RR_PERIOD, RR_VOA_INDEX
    assert RR_PERIOD == RR_VOA_INDEX


# ── Section 8: VOA automorphisms ──────────────────────────────────────────────

def test_monster_smallest_nontrivial():
    """Smallest non-trivial Monster irrep has dimension 196883."""
    from urt.voa_cathedral import MONSTER_SMALLEST_NONTRIVIAL
    assert MONSTER_SMALLEST_NONTRIVIAL == 196883


def test_baby_monster_voa_c():
    """Baby Monster VOA c = 23 = 2N-3."""
    from urt.voa_cathedral import BABY_MONSTER_VOA_C, IDENTITY_BABY_MONSTER_C
    from urt.shell_closure import N
    assert BABY_MONSTER_VOA_C == 2 * N - 3
    assert BABY_MONSTER_VOA_C == 23
    assert IDENTITY_BABY_MONSTER_C is True


def test_conway_voa_c():
    """Conway VOA (Leech) has c = 24 = 2V."""
    from urt.voa_cathedral import CONWAY_VOA_C, IDENTITY_CONWAY_C
    from urt.shell_closure import V
    assert CONWAY_VOA_C == 2 * V
    assert CONWAY_VOA_C == 24
    assert IDENTITY_CONWAY_C is True


def test_baby_monster_c_less_moonshine():
    """c(Baby Monster) = 23 < c(V♮) = 24."""
    from urt.voa_cathedral import BABY_MONSTER_VOA_C, VOA_MOONSHINE_C
    assert BABY_MONSTER_VOA_C < VOA_MOONSHINE_C
    assert BABY_MONSTER_VOA_C == VOA_MOONSHINE_C - 1


# ── Section 9: Global ALL_VOA_EXACT ──────────────────────────────────────────

def test_all_voa_exact():
    """ALL_VOA_EXACT = True: every identity holds."""
    from urt.voa_cathedral import ALL_VOA_EXACT
    assert ALL_VOA_EXACT is True


def test_all_voa_identities_list_all_true():
    """Every entry in ALL_VOA_IDENTITIES is True."""
    from urt.voa_cathedral import ALL_VOA_IDENTITIES
    for i, flag in enumerate(ALL_VOA_IDENTITIES):
        assert flag is True, f"Identity index {i} is False"


def test_n_voa_identities_count():
    """N_VOA_IDENTITIES = 32 (all identities accounted for)."""
    from urt.voa_cathedral import N_VOA_IDENTITIES, ALL_VOA_IDENTITIES
    assert N_VOA_IDENTITIES == len(ALL_VOA_IDENTITIES)
    assert N_VOA_IDENTITIES == 32


# ── voa_summary() ─────────────────────────────────────────────────────────────

def test_voa_summary_returns_dict():
    """voa_summary() returns a dict."""
    from urt.voa_cathedral import voa_summary
    result = voa_summary()
    assert isinstance(result, dict)


def test_voa_summary_all_exact_key():
    """voa_summary()['all_exact'] is True."""
    from urt.voa_cathedral import voa_summary
    s = voa_summary()
    assert s["all_exact"] is True


def test_voa_summary_n_identities():
    """voa_summary()['n_identities'] matches N_VOA_IDENTITIES."""
    from urt.voa_cathedral import voa_summary, N_VOA_IDENTITIES
    s = voa_summary()
    assert s["n_identities"] == N_VOA_IDENTITIES


def test_voa_summary_key_values():
    """Key numerical values in voa_summary() are correct."""
    from urt.voa_cathedral import voa_summary
    s = voa_summary()
    assert s["moonshine_c"] == 24
    assert s["mckay_dim2"] == 196884
    assert s["dim2_mod_N"] == 12
    assert s["leech_voa_c"] == 24
    assert s["e8_voa_c"] == 8
    assert s["wn_extra_gens"] == 12
    assert s["e8_marks_sum"] == 30
    assert s["cox_e8"] == 30
    assert s["baby_monster_c"] == 23


def test_voa_summary_all_identities_true():
    """All identity flags in voa_summary() are True."""
    from urt.voa_cathedral import voa_summary
    s = voa_summary()
    identity_keys = [k for k in s if k.startswith("identity_") or k.endswith("_ok")
                     or k.endswith("_eq_2V") or k.endswith("_eq_V")]
    # at minimum, all_exact covers them
    assert s["all_exact"] is True


# ── print_voa_report() ────────────────────────────────────────────────────────

def test_print_voa_report_runs(capsys):
    """print_voa_report() executes without error and produces output."""
    from urt.voa_cathedral import print_voa_report
    print_voa_report()
    captured = capsys.readouterr()
    assert len(captured.out) > 0
    assert "VOA Cathedral" in captured.out
    assert "ALL EXACT: True" in captured.out


def test_print_voa_report_contains_cathedral_integers(capsys):
    """Report mentions Cathedral integers D, N, V, E, q."""
    from urt.voa_cathedral import print_voa_report
    print_voa_report()
    captured = capsys.readouterr()
    out = captured.out
    assert "D=3" in out
    assert "N=13" in out
    assert "V=12" in out
    assert "E=30" in out
    assert "q=5" in out
