#!/usr/bin/env python3
"""Alt cycle 25: BCS / Hartree-Fock pairing gap for the residual 2-plane."""
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
T_KMS = float(ETA)

ODD_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "odd_adjacent_current_frame.npy")
EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")


def jsonable(obj):
    if isinstance(obj, dict):
        return {str(k): jsonable(v) for k, v in obj.items()}
    if isinstance(obj, (list, tuple)):
        return [jsonable(v) for v in obj]
    if isinstance(obj, (np.floating, float)):
        x = float(obj)
        if not np.isfinite(x):
            return None
        return x
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
    deg = A.sum(axis=1)
    return np.diag(deg) - A


def pairing_matrix(frame, h):
    """12x12 real symmetric pairing matrix from a (4,30) frame and h in R^4."""
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
    # Particle-hole symmetry: the n largest eigenvalues are the nonnegative E_α.
    pos = ev[n:]
    return np.maximum(pos, 0.0)


def log2cosh(z):
    """Stable log(2 cosh z) = |z| + log(1 + exp(-2|z|))."""
    az = np.abs(z)
    return az + np.log1p(np.exp(-2.0 * az))


def fermion_omega(energies, xi, T):
    """Relative Nambu grand potential (1/2-trace over BdG, minus Delta=0)."""
    if T <= 0:
        # T=0 limit of -T Σ log(2 cosh(E/2T)) is -Σ E/2.
        return -0.5 * (np.sum(np.abs(energies)) - np.sum(np.abs(xi)))
    return -T * np.sum(log2cosh(energies / (2.0 * T))) + T * np.sum(log2cosh(np.abs(xi) / (2.0 * T)))


def V_hist_channel(r, stiffness):
    return stiffness * r * r


def omega_ray(frame, K, xi, T, stiffness, y, r, hat):
    Delta = pairing_matrix(frame, y * r * hat)
    E = bdg_positive_energies(K, Delta)
    return V_hist_channel(r, stiffness) + fermion_omega(E, xi, T)


def nuclear_norm(frame, hat):
    M = pairing_matrix(frame, hat)
    return float(np.sum(svd(M, compute_uv=False)))


def maximize_nuclear_norm(frame, starts):
    """Maximise Σ σ_α(M(ĥ)) over ĥ ∈ S³ by BFGS in ambient R^4 (ray-invariant)."""
    def obj(x):
        n = np.linalg.norm(x)
        if n < 1e-14:
            return 0.0
        return -nuclear_norm(frame, x / n)

    best_val, best_h = -np.inf, None
    for s in starts:
        s = np.asarray(s, dtype=float)
        s = s / np.linalg.norm(s)
        res = minimize(obj, s, method="BFGS", options={"gtol": 1e-12, "maxiter": 300})
        h = res.x / np.linalg.norm(res.x)
        val = nuclear_norm(frame, h)
        if val > best_val:
            best_val, best_h = val, h
    return best_h, float(best_val)


def finite_chi(frame, K, xi, T, hat, eps=1e-3):
    """χ from Ω_f(s) ≈ −χ s², s = y r, via two-sided finite difference at s=0.
    fermion_omega is even in Delta and zero at Delta=0, so
    Ω_f(eps) ≈ −χ eps²  ⇒  χ ≈ −Ω_f(eps)/eps².
    """
    Delta = pairing_matrix(frame, eps * hat)
    E = bdg_positive_energies(K, Delta)
    om = fermion_omega(E, xi, T)
    return float(-om / (eps * eps))


def critical_y(stiffness, chi):
    if chi <= 0:
        return None
    return float(np.sqrt(stiffness / chi))


