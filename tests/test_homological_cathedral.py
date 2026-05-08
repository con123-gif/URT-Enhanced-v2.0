"""
Tests for urt/homological_cathedral.py
Homological algebra, derived categories, characteristic classes, algebraic topology.
Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

Arithmetic checks:
  V/4 = 12/4 = 3 = D   ✓
  4D  = 12   = V        ✓
  2D-1= 5    = q        ✓
  |Im J| π_3^s = 24 = 2V = 2×12  ✓
  |Im J| π_7^s = 240 = 4G = 4×60 = E₈ roots  ✓
"""

import pytest
from math import factorial


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    """All public names import without error."""
    from urt.homological_cathedral import (
        # Section 1 — Ext / Tor
        POLY_RING_GLDIM, POLY_RING_GLDIM_q, PD_ZmodN,
        IDENTITY_POLY_GLDIM, IDENTITY_POLY_GLDIM_q, IDENTITY_PD_ZN,
        # Section 2 — Spectral sequences
        SERRE_SS_PAGE, ADAMS_FIRST_D, CHROMATIC_TMF_HEIGHT,
        IDENTITY_SERRE_SS, IDENTITY_ADAMS_D, IDENTITY_CHROMATIC,
        # Section 3 — Characteristic classes
        SW_OBSTRUCTION_INDEX, CHERN_TOP_DEGREE,
        N_PONTRYAGIN, HIRZEBRUCH_K, SIGNATURE_DIM,
        IDENTITY_SW, IDENTITY_CHERN, IDENTITY_PONTRYAGIN, IDENTITY_SIGNATURE,
        # Section 4 — K-theory
        BOTT_PERIOD, K_S2n_RANK, KO_PERIOD, J_IMAGE_DEGREE, K0_MD_RANK,
        IDENTITY_BOTT, IDENTITY_K_S2n, IDENTITY_KO, IDENTITY_J_IMAGE, IDENTITY_K0_MD,
        # Section 5 — Homology
        H_RPD_GROUPS, H_CPD_GROUPS, CP_NIL_INDEX, H1_SOD, STEENROD_FIRST,
        IDENTITY_H_RPD, IDENTITY_H_CPD, IDENTITY_CP_NIL, IDENTITY_H1_SOD,
        IDENTITY_STEENROD,
        # Section 6 — Derived categories
        DERIVED_COLL_LENS, DERIVED_P1_LENS, BONDAL_BRAID_GENS, FUKAYA_GRADING,
        IDENTITY_DERIVED_COLL, IDENTITY_DERIVED_P1, IDENTITY_BONDAL_BRAID,
        IDENTITY_FUKAYA,
        # Section 7 — Stable homotopy
        STABLE_FIRST_STEM, EHP_K, EHP_2K_MINUS_1,
        J_IMAGE_PI3_ORDER, J_IMAGE_PI7_ORDER,
        IDENTITY_STABLE_FIRST, IDENTITY_EHP, IDENTITY_J_PI3, IDENTITY_J_PI7,
        # Section 8 — Euler characteristics
        CHI_SD, CHI_RPD, CHI_CPD, MODULAR_X_D_GENUS, GAUSS_BONNET_DIM,
        IDENTITY_CHI_SD, IDENTITY_CHI_RPD, IDENTITY_CHI_CPD,
        IDENTITY_XD_GENUS, IDENTITY_GAUSS_BONNET,
        # Section 9 — Meta
        ALL_HOMO_IDENTITIES, ALL_HOMO_EXACT, N_HOMO_IDENTITIES,
        GAMMA_INV,
        # Functions
        homological_summary, print_homological_report,
    )


def test_gamma_inv():
    """GAMMA_INV = 81 = 1/γ."""
    from urt.homological_cathedral import GAMMA_INV
    assert GAMMA_INV == 81


# ── Section 1: Ext and Tor ────────────────────────────────────────────────────

