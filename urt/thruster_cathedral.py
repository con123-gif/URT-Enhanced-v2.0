"""
Cathedral δ-field Thruster — Exodus EED Candidate (FAILED CLAIM)

The upload archive presents this module as a "fourth falsifiable prediction"
of the Cathedral framework, claiming the δ-field thrust law

    F  =  ε₀ · E_c² · κ · (δ_ground² − δ_blade²) · A_eff / d

reproduces the measured thrusts in US Patent 11,511,891 B2 (Exodus
Propulsion, 9-blade EED, 0.25" gap, 25 kV, ε_r ≈ 4.0) to within 7 %:

    Patent (small ground, 8 in²) :   237  mN   measured
    Patent (large ground, 15 in²):   421  mN   measured

Honest finding (2026-05-11 audit, this module)
----------------------------------------------

Running the upload's own "corrected & working v3" formula end-to-end:

    Cathedral prediction (small) :  −10.4  mN     (off by 105 %, wrong sign)
    Cathedral prediction (large) :  −62.5  mN     (off by 115 %, wrong sign)

The upload's celebratory print statements at the bottom of
`cathedral_δ_field_thrust_simulator_v3_corrected_working.py`
("220.3 mN predicted vs 237 mN measured, 7 % error") are **hardcoded
text**, not values returned by the formula.  When the formula is
actually evaluated at the patent geometry it produces a NEGATIVE
thrust three orders of magnitude smaller than the claim.

Why this module exists anyway
-----------------------------

The framework's discipline requires that every claim has a CI gate
verifying it at machine precision.  The thruster claim does not survive
that gate — so it is **not** wired into `compute_all_constants()` and
not listed in `predictions_registry.py`.  But the closed-form constants
(E_c, αβ, κ, prefactor) are nice {π, φ, e}-only expressions that may
still be useful for future investigations, and the patent geometry is
worth preserving as a known-difficult target.  This module is therefore
a documented FAILED candidate, exposed for inspection only.

Cathedral closed-form constants (these are correct, even though the
combined thrust law is not):

    E_c     =  π · φ · e × 10⁶  V/m       ≈  1.382 × 10⁷ V/m
    αβ      =  π / (φ · e²)               ≈  0.2628
    κ       =  2 · αβ · (δ★ − δ_cl)       ≈ -1.308 × 10⁻³
    ε₀·E_c² ≈ 1690 Pa                      (Maxwell-stress prefactor)

Falsification path
------------------

A direct way to revive this claim would be to find the *correct*
prefactor structure that the upload's authors had in mind.  Two
hypotheses worth testing:

  (a) the formula has a missing dimensionless factor of order 10² that
      comes from blade-tip field enhancement (fringing-field amplification
      can easily contribute 20-100×);

  (b) the thrust is not pure Maxwell-stress δ²-gradient but rather an
      ion-wind / corona-discharge contribution at atmospheric pressure
      that has a different scaling.  The patent's test was apparently
      run in air, not vacuum, which the upload's formula ignores.

Until one of these (or a different mechanism) is verified end-to-end,
this remains a failed Cathedral candidate.  See `urt.failed_attempts_study`
for the framework's other documented failures.
"""

from math import pi, sqrt, e as euler_e
from dataclasses import dataclass
from typing import Dict, List


# ── Physical constants ─────────────────────────────────────────────────────
EPSILON_0 = 8.8541878e-12      # F/m

# ── Cathedral geometric constants ──────────────────────────────────────────
D     = 3
N     = 13
PHI   = (1 + sqrt(5)) / 2
GAMMA = 1 / D ** 4

DELTA_STAR = (1 - GAMMA) * pi / (N * PHI)         # ≈ 0.14751081
DELTA_CL   = 3 / 20                                # = 0.15000

# ── Closed-form constants (these ARE correct) ──────────────────────────────

def critical_field_thruster_Vm():
    """E_c = π · φ · e × 10⁶ V/m (from {π, φ, e} only)."""
    return pi * PHI * euler_e * 1e6


def modulation_slope_alphabeta():
    """αβ = π / (φ · e²) ≈ 0.2628."""
    return pi / (PHI * euler_e ** 2)


def deficit_coupling_kappa():
    """κ = 2 · αβ · (δ★ − δ_cl) ≈ -1.308e-3."""
    return 2 * modulation_slope_alphabeta() * (DELTA_STAR - DELTA_CL)


def thrust_prefactor_Pa():
    """ε₀ · E_c² ≈ 1690 Pa (Maxwell-stress prefactor at critical field)."""
    return EPSILON_0 * critical_field_thruster_Vm() ** 2


E_C_THRUSTER = critical_field_thruster_Vm()
ALPHA_BETA   = modulation_slope_alphabeta()
KAPPA_THRUST = deficit_coupling_kappa()
PREFACTOR_PA = thrust_prefactor_Pa()


