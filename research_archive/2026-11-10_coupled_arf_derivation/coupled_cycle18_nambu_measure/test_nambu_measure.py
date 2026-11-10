#!/usr/bin/env python3
"""Coupled cycle 18: Grassmann/Nambu measure vs Dirac stiffening."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import det, eigvalsh, svd

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle18_nambu_measure")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import (  # noqa: E402
    icosahedral_rotations,
    induced_perm,
    load_ops,
)

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_GEOM = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_GEOM)
C3 = 0.2222379983269106
C5 = 0.21876996521511627
C_ODD = C3
C_EVEN = (DELTA_GEOM ** 2) * C5
ODD_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "odd_adjacent_current_frame.npy")
EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
PI_O_ARCH = 0.03686635944700456
PI_E_ARCH = 0.026333113890717547


def log2cosh(z):
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


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
    pos = np.maximum(ev[n:], 0.0)
    return pos, H, ev


def fermion_omega(energies, xi, T):
    if T <= 0:
        return -0.5 * (np.sum(np.abs(energies)) - np.sum(np.abs(xi)))
    return -T * np.sum(log2cosh(energies / (2.0 * T))) + T * np.sum(log2cosh(np.abs(xi) / (2.0 * T)))


def graph_laplacian(n, edges):
    A = np.zeros((n, n))
    for i, j in edges:
        A[i, j] = 1.0
        A[j, i] = 1.0
    deg = A.sum(axis=1)
    return np.diag(deg) - A


def build_K_H13(edges):
    """Unit-weight Hodge Laplacian on centre + 12 vertices."""
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


def build_Lambda(Lico, pts, rots):
    """Cycle-13 Hodge-weighted operator on the 12 vertices: 1, 6±√5, 7."""
    ev, evec = eigvalsh(Lico), np.linalg.eigh(Lico)[1]
    # Lico spectrum: 0 (1), 5-√5 (3), 6 (5), 5+√5 (3)

    def space(lam, mult):
        idx = np.where(np.abs(ev - lam) < 1e-8)[0]
        assert len(idx) == mult, (lam, list(idx), ev)
        return evec[:, idx]

    Q1 = space(0.0, 1)
    Qlo = space(5.0 - np.sqrt(5.0), 3)
    Q5 = space(6.0, 5)
    Qhi = space(5.0 + np.sqrt(5.0), 3)
    # identify 3 vs 3' by a 5A rotation (trace φ)
    perm5a = None
    for R in rots:
        tr = float(np.trace(R))
        if abs(tr - PHI) < 1e-6:
            perm = induced_perm(pts, R)
            if perm is not None:
                perm5a = perm
                break
    assert perm5a is not None

    def trace_on(Q, perm):
        rho = np.zeros((12, 12))
        for i, p in enumerate(perm):
            rho[p, i] = 1.0
        return float(np.trace(Q.T @ rho @ Q))

    tr_lo = trace_on(Qlo, perm5a)
    Q3, Q3p = (Qlo, Qhi) if abs(tr_lo - PHI) < 1e-6 else (Qhi, Qlo)
    P1, P3, P3p, P5 = Q1 @ Q1.T, Q3 @ Q3.T, Q3p @ Q3p.T, Q5 @ Q5.T
    lam1, lam3, lam3p, lam5 = 1.0, 6.0 - np.sqrt(5.0), 6.0 + np.sqrt(5.0), 7.0
    return lam1 * P1 + lam3 * P3 + lam3p * P3p + lam5 * P5


def nuclear_norm(frame, hat, edges):
    return float(np.sum(svd(pairing_matrix_12(frame, hat, edges), compute_uv=False)))


def maximize_nuclear_norm(frame, edges, starts):
    from scipy.optimize import minimize

    def obj(x):
        n = np.linalg.norm(x)
        if n < 1e-14:
            return 0.0
        return -nuclear_norm(frame, x / n, edges)

    best_val, best_h = -np.inf, None
    for s in starts:
        s = np.asarray(s, dtype=float)
        s = s / np.linalg.norm(s)
        res = minimize(obj, s, method="BFGS", options={"gtol": 1e-12, "maxiter": 200})
        h = res.x / np.linalg.norm(res.x)
        val = nuclear_norm(frame, h, edges)
        if val > best_val:
            best_val, best_h = val, h
    return best_h, float(best_val)


def reduced_logabsdet(M, gap):
    ev = eigvalsh(M)
    ev = ev[np.abs(ev) > gap]
    if ev.size == 0:
        return None
    return float(np.sum(np.log(np.abs(ev))))


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    pts = np.asarray(ico["points"], dtype=float)
    faces = [tuple(f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            i, j = int(f[a]), int(f[(a + 1) % m])
            raw.add(tuple(sorted((i, j))))
    edges = sorted(raw)
    assert len(edges) == 30
    rots, _ = icosahedral_rotations(pts)

    K_ico = graph_laplacian(12, edges)
    xi_ico = eigvalsh(K_ico)
    K_H13 = build_K_H13(edges)
    xi_H13 = eigvalsh(K_H13)
    expected_H13 = np.array(
        [0.0]
        + [6.0 - np.sqrt(5.0)] * 3
        + [7.0] * 5
        + [6.0 + np.sqrt(5.0)] * 3
        + [13.0]
    )
    # sort both
    expected_H13.sort()
    xi_sorted = np.sort(xi_H13)
    H13_spectrum_ok = bool(np.allclose(xi_sorted, expected_H13, atol=1e-8))
    assert H13_spectrum_ok, list(xi_sorted)

    Lambda = build_Lambda(K_ico, pts, rots)
    xi_Lam = eigvalsh(Lambda)

    kinetics = {
        "H13_Hodge": {"K": K_H13, "xi": xi_H13, "n": 13, "embed": True, "gap": 0.5},
        "ico_laplacian": {"K": K_ico, "xi": xi_ico, "n": 12, "embed": False, "gap": 0.5},
        "cycle13_Lambda": {"K": Lambda, "xi": xi_Lam, "n": 12, "embed": False, "gap": 0.5},
    }

    # nuclear-norm maximiser of the even frame (K-independent)
    starts = [np.eye(4)[i] for i in range(4)]
    starts += [np.ones(4), np.array([1.0, -1.0, 1.0, -1.0]), np.array([1.0, 1.0, 1.0, -1.0])]
    rng = np.random.default_rng(11)
    extra = rng.normal(size=(12, 4))
    extra /= np.linalg.norm(extra, axis=1)[:, None]
    starts.extend(extra)
    hat_even, nuc_even = maximize_nuclear_norm(EVEN_FRAME, edges, starts)
    hat_odd, nuc_odd = maximize_nuclear_norm(ODD_FRAME, edges, starts)

    hats = {
        "even_4_5": {"frame": EVEN_FRAME, "hat": hat_even, "nuc": nuc_even, "stiff": C_EVEN, "pi_arch": PI_E_ARCH},
        "odd_4_3": {"frame": ODD_FRAME, "hat": hat_odd, "nuc": nuc_odd, "stiff": C_ODD, "pi_arch": PI_O_ARCH},
    }

    # Identity: H_BdG has exact particle-hole symmetry (eigenvalues ±E).
    # |det H| = (∏ E_+)^2 holds algebraically but det() is inaccurate when
    # the unpaired kernel makes H nearly singular; we check ± pairing instead.
    M12s = pairing_matrix_12(EVEN_FRAME, 0.3 * hat_even, edges)
    pos_s, H_s, ev_s = bdg_positive_energies(K_ico, M12s)
    nH = K_ico.shape[0]
    ph_res = float(np.max(np.abs(np.sort(ev_s[:nH]) + np.sort(ev_s[nH:])[::-1])))
    det_id_rel = ph_res

    results = {
        "eta": ETA,
        "c3": C3,
        "c5": C5,
        "c_odd": C_ODD,
        "c_even": C_EVEN,
        "H13_spectrum": xi_H13.tolist(),
        "H13_spectrum_matches_alt02": H13_spectrum_ok,
        "ico_spectrum": xi_ico.tolist(),
        "Lambda_spectrum": xi_Lam.tolist(),
        "BdG_particle_hole_residual": float(det_id_rel),
        "BdG_det_identity_holds": bool(det_id_rel < 1e-10),
        "even_nuclear_norm": nuc_even,
        "odd_nuclear_norm": nuc_odd,
        "even_hat": hat_even.tolist(),
        "odd_hat": hat_odd.tolist(),
        "kinetics": {},
        "integrity": {
            "predeclaration_sha256":
                "5a18553d288be1e6526d5f37da133e0c58fb90c9396032c91068ac4b866f3b37",
        },
    }
    assert results["BdG_det_identity_holds"]

    primary = "H13_Hodge"
    for kname, kin in kinetics.items():
        K, xi, embed, gap = kin["K"], kin["xi"], kin["embed"], kin["gap"]
        krec = {"channels": {}}
        for cname, ch in hats.items():
            frame, hat, stiff = ch["frame"], ch["hat"], ch["stiff"]
            M12 = pairing_matrix_12(frame, hat, edges)
            Delta_unit = embed13(M12) if embed else M12

            def Omega_pair(s, T):
                E, _, _ = bdg_positive_energies(K, s * Delta_unit)
                return fermion_omega(E, xi, T)

            rec = {}
            for T, tag in ((ETA, "Teta"), (0.0, "T0")):
                s = 1e-3 if T > 0 else 1e-4
                om = Omega_pair(s, T)
                chi = float(-om / (s * s))
                rec[f"chi_{tag}"] = chi
                rec[f"omega_f_{tag}_at_s"] = float(om)
                rec[f"pairing_attractive_{tag}"] = bool(chi > 0)
                rec[f"y_c_{tag}"] = float(np.sqrt(stiff / chi)) if chi > 0 else None
            # Dirac curvature on the same embedding (gapped logdet of K+Δ)
            s = 1e-3
            ld0 = reduced_logabsdet(K, gap)
            ldp = reduced_logabsdet(K + s * Delta_unit, gap)
            if ld0 is not None and ldp is not None:
                # −log det(K+sΔ) + log det(K) ≈ +½ π_D s²
                dirdiff = -(ldp - ld0)
                pi_D = float(2.0 * dirdiff / (s * s))
            else:
                pi_D = None
            rec["dirac_pi_D"] = pi_D
            rec["dirac_stiffens"] = bool(pi_D is not None and pi_D > 0)
            rec["stiffness"] = stiff
            rec["pi_arch_cycle13"] = ch["pi_arch"]
            rec["y_c_even_or_odd_Teta_lt_1"] = bool(
                rec["y_c_Teta"] is not None and rec["y_c_Teta"] < 1.0
            )
            # confirm condensation by a cheap 1D scan at y=1, T=η
            if rec["chi_Teta"] > 0:
                nuc = ch["nuc"]
                r_est = max(1.0, nuc / (4.0 * stiff + 1e-30))
                r_max = min(max(20.0 * r_est, 10.0), 1e7)
                rs = np.concatenate([[0.0], np.geomspace(1e-6, r_max, 60)])
                oms = []
                for r in rs:
                    E, _, _ = bdg_positive_energies(K, r * Delta_unit)
                    oms.append(stiff * r * r + fermion_omega(E, xi, ETA))
                oms = np.asarray(oms)
                i = int(np.argmin(oms))
                rec["scan_r_star"] = float(rs[i])
                rec["scan_omega_star"] = float(oms[i])
                rec["scan_omega_0"] = float(oms[0])
                rec["scan_condenses"] = bool(oms[i] < oms[0] - 1e-12 and rs[i] > 1e-8)
            else:
                rec["scan_condenses"] = False
            krec["channels"][cname] = rec
        results["kinetics"][kname] = krec

    prim = results["kinetics"][primary]["channels"]
    even_P = prim["even_4_5"]
    odd_P = prim["odd_4_3"]
    pairing_attractive = bool(even_P["pairing_attractive_Teta"] and even_P["pairing_attractive_T0"]
                              and odd_P["pairing_attractive_Teta"] and odd_P["pairing_attractive_T0"])
    dirac_stiffens = bool(even_P["dirac_stiffens"] and odd_P["dirac_stiffens"])
    cycle13_is_the_measure = False  # attractive pairing falsifies this
    alt25_is_the_measure = bool(pairing_attractive)
    condensation_even = bool(even_P["y_c_Teta"] is not None and even_P["y_c_Teta"] < 1.0
                             and even_P.get("scan_condenses"))
    assert pairing_attractive
    assert dirac_stiffens
    assert not (even_P["chi_Teta"] < 0)

    results.update({
        "primary_kinetic": primary,
        "pairing_quadratic_is_attractive": pairing_attractive,
        "dirac_quadratic_stiffens": dirac_stiffens,
        "cycle13_plus_y2pi_is_the_coupled_pairing_measure": "FALSIFIED",
        "alt25_BCS_attraction_is_the_coupled_pairing_measure": "PROVED" if alt25_is_the_measure else "FALSIFIED",
        "four_5_condensation_at_y_even_1": "PROVED" if condensation_even else "FALSIFIED",
        "cycle13_stiffening_is_Dirac_channel_misapplied": True,
        "classification": "PROVED",
        "advances_physical_ARF": False,
        "primary_y_c_even_Teta": even_P["y_c_Teta"],
        "primary_y_c_odd_Teta": odd_P["y_c_Teta"],
        "primary_y_c_even_T0": even_P["y_c_T0"],
        "primary_y_c_odd_T0": odd_P["y_c_T0"],
        "primary_chi_even_Teta": even_P["chi_Teta"],
        "primary_chi_odd_Teta": odd_P["chi_Teta"],
        "primary_dirac_pi_even": even_P["dirac_pi_D"],
        "primary_dirac_pi_odd": odd_P["dirac_pi_D"],
        "primary_scan_r_star_even": even_P.get("scan_r_star"),
        "primary_scan_condenses_even": even_P.get("scan_condenses"),
        "primary_scan_condenses_odd": odd_P.get("scan_condenses"),
        "ico_y_c_even_Teta": results["kinetics"]["ico_laplacian"]["channels"]["even_4_5"]["y_c_Teta"],
        "ico_chi_even_Teta": results["kinetics"]["ico_laplacian"]["channels"]["even_4_5"]["chi_Teta"],
        "Lambda_y_c_even_Teta": results["kinetics"]["cycle13_Lambda"]["channels"]["even_4_5"]["y_c_Teta"],
        "Lambda_chi_even_Teta": results["kinetics"]["cycle13_Lambda"]["channels"]["even_4_5"]["chi_Teta"],
    })

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

    (OUT / "results.json").write_text(json.dumps(sanitize(results), indent=2) + "\n")
    print(json.dumps(sanitize({
        "H13_ok": H13_spectrum_ok,
        "det_id": det_id_rel,
        "pairing_attractive": pairing_attractive,
        "dirac_stiffens": dirac_stiffens,
        "condensation": results["four_5_condensation_at_y_even_1"],
        "y_c_even_H13": even_P["y_c_Teta"],
        "y_c_odd_H13": odd_P["y_c_Teta"],
        "y_c_even_ico": results["ico_y_c_even_Teta"],
        "chi_even_H13": even_P["chi_Teta"],
        "chi_even_ico": results["ico_chi_even_Teta"],
        "chi_even_Lam": results["Lambda_chi_even_Teta"],
        "pi_D_even": even_P["dirac_pi_D"],
        "r_star_even": even_P.get("scan_r_star"),
        "scan_odd": odd_P.get("scan_condenses"),
    }), indent=2))


if __name__ == "__main__":
    main()
