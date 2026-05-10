"""Tests for the Ihara zeta function of G_{13}."""
from math import factorial

import numpy as np

from urt.shell_closure import D, q, V, N, F
from urt.ihara_zeta_g13 import (
    VERTEX_COUNT, EDGE_COUNT, ORIENTED_EDGE_COUNT,
    BETTI_NUMBER, TRIANGLE_COUNT,
    graph_topology,
    adjacency_spectrum, adjacency_spectrum_cathedral_form,
    closed_walk_count, closed_walk_cathedral_table,
    triangle_count_cathedral,
    hashimoto_matrix, hashimoto_eigenvalue_distribution,
    ramanujan_property,
    ihara_polynomial_via_hashimoto,
    ihara_zeta_g13_audit,
    ihara_zeta_g13_audit_passes,
)


class TestGraphTopology:
    """Cathedral topology of G_{13} — every count is a Cathedral closed form."""

    def test_vertices_is_N(self):
        assert VERTEX_COUNT == N == 13

    def test_edges_is_D_times_V(self):
        """E_G = D · V = 36 (NEW Cathedral identity)."""
        assert EDGE_COUNT == D * V == 36

    def test_oriented_edges_is_DF_V(self):
        """2|E| = D! · V = 72 (= sum of degrees = tr(L))."""
        assert ORIENTED_EDGE_COUNT == factorial(D) * V == 72

    def test_betti_number_is_2V(self):
        """r = E − V + 1 = 2V = 24 (NEW Cathedral identity)."""
        assert BETTI_NUMBER == 2 * V == 24

    def test_triangle_count_is_2V(self):
        """# triangles = 2V = 24 (NEW Cathedral identity)."""
        assert TRIANGLE_COUNT == 2 * V == 24

    def test_topology_cathedral_forms(self):
        t = graph_topology()
        assert t["edges_form"]   == "D · V"
        assert t["betti_form"]   == "2V (= E − V + 1)"
        assert t["triangle_form"] == "2V"


class TestAdjacencySpectrum:
    """Every adjacency eigenvalue of G_{13} is a Cathedral integer."""

    def test_spectrum_distinct_values(self):
        spec = adjacency_spectrum()
        assert set(spec.keys()) == {factorial(D), D - 1, 0, -(D - 1), -(D + 1)}

    def test_perron_is_DF(self):
        """Perron-Frobenius eigenvalue = D! = 6."""
        spec = adjacency_spectrum()
        assert factorial(D) in spec
        assert spec[factorial(D)] == 1

    def test_kernel_multiplicity_is_DF(self):
        """λ = 0 has multiplicity D! = 6."""
        spec = adjacency_spectrum()
        assert spec[0] == factorial(D)

    def test_minimum_is_minus_Dp1(self):
        """λ_min(A) = −(D+1) = −4."""
        spec = adjacency_spectrum()
        assert -(D + 1) in spec
        assert spec[-(D + 1)] == 1

    def test_multiplicities_sum_to_N(self):
        spec = adjacency_spectrum()
        assert sum(spec.values()) == N

    def test_sum_of_squares_is_DF_V(self):
        """tr(A²) = Σ λ² = D! · V = 72."""
        spec = adjacency_spectrum()
        ss = sum(lam ** 2 * m for lam, m in spec.items())
        assert ss == factorial(D) * V


class TestClosedWalks:
    """tr(A^k) closed-walk identities, each a Cathedral closed form."""

    def test_tr_A_is_zero(self):
        """tr(A) = 0 — no self-loops."""
        assert closed_walk_count(1) == 0

    def test_tr_A_squared_is_DF_V(self):
        """tr(A²) = D! · V = 72."""
        assert closed_walk_count(2) == factorial(D) * V == 72

    def test_tr_A_cubed_is_V_squared(self):
        """tr(A³) = V² = 144 — the Fibonacci miracle F_V = V²."""
        assert closed_walk_count(3) == V ** 2 == 144

    def test_tr_A_fifth_is_E8_theta(self):
        """tr(A⁵) = σ(V) · V · F = 6720 — the E_8 second theta coefficient."""
        from urt.shell_closure import V as V_local, F as F_local
        sigma_V = 1 + 2 + 3 + 4 + 6 + 12  # divisors of 12
        assert sigma_V == 28
        assert closed_walk_count(5) == sigma_V * V_local * F_local == 6720