# ── Upload's claimed thrust law (does NOT match patent) ────────────────────

def cathedral_thrust_upload(V_volts, d_m, A_blade_m2, A_ground_m2,
                            eps_r=1.0, n_blades=1):
    """
    The upload's v3 'corrected & working' thrust formula.  Reproduced
    here verbatim so the failure can be inspected.  Returns thrust
    in Newtons; for the patent geometry returns ≈ −0.01 N (wrong by
    ~100×, wrong sign).
    """
    E = V_volts / d_m
    delta_vacuum = DELTA_STAR + ALPHA_BETA * (E / E_C_THRUSTER)
    delta_blade = delta_vacuum / eps_r if eps_r > 1 else delta_vacuum
    delta_ground = delta_vacuum
    delta_sq_diff = delta_ground ** 2 - delta_blade ** 2
    A_eff = abs(A_blade_m2 * n_blades - A_ground_m2)
    return PREFACTOR_PA * KAPPA_THRUST * delta_sq_diff * A_eff / d_m


# ── Exodus EED reference geometry (patent FIG. 23B) ────────────────────────

@dataclass(frozen=True)
class ExodusEED:
    n_blades:        int   = 9
    gap_inches:      float = 0.25
    V_kV:            float = 25.0
    eps_r:           float = 4.0
    blade_height_in: float = 0.25
    blade_length_in: float = 4.0
    A_ground_in2:    float = 8.0

    @property
    def gap_m(self) -> float:
        return self.gap_inches * 0.0254

    @property
    def V_V(self) -> float:
        return self.V_kV * 1e3

    @property
    def A_blade_m2(self) -> float:
        return self.blade_height_in * self.blade_length_in * (0.0254 ** 2)

    @property
    def A_ground_m2(self) -> float:
        return self.A_ground_in2 * (0.0254 ** 2)


PATENT_MEASUREMENTS_MN = {8.0: 237.0, 15.0: 421.0}


def upload_claim_report() -> List[Dict[str, float]]:
    """Run the upload's formula against the two patent geometries."""
    rows = []
    for A_g, F_meas_mN in PATENT_MEASUREMENTS_MN.items():
        eed = ExodusEED(A_ground_in2=A_g)
        F_pred_N = cathedral_thrust_upload(
            V_volts=eed.V_V, d_m=eed.gap_m,
            A_blade_m2=eed.A_blade_m2, A_ground_m2=eed.A_ground_m2,
            eps_r=eed.eps_r, n_blades=eed.n_blades,
        )
        rows.append({
            "A_ground_in2": A_g,
            "F_pred_mN":    F_pred_N * 1e3,
            "F_meas_mN":    F_meas_mN,
            "abs_err_pct":  100 * abs(F_pred_N * 1e3 - F_meas_mN) / F_meas_mN,
        })
    return rows


def thruster_claim_holds(tol_pct: float = 50.0) -> bool:
    """
    Audit gate (intentionally returns False at the claimed tolerance).

    The upload claimed 7 % error; running the formula gives > 100 %
    error with the wrong sign.  This function exists so CI tests can
    pin the failure state — preventing accidental future claims that
    the thruster "works" without re-validating end-to-end.
    """
    for row in upload_claim_report():
        if row["abs_err_pct"] > tol_pct:
            return False
    return True


# ── Honest report ─────────────────────────────────────────────────────────

def print_thruster_failure_report():
    print("=" * 72)
    print("Cathedral δ-field Thruster — FAILED CANDIDATE")
    print("  Upload claim: F matches US Patent 11,511,891 B2 to 7 %")
    print(f"  Actual:       formula does NOT match patent geometry")
    print(f"  E_c       = {E_C_THRUSTER:.4e} V/m    (π·φ·e × 10⁶, OK)")
    print(f"  αβ        = {ALPHA_BETA:.6f}         (π / (φ·e²), OK)")
    print(f"  κ         = {KAPPA_THRUST:.4e}    (2·αβ·(δ★−δ_cl), OK)")
    print(f"  ε₀·E_c²   = {PREFACTOR_PA:.2f} Pa")
    print("=" * 72)
    print(f"  {'A_grnd':>8}  {'F_pred':>12}  {'F_meas':>10}  {'abs err':>10}")
    print("-" * 50)
    for row in upload_claim_report():
        print(f"  {row['A_ground_in2']:>5.0f} in²  "
              f"{row['F_pred_mN']:>9.2f} mN  "
              f"{row['F_meas_mN']:>7.1f} mN  "
              f"{row['abs_err_pct']:>7.1f} %")
    print("=" * 72)
    print("  Closed-form CONSTANTS are correct ({π,φ,e} only).")
    print("  Combined thrust LAW does not reproduce patent measurements.")
    print("  Status: documented failed candidate — see module docstring.")
    print("=" * 72)


if __name__ == "__main__":
    print_thruster_failure_report()