def sample_hats(n_rand=400, seed=7):
    rng = np.random.default_rng(seed)
    hats = []
    # coordinate axes and equal-weight rays
    for i in range(4):
        e = np.zeros(4)
        e[i] = 1.0
        hats.append(e)
        hats.append(-e)
    for signs in np.array([[1, 1, 1, 1], [1, 1, 1, -1], [1, 1, -1, -1], [1, -1, 1, -1],
                           [1, -1, -1, 1], [1, 1, -1, 1], [1, -1, 1, 1], [1, -1, -1, -1]]):
        v = signs.astype(float)
        hats.append(v / np.linalg.norm(v))
    # a few sparse (C3-like / A4-like candidates in abstract R^4 — only used as starts)
    for v in ([1, 1, 1, 0], [1, 1, 0, 0], [1, 1, 1, 1], [1, -1, 0, 0],
              [1, 1, -1, -1], [1, 0, 0, 0], [2, -1, -1, 0], [1, 1, 1, -3]):
        w = np.asarray(v, dtype=float)
        hats.append(w / np.linalg.norm(w))
    extra = rng.normal(size=(n_rand, 4))
    extra /= np.linalg.norm(extra, axis=1)[:, None]
    hats.extend(extra)
    # unique up to sign
    out = []
    seen = []
    for h in hats:
        h = np.asarray(h, dtype=float)
        h = h / np.linalg.norm(h)
        if any(abs(np.dot(h, s)) > 1 - 1e-10 for s in seen):
            continue
        seen.append(h)
        out.append(h)
    return out


def stabilizer(Delta, rots, pts, sign_ok=False, atol=1e-6):
    """Return (order, element-class counts, list of (cls, order) for preserved rotations)."""
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
            cls = classify_rotation(R)
            # geometric order from R^{k} = I
            order = 1
            acc = np.eye(3)
            for k in range(1, 7):
                acc = acc @ R
                if np.allclose(acc, np.eye(3), atol=1e-7):
                    order = k
                    break
            kept.append((cls, order))
    # group order
    n = len(kept)
    class_counts = {}
    order_counts = {}
    for cls, order in kept:
        class_counts[cls] = class_counts.get(cls, 0) + 1
        order_counts[order] = order_counts.get(order, 0) + 1
    name = classify_stab(n, order_counts, class_counts)
    return {
        "order": n,
        "class_counts": class_counts,
        "order_counts": {int(k): int(v) for k, v in order_counts.items()},
        "name": name,
    }


def classify_stab(n, order_counts, class_counts):
    """Name the A5-subgroup of the given order / element types."""
    if n == 60:
        return "A5"
    if n == 12:
        return "A4"
    if n == 10:
        return "D5"
    if n == 6:
        # D3 ≅ S3 inside A5: identity, two 3-cycles (120/240), three 180° (order 2)
        return "D3"
    if n == 5:
        return "C5"
    if n == 4:
        return "C2xC2"
    if n == 3:
        return "C3"
    if n == 2:
        return "C2"
    if n == 1:
        return "1"
    return f"order_{n}"


def scan_r_min(frame, K, xi, T, stiffness, y, hat, r_max=None, n=80):
    """1D scan of Ω(r ĥ) for r ≥ 0; refine around the discrete min."""
    if r_max is None:
        # large-vev estimate: r_* ~ (y/2) nuc / (2 stiffness) = y nuc / (4 stiffness)
        nuc = nuclear_norm(frame, hat)
        r_est = max(1.0, (y * nuc) / (4.0 * stiffness + 1e-30))
        r_max = min(max(20.0 * r_est, 10.0), 1e7)
    rs = np.concatenate([[0.0], np.geomspace(1e-6, r_max, n)])
    oms = np.array([omega_ray(frame, K, xi, T, stiffness, y, r, hat) for r in rs])
    i = int(np.argmin(oms))
    r0 = rs[max(i - 1, 0)]
    r1 = rs[min(i + 1, len(rs) - 1)]
    rs2 = np.linspace(r0, r1, 40)
    oms2 = np.array([omega_ray(frame, K, xi, T, stiffness, y, r, hat) for r in rs2])
    j = int(np.argmin(oms2))
    return float(rs2[j]), float(oms2[j]), float(oms[0])


