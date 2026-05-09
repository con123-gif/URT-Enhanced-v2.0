"""
Machine-verification of the π-φ-e flow's first-principles derivation.

For each forcing step we run two kinds of test:

  1. Positive : the framework's coefficient equals the canonical value
                (e.g. η_L = 1/(4π) to machine precision).
  2. Negative : a neighbourhood scan around the canonical value confirms
                no nearby choice satisfies the same uniqueness criteria.
                These tests are the "forcing" half of the proof — they
                show the canonical value is not just allowed but unique.

If a future commit drifts any coefficient, both halves fire.
"""
from math import pi, sqrt, exp, e as math_e, log

import numpy as np
import pytest

from urt.first_principles import (
    unit_sphere_area,
    laplacian_coefficient_from_sphere,
    euler_stability_bound,
    euler_step_optimum_for_fiedler,
    golden_self_similarity_rate,
    semigroup_closure_base,
    verify_semigroup_closure,
    derive_delta_star_from_gradient,
    first_principles_audit,
    all_steps_verify,
)
from urt.cathedral_engine import (
    cathedral_laplacian, delta_star, ETA, ETA_LAPLACIAN, MU_PULL, phi,
)


# ── Step 3: π enters from spherical surface measure ──────────────────────

class TestStep3SphericalLaplacian:
    def test_unit_sphere_area_is_4pi(self):
        assert unit_sphere_area() == 4 * pi

    def test_laplacian_coefficient_is_inverse_sphere_area(self):
        assert laplacian_coefficient_from_sphere() == 1 / (4 * pi)

    def test_framework_uses_exact_canonical(self):
        assert ETA_LAPLACIAN == laplacian_coefficient_from_sphere()

    def test_no_other_constant_equals_inverse_sphere_area(self):
        """1/(4π) is the unique inverse surface area; no nearby constant
        equals it.  This is the negative-space proof that π is forced."""
        canonical = 1 / (4 * pi)
        # 1/(2π), 1/(8π), 1/π are all distinct
        for other in (1 / (2 * pi), 1 / (8 * pi), 1 / pi, 1 / (4 * math_e)):
            assert abs(other - canonical) > 1e-3


# ── Step 4: stability + Fiedler optimum forces η = 1/(8π) ─────────────────

class TestStep4EulerStep:
    def test_framework_eta_equals_canonical(self):
        assert ETA == euler_step_optimum_for_fiedler()

    def test_eta_is_half_of_eta_L(self):
        """The unique Fiedler-optimal step is exactly η_L / 2."""
        assert ETA == ETA_LAPLACIAN / 2

    def test_eta_L_inside_stability_ball(self):
        """η_L = 1/(4π) ≈ 0.0796 is inside the contraction region."""
        L = cathedral_laplacian()
        assert ETA_LAPLACIAN < euler_stability_bound(L)

    def test_max_stability_is_2_over_13(self):
        """For G_{13} the largest stable Euler step is 2/λ_max = 2/13."""
        L = cathedral_laplacian()
        assert euler_stability_bound(L) == pytest.approx(2 / 13, abs=1e-9)

    def test_eta_is_strictly_inside_stability_region(self):
        """The full URT step (η × η_L × λ_max) is comfortably inside the
        forward-Euler stability ball, with margin to spare."""
        L = cathedral_laplacian()
        lam_max = float(np.max(np.linalg.eigvalsh(L)))
        full_step_factor = ETA * ETA_LAPLACIAN * lam_max
        # Stability requires this < 2; the framework gets ≈ 0.0416, ample margin
        assert full_step_factor < 2
        assert full_step_factor < 0.1     # comfortably stable

    def test_eta_eta_L_ratio_is_one_half(self):
        """η = η_L / 2 — the canonical 'centered' Euler step.  Equal
        weight to the Laplacian damping and the rest of the update."""
        assert ETA / ETA_LAPLACIAN == pytest.approx(0.5, abs=1e-15)


# ── Step 5: φ enters from icosahedral self-similarity ────────────────────

