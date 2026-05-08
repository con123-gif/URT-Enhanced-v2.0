"""
Tests for urt/braid_cathedral.py  (v2.9.28)
~50 tests covering every identity, helper functions, summary, and report.
"""

import pytest
from math import factorial, comb
from urt.shell_closure import N, D, V, E, F, q, G, phi
from urt import braid_cathedral as bc


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

class TestCatalanHelper:
    """Tests for the catalan() utility function."""

    def test_catalan_0(self):
        assert bc.catalan(0) == 1

    def test_catalan_1(self):
        assert bc.catalan(1) == 1

    def test_catalan_2(self):
        assert bc.catalan(2) == 2

    def test_catalan_D_equals_q(self):
        # C_3 = 5 = q
        assert bc.catalan(D) == q

    def test_catalan_D1_equals_N_plus1(self):
        # C_4 = 14 = N+1
        assert bc.catalan(D + 1) == N + 1

    def test_catalan_5(self):
        assert bc.catalan(5) == 42

    def test_catalan_6(self):
        assert bc.catalan(6) == 132

    def test_catalan_returns_int(self):
        assert isinstance(bc.catalan(3), int)


# ---------------------------------------------------------------------------
# Section 1: Braid group basics
# ---------------------------------------------------------------------------

class TestBraidGroupBasics:
    def test_BD_generators_value(self):
        assert bc.B_D_GENERATORS == 2

    def test_BD_generators_is_D_minus_1(self):
        assert bc.B_D_GENERATORS == D - 1

    def test_Bq_generators_value(self):
        assert bc.B_q_GENERATORS == 4

    def test_Bq_generators_is_D_plus_1(self):
        assert bc.B_q_GENERATORS == D + 1

    def test_BN_generators_value(self):
        assert bc.B_N_GENERATORS == 12

    def test_BN_generators_equals_V(self):
        assert bc.B_N_GENERATORS == V

    def test_PB_D_index_value(self):
        assert bc.PB_D_INDEX == 6

    def test_PB_D_index_is_factorial_D(self):
        assert bc.PB_D_INDEX == factorial(D)

    def test_BD_center_power_is_D(self):
        assert bc.BD_CENTER_POWER == D

    def test_BD_center_power_value(self):
        assert bc.BD_CENTER_POWER == 3

    def test_identity_BD_generators(self):
        assert bc.IDENTITY_BD_GENERATORS

    def test_identity_Bq_generators(self):
        assert bc.IDENTITY_Bq_GENERATORS

    def test_identity_BN_generators(self):
        assert bc.IDENTITY_BN_GENERATORS

    def test_identity_PBD_index(self):
        assert bc.IDENTITY_PBD_INDEX

    def test_identity_BD_center(self):
        assert bc.IDENTITY_BD_CENTER


# ---------------------------------------------------------------------------
# Section 2: Hecke algebras
# ---------------------------------------------------------------------------

class TestHeckeAlgebra:
    def test_hecke_q_is_cathedral_q(self):
        assert bc.HECKE_Q_CATHEDRAL == q

    def test_H_D_dim_value(self):
        assert bc.H_D_DIM == 6

    def test_H_D_dim_is_factorial_D(self):
        assert bc.H_D_DIM == factorial(D)

    def test_H_q_dim_value(self):
        assert bc.H_q_DIM == 120

    def test_H_q_dim_is_2G(self):
        assert bc.H_q_DIM == 2 * G

    def test_H_N_rank_is_N(self):
        assert bc.H_N_DIM_LOG == N

    def test_KL_cells_D_value(self):
        assert bc.KL_CELLS_D == 3

    def test_KL_cells_D_self_referential(self):
        assert bc.KL_CELLS_D == D

    def test_identity_hecke_q(self):
        assert bc.IDENTITY_HECKE_Q

    def test_identity_H_D_dim(self):
        assert bc.IDENTITY_H_D_DIM

    def test_identity_H_q_dim(self):
        assert bc.IDENTITY_H_q_DIM


# ---------------------------------------------------------------------------
# Section 3: Temperley-Lieb algebra
# ---------------------------------------------------------------------------

class TestTemperleyLieb:
    def test_C_D_catalan_value(self):
        assert bc.C_D_CATALAN == 5

    def test_C_D_catalan_equals_q(self):
        assert bc.C_D_CATALAN == q

    def test_C_D1_catalan_value(self):
        assert bc.C_D1_CATALAN == 14

    def test_C_D1_catalan_equals_N_plus1(self):
        assert bc.C_D1_CATALAN == N + 1

    def test_TL_D_dim_equals_q(self):
        assert bc.TL_D_DIM == q

    def test_TL_delta_is_phi(self):
        assert abs(bc.TL_DELTA_ICOS - phi) < 1e-12

    def test_TL_delta_golden_ratio(self):
        assert abs(bc.TL_DELTA_ICOS - (1 + 5 ** 0.5) / 2) < 1e-10

    def test_jones_index_phi_squared(self):
        assert abs(bc.JONES_INDEX_PHI - phi ** 2) < 1e-12

    def test_jones_index_phi_plus_1(self):
        # φ² = φ+1
        assert abs(bc.JONES_INDEX_PHI - (phi + 1)) < 1e-10

    def test_identity_C_D_is_q(self):
        assert bc.IDENTITY_C_D_IS_q

    def test_identity_C_D1_is_N1(self):
        assert bc.IDENTITY_C_D1_IS_N1

    def test_identity_TL_D_dim(self):
        assert bc.IDENTITY_TL_D_DIM

    def test_identity_TL_delta(self):
        assert bc.IDENTITY_TL_DELTA

    def test_identity_jones_index(self):
        assert bc.IDENTITY_JONES_INDEX


