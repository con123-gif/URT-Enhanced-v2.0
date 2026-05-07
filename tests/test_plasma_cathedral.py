"""Tests for urt/plasma_cathedral.py — Plasma Cathedral module."""

import pytest
from math import pi, sqrt, log, isfinite
from urt.plasma_cathedral import (
    reconnection, alfven_modes, fusion_parameters, plasma_turbulence,
    plasma_summary, print_plasma_report,
    M_A_RECONNECTION, V_A_RATIO, BETA_PLASMA, Q_SAFETY_FACTOR,
    DEBYE_LENGTH, C_MS_RATIO, GS_SCALE_RATIO, KOLMOGOROV_INDEX, IK_INDEX,
    LUNDQUIST_S, RESISTIVE_LAYER_WIDTH, OMEGA_P_OVER_OMEGA_C, ION_SKIN_DEPTH,
    HARRIS_SHEET_WIDTH, KAW_THRESHOLD, N_TEARING_ISLANDS,
)
from urt.shell_closure import DELTA_STAR, N, D, gamma, phi


# ══════════════════════════════════════════════════════════════════════════════
#  MODULE-LEVEL CONSTANT TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestPlasmaConstants:
    def test_reconnection_rate_equals_delta_star(self):
        assert abs(M_A_RECONNECTION - DELTA_STAR) < 1e-14

    def test_VA_ratio_equals_delta_star(self):
        assert abs(V_A_RATIO - DELTA_STAR) < 1e-14

    def test_beta_plasma_formula(self):
        expected = (D - 1) * gamma   # = 2/81
        assert abs(BETA_PLASMA - expected) < 1e-14

    def test_beta_plasma_value(self):
        assert abs(BETA_PLASMA - 2.0 / 81.0) < 1e-14

    def test_q_safety_factor_formula(self):
        expected = D + gamma / (2 * pi)
        assert abs(Q_SAFETY_FACTOR - expected) < 1e-14

    def test_q_safety_factor_slightly_above_3(self):
        assert Q_SAFETY_FACTOR > D      # q > 3 (kink-mode stable)
        assert Q_SAFETY_FACTOR < D + 0.01

    def test_debye_length_formula(self):
        expected = DELTA_STAR / sqrt(N)
        assert abs(DEBYE_LENGTH - expected) < 1e-14

    def test_c_ms_ratio_formula(self):
        expected = sqrt(1.0 + (D - 1) / N)
        assert abs(C_MS_RATIO - expected) < 1e-14

    def test_c_ms_ratio_value(self):
        assert 1.0 < C_MS_RATIO < 1.2  # compressional > Alfvénic

    def test_gs_scale_ratio_formula(self):
        expected = N ** (3.0 / 4.0)
        assert abs(GS_SCALE_RATIO - expected) < 1e-12

    def test_gs_scale_ratio_value(self):
        assert 5.5 < GS_SCALE_RATIO < 7.0  # ≈ 6.028

    def test_kolmogorov_index(self):
        assert abs(KOLMOGOROV_INDEX - (-5.0 / 3.0)) < 1e-14

    def test_IK_index(self):
        assert abs(IK_INDEX - (-3.0 / 2.0)) < 1e-14

    def test_lundquist_formula(self):
        expected = (N / DELTA_STAR) ** (D + 1)
        assert abs(LUNDQUIST_S - expected) < 1.0  # large number, allow 1-unit error

    def test_lundquist_large(self):
        assert LUNDQUIST_S > 1e5   # must be large for fast reconnection

    def test_resistive_layer_formula(self):
        expected = LUNDQUIST_S ** (-0.5)
        assert abs(RESISTIVE_LAYER_WIDTH - expected) < 1e-12

    def test_omega_p_ratio(self):
        assert abs(OMEGA_P_OVER_OMEGA_C - DELTA_STAR) < 1e-14

    def test_ion_skin_depth_formula(self):
        expected = 1.0 / (DELTA_STAR * sqrt(N))
        assert abs(ION_SKIN_DEPTH - expected) < 1e-12

    def test_harris_sheet_formula(self):
        expected = N * DELTA_STAR ** 2
        assert abs(HARRIS_SHEET_WIDTH - expected) < 1e-14

    def test_kaw_threshold(self):
        assert abs(KAW_THRESHOLD - DELTA_STAR) < 1e-14

    def test_n_tearing_islands(self):
        assert N_TEARING_ISLANDS == round(N / D)  # = 4


