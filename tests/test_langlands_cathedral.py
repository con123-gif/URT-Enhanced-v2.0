"""
Tests for urt/langlands_cathedral.py — Langlands Cathedral identities.

All IDENTITY_* constants must be True.  ~45 tests covering:
  - Section 1: GL(n) Langlands ranks
  - Section 2: Shimura varieties (Siegel, K3, Niemeier)
  - Section 3: Weil conjectures numbers
  - Section 4: Automorphic/modular forms
  - Section 5: Galois representations
  - Section 6: Fundamental lemma
  - Section 7: p-adic Langlands
  - Section 8: Geometric Langlands / Hitchin
  - Section 9: Additional identities
  - Summary functions
"""

import pytest
from math import factorial, isfinite


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    """All public names import cleanly."""
    from urt.langlands_cathedral import (
        GL_RANK_CLASSICAL, IDENTITY_GL_RANK,
        GF_SIZE_LANGLANDS, IDENTITY_GF_SIZE,
        LANGLANDS_RANKS, IDENTITY_LANGLANDS_RANKS,
        SIEGEL_GENUS, SIEGEL_DIM, IDENTITY_SIEGEL_DIM,
        MODULI_AB_VAR_DIM, IDENTITY_MODULI_DIM,
        K3_H11, IDENTITY_K3_H11,
        K3_MAX_PICARD, IDENTITY_K3_PICARD,
        K3_B2, IDENTITY_K3_B2,
        N_NIEMEIER, IDENTITY_N_NIEMEIER,
        WEIL_GF_CHAR, IDENTITY_WEIL_GF,
        HASSE_BOUND_GFq, IDENTITY_HASSE_BOUND,
        SUPERSINGULAR_COND, IDENTITY_SUPERSINGULAR,
        RAMANUJAN_WEIGHT, IDENTITY_RAMANUJAN_WEIGHT,
        DIM_M12, IDENTITY_DIM_M12,
        TAU_COEFF_2, IDENTITY_TAU2,
        RAMANUJAN_BOUND, IDENTITY_RAMANUJAN_BOUND,
        HECKE_PRIME, IDENTITY_HECKE_PRIME,
        GALOIS_REP_DIM, IDENTITY_GALOIS_REP_DIM,
        IS_FERMAT_PRIME_q, IDENTITY_Q_FERMAT,
        MERSENNE_N,
        FROBENIUS_ORDER, IDENTITY_FROBENIUS,
        FUNDAMENTAL_LEMMA_N, IDENTITY_FUNDAMENTAL_LEMMA,
        AFFINE_GRASS_DIM, IDENTITY_AFFINE_GRASS,
        PADIC_PRIME_D, PADIC_PRIME_q, PADIC_PRIME_N,
        HODGE_TATE_WEIGHT_SUM, IDENTITY_HODGE_TATE,
        FONTAINE_MAZUR_RANK, IDENTITY_FONTAINE_MAZUR,
        IWASAWA_PRIME, IDENTITY_IWASAWA,
        GEOM_LANG_GENUS, GEOM_LANG_GEN, IDENTITY_GEOM_LANG_GEN,
        HITCHIN_BASE_DIM, IDENTITY_HITCHIN,
        HITCHIN_TOTAL_DIM, IDENTITY_HITCHIN_TOTAL,
        HECKE_EIGENSHEAF_RANK, IDENTITY_HECKE_EIGENSHEAF,
        HODGE_TATE_N_WEIGHTS, IDENTITY_HT_WEIGHTS,
        DISC_Q_SQRT5, IDENTITY_DISC_Q_SQRT5,
        J_INVARIANT_I, IDENTITY_J_INVARIANT,
        X0_N_GENUS, IDENTITY_X0_GENUS,
        N_CUSPS_X0_12, IDENTITY_CUSPS,
        MIN_ELLIPTIC_CONDUCTOR, IDENTITY_MIN_CONDUCTOR,
        ALL_LANGLANDS_IDENTITIES, ALL_LANGLANDS_EXACT,
        N_LANGLANDS_IDENTITIES,
        langlands_summary, print_langlands_report,
    )


# ── Section 1: GL(n) Langlands ────────────────────────────────────────────────

