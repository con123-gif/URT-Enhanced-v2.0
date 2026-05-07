"""Tests for urt/gravity_cathedral.py — Cathedral K4 gravity module."""

import pytest
import numpy as np
from math import pi, sqrt

from urt.gravity_cathedral import (
    G_NEWTON, PLANCK_LENGTH, PLANCK_MASS, AREA_QUANTUM,
    graviton_mode, force_hierarchy, why_gravity_is_weak,
    schwarzschild_radius, horizon_area, bh_entropy, hawking_temperature,
    bh_lifetime, area_quantum, bekenstein_mukhanov_spectrum,
    scrambling_time, page_time, bh_information_summary,
    perihelion_advance_rad_per_orbit, gravitational_lensing_angle,
    gravitational_redshift, gr_test_summary, effective_lagrangian,
    print_gravity_cathedral_report,
)
from urt.shell_closure import DELTA_STAR


class TestGravityCathedralConstants:
    def test_G_newton_equals_delta_star_squared(self):
        assert abs(G_NEWTON - DELTA_STAR ** 2) < 1e-14

    def test_planck_length_equals_delta_star(self):
        assert abs(PLANCK_LENGTH - DELTA_STAR) < 1e-14

    def test_planck_mass_equals_inverse_delta_star(self):
        assert abs(PLANCK_MASS - 1 / DELTA_STAR) < 1e-12

    def test_area_quantum_formula(self):
        expected = 8 * pi * DELTA_STAR ** 3
        assert abs(AREA_QUANTUM - expected) < 1e-14

    def test_area_quantum_positive(self):
        assert AREA_QUANTUM > 0

    def test_area_quantum_small(self):
        # ≈ 0.0807 l_Pl²
        assert 0.07 < AREA_QUANTUM < 0.10


class TestGravitonMode:
    def test_graviton_mode_k_is_zero(self):
        m = graviton_mode()
        assert m["k"] == 0

    def test_graviton_mode_gapless(self):
        m = graviton_mode()
        assert m["gap"] == 0.0

    def test_graviton_mode_coupling_is_G_N(self):
        m = graviton_mode()
        assert abs(m["coupling"] - G_NEWTON) < 1e-14

    def test_graviton_mode_spin_2(self):
        m = graviton_mode()
        assert m["spin"] == 2


class TestForceHierarchy:
    def setup_method(self):
        self.fh = force_hierarchy()

    def test_four_k4_forces_plus_strong(self):
        assert len(self.fh) == 5

    def test_gravity_coupling_is_G_N(self):
        # G_N = δ★² ≈ 0.022 in Planck units
        assert abs(self.fh[0]["coupling"] - G_NEWTON) < 1e-12

    def test_k0_gravity(self):
        assert "gravity" in self.fh[0]["force"]
        assert self.fh[0]["k"] == 0

    def test_k1_electromagnetism(self):
        assert "electromagnetism" in self.fh[1]["force"]
        assert self.fh[1]["k"] == 1

    def test_k4_12_strong(self):
        assert "strong" in self.fh[4]["force"]

    def test_strong_coupling_in_h3_sector(self):
        # H3 sector (k=4..12) carries the strong force
        strong = self.fh[4]
        assert "strong" in strong["force"]
        assert strong["coupling"] > G_NEWTON


class TestWhyGravityIsWeak:
    def setup_method(self):
        self.w = why_gravity_is_weak()

    def test_returns_dict_with_required_keys(self):
        for key in ["G_N", "alpha_EM", "G_N_over_alpha_EM", "explanation"]:
            assert key in self.w

    def test_G_N_is_small(self):
        assert self.w["G_N"] < 0.1

    def test_ratio_is_positive(self):
        # G_N/α_EM ≈ 3 in Planck units — gravity is "weak" only for light particles
        assert self.w["G_N_over_alpha_EM"] > 0

    def test_explanation_is_string(self):
        assert isinstance(self.w["explanation"], str)
        assert "δ★" in self.w["explanation"]


