"""Tests for the 6-cycle Cathedral structure module."""
from math import factorial

from urt.shell_closure import D, q, V, N, DELTA_STAR, delta_cl, Delta
from urt.six_cycle_cathedral import (
    R_SIX_CYCLE,
    cycle_in_iteration_order,
    cycle_pairs,
    z3_z2_structure,
    gap_as_z2_splitting,
    delta_star_to_delta_cl_in_3_iterations,
    cycle_order_is_D_factorial,
    six_cycle_audit,
    six_cycle_audit_passes,
)


class TestCycleSequence:
    def test_six_branches(self):
        """The cycle has D! = 6 branches."""
        seq = cycle_in_iteration_order()
        assert len(seq) == factorial(D) == 6

    def test_position_zero_is_lowest(self):
        """Position 0 of the iteration order is the lowest branch (≈ δ★)."""
        seq = cycle_in_iteration_order()
        assert seq[0] < 0.16
        assert seq[0] > 0.14

    def test_position_D_is_delta_cl(self):
        """Position D = 3 in iteration order is ≈ δ_cl = 0.15."""
        seq = cycle_in_iteration_order()
        assert abs(seq[D] - 0.15) < 1e-3

    def test_strictly_three_levels(self):
        """The branches partition into low (<0.2), mid (~0.5), high (~0.96)."""
        seq = cycle_in_iteration_order()
        assert all(b < 0.2 for b in (seq[0], seq[3]))
        assert all(0.4 < b < 0.5 for b in (seq[1], seq[4]))
        assert all(b > 0.95 for b in (seq[2], seq[5]))


class TestCyclePairs:
    def test_three_pairs(self):
        """The cycle decomposes into low / mid / high pairs."""
        p = cycle_pairs()
        assert "low" in p and "mid" in p and "high" in p

    def test_low_pair_has_delta_star_and_delta_cl(self):
        """The low pair = (δ★ approx, δ_cl approx)."""
        p = cycle_pairs()
        assert abs(p["low"]["a"] - DELTA_STAR) < 0.001
        assert abs(p["low"]["b"] - 0.15) < 0.001

    def test_pair_splittings_are_positive(self):
        """All pair splittings (b − a) are positive."""
        p = cycle_pairs()
        for level in ("low", "mid", "high"):
            assert p[level]["splitting"] > 0

    def test_low_pair_splitting_matches_Delta(self):
        """The low-pair splitting matches the framework gap Δ within 5%."""
        p = cycle_pairs()
        ratio = p["low"]["splitting"] / Delta
        assert abs(ratio - 1.0) < 0.05


class TestZ3Z2Structure:
    def test_cycle_order_is_six(self):
        """Cycle order = 6 = D!."""
        z = z3_z2_structure()
        assert z["cycle_order"] == factorial(D) == 6

    def test_factorisation_is_Z3_x_Z2(self):
        z = z3_z2_structure()
        assert z["Z_3_x_Z_2_eq_Z_6"]


class TestGapAsZ2Splitting:
    def test_audit_within_5_percent(self):
        g = gap_as_z2_splitting()
        assert g["agreement_within_5_pct"]

    def test_low_pair_splitting_value(self):
        """Low-pair splitting is in the millivolt-equivalent range of Δ."""
        g = gap_as_z2_splitting()
        assert 2.0e-3 < g["low_pair_splitting"] < 3.0e-3

    def test_closed_form_gap_matches_shell_closure_Delta(self):
        g = gap_as_z2_splitting()
        assert g["closed_form_gap"] == Delta


class TestDeltaStarToDeltaCl:
    def test_iterations_apart_is_D(self):
        """δ★ → δ_cl in exactly D = 3 iterations of f."""
        s = delta_star_to_delta_cl_in_3_iterations()
        assert s["iterations_apart"] == D == 3
        assert s["iterations_eq_D"]

    def test_starts_near_delta_star(self):
        s = delta_star_to_delta_cl_in_3_iterations()
        assert abs(s["starting"] - DELTA_STAR) < 0.001

    def test_after_D_steps_near_delta_cl(self):
        s = delta_star_to_delta_cl_in_3_iterations()
        assert abs(s["after_D_iterations"] - 0.15) < 0.001
        assert s["approx_delta_cl"]


class TestCycleOrder:
    def test_period_is_D_factorial(self):
        c = cycle_order_is_D_factorial()
        assert c["period"] == factorial(D) == 6
        assert c["is_D_factorial"]

    def test_period_is_S_D_order(self):
        """6 = |S_3| = D! — also the order of the smallest non-abelian group."""
        c = cycle_order_is_D_factorial()
        assert c["is_S_D_order"]


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert six_cycle_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = six_cycle_audit()
        for key in ("r", "iteration_order", "pairs", "z3_z2",
                    "gap_as_splitting", "delta_star_to_delta_cl",
                    "cycle_order"):
            assert key in a

    def test_r_value(self):
        a = six_cycle_audit()
        assert abs(a["r"] - 3.8417) < 0.001
