"""Tests for urt/canonical_v4gem.py — CanonicalV4Gem ta-URT."""

import pytest
import numpy as np
from math import pi, exp
from urt.canonical_v4gem import (
    OMEGA_GEM, TAU_STAB, N_RES, EPS_GEM, T_K4, DELTA_TA,
    resonance_shells, ta_urt_average, gem_flow,
    gem_contraction_factor, compression_ratio,
    gem_phase_portrait, gem_spectral_decomposition,
    canonical_v4gem_summary, print_canonical_v4gem_report,
)
from urt.shell_closure import DELTA_STAR, N, D


class TestCoreConstants:
    def test_omega_gem(self):
        assert abs(OMEGA_GEM - 9 / 13) < 1e-14

    def test_tau_stab(self):
        assert abs(TAU_STAB - 0.001211) < 1e-8

    def test_n_res(self):
        assert N_RES == N   # = 13

    def test_eps_gem(self):
        assert abs(EPS_GEM - DELTA_STAR * OMEGA_GEM) < 1e-14

    def test_T_K4_positive(self):
        assert T_K4 > 0

    def test_delta_ta_close_to_delta_star(self):
        assert abs(DELTA_TA - DELTA_STAR) < 0.01


class TestResonanceShells:
    def setup_method(self):
        self.shells = resonance_shells()

    def test_count(self):
        assert len(self.shells) == N   # 13 shells

    def test_required_keys(self):
        for s in self.shells:
            for k in ["shell", "omega_k", "A_k", "phase_k", "stability", "sector"]:
                assert k in s

    def test_k4_shells(self):
        k4 = [s for s in self.shells if s["sector"] == "K4"]
        assert len(k4) == D + 1   # 4 K4 modes

    def test_h3_shells(self):
        h3 = [s for s in self.shells if s["sector"] == "H3"]
        assert len(h3) == N - (D + 1)   # 9 H3 modes

    def test_omega_zero_for_k0(self):
        assert self.shells[0]["omega_k"] == 0.0

    def test_A_decreasing(self):
        amps = [s["A_k"] for s in self.shells]
        assert all(amps[i] >= amps[i+1] for i in range(len(amps)-1))

    def test_stability_in_range(self):
        for s in self.shells:
            assert 0 < s["stability"] <= 1.0


class TestGemFlow:
    def test_returns_array(self):
        traj = gem_flow(0.20, steps=50)
        assert len(traj) == 50

    def test_converges(self):
        traj = gem_flow(0.30, steps=500)
        assert abs(traj[-1] - DELTA_STAR) < 0.05

    def test_all_positive(self):
        traj = gem_flow(0.20, steps=100)
        assert np.all(traj > 0)

    def test_all_bounded(self):
        traj = gem_flow(0.20, steps=100)
        assert np.all(traj < 0.5)


class TestTaURT:
    def test_average_of_constant(self):
        delta_t = np.full(100, DELTA_STAR)
        avg = ta_urt_average(delta_t)
        assert abs(avg - DELTA_STAR) < 1e-10

    def test_average_close_to_delta_star(self):
        traj = gem_flow(0.25, steps=200)
        avg = ta_urt_average(traj)
        assert abs(avg - DELTA_STAR) < 0.05


class TestContractionFactor:
    def test_kappa_gem_lt_1(self):
        c = gem_contraction_factor()
        assert c["kappa_gem"] < 1.0

    def test_kappa_gem_positive(self):
        c = gem_contraction_factor()
        assert c["kappa_gem"] > 0

    def test_kappa_gem_lt_kappa_base(self):
        c = gem_contraction_factor()
        assert c["kappa_gem"] <= c["kappa_base"]


class TestCompression:
    def test_compression_ratio(self):
        c = compression_ratio()
        assert abs(c["compression"] - (D + 1) / (N - D - 1)) < 1e-14

    def test_omega_matches(self):
        c = compression_ratio()
        assert abs(c["Omega"] - OMEGA_GEM) < 1e-14


class TestPhasePortrait:
    def test_five_orbits(self):
        orbits = gem_phase_portrait(5)
        assert len(orbits) == 5

    def test_orbits_converge(self):
        orbits = gem_phase_portrait(5)
        assert all(o["converged"] for o in orbits)


class TestSummary:
    def test_summary_keys(self):
        s = canonical_v4gem_summary()
        for k in ["Omega", "tau_stab", "N_res", "eps_gem", "T_K4"]:
            assert k in s

    def test_print_runs(self, capsys):
        print_canonical_v4gem_report()
        out = capsys.readouterr().out
        assert "V4GEM" in out or "CANONICAL" in out
        assert "9/13" in out or "0.6923" in out
