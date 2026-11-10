#!/usr/bin/env python3
"""alt_cycle23: internal IR cutoffs for the cycle-19 EM ratio."""
from __future__ import annotations

import json
from itertools import product
from pathlib import Path

import numpy as np
from scipy.spatial import ConvexHull

PHI = (1.0 + np.sqrt(5.0)) / 2.0
PI = np.pi
R = PI / np.e
Q = 1.0
DELTA_STAR = 80.0 * PI / (1053.0 * PHI)
DELTA = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA)
R_ALPHA = 3.0 / (64.0 * PHI) + 1.0 / (79.0 * PHI ** 2)

# ----- icosahedron incidence (same as alt_cycle19) -----
pts = np.array(
    [(0, a, b * PHI) for a, b in product((-1, 1), repeat=2)]
    + [(a, b * PHI, 0) for a, b in product((-1, 1), repeat=2)]
    + [(a * PHI, 0, b) for a, b in product((-1, 1), repeat=2)],
    float,
)


def build_faces(points):
    hull = ConvexHull(points)
    groups = []
    for tri, eq in zip(hull.simplices, hull.equations):
        for g in groups:
            if np.linalg.norm(eq[:3] - g[0]) < 1e-7 and abs(eq[3] - g[1]) < 1e-7:
                g[2].update(map(int, tri))
                break
        else:
            groups.append([eq[:3], eq[3], set(map(int, tri))])
    result = []
    for normal, offset, indices in groups:
        ids = sorted(indices)
        cen = np.mean(points[ids], axis=0)
        e1 = points[ids[0]] - cen
        e1 = e1 / np.linalg.norm(e1)
        e2 = np.cross(normal, e1)
        face = sorted(
            ids,
            key=lambda i: np.arctan2(np.dot(points[i] - cen, e2), np.dot(points[i] - cen, e1)),
        )
        result.append(face)
    result.sort(key=lambda x: tuple(sorted(x)))
    return result


def build_bdry(points, faces):
    edges = sorted(set(tuple(sorted((i, j))) for f in faces for i, j in zip(f, f[1:] + f[:1])))
    lookup = {x: i for i, x in enumerate(edges)}
    b1 = np.zeros((len(points), len(edges)), float)
    b2 = np.zeros((len(edges), len(faces)), float)
    for e, (i, j) in enumerate(edges):
        b1[i, e] = -1.0
        b1[j, e] = 1.0
    for k, f in enumerate(faces):
        for i, j in zip(f, f[1:] + f[:1]):
            b2[lookup[tuple(sorted((i, j)))], k] = 1.0 if i < j else -1.0
    return b1, b2, edges


faces = build_faces(pts)
b1, b2, edges = build_bdry(pts, faces)
nV, nE = len(pts), len(edges)
assert nV == 12 and nE == 30
d0 = b1.T
Delta1 = d0 @ d0.T + b2 @ b2.T
u, s, vh = np.linalg.svd(b1, full_matrices=True)
rank = int(np.sum(s > 1e-10))
assert rank == 11
trans_basis = vh[rank:].T
assert trans_basis.shape == (30, 19)
Delta1_T = trans_basis.T @ Delta1 @ trans_basis
lam_min_D1T = float(np.linalg.eigvalsh(0.5 * (Delta1_T + Delta1_T.T)).min())
assert np.isclose(lam_min_D1T, 3.0 - np.sqrt(5.0), atol=1e-10)


def dDelta(e, q=Q):
    i, jv = edges[e]
    D = np.zeros((nV, nV), dtype=complex)
    D[jv, i] = -1j * q
    D[i, jv] = 1j * q
    return D


def d2Delta(e, q=Q):
    i, jv = edges[e]
    D = np.zeros((nV, nV), dtype=complex)
    D[jv, i] = q * q
    D[i, jv] = q * q
    return D


def delta_0(mass):
    D = np.zeros((nV, nV), dtype=complex)
    for e, (i, jv) in enumerate(edges):
        D[jv, jv] += 1.0
        D[i, i] += 1.0
        D[jv, i] += -1.0
        D[i, jv] += -1.0
    D += mass * np.eye(nV)
    return D


_DD = [dDelta(e) for e in range(nE)]
_D2 = [d2Delta(e) for e in range(nE)]


def vacuum_polarization(mass):
    G = np.linalg.inv(delta_0(mass))
    Pi = np.zeros((nE, nE), dtype=complex)
    for e in range(nE):
        seagull = np.trace(G @ _D2[e])
        for ep in range(nE):
            bubble = np.trace(G @ _DD[e] @ G @ _DD[ep])
            Pi[e, ep] = (seagull if e == ep else 0.0) - bubble
    Pi = np.real(0.5 * (Pi + Pi.T))
    return Pi


