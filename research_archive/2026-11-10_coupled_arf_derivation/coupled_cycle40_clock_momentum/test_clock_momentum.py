#!/usr/bin/env python3
"""Coupled cycle 40: product of the solid with the 24-clock; Pi_T(q)."""
from __future__ import annotations

import json
import sys
import time
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd
from scipy.linalg import eigh

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle40_clock_momentum")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle25_piflux_kernel"))
import test_piflux_kernel as c25  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle26_spinor_piflux_kernel"))
import test_spinor_piflux_kernel as c26  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle29_momentum_expansion"))
import test_momentum_expansion as c29  # noqa: E402

PRED_SHA = "f74f1ddc8386a63b365ce39163b1e05c74a60622694901943af20dd018bfefce"
ETA = c25.ETA
NCLK = 24
NS = [0, 1, 2, 3, 6, 12]
EPS = 0.02
PI0_ROUND = 1e-10


def sanitize(o):
    return c25.sanitize(o)


def clock_sigma(n, N):
    t = np.arange(N, dtype=float)
    if n == 0:
        return np.full(N, 1.0 / np.sqrt(N))
    if N % 2 == 0 and n == N // 2:
        return ((-1.0) ** t) / np.sqrt(N)
    q = 2.0 * np.pi * n / N
    return np.sqrt(2.0 / N) * np.cos(q * t)


def s2_of(n, N):
    q = 2.0 * np.pi * n / N
    return float(4.0 * np.sin(0.5 * q) ** 2)


def make_slices(ahat, n, N):
    return np.outer(clock_sigma(n, N), np.asarray(ahat, dtype=float))


def product_spatial(edges, slices, N):
    nV = 12
    dim = nV * N
    K = np.zeros((dim, dim), dtype=complex)
    deg = np.zeros(nV)
    for i, j in edges:
        deg[i] += 1.0
        deg[j] += 1.0
    for t in range(N):
        base = t * nV
        A = slices[t]
        for e, (i, j) in enumerate(edges):
            u = np.exp(1j * A[e])
            K[base + j, base + i] -= u
            K[base + i, base + j] -= np.conj(u)
        for v in range(nV):
            K[base + v, base + v] += deg[v] + 2.0
            nxt = ((t + 1) % N) * nV + v
            K[base + v, nxt] -= 1.0
            K[nxt, base + v] -= 1.0
    return 0.5 * (K + K.conj().T)


def product_spinor(edges, slices, Uij, N):
    nV = 12
    blk = 2 * nV
    dim = blk * N
    K = np.zeros((dim, dim), dtype=complex)
    deg = np.zeros(nV)
    for i, j in edges:
        deg[i] += 1.0
        deg[j] += 1.0
    I2 = np.eye(2, dtype=complex)
    for t in range(N):
        base = t * blk
        A = slices[t]
        for e, (i, j) in enumerate(edges):
            U = np.exp(1j * A[e]) * Uij[e]
            K[base + 2 * j : base + 2 * j + 2, base + 2 * i : base + 2 * i + 2] -= U
            K[base + 2 * i : base + 2 * i + 2, base + 2 * j : base + 2 * j + 2] -= U.conj().T
        for v in range(nV):
            K[base + 2 * v : base + 2 * v + 2, base + 2 * v : base + 2 * v + 2] += (
                deg[v] + 2.0
            ) * I2
            nxt = ((t + 1) % N) * blk + 2 * v
            K[base + 2 * v : base + 2 * v + 2, nxt : nxt + 2] -= I2
            K[nxt : nxt + 2, base + 2 * v : base + 2 * v + 2] -= I2
    return 0.5 * (K + K.conj().T)


def omega_from_eigs(ev, ev_ref, T):
    pos = np.maximum(np.asarray(ev, dtype=float).real, 0.0)
    pos0 = np.maximum(np.asarray(ev_ref, dtype=float).real, 0.0)
    return c25.fermion_omega(pos, pos0, T)


def analyse_residue(dPi, s2):
    R = dPi / s2
    ev = eigvalsh(R)
    mean = float(np.mean(ev))
    spread = float((ev.max() - ev.min()) / max(abs(mean), 1e-12))
    K_iso = float(np.trace(R) / R.shape[0])
    resid = float(
        np.linalg.norm(R - K_iso * np.eye(R.shape[0]), "fro")
        / (np.linalg.norm(R, "fro") + 1e-30)
    )
    return {
        "s2": float(s2),
        "K_iso": K_iso,
        "K_min": float(ev.min()),
        "K_max": float(ev.max()),
        "K_mean": mean,
        "spread": spread,
        "unique": bool(spread < 0.05),
        "positive": bool(ev.min() > 0.0),
        "identity_like": bool(resid < 0.10),
        "residual_identity": resid,
        "eigenvalues": ev.tolist(),
    }


