"""Tests for urt/cathedral_topology.py — discrete topology to continuous spacetime."""

import pytest
import numpy as np
from math import pi, log

from urt.cathedral_topology import (
    DELTA_STAR_DEG, PHYSICAL_RAIL_DEG, IDEAL_FLAT_DEG,
    HOLONOMY_VORTEX_DEG, HOLONOMY_VORTEX_RAD,
    K5_ENTROPY_DEFICIT_DEG, GRAVITATIONAL_DEFICIT_DEG, GRAVITATIONAL_DEFICIT_RAD,
    LAPLACIAN_EIGENVALUES, D_ZERO,
    holonomy_vortex, rg_damping_factor, rg_mode_table, total_rg_curvature,
    gravitational_deficit_triangle, uv_to_ir_transition, topology_summary,
    ascii_holonomy_vortex, ascii_rg_flow, ascii_deficit_triangle,
    print_topology_report,
)
from urt.shell_closure import DELTA_STAR, N


class TestTopologyConstants:
    def test_delta_star_deg(self):
        assert abs(DELTA_STAR_DEG - DELTA_STAR * 180 / pi) < 1e-10

    def test_physical_rail_is_twice_delta_star_deg(self):
        assert abs(PHYSICAL_RAIL_DEG - 2 * DELTA_STAR_DEG) < 1e-10

    def test_ideal_flat_is_18(self):
        assert IDEAL_FLAT_DEG == 18.0

    def test_holonomy_vortex_formula(self):
        expected = 360.0 + PHYSICAL_RAIL_DEG
        assert abs(HOLONOMY_VORTEX_DEG - expected) < 1e-10

    def test_holonomy_greater_than_360(self):
        assert HOLONOMY_VORTEX_DEG > 360.0

    def test_holonomy_approx_376_9(self):
        # 360 + 2 × 8.45° ≈ 376.9°
        assert 376.0 < HOLONOMY_VORTEX_DEG < 378.0

    def test_k5_deficit_negative(self):
        # The deficit is a SHORTFALL from ideal — negative
        assert K5_ENTROPY_DEFICIT_DEG < 0

    def test_gravitational_deficit_positive(self):
        assert GRAVITATIONAL_DEFICIT_DEG > 0

    def test_ideal_equals_rail_plus_deficit(self):
        assert abs(IDEAL_FLAT_DEG - PHYSICAL_RAIL_DEG - GRAVITATIONAL_DEFICIT_DEG) < 1e-10

    def test_gravitational_deficit_approx_1_097(self):
        # Should be ≈ 1.097°
        assert 0.8 < GRAVITATIONAL_DEFICIT_DEG < 1.5

    def test_holonomy_vortex_rad_consistent(self):
        assert abs(HOLONOMY_VORTEX_RAD - HOLONOMY_VORTEX_DEG * pi / 180) < 1e-10


class TestHolonomyVortex:
    def setup_method(self):
        self.h = holonomy_vortex()

    def test_required_keys(self):
        for key in ["holonomy_deg", "physical_rail_deg", "arrow_of_time", "interpretation"]:
            assert key in self.h

    def test_holonomy_value(self):
        assert abs(self.h["holonomy_deg"] - HOLONOMY_VORTEX_DEG) < 1e-10

    def test_excess_is_physical_rail(self):
        assert abs(self.h["excess_over_2pi_deg"] - PHYSICAL_RAIL_DEG) < 1e-10

    def test_interpretation_mentions_rail_or_arrow(self):
        interp = self.h["interpretation"].lower()
        assert "rail" in interp or "arrow" in interp

    def test_equation_string(self):
        assert "376" in self.h["equation"]


class TestRGDampingFactor:
    def test_ln_damping_formula(self):
        # η_m = 1/ln(λ/μ_0) for λ > μ_0
        lam = 3.0
        expected = 1.0 / log(3.0)
        assert abs(rg_damping_factor(lam, 1.0) - expected) < 1e-12

    def test_damping_decreases_with_lambda(self):
        # Higher modes → more suppressed
        eta3 = rg_damping_factor(3.0)
        eta5 = rg_damping_factor(5.0)
        eta7 = rg_damping_factor(7.0)
        assert eta3 > eta5 > eta7

    def test_damping_between_0_and_1(self):
        for lam in LAPLACIAN_EIGENVALUES:
            eta = rg_damping_factor(lam)
            assert 0 < eta <= 1.0

    def test_lambda_at_mu0_returns_1(self):
        assert rg_damping_factor(1.0, 1.0) == 1.0

    def test_lambda_below_mu0_returns_1(self):
        assert rg_damping_factor(0.5, 1.0) == 1.0


