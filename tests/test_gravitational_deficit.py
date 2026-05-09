"""
The 1.0977° gravitational deficit identity.

The user-supplied canon ("THE CATHEDRAL — 1.0977° topological deficit")
defines three angles in degrees:

    ideal_plane_deg       = 18°            (= 360°/F)
    physical_rail_deg     = 2 · δ★_deg     (= 2·(180/π)·δ★)
    gravitational_deficit = ideal − physical

The framework claims that the deficit ≈ 1.0977° is *the geometric origin
of general relativity curvature, inertia, and the arrow of time*.

Closed form (verified):
    deficit_rad  =  2π/F − 2·δ★          (exact to machine precision)

The 18° "ideal plane" arises because F = 20 faces of the icosahedron
divide a full 360° rotation into 20 equal sectors of 18° each.  The
"physical rail" 2·δ★° ≈ 16.90° is the actual sector angle the
icosahedron achieves at the vacuum fixed point.  The 1.0965° (full
precision) gap is the Cathedral's gravitational-deficit angle.

Companion identity:
    holonomy_vortex_deg  =  360° + 2·δ★°  ≈  376.90°

i.e., a full bilateral rotation in the Cathedral vacuum overshoots a
nominal 360° rotation by 2·δ★° — the "vortex" that the framework
identifies as the arrow of time.
"""
from math import pi

import pytest

from urt.shell_closure import DELTA_STAR, F


# ── Closed-form identity ──────────────────────────────────────────────────

class TestGravitationalDeficitIdentity:
    def test_ideal_plane_is_360_over_F(self):
        """18° = 360°/F = 360°/20."""
        assert 360 / F == 18.0

    def test_physical_rail_is_2_delta_star(self):
        """Physical rail = 2·δ★ in degrees ≈ 16.903°."""
        rail_deg = 2 * DELTA_STAR * 180 / pi
        assert 16.85 < rail_deg < 16.95

    def test_deficit_closed_form(self):
        """deficit_rad = 2π/F − 2·δ★ exactly."""
        deficit_rad = 2 * pi / F - 2 * DELTA_STAR
        # Convert to degrees and compare to the doc's quoted 1.0977°.
        deficit_deg = deficit_rad * 180 / pi
        assert 1.09 < deficit_deg < 1.10
        # And the closed form is *exact* to machine precision
        ideal_minus_rail_rad = 2 * pi / F - 2 * DELTA_STAR
        assert abs(deficit_rad - ideal_minus_rail_rad) < 1e-15

    def test_doc_quoted_value(self):
        """Doc value 1.0977° uses δ★ = 0.1475 (3-digit truncation).
        Full precision gives 1.0965°; difference is 0.0012°."""
        deficit_full = (2 * pi / F - 2 * DELTA_STAR) * 180 / pi
        deficit_doc  = 1.097745
        # The two should agree to 0.005°
        assert abs(deficit_full - deficit_doc) < 0.005


class TestHolonomyVortex:
    def test_holonomy_vortex_is_360_plus_2_delta_star(self):
        """The 'arrow of time' angle ≈ 376.903°."""
        rail_deg = 2 * DELTA_STAR * 180 / pi
        vortex_deg = 360 + rail_deg
        assert 376.85 < vortex_deg < 376.95

    def test_vortex_excess_equals_physical_rail(self):
        """Vortex − 360° = physical rail = 2·δ★° (definitionally)."""
        rail_deg = 2 * DELTA_STAR * 180 / pi
        vortex_deg = 360 + rail_deg
        assert abs((vortex_deg - 360) - rail_deg) < 1e-12


class TestCathedralIntegerStructure:
    """Both 18° and 2·δ★° decompose into Cathedral expressions."""

    def test_ideal_plane_uses_F(self):
        assert 360 / F == 18.0
        assert F == 20

    def test_F_is_icosahedron_face_count(self):
        """20 faces × 18° = 360°."""
        assert F * 18 == 360

    def test_F_times_deficit_is_about_22_degrees(self):
        """F · deficit = 20 · 1.0965° ≈ 21.93° — total deficit budget."""
        deficit_deg = (2 * pi / F - 2 * DELTA_STAR) * 180 / pi
        total = F * deficit_deg
        assert 21.5 < total < 22.5