# ---------------------------------------------------------------------------
# Section 4: Jones polynomial
# ---------------------------------------------------------------------------

class TestJonesPolynomial:
    def test_trefoil_jones_terms_value(self):
        assert bc.TREFOIL_JONES_TERMS == 3

    def test_trefoil_jones_terms_is_D(self):
        assert bc.TREFOIL_JONES_TERMS == D

    def test_torus_T2q_crossings_value(self):
        assert bc.TORUS_T2q_CROSSINGS == 4

    def test_torus_T2q_crossings_is_D_plus_1(self):
        assert bc.TORUS_T2q_CROSSINGS == D + 1

    def test_trefoil_alex_degree_value(self):
        assert bc.TREFOIL_ALEX_DEGREE == 2

    def test_trefoil_alex_degree_is_D_minus_1(self):
        assert bc.TREFOIL_ALEX_DEGREE == D - 1

    def test_identity_trefoil_terms(self):
        assert bc.IDENTITY_TREFOIL_TERMS

    def test_identity_torus_crossings(self):
        assert bc.IDENTITY_TORUS_CROSSINGS

    def test_identity_trefoil_alex(self):
        assert bc.IDENTITY_TREFOIL_ALEX


# ---------------------------------------------------------------------------
# Section 5: Mapping class groups
# ---------------------------------------------------------------------------

class TestMappingClassGroup:
    def test_MCG_dim_D_value(self):
        assert bc.MCG_DIM_D == 12

    def test_MCG_dim_D_equals_V(self):
        assert bc.MCG_DIM_D == V

    def test_MCG_Humphries_D_value(self):
        assert bc.MCG_HUMPHRIES_D == 7

    def test_MCG_Humphries_D_equals_factorial_D_plus1(self):
        assert bc.MCG_HUMPHRIES_D == factorial(D) + 1

    def test_MCG_dim_D1_value(self):
        assert bc.MCG_DIM_D1 == 18

    def test_MCG_dim_D1_equals_factorial_D_times_D(self):
        assert bc.MCG_DIM_D1 == factorial(D) * D

    def test_MCG_Lickorish_D_value(self):
        assert bc.MCG_LICKORISH_D == 8

    def test_MCG_Lickorish_D_equals_2_pow_D(self):
        assert bc.MCG_LICKORISH_D == 2 ** D

    def test_identity_MCG_dim(self):
        assert bc.IDENTITY_MCG_DIM

    def test_identity_MCG_Humphries(self):
        assert bc.IDENTITY_MCG_HUMPHRIES

    def test_identity_MCG_dim_D1(self):
        assert bc.IDENTITY_MCG_DIM_D1

    def test_identity_MCG_Lickorish(self):
        assert bc.IDENTITY_MCG_LICKORISH


# ---------------------------------------------------------------------------
# Section 6: Garside theory
# ---------------------------------------------------------------------------

class TestGarsideTheory:
    def test_Garside_BD_crossings_value(self):
        assert bc.GARSIDE_BD_CROSSINGS == 3

    def test_Garside_BD_crossings_equals_D(self):
        assert bc.GARSIDE_BD_CROSSINGS == D

    def test_Cayley_SD_vertices_value(self):
        assert bc.CAYLEY_SD_VERTICES == 6

    def test_Cayley_SD_vertices_equals_V_half(self):
        assert bc.CAYLEY_SD_VERTICES == V // 2

    def test_Coxeter_SD_length_value(self):
        assert bc.COXETER_SD_LENGTH == 3

    def test_Coxeter_SD_length_equals_D(self):
        assert bc.COXETER_SD_LENGTH == D

    def test_identity_Garside_BD(self):
        assert bc.IDENTITY_GARSIDE_BD

    def test_identity_Cayley_SD(self):
        assert bc.IDENTITY_CAYLEY_SD

    def test_identity_Coxeter_SD(self):
        assert bc.IDENTITY_COXETER_SD


# ---------------------------------------------------------------------------
# Section 7: Burau / Lawrence-Krammer
# ---------------------------------------------------------------------------

