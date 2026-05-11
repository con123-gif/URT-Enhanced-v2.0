"""
Cathedral Scale-Band Analysis
=============================

The framework has two natural dimensionless scales:

  γ  = D^{-(D+1)} = 1/81 ≈ 1.2346 %   (entropy / closure parameter)
  Δ  = δ_cl − δ★ ≈ 0.2489 %            (rail splitting / frustration / gap)

This module verifies an empirical claim that ties these scales to the
**density of Cathedral expressions** in the depth-3 enumeration:

  * The typical nearest-compound distance for a generic target in the
    observable magnitude range is ~Δ/2 ≈ 0.5·Δ.  So **Δ is the natural
    density scale of Cathedral expressions** in this regime.

  * The framework's *chosen* (canonical-formula) hits sit at ~Δ/100 of
    the observed values — two orders of magnitude tighter than the
    natural Cathedral density.

That gives a two-layer story:

  1. Cathedral expressions naturally cluster with spacing Δ.  That's
     why the same Δ shows up in (a) the rail splitting, (b) the
     baryogenesis prefactor η_B = γ³·Δ·δ★·(8/9), (c) the
     classical-rail vacuum energy V(δ_cl) = ½·Δ²·(1+δ_cl²), AND
     (d) the natural density of Cathedral expressions in the
     observable range.  ONE number, four different roles.

  2. The framework's *named* formulas (`(D+1)F+(N−D−1)N`,
     `1 − 2/(G−D)`, etc.) sit ~100× INSIDE that density — at Δ/100
     from observation.  That's the empirical signal: physics observables
     are not just at typical Cathedral density; they're outliers in the
     tail.

This module pins both facts as CI-verifiable empirical claims.
"""
from __future__ import annotations

import math
import random
import statistics
from typing import Dict, List, Tuple

from .expression_uniqueness import (
    depth3_compounds,
    HEADLINE_OBSERVABLES,
)


# ── Cathedral natural scales ─────────────────────────────────────────────

D, N, F = 3, 13, 20
GAMMA = 1 / 81
_PHI = (1 + math.sqrt(5)) / 2
DELTA_STAR = (1 - GAMMA) * math.pi / (N * _PHI)
DELTA_CL = D / F
DELTA = DELTA_CL - DELTA_STAR


# ── Density utilities ────────────────────────────────────────────────────

def _compound_values() -> List[float]:
    """Cached list of all depth-3 Cathedral compound values."""
    return list(depth3_compounds().keys())


def nearest_compound_rel_err(target: float) -> float:
    """Relative error to the closest Cathedral compound."""
    if target == 0:
        return min(abs(c) for c in _compound_values())
    return min(abs(c - target) / abs(target) for c in _compound_values())


def physical_observable_nearest_distances() -> List[Tuple[str, float, float]]:
    """For each headline observable, return (name, target, nearest rel-err)."""
    rows = []
    for target, name, _ff, _fv in HEADLINE_OBSERVABLES:
        # Skip extreme magnitudes (r tensor is far outside compound density).
        if abs(target) < 1e-3 or abs(target) > 1e6:
            continue
        rows.append((name, target, nearest_compound_rel_err(target)))
    return rows


def random_target_nearest_distances(seed: int = 42,
                                    samples_per_observable: int = 100
                                    ) -> List[float]:
    """For each observable's magnitude range, sample random targets uniformly
    and return the rel-err to the nearest Cathedral compound for each."""
    rng = random.Random(seed)
    out = []
    for target, name, _ff, _fv in HEADLINE_OBSERVABLES:
        if abs(target) < 1e-3 or abs(target) > 1e6:
            continue
        lo, hi = target * 0.5, target * 1.5
        for _ in range(samples_per_observable):
            t = rng.uniform(lo, hi)
            out.append(nearest_compound_rel_err(t))
    return out


def framework_chosen_distances() -> List[Tuple[str, float]]:
    """For each headline observable, return (name, |fw_value − target| / target)."""
    rows = []
    for target, name, _ff, fv in HEADLINE_OBSERVABLES:
        if abs(target) < 1e-3 or abs(target) > 1e6:
            continue
        rows.append((name, abs(fv - target) / abs(target)))
    return rows


# ── Aggregate report ──────────────────────────────────────────────────────

