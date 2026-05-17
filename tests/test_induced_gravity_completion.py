"""
Tests for urt.induced_gravity_completion — closes all three "Honest Scope"
items from v2.9.92 (first-principles matching, K_4 vs A_5 sector
decomposition, quantum gravity at one loop).
"""
from math import pi, factorial
import pytest

from urt.induced_gravity_completion import (
    D, q, V_INT, N, GAMMA, DELTA_STAR, G_N_CATH, M_PL_SQ,
    K4_NONZERO_SPECTRUM, A5_SPECTRUM, FULL_NONZERO_SPECTRUM,
    first_principles_matching, matching_is_first_principles,
    K4_mode_count, A5_mode_count,
    sector_induced_gravity,
    G_N_K4_sector, G_N_A5_sector, G_N_total_combined,
    sector_decomposition_audit,
    trace_L_power, trace_L2_cathedral_decomposition,
    sector_trace_L_squared,
    one_loop_curvature_coefficients,
    quantum_gravity_one_loop_summary,
    all_items_closed_audit,
    induced_gravity_completion_audit_passes,
)

D_FAC = factorial(D)


# ── Spectrum is correct ──────────────────────────────────────────────────

class TestSpectrum:
    def test_K4_nonzero_modes_total_D(self):
        """K_4 has 3 = D non-zero modes."""
        total = sum(m for _, m in K4_NONZERO_SPECTRUM)
        assert total == D

    def test_A5_modes_total_D_squared(self):
        """A_5 has 9 = D² modes (no zero mode)."""
        total = sum(m for _, m in A5_SPECTRUM)
        assert total == D ** 2

    def test_full_spectrum_has_V_modes(self):
        total = sum(m for _, m in FULL_NONZERO_SPECTRUM)
        assert total == V_INT


# ── ITEM 1: First-principles matching ───────────────────────────────────

class TestFirstPrinciplesMatching:
    def test_matching_is_first_principles(self):
        assert matching_is_first_principles()

    def test_derived_not_chosen(self):
        info = first_principles_matching()
        assert info["derived_not_chosen"]

    def test_zero_free_parameters(self):
        info = first_principles_matching()
        assert info["free_parameters"] == 0

    def test_Lambda_squared_over_MPl_squared(self):
        info = first_principles_matching()
        assert info["Lambda_over_MPl_sq"] == pytest.approx(D_FAC * pi)

    def test_closed_form_string(self):
        info = first_principles_matching()
        assert "D!" in info["closed_form"]
        assert "π" in info["closed_form"]


# ── ITEM 2: K_4 / A_5 sector decomposition ───────────────────────────────

class TestSectorDecomposition:
    def test_K4_mode_count_is_D(self):
        assert K4_mode_count() == D

    def test_A5_mode_count_is_D_squared(self):
        assert A5_mode_count() == D ** 2

    def test_total_is_V(self):
        assert K4_mode_count() + A5_mode_count() == V_INT

    def test_total_is_D_times_D_plus_1(self):
        """V = D + D² = D·(D+1)."""
        assert V_INT == D * (D + 1)

    def test_A5_K4_ratio_is_D(self):
        sd = sector_induced_gravity()
        assert sd["A5_K4_ratio"] == pytest.approx(D)

    def test_K4_share_is_1_over_D_plus_1(self):
        sd = sector_induced_gravity()
        assert sd["K4_inv_G_share"] == pytest.approx(1 / (D + 1))

    def test_A5_share_is_D_over_D_plus_1(self):
        sd = sector_induced_gravity()
        assert sd["A5_inv_G_share"] == pytest.approx(D / (D + 1))

    def test_shares_sum_to_one(self):
        sd = sector_induced_gravity()
        assert sd["K4_inv_G_share"] + sd["A5_inv_G_share"] == pytest.approx(1.0)

    def test_K4_G_N_formula(self):
        """G^(K_4) = 6π / (D · Λ²)."""
        Lam_sq = 100.0
        assert G_N_K4_sector(Lam_sq) == pytest.approx(6 * pi / (D * Lam_sq))

    def test_A5_G_N_formula(self):
        """G^(A_5) = 6π / (D² · Λ²)."""
        Lam_sq = 100.0
        assert G_N_A5_sector(Lam_sq) == pytest.approx(6 * pi / (D ** 2 * Lam_sq))

    def test_combined_G_matches_total(self):
        """1/G_total = 1/G^K4 + 1/G^A5 ⇒ G_total = 6π/(V · Λ²)."""
        Lam_sq = 100.0
        assert G_N_total_combined(Lam_sq) == pytest.approx(6 * pi / (V_INT * Lam_sq))

    def test_audit_passes(self):
        assert sector_decomposition_audit()


