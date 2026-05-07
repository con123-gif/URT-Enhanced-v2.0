"""Tests for urt/electroweak.py — EW sector from K4 k=2 mode."""

import pytest
from math import pi, sqrt, asin
from urt.electroweak import (
    SIN2_THETA_W, COS2_THETA_W, SIN_THETA_W, COS_THETA_W, THETA_W_DEG,
    M_W_GEV, M_Z_GEV, G_FERMI, LAMBDA_HIGGS, M_HIGGS_GEV, C_MASS_V6,
    RHO_PARAMETER, ALPHA_GUT, SIN2_THETA_GUT,
    weinberg_angle, w_boson, z_boson, higgs_boson, ew_precision_tests,
    electroweak_summary, print_electroweak_report,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, V, gamma, phi


class TestWeinbergAngle:
    def test_sin2_formula(self):
        expected = (D / N) * (1 + gamma / (2 * pi))
        assert abs(SIN2_THETA_W - expected) < 1e-14

    def test_sin2_close_to_pdg(self):
        assert abs(SIN2_THETA_W - 0.23122) < 0.0005

    def test_cos2_complements_sin2(self):
        assert abs(SIN2_THETA_W + COS2_THETA_W - 1.0) < 1e-14

    def test_sin_cos_consistent(self):
        assert abs(SIN_THETA_W**2 - SIN2_THETA_W) < 1e-14
        assert abs(COS_THETA_W**2 - COS2_THETA_W) < 1e-14

    def test_theta_deg_positive(self):
        assert 20.0 < THETA_W_DEG < 35.0

    def test_weinberg_dict_keys(self):
        w = weinberg_angle()
        for k in ["sin2_theta_W", "observed_sin2", "error_pct"]:
            assert k in w

    def test_weinberg_error_small(self):
        w = weinberg_angle()
        assert abs(w["error_pct"]) < 1.0


class TestWBoson:
    def test_m_W_range(self):
        assert 78.0 < M_W_GEV < 83.0

    def test_m_W_close_to_pdg(self):
        assert abs(M_W_GEV - 80.377) < 2.0

    def test_g_fermi_order(self):
        assert 1e-6 < G_FERMI < 1e-4

    def test_w_boson_dict(self):
        w = w_boson()
        assert "m_W_GeV" in w
        assert "G_Fermi" in w
        assert abs(w["m_W_GeV"] - M_W_GEV) < 1e-10


class TestZBoson:
    def test_m_Z_range(self):
        assert 89.0 < M_Z_GEV < 93.0

    def test_m_Z_greater_than_m_W(self):
        assert M_Z_GEV > M_W_GEV

    def test_rho_near_unity(self):
        assert abs(RHO_PARAMETER - 1.0) < 0.05

    def test_z_boson_dict(self):
        z = z_boson()
        assert "m_Z_GeV" in z
        assert "rho_parameter" in z


class TestHiggs:
    def test_lambda_H_positive(self):
        assert LAMBDA_HIGGS > 0

    def test_m_H_range(self):
        assert 100.0 < M_HIGGS_GEV < 140.0

    def test_m_H_close_to_pdg(self):
        assert abs(M_HIGGS_GEV - 125.25) < 15.0

    def test_c_mass_v6_positive(self):
        assert C_MASS_V6 > 0

    def test_higgs_dict(self):
        h = higgs_boson()
        assert "m_H_GeV" in h
        assert "lambda_H" in h
        assert "C_mass_v6" in h


class TestGUTUnification:
    def test_alpha_gut_positive(self):
        assert ALPHA_GUT > 0

    def test_sin2_theta_gut(self):
        assert abs(SIN2_THETA_GUT - 3 / 8) < 1e-14

    def test_alpha_gut_order(self):
        assert 0.01 < ALPHA_GUT < 0.1


class TestEWSummary:
    def test_summary_has_all_sectors(self):
        s = electroweak_summary()
        for k in ["weinberg", "W_boson", "Z_boson", "higgs", "precision"]:
            assert k in s

    def test_print_runs(self, capsys):
        print_electroweak_report()
        out = capsys.readouterr().out
        assert "ELECTROWEAK" in out
        assert "sin²θ_W" in out or "sin2" in out.lower()
