"""
Falsifiable Predictions Log — pre-registered, date-stamped, immutable.

The strongest defence against the "too many free choices" critique is
not statistical accounting but PRE-REGISTRATION: pin down what the
framework predicts BEFORE measurement, and hold the framework to those
predictions even when post-hoc adjustments would be tempting.

This module fixes the three currently-open Cathedral predictions to
date-stamped closed forms.  Any test that mutates these values fails
loudly.  Future changes require renaming (i.e. acknowledging a
*revised* prediction, with a new date and the old one preserved).

Predictions are SHAPES, not single numbers.  Each entry exposes:
  - the Cathedral closed form
  - the numerical value at registration time
  - the experiment / observation that will eventually falsify it
  - the date of registration (immutable)
  - what counts as a falsification (the agreement window)
"""
from __future__ import annotations
import datetime
import math
from dataclasses import dataclass, asdict
from typing import List, Optional, Dict

from .shell_closure import D, q, V, N, F, G, gamma as GAMMA, phi as PHI, DELTA_STAR


# Date of registration of the predictions in this module.
# DO NOT CHANGE THIS WITHOUT ALSO CHANGING THE PREDICTION VALUES.
REGISTRATION_DATE = "2026-05-15"


@dataclass(frozen=True)
class FalsifiablePrediction:
    name:           str          # short label
    cathedral_form: str          # closed-form Cathedral expression as Python
    value:          float        # numerical value at registration
    units:          str          # units of `value`
    experiment:     str          # what will measure it
    falsification:  str          # what would falsify the prediction
    registration_date: str       # ISO date — must equal REGISTRATION_DATE
    cathedral_origin: str        # which framework module derives it


# ── The three pre-registered open predictions ─────────────────────────────

# Lytollis "The π-φ-e Flow" prediction values, taken from the framework
# at the time of this commit.  These will not change.

# 1. Axion mass (k = V = 12 H_3 mode)
AXION_MASS_UEV = 60.7

# 2. Casimir force fractional deviation at 100 nm
#   ΔF/F = (a_0 / d)² × (D+1)/(D!+D) = (a_0 / d)² × 4/9
#   at d = 100 nm gives +0.124 ppm
CASIMIR_FRAC_DEV_100NM_PPM = 0.124

# 3. Tensor-to-scalar ratio
#   r = 12 / (G - D)² = 12 / 57² = 0.003693
R_TENSOR = 12.0 / (G - D)**2


PREDICTIONS: List[FalsifiablePrediction] = [
    FalsifiablePrediction(
        name="axion_mass",
        cathedral_form="60.7 µeV  (H_3 mode k = V = 12 on G_{13})",
        value=AXION_MASS_UEV,
        units="µeV",
        experiment="ADMX-EFR / ABRACADABRA / dark-matter axion haloscopes",
        falsification=(
            "If a comprehensive axion search across the 50-70 µeV range "
            "rules out an axion at this coupling, prediction is falsified. "
            "Tolerance window: ±5 µeV (≈ 8%)."
        ),
        registration_date=REGISTRATION_DATE,
        cathedral_origin="urt.dark_matter.M_AXION_UEV (= 60.7)",
    ),
    FalsifiablePrediction(
        name="casimir_deviation_100nm",
        cathedral_form="(a_0/d)² × (D+1)/(D!+D) = (a_0/100nm)² × 4/9",
        value=CASIMIR_FRAC_DEV_100NM_PPM,
        units="ppm",
        experiment="Precision Casimir-force measurement at d = 100 nm",
        falsification=(
            "If Casimir-force measurements at d = 100 nm rule out a "
            "fractional deviation in [+0.062, +0.186] ppm (within ±50% of "
            "the predicted central value), prediction is falsified."
        ),
        registration_date=REGISTRATION_DATE,
        cathedral_origin="urt.zpe_cathedral.casimir_fractional_deviation",
    ),
    FalsifiablePrediction(
        name="tensor_to_scalar_ratio",
        cathedral_form="r = 12 / (G - D)² = 12 / 57²",
        value=R_TENSOR,
        units="",
        experiment="CMB B-mode polarization (BICEP/Keck, LiteBIRD, CMB-S4)",
        falsification=(
            "If r < 0.001 at 2σ is established, framework's r = 0.0037 "
            "is falsified.  If r > 0.01 at 2σ, also falsified.  Current "
            "upper bound r < 0.036 (BICEP/Keck 2021) is consistent."
        ),
        registration_date=REGISTRATION_DATE,
        cathedral_origin="urt.inflation_cathedral.r_tensor = 12/57²",
    ),
]


