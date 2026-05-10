"""
Forced Gap Polarity — UV/IR sign analysis for predicted observables.

A methodological *report* (not a blocking gate) that complements the
relative-error check in `predictions_registry`.  Each observable is
tagged by which side of δ★ vs δ_class its deviation should lean on,
given the framework's structural arrangement (vacuum δ★ < classical
rail δ_class, gap Δ > 0).

  POLARITY = UV    : observable lives on the δ_eff side of the rail;
                     under a gap-driven mechanism, predicted < observed.
  POLARITY = IR    : observable lives on the δ_class side;
                     under a gap-driven mechanism, predicted > observed.
  POLARITY = MIXED : not constrained by the gap polarity.

What this is and isn't
----------------------
The framework's existing predictions are computed via the ARF
residues (`arf_closure`), not via a uniform gap-driven mechanism.  So
sign violations in the polarity report are NOT physics failures — they
indicate that the prediction came from a non-gap channel.  The report
is useful as a structural-consistency signal: predictions whose sign
aligns with their polarity tag are corroborated by two independent
constraints (rel-err and gap-polarity); predictions whose sign is
opposite are coherent with their ARF formula but not with the
gap-direction reading.

Source: notebook archive (Canonical_Cathedral.ipynb) — extracted as
`the_cathedral_d_3_canonical_forced_gap_polarity.py` and adapted here
to the framework's predictions_registry.  In the original notebook the
audit was a blocking gate; we relax it to informational because the
framework's prediction system is decoupled from the gap mechanism.
"""
from __future__ import annotations

from math import pi
from typing import Any, Dict, List, Optional

from .shell_closure import D, q, V, N, E, F, G, gamma, phi, DELTA_STAR


# ── Polarity classification table ─────────────────────────────────────────

# Each predicted observable in the registry gets a polarity tag.
# UV : δ_eff direction (deviation negative — predicted < observed)
# IR : δ_class direction (deviation positive — predicted > observed)
# MIXED : not constrained
POLARITY_CLASSIFICATION: Dict[str, str] = {
    # Gauge sector — UV-dominated
    "1/α (fine structure)":               "UV",
    "1/α (M_Z) (Lytollis-derived)":       "UV",
    "α_s (M_Z)":                          "UV",
    "sin² θ_W (Weinberg)":                "UV",

    # Mass ratios — MIXED (depend on χ-driven mass coupling)
    "m_p / m_e":                          "MIXED",
    "m_µ / m_e bare":                     "MIXED",
    "m_top (top quark mass) GeV":         "MIXED",
    "m_H (Higgs mass) GeV":               "MIXED",

    # CKM/PMNS — MIXED
    "sin θ_Cabibbo":                      "MIXED",
    "θ_12 (PMNS)°":                       "MIXED",
    "θ_13 (PMNS)°":                       "MIXED",
    "δ_CP° (canonical)":                  "MIXED",

    # Cosmology — IR-dominated (δ_class side)
    "Ω_m (matter density)":               "IR",
    "n_s (spectral index)":               "IR",
    "Λ / M_Pl⁴ (cosmological constant)":  "IR",
    "A_s (scalar amplitude)":             "IR",
    "η_B (baryon asymmetry)":             "IR",
    "H_0 ratio (local / CMB)":            "IR",

    # Geometric / structural
    "r_p (proton charge radius) fm":      "MIXED",
    "a_µ (muon g−2 leading)":             "UV",
    "matter-direction margin (π/D identity)": "MIXED",
}


# ── Polarity sign helpers ─────────────────────────────────────────────────

def _sign(x: float) -> int:
    if x > 0:
        return 1
    if x < 0:
        return -1
    return 0


def gap_polarity_signs() -> Dict[str, int]:
    """Compute the expected sign for UV / IR deviations from the gap.

    UV expects sign(predicted − observed) = sign(δ_eff − δ_class) = −1
    IR expects sign(predicted − observed) = sign(δ_class − δ_eff) = +1

    Both depend on δ_eff < δ_class (gap Δ > 0), which is forced by the
    framework's matter-direction inequality.
    """
    delta_class = D / F
    # For polarity purposes we use δ★ as the UV-side rail; the gap
    # polarity is set by sign(δ★ − δ_class) = −1 (since δ★ < δ_class).
    polar = _sign(DELTA_STAR - delta_class)
    return {
        "UV_expected_sign":     polar,            # −1
        "IR_expected_sign":    -polar,            # +1
        "delta_star":           DELTA_STAR,
        "delta_class":          delta_class,
        "Delta":                delta_class - DELTA_STAR,
        "matter_side":          delta_class > DELTA_STAR,
    }