def test_GL_rank_classical_value():
    """GL_RANK_CLASSICAL = D-1 = 2."""
    from urt.langlands_cathedral import GL_RANK_CLASSICAL
    from urt.shell_closure import D
    assert GL_RANK_CLASSICAL == D - 1
    assert GL_RANK_CLASSICAL == 2


def test_IDENTITY_GL_RANK():
    from urt.langlands_cathedral import IDENTITY_GL_RANK
    assert IDENTITY_GL_RANK is True


def test_GF_size_eq_q():
    """GF_SIZE_LANGLANDS = q = 5."""
    from urt.langlands_cathedral import GF_SIZE_LANGLANDS
    from urt.shell_closure import q
    assert GF_SIZE_LANGLANDS == q
    assert GF_SIZE_LANGLANDS == 5


def test_IDENTITY_GF_SIZE():
    from urt.langlands_cathedral import IDENTITY_GF_SIZE
    assert IDENTITY_GF_SIZE is True


def test_Langlands_ranks_values():
    """LANGLANDS_RANKS = [D-1, D, D+1, q] = [2, 3, 4, 5]."""
    from urt.langlands_cathedral import LANGLANDS_RANKS
    from urt.shell_closure import D, q
    assert LANGLANDS_RANKS == [D - 1, D, D + 1, q]
    assert LANGLANDS_RANKS == [2, 3, 4, 5]


def test_IDENTITY_LANGLANDS_RANKS():
    from urt.langlands_cathedral import IDENTITY_LANGLANDS_RANKS
    assert IDENTITY_LANGLANDS_RANKS is True


# ── Section 2: Shimura varieties ─────────────────────────────────────────────

def test_Siegel_dim_eq_D_factorial():
    """SIEGEL_DIM = D(D+1)/2 = 6 = D! = 3! (self-referential)."""
    from urt.langlands_cathedral import SIEGEL_DIM, SIEGEL_GENUS
    from urt.shell_closure import D
    assert SIEGEL_GENUS == D
    assert SIEGEL_DIM == D * (D + 1) // 2
    assert SIEGEL_DIM == factorial(D)
    assert SIEGEL_DIM == 6


def test_IDENTITY_SIEGEL_DIM():
    from urt.langlands_cathedral import IDENTITY_SIEGEL_DIM
    assert IDENTITY_SIEGEL_DIM is True


def test_moduli_ab_var_dim_eq_D_factorial():
    """MODULI_AB_VAR_DIM = D(D+1)/2 = 6 = D!."""
    from urt.langlands_cathedral import MODULI_AB_VAR_DIM
    from urt.shell_closure import D
    assert MODULI_AB_VAR_DIM == factorial(D)
    assert MODULI_AB_VAR_DIM == 6


def test_IDENTITY_MODULI_DIM():
    from urt.langlands_cathedral import IDENTITY_MODULI_DIM
    assert IDENTITY_MODULI_DIM is True


def test_K3_h11_eq_F():
    """K3 Hodge number h^{1,1} = 20 = F (icosahedral faces)."""
    from urt.langlands_cathedral import K3_H11
    from urt.shell_closure import F
    assert K3_H11 == F
    assert K3_H11 == 20


def test_IDENTITY_K3_H11():
    from urt.langlands_cathedral import IDENTITY_K3_H11
    assert IDENTITY_K3_H11 is True


def test_K3_b2_eq_2N_minus_4():
    """K3 second Betti number b2 = 22 = 2N-4."""
    from urt.langlands_cathedral import K3_B2
    from urt.shell_closure import N
    assert K3_B2 == 2 * N - 4
    assert K3_B2 == 22


def test_IDENTITY_K3_B2():
    from urt.langlands_cathedral import IDENTITY_K3_B2
    assert IDENTITY_K3_B2 is True


def test_N_Niemeier_eq_2V():
    """24 Niemeier lattices = 2V = Leech lattice dimension."""
    from urt.langlands_cathedral import N_NIEMEIER
    from urt.shell_closure import V
    assert N_NIEMEIER == 2 * V
    assert N_NIEMEIER == 24


def test_IDENTITY_N_NIEMEIER():
    from urt.langlands_cathedral import IDENTITY_N_NIEMEIER
    assert IDENTITY_N_NIEMEIER is True


# ── Section 3: Weil conjectures ───────────────────────────────────────────────