# ── Helpers ──────────────────────────────────────────────────────────────

def get_prediction(name: str) -> Optional[FalsifiablePrediction]:
    for p in PREDICTIONS:
        if p.name == name:
            return p
    return None


def all_prediction_names() -> List[str]:
    return [p.name for p in PREDICTIONS]


def predictions_as_dicts() -> List[Dict[str, str]]:
    """Useful for JSON export / external auditing."""
    return [asdict(p) for p in PREDICTIONS]


# ── CI gates — immutable values ──────────────────────────────────────────

def all_registration_dates_match() -> bool:
    """Every prediction's registration_date matches REGISTRATION_DATE.
    Failure here means someone post-hoc-modified a value."""
    return all(p.registration_date == REGISTRATION_DATE for p in PREDICTIONS)


def axion_pinned() -> bool:
    p = get_prediction("axion_mass")
    return p is not None and p.value == 60.7 and p.units == "µeV"


def casimir_pinned() -> bool:
    p = get_prediction("casimir_deviation_100nm")
    return p is not None and p.value == 0.124 and p.units == "ppm"


def r_tensor_pinned() -> bool:
    p = get_prediction("tensor_to_scalar_ratio")
    if p is None:
        return False
    expected = 12.0 / (G - D)**2
    return abs(p.value - expected) < 1e-12


def at_least_3_predictions() -> bool:
    return len(PREDICTIONS) >= 3


def every_prediction_has_falsification_criterion() -> bool:
    return all(len(p.falsification) > 30 for p in PREDICTIONS)


def falsifiable_log_audit_passes() -> bool:
    return (
        all_registration_dates_match()
        and axion_pinned()
        and casimir_pinned()
        and r_tensor_pinned()
        and at_least_3_predictions()
        and every_prediction_has_falsification_criterion()
    )


# ── Report ───────────────────────────────────────────────────────────────

def print_falsifiable_log_report() -> None:
    print("=" * 84)
    print(f" FALSIFIABLE PREDICTIONS LOG — registered {REGISTRATION_DATE}")
    print("=" * 84)
    print()
    print(f"  {len(PREDICTIONS)} pre-registered open predictions:")
    print()
    for p in PREDICTIONS:
        print(f"  ─── {p.name} ──────────────────────────────")
        print(f"    Cathedral form  : {p.cathedral_form}")
        print(f"    Value           : {p.value} {p.units}")
        print(f"    Experiment      : {p.experiment}")
        print(f"    Falsification   : {p.falsification}")
        print(f"    Origin module   : {p.cathedral_origin}")
        print(f"    Date registered : {p.registration_date}")
        print()
    print("  These values are FROZEN.  Modifications require renaming")
    print("  (i.e. registering a revised prediction with a new date),")
    print("  not editing in place.")
    print("=" * 84)


__all__ = [
    "REGISTRATION_DATE",
    "AXION_MASS_UEV", "CASIMIR_FRAC_DEV_100NM_PPM", "R_TENSOR",
    "FalsifiablePrediction", "PREDICTIONS",
    "get_prediction", "all_prediction_names", "predictions_as_dicts",
    "all_registration_dates_match",
    "axion_pinned", "casimir_pinned", "r_tensor_pinned",
    "at_least_3_predictions", "every_prediction_has_falsification_criterion",
    "falsifiable_log_audit_passes",
    "print_falsifiable_log_report",
]
