"""Tests for A_5 dark-sector 9-channel enumeration."""
import math
import pytest

from urt.a5_dark_sector import (
    A5_CARDINALITY, A5Channel, A5_CHANNELS,
    filled_channels, open_channels, channel_by_name,
    a5_channels_total_is_9, a5_indices_are_distinct,
    a5_indices_are_complete, at_least_4_filled, at_least_5_open,
    every_channel_has_structural_reason,
    a5_dark_sector_audit_passes,
)
from urt.shell_closure import D


def test_A5_cardinality_is_9():
    assert A5_CARDINALITY == 9
    assert A5_CARDINALITY == math.factorial(D) + D
    assert A5_CARDINALITY == D**2


def test_total_channels_is_9():
    assert a5_channels_total_is_9()


def test_indices_are_distinct():
    assert a5_indices_are_distinct()


def test_indices_complete_0_to_8():
    assert a5_indices_are_complete()


def test_filled_count_at_least_4():
    assert at_least_4_filled()
    assert len(filled_channels()) == 4


def test_open_count_at_least_5():
    assert at_least_5_open()
    assert len(open_channels()) == 5


def test_filled_includes_axion_and_wimp():
    names = {c.name for c in filled_channels()}
    assert "axion" in names
    assert "WIMP" in names
    assert "sterile_neutrino" in names
    assert "dark_energy_w" in names


def test_open_includes_dark_photon_and_higgs():
    names = {c.name for c in open_channels()}
    assert "dark_photon" in names
    assert "dark_higgs" in names


def test_channel_by_name_lookup():
    axion = channel_by_name("axion")
    assert axion is not None
    assert axion.status == "filled"
    assert axion.value == 60.7


def test_unknown_name_returns_None():
    assert channel_by_name("not_a_real_channel") is None


def test_every_channel_has_structural_reason():
    assert every_channel_has_structural_reason()


def test_audit_passes():
    assert a5_dark_sector_audit_passes()