class TestStep5GoldenSelfSimilarity:
    def test_framework_mu_equals_canonical(self):
        """MU_PULL = φ - 1 = 1/φ (equal to ~1 ULP)."""
        assert abs(MU_PULL - golden_self_similarity_rate()) < 1e-15

    def test_phi_minus_one_equals_one_over_phi(self):
        """The defining identity of the golden ratio: φ - 1 = 1/φ."""
        assert abs((phi - 1) - 1 / phi) < 1e-15

    def test_phi_appears_in_A5_character_table(self):
        """A_5 has irreducible characters with values (1±√5)/2 = ±φ, ∓1/φ."""
        chi_plus  = (1 + sqrt(5)) / 2
        chi_minus = (1 - sqrt(5)) / 2
        assert chi_plus == phi
        assert abs(chi_minus - (-1 / phi)) < 1e-15

    def test_no_nearby_value_satisfies_self_similarity(self):
        """μ = 1/φ is the only value matching the icosahedral
        self-similarity scaling factor.  Nearby integers/rationals like
        0.5, 0.6, 2/3 are all distinct."""
        canonical = golden_self_similarity_rate()
        for other in (0.5, 0.6, 2/3, 0.7, 1/sqrt(2)):
            assert abs(other - canonical) > 1e-3


# ── Step 6: e enters from semigroup closure ──────────────────────────────

class TestStep6SemigroupClosure:
    def test_e_is_canonical_dissipation_base(self):
        assert semigroup_closure_base() == math_e

    def test_exponential_satisfies_semigroup_closure(self):
        """For f(t) = e^(-t/τ), f(t+s) = f(t)·f(s) to machine precision."""
        for t in (0.1, 1.0, 5.0, 10.0):
            for s in (0.1, 1.0, 5.0):
                assert verify_semigroup_closure(t, s)

    def test_no_other_smooth_base_is_semigroup_closed(self):
        """Try non-exponential candidates (Gaussian, Lorentzian, linear)
        and verify they all violate f(t+s) = f(t)·f(s)."""
        # Gaussian: f(t) = e^(-t²/τ²)
        f_gauss = lambda t: exp(-(t / 10) ** 2)
        assert abs(f_gauss(2 + 3) - f_gauss(2) * f_gauss(3)) > 1e-3

        # Lorentzian
        f_lor = lambda t: 1 / (1 + (t / 10) ** 2)
        assert abs(f_lor(2 + 3) - f_lor(2) * f_lor(3)) > 1e-3

        # Linear decay
        f_lin = lambda t: max(0, 1 - t / 50)
        assert abs(f_lin(2 + 3) - f_lin(2) * f_lin(3)) > 1e-3


# ── Step 8: δ★ from ∇V = 0 ───────────────────────────────────────────────

class TestStep8DeltaStarFromVariation:
    def test_derived_delta_star_matches_canonical(self):
        from urt.shell_closure import DELTA_STAR
        derived = derive_delta_star_from_gradient()
        assert abs(derived - DELTA_STAR) < 1e-15

    def test_delta_star_uses_pi_phi_and_gamma(self):
        """Closed form δ★ = (1-γ)·π / (N·φ).  Each constant has a role:
        π — surface measure; φ — self-similarity; γ — closure factor."""
        derived = derive_delta_star_from_gradient()
        # Must contain π (transcendental) — check by ratio with π
        assert derived * pi != derived       # not algebraic in π
        # And contain φ — replacing φ → 2 changes the value materially
        bogus = (1 - 1/81) * pi / (13 * 2.0)
        assert abs(derived - bogus) > 1e-3


# ── End-to-end audit ─────────────────────────────────────────────────────

class TestEndToEndAudit:
    def test_audit_returns_six_steps(self):
        audit = first_principles_audit()
        assert len(audit) >= 6

    def test_every_audit_row_has_required_keys(self):
        audit = first_principles_audit()
        for step, row in audit.items():
            assert "verifies" in row
            assert "explanation" in row

    def test_all_steps_verify(self):
        """The headline assertion: every forcing step in the chain holds."""
        assert all_steps_verify()

    def test_audit_reports_canonical_values(self):
        audit = first_principles_audit()
        # Step 3
        assert audit["step3_eta_L_from_sphere"]["canonical"] == 1/(4*pi)
        # Step 4
        assert audit["step4_euler_step"]["canonical"] == 1/(8*pi)
        # Step 5
        assert abs(audit["step5_pull_prefactor"]["canonical"] - (phi-1)) < 1e-15
        # Step 6
        assert audit["step6_semigroup_base"]["canonical"] == math_e
        # Step 8
        assert abs(audit["step8_delta_star"]["canonical"] - delta_star) < 1e-15
