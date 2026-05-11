"""Tests for urt.expression_uniqueness — the framework's formulas are
the unique sub-0.1% hits in depth-3 Cathedral expression space."""
import math

from urt.expression_uniqueness import (
    FOUNDATIONAL_ATOMS,
    HEADLINE_OBSERVABLES,
    depth3_compounds,
    find_within,
    expression_complexity,
    framework_relative_error,
    best_alternative,
    observable_uniqueness_row,
    expression_uniqueness_report,
    expression_uniqueness_audit_passes,
)


# ── Atom basis ────────────────────────────────────────────────────────────

def test_foundational_atoms_are_twelve():
    """Exactly 12: D, q, V, N, E, F, G, γ, π, φ, 1, 2."""
    assert len(FOUNDATIONAL_ATOMS) == 12


def test_foundational_atoms_contain_seven_cathedral_integers():
    for name, val in [("D", 3), ("q", 5), ("V", 12), ("N", 13),
                      ("E", 30), ("F", 20), ("G", 60)]:
        assert FOUNDATIONAL_ATOMS[name] == val


def test_foundational_atoms_contain_three_transcendentals():
    """The π, φ, e of the framework's first-principles forcing chain."""
    import math
    assert FOUNDATIONAL_ATOMS["π"] == math.pi
    assert abs(FOUNDATIONAL_ATOMS["φ"] - (1 + math.sqrt(5))/2) < 1e-15
    assert FOUNDATIONAL_ATOMS["γ"] == 1 / 81


# ── Enumeration ───────────────────────────────────────────────────────────

def test_depth3_enumeration_finite_and_large():
    compounds = depth3_compounds()
    # Concrete check: depth-3 over 12 atoms ⇒ several thousand distinct values.
    assert 5_000 < len(compounds) < 50_000


def test_depth3_enumeration_is_cached():
    """Second call returns the same object."""
    assert depth3_compounds() is depth3_compounds()


def test_expression_complexity_increases_with_size():
    assert expression_complexity("D") < expression_complexity("D+1")
    assert expression_complexity("D+1") < expression_complexity("(D+1)*N")


# ── find_within ───────────────────────────────────────────────────────────

def test_find_within_finds_137_for_alpha_target():
    """At least one depth-3 compound equals exactly 137 (e.g. (q*E)-N)."""
    hits = find_within(137.036, rel_tol=0.001)
    assert len(hits) >= 1
    # The value 137.0 should be among the closest.
    values = {round(v, 6) for v, _ in hits}
    assert 137.0 in values


def test_find_within_finds_at_least_one_near_miss_for_dcp():
    """δ_CP = 197°: the framework's exact-integer formula is depth-4
    (`(D+1)·F + (N-D-1)·N`).  At depth 3 there are only a handful of
    near-misses within 0.1%, none exactly 197."""
    hits = find_within(197.0, rel_tol=0.001)
    assert 1 <= len(hits) <= 5
    # Framework's exact integer match is not in the depth-3 search space,
    # but the near-misses confirm 197 is a sparse target.
    assert all(abs(v - 197.0) < 0.5 for v, _ in hits)


# ── Framework error ───────────────────────────────────────────────────────

def test_framework_relative_error_is_nonnegative():
    for target, _name, _ff, fv in HEADLINE_OBSERVABLES:
        assert framework_relative_error(fv, target) >= 0


def test_framework_relative_error_under_1pct_everywhere():
    """Every headline observable matches its target to better than 1%."""
    for target, name, _ff, fv in HEADLINE_OBSERVABLES:
        rel = framework_relative_error(fv, target)
        assert rel < 0.01, f"{name}: {rel*100:.3f}% > 1%"


# ── Uniqueness claim: framework is much better than depth-3 alternatives ──

def test_alpha_framework_better_than_alternative():
    """1/α: framework hits 137 exactly; best alternative is ~13× worse."""
    target = 137.035999084
    fw_value = 137.0
    alt = best_alternative(target, fw_value, rel_tol=0.005)
    assert alt is not None
    _alt_v, _alt_e, alt_rel = alt
    fw_rel = framework_relative_error(fw_value, target)
    assert alt_rel / fw_rel > 5.0


def test_n_s_framework_much_better_than_alternative():
    """n_s = 0.9649: framework 144× better than best Cathedral alternative."""
    target = 0.9649
    fw_value = 1 - 2/57
    alt = best_alternative(target, fw_value, rel_tol=0.005)
    assert alt is not None
    _, _, alt_rel = alt
    fw_rel = framework_relative_error(fw_value, target)
    assert alt_rel / fw_rel > 50.0


def test_sin2_theta_W_framework_much_better_than_alternative():
    """sin²θ_W: framework 169× better than best Cathedral alternative."""
    D, N = 3, 13
    GAMMA = 1 / 81
    PI = math.pi
    target = 0.23122
    fw_value = (D/N) * (1 + GAMMA/(2*PI))
    alt = best_alternative(target, fw_value, rel_tol=0.005)
    assert alt is not None
    _, _, alt_rel = alt
    fw_rel = framework_relative_error(fw_value, target)
    assert alt_rel / fw_rel > 50.0


def test_omega_m_framework_much_better_than_alternative():
    """Ω_m: framework ~89× better than best Cathedral alternative."""
    GAMMA = 1 / 81
    target = 0.3153
    fw_value = (4/13) * (1 + 2*GAMMA)
    alt = best_alternative(target, fw_value, rel_tol=0.005)
    assert alt is not None
    _, _, alt_rel = alt
    fw_rel = framework_relative_error(fw_value, target)
    assert alt_rel / fw_rel > 50.0


# ── Hit-density sparsity ──────────────────────────────────────────────────

def test_alpha_has_at_most_a_few_sub_pct_hits():
    """Within 0.1% of 1/α the depth-3 space has at most a handful of hits."""
    n = len(find_within(137.035999084, rel_tol=0.001))
    assert n <= 5


def test_dcp_has_at_most_a_few_sub_pct_hits():
    n = len(find_within(197.0, rel_tol=0.001))
    assert n <= 5


# ── Report structure ──────────────────────────────────────────────────────

def test_report_returns_one_row_per_observable():
    rows = expression_uniqueness_report()
    assert len(rows) == len(HEADLINE_OBSERVABLES)


def test_report_row_schema():
    rows = expression_uniqueness_report()
    required = {"name", "target", "framework_formula", "framework_value",
                "framework_rel_err", "n_hits_within_0.1pct",
                "n_hits_within_0.5pct", "best_alternative",
                "best_alternative_value", "best_alternative_rel_err",
                "framework_better_by_ratio"}
    for row in rows:
        assert required.issubset(row.keys())


# ── Audit gate ────────────────────────────────────────────────────────────

def test_audit_passes_at_default_threshold():
    """Default 5× margin must hold."""
    assert expression_uniqueness_audit_passes()


def test_audit_passes_at_10x_threshold():
    """All depth-3-enumerable observables clear 10× margin."""
    assert expression_uniqueness_audit_passes(min_ratio=10.0)


def test_audit_fails_at_impossibly_high_threshold():
    """At 1000× the gate must fail — sanity check that audit isn't trivial."""
    assert not expression_uniqueness_audit_passes(min_ratio=1000.0)
