"""
Master Audit — single source of truth for all 8 framework phases.

This module consolidates the 8 phases of the structural-DOF investigation
into one print-out and one CI gate.  Call:

    >>> from urt import print_master_audit_report, master_audit_passes
    >>> print_master_audit_report()
    >>> assert master_audit_passes()

The 8 phases:

  1. Unified Recipe (4-template scheme)             urt.unified_recipe
  2. K_4 ⊕ A_5 Channel Mapping                       urt.k4_channel_mapping
  3. γ-exponents → L_{G_{13}} spectrum / Cathedral   urt.cathedral_levels,
                                                     urt.spectrum_to_levels
  4. Coefficients → K_4 ⊕ A_5 sector classes         urt.coefficient_projection
  5. Corrections → perturbation orders               urt.correction_projection
  6. A_5 dark-sector 9-channel enumeration           urt.a5_dark_sector
  7. Falsifiable predictions pre-registered          urt.falsifiable_log
  8. A_s eigenmode decomposition                     urt.eigenmode_decomposition

Plus structural-DOF accounting that integrates Phases 3-5 into a single
operationally-derived budget:

    urt.structural_dof
"""
from __future__ import annotations
from typing import Dict, List, Tuple

from .unified_recipe import (
    unified_recipe_audit_passes, canonical_classification,
    information_delivered_bits, total_template_budget_bits,
)
from .k4_channel_mapping import k4_channel_audit_passes, a5_channel_coverage
from .cathedral_levels import (
    cathedral_levels_audit_passes, LEVELS, OBSERVABLE_REGIME,
)
from .spectrum_to_levels import (
    spectrum_to_levels_audit_passes,
    levels_with_spectral_origin, levels_with_combinatorial_origin,
)
from .coefficient_projection import (
    coefficient_projection_audit_passes, COEFFICIENT_TABLE,
    coefficient_dof_per_slot_bits, total_coefficient_savings_bits,
)
from .correction_projection import (
    correction_projection_audit_passes, CORRECTION_TABLE,
    correction_dof_per_slot_bits, total_correction_savings_bits,
)
from .a5_dark_sector import (
    a5_dark_sector_audit_passes, filled_channels, open_channels,
)
from .falsifiable_log import (
    falsifiable_log_audit_passes, PREDICTIONS, REGISTRATION_DATE,
)
from .eigenmode_decomposition import (
    eigenmode_decomposition_audit_passes, AS_FACTORS, A_S_PREDICTED,
)
from .structural_dof import (
    structural_dof_audit_passes,
    total_free_budget_bits, total_forced_budget_bits,
    net_information_after_structural_reduction,
)
from .urt_projection import (
    urt_projection_audit_passes,
    laplacian_trace, sector_eigenvalue_split, distinct_eigenvalues,
)


# ── Phase status table ──────────────────────────────────────────────────

PHASES: List[Tuple[str, str, callable]] = [
    ("Phase 1", "Unified Recipe (4-template scheme)",        unified_recipe_audit_passes),
    ("Phase 2", "K_4 ⊕ A_5 channel mapping",                  k4_channel_audit_passes),
    ("Phase 3a", "γ-exponents = Cathedral levels",            cathedral_levels_audit_passes),
    ("Phase 3b", "γ-exponents = L_{G_{13}} eigenvalues",      spectrum_to_levels_audit_passes),
    ("Phase 4", "Coefficients → K_4 ⊕ A_5 sector classes",    coefficient_projection_audit_passes),
    ("Phase 5", "Corrections → perturbation orders",          correction_projection_audit_passes),
    ("Phase 6", "A_5 dark-sector 9 channels",                  a5_dark_sector_audit_passes),
    ("Phase 7", "Falsifiable predictions pre-registered",      falsifiable_log_audit_passes),
    ("Phase 8", "A_s eigenmode decomposition",                eigenmode_decomposition_audit_passes),
    ("Phase 9", "URT iteration → Cathedral observables",      urt_projection_audit_passes),
    ("DOF",     "Structural-DOF accounting",                   structural_dof_audit_passes),
]


def phase_results() -> List[Dict[str, object]]:
    out = []
    for label, desc, gate in PHASES:
        try:
            ok = bool(gate())
        except Exception as e:
            ok = False
        out.append({"phase": label, "desc": desc, "passes": ok})
    return out


def all_phases_pass() -> bool:
    return all(p["passes"] for p in phase_results())


# ── Headline numbers ─────────────────────────────────────────────────────

