"""
Tests for the cathedral_connections module — six clusters of new
mathematical connections in the framework.
"""
import numpy as np
import pytest

from urt.cathedral_connections import (
    pentagonal, triangular, divisor_sum, is_perfect,
    pentagonal_quartet,
    a5_conjugacy_classes,
    a5_irreps,
    spectrum_sector_sums,
    perfect_number_doublet,
    triangular_triplet,
    G_factorization,
    orbit_stabilizer_triple,
    vertex_face_incidence,
    all_connections_audit,
    all_connections_verify,
)


# ── Figurate-number helpers ──────────────────────────────────────────────

class TestFigurateHelpers:
    def test_pentagonal_first_six(self):
        assert [pentagonal(n) for n in range(1, 7)] == [1, 5, 12, 22, 35, 51]

    def test_triangular_first_seven(self):
        assert [triangular(n) for n in range(1, 8)] == [1, 3, 6, 10, 15, 21, 28]

    def test_divisor_sum_of_6(self):
        assert divisor_sum(6) == 12

    def test_divisor_sum_of_12(self):
        assert divisor_sum(12) == 28

    def test_six_is_perfect(self):
        assert is_perfect(6)

    def test_28_is_perfect(self):
        assert is_perfect(28)

    def test_seven_is_not_perfect(self):
        assert not is_perfect(7)


# ── Connection 1: Pentagonal Quartet ─────────────────────────────────────

class TestPentagonalQuartet:
    def test_q_is_pentagonal_at_index_D_minus_1(self):
        from urt.shell_closure import D, q
        assert pentagonal(D - 1) == q

    def test_V_is_pentagonal_at_index_D(self):
        from urt.shell_closure import D, V
        assert pentagonal(D) == V

    def test_d_35_is_pentagonal_at_index_q(self):
        from urt.shell_closure import q
        assert pentagonal(q) == 35

    def test_d_51_is_pentagonal_at_index_q_plus_1(self):
        from urt.shell_closure import q
        assert pentagonal(q + 1) == 51

    def test_quartet_audit_all_match(self):
        assert pentagonal_quartet()["all_match"]


# ── Connection 2: A_5 conjugacy classes ──────────────────────────────────

class TestA5ConjugacyClasses:
    def test_five_classes(self):
        from urt.shell_closure import q
        assert a5_conjugacy_classes()["n_classes"] == q

    def test_class_sizes_in_cathedral_form(self):
        """Sizes are {1, D·q, F, V, V}."""
        from urt.shell_closure import D, q, F, V
        sizes = a5_conjugacy_classes()["sizes"]
        assert sorted(sizes) == sorted([1, D * q, F, V, V])

    def test_sum_equals_G(self):
        from urt.shell_closure import G
        assert a5_conjugacy_classes()["sum"] == G

    def test_size_15_is_D_times_q(self):
        from urt.shell_closure import D, q
        assert 15 == D * q


# ── Connection 3: A_5 irreps ─────────────────────────────────────────────

class TestA5Irreps:
    def test_five_irreps(self):
        from urt.shell_closure import q
        assert a5_irreps()["n_irreps"] == q

    def test_irrep_dims_in_cathedral_form(self):
        """Dims are {1, D, D, D+1, q}."""
        from urt.shell_closure import D, q
        dims = a5_irreps()["dimensions"]
        assert sorted(dims) == sorted([1, D, D, D + 1, q])

    def test_sum_of_squares_equals_G(self):
        """Burnside identity: Σdim² = |G| = 60."""
        from urt.shell_closure import G
        assert a5_irreps()["sum_of_squares"] == G

    def test_largest_dim_is_q(self):
        from urt.shell_closure import q
        assert a5_irreps()["largest_dim"] == q


# ── Connection 4: Spectrum sector sums ───────────────────────────────────

class TestSpectrumSectorSums:
    def test_K4_has_four_modes(self):
        assert spectrum_sector_sums()["K4_count"] == 4

    def test_A5_has_nine_modes(self):
        assert spectrum_sector_sums()["A5_count"] == 9

    def test_K4_trace_is_11(self):
        assert spectrum_sector_sums()["K4_sum"] == pytest.approx(11.0, abs=1e-9)

    def test_A5_trace_is_61(self):
        assert spectrum_sector_sums()["A5_sum"] == pytest.approx(61.0, abs=1e-9)

    def test_total_trace_is_D_factorial_times_V(self):
        from urt.shell_closure import V
        s = spectrum_sector_sums()
        assert s["total_trace"] == pytest.approx(6 * V, abs=1e-9)
        assert s["trace_equals_D!_V"]


