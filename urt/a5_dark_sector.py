"""
A_5 Dark-Sector Channels — fill the 9 = |A_5| exhaust slots.

The K_4 ⊕ A_5 decomposition predicts 9 = D! + D = D² dark-sector
observables, one per A_5 channel.  This module enumerates all 9 with
structural reasoning.

Currently FILLED (in the framework):
  Z_5[0]  axion              — H_3 mode k = 12, ~60.7 µeV
  Z_5[1]  sterile neutrino   — H_3 mode k = 11, ~143 keV
  Z_5[2]  WIMP               — H_3 modes k = 9, 10, ~13.45 GeV
  Z_5[3]  dark energy w      — w = -1, cosmological constant EOS

OPEN slots (5 structural predictions):
  Z_5[4]  dark photon        — U(1)_X gauge boson, mass γ × m_e ?
  Z_5[5]  dark Higgs         — scalar partner, mass set by δ★·v_EW ?
  Z_5[6]  dark radiation     — N_eff contribution beyond SM
  Z_5[7]  second mediator    — connects visible↔dark
  Z_5[8]  topological defect — axion-string or dark monopole

The 9 channels also correspond to the 9-dim irrep of A_5 (the natural
representation on the icosahedron).  Each prediction is a SHAPE — the
structural argument says these slots exist; experimental confirmation
is open.

Honest scope:
  - The 4 filled slots have closed-form mass predictions in the
    framework (see urt.dark_matter and urt.predictions_registry).
  - The 5 open slots have ONLY structural reasoning here.  They are
    "where we expect to find dark observables given the K_4 ⊕ A_5
    organising principle."
  - If A_5 channel #N goes unfilled for 20 years, this is evidence
    against the K_4 ⊕ A_5 reading.
"""
from __future__ import annotations
import math
from dataclasses import dataclass
from typing import List, Optional

from .shell_closure import D, q, V, N, F, G, gamma as GAMMA, DELTA_STAR


# A_5 cardinality (|A_5| = D! + D = D² = 9)
A5_CARDINALITY = math.factorial(D) + D
assert A5_CARDINALITY == D**2 == 9


@dataclass(frozen=True)
class A5Channel:
    index:        int          # 0..8
    name:         str          # observable name
    status:       str          # 'filled' | 'open'
    structural_reason: str     # why this slot exists
    closed_form:  Optional[str] = None    # framework closed form, if filled
    value:        Optional[float] = None  # numerical value, if predicted
    units:        str = ""


# The 9 A_5 channels — 4 filled, 5 open
A5_CHANNELS: List[A5Channel] = [
    # ── Filled (in the framework as of v2.9.86) ─────────────────
    A5Channel(
        index=0, name="axion", status="filled",
        structural_reason="H_3 mode k=12 (V-th harmonic of icosahedral rotation)",
        closed_form="≈ 60.7 µeV",
        value=60.7, units="µeV",
    ),
    A5Channel(
        index=1, name="sterile_neutrino", status="filled",
        structural_reason="H_3 mode k=11 = N-D+1",
        closed_form="≈ 143 keV",
        value=143.0, units="keV",
    ),
    A5Channel(
        index=2, name="WIMP", status="filled",
        structural_reason="H_3 modes k=9 (D²), k=10",
        closed_form="δ★·m_Z ≈ 13.45 GeV",
        value=13.45, units="GeV",
    ),
    A5Channel(
        index=3, name="dark_energy_w", status="filled",
        structural_reason="Lagrangian L = (1/2)(∂δ)² − V(δ) at δ_cl gives w = p/ε = -1",
        closed_form="w = -1",
        value=-1.0, units="",
    ),

    # ── Open (structural predictions, no experimental closed form yet) ─
    A5Channel(
        index=4, name="dark_photon", status="open",
        structural_reason=(
            "U(1)_X gauge boson from the remaining Z_5 phase channel. "
            "Mass scale candidate: γ × m_e ≈ 6.3 keV or γ² × m_p ≈ 143 µeV. "
            "Distinct from axion (which is pseudo-scalar)."
        ),
    ),
    A5Channel(
        index=5, name="dark_higgs", status="open",
        structural_reason=(
            "Scalar partner of the dark gauge boson. "
            "Mass set by δ★ × v_EW ≈ 36 GeV in K_4-coupled scenario."
        ),
    ),
    A5Channel(
        index=6, name="dark_radiation", status="open",
        structural_reason=(
            "N_eff contribution beyond Standard Model. "
            "Cathedral prediction: ΔN_eff ≈ γ × (number of dark fermions) "
            "= 1/81 × q = 0.062 per A_5 fermion."
        ),
    ),
    A5Channel(
        index=7, name="second_mediator", status="open",
        structural_reason=(
            "Visible↔dark messenger (separate from WIMP, axion). "
            "Could be Higgs-portal scalar or kinetically mixed Z'. "
            "Coupling scale: γ² × g_weak."
        ),
    ),
    A5Channel(
        index=8, name="topological_defect", status="open",
        structural_reason=(
            "Topological dark-sector relic (axion string, dark monopole, "
            "Q-ball, or cosmic-string-like defect). "
            "Tension scale: f_a × M_Pl in axion-string scenario."
        ),
    ),
]


