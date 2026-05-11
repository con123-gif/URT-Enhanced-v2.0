"""Tests for the icosahedral frustration module."""
from math import factorial
import pytest

from urt.icosahedral_frustration import (
    crystallographic_restriction_q,
    gap_as_frustration_energy,
    dihedral_frustration_angle,
    four_facets_of_frustration,
    dynamical_facet_of_frustration,
    dimensional_facet_of_frustration,
    six_facets_of_frustration,
    quasicrystal_realization,
    dimensional_collapse_threshold,
    icosahedral_frustration_audit,
    icosahedral_frustration_audit_passes,
)


class TestCrystallographicRestriction:
    def test_first_forbidden_n_is_q(self):
        """5 is the smallest n-fold rotation forbidden by crystal restriction —
        and 5 = q is the framework's pentagonal symmetry order."""
        from urt.shell_closure import q
        cr = crystallographic_restriction_q()
        assert cr["first_forbidden_n"] == q
        assert cr["first_forbidden_is_q"]

    def test_allowed_nfolds_are_Cathedral(self):
        """{1, 2, 3, 4, 6} = {1, D-1, D, D+1, D!} — all Cathedral."""
        from urt.shell_closure import D
        cr = crystallographic_restriction_q()
        assert 2 == D - 1
        assert 3 == D
        assert 4 == D + 1
        assert 6 == factorial(D)
        assert cr["allowed_nfolds"] == [1, 2, 3, 4, 6]

    def test_icosahedron_axis_order_is_q(self):
        """The icosahedron's vertex rotation axes are q-fold (5-fold)."""
        from urt.shell_closure import q
        cr = crystallographic_restriction_q()
        assert cr["icosahedron_axis_order"] == q


class TestGapAsFrustrationEnergy:
    def test_gap_is_positive(self):
        """Δ = δ_cl - δ★ > 0 — frustration cost is non-zero."""
        g = gap_as_frustration_energy()
        assert g["Delta_gap"] > 0

    def test_gap_is_about_2_5e3(self):
        """Δ ≈ 2.49 × 10⁻³ — the residual frustration energy."""
        g = gap_as_frustration_energy()
        assert 2.0e-3 < g["Delta_gap"] < 3.0e-3

    def test_gap_over_alpha_is_about_1_over_D(self):
        """Δ/α ≈ 1/D ≈ 0.34 — frustration as fraction of fine-structure scale."""
        g = gap_as_frustration_energy()
        assert g["Delta_over_alpha_close_to_1_over_D"]


class TestDihedralFrustration:
    def test_icosahedron_dihedral_is_138(self):
        """Icosahedron dihedral = arccos(-√5/3) ≈ 138.19°."""
        d = dihedral_frustration_angle()
        assert 138.0 < d["icosahedron_dihedral_deg"] < 138.3

    def test_tetrahedron_dihedral_is_109(self):
        """Tetrahedron dihedral = arccos(-1/3) ≈ 109.47°."""
        d = dihedral_frustration_angle()
        assert 109.4 < d["tetrahedron_dihedral_deg"] < 109.5

    def test_frustration_angle_is_about_29(self):
        """Frustration angle ≈ 28.7° — icosahedron's deviation from FCC."""
        d = dihedral_frustration_angle()
        assert 28.0 < d["frustration_angle"] < 29.0


class TestFourFacets:
    def test_geometric_facet(self):
        """K(3) = V = 12 vertices on S², no periodic lattice."""
        from urt.shell_closure import V
        f = four_facets_of_frustration()
        assert f["geometric"]["n_vertices_on_S2"] == V

    def test_algebraic_facet(self):
        """A_5 (order G) is non-solvable."""
        from urt.shell_closure import G
        f = four_facets_of_frustration()
        assert f["algebraic"]["A_5_order"] == G
        assert f["algebraic"]["is_non_solvable"]

    def test_spectral_facet_multiplicity_at_D(self):
        """Laplacian λ=D=3 has multiplicity 2 — spectral signature of frustration."""
        from urt.shell_closure import D
        f = four_facets_of_frustration()
        assert f["spectral"]["Fiedler_eigenvalue"] == D
        assert f["spectral"]["multiplicity_at_D"] == 2