def test_Weil_GF_char_eq_q():
    """Cathedral GF characteristic = q = 5."""
    from urt.langlands_cathedral import WEIL_GF_CHAR
    from urt.shell_closure import q
    assert WEIL_GF_CHAR == q
    assert WEIL_GF_CHAR == 5


def test_IDENTITY_WEIL_GF():
    from urt.langlands_cathedral import IDENTITY_WEIL_GF
    assert IDENTITY_WEIL_GF is True


def test_Hasse_bound_eq_2q():
    """Hasse bound (over GF(q²)) = 2q = 10."""
    from urt.langlands_cathedral import HASSE_BOUND_GFq
    from urt.shell_closure import q
    assert HASSE_BOUND_GFq == 2 * q
    assert HASSE_BOUND_GFq == 10


def test_IDENTITY_HASSE_BOUND():
    from urt.langlands_cathedral import IDENTITY_HASSE_BOUND
    assert IDENTITY_HASSE_BOUND is True


def test_supersingular_cond_eq_q():
    """Supersingular conductor at p=q is q=5."""
    from urt.langlands_cathedral import SUPERSINGULAR_COND
    from urt.shell_closure import q
    assert SUPERSINGULAR_COND == q


def test_IDENTITY_SUPERSINGULAR():
    from urt.langlands_cathedral import IDENTITY_SUPERSINGULAR
    assert IDENTITY_SUPERSINGULAR is True


# ── Section 4: Modular forms ──────────────────────────────────────────────────

def test_Ramanujan_weight_eq_V():
    """Ramanujan tau form Δ has weight 12 = V."""
    from urt.langlands_cathedral import RAMANUJAN_WEIGHT
    from urt.shell_closure import V
    assert RAMANUJAN_WEIGHT == V
    assert RAMANUJAN_WEIGHT == 12


def test_IDENTITY_RAMANUJAN_WEIGHT():
    from urt.langlands_cathedral import IDENTITY_RAMANUJAN_WEIGHT
    assert IDENTITY_RAMANUJAN_WEIGHT is True


def test_dim_M12_eq_D_minus_1():
    """dim M_12 = 2 = D-1."""
    from urt.langlands_cathedral import DIM_M12
    from urt.shell_closure import D
    assert DIM_M12 == D - 1
    assert DIM_M12 == 2


def test_IDENTITY_DIM_M12():
    from urt.langlands_cathedral import IDENTITY_DIM_M12
    assert IDENTITY_DIM_M12 is True


def test_tau_2_eq_neg_D_2D():
    """τ(2) = -24 = -(D × 2^D) = -(3 × 8)."""
    from urt.langlands_cathedral import TAU_COEFF_2
    from urt.shell_closure import D
    assert TAU_COEFF_2 == -(D * 2**D)
    assert TAU_COEFF_2 == -24


def test_IDENTITY_TAU2():
    from urt.langlands_cathedral import IDENTITY_TAU2
    assert IDENTITY_TAU2 is True


def test_Ramanujan_bound_eq_D_minus_1():
    """Ramanujan conjecture bound = 2 = D-1."""
    from urt.langlands_cathedral import RAMANUJAN_BOUND
    from urt.shell_closure import D
    assert RAMANUJAN_BOUND == D - 1
    assert RAMANUJAN_BOUND == 2


def test_Hecke_prime_eq_N():
    """Hecke prime = N = 13."""
    from urt.langlands_cathedral import HECKE_PRIME
    from urt.shell_closure import N
    assert HECKE_PRIME == N
    assert HECKE_PRIME == 13


def test_IDENTITY_HECKE_PRIME():
    from urt.langlands_cathedral import IDENTITY_HECKE_PRIME
    assert IDENTITY_HECKE_PRIME is True


# ── Section 5: Galois representations ────────────────────────────────────────

def test_Galois_rep_dim_eq_D_minus_1():
    """Galois representation of Δ has dimension 2 = D-1."""
    from urt.langlands_cathedral import GALOIS_REP_DIM
    from urt.shell_closure import D
    assert GALOIS_REP_DIM == D - 1
    assert GALOIS_REP_DIM == 2


def test_IDENTITY_GALOIS_REP_DIM():
    from urt.langlands_cathedral import IDENTITY_GALOIS_REP_DIM
    assert IDENTITY_GALOIS_REP_DIM is True


