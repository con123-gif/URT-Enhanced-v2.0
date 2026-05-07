"""Tests for urt/cathedral_gut.py — Cathedral Grand Unified Theory."""

import pytest
from math import log, pi
from urt.cathedral_gut import (
    gut_scale, unification_check, proton_lifetime, gut_multiplets,
    cathedral_gut_summary, print_gut_report,
    ALPHA_GUT, ALPHA_GUT_INV, MU_GUT_GEV, M_X_GEV,
    TAU_PROTON_YR, B0_SU3, N_GENERATIONS, N_F, ALPHA_S_MZ,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, q, gamma


class TestGUTCoupling:
    def test_alpha_GUT_equals_delta_star_sq(self):
        assert abs(ALPHA_GUT - DELTA_STAR**2) < 1e-14

    def test_alpha_GUT_equals_G_Newton(self):
        from urt.shell_closure import DELTA_STAR
        G_N = DELTA_STAR**2
        assert abs(ALPHA_GUT - G_N) < 1e-14

    def test_alpha_GUT_inv(self):
        assert abs(ALPHA_GUT_INV - 1/DELTA_STAR**2) < 1e-10


class TestGUTScale:
    def setup_method(self):
        self.gs = gut_scale()

    def test_mu_GUT_above_EW(self):
        assert MU_GUT_GEV > 1e10  # well above EW scale

    def test_mu_GUT_below_Planck(self):
        assert MU_GUT_GEV < 1.22e19  # below Planck

    def test_mu_GUT_near_SU5(self):
        # Should be within factor 10 of standard SU(5) scale 2×10^16 GeV
        ratio = self.gs["ratio_to_SU5"]
        assert 0.1 < ratio < 10.0

    def test_unification_check_by_construction(self):
        assert self.gs["unification_check"] is True

    def test_key_insight(self):
        assert "G_N" in self.gs["key_insight"] or "gravity" in self.gs["key_insight"].lower()


class TestRGCoefficients:
    def test_b0_SU3_value(self):
        assert abs(B0_SU3 - 7.0) < 1e-10

    def test_n_generations_equals_D(self):
        assert N_GENERATIONS == D   # 3 from spatial dimension!

    def test_n_quarks(self):
        assert N_F == D * (D - 1)  # = 6

    def test_alpha_S_MZ_from_Cathedral(self):
        expected = DELTA_STAR * (q - 1) / q
        assert abs(ALPHA_S_MZ - expected) < 1e-14


class TestUnificationCheck:
    def setup_method(self):
        self.uc = unification_check()

    def test_alpha_3_exact(self):
        assert self.uc["alpha_3_exact"] is True

    def test_alpha_3_at_gut_equals_target(self):
        assert abs(self.uc["alpha_3_GUT"] - ALPHA_GUT) < 1e-4

    def test_alpha_2_close(self):
        assert self.uc["alpha_2_close"] is True

    def test_all_couplings_present(self):
        for key in ["alpha_1_GUT", "alpha_2_GUT", "alpha_3_GUT"]:
            assert key in self.uc


class TestProtonLifetime:
    def setup_method(self):
        self.pl = proton_lifetime()

    def test_above_experimental_bound(self):
        assert self.pl["above_bound"] is True

    def test_tau_reasonable(self):
        # Should be 10^{35} to 10^{60} years
        log_tau = log(TAU_PROTON_YR, 10)
        assert 35 < log_tau < 60

    def test_formula_keys(self):
        for k in ["formula", "alpha_GUT", "mu_GUT_GeV", "tau_yr", "exp_bound_yr"]:
            assert k in self.pl

    def test_alpha_GUT_formula(self):
        assert "δ★²" in self.pl["alpha_GUT_formula"]


class TestGUTMultiplets:
    def setup_method(self):
        self.mu = gut_multiplets()

    def test_K4_modes(self):
        assert self.mu["K4_modes"] == D + 1   # = 4

    def test_H3_modes(self):
        assert self.mu["H3_modes"] == N - D - 1   # = 9

    def test_n_generations(self):
        assert self.mu["n_generations"] == D   # = 3

    def test_SO10_spinor(self):
        assert self.mu["SO10_spinor_dim"] == 2**(D+1)   # = 16

    def test_total_matter(self):
        assert self.mu["total_matter"] == (N - D - 1) * D   # = 9 × 3 = 27


class TestGUTSummary:
    def test_keys(self):
        s = cathedral_gut_summary()
        for k in ["alpha_GUT", "gut_scale", "proton_lifetime", "multiplets"]:
            assert k in s

    def test_zero_free_params(self):
        s = cathedral_gut_summary()
        assert s["free_parameters"] == 0

    def test_key_formula(self):
        s = cathedral_gut_summary()
        assert "δ★²" in s["key_formula"]


def test_print_gut_report_runs(capsys):
    print_gut_report()
    out = capsys.readouterr().out
    assert "GUT" in out or "GRAND" in out
    assert "α_GUT" in out or "alpha" in out.lower()
    assert "PROTON" in out
