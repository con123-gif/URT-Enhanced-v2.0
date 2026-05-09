"""
6-cycle ladder mining — what physical observables do the four unknown
branches of the logistic 6-cycle correspond to?

The Cathedral identifies branch 1 ≈ δ★ and branch 4 ≈ δ_cl.  The remaining
four branches are unassigned in any document.  This file is the
exploration record.

Cycle (verified to 1e-13 in test_logistic_six_cycle.py):
    B_1 = 0.1474219361622878    ≈ δ★         (vacuum)
    B_2 = 0.4828583491613422    [unknown]
    B_3 = 0.9592962413714381    [unknown]
    B_4 = 0.1500067276982269    ≈ δ_cl       (classical)
    B_5 = 0.4898348785861162    [unknown]
    B_6 = 0.9600281102477677    [unknown]

Findings recorded as tests
--------------------------
1. The cycle has a Z_3 × Z_2 substructure: three approximate levels
     {0.149, 0.486, 0.960} (Z_3)
   each level a close pair (Z_2):
     |B_1 - B_4| = 0.0026
     |B_2 - B_5| = 0.0070
     |B_3 - B_6| = 0.0007

2. arccos(B_3) ≈ 16.40°, arccos(B_6) ≈ 16.26°.  The average ≈ 16.33° is
   within 0.6° of the framework's "physical rail" 2·δ★° ≈ 16.902°.
   Suggestive but not exact.

3. **No unknown branch matches any standard dimensionless observable
   (sin θ_C, sin²θ_W, 1/φ, golden-ratio fractions, etc.) to better than
   1.4 %.**  The cycle is its own thing — it is *not* a hidden encoding
   of every PDG number.

4. The cycle's mean ≈ 0.5158 — close to but not exactly 1/2.

The work is preserved here so any future reader can extend it: add
candidate observables to KNOWN_OBSERVABLES and the assertions will
re-evaluate them.
"""
from math import asin, acos, cos, degrees, pi, sqrt

import pytest


phi = (1 + sqrt(5)) / 2
LOGISTIC_6_CYCLE = (
    0.1474219361622878,
    0.4828583491613422,
    0.9592962413714381,
    0.1500067276982269,
    0.4898348785861162,
    0.9600281102477677,
)


# ── Z_3 × Z_2 substructure ────────────────────────────────────────────────

class TestZ3Z2Substructure:
    """The 6-cycle decomposes into 3 levels × 2 close-pair branches."""

    def test_pairs_are_close(self):
        b = LOGISTIC_6_CYCLE
        d_low = abs(b[0] - b[3])
        d_mid = abs(b[1] - b[4])
        d_high = abs(b[2] - b[5])
        assert d_low  < 1e-2
        assert d_mid  < 1e-2
        assert d_high < 1e-3        # the high pair is the closest

    def test_three_levels_are_separated(self):
        b = LOGISTIC_6_CYCLE
        low  = (b[0] + b[3]) / 2
        mid  = (b[1] + b[4]) / 2
        high = (b[2] + b[5]) / 2
        assert low < 0.20
        assert 0.45 < mid < 0.50
        assert 0.95 < high < 0.97
        assert mid - low > 0.30
        assert high - mid > 0.45

    def test_high_level_is_around_0_96(self):
        """The top level is 0.96 ± 0.01."""
        b = LOGISTIC_6_CYCLE
        high = (b[2] + b[5]) / 2
        assert abs(high - 0.96) < 0.005

    def test_arccos_of_high_branches_near_2_delta_star_deg(self):
        """arccos of the top branches ≈ 16.3° ≈ 2·δ★° ≈ 16.9° (0.6° gap)."""
        from urt.shell_closure import DELTA_STAR
        physical_rail_deg = 2 * DELTA_STAR * 180/pi  # ≈ 16.902°
        ac3 = degrees(acos(LOGISTIC_6_CYCLE[2]))
        ac6 = degrees(acos(LOGISTIC_6_CYCLE[5]))
        avg = (ac3 + ac6) / 2
        assert abs(avg - physical_rail_deg) < 1.0   # gap 0.6° → suggestive


# ── Negative result: no obvious physical match ────────────────────────────

KNOWN_OBSERVABLES = {
    "sin θ_C (Cabibbo)":   0.225,
    "sin² θ_C":            0.0506,
    "cos θ_C":             0.974,
    "sin² θ_W":            0.23122,
    "1/φ":                 1/phi,
    "1/φ²":                1/phi**2,
    "φ - 1":               phi - 1,
    "1 - 1/φ":             1 - 1/phi,
    "(√5-1)/4":            (sqrt(5)-1)/4,
    "1/√2":                1/sqrt(2),
    "1/(2π)":              1/(2*pi),
    "ln 2":                0.69315,
    "π/4":                 pi/4,
    "α (PDG)":             1/137.036,
    "α_s(M_Z)":            0.1180,
}

UNKNOWN_BRANCHES = {
    "B_2": LOGISTIC_6_CYCLE[1],
    "B_3": LOGISTIC_6_CYCLE[2],
    "B_5": LOGISTIC_6_CYCLE[4],
    "B_6": LOGISTIC_6_CYCLE[5],
}


class TestNoCleanMatch:
    """Document the negative result: the unknown branches do not match
    any known dimensionless physical observable to better than 1 %."""

    @pytest.mark.parametrize("branch_name,value", list(UNKNOWN_BRANCHES.items()))
    def test_no_observable_match_within_one_percent(self, branch_name, value):
        for obs_name, obs_val in KNOWN_OBSERVABLES.items():
            if obs_val == 0:
                continue
            rel_err = abs(value - obs_val) / abs(obs_val)
            assert rel_err > 0.01, (
                f"Surprise! {branch_name} = {value} matches {obs_name} = {obs_val} "
                f"to {rel_err*100:.3f} %.  Add this to the framework."
            )


# ── The cycle's deepest known identity (asserted) ─────────────────────────

class TestCycleDeepestIdentity:
    """The cycle's defining feature: 3 iterations of f maps δ★_log → δ_cl."""

    def test_f3_takes_branch1_to_branch4(self):
        """δ_cl is the third logistic iterate of δ★_log to ~1e-3."""
        r = 3.8417002878419497
        x = LOGISTIC_6_CYCLE[0]
        for _ in range(3):
            x = r * x * (1 - x)
        assert abs(x - LOGISTIC_6_CYCLE[3]) < 1e-3

    def test_cycle_mean(self):
        """The cycle's mean ≈ 0.5316 (recorded value, ≠ 1/2)."""
        m = sum(LOGISTIC_6_CYCLE) / 6
        # Empirical: 0.5316.  Not 1/2 = 0.5.  Documented as not-1/2.
        assert 0.52 < m < 0.54
        assert abs(m - 0.5) > 0.02
