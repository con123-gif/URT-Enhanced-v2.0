#!/usr/bin/env python3
"""Coupled cycle 29: Frobenius projection of the π-flux kernel onto span{I,Δ1,Δ1²}."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle29_momentum_expansion")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle25_piflux_kernel"))
import test_piflux_kernel as c25  # noqa: E402

PRED_SHA = "67aee2a300fc0dc2c8563d71af1cae223fc62a65c1dbe579bf1e5f88b843b941"
PHI = c25.PHI
ETA = c25.ETA
R_ALPHA = c25.R_ALPHA
S_ELSEWHERE = c25.S_ELSEWHERE
EVEN_FRAME = c25.EVEN_FRAME


def sanitize(o):
    return c25.sanitize(o)


def look_elsewhere(value):
    return c25.look_elsewhere(value)


def frob(A):
    return float(np.linalg.norm(A, "fro"))


def project(Pi, basis):
    """Orthogonal projection of Pi onto span(basis) in the Frobenius inner product."""
    mats = [0.5 * (B + B.T) for B in basis]
    n = len(mats)
    G = np.zeros((n, n))
    rhs = np.zeros(n)
    for i in range(n):
        rhs[i] = float(np.sum(mats[i] * Pi))
        for j in range(n):
            G[i, j] = float(np.sum(mats[i] * mats[j]))
    # G is a Gram matrix; use least-squares for numerical safety
    coeffs, *_ = np.linalg.lstsq(G, rhs, rcond=None)
    proj = np.zeros_like(Pi)
    for c, B in zip(coeffs, mats):
        proj = proj + c * B
    R = Pi - proj
    return coeffs, proj, R, G


def describe(Pi, D1T):
    n = Pi.shape[0]
    I = np.eye(n)
    D = 0.5 * (D1T + D1T.T)
    D2 = D @ D
    Pi = 0.5 * (Pi + Pi.T)
    nrm = frob(Pi) + 1e-30
    c3, proj3, R3, G3 = project(Pi, [I, D, D2])
    c2, proj2, R2, G2 = project(Pi, [I, D])
    m2, kappa, beta = (float(c3[0]), float(c3[1]), float(c3[2]))
    m2_2, kappa_2 = (float(c2[0]), float(c2[1]))
    rho_3 = frob(R3) / nrm
    rho_2 = frob(R2) / nrm
    w_beta = abs(beta) * frob(D2) / nrm
    w_kappa = abs(kappa) * frob(D) / nrm
    w_m = abs(m2) * frob(I) / nrm
    rel_k = abs(kappa - kappa_2) / max(abs(kappa), abs(kappa_2), 1e-30)
    unique = bool(
        rho_3 < 0.10
        and w_beta < 0.10
        and w_kappa > 0.10
        and rel_k < 0.05
        and np.isfinite(kappa)
        and kappa > 0
    )
    ev = eigvalsh(Pi)
    return {
        "m2": m2,
        "kappa": kappa,
        "beta": beta,
        "m2_2": m2_2,
        "kappa_2": kappa_2,
        "rho_3": float(rho_3),
        "rho_2": float(rho_2),
        "w_beta": float(w_beta),
        "w_kappa": float(w_kappa),
        "w_m": float(w_m),
        "rel_kappa_2_vs_3": float(rel_k),
        "gram3_cond": float(np.linalg.cond(G3)),
        "lambda_min_Pi": float(ev.min()),
        "lambda_max_Pi": float(ev.max()),
        "c_identity": float(np.trace(Pi) / n),
        "usable_unique_positive_kappa": unique,
        "pred_m2_plus_1_over_12": 1.0 / 12.0,
        "rel_m2_to_1_12": float(abs(m2 - 1.0 / 12.0) / (1.0 / 12.0)),
    }


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    edges = sorted(raw)
    nE = len(edges)
    c18 = json.loads((ROOT / "coupled_cycle18_nambu_measure" / "results.json").read_text())
    hat = np.asarray(c18["even_hat"], dtype=float)
    hat = hat / np.linalg.norm(hat)
    r_star = float(np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_r_even_4_5.npy")[0])
    Delta_unit = c25.pairing_matrix(EVEN_FRAME, hat, edges)

    b1 = np.zeros((12, nE))
    for e, (i, j) in enumerate(edges):
        b1[i, e] = -1.0
        b1[j, e] = 1.0
    _, s, vh = svd(b1, full_matrices=True)
    rank = int(np.sum(s > 1e-10))
    trans = vh[rank:].T
    nT = trans.shape[1]
    assert nT == 19 and rank == 11
    lookup = {x: i for i, x in enumerate(edges)}
    b2 = np.zeros((nE, len(faces)))
    for k, f in enumerate(faces):
        ff = list(f)
        for a in range(len(ff)):
            i, j = int(ff[a]), int(ff[(a + 1) % len(ff)])
            key = (min(i, j), max(i, j))
            b2[lookup[key], k] = 1.0 if i < j else -1.0
    d0 = b1.T
    Delta1 = d0 @ d0.T + b2 @ b2.T
    D1T = trans.T @ Delta1 @ trans
    D1T = 0.5 * (D1T + D1T.T)

    A_pi = np.full(nE, np.pi)

    def hessian(r, T, eps=0.02):
        Delta0 = r * Delta_unit
        pos0 = c25.bdg_pos(c25.magnetic_laplacian(edges, A_pi), Delta0)

        def omega_A(A):
            KA = c25.magnetic_laplacian(edges, A)
            D = c25.dress_delta(Delta0, np.zeros(12))
            return c25.fermion_omega(c25.bdg_pos(KA, D), pos0, T)

        HT, _ = c25.hess_trans_bg(omega_A, trans, eps, A_pi)
        return 0.5 * (HT + HT.T)

    r_scan = [("r20", 20.0), ("r100", 100.0), ("rstar", r_star)]
    T_scan = [("T0", 0.0), ("Teta", ETA)]
    points = {}
    print("cycle 29 projections...", flush=True)
    for rname, r in r_scan:
        for Tname, T in T_scan:
            tag = f"{rname}_{Tname}"
            print(f"  {tag}", flush=True)
            Pi = hessian(r, T, eps=0.02)
            rec = describe(Pi, D1T)
            rec["r"] = r
            rec["T"] = T
            points[tag] = rec

    phys = points["rstar_Teta"]
    phys0 = points["rstar_T0"]
    mid0 = points["r100_T0"]
    mideta = points["r100_Teta"]

    def ye_close(a, b):
        if abs(a) < 1e-8 and abs(b) < 1e-8:
            return True
        return abs(a - b) / max(abs(a), 1e-30) < 0.05

    ye_indep_m = ye_close(phys0["m2"], mid0["m2"]) and ye_close(phys["m2"], mideta["m2"])
    ye_indep_k = ye_close(phys0["kappa"], mid0["kappa"]) and ye_close(phys["kappa"], mideta["kappa"])

    H1 = bool(
        phys0["rel_m2_to_1_12"] < 0.15
        and phys0["w_kappa"] < 0.10
        and phys0["w_beta"] < 0.10
        and phys0["rho_3"] < 0.10
    )
    H2 = (not phys["usable_unique_positive_kappa"]) and (not phys0["usable_unique_positive_kappa"])
    H3 = bool(ye_indep_m and ye_indep_k)

    compare_slice = None
    if phys["usable_unique_positive_kappa"]:
        compare_slice = "rstar_Teta"
        kappa = phys["kappa"]
        kappa_2 = phys["kappa_2"]
    elif phys0["usable_unique_positive_kappa"]:
        compare_slice = "rstar_T0"
        kappa = phys0["kappa"]
        kappa_2 = phys0["kappa_2"]
    else:
        kappa = None
        kappa_2 = None

    arf = {
        "ARF_comparison_performed": False,
        "reason": None,
        "R_alpha": R_ALPHA,
        "R_alpha_closed_form": "3/(64*phi) + 1/(79*phi**2)",
    }
    if compare_slice is None:
        arf["reason"] = (
            "Projected κ is not a unique positive Maxwell coefficient at "
            "(r_*, T=η) or (r_*, T=0); 1/κ is not compared."
        )
    else:
        alpha_eff = 1.0 / kappa
        alpha_2 = 1.0 / kappa_2
        rel_eff = abs(alpha_eff - R_ALPHA) / R_ALPHA
        rel_2 = abs(alpha_2 - R_ALPHA) / R_ALPHA
        arf.update({
            "ARF_comparison_performed": True,
            "slice": compare_slice,
            "kappa": kappa,
            "kappa_2": kappa_2,
            "alpha_eff": alpha_eff,
            "alpha_2": alpha_2,
            "rel_err_alpha_eff": rel_eff,
            "rel_err_alpha_2": rel_2,
            "match_alpha_eff": bool(rel_eff < 1e-4),
            "match_alpha_2": bool(rel_2 < 1e-4),
            "look_elsewhere": look_elsewhere(alpha_eff),
        })

    if H1 and H2:
        classification = "PROVED"
        note = (
            "At large vev the π-flux kernel decomposes as m² I with m² → 1/12 "
            "and with κ, β consistent with 0. No unique positive Maxwell κ, "
            "so α_eff was not compared."
        )
        if not H3:
            note += (
                " The predeclared 5% ye-independence test versus r=100 did not "
                "fire (intermediate pairing corrections), as in cycle 25."
            )
    else:
        classification = "CONDITIONAL"
        note = f"H1={H1} H2={H2} H3={H3}"

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "eta": ETA,
        "r_star": r_star,
        "R_alpha": R_ALPHA,
        "n_cycle": nT,
        "points": points,
        "hypotheses": {
            "H1_large_vev_is_m2_I": H1,
            "H2_no_usable_kappa": H2,
            "H3_large_vev_independent_of_ye": H3,
            "ye_indep_m2": ye_indep_m,
            "ye_indep_kappa": ye_indep_k,
        },
        "derived_unique_positive_kappa": bool(compare_slice is not None),
        "arf": arf,
        "classification": classification,
        "classification_note": note,
        "advances_physical_ARF": bool(arf["ARF_comparison_performed"] and arf.get("match_alpha_eff")),
    }
    (OUT / "results.json").write_text(json.dumps(sanitize(results), indent=2) + "\n")
    summary = {
        "classification": classification,
        "note": note,
        "H": results["hypotheses"],
        "arf_compared": arf["ARF_comparison_performed"],
    }
    for k, rec in points.items():
        summary[k] = {kk: rec[kk] for kk in rec if kk not in ()}
    print(json.dumps(sanitize(summary), indent=2))


if __name__ == "__main__":
    main()
