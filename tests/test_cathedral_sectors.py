"""Tests for the K_4 / A_5 sector assignment — dark sector lives in A_5."""
import numpy as np
import pytest

from urt.cathedral_sectors import (
    K4_A5_decompose,
    sector_power,
    A5_evaporation_trajectory,
    cosmology_via_sector_split,
    predictions_by_sector,
    cathedral_sectors_audit,
    cathedral_sectors_audit_passes,
)


class TestSectorDecomposition:
    def test_decomposition_sums_to_input(self):
        rng = np.random.default_rng(0)
        x = rng.uniform(0, 0.5, 13)
        K4, A5, _ = K4_A5_decompose(x)
        assert np.allclose(K4 + A5, x)

    def test_uniform_is_pure_K4_null_mode(self):
        """A constant field is in the K_4 null mode (λ=0)."""
        x = np.full(13, 0.15)
        sp = sector_power(x)
        # Almost all power in K_4 (the null mode is K_4)
        assert sp["K4_fraction"] > 0.9


class TestCosmologySplit:
    def test_K4_fraction_is_4_over_13(self):
        from urt.shell_closure import N
        c = cosmology_via_sector_split()
        assert c["Omega_m_pred"] == 4 / N

    def test_A5_fraction_is_9_over_13(self):
        from urt.shell_closure import N
        c = cosmology_via_sector_split()
        assert c["Omega_Lambda_pred"] == 9 / N

    def test_sum_is_one(self):
        c = cosmology_via_sector_split()
        assert c["Omega_m_pred"] + c["Omega_Lambda_pred"] == 1.0

    def test_Omega_m_within_5pct_of_Planck(self):
        c = cosmology_via_sector_split()
        assert c["Omega_m_match_pct"] < 5.0

    def test_Omega_Lambda_within_5pct_of_Planck(self):
        c = cosmology_via_sector_split()
        assert c["Omega_Lambda_match_pct"] < 5.0


class TestA5Evaporation:
    def test_A5_power_decreases(self):
        """A_5 power monotonically decreases under URT evolution."""
        traj = A5_evaporation_trajectory(seed=42, max_steps=300)
        a5_powers = [r["A5_power"] for r in traj]
        # Strict monotone decrease (or near-zero by end)
        for i in range(len(a5_powers) - 1):
            assert a5_powers[i+1] <= a5_powers[i] + 1e-6

    def test_A5_fraction_below_1pct_by_300(self):
        traj = A5_evaporation_trajectory(seed=42, max_steps=300)
        last = traj[-1]
        assert last["A5_fraction"] < 0.01

    def test_K4_power_dominates_at_end(self):
        traj = A5_evaporation_trajectory(seed=42, max_steps=300)
        last = traj[-1]
        assert last["K4_fraction"] > 0.99


class TestPredictionsBySector:
    def test_K4_has_visible_sector_predictions(self):
        p = predictions_by_sector()
        K4 = p["K_4_visible_sector"]
        assert any("Gravity" in s for s in K4)
        assert any("sin²θ_W" in s or "Electroweak" in s for s in K4)
        assert any("Higgs" in s for s in K4)

    def test_A5_has_dark_sector_predictions(self):
        p = predictions_by_sector()
        A5 = p["A_5_dark_exhaust_sector"]
        assert any("axion" in s.lower() for s in A5)
        assert any("dark matter" in s.lower() or "WIMP" in s for s in A5)
        assert any("neutrino" in s.lower() for s in A5)
        assert any("Cosmological constant" in s or "dark energy" in s.lower() for s in A5)


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert cathedral_sectors_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = cathedral_sectors_audit()
        assert "Omega_split" in a
        assert "A5_evaporation" in a
        assert "predictions_split" in a
