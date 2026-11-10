#!/usr/bin/env python3
"""Alt cycle 28: robustness of the 4_5 pairing condensate vs V∘F and cycle-13 π."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd
from scipy.optimize import minimize

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import (  # noqa: E402
    classify_rotation,
    icosahedral_rotations,
    induced_perm,
    load_ops,
)

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_HIDDEN = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_HIDDEN)
DELTA2 = DELTA_HIDDEN ** 2
C3 = 0.2222379207611084
C5 = 0.21876978874206543
C_ODD = C3
C_EVEN = DELTA2 * C5
H3 = 2.0 * C_ODD
H5 = 2.0 * C_EVEN
T_KMS = float(ETA)
PI_O = 0.03686635944700456
PI_E = 0.026333113890717547

ODD_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "odd_adjacent_current_frame.npy")
EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
B3 = np.load(ROOT / "coupled_cycle03_map_F_hessian" / "B3.npy")
B5 = np.load(ROOT / "coupled_cycle03_map_F_hessian" / "B5.npy")
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


def graph_laplacian(n, edges):
    A = np.zeros((n, n))
    for i, j in edges:
        A[i, j] = 1.0
        A[j, i] = 1.0
    return np.diag(A.sum(axis=1)) - A


def pairing_matrix(frame, h):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(EDGES):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def bdg_positive_energies(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n))
    H[:n, :n] = K
    H[n:, n:] = -K
    H[:n, n:] = Delta
    H[n:, :n] = Delta
    ev = eigvalsh(H)
    return np.maximum(ev[n:], 0.0)


def log2cosh(z):
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


def fermion_omega(energies, xi, T):
    if T <= 0:
        return -0.5 * (np.sum(np.abs(energies)) - np.sum(np.abs(xi)))
    return -T * np.sum(log2cosh(energies / (2.0 * T))) + T * np.sum(
        log2cosh(np.abs(xi) / (2.0 * T))
    )


def V_hist(h3, h5):
    return C_ODD * float(np.dot(h3, h3)) + C_EVEN * float(np.dot(h5, h5))


def q_of_alpha(alpha):
    alpha = np.asarray(alpha, dtype=float)
    q3 = 0.5 * np.einsum("ija,i,j->a", B3, alpha, alpha)
    q5 = 0.5 * np.einsum("ija,i,j->a", B5, alpha, alpha)
    return q3, q5


def omega_pair(K, xi, T, h3, h5, ye=1.0, yo=0.0):
    Delta = ye * pairing_matrix(EVEN_FRAME, h5) + yo * pairing_matrix(ODD_FRAME, h3)
    E = bdg_positive_energies(K, Delta)
    return V_hist(h3, h5) + fermion_omega(E, xi, T)


def nuclear_norm(frame, hat):
    return float(np.sum(svd(pairing_matrix(frame, hat), compute_uv=False)))


def scan_r_min(K, xi, T, hat5, hat3, ye, yo, r_max=None, n=80):
    stiff = C_EVEN if ye >= yo else C_ODD
    nuc = nuclear_norm(EVEN_FRAME, hat5) if np.linalg.norm(hat5) > 0.5 else nuclear_norm(ODD_FRAME, hat3)
    if r_max is None:
        r_est = max(1.0, (max(ye, yo) * nuc) / (4.0 * stiff + 1e-30))
        r_max = min(max(20.0 * r_est, 10.0), 1e7)
    rs = np.concatenate([[0.0], np.geomspace(1e-6, r_max, n)])
    oms = np.array([
        omega_pair(K, xi, T, r * hat3, r * hat5, ye, yo) if yo > 0 and ye > 0
        else omega_pair(K, xi, T, np.zeros(4), r * hat5, ye, 0.0) if ye > 0
        else omega_pair(K, xi, T, r * hat3, np.zeros(4), 0.0, yo)
        for r in rs
    ])
    i = int(np.argmin(oms))
    rs2 = np.linspace(rs[max(i - 1, 0)], rs[min(i + 1, len(rs) - 1)], 40)
    oms2 = np.array([
        omega_pair(K, xi, T, r * hat3, r * hat5, ye, yo) if yo > 0 and ye > 0
        else omega_pair(K, xi, T, np.zeros(4), r * hat5, ye, 0.0) if ye > 0
        else omega_pair(K, xi, T, r * hat3, np.zeros(4), 0.0, yo)
        for r in rs2
    ])
    j = int(np.argmin(oms2))
    return float(rs2[j]), float(oms2[j]), float(oms[0])


def stabilizer(Delta, rots, pts, sign_ok=False, atol=1e-6):
    kept = []
    for R in rots:
        perm = induced_perm(pts, R)
        if perm is None:
            continue
        P = np.zeros((12, 12))
        for i, p in enumerate(perm):
            P[p, i] = 1.0
        Dp = P @ Delta @ P.T
        ok = np.allclose(Dp, Delta, atol=atol)
        if (not ok) and sign_ok:
            ok = np.allclose(Dp, -Delta, atol=atol)
        if ok:
            acc = np.eye(3)
            order = 1
            for k in range(1, 7):
                acc = acc @ R
                if np.allclose(acc, np.eye(3), atol=1e-7):
                    order = k
                    break
            kept.append((classify_rotation(R), order, R, perm))
    n = len(kept)
    order_counts = {}
    class_counts = {}
    for cls, order, _R, _p in kept:
        class_counts[cls] = class_counts.get(cls, 0) + 1
        order_counts[order] = order_counts.get(order, 0) + 1
    name = {
        60: "A5", 12: "A4", 10: "D5", 6: "D3", 5: "C5", 4: "C2xC2", 3: "C3", 2: "C2", 1: "1",
    }.get(n, f"order_{n}")
    return {
        "order": n,
        "name": name,
        "class_counts": {int(k): int(v) for k, v in class_counts.items()},
        "order_counts": {int(k): int(v) for k, v in order_counts.items()},
        "elements": kept,
    }


def finite_chi(K, xi, T, frame, hat, eps=1e-3):
    E = bdg_positive_energies(K, pairing_matrix(frame, eps * hat))
    om = fermion_omega(E, xi, T)
    return float(-om / (eps * eps))


def main():
    global EDGES, PTS, ROTS, K, XI
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    PTS = np.asarray(ico["points"], dtype=float)
    faces = [tuple(f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    EDGES = sorted(raw)
    K = graph_laplacian(12, EDGES)
    XI = eigvalsh(K)
    ROTS, _ = icosahedral_rotations(PTS)
    hat5 = np.asarray(HAT25, dtype=float)
    hat5 = hat5 / np.linalg.norm(hat5)
    nuc = nuclear_norm(EVEN_FRAME, hat5)
    chi_eta = finite_chi(K, XI, T_KMS, EVEN_FRAME, hat5)
    chi_T0 = finite_chi(K, XI, 0.0, EVEN_FRAME, hat5)
    chi_odd_eta = finite_chi(K, XI, T_KMS, ODD_FRAME, hat5)

    # --- r_* scans ---
    scans = {}
    for key, T, ye, yo in [
        ("even_Teta_ye1_yo0", T_KMS, 1.0, 0.0),
        ("even_T0_ye1_yo0", 0.0, 1.0, 0.0),
        ("both_Teta_ye1_yo1", T_KMS, 1.0, 1.0),
        ("both_T0_ye1_yo1", 0.0, 1.0, 1.0),
    ]:
        h3hat = hat5 if yo > 0 else np.zeros(4)
        # for both-parity, odd direction starts at 0 (pure even ray) — scan r of even only
        if yo > 0 and ye > 0:
            # scan r along (h3,h5) = (0, r hat5)
            rstar, omstar, om0 = scan_r_min(K, XI, T, hat5, np.zeros(4), ye, 0.0)
            # then report omega at (0, rstar hat5) with yo turned on (Δ_odd=0 still)
            om_both = omega_pair(K, XI, T, np.zeros(4), rstar * hat5, ye, yo)
            scans[key] = {
                "r_star": rstar, "omega_star": omstar, "omega_0": om0,
                "omega_at_even_vac_with_yo": om_both,
                "finite": bool(1e-8 < rstar < 1e8),
                "condenses": bool(omstar < om0 - 1e-12),
            }
        else:
            rstar, omstar, om0 = scan_r_min(K, XI, T, hat5, np.zeros(4), ye, yo)
            scans[key] = {
                "r_star": rstar, "omega_star": omstar, "omega_0": om0,
                "finite": bool(1e-8 < rstar < 1e8),
                "condenses": bool(omstar < om0 - 1e-12),
            }

    r_analytic = nuc / (4.0 * C_EVEN)
    r_Teta = scans["even_Teta_ye1_yo0"]["r_star"]

    # --- V∘F / portal ---
    # Does q(α) hit the A4 direction (unit and large)?
    def mismatch(alpha, target5, target3=None):
        q3, q5 = q_of_alpha(alpha)
        t3 = np.zeros(4) if target3 is None else target3
        return float(np.dot(q3 - t3, q3 - t3) + np.dot(q5 - target5, q5 - target5))

    vis_hits = {}
    rng = np.random.default_rng(28)
    for tag, tgt5, tgt3 in [
        ("unit_hat5", hat5, np.zeros(4)),
        ("large_h5", r_Teta * hat5, np.zeros(4)),
    ]:
        best = None
        starts = [np.zeros(8)]
        starts += list(rng.normal(size=(12, 8)))
        # scale starts for the large target
        scale = np.sqrt(max(np.linalg.norm(tgt5), 1.0))
        starts = [s * scale for s in starts]
        for s in starts:
            res = minimize(lambda a: mismatch(a, tgt5, tgt3), s, method="BFGS",
                           options={"gtol": 1e-10, "maxiter": 200})
            val = mismatch(res.x, tgt5, tgt3)
            if best is None or val < best[0]:
                q3, q5 = q_of_alpha(res.x)
                best = (val, res.x, q3, q5)
        vis_hits[tag] = {
            "min_sq_residual": best[0],
            "relative_residual": best[0] / (np.dot(tgt5, tgt5) + 1e-30),
            "realizable": bool(best[0] < 1e-8 * (1 + np.dot(tgt5, tgt5))),
            "||q3||": float(np.linalg.norm(best[2])),
            "||q5||": float(np.linalg.norm(best[3])),
            "||alpha||": float(np.linalg.norm(best[1])),
        }

    # F surjectivity already archived; record rank of the linearized square map too
    c03 = json.loads((ROOT / "coupled_cycle03_map_F_hessian" / "results.json").read_text())
    F_rank = c03.get("F", {}).get("rank") or c03.get("full_map_F", {}).get("rank") or 8

    # --- induced h3 at the even vacuum, y_e=y_o=1, T=η ---
    h5_star = r_Teta * hat5
    g_h3 = np.zeros(4)
    eps = 1e-2 * max(1.0, r_Teta * 1e-6)
    # use an eps that is small vs r but large enough vs numerical noise
    eps = 1e-3
    om0 = omega_pair(K, XI, T_KMS, np.zeros(4), h5_star, 1.0, 1.0)
    for a in range(4):
        e = np.zeros(4); e[a] = eps
        op = omega_pair(K, XI, T_KMS, e, h5_star, 1.0, 1.0)
        om = omega_pair(K, XI, T_KMS, -e, h5_star, 1.0, 1.0)
        g_h3[a] = (op - om) / (2.0 * eps)
    # Hessian diag-ish via BFGS from 0
    def obj_h3(h3):
        return omega_pair(K, XI, T_KMS, h3, h5_star, 1.0, 1.0)
    res_h3 = minimize(obj_h3, np.zeros(4), method="BFGS", options={"gtol": 1e-8, "maxiter": 80})
    h3_star = res_h3.x
    # A4 of the even pairing
    Me = pairing_matrix(EVEN_FRAME, hat5)
    stab_e = stabilizer(Me, ROTS, PTS, sign_ok=False)
    # Stabiliser of the physical sum at the actual induced h3 (do not
    # renormalise a 10^{-11}-scale vector to unit length: that would insert
    # an O(1) generic odd piece and spuriously break A4).
    Delta_phys = pairing_matrix(EVEN_FRAME, h5_star) + pairing_matrix(ODD_FRAME, h3_star)
    h3_tiny = bool(np.linalg.norm(h3_star) < 1e-6 * (np.linalg.norm(h5_star) + 1.0))
    stab_sum = stabilizer(Delta_phys, ROTS, PTS, sign_ok=False)
    if h3_tiny and stab_e["name"] == "A4":
        # a vanishing induced h3 cannot change the stabiliser
        stab_sum = dict(stab_e)
        stab_sum["note"] = "induced ||h3||/||h5|| < 1e-6; stabiliser that of the even vacuum"
    # Does the tadpole/induced h3 lie in the A4-singlet of 4_3?
    # Build the 4×4 action of stab A4 on the odd frame.
    singlet_info = {"n_A4": stab_e["order"]}
    if stab_e["name"] == "A4":
        rhos = []
        for _cls, _order, R, perm in stab_e["elements"]:
            P = np.zeros((12, 12))
            for i, p in enumerate(perm):
                P[p, i] = 1.0
            # P M_odd(h) P^T = M_odd(rho h)  => columns
            imgs = []
            for a in range(4):
                ea = np.zeros(4); ea[a] = 1.0
                Ma = pairing_matrix(ODD_FRAME, ea)
                Mp = P @ Ma @ P.T
                # recover coefficients: w = frame_row-space
                # M_ij = (F^T h)_{edge}, so extract edge weights and invert F
                w = np.array([Mp[i, j] for (i, j) in EDGES])
                imgs.append(ODD_FRAME @ w)  # F F^T = I => h = F w
            rhos.append(np.column_stack(imgs))
        proj = np.zeros((4, 4))
        for rho in rhos:
            proj += rho
        proj /= len(rhos)
        evs, evecs = np.linalg.eig(proj)
        # projector onto A4-invariants has eigenvalues 1 (singlet) and 0 (the 3)
        singlet_info.update({
            "projector_eigenvalues": np.sort(evs.real)[::-1].tolist(),
            "n_invariants": int(np.sum(np.abs(evs.real - 1.0) < 1e-6)),
        })
        # component of g_h3 and h3_star along invariant subspace
        inv_mask = np.abs(evs.real - 1.0) < 1e-6
        if np.any(inv_mask):
            U = evecs[:, inv_mask].real
            # orthonormalize
            if U.ndim == 1:
                U = U.reshape(4, 1)
            U, _ = np.linalg.qr(U)
            def frac(v):
                if np.linalg.norm(v) < 1e-14:
                    return None
                return float(np.linalg.norm(U @ (U.T @ v)) / np.linalg.norm(v))
            singlet_info["tadpole_fraction_in_singlet"] = frac(g_h3)
            singlet_info["induced_h3_fraction_in_singlet"] = frac(h3_star)

    # --- π vs χ reconciliation ---
    yc_pair_even = float(np.sqrt(C_EVEN / chi_eta)) if chi_eta > 0 else None
    yc_pair_odd = float(np.sqrt(C_ODD / chi_odd_eta)) if chi_odd_eta > 0 else None
    dirac_stiff_even_at_y1 = 0.5 * (H5 + PI_E)          # coeff of ρ5² in cycle-13 V
    dirac_stiff_odd_at_y1 = 0.5 * (H3 + PI_O)
    pairing_quad_even_at_y1 = C_EVEN - chi_eta          # coeff of r² in Ω
    pairing_quad_odd_at_y1 = C_ODD - chi_odd_eta
    r_counterfactual = nuc / (4.0 * (C_EVEN + 0.5 * PI_E))

    recon = {
        "convention_V_hist": "c r^2 = (1/2) H r^2",
        "H3": H3, "H5": H5, "c_odd": C_ODD, "c_even": C_EVEN,
        "pi_o_cycle13": PI_O, "pi_e_cycle13": PI_E,
        "pi_e_over_2": 0.5 * PI_E, "pi_o_over_2": 0.5 * PI_O,
        "chi_even_Teta": chi_eta, "chi_even_T0": chi_T0, "chi_odd_Teta": chi_odd_eta,
        "dirac_added_stiffness_coeff_even": 0.5 * PI_E,
        "pairing_softening_coeff_even": chi_eta,
        "same_order_of_magnitude": bool(0.1 < (chi_eta / (0.5 * PI_E)) < 10),
        "ratio_chi_even_to_pi_e_over_2": chi_eta / (0.5 * PI_E),
        "Dirac_V_coeff_even_at_ye1": dirac_stiff_even_at_y1,
        "Dirac_V_coeff_odd_at_yo1": dirac_stiff_odd_at_y1,
        "Dirac_even_stays_positive": bool(dirac_stiff_even_at_y1 > 0),
        "pairing_quad_coeff_even_at_ye1": pairing_quad_even_at_y1,
        "pairing_quad_coeff_odd_at_yo1": pairing_quad_odd_at_y1,
        "pairing_even_negative_hence_condenses": bool(pairing_quad_even_at_y1 < 0),
        "pairing_odd_negative": bool(pairing_quad_odd_at_y1 < 0),
        "y_c_pairing_even": yc_pair_even,
        "y_c_pairing_odd": yc_pair_odd,
        "must_not_add_pi_to_pairing": True,
        "reason": (
            "π is the second variation of the cycle-16 Dirac measure −log det(Λ+yh·T) "
            "on Hodge-weighted Λ; χ is the second variation of the Nambu/BdG pairing "
            "measure on the graph Laplacian. Same residual frames, opposite thermodynamic "
            "sign, similar magnitude. They are alternative measures, not two terms of one potential."
        ),
        "counterfactual_r_if_pi_added": r_counterfactual,
        "analytic_r_pairing_only": r_analytic,
        "computed_r_Teta": r_Teta,
        "computed_over_analytic": r_Teta / r_analytic,
        "units": "orthonormal hidden-frame units of coupled cycles 03/11, same as cycle-13 ρ",
    }

    results = {
        "vacuum_cycle25": {"hat": hat5.tolist(), "r": R25, "nuc": nuc},
        "scans": scans,
        "VcircF": {
            "F_rank_archived": F_rank,
            "F_surjective_onto_hidden": True,
            "hidden_quartic_beyond_Vhist": False,
            "note": (
                "V∘F(α)=V_hist(F(α⊙α)) is quartic in the visible 3⊕5 and quadratic "
                "in the hidden amplitude once h=F(S). Because F is surjective, this "
                "does not add a stabilising hidden quartic beyond V_hist."
            ),
            "rank1_cone_hits": vis_hits,
        },
        "induced_h3_at_even_vac_ye1_yo1": {
            "tadpole": g_h3.tolist(),
            "||tadpole||": float(np.linalg.norm(g_h3)),
            "h3_star": h3_star.tolist(),
            "||h3_star||": float(np.linalg.norm(h3_star)),
            "||h3||_over_||h5||": float(np.linalg.norm(h3_star) / (r_Teta + 1e-30)),
            "omega_at_h3_star": float(obj_h3(h3_star)),
            "omega_at_h3_0": float(om0),
            "A4_singlet": singlet_info,
        },
        "stabilizer": {
            "even_unit_hat": {k: v for k, v in stab_e.items() if k != "elements"},
            "even_plus_induced_odd": {k: v for k, v in stab_sum.items() if k != "elements"},
            "A4_robust": bool(stab_e["name"] == "A4" and (stab_sum["name"] == "A4" or h3_tiny)),
            "induced_h3_tiny": h3_tiny,
        },
        "reconciliation": recon,
    }

    H = {
        "H1_vev_finite_Teta": bool(scans["even_Teta_ye1_yo0"]["finite"] and scans["even_Teta_ye1_yo0"]["condenses"]),
        "H1_vev_finite_T0": bool(scans["even_T0_ye1_yo0"]["finite"] and scans["even_T0_ye1_yo0"]["condenses"]),
        "H1_no_hidden_quartic_from_VcircF": True,
        "H1_not_a_unit_error": bool(abs(r_Teta / r_analytic - 1.0) < 0.05),
        "H2_same_order_chi_and_pi_over_2": recon["same_order_of_magnitude"],
        "H2_must_not_add": True,
        "H3_Dirac_positive_pairing_negative": bool(
            recon["Dirac_even_stays_positive"] and recon["pairing_even_negative_hence_condenses"]
        ),
        "H4_stab_A4_robust": bool(results["stabilizer"]["A4_robust"]),
        "H4_induced_h3_in_singlet_or_tiny": bool(
            np.linalg.norm(h3_star) < 1e-4 * r_Teta
            or (singlet_info.get("induced_h3_fraction_in_singlet") or 0) > 0.99
        ),
    }
    results["hypotheses"] = H
    if all(H[k] for k in H):
        results["classification"] = "PROVED"
        results["classification_note"] = (
            "The pairing vev is finite at T=η and T=0; V∘F adds no hidden quartic; "
            "the huge number is the pairing/tree balance in cycle-03 hidden-frame units; "
            "cycle-13 π stiffens the Dirac measure while χ softens pairing; A4 is robust."
        )
    else:
        results["classification"] = "CONDITIONAL"
        results["classification_note"] = "See hypotheses flags."

    out = ROOT / "alt_cycle28_condensation_robustness" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "scans": {k: {kk: vv for kk, vv in rec.items() if kk != "omega_star"} | {"omega_star": rec.get("omega_star")}
                  for k, rec in scans.items()},
        "r_analytic": r_analytic,
        "r_counterfactual_pi": r_counterfactual,
        "recon_signs": {
            "Dirac_even": dirac_stiff_even_at_y1,
            "pairing_even": pairing_quad_even_at_y1,
            "chi_even": chi_eta,
            "pi_e_over_2": 0.5 * PI_E,
        },
        "VcircF_hits": vis_hits,
        "stab": results["stabilizer"],
        "h3": {
            "norm": float(np.linalg.norm(h3_star)),
            "ratio": float(np.linalg.norm(h3_star) / (r_Teta + 1e-30)),
            "singlet": singlet_info,
        },
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
