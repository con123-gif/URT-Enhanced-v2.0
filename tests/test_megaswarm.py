"""Tests for urt/megaswarm.py — Hierarchical icosahedral megaswarm."""

import pytest
from math import log, sqrt, ceil, isfinite
from urt.megaswarm import (
    swarm_level, optimal_k_for_target, plasma_coil_formation,
    drone_fleet, megaswarm_summary, print_megaswarm_report,
    KAPPA, LAMBDA_2, CONSENSUS_FRACTION, BANDWIDTH_BASE,
    RADIUS_GROWTH_FACTOR, K_MAX_PRACTICAL, SWARM_SIZES,
)
from urt.shell_closure import DELTA_STAR, N, D, gamma


# ══════════════════════════════════════════════════════════════════════════════
#  MODULE-LEVEL CONSTANT TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestMegaswarmConstants:
    def test_kappa_formula(self):
        expected = 1.0 - float(D) / float(N)
        assert abs(KAPPA - expected) < 1e-14

    def test_kappa_less_than_one(self):
        assert KAPPA < 1.0

    def test_kappa_positive(self):
        assert KAPPA > 0.0

    def test_kappa_value(self):
        assert abs(KAPPA - 10.0 / 13.0) < 1e-14

    def test_lambda2_equals_D(self):
        assert LAMBDA_2 == float(D)   # spectral gap = spatial dimension

    def test_consensus_fraction(self):
        expected = (N - 1) / N
        assert abs(CONSENSUS_FRACTION - expected) < 1e-14

    def test_bandwidth_base_equals_delta_star(self):
        assert abs(BANDWIDTH_BASE - DELTA_STAR) < 1e-14

    def test_radius_growth_factor(self):
        expected = N ** (1.0 / 3.0)
        assert abs(RADIUS_GROWTH_FACTOR - expected) < 1e-12

    def test_k_max_practical_reasonable(self):
        assert 5 <= K_MAX_PRACTICAL <= 30

    def test_swarm_sizes_dict(self):
        for k in range(1, 8):
            assert SWARM_SIZES[k] == N ** k


# ══════════════════════════════════════════════════════════════════════════════
#  SWARM_LEVEL FUNCTION TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestSwarmLevel:
    def test_k1_n_agents(self):
        lv = swarm_level(1)
        assert lv["n_agents"] == N

    def test_k2_n_agents(self):
        lv = swarm_level(2)
        assert lv["n_agents"] == N ** 2  # 169

    def test_k3_n_agents(self):
        lv = swarm_level(3)
        assert lv["n_agents"] == N ** 3  # 2197

    def test_k4_n_agents(self):
        lv = swarm_level(4)
        assert lv["n_agents"] == N ** 4  # 28561

    def test_k5_n_agents(self):
        lv = swarm_level(5)
        assert lv["n_agents"] == N ** 5  # 371293

    def test_consensus_time_formula_k1(self):
        lv = swarm_level(1)
        expected = 1 * log(N) / (1.0 - KAPPA)
        assert abs(lv["consensus_time"] - expected) < 1e-12

    def test_consensus_time_scales_linearly_with_k(self):
        lv1 = swarm_level(1)
        lv2 = swarm_level(2)
        assert abs(lv2["consensus_time"] / lv1["consensus_time"] - 2.0) < 1e-12

    def test_bandwidth_scales_geometrically(self):
        lv1 = swarm_level(1)
        lv2 = swarm_level(2)
        assert abs(lv2["bandwidth_ratio"] / lv1["bandwidth_ratio"] - N) < 1e-10

    def test_energy_fraction_formula(self):
        for k in [1, 2, 3, 4]:
            lv = swarm_level(k)
            expected = KAPPA ** k
            assert abs(lv["energy_fraction"] - expected) < 1e-14

    def test_energy_decreases_with_k(self):
        energies = [swarm_level(k)["energy_fraction"] for k in range(1, 5)]
        assert all(energies[i] > energies[i + 1] for i in range(len(energies) - 1))

    def test_formation_diameter_formula(self):
        for k in [1, 2, 3]:
            lv = swarm_level(k)
            expected = N ** (k / 3.0)
            assert abs(lv["formation_diameter"] - expected) < 1e-12

    def test_kappa_in_result(self):
        lv = swarm_level(1)
        assert abs(lv["kappa"] - KAPPA) < 1e-14

    def test_N_per_cluster(self):
        for k in [1, 2, 3]:
            assert swarm_level(k)["N_per_cluster"] == N

    def test_all_values_finite(self):
        for k in [1, 2, 3, 4, 5]:
            lv = swarm_level(k)
            for key, val in lv.items():
                if isinstance(val, float):
                    assert isfinite(val), f"k={k} {key}={val}"