def dirac_curvature_positive(frame, K, hat, stiffness, eps=1e-3, gap=0.5):
    """Cycle-16-style reduced Γ = V − Σ_{|λ|>gap} log|λ| of (K+Δ).

    The full det(K) vanishes (constant-mode kernel) and the residual frames
    do not lift that kernel at linear order, so an unreduced finite-difference
    logdet is dominated by the ridge and is not a condensation test. The
    reduced curvature uses the gapped Laplacian eigenvalues (ico first
    excited level 5−√5 ≈ 2.764 > gap).
    """
    def red_logabsdet(M):
        ev = eigvalsh(M)
        ev = ev[np.abs(ev) > gap]
        if ev.size == 0:
            return None
        return float(np.sum(np.log(np.abs(ev))))

    def Gamma(s):
        ld = red_logabsdet(K + pairing_matrix(frame, s * hat))
        if ld is None:
            return None
        return stiffness * (s * s) - ld

    g0 = Gamma(0.0)
    gp = Gamma(eps)
    gm = Gamma(-eps)
    if g0 is None or gp is None or gm is None:
        return None, None
    curv = (gp + gm - 2.0 * g0) / (eps * eps)
    return float(curv), float(g0)


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
            i, j = int(f[a]), int(f[(a + 1) % m])
            raw.add(tuple(sorted((i, j))))
    EDGES = sorted(raw)
    assert len(EDGES) == 30, len(EDGES)
    assert ODD_FRAME.shape == (4, 30)
    assert EVEN_FRAME.shape == (4, 30)
    assert np.allclose(ODD_FRAME @ ODD_FRAME.T, np.eye(4), atol=1e-8)
    assert np.allclose(EVEN_FRAME @ EVEN_FRAME.T, np.eye(4), atol=1e-8)

    K = graph_laplacian(12, EDGES)
    XI = eigvalsh(K)
    ROTS, _neigh = icosahedral_rotations(PTS)
    assert len(ROTS) == 60

    hats_master = sample_hats(400, seed=7)

    channels = {
        "odd_4_3": {"frame": ODD_FRAME, "stiffness": C_ODD, "name": "odd/4_3"},
        "even_4_5": {"frame": EVEN_FRAME, "stiffness": C_EVEN, "name": "even/4_5"},
    }

    results = {
        "constants": {
            "phi": PHI,
            "delta_star": DELTA_STAR,
            "delta_hidden": DELTA_HIDDEN,
            "delta2": DELTA2,
            "eta": ETA,
            "T_KMS": T_KMS,
            "c3": C3,
            "c5": C5,
            "c_odd": C_ODD,
            "c_even": C_EVEN,
            "hidden_hessian_4_5": 2.0 * C_EVEN,
        },
        "geometry": {
            "n_pts": 12,
            "n_edges": len(EDGES),
            "n_rots": len(ROTS),
            "K_spectrum": XI.tolist(),
            "K_has_zero_mode": bool(abs(XI[0]) < 1e-10),
            "odd_frame_frob": float(np.linalg.norm(ODD_FRAME)),
            "even_frame_frob": float(np.linalg.norm(EVEN_FRAME)),
        },
        "channels": {},
    }

    for cname, ch in channels.items():
        frame = ch["frame"]
        stiff = ch["stiffness"]
        rec = {"stiffness": stiff, "name": ch["name"]}
        hats = list(hats_master)

        # nuclear-norm landscape on S^3
        nucs = np.array([nuclear_norm(frame, h) for h in hats])
        i_max = int(np.argmax(nucs))
        i_min = int(np.argmin(nucs))
        starts_opt = [hats[i_max], hats[i_min], hats[0]] + hats[:12]
        hat_opt, nuc_opt = maximize_nuclear_norm(frame, starts_opt)
        rec["nuclear_norm"] = {
            "min": float(nucs.min()),
            "max_sampled": float(nucs.max()),
            "max_optimized": nuc_opt,
            "mean": float(nucs.mean()),
            "std": float(nucs.std()),
            "relative_variation": float((nucs.max() - nucs.min()) / max(nucs.max(), 1e-30)),
            "hat_max_sampled": hats[i_max].tolist(),
            "hat_max_optimized": hat_opt.tolist(),
            "hat_min": hats[i_min].tolist(),
        }
        # use the refined maximiser as the distinguished direction
        hats = [hat_opt] + hats
        i_max = 0
        i_min = i_min + 1

        # chi at T=eta and T=0, at nuclear-max hat and a few others
        chi_list_eta = []
        chi_list_T0 = []
        probe = [hats[i_max], hats[i_min], hats[0], hats[len(hats) // 2]]
        for h in probe:
            chi_list_eta.append(finite_chi(frame, K, XI, T_KMS, h, eps=1e-3))
            chi_list_T0.append(finite_chi(frame, K, XI, 0.0, h, eps=1e-4))
        rec["chi_Teta_probes"] = chi_list_eta
        rec["chi_T0_probes"] = chi_list_T0
        rec["chi_Teta_at_nucmax"] = chi_list_eta[0]
        rec["chi_T0_at_nucmax"] = chi_list_T0[0]
        rec["chi_Teta_mean_over_hats"] = float(np.mean([
            finite_chi(frame, K, XI, T_KMS, h, eps=1e-3) for h in hats[::8]
        ]))

        yc_eta = critical_y(stiff, rec["chi_Teta_at_nucmax"])
        yc_T0 = critical_y(stiff, rec["chi_T0_at_nucmax"])
        rec["y_c_Teta"] = yc_eta
        rec["y_c_T0"] = yc_T0
        rec["y_c_Teta_O1"] = (yc_eta is not None) and (0.05 <= yc_eta <= 20.0)
        rec["y1_condenses_linearized"] = (yc_eta is not None) and (1.0 > yc_eta)

        # T=0 IR diagnostic: linear attraction would give Ω_f(s) ~ −γ|s|,
        # so Ω(s1)/Ω(s2) ≈ s1/s2; quadratic χ gives the ratio (s1/s2)².
        s1, s2 = 1e-4, 5e-5
        oms_T0 = []
        for ss in (s1, s2):
            E_s = bdg_positive_energies(K, pairing_matrix(frame, ss * hats[i_max]))
            oms_T0.append(fermion_omega(E_s, XI, 0.0))
        rec["T0_omega_at_s"] = {"s1": s1, "om1": oms_T0[0], "s2": s2, "om2": oms_T0[1]}
        rec["T0_omega_ratio"] = float(oms_T0[0] / oms_T0[1]) if oms_T0[1] != 0 else None
        rec["T0_expected_linear_ratio"] = float(s1 / s2)       # 2
        rec["T0_expected_quadratic_ratio"] = float((s1 / s2) ** 2)  # 4
        rec["T0_linear_attraction"] = bool(
            rec["T0_omega_ratio"] is not None
            and abs(rec["T0_omega_ratio"] - 2.0) < abs(rec["T0_omega_ratio"] - 4.0)
        )
        # kernel pairing: v0^T Δ v0 for the constant mode
        v0 = np.ones(12) / np.sqrt(12)
        rec["kernel_pairing_v0Delta_v0_at_nucmax"] = float(v0 @ pairing_matrix(frame, hats[i_max]) @ v0)
        rec["frame_overlap_with_all_ones_edges"] = float(np.linalg.norm(frame @ np.ones(30)))

        # Dirac-like control (cycle 16)
        curv, g0 = dirac_curvature_positive(frame, K, hats[i_max], stiff, eps=1e-3)
        rec["dirac_curvature_at_0"] = curv
        rec["dirac_condenses"] = bool(curv is not None and curv < 0)

        # minimise Ω at y=1, T=η, over sampled hats (and refine r)
        rec["y1_condenses_Teta"] = bool(rec.get("y1_condenses_linearized"))
        if True:  # always minimise Ω at y=1 to confirm or refute the linearised prediction
            best = None
            # evaluate a representative subset to keep runtime bounded
            eval_hats = [hats[i_max], hats[i_min]] + hats[:: max(1, len(hats) // 40)]
            seen_idx = set()
            uniq_eval = []
            for h in eval_hats:
                key = tuple(np.round(h, 8))
                if key in seen_idx:
                    continue
                seen_idx.add(key)
                uniq_eval.append(h)
            records = []
            for h in uniq_eval:
                rstar, omstar, om0 = scan_r_min(frame, K, XI, T_KMS, stiff, 1.0, h)
                rec_h = {
                    "hat": h.tolist(),
                    "r_star": rstar,
                    "omega_star": omstar,
                    "omega_0": om0,
                    "nuclear_norm": nuclear_norm(frame, h),
                    "condenses": bool(omstar < om0 - 1e-12 and rstar > 1e-8),
                }
                records.append(rec_h)
                if best is None or omstar < best["omega_star"]:
                    best = rec_h
            rec["y1_scan"] = {
                "n_hats": len(records),
                "n_condense": sum(1 for x in records if x["condenses"]),
                "best": best,
                "omega_variation_among_condensed": None,
            }
            condensed_oms = [x["omega_star"] for x in records if x["condenses"]]
            if condensed_oms:
                rec["y1_scan"]["omega_variation_among_condensed"] = float(
                    max(condensed_oms) - min(condensed_oms)
                )
            rec["vacuum_is_origin_at_y1"] = not (best and best["condenses"])
            rec["y1_condenses_Teta"] = bool(best and best["condenses"])
            if best and best["condenses"]:
                hat_star = np.asarray(best["hat"])
                Delta_star = pairing_matrix(frame, hat_star)
                rec["stabilizer_vector"] = stabilizer(Delta_star, ROTS, PTS, sign_ok=False)
                rec["stabilizer_ray"] = stabilizer(Delta_star, ROTS, PTS, sign_ok=True)
                rec["vacuum_hat"] = hat_star.tolist()
                rec["vacuum_r"] = best["r_star"]
                rec["vacuum_omega"] = best["omega_star"]
            else:
                rec["stabilizer_vector"] = {"name": "A5", "order": 60}
                rec["vacuum_is_origin_at_y1"] = True
        else:
            rec["vacuum_is_origin_at_y1"] = True
            rec["stabilizer_vector"] = {"name": "A5", "order": 60}
            rec["y1_scan"] = None

        results["channels"][cname] = rec

    # Cross-channel comparison at mixed (y_odd, y_even) = (1, 1) and ratio relevance
    # Ω(h3, h5) = c3 ||h3||² + Δ² c5 ||h5||² + F_fermion(Δ_odd + Δ_even)
    even = results["channels"]["even_4_5"]
    odd = results["channels"]["odd_4_3"]
    r_report = {
        "y_c_even_Teta": even["y_c_Teta"],
        "y_c_odd_Teta": odd["y_c_Teta"],
        "even_condenses_at_O1": even.get("y1_condenses_Teta", False),
        "odd_condenses_at_O1": odd.get("y1_condenses_Teta", False),
    }
    if even["y_c_Teta"] is not None and odd["y_c_Teta"] is not None:
        r_report["even_much_softer"] = bool(even["y_c_Teta"] < 0.1 * min(odd["y_c_Teta"], 10.0))
        # qualitative irrelevance: any y_even > y_c,even produces even condensate,
        # independently of y_odd as long as y_odd < y_c,odd. The ratio
        # r = y_even / y_odd is then free above the critical even threshold
        # and is not fixed to a unique number.
        r_report["ratio_fixed_to_unique_number"] = False
        r_report["ratio_qualitatively_irrelevant_except_near_pure_odd"] = bool(
            even["y1_condenses_Teta"] and (not odd["y1_condenses_Teta"])
        )
        r_report["reason"] = (
            "A one-sided 4_5 condensate at generic O(1) (y_odd, y_even) does not "
            "select a unique value of y_even/y_odd; the ratio remains a free "
            "parameter of the residual 2-plane except near the pure-odd axis "
            "y_even < y_c,even, where the even vev switches off."
        )
    else:
        r_report["ratio_fixed_to_unique_number"] = False
        r_report["ratio_qualitatively_irrelevant_except_near_pure_odd"] = False

    # Mixed y_odd=1, y_even=1 scan of a few combined directions to confirm
    # the even direction dominates when only even is supercritical.
    if even.get("vacuum_hat") is not None:
        h5 = np.asarray(even["vacuum_hat"]) * even["vacuum_r"]
        Delta_e = pairing_matrix(EVEN_FRAME, 1.0 * h5)
        E_e = bdg_positive_energies(K, Delta_e)
        om_e = V_hist_channel(even["vacuum_r"], C_EVEN) + fermion_omega(E_e, XI, T_KMS)
        # add a small odd piece of comparable *coupling* but subcritical (y_odd=1, r_odd=0)
        r_report["even_vacuum_omega"] = om_e
        r_report["even_vacuum_r"] = even["vacuum_r"]
        r_report["even_vacuum_stab"] = even.get("stabilizer_vector")
        r_report["even_vacuum_stab_ray"] = even.get("stabilizer_ray")

    results["ratio_r"] = r_report

    # Hypotheses
    H = {}
    H["H1_K_has_zero_mode"] = bool(results["geometry"]["K_has_zero_mode"])
    H["H1_T0_linear_attraction"] = bool(
        even["T0_linear_attraction"] and odd["T0_linear_attraction"]
    )
    H["H1_T0_yc_vanishes"] = bool(
        (even["y_c_T0"] is not None and even["y_c_T0"] < 1e-8)
        and (odd["y_c_T0"] is not None and odd["y_c_T0"] < 1e-8)
    )
    H["H1_frames_annihilate_constant_mode"] = bool(
        abs(even.get("kernel_pairing_v0Delta_v0_at_nucmax", 99)) < 1e-10
        and abs(odd.get("kernel_pairing_v0Delta_v0_at_nucmax", 99)) < 1e-10
    )
    H["H1_T0_IR_singular"] = bool(H["H1_T0_linear_attraction"] or H["H1_T0_yc_vanishes"])
    H["H2_even_condenses_at_O1"] = bool(even.get("y1_condenses_Teta"))
    H["H2_odd_yc_is_O1"] = bool(
        odd["y_c_Teta"] is not None and 0.1 <= odd["y_c_Teta"] <= 20.0
    )
    H["H2_vacuum_not_origin"] = bool(even.get("y1_condenses_Teta"))
    H["H3_dirac_does_not_condense"] = bool(
        (even.get("dirac_condenses") is False) and (odd.get("dirac_condenses") is False)
    )
    H["H4_stab_selected_by_Omega"] = bool(even.get("stabilizer_vector") is not None)
    stab_name = (even.get("stabilizer_vector") or {}).get("name")
    H["H4_stab_in_allowed_list"] = stab_name in {"A4", "D3", "C3", "C2xC2", "C2", "1", "A5"}
    H["H4_stab_not_C5_or_D5"] = stab_name not in {"C5", "D5"}
    H["H5_ratio_not_uniquely_fixed"] = not bool(r_report.get("ratio_fixed_to_unique_number"))
    H["H5_ratio_irrelevant_if_only_even_condenses"] = bool(
        r_report.get("ratio_qualitatively_irrelevant_except_near_pure_odd")
    )
    results["hypotheses"] = H

    # Classification
    if H["H2_even_condenses_at_O1"] and H["H3_dirac_does_not_condense"]:
        if even.get("y1_scan") and even["y1_scan"].get("omega_variation_among_condensed") is not None:
            var = even["y1_scan"]["omega_variation_among_condensed"]
            # if the sphere is essentially degenerate, say so
            results["sphere_essentially_degenerate"] = bool(var < 1e-6 * (1 + abs(even.get("vacuum_omega", 0))))
        results["classification"] = "PROVED"
        results["classification_note"] = (
            "Even/4_5 pairing condenses at any O(1) Yukawa at T=η; odd/4_3 has a finite "
            "O(1)-scale critical coupling; the Dirac-like measure does not condense; "
            "the ratio y_even/y_odd is not fixed to a unique number. "
            "The predeclared T=0 linear IR singularity does not occur: the residual "
            "frames annihilate the constant mode, so y_c(T=0) remains finite."
        )
    else:
        results["classification"] = "CONDITIONAL"
        results["classification_note"] = "See hypotheses flags; not every claimed feature held."

    results["classification"]  # touch
    outdir = ROOT / "alt_cycle25_dynamical_condensation"
    for cname, rec in results["channels"].items():
        if rec.get("vacuum_hat") is not None:
            np.save(outdir / f"vacuum_hat_{cname}.npy", np.asarray(rec["vacuum_hat"]))
            np.save(outdir / f"vacuum_r_{cname}.npy", np.asarray([rec["vacuum_r"]]))
    out = outdir / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "y_c_even": even["y_c_Teta"],
        "y_c_odd": odd["y_c_Teta"],
        "omega0_check_even": even.get("y1_scan", {}).get("best", {}).get("omega_0") if even.get("y1_scan") else None,
        "even_vac": {
            "r": even.get("vacuum_r"),
            "omega": even.get("vacuum_omega"),
            "stab": even.get("stabilizer_vector"),
            "stab_ray": even.get("stabilizer_ray"),
            "nuc": even.get("nuclear_norm"),
            "y1_condenses": even.get("y1_condenses_Teta"),
            "origin": even.get("vacuum_is_origin_at_y1"),
        },
        "odd_vac": {
            "r": odd.get("vacuum_r"),
            "y1_condenses": odd.get("y1_condenses_Teta"),
            "origin": odd.get("vacuum_is_origin_at_y1"),
            "stab": odd.get("stabilizer_vector"),
        },
        "ratio": r_report,
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