class TestBHThermodynamics:
    def test_schwarzschild_radius_formula(self):
        M = 100.0
        r_s = schwarzschild_radius(M)
        assert abs(r_s - 2 * G_NEWTON * M) < 1e-12

    def test_schwarzschild_scales_linearly_with_mass(self):
        assert abs(schwarzschild_radius(200) - 2 * schwarzschild_radius(100)) < 1e-12

    def test_horizon_area_formula(self):
        M = 50.0
        r_s = schwarzschild_radius(M)
        A_expected = 4 * pi * r_s ** 2
        assert abs(horizon_area(M) - A_expected) < 1e-10

    def test_entropy_formula(self):
        M = 100.0
        S = bh_entropy(M)
        assert abs(S - 4 * pi * G_NEWTON * M ** 2) < 1e-10

    def test_entropy_positive(self):
        assert bh_entropy(1.0) > 0

    def test_hawking_temperature_formula(self):
        M = 100.0
        T = hawking_temperature(M)
        assert abs(T - 1 / (8 * pi * G_NEWTON * M)) < 1e-12

    def test_hawking_temperature_decreases_with_mass(self):
        assert hawking_temperature(10) > hawking_temperature(100)

    def test_entropy_times_temp_gives_energy(self):
        M = 100.0
        S = bh_entropy(M)
        T = hawking_temperature(M)
        # dE = T dS → T × ∂S/∂M × ΔM ≈ M (Planck) approximately
        # Just test S × T ≈ M / (2π) since S = 4π G_N M², T = 1/(8π G_N M)
        assert abs(S * T - M / 2) < 1e-8

    def test_bh_lifetime_cubic_in_mass(self):
        tau1 = bh_lifetime(10.0)
        tau2 = bh_lifetime(20.0)
        assert abs(tau2 / tau1 - 8.0) < 1e-8

    def test_area_quantum_function(self):
        assert abs(area_quantum() - AREA_QUANTUM) < 1e-14

    def test_bekenstein_mukhanov_spectrum(self):
        for n in [1, 5, 10]:
            assert abs(bekenstein_mukhanov_spectrum(n) - n * AREA_QUANTUM) < 1e-12

    def test_scrambling_time_positive(self):
        assert scrambling_time(100.0) > 0

    def test_scrambling_time_grows_with_mass(self):
        assert scrambling_time(200) > scrambling_time(100)

    def test_page_time_half_lifetime(self):
        M = 100.0
        assert abs(page_time(M) - bh_lifetime(M) / 2) < 1e-10


class TestBHInfoSummary:
    def setup_method(self):
        self.bh = bh_information_summary(100.0)

    def test_summary_has_required_keys(self):
        for key in ["r_S", "entropy_S", "T_Hawking", "lifetime",
                    "scrambling_t", "page_time", "area_quanta_n"]:
            assert key in self.bh

    def test_area_quanta_positive(self):
        assert self.bh["area_quanta_n"] > 0

    def test_area_quanta_consistent(self):
        A = self.bh["horizon_area"]
        n = self.bh["area_quanta_n"]
        assert abs(n - A / AREA_QUANTUM) < 1e-8


class TestGRTests:
    def test_perihelion_advance_positive(self):
        adv = perihelion_advance_rad_per_orbit(1.0, 0.387, 0.206)
        assert adv > 0

    def test_gravitational_lensing_positive(self):
        angle = gravitational_lensing_angle(1.0, 10.0)
        assert angle > 0

    def test_gravitational_redshift_positive(self):
        z = gravitational_redshift(100.0, 1000.0)
        assert z > 0

    def test_cathedral_correction_greater_than_gr(self):
        # Cathedral correction factor > 1
        gr = gr_test_summary(1.0)
        assert gr["cathedral_correction_factor"] > 1.0

    def test_gr_summary_has_keys(self):
        gr = gr_test_summary(1.0)
        for key in ["r_S", "r_ISCO", "lensing_angle_rad", "G_N"]:
            assert key in gr


class TestEffectiveLagrangian:
    def setup_method(self):
        self.L = effective_lagrangian()

    def test_lagrangian_has_sectors(self):
        for key in ["L_EH", "L_K4", "L_area"]:
            assert key in self.L

    def test_lagrangian_G_N(self):
        assert abs(self.L["G_N"] - G_NEWTON) < 1e-14

    def test_lagrangian_area_quantum(self):
        assert abs(self.L["area_quantum"] - AREA_QUANTUM) < 1e-14

    def test_force_couplings_in_lagrangian(self):
        fc = self.L["force_couplings"]
        assert "k0_gravity" in fc
        assert "k4_12_strong" in fc


def test_print_gravity_report_runs(capsys):
    print_gravity_cathedral_report(M_demo=1e2)
    captured = capsys.readouterr()
    assert "G_N" in captured.out
    assert "δ★" in captured.out or "delta" in captured.out.lower()
