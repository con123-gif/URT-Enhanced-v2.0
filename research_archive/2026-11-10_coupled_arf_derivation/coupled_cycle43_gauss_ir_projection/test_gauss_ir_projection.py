#!/usr/bin/env python3
"""Coupled cycle 43: Hodge Gauss projector and projected subcritical Pi_T."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd
from scipy.linalg import eigh

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle43_gauss_ir_projection")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle25_piflux_kernel"))
import test_piflux_kernel as c25  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle29_momentum_expansion"))
import test_momentum_expansion as c29  # noqa: E402

PRED_SHA = "5ead2de0c68984e6dea1118f91029d2fa7d4dd815a429bc06f67d9fbdfcea147"
ETA = c25.ETA
EPS = 0.02
ATOL = 1e-10


def sanitize(o):
    return c25.sanitize(o)


def icosa_complex():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    points = np.asarray(ico["points"], dtype=float)
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    edges = sorted(raw)
    return points, faces, edges


def hodge_operators(nV, edges, faces):
    nE = len(edges)
    nF = len(faces)
    d0 = np.zeros((nE, nV))
    lookup = {x: i for i, x in enumerate(edges)}
    for e, (i, j) in enumerate(edges):
        d0[e, i] = -1.0
        d0[e, j] = 1.0
    d1 = np.zeros((nF, nE))
    for k, f in enumerate(faces):
        ff = list(f)
        m = len(ff)
        for a in range(m):
            i, j = int(ff[a]), int(ff[(a + 1) % m])
            key = (min(i, j), max(i, j))
            sign = 1.0 if i < j else -1.0
            d1[k, lookup[key]] = sign
    Delta0 = d0.T @ d0
    Delta1 = d0 @ d0.T + d1.T @ d1
    return d0, d1, Delta0, Delta1


def coexact_projector(d0, Delta0, atol=ATOL):
    ev, U = np.linalg.eigh(0.5 * (Delta0 + Delta0.T))
    inv = np.zeros_like(ev)
    n_zero = int(np.sum(np.abs(ev) <= atol))
    pos = np.abs(ev) > atol
    inv[pos] = 1.0 / ev[pos]
    Delta0_pinv = (U * inv) @ U.T
    nE = d0.shape[0]
    P_exact = d0 @ Delta0_pinv @ d0.T
    P_T_full = np.eye(nE) - P_exact
    P_T_full = 0.5 * (P_T_full + P_T_full.T)
    _, s, vh = svd(d0.T, full_matrices=True)
    rank = int(np.sum(s > atol))
    trans = vh[rank:].T
    return P_T_full, trans, Delta0_pinv, n_zero, rank


def magnetic_laplacian_gen(nV, edges, A):
    K = np.zeros((nV, nV), dtype=complex)
    deg = np.zeros(nV)
    for e, (i, j) in enumerate(edges):
        deg[i] += 1.0
        deg[j] += 1.0
        u = np.exp(1j * A[e])
        K[j, i] -= u
        K[i, j] -= np.conj(u)
    for i in range(nV):
        K[i, i] += deg[i]
    return 0.5 * (K + K.conj().T)


def f_prime(lam, T):
    return -0.5 * np.tanh(lam / (2.0 * T))


def f_second(lam, T):
    th = np.tanh(lam / (2.0 * T))
    return -0.25 / T * (1.0 - th * th)


def theta_matrix(ev, T, atol=ATOL):
    n = ev.size
    fp = f_prime(ev, T)
    fs = f_second(ev, T)
    th = np.zeros((n, n))
    for m in range(n):
        for n_ in range(n):
            dl = ev[m] - ev[n_]
            if abs(dl) <= atol:
                th[m, n_] = fs[m]
            else:
                th[m, n_] = (fp[m] - fp[n_]) / dl
    return th, fp


def spectral_edge_hessian(nV, edges, T):
    """Exact Hessian of Omega = sum f(lambda(K[A])) at A=0, edge basis."""
    nE = len(edges)
    A0 = np.zeros(nE)
    K = magnetic_laplacian_gen(nV, edges, A0).real
    ev, U = np.linalg.eigh(K)
    th, fp = theta_matrix(ev, T)
    # V^e matrix elements in the eigenbasis: (U^T V^e U)_{mn} = i (U_im U_jn - U_jm U_in)
    # store the real factor S^e_{mn} so V_el = i S
    S = np.zeros((nE, nV, nV))
    for e, (i, j) in enumerate(edges):
        # S_mn = U[i,m] U[j,n] - U[j,m] U[i,n]
        S[e] = np.outer(U[i], U[j]) - np.outer(U[j], U[i])
    # |u_m V^e u_n|^2 = S[e,m,n]^2; product for e,f: (i S^e_mn)(-i S^f_mn) wait
    # (u_m† V^e u_n)(u_n† V^f u_m) = (i S^e_mn) * conj(i S^f_mn) = (i S^e_mn)(-i S^f_mn)
    # = S^e_mn S^f_mn    since S is real (and S^f_nm = -S^f_mn, but u_n† V^f u_m = i S^f_nm = -i S^f_mn
    # u_m† V u_n = i S_mn
    # u_n† V u_m = i S_nm = -i S_mn = conj(i S_mn)
    # product_ef = (i S^e_mn)(-i S^f_mn) = S^e_mn S^f_mn
    Pi = np.zeros((nE, nE))
    # second-derivative term: tr(f'(K) W^e) on the diagonal
    # W^e = |i><j| + |j><i|, f'(K)_{ij} * 2
    fK = (U * fp) @ U.T  # f'(K) in vertex basis, real symmetric
    for e, (i, j) in enumerate(edges):
        Pi[e, e] += 2.0 * fK[i, j]
    # spectral sum: Pi[e,f] += sum_{mn} th[m,n] S[e,m,n] S[f,m,n]
    # reshape: for each (m,n), contrib is th[m,n] * S[:,m,n] outer S[:,m,n]
    Sflat = S.reshape(nE, nV * nV)
    w = th.reshape(nV * nV)
    Pi += (Sflat * w) @ Sflat.T
    return 0.5 * (Pi + Pi.T), ev, U


def omega_A_factory(nV, edges, T):
    A0 = np.zeros(len(edges))
    ev0 = eigvalsh(magnetic_laplacian_gen(nV, edges, A0)).real

    def omega_A(A):
        ev = eigvalsh(magnetic_laplacian_gen(nV, edges, np.asarray(A, dtype=float))).real
        pos = np.maximum(ev, 0.0)
        pos0 = np.maximum(ev0, 0.0)
        return c25.fermion_omega(pos, pos0, T)

    return omega_A


def main():
    points, faces, edges = icosa_complex()
    nV, nE, nF = 12, len(edges), len(faces)
    assert nE == 30 and nF == 20

    d0, d1, Delta0, Delta1 = hodge_operators(nV, edges, faces)
    # Betti via kernels
    ev0 = eigvalsh(0.5 * (Delta0 + Delta0.T))
    ev1 = eigvalsh(0.5 * (Delta1 + Delta1.T))
    b0 = int(np.sum(np.abs(ev0) <= ATOL))
    b1 = int(np.sum(np.abs(ev1) <= ATOL))
    # b2 from 2-form Laplacian d1 d1.T (ker has the constants on faces if consistent)
    L2 = d1 @ d1.T
    ev2 = eigvalsh(0.5 * (L2 + L2.T))
    b2 = int(np.sum(np.abs(ev2) <= ATOL))
    chi = b0 - b1 + b2

    P_T_full, trans, Delta0_pinv, n_zero0, rank_d0 = coexact_projector(d0, Delta0)
    nT = trans.shape[1]
    # Check P_T properties
    PT2 = P_T_full @ P_T_full
    pt_idem = float(np.linalg.norm(PT2 - P_T_full, "fro"))
    pt_sym = float(np.linalg.norm(P_T_full - P_T_full.T, "fro"))
    # trans columns are coexact and orthonormal
    trans_orth = float(np.linalg.norm(trans.T @ trans - np.eye(nT), "fro"))
    trans_coclosed = float(np.linalg.norm(d0.T @ trans, "fro"))
    # P_T_full trans = trans
    trans_fixed = float(np.linalg.norm(P_T_full @ trans - trans, "fro"))
    D1T = trans.T @ Delta1 @ trans
    D1T = 0.5 * (D1T + D1T.T)
    evD = eigvalsh(D1T)
    # d1 d0 = 0
    d2_id = float(np.linalg.norm(d1 @ d0, "fro"))

    hodge = {
        "nV": nV,
        "nE": nE,
        "nF": nF,
        "b0": b0,
        "b1": b1,
        "b2": b2,
        "chi": chi,
        "n_zero_Delta0": n_zero0,
        "rank_d0": int(rank_d0),
        "nT_coexact": int(nT),
        "pt_idempotent_resid": pt_idem,
        "pt_symmetric_resid": pt_sym,
        "trans_orthonormal_resid": trans_orth,
        "trans_coclosed_resid": trans_coclosed,
        "trans_PT_fixed_resid": trans_fixed,
        "d1_d0_resid": d2_id,
        "lambda_min_Delta1_T": float(evD.min()),
        "lambda_max_Delta1_T": float(evD.max()),
        "pred_lambda_min_3_minus_sqrt5": float(3.0 - np.sqrt(5.0)),
        "harmonic_1_forms": int(b1),
        "P_T_unique_hodge": bool(
            b0 == 1
            and b1 == 0
            and b2 == 1
            and nT == 19
            and rank_d0 == 11
            and evD.min() > 1e-8
            and pt_idem < 1e-10
            and trans_coclosed < 1e-10
        ),
    }

    # Current uniqueness at r=0 (structural, no new Yukawa)
    current = {
        "working_coupling": "Q_geo Peierls on the icosahedral 1-skeleton",
        "cycle31_U1_EM_unique": False,
        "pairing_currents_present_at_r0": False,
        "charge0_Noether_of_Hodge_ray": "unique (coupled cycle 10; alt cycle 02 ray)",
        "action_at_r0_depends_on": "magnetic Laplacian K[A] only",
        "H1_unique_on_working_Qgeo_at_r0": True,
        "H1_conditional_on_cycle31": True,
    }

    # Exact spectral Hessian and finite-difference cross-check
    Pi_edge, evK, UK = spectral_edge_hessian(nV, edges, ETA)
    PiT_exact = trans.T @ Pi_edge @ trans
    PiT_exact = 0.5 * (PiT_exact + PiT_exact.T)

    omega_A = omega_A_factory(nV, edges, ETA)
    A_bg = np.zeros(nE)
    PiT_fd, om0 = c25.hess_trans_bg(omega_A, trans, EPS, A_bg)

    # Transversality: exact directions
    ev_exact_test = []
    rng = np.random.default_rng(43)
    for _ in range(8):
        lam = rng.normal(size=nV)
        lam = lam - lam.mean()
        a_exact = d0 @ lam
        nrm = np.linalg.norm(a_exact)
        if nrm < 1e-14:
            continue
        a_exact = a_exact / nrm
        ev_exact_test.append(float(a_exact @ Pi_edge @ a_exact))
    transv_max = float(max(abs(x) for x in ev_exact_test)) if ev_exact_test else None

    def rel_or_abs(a, b, floor=1e-8):
        da = abs(a - b)
        den = max(abs(a), abs(b), floor)
        return float(da), float(da / den)

    anal_ex, desc_ex = None, None
    anal_ex = c25.analyse_PiT(PiT_exact, D1T)
    desc_ex = c29.describe(PiT_exact, D1T)
    anal_fd = c25.analyse_PiT(PiT_fd, D1T)
    desc_fd = c29.describe(PiT_fd, D1T)

    d_iso, r_iso = rel_or_abs(anal_ex["kappa_iso"], anal_fd["kappa_iso"])
    d_sp, r_sp = rel_or_abs(anal_ex["kappa_gen_spread"], anal_fd["kappa_gen_spread"])
    mat_diff = float(np.linalg.norm(PiT_exact - PiT_fd, "fro") / (np.linalg.norm(PiT_exact, "fro") + 1e-30))
    cross_ok = bool(
        (r_iso < 1e-4 or d_iso < 1e-8)
        and (r_sp < 1e-4 or d_sp < 1e-8)
    )

    unique = bool(anal_ex["kappa_unique"])
    positive = bool(anal_ex["kappa_all_positive"] and anal_ex["positive_definite"])
    maxwell = bool(anal_ex["maxwell_like"])
    gate = bool(
        current["H1_unique_on_working_Qgeo_at_r0"]
        and hodge["P_T_unique_hodge"]
        and unique
        and positive
    )

    out = {
        "pred_sha": PRED_SHA,
        "eta": ETA,
        "eps_fd": EPS,
        "hodge": hodge,
        "current": current,
        "transversality_max_exact_ray": transv_max,
        "transverse_Ward_ok": bool(transv_max is not None and transv_max < 1e-8),
        "omega0": float(om0),
        "crosscheck": {
            "kappa_iso_exact": anal_ex["kappa_iso"],
            "kappa_iso_fd": anal_fd["kappa_iso"],
            "abs_diff_kappa_iso": d_iso,
            "rel_diff_kappa_iso": r_iso,
            "spread_exact": anal_ex["kappa_gen_spread"],
            "spread_fd": anal_fd["kappa_gen_spread"],
            "abs_diff_spread": d_sp,
            "rel_diff_spread": r_sp,
            "matrix_rel_frob": mat_diff,
            "agree": cross_ok,
        },
        "PiT_exact_analyse": {k: v for k, v in anal_ex.items() if k != "eigenvalues"},
        "PiT_exact_eigenvalues": anal_ex["eigenvalues"],
        "PiT_exact_describe": desc_ex,
        "PiT_fd_analyse": {k: v for k, v in anal_fd.items() if k != "eigenvalues"},
        "PiT_fd_describe": desc_fd,
        "unique_positive_q2": bool(unique and positive),
        "maxwell_like": maxwell,
        "conversion_gate": gate,
        "alpha_eff_compared": False,
        "H1": True,
        "H2": bool(hodge["P_T_unique_hodge"]),
        "H3_unique_positive": bool(unique and positive),
        "H4_no_Kgamma_no_comparison": bool(not gate),
    }
    # drop bulky eigens if needed — already split
    (OUT / "results.json").write_text(json.dumps(sanitize(out), indent=2, sort_keys=True))
    print(json.dumps(sanitize({
        "hodge_P_T_unique": hodge["P_T_unique_hodge"],
        "b": (b0, b1, b2, chi),
        "nT": nT,
        "kappa_iso": anal_ex["kappa_iso"],
        "spread": anal_ex["kappa_gen_spread"],
        "resid_M": anal_ex["residual_maxwell"],
        "unique": unique,
        "positive": positive,
        "maxwell": maxwell,
        "gate": gate,
        "cross_ok": cross_ok,
        "transv_max": transv_max,
        "m2": desc_ex["m2"],
        "w_beta": desc_ex["w_beta"],
    }), indent=2))


if __name__ == "__main__":
    main()
