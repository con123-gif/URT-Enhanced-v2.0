"""Tests for urt/neutrinos.py — Cathedral neutrino predictions."""

import pytest
import numpy as np
from math import pi, sqrt, degrees, asin

from urt.neutrinos import (
    DELTA_M21_SQ, DELTA_M31_SQ,
    SIN2_THETA12, SIN2_THETA13, SIN2_THETA23,
    THETA12_DEG, THETA13_DEG, THETA23_DEG,
    DELTA_CP_DEG, M1_MEV,
    neutrino_masses_eV, sum_neutrino_masses_eV, sum_neutrino_masses_meV,
    effective_majorana_mass, pmns_matrix, jarlskog_invariant,
    cosmological_mass_bound, neutrino_mixing_summary,
    print_neutrino_report,
)
from urt.shell_closure import DELTA_STAR, N


class TestNeutrinoOscillationInputs:
    def test_delta_m21_sq_positive(self):
        assert DELTA_M21_SQ > 0

    def test_delta_m31_sq_positive(self):
        assert DELTA_M31_SQ > 0

    def test_normal_ordering(self):
        # m₃ > m₂ > m₁ requires Δm²₃₁ > Δm²₂₁
        assert DELTA_M31_SQ > DELTA_M21_SQ

    def test_delta_m21_in_pdg_range(self):
        # PDG: (7.42 ± 0.21) × 10⁻⁵ eV²
        assert 6.5e-5 < DELTA_M21_SQ < 8.5e-5

    def test_delta_m31_in_pdg_range(self):
        # PDG: (2.515 ± 0.028) × 10⁻³ eV²
        assert 2.3e-3 < DELTA_M31_SQ < 2.7e-3


class TestPMNSAngles:
    def test_sin2_theta12_range(self):
        # PDG: 0.307 ± 0.013
        assert 0.15 < SIN2_THETA12 < 0.40

    def test_sin2_theta13_close_to_delta_star_sq(self):
        # Cathedral: sin²θ₁₃ = δ★²
        assert abs(SIN2_THETA13 - DELTA_STAR ** 2) < 1e-12

    def test_sin2_theta13_in_pdg_range(self):
        # PDG: 0.0220 ± 0.0007
        assert 0.018 < SIN2_THETA13 < 0.028

    def test_sin2_theta23_upper_octant(self):
        # Cathedral: 32/59 > 0.5 (upper octant)
        assert SIN2_THETA23 > 0.5

    def test_sin2_theta23_value(self):
        assert abs(SIN2_THETA23 - 32 / 59) < 1e-12

    def test_sin2_theta23_in_pdg_range(self):
        # PDG: 0.545 ± 0.020
        assert 0.46 < SIN2_THETA23 < 0.65

    def test_theta12_in_degrees_range(self):
        # ≈ 28°
        assert 20 < THETA12_DEG < 40

    def test_theta13_in_degrees_range(self):
        # ≈ 8.5°
        assert 6 < THETA13_DEG < 11

    def test_theta23_in_degrees_range(self):
        # ≈ 47.5° (upper octant)
        assert 40 < THETA23_DEG < 55

    def test_delta_cp_third_quadrant(self):
        # Cathedral: δ_CP = 208° (third quadrant: 180°..270°)
        assert 180 < DELTA_CP_DEG < 270

    def test_delta_cp_value(self):
        assert abs(DELTA_CP_DEG - 208) < 1


