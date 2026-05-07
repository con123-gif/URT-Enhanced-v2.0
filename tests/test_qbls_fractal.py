"""Tests for urt/qbls_fractal.py — QBLS fractal meta-universe simulation."""

import pytest
from math import pi, log10
from urt.qbls_fractal import (
    N_RUNGS, EPS_RUNG, ALPHA_0,
    alpha_rung, delta_star_rung, g_newton_rung,
    fractal_ratio, rung_table, MetaUniverse,
    simulate_meta_universes_fractal,
    planck_foam, anthropic_bounds,
    qbls_fractal_summary, print_qbls_fractal_report,
)
from urt.shell_closure import DELTA_STAR, N, D, G, gamma
from urt.qbls import DELTA_RUNG


class TestQBLSConstants:
    def test_n_rungs(self):
        assert N_RUNGS == N   # = 13

    def test_eps_rung(self):
        assert abs(EPS_RUNG - gamma / N) < 1e-14

    def test_alpha_0(self):
        assert abs(ALPHA_0 - 1 / 137.035999) < 1e-8


class TestRungFunctions:
    def test_delta_star_rung_0(self):
        assert abs(delta_star_rung(0) - DELTA_STAR) < 1e-14

    def test_delta_star_increases(self):
        for n in range(N_RUNGS - 1):
            assert delta_star_rung(n + 1) >= delta_star_rung(n)

    def test_g_newton_formula(self):
        for n in range(N_RUNGS):
            gn = g_newton_rung(n)
            ds = delta_star_rung(n)
            assert abs(gn - ds**2) < 1e-14

    def test_alpha_0_rung(self):
        # at n=0, α = α_0 (plus tiny correction)
        assert alpha_rung(0) >= ALPHA_0


class TestFractalRatio:
    def test_delta_rung(self):
        fr = fractal_ratio()
        assert abs(fr["delta_rung"] - DELTA_RUNG) < 1e-6

    def test_R_fractal_positive(self):
        fr = fractal_ratio()
        assert fr["R_fractal"] > 1

    def test_self_similar(self):
        fr = fractal_ratio()
        assert fr["self_similar"] is True


class TestRungTable:
    def setup_method(self):
        self.table = rung_table()

    def test_count(self):
        assert len(self.table) == N_RUNGS

    def test_required_keys(self):
        for row in self.table:
            for k in ["rung", "log10_scale", "delta_star", "G_N", "sector"]:
                assert k in row

    def test_k4_rungs(self):
        k4 = [r for r in self.table if r["sector"] == "K4"]
        assert len(k4) == D + 1   # 4 K4 rungs

    def test_h3_rungs(self):
        h3 = [r for r in self.table if r["sector"] == "H3"]
        assert len(h3) == N - (D + 1)   # 9 H3 rungs

    def test_scale_increases(self):
        scales = [r["log10_scale"] for r in self.table]
        assert all(scales[i] <= scales[i+1] for i in range(len(scales)-1))


class TestMetaUniverse:
    def test_rung_0(self):
        mu = MetaUniverse(0)
        assert abs(mu.delta - DELTA_STAR) < 1e-14

    def test_rung_0_habitable(self):
        mu = MetaUniverse(0)
        assert mu.habitable() is True

    def test_cmb_keys(self):
        mu = MetaUniverse(0)
        cmb = mu.simulate_cmb()
        for k in ["n_s", "r", "Omega_m"]:
            assert k in cmb

    def test_cmb_ns_consistent(self):
        mu = MetaUniverse(0)
        cmb = mu.simulate_cmb()
        expected_ns = 1 - 2 / (G - D)
        assert abs(cmb["n_s"] - expected_ns) < 1e-14


class TestSimulation:
    def test_returns_all_rungs(self):
        results = simulate_meta_universes_fractal(N_RUNGS)
        assert len(results) == N_RUNGS

    def test_required_keys(self):
        results = simulate_meta_universes_fractal(3)
        for r in results:
            for k in ["rung", "delta_star", "G_N", "habitable"]:
                assert k in r


class TestPlanckFoam:
    def test_area_quantum(self):
        foam = planck_foam()
        from math import pi
        expected = 8 * pi * DELTA_STAR**3
        assert abs(foam["area_quantum_Pl2"] - expected) < 1e-14

    def test_G_N(self):
        foam = planck_foam()
        assert abs(foam["G_N"] - DELTA_STAR**2) < 1e-14


class TestAnthropicBounds:
    def test_habitable_range(self):
        ant = anthropic_bounds()
        assert ant["habitable_range"] == (0.1, 0.2)

    def test_rung_0_habitable(self):
        ant = anthropic_bounds()
        habitable_ns = [n for (n, _) in ant["rungs_in_range"]]
        assert 0 in habitable_ns


def test_print_qbls_fractal_report_runs(capsys):
    print_qbls_fractal_report()
    out = capsys.readouterr().out
    assert "QBLS" in out
    assert "Planck" in out
