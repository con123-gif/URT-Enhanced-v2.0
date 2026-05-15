"""
Master Template Search — Stage 2.

Try to find ONE 9-slot template that hits as many observables as possible:

    O  =  T( P_num/P_den * pi^a * phi^b * delta_star^c )
          * gamma^k
          * (1 + h1*delta_star + h2*gamma + h3*eta)

Slots (per observable):
   P_num, P_den           — small Cathedral integers
   gamma_exp k            — ∈ {-16,-7,-1,0,1,2,3,5,9,64}
   pi_exp a               — ∈ {-4,-2,-1,0,1,2,4}
   phi_exp b              — ∈ {-2,-1,0,1,2}
   delta_pow c            — ∈ {0,1,2}
   trig T                 — ∈ {id, sin, cos, atan, asin}
   (h1, h2, h3)           — ∈ {-2,-1,0,1,2}^3 for one fixed correction shape

That's ≤ 11 slot choices per observable. The question is whether the same
template SHAPE (with different slot values) covers everything, vs whether
some observables genuinely need a different shape.

The honest answer here is: a SHAPE alone is not the test. Two observables
"share the same shape" only if their other choices are forced by some
deeper principle. Below we report what shape each observable WOULD take
in this template, and which observables refuse to fit at <1%.
"""
from __future__ import annotations
from math import pi, sqrt, log, atan, asin, sin, cos, tan
from dataclasses import dataclass
from typing import Optional, List, Dict, Any

D, q, V, N, E, F, G = 3, 5, 12, 13, 30, 20, 60
GAMMA = 1.0/81.0
PHI   = (1.0 + sqrt(5.0)) / 2.0
DELTA_CL   = D/F
DELTA_STAR = (1.0 - GAMMA) * pi / (N * PHI)
DELTA      = DELTA_CL - DELTA_STAR
ETA        = (log(2.0) - (D*D)/N) / log(2.0)

# Tight Cathedral integer basis (much smaller than before)
CATHEDRAL_INTS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 17, 20, 30, 50, 57, 60, 80, 137, 197, 240, 1836]


def master_template_compute(P_num, P_den, gamma_exp, pi_exp, phi_exp, delta_pow,
                            trig, trig_arg_kind,
                            h1, h2, h3,
                            multiplier_log10=0):
    """Compute O = trig(arg) * P*gamma^k * pi^a * phi^b * delta^c * (1+h1*δ★+h2*γ+h3*η)

    The trig argument is constrained: trig_arg_kind chooses between common forms:
      0 = no trig (T=id, just multiply by 1)
      1 = pi/V
      2 = pi/F
      3 = pi/D
      4 = delta_star
      5 = (N+1)/(N*phi)  (for atan)
      6 = sqrt((F+V)/(G-1))   (for asin)
    """
    if P_den == 0: return float('inf')
    base = (P_num/P_den) * GAMMA**gamma_exp * pi**pi_exp * PHI**phi_exp * DELTA_STAR**delta_pow
    correction = 1 + h1*DELTA_STAR + h2*GAMMA + h3*ETA
    if trig == "id":
        t = 1.0
    else:
        if trig_arg_kind == 1:    arg = pi/V
        elif trig_arg_kind == 2:  arg = pi/F
        elif trig_arg_kind == 3:  arg = pi/D
        elif trig_arg_kind == 4:  arg = DELTA_STAR
        elif trig_arg_kind == 5:  arg = (N+1)/(N*PHI)
        elif trig_arg_kind == 6:  arg = sqrt((F+V)/(G-1))
        else: return float('inf')
        if   trig == "sin":  t = sin(arg)
        elif trig == "cos":  t = cos(arg)
        elif trig == "atan": t = atan(arg)
        elif trig == "asin":
            if abs(arg) > 1: return float('inf')
            t = asin(arg)
        else: return float('inf')
    return base * t * correction * 10**multiplier_log10


@dataclass
class Target:
    name:      str
    observed:  float
    units:     str = ""
    # additional constraints
    is_angle_deg: bool = False    # multiply final result by 180/pi
    is_log10:     bool = False    # observation is log10 of physical (for huge ranges)


# ── Targets (just observables — not the v9 formulas) ────────────────────
TARGETS = [
    # Pure ratios (dimensionless, O(1))
    Target("1/alpha", 137.035999),
    Target("alpha_s(M_Z)", 0.1179),
    Target("sin2_theta_W", 0.23122),
    Target("sin_theta_C", 0.22500),
    Target("rho_bar", 0.159),
    Target("A_CKM", 0.836),
    Target("J_CKM_1e-5", 3.2e-5),
    # Mass ratios
    Target("m_p/m_e", 1836.15267),
    Target("m_mu/m_e", 206.76828),
    Target("m_tau/m_e", 3477.23),
    # Angles in degrees
    Target("theta_12_deg", 33.41, is_angle_deg=True),
    Target("theta_13_deg", 8.54,  is_angle_deg=True),
    Target("theta_23_deg", 49.1,  is_angle_deg=True),
    Target("delta_CP_deg", 197.0, is_angle_deg=True),
    # Cosmology
    Target("Omega_m", 0.3153),
    Target("Omega_b", 0.0493),
    Target("sigma_8", 0.8111),
    Target("n_s", 0.9649),
    Target("eta_B_1e-10", 6.12e-10),
    Target("A_s_1e-9", 2.10e-9),
    # Scales (huge ranges)
    Target("Lambda/MPl4", 1.35e-123, is_log10=True),
    Target("MPl_GeV", 1.2209e19, is_log10=True),
    Target("v_EW_GeV", 246.22, is_log10=True),
    Target("m_e_GeV", 5.110e-4, is_log10=True),
    Target("m_p_GeV", 0.93827, is_log10=True),
    Target("m_top_GeV", 172.69),
    Target("m_W_GeV", 80.379),
    Target("m_Z_GeV", 91.188),
    Target("m_H_GeV", 125.10),
    Target("m_b_GeV", 4.18),
    Target("m_c_GeV", 1.27),
    Target("m_s_MeV", 93.4),
    Target("m_d_MeV", 4.67),
    Target("m_u_MeV", 2.16),
    Target("Lambda_QCD_MeV", 210.0),
    Target("r_p_fm", 0.8409),
]