def test_poly_gldim_D():
    """gldim k[x_1,...,x_D] = D = 3 (Hilbert syzygy theorem)."""
    from urt.homological_cathedral import POLY_RING_GLDIM, IDENTITY_POLY_GLDIM
    from urt.shell_closure import D
    assert POLY_RING_GLDIM == D
    assert POLY_RING_GLDIM == 3
    assert IDENTITY_POLY_GLDIM is True


def test_poly_gldim_q():
    """gldim k[x_1,...,x_q] = q = 5."""
    from urt.homological_cathedral import POLY_RING_GLDIM_q, IDENTITY_POLY_GLDIM_q
    from urt.shell_closure import q
    assert POLY_RING_GLDIM_q == q
    assert POLY_RING_GLDIM_q == 5
    assert IDENTITY_POLY_GLDIM_q is True


def test_pd_ZmodN():
    """pd_Z(Z/13) = 1 = D-2."""
    from urt.homological_cathedral import PD_ZmodN, IDENTITY_PD_ZN
    from urt.shell_closure import D
    assert PD_ZmodN == D - 2
    assert PD_ZmodN == 1
    assert IDENTITY_PD_ZN is True


# ── Section 2: Spectral sequences ─────────────────────────────────────────────

def test_serre_ss_page():
    """Serre SS collapses at E_D = E_3 page for S^D fibration."""
    from urt.homological_cathedral import SERRE_SS_PAGE, IDENTITY_SERRE_SS
    from urt.shell_closure import D
    assert SERRE_SS_PAGE == D
    assert SERRE_SS_PAGE == 3
    assert IDENTITY_SERRE_SS is True


def test_adams_first_d():
    """Adams SS first differential d_{D-1} = d_2."""
    from urt.homological_cathedral import ADAMS_FIRST_D, IDENTITY_ADAMS_D
    from urt.shell_closure import D
    assert ADAMS_FIRST_D == D - 1
    assert ADAMS_FIRST_D == 2
    assert IDENTITY_ADAMS_D is True


def test_chromatic_tmf_height():
    """Chromatic height for TMF: n = D-1 = 2."""
    from urt.homological_cathedral import CHROMATIC_TMF_HEIGHT, IDENTITY_CHROMATIC
    from urt.shell_closure import D
    assert CHROMATIC_TMF_HEIGHT == D - 1
    assert CHROMATIC_TMF_HEIGHT == 2
    assert IDENTITY_CHROMATIC is True


# ── Section 3: Characteristic classes ─────────────────────────────────────────

def test_sw_obstruction_index():
    """Stiefel-Whitney obstruction index = D = 3."""
    from urt.homological_cathedral import SW_OBSTRUCTION_INDEX, IDENTITY_SW
    from urt.shell_closure import D
    assert SW_OBSTRUCTION_INDEX == D
    assert SW_OBSTRUCTION_INDEX == 3
    assert IDENTITY_SW is True


def test_chern_top_degree():
    """Top Chern class c_D for complex D-fold."""
    from urt.homological_cathedral import CHERN_TOP_DEGREE, IDENTITY_CHERN
    from urt.shell_closure import D
    assert CHERN_TOP_DEGREE == D
    assert CHERN_TOP_DEGREE == 3
    assert IDENTITY_CHERN is True


def test_n_pontryagin_eq_D():
    """Number of Pontryagin classes for dim-V=12 manifold: V/4 = 3 = D."""
    from urt.homological_cathedral import N_PONTRYAGIN, IDENTITY_PONTRYAGIN
    from urt.shell_closure import D, V
    # Arithmetic: V/4 = 12/4 = 3 = D
    assert V // 4 == D
    assert N_PONTRYAGIN == D
    assert N_PONTRYAGIN == 3
    assert IDENTITY_PONTRYAGIN is True


def test_signature_dim_eq_V():
    """4k-manifold with k=D=3: 4D = 12 = V."""
    from urt.homological_cathedral import SIGNATURE_DIM, HIRZEBRUCH_K, IDENTITY_SIGNATURE
    from urt.shell_closure import D, V
    # Arithmetic: 4×D = 4×3 = 12 = V
    assert 4 * D == V
    assert HIRZEBRUCH_K == D
    assert SIGNATURE_DIM == V
    assert SIGNATURE_DIM == 12
    assert IDENTITY_SIGNATURE is True