class TestQuasicrystal:
    def test_diffraction_n_fold_is_2q(self):
        """Quasicrystal 10-fold diffraction = 2q (Cathedral)."""
        from urt.shell_closure import q
        qc = quasicrystal_realization()
        assert qc["diffraction_n_fold"] == 2 * q

    def test_penrose_n_fold_is_q(self):
        """Penrose tiling has q-fold (5-fold) symmetry — same as the
        forbidden crystallographic n-fold."""
        from urt.shell_closure import q
        qc = quasicrystal_realization()
        assert qc["penrose_n_fold"] == q

    def test_inflation_factor_is_phi(self):
        """Penrose inflation = φ = same as URT pull-rate inverse."""
        from urt.shell_closure import phi
        qc = quasicrystal_realization()
        assert qc["inflation_factor"] == phi

    def test_URT_pull_is_inverse_inflation(self):
        """URT pull rate μ = 1/φ — the inverse Penrose inflation rate."""
        qc = quasicrystal_realization()
        assert qc["URT_pull_is_inverse_inflation"]


class TestDynamicalFacet:
    def test_rails_split(self):
        """δ_cl ≠ δ★ — the rails split."""
        d = dynamical_facet_of_frustration()
        assert d["rails_split"]

    def test_gap_is_about_2_5e3(self):
        """Δ ≈ 2.49 × 10⁻³ — the residual frustration energy."""
        d = dynamical_facet_of_frustration()
        assert 2.0e-3 < d["gap_Delta"] < 3.0e-3

    def test_delta_cl_is_D_over_F(self):
        """δ_cl = D/F = 0.15 — the unfrustrated classical limit."""
        from urt.shell_closure import D, F
        d = dynamical_facet_of_frustration()
        assert d["delta_cl"] == D / F == 0.15


class TestDimensionalFacet:
    def test_visible_is_4(self):
        """Visible 4D = D + 1."""
        from urt.shell_closure import D
        d = dimensional_facet_of_frustration()
        assert d["visible_dim"] == D + 1 == 4

    def test_exhaust_is_9(self):
        """Exhaust 9D = D! + D = D²."""
        from urt.shell_closure import D
        d = dimensional_facet_of_frustration()
        assert d["exhaust_dim"] == factorial(D) + D == 9
        assert d["exhaust_is_DD"]

    def test_total_is_N(self):
        """4 + 9 = 13 = N."""
        from urt.shell_closure import N
        d = dimensional_facet_of_frustration()
        assert d["total"] == N


class TestSixFacets:
    def test_six_facets_dict_complete(self):
        """six_facets_of_frustration() returns all six labelled facets."""
        f = six_facets_of_frustration()
        assert "geometric" in f
        assert "algebraic" in f
        assert "spectral" in f
        assert "topological" in f
        assert "dynamical" in f
        assert "dimensional" in f

    def test_includes_four_classical(self):
        """The six-facet view contains the four classical ones unchanged."""
        four = four_facets_of_frustration()
        six = six_facets_of_frustration()
        for key in ("geometric", "algebraic", "spectral", "topological"):
            assert six[key] == four[key]

    def test_dynamical_carries_gap(self):
        """Dynamical facet carries the gap Δ > 0."""
        f = six_facets_of_frustration()
        assert f["dynamical"]["gap_Delta"] > 0

    def test_dimensional_carries_9(self):
        """Dimensional facet exposes the 9-dim exhaust."""
        f = six_facets_of_frustration()
        assert f["dimensional"]["exhaust_dim"] == 9


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert icosahedral_frustration_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = icosahedral_frustration_audit()
        assert "crystallographic_restriction" in a
        assert "gap_as_frustration_energy" in a
        assert "quasicrystal_realization" in a

    def test_audit_includes_six_facets(self):
        a = icosahedral_frustration_audit()
        assert "six_facets" in a


class TestDimensionalCollapseThreshold:
    """The γ·φ ≈ 0.01998 dimensional-collapse threshold (v2.9.81)."""

    def test_closed_form(self):
        import math
        phi = (1 + math.sqrt(5)) / 2
        d = dimensional_collapse_threshold()
        assert d["gamma_times_phi"] == pytest.approx((1 / 81) * phi, rel=1e-14)

    def test_numerical_value(self):
        d = dimensional_collapse_threshold()
        assert 0.0199 < d["gamma_times_phi"] < 0.0201

    def test_delta_star_ratio(self):
        """δ★ / threshold ≈ 7.385."""
        d = dimensional_collapse_threshold()
        assert 7.3 < d["delta_star_over_threshold"] < 7.5

    def test_audit_still_passes(self):
        assert icosahedral_frustration_audit_passes()
