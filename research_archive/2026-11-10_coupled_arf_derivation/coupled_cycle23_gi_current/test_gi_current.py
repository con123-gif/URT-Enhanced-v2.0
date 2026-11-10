#!/usr/bin/env python3
"""Coupled cycle 23: gauge-invariant current response, WI, Meissner vs alt29."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle23_gi_current")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402

PRED_SHA = "5cf25d9603ef57dd580f80eb8e4f2dd398ce8d5fde6f6a3ed18dd85d82bfdefb"
EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_GEOM = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_GEOM)
Q = 1.0


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


def pairing_matrix(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def magnetic_laplacian(edges, A, q=Q):
    n = 12
    K = np.zeros((n, n), dtype=complex)
    deg = np.zeros(n)
    for e, (i, j) in enumerate(edges):
        deg[i] += 1.0
        deg[j] += 1.0
        u = np.exp(1j * q * A[e])
        K[j, i] -= u
        K[i, j] -= np.conj(u)
    for i in range(n):
        K[i, i] += deg[i]
    return K


def dress_delta(Delta0, theta):
    th = np.asarray(theta, dtype=float)
    phase = np.exp(1j * th)
    # Δ_ij -> Δ_ij exp(i(θ_i+θ_j)) = Δ_ij * phase_i * phase_j
    return Delta0 * np.outer(phase, phase)


def bdg_spectrum(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n), dtype=complex)
    H[:n, :n] = K
    H[n:, n:] = -np.conj(K)
    H[:n, n:] = Delta
    H[n:, :n] = np.conj(np.asarray(Delta).T)
    return eigvalsh(H)


def log2cosh(z):
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


def fermion_omega_from_ev(ev, ev0, T):
    n = ev.size // 2
    pos = np.maximum(ev[n:], 0.0)
    pos0 = np.maximum(ev0[n:], 0.0)
    if T <= 0:
        return -0.5 * (np.sum(pos) - np.sum(pos0))
    return -T * np.sum(log2cosh(pos / (2.0 * T))) + T * np.sum(log2cosh(pos0 / (2.0 * T)))


def incidence(edges):
    """d0: (nE, 12) with (d0 λ)_e = λ_j - λ_i on edge (i,j)."""
    nE = len(edges)
    d0 = np.zeros((nE, 12))
    for e, (i, j) in enumerate(edges):
        d0[e, i] = -1.0
        d0[e, j] = 1.0
    return d0


def cycle_basis(d0):
    # left nullspace of d0^T is ker(d0^T) = cycles? 
    # d0 is nE x 12, image of d0 is exact 1-forms.
    # SVD of d0.T (12 x nE): vh[rank:] are cycles (right nullspace of d0.T = ker d0.T)
    # Wait: d0.T is 12 x 30 (the boundary b1 of alt29).
    # alt29: b1[i,e]=-1, b1[j,e]=+1 so b1 = d0.T
    # svd(b1): trans = vh[rank:].T  — columns of trans span ker(b1) = ker(d0.T) = cycles
    b1 = d0.T
    _, s, vh = svd(b1, full_matrices=True)
    rank = int(np.sum(s > 1e-10))
    trans = vh[rank:].T
    return trans, rank


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
    nE = len(edges)
    assert nE == 30
    d0 = incidence(edges)
    trans, rank_d0 = cycle_basis(d0)
    nT = trans.shape[1]
    assert nT == 19 and rank_d0 == 11

    c18 = json.loads((ROOT / "coupled_cycle18_nambu_measure" / "results.json").read_text())
    hat = np.asarray(c18["even_hat"], dtype=float)
    hat = hat / np.linalg.norm(hat)
    Delta_unit = pairing_matrix(EVEN_FRAME, hat, edges)

    def pack(r):
        return r * Delta_unit

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "eta": ETA,
        "n_cycle": nT,
        "rank_d0": rank_d0,
        "points": {},
    }

    rng = np.random.default_rng(23)

    def analyze(r, T, tag, eps_trans=3e-3, n_lam=8):
        Delta0 = pack(r)
        K0 = magnetic_laplacian(edges, np.zeros(nE))
        ev00 = bdg_spectrum(K0, Delta0)

        def omega(A, theta):
            KA = magnetic_laplacian(edges, A)
            D = dress_delta(Delta0, theta)
            ev = bdg_spectrum(KA, D)
            return fermion_omega_from_ev(ev, ev00, T)

        # (1) alt29 truncation: frozen real Δ, A only in K  -- same as omega(A, 0)
        Htr = np.zeros((nT, nT))
        om0 = omega(np.zeros(nE), np.zeros(12))
        for i in range(nT):
            A = eps_trans * trans[:, i]
            Htr[i, i] = (omega(A, np.zeros(12)) + omega(-A, np.zeros(12)) - 2.0 * om0) / (
                eps_trans ** 2
            )
        for i in range(nT):
            for j in range(i + 1, nT):
                Ap = eps_trans * (trans[:, i] + trans[:, j])
                Am = eps_trans * (trans[:, i] - trans[:, j])
                val = (
                    omega(Ap, np.zeros(12))
                    + omega(-Ap, np.zeros(12))
                    - omega(Am, np.zeros(12))
                    - omega(-Am, np.zeros(12))
                ) / (4.0 * eps_trans ** 2)
                Htr[i, j] = Htr[j, i] = val
        Htr = 0.5 * (Htr + Htr.T)
        ev_tr = eigvalsh(Htr)

        # (2) gauge invariance Ω(dλ, −λ) = Ω(0,0)
        gi_res = []
        wi_hess = []
        wi_grad = []
        for _ in range(n_lam):
            lam = rng.normal(size=12)
            lam = lam - lam.mean()  # drop global piece for a nontrivial A
            if np.linalg.norm(lam) < 1e-12:
                continue
            # magnetic_laplacian convention: A_e → A_e + λ_i − λ_j
            # equals −(d0 λ)_e, since (d0 λ)_e = λ_j − λ_i.
            A = -(d0 @ lam)
            th = -lam
            gi_res.append(abs(omega(A, th) - om0))
            A0 = 0.02 * rng.normal(size=nE)
            th0 = 0.02 * rng.normal(size=12)
            gi_res.append(abs(omega(A0 + A, th0 + th) - omega(A0, th0)))
        # Hessian WI: second deriv along (dλ, −λ)
        eps_g = 3e-3
        for _ in range(n_lam):
            lam = rng.normal(size=12)
            lam = lam - lam.mean()
            nrm = np.linalg.norm(lam)
            if nrm < 1e-12:
                continue
            lam = lam / nrm
            A = -(d0 @ lam)
            th = -lam
            hess = (omega(eps_g * A, eps_g * th) + omega(-eps_g * A, -eps_g * th) - 2.0 * om0) / (
                eps_g ** 2
            )
            wi_hess.append(hess)
            grad = (omega(eps_g * A, eps_g * th) - omega(-eps_g * A, -eps_g * th)) / (2.0 * eps_g)
            wi_grad.append(grad)
        # Also compare frozen-Δ exact-A curvature (the gauge artefact)
        artefact = []
        for _ in range(4):
            lam = rng.normal(size=12)
            lam = lam - lam.mean()
            lam = lam / np.linalg.norm(lam)
            A = -(d0 @ lam)
            art = (omega(eps_g * A, np.zeros(12)) + omega(-eps_g * A, np.zeros(12)) - 2.0 * om0) / (
                eps_g ** 2
            )
            compensated = (
                omega(eps_g * A, -eps_g * lam) + omega(-eps_g * A, eps_g * lam) - 2.0 * om0
            ) / (eps_g ** 2)
            artefact.append({"frozen_Delta_exact_curvature": art, "compensated": compensated})

        rec = {
            "r": r,
            "T": T,
            "omega_0": float(om0),
            "transverse_eigenvalues_minmax": [float(ev_tr.min()), float(ev_tr.max())],
            "transverse_n_negative": int(np.sum(ev_tr < -1e-10)),
            "transverse_n_positive": int(np.sum(ev_tr > 1e-10)),
            "transverse_n_near_zero": int(np.sum(np.abs(ev_tr) <= 1e-10)),
            "transverse_positive_definite": bool(ev_tr.min() > 1e-10),
            "gauge_invariance_max_residual": float(max(gi_res) if gi_res else 0.0),
            "WI_hessian_max_abs": float(max(np.abs(wi_hess)) if wi_hess else 0.0),
            "WI_gradient_max_abs": float(max(np.abs(wi_grad)) if wi_grad else 0.0),
            "exact_A_frozen_vs_compensated": artefact,
            "transverse_eigenvalues": ev_tr.tolist(),
        }
        return rec

    # r=20, T=η  (alt29 comparison) — slightly looser eps matching alt29's 3e-4 at r=20
    rec_20_eta = analyze(20.0, ETA, "r20_Teta", eps_trans=3e-4, n_lam=6)
    rec_20_T0 = analyze(20.0, 0.0, "r20_T0", eps_trans=3e-4, n_lam=6)
    rec_100_eta = analyze(100.0, ETA, "r100_Teta", eps_trans=2e-3, n_lam=4)
    rec_100_T0 = analyze(100.0, 0.0, "r100_T0", eps_trans=2e-3, n_lam=4)

    gi_ok = all(
        rec["gauge_invariance_max_residual"] < 1e-8
        for rec in (rec_20_eta, rec_20_T0, rec_100_eta, rec_100_T0)
    )
    wi_ok = all(
        rec["WI_hessian_max_abs"] < 1e-6 and rec["WI_gradient_max_abs"] < 1e-7
        for rec in (rec_20_eta, rec_20_T0, rec_100_eta, rec_100_T0)
    )
    # sign structure vs alt29: at r=20 T=η expect some negative; T=0 all/mostly negative
    alt29_like_Teta = bool(rec_20_eta["transverse_n_negative"] >= 1 and rec_20_eta["transverse_n_positive"] >= 1)
    alt29_like_T0 = bool(rec_20_T0["transverse_n_negative"] >= 1 and not rec_20_T0["transverse_positive_definite"])
    trans_agrees_alt29_sign = bool(alt29_like_Teta and alt29_like_T0)
    meissner = all(
        rec["transverse_positive_definite"]
        for rec in (rec_20_eta, rec_20_T0, rec_100_eta, rec_100_T0)
    )

    if gi_ok and wi_ok and trans_agrees_alt29_sign and not meissner:
        reconciliation = (
            "alt29 was not missing Nambu-Gor'kov vertices (they sit inside the "
            "BdG determinant) and was not missing the Goldstone in the transverse "
            "sector (unitary gauge). It was missing Goldstone compensation along "
            "exact A = dλ, which is a gauge artefact. The non-positive transverse "
            "kernel is the genuine one-loop result of the archived action."
        )
        h3 = "FALSIFIED"
    elif meissner and gi_ok:
        reconciliation = (
            "The gauge-invariant transverse kernel is positive definite, unlike "
            "alt29's truncation; alt29 was missing a term that this cycle included."
        )
        h3 = "PROVED"
    else:
        reconciliation = (
            "See residuals: gi_ok=%s wi_ok=%s trans_agrees_alt29_sign=%s meissner=%s"
            % (gi_ok, wi_ok, trans_agrees_alt29_sign, meissner)
        )
        h3 = "CONDITIONAL"

    results["points"] = {
        "r20_Teta": rec_20_eta,
        "r20_T0": rec_20_T0,
        "r100_Teta": rec_100_eta,
        "r100_T0": rec_100_T0,
    }
    results.update({
        "gauge_invariance_holds": gi_ok,
        "longitudinal_WI_holds": wi_ok,
        "transverse_sign_agrees_with_alt29": trans_agrees_alt29_sign,
        "Meissner_positive_definite": meissner,
        "reconciliation": reconciliation,
        "H3_Meissner_of_archived_oneloop": h3,
        "classification": "PROVED" if (gi_ok and wi_ok) else "CONDITIONAL",
        "classification_note": reconciliation,
        "advances_physical_ARF": False,
        "R_alpha_compared": False,
    })
    # drop full 19-vector lists from the printed summary; keep them in the file
    (OUT / "results.json").write_text(json.dumps(sanitize(results), indent=2) + "\n")
    summary = {
        "classification": results["classification"],
        "gi_ok": gi_ok,
        "wi_ok": wi_ok,
        "meissner": meissner,
        "trans_agrees_alt29_sign": trans_agrees_alt29_sign,
        "h3": h3,
        "reconciliation": reconciliation,
    }
    for k, rec in results["points"].items():
        summary[k] = {
            kk: rec[kk]
            for kk in rec
            if kk not in ("transverse_eigenvalues", "exact_A_frozen_vs_compensated")
        }
        summary[k]["n_artefact_samples"] = len(rec["exact_A_frozen_vs_compensated"])
        summary[k]["artefact_mean_frozen"] = float(
            np.mean([a["frozen_Delta_exact_curvature"] for a in rec["exact_A_frozen_vs_compensated"]])
        )
        summary[k]["artefact_mean_compensated"] = float(
            np.mean([a["compensated"] for a in rec["exact_A_frozen_vs_compensated"]])
        )
    print(json.dumps(sanitize(summary), indent=2))


if __name__ == "__main__":
    main()