def test_q_is_Fermat_prime():
    """q=5 is a Fermat prime: 2^(2^1)+1 = 5."""
    from urt.langlands_cathedral import IS_FERMAT_PRIME_q
    assert IS_FERMAT_PRIME_q is True
    # Verify arithmetically
    assert 2**(2**1) + 1 == 5


def test_IDENTITY_Q_FERMAT():
    from urt.langlands_cathedral import IDENTITY_Q_FERMAT
    assert IDENTITY_Q_FERMAT is True


def test_Mersenne_N_value():
    """M_N = 2^13-1 = 8191."""
    from urt.langlands_cathedral import MERSENNE_N
    from urt.shell_closure import N
    assert MERSENNE_N == 2**N - 1
    assert MERSENNE_N == 8191


def test_Frobenius_order_eq_V_and_N_minus_1():
    """Frobenius order = V = 12 = N-1."""
    from urt.langlands_cathedral import FROBENIUS_ORDER
    from urt.shell_closure import V, N
    assert FROBENIUS_ORDER == V
    assert FROBENIUS_ORDER == N - 1
    assert FROBENIUS_ORDER == 12


def test_IDENTITY_FROBENIUS():
    from urt.langlands_cathedral import IDENTITY_FROBENIUS
    assert IDENTITY_FROBENIUS is True


# ── Section 6: Fundamental lemma ─────────────────────────────────────────────

def test_fundamental_lemma_N_eq_D():
    """Ngô fundamental lemma key group GL(D)=GL(3)."""
    from urt.langlands_cathedral import FUNDAMENTAL_LEMMA_N
    from urt.shell_closure import D
    assert FUNDAMENTAL_LEMMA_N == D
    assert FUNDAMENTAL_LEMMA_N == 3


def test_IDENTITY_FUNDAMENTAL_LEMMA():
    from urt.langlands_cathedral import IDENTITY_FUNDAMENTAL_LEMMA
    assert IDENTITY_FUNDAMENTAL_LEMMA is True


def test_affine_Grass_dim_self_referential():
    """AFFINE_GRASS_DIM = D(D-1)/2 = 3 = D (self-referential!)."""
    from urt.langlands_cathedral import AFFINE_GRASS_DIM
    from urt.shell_closure import D
    assert AFFINE_GRASS_DIM == D * (D - 1) // 2
    assert AFFINE_GRASS_DIM == D
    assert AFFINE_GRASS_DIM == 3


def test_IDENTITY_AFFINE_GRASS():
    from urt.langlands_cathedral import IDENTITY_AFFINE_GRASS
    assert IDENTITY_AFFINE_GRASS is True


# ── Section 7: p-adic Langlands ───────────────────────────────────────────────

def test_padic_primes_cathedral():
    """Cathedral p-adic primes are D=3, q=5, N=13."""
    from urt.langlands_cathedral import PADIC_PRIME_D, PADIC_PRIME_q, PADIC_PRIME_N
    from urt.shell_closure import D, q, N
    assert PADIC_PRIME_D == D
    assert PADIC_PRIME_q == q
    assert PADIC_PRIME_N == N


def test_Hodge_Tate_weight_sum_eq_11():
    """Hodge-Tate weights sum = 2D+q = 11 = M-theory dimension."""
    from urt.langlands_cathedral import HODGE_TATE_WEIGHT_SUM
    from urt.shell_closure import D, q
    assert HODGE_TATE_WEIGHT_SUM == 2 * D + q
    assert HODGE_TATE_WEIGHT_SUM == 11


def test_IDENTITY_HODGE_TATE():
    from urt.langlands_cathedral import IDENTITY_HODGE_TATE
    assert IDENTITY_HODGE_TATE is True


def test_Fontaine_Mazur_rank_eq_D_minus_1():
    """Fontaine-Mazur rank = 2 = D-1."""
    from urt.langlands_cathedral import FONTAINE_MAZUR_RANK
    from urt.shell_closure import D
    assert FONTAINE_MAZUR_RANK == D - 1
    assert FONTAINE_MAZUR_RANK == 2


def test_IDENTITY_FONTAINE_MAZUR():
    from urt.langlands_cathedral import IDENTITY_FONTAINE_MAZUR
    assert IDENTITY_FONTAINE_MAZUR is True


