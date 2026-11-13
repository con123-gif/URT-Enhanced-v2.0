"""Charged-sector interfaces: what is established, what is conditional, what is unresolved.

The engine implements only mathematically justified connections.  Every interface between the history /
geometry side and the charged sector is listed here with its status, its source and its CI check.  Asking the
engine for an UNRESOLVED interface raises ``UnresolvedInterface`` with the known constraints; nothing is
invented to fill the gap.  Status words follow docs/CONTINUITY_PROTOCOL.md and docs/RESEARCH_STATE.md §5.
"""
from __future__ import annotations

from dataclasses import dataclass, field

__all__ = ["Interface", "INTERFACES", "UnresolvedInterface", "require", "status_table"]


class UnresolvedInterface(NotImplementedError):
    pass


@dataclass(frozen=True)
class Interface:
    name: str
    status: str          # ESTABLISHED | CONDITIONAL | OBSTRUCTION | UNRESOLVED
    statement: str
    sources: tuple = ()
    checks: tuple = ()
    constraints: tuple = field(default_factory=tuple)


INTERFACES = (
    Interface(
        "v61_wilson_operator", "ESTABLISHED",
        "Archived 192x192 Hermitian v61 Wilson operator, 96/96 sea, 528 links, 48 sites; link Hessian rank 481, "
        "gauge nullity 47; Tr Q^2 = 32. Executed unmodified through a shim.",
        ("research_archive/2026-10-17_original_oct08_source/common_action_work/matter/microscopic_source_currents.py",
         "research_archive/cathedral_arf_runner/run_native_source.py"),
        ("native.wilson_source", "native.output_gate")),
    Interface(
        "hopf_2I_charged_carrier", "ESTABLISHED",
        "Hopf face->vertex twisted lifts T_n (n = +-2, +-4) with the 600-cell charge-sector Wilson kinetic L_n: "
        "L_n T_n = 15 T_n, sum T_n^dag T_n = P3 + P5; an exact 8 -> 48 norm-preserving charged carrier of the hidden "
        "quartets. Kinematic Ward identities and seagulls on each sheet.",
        ("research_archive/2026-11-12_q55_hopf_wilson/", "research_archive/2026-11-12_hopf_charged_carrier/"),
        ("research.q55_hopf_wilson_ward", "research.hopf_charged_carrier")),
    Interface(
        "h64_to_hopf_fixed_frame", "CONDITIONAL",
        "One proper SO(3) face permutation J aligns the 7 Nov all-five H64 source with the Hopf carrier: "
        "M_n = T_n J U_h^dag gives sum M_n^dag M_n = P8 and sum M_n^dag L_n M_n = 15 P8. Not a local U(1)-equivariant "
        "sourced interaction: a complex-linear +2 source cannot reach charge -2 or +-4.",
        ("research_archive/2026-11-12_q60_hopf_h64_frame/",), ("research.q60_hopf_h64_frame",)),
    Interface(
        "v61_internal_a5", "OBSTRUCTION",
        "Every A5 or 2I action by local covariant symmetries of the gauge-covariant v61 family is trivial; the map "
        "to v61 cannot be linear A5-equivariant; the v61 site graph has no automorphism of order 5.",
        ("research_archive/2026-11-12_gate_b_v61_internal_symmetry/", "research_archive/2026-11-11_q4_native_matter_map/"),
        ("research.q53_v61_internal_symmetry", "research.q4_native_matter_map")),
    Interface(
        "h64_to_v61_charged_map", "UNRESOLVED",
        "RESEARCH_STATE §5: a source-preserving, U(1)- and A5-equivariant map from the 64-history source "
        "(H13 + H51; hidden 4_3 + 4_5 via U_h) to the charged matter of the v61 Wilson operator, with fixed "
        "normalisation, both Ward orders, and a gauge-invariant pole with residue. Gates B -> C -> D.",
        ("docs/RESEARCH_STATE.md",), (),
        ("Wilson-sea Ward identities hold", "Tr Q^2 = 32, site Schur kernel 4x4",
         "the 7 Nov action has no vertex-to-edge charged coupling", "symmetry alone leaves >= 2 intertwiners",
         "the 24-clock cannot carry the A5 repair", "must act on internal (spinor/registry) indices, never on sites",
         "to feed a Delta-linear alpha correction it must reach the photon and be odd under R = I - 2 U_h P5 U_h^T",
         "not linear A5-equivariant (Q53); a Delta-linear term needs a parity-violating coupling with one unfixed constant")),
    Interface(
        "photon_normalisation", "UNRESOLVED",
        "Gate C: photon projector and normalisation from the charged map; native.output_gate reports "
        "physical_photon_residue = unselected.", ("docs/RESEARCH_STATE.md",), ("native.output_gate",)),
)


def require(name: str) -> Interface:
    for it in INTERFACES:
        if it.name == name:
            if it.status == "UNRESOLVED":
                raise UnresolvedInterface(f"{name} is UNRESOLVED: {it.statement} Known constraints: "
                                          + "; ".join(it.constraints))
            return it
    raise KeyError(name)


def status_table() -> str:
    lines = ["| Interface | Status | CI checks |", "|---|---|---|"]
    for it in INTERFACES:
        lines.append(f"| `{it.name}` | {it.status} | {', '.join(it.checks) or '—'} |")
    return "\n".join(lines)