class TestBurauLK:
    def test_Burau_BD_dim_value(self):
        assert bc.BURAU_BD_DIM == 2

    def test_Burau_BD_dim_is_D_minus_1(self):
        assert bc.BURAU_BD_DIM == D - 1

    def test_Burau_BN_dim_value(self):
        assert bc.BURAU_BN_DIM == 12

    def test_Burau_BN_dim_equals_V(self):
        assert bc.BURAU_BN_DIM == V

    def test_Burau_BN_dim_equals_N_minus_1(self):
        assert bc.BURAU_BN_DIM == N - 1

    def test_LK_BD_dim_value(self):
        assert bc.LK_BD_DIM == 3

    def test_LK_BD_dim_equals_D(self):
        assert bc.LK_BD_DIM == D

    def test_LK_Bq_dim_value(self):
        assert bc.LK_Bq_DIM == 10

    def test_identity_Burau_BD(self):
        assert bc.IDENTITY_BURAU_BD_DIM

    def test_identity_Burau_BN(self):
        assert bc.IDENTITY_BURAU_BN_DIM

    def test_identity_LK_BD(self):
        assert bc.IDENTITY_LK_BD_DIM

    def test_identity_LK_Bq(self):
        assert bc.IDENTITY_LK_Bq_DIM


# ---------------------------------------------------------------------------
# Section 8: Skein relations
# ---------------------------------------------------------------------------

class TestSkeinRelations:
    def test_skein_CS_level_is_D(self):
        assert bc.SKEIN_CS_LEVEL == D

    def test_skein_CS_level_value(self):
        assert bc.SKEIN_CS_LEVEL == 3

    def test_Kauffman_loop_value(self):
        assert bc.KAUFFMAN_LOOP_EULER == -1

    def test_Kauffman_loop_is_minus_D_minus_2(self):
        assert bc.KAUFFMAN_LOOP_EULER == -(D - 2)

    def test_jones_icos_q_is_q(self):
        assert bc.JONES_ICOS_Q == q

    def test_jones_icos_q_value(self):
        assert bc.JONES_ICOS_Q == 5

    def test_identity_skein_CS_level(self):
        assert bc.IDENTITY_SKEIN_CS_LEVEL

    def test_identity_Kauffman_Euler(self):
        assert bc.IDENTITY_KAUFFMAN_EULER

    def test_identity_Jones_icos(self):
        assert bc.IDENTITY_JONES_ICOS


# ---------------------------------------------------------------------------
# Section 9: Global identity list
# ---------------------------------------------------------------------------

class TestAllIdentities:
    def test_all_braid_exact(self):
        assert bc.ALL_BRAID_EXACT

    def test_all_identities_are_true(self):
        assert all(bc.ALL_BRAID_IDENTITIES)

    def test_N_braid_identities_count(self):
        assert bc.N_BRAID_IDENTITIES == 32

    def test_all_identities_list_length(self):
        assert len(bc.ALL_BRAID_IDENTITIES) == bc.N_BRAID_IDENTITIES

    def test_no_false_identities(self):
        false_ids = [i for i, v in enumerate(bc.ALL_BRAID_IDENTITIES) if not v]
        assert false_ids == [], f"Failed identity indices: {false_ids}"


# ---------------------------------------------------------------------------
# Summary and report
# ---------------------------------------------------------------------------

class TestSummaryAndReport:
    def setup_method(self):
        self.s = bc.braid_summary()

    def test_summary_returns_dict(self):
        assert isinstance(self.s, dict)

    def test_summary_all_exact_key(self):
        assert self.s["all_exact"] is True

    def test_summary_N_identities(self):
        assert self.s["N_identities"] == bc.N_BRAID_IDENTITIES

    def test_summary_C_D_catalan(self):
        assert self.s["C_D_catalan"] == q

    def test_summary_C_D1_catalan(self):
        assert self.s["C_D1_catalan"] == N + 1

    def test_summary_H_q_dim(self):
        assert self.s["H_q_dim"] == 2 * G

    def test_summary_MCG_dim_D(self):
        assert self.s["MCG_dim_D"] == V

    def test_summary_MCG_Lickorish(self):
        assert self.s["MCG_Lickorish_D"] == 2 ** D

    def test_summary_Burau_BN_dim(self):
        assert self.s["Burau_BN_dim"] == V

    def test_summary_jones_index_phi(self):
        assert abs(self.s["jones_index_phi"] - (phi + 1)) < 1e-10

    def test_summary_TL_delta_icos(self):
        assert abs(self.s["TL_delta_icos"] - phi) < 1e-12

    def test_print_braid_report_runs(self, capsys):
        bc.print_braid_report()
        captured = capsys.readouterr()
        assert "BRAID CATHEDRAL" in captured.out
        assert "ALL EXACT" in captured.out

    def test_print_braid_report_shows_identities_count(self, capsys):
        bc.print_braid_report()
        captured = capsys.readouterr()
        assert str(bc.N_BRAID_IDENTITIES) in captured.out

    def test_print_braid_report_shows_cathedral_integers(self, capsys):
        bc.print_braid_report()
        captured = capsys.readouterr()
        assert "D=3" in captured.out
        assert "N=13" in captured.out
        assert "V=12" in captured.out
        assert "q=5" in captured.out
        assert "G=60" in captured.out
