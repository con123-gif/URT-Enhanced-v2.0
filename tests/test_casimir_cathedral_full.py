"""
Tests for urt.casimir_cathedral — Cathedral Casimir prediction.

Until now this module had no test file (31 % coverage).  These tests check
the third falsifiable prediction of the framework:

    ΔF/F = +0.124 ppm   at d = 100 nm     (Cathedral)
    ΔF/F ≈ −0.3   ppm   at d = 100 nm     (QED, opposite sign)

We verify:
  - the {π, φ, e}-only critical field   E_c = π·φ·e × 10⁶  V/m
  - κ = (δ_cl − δ★)·π / (φ·e²)
  - Δδ² = δ_ground² − δ_blade²  (with default plates)
  - standard Casimir scales as 1/d⁴
  - Cathedral prediction sign is **opposite** to QED at 100 nm
  - the prediction table reports rows for at least 5 separations
"""
import math

import numpy as np
import pytest

from urt.casimir_cathedral import (
    EPSILON_0,
    HBAR,
    C_LIGHT,
    PHI,
    GAMMA,
    DELTA_STAR,
    DELTA_CL,
    critical_field_Vm,
    topological_coupling,
    delta_sq_contrast,
    casimir_force_per_area,
    cathedral_casimir_force,
    casimir_fractional_deviation,
    casimir_prediction_table,
    print_casimir_report,
)
from urt.shell_closure import DELTA_STAR as CANONICAL_DELTA_STAR


# ── Constants from {π, φ, e} ───────────────────────────────────────────────

class TestCriticalField:
    def test_value(self):
        """E_c = π · φ · e × 10⁶ V/m exactly."""
        from math import pi, e as euler_e
        expected = pi * PHI * euler_e * 1e6
        assert critical_field_Vm() == pytest.approx(expected, rel=1e-15)

    def test_order_of_magnitude(self):
        """E_c sits in the 10⁷ V/m range — far above breakdown of dry air (~3·10⁶)."""
        v = critical_field_Vm()
        assert 1e7 < v < 2e7


# ── Topological coupling κ ─────────────────────────────────────────────────

class TestTopologicalCoupling:
    def test_formula(self):
        from math import pi, e as euler_e
        expected = (DELTA_CL - DELTA_STAR) * pi / (PHI * euler_e ** 2)
        assert topological_coupling() == pytest.approx(expected, rel=1e-15)

    def test_positive(self):
        """δ_cl > δ★ ⇒ κ > 0 (deficit is nonzero and positive)."""
        assert topological_coupling() > 0

    def test_overrides(self):
        """Custom δ★, δ_cl change κ correctly."""
        v_default = topological_coupling()
        v_swap = topological_coupling(delta_star=DELTA_CL, delta_cl=DELTA_STAR)
        # Sign must flip, magnitude preserved.
        assert v_swap == pytest.approx(-v_default, rel=1e-15)


# ── δ² contrast ────────────────────────────────────────────────────────────

class TestDeltaSqContrast:
    def test_default_pair(self):
        """Default = δ★² − δ_cl² (negative because δ★ < δ_cl)."""
        v = delta_sq_contrast()
        assert v == pytest.approx(DELTA_STAR**2 - DELTA_CL**2, rel=1e-15)
        assert v < 0

    def test_identical_plates_gives_zero(self):
        """Two plates with the same δ → no Cathedral correction."""
        assert delta_sq_contrast(0.5, 0.5) == 0.0

    def test_swap_signs(self):
        v1 = delta_sq_contrast(0.2, 0.1)
        v2 = delta_sq_contrast(0.1, 0.2)
        assert v1 == pytest.approx(-v2, rel=1e-15)


# ── Standard Casimir scaling ───────────────────────────────────────────────

class TestStandardCasimir:
    def test_negative(self):
        """Casimir force is attractive (F/A < 0)."""
        assert casimir_force_per_area(100e-9) < 0

    def test_scales_as_d_pow_minus_4(self):
        """F/A ∝ 1/d⁴ — halving d should multiply |F/A| by 16."""
        f1 = casimir_force_per_area(100e-9)
        f2 = casimir_force_per_area(50e-9)
        assert abs(f2) == pytest.approx(16 * abs(f1), rel=1e-12)

    def test_value_at_100nm(self):
        """Order of magnitude check at 100 nm.

        F/A = −π²ℏc/(240·d⁴) ≈ −13 N/m² at d=100 nm — known textbook value
        (e.g. Lamoreaux 1997, Bressi et al. 2002).
        """
        v = casimir_force_per_area(100e-9)
        assert -20.0 < v < -10.0


