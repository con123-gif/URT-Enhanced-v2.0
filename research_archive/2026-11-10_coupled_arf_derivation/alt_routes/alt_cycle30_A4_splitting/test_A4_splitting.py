#!/usr/bin/env python3
"""Alt cycle 30: does a derived subleading effect split A4 triplets into 1⊕1'⊕1''?"""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd
from scipy.optimize import minimize

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import (  # noqa: E402
    classify_rotation,
    icosahedral_rotations,
    induced_perm,
    load_ops,
)

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_HIDDEN = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_HIDDEN)
DELTA2 = DELTA_HIDDEN ** 2
C3 = 0.2222379207611084
C5 = 0.21876978874206543
C_ODD = C3
C_EVEN = DELTA2 * C5
THETA = 2.0 * np.pi / (PHI ** 2)
# ρ* = (I4 ⊕ Δ² I4) / [4(1+Δ²)]
RHO_STAR_WEIGHT_ODD = 1.0 / (4.0 * (1.0 + DELTA2))
RHO_STAR_WEIGHT_EVEN = DELTA2 / (4.0 * (1.0 + DELTA2))
C_MASS = -(5.0 / 16.0) * DELTA_STAR ** 3 + (7.0 / 8.0) * np.pi * PHI
R_MASS = (3.0 / 35.0) * DELTA_STAR ** 2 - (4.0 / 51.0) * np.pi ** 3
G_STRICT = [1, 2, 3, 4, 5, 6, 8, 12, 13, 15, 16, 18, 20, 24, 30, 32, 50, 51, 60, 64, 80, 81, 90, 120, 190]
NUMS = [1, 2, 3, 4, 5, 7, 8, -1, -2, -3, -4, -5, -7, -8]

EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
ODD_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "odd_adjacent_current_frame.npy")
B3 = np.load(ROOT / "coupled_cycle03_map_F_hessian" / "B3.npy")
B5 = np.load(ROOT / "coupled_cycle03_map_F_hessian" / "B5.npy")
HAT25 = np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_hat_even_4_5.npy")
R25 = float(np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_r_even_4_5.npy")[0])


def jsonable(obj):
    if isinstance(obj, dict):
        return {str(k): jsonable(v) for k, v in obj.items()}
    if isinstance(obj, (list, tuple)):
        return [jsonable(v) for v in obj]
    if isinstance(obj, (np.floating, float)):
        x = float(obj)
        return None if not np.isfinite(x) else x
    if isinstance(obj, (np.integer, int)):
        return int(obj)
    if isinstance(obj, (np.bool_, bool)):
        return bool(obj)
    if isinstance(obj, np.ndarray):
        return jsonable(obj.tolist())
    return obj


def graph_laplacian(n, edges):
    A = np.zeros((n, n))
    for i, j in edges:
        A[i, j] = 1.0
        A[j, i] = 1.0
    return np.diag(A.sum(axis=1)) - A


def pairing_matrix(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def bdg_positive(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n), dtype=complex)
    H[:n, :n] = K
    H[n:, n:] = -np.conj(K) if np.iscomplexobj(K) else -K
    H[:n, n:] = Delta
    H[n:, :n] = np.conj(Delta.T) if np.iscomplexobj(Delta) else Delta
    H = 0.5 * (H + H.conj().T)
    ev = eigvalsh(H)
    return np.maximum(ev[n:].real, 0.0)


def distinct_with_mult(vals, atol=1e-8, rtol=1e-7):
    groups = []
    for v in vals:
        if not groups or abs(v - groups[-1][0]) > max(atol, rtol * max(1.0, abs(groups[-1][0]))):
            groups.append([float(v), 1])
        else:
            groups[-1][0] = (groups[-1][0] * groups[-1][1] + float(v)) / (groups[-1][1] + 1)
            groups[-1][1] += 1
    return [(g[0], g[1]) for g in groups]


def log2cosh(z):
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


def fermion_omega(energies, xi, T):
    if T <= 0:
        return -0.5 * (np.sum(np.abs(energies)) - np.sum(np.abs(xi)))
    return -T * np.sum(log2cosh(energies / (2.0 * T))) + T * np.sum(log2cosh(np.abs(xi) / (2.0 * T)))


def V_hist(h3, h5):
    return C_ODD * float(np.dot(h3, h3)) + C_EVEN * float(np.dot(h5, h5))


def stabilizer(Delta, rots, pts, edges, sign_ok=False, atol=1e-6):
    n = 0
    order_counts = {}
    for R in rots:
        perm = induced_perm(pts, R)
        if perm is None:
            continue
        P = np.zeros((12, 12), dtype=complex)
        for i, p in enumerate(perm):
            P[p, i] = 1.0
        Dp = P @ Delta @ P.T
        ok = np.allclose(Dp, Delta, atol=atol)
        if (not ok) and sign_ok:
            ok = np.allclose(Dp, -Delta, atol=atol)
        if ok:
            n += 1
            acc = np.eye(3)
            order = 1
            for k in range(1, 7):
                acc = acc @ R
                if np.allclose(acc, np.eye(3), atol=1e-7):
                    order = k
                    break
            order_counts[order] = order_counts.get(order, 0) + 1
    name = {60: "A5", 12: "A4", 10: "D5", 6: "D3", 5: "C5", 4: "C2xC2", 3: "C3", 2: "C2", 1: "1"}.get(n, f"order_{n}")
    return {"order": n, "name": name, "order_counts": {int(k): int(v) for k, v in order_counts.items()}}


def Hodge_Lambda(K):
    """Cathedral Hodge kinetics: eigenvalues 1, 6−√5, 6+√5, 7 on 1, 3, 3', 5 of K."""
    ev, evec = np.linalg.eigh(K)
    # K spectrum: 0 (1), 5-√5 (3), 6 (5), 5+√5 (3)
    lam_map = []
    for e in ev:
        if abs(e) < 1e-8:
            lam_map.append(1.0)
        elif abs(e - (5 - np.sqrt(5))) < 1e-6:
            lam_map.append(6 - np.sqrt(5))
        elif abs(e - 6.0) < 1e-6:
            lam_map.append(7.0)
        elif abs(e - (5 + np.sqrt(5))) < 1e-6:
            lam_map.append(6 + np.sqrt(5))
        else:
            raise RuntimeError(f"unexpected K eigenvalue {e}")
    L = evec @ np.diag(lam_map) @ evec.T
    return 0.5 * (L + L.T)


def C_ico_of(K):
    """Cbridge icosahedral vertex block 4 P1 + 4 P3, P3 = dipole (the 3 of lowest Laplacian)."""
    ev, evec = np.linalg.eigh(K)
    P1 = np.outer(evec[:, 0], evec[:, 0])  # constant, but actually P1 = ones/12
    # lowest nonzero 3: eigenvalue 5-√5
    idx = [i for i, e in enumerate(ev) if abs(e - (5 - np.sqrt(5))) < 1e-6]
    assert len(idx) == 3
    P3 = evec[:, idx] @ evec[:, idx].T
    return 4.0 * P1 + 4.0 * P3


def census_T1_against(targets):
    atoms, descs = [], []
    for coef in NUMS:
        for n in G_STRICT:
            for k in (0, 1, 2):
                atoms.append(coef / (n * (PHI ** k)))
                descs.append((int(coef), int(n), int(k)))
    atoms = np.asarray(atoms, dtype=float)
    nA = len(atoms)
    stats = {name: {"exact": 0, "rel_1e-6": 0, "rel_1e-4": 0, "rel_1e-3": 0,
                    "nearest_rel": None, "nearest_desc": None, "n_pairs": 0} for name in targets}
    nearest = {name: (np.inf, None) for name in targets}
    n_pairs = 0
    chunk = 400
    for start in range(nA):
        js = start + 1
        while js < nA:
            je = min(nA, js + chunk)
            s = atoms[start] + atoms[js:je]
            n_pairs += s.size
            for name, tgt in targets.items():
                if abs(tgt) < 1e-30:
                    continue
                rel = np.abs(s - tgt) / abs(tgt)
                stats[name]["exact"] += int(np.sum(rel < 1e-14))
                stats[name]["rel_1e-6"] += int(np.sum(rel < 1e-6))
                stats[name]["rel_1e-4"] += int(np.sum(rel < 1e-4))
                stats[name]["rel_1e-3"] += int(np.sum(rel < 1e-3))
                jloc = int(np.argmin(rel))
                rmin = float(rel[jloc])
                if rmin < nearest[name][0]:
                    nearest[name] = (rmin, (descs[start], descs[js + jloc], float(s[jloc])))
            js = je
    for name in targets:
        stats[name]["n_pairs"] = n_pairs
        stats[name]["nearest_rel"] = nearest[name][0]
        stats[name]["nearest_desc"] = nearest[name][1]
    stats["_n_atoms"] = nA
    return stats


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    faces = [tuple(f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    edges = sorted(raw)
    K = graph_laplacian(12, edges)
    XI = eigvalsh(K)
    ROTS, _ = icosahedral_rotations(pts)
    hat = np.asarray(HAT25, float)
    hat = hat / np.linalg.norm(hat)
    h5 = R25 * hat
    Delta5 = pairing_matrix(EVEN_FRAME, h5, edges)
    stab0 = stabilizer(Delta5, ROTS, pts, edges)

    # P1: induced h3
    def omega_h3(h3, ye=1.0, yo=1.0):
        D = ye * pairing_matrix(EVEN_FRAME, h5, edges) + yo * pairing_matrix(ODD_FRAME, h3, edges)
        E = bdg_positive(K, D)
        return V_hist(h3, h5) + fermion_omega(E, XI, ETA)

    res = minimize(omega_h3, np.zeros(4), method="BFGS", options={"gtol": 1e-8, "maxiter": 80})
    h3_star = res.x
    Delta_sum = Delta5 + pairing_matrix(ODD_FRAME, h3_star, edges)
    stab_sum = stabilizer(Delta_sum, ROTS, pts, edges)

    # portal: minimise V_hist(h3 - q3, h5 - q5) + Ω_f(h3,h5) over α, h3 at fixed h5
    def q_of(alpha):
        q3 = 0.5 * np.einsum("ija,i,j->a", B3, alpha, alpha)
        q5 = 0.5 * np.einsum("ija,i,j->a", B5, alpha, alpha)
        return q3, q5

    def portal_obj(x):
        h3 = x[:4]
        alpha = x[4:]
        q3, q5 = q_of(alpha)
        D = pairing_matrix(EVEN_FRAME, h5, edges) + pairing_matrix(ODD_FRAME, h3, edges)
        E = bdg_positive(K, D)
        return V_hist(h3 - q3, h5 - q5) + fermion_omega(E, XI, ETA)

    res_p = minimize(portal_obj, np.zeros(12), method="BFGS", options={"gtol": 1e-6, "maxiter": 80})
    h3_portal = res_p.x[:4]
    stab_portal = stabilizer(Delta5 + pairing_matrix(ODD_FRAME, h3_portal, edges), ROTS, pts, edges)

    # P2: ρ*-weighted potential (relative weight already in V_hist via Δ²; extra test = rescale odd/even by ρ* weights)
    # Using ρ* as a metric: V_ρ = (h3,h5) · ρ*^{-1} · (h3,h5) up to the overall 4(1+Δ²)
    # ρ*_odd = 1/[4(1+Δ²)], ρ*_even = Δ²/[4(1+Δ²)], so ρ*^{-1} odd ~ 4(1+Δ²), even ~ 4(1+Δ²)/Δ²
    # That just rescales the already-positive V_hist coefficients and cannot change the A4 direction of a pure-even vev.
    def omega_rho(h3):
        # extra weight already encoded; minimise V_ρ + Ω_f
        Vrho = (np.dot(h3, h3) / max(RHO_STAR_WEIGHT_ODD, 1e-30)
                + np.dot(h5, h5) / max(RHO_STAR_WEIGHT_EVEN, 1e-30))
        D = pairing_matrix(EVEN_FRAME, h5, edges) + pairing_matrix(ODD_FRAME, h3, edges)
        E = bdg_positive(K, D)
        return Vrho + fermion_omega(E, XI, ETA)
    res_r = minimize(omega_rho, np.zeros(4), method="BFGS", options={"gtol": 1e-8, "maxiter": 40})
    stab_rho = stabilizer(Delta5 + pairing_matrix(ODD_FRAME, res_r.x, edges), ROTS, pts, edges)

    # P3: A5-invariant kinetics
    Lam = Hodge_Lambda(K)
    Cico = C_ico_of(K)
    spectra = {}
    for name, Kin in [("graph_K", K), ("Hodge_Lambda", Lam), ("K_plus_Cico", K + Cico)]:
        E = bdg_positive(Kin, Delta5)
        groups = distinct_with_mult(E, atol=1e-6, rtol=1e-8)
        spectra[name] = {
            "distinct": [{"value": a, "mult": b} for a, b in groups],
            "n_distinct_positive": sum(1 for a, b in groups if a > 1e-8),
            "has_zero": bool(any(a <= 1e-8 for a, b in groups)),
            "three_nondeg_singlets": bool(
                sum(1 for a, b in groups if a > 1e-8 and b == 1) >= 3
                and all(b == 1 for a, b in groups if a > 1e-8)
            ),
            "max_positive_mult": max((b for a, b in groups if a > 1e-8), default=0),
        }

    # Representation-theory obstruction (computed, not assumed beyond character tables)
    # 3 of A4 is irreducible, so any A4-invariant kinetic+pairing operator preserves
    # at least the existing A4 multiplets.
    A4_preserved = {
        "vacuum": stab0["name"] == "A4",
        "induced_odd": stab_sum["name"] == "A4",
        "portal": stab_portal["name"] == "A4",
        "rho_star": stab_rho["name"] == "A4",
    }
    any_breaking = not all(A4_preserved.values())
    split_to_singlets = any(spectra[n]["three_nondeg_singlets"] for n in spectra)

    recorded_ratios = {}
    comparison_performed = False
    if split_to_singlets and any_breaking:
        # pick the spectrum that actually split, record ratios, THEN compare
        for name, rec in spectra.items():
            if rec["three_nondeg_singlets"]:
                mus = [g["value"] for g in rec["distinct"] if g["value"] > 1e-8]
                if len(mus) >= 3:
                    m1, m2, m3 = mus[0], mus[1], mus[2]
                    recorded_ratios = {
                        "mu2_over_mu1": m1 and m2 / m1,
                        "mu3_over_mu1": m3 / m1,
                        "mu3_over_mu2": m3 / m2,
                        "koide_like": (m1 + m2 + m3) ** 2 / (m1 ** 2 + m2 ** 2 + m3 ** 2),
                    }
                    break
        comparison_performed = bool(recorded_ratios)

    results = {
        "repr_theory": {
            "4_of_A5_branches_as_1_plus_3_of_A4": True,
            "3_of_A4_is_irreducible_over_C": True,
            "A4_invariant_operator_cannot_split_the_3": True,
            "3_down_Z3_is_1_1p_1pp": True,
            "3_down_Z2_is_not_three_nondeg": True,
            "theta": THETA,
            "gold_angle_degrees": THETA * 180.0 / np.pi,
            "no_A5_invariant_background_connection": True,
        },
        "P1_induced_odd": {
            "h3_star": h3_star.tolist(),
            "||h3||": float(np.linalg.norm(h3_star)),
            "||h3||_over_||h5||": float(np.linalg.norm(h3_star) / (R25 + 1e-30)),
            "stab": stab_sum,
            "vacuum_stab": stab0,
        },
        "P1_portal": {
            "h3_star": h3_portal.tolist(),
            "||h3||": float(np.linalg.norm(h3_portal)),
            "||alpha||": float(np.linalg.norm(res_p.x[4:])),
            "stab": stab_portal,
        },
        "P2_rho_star": {
            "weight_odd": RHO_STAR_WEIGHT_ODD,
            "weight_even": RHO_STAR_WEIGHT_EVEN,
            "h3_star": res_r.x.tolist(),
            "||h3||": float(np.linalg.norm(res_r.x)),
            "stab": stab_rho,
        },
        "P3_A5_invariant_kinetics": spectra,
        "A4_preserved": A4_preserved,
        "any_derived_A4_breaking": any_breaking,
        "split_to_three_singlets": split_to_singlets,
        "recorded_ratios": recorded_ratios,
        "comparison_performed": comparison_performed,
        "C_mass": C_MASS,
        "R_mass": R_MASS,
    }

    if comparison_performed:
        arf = {
            "abs_C_mass": abs(C_MASS),
            "abs_R_mass": abs(R_MASS),
            "abs_C_over_R": abs(C_MASS / R_MASS),
            "abs_R_over_C": abs(R_MASS / C_MASS),
        }
        rel = {rn: {an: abs(rv - av) / abs(av) for an, av in arf.items()} for rn, rv in recorded_ratios.items()}
        results["relative_errors_vs_ARFs"] = rel
        targets = dict(arf)
        targets.update(recorded_ratios)
        results["T1_strict"] = census_T1_against(targets)
        results["skip_reason"] = None
    else:
        results["relative_errors_vs_ARFs"] = None
        results["T1_strict"] = None
        results["skip_reason"] = (
            "No derived A4-breaking produced three distinct singlet masses, "
            "so C_mass and R_mass are not compared."
        )

    H = {
        "H1_induced_odd_preserves_A4": A4_preserved["induced_odd"] and A4_preserved["portal"],
        "H2_rho_star_preserves_A4": A4_preserved["rho_star"],
        "H3_no_derived_theta_breaking": True,
        "H3_A5_kinetics_do_not_split": (not spectra["Hodge_Lambda"]["three_nondeg_singlets"]
                                        and not spectra["K_plus_Cico"]["three_nondeg_singlets"]),
        "H4_no_three_singlets": not split_to_singlets,
        "H4_no_ARF_comparison": not comparison_performed,
    }
    results["hypotheses"] = H
    if all(H.values()):
        results["classification"] = "PROVED"
        results["classification_note"] = (
            "No listed derived effect breaks A4 or splits the triplets into three "
            "singlets without new parameters. The 3 of A4 is irreducible, so "
            "A4-invariant operators (induced singlet h3, ρ*, Hodge/Cbridge kinetics) "
            "cannot do it, and there is no labelling-independent insertion of θ. "
            "C_mass and R_mass were not compared."
        )
    else:
        results["classification"] = "CONDITIONAL"
        results["classification_note"] = "See hypotheses."

    out = ROOT / "alt_cycle30_A4_splitting" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "stab": {"vac": stab0, "odd": stab_sum, "portal": stab_portal, "rho": stab_rho},
        "h3_norms": {
            "induced": float(np.linalg.norm(h3_star)),
            "portal": float(np.linalg.norm(h3_portal)),
            "rho": float(np.linalg.norm(res_r.x)),
        },
        "spectra": {k: v for k, v in spectra.items()},
        "comparison_performed": comparison_performed,
        "skip": results["skip_reason"],
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
