#!/usr/bin/env python3
"""Standalone numpy-only verification of coupled cycles 18/19 condensation.

Run from this directory:
    python3 test_verify_condensation.py

Depends only on numpy and the two shipped frame files
    odd_adjacent_current_frame.npy
    even_adjacent_current_frame.npy
No scipy, no other cycle imports.
"""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd

HERE = Path(__file__).resolve().parent
PRED_SHA = "708ff8444b3a011f141f7f3483f0962ea104dcdc45027d5d768c184dbff1ad9c"
ODD_SHA = "85eb54de4cc4269c957b99c62b32875bb491b868b3fd87ea79cc35a0830f192c"
EVEN_SHA = "d349c2b51bbe9112fc083ad78ef0129530e78965b1dcef649ccdc0348382e059"

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_GEOM = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_GEOM)
LAM18 = 4.0 * np.sin(np.pi * (9.0 - 4.0 * np.sqrt(5.0)) / 4.0) ** 2
RHO = (np.pi / np.e) ** 2 * LAM18
C3 = 0.25 - 1.0 / (2.0 * (18.0 + RHO))
C5 = 0.25 - 1.0 / (2.0 * (16.0 + RHO))
C_ODD = C3
C_EVEN = (DELTA_GEOM ** 2) * C5

# cycle 18 / 19 published targets (comparison only, not used to build the model)
C18_CHI_EVEN = 0.037511483697016956
C18_YC_EVEN = 0.006011318618427269
C18_CHI_ODD = 0.03843307183615252
C18_YC_ODD = 2.404676225071091
C18_YC_EVEN_ICO = 0.005940144
C19_R_STAR = 8.54983e5


def sanitize(o):
    if isinstance(o, dict):
        return {k: sanitize(v) for k, v in o.items()}
    if isinstance(o, (list, tuple)):
        return [sanitize(v) for v in o]
    if isinstance(o, (np.bool_,)):
        return bool(o)
    if isinstance(o, (np.floating, np.integer)):
        return o.item()
    return o


def icosahedron_points():
    p = PHI
    pts = [
        [0.0, -1.0, -p], [0.0, -1.0, p], [0.0, 1.0, -p], [0.0, 1.0, p],
        [-1.0, -p, 0.0], [-1.0, p, 0.0], [1.0, -p, 0.0], [1.0, p, 0.0],
        [-p, 0.0, -1.0], [-p, 0.0, 1.0], [p, 0.0, -1.0], [p, 0.0, 1.0],
    ]
    return np.asarray(pts, dtype=float)


def nearest_edges(pts):
    d2 = ((pts[:, None, :] - pts[None, :, :]) ** 2).sum(-1)
    mind = float(np.min(d2[d2 > 1e-12]))
    edges = sorted(
        (int(i), int(j))
        for i, j in zip(*np.where(np.triu(np.abs(d2 - mind) < 1e-8, 1)))
    )
    return edges, mind


def graph_laplacian(n, edges):
    A = np.zeros((n, n))
    for i, j in edges:
        A[i, j] = 1.0
        A[j, i] = 1.0
    return np.diag(A.sum(axis=1)) - A


def build_K_H13(edges):
    K = np.zeros((13, 13))
    for i, j in edges:
        K[i, i] += 1.0
        K[j, j] += 1.0
        K[i, j] -= 1.0
        K[j, i] -= 1.0
    for i in range(12):
        K[12, 12] += 1.0
        K[i, i] += 1.0
        K[12, i] -= 1.0
        K[i, 12] -= 1.0
    return K


def pairing_matrix_12(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def embed13(M12):
    M = np.zeros((13, 13))
    M[:12, :12] = M12
    return M


def bdg_positive_energies(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n))
    H[:n, :n] = K
    H[n:, n:] = -K
    H[:n, n:] = Delta
    H[n:, :n] = Delta
    ev = eigvalsh(H)
    return np.maximum(ev[n:], 0.0), ev


def log2cosh(z):
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


def fermion_omega(energies, xi, T):
    if T <= 0:
        return -0.5 * (np.sum(np.abs(energies)) - np.sum(np.abs(xi)))
    return -T * np.sum(log2cosh(energies / (2.0 * T))) + T * np.sum(
        log2cosh(np.abs(xi) / (2.0 * T))
    )


def nuclear_norm(frame, hat, edges):
    return float(np.sum(svd(pairing_matrix_12(frame, hat, edges), compute_uv=False)))


