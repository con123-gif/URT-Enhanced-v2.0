"""Tests for urt/force_structure.py — Cathedral K4/H3 force hierarchy."""

import pytest
import numpy as np
from math import pi

from urt.force_structure import (
    G_N, ALPHA_EM, SIN2W, ALPHA_W, ALPHA_S, ALPHA_ORDER, H3_COUPLING,
    K4_COUPLINGS, MEDIATOR_MASSES_GEV,
    k4_mode, h3_mode, all_modes, coupling_hierarchy,
    unification_scale_gev, cathedral_grand_unified_coupling,
    force_unification_summary, effective_lagrangian_terms,
    print_force_structure_report,
)
from urt.shell_closure import DELTA_STAR, gamma


class TestCouplingConstants:
    def test_G_N_equals_delta_star_squared(self):
        assert abs(G_N - DELTA_STAR ** 2) < 1e-14

    def test_alpha_em_approximately_1_over_137(self):
        assert abs(1 / ALPHA_EM - 137) < 1

    def test_alpha_s_positive(self):
        assert ALPHA_S > 0

    def test_alpha_s_reasonable(self):
        # α_s(M_Z) ≈ 0.118
        assert 0.08 < ALPHA_S < 0.20

    def test_H3_coupling_is_gamma_times_alpha_s(self):
        assert abs(H3_COUPLING - gamma * ALPHA_S) < 1e-12

    def test_sin2W_reasonable(self):
        assert 0.20 < SIN2W < 0.26

    def test_alpha_W_equals_alpha_EM_over_sin2W(self):
        assert abs(ALPHA_W - ALPHA_EM / SIN2W) < 1e-12


class TestK4Modes:
    def test_k0_gravity(self):
        m = k4_mode(0)
        assert "gravity" in m["force"]
        assert m["coupling"] == G_N
        assert m["sector"] == "K4"

    def test_k1_em(self):
        m = k4_mode(1)
        assert "electromagnetism" in m["force"]
        assert abs(m["coupling"] - ALPHA_EM) < 1e-12

    def test_k2_weak(self):
        m = k4_mode(2)
        assert "weak" in m["force"] or "higgs" in m["force"].lower()

    def test_k3_ordering(self):
        m = k4_mode(3)
        assert "ordering" in m["force"].lower() or "consciousness" in m["force"].lower()

    def test_k4_invalid(self):
        with pytest.raises(ValueError):
            k4_mode(4)

    def test_all_k4_have_required_keys(self):
        for k in range(4):
            m = k4_mode(k)
            for key in ["k", "sector", "force", "mediator", "coupling", "range"]:
                assert key in m


class TestH3Modes:
    def test_k4_strong(self):
        m = h3_mode(4)
        assert "strong" in m["force"]
        assert m["sector"] == "H3"

    def test_k12_strong(self):
        m = h3_mode(12)
        assert "strong" in m["force"]

    def test_k3_invalid(self):
        with pytest.raises(ValueError):
            h3_mode(3)

    def test_k13_invalid(self):
        with pytest.raises(ValueError):
            h3_mode(13)

    def test_h3_gamma_factor(self):
        m = h3_mode(7)
        assert abs(m["gamma"] - gamma) < 1e-12

    def test_all_h3_have_required_keys(self):
        for k in range(4, 13):
            m = h3_mode(k)
            for key in ["k", "sector", "force", "coupling", "gamma"]:
                assert key in m


class TestAllModes:
    def setup_method(self):
        self.modes = all_modes()

    def test_thirteen_modes(self):
        assert len(self.modes) == 13

    def test_four_k4_modes(self):
        k4 = [m for m in self.modes if m["sector"] == "K4"]
        assert len(k4) == 4

    def test_nine_h3_modes(self):
        h3 = [m for m in self.modes if m["sector"] == "H3"]
        assert len(h3) == 9

    def test_k_values_cover_0_to_12(self):
        k_vals = [m["k"] for m in self.modes[:4]]
        assert sorted(k_vals) == [0, 1, 2, 3]

    def test_h3_k_values(self):
        h3 = [m for m in self.modes if m["sector"] == "H3"]
        k_vals = [m["k"] for m in h3]
        assert sorted(k_vals) == list(range(4, 13))


class TestCouplingHierarchy:
    def setup_method(self):
        self.ch = coupling_hierarchy()

    def test_strong_larger_than_G_N(self):
        # α_s >> G_N (gravity weak at particle scales)
        assert self.ch["alpha_s"] > self.ch["G_N"]

    def test_G_N_small(self):
        # G_N = δ★² ≈ 0.022 in Planck units
        assert self.ch["G_N"] < 0.05

    def test_strong_stronger_than_em(self):
        assert self.ch["alpha_s"] > self.ch["alpha_EM"]

    def test_required_keys(self):
        for key in ["G_N", "alpha_EM", "alpha_s", "G_N / alpha_s"]:
            assert key in self.ch


class TestUnification:
    def test_unification_scale_in_gev(self):
        mu_gut = unification_scale_gev()
        assert mu_gut > 0

    def test_unification_scale_above_mz(self):
        # μ_GUT >> M_Z = 91 GeV
        assert unification_scale_gev() > 91

    def test_cathedral_gut_coupling(self):
        alpha_gut = cathedral_grand_unified_coupling()
        assert 0 < alpha_gut < 0.1

    def test_gut_coupling_formula(self):
        from urt.shell_closure import DELTA_STAR
        expected = 4 / 81 * (1 + DELTA_STAR / (2 * pi))
        assert abs(cathedral_grand_unified_coupling() - expected) < 1e-14

    def test_force_unification_summary_keys(self):
        fu = force_unification_summary()
        for key in ["alpha_GUT", "mu_GUT_GeV", "sin2W_cathedral",
                    "alpha_s_cathedral", "G_N_cathedral"]:
            assert key in fu


class TestEffectiveLagrangian:
    def setup_method(self):
        self.L = effective_lagrangian_terms()

    def test_has_four_sectors(self):
        for key in ["L_gravity", "L_EM", "L_weak", "L_strong"]:
            assert key in self.L

    def test_zero_free_parameters(self):
        assert self.L["free_parameters"] == 0

    def test_all_from_delta_star(self):
        assert "δ★" in self.L["all_from"]


def test_print_force_structure_report_runs(capsys):
    print_force_structure_report()
    captured = capsys.readouterr()
    assert "K4" in captured.out
    assert "H3" in captured.out or "strong" in captured.out.lower()