def test_Iwasawa_prime_eq_N():
    """Iwasawa prime = N = 13."""
    from urt.langlands_cathedral import IWASAWA_PRIME
    from urt.shell_closure import N
    assert IWASAWA_PRIME == N
    assert IWASAWA_PRIME == 13


def test_IDENTITY_IWASAWA():
    from urt.langlands_cathedral import IDENTITY_IWASAWA
    assert IDENTITY_IWASAWA is True


# ── Section 8: Geometric Langlands / Hitchin ──────────────────────────────────

def test_geom_lang_gen_eq_D_factorial():
    """π₁ of genus-D curve has 2D = 6 = D! generators."""
    from urt.langlands_cathedral import GEOM_LANG_GEN, GEOM_LANG_GENUS
    from urt.shell_closure import D
    assert GEOM_LANG_GENUS == D
    assert GEOM_LANG_GEN == 2 * D
    assert GEOM_LANG_GEN == factorial(D)
    assert GEOM_LANG_GEN == 6


def test_IDENTITY_GEOM_LANG_GEN():
    from urt.langlands_cathedral import IDENTITY_GEOM_LANG_GEN
    assert IDENTITY_GEOM_LANG_GEN is True


def test_Hitchin_base_dim_eq_D_factorial():
    """Hitchin fibration base dim = D(D+1)/2 = 6 = D!."""
    from urt.langlands_cathedral import HITCHIN_BASE_DIM
    from urt.shell_closure import D
    assert HITCHIN_BASE_DIM == D * (D + 1) // 2
    assert HITCHIN_BASE_DIM == factorial(D)
    assert HITCHIN_BASE_DIM == 6


def test_IDENTITY_HITCHIN():
    from urt.langlands_cathedral import IDENTITY_HITCHIN
    assert IDENTITY_HITCHIN is True


def test_Hitchin_total_dim_eq_2V():
    """GL(2) Higgs moduli on genus-D: dim = 2(4-1)(2D-2) = 24 = 2V."""
    from urt.langlands_cathedral import HITCHIN_TOTAL_DIM
    from urt.shell_closure import V, D
    assert HITCHIN_TOTAL_DIM == 2 * (2**2 - 1) * (2 * D - 2)
    assert HITCHIN_TOTAL_DIM == 2 * V
    assert HITCHIN_TOTAL_DIM == 24


def test_IDENTITY_HITCHIN_TOTAL():
    from urt.langlands_cathedral import IDENTITY_HITCHIN_TOTAL
    assert IDENTITY_HITCHIN_TOTAL is True


def test_Hecke_eigensheaf_rank_eq_D():
    """Hecke eigensheaf rank for GL(D)=GL(3) is D=3."""
    from urt.langlands_cathedral import HECKE_EIGENSHEAF_RANK
    from urt.shell_closure import D
    assert HECKE_EIGENSHEAF_RANK == D
    assert HECKE_EIGENSHEAF_RANK == 3


def test_IDENTITY_HECKE_EIGENSHEAF():
    from urt.langlands_cathedral import IDENTITY_HECKE_EIGENSHEAF
    assert IDENTITY_HECKE_EIGENSHEAF is True


# ── Section 9: Additional identities ─────────────────────────────────────────

def test_Hodge_Tate_n_weights_eq_11():
    """HODGE_TATE_N_WEIGHTS = V-1 = 11 = 2D+q."""
    from urt.langlands_cathedral import HODGE_TATE_N_WEIGHTS
    from urt.shell_closure import V, D, q
    assert HODGE_TATE_N_WEIGHTS == V - 1
    assert HODGE_TATE_N_WEIGHTS == 2 * D + q
    assert HODGE_TATE_N_WEIGHTS == 11


def test_IDENTITY_HT_WEIGHTS():
    from urt.langlands_cathedral import IDENTITY_HT_WEIGHTS
    assert IDENTITY_HT_WEIGHTS is True


def test_disc_Q_sqrt5_eq_q():
    """Discriminant of Q(√5) = 5 = q."""
    from urt.langlands_cathedral import DISC_Q_SQRT5
    from urt.shell_closure import q
    assert DISC_Q_SQRT5 == q
    assert DISC_Q_SQRT5 == 5


def test_IDENTITY_DISC_Q_SQRT5():
    from urt.langlands_cathedral import IDENTITY_DISC_Q_SQRT5
    assert IDENTITY_DISC_Q_SQRT5 is True