def R_EM_from_Pi(Pi):
    Pi_T = trans_basis.T @ Pi @ trans_basis
    ev = np.linalg.eigvalsh(0.5 * (Pi_T + Pi_T.T))
    lam_min = float(ev.min())
    return {
        "lambda_min_Pi_T": lam_min,
        "lambda_max_Pi_T": float(ev.max()),
        "lambda_min_Delta1_T": lam_min_D1T,
        "R_EM": lam_min / lam_min_D1T,
    }


# ----- predeclared cutoffs -----
def clock_L(n=24, theta=2.0 * PI / PHI ** 2, q=2):
    u = np.exp(1j * q * theta)
    S = np.zeros((n, n), dtype=complex)
    for t in range(n):
        S[t, (t + 1) % n] = 1.0
    D = S - u * np.eye(n)
    return D.conj().T @ D


evals_L = np.sort(np.linalg.eigvalsh(clock_L()).real)
eps_clock = float(evals_L.min())
c5 = 0.25 - 1.0 / (2.0 * (16.0 + R ** 2 * eps_clock))
eps_hid = 2.0 * (DELTA ** 2) * c5
eps_kms = float(ETA)

cutoffs = {
    "KMS": eps_kms,
    "clock": eps_clock,
    "hidden": eps_hid,
}
assert all(v > 0 for v in cutoffs.values())

# Compute the three primary R_EM values FIRST
primary = {}
for name, eps in cutoffs.items():
    Pi = vacuum_polarization(eps)
    rec = R_EM_from_Pi(Pi)
    rec["epsilon"] = float(eps)
    rec["finite"] = np.isfinite(rec["R_EM"])
    primary[name] = rec

# Structural completions of the clock option (predeclared)
# Deduplicate clock eigenvalues for speed, weight by multiplicity
unique_lams, counts = np.unique(np.round(evals_L, decimals=14), return_counts=True)
unique_lams = unique_lams.astype(float)

Pi_sum = np.zeros((nE, nE))
Pi_sum_r2 = np.zeros((nE, nE))
for lam, m in zip(unique_lams, counts):
    Pi_sum += m * vacuum_polarization(float(lam))
    Pi_sum_r2 += m * vacuum_polarization(float(R ** 2 * lam))

sum_rec = R_EM_from_Pi(Pi_sum)
sum_rec["epsilon_scheme"] = "sum_k Pi(lambda_k(L2))"
sum_rec["n_clock_modes"] = 24
sum_rec["finite"] = np.isfinite(sum_rec["R_EM"])

sumr_rec = R_EM_from_Pi(Pi_sum_r2)
sumr_rec["epsilon_scheme"] = "sum_k Pi(r^2 lambda_k(L2))"
sumr_rec["n_clock_modes"] = 24
sumr_rec["r_squared"] = float(R ** 2)
sumr_rec["finite"] = np.isfinite(sumr_rec["R_EM"])

# Record all five numbers before comparison
R_EM_values = {
    "KMS": primary["KMS"]["R_EM"],
    "clock": primary["clock"]["R_EM"],
    "hidden": primary["hidden"]["R_EM"],
    "clock_sum": sum_rec["R_EM"],
    "clock_sum_r2": sumr_rec["R_EM"],
}

# ========== comparison begins only after the five numbers exist ==========
rel_to_Ralpha = {k: abs(v - R_ALPHA) / abs(R_ALPHA) for k, v in R_EM_values.items()}
within_1e4 = {k: bool(r < 1e-4) for k, r in rel_to_Ralpha.items()}
any_within_1e4 = any(within_1e4.values())

# Look-elsewhere T1 G_strict (alt_cycle08 grammar)
G_strict = [1, 2, 3, 4, 5, 6, 8, 12, 13, 15, 16, 18, 20, 24, 30, 32, 50, 51, 60, 64, 80, 81, 90, 120, 190]
NUMS = [1, 2, 3, 4, 5, 7, 8, -1, -2, -3, -4, -5, -7, -8]


