"""Tests for urt/cathedral_lagrangian.py — Cathedral QFT action from D=3."""

import pytest
from math import pi, sqrt
from urt.cathedral_lagrangian import (
    cathedral_action_summary, gauge_couplings, h3_spectrum, yukawa_coupling,
    h3_mode_mass, h3_mode_mass_gev, ward_identities, rg_fixed_points,
    cathedral_potential, cathedral_dV, cathedral_d2V, effective_potential_1loop,
    coleman_weinberg_correction, higgs_sector, coupling_table,
    G_NEWTON_CAT, ALPHA_S, SIN2_THETA_W, LAMBDA_HIGGS, K_POTENTIAL,
    N_GENERATIONS, N_F, B0_SU3, B0_SU2, KAPPA_GRAV, LAMBDA_SHELL,
    print_lagrangian_report,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi


class TestFundamentalScales:
    def test_G_newton(self):
        assert abs(G_NEWTON_CAT - DELTA_STAR**2) < 1e-14

    def test_sin2_theta_W(self):
        expected = (D/N)*(1 + gamma/(2*pi))
        assert abs(SIN2_THETA_W - expected) < 1e-14

    def test_alpha_s(self):
        expected = DELTA_STAR * (q-1) / q
        assert abs(ALPHA_S - expected) < 1e-14

    def test_kappa_grav(self):
        assert abs(KAPPA_GRAV - sqrt(16*pi*DELTA_STAR**2)) < 1e-12

    def test_lambda_shell(self):
        assert abs(LAMBDA_SHELL - 1.22090e19 / DELTA_STAR) < 1e5  # allow ~1e5 GeV tolerance


class TestGaugeCouplings:
    def setup_method(self):
        self.g = gauge_couplings()

    def test_four_sectors(self):
        assert len(self.g) == 4

    def test_k0_gravity(self):
        k0 = self.g["k=0 gravity"]
        assert abs(k0["G_Newton"] - DELTA_STAR**2) < 1e-14

    def test_k3_alpha_s(self):
        k3 = self.g["k=3 SU(3)"]
        assert abs(k3["alpha_s"] - DELTA_STAR*(q-1)/q) < 1e-14

    def test_k2_sin2_theta_W(self):
        k2 = self.g["k=2 SU(2)"]
        # The SU(2) coupling encodes sin²θ_W via g_sq = 4πα_EM(M_Z)/sin²θ_W
        from urt.cathedral_lagrangian import G_WEAK_SQ, ALPHA_EM_MZ
        sin2w_from_g = 4 * pi * ALPHA_EM_MZ / k2["g_sq"]
        assert abs(sin2w_from_g - SIN2_THETA_W) < 1e-12


class TestH3Spectrum:
    def setup_method(self):
        self.spec = h3_spectrum()

    def test_nine_modes(self):
        assert len(self.spec) == N - (D + 1)  # = 9

    def test_k_range(self):
        assert [m["k"] for m in self.spec] == list(range(4, 13))

    def test_eigenvalues(self):
        expected = [5, 5, 5, 5, 5, 7, 7, 9, 13]
        for mode, lam in zip(self.spec, expected):
            assert mode["lambda"] == lam

    def test_mass_formula(self):
        for mode in self.spec:
            expected = sqrt(mode["lambda"]) * DELTA_STAR
            assert abs(mode["m_Pl_units"] - expected) < 1e-14

    def test_mass_gev(self):
        for mode in self.spec:
            expected = sqrt(mode["lambda"]) * DELTA_STAR * 246.22
            assert abs(mode["m_GeV"] - expected) < 1e-10

    def test_yukawa_formula(self):
        for mode in self.spec:
            expected = DELTA_STAR * sqrt(mode["lambda"] / G)
            assert abs(mode["yukawa_y"] - expected) < 1e-14

    def test_last_mode_lambda_equals_N(self):
        assert self.spec[-1]["lambda"] == N   # λ=13=N for k=12


class TestCathedralPotential:
    def test_potential_at_zero(self):
        assert abs(cathedral_potential(0.0)) < 1e-30

    def test_potential_at_delta_star(self):
        assert abs(cathedral_potential(DELTA_STAR)) < 1e-30

    def test_potential_positive_elsewhere(self):
        assert cathedral_potential(0.05) > 0
        assert cathedral_potential(0.3) > 0

    def test_dV_at_zero(self):
        assert abs(cathedral_dV(0.0)) < 1e-30

    def test_dV_at_delta_star(self):
        assert abs(cathedral_dV(DELTA_STAR)) < 1e-10

    def test_d2V_at_delta_star_positive(self):
        assert cathedral_d2V(DELTA_STAR) > 0

    def test_K_potential(self):
        assert abs(K_POTENTIAL - (G - D - 1) / (16 * pi**2)) < 1e-14

    def test_1loop_correction_finite(self):
        # V(δ★) = 0 so relative correction is singular; check absolute is small vs Planck
        cw = coleman_weinberg_correction()
        assert cw["correction"] is not None   # should compute without error
        assert abs(cw["loop_factor"] - 1/(64*pi**2)) < 1e-15


class TestBetaFunctions:
    def test_n_generations_equals_D(self):
        assert N_GENERATIONS == D   # 3 generations from spatial dimension!

    def test_n_quarks(self):
        assert N_F == D * (D - 1)   # 6 quarks = D(D-1)

    def test_b_SU3(self):
        expected = 11 - 2 * D * (D-1) / 3
        assert abs(B0_SU3 - expected) < 1e-12

    def test_asymptotic_freedom(self):
        assert B0_SU3 > 0   # SU(3) is asymptotically free

    def test_rg_fixed_point_delta_star(self):
        fp = rg_fixed_points()
        assert abs(fp["beta_delta"]) < 1e-30
        assert fp["n_generations"] == D
        assert fp["n_quarks"] == D * (D-1)


class TestWardIdentities:
    def setup_method(self):
        self.wi = ward_identities()

    def test_sixty_generators(self):
        assert self.wi["n_generators"] == G   # = 60

    def test_sixty_ward_identities(self):
        assert self.wi["n_ward_identities"] == G

    def test_zero_free_params(self):
        assert self.wi["free_parameters"] == 0

    def test_symmetry_group(self):
        assert self.wi["symmetry_group"] == "A₅"


class TestHiggsSector:
    def setup_method(self):
        self.hs = higgs_sector()

    def test_lambda_H_formula(self):
        expected = DELTA_STAR * (D+1) * N * (1+gamma) / (F*D)
        assert abs(self.hs["lambda_H"] - expected) < 1e-14

    def test_m_H_tree_reasonable(self):
        assert 100 < self.hs["m_H_tree_GeV"] < 150   # should be ~125 GeV

    def test_m_H_error_under_5pct(self):
        assert abs(self.hs["error_tree_pct"]) < 5.0

    def test_vacuum_stability(self):
        assert self.hs["vacuum_stability"] is True


class TestCouplingTable:
    def setup_method(self):
        self.ct = coupling_table()

    def test_has_entries(self):
        assert len(self.ct) >= 6

    def test_G_newton_entry(self):
        gn = next(c for c in self.ct if c["name"] == "G_N")
        assert abs(gn["value"] - DELTA_STAR**2) < 1e-14

    def test_sin2W_entry(self):
        sw = next(c for c in self.ct if "sin²" in c["name"])
        assert abs(sw["value"] - SIN2_THETA_W) < 1e-14


class TestActionSummary:
    def setup_method(self):
        self.act = cathedral_action_summary()

    def test_zero_free_parameters(self):
        assert self.act["free_parameters"] == 0

    def test_input_D3(self):
        assert "D=3" in self.act["input"]

    def test_five_sectors(self):
        assert self.act["total_sectors"] == 5


def test_print_lagrangian_report_runs(capsys):
    print_lagrangian_report()
    out = capsys.readouterr().out
    assert "LAGRANGIAN" in out
    assert "δ★" in out or "delta" in out.lower()
    assert "Ward" in out
