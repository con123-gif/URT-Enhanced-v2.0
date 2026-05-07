"""Tests for urt/dark_matter.py — Cathedral dark matter candidates."""

import pytest
from math import pi
from urt.dark_matter import (
    axion_dm, sterile_neutrino_dm, wimp_dm, dm_budget, dark_matter_summary,
    print_dm_report,
    M_AXION_UEV, M_STERILE_KEV, M_WIMP_GEV, SIN2_2THETA_DW,
    SIGMA_SI_CM2, OMEGA_WIMP_H2, OMEGA_AXION_H2, AXION_EN_RATIO,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, q, gamma


class TestAxionCandidate:
    def setup_method(self):
        self.a = axion_dm()

    def test_mass_reasonable(self):
        assert 1 < self.a["mass_ueV"] < 1000  # in μeV range

    def test_mass_close_to_58ueV(self):
        assert 40 < self.a["mass_ueV"] < 100  # Cathedral target: ~58-60 μeV

    def test_EN_ratio_formula(self):
        assert abs(AXION_EN_RATIO - (G - D) / (D + 1)) < 1e-12
        assert abs(AXION_EN_RATIO - 57/4) < 1e-12

    def test_theta_misalign_formula(self):
        assert abs(self.a["theta_misalign"] - (pi - DELTA_STAR)) < 1e-14

    def test_detection_band(self):
        lo, hi = self.a["detection_band_ueV"]
        assert 5 < lo < 50
        assert hi > 50

    def test_sector_assignment(self):
        assert "k=12" in self.a["sector"]


class TestSterileNeutrinoCandidate:
    def setup_method(self):
        self.s = sterile_neutrino_dm()

    def test_mass_formula(self):
        expected = gamma**2 * 938.272 * 1e3  # keV
        assert abs(M_STERILE_KEV - expected) < 0.01

    def test_mass_range(self):
        assert 50 < M_STERILE_KEV < 500  # keV range

    def test_mixing_formula(self):
        expected = DELTA_STAR**2 / N
        assert abs(SIN2_2THETA_DW - expected) < 1e-14

    def test_xray_energy(self):
        assert abs(self.s["E_xray_keV"] - M_STERILE_KEV / 2) < 1e-10

    def test_sector_assignment(self):
        assert "k=11" in self.s["sector"]


class TestWIMPCandidate:
    def setup_method(self):
        self.w = wimp_dm()

    def test_mass_formula(self):
        expected = DELTA_STAR * 91.1876  # δ★ × m_Z
        assert abs(M_WIMP_GEV - expected) < 1e-8

    def test_mass_range(self):
        assert 10 < M_WIMP_GEV < 20  # ~13.5 GeV

    def test_sigma_SI_formula(self):
        expected = DELTA_STAR**4 / (pi * M_WIMP_GEV**2)
        assert abs(SIGMA_SI_CM2 - expected * (0.197e-13)**2) < 1e-40

    def test_sigma_SI_small(self):
        assert SIGMA_SI_CM2 < 1e-30  # well below current LZ bounds

    def test_sector_assignment(self):
        assert "k=9" in self.w["sector"] or "9,10" in self.w["sector"]


class TestDMBudget:
    def setup_method(self):
        self.b = dm_budget()

    def test_three_candidates(self):
        assert len(self.b["three_candidates"]) == 3

    def test_axion_in_budget(self):
        assert "Omega_h2" in self.b["axion"]

    def test_sterile_in_budget(self):
        assert "Omega_h2" in self.b["sterile"]

    def test_wimp_in_budget(self):
        assert "Omega_h2" in self.b["wimp"]

    def test_D3_principle(self):
        # The budget has a separate 'key' or 'note' field describing D=3
        result = dark_matter_summary()
        assert "D=3" in result.get("key", "") or "3 DM" in result.get("key", "") or "D=3" in result.get("principle", "")


class TestDMSummary:
    def test_returns_all(self):
        result = dark_matter_summary()
        for k in ["axion", "sterile", "wimp", "budget"]:
            assert k in result

    def test_principle(self):
        result = dark_matter_summary()
        assert "K4" in result.get("principle", "") or "H3" in result.get("principle", "")


def test_print_dm_report_runs(capsys):
    print_dm_report()
    out = capsys.readouterr().out
    assert "DARK MATTER" in out
    assert "axion" in out.lower() or "Axion" in out
    assert "WIMP" in out