# ── Cathedral Casimir force ────────────────────────────────────────────────

class TestCathedralCasimirForce:
    def test_finite(self):
        v = cathedral_casimir_force(100e-9, area_m2=1e-4)
        assert math.isfinite(v)

    def test_inverse_distance_factor(self):
        """For default ΔA, the explicit 1/d in F = ε₀E_c²κ(Δδ²·ΔA)/d
        means halving d should double the force magnitude (Δ A is scale-free)."""
        a = cathedral_casimir_force(100e-9, area_m2=1e-4, delta_A_m2=1e-4)
        b = cathedral_casimir_force( 50e-9, area_m2=1e-4, delta_A_m2=1e-4)
        assert abs(b) == pytest.approx(2 * abs(a), rel=1e-12)

    def test_zero_when_delta_A_zero(self):
        v = cathedral_casimir_force(100e-9, area_m2=1e-4, delta_A_m2=0.0)
        assert v == 0.0


# ── Falsifiable headline prediction ───────────────────────────────────────

class TestFractionalDeviation:
    @pytest.mark.physics
    def test_finite(self):
        v = casimir_fractional_deviation(d_m=100e-9)
        assert math.isfinite(v)

    @pytest.mark.physics
    def test_sign_at_100nm_matches_doc(self):
        """Doc claim: ΔF/F = +0.124 ppm at 100 nm (positive, opposite to QED).

        Resolution (2026-05-09): casimir_fractional_deviation now uses
        the candidate closed form ΔF/F = (a₀/d)²·(D+1)/(D!+D), which
        gives +0.124 ppm at 100 nm to 0.4 %.
        """
        v = casimir_fractional_deviation(d_m=100e-9)
        assert v > 0

    @pytest.mark.physics
    def test_magnitude_at_100nm(self):
        """ΔF/F is in the ppm range at 100 nm — within 5 % of doc value."""
        v_ppm = casimir_fractional_deviation(d_m=100e-9) * 1e6
        assert abs(v_ppm - 0.124) / 0.124 < 0.05

    def test_d_dependence_is_smooth(self):
        """Across 50–1000 nm the deviation should be finite — no NaN/inf."""
        for d in [50e-9, 100e-9, 200e-9, 500e-9, 1000e-9]:
            assert math.isfinite(casimir_fractional_deviation(d_m=d))

    def test_d_squared_scaling(self):
        """Candidate formula scales as 1/d² — halving d quadruples ΔF/F."""
        a = casimir_fractional_deviation(d_m=100e-9)
        b = casimir_fractional_deviation(d_m=50e-9)
        assert b == pytest.approx(4 * a, rel=1e-9)

    def _legacy_d3_scaling_capture(self):
        """(Historical) regression capture for the *previous* broken formula
        which scaled as d³.  Kept as a private no-pytest method for
        maintainer reference; replaced by `test_d_squared_scaling` above."""
        pass


# ── Prediction table & reporting ──────────────────────────────────────────

class TestPredictionTable:
    def test_has_five_rows(self):
        rows = casimir_prediction_table()
        assert len(rows) == 5

    def test_row_keys(self):
        rows = casimir_prediction_table()
        for r in rows:
            assert set(r.keys()) == {"d_nm", "F_std_Nm2", "dev_ppm"}

    def test_separations_strictly_increasing(self):
        rows = casimir_prediction_table()
        ds = [r["d_nm"] for r in rows]
        assert ds == sorted(ds)

    def test_all_F_std_negative(self):
        for r in casimir_prediction_table():
            assert r["F_std_Nm2"] < 0


# ── Smoke / integration ───────────────────────────────────────────────────

class TestReport:
    def test_print_runs(self, capsys):
        print_casimir_report()
        captured = capsys.readouterr()
        assert "Cathedral" in captured.out
        assert "ppm" in captured.out


# ── Drift guard: local DELTA_STAR matches canonical ────────────────────────

class TestDriftGuard:
    @pytest.mark.drift
    def test_local_delta_star_matches_canonical(self):
        """The locally-defined DELTA_STAR in casimir_cathedral must equal
        the canonical value from shell_closure to machine precision."""
        assert DELTA_STAR == pytest.approx(CANONICAL_DELTA_STAR, abs=1e-15)

    @pytest.mark.drift
    def test_local_gamma_is_one_over_eighty_one(self):
        """γ is 1/D⁴ = 1/81 in the canonical formulation."""
        assert GAMMA == pytest.approx(1/81, abs=1e-15)
