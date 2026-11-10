#!/usr/bin/env python3
"""Coupled cycle 47: A5-invariant lumped Hodge weightings and spread."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle47_hodge_weightings")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import (  # noqa: E402
    load_ops,
    icosahedral_rotations,
    induced_perm,
)
sys.path.insert(0, str(ROOT / "coupled_cycle43_gauss_ir_projection"))
import test_gauss_ir_projection as c43  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle44_refinement_continuum"))
import test_refinement_continuum as c44  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle25_piflux_kernel"))
import test_piflux_kernel as c25  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle29_momentum_expansion"))
import test_momentum_expansion as c29  # noqa: E402

PRED_SHA = "58aeb6e81a4734f30901577a6d675d308efe445924f308de2db95f42c418438a"
ETA = c25.ETA
NS = (1, 2, 3)
RATIOS = (0.25, 0.5, 1.0, 2.0, 4.0)
ATOL = 1e-10


def sanitize(o):
    return c25.sanitize(o)


def barycentric_keys(n, faces):
    """Return list of vertex keys (tuple of 12 ints summing to n) in construction order.

    Also faces as triples of vertex indices, and a key->index map.
    This must match c44.frequency_subdivide vertex order.
    """
    # Rebuild the same key order as c44
    index = {}
    keys = []

    def get_vertex(weights):
        key = tuple(sorted((int(i), int(w)) for i, w in weights.items() if w > 0))
        # store also as 12-tuple
        if key not in index:
            index[key] = len(keys)
            w12 = [0] * 12
            for i, w in weights.items():
                if w:
                    w12[int(i)] = int(w)
            keys.append(tuple(w12))
        return index[key]

    new_faces = []
    for a, b, c in faces:
        a, b, c = int(a), int(b), int(c)
        loc = {}
        for i in range(n + 1):
            for j in range(n - i + 1):
                k = n - i - j
                w = {}
                if k:
                    w[a] = k
                if i:
                    w[b] = i
                if j:
                    w[c] = j
                loc[(i, j)] = get_vertex(w)
        for i in range(n):
            for j in range(n - i):
                new_faces.append((loc[(i, j)], loc[(i + 1, j)], loc[(i, j + 1)]))
                if i + 1 + j + 1 <= n:
                    new_faces.append((loc[(i + 1, j)], loc[(i + 1, j + 1)], loc[(i, j + 1)]))
    return keys, new_faces


def apply_perm_key(key, perm):
    out = [0] * 12
    for i, w in enumerate(key):
        if w:
            out[perm[i]] = w
    return tuple(out)


def classify_orbits(n, orig_faces, orig_pts, perms, verts, edges, faces):
    keys, faces_from_keys = barycentric_keys(n, orig_faces)
    assert len(keys) == len(verts)
    key_to_idx = {k: i for i, k in enumerate(keys)}
    # vertex orbits
    v_orb = [-1] * len(keys)
    oid = 0
    for i, k in enumerate(keys):
        if v_orb[i] >= 0:
            continue
        stack = [k]
        seen = set()
        while stack:
            cur = stack.pop()
            if cur in seen:
                continue
            seen.add(cur)
            v_orb[key_to_idx[cur]] = oid
            for perm in perms:
                stack.append(apply_perm_key(cur, perm))
        oid += 1
    nV_orb = oid
    # edge orbits: represent an edge by frozenset of two keys
    e_orb = [-1] * len(edges)
    oid = 0
    edge_of = {tuple(sorted(e)): ei for ei, e in enumerate(edges)}
    for ei, (i, j) in enumerate(edges):
        if e_orb[ei] >= 0:
            continue
        stack = [(keys[i], keys[j])]
        seen = set()
        while stack:
            ka, kb = stack.pop()
            fr = (ka, kb) if ka <= kb else (kb, ka)
            if fr in seen:
                continue
            seen.add(fr)
            ia, ib = key_to_idx[ka], key_to_idx[kb]
            e_orb[edge_of[tuple(sorted((ia, ib)))]] = oid
            for perm in perms:
                stack.append((apply_perm_key(ka, perm), apply_perm_key(kb, perm)))
        oid += 1
    nE_orb = oid
    # face orbits
    f_orb = [-1] * len(faces)
    oid = 0
    face_of = {}
    for fi, f in enumerate(faces):
        face_of[tuple(sorted(f))] = fi
    for fi, f in enumerate(faces):
        if f_orb[fi] >= 0:
            continue
        ks = [keys[v] for v in f]
        stack = [tuple(ks)]
        seen = set()
        while stack:
            trip = stack.pop()
            fr = tuple(sorted(trip))
            if fr in seen:
                continue
            seen.add(fr)
            idxs = tuple(sorted(key_to_idx[k] for k in trip))
            f_orb[face_of[idxs]] = oid
            for perm in perms:
                stack.append(tuple(apply_perm_key(k, perm) for k in trip))
        oid += 1
    nF_orb = oid
    return (
        np.array(v_orb),
        np.array(e_orb),
        np.array(f_orb),
        nV_orb,
        nE_orb,
        nF_orb,
    )


def triangle_area(a, b, c):
    return 0.5 * np.linalg.norm(np.cross(b - a, c - a))


def all_acute(a, b, c):
    return bool(
        np.dot(b - a, c - a) > 1e-12
        and np.dot(a - b, c - b) > 1e-12
        and np.dot(a - c, b - c) > 1e-12
    )


def circumcenter(a, b, c):
    ab = b - a
    ac = c - a
    n = np.cross(ab, ac)
    n2 = float(np.dot(n, n))
    if n2 < 1e-18:
        return None
    return a + (np.dot(ac, ac) * np.cross(n, ab) + np.dot(ab, ab) * np.cross(ac, n)) / (2.0 * n2)


def sph_dist(u, v):
    cu = np.clip(np.dot(u, v) / (np.linalg.norm(u) * np.linalg.norm(v)), -1.0, 1.0)
    return float(np.arccos(cu))


def build_stars(verts, edges, faces, kind):
    """Return mu0, mu1, mu2 or (None, reason). kind in named-point names."""
    nV, nE, nF = len(verts), len(edges), len(faces)
    spherical = kind.startswith("G_sph")
    # lengths
    pts = verts.copy()
    if spherical:
        nrm = np.linalg.norm(pts, axis=1, keepdims=True)
        pts = pts / nrm

    def plen(i, j):
        if spherical:
            return sph_dist(pts[i], pts[j])
        return float(np.linalg.norm(pts[i] - pts[j]))

    areas = np.zeros(nF)
    dual_pts = np.zeros((nF, 3))
    for fi, (a, b, c) in enumerate(faces):
        A, B, C = pts[a], pts[b], pts[c]
        areas[fi] = triangle_area(A, B, C)
        if areas[fi] < 1e-18:
            return None, f"zero area face {fi}"
        if "circ" in kind:
            if not all_acute(A, B, C):
                return None, f"non-acute face {fi}"
            cc = circumcenter(A, B, C)
            if cc is None:
                return None, f"no circumcenter {fi}"
            if spherical:
                cn = np.linalg.norm(cc)
                if cn < 1e-14:
                    return None, f"circumcenter at origin {fi}"
                cc = cc / cn
            dual_pts[fi] = cc
        else:
            bc = (A + B + C) / 3.0
            if spherical:
                bc = bc / np.linalg.norm(bc)
            dual_pts[fi] = bc

    # edge -> two faces
    incident = {e: [] for e in range(nE)}
    lookup = {tuple(sorted(e)): i for i, e in enumerate(edges)}
    for fi, f in enumerate(faces):
        ff = list(f)
        for t in range(3):
            key = tuple(sorted((ff[t], ff[(t + 1) % 3])))
            incident[lookup[key]].append(fi)
    for e in range(nE):
        if len(incident[e]) != 2:
            return None, f"edge {e} has {len(incident[e])} faces"

    mu0 = np.zeros(nV)
    mu1 = np.zeros(nE)
    mu2 = np.zeros(nF)
    for fi in range(nF):
        mu2[fi] = 1.0 / areas[fi]
    for v, finc in enumerate([[] for _ in range(nV)]):
        pass
    # *0 = (1/3) sum areas of incident faces
    inc_area = np.zeros(nV)
    for fi, f in enumerate(faces):
        for v in f:
            inc_area[v] += areas[fi]
    mu0 = inc_area / 3.0

    for e, (i, j) in enumerate(edges):
        le = plen(i, j)
        if le < 1e-18:
            return None, f"zero length edge {e}"
        f1, f2 = incident[e]
        if spherical:
            ls = sph_dist(dual_pts[f1], dual_pts[f2])
        else:
            ls = float(np.linalg.norm(dual_pts[f1] - dual_pts[f2]))
        if ls <= 0:
            return None, f"nonpositive dual length edge {e}"
        mu1[e] = ls / le

    if kind.endswith("_len") or "_len" in kind:
        mu0[:] = 1.0
        mu2[:] = 1.0
        for e, (i, j) in enumerate(edges):
            mu1[e] = plen(i, j)
    elif kind.endswith("_inv") or "_inv" in kind:
        mu0[:] = 1.0
        mu2[:] = 1.0
        for e, (i, j) in enumerate(edges):
            le = plen(i, j)
            mu1[e] = 1.0 / le
    elif kind.endswith("_dec") or "_circ" in kind:
        pass
    else:
        return None, f"unknown kind {kind}"
    if np.min(mu0) <= 0 or np.min(mu1) <= 0 or np.min(mu2) <= 0:
        return None, "nonpositive star"
    return (mu0, mu1, mu2), None


def weighted_hodge(d0, d1, mu0, mu1, mu2):
    """Return (Delta0, Maxwell Gram M, Delta1_operator).

    The Maxwell energy is A^T M A with
        M = *1 d0 *0^{-1} d0^T *1 + d1^T *2 d1,
    which is Euclidean-SPD on coexact forms and reduces to the
    unweighted Delta1 of cycles 43-44 when *k = I.
    """
    inv0 = 1.0 / mu0
    star1 = np.diag(mu1)
    D0s = d0.T @ star1
    Delta0 = np.diag(inv0) @ D0s @ d0
    M_exact = D0s.T @ np.diag(inv0) @ D0s
    M_coex = d1.T @ np.diag(mu2) @ d1
    M = 0.5 * ((M_exact + M_coex) + (M_exact + M_coex).T)
    inv1 = 1.0 / mu1
    Delta1 = np.diag(inv1) @ M
    return Delta0, M, Delta1


def coexact_basis_weighted(d0, mu1, atol=ATOL):
    M = d0.T @ np.diag(mu1)
    _, s, vh = svd(M, full_matrices=True)
    rank = int(np.sum(s > atol))
    trans = vh[rank:].T
    return trans, rank


def spectral_edge_hessian_weighted(nV, edges, T, mu1):
    nE = len(edges)
    K = np.zeros((nV, nV), dtype=float)
    deg = np.zeros(nV)
    for e, (i, j) in enumerate(edges):
        w = float(mu1[e])
        deg[i] += w
        deg[j] += w
        K[i, j] -= w
        K[j, i] -= w
    for i in range(nV):
        K[i, i] += deg[i]
    ev, U = np.linalg.eigh(0.5 * (K + K.T))
    th, fp = c43.theta_matrix(ev, T)
    S = np.zeros((nE, nV, nV))
    wts = np.asarray(mu1, dtype=float)
    for e, (i, j) in enumerate(edges):
        S[e] = wts[e] * (np.outer(U[i], U[j]) - np.outer(U[j], U[i]))
    Pi = np.zeros((nE, nE))
    fK = (U * fp) @ U.T
    for e, (i, j) in enumerate(edges):
        Pi[e, e] += 2.0 * wts[e] * fK[i, j]
    Sflat = S.reshape(nE, nV * nV)
    wth = th.reshape(nV * nV)
    Pi += (Sflat * wth) @ Sflat.T
    return 0.5 * (Pi + Pi.T), ev


def kernel_from_weights(nV, edges, faces, d0, d1, mu0, mu1, mu2, T, hops="coupled"):
    Delta0, M, Delta1 = weighted_hodge(d0, d1, mu0, mu1, mu2)
    trans, rank = coexact_basis_weighted(d0, mu1)
    nT = trans.shape[1]
    hop_w = mu1 if hops == "coupled" else np.ones_like(mu1)
    Pi_edge, evK = spectral_edge_hessian_weighted(nV, edges, T, hop_w)
    PiT = trans.T @ Pi_edge @ trans
    PiT = 0.5 * (PiT + PiT.T)
    D1T = trans.T @ M @ trans
    D1T = 0.5 * (D1T + D1T.T)
    evM = eigvalsh(D1T)
    if evM.min() <= 1e-12:
        return {
            "nT": int(nT),
            "rank_weighted_div": int(rank),
            "defined": False,
            "reason": "Maxwell Gram not PD on coexact space",
            "lambda_min_M": float(evM.min()),
            "unique": False,
            "positive": False,
            "maxwell_like": False,
            "spread": None,
            "kappa_iso": None,
        }
    anal = c25.analyse_PiT(PiT, D1T)
    desc = c29.describe(PiT, D1T)
    ev0 = eigvalsh(0.5 * (Delta0 + Delta0.T))
    evD = eigvalsh(D1T)
    n_zero0 = int(np.sum(np.abs(ev0) <= ATOL))
    lmin0 = float(ev0[n_zero0:].min()) if n_zero0 < ev0.size else float("nan")
    return {
        "nT": int(nT),
        "rank_weighted_div": int(rank),
        "kappa_iso": anal["kappa_iso"],
        "spread": anal["kappa_gen_spread"],
        "kappa_gen_minmax": anal["kappa_gen_minmax"],
        "residual_maxwell": anal["residual_maxwell"],
        "maxwell_like": anal["maxwell_like"],
        "unique": anal["kappa_unique"],
        "positive": bool(anal["kappa_all_positive"] and anal["positive_definite"]),
        "lambda_min_PiT": anal["lambda_min_PiT"],
        "lambda_max_PiT": anal["lambda_max_PiT"],
        "lambda_min_Delta0": lmin0,
        "lambda_min_Delta1_T": float(evD.min()),
        "lambda_max_Delta1_T": float(evD.max()),
        "m2": desc["m2"],
        "w_m": desc["w_m"],
        "w_kappa": desc["w_kappa"],
        "w_beta": desc["w_beta"],
        "kappa_REM": anal["kappa_REM"],
        "n_zero_Delta0": n_zero0,
    }


def weights_from_orbits(v_orb, e_orb, f_orb, nVo, nEo, nFo, scales_v, scales_e, scales_f, renorm_edges=True):
    mu0 = np.array([scales_v[o] for o in v_orb], dtype=float)
    mu1 = np.array([scales_e[o] for o in e_orb], dtype=float)
    mu2 = np.array([scales_f[o] for o in f_orb], dtype=float)
    if renorm_edges:
        # geometric mean of orbit weights (not per-edge) set to 1
        gm = float(np.exp(np.mean(np.log(np.array(scales_e, dtype=float)))))
        mu1 = mu1 / gm
    return mu0, mu1, mu2


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    orig_pts = np.asarray(ico["points"], dtype=float)
    # circumradius 1
    R = float(np.linalg.norm(orig_pts[0]))
    orig_pts = orig_pts / R
    orig_faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    rots, _neigh = icosahedral_rotations(orig_pts)
    assert len(rots) == 60, len(rots)
    perms = []
    for Rmat in rots:
        p = induced_perm(orig_pts, Rmat)
        assert p is not None
        perms.append(p)

    census = {}
    named_results = {}
    scans = {}
    NAMED = [
        "G_comb",
        "G_sph_dec",
        "G_euc_dec",
        "G_sph_len",
        "G_euc_len",
        "G_sph_inv",
        "G_euc_inv",
        "G_sph_circ",
        "G_euc_circ",
    ]

    for n in NS:
        verts, faces, edges = c44.frequency_subdivide(orig_pts, orig_faces, n)
        nV, nE, nF = len(verts), len(edges), len(faces)
        d0, d1, _, _ = c43.hodge_operators(nV, edges, faces)
        v_orb, e_orb, f_orb, nVo, nEo, nFo = classify_orbits(
            n, orig_faces, orig_pts, perms, verts, edges, faces
        )
        v_counts = [int(np.sum(v_orb == o)) for o in range(nVo)]
        e_counts = [int(np.sum(e_orb == o)) for o in range(nEo)]
        f_counts = [int(np.sum(f_orb == o)) for o in range(nFo)]
        census[str(n)] = {
            "nV": nV,
            "nE": nE,
            "nF": nF,
            "N0": nVo,
            "N1": nEo,
            "N2": nFo,
            "vertex_orbit_sizes": v_counts,
            "edge_orbit_sizes": e_counts,
            "face_orbit_sizes": f_counts,
            "cone_dim": nVo + nEo + nFo,
            "cone_dim_after_scale": nVo + nEo + nFo - 1,
        }
        print("CENSUS n=%d N0=%d N1=%d N2=%d sizes v%s e%s f%s" % (n, nVo, nEo, nFo, v_counts, e_counts, f_counts), flush=True)

        named_results[str(n)] = {}
        for kind in NAMED:
            if kind == "G_comb":
                mu = (np.ones(nV), np.ones(nE), np.ones(nF))
                reason = None
            else:
                mu, reason = build_stars(verts, edges, faces, kind)
            rec = {"defined": mu is not None, "reason": reason}
            if mu is not None:
                mu0, mu1, mu2 = mu
                rec["mu0_minmax"] = [float(mu0.min()), float(mu0.max())]
                rec["mu1_minmax"] = [float(mu1.min()), float(mu1.max())]
                rec["mu2_minmax"] = [float(mu2.min()), float(mu2.max())]
                rec["mu1_orbit_means"] = [
                    float(mu1[e_orb == o].mean()) for o in range(nEo)
                ]
                for hops in ("coupled", "gauge_only"):
                    ker = kernel_from_weights(
                        nV, edges, faces, d0, d1, mu0, mu1, mu2, ETA, hops=hops
                    )
                    rec[hops] = ker
                    print(
                        "  %s %s spread=%.6f unique=%s resid=%.6f kappa=%.6g lminD1=%.6g"
                        % (
                            kind,
                            hops,
                            ker["spread"],
                            ker["unique"],
                            ker["residual_maxwell"],
                            ker["kappa_iso"],
                            ker["lambda_min_Delta1_T"],
                        ),
                        flush=True,
                    )
            named_results[str(n)][kind] = rec

        # axis scans, primary only, skip r=1 (equals G_comb)
        scans[str(n)] = {"vertex": [], "edge": [], "face": []}
        for typ, nO, name in (("vertex", nVo, "vertex"), ("edge", nEo, "edge"), ("face", nFo, "face")):
            for o in range(nO):
                for r in RATIOS:
                    if abs(r - 1.0) < 1e-15:
                        continue
                    sv = [1.0] * nVo
                    se = [1.0] * nEo
                    sf = [1.0] * nFo
                    if typ == "vertex":
                        sv[o] = r
                    elif typ == "edge":
                        se[o] = r
                    else:
                        sf[o] = r
                    mu0, mu1, mu2 = weights_from_orbits(
                        v_orb, e_orb, f_orb, nVo, nEo, nFo, sv, se, sf, True
                    )
                    ker = kernel_from_weights(
                        nV, edges, faces, d0, d1, mu0, mu1, mu2, ETA, hops="coupled"
                    )
                    scans[str(n)][name].append(
                        {
                            "orbit": o,
                            "orbit_size": (
                                v_counts[o] if typ == "vertex" else e_counts[o] if typ == "edge" else f_counts[o]
                            ),
                            "r": r,
                            "spread": ker["spread"],
                            "unique": ker["unique"],
                            "maxwell_like": ker["maxwell_like"],
                            "positive": ker["positive"],
                            "residual_maxwell": ker["residual_maxwell"],
                            "kappa_iso": ker["kappa_iso"],
                            "lambda_min_Delta1_T": ker["lambda_min_Delta1_T"],
                        }
                    )
                    print("  scan %s orb %d r=%s spread=%.6f unique=%s" % (name, o, r, ker["spread"], ker["unique"]), flush=True)

    # summaries for (A)/(B)
    unique_at = []
    for n in NS:
        for kind, rec in named_results[str(n)].items():
            if rec.get("defined") and rec.get("coupled", {}).get("unique"):
                unique_at.append({"n": n, "kind": kind, "hops": "coupled", "spread": rec["coupled"]["spread"]})
            if rec.get("defined") and rec.get("gauge_only", {}).get("unique"):
                unique_at.append({"n": n, "kind": kind, "hops": "gauge_only", "spread": rec["gauge_only"]["spread"]})
        for typ, items in scans[str(n)].items():
            for it in items:
                if it["unique"]:
                    unique_at.append({"n": n, "scan": typ, "orbit": it["orbit"], "r": it["r"], "spread": it["spread"]})

    # (A): combinatorics unique ray?
    A_collapses = all(census[str(n)]["N0"] == 1 and census[str(n)]["N1"] == 1 and census[str(n)]["N2"] == 1 for n in NS)
    # actually (A) is per n; globally (A) fails if any n>=2 has more than one orbit
    A_fails_n_ge2 = any(census[str(n)]["cone_dim"] > 3 or census[str(n)]["N0"] > 1 or census[str(n)]["N1"] > 1 or census[str(n)]["N2"] > 1 for n in (2, 3))

    defined_named_n3 = [k for k, rec in named_results["3"].items() if rec.get("defined")]
    # (B): unique geometric convention forced? more than one defined named geometric (exclude G_comb)
    geom_defined = [k for k in defined_named_n3 if k != "G_comb"]
    B_unique_convention = len(geom_defined) == 1

    out = {
        "pred_sha": PRED_SHA,
        "eta": ETA,
        "circumradius_convention": 1.0,
        "original_archive_circumradius": R,
        "census": census,
        "named": named_results,
        "axis_scans": scans,
        "unique_maxwell_hits": unique_at,
        "n_unique_hits": len(unique_at),
        "H1_n1_orbits": census["1"],
        "H2_n_ge2_not_unique_combinatorially": A_fails_n_ge2,
        "A_cone_collapses_all_n": A_collapses,
        "B_single_named_geometric_convention": B_unique_convention,
        "named_geometric_defined_at_n3": geom_defined,
        "resolution_A_or_B": bool((A_collapses and False) or (B_unique_convention and False)),
        # resolution filled after we know uniqueness at the unique convention; set properly below
    }
    # Resolution (A) or (B) as predeclared: (A) requires collapse AND unique Maxwell on that ray
    # (B) requires a single forced geometric construction AND unique Maxwell at n=3
    comb_unique_n3 = bool(named_results["3"]["G_comb"]["coupled"]["unique"])
    resolution_A = bool(A_collapses and comb_unique_n3)
    resolution_B = False
    if B_unique_convention:
        only = geom_defined[0]
        resolution_B = bool(named_results["3"][only]["coupled"]["unique"])
    out["resolution_A"] = resolution_A
    out["resolution_B"] = resolution_B
    out["resolution_A_or_B"] = bool(resolution_A or resolution_B)
    out["H4_does_not_resolve"] = (not out["resolution_A_or_B"])

    (OUT / "results.json").write_text(json.dumps(sanitize(out), indent=2, sort_keys=True))
    print(json.dumps(sanitize({
        "census": census,
        "n_unique_hits": len(unique_at),
        "hits": unique_at,
        "A_collapses": A_collapses,
        "A_fails_n_ge2": A_fails_n_ge2,
        "B_unique_conv": B_unique_convention,
        "geom_defined_n3": geom_defined,
        "resolution": out["resolution_A_or_B"],
    }), indent=2))


if __name__ == "__main__":
    main()