def scale_band_summary() -> Dict[str, object]:
    """Aggregate density medians + framework distances vs. Δ."""
    phys = [r for _, _, r in physical_observable_nearest_distances()]
    rand = random_target_nearest_distances()
    fw = [r for _, r in framework_chosen_distances()]

    return {
        "delta_gap":   DELTA,
        "gamma":       GAMMA,
        # natural Cathedral density (nearest compound to any target):
        "median_random_target_density":   statistics.median(rand),
        "median_physical_target_density": statistics.median(phys),
        # framework's chosen formulas:
        "median_framework_rel_err":       statistics.median(fw),
        # ratio: density / framework's tightness
        "density_over_framework_ratio":
            statistics.median(rand) / statistics.median(fw),
        # density as a fraction of Δ:
        "random_density_as_Δ":  statistics.median(rand) / DELTA,
        "phys_density_as_Δ":    statistics.median(phys) / DELTA,
        "framework_as_Δ":       statistics.median(fw) / DELTA,
        # ratio of Δ to physical density (close to 2× by symmetric coverage):
        "delta_over_random_density":      DELTA / statistics.median(rand),
    }


def print_scale_band_report() -> None:
    """Print formatted scale-band report."""
    print("=" * 78)
    print("Cathedral Scale-Band Analysis")
    print("=" * 78)
    print()
    print(f"Natural Cathedral scales:")
    print(f"  Δ  (gap)  = δ_cl − δ★         = {DELTA*100:.4f} %")
    print(f"  γ  (entropy) = 1/D^(D+1)      = {GAMMA*100:.4f} %")
    print()
    print(f"Nearest-Cathedral-compound rel-err for each PHYSICAL observable:")
    for name, target, rel in physical_observable_nearest_distances():
        print(f"  {name:<10s} target {target:>11.4f}  "
              f"nearest = {rel*100:7.4f} %  = {rel/DELTA:5.2f}·Δ")
    print()
    print(f"Nearest-Cathedral-compound rel-err for RANDOM targets "
          f"(uniform in observable ranges, 100 per observable, seed=42):")
    rand = random_target_nearest_distances()
    print(f"  n = {len(rand)}")
    print(f"  median = {statistics.median(rand)*100:.4f} % "
          f"= {statistics.median(rand)/DELTA:.2f}·Δ")
    print(f"  mean   = {statistics.mean(rand)*100:.4f} % "
          f"= {statistics.mean(rand)/DELTA:.2f}·Δ")
    print()
    print(f"Framework's CHOSEN formula rel-err for each observable:")
    for name, rel in framework_chosen_distances():
        print(f"  {name:<10s} rel-err = {rel*100:7.4f} %  "
              f"= {rel/DELTA:8.4f}·Δ")
    print()
    s = scale_band_summary()
    print(f"Two-layer story:")
    print(f"  Natural Cathedral density ≈ Δ/2 (random target median): "
          f"{s['median_random_target_density']*100:.3f} % "
          f"= {s['random_density_as_Δ']:.2f}·Δ")
    print(f"  Framework formulas at ~Δ/100 (framework median): "
          f"{s['median_framework_rel_err']*100:.4f} % "
          f"= {s['framework_as_Δ']:.4f}·Δ")
    print(f"  Framework tighter than density by: "
          f"{s['density_over_framework_ratio']:.0f}×")
    print("=" * 78)


# ── Audit gate ────────────────────────────────────────────────────────────

def scale_band_audit_passes(
    *,
    expected_density_in_units_of_delta: Tuple[float, float] = (0.3, 0.7),
    framework_must_be_tighter_than_density_by: float = 30.0,
) -> bool:
    """
    CI gate. Verifies the two-layer story empirically:

      (a) The natural Cathedral expression density (median rel-err of
          nearest compound for a random target) lies inside the band
          ``expected_density_in_units_of_delta·Δ``.  Default band is
          [0.3·Δ, 0.7·Δ] — the framework's natural Cathedral density.

      (b) The framework's chosen formulas are at least
          ``framework_must_be_tighter_than_density_by`` times tighter
          than this density. Default 30× is conservative; empirical
          ratio is ~75-100×.
    """
    s = scale_band_summary()
    lo, hi = expected_density_in_units_of_delta
    if not (lo <= s["random_density_as_Δ"] <= hi):
        return False
    if s["density_over_framework_ratio"] < framework_must_be_tighter_than_density_by:
        return False
    return True


if __name__ == "__main__":
    print_scale_band_report()
