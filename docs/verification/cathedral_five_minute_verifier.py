#!/usr/bin/env python3
"""
Newton's Cathedral / URT — five-minute verification certificate.

Purpose
-------
Check a small set of claims without importing the Cathedral codebase:
1. frozen scalar arithmetic,
2. A4 triangle-frame identity,
3. A5 representation decompositions,
4. entropy/BKM identities,
5. parent-trace gauge normalization.

This script verifies mathematics/arithmetic only.  It does NOT prove that
Cathedral quantities are the corresponding physical observables.
Only the Python standard library is used.
"""

from fractions import Fraction
import math
import json

TOL = 1e-12

def matmul(A, B):
    m, n, p = len(A), len(B), len(B[0])
    assert len(A[0]) == n
    return [[sum(A[i][k] * B[k][j] for k in range(n)) for j in range(p)] for i in range(m)]

def transpose(A):
    return [list(row) for row in zip(*A)]

def rank_fraction(A):
    M = [[Fraction(x) for x in row] for row in A]
    m, n = len(M), len(M[0])
    r = 0
    for c in range(n):
        pivot = next((i for i in range(r, m) if M[i][c] != 0), None)
        if pivot is None:
            continue
        M[r], M[pivot] = M[pivot], M[r]
        q = M[r][c]
        M[r] = [x / q for x in M[r]]
        for i in range(m):
            if i != r and M[i][c] != 0:
                q = M[i][c]
                M[i] = [M[i][j] - q * M[r][j] for j in range(n)]
        r += 1
        if r == m:
            break
    return r

def max_abs_matrix(A):
    return max(abs(float(x)) for row in A for x in row)

phi = (1.0 + math.sqrt(5.0)) / 2.0
N, D, F, V, q = 13, 3, 20, 12, 5
gamma = 1.0 / 81.0
d_star = (1.0 - gamma) * math.pi / (N * phi)
d_cl = 3.0 / 20.0
Delta = d_cl - d_star
eta = -math.log(Delta)
alpha_inv = 137.0 + (17572.0 / 1215.0) * Delta - (9.0 / 65.0) * Delta**2
cabibbo = math.sqrt(8.0 / 159.0)
omega_m = 6.0 / 19.0
omega_l = 13.0 / 19.0

p5 = Delta**2 / (1.0 + Delta**2)
a = 1.0 / (4.0 * (1.0 + Delta**2))
b = Delta**2 / (4.0 * (1.0 + Delta**2))
entropy_slope = math.log((1.0 - p5) / p5)
chi35 = math.log(a / b) / (a - b)
chi35_closed = 8.0 * eta * (1.0 + Delta**2) / (1.0 - Delta**2)
kappa_gen = eta**2 / chi35
kappa_closed = (eta / 8.0) * (1.0 - Delta**2) / (1.0 + Delta**2)

pairs = [(i,j) for i in range(5) for j in range(i+1,5)]
triangles = []
for i in range(5):
    for j in range(i+1,5):
        for k in range(j+1,5):
            u = [0]*5
            v = [0]*5
            u[i], u[j] = 1, -1
            v[j], v[k] = 1, -1
            w = [u[p]*v[r] - u[r]*v[p] for p,r in pairs]
            triangles.append(w)

B = triangles
M = matmul(transpose(B), B)
M2 = matmul(M, M)
M2_minus_5M = [[M2[i][j] - 5*M[i][j] for j in range(10)] for i in range(10)]
a4_rank = rank_fraction(M)
a4_poly_residual = max_abs_matrix(M2_minus_5M)

sizes = [1, 15, 20, 12, 12]
sqrt5 = math.sqrt(5.0)
ph = (1.0 + sqrt5)/2.0
phb = (1.0 - sqrt5)/2.0

chars = {
    "1":  [1, 1, 1, 1, 1],
    "3":  [3, -1, 0, ph, phb],
    "3p": [3, -1, 0, phb, ph],
    "4":  [4, 0, 1, -1, -1],
    "5":  [5, 1, -1, 0, 0],
}

def inner_char(c1, c2):
    return sum(s*x*y for s,x,y in zip(sizes,c1,c2)) / 60.0

def multiplicities(target):
    return {name: inner_char(target, c) for name,c in chars.items()}

chi4 = chars["4"]
chi_tensor = [x*x for x in chi4]
chi4_g2 = [4, 4, 1, -1, -1]
chi_sym = [(x*x + y)/2.0 for x,y in zip(chi4, chi4_g2)]
chi_wedge = [(x*x - y)/2.0 for x,y in zip(chi4, chi4_g2)]
mult_tensor = multiplicities(chi_tensor)
mult_sym = multiplicities(chi_sym)
mult_wedge = multiplicities(chi_wedge)

TrY2 = 3.0*(1.0/3.0)**2 + 2.0*(1.0/2.0)**2
TrT1_2 = (3.0/5.0)*TrY2
TrT3_2 = (0.5)**2 + (-0.5)**2
trace_ratio = TrY2 / TrT3_2
sin2_parent = 3.0/8.0

