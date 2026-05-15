"""Tests for the structural DOF reduction audit."""
import pytest

from urt.structural_dof import (
    SlotDOF, FAMILY_SLOTS,
    INT_SLOTS, GAMMA_SLOTS, DELTA_SLOTS, TRIG_SLOTS,
    family_free_dof, family_forced_dof, family_savings,
    total_free_budget_bits, total_forced_budget_bits,
    net_information_after_structural_reduction,
    per_family_summary,
    structural_reductions_are_strict,
    total_savings_positive,
    framework_is_tight_with_structural_reductions,
    structural_dof_audit_passes,
)
from urt.unified_recipe import information_delivered_bits


# ── Slot decomposition is non-trivial ───────────────────────────────────

def test_every_family_has_slots():
    assert len(INT_SLOTS) >= 1
    assert len(GAMMA_SLOTS) >= 3
    assert len(DELTA_SLOTS) >= 3
    assert len(TRIG_SLOTS) >= 3


def test_family_slots_dict_keys():
    assert set(FAMILY_SLOTS.keys()) == {"INT", "GAMMA_LADDER", "DELTA_STAR_LIN", "TRIG_WRAPPER"}


def test_each_slot_has_reason_string():
    for slots in FAMILY_SLOTS.values():
        for s in slots:
            assert isinstance(s.reason, str)
            assert len(s.reason) > 20, f"reason too short: {s.name}"


# ── Reductions are strict and meaningful ────────────────────────────────

def test_every_slot_forced_le_free():
    """Structural reduction can only lower (or preserve) DOF, not raise it."""
    assert structural_reductions_are_strict()


def test_every_family_has_positive_savings():
    for fam in FAMILY_SLOTS:
        assert family_free_dof(fam) > family_forced_dof(fam), \
            f"family {fam} got no structural savings"
        assert family_savings(fam) > 0


def test_total_savings_positive():
    assert total_savings_positive()


# ── Net information after reduction ─────────────────────────────────────

def test_forced_budget_strictly_less_than_free_budget():
    assert total_forced_budget_bits() < total_free_budget_bits()


def test_net_information_after_reduction_is_positive():
    net = net_information_after_structural_reduction()
    assert net > 0, f"net info bits after structural reduction = {net}"


def test_net_information_strictly_increases_with_reductions():
    """The structural reductions must produce a stronger TIGHT verdict."""
    info = information_delivered_bits()
    net_free = info - total_free_budget_bits()
    net_forced = info - total_forced_budget_bits()
    assert net_forced > net_free


def test_decisively_tight_threshold():
    """With reductions, we should clear the +40-bit "decisively tight" line."""
    net = net_information_after_structural_reduction()
    assert net > 40, f"net info = {net}, expected > 40 for decisively-tight"


# ── Per-family summary ──────────────────────────────────────────────────

def test_per_family_summary_complete():
    s = per_family_summary()
    assert set(s.keys()) <= {"INT", "GAMMA_LADDER", "DELTA_STAR_LIN", "TRIG_WRAPPER"}
    for fam, rec in s.items():
        assert "n_obs" in rec
        assert "free_total" in rec
        assert "forced_total" in rec
        assert "savings" in rec
        assert rec["savings"] > 0


def test_INT_carries_largest_observable_count():
    s = per_family_summary()
    if "INT" in s:
        for fam, rec in s.items():
            if fam == "INT":
                continue
            assert s["INT"]["n_obs"] >= rec["n_obs"], \
                "INT family should be largest by count"


# ── Composite CI gate ───────────────────────────────────────────────────

def test_structural_dof_audit_passes():
    assert structural_dof_audit_passes()


def test_framework_is_tight():
    assert framework_is_tight_with_structural_reductions()


def test_three_tier_table_has_required_keys():
    from urt.structural_dof import three_tier_dof_table
    t = three_tier_dof_table()
    expected = {
        "info_delivered", "brute_force_budget",
        "free_4_template_budget", "forced_structural_budget",
        "net_vs_brute_force", "net_vs_free_4_template",
        "net_vs_forced_structural",
        "savings_brute_to_free", "savings_free_to_forced",
        "total_savings",
    }
    assert set(t.keys()) == expected


def test_brute_force_budget_greater_than_free_budget():
    """Brute-force search has more freedom than a 4-template scheme."""
    from urt.structural_dof import (
        brute_force_budget_bits, total_free_budget_bits,
    )
    assert brute_force_budget_bits() > total_free_budget_bits()


def test_free_budget_greater_than_forced_budget():
    """Structural reductions strictly tighten the 4-template free budget."""
    from urt.structural_dof import (
        total_free_budget_bits, total_forced_budget_bits,
    )
    assert total_free_budget_bits() > total_forced_budget_bits()


def test_three_tier_savings_chain_positive():
    """Each tier saves more than the next: brute > free > forced."""
    from urt.structural_dof import three_tier_dof_table
    t = three_tier_dof_table()
    assert t["savings_brute_to_free"] > 0
    assert t["savings_free_to_forced"] > 0
    assert t["total_savings"] > t["savings_brute_to_free"]
    assert t["total_savings"] > t["savings_free_to_forced"]


def test_brute_force_overfits_but_forced_is_tight():
    """The progression: brute-force fails the audit, but forced-structural passes."""
    from urt.structural_dof import three_tier_dof_table
    t = three_tier_dof_table()
    assert t["net_vs_brute_force"] < 0       # overfitting
    assert t["net_vs_forced_structural"] > 0  # decisively tight
