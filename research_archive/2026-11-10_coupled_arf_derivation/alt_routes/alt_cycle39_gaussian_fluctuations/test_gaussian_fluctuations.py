#!/usr/bin/env python3
"""Alt cycle 39: Gaussian fluctuations of 4_3 ⊕ 4_5 about the A4 condensate."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, eigh, inv

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import (  # noqa: E402
    load_ops, icosahedral_rotations, induced_perm,
)

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_HIDDEN = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_HIDDEN)
C3 = 0.2222379207611084
C5 = 0.21876978874206543
C_EVEN = (DELTA_HIDDEN ** 2) * C5
C_MASS = -(5.0 / 16.0) * DELTA_STAR ** 3 + (7.0 / 8.0) * np.pi * PHI
R_MASS = (3.0 / 35.0) * DELTA_STAR ** 2 - (4.0 / 51.0) * np.pi ** 3
G_STRICT = [1, 2, 3, 4, 5, 6, 8, 12, 13, 15, 16, 18, 20, 24, 30, 32, 50, 51, 60, 64, 80, 81, 90, 120, 190]
NUMS = [1, 2, 3, 4, 5, 7, 8, -1, -2, -3, -4, -5, -7, -8]

EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
ODD_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "odd_adjacent_current_frame.npy")
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


def pairing_from(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def bdg_eigh(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n), dtype=complex)
    H[:n, :n] = K
    H[n:, n:] = -np.conj(K)
    H[:n, n:] = Delta
    H[n:, :n] = np.conj(np.asarray(Delta).T)
    ev, U = eigh(H)
    return ev.real, U


def bdg_pos_only(K, Delta):
    ev, _ = bdg_eigh(K, Delta)
    n = K.shape[0]
    return np.maximum(ev[n:], 0.0)


def log2cosh(z):
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


def Fabs(pos, T):
    if T <= 0:
        return -0.5 * float(np.sum(pos))
    return float(-T * np.sum(log2cosh(pos / (2.0 * T))))


def group_rel(vals, rtol=1e-5, atol=1e-8):
    groups = []
    start = []
    idx = 0
    for v in vals:
        if not groups or abs(v - groups[-1][0]) > max(atol, rtol * max(1.0, abs(groups[-1][0]))):
            groups.append([float(v), 1])
            start.append([idx])
        else:
            groups[-1][0] = (groups[-1][0] * groups[-1][1] + float(v)) / (groups[-1][1] + 1)
            groups[-1][1] += 1
            start[-1].append(idx)
        idx += 1
    return [(g[0], g[1], s) for g, s in zip(groups, start)]


def census_T1_against(targets):
    atoms, descs = [], []
    for coef in NUMS:
        for n in G_STRICT:
            for k in (0, 1, 2):
                atoms.append(coef / (n * (PHI ** k)))
                descs.append((int(coef), int(n), int(k)))
    atoms = np.asarray(atoms, float)
    nA = len(atoms)
    stats = {name: {"exact": 0, "rel_1e-4": 0, "nearest_rel": None, "nearest_desc": None} for name in targets}
    nearest = {name: (np.inf, None) for name in targets}
    chunk = 400
    for start in range(nA):
        js = start + 1
        while js < nA:
            je = min(nA, js + chunk)
            s = atoms[start] + atoms[js:je]
            for name, tgt in targets.items():
                if abs(tgt) < 1e-30:
                    continue
                rel = np.abs(s - tgt) / abs(tgt)
                stats[name]["exact"] += int(np.sum(rel < 1e-14))
                stats[name]["rel_1e-4"] += int(np.sum(rel < 1e-4))
                jloc = int(np.argmin(rel))
                rmin = float(rel[jloc])
                if rmin < nearest[name][0]:
                    nearest[name] = (rmin, (descs[start], descs[js + jloc], float(s[jloc])))
            js = je
    for name in targets:
        stats[name]["nearest_rel"] = nearest[name][0]
        stats[name]["nearest_desc"] = nearest[name][1]
    return stats


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], float)
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((f[a], f[(a + 1) % m]))))
    edges = sorted(raw)
    # graph Laplacian K (A = 0)
    K = np.zeros((12, 12))
    deg = np.zeros(12)
    for i, j in edges:
        deg[i] += 1
        deg[j] += 1
        K[i, j] -= 1
        K[j, i] -= 1
    for i in range(12):
        K[i, i] += deg[i]

    hat = np.asarray(HAT25, float)
    hat = hat / np.linalg.norm(hat)
    h0 = np.zeros(8)
    h0[4:] = R25 * hat  # [h3(4), h5(4)]

    def Delta_of(h):
        return pairing_from(EVEN_FRAME, h[4:], edges) + pairing_from(ODD_FRAME, h[:4], edges)

    def omega(h, T):
        hh = np.asarray(h, float)
        return C3 * float(np.dot(hh[:4], hh[:4])) + C_EVEN * float(np.dot(hh[4:], hh[4:])) + Fabs(
            bdg_pos_only(K, Delta_of(hh)), T
        )

    def hess(T, eps=5e-3):
        Hm = np.zeros((8, 8))
        om0 = omega(h0, T)
        for i in range(8):
            ei = np.zeros(8)
            ei[i] = eps
            Hm[i, i] = (omega(h0 + ei, T) + omega(h0 - ei, T) - 2.0 * om0) / (eps * eps)
        for i in range(8):
            for j in range(i + 1, 8):
                ei, ej = np.zeros(8), np.zeros(8)
                ei[i] = eps
                ej[j] = eps
                Hm[i, j] = Hm[j, i] = (
                    omega(h0 + ei + ej, T) + omega(h0 - ei - ej, T)
                    - omega(h0 + ei - ej, T) - omega(h0 - ei + ej, T)
                ) / (4.0 * eps * eps)
        return 0.5 * (Hm + Hm.T)

    print("Hessian T=eta...", flush=True)
    HT = hess(float(ETA), eps=2e-2)
    evT, UT = eigh(HT)
    print("Hessian T=0...", flush=True)
    H0m = hess(0.0, eps=2e-2)
    ev0, U0 = eigh(H0m)

    # A5 action on the hidden 4 via pairing
    rots, _ = icosahedral_rotations(pts)
    Me_hat = pairing_from(EVEN_FRAME, hat, edges)
    # build rho4 on 4_5: pairing(R h) = P pairing(h) P.T
    def rho4_even(R, perm):
        P = np.zeros((12, 12))
        for i, p in enumerate(perm):
            P[p, i] = 1.0
        # apply to each basis vector
        Mout = np.zeros((4, 4))
        for a in range(4):
            ea = np.zeros(4)
            ea[a] = 1.0
            target = P @ pairing_from(EVEN_FRAME, ea, edges) @ P.T
            # expand target in the four pairing(e_b)
            cols = []
            for b in range(4):
                eb = np.zeros(4)
                eb[b] = 1.0
                cols.append(pairing_from(EVEN_FRAME, eb, edges).reshape(-1))
            A = np.stack(cols, axis=1)
            coef, *_ = np.linalg.lstsq(A, target.reshape(-1), rcond=None)
            Mout[:, a] = coef.real
        return Mout

    orbit = [hat.copy()]
    seen = [hat.copy()]
    n_A4 = 0
    for R in rots:
        perm = induced_perm(pts, R)
        if perm is None:
            continue
        P = np.zeros((12, 12))
        for i, p in enumerate(perm):
            P[p, i] = 1.0
        if np.allclose(P @ Me_hat @ P.T, Me_hat, atol=1e-6):
            n_A4 += 1
        r4 = rho4_even(R, perm)
        hnew = r4 @ hat
        hnew = hnew / (np.linalg.norm(hnew) + 1e-30)
        if all(abs(abs(np.dot(hnew, s)) - 1.0) > 1e-6 for s in seen):
            seen.append(hnew)
            orbit.append(hnew)
    # also include sign-identified: treat −ĥ as the same ray
    uniq = []
    for h in orbit:
        if all(abs(abs(np.dot(h, u)) - 1.0) > 1e-5 for u in uniq):
            uniq.append(h)

    # one-loop measure at each orbit point (same Hess up to rotation — check)
    def hess_at(h5hat, T, eps=2e-2):
        hv = np.zeros(8)
        hv[4:] = R25 * (h5hat / np.linalg.norm(h5hat))
        def om(h):
            return C3 * float(np.dot(h[:4], h[:4])) + C_EVEN * float(np.dot(h[4:], h[4:])) + Fabs(
                bdg_pos_only(K, Delta_of(h)), T
            )
        Hm = np.zeros((8, 8))
        om0 = om(hv)
        for i in range(8):
            ei = np.zeros(8); ei[i] = eps
            Hm[i, i] = (om(hv + ei) + om(hv - ei) - 2.0 * om0) / (eps * eps)
        for i in range(8):
            for j in range(i + 1, 8):
                ei = np.zeros(8); ej = np.zeros(8)
                ei[i] = eps; ej[j] = eps
                Hm[i, j] = Hm[j, i] = (
                    om(hv + ei + ej) + om(hv - ei - ej) - om(hv + ei - ej) - om(hv - ei + ej)
                ) / (4.0 * eps * eps)
        return 0.5 * (Hm + Hm.T)

    print(f"orbit size (sign-identified) {len(uniq)}, A4 order {n_A4}", flush=True)
    measures = []
    for i, h in enumerate(uniq):
        Hh = hess_at(h, float(ETA), eps=2e-2)
        evh = eigvalsh(Hh)
        # (1/2) Tr log Hess = (1/2) sum log λ, only if all λ>0
        if np.min(evh) <= 0:
            trlog = None
        else:
            trlog = 0.5 * float(np.sum(np.log(evh)))
        measures.append({"ev_minmax": [float(evh.min()), float(evh.max())],
                         "half_tr_log": trlog})

    # A4 content of Hessian: rotate HT by A4 elements acting as 8×8 (4_3 ⊕ 4_5)
    # For 4_5 block we have rho4_even; similarly rho4_odd
    def rho4_odd(perm):
        P = np.zeros((12, 12))
        for i, p in enumerate(perm):
            P[p, i] = 1.0
        Mout = np.zeros((4, 4))
        for a in range(4):
            ea = np.zeros(4); ea[a] = 1.0
            target = P @ pairing_from(ODD_FRAME, ea, edges) @ P.T
            cols = []
            for b in range(4):
                eb = np.zeros(4); eb[b] = 1.0
                cols.append(pairing_from(ODD_FRAME, eb, edges).reshape(-1))
            A = np.stack(cols, axis=1)
            coef, *_ = np.linalg.lstsq(A, target.reshape(-1), rcond=None)
            Mout[:, a] = coef.real
        return Mout

    comm_res = []
    for R in rots:
        perm = induced_perm(pts, R)
        if perm is None:
            continue
        P = np.zeros((12, 12))
        for i, p in enumerate(perm):
            P[p, i] = 1.0
        if not np.allclose(P @ Me_hat @ P.T, Me_hat, atol=1e-6):
            continue
        r8 = np.zeros((8, 8))
        r8[:4, :4] = rho4_odd(perm)
        r8[4:, 4:] = rho4_even(R, perm)
        C = r8.T @ HT @ r8 - HT
        comm_res.append(float(np.linalg.norm(C)))
    A4_invariant = bool(comm_res and max(comm_res) < 1e-4 * max(1.0, np.linalg.norm(HT)))

    # label Hessian modes: overlap with hat (radial even), and with 4_3 vs 4_5
    # columns of UT
    radial = np.zeros(8); radial[4:] = hat
    radial = radial / np.linalg.norm(radial)
    overlaps = []
    for a in range(8):
        v = UT[:, a]
        overlaps.append({
            "eval": float(evT[a]),
            "even_weight": float(np.dot(v[4:], v[4:])),
            "odd_weight": float(np.dot(v[:4], v[:4])),
            "radial_overlap2": float(np.dot(v, radial) ** 2),
        })

    # fermion one-loop W
    print("fermion W...", flush=True)
    Dstar = pairing_from(EVEN_FRAME, R25 * hat, edges)
    evF, UF = bdg_eigh(K, Dstar)
    n = 12
    pos = evF[n:]
    Upos = UF[:, n:]  # 24 × 12
    # vertices V_a: Nambu [[0, Ma],[Ma, 0]]
    Mas = []
    for a in range(4):
        ea = np.zeros(4); ea[a] = 1.0
        Mas.append(pairing_from(ODD_FRAME, ea, edges))
    for a in range(4):
        ea = np.zeros(4); ea[a] = 1.0
        Mas.append(pairing_from(EVEN_FRAME, ea, edges))
    Vas = []
    for Ma in Mas:
        V = np.zeros((24, 24))
        V[:12, 12:] = Ma
        V[12:, :12] = Ma
        Vas.append(V)

    # use T=eta Hessian inverse; regularize tiny/negative evals if any
    ev_use = evT.copy()
    posdef = bool(np.min(ev_use) > 1e-12)
    ev_reg = np.maximum(ev_use, 1e-12)
    Dcov = UT @ np.diag(1.0 / ev_reg) @ UT.T

    groups = group_rel(pos, rtol=1e-5)
    W_reports = []
    any_split = False
    for Emean, mult, idxs in groups:
        if Emean < 1e-6:
            W_reports.append({"E": Emean, "mult": mult, "note": "unpaired / near-zero, skipped"})
            continue
        # build W
        k = len(idxs)
        W = np.zeros((k, k), dtype=complex)
        psi = [Upos[:, ii] for ii in idxs]
        # precompute V_a |i⟩
        Va_i = [[Va @ psi[j] for j in range(k)] for Va in Vas]
        for p in range(k):
            for q in range(k):
                acc = 0.0 + 0.0j
                for a in range(8):
                    for b in range(8):
                        # Σ_m ⟨p|Va|m⟩⟨m|Vb|q⟩/(Ep - Em)
                        # m runs over all 24 BdG eigenstates
                        num = 0.0 + 0.0j
                        # compute Va|p⟩ and project
                        vap = Vas[a] @ psi[p]
                        vbq = Vas[b] @ psi[q]
                        # in the full eigenbasis UF (24 columns)
                        # ⟨m|Va|p⟩ = (UF[:,m])† vap
                        amps_a = UF.conj().T @ vap
                        amps_b = UF.conj().T @ vbq
                        denom = Emean - evF
                        # skip the multiplet itself (near-zero denom)
                        mask = np.ones(24, dtype=bool)
                        # positive-energy indices n+ii belong to this multiplet
                        for ii in idxs:
                            mask[n + ii] = False
                        # also skip exact zero denominators
                        mask &= np.abs(denom) > 1e-6 * max(1.0, abs(Emean))
                        acc += Dcov[a, b] * np.sum(np.conj(amps_a[mask]) * amps_b[mask] / denom[mask])
                W[p, q] = acc
        Wev = eigvalsh(0.5 * (W + W.conj().T))
        spread = float(Wev.max() - Wev.min())
        rel = spread / max(abs(Emean), 1e-12)
        split = bool(rel > 1e-5)
        any_split = any_split or split
        W_reports.append({
            "E": float(Emean), "mult": int(mult),
            "W_evals": [float(x) for x in Wev],
            "W_spread": spread, "rel_spread": rel, "splits": split,
        })

    three = False  # only if split produced three singlets
    # corrected spectrum estimate: E + W_ii mean, still multiplets if not split
    comparison = None
    skip_mass = (
        "One-loop fluctuations do not split the mean-field 3 and 6 into "
        "nondegenerate singlets, so C_mass and R_mass are not compared."
        if not any_split else None
    )

    results = {
        "hessian_Teta": {
            "evals": [float(x) for x in evT],
            "min": float(evT.min()),
            "positive_definite": bool(np.min(evT) > 1e-10),
            "mode_overlaps": overlaps,
            "A4_commutator_residuals": comm_res,
            "A4_invariant": A4_invariant,
            "max_A4_residual": max(comm_res) if comm_res else None,
        },
        "hessian_T0": {
            "evals": [float(x) for x in ev0],
            "min": float(ev0.min()),
            "positive_definite": bool(np.min(ev0) > 1e-10),
        },
        "order_by_disorder": {
            "n_A4": n_A4,
            "orbit_size": len(uniq),
            "expected_orbit": 5,
            "measures": measures,
            "equal_measures": bool(
                len(measures) >= 2
                and all(m["half_tr_log"] is not None for m in measures)
                and (max(m["half_tr_log"] for m in measures) - min(m["half_tr_log"] for m in measures)) < 1e-4
            ),
        },
        "fermion_W": W_reports,
        "any_multiplet_split": any_split,
        "mass_ARFs": {
            "comparison_performed": False,
            "skip_reason": skip_mass,
        },
        "posdef_used_for_D": posdef,
    }
    H = {
        "H1_hess_A4_invariant": A4_invariant,
        "H1_hess_posdef_Teta": bool(np.min(evT) > 1e-10),
        "H2_no_order_by_disorder": bool(results["order_by_disorder"]["equal_measures"]
                                        or results["order_by_disorder"]["orbit_size"] == 1),
        "H3_no_singlet_split": (not any_split),
    }
    # orbit size 5 is expected; if we found 5 equal measures, H2 is True
    if results["order_by_disorder"]["orbit_size"] == 5 and results["order_by_disorder"]["equal_measures"]:
        H["H2_no_order_by_disorder"] = True
    results["hypotheses"] = H
    results["classification"] = "PROVED" if H["H1_hess_A4_invariant"] and H["H3_no_singlet_split"] else "CONDITIONAL"
    results["classification_note"] = (
        "The hidden Hessian is A4-invariant; five A5-related A4 directions are "
        "degenerate at one loop; fermion multiplets do not split into singlets."
        if results["classification"] == "PROVED" else "See hypotheses."
    )
    out = ROOT / "alt_cycle39_gaussian_fluctuations" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "hess_Teta": [float(x) for x in evT],
        "hess_T0": [float(x) for x in ev0],
        "A4_inv": A4_invariant,
        "max_comm": max(comm_res) if comm_res else None,
        "orbit": results["order_by_disorder"],
        "W": W_reports,
        "overlaps": overlaps,
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