def nuclear_grad(frame, hat, edges, eps=1e-6):
    g = np.zeros(4)
    for k in range(4):
        e = np.zeros(4)
        e[k] = 1.0
        g[k] = (
            nuclear_norm(frame, hat + eps * e, edges)
            - nuclear_norm(frame, hat - eps * e, edges)
        ) / (2.0 * eps)
    return g


def maximize_nuclear_norm(frame, edges, starts, steps=250, lr0=0.25):
    best_val, best_h = -np.inf, None
    for s in starts:
        h = np.asarray(s, dtype=float)
        nrm = np.linalg.norm(h)
        if nrm < 1e-14:
            continue
        h = h / nrm
        lr = lr0
        val = nuclear_norm(frame, h, edges)
        for _ in range(steps):
            g = nuclear_grad(frame, h, edges)
            g = g - h * np.dot(g, h)
            gn = np.linalg.norm(g)
            if gn < 1e-12:
                break
            h_try = h + lr * g
            h_try /= np.linalg.norm(h_try)
            v_try = nuclear_norm(frame, h_try, edges)
            if v_try >= val:
                h, val = h_try, v_try
                lr = min(lr * 1.05, 1.0)
            else:
                lr *= 0.4
                if lr < 1e-8:
                    break
        if val > best_val:
            best_val, best_h = val, h
    return best_h, float(best_val)


def icosahedral_rotations(pts):
    n = len(pts)
    d = ((pts[:, None, :] - pts[None, :, :]) ** 2).sum(-1)
    neigh = []
    for i in range(n):
        order = np.argsort(d[i])
        antip = int(np.argmax(d[i]))
        nn = [int(j) for j in order if j != i and j != antip][:5]
        neigh.append(nn)
    v0 = pts[0]
    n0 = pts[neigh[0][0]]
    A0 = np.column_stack([v0, n0, np.cross(v0, n0)])
    rots = []
    for vt in range(n):
        for nj in neigh[vt]:
            v1 = pts[vt]
            n1 = pts[nj]
            A1 = np.column_stack([v1, n1, np.cross(v1, n1)])
            R = A1 @ np.linalg.inv(A0)
            if abs(np.linalg.det(R) - 1.0) > 1e-6:
                continue
            if np.linalg.norm(R.T @ R - np.eye(3)) > 1e-6:
                continue
            rots.append(R)
    uniq = []
    for R in rots:
        if not any(np.linalg.norm(R - S) < 1e-8 for S in uniq):
            uniq.append(R)
    return uniq


def induced_perm(pts, R, atol=1e-7):
    new = pts @ R.T
    perm = []
    for x in new:
        dists = np.linalg.norm(pts - x, axis=1)
        j = int(np.argmin(dists))
        if dists[j] > atol:
            return None
        perm.append(j)
    if sorted(perm) != list(range(len(pts))):
        return None
    return perm


def rotation_order(R):
    acc = np.eye(3)
    for k in range(1, 7):
        acc = acc @ R
        if np.allclose(acc, np.eye(3), atol=1e-7):
            return k
    return None


def stabilizer(Delta, rots, pts, atol=1e-6):
    kept_orders = []
    for R in rots:
        perm = induced_perm(pts, R)
        if perm is None:
            continue
        P = np.zeros((12, 12))
        for i, p in enumerate(perm):
            P[p, i] = 1.0
        if np.allclose(P @ Delta @ P.T, Delta, atol=atol):
            kept_orders.append(rotation_order(R))
    n = len(kept_orders)
    order_counts = {}
    for o in kept_orders:
        order_counts[int(o)] = order_counts.get(int(o), 0) + 1
    if n == 12 and order_counts.get(1) == 1 and order_counts.get(2) == 3 and order_counts.get(3) == 8:
        name = "A4"
    elif n == 60:
        name = "A5"
    elif n == 1:
        name = "1"
    else:
        name = f"order_{n}"
    return {"order": n, "order_counts": {str(k): v for k, v in sorted(order_counts.items())}, "name": name}


def reduced_logabsdet(M, gap):
    ev = eigvalsh(M)
    ev = ev[np.abs(ev) > gap]
    if ev.size == 0:
        return None
    return float(np.sum(np.log(np.abs(ev))))