# ── Section 4: K-theory ───────────────────────────────────────────────────────

def test_bott_period():
    """Bott periodicity: period = D-1 = 2."""
    from urt.homological_cathedral import BOTT_PERIOD, IDENTITY_BOTT
    from urt.shell_closure import D
    assert BOTT_PERIOD == D - 1
    assert BOTT_PERIOD == 2
    assert IDENTITY_BOTT is True


def test_k_s2n_rank():
    """rank K(S^{2n}) = D-1 = 2."""
    from urt.homological_cathedral import K_S2n_RANK, IDENTITY_K_S2n
    from urt.shell_closure import D
    assert K_S2n_RANK == D - 1
    assert K_S2n_RANK == 2
    assert IDENTITY_K_S2n is True


def test_ko_period():
    """KO real K-theory period = 2^D = 8."""
    from urt.homological_cathedral import KO_PERIOD, IDENTITY_KO
    from urt.shell_closure import D
    assert KO_PERIOD == 2**D
    assert KO_PERIOD == 8
    assert IDENTITY_KO is True


def test_j_image_degree():
    """J-homomorphism image largest at degree D = 3."""
    from urt.homological_cathedral import J_IMAGE_DEGREE, IDENTITY_J_IMAGE
    from urt.shell_closure import D
    assert J_IMAGE_DEGREE == D
    assert J_IMAGE_DEGREE == 3
    assert IDENTITY_J_IMAGE is True


def test_k0_md_rank():
    """K_0(M_D) rank = D-2 = 1."""
    from urt.homological_cathedral import K0_MD_RANK, IDENTITY_K0_MD
    from urt.shell_closure import D
    assert K0_MD_RANK == D - 2
    assert K0_MD_RANK == 1
    assert IDENTITY_K0_MD is True


# ── Section 5: Homology of key spaces ─────────────────────────────────────────

def test_h_rpd_groups():
    """#H_k(RP^D; Z/2) nonzero groups = D+1 = 4."""
    from urt.homological_cathedral import H_RPD_GROUPS, IDENTITY_H_RPD
    from urt.shell_closure import D
    assert H_RPD_GROUPS == D + 1
    assert H_RPD_GROUPS == 4
    assert IDENTITY_H_RPD is True


def test_h_cpd_groups():
    """#H_k(CP^D; Z) nonzero groups = D+1 = 4."""
    from urt.homological_cathedral import H_CPD_GROUPS, IDENTITY_H_CPD
    from urt.shell_closure import D
    assert H_CPD_GROUPS == D + 1
    assert H_CPD_GROUPS == 4
    assert IDENTITY_H_CPD is True


def test_cp_nil_index():
    """Nilpotency index H*(CP^D) = D+1 = 4."""
    from urt.homological_cathedral import CP_NIL_INDEX, IDENTITY_CP_NIL
    from urt.shell_closure import D
    assert CP_NIL_INDEX == D + 1
    assert CP_NIL_INDEX == 4
    assert IDENTITY_CP_NIL is True


def test_h1_sod():
    """H_1(SO(D)) = Z/2 = Z/(D-1) for D=3."""
    from urt.homological_cathedral import H1_SOD, IDENTITY_H1_SOD
    from urt.shell_closure import D
    assert H1_SOD == D - 1
    assert H1_SOD == 2
    assert IDENTITY_H1_SOD is True


def test_steenrod_first():
    """First non-trivial Steenrod: Sq^{D-1} = Sq^2."""
    from urt.homological_cathedral import STEENROD_FIRST, IDENTITY_STEENROD
    from urt.shell_closure import D
    assert STEENROD_FIRST == D - 1
    assert STEENROD_FIRST == 2
    assert IDENTITY_STEENROD is True


