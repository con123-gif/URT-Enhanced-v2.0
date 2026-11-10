#!/usr/bin/env python3
"""Coupled cycle 36: spinor-lifted subcritical kernel at T=η (r=0)."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle36_spinor_subcritical")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle25_piflux_kernel"))
import test_piflux_kernel as c25  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle26_spinor_piflux_kernel"))
import test_spinor_piflux_kernel as c26  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle29_momentum_expansion"))
import test_momentum_expansion as c29  # noqa: E402

PRED_SHA = "03eac6f6444a6f99bfc9c8ab5ead7a8ab52a3a854cbef53973c12e9861cf2b66"
ETA = c25.ETA


def sanitize(o):
    return c25.sanitize(o)


def group_ev(ev, atol=1e-7):
    ev = np.sort(np.asarray(ev, dtype=float).real)
    out = []
    for x in ev:
        if out and abs(x - out[-1][0]) <= atol:
            out[-1][1] += 1
            out[-1][0] = (out[-1][0] * (out[-1][1] - 1) + x) / out[-1][1]
        else:
            out.append([float(x), 1])
    return [{"value": a, "mult": b} for a, b in out]


def omega_from_eigs(ev, ev_ref, T):
    pos = np.maximum(np.asarray(ev, dtype=float).real, 0.0)
    pos0 = np.maximum(np.asarray(ev_ref, dtype=float).real, 0.0)
    return c25.fermion_omega(pos, pos0, T)


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
    assert trans.shape[1] == 19 and rank == 11
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

    A0 = np.zeros(nE)
    Api = np.full(nE, np.pi)
    ev0 = eigvalsh(c26.magnetic_spin(edges, A0, Uij)).real
    evpi = eigvalsh(c26.magnetic_spin(edges, Api, Uij)).real

    rng = np.random.default_rng(36)
    probe_As = [A0, Api]
    for _ in range(24):
        probe_As.append(rng.uniform(0.0, 2.0 * np.pi, size=nE))
    for _ in range(4):
        lam = rng.normal(size=12)
        lam = lam - lam.mean()
        probe_As.append(-(d0 @ lam))

    traces, lmins, t0_oms = [], [], []
    tr0 = float(np.sum(ev0))
    for A in probe_As:
        ev = eigvalsh(c26.magnetic_spin(edges, A, Uij)).real
        traces.append(float(np.sum(ev)))
        lmins.append(float(ev.min()))
        t0_oms.append(omega_from_eigs(ev, ev0, 0.0))
    tr_resid = float(max(abs(t - tr0) for t in traces))
    lmin_min = float(min(lmins))
    t0_om_max = float(max(abs(x) for x in t0_oms))
    t0_flat = bool(t0_om_max < 1e-12 and lmin_min > -1e-12 and tr_resid < 1e-10)

    def omega_T(A, T):
        ev = eigvalsh(c26.magnetic_spin(edges, A, Uij)).real
        return omega_from_eigs(ev, ev0, T)

    om_eta_0 = float(omega_T(A0, ETA))
    om_eta_pi = float(omega_T(Api, ETA))
    dOmega = float(om_eta_pi - om_eta_0)
    random_dO = []
    for _ in range(40):
        A = rng.uniform(0.0, 2.0 * np.pi, size=nE)
        random_dO.append(float(omega_T(A, ETA) - om_eta_0))
    random_dO = np.asarray(random_dO)
    grad_resid = []
    for _ in range(8):
        lam = rng.normal(size=12)
        lam = lam - lam.mean()
        A = -(d0 @ lam)
        grad_resid.append(abs(omega_T(A0 + A, ETA) - om_eta_0))
        A_rand = rng.uniform(0.0, 2.0 * np.pi, size=nE)
        grad_resid.append(abs(omega_T(A_rand + A, ETA) - omega_T(A_rand, ETA)))

    a0_min = bool(dOmega > 1e-14 and random_dO.min() > -1e-12)
    api_min = bool(dOmega < -1e-14 and (random_dO.min() + 1e-12) >= dOmega)
    if a0_min:
        derived_vacuum, A_vac, vac_tag = "A=0", A0, "A0"
    elif api_min:
        derived_vacuum, A_vac, vac_tag = "A=pi", Api, "Api"
    else:
        derived_vacuum = "undetermined"
        A_vac, vac_tag = (Api, "Api") if dOmega < 0 else (A0, "A0")

    def make_omega_A(T, A_bg):
        ev_bg = eigvalsh(c26.magnetic_spin(edges, A_bg, Uij)).real

        def omega_A(A):
            ev = eigvalsh(c26.magnetic_spin(edges, A, Uij)).real
            return omega_from_eigs(ev, ev_bg, T)

        return omega_A

    points = {}
    configs = [
        ("A0_T0", A0, 0.0, 0.02),
        ("Api_T0", Api, 0.0, 0.02),
        ("A0_Teta", A0, ETA, 0.02),
        ("Api_Teta", Api, ETA, 0.02),
        ("A0_Teta_eps05", A0, ETA, 0.05),
        ("Api_Teta_eps05", Api, ETA, 0.05),
    ]
    print("cycle 36 Hessians...", flush=True)
    for tag, A_bg, T, eps in configs:
        print(f"  {tag}", flush=True)
        omega_A = make_omega_A(T, A_bg)
        HT, om0 = c25.hess_trans_bg(omega_A, trans, eps, A_bg)
        anal = c25.analyse_PiT(HT, D1T)
        desc = c29.describe(HT, D1T)
        wi_hess, wi_val = [], []
        ev_bg = eigvalsh(c26.magnetic_spin(edges, A_bg, Uij)).real
        for _ in range(6):
            lam = rng.normal(size=12)
            lam = lam - lam.mean()
            nrm = np.linalg.norm(lam)
            if nrm < 1e-12:
                continue
            lam = lam / nrm
            A = -(d0 @ lam)
            evp = eigvalsh(c26.magnetic_spin(edges, A_bg + A, Uij)).real
            wi_val.append(abs(omega_from_eigs(evp, ev_bg, T)))
            eps_g = 3e-3
            omp = omega_A(A_bg + eps_g * A)
            omm = omega_A(A_bg - eps_g * A)
            omc = omega_A(A_bg)
            wi_hess.append((omp + omm - 2.0 * omc) / (eps_g ** 2))
        points[tag] = {
            "T": T,
            "eps": eps,
            "Pi_max_abs": float(np.max(np.abs(HT))),
            "gauge_invariance_max_residual": float(max(wi_val) if wi_val else 0.0),
            "WI_hessian_max_abs": float(max(np.abs(wi_hess)) if wi_hess else 0.0),
            "Pi": anal,
            "projection": desc,
        }

    vac_key = "A0_Teta" if vac_tag == "A0" else "Api_Teta"
    vac_Pi = points[vac_key]["Pi"]
    vac_proj = points[vac_key]["projection"]
    t0_ker_ok = bool(
        points["A0_T0"]["Pi_max_abs"] < 5e-10 and points["Api_T0"]["Pi_max_abs"] < 5e-10
    )
    gi_ok = all(
        points[k]["gauge_invariance_max_residual"] < 1e-8
        and points[k]["WI_hessian_max_abs"] < 1e-6
        for k in ("A0_T0", "Api_T0", "A0_Teta", "Api_Teta")
    )

    H1 = bool(t0_flat and t0_ker_ok)
    H2 = bool(derived_vacuum in ("A=0", "A=pi"))
    H3 = bool(gi_ok and ev0.min() > 0.1)
    H4 = True  # cycle 35 found no unique rule; no comparison
    comparison = {
        "performed": False,
        "reason": (
            "cycle 35 found no unique archive rule mapping Π_T to κ_IR; "
            "α_eff is not compared"
        ),
    }

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "eta": ETA,
        "spectra": {
            "A0_Emin": float(ev0.min()),
            "A0_grouped": group_ev(ev0),
            "Api_Emin": float(evpi.min()),
            "Api_grouped": group_ev(evpi),
            "pred_A0_gap": 0.746746,
            "rel_A0_gap": float(abs(ev0.min() - 0.746746) / 0.746746),
            "n_modes": int(ev0.size),
        },
        "T0_flatness": {
            "Tr_A0": tr0,
            "max_abs_Tr_minus_Tr0": tr_resid,
            "min_eigenvalue": lmin_min,
            "max_abs_Omega_T0": t0_om_max,
            "Omega_T0_flat": t0_flat,
            "Pi_max_abs_A0": points["A0_T0"]["Pi_max_abs"],
            "Pi_max_abs_Api": points["Api_T0"]["Pi_max_abs"],
            "kernel_vanishes": t0_ker_ok,
        },
        "invariants": {
            "TrK_A0": float(np.sum(ev0)),
            "TrK_Api": float(np.sum(evpi)),
            "TrK2_A0": float(np.sum(ev0 ** 2)),
            "TrK2_Api": float(np.sum(evpi ** 2)),
            "TrK4_A0": float(np.sum(ev0 ** 4)),
            "TrK4_Api": float(np.sum(evpi ** 4)),
        },
        "Teta_flux": {
            "Omega_A0": om_eta_0,
            "Omega_Api": om_eta_pi,
            "dOmega_pi_minus_0": dOmega,
            "random_dOmega_min": float(random_dO.min()),
            "random_dOmega_max": float(random_dO.max()),
            "random_dOmega_mean": float(random_dO.mean()),
            "gradient_max_residual": float(max(grad_resid)),
            "A0_is_min_among_tested": a0_min,
            "Api_is_min_among_tested": api_min,
            "derived_vacuum": derived_vacuum,
            "vacuum_used_for_kernel": vac_tag,
        },
        "points": points,
        "derived_vacuum_kernel": {
            "tag": vac_key,
            "usable_derived_kappa": bool(vac_Pi["usable_derived_kappa"]),
            "Pi": vac_Pi,
            "projection": vac_proj,
        },
        "alpha_comparison": comparison,
        "gauge_invariance_ok": gi_ok,
        "hypotheses": {
            "H1_T0_flat": H1,
            "H2_definite_Teta_vacuum": H2,
            "H3_unbroken_gapped": H3,
            "H4_no_alpha_without_unique_rule": H4,
        },
        "cycle35_unique_rule": False,
        "not_duplicated": (
            "C3 metastable flux stability, C3 spinor spectrum and "
            "handedness were not computed"
        ),
    }
    out = OUT / "results.json"
    out.write_text(json.dumps(sanitize(results), indent=2))
    print("wrote", out)
    print("H1", H1, "H2", H2, "H3", H3, "H4", H4)
    print("derived vacuum", derived_vacuum, "dOmega", dOmega)
    print("Emin A0", ev0.min(), "Api", evpi.min())
    print(
        "vac Pi posdef", vac_Pi["positive_definite"],
        "maxwell", vac_Pi["maxwell_like"],
        "unique", vac_Pi["kappa_unique"],
        "cI", vac_Pi["c_identity"],
        "kiso", vac_Pi["kappa_iso"],
        "residM", vac_Pi["residual_maxwell"],
        "spread", vac_Pi["kappa_gen_spread"],
    )
    pr = vac_proj
    print("proj m2", pr["m2"], "k", pr["kappa"], "b", pr["beta"],
          "rho3", pr["rho_3"], "wm", pr["w_m"], "wk", pr["w_kappa"], "wb", pr["w_beta"])


if __name__ == "__main__":
    main()
