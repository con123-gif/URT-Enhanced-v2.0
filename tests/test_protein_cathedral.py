"""Tests for urt/protein_cathedral.py — Protein Cathedral module."""

import pytest
from math import pi, sqrt, isfinite
from urt.protein_cathedral import (
    capsid_geometry, helix_prediction, c60_buckyball, drug_binding,
    protein_summary, print_protein_report,
    T_CAPSID, C60_SYMMETRY_ORDER, C60_ATOMS, C60_BONDS, C60_PENTAGONS, C60_HEXAGONS,
    C60_FACES_TOTAL, HELIX_RESIDUES_PER_TURN, HELIX_PITCH_ANGLE_DEG,
    HELIX_RISE_PER_RESIDUE_ANG, PHYLLOTAXIS_ANGLE_DEG, ALPHA_HELIX_PHI_PRED,
    ALPHA_HELIX_PHI_OBS, N_BINDING_SITES_ICOS, N_SUBUNITS_T13,
    FIBONACCI_SEQUENCE, DEBYE_HUCKEL_PRED_ANG,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E


# ══════════════════════════════════════════════════════════════════════════════
#  MODULE-LEVEL CONSTANT TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestProteinConstants:
    def test_T_capsid_equals_N(self):
        assert T_CAPSID == N   # T=13 = N

    def test_c60_symmetry_order(self):
        assert C60_SYMMETRY_ORDER == 2 * G   # = 120

    def test_c60_atoms_equals_G(self):
        assert C60_ATOMS == G   # = 60

    def test_c60_atoms_value(self):
        assert C60_ATOMS == 60

    def test_c60_pentagons_equals_V(self):
        assert C60_PENTAGONS == V   # = 12

    def test_c60_hexagons_equals_F(self):
        assert C60_HEXAGONS == F   # = 20

    def test_c60_faces_total(self):
        assert C60_FACES_TOTAL == V + F   # = 32

    def test_euler_characteristic(self):
        # V - E + F = 2 for C60 (V=60 atoms, E=90 bonds, F=32 faces)
        assert C60_ATOMS - C60_BONDS + C60_FACES_TOTAL == 2

    def test_helix_pitch_formula(self):
        expected = 180.0 * DELTA_STAR
        assert abs(HELIX_PITCH_ANGLE_DEG - expected) < 1e-12

    def test_helix_pitch_within_5_pct_of_obs(self):
        obs = 26.0
        err_pct = abs(HELIX_PITCH_ANGLE_DEG - obs) / obs * 100.0
        assert err_pct < 5.0   # within 5% of observed 26°

    def test_phyllotaxis_angle_formula(self):
        expected = 360.0 / phi ** 2
        assert abs(PHYLLOTAXIS_ANGLE_DEG - expected) < 1e-12

    def test_phyllotaxis_angle_value(self):
        assert 137.0 < PHYLLOTAXIS_ANGLE_DEG < 138.5   # golden angle ≈ 137.508°

    def test_ramachandran_phi_pred_formula(self):
        expected = -360.0 * DELTA_STAR
        assert abs(ALPHA_HELIX_PHI_PRED - expected) < 1e-12

    def test_ramachandran_phi_obs(self):
        assert abs(ALPHA_HELIX_PHI_OBS - (-57.0)) < 1e-10

    def test_n_binding_sites_equals_G(self):
        assert N_BINDING_SITES_ICOS == G   # = 60

    def test_subunits_T13(self):
        assert N_SUBUNITS_T13 == 60 * N   # = 780

    def test_fibonacci_contains_N(self):
        assert N in FIBONACCI_SEQUENCE   # 13 is a Fibonacci number!

    def test_c60_bonds_value(self):
        assert C60_BONDS == 90   # 3-regular: 60×3/2


# ══════════════════════════════════════════════════════════════════════════════
#  CAPSID GEOMETRY TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestCapsidGeometry:
    def setup_method(self):
        self.c = capsid_geometry(13)

    def test_T_value(self):
        assert self.c["T"] == 13

    def test_T_equals_N_flag(self):
        assert self.c["T_equals_N"] is True

    def test_n_subunits(self):
        assert self.c["n_subunits"] == 60 * 13   # = 780

    def test_n_pentamers_always_12(self):
        assert self.c["n_pentamers"] == 12

    def test_n_hexamers(self):
        expected = 10 * (13 - 1)   # = 120
        assert self.c["n_hexamers"] == expected

    def test_T_check_formula(self):
        # h=3, k=1 → h²+hk+k² = 9+3+1=13
        assert self.c["T_check"] == 13

    def test_h_ck(self):
        assert self.c["h_CK"] == 3

    def test_k_ck(self):
        assert self.c["k_CK"] == 1

    def test_capsid_radius_positive(self):
        assert self.c["r_capsid_nm"] > 0

    def test_area_positive(self):
        assert self.c["area_nm2"] > 0

    def test_T_not_N_flag(self):
        c1 = capsid_geometry(1)
        assert c1["T_equals_N"] is False


# ══════════════════════════════════════════════════════════════════════════════
#  HELIX PREDICTION TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestHelixPrediction:
    def setup_method(self):
        self.h = helix_prediction()

    def test_pitch_pred_formula(self):
        assert abs(self.h["pitch_angle_deg_pred"] - 180.0 * DELTA_STAR) < 1e-12

    def test_pitch_error_pct_small(self):
        assert self.h["pitch_angle_error_pct"] < 10.0  # within 10%

    def test_phi_ramachandran_formula(self):
        assert abs(self.h["phi_Ramachandran_pred"] - (-360.0 * DELTA_STAR)) < 1e-12

    def test_rise_pred_formula(self):
        assert abs(self.h["rise_per_residue_ang_pred"] - 10.0 * DELTA_STAR) < 1e-12

    def test_rise_error_small(self):
        assert self.h["rise_error_pct"] < 5.0   # within 5%

    def test_phyllotaxis_angle_in_helix(self):
        assert abs(self.h["phyllotaxis_angle_deg"] - 360.0 / phi ** 2) < 1e-12

    def test_helix_pitch_nm(self):
        expected = 3.6 * 1.5 * 0.1   # = 0.54 nm = 5.4 Å
        assert abs(self.h["helix_pitch_nm"] - expected) < 1e-12


# ══════════════════════════════════════════════════════════════════════════════
#  C60 BUCKYBALL TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestC60Buckyball:
    def setup_method(self):
        self.b = c60_buckyball()

    def test_atoms_formula(self):
        assert self.b["atoms"] == G

    def test_hexagons_formula(self):
        assert self.b["hexagons"] == F

    def test_pentagons_formula(self):
        assert self.b["pentagons"] == V

    def test_symmetry_order(self):
        assert self.b["symmetry_order"] == 2 * G

    def test_euler_in_dict(self):
        assert self.b["euler_characteristic"] == 2

    def test_LUMO_degeneracy_equals_D(self):
        assert self.b["LUMO_degeneracy"] == D

    def test_Hg_phonon_dim_equals_q(self):
        assert self.b["Hg_phonon_degeneracy"] == q

    def test_Tc_K3C60_pred_formula(self):
        expected = N * gamma * 100.0
        assert abs(self.b["Tc_K3C60_pred_K"] - expected) < 1e-10

    def test_Tc_error_reasonable(self):
        assert self.b["Tc_error_pct"] < 20.0   # within 20%

    def test_Tc_obs_correct(self):
        assert abs(self.b["Tc_K3C60_obs_K"] - 18.0) < 0.1


# ══════════════════════════════════════════════════════════════════════════════
#  DRUG BINDING TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestDrugBinding:
    def setup_method(self):
        self.d = drug_binding(R_capsid=15.0)

    def test_n_binding_sites(self):
        assert self.d["n_binding_sites"] == G

    def test_n_pentameric(self):
        assert self.d["n_pentameric_sites"] == V   # = 12

    def test_area_formula(self):
        import math
        expected = 4.0 * math.pi * 15.0 ** 2
        assert abs(self.d["area_nm2"] - expected) < 1e-10

    def test_area_per_site(self):
        expected = self.d["area_nm2"] / G
        assert abs(self.d["area_per_site_nm2"] - expected) < 1e-10

    def test_canyon_depth_formula(self):
        expected = DELTA_STAR * 15.0
        assert abs(self.d["canyon_depth_nm"] - expected) < 1e-12

    def test_different_radius(self):
        d2 = drug_binding(R_capsid=30.0)
        assert d2["area_per_site_nm2"] > self.d["area_per_site_nm2"]


# ══════════════════════════════════════════════════════════════════════════════
#  SUMMARY AND PRINT TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestProteinSummary:
    def test_summary_has_all_keys(self):
        s = protein_summary()
        for key in ["capsid_T13", "helix_prediction", "c60_buckyball",
                    "drug_binding", "T_CAPSID", "C60_ATOMS"]:
            assert key in s

    def test_T_capsid_in_summary(self):
        s = protein_summary()
        assert s["T_CAPSID"] == N

    def test_print_runs(self, capsys):
        print_protein_report()
        captured = capsys.readouterr()
        assert "PROTEIN CATHEDRAL" in captured.out
        assert "T=13" in captured.out or "T = 13" in captured.out or "780" in captured.out