# ── Section 6: Derived categories ─────────────────────────────────────────────

def test_beilinson_exceptional_collection():
    """Beilinson exceptional collection on P^D: D+1 = 4 objects."""
    from urt.homological_cathedral import DERIVED_COLL_LENS, IDENTITY_DERIVED_COLL
    from urt.shell_closure import D
    assert DERIVED_COLL_LENS == D + 1
    assert DERIVED_COLL_LENS == 4
    assert IDENTITY_DERIVED_COLL is True


def test_derived_p1_collection():
    """Exceptional collection on P^1: D-1 = 2 objects."""
    from urt.homological_cathedral import DERIVED_P1_LENS, IDENTITY_DERIVED_P1
    from urt.shell_closure import D
    assert DERIVED_P1_LENS == D - 1
    assert DERIVED_P1_LENS == 2
    assert IDENTITY_DERIVED_P1 is True


def test_bondal_braid_generators():
    """Bondal-Kapranov: B_{D+1} braid group has D = 3 generators."""
    from urt.homological_cathedral import BONDAL_BRAID_GENS, IDENTITY_BONDAL_BRAID
    from urt.shell_closure import D
    assert BONDAL_BRAID_GENS == D
    assert BONDAL_BRAID_GENS == 3
    assert IDENTITY_BONDAL_BRAID is True


def test_fukaya_grading():
    """Fukaya category grading in Z/D = Z/3 for CY D-fold."""
    from urt.homological_cathedral import FUKAYA_GRADING, IDENTITY_FUKAYA
    from urt.shell_closure import D
    assert FUKAYA_GRADING == D
    assert FUKAYA_GRADING == 3
    assert IDENTITY_FUKAYA is True


# ── Section 7: Stable homotopy theory ─────────────────────────────────────────

def test_stable_first_stem():
    """First non-trivial stable stem = D-1 = 2."""
    from urt.homological_cathedral import STABLE_FIRST_STEM, IDENTITY_STABLE_FIRST
    from urt.shell_closure import D
    assert STABLE_FIRST_STEM == D - 1
    assert STABLE_FIRST_STEM == 2
    assert IDENTITY_STABLE_FIRST is True


def test_ehp_sequence():
    """EHP: for k=D=3, 2k-1 = 5 = q (S^q appears!) — Cathedral!"""
    from urt.homological_cathedral import EHP_K, EHP_2K_MINUS_1, IDENTITY_EHP
    from urt.shell_closure import D, q
    # Arithmetic: 2×D-1 = 2×3-1 = 5 = q
    assert 2 * D - 1 == q
    assert EHP_K == D
    assert EHP_K == 3
    assert EHP_2K_MINUS_1 == q
    assert EHP_2K_MINUS_1 == 5
    assert IDENTITY_EHP is True


def test_j_image_pi3():
    """|Im J| in π_3^s = 24 = 2V = 2×12."""
    from urt.homological_cathedral import J_IMAGE_PI3_ORDER, IDENTITY_J_PI3
    from urt.shell_closure import V
    # Arithmetic: 2×V = 2×12 = 24
    assert 2 * V == 24
    assert J_IMAGE_PI3_ORDER == 2 * V
    assert J_IMAGE_PI3_ORDER == 24
    assert IDENTITY_J_PI3 is True


def test_j_image_pi7():
    """|Im J| in π_7^s = 240 = 4G = 4×60 = E₈ root count."""
    from urt.homological_cathedral import J_IMAGE_PI7_ORDER, IDENTITY_J_PI7
    from urt.shell_closure import G
    # Arithmetic: 4×G = 4×60 = 240 = E₈ root count
    assert 4 * G == 240
    assert J_IMAGE_PI7_ORDER == 4 * G
    assert J_IMAGE_PI7_ORDER == 240
    assert IDENTITY_J_PI7 is True


# ── Section 8: Euler characteristics ──────────────────────────────────────────