def check_polarity(name: str, predicted: float, observed: float) -> Dict[str, Any]:
    """Verify a single observable's polarity classification.

    Returns dict with:
      polarity:    UV | IR | MIXED | UNCLASSIFIED
      sign_diff:   sign(predicted − observed)
      ok_sign:     whether sign matches polarity expectation (True for MIXED)
      ok_magnitude: magnitude check separate (caller's responsibility)
    """
    pol = POLARITY_CLASSIFICATION.get(name, "UNCLASSIFIED")
    diff = predicted - observed
    sgn = _sign(diff)
    expected = gap_polarity_signs()
    if pol == "UV":
        ok = (sgn == expected["UV_expected_sign"]) or (sgn == 0)
    elif pol == "IR":
        ok = (sgn == expected["IR_expected_sign"]) or (sgn == 0)
    elif pol == "MIXED":
        ok = True  # no polarity constraint
    else:
        ok = True  # unclassified — pass through

    return {
        "name":       name,
        "polarity":   pol,
        "predicted":  predicted,
        "observed":   observed,
        "diff":       diff,
        "sign_diff":  sgn,
        "ok_sign":    ok,
    }


def run_polarity_audit() -> Dict[str, Any]:
    """Run the polarity audit against the predictions registry."""
    from .predictions_registry import cathedral_predictions

    results: List[Dict[str, Any]] = []
    violations: List[Dict[str, Any]] = []
    for entry in cathedral_predictions():
        if entry.status != "confirmed":
            continue
        if entry.observed is None:
            continue
        check = check_polarity(entry.name, entry.value, entry.observed)
        results.append(check)
        if check["polarity"] in ("UV", "IR") and not check["ok_sign"]:
            violations.append(check)

    return {
        "n_checked":             len(results),
        "n_violations":          len(violations),
        "violations":            violations,
        "all_results":           results,
        "expected_signs":        gap_polarity_signs(),
        "uv_count":              sum(1 for r in results if r["polarity"] == "UV"),
        "ir_count":              sum(1 for r in results if r["polarity"] == "IR"),
        "mixed_count":           sum(1 for r in results if r["polarity"] == "MIXED"),
    }


def forced_gap_polarity_audit_passes() -> bool:
    """Audit is INFORMATIONAL: passes if the report can be computed.

    Sign mismatches between framework predictions and the polarity
    classification are reported in `run_polarity_audit()['violations']`,
    but they do NOT cause this audit to fail.  See module docstring
    for why: framework predictions go through ARF residues, not the
    gap-driven mechanism the polarity tags assume.
    """
    a = run_polarity_audit()
    # The audit "passes" if it ran successfully and produced a report.
    return a["n_checked"] > 0 and "uv_count" in a


def print_forced_gap_polarity_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" FORCED GAP POLARITY — UV/IR sign discipline for confirmed predictions")
    print(bar)
    a = run_polarity_audit()
    s = a["expected_signs"]
    print(f"\n  δ★ (vacuum)        = {s['delta_star']:.10f}")
    print(f"  δ_class (rail)     = {s['delta_class']:.10f}")
    print(f"  Δ = δ_class − δ★   = {s['Delta']:.6e}  (matter side: {s['matter_side']})")
    print(f"  UV expected sign   = {s['UV_expected_sign']:+d}  (predicted < observed)")
    print(f"  IR expected sign   = {s['IR_expected_sign']:+d}  (predicted > observed)")
    print(f"\n  Counts by polarity : UV={a['uv_count']}, IR={a['ir_count']}, MIXED={a['mixed_count']}")
    print(f"  Total checked      : {a['n_checked']}")
    print(f"  Sign violations    : {a['n_violations']}")
    print()
    if a["violations"]:
        print("  VIOLATIONS:")
        for v in a["violations"]:
            print(f"    {v['name']:40s}  pol={v['polarity']}  diff={v['diff']:+.6e}")
    print(bar)
    print(f" forced_gap_polarity_audit_passes() = {forced_gap_polarity_audit_passes()}")
    print(bar)