def main():
    t_all = time.time()
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    unit = pts / np.linalg.norm(pts, axis=1, keepdims=True)
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    edges = sorted(raw)
    nE = len(edges)
    assert nE == 30
    Uij = [c26.su2_transport(unit[i], unit[j]) for i, j in edges]

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
    D1T = 0.5 * (trans.T @ Delta1 @ trans + (trans.T @ Delta1 @ trans).T)

    zeros = np.zeros(nE)
    sl0 = make_slices(zeros, 0, NCLK)
    ev_sp0 = eigvalsh(product_spatial(edges, sl0, NCLK)).real
    ev_sp_single = eigvalsh(c25.magnetic_laplacian(edges, zeros)).real
    mu = 4.0 * np.sin(np.pi * np.arange(NCLK) / NCLK) ** 2
    pred_sp = np.sort(np.add.outer(ev_sp_single, mu).ravel())
    spec_sp_ok = bool(np.allclose(np.sort(ev_sp0), pred_sp, atol=1e-10))
    tr_sp = float(np.sum(ev_sp0))
    tr_sp_pred = 84.0 * NCLK
    ev_sn0 = eigvalsh(product_spinor(edges, sl0, Uij, NCLK)).real
    ev_sn_single = eigvalsh(c26.magnetic_spin(edges, zeros, Uij)).real
    pred_sn = np.sort(np.add.outer(ev_sn_single, mu).ravel())
    spec_sn_ok = bool(np.allclose(np.sort(ev_sn0), pred_sn, atol=1e-9))
    print(
        f"spectrum checks spatial={spec_sp_ok} Tr={tr_sp:.6f} (pred {tr_sp_pred}) "
        f"spinor={spec_sn_ok} dim_sp={ev_sp0.size} dim_sn={ev_sn0.size}",
        flush=True,
    )

    sectors = {
        "spatial": {
            "builder": lambda sl: product_spatial(edges, sl, NCLK),
            "ev_ref": ev_sp0,
        },
        "spinor": {
            "builder": lambda sl: product_spinor(edges, sl, Uij, NCLK),
            "ev_ref": ev_sn0,
        },
    }

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "construction": {
            "N": NCLK,
            "T": float(ETA),
            "eps": EPS,
            "modes_n": NS,
            "nT": nT,
            "spectrum_A0_spatial_ok": spec_sp_ok,
            "spectrum_A0_spinor_ok": spec_sn_ok,
            "Tr_K_product_spatial": tr_sp,
            "Tr_K_product_spatial_pred": tr_sp_pred,
        },
        "sectors": {},
    }

    for sector, spec in sectors.items():
        builder = spec["builder"]
        ev_ref = spec["ev_ref"]
        print(f"=== sector {sector} ===", flush=True)

        def make_omega(n):
            def omega_A(A):
                sl = make_slices(A, n, NCLK)
                ev = eigvalsh(builder(sl)).real
                return omega_from_eigs(ev, ev_ref, ETA)

            return omega_A

        Pi = {}
        anal0 = None
        desc0 = None
        for n in NS:
            t0 = time.time()
            print(f"  Hessian n={n} s2={s2_of(n, NCLK):.8f} ...", flush=True)
            HT, om0 = c25.hess_trans_bg(make_omega(n), trans, EPS, zeros)
            rec = {
                "n": n,
                "q": float(2.0 * np.pi * n / NCLK),
                "s2": s2_of(n, NCLK),
                "omega0": float(om0),
                "PiT_min": float(eigvalsh(HT).min()),
                "PiT_max": float(eigvalsh(HT).max()),
                "Tr_PiT": float(np.trace(HT)),
                "K_lit": (
                    float(np.trace(HT) / (nT * s2_of(n, NCLK)))
                    if n != 0
                    else None
                ),
            }
            Pi[n] = HT
            if n == 0:
                anal0 = c25.analyse_PiT(HT, D1T)
                desc0 = c29.describe(HT, D1T)
                rec["analyse"] = anal0
                rec["describe"] = desc0
            print(
                f"    done in {time.time()-t0:.1f}s  "
                f"Tr={rec['Tr_PiT']:.6e} lmin={rec['PiT_min']:.6e}",
                flush=True,
            )
            results.setdefault("_tmp", {}).setdefault(sector, {})[n] = rec

        Pi0 = Pi[0]
        pi0_max = float(np.max(np.abs(eigvalsh(Pi0))))
        pi0_is_zero = bool(pi0_max < PI0_ROUND)
        residues = {}
        for n in NS:
            if n == 0:
                continue
            dPi = Pi[n] - Pi0
            residues[str(n)] = analyse_residue(dPi, s2_of(n, NCLK))
            residues[str(n)]["K_lit"] = results["_tmp"][sector][n]["K_lit"]
            residues[str(n)]["Tr_dPi"] = float(np.trace(dPi))
            residues[str(n)]["dPi_min"] = float(eigvalsh(dPi).min())
            residues[str(n)]["dPi_max"] = float(eigvalsh(dPi).max())

        r1 = residues["1"]
        r2 = residues["2"]
        agree_12 = bool(
            abs(r1["K_iso"] - r2["K_iso"]) / max(abs(r1["K_iso"]), 1e-12) < 0.05
        )
        gate = {
            "PiT0_maxabs_eig": pi0_max,
            "PiT0_is_zero": pi0_is_zero,
            "literal_limit_exists": pi0_is_zero,
            "R_n1_unique": r1["unique"],
            "R_n1_positive": r1["positive"],
            "K_iso_n1_n2_agree_5pct": agree_12,
            "apply_conversion": bool(
                pi0_is_zero and r1["unique"] and r1["positive"] and agree_12
            ),
        }
        sector_out = {
            "PiT0": results["_tmp"][sector][0],
            "modes": {str(n): {k: v for k, v in results["_tmp"][sector][n].items() if k != "analyse"} for n in NS},
            "residues": residues,
            "gate": gate,
        }
        # put analyse back on mode 0
        sector_out["modes"]["0"]["analyse"] = anal0
        sector_out["modes"]["0"]["describe"] = desc0
        if gate["apply_conversion"]:
            Kgamma = r1["K_iso"]
            ainv = 4.0 * np.pi * Kgamma
            aeff = 1.0 / ainv
            sector_out["conversion"] = {
                "K_gamma": float(Kgamma),
                "alpha_inv": float(ainv),
                "alpha_eff": float(aeff),
                "look_elsewhere_Ralpha": c25.look_elsewhere(aeff),
                "look_elsewhere_PDG": c25.look_elsewhere(1.0 / 137.036),
                "rel_to_Ralpha": float(abs(aeff - c25.R_ALPHA) / c25.R_ALPHA),
                "rel_to_PDG": float(abs(aeff - 1.0 / 137.036) / (1.0 / 137.036)),
            }
        else:
            sector_out["conversion"] = {
                "applied": False,
                "reason": (
                    "literal archive limit (A) diverges"
                    if not pi0_is_zero
                    else "dynamical residue not unique and positive with n=1,2 agreement"
                ),
            }
        results["sectors"][sector] = sector_out

    results.pop("_tmp", None)
    H1 = (not results["sectors"]["spatial"]["gate"]["PiT0_is_zero"]) and (
        not results["sectors"]["spinor"]["gate"]["PiT0_is_zero"]
    )
    applied_any = any(
        results["sectors"][s]["gate"]["apply_conversion"] for s in ("spatial", "spinor")
    )
    results["hypotheses"] = {
        "H1_PiT0_nonzero_literal_limit_diverges": bool(H1),
        "H2_spatial_R_unique": results["sectors"]["spatial"]["gate"]["R_n1_unique"],
        "H2_spatial_R_positive": results["sectors"]["spatial"]["gate"]["R_n1_positive"],
        "H2_spinor_R_unique": results["sectors"]["spinor"]["gate"]["R_n1_unique"],
        "H2_spinor_R_positive": results["sectors"]["spinor"]["gate"]["R_n1_positive"],
        "H3_no_alpha_comparison": bool(not applied_any),
    }
    results["elapsed_s"] = float(time.time() - t_all)
    (OUT / "results.json").write_text(json.dumps(sanitize(results), indent=2) + "\n")
    print(json.dumps(sanitize(results["hypotheses"]), indent=2), flush=True)
    print("elapsed_s", results["elapsed_s"], flush=True)


if __name__ == "__main__":
    main()
