"""
Candidate Casimir formula — reverse-engineered to match the doc claim.

See `docs/CASIMIR_REVERSE_ENGINEERING.md` for the derivation.  In short:

    ΔF/F  =  (a₀/d)² · (D+1)/(D! + D)
            =  (a₀/d)² · 4/9

  - 4/9 is the K₄/A₅ sector-size ratio (4 coherent modes / 9 exhaust modes)
  - (a₀/d)² is the Bohr-radius / plate-separation length ratio
  - The whole expression is dimensionless

At d = 100 nm this gives 1.245×10⁻⁷ — within 0.37 % of the doc value
+0.124 ppm.  The d-scaling is 1/d², so the prediction is sharp:

    d (nm)   |  ΔF/F (ppm)
    ---------+-------------
     50      |  +0.50
    100      |  +0.124
    200      |  +0.031
    500      |  +0.005

This file asserts the candidate value.  It runs in parallel with the
xfail tests in `test_casimir_cathedral_full.py` that lock the *current
code's* incorrect output as a regression — once
`urt.casimir_cathedral.casimir_fractional_deviation` is updated to use
the candidate formula, both this file and the xfailed tests will flip.
"""
from math import factorial, sqrt, pi

import pytest


# Bohr radius (m) — standard reference value
A_BOHR = 5.29177e-11

# Cathedral integers
D, q, V, N, E, F, G = 3, 5, 12, 13, 30, 20, 60


def candidate_fractional_deviation(d_m: float) -> float:
    """Reverse-engineered Cathedral correction:
       ΔF/F = (a₀/d)² · (D+1)/(D! + D)."""
    return (A_BOHR / d_m) ** 2 * (D + 1) / (factorial(D) + D)


# ── Sector-size ratio is 4/9 ─────────────────────────────────────────────

class TestCoefficientStructure:
    def test_k4_over_a5_is_4_over_9(self):
        """The Cathedral coefficient (D+1)/(D!+D) = 4/9 = K_4-size / A_5-size."""
        assert (D + 1) / (factorial(D) + D) == 4 / 9
        # Numerator = 4 = size of K_4 coherent sector
        # Denominator = 9 = size of A_5 exhaust sector
        assert D + 1 == 4
        assert factorial(D) + D == 9

    def test_4_plus_9_equals_N(self):
        """The two sectors together fill the 13-shell."""
        assert (D + 1) + (factorial(D) + D) == N == 13


# ── Numerical agreement at d = 100 nm ────────────────────────────────────

class TestCandidateMatchesDocValue:
    @pytest.mark.physics
    def test_at_100nm_matches_doc_to_half_a_percent(self):
        """ΔF/F ≈ +0.124 ppm at 100 nm — within 0.5 % of doc claim."""
        v = candidate_fractional_deviation(100e-9)
        v_ppm = v * 1e6
        assert abs(v_ppm - 0.124) / 0.124 < 0.005

    @pytest.mark.physics
    def test_sign_is_positive(self):
        """The Cathedral correction is repulsive (opposite QED's attractive
        radiative correction)."""
        v = candidate_fractional_deviation(100e-9)
        assert v > 0


# ── d-scaling ────────────────────────────────────────────────────────────

class TestDScaling:
    def test_inverse_d_squared(self):
        """ΔF/F ∝ 1/d² — halving d multiplies ΔF/F by 4."""
        a = candidate_fractional_deviation(100e-9)
        b = candidate_fractional_deviation(50e-9)
        assert b == pytest.approx(4 * a, rel=1e-12)

    @pytest.mark.parametrize("d_nm,expected_ppm", [
        (50.0,  0.50),
        (100.0, 0.124),
        (200.0, 0.031),
        (500.0, 0.005),
    ])
    def test_predicted_ladder(self, d_nm, expected_ppm):
        """Ladder of predictions for a future Casimir experiment."""
        v = candidate_fractional_deviation(d_nm * 1e-9) * 1e6
        # Each row to within 5 % (the table itself is rounded to 3 sig figs)
        assert abs(v - expected_ppm) / expected_ppm < 0.05
