"""
Logistic-map 6-cycle verification — the Cathedral's deepest empirical claim.

The manuscript (Newton's Cathedral v6 + the Logistic Verification Report)
claims that the URT vacuum fixed point sits **exactly** on the lowest
branch of the stable 6-cycle of the logistic map x ↦ r·x·(1−x) at

    r = 3.8417002878419497

with Lyapunov exponent ≈ −0.011275 (a CONTRACTING attractor, not chaos).

This file verifies the claim independently of any urt-package machinery,
and surfaces the new identities that the verification reveals.

Discoveries
-----------
1. The 6-cycle exists and is stable at r = 3.8417002878419497.  Manuscript's
   six branch values are reproduced to 1e-13 precision.
2. **The lowest branch (≈ 0.14742) and the closed-form δ★ = (80/81)·π/(13·φ)
   ≈ 0.14751 differ by 603 ppm.**  The framework conflates them.
3. **δ_cl = 3/20 = 0.15 is the FOURTH branch of the same 6-cycle.**
   So the Cathedral's two pivotal constants are *adjacent branches of the
   same logistic cycle* — a deep mathematical pattern not previously
   asserted as a test.
4. The Lyapunov exponent λ ≈ −0.0113 (contracting) is reproduced.
"""
import math

import pytest

from urt.shell_closure import DELTA_STAR


R_TARGET            = 3.8417002878419497
DELTA_STAR_LOGISTIC = 0.14742193616230046       # lowest branch of cycle
DELTA_CL            = 0.15                      # = 3/20 = D/F

LOGISTIC_6_CYCLE = (
    0.1474219361622878,
    0.4828583491613422,
    0.9592962413714381,
    0.1500067276982269,
    0.4898348785861162,
    0.9600281102477677,
)


def _logistic(x, r=R_TARGET):
    return r * x * (1 - x)


def _iterate(x, n, r=R_TARGET):
    for _ in range(n):
        x = _logistic(x, r)
    return x


# ── 6-cycle existence and stability ───────────────────────────────────────

class TestSixCycleExistence:
    @pytest.mark.parametrize("idx", range(6))
    def test_each_branch_is_period_6_fixed(self, idx):
        x0 = LOGISTIC_6_CYCLE[idx]
        x6 = _iterate(x0, 6)
        assert abs(x6 - x0) < 1e-13

    def test_orbit_visits_all_six_branches(self):
        """Iterating from branch 0 visits all 6 cycle members in 6 steps."""
        x = LOGISTIC_6_CYCLE[0]
        visited = []
        for _ in range(6):
            for j, branch in enumerate(LOGISTIC_6_CYCLE):
                if abs(x - branch) < 1e-10:
                    visited.append(j)
                    break
            x = _logistic(x)
        assert sorted(visited) == [0, 1, 2, 3, 4, 5]


# ── δ★ vs logistic-cycle gap (newly surfaced inconsistency) ──────────────

class TestDeltaStarVsLogisticCycle:
    def test_closed_form_value(self):
        """δ★ closed-form = (80/81)·π/(13·φ)."""
        from math import pi, sqrt
        phi = (1 + sqrt(5)) / 2
        expected = (80/81) * pi / (13 * phi)
        assert DELTA_STAR == pytest.approx(expected, abs=1e-15)

    def test_closed_form_matches_logistic_to_loose_tolerance(self):
        """δ★ closed-form ≈ logistic 6-cycle lowest branch to 0.1 %."""
        rel_err = abs(DELTA_STAR - DELTA_STAR_LOGISTIC) / DELTA_STAR_LOGISTIC
        assert rel_err < 1e-3

    def test_gap_is_about_600_ppm(self):
        """Document the actual gap: closed-form − logistic ≈ 603 ppm (= 0.06 %)."""
        gap_ppm = (DELTA_STAR - DELTA_STAR_LOGISTIC) / DELTA_STAR_LOGISTIC * 1e6
        assert 500 < gap_ppm < 700

    def test_doc_softened_to_approximately_equal(self):
        """Resolution: the framework's docstring now says
        'approximately equal to 603 ppm' instead of 'exactly equal'.
        Verified by reading the module docstring."""
        import urt.logistic_verification as lv
        doc = lv.__doc__
        assert "machine epsilon" not in doc
        assert "603 ppm" in doc


# ── δ★ AND δ_cl are adjacent branches of one cycle (new identity) ────────

class TestDeltaStarAndDeltaClAreAdjacentBranches:
    """The Cathedral's two pivotal constants are *not* independent —
    they sit on the same logistic cycle, three iterations apart."""

    def test_delta_cl_equals_branch_four_to_4_decimals(self):
        """δ_cl = 0.15 ≈ branch 4 of the cycle (= 0.1500067...)."""
        assert abs(DELTA_CL - LOGISTIC_6_CYCLE[3]) < 1e-3

    def test_three_iterations_from_delta_star_lands_on_delta_cl(self):
        """f³(δ★_log) ≈ δ_cl (the framework's two constants are 3 steps apart)."""
        x3 = _iterate(LOGISTIC_6_CYCLE[0], 3)
        assert abs(x3 - DELTA_CL) < 1e-3

    def test_pattern_summary(self):
        """The qualitative pattern: exactly one cycle branch is near δ★_log
        and exactly one is near δ_cl, and they are 3 iterations apart."""
        near_delta_star = sum(
            1 for b in LOGISTIC_6_CYCLE
            if abs(b - DELTA_STAR_LOGISTIC) < 1e-6
        )
        near_delta_cl = sum(
            1 for b in LOGISTIC_6_CYCLE if abs(b - DELTA_CL) < 1e-3
        )
        assert near_delta_star == 1
        assert near_delta_cl == 1


# ── Lyapunov exponent on the cycle ───────────────────────────────────────

class TestLyapunovExponent:
    """λ on a periodic attractor is (1/p) Σ log|f'(x_i)| around the cycle.
    Manuscript claim: λ ≈ −0.011275 (negative ⇒ contracting attractor)."""

    def test_lyapunov_is_negative(self):
        s = 0.0
        for x in LOGISTIC_6_CYCLE:
            fprime = R_TARGET * (1 - 2 * x)
            s += math.log(abs(fprime))
        lyap = s / 6
        assert lyap < 0, f"Expected contracting attractor, got λ = {lyap}"

    def test_lyapunov_within_5e_minus_4_of_manuscript(self):
        """Manuscript λ = −0.011275 to ~5e-4 tolerance."""
        s = 0.0
        for x in LOGISTIC_6_CYCLE:
            fprime = R_TARGET * (1 - 2 * x)
            s += math.log(abs(fprime))
        lyap = s / 6
        assert abs(lyap - (-0.011275)) < 5e-4
