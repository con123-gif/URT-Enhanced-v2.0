"""
Cathedral compression — quantifying numerology vs significance.

The framework's central skeptical question is: "are these identities better
than random Cathedral integer search?"  This module makes that question
quantitative.

For any target numerical value, we enumerate all distinct Cathedral
compounds (single-vocabulary or two-element a-OP-b combinations) within
the framework's vocabulary `CATHEDRAL_INTEGERS`, and count how many fall
within a given relative tolerance of the target.

   n_matches(target, tol)    =  | { c ∈ Cathedral compounds  :  |c − target| < tol·target } |

If `n_matches` is small (1-2), the identity is tight: very few alternative
Cathedral compounds hit this target, so the framework's claimed identity
is genuinely informative.

If `n_matches` is large (10+), the identity is loose: many alternatives
exist, so claiming any specific one is uninformative — the matching
could be random search.

This lets us QUANTIFY the skeptic's audit: every prediction in the
registry gets a TIGHTNESS score, and we can adversarially distinguish
forced identities from numerological accidents.

Methodology
-----------

   Vocabulary V = `CATHEDRAL_INTEGERS` (≈80 named compounds, all derived
   from D = 3).

   Compound search: depth 1 (raw vocab) ∪ depth 2 (a OP b for OP ∈ {+,−,×,÷}).
   Total compounds tested: |V|² × 4 + |V| ≈ 25,000.

   Distinct VALUES (after rounding to 6 sig figs and deduping) at depth
   2 typically number a few thousand for the Cathedral vocabulary.

   `discovery_density(target, tol)` = (matches within tol) / (total compounds
   evaluated).  Lower = more significant.

CI gate:

   from urt import cathedral_compression_audit_passes
   assert cathedral_compression_audit_passes()
"""
from __future__ import annotations

from typing import Dict, Any, List, Tuple, Optional

from .cathedral_identities import CATHEDRAL_INTEGERS


_OPS = ('+', '-', '*', '/')


def _enumerate_all_compounds(max_abs: float = 1e10) -> Dict[float, str]:
    """Enumerate all distinct values from depth-1 and depth-2 Cathedral
    compounds.  Returns map: rounded_value -> a_representative_expression.

    Depth 1: every named compound in CATHEDRAL_INTEGERS.
    Depth 2: every a OP b for OP in {+, −, ×, ÷}.
    """
    items = list(CATHEDRAL_INTEGERS.items())
    seen: Dict[float, str] = {}

    # depth 1
    for name, v in items:
        key = round(float(v), 6)
        if abs(v) <= max_abs:
            seen.setdefault(key, name)

    # depth 2
    for n1, v1 in items:
        for n2, v2 in items:
            for op in _OPS:
                try:
                    if op == '+': c = v1 + v2
                    elif op == '-': c = v1 - v2
                    elif op == '*': c = v1 * v2
                    else:
                        if v2 == 0:
                            continue
                        c = v1 / v2
                    if abs(c) > max_abs:
                        continue
                    key = round(float(c), 6)
                    seen.setdefault(key, f"{n1}{op}{n2}")
                except (ZeroDivisionError, OverflowError, ValueError):
                    continue
    return seen


# Cache the compound enumeration (it's deterministic and somewhat expensive)
_COMPOUND_CACHE: Optional[Dict[float, str]] = None


def cathedral_compounds() -> Dict[float, str]:
    """Return the cached map of distinct Cathedral compound values."""
    global _COMPOUND_CACHE
    if _COMPOUND_CACHE is None:
        _COMPOUND_CACHE = _enumerate_all_compounds()
    return _COMPOUND_CACHE


# ── Match counting ──────────────────────────────────────────────────────

def find_matches(target: float, rel_tol: float = 0.01,
                 limit: int = 20) -> List[Tuple[float, str]]:
    """Return Cathedral compounds within `rel_tol` (relative) of `target`.

    Each entry is `(value, expression)`.  Sorted by absolute closeness
    to target.  Limited to `limit` entries.
    """
    compounds = cathedral_compounds()
    abs_tol = abs(target) * rel_tol
    hits = [
        (v, expr) for v, expr in compounds.items()
        if abs(v - target) <= abs_tol
    ]
    hits.sort(key=lambda x: abs(x[0] - target))
    return hits[:limit]


def n_matches_at_tol(target: float, rel_tol: float = 0.01) -> int:
    """How many distinct Cathedral compounds match `target` to relative
    tolerance `rel_tol`?  Lower = tighter identity."""
    return len(find_matches(target, rel_tol, limit=10**9))


def discovery_density(target: float, rel_tol: float = 0.01) -> float:
    """Fraction of all Cathedral compounds that fall within tolerance.

    A "random search probability" — if you generated Cathedral compounds
    at random and accepted any within `rel_tol`, this is the probability
    of finding a match.  Lower = the framework's identity is more
    significant.
    """
    n = n_matches_at_tol(target, rel_tol)
    total = len(cathedral_compounds())
    return n / total if total > 0 else 0.0


# ── Tightness classification ────────────────────────────────────────────

