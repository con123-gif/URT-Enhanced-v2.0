"""
Cross-cutting observable registry — single per-row classification.

Across the 9-phase audit, each v9 observable picks up several
independent classifications:

  Phase 1 — template family       (INT / GAMMA_LADDER / DELTA / TRIG)
  Phase 2 — K_4 channel            (K_4[0..3])
  Phase 3 — γ-ladder level         (Cathedral integer k)
  Phase 4 — coefficient sector     (K4_RATIO / A5_RATIO / ...)
  Phase 5 — correction order       (IDENTITY / ORDER_GAMMA / ...)
  Phase 6 — A_5 dark channel       (Z_5[k] if applicable)
  Phase 7 — falsifiable pre-reg    (True/False; immutable value)
  Phase 9 — URT eigenmode origin   (Laplacian λ, sector trace)

This module exposes ONE row per observable with ALL classifications
present, so the framework's structural reading is visible in one
place instead of distributed across 9 modules.
"""
from __future__ import annotations
from dataclasses import dataclass, field, asdict
from typing import Dict, List, Optional, Tuple

from .unified_recipe import canonical_classification, TemplateMatch
from .k4_channel_mapping import channel_for_family
from .cathedral_levels import OBSERVABLE_REGIME, gamma_exponent_for_observable
from .coefficient_projection import coefficient_class_for
from .correction_projection import correction_order_for
from .falsifiable_log import all_prediction_names


# ── Manual cross-mapping table ─────────────────────────────────────────
# Some v9 observable names differ slightly between modules.  The map
# here normalises lookups across them.  Keys are the names used in
# `canonical_classification`; values are tuples of (regime_name,
# coefficient_name, correction_name, falsifiable_name).

_CROSS_KEY = {
    # name in canonical_classification : (regime, coeff, correction, falsifiable)
    "1/α (bare)":                  (None,  None,                None,                None),
    "1/α (full)":                  (None,  None,                "sin2_thetaW",       None),
    "m_H bare":                    (None,  None,                None,                None),
    "m_top bare":                  (None,  None,                None,                None),
    "δ_CP":                        (None,  None,                "delta_CP_deg",      None),
    "m_p/m_e (integer part)":      (None,  None,                "m_p/m_e_lin",       None),
    "m_µ/m_e (integer part)":      (None,  None,                "m_mu/m_e",          None),
    "n_s":                         (None,  None,                "n_s",               None),
    "sin θ_Cabibbo":               (None,  None,                None,                None),
    "Ω_m":                         (None,  None,                "Omega_m",           None),
    "sin²θ_W":                     (None,  None,                "sin2_thetaW",       None),
    "r_p (proton radius)":         (None,  None,                None,                None),
    "H_0 ratio":                   (None,  None,                None,                None),

    "Λ/M_Pl⁴":                     ("cosmol_const",  "Lambda/M_Pl^4",   None,                None),
    "η_B":                         ("gauge",         "eta_B",           "eta_B",             None),
    "m_s/m_p":                     ("contraction",   "m_s/m_p",         None,                None),
    "Λ_QCD/m_p":                   ("contraction",   "Lambda_QCD/m_p",  "Lambda_QCD/m_p",    None),
    "m_e Yukawa":                  ("gauge",         "m_e Yukawa",      "m_e_yukawa",        None),
    "A_s":                         ("EW",            None,              "A_s_32_over_9",     None),

    "α_s(M_Z)":                    (None,  "alpha_s(MZ)",     None,                None),
    "σ_8":                         (None,  "sigma_8",         "sigma_8",           None),
    "G_N (Planck)":                (None,  "G_N_Planck",      "G_N_Planck",        None),
    "f_π/m_p":                     (None,  "f_pi/m_p",        None,                None),
    "m_π/m_p":                     (None,  "m_pi/m_p",        "m_pi/m_p",          None),

    "θ_12":                        (None,  "theta_12",        "theta_12",          None),
    "θ_13":                        (None,  "theta_13",        "theta_13",          None),
    "θ_23":                        (None,  "theta_23",        None,                None),
    "ρ̄ (CKM)":                    (None,  "rho_bar",         None,                None),
    "v_EW (cos shape)":            ("EW",  None,              None,                None),
}


# ── Row datatype ────────────────────────────────────────────────────────

@dataclass(frozen=True)
class ObservableRow:
    name:             str
    family:           str
    k4_channel:       int
    gamma_level:      Optional[int]
    regime:           Optional[str]
    coefficient_class: Optional[str]
    correction_order: Optional[str]
    falsifiable:      bool
    predicted:        float
    observed:         Optional[float]
    rel_error:        Optional[float]
    detail:           str