# ── ITEM 3: Quantum gravity at one loop ─────────────────────────────────

class TestQuantumGravityOneLoop:
    def test_trace_L_is_DfacV(self):
        assert trace_L_power(1) == D_FAC * V_INT
        assert trace_L_power(1) == 72

    def test_trace_L_squared(self):
        assert trace_L_power(2) == 516

    def test_trace_L_cubed(self):
        assert trace_L_power(3) == 4416

    def test_trace_L_fourth(self):
        assert trace_L_power(4) == 43836

    def test_trace_L2_cathedral_decomposition(self):
        """tr(L²) = 2D² + D!·q² + (D-1)(D!+1)² + D⁴ + N²."""
        tdec = trace_L2_cathedral_decomposition()
        assert tdec["matches"]
        assert tdec["sum"] == 516

    def test_trace_L2_cathedral_terms(self):
        """Verify each Cathedral term in the tr(L²) decomposition."""
        tdec = trace_L2_cathedral_decomposition()
        pieces = tdec["pieces"]
        assert pieces["λ=D term (m=2)"] == 2 * D ** 2          # 18
        assert pieces["λ=q term (m=D!)"] == D_FAC * q ** 2     # 150
        assert pieces["λ=D!+1 term (m=D-1)"] == (D - 1) * (D_FAC + 1) ** 2  # 98
        assert pieces["λ=D² term (m=1)"] == D ** 4             # 81
        assert pieces["λ=N term (m=1)"] == N ** 2              # 169

    def test_sector_trace_L_squared_K4(self):
        st = sector_trace_L_squared()
        assert st["K4_tr_L2"] == 2 * D ** 2 + q ** 2   # 18 + 25 = 43
        assert st["K4_tr_L2"] == 43

    def test_sector_trace_L_squared_A5(self):
        st = sector_trace_L_squared()
        assert st["A5_tr_L2"] == 473

    def test_sector_trL2_sum_is_trL2_total(self):
        st = sector_trace_L_squared()
        assert st["total"] == trace_L_power(2)
        assert st["total_matches_trL2"]


# ── Curvature coefficients ───────────────────────────────────────────────

class TestCurvatureCoefficients:
    def test_R0_coefficient(self):
        c = one_loop_curvature_coefficients()
        assert c["R^0_coefficient_cosmological"]["value"] == N

    def test_R1_coefficient(self):
        c = one_loop_curvature_coefficients()
        assert c["R^1_coefficient_Newton"]["trace_value"] == D_FAC * V_INT

    def test_R2_coefficient(self):
        c = one_loop_curvature_coefficients()
        assert c["R^2_coefficient_Starobinsky"]["trace_value"] == 516

    def test_R3_coefficient(self):
        c = one_loop_curvature_coefficients()
        assert c["R^3_coefficient"]["trace_value"] == 4416

    def test_R4_coefficient(self):
        c = one_loop_curvature_coefficients()
        assert c["R^4_coefficient"]["trace_value"] == 43836

    def test_starobinsky_link(self):
        c = one_loop_curvature_coefficients()
        assert "inflation_cathedral" in c["R^2_coefficient_Starobinsky"]["starobinsky_link"]


# ── All three items closed ──────────────────────────────────────────────

class TestAllClosed:
    def test_item_1_closed(self):
        status = all_items_closed_audit()
        assert status["first_principles_matching"]

    def test_item_2_closed(self):
        status = all_items_closed_audit()
        assert status["sector_decomposition"]

    def test_item_3_closed(self):
        status = all_items_closed_audit()
        assert status["quantum_gravity_one_loop"]

    def test_all_three_closed(self):
        status = all_items_closed_audit()
        assert status["all_three_closed"]


# ── End-to-end CI gate ───────────────────────────────────────────────────

def test_audit_passes():
    assert induced_gravity_completion_audit_passes()


def test_qg_summary_has_expected_keys():
    qg = quantum_gravity_one_loop_summary()
    required = {"expansion_order", "coefficients", "sector_decomp_R2",
                "starobinsky_inflation", "starobinsky_predicts_observation"}
    assert required <= set(qg.keys())
