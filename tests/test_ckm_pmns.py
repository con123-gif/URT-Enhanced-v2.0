"""Tests for urt/ckm_pmns.py — CKM + PMNS mixing matrices."""

import pytest
import numpy as np
from math import pi, sqrt, asin
from urt.ckm_pmns import (
    LAMBDA_C, A_CKM, RHO_BAR, ETA_BAR, J_CKM,
    THETA_12_CKM, THETA_13_CKM, THETA_23_CKM, DELTA_CKM,
    SIN2_THETA12_PMNS, SIN2_THETA13_PMNS, SIN2_THETA23_PMNS,
    DELTA_CP_PMNS_DEG, DELTA_CP_PMNS_RAD,
    ckm_matrix, ckm_unitarity_check, ckm_summary,
    pmns_matrix, pmns_unitarity_check, pmns_summary,
    jarlskog_pmns, quark_lepton_complementarity,
    print_ckm_pmns_report,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, V, gamma, phi


class TestCKMParameters:
    def test_lambda_C_formula(self):
        expected = (D / N) * (1 - (D + 1) / (N * V))
        assert abs(LAMBDA_C - expected) < 1e-14

    def test_lambda_C_cabibbo(self):
        assert abs(LAMBDA_C - 0.22537) < 0.01

    def test_A_CKM_formula(self):
        expected = phi / 2 * (1 + 2 * gamma)
        assert abs(A_CKM - expected) < 1e-14

    def test_A_CKM_range(self):
        assert 0.7 < A_CKM < 0.95

    def test_J_CKM_positive(self):
        assert J_CKM > 0

    def test_J_CKM_order(self):
        assert 1e-7 < J_CKM < 1e-4


class TestCKMMatrix:
    def setup_method(self):
        self.V = ckm_matrix()

    def test_shape(self):
        assert self.V.shape == (3, 3)

    def test_unitarity(self):
        u = ckm_unitarity_check()
        assert bool(u["is_unitary"]) is True

    def test_Vus_range(self):
        assert 0.2 < abs(self.V[0, 1]) < 0.26

    def test_Vcb_range(self):
        assert 0.03 < abs(self.V[1, 2]) < 0.05

    def test_Vtb_close_to_1(self):
        assert abs(self.V[2, 2]) > 0.95

    def test_Vud_close_to_1(self):
        assert abs(self.V[0, 0]) > 0.95

    def test_determinant_is_1(self):
        det = np.linalg.det(self.V)
        assert abs(abs(det) - 1.0) < 1e-10


class TestPMNSAngles:
    def test_sin2_13_equals_delta_star_sq(self):
        assert abs(SIN2_THETA13_PMNS - DELTA_STAR**2) < 1e-14

    def test_sin2_23_formula(self):
        expected = (F + V) / (G - 1)
        assert abs(SIN2_THETA23_PMNS - expected) < 1e-14

    def test_delta_cp_formula(self):
        expected = (D + 1) * F + (N - D - 1) * N
        assert DELTA_CP_PMNS_DEG == expected

    def test_delta_cp_197(self):
        assert DELTA_CP_PMNS_DEG == 197

    def test_delta_cp_rad_consistent(self):
        assert abs(DELTA_CP_PMNS_RAD - 197 * pi / 180) < 1e-14

    def test_sin2_12_range(self):
        assert 0.2 < SIN2_THETA12_PMNS < 0.4

    def test_sin2_23_range(self):
        assert 0.4 < SIN2_THETA23_PMNS < 0.7


class TestPMNSMatrix:
    def setup_method(self):
        self.U = pmns_matrix()

    def test_shape(self):
        assert self.U.shape == (3, 3)

    def test_unitarity(self):
        u = pmns_unitarity_check()
        assert bool(u["is_unitary"]) is True

    def test_Ue3_squared(self):
        # |U_e3|² ≈ sin²θ₁₃ = δ★²
        Ue3_sq = abs(self.U[0, 2])**2
        assert abs(Ue3_sq - SIN2_THETA13_PMNS) < 0.001

    def test_determinant_is_1(self):
        det = np.linalg.det(self.U)
        assert abs(abs(det) - 1.0) < 1e-10


class TestJarlskog:
    def test_J_pmns_nonzero(self):
        J = jarlskog_pmns()
        assert abs(J) > 1e-6

    def test_J_pmns_in_range(self):
        J = jarlskog_pmns()
        assert -0.05 < J < 0.05


class TestQLC:
    def test_qlc_deviation_small(self):
        qlc = quark_lepton_complementarity()
        assert qlc["QLC_deviation"] < 10.0   # within 10°

    def test_sum_near_45(self):
        qlc = quark_lepton_complementarity()
        assert 30.0 < qlc["sum_deg"] < 60.0


class TestSummaries:
    def test_ckm_summary_keys(self):
        s = ckm_summary()
        for k in ["lambda_C", "A_CKM", "rho_bar", "eta_bar", "J_CKM"]:
            assert k in s

    def test_pmns_summary_delta_cp(self):
        s = pmns_summary()
        assert s["delta_CP_deg"] == 197
        assert s["delta_CP_err"] == 0.0   # exact match

    def test_print_runs(self, capsys):
        print_ckm_pmns_report()
        out = capsys.readouterr().out
        assert "CKM" in out
        assert "PMNS" in out
        assert "197" in out
