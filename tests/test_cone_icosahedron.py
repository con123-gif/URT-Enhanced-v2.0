"""Tests for the Cone(I_12) actual-graph-Laplacian module.

Spectral content credited to James Lockwood (2026).
"""
from fractions import Fraction
from math import factorial

import numpy as np

from urt.shell_closure import D, q, V, N
from urt.cone_icosahedron import (
    icosahedron_adjacency, cone_adjacency, cone_laplacian, cone_edge_count,
    cone_spectrum_numerical, cone_spectrum_closed_form,
    spectrum_matches_closed_form,
    eta_g13_symbolic, eta_g13_cathedral_factorisation,
    eta_numerical, numerical_symbolic_agreement,
    kirchhoff_index, average_pairwise_resistance,
    cone_icosahedron_audit, cone_icosahedron_audit_passes,
)


class TestIcosahedronAdjacency:
    def test_shape(self):
        A = icosahedron_adjacency()
        assert A.shape == (12, 12)

    def test_5_regular(self):
        """Each vertex of the icosahedron has degree 5."""
        A = icosahedron_adjacency()
        assert all(int(d) == 5 for d in A.sum(axis=1))

    def test_30_edges(self):
        A = icosahedron_adjacency()
        assert int(A.sum()) // 2 == 30

    def test_symmetric(self):
        A = icosahedron_adjacency()
        assert np.array_equal(A, A.T)


class TestConeAdjacency:
    def test_shape(self):
        A = cone_adjacency()
        assert A.shape == (13, 13)

    def test_center_connected_to_all_shell(self):
        A = cone_adjacency()
        assert A[12, :12].sum() == 12
        assert A[:12, 12].sum() == 12

    def test_degree_sequence(self):
        """Shell vertices have degree 6, center has degree 12."""
        A = cone_adjacency()
        deg = A.sum(axis=1)
        assert all(int(deg[i]) == 6 for i in range(12))
        assert int(deg[12]) == 12

    def test_42_edges(self):
        """30 ico edges + 12 cone edges = 42."""
        assert cone_edge_count() == 42


class TestConeLaplacian:
    def test_trace_is_84(self):
        L = cone_laplacian()
        assert int(L.trace()) == 84 == 2 * 42

    def test_symmetric(self):
        L = cone_laplacian()
        assert np.array_equal(L, L.T)

    def test_zero_eigenvalue(self):
        L = cone_laplacian()
        eigs = np.linalg.eigvalsh(L)
        assert abs(eigs.min()) < 1e-10


class TestSpectrum:
    def test_numerical_matches_closed_form(self):
        assert spectrum_matches_closed_form(tol=1e-9)

    def test_closed_form_multiplicities(self):
        cf = cone_spectrum_closed_form()
        m = cf["multiplicities"]
        assert m["0"] == 1
        assert m["6 − √5"] == 3
        assert m["7"] == 5
        assert m["6 + √5"] == 3
        assert m["13"] == 1
        assert sum(m.values()) == 13

    def test_eigenvalue_13_is_radial(self):
        """λ = 13 (= N) is the rank-1 center-vs-shell radial mode."""
        L = cone_laplacian()
        eigs = sorted(np.linalg.eigvalsh(L).round(8).tolist())
        assert abs(eigs[-1] - 13) < 1e-7

    def test_fiedler_is_6_minus_sqrt5(self):
        """Fiedler eigenvalue λ_2 = 6 − √5 ≈ 3.7639."""
        L = cone_laplacian()
        eigs = sorted(np.linalg.eigvalsh(L).round(8).tolist())
        fiedler = eigs[1]
        assert abs(fiedler - (6 - 5**0.5)) < 1e-7

    def test_trace_decomposition_84(self):
        """Closed-form spec sums to 84 exactly (√5 terms cancel)."""
        cf = cone_spectrum_closed_form()
        assert cf["trace"] == 84


class TestEta:
    def test_eta_value(self):
        assert eta_g13_symbolic() == Fraction(5508, 2821)

    def test_sqrt5_cancellation_36_over_31(self):
        """3/(6−√5) + 3/(6+√5) = 36/31 exactly (√5 terms cancel)."""
        # Symbolic identity:  (6-√5)(6+√5) = 36 - 5 = 31
        # 3/(6-√5) + 3/(6+√5) = 6·6 / 31 = 36/31
        a = Fraction(36, 31)
        assert a + Fraction(5, 7) + Fraction(1, 13) == eta_g13_symbolic()

    def test_numerical_matches_symbolic(self):
        assert numerical_symbolic_agreement(tol=1e-12)

    def test_cathedral_factorisation(self):
        f = eta_g13_cathedral_factorisation()
        assert f["matches_5508_2821"]
        assert f["numerator"] == 5508 == (D + 1) * 81 * (N + D + 1)
        assert f["denominator"] == 2821 == (factorial(D) + 1) * N * (2 ** q - 1)


class TestKirchhoff:
    def test_kirchhoff_index_5508_217(self):
        assert kirchhoff_index() == Fraction(5508, 217)

    def test_kirchhoff_is_N_times_eta(self):
        assert kirchhoff_index() == N * eta_g13_symbolic()

    def test_217_factorisation(self):
        """217 = 7 · 31 = (D!+1) · M_q."""
        assert 217 == (factorial(D) + 1) * (2 ** q - 1)


class TestAverageResistance:
    def test_avg_resistance_918_2821(self):
        assert average_pairwise_resistance() == Fraction(918, 2821)

    def test_918_factorisation(self):
        """918 = 2 · D^D · (N+D+1) = (D−1) · D^D · (N+D+1)."""
        assert 918 == (D - 1) * D ** D * (N + D + 1)


class TestAggregateAudit:
    def test_audit_passes(self):
        assert cone_icosahedron_audit_passes()

    def test_audit_structure(self):
        a = cone_icosahedron_audit()
        for key in ("n_vertices", "n_edges", "spectrum_closed_form",
                    "spectrum_matches", "trace_equals_2E", "trace_value",
                    "eta_symbolic", "eta_factorisation",
                    "eta_num_sym_match", "kirchhoff_index",
                    "average_resistance"):
            assert key in a

    def test_audit_constants_match(self):
        a = cone_icosahedron_audit()
        assert a["n_vertices"] == 13
        assert a["n_edges"] == 42
        assert a["trace_value"] == 84
        assert a["eta_symbolic"] == Fraction(5508, 2821)