class TestTriangleCount:
    """All 24 triangles in G_{13} pass through the central vertex."""

    def test_24_triangles(self):
        tc = triangle_count_cathedral()
        assert tc["triangles"] == 2 * V == 24

    def test_form_is_2V(self):
        tc = triangle_count_cathedral()
        assert tc["form"] == "2V = 24"

    def test_triangles_via_walks(self):
        """tr(A³)/6 = 144/6 = 24."""
        assert closed_walk_count(3) // 6 == 2 * V


class TestHashimotoMatrix:
    """The non-backtracking edge-walk matrix W is 2|E| × 2|E| = 72×72."""

    def test_matrix_size(self):
        W = hashimoto_matrix()
        assert W.shape == (ORIENTED_EDGE_COUNT, ORIENTED_EDGE_COUNT)
        assert W.shape == (72, 72)

    def test_no_immediate_backtrack(self):
        """W[(u,v), (v,u)] = 0 (definition: no immediate backtrack)."""
        from urt.cathedral_engine import cathedral_adjacency
        A = cathedral_adjacency().astype(int)
        W = hashimoto_matrix()
        # Build edge index map
        edges = []
        for u in range(N):
            for v in range(N):
                if A[u, v]:
                    edges.append((u, v))
        idx = {e: i for i, e in enumerate(edges)}
        # Each oriented edge (u, v) — its reverse (v, u) should give 0
        for (u, v) in edges:
            i = idx[(u, v)]
            j = idx[(v, u)]
            assert W[i, j] == 0


class TestRamanujanProperty:
    """22 of the 26 non-trivial Hashimoto eigenvalues lie on |λ_W| = D−1 = 2."""

    def test_22_eigenvalues_on_ramanujan_bound(self):
        """The Cathedral Ramanujan-type property of G_{13}."""
        rp = ramanujan_property()
        assert rp["count_on_bound"] == 22

    def test_ramanujan_modulus_is_Dm1(self):
        """The Ramanujan bound for G_{13} is at |λ_W| = D − 1 = 2."""
        rp = ramanujan_property()
        assert rp["ramanujan_modulus"] == D - 1 == 2

    def test_count_form_is_2_v_minus_1(self):
        """22 = 2(V − 1)."""
        rp = ramanujan_property()
        assert rp["count_on_bound"] == 2 * (V - 1)

    def test_perron_eigenvalue_is_largest(self):
        """The Perron eigenvalue is > Ramanujan bound."""
        rp = ramanujan_property()
        assert rp["perron_eigenvalue"] > rp["ramanujan_modulus"]


class TestIharaPolynomial:
    """The Ihara polynomial 1/ζ_X(u) has Cathedral degree structure."""

    def test_total_degree_is_2E(self):
        ip = ihara_polynomial_via_hashimoto()
        assert ip["degree_total"] == 2 * EDGE_COUNT == 72

    def test_total_degree_is_DF_V(self):
        ip = ihara_polynomial_via_hashimoto()
        assert ip["degree_total"] == factorial(D) * V

    def test_nontrivial_degree_is_2N(self):
        """det(I − uA + u²(D−I)) has degree 2V_G = 2N = 26."""
        ip = ihara_polynomial_via_hashimoto()
        assert ip["degree_nontrivial"] == 2 * N == 26

    def test_trivial_degree_is_4V_minus_2(self):
        """(1−u²)^{r−1} contributes degree 2(r−1) = 2(2V−1) = 4V − 2 = 46."""
        ip = ihara_polynomial_via_hashimoto()
        assert ip["degree_trivial"] == 2 * (BETTI_NUMBER - 1) == 46

    def test_degree_addition(self):
        ip = ihara_polynomial_via_hashimoto()
        assert ip["degree_trivial"] + ip["degree_nontrivial"] == ip["degree_total"]


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert ihara_zeta_g13_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = ihara_zeta_g13_audit()
        for key in (
            "graph_topology",
            "adjacency_spectrum",
            "adjacency_cathedral",
            "closed_walks",
            "triangle_count",
            "hashimoto_distribution",
            "ramanujan_property",
            "ihara_polynomial",
        ):
            assert key in a