def group_eigs(e, rtol=1e-10, atol=1e-10):
    e = np.sort(np.asarray(e, dtype=float))
    groups, cur = [], [float(e[0])]
    for x in e[1:]:
        ref = float(np.mean(cur))
        tol = atol + rtol * max(abs(ref), 1.0)
        if abs(x - ref) <= tol or abs(x - cur[-1]) <= tol:
            cur.append(float(x))
        else:
            groups.append({"mean": float(np.mean(cur)), "mult": len(cur)})
            cur = [float(x)]
    groups.append({"mean": float(np.mean(cur)), "mult": len(cur)})
    return groups


def chi_and_dirac(K, xi, Delta_unit, T_chi, s, gap=0.5):
    E, _ = bdg_positive_energies(K, s * Delta_unit)
    om = fermion_omega(E, xi, T_chi)
    chi = float(-om / (s * s))
    ld0 = reduced_logabsdet(K, gap)
    ldp = reduced_logabsdet(K + s * Delta_unit, gap)
    if ld0 is None or ldp is None:
        pi_D = None
    else:
        pi_D = float(2.0 * (-(ldp - ld0)) / (s * s))
    return chi, float(om), pi_D


def refine_vev(K, xi, hat, edges, embed, T):
    nuc = nuclear_norm(EVEN, hat, edges)
    r_an = nuc / (4.0 * C_EVEN)
    M_unit = pairing_matrix_12(EVEN, hat, edges)
    Delta_unit = embed13(M_unit) if embed else M_unit

    def om_of(r):
        E, _ = bdg_positive_energies(K, r * Delta_unit)
        return C_EVEN * r * r + fermion_omega(E, xi, T)

    lo, hi = 0.92 * r_an, 1.08 * r_an
    rs = np.linspace(lo, hi, 81)
    oms = np.array([om_of(r) for r in rs])
    i = int(np.argmin(oms))
    rs2 = np.linspace(rs[max(i - 1, 0)], rs[min(i + 1, len(rs) - 1)], 81)
    oms2 = np.array([om_of(r) for r in rs2])
    j = int(np.argmin(oms2))
    return {
        "r_star": float(rs2[j]),
        "omega_star": float(oms2[j]),
        "r_analytic": float(r_an),
        "relative_to_analytic": float(abs(rs2[j] - r_an) / r_an),
        "nuclear_norm": float(nuc),
    }


def file_sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def rel_err(a, b):
    return float(abs(a - b) / abs(b))


