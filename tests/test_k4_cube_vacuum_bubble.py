"""Tests for the K_4-cube vacuum-bubble CC derivation."""
from __future__ import annotations

import pytest

from urt.k4_cube_vacuum_bubble import (
    k4_cube_vertices,
    k4_cube_vertex_count,
    vertex_count_is_cathedral,
    per_vertex_propagator_factor,
    k4_cube_vacuum_bubble_amplitude,
    k4_cube_amplitude_closed_form,
    k4_measure_prefactor,
    cc_from_k4_cube,
    cc_v9_closed_form,
    cube_amplitude_matches_closed_form,
    cc_derivation_matches_v9,
    k4_cube_vacuum_bubble_summary,
    k4_cube_vacuum_bubble_audit_passes,
    print_k4_cube_vacuum_bubble_report,
)
from urt.shell_closure import D, gamma


TOL = 1e-12


class TestCubeStructure:
    def test_vertex_count_is_DD1_pow_D(self):
        assert k4_cube_vertex_count() == (D + 1) ** D
        assert k4_cube_vertex_count() == 64

    def test_vertex_count_is_2_pow_2D(self):
        """Cathedral identity: 4^3 = 64 = 2^6 = 2^(2D)."""
        assert k4_cube_vertex_count() == 2 ** (2 * D)

    def test_vertex_count_is_cathedral(self):
        assert vertex_count_is_cathedral()

    def test_vertices_enumeration_count(self):
        v = k4_cube_vertices()
        assert len(v) == 64

    def test_all_vertices_unique(self):
        v = k4_cube_vertices()
        assert len(set(v)) == 64

    def test_vertex_components_in_range(self):
        for vert in k4_cube_vertices():
            for k in vert:
                assert 0 <= k <= D


class TestPropagator:
    def test_factor_is_gamma(self):
        assert per_vertex_propagator_factor() == pytest.approx(gamma)

    def test_factor_is_one_over_81(self):
        assert per_vertex_propagator_factor() == pytest.approx(1.0 / 81.0)


class TestCubeAmplitude:
    def test_explicit_product_equals_gamma_64(self):
        product_explicit = k4_cube_vacuum_bubble_amplitude()
        closed = k4_cube_amplitude_closed_form()
        assert product_explicit == pytest.approx(closed, rel=TOL)

    def test_amplitude_is_gamma_to_64(self):
        amp = k4_cube_amplitude_closed_form()
        assert amp == pytest.approx(gamma ** 64, rel=TOL)

    def test_amplitude_match_dict(self):
        m = cube_amplitude_matches_closed_form()
        assert m["agreement_relerr"] < TOL


class TestPrefactor:
    def test_is_D_over_DD1_squared(self):
        assert k4_measure_prefactor() == pytest.approx(D / (D + 1) ** 2)

    def test_is_3_over_16(self):
        assert k4_measure_prefactor() == pytest.approx(3.0 / 16.0)


class TestCCReconstruction:
    def test_cc_from_cube_matches_v9_at_machine_eps(self):
        derived = cc_from_k4_cube()
        v9 = cc_v9_closed_form()
        relerr = abs(derived - v9) / abs(v9)
        assert relerr < TOL

    def test_cc_derivation_dict(self):
        m = cc_derivation_matches_v9()
        assert m["agreement_relerr"] < TOL

    def test_cc_magnitude_is_correct_order(self):
        """CC should be ~10^(-123) for D=3."""
        cc = cc_from_k4_cube()
        assert 1e-124 < cc < 1e-122


class TestAuditGate:
    def test_audit_passes(self):
        assert k4_cube_vacuum_bubble_audit_passes()

    def test_summary_keys(self):
        s = k4_cube_vacuum_bubble_summary()
        for k in ("vertex_count", "per_vertex_factor", "cube_amplitude",
                  "prefactor", "cc_predicted", "cc_v9_match",
                  "amplitude_match"):
            assert k in s


class TestReport:
    def test_print_runs(self, capsys):
        print_k4_cube_vacuum_bubble_report()
        out = capsys.readouterr().out
        assert "K_4-cube vacuum-bubble" in out
        assert "CI gate: True" in out
