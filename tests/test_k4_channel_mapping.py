"""Tests for K_4 ⊕ A_5 channel mapping audit."""
import math
import pytest

from urt.k4_channel_mapping import (
    K4_CHANNELS, FAMILY_TO_CHANNEL, PHYSICAL_TYPE_TO_CHANNEL,
    channel_info, channel_for_family, channel_classification, channel_coverage,
    k4_cardinality, k4_cardinality_holds,
    A5_CARDINALITY, A5_FILLED, A5_OPEN_PREDICTIONS,
    a5_channel_coverage, a5_cardinality_holds,
    channel_assignment_dof_bits,
    total_template_budget_with_channels_bits,
    net_information_with_channels_bits,
    k4_channel_audit_passes, k4_strengthens_audit,
)
from urt.shell_closure import D


# ── Cardinality checks ──────────────────────────────────────────────────

def test_k4_has_exactly_4_channels():
    assert k4_cardinality() == 4
    assert k4_cardinality() == D + 1
    assert k4_cardinality_holds()


def test_a5_has_exactly_9_channels():
    assert A5_CARDINALITY == math.factorial(D) + D
    assert A5_CARDINALITY == D**2
    assert a5_cardinality_holds()


def test_K4_CHANNELS_length():
    assert len(K4_CHANNELS) == 4


# ── Family → channel mapping ────────────────────────────────────────────

def test_each_family_maps_to_unique_channel():
    families = {fam for _, _, fam, _ in K4_CHANNELS}
    assert families == {"INT", "GAMMA_LADDER", "DELTA_STAR_LIN", "TRIG_WRAPPER"}
    # every family has a unique channel index
    indices = {channel_for_family(f) for f in families}
    assert indices == {0, 1, 2, 3}


def test_channel_info_returns_complete_record():
    for i in range(4):
        info = channel_info(i)
        assert set(info.keys()) >= {"name", "phase", "family", "meaning", "index"}
        assert info["index"] == i


def test_FAMILY_TO_CHANNEL_inverse():
    for fam, idx in FAMILY_TO_CHANNEL.items():
        # channel i has family `fam`
        assert K4_CHANNELS[idx][2] == fam


# ── Classification covers all 4 channels ────────────────────────────────

def test_classification_covers_all_channels():
    cov = channel_coverage()
    # every channel has at least one observable
    for i in range(4):
        assert i in cov
        assert cov[i] > 0


def test_classification_assigns_valid_channel_to_each_observable():
    for c in channel_classification():
        assert 0 <= c.k4_channel < 4


def test_physical_type_to_channel_is_total():
    types = set(PHYSICAL_TYPE_TO_CHANNEL.keys())
    assert types == {"counting", "dimensional", "perturbative", "angular"}


# ── A_5 slot accounting ─────────────────────────────────────────────────

def test_a5_filled_plus_open_equals_9():
    a5 = a5_channel_coverage()
    assert a5["total_channels"] == 9
    assert a5["filled"] + a5["open"] == 9
    assert a5["matches_card"]


def test_a5_filled_at_least_3():
    # axion + sterile ν + WIMP at minimum
    assert len(A5_FILLED) >= 3


def test_a5_open_predictions_present():
    # we expect at least one open dark-sector slot remaining
    assert len(A5_OPEN_PREDICTIONS) >= 1


# ── DOF accounting ──────────────────────────────────────────────────────

def test_channel_assignment_is_forced():
    """Channel choice is structurally forced — 0 bits of free DOF."""
    assert channel_assignment_dof_bits() == 0.0


def test_K4_framing_does_not_worsen_audit():
    """The K_4-channel reading must at least equal the 4-template result."""
    assert k4_strengthens_audit()


def test_total_budget_finite_and_positive():
    b = total_template_budget_with_channels_bits()
    assert b > 0
    assert math.isfinite(b)


def test_net_information_is_positive_with_K4_framing():
    """With K_4-channel forcing the framework should be at least slightly tight."""
    net = net_information_with_channels_bits()
    assert net > 0, f"K_4-channel net info = {net} bits (should be > 0)"


# ── Single CI gate ──────────────────────────────────────────────────────

def test_k4_channel_audit_passes():
    assert k4_channel_audit_passes()
