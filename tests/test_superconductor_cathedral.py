"""Tests for urt/superconductor_cathedral.py — Superconductor Cathedral module."""

import pytest
from math import pi, sqrt, exp, log, isfinite
from urt.superconductor_cathedral import (
    bcs_parameters, c60_symmetry, icosahedral_phonon, k3c60_superconductor,
    superconductor_summary, print_superconductor_report,
    BCS_GAP_RATIO, BCS_GAP_RATIO_CATHEDRAL, G_CATHEDRAL, DELTA_BCS,
    TC_BCS_NORMALIZED, C60_GROUP_ORDER, C60_ATOMS, C60_HEXAGONS, C60_PENTAGONS,
    C60_BONDS, C60_LUMO_DIM, K3C60_FILLING, K3C60_ELECTRONS, PHONON_H_DIM,
    TC_K3C60_PRED_K, TC_K3C60_OBS_K, KAPPA_GL, XI_0_CATHEDRAL, LAMBDA_L_CATHEDRAL,
    ISOTOPE_EXPONENT, HUCKEL_BONDING_MOS, N_HG_MODES, N_AG_MODES,
    THETA_D_INTER_K, HC2_CATHEDRAL,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E


# ══════════════════════════════════════════════════════════════════════════════
#  MODULE-LEVEL CONSTANT TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestSuperconductorConstants:
    def test_bcs_gap_ratio_exact(self):
        assert abs(BCS_GAP_RATIO - 3.528) < 1e-10

    def test_g_cathedral_formula(self):
        expected = (D - 1) / (N - D)   # = 2/10 = 0.2
        assert abs(G_CATHEDRAL - expected) < 1e-14

    def test_g_cathedral_value(self):
        assert abs(G_CATHEDRAL - 0.2) < 1e-14

    def test_bcs_gap_ratio_cathedral_formula(self):
        expected = 3.0 * (1.0 + gamma / pi)
        assert abs(BCS_GAP_RATIO_CATHEDRAL - expected) < 1e-12

    def test_delta_bcs_formula(self):
        expected = exp(-1.0 / G_CATHEDRAL)   # = exp(-5)
        assert abs(DELTA_BCS - expected) < 1e-14

    def test_delta_bcs_value(self):
        # exp(-5) ≈ 0.006738
        assert 0.006 < DELTA_BCS < 0.007

    def test_c60_group_order(self):
        assert C60_GROUP_ORDER == 2 * G   # = 120

    def test_c60_atoms_equals_G(self):
        assert C60_ATOMS == G   # = 60

    def test_c60_hexagons_equals_F(self):
        assert C60_HEXAGONS == F   # = 20

    def test_c60_pentagons_equals_V(self):
        assert C60_PENTAGONS == V   # = 12

    def test_c60_bonds_value(self):
        assert C60_BONDS == 90   # 3-regular: 60×3/2

    def test_c60_lumo_equals_D(self):
        assert C60_LUMO_DIM == D   # = 3

    def test_k3c60_filling_half(self):
        assert abs(K3C60_FILLING - 0.5) < 1e-14   # exactly half-filling

    def test_k3c60_electrons_equals_D(self):
        assert K3C60_ELECTRONS == D   # = 3

    def test_phonon_h_dim_equals_q(self):
        assert PHONON_H_DIM == q   # = 5

    def test_Tc_pred_formula(self):
        expected = N * gamma * 100.0
        assert abs(TC_K3C60_PRED_K - expected) < 1e-10

    def test_Tc_pred_close_to_obs(self):
        err = abs(TC_K3C60_PRED_K - TC_K3C60_OBS_K) / TC_K3C60_OBS_K
        assert err < 0.15   # within 15%

    def test_kappa_GL_type_II(self):
        assert KAPPA_GL > 1.0 / sqrt(2.0)   # Type II superconductor

    def test_lambda_L_formula(self):
        expected = 1.0 / DELTA_STAR
        assert abs(LAMBDA_L_CATHEDRAL - expected) < 1e-12

    def test_isotope_exponent_formula(self):
        expected = float(D) / (D + q)   # = 3/8
        assert abs(ISOTOPE_EXPONENT - expected) < 1e-14

    def test_isotope_exponent_value(self):
        assert abs(ISOTOPE_EXPONENT - 0.375) < 1e-14

    def test_huckel_bonding_MOs_equals_E(self):
        assert HUCKEL_BONDING_MOS == E   # = 30

    def test_n_hg_modes(self):
        assert N_HG_MODES == 8

    def test_n_ag_modes(self):
        assert N_AG_MODES == 2


# ══════════════════════════════════════════════════════════════════════════════
#  BCS PARAMETERS TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestBCSParameters:
    def setup_method(self):
        self.b = bcs_parameters()

    def test_g_cathedral_in_dict(self):
        assert abs(self.b["g_cathedral"] - G_CATHEDRAL) < 1e-14

    def test_gap_ratio_exact_in_dict(self):
        assert abs(self.b["gap_ratio_BCS_exact"] - 3.528) < 1e-10

    def test_gap_ratio_cathedral_in_dict(self):
        assert abs(self.b["gap_ratio_BCS_cathedral"] - BCS_GAP_RATIO_CATHEDRAL) < 1e-12

    def test_gap_error_pct_positive(self):
        assert self.b["gap_ratio_error_pct"] > 0

    def test_isotope_exponent_in_dict(self):
        assert abs(self.b["isotope_exponent_alpha"] - ISOTOPE_EXPONENT) < 1e-14

    def test_kappa_GL_type_II(self):
        assert self.b["SC_type"] == "Type II"

    def test_xi_0_in_dict(self):
        assert self.b["xi_0_cathedral"] > 0

    def test_lambda_L_in_dict(self):
        assert self.b["lambda_L_cathedral"] > 0

    def test_all_values_finite(self):
        for key, val in self.b.items():
            if isinstance(val, float):
                assert isfinite(val), f"Non-finite: {key}={val}"


# ══════════════════════════════════════════════════════════════════════════════
#  C60 SYMMETRY TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestC60Symmetry:
    def setup_method(self):
        self.s = c60_symmetry()

    def test_atoms_formula(self):
        assert self.s["atoms"] == G

    def test_euler_characteristic(self):
        assert self.s["euler_characteristic"] == 2

    def test_symmetry_order(self):
        assert self.s["symmetry_order"] == 2 * G

    def test_LUMO_dim(self):
        assert self.s["LUMO_dim"] == D

    def test_Hg_dim(self):
        assert self.s["Hg_phonon_dim"] == q

    def test_Tc_pred_in_dict(self):
        assert abs(self.s["Tc_pred_K"] - TC_K3C60_PRED_K) < 1e-10

    def test_bandwidth_error_tiny(self):
        # W = δ★·3.4 eV ≈ 0.502 eV vs 0.5 eV → <1% error
        assert self.s["bandwidth_error_pct"] < 2.0

    def test_pi_MO_equals_E(self):
        assert self.s["bonding_pi_MOs"] == E


# ══════════════════════════════════════════════════════════════════════════════
#  ICOSAHEDRAL PHONON TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestIcosahedralPhonon:
    def setup_method(self):
        self.p = icosahedral_phonon()

    def test_Hg_dim_equals_q(self):
        assert self.p["Hg_phonon_dim"] == q

    def test_n_Hg_modes(self):
        assert self.p["n_Hg_modes"] == N_HG_MODES

    def test_omega_Hg_list_length(self):
        assert len(self.p["omega_Hg_meV"]) == N_HG_MODES

    def test_omega_Hg_increasing(self):
        freqs = self.p["omega_Hg_meV"]
        assert all(freqs[i] < freqs[i + 1] for i in range(len(freqs) - 1))

    def test_mu_star_formula(self):
        assert abs(self.p["mu_star"] - gamma) < 1e-14

    def test_lambda_ep_positive(self):
        assert self.p["lambda_ep_approx"] > 0

    def test_E_JT_positive(self):
        assert self.p["E_JT_meV"] > 0


# ══════════════════════════════════════════════════════════════════════════════
#  K3C60 TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestK3C60:
    def setup_method(self):
        self.k = k3c60_superconductor()

    def test_compound_name(self):
        assert self.k["compound"] == "K₃C₆₀"

    def test_Tc_formula(self):
        expected = N * gamma * 100.0
        assert abs(self.k["Tc_pred_K"] - expected) < 1e-10

    def test_Tc_error_within_15_pct(self):
        assert self.k["Tc_error_pct"] < 15.0

    def test_filling_half(self):
        assert abs(self.k["filling"] - 0.5) < 1e-14

    def test_SC_type_II(self):
        assert self.k["SC_type"] == "Type II (κ_GL > 1/√2)"

    def test_bandwidth_pred(self):
        expected = DELTA_STAR * 3.4
        assert abs(self.k["bandwidth_pred_eV"] - expected) < 1e-12

    def test_bandwidth_error_tiny(self):
        assert self.k["bandwidth_error_pct"] < 2.0


# ══════════════════════════════════════════════════════════════════════════════
#  SUMMARY AND PRINT TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestSuperconductorSummary:
    def test_summary_has_all_keys(self):
        s = superconductor_summary()
        for key in ["bcs_parameters", "c60_symmetry", "icosahedral_phonon",
                    "k3c60_superconductor", "BCS_GAP_RATIO", "G_CATHEDRAL",
                    "C60_ATOMS", "TC_K3C60_PRED_K"]:
            assert key in s

    def test_C60_atoms_formula(self):
        s = superconductor_summary()
        assert s["C60_ATOMS"] == G

    def test_print_runs(self, capsys):
        print_superconductor_report()
        captured = capsys.readouterr()
        assert "SUPERCONDUCTOR CATHEDRAL" in captured.out
        assert "BCS" in captured.out or "K₃C₆₀" in captured.out
