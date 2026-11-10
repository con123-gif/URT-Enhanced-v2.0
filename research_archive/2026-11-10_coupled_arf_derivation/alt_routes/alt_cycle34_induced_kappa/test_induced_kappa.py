#!/usr/bin/env python3
"""Alt cycle 34: induced vacuum polarisation / Maxwell coefficient κ."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, eigh

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_HIDDEN = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_HIDDEN)
C_EVEN = (DELTA_HIDDEN ** 2) * 0.21876978874206543
T_KMS = float(ETA)

EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
HAT25 = np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_hat_even_4_5.npy")
R25 = float(np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_r_even_4_5.npy")[0])
R33 = float(json.loads((ROOT / "alt_cycle33_spinor_lift" / "results.json").read_text())
            ["condensation"]["r_star"])

PAULI = np.array([
    [[0, 1], [1, 0]],
    [[0, -1j], [1j, 0]],
    [[1, 0], [0, -1]],
], dtype=complex)
EPS = np.array([[0.0, 1.0], [-1.0, 0.0]])


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
    if isinstance(obj, (complex, np.complexfloating)):
        return {"re": float(obj.real), "im": float(obj.imag)}
    if isinstance(obj, np.ndarray):
        return jsonable(obj.tolist())
    return obj


def pairing_spatial(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def magnetic_K(edges, A, shift=0.0):
    n = 12
    K = np.zeros((n, n), dtype=complex)
    deg = np.zeros(n)
    for e, (i, j) in enumerate(edges):
        deg[i] += 1.0
        deg[j] += 1.0
        u = np.exp(1j * A[e])
        K[j, i] -= u
        K[i, j] -= np.conj(u)
    for i in range(n):
        K[i, i] += deg[i] + shift
    return K


def magnetic_H13(edges, A):
    """13-site geometric Hodge: vertices 0..11, centre 12; spokes unphased."""
    K = np.zeros((13, 13), dtype=complex)
    for e, (i, j) in enumerate(edges):
        u = np.exp(1j * A[e])
        K[j, i] -= u
        K[i, j] -= np.conj(u)
        K[i, i] += 1.0
        K[j, j] += 1.0
    for i in range(12):
        K[i, i] += 1.0
        K[12, 12] += 1.0
        K[12, i] -= 1.0
        K[i, 12] -= 1.0
    return K


def su2_transport(ni, nj):
    ni = ni / np.linalg.norm(ni)
    nj = nj / np.linalg.norm(nj)
    c = float(np.clip(np.dot(ni, nj), -1.0, 1.0))
    theta = np.arccos(c)
    axis = np.cross(ni, nj)
    nrm = np.linalg.norm(axis)
    if nrm < 1e-14:
        return np.eye(2, dtype=complex)
    axis = axis / nrm
    half = 0.5 * theta
    U = np.cos(half) * np.eye(2, dtype=complex)
    for a in range(3):
        U = U - 1j * np.sin(half) * axis[a] * PAULI[a]
    return U


def magnetic_spin(edges, A, Uij):
    n = 12
    K = np.zeros((2 * n, 2 * n), dtype=complex)
    deg = np.zeros(n)
    for i, j in edges:
        deg[i] += 1.0
        deg[j] += 1.0
    for e, (i, j) in enumerate(edges):
        phase = np.exp(1j * A[e])
        U = phase * Uij[e]
        K[2 * j:2 * j + 2, 2 * i:2 * i + 2] -= U
        K[2 * i:2 * i + 2, 2 * j:2 * j + 2] -= U.conj().T
    for i in range(n):
        K[2 * i:2 * i + 2, 2 * i:2 * i + 2] += deg[i] * np.eye(2)
    return 0.5 * (K + K.conj().T)


def bdg_pos(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n), dtype=complex)
    H[:n, :n] = K
    H[n:, n:] = -np.conj(K)
    H[:n, n:] = Delta
    H[n:, :n] = np.conj(np.asarray(Delta).T)
    ev = eigvalsh(H)
    return np.maximum(ev[n:].real, 0.0)


def log2cosh(z):
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


def Fabs(pos, T):
    if T <= 0:
        return -0.5 * float(np.sum(pos))
    return float(-T * np.sum(log2cosh(pos / (2.0 * T))))


def analyse_PiT(PiT, D1T):
    PiT = 0.5 * (PiT + PiT.T)
    D1T = 0.5 * (D1T + D1T.T)
    evP = eigvalsh(PiT)
    evD = eigvalsh(D1T)
    # generalised eigenvalues Π v = κ Δ1 v
    try:
        gev = eigh(PiT, D1T, eigvals_only=True)
    except Exception as exc:
        gev = None
        gen_err = str(exc)
    else:
        gen_err = None
    n = PiT.shape[0]
    trP = float(np.trace(PiT))
    cI = trP / n
    resid_I = float(np.linalg.norm(PiT - cI * np.eye(n), "fro") / (np.linalg.norm(PiT, "fro") + 1e-30))
    num = float(np.sum(PiT * D1T))
    den = float(np.sum(D1T * D1T))
    kappa_iso = num / den if den > 0 else None
    resid_M = None
    if kappa_iso is not None:
        resid_M = float(np.linalg.norm(PiT - kappa_iso * D1T, "fro") / (np.linalg.norm(PiT, "fro") + 1e-30))
    kappa_REM = float(evP.min() / evD.min()) if abs(evD.min()) > 1e-30 else None
    unique = False
    spread = None
    if gev is not None and np.all(np.isfinite(gev)):
        mean = float(np.mean(gev))
        spread = float((np.max(gev) - np.min(gev)) / max(abs(mean), 1e-12))
        unique = bool(spread < 0.05)
        finite = bool(np.max(np.abs(gev)) < 1e10)
        all_pos = bool(np.min(gev) > 0)
        all_neg = bool(np.max(gev) < 0)
    else:
        finite = False
        all_pos = False
        all_neg = False
    return {
        "lambda_min_PiT": float(evP.min()),
        "lambda_max_PiT": float(evP.max()),
        "n_neg": int(np.sum(evP < -1e-10)),
        "n_pos": int(np.sum(evP > 1e-10)),
        "n_zeroish": int(np.sum(np.abs(evP) <= 1e-10)),
        "kappa_gen": None if gev is None else [float(x) for x in gev],
        "kappa_gen_minmax": None if gev is None else [float(np.min(gev)), float(np.max(gev))],
        "kappa_gen_spread": spread,
        "kappa_unique": unique,
        "kappa_finite": finite,
        "kappa_all_positive": all_pos,
        "kappa_all_negative": all_neg,
        "kappa_iso": kappa_iso,
        "residual_maxwell": resid_M,
        "maxwell_like": bool(resid_M is not None and resid_M < 0.10),
        "kappa_REM": kappa_REM,
        "c_identity": cI,
        "residual_identity": resid_I,
        "identity_like": bool(resid_I < 0.10),
        "gen_err": gen_err,
        "pred_minus_1_over_12": -1.0 / 12.0,
        "rel_lmin_to_minus_1_12": float(abs(evP.min() + 1.0 / 12.0) / (1.0 / 12.0)),
        "rel_lmax_to_minus_1_12": float(abs(evP.max() + 1.0 / 12.0) / (1.0 / 12.0)),
    }


def hess_trans(omega, trans, eps):
    nT = trans.shape[1]
    nE = trans.shape[0]
    H = np.zeros((nT, nT))
    z = np.zeros(nE)
    om0 = omega(z)
    for i in range(nT):
        A = eps * trans[:, i]
        H[i, i] = (omega(A) + omega(-A) - 2.0 * om0) / (eps * eps)
    for i in range(nT):
        for j in range(i + 1, nT):
            Ap = eps * (trans[:, i] + trans[:, j])
            Am = eps * (trans[:, i] - trans[:, j])
            H[i, j] = H[j, i] = (omega(Ap) + omega(-Ap) - omega(Am) - omega(-Am)) / (4.0 * eps * eps)
    return 0.5 * (H + H.T)


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    unit = pts / np.linalg.norm(pts, axis=1, keepdims=True)
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((f[a], f[(a + 1) % m]))))
    edges = sorted(raw)
    nE = len(edges)
    assert nE == 30

    hat = np.asarray(HAT25, float)
    hat = hat / np.linalg.norm(hat)
    D12 = pairing_spatial(EVEN_FRAME, R25 * hat, edges)
    D13 = np.zeros((13, 13))
    D13[:12, :12] = D12
    Dspin = np.kron(pairing_spatial(EVEN_FRAME, R33 * hat, edges), EPS)
    Uij = [su2_transport(unit[i], unit[j]) for i, j in edges]

    # transverse basis and Δ1
    b1 = np.zeros((12, nE))
    for e, (i, j) in enumerate(edges):
        b1[i, e] = -1.0
        b1[j, e] = 1.0
    _, s, vh = np.linalg.svd(b1, full_matrices=True)
    rank = int(np.sum(s > 1e-10))
    trans = vh[rank:].T
    nT = trans.shape[1]
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
    lam_min_D1T = float(eigvalsh(0.5 * (D1T + D1T.T)).min())

    sectors = {
        "graph_paired": {
            "K": lambda A: magnetic_K(edges, A, shift=0.0),
            "D": D12,
            "note": "primary: 12-component H13, graph K, even pairing at r_*",
            "primary": True,
        },
        "hodge12_paired": {
            "K": lambda A: magnetic_K(edges, A, shift=1.0),
            "D": D12,
            "note": "Hodge Λ = K+I with Peierls, same pairing; alternative kinetic not added",
            "primary": False,
        },
        "hodge13_paired": {
            "K": lambda A: magnetic_H13(edges, A),
            "D": D13,
            "note": "13-site geometric Hodge, spokes unphased, pairing padded; diagnostic",
            "primary": False,
        },
        "spinor_paired": {
            "K": lambda A: magnetic_spin(edges, A, Uij),
            "D": Dspin,
            "note": "vertex12⊗2 spinor lift at r_33; alternative completion not added",
            "primary": False,
        },
    }

    A0 = np.zeros(nE)
    Api = np.full(nE, np.pi)
    EPS_H = 0.02

    results_sectors = {}
    for sname, sec in sectors.items():
        print(f"sector {sname}...", flush=True)
        rec = {"note": sec["note"], "primary": sec["primary"]}
        for Tname, T in [("Teta", T_KMS), ("T0", 0.0)]:
            def omega(A, _K=sec["K"], _D=sec["D"], _T=T):
                return Fabs(bdg_pos(_K(A), _D), _T)

            om0 = omega(A0)
            ompi = omega(Api)
            print(f"  Hessian {Tname}...", flush=True)
            HT = hess_trans(omega, trans, EPS_H)
            anal = analyse_PiT(HT, D1T)
            rec[Tname] = {
                "omega_A0": om0,
                "omega_Api": ompi,
                "delta_omega_pi_minus_0": ompi - om0,
                "pi_lower_than_zero": bool(ompi < om0 - 1e-10),
                "Emin_A0": float(bdg_pos(sec["K"](A0), sec["D"]).min()),
                "Emin_Api": float(bdg_pos(sec["K"](Api), sec["D"]).min()),
                "Pi": anal,
                "A0_transversely_unstable": bool(anal["lambda_min_PiT"] < -1e-8),
            }
        # eps consistency at T=0
        def omega_T0(A, _K=sec["K"], _D=sec["D"]):
            return Fabs(bdg_pos(_K(A), _D), 0.0)
        H5 = hess_trans(omega_T0, trans, 0.05)
        rec["T0_eps0.05_lmin"] = float(eigvalsh(0.5 * (H5 + H5.T)).min())
        rec["T0_eps_rel_diff"] = abs(rec["T0_eps0.05_lmin"] - rec["T0"]["Pi"]["lambda_min_PiT"]) / max(
            abs(rec["T0"]["Pi"]["lambda_min_PiT"]), 1e-12)
        results_sectors[sname] = rec

    # sector inventory (S7, S8)
    inventory = {
        "other_solids_contribute": False,
        "other_solids_reason": (
            "alt_cycle27 found no unique derived hopping from the other four solids "
            "onto the 12 icosahedral vertices; those 60 edges are not charged under this A."
        ),
        "history_clock_contribute": False,
        "history_clock_reason": (
            "H64 and the 24-clock are not established charged fermions coupled to the "
            "30-edge geometric U(1). Commits d71974d..6bad7b3 treat uniform-charge H64 "
            "Weyl pairing as conditional and infer no new transverse Maxwell term. "
            "No H64-to-A current is invented."
        ),
        "sectors_not_summed": (
            "graph, Hodge Λ = K+I, 13-site Hodge, and the spinor lift are alternative "
            "descriptions / completions of the same 12 vertices, not independent species."
        ),
    }

    primary = results_sectors["graph_paired"]
    # vacuum of primary
    vac = {
        "name": None,
        "reason": None,
    }
    if primary["T0"]["A0_transversely_unstable"] and primary["T0"]["pi_lower_than_zero"]:
        vac["name"] = "pi_flux"
        vac["reason"] = (
            "Primary Π_T has a negative eigenvalue at T=0 and the full Ω_matter "
            "is lower at the all-π connection than at A=0; no external Maxwell term."
        )
    elif (not primary["T0"]["A0_transversely_unstable"]) and (not primary["T0"]["pi_lower_than_zero"]):
        vac["name"] = "A0_or_small"
        vac["reason"] = "Primary Π_T is non-negative at T=0 and Ω(π) is not below Ω(0)."
    else:
        vac["name"] = "mixed"
        vac["reason"] = (
            f"unstable={primary['T0']['A0_transversely_unstable']}, "
            f"pi_lower={primary['T0']['pi_lower_than_zero']}"
        )

    H = {
        "H1_T0_primary_near_minus_1_over_12": bool(
            primary["T0"]["Pi"]["identity_like"]
            and primary["T0"]["Pi"]["rel_lmin_to_minus_1_12"] < 0.15
        ),
        "H1_T0_primary_not_maxwell_like": (not primary["T0"]["Pi"]["maxwell_like"]),
        "H1_T0_primary_not_unique_positive_kappa": (
            not (primary["T0"]["Pi"]["kappa_unique"] and primary["T0"]["Pi"]["kappa_all_positive"])
        ),
        "H2_Teta_unpaired_does_not_set_I": (not (
            primary["Teta"]["Pi"]["identity_like"]
            and primary["Teta"]["Pi"]["rel_lmin_to_minus_1_12"] < 0.15
        )),
        "H3_primary_selects_pi_flux": bool(vac["name"] == "pi_flux"),
        "H3_hodge12_same_T0_sign": bool(
            results_sectors["hodge12_paired"]["T0"]["A0_transversely_unstable"]
            == primary["T0"]["A0_transversely_unstable"]
        ),
    }

    results = {
        "arena": {
            "n_edges": nE,
            "n_transverse": nT,
            "lambda_min_Delta1_T": lam_min_D1T,
            "r_star_graph": R25,
            "r_star_spinor": R33,
            "hessian_eps": EPS_H,
            "kappa_ext": 0.0,
        },
        "inventory": inventory,
        "sectors": results_sectors,
        "derived_vacuum": vac,
        "hypotheses": H,
    }
    if H["H3_primary_selects_pi_flux"] and H["H1_T0_primary_not_unique_positive_kappa"]:
        results["classification"] = "PROVED"
        results["classification_note"] = (
            "The primary induced Π is finite and is not a unique positive Maxwell "
            "term; with no external Maxwell the condensed phase sits in the π-flux vacuum."
        )
    else:
        results["classification"] = "CONDITIONAL"
        results["classification_note"] = "See hypotheses and per-sector Pi records."

    out = ROOT / "alt_cycle34_induced_kappa" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    # compact stdout
    summary = {
        "classification": results["classification"],
        "H": H,
        "vacuum": vac,
        "per_sector": {
            name: {
                t: {
                    "dOmega_pi": rec[t]["delta_omega_pi_minus_0"],
                    "Emin0": rec[t]["Emin_A0"],
                    "Eminpi": rec[t]["Emin_Api"],
                    "lmin": rec[t]["Pi"]["lambda_min_PiT"],
                    "lmax": rec[t]["Pi"]["lambda_max_PiT"],
                    "n_neg": rec[t]["Pi"]["n_neg"],
                    "n_pos": rec[t]["Pi"]["n_pos"],
                    "k_iso": rec[t]["Pi"]["kappa_iso"],
                    "k_REM": rec[t]["Pi"]["kappa_REM"],
                    "k_spread": rec[t]["Pi"]["kappa_gen_spread"],
                    "k_minmax": rec[t]["Pi"]["kappa_gen_minmax"],
                    "resid_M": rec[t]["Pi"]["residual_maxwell"],
                    "resid_I": rec[t]["Pi"]["residual_identity"],
                    "maxwell_like": rec[t]["Pi"]["maxwell_like"],
                    "identity_like": rec[t]["Pi"]["identity_like"],
                    "rel_m1_12": rec[t]["Pi"]["rel_lmin_to_minus_1_12"],
                }
                for t in ("Teta", "T0")
            } | {"eps_rel": rec["T0_eps_rel_diff"]}
            for name, rec in results_sectors.items()
        },
    }
    print(json.dumps(jsonable(summary), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