# ══════════════════════════════════════════════════════════════════════════════
#  OPTIMAL_K FUNCTION TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestOptimalK:
    def test_k_for_13(self):
        assert optimal_k_for_target(13) == 1

    def test_k_for_14(self):
        assert optimal_k_for_target(14) == 2

    def test_k_for_169(self):
        assert optimal_k_for_target(169) == 2

    def test_k_for_170(self):
        assert optimal_k_for_target(170) == 3

    def test_k_for_28561(self):
        assert optimal_k_for_target(28561) == 4

    def test_k_for_1(self):
        assert optimal_k_for_target(1) == 1

    def test_k_result_satisfies_bound(self):
        for n_target in [13, 100, 1000, 10000, 371293]:
            k = optimal_k_for_target(n_target)
            assert N ** k >= n_target


# ══════════════════════════════════════════════════════════════════════════════
#  PLASMA COIL FORMATION TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestPlasmaCoilFormation:
    def setup_method(self):
        self.c = plasma_coil_formation(28561)

    def test_k_level(self):
        assert self.c["k_level"] == 4

    def test_n_coils_actual(self):
        assert self.c["n_coils_actual"] == N ** 4

    def test_coil_spacing_positive(self):
        assert self.c["coil_spacing_m"] > 0

    def test_coil_spacing_formula(self):
        expected = DELTA_STAR * 6.0
        assert abs(self.c["coil_spacing_m"] - expected) < 1e-12

    def test_plasma_volume_positive(self):
        assert self.c["plasma_volume_m3"] > 0

    def test_field_uniformity_formula(self):
        expected = DELTA_STAR ** 2 / N
        assert abs(self.c["field_uniformity_dB"] - expected) < 1e-14


# ══════════════════════════════════════════════════════════════════════════════
#  DRONE FLEET TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestDroneFleet:
    def setup_method(self):
        self.d = drone_fleet(371293)

    def test_k_level(self):
        assert self.d["k_level"] == 5

    def test_n_drones_actual(self):
        assert self.d["n_drones_actual"] == N ** 5

    def test_hierarchy_length(self):
        assert len(self.d["hierarchy"]) == 5

    def test_hierarchy_levels_correct(self):
        for i, lv in enumerate(self.d["hierarchy"], start=1):
            assert lv["k"] == i

    def test_consensus_fraction(self):
        assert abs(self.d["consensus_fraction"] - CONSENSUS_FRACTION) < 1e-14


# ══════════════════════════════════════════════════════════════════════════════
#  MEGASWARM SUMMARY TESTS
# ══════════════════════════════════════════════════════════════════════════════

class TestMegaswarmSummary:
    def test_summary_has_all_keys(self):
        s = megaswarm_summary(k_max=4)
        for key in ["k_max", "levels", "KAPPA", "spectral_gap_lambda2",
                    "radius_growth_factor", "N_per_cluster"]:
            assert key in s

    def test_kappa_formula_in_summary(self):
        s = megaswarm_summary(k_max=3)
        assert abs(s["KAPPA"] - KAPPA) < 1e-14

    def test_spectral_gap_equals_D(self):
        s = megaswarm_summary(k_max=3)
        assert s["spectral_gap_lambda2"] == float(D)

    def test_levels_count(self):
        s = megaswarm_summary(k_max=5)
        assert len(s["levels"]) == 5

    def test_print_runs(self, capsys):
        print_megaswarm_report()
        captured = capsys.readouterr()
        assert "MEGASWARM" in captured.out
        # The report uses κ symbol or "contraction rate"
        assert "contraction" in captured.out or "10/13" in captured.out or str(round(KAPPA, 4)) in captured.out