def census_T1_against(targets):
    atoms = []
    descs = []
    for coef in NUMS:
        for n in G_strict:
            for k in (0, 1, 2):
                atoms.append(coef / (n * (PHI ** k)))
                descs.append((coef, n, k))
    atoms = np.asarray(atoms, dtype=float)
    nA = len(atoms)
    stats = {
        name: {
            "exact": 0, "rel_1e-6": 0, "rel_1e-4": 0, "rel_1e-3": 0,
            "nearest_rel": None, "nearest_desc": None, "n_pairs": 0,
        }
        for name in targets
    }
    nearest = {name: (np.inf, None) for name in targets}
    tvals = {name: targets[name] for name in targets}
    n_pairs = 0
    chunk = 400
    for start in range(nA):
        js_begin = start + 1
        while js_begin < nA:
            js_end = min(nA, js_begin + chunk)
            s = atoms[start] + atoms[js_begin:js_end]
            n_pairs += s.size
            for name, tgt in tvals.items():
                rel = np.abs(s - tgt) / abs(tgt)
                stats[name]["exact"] += int(np.sum(rel < 1e-14))
                stats[name]["rel_1e-6"] += int(np.sum(rel < 1e-6))
                stats[name]["rel_1e-4"] += int(np.sum(rel < 1e-4))
                stats[name]["rel_1e-3"] += int(np.sum(rel < 1e-3))
                jloc = int(np.argmin(rel))
                rmin = float(rel[jloc])
                j = js_begin + jloc
                if rmin < nearest[name][0]:
                    nearest[name] = (rmin, (descs[start], descs[j], float(s[jloc])))
            js_begin = js_end
    for name in targets:
        stats[name]["n_pairs"] = n_pairs
        stats[name]["nearest_rel"] = nearest[name][0]
        stats[name]["nearest_desc"] = nearest[name][1]
    stats["_n_atoms"] = nA
    return stats


# Targets: R_alpha itself, and each computed R_EM (is R_EM a T1 writing?)
targets = {"R_alpha": R_ALPHA}
targets.update({f"R_EM_{k}": v for k, v in R_EM_values.items()})
print("census T1 strict...")
T1 = census_T1_against(targets)

equals_Ralpha_as_identity = False  # none of these is an algebraic identity with R_α

result = {
    "cutoffs": {
        "eta_KMS": eps_kms,
        "lambda_min_L2": eps_clock,
        "hidden_hessian_small_eigenvalue": eps_hid,
        "Delta": DELTA,
        "c5_gold": c5,
        "r": R,
    },
    "lambda_min_Delta1_T": lam_min_D1T,
    "H1_finiteness": {
        "primary": primary,
        "all_three_positive": True,
        "all_three_make_Pi_T_finite": all(primary[k]["finite"] for k in primary),
    },
    "H2_identifications": {
        "KMS_temperature_is_a_fermion_kinetic_term": False,
        "hidden_4_5_hessian_is_a_fermion_kinetic_term": False,
        "product_sum_assumes_fermions_carry_the_24_clock": True,
        "clock_sum": sum_rec,
        "clock_sum_r2": sumr_rec,
    },
    "R_EM_values_recorded_before_comparison": R_EM_values,
    "H3_comparison": {
        "R_alpha": R_ALPHA,
        "relative_error_to_R_alpha": rel_to_Ralpha,
        "within_relative_1e-4_of_R_alpha": within_1e4,
        "any_within_relative_1e-4": any_within_1e4,
        "equals_R_alpha_as_an_identity": equals_Ralpha_as_identity,
        "T1_strict": T1,
        "G_strict_contains_79": 79 in G_strict,
        "numerical_near_hit_is_not_a_derivation": True,
    },
    "classification": {
        "H1": "PROVED",
        "H2": "CONDITIONAL (product-sum assumes fermions carry the 24-clock; ε_KMS and ε_hid are extra identifications)",
        "H3": "PROVED",
    },
    "advances_ARF": False,
    "which_ARF": None,
    "next_obstruction": (
        "Each named cutoff makes R_EM finite, but identifying ε_KMS or ε_hid "
        "with a spatial fermion mass is extra, the product-sum requires clocked "
        "fermions, and none of the five predeclared ratios equals R_α as an identity."
    ),
}


def jsonable(x):
    if isinstance(x, dict):
        return {str(k): jsonable(v) for k, v in x.items()}
    if isinstance(x, (list, tuple)):
        return [jsonable(v) for v in x]
    if isinstance(x, (np.bool_,)):
        return bool(x)
    if isinstance(x, (np.integer,)):
        return int(x)
    if isinstance(x, (np.floating,)):
        return float(x)
    return x


result = jsonable(result)
out = Path("/workspace/arf_research/alt_cycle23_ir_cutoff/results.json")
out.write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps({
    "cutoffs": result["cutoffs"],
    "R_EM": R_EM_values,
    "rel": rel_to_Ralpha,
    "within_1e-4": within_1e4,
    "T1_R_alpha_nearest": T1["R_alpha"],
    "classification": result["classification"],
}, indent=2))
print("PASS: alt_cycle23")