class TestNeutrinoMasses:
    def test_masses_return_three_values(self):
        m1, m2, m3 = neutrino_masses_eV()
        assert m1 > 0
        assert m2 > m1
        assert m3 > m2

    def test_normal_ordering(self):
        m1, m2, m3 = neutrino_masses_eV()
        assert m3 > m2 > m1

    def test_delta_m21_sq_satisfied(self):
        m1, m2, m3 = neutrino_masses_eV()
        assert abs(m2**2 - m1**2 - DELTA_M21_SQ) < 1e-10

    def test_delta_m31_sq_satisfied(self):
        m1, m2, m3 = neutrino_masses_eV()
        assert abs(m3**2 - m1**2 - DELTA_M31_SQ) < 1e-10

    def test_sum_meV_around_60(self):
        # v6 prediction: Σm_ν ≈ 60.3 meV
        s = sum_neutrino_masses_meV()
        assert 55 < s < 70

    def test_sum_below_planck_bound(self):
        # Planck 2018: Σm_ν < 120 meV
        s = sum_neutrino_masses_meV()
        assert s < 120

    def test_sum_ev_vs_mev_consistent(self):
        s_ev = sum_neutrino_masses_eV()
        s_mev = sum_neutrino_masses_meV()
        assert abs(s_mev - s_ev * 1e3) < 1e-10

    def test_m1_very_small(self):
        # m₁ ≈ 1.3 meV
        m1, _, _ = neutrino_masses_eV()
        assert m1 < 0.01   # < 10 meV


class TestMajoranaMass:
    def test_effective_majorana_mass_positive(self):
        m_bb = effective_majorana_mass()
        assert m_bb >= 0

    def test_effective_majorana_mass_small(self):
        # Normal ordering: |m_ββ| < 10 meV
        m_bb = effective_majorana_mass()
        assert m_bb < 0.02   # < 20 meV = 0.020 eV


class TestPMNSMatrix:
    def setup_method(self):
        self.U = pmns_matrix()

    def test_pmns_shape(self):
        assert self.U.shape == (3, 3)

    def test_pmns_is_unitary(self):
        # U†U = I
        product = self.U.conj().T @ self.U
        assert np.allclose(product, np.eye(3), atol=1e-12)

    def test_pmns_rows_normalised(self):
        for i in range(3):
            norm = np.sum(np.abs(self.U[i]) ** 2)
            assert abs(norm - 1.0) < 1e-12

    def test_pmns_columns_normalised(self):
        for j in range(3):
            norm = np.sum(np.abs(self.U[:, j]) ** 2)
            assert abs(norm - 1.0) < 1e-12

    def test_ue3_encodes_theta13(self):
        # |U_e3|² = sin²θ₁₃
        assert abs(abs(self.U[0, 2]) ** 2 - SIN2_THETA13) < 1e-10


class TestJarlskog:
    def test_jarlskog_real_float(self):
        J = jarlskog_invariant()
        assert isinstance(J, float)

    def test_jarlskog_nonzero(self):
        # δ_CP ≠ 0 implies J ≠ 0
        J = jarlskog_invariant()
        assert abs(J) > 1e-6

    def test_jarlskog_magnitude_range(self):
        # |J| < 1/6√3 ≈ 0.0962 (absolute maximum)
        J = jarlskog_invariant()
        assert abs(J) < 0.1


class TestCosmologicalBound:
    def setup_method(self):
        self.c = cosmological_mass_bound()

    def test_sum_in_expected_range(self):
        assert 50 < self.c["sum_meV"] < 80

    def test_below_planck_bound(self):
        assert self.c["sum_meV"] < self.c["planck_bound_meV"]

    def test_fraction_less_than_one(self):
        assert self.c["fraction_of_bound"] < 1.0

    def test_normal_ordering(self):
        assert self.c["ordering"] == "normal"

    def test_m3_largest(self):
        assert self.c["m3_meV"] > self.c["m2_meV"] > self.c["m1_meV"]


class TestNeutrinoMixingSummary:
    def setup_method(self):
        self.s = neutrino_mixing_summary()

    def test_summary_keys(self):
        for key in ["sin2_theta12", "sin2_theta23", "delta_CP_deg",
                    "sum_meV", "ordering", "octant_theta23"]:
            assert key in self.s

    def test_upper_octant_mentioned(self):
        assert "upper" in self.s["octant_theta23"].lower()

    def test_normal_ordering(self):
        assert "normal" in self.s["ordering"]


def test_print_neutrino_report_runs(capsys):
    print_neutrino_report()
    captured = capsys.readouterr()
    assert "PMNS" in captured.out
    assert "meV" in captured.out