def test_chi_sd():
    """χ(S^D) = 0 for D=3 (odd sphere has χ=0)."""
    from urt.homological_cathedral import CHI_SD, IDENTITY_CHI_SD
    from urt.shell_closure import D
    # Arithmetic: 1 + (-1)^3 = 1 - 1 = 0
    assert 1 + (-1)**D == 0
    assert CHI_SD == 0
    assert IDENTITY_CHI_SD is True


def test_chi_rpd():
    """χ(RP^D) = 0 for D=3 (D odd)."""
    from urt.homological_cathedral import CHI_RPD, IDENTITY_CHI_RPD
    from urt.shell_closure import D
    # Arithmetic: (1 + (-1)^3) // 2 = 0
    assert (1 + (-1)**D) // 2 == 0
    assert CHI_RPD == 0
    assert IDENTITY_CHI_RPD is True


def test_chi_cpd():
    """χ(CP^D) = D+1 = 4."""
    from urt.homological_cathedral import CHI_CPD, IDENTITY_CHI_CPD
    from urt.shell_closure import D
    assert CHI_CPD == D + 1
    assert CHI_CPD == 4
    assert IDENTITY_CHI_CPD is True


def test_modular_genus():
    """g(X(3)) = 0 (Γ(3) modular curve has genus zero)."""
    from urt.homological_cathedral import MODULAR_X_D_GENUS, IDENTITY_XD_GENUS
    assert MODULAR_X_D_GENUS == 0
    assert IDENTITY_XD_GENUS is True


def test_gauss_bonnet_dim():
    """Gauss-Bonnet applies in dim D+1 = 4."""
    from urt.homological_cathedral import GAUSS_BONNET_DIM, IDENTITY_GAUSS_BONNET
    from urt.shell_closure import D
    assert GAUSS_BONNET_DIM == D + 1
    assert GAUSS_BONNET_DIM == 4
    assert IDENTITY_GAUSS_BONNET is True


# ── Section 9: Meta — all identities ──────────────────────────────────────────

def test_all_homo_identities_list_length():
    """Identity list has the expected number of entries."""
    from urt.homological_cathedral import ALL_HOMO_IDENTITIES, N_HOMO_IDENTITIES
    assert len(ALL_HOMO_IDENTITIES) == N_HOMO_IDENTITIES
    assert N_HOMO_IDENTITIES == 33


def test_all_homo_exact():
    """ALL_HOMO_EXACT is True — every identity passes."""
    from urt.homological_cathedral import ALL_HOMO_EXACT
    assert ALL_HOMO_EXACT is True


def test_all_identities_are_true():
    """Every individual identity in ALL_HOMO_IDENTITIES is True."""
    from urt.homological_cathedral import ALL_HOMO_IDENTITIES
    for i, identity in enumerate(ALL_HOMO_IDENTITIES):
        assert identity is True, f"Identity index {i} failed"


def test_assert_in_module_passes():
    """The module-level assert does not raise on import."""
    import importlib
    import urt.homological_cathedral as hm
    # If we got here, the assert passed on first import
    assert hm.ALL_HOMO_EXACT is True


# ── Cross-checks: verify key arithmetic independently ─────────────────────────

def test_arithmetic_V_over_4_eq_D():
    """V/4 = 12/4 = 3 = D (independent arithmetic check)."""
    from urt.shell_closure import D, V
    assert V == 12
    assert D == 3
    assert V // 4 == D


def test_arithmetic_4D_eq_V():
    """4×D = 4×3 = 12 = V (independent arithmetic check)."""
    from urt.shell_closure import D, V
    assert 4 * D == V


def test_arithmetic_2D_minus_1_eq_q():
    """2D-1 = 2×3-1 = 5 = q (independent arithmetic check)."""
    from urt.shell_closure import D, q
    assert 2 * D - 1 == q


def test_arithmetic_2V_eq_24():
    """2V = 2×12 = 24 (Im J in π_3^s order)."""
    from urt.shell_closure import V
    assert 2 * V == 24