def test_j_invariant_i_eq_V_cubed():
    """j(i) = 1728 = V^3 = 12^3."""
    from urt.langlands_cathedral import J_INVARIANT_I
    from urt.shell_closure import V
    assert J_INVARIANT_I == V**3
    assert J_INVARIANT_I == 1728


def test_IDENTITY_J_INVARIANT():
    from urt.langlands_cathedral import IDENTITY_J_INVARIANT
    assert IDENTITY_J_INVARIANT is True


def test_X0_N_genus_zero():
    """X_0(13) is a genus-zero modular curve."""
    from urt.langlands_cathedral import X0_N_GENUS
    assert X0_N_GENUS == 0


def test_IDENTITY_X0_GENUS():
    from urt.langlands_cathedral import IDENTITY_X0_GENUS
    assert IDENTITY_X0_GENUS is True


def test_cusps_X0_12_eq_D_plus_1():
    """X_0(12) has D+1 = 4 cusps."""
    from urt.langlands_cathedral import N_CUSPS_X0_12
    from urt.shell_closure import D
    assert N_CUSPS_X0_12 == D + 1
    assert N_CUSPS_X0_12 == 4


def test_IDENTITY_CUSPS():
    from urt.langlands_cathedral import IDENTITY_CUSPS
    assert IDENTITY_CUSPS is True


def test_min_elliptic_conductor_eq_N_minus_2():
    """Smallest conductor = N-2 = 11."""
    from urt.langlands_cathedral import MIN_ELLIPTIC_CONDUCTOR
    from urt.shell_closure import N
    assert MIN_ELLIPTIC_CONDUCTOR == N - 2
    assert MIN_ELLIPTIC_CONDUCTOR == 11


def test_IDENTITY_MIN_CONDUCTOR():
    from urt.langlands_cathedral import IDENTITY_MIN_CONDUCTOR
    assert IDENTITY_MIN_CONDUCTOR is True


# ── All-identities guard ──────────────────────────────────────────────────────

def test_all_Langlands_identities_true():
    """ALL_LANGLANDS_IDENTITIES: every entry is True."""
    from urt.langlands_cathedral import ALL_LANGLANDS_IDENTITIES
    for i, val in enumerate(ALL_LANGLANDS_IDENTITIES):
        assert val is True, f"Identity index {i} is False"


def test_ALL_LANGLANDS_EXACT():
    """ALL_LANGLANDS_EXACT is True."""
    from urt.langlands_cathedral import ALL_LANGLANDS_EXACT
    assert ALL_LANGLANDS_EXACT is True


def test_N_identities_count():
    """At least 35 Langlands Cathedral identities registered."""
    from urt.langlands_cathedral import N_LANGLANDS_IDENTITIES
    assert N_LANGLANDS_IDENTITIES >= 35


# ── Summary functions ─────────────────────────────────────────────────────────

def test_langlands_summary_returns_dict():
    from urt.langlands_cathedral import langlands_summary
    s = langlands_summary()
    assert isinstance(s, dict)


def test_langlands_summary_all_exact():
    from urt.langlands_cathedral import langlands_summary
    s = langlands_summary()
    assert s["all_exact"] is True


def test_langlands_summary_key_values():
    """Summary contains correct cathedral values."""
    from urt.langlands_cathedral import langlands_summary
    from urt.shell_closure import D, N, V, F, q
    s = langlands_summary()
    assert s["GL_rank_classical"] == D - 1
    assert s["Ramanujan_weight"] == V
    assert s["K3_h11"] == F
    assert s["N_Niemeier"] == 2 * V
    assert s["Hodge_Tate_sum"] == 2 * D + q
    assert s["j_invariant_i"] == V**3


def test_langlands_summary_N_identities():
    from urt.langlands_cathedral import langlands_summary, N_LANGLANDS_IDENTITIES
    s = langlands_summary()
    assert s["N_identities"] == N_LANGLANDS_IDENTITIES


def test_print_langlands_report_runs(capsys):
    from urt.langlands_cathedral import print_langlands_report
    print_langlands_report()
    captured = capsys.readouterr()
    assert "LANGLANDS" in captured.out
    assert "CATHEDRAL" in captured.out
    assert "exact" in captured.out.lower()