# ── Helpers ──────────────────────────────────────────────────────────────

def filled_channels() -> List[A5Channel]:
    return [c for c in A5_CHANNELS if c.status == "filled"]


def open_channels() -> List[A5Channel]:
    return [c for c in A5_CHANNELS if c.status == "open"]


def channel_by_name(name: str) -> Optional[A5Channel]:
    for c in A5_CHANNELS:
        if c.name == name:
            return c
    return None


# ── CI gates ─────────────────────────────────────────────────────────────

def a5_channels_total_is_9() -> bool:
    return len(A5_CHANNELS) == 9


def a5_indices_are_distinct() -> bool:
    return len({c.index for c in A5_CHANNELS}) == 9


def a5_indices_are_complete() -> bool:
    return set(c.index for c in A5_CHANNELS) == set(range(9))


def at_least_4_filled() -> bool:
    return len(filled_channels()) >= 4


def at_least_5_open() -> bool:
    return len(open_channels()) >= 5


def every_channel_has_structural_reason() -> bool:
    return all(len(c.structural_reason) > 20 for c in A5_CHANNELS)


def a5_dark_sector_audit_passes() -> bool:
    return (
        a5_channels_total_is_9()
        and a5_indices_are_distinct()
        and a5_indices_are_complete()
        and at_least_4_filled()
        and at_least_5_open()
        and every_channel_has_structural_reason()
    )


# ── Report ───────────────────────────────────────────────────────────────

def print_a5_dark_sector_report() -> None:
    print("=" * 84)
    print(" A_5 DARK-SECTOR CHANNELS — 9 = |A_5| = D² slots")
    print("=" * 84)
    print(f"\n  Total channels : {len(A5_CHANNELS)}")
    print(f"  Filled (closed-form predictions) : {len(filled_channels())}")
    print(f"  Open  (structural predictions)   : {len(open_channels())}")
    print()
    print(" FILLED:")
    print("-" * 84)
    for c in filled_channels():
        v = f"{c.value} {c.units}" if c.value is not None else "—"
        print(f"  Z_5[{c.index}]  {c.name:<22}  {c.closed_form:<28} ({v})")
    print()
    print(" OPEN (5 structural predictions):")
    print("-" * 84)
    for c in open_channels():
        print(f"  Z_5[{c.index}]  {c.name:<22}")
        print(f"            {c.structural_reason}")
    print("=" * 84)


__all__ = [
    "A5_CARDINALITY", "A5Channel", "A5_CHANNELS",
    "filled_channels", "open_channels", "channel_by_name",
    "a5_channels_total_is_9", "a5_indices_are_distinct",
    "a5_indices_are_complete", "at_least_4_filled", "at_least_5_open",
    "every_channel_has_structural_reason",
    "a5_dark_sector_audit_passes", "print_a5_dark_sector_report",
]