def tightness_label(n_matches: int) -> str:
    """Classify a match by how many Cathedral compounds compete:
       n=1     : EXACT (no other compound hits)
       2-3     : TIGHT (very few alternatives)
       4-10    : MEDIUM (some competition)
       11+     : LOOSE (numerological territory)
    """
    if n_matches <= 1:
        return "EXACT"
    if n_matches <= 3:
        return "TIGHT"
    if n_matches <= 10:
        return "MEDIUM"
    return "LOOSE"


def assess_identity(target: float, rel_tol: float = 0.005) -> Dict[str, Any]:
    """Full quantitative assessment of a target value vs the Cathedral
    vocabulary.

    Returns a dict with: n_matches, top matches, discovery density,
    tightness label.  At rel_tol = 0.005 (0.5%) by default.
    """
    matches = find_matches(target, rel_tol, limit=10)
    n = n_matches_at_tol(target, rel_tol)
    density = discovery_density(target, rel_tol)
    return {
        "target":              target,
        "rel_tol":             rel_tol,
        "n_matches":           n,
        "tightness":           tightness_label(n),
        "discovery_density":   density,
        "top_matches":         matches,
    }


# ── Apply to predictions registry ──────────────────────────────────────

def registry_significance(rel_tol: float = 0.01) -> List[Dict[str, Any]]:
    """For every CONFIRMED prediction in the registry, compute the
    tightness assessment.  Returns a sortable list.

    Default rel_tol = 0.01 (1 %).  This is the typical "is the framework's
    closed form better than random Cathedral search?" question.
    """
    from .predictions_registry import cathedral_predictions
    rows = []
    for p in cathedral_predictions():
        if p.observed is None or p.status != "confirmed":
            continue
        try:
            obs = float(p.observed)
        except (TypeError, ValueError):
            continue
        if obs == 0:
            continue
        # Skip dimensionful tiny values where the vocabulary scale is wrong
        if abs(obs) < 1e-100 or abs(obs) > 1e10:
            continue
        a = assess_identity(obs, rel_tol)
        rows.append({
            "name":              p.name,
            "observed":          obs,
            "n_matches_at_1pct": a["n_matches"],
            "tightness":         a["tightness"],
            "discovery_density": a["discovery_density"],
        })
    return rows


# ── End-to-end audit ────────────────────────────────────────────────────

def cathedral_compression_audit() -> Dict[str, Any]:
    rows = registry_significance(rel_tol=0.01)
    classifications = {"EXACT": 0, "TIGHT": 0, "MEDIUM": 0, "LOOSE": 0}
    for r in rows:
        classifications[r["tightness"]] += 1
    avg_density = (sum(r["discovery_density"] for r in rows) / len(rows)
                   if rows else 0.0)
    return {
        "n_compounds_enumerated":  len(cathedral_compounds()),
        "n_predictions_assessed":  len(rows),
        "by_tightness":            classifications,
        "average_discovery_density": avg_density,
        "rows":                    rows,
    }


def cathedral_compression_audit_passes() -> bool:
    """The audit passes iff:
       - the compound enumeration is non-trivial (>= 1000 distinct values)
       - at least some confirmed predictions are EXACT or TIGHT
       - the average discovery density across confirmed predictions
         is below 0.10 (under 10 % random-match rate)
    """
    a = cathedral_compression_audit()
    return (
        a["n_compounds_enumerated"] >= 1000
        and (a["by_tightness"]["EXACT"] + a["by_tightness"]["TIGHT"]) >= 1
        and a["average_discovery_density"] < 0.10
    )


def print_cathedral_compression_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" CATHEDRAL COMPRESSION — quantifying numerology vs significance")
    print(bar)

    a = cathedral_compression_audit()
    print(f"\n[1] Vocabulary enumeration")
    print(f"     {a['n_compounds_enumerated']} distinct depth-2 compounds tested")

    print("\n[2] Per-prediction tightness assessment (at 1 % rel-tol)")
    print(f"     {'Identity':40s} {'n_match':>8s}  {'tightness':10s}  density")
    for r in sorted(a["rows"], key=lambda r: r["n_matches_at_1pct"]):
        print(f"     {r['name'][:40]:40s} {r['n_matches_at_1pct']:>8d}  "
              f"{r['tightness']:10s}  {r['discovery_density']:.4f}")

    print(f"\n[3] Summary by tightness category")
    for label in ("EXACT", "TIGHT", "MEDIUM", "LOOSE"):
        print(f"     {label:8s}: {a['by_tightness'][label]}")
    print(f"     average discovery density: {a['average_discovery_density']:.4f}")

    print()
    print("  → EXACT and TIGHT identities are statistically significant.")
    print("  → MEDIUM means alternatives exist but the framework's pick is")
    print("    not arbitrary; LOOSE means the match is numerological noise.")
    print()
    print(bar)
    print(f" cathedral_compression_audit_passes() = "
          f"{cathedral_compression_audit_passes()}")
    print(bar)


__all__ = [
    "cathedral_compounds",
    "find_matches",
    "n_matches_at_tol",
    "discovery_density",
    "tightness_label",
    "assess_identity",
    "registry_significance",
    "cathedral_compression_audit",
    "cathedral_compression_audit_passes",
    "print_cathedral_compression_report",
]