alpha_obs, alpha_sigma = 137.035999177, 0.000000021
vus_obs, vus_sigma = 0.22431, 0.00085
om_obs, om_sigma = 0.315, 0.007

comparisons = {
    "alpha_inverse": {
        "candidate": alpha_inv,
        "reference": alpha_obs,
        "sigma": alpha_sigma,
        "difference": alpha_inv-alpha_obs,
        "z": (alpha_inv-alpha_obs)/alpha_sigma,
        "evidentiary_status": "retrospective concordance, not a blind prediction",
    },
    "Vus_Cabibbo": {
        "candidate": cabibbo,
        "reference": vus_obs,
        "sigma": vus_sigma,
        "difference": cabibbo-vus_obs,
        "z": (cabibbo-vus_obs)/vus_sigma,
        "evidentiary_status": "retrospective concordance, not a blind prediction",
    },
    "Omega_m_base_LCDM": {
        "candidate": omega_m,
        "reference": om_obs,
        "sigma": om_sigma,
        "difference": omega_m-om_obs,
        "z": (omega_m-om_obs)/om_sigma,
        "evidentiary_status": "model-dependent retrospective concordance",
    },
}

checks = {
    "Delta_from_locked_rails": abs(Delta - 0.002489189840420375) < 2e-15,
    "alpha_arithmetic": abs(alpha_inv - 137.035999178195) < 2e-12,
    "cabibbo_arithmetic": abs(cabibbo - 0.22430886163681774) < 2e-15,
    "cosmology_sum": abs(omega_m + omega_l - 1.0) < TOL,
    "entropy_slope_equals_2eta": abs(entropy_slope - 2.0*eta) < TOL,
    "BKM_closed_form": abs(chi35 - chi35_closed) < 1e-11,
    "dual_metric_closed_form": abs(kappa_gen - kappa_closed) < 1e-12,
    "dual_metric_product": abs(chi35*kappa_gen - eta**2) < 1e-11,
    "A4_triangle_frame_rank_6": a4_rank == 6,
    "A4_triangle_frame_M2_eq_5M": a4_poly_residual == 0.0,
    "A5_4tensor4": all(abs(mult_tensor[k]-1.0) < TOL for k in chars),
    "A5_sym2_4_eq_1plus4plus5":
        abs(mult_sym["1"]-1)<TOL and abs(mult_sym["4"]-1)<TOL and abs(mult_sym["5"]-1)<TOL
        and abs(mult_sym["3"])<TOL and abs(mult_sym["3p"])<TOL,
    "A5_wedge2_4_eq_3plus3p":
        abs(mult_wedge["3"]-1)<TOL and abs(mult_wedge["3p"]-1)<TOL
        and abs(mult_wedge["1"])<TOL and abs(mult_wedge["4"])<TOL and abs(mult_wedge["5"])<TOL,
    "parent_trace_TrT1sq_half": abs(TrT1_2-0.5) < TOL,
    "parent_trace_ratio_5over3": abs(trace_ratio-5.0/3.0) < TOL,
    "parent_weak_angle_3over8": abs(sin2_parent-0.375) < TOL,
}

result = {
    "frozen": {
        "phi": phi, "d_star": d_star, "d_cl": d_cl,
        "Delta": Delta, "eta_Delta": eta,
    },
    "arithmetic": {
        "alpha_root_inverse": alpha_inv,
        "cabibbo_s12": cabibbo,
        "Omega_m": omega_m,
        "Omega_Lambda": omega_l,
    },
    "entropy": {
        "p5": p5, "a": a, "b": b,
        "dS_over_kB_dp5": entropy_slope,
        "chi35": chi35,
        "kappa_generator": kappa_gen,
        "chi_times_kappa": chi35*kappa_gen,
        "eta_squared": eta**2,
    },
    "A4_frame": {
        "triangle_count": len(triangles),
        "rank": a4_rank,
        "M2_minus_5M_max_abs": a4_poly_residual,
    },
    "A5_characters": {
        "4x4_multiplicities": mult_tensor,
        "Sym2_4_multiplicities": mult_sym,
        "Wedge2_4_multiplicities": mult_wedge,
    },
    "gauge_trace": {
        "TrY2": TrY2,
        "TrT1_squared": TrT1_2,
        "TrT3_squared": TrT3_2,
        "raw_Y_to_SU2_trace_ratio": trace_ratio,
        "sin2_thetaW_parent": sin2_parent,
    },
    "published_comparisons": comparisons,
    "checks": checks,
    "all_math_checks_pass": all(checks.values()),
    "scope_warning": (
        "Passing these checks establishes the displayed arithmetic and finite algebra only. "
        "It does not prove that alpha_root is physical alpha, s12 is physical V_us, "
        "6/19 is the physical cosmological matter fraction, or that the entropy carrier "
        "has the claimed continuum force interpretation."
    ),
}

print(json.dumps(result, indent=2))