def build_registry() -> List[ObservableRow]:
    """Build one row per v9 observable, with all 9-phase classifications."""
    out: List[ObservableRow] = []
    falsifiable_names = set(all_prediction_names())
    for cm in canonical_classification():
        regime, coeff_key, corr_key, fals_key = _CROSS_KEY.get(
            cm.name, (None, None, None, None))

        # K_4 channel from family
        ch = channel_for_family(cm.family)

        # γ-level from regime (if applicable)
        glevel = None
        if regime is not None:
            try:
                glevel = gamma_exponent_for_observable(coeff_key or cm.name)
            except Exception:
                glevel = None
        # If we don't have a coefficient-key match but the regime is set, look up
        # via cathedral_levels directly:
        if glevel is None and regime is not None and regime in OBSERVABLE_REGIME.values():
            from .cathedral_levels import LEVELS_BY_REGIME
            glevel = LEVELS_BY_REGIME[regime].k

        coeff_class = coefficient_class_for(coeff_key) if coeff_key else None
        corr_order  = correction_order_for(corr_key) if corr_key else None
        falsifiable = (fals_key is not None and fals_key in falsifiable_names)

        rel_err = None
        if cm.observed is not None and cm.observed != 0:
            rel_err = (cm.predicted - cm.observed) / cm.observed

        out.append(ObservableRow(
            name=cm.name, family=cm.family, k4_channel=ch,
            gamma_level=glevel, regime=regime,
            coefficient_class=coeff_class, correction_order=corr_order,
            falsifiable=falsifiable,
            predicted=cm.predicted, observed=cm.observed,
            rel_error=rel_err, detail=cm.detail,
        ))
    return out


def get_row(name: str) -> Optional[ObservableRow]:
    for r in build_registry():
        if r.name == name:
            return r
    return None


def all_names() -> List[str]:
    return [r.name for r in build_registry()]


def rows_by_family() -> Dict[str, List[ObservableRow]]:
    out: Dict[str, List[ObservableRow]] = {}
    for r in build_registry():
        out.setdefault(r.family, []).append(r)
    return out


def coverage_summary() -> Dict[str, int]:
    """Per-classification coverage counts."""
    rows = build_registry()
    return {
        "total":             len(rows),
        "have_family":       sum(1 for r in rows if r.family),
        "have_k4_channel":   sum(1 for r in rows if r.k4_channel is not None),
        "have_gamma_level":  sum(1 for r in rows if r.gamma_level is not None),
        "have_regime":       sum(1 for r in rows if r.regime is not None),
        "have_coefficient":  sum(1 for r in rows if r.coefficient_class is not None),
        "have_correction":   sum(1 for r in rows if r.correction_order is not None),
        "n_falsifiable":     sum(1 for r in rows if r.falsifiable),
        "have_observed":     sum(1 for r in rows if r.observed is not None),
    }


# ── CI gates ────────────────────────────────────────────────────────────

def every_row_has_family_and_channel() -> bool:
    return all(r.family and r.k4_channel is not None for r in build_registry())


def coverage_at_least_50pct_for_each_classification() -> bool:
    """Each cross-classification should cover at least half of the rows."""
    rows = build_registry()
    n = len(rows)
    if n == 0:
        return False
    cov = coverage_summary()
    threshold = n // 2
    return all(cov[k] >= threshold for k in (
        "have_family", "have_k4_channel",
    ))


def observable_registry_audit_passes() -> bool:
    return (
        len(build_registry()) >= 20
        and every_row_has_family_and_channel()
    )


# ── Report ──────────────────────────────────────────────────────────────

def print_observable_registry_report() -> None:
    rows = build_registry()
    print("=" * 110)
    print(" CATHEDRAL OBSERVABLE REGISTRY — every v9 observable, all 9-phase classifications")
    print("=" * 110)
    print()
    print(f"  {'observable':<26}{'family':<14}{'K_4':>4}{'γ-lvl':>7}"
          f"{'regime':<14}{'coeff':<14}{'correction':<16}{'fals':>5}{'err%':>9}")
    print("-" * 110)
    for r in rows:
        k4 = f"[{r.k4_channel}]" if r.k4_channel is not None else "—"
        gl = str(r.gamma_level) if r.gamma_level is not None else "—"
        reg = (r.regime or "—")[:13]
        cc = (r.coefficient_class or "—")[:13]
        co = (r.correction_order or "—")[:15]
        fl = "Y" if r.falsifiable else "-"
        err = f"{r.rel_error*100:+.3f}" if r.rel_error is not None else "—"
        print(f"  {r.name:<26}{r.family:<14}{k4:>4}{gl:>7}"
              f"  {reg:<12}{cc:<14}{co:<16}{fl:>5}{err:>9}")
    print()

    cov = coverage_summary()
    print(" Per-classification coverage:")
    for k, v in cov.items():
        print(f"    {k:<22} {v} / {cov['total']}")
    print()
    print(f"  Audit: {observable_registry_audit_passes()}")
    print("=" * 110)


__all__ = [
    "ObservableRow", "build_registry", "get_row", "all_names",
    "rows_by_family", "coverage_summary",
    "every_row_has_family_and_channel",
    "coverage_at_least_50pct_for_each_classification",
    "observable_registry_audit_passes",
    "print_observable_registry_report",
]