def framework_metrics() -> Dict[str, object]:
    sec = sector_eigenvalue_split()
    return {
        "info_delivered_bits":  information_delivered_bits(),
        "free_budget_bits":     total_free_budget_bits(),
        "forced_budget_bits":   total_forced_budget_bits(),
        "net_info_bits":        net_information_after_structural_reduction(),
        "n_v9_observables":     len([c for c in canonical_classification()
                                     if c.observed is not None]),
        "n_levels_used":        len(LEVELS),
        "n_spectral_levels":    len(levels_with_spectral_origin()),
        "n_combinatorial_levels": len(levels_with_combinatorial_origin()),
        "n_coefficient_table":  len(COEFFICIENT_TABLE),
        "n_correction_table":   len(CORRECTION_TABLE),
        "n_a5_dark_filled":     len(filled_channels()),
        "n_a5_dark_open":       len(open_channels()),
        "n_falsifiable_preds":  len(PREDICTIONS),
        "registration_date":    REGISTRATION_DATE,
        "n_as_factors":         len(AS_FACTORS),
        "a_s_predicted":        A_S_PREDICTED,
        # Phase 9 operator-level metrics
        "L_trace":              laplacian_trace(),
        "K_4_trace":            sec["K_4_trace"],
        "A_5_trace":            sec["A_5_trace"],
        "distinct_eigenvalues": distinct_eigenvalues(),
    }


# ── CI gate ─────────────────────────────────────────────────────────────

def master_audit_passes() -> bool:
    return (
        all_phases_pass()
        and net_information_after_structural_reduction() > 40.0
    )


# ── Report ───────────────────────────────────────────────────────────────

def print_master_audit_report() -> None:
    print("=" * 92)
    print(" CATHEDRAL FRAMEWORK — MASTER AUDIT")
    print("=" * 92)
    print()
    print(" 8-phase structural-DOF investigation:")
    print("-" * 92)
    for r in phase_results():
        status = "PASS" if r["passes"] else "FAIL"
        flag = "✓" if r["passes"] else "✗"
        print(f"   {flag}  {r['phase']:<10} {r['desc']:<55} [{status}]")
    print()
    print(" Information-theoretic verdict:")
    print("-" * 92)
    m = framework_metrics()
    info = m["info_delivered_bits"]
    free = m["free_budget_bits"]
    forced = m["forced_budget_bits"]
    net = m["net_info_bits"]
    print(f"   Information delivered            : {info:>8.1f} bits")
    print(f"   Free budget (no reductions)      : {free:>8.1f} bits  → net {info-free:+.1f}")
    print(f"   Forced budget (with reductions)  : {forced:>8.1f} bits  → net {info-forced:+.1f}")
    print(f"   Structural savings               : {free-forced:>+8.1f} bits")
    print()

    if   net > 80:   v = "★★★★★ FRAMEWORK IS DECISIVELY TIGHT"
    elif net > 40:   v = "★★★★  TIGHT — substantial information surplus"
    elif net > 0:    v = "★★★   TIGHT — modest information surplus"
    elif net > -40:  v = "★     LOOSE — budget slightly exceeds info"
    else:            v = "       OVERFITTING — too much template freedom"
    print(f"   Verdict: {v}")
    print()

    print(" Structural inventory:")
    print("-" * 92)
    print(f"   v9 observables classified        : {m['n_v9_observables']}")
    print(f"   Cathedral γ-levels enumerated    : {m['n_levels_used']}")
    print(f"      of which spectral (L_{{G_13}})  : {m['n_spectral_levels']}")
    print(f"      of which combinatorial         : {m['n_combinatorial_levels']}")
    print(f"   Coefficient table size           : {m['n_coefficient_table']}")
    print(f"   Correction table size            : {m['n_correction_table']}")
    print(f"   A_5 dark-sector channels         : {m['n_a5_dark_filled']} filled + {m['n_a5_dark_open']} open = 9")
    print(f"   Falsifiable predictions          : {m['n_falsifiable_preds']} (registered {m['registration_date']})")
    print(f"   A_s factors decomposed           : {m['n_as_factors']}  (= {m['a_s_predicted']:.3e})")
    print()
    print(" URT iteration operator-level (Phase 9):")
    print(f"   L_{{G_{{13}}}} trace                  : {m['L_trace']:.1f}  (= D!·V)")
    print(f"   K_4 ⊕ A_5 trace split             : {m['K_4_trace']:.1f} + {m['A_5_trace']:.1f} = {m['L_trace']:.1f}")
    print(f"   Distinct eigenvalues             : {m['distinct_eigenvalues']}  (all Cathedral integers)")
    print()
    print(" Single CI gate:  master_audit_passes()  =", master_audit_passes())
    print("=" * 92)


__all__ = [
    "PHASES", "phase_results", "all_phases_pass",
    "framework_metrics", "master_audit_passes",
    "print_master_audit_report",
]