def test_arithmetic_4G_eq_240():
    """4G = 4×60 = 240 (Im J in π_7^s order = E₈ roots)."""
    from urt.shell_closure import G
    assert 4 * G == 240


def test_arithmetic_D_plus_1_eq_4():
    """D+1 = 3+1 = 4 (appears in CP^D, RP^D groups, Gauss-Bonnet dim)."""
    from urt.shell_closure import D
    assert D + 1 == 4


def test_arithmetic_D_minus_1_eq_2():
    """D-1 = 3-1 = 2 (Bott period, Adams d_2, chromatic height, ...)."""
    from urt.shell_closure import D
    assert D - 1 == 2


def test_arithmetic_D_minus_2_eq_1():
    """D-2 = 3-2 = 1 (pd_Z(Z/N), K_0(M_D) rank)."""
    from urt.shell_closure import D
    assert D - 2 == 1


def test_arithmetic_2_power_D_eq_8():
    """2^D = 2^3 = 8 (KO period)."""
    from urt.shell_closure import D
    assert 2**D == 8


# ── Function tests ────────────────────────────────────────────────────────────

def test_homological_summary_structure():
    """homological_summary() returns a dict with all expected keys."""
    from urt.homological_cathedral import homological_summary
    r = homological_summary()
    expected_keys = [
        "cathedral_integers", "ext_tor", "spectral_sequences",
        "characteristic_classes", "k_theory", "homology_spaces",
        "derived_categories", "stable_homotopy", "euler_characteristics",
        "meta", "key_results",
    ]
    for key in expected_keys:
        assert key in r, f"Missing key: {key}"


def test_homological_summary_cathedral_integers():
    """Summary contains correct Cathedral integers."""
    from urt.homological_cathedral import homological_summary
    r = homological_summary()
    ci = r["cathedral_integers"]
    assert ci["D"] == 3
    assert ci["N"] == 13
    assert ci["V"] == 12
    assert ci["E"] == 30
    assert ci["F"] == 20
    assert ci["q"] == 5
    assert ci["G"] == 60
    assert ci["GAMMA_INV"] == 81


def test_homological_summary_all_exact():
    """Summary reports all_exact = True."""
    from urt.homological_cathedral import homological_summary
    r = homological_summary()
    assert r["meta"]["all_exact"] is True
    assert r["meta"]["n_identities"] == 33


def test_homological_summary_key_results():
    """Summary key_results contains meaningful strings."""
    from urt.homological_cathedral import homological_summary
    r = homological_summary()
    results = r["key_results"]
    assert len(results) >= 12
    combined = " ".join(results)
    assert "EXACT" in combined
    assert "Cathedral" in combined or "V/4" in combined or "4×" in combined


def test_homological_summary_stable_homotopy():
    """Summary stable_homotopy section has correct EHP values."""
    from urt.homological_cathedral import homological_summary
    r = homological_summary()
    sh = r["stable_homotopy"]
    assert sh["ehp_k"] == 3
    assert sh["ehp_2k_minus_1"] == 5
    assert sh["ehp_eq_q"] is True
    assert sh["j_pi3_order"] == 24
    assert sh["j_pi7_order"] == 240
    assert sh["j_pi3_eq_2V"] is True
    assert sh["j_pi7_eq_4G"] is True


def test_homological_summary_characteristic_classes():
    """Summary characteristic classes section correct."""
    from urt.homological_cathedral import homological_summary
    r = homological_summary()
    cc = r["characteristic_classes"]
    assert cc["n_pontryagin"] == 3
    assert cc["pontryagin_eq_D"] is True
    assert cc["signature_dim"] == 12
    assert cc["signature_eq_V"] is True


def test_print_homological_report_output(capsys):
    """print_homological_report() produces substantive output with key phrases."""
    from urt.homological_cathedral import print_homological_report
    print_homological_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "Cathedral" in out
    assert "Bott" in out
    assert "Serre" in out
    assert "Pontryagin" in out
    assert "Beilinson" in out
    assert "EHP" in out
    assert "E₈" in out
    assert len(out) > 500