# ══════════════════════════════════════════════════════════════════════════════
#  RECONNECTION FUNCTION TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestReconnection:
    def setup_method(self):
        self.r = reconnection()

    def test_returns_dict(self):
        assert isinstance(self.r, dict)

    def test_MA_cathedral_equals_delta_star(self):
        assert abs(self.r["M_A_Cathedral"] - DELTA_STAR) < 1e-14

    def test_petschek_rate_faster_than_sweet_parker(self):
        assert self.r["M_A_Cathedral"] > self.r["M_A_SweetParker"]

    def test_enhancement_factor_positive(self):
        assert self.r["enhancement_factor"] > 1.0

    def test_tau_rec_positive(self):
        assert self.r["tau_rec_normalized"] > 0.0

    def test_lundquist_in_dict(self):
        assert self.r["Lundquist_S"] > 0

    def test_electron_region_length(self):
        expected = DELTA_STAR * ION_SKIN_DEPTH
        assert abs(self.r["electron_region_length"] - expected) < 1e-12

    def test_ion_skin_depth_in_dict(self):
        assert self.r["ion_skin_depth"] > 0


# ══════════════════════════════════════════════════════════════════════════════
#  ALFVÉN MODES TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestAlfvenModes:
    def setup_method(self):
        self.a = alfven_modes()

    def test_omega_A_min_formula(self):
        assert abs(self.a["omega_A_min"] - sqrt(D)) < 1e-12

    def test_spectral_gap_equals_D(self):
        assert self.a["spectral_gap_lambda2"] == D

    def test_c_ms_ratio_in_dict(self):
        assert abs(self.a["c_ms_ratio"] - C_MS_RATIO) < 1e-14

    def test_eigenvalues_list_length(self):
        assert len(self.a["icos_eigenvalues"]) == 5  # [3,5,7,9,13]

    def test_N_in_eigenvalues(self):
        assert N in self.a["icos_eigenvalues"]

    def test_omega_KAW_greater_than_SAW(self):
        assert self.a["omega_KAW"] > self.a["omega_A_min"]


# ══════════════════════════════════════════════════════════════════════════════
#  FUSION PARAMETERS TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestFusionParameters:
    def setup_method(self):
        self.f = fusion_parameters()

    def test_q_safety_in_dict(self):
        assert abs(self.f["q_safety_factor"] - Q_SAFETY_FACTOR) < 1e-14

    def test_beta_in_dict(self):
        assert abs(self.f["beta_plasma"] - BETA_PLASMA) < 1e-14

    def test_beta_percent(self):
        assert abs(self.f["beta_percent"] - BETA_PLASMA * 100) < 1e-12

    def test_n_islands(self):
        assert self.f["n_tearing_islands"] == N_TEARING_ISLANDS

    def test_debye_in_dict(self):
        assert self.f["debye_length"] == DEBYE_LENGTH

    def test_shafranov_positive(self):
        assert self.f["shafranov_shift_ratio"] > 0


# ══════════════════════════════════════════════════════════════════════════════
#  TURBULENCE TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestPlasmaTurbulence:
    def setup_method(self):
        self.t = plasma_turbulence()

    def test_kolmogorov_index(self):
        assert abs(self.t["kolmogorov_index"] - KOLMOGOROV_INDEX) < 1e-14

    def test_inertial_scale_equals_delta_star(self):
        assert abs(self.t["inertial_scale_l_in"] - DELTA_STAR) < 1e-14

    def test_gs_scale_ratio(self):
        assert abs(self.t["GS_scale_ratio"] - GS_SCALE_RATIO) < 1e-12

    def test_reynolds_number(self):
        expected = DELTA_STAR / gamma
        assert abs(self.t["Reynolds_number"] - expected) < 1e-10

    def test_zeta_p_moments_dict(self):
        assert isinstance(self.t["zeta_p_moments"], dict)
        assert 3 in self.t["zeta_p_moments"]

    def test_all_values_finite(self):
        for key, val in self.t.items():
            if isinstance(val, float):
                assert isfinite(val), f"Non-finite: {key}={val}"


# ══════════════════════════════════════════════════════════════════════════════
#  SUMMARY AND REPORT TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestPlasmaSummary:
    def test_summary_has_all_keys(self):
        s = plasma_summary()
        for key in ["reconnection", "alfven_modes", "fusion_parameters",
                    "plasma_turbulence", "M_A_RECONNECTION", "BETA_PLASMA"]:
            assert key in s

    def test_print_runs(self, capsys):
        print_plasma_report()
        captured = capsys.readouterr()
        assert "PLASMA CATHEDRAL" in captured.out
        assert "delta" in captured.out.lower() or "RECONNECTION" in captured.out