# We search a constrained grid for each target:
TRIG_OPTIONS = ["id", "sin", "cos", "atan", "asin"]
TRIG_ARG_KINDS = [0, 1, 2, 3, 4, 5, 6]
GAMMA_EXPS = [-16, -7, -1, 0, 1, 2, 3, 5, 9, 64]
PI_EXPS = [-2, -1, 0, 1, 2, 4]
PHI_EXPS = [-1, 0, 1, 2]
DELTA_POWS = [0, 1, 2, 3]
# Restricted Cathedral basis: only "atomic" integers + a few useful compounds
P_NUMS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 20, 30, 57, 60]
P_DENS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 20, 30, 57, 60, 81]
H_CHOICES = [0]   # Disable corrections for the master template — too much DOF


def search_master_template(target: Target, tol: float = 0.01) -> Optional[Dict]:
    """Search for a tight (P_num, P_den, k, a, b, c, trig, trig_arg, ...) that hits target to <tol."""
    obs = target.observed
    best = None

    for trig in TRIG_OPTIONS:
        if trig == "id":
            ta_kinds = [0]
        else:
            ta_kinds = TRIG_ARG_KINDS[1:]   # skip kind=0 (no trig)
        for ta in ta_kinds:
            for k in GAMMA_EXPS:
                for a in PI_EXPS:
                    for b in PHI_EXPS:
                        for c in DELTA_POWS:
                            for pn in P_NUMS:
                                for pd in P_DENS:
                                    val = master_template_compute(pn, pd, k, a, b, c, trig, ta, 0, 0, 0)
                                    if target.is_angle_deg:
                                        val = val * 180.0/pi
                                    if obs == 0 or not (val == val):  # NaN check
                                        continue
                                    rel = abs((val - obs)/obs)
                                    if rel < tol:
                                        candidate = (rel, pn, pd, k, a, b, c, trig, ta)
                                        if best is None or candidate < best:
                                            best = candidate
                                            if rel < 1e-4:
                                                # Good enough — early stop
                                                return {
                                                    'fit': True, 'rel_err': rel,
                                                    'P_num': pn, 'P_den': pd,
                                                    'gamma_exp': k, 'pi_exp': a,
                                                    'phi_exp': b, 'delta_pow': c,
                                                    'trig': trig, 'trig_arg_kind': ta,
                                                }
    if best is None:
        return None
    return {
        'fit': True, 'rel_err': best[0],
        'P_num': best[1], 'P_den': best[2],
        'gamma_exp': best[3], 'pi_exp': best[4],
        'phi_exp': best[5], 'delta_pow': best[6],
        'trig': best[7], 'trig_arg_kind': best[8],
    }


def run():
    hits = 0
    misses = []
    rows = []
    for t in TARGETS:
        res = search_master_template(t, tol=0.01)
        if res:
            hits += 1
            rows.append((t.name, t.observed, res))
        else:
            misses.append(t.name)
            rows.append((t.name, t.observed, None))

    # Render
    print(f"Master template search: {hits}/{len(TARGETS)} fit at <1%")
    print("=" * 100)
    print(f"{'observable':<22} {'observed':>12}  {'P_num/P_den':<12} {'γ^k':>5} {'π^a':>5} {'φ^b':>5} {'δ★^c':>5}  {'trig(arg)':<24} {'rel_err':>10}")
    print("=" * 100)
    for name, obs, res in rows:
        if res is None:
            print(f"  {name:<22} {obs:>12.5g}  --- NO FIT AT <1% ---")
        else:
            t_str = f"{res['trig']}(kind={res['trig_arg_kind']})" if res['trig'] != 'id' else "id"
            P_str = f"{res['P_num']}/{res['P_den']}"
            print(f"  {name:<22} {obs:>12.5g}  {P_str:<12} {res['gamma_exp']:>5} {res['pi_exp']:>5} {res['phi_exp']:>5} {res['delta_pow']:>5}  {t_str:<24} {res['rel_err']*100:>9.3f}%")
    print("=" * 100)
    if misses:
        print(f"MISSES ({len(misses)}): {misses}")

    return hits, misses, rows


if __name__ == "__main__":
    run()