def main():
    odd_path = HERE / "odd_adjacent_current_frame.npy"
    even_path = HERE / "even_adjacent_current_frame.npy"
    odd_sha = file_sha(odd_path)
    even_sha = file_sha(even_path)
    assert odd_sha == ODD_SHA, (odd_sha, ODD_SHA)
    assert even_sha == EVEN_SHA, (even_sha, EVEN_SHA)
    global ODD, EVEN
    ODD = np.load(odd_path)
    EVEN = np.load(even_path)
    assert ODD.shape == (4, 30) and EVEN.shape == (4, 30)

    pts = icosahedron_points()
    edges, mind = nearest_edges(pts)
    assert len(edges) == 30 and abs(mind - 4.0) < 1e-10

    K13 = build_K_H13(edges)
    xi13 = eigvalsh(K13)
    expected_H13 = np.sort(
        np.array(
            [0.0]
            + [6.0 - np.sqrt(5.0)] * 3
            + [7.0] * 5
            + [6.0 + np.sqrt(5.0)] * 3
            + [13.0]
        )
    )
    H13_ok = bool(np.allclose(np.sort(xi13), expected_H13, atol=1e-8))
    assert H13_ok

    Kico = graph_laplacian(12, edges)
    xiico = eigvalsh(Kico)
    expected_ico = np.sort(
        np.array(
            [0.0]
            + [5.0 - np.sqrt(5.0)] * 3
            + [6.0] * 5
            + [5.0 + np.sqrt(5.0)] * 3
        )
    )
    ico_ok = bool(np.allclose(np.sort(xiico), expected_ico, atol=1e-8))
    assert ico_ok

    rng = np.random.default_rng(21)
    starts = [np.eye(4)[i] for i in range(4)]
    starts += [np.ones(4), np.array([1.0, -1.0, 1.0, -1.0]), np.array([1.0, 1.0, 1.0, -1.0])]
    extra = rng.normal(size=(16, 4))
    extra /= np.linalg.norm(extra, axis=1)[:, None]
    starts.extend(extra)
    hat_even, nuc_even = maximize_nuclear_norm(EVEN, edges, starts)
    hat_odd, nuc_odd = maximize_nuclear_norm(ODD, edges, starts)

    # even channel, H13
    Me = pairing_matrix_12(EVEN, hat_even, edges)
    De13 = embed13(Me)
    chi_e_eta, _, pi_e = chi_and_dirac(K13, xi13, De13, ETA, 1e-3)
    chi_e_T0, _, _ = chi_and_dirac(K13, xi13, De13, 0.0, 1e-4)
    yc_e_eta = float(np.sqrt(C_EVEN / chi_e_eta))
    yc_e_T0 = float(np.sqrt(C_EVEN / chi_e_T0))

    Mo = pairing_matrix_12(ODD, hat_odd, edges)
    Do13 = embed13(Mo)
    chi_o_eta, _, pi_o = chi_and_dirac(K13, xi13, Do13, ETA, 1e-3)
    chi_o_T0, _, _ = chi_and_dirac(K13, xi13, Do13, 0.0, 1e-4)
    yc_o_eta = float(np.sqrt(C_ODD / chi_o_eta))
    yc_o_T0 = float(np.sqrt(C_ODD / chi_o_T0))

    chi_e_ico, _, _ = chi_and_dirac(Kico, xiico, Me, ETA, 1e-3)
    yc_e_ico = float(np.sqrt(C_EVEN / chi_e_ico))

    pairing_attractive = bool(
        chi_e_eta > 0 and chi_e_T0 > 0 and chi_o_eta > 0 and chi_o_T0 > 0
    )
    dirac_stiffens = bool(pi_e is not None and pi_o is not None and pi_e > 0 and pi_o > 0)

    vev = refine_vev(K13, xi13, hat_even, edges, True, ETA)

    rots = icosahedral_rotations(pts)
    assert len(rots) == 60
    stab = stabilizer(Me, rots, pts)
    a4_ok = bool(stab["name"] == "A4" and stab["order"] == 12)

    raw_s = svd(Me, compute_uv=False)
    expected_s = [
        (0.0, 1),
        (float(np.sqrt(2.0 / 15.0)), 3),
        (float(np.sqrt(1.0 / 6.0)), 6),
        (float(np.sqrt(3.0 / 10.0)), 2),
    ]
    buckets = {val: [] for val, _ in expected_s}
    for s in raw_s:
        val = min(buckets, key=lambda v: abs(float(s) - v))
        buckets[val].append(float(s))
    sv_recs = []
    for val, mult_exp in expected_s:
        got = buckets[val]
        rels = [abs(x - val) / max(val, 1e-15) if val > 0 else abs(x) for x in got]
        sv_recs.append(
            {
                "mean": float(np.mean(got)) if got else None,
                "mult": len(got),
                "expected": float(val),
                "expected_mult": mult_exp,
                "max_rel_err": float(max(rels) if rels else 1.0),
                "mult_ok": bool(len(got) == mult_exp),
            }
        )
    pos = [val for val, mult in expected_s if val > 0]
    ratio_target = [2.0, float(np.sqrt(5.0)), 3.0]
    normed = [2.0 * p / pos[0] for p in pos]
    ratio_err = [abs(a - b) / b for a, b in zip(normed, ratio_target)]
    sv_ok = bool(
        all(r["max_rel_err"] < 1e-7 and r["mult_ok"] for r in sv_recs)
        and max(ratio_err) < 1e-8
    )

    checks = {
        "H13_spectrum": H13_ok,
        "ico_spectrum": ico_ok,
        "frame_hashes": True,
        "pairing_attractive": pairing_attractive,
        "dirac_stiffens": dirac_stiffens,
        "chi_even_eta_rel": rel_err(chi_e_eta, C18_CHI_EVEN),
        "yc_even_eta_rel": rel_err(yc_e_eta, C18_YC_EVEN),
        "chi_odd_eta_rel": rel_err(chi_o_eta, C18_CHI_ODD),
        "yc_odd_eta_rel": rel_err(yc_o_eta, C18_YC_ODD),
        "yc_even_ico_rel": rel_err(yc_e_ico, C18_YC_EVEN_ICO),
        "r_star_vs_c19_rel": rel_err(vev["r_star"], C19_R_STAR),
        "r_star_vs_analytic_rel": vev["relative_to_analytic"],
        "A4": a4_ok,
        "singular_value_identity": sv_ok,
    }
    pass_chi = all(
        checks[k] < 5e-3
        for k in (
            "chi_even_eta_rel",
            "yc_even_eta_rel",
            "chi_odd_eta_rel",
            "yc_odd_eta_rel",
            "yc_even_ico_rel",
        )
    )
    pass_vev = bool(checks["r_star_vs_c19_rel"] < 0.01 and checks["r_star_vs_analytic_rel"] < 0.01)
    all_pass = bool(
        H13_ok
        and ico_ok
        and pairing_attractive
        and dirac_stiffens
        and pass_chi
        and pass_vev
        and a4_ok
        and sv_ok
    )
    # CONDITIONAL if a single tolerance missed by < 3x
    missed = []
    if not pass_chi:
        for k in (
            "chi_even_eta_rel",
            "yc_even_eta_rel",
            "chi_odd_eta_rel",
            "yc_odd_eta_rel",
            "yc_even_ico_rel",
        ):
            if checks[k] >= 5e-3:
                missed.append((k, checks[k], 5e-3))
    if checks["r_star_vs_c19_rel"] >= 0.01:
        missed.append(("r_star_vs_c19_rel", checks["r_star_vs_c19_rel"], 0.01))
    if checks["r_star_vs_analytic_rel"] >= 0.01:
        missed.append(("r_star_vs_analytic_rel", checks["r_star_vs_analytic_rel"], 0.01))
    if not a4_ok:
        missed.append(("A4", 1.0, 0.0))
    if not sv_ok:
        missed.append(("singular_value_identity", max(ratio_err), 1e-8))
    if all_pass:
        classification = "PROVED"
    elif len(missed) == 1 and missed[0][1] < 3.0 * missed[0][2]:
        classification = "CONDITIONAL"
    else:
        classification = "FALSIFIED"

    results = {
        "integrity": {
            "predeclaration_sha256": PRED_SHA,
            "odd_frame_sha256": odd_sha,
            "even_frame_sha256": even_sha,
        },
        "constants": {
            "phi": PHI,
            "delta": DELTA_GEOM,
            "eta": ETA,
            "lambda_18": LAM18,
            "rho": RHO,
            "c3": C3,
            "c5": C5,
            "c_even": C_EVEN,
            "c_odd": C_ODD,
        },
        "H13_spectrum_ok": H13_ok,
        "ico_spectrum_ok": ico_ok,
        "even_hat": hat_even.tolist(),
        "odd_hat": hat_odd.tolist(),
        "even_nuclear_norm": nuc_even,
        "odd_nuclear_norm": nuc_odd,
        "chi_even_eta": chi_e_eta,
        "chi_even_T0": chi_e_T0,
        "y_c_even_eta": yc_e_eta,
        "y_c_even_T0": yc_e_T0,
        "chi_odd_eta": chi_o_eta,
        "chi_odd_T0": chi_o_T0,
        "y_c_odd_eta": yc_o_eta,
        "y_c_odd_T0": yc_o_T0,
        "dirac_pi_even": pi_e,
        "dirac_pi_odd": pi_o,
        "chi_even_ico": chi_e_ico,
        "y_c_even_ico": yc_e_ico,
        "pairing_attractive": pairing_attractive,
        "dirac_stiffens": dirac_stiffens,
        "vev": vev,
        "stabilizer": stab,
        "singular_values": sv_recs,
        "ratio_2_sqrt5_3": {
            "normalized_to_first_times_2": normed,
            "target": ratio_target,
            "rel_err": ratio_err,
        },
        "checks": checks,
        "missed": missed,
        "classification": classification,
        "advances_physical_ARF": False,
    }
    (HERE / "results.json").write_text(json.dumps(sanitize(results), indent=2) + "\n")
    print(
        json.dumps(
            sanitize(
                {
                    "classification": classification,
                    "chi_even_eta": chi_e_eta,
                    "yc_even_eta": yc_e_eta,
                    "chi_odd_eta": chi_o_eta,
                    "yc_odd_eta": yc_o_eta,
                    "yc_even_ico": yc_e_ico,
                    "vev": vev,
                    "stab": stab,
                    "sv_ok": sv_ok,
                    "ratio": normed,
                    "ratio_err": ratio_err,
                    "checks": checks,
                    "missed": missed,
                    "nuc_even": nuc_even,
                }
            ),
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
