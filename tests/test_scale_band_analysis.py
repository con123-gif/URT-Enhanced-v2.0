"""Tests for urt.scale_band_analysis — Δ is the natural Cathedral
expression spacing AND framework formulas are tail-outliers of it."""
import math
import statistics

import pytest

from urt.scale_band_analysis import (
    DELTA, GAMMA, DELTA_STAR, DELTA_CL,
    nearest_compound_rel_err,
    physical_observable_nearest_distances,
    random_target_nearest_distances,
    framework_chosen_distances,
    scale_band_summary,
    scale_band_audit_passes,
)


# ── Cathedral scale constants ─────────────────────────────────────────────

def test_delta_star_closed_form():
    """δ★ = (1−γ)·π/(N·φ)."""
    phi = (1 + math.sqrt(5)) / 2
    expected = (1 - 1/81) * math.pi / (13 * phi)
    assert DELTA_STAR == pytest.approx(expected, rel=1e-15)


def test_delta_cl_is_3_over_20():
    assert DELTA_CL == 3 / 20


def test_delta_gap_is_about_0_25_percent():
    """Δ = δ_cl − δ★ ≈ 0.249%."""
    assert DELTA == pytest.approx(DELTA_CL - DELTA_STAR, rel=1e-15)
    assert 0.0024 < DELTA < 0.0026


def test_gamma_is_1_over_81():
    """γ = D^{-(D+1)} = 1/81."""
    assert GAMMA == pytest.approx(1/81, rel=1e-15)


def test_gamma_is_about_5_times_delta():
    """γ ≈ 5·Δ — the two natural scales differ by a factor of ~5."""
    assert 4 < GAMMA / DELTA < 6


# ── Density of Cathedral expressions ──────────────────────────────────────

def test_nearest_compound_for_137_is_exactly_137():
    """The depth-3 enumeration contains 137 exactly (via e.g. q·E−N)."""
    rel = nearest_compound_rel_err(137.0)
    assert rel == 0.0


def test_nearest_compound_for_197_is_within_0_1_percent():
    """δ_CP target — near-misses inside 0.1% but no exact integer at depth 3."""
    rel = nearest_compound_rel_err(197.0)
    assert 0 < rel < 0.001


def test_nearest_compound_for_zero_is_finite():
    """Edge case: target = 0 falls back to absolute distance."""
    # Just verifying it doesn't raise.
    rel = nearest_compound_rel_err(0.0)
    assert math.isfinite(rel)


# ── Physical-observable distances ─────────────────────────────────────────

def test_physical_distances_include_main_observables():
    rows = physical_observable_nearest_distances()
    names = {n for n, _, _ in rows}
    for required in {"1/α", "δ_CP°", "n_s", "sin²θ_W", "Ω_m"}:
        assert required in names


def test_physical_distances_rel_errs_are_finite_and_positive():
    rows = physical_observable_nearest_distances()
    for _name, _target, rel in rows:
        assert math.isfinite(rel)
        assert rel >= 0


def test_physical_distances_mostly_within_2_delta():
    """For most physical observables, nearest Cathedral compound is < 2·Δ.
    (r tensor is an outlier at ~9·Δ because its magnitude is tiny.)"""
    rows = physical_observable_nearest_distances()
    within_2_delta = sum(1 for _n, _t, r in rows if r < 2 * DELTA)
    assert within_2_delta >= len(rows) - 1   # all but at most one outlier


# ── Random-target density ─────────────────────────────────────────────────

def test_random_density_is_deterministic_with_seed():
    """Same seed gives the same density values."""
    a = random_target_nearest_distances(seed=42)
    b = random_target_nearest_distances(seed=42)
    assert a == b


def test_random_density_changes_with_seed():
    """Different seeds give different samples."""
    a = random_target_nearest_distances(seed=42)
    b = random_target_nearest_distances(seed=1)
    assert a != b


def test_random_density_median_is_about_half_delta():
    """The natural Cathedral expression density ~0.5·Δ."""
    rand = random_target_nearest_distances(seed=42)
    median = statistics.median(rand)
    assert 0.3 * DELTA <= median <= 0.7 * DELTA


def test_random_density_mean_within_two_delta():
    """Mean rel-err of nearest compound to random target stays small."""
    rand = random_target_nearest_distances(seed=42)
    mean = statistics.mean(rand)
    assert mean < 2 * DELTA


# ── Framework's chosen formulas are tail-outliers ─────────────────────────

def test_framework_distances_all_below_delta():
    """Framework's chosen formulas all hit within Δ of observation."""
    for name, rel in framework_chosen_distances():
        assert rel < DELTA, f"{name}: rel={rel*100:.4f}% > Δ"


def test_framework_distances_mostly_below_delta_over_50():
    """Most framework formulas hit within Δ/50 (≈ 0.005%)."""
    rels = [rel for _n, rel in framework_chosen_distances()]
    tight = sum(1 for r in rels if r < DELTA / 50)
    # At least 5 of 7 should be sub-Δ/50.
    assert tight >= 5


def test_framework_median_is_much_tighter_than_random_density():
    """The framework's median rel-err is at least 30× tighter than the
    natural Cathedral density.  Empirically the ratio is ~100×."""
    s = scale_band_summary()
    assert s["density_over_framework_ratio"] > 30.0


# ── Summary structure ─────────────────────────────────────────────────────

def test_summary_contains_required_keys():
    s = scale_band_summary()
    required = {
        "delta_gap", "gamma",
        "median_random_target_density",
        "median_physical_target_density",
        "median_framework_rel_err",
        "density_over_framework_ratio",
        "random_density_as_Δ", "phys_density_as_Δ", "framework_as_Δ",
        "delta_over_random_density",
    }
    assert required.issubset(set(s.keys()))


def test_summary_values_are_finite():
    s = scale_band_summary()
    for k, v in s.items():
        assert isinstance(v, (int, float))
        assert math.isfinite(v)


def test_summary_framework_is_tighter_than_density():
    """Density > framework rel-err must hold strictly."""
    s = scale_band_summary()
    assert s["median_random_target_density"] > s["median_framework_rel_err"]


# ── Audit gate ────────────────────────────────────────────────────────────

def test_audit_passes_default():
    """Empirical claim: density ≈ 0.5·Δ AND framework ≥ 30× tighter."""
    assert scale_band_audit_passes()


def test_audit_passes_strict_50x():
    """At 50× threshold the audit still passes (empirical ratio is ~100×)."""
    assert scale_band_audit_passes(
        framework_must_be_tighter_than_density_by=50.0
    )


def test_audit_fails_at_unreasonable_threshold():
    """At 10000× threshold the audit must fail — sanity check."""
    assert not scale_band_audit_passes(
        framework_must_be_tighter_than_density_by=10000.0
    )


def test_audit_fails_if_density_band_is_too_tight():
    """If you ask density to be 0.99-1.01·Δ exactly, it fails — sanity."""
    assert not scale_band_audit_passes(
        expected_density_in_units_of_delta=(0.99, 1.01)
    )