class TestRGModeTable:
    def setup_method(self):
        self.table = rg_mode_table()

    def test_five_modes(self):
        assert len(self.table) == 5

    def test_all_required_keys(self):
        for row in self.table:
            for key in ["lambda_n", "eta_m", "ir_suppression_pct", "ln_lambda_mu0"]:
                assert key in row

    def test_eigenvalues_correct(self):
        lams = [row["lambda_n"] for row in self.table]
        assert sorted(lams) == sorted(LAPLACIAN_EIGENVALUES)

    def test_monotone_suppression(self):
        supp = [row["ir_suppression_pct"] for row in self.table]
        assert supp == sorted(supp)

    def test_all_suppressed(self):
        for row in self.table:
            assert row["ir_suppression_pct"] >= 0


class TestTotalRGCurvature:
    def test_positive(self):
        assert total_rg_curvature() > 0

    def test_less_than_uncorrected(self):
        # Damped total < N_modes × raw deficit
        raw = len(LAPLACIAN_EIGENVALUES) * GRAVITATIONAL_DEFICIT_RAD
        assert total_rg_curvature() < raw


class TestGravitationalDeficitTriangle:
    def setup_method(self):
        self.t = gravitational_deficit_triangle()

    def test_triangle_adds_up(self):
        # Ideal = Physical Rail + |K5 deficit|
        assert abs(self.t["ideal_flat_deg"] - self.t["physical_rail_deg"]
                   - self.t["gravitational_deficit_deg"]) < 1e-10

    def test_k5_deficit_negative(self):
        assert self.t["k5_entropy_deficit_deg"] < 0

    def test_buckle_is_deficit(self):
        assert abs(self.t["buckle"] - GRAVITATIONAL_DEFICIT_DEG) < 1e-10

    def test_interpretation_mentions_gr(self):
        interp = self.t["interpretation"].lower()
        assert "general relativity" in interp or "gr" in interp

    def test_interpretation_mentions_bilateral(self):
        interp = self.t["interpretation"].lower()
        assert "bilateral" in interp or "buckle" in interp


class TestUVtoIRTransition:
    def setup_method(self):
        self.uv = uv_to_ir_transition()

    def test_required_keys(self):
        for key in ["UV_description", "IR_description", "rg_modes",
                    "G_N_from_deficit", "damping_factor_formula"]:
            assert key in self.uv

    def test_G_N_is_delta_star_squared(self):
        assert abs(self.uv["G_N_from_deficit"] - DELTA_STAR**2) < 1e-14

    def test_five_rg_modes(self):
        assert len(self.uv["rg_modes"]) == 5


class TestTopologySummary:
    def setup_method(self):
        self.s = topology_summary()

    def test_three_panels(self):
        assert "panel_1_holonomy" in self.s
        assert "panel_2_rg_flow" in self.s
        assert "panel_3_deficit" in self.s

    def test_unifying_constant(self):
        assert abs(self.s["unifying_constant"] - DELTA_STAR) < 1e-14

    def test_key_numbers_present(self):
        kn = self.s["key_numbers"]
        assert abs(kn["delta_star"] - DELTA_STAR) < 1e-14
        assert abs(kn["holonomy_deg"] - HOLONOMY_VORTEX_DEG) < 1e-10
        assert kn["k5_deficit_deg"] < 0


class TestASCIIOutput:
    def test_ascii_holonomy_returns_string(self):
        s = ascii_holonomy_vortex()
        assert isinstance(s, str)
        assert "376" in s

    def test_ascii_rg_returns_string(self):
        s = ascii_rg_flow()
        assert isinstance(s, str)
        assert "λ=" in s

    def test_ascii_deficit_returns_string(self):
        s = ascii_deficit_triangle()
        assert isinstance(s, str)
        assert "18" in s    # ideal flat vacuum
        assert "16.9" in s  # physical rail


def test_print_topology_report_runs(capsys):
    print_topology_report()
    captured = capsys.readouterr()
    assert "CATHEDRAL" in captured.out
    assert "376" in captured.out
    assert "λ=" in captured.out
