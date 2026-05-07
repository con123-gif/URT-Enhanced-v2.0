"""Tests for urt/cosmology_cathedral.py — CMB & cosmological predictions."""

import pytest
from math import pi, log
from urt.cosmology_cathedral import (
    N_E, N_S, R_TENSOR, A_S, OMEGA_M, OMEGA_LAMBDA, OMEGA_B, OMEGA_DM,
    ETA_BARYON, CC_RATIO, H0_RATIO, SIGMA_8, TAU_REION, T_CMB_K, M_GUT_GEV,
    V_INFLATION,
    cmb_power_spectrum, density_parameters, large_scale_structure,
    inflation_parameters, cosmological_constant_problem,
    cmb_ascii_diagram, cosmology_summary, print_cosmology_report,
)
from urt.shell_closure import DELTA_STAR, G, D


class TestCMBSpectralIndex:
    def test_N_e_value(self):
        assert N_E == G - D   # = 57

    def test_ns_formula(self):
        assert abs(N_S - (1 - 2 / N_E)) < 1e-14

    def test_ns_planck_match(self):
        assert abs(N_S - 0.9649) < 0.0005

    def test_r_tensor_formula(self):
        assert abs(R_TENSOR - 12 / N_E**2) < 1e-14

    def test_r_tensor_below_bound(self):
        assert R_TENSOR < 0.056

    def test_A_s_order(self):
        # Should be near 2×10⁻⁹ (within factor of 100 given our formula)
        assert 1e-11 < A_S < 1e-6


class TestDensityParameters:
    def test_omega_m_formula(self):
        from urt.shell_closure import N, gamma
        expected = (4 / 13) * (1 + 2 * gamma)
        assert abs(OMEGA_M - expected) < 1e-14

    def test_omega_m_close_to_planck(self):
        assert abs(OMEGA_M - 0.3111) < 0.05

    def test_omega_sum_to_unity(self):
        assert abs(OMEGA_M + OMEGA_LAMBDA - 1.0) < 1e-14

    def test_omega_b_positive(self):
        assert 0 < OMEGA_B < OMEGA_M

    def test_omega_dm_positive(self):
        assert OMEGA_DM > 0

    def test_omega_dm_greater_than_b(self):
        assert OMEGA_DM > OMEGA_B

    def test_eta_baryon_order(self):
        assert 1e-12 < ETA_BARYON < 1e-7


class TestLargeScaleStructure:
    def test_sigma_8_range(self):
        assert 0.6 < SIGMA_8 < 1.1

    def test_sigma_8_close_to_obs(self):
        assert abs(SIGMA_8 - 0.8120) < 0.1

    def test_h0_ratio_positive(self):
        assert H0_RATIO > 1.0

    def test_cc_ratio_tiny(self):
        assert CC_RATIO < 1e-100

    def test_m_gut_range(self):
        assert 1e13 < M_GUT_GEV < 1e17


class TestCosmologicalConstant:
    def test_cc_ratio_formula(self):
        from urt.shell_closure import D, gamma
        expected = D / (D + 1)**2 * gamma**64
        assert abs(CC_RATIO - expected) < 1e-200

    def test_cc_very_small(self):
        log_cc = log(CC_RATIO) / log(10)
        assert log_cc < -50

    def test_cc_dict_keys(self):
        cc = cosmological_constant_problem()
        for k in ["Lambda_Mpl4", "log10_CC", "formula"]:
            assert k in cc


class TestInflation:
    def test_inflation_dict_keys(self):
        inf = inflation_parameters()
        for k in ["n_s", "r", "A_s", "N_e"]:
            assert k in inf

    def test_N_e_consistent(self):
        inf = inflation_parameters()
        assert inf["N_e"] == N_E


class TestCMBAscii:
    def test_returns_string(self):
        s = cmb_ascii_diagram()
        assert isinstance(s, str)

    def test_contains_ns(self):
        s = cmb_ascii_diagram()
        assert "0.96" in s or "n_s" in s


class TestCosmologySummary:
    def test_summary_keys(self):
        s = cosmology_summary()
        for k in ["cmb", "density", "structure", "inflation", "cc_problem"]:
            assert k in s

    def test_print_runs(self, capsys):
        print_cosmology_report()
        out = capsys.readouterr().out
        assert "COSMOLOGY" in out
        assert "0.96" in out or "n_s" in out.lower()