# ── Connection 5: Perfect-number doublet ─────────────────────────────────

class TestPerfectNumberDoublet:
    def test_D_factorial_is_first_perfect(self):
        """D! = 6 is the smallest perfect number."""
        assert is_perfect(6)
        from urt.shell_closure import D
        from math import factorial
        assert factorial(D) == 6

    def test_sigma_V_is_second_perfect(self):
        """σ(V) = σ(12) = 28 is the 2nd perfect number."""
        from urt.shell_closure import V
        assert divisor_sum(V) == 28
        assert is_perfect(28)

    def test_doublet_audit(self):
        d = perfect_number_doublet()
        assert d["first_is_perfect"]
        assert d["second_via_sigma_V_is_28"]
        assert d["second_is_perfect"]


# ── Connection 6: Triangular triplet ─────────────────────────────────────

class TestTriangularTriplet:
    def test_T2_is_D(self):
        from urt.shell_closure import D
        assert triangular(2) == D

    def test_T3_is_D_factorial(self):
        from math import factorial
        from urt.shell_closure import D
        assert triangular(3) == factorial(D)

    def test_T7_is_sigma_V(self):
        from urt.shell_closure import V
        assert triangular(7) == divisor_sum(V)

    def test_triplet_indices_are_2_3_7(self):
        assert triangular_triplet()["indices"] == [2, 3, 7]


# ── Connection 7: G factorization + V·F = E_8 root count ────────────────

class TestGFactorization:
    def test_G_factorizes_as_K4_D_q(self):
        """G = (D+1)·D·q = 4·3·5 = 60."""
        from urt.shell_closure import D, q, G
        assert (D + 1) * D * q == G

    def test_VF_product_is_240(self):
        """V·F = 240 — the E_8 root count."""
        from urt.shell_closure import V, F
        assert V * F == 240

    def test_VF_equals_4G(self):
        from urt.shell_closure import V, F, G
        assert V * F == 4 * G

    def test_VF_equals_K4_times_G(self):
        from urt.shell_closure import D, V, F, G
        assert V * F == (D + 1) * G

    def test_audit_passes(self):
        gf = G_factorization()
        assert gf["G_factorization"]["equals_G"]
        assert gf["VF_equals_4G"]
        assert gf["VF_equals_E8_roots"]


# ── Connection 8: orbit-stabilizer triple ────────────────────────────────

class TestOrbitStabilizerTriple:
    def test_V_is_G_over_q(self):
        from urt.shell_closure import V, q, G
        assert V == G // q

    def test_F_is_G_over_D(self):
        from urt.shell_closure import F, D, G
        assert F == G // D

    def test_E_is_G_over_two(self):
        from urt.shell_closure import E, G
        assert E == G // 2

    def test_stabilizer_orders_are_first_three_primes(self):
        from urt.shell_closure import D, q
        assert sorted([D - 1, D, q]) == [2, 3, 5]

    def test_audit_passes(self):
        ost = orbit_stabilizer_triple()
        assert ost["V_match"] and ost["E_match"] and ost["F_match"]
        assert ost["stabilizer_orders_are_first_three_primes"]


# ── Connection 9: vertex-face incidence ──────────────────────────────────

class TestVertexFaceIncidence:
    def test_D_times_F_equals_G(self):
        from urt.shell_closure import D, F, G
        assert D * F == G

    def test_q_times_V_equals_G(self):
        from urt.shell_closure import q, V, G
        assert q * V == G

    def test_F_factors_as_K4_q(self):
        """F = (D+1)·q — the K_4 size bridges to face count."""
        from urt.shell_closure import D, q, F
        assert F == (D + 1) * q

    def test_V_factors_as_K4_D(self):
        from urt.shell_closure import D, V
        assert V == (D + 1) * D

    def test_audit_passes(self):
        vfi = vertex_face_incidence()
        assert vfi["both_equal_G"]
        assert vfi["F_via_K4"]
        assert vfi["V_via_K4"]


# ── End-to-end audit ─────────────────────────────────────────────────────

class TestAllConnectionsAudit:
    def test_audit_returns_nine_clusters(self):
        a = all_connections_audit()
        assert set(a.keys()) == {
            "pentagonal_quartet",
            "a5_conjugacy_classes",
            "a5_irreps",
            "spectrum_sector_sums",
            "perfect_number_doublet",
            "triangular_triplet",
            "G_factorization",
            "orbit_stabilizer_triple",
            "vertex_face_incidence",
        }

    def test_all_connections_verify(self):
        """Single CI gate: every connection holds."""
        assert all_connections_verify()
