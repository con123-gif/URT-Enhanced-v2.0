#!/usr/bin/env python3
"""Coupled cycle 44: A5-equivariant frequency-n refinement of the 2-complex."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle44_refinement_continuum")
sys.path.insert(0, str(ROOT / "coupled_cycle43_gauss_ir_projection"))
import test_gauss_ir_projection as c43  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle25_piflux_kernel"))
import test_piflux_kernel as c25  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle29_momentum_expansion"))
import test_momentum_expansion as c29  # noqa: E402

PRED_SHA = "6143b4e05af532f1b71ff63617e01534fe33b4a34b7197edb5626e1267ce62d2"
ETA = c25.ETA
NS = (1, 2, 3)
ATOL = 1e-10


def sanitize(o):
    return c25.sanitize(o)


def frequency_subdivide(points, faces, n):
    """Combinatorial frequency-n subdivision of a triangular 2-complex."""
    verts = []
    index = {}

    def get_vertex(weights):
        key = tuple(sorted((int(i), int(w)) for i, w in weights.items() if w > 0))
        if key not in index:
            index[key] = len(verts)
            acc = np.zeros(3, dtype=float)
            tot = 0.0
            for i, w in weights.items():
                acc += w * points[int(i)]
                tot += w
            verts.append(acc / tot)
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
    verts = np.asarray(verts, dtype=float)
    edges = set()
    for f in new_faces:
        m = len(f)
        for t in range(m):
            edges.add(tuple(sorted((int(f[t]), int(f[(t + 1) % m])))))
    edges = sorted(edges)
    return verts, new_faces, edges


def kernel_at_frequency(points, faces, n, T):
    verts, new_faces, edges = frequency_subdivide(points, faces, n)
    nV, nE, nF = len(verts), len(edges), len(new_faces)
    pred_V, pred_E, pred_F = 10 * n * n + 2, 30 * n * n, 20 * n * n
    counts_ok = bool(nV == pred_V and nE == pred_E and nF == pred_F)
    d0, d1, Delta0, Delta1 = c43.hodge_operators(nV, edges, new_faces)
    ev0 = eigvalsh(0.5 * (Delta0 + Delta0.T))
    ev1 = eigvalsh(0.5 * (Delta1 + Delta1.T))
    b0 = int(np.sum(np.abs(ev0) <= ATOL))
    b1 = int(np.sum(np.abs(ev1) <= ATOL))
    L2 = d1 @ d1.T
    ev2 = eigvalsh(0.5 * (L2 + L2.T))
    b2 = int(np.sum(np.abs(ev2) <= ATOL))
    P_T_full, trans, _, n_zero0, rank_d0 = c43.coexact_projector(d0, Delta0)
    nT = trans.shape[1]
    D1T = trans.T @ Delta1 @ trans
    D1T = 0.5 * (D1T + D1T.T)
    evD = eigvalsh(D1T)
    Pi_edge, evK, _ = c43.spectral_edge_hessian(nV, edges, T)
    PiT = trans.T @ Pi_edge @ trans
    PiT = 0.5 * (PiT + PiT.T)
    anal = c25.analyse_PiT(PiT, D1T)
    desc = c29.describe(PiT, D1T)
    lmin_D0 = float(ev0[n_zero0:].min()) if n_zero0 < ev0.size else float("nan")
    rec = {
        "n": n,
        "nV": nV,
        "nE": nE,
        "nF": nF,
        "pred_V": pred_V,
        "pred_E": pred_E,
        "pred_F": pred_F,
        "counts_ok": counts_ok,
        "b0": b0,
        "b1": b1,
        "b2": b2,
        "chi": b0 - b1 + b2,
        "nT": int(nT),
        "pred_nT": pred_F - 1,
        "nT_ok": bool(nT == pred_F - 1 and b1 == 0 and b0 == 1 and b2 == 1),
        "rank_d0": int(rank_d0),
        "lambda_min_Delta0": lmin_D0,
        "lambda_min_Delta1_T": float(evD.min()),
        "lambda_max_Delta1_T": float(evD.max()),
        "T_over_lambda_min_Delta0": float(T / lmin_D0) if lmin_D0 > 0 else None,
        "kappa_iso": anal["kappa_iso"],
        "spread": anal["kappa_gen_spread"],
        "kappa_gen_minmax": anal["kappa_gen_minmax"],
        "residual_maxwell": anal["residual_maxwell"],
        "maxwell_like": anal["maxwell_like"],
        "unique": anal["kappa_unique"],
        "positive": bool(anal["kappa_all_positive"] and anal["positive_definite"]),
        "lambda_min_PiT": anal["lambda_min_PiT"],
        "lambda_max_PiT": anal["lambda_max_PiT"],
        "m2": desc["m2"],
        "kappa": desc["kappa"],
        "beta": desc["beta"],
        "w_m": desc["w_m"],
        "w_kappa": desc["w_kappa"],
        "w_beta": desc["w_beta"],
        "rho_3": desc["rho_3"],
        "c_identity": anal["c_identity"],
        "kappa_REM": anal["kappa_REM"],
    }
    return rec, PiT, D1T


def main():
    points, faces, edges1 = c43.icosa_complex()
    assert len(edges1) == 30 and len(faces) == 20

    records = []
    pit_n1 = None
    d1t_n1 = None
    for n in NS:
        rec, PiT, D1T = kernel_at_frequency(points, faces, n, ETA)
        records.append(rec)
        if n == 1:
            pit_n1 = PiT
            d1t_n1 = D1T
        print(json.dumps(c25.sanitize({
            "n": n,
            "counts_ok": rec["counts_ok"],
            "nT_ok": rec["nT_ok"],
            "kappa_iso": rec["kappa_iso"],
            "spread": rec["spread"],
            "resid_M": rec["residual_maxwell"],
            "unique": rec["unique"],
            "positive": rec["positive"],
            "m2": rec["m2"],
            "lmin_D0": rec["lambda_min_Delta0"],
            "T_over": rec["T_over_lambda_min_Delta0"],
        })), flush=True)

    # n=1 should match cycle 43 / 32 structurally
    k = {r["n"]: r for r in records}
    k1, k2, k3 = k[1], k[2], k[3]
    d12 = abs(k2["kappa_iso"] - k1["kappa_iso"])
    d23 = abs(k3["kappa_iso"] - k2["kappa_iso"])
    same_sign = bool(
        (k1["kappa_iso"] > 0 and k2["kappa_iso"] > 0 and k3["kappa_iso"] > 0)
        or (k1["kappa_iso"] < 0 and k2["kappa_iso"] < 0 and k3["kappa_iso"] < 0)
    )
    bounded_away = bool(abs(k3["kappa_iso"]) > 0.5 * abs(k1["kappa_iso"]))
    last_smaller = bool(d23 < d12)
    finite_nonzero_limit_appears = bool(same_sign and bounded_away and last_smaller)

    spread_nonincreasing = bool(k2["spread"] <= k1["spread"] + 1e-12 and k3["spread"] <= k2["spread"] + 1e-12)
    unique_maxwell_n3 = bool(k3["unique"] and k3["maxwell_like"] and k3["positive"])
    approach_unique_maxwell = bool(unique_maxwell_n3 and spread_nonincreasing)

    coframe_derived = False  # cycle 39; not supplied by this construction
    identify_Kgamma = bool(
        finite_nonzero_limit_appears and approach_unique_maxwell and coframe_derived
    )
    compare_alpha = identify_Kgamma

    out = {
        "pred_sha": PRED_SHA,
        "eta": ETA,
        "sequence": "A5-equivariant frequency-n subdivision, n=1,2,3",
        "clock_CN_run": False,
        "records": records,
        "delta_kappa_iso_12": d12,
        "delta_kappa_iso_23": d23,
        "same_sign": same_sign,
        "bounded_away_from_zero": bounded_away,
        "last_step_smaller": last_smaller,
        "finite_nonzero_limit_appears": finite_nonzero_limit_appears,
        "spread_nonincreasing": spread_nonincreasing,
        "unique_maxwell_at_n3": unique_maxwell_n3,
        "approach_unique_maxwell": approach_unique_maxwell,
        "coframe_conversion_derived": coframe_derived,
        "K_gamma_identified": identify_Kgamma,
        "alpha_eff_compared": compare_alpha,
        "H1_derived_sequence": True,
        "H2_computed": True,
        "H3_no_Kgamma_without_coframe": (not identify_Kgamma),
    }
    (OUT / "results.json").write_text(json.dumps(sanitize(out), indent=2, sort_keys=True))
    print(json.dumps(sanitize({
        "finite_limit": finite_nonzero_limit_appears,
        "approach_unique_maxwell": approach_unique_maxwell,
        "K_gamma": identify_Kgamma,
        "d12": d12,
        "d23": d23,
        "spreads": [k1["spread"], k2["spread"], k3["spread"]],
        "kappas": [k1["kappa_iso"], k2["kappa_iso"], k3["kappa_iso"]],
    }), indent=2))


if __name__ == "__main__":
    main()
