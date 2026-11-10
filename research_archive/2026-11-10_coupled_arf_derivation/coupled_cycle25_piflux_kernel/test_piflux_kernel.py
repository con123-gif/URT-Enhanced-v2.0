#!/usr/bin/env python3
"""Coupled cycle 25: GI transverse kernel around the π-flux + 4_5 vacuum."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh, svd
from scipy.linalg import eigh

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle25_piflux_kernel")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402

PRED_SHA = "b241f66f64f9c7ff785fd2af21e67079d29bdebc61f1874dcb7d05662fd40c48"
EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_GEOM = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA_GEOM)
R_ALPHA = 3.0 / (64.0 * PHI) + 1.0 / (79.0 * PHI ** 2)
S_ELSEWHERE = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 18, 20, 24, 30, 32, 35, 40,
    50, 51, 63, 64, 79, 80, 81, 90, 105, 190,
]
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
    if isinstance(o, float) and not np.isfinite(o):
        return None
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
    phase = np.exp(1j * np.asarray(theta, dtype=float))
    return Delta0 * np.outer(phase, phase)


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


def fermion_omega(pos, pos0, T):
    if T <= 0:
        return -0.5 * (float(np.sum(pos)) - float(np.sum(pos0)))
    return -T * float(np.sum(log2cosh(pos / (2.0 * T)))) + T * float(
        np.sum(log2cosh(pos0 / (2.0 * T)))
    )


def analyse_PiT(PiT, D1T):
    PiT = 0.5 * (PiT + PiT.T)
    D1T = 0.5 * (D1T + D1T.T)
    evP = eigvalsh(PiT)
    evD = eigvalsh(D1T)
    gev = eigh(PiT, D1T, eigvals_only=True)
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
    mean = float(np.mean(gev))
    spread = float((np.max(gev) - np.min(gev)) / max(abs(mean), 1e-12))
    unique = bool(spread < 0.05)
    finite = bool(np.max(np.abs(gev)) < 1e10)
    all_pos = bool(np.min(gev) > 0)
    all_neg = bool(np.max(gev) < 0)
    posdef = bool(evP.min() > 1e-10)
    usable = bool(posdef and resid_M is not None and resid_M < 0.10 and unique and finite and all_pos)
    return {
        "lambda_min_PiT": float(evP.min()),
        "lambda_max_PiT": float(evP.max()),
        "n_neg": int(np.sum(evP < -1e-10)),
        "n_pos": int(np.sum(evP > 1e-10)),
        "n_zeroish": int(np.sum(np.abs(evP) <= 1e-10)),
        "positive_definite": posdef,
        "kappa_gen_minmax": [float(np.min(gev)), float(np.max(gev))],
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
        "usable_derived_kappa": usable,
        "pred_plus_1_over_12": 1.0 / 12.0,
        "rel_lmin_to_plus_1_12": float(abs(evP.min() - 1.0 / 12.0) / (1.0 / 12.0)),
        "rel_lmax_to_plus_1_12": float(abs(evP.max() - 1.0 / 12.0) / (1.0 / 12.0)),
        "pred_tanh_over_12": None,
        "eigenvalues": evP.tolist(),
    }


def hess_trans_bg(omega_A, trans, eps, A_bg):
    nT = trans.shape[1]
    H = np.zeros((nT, nT))
    om0 = omega_A(A_bg)
    for i in range(nT):
        Ap = A_bg + eps * trans[:, i]
        Am = A_bg - eps * trans[:, i]
        H[i, i] = (omega_A(Ap) + omega_A(Am) - 2.0 * om0) / (eps * eps)
    for i in range(nT):
        for j in range(i + 1, nT):
            App = A_bg + eps * (trans[:, i] + trans[:, j])
            Amm = A_bg - eps * (trans[:, i] + trans[:, j])
            Apm = A_bg + eps * (trans[:, i] - trans[:, j])
            Amp = A_bg - eps * (trans[:, i] - trans[:, j])
            H[i, j] = H[j, i] = (omega_A(App) + omega_A(Amm) - omega_A(Apm) - omega_A(Amp)) / (
                4.0 * eps * eps
            )
    return 0.5 * (H + H.T), float(om0)


def look_elsewhere(value):
    hits_target = 0
    hits_value = 0
    n = 0
    examples_target = []
    examples_value = []
    for nn in S_ELSEWHERE:
        for m in S_ELSEWHERE:
            for k in (0, 1, 2):
                x = nn / (m * (PHI ** k))
                n += 1
                if abs(x - R_ALPHA) / R_ALPHA < 1e-4:
                    hits_target += 1
                    if len(examples_target) < 8:
                        examples_target.append({"n": nn, "m": m, "k": k, "x": float(x)})
                if value is not None and abs(value) > 1e-30 and abs(x - value) / abs(value) < 1e-4:
                    hits_value += 1
                    if len(examples_value) < 8:
                        examples_value.append({"n": nn, "m": m, "k": k, "x": float(x)})
    return {
        "ensemble_size": n,
        "hits_near_R_alpha": hits_target,
        "hits_near_value": hits_value,
        "examples_near_R_alpha": examples_target,
        "examples_near_value": examples_value,
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
    assert nE == 30

    c18 = json.loads((ROOT / "coupled_cycle18_nambu_measure" / "results.json").read_text())
    hat = np.asarray(c18["even_hat"], dtype=float)
    hat = hat / np.linalg.norm(hat)
    r_star = float(np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_r_even_4_5.npy")[0])
    Delta_unit = pairing_matrix(EVEN_FRAME, hat, edges)

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
    A_zero = np.zeros(nE)
    rng = np.random.default_rng(25)

    def analyze(r, T, A_bg, eps=0.02, n_lam=6):
        Delta0 = r * Delta_unit
        pos0 = bdg_pos(magnetic_laplacian(edges, A_bg), Delta0)

        def omega(A, theta):
            KA = magnetic_laplacian(edges, A)
            D = dress_delta(Delta0, theta)
            return fermion_omega(bdg_pos(KA, D), pos0, T)

        def omega_A(A):
            return omega(A, np.zeros(12))

        om0 = omega(A_bg, np.zeros(12))
        Emin = float(pos0.min())

        gi_res = []
        wi_hess = []
        wi_grad = []
        for _ in range(n_lam):
            lam = rng.normal(size=12)
            lam = lam - lam.mean()
            nrm = np.linalg.norm(lam)
            if nrm < 1e-12:
                continue
            A = -(d0 @ lam)
            th = -lam
            gi_res.append(abs(omega(A_bg + A, th) - om0))
            A0 = 0.02 * rng.normal(size=nE)
            th0 = 0.02 * rng.normal(size=12)
            gi_res.append(abs(omega(A_bg + A0 + A, th0 + th) - omega(A_bg + A0, th0)))
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
            hess = (omega(A_bg + eps_g * A, eps_g * th) + omega(A_bg - eps_g * A, -eps_g * th) - 2.0 * om0) / (
                eps_g ** 2
            )
            wi_hess.append(hess)
            grad = (omega(A_bg + eps_g * A, eps_g * th) - omega(A_bg - eps_g * A, -eps_g * th)) / (2.0 * eps_g)
            wi_grad.append(grad)

        HT, _ = hess_trans_bg(omega_A, trans, eps, A_bg)
        anal = analyse_PiT(HT, D1T)
        if T > 0:
            anal["pred_tanh_over_12"] = float(np.tanh(10.0 / (2.0 * T)) / 12.0)
        else:
            anal["pred_tanh_over_12"] = 1.0 / 12.0
        anal["rel_cI_to_pred"] = float(
            abs(anal["c_identity"] - anal["pred_tanh_over_12"]) / max(abs(anal["pred_tanh_over_12"]), 1e-30)
        )
        return {
            "r": r,
            "T": T,
            "Emin_bg": Emin,
            "omega_bg": float(om0),
            "gauge_invariance_max_residual": float(max(gi_res) if gi_res else 0.0),
            "WI_hessian_max_abs": float(max(np.abs(wi_hess)) if wi_hess else 0.0),
            "WI_gradient_max_abs": float(max(np.abs(wi_grad)) if wi_grad else 0.0),
            "Pi": anal,
        }

    r_scan = [("r20", 20.0), ("r100", 100.0), ("rstar", r_star)]
    T_scan = [("T0", 0.0), ("Teta", ETA)]
    points = {}
    print("cycle 25 points...", flush=True)
    for rname, r in r_scan:
        for Tname, T in T_scan:
            tag = f"{rname}_{Tname}"
            print(f"  {tag} r={r:.6g} T={T:.6g}", flush=True)
            points[tag] = analyze(r, T, A_pi, eps=0.02, n_lam=5)

    print("  control A=0 rstar T0", flush=True)
    control = analyze(r_star, 0.0, A_zero, eps=0.02, n_lam=3)
    print("  eps control rstar T0", flush=True)
    rec_eps = analyze(r_star, 0.0, A_pi, eps=0.05, n_lam=2)
    eps_rel = abs(rec_eps["Pi"]["lambda_min_PiT"] - points["rstar_T0"]["Pi"]["lambda_min_PiT"]) / max(
        abs(points["rstar_T0"]["Pi"]["lambda_min_PiT"]), 1e-12
    )

    gi_ok = all(p["gauge_invariance_max_residual"] < 1e-8 for p in points.values())
    wi_ok = all(p["WI_hessian_max_abs"] < 1e-6 and p["WI_gradient_max_abs"] < 1e-7 for p in points.values())
    phys = points["rstar_Teta"]
    phys_T0 = points["rstar_T0"]
    large_vev_T0 = phys_T0["Pi"]["positive_definite"] and phys_T0["Pi"]["identity_like"]
    large_vev_Teta = phys["Pi"]["positive_definite"]
    ye_indep_T0 = abs(phys_T0["Pi"]["c_identity"] - points["r100_T0"]["Pi"]["c_identity"]) / max(
        abs(phys_T0["Pi"]["c_identity"]), 1e-30
    ) < 0.05
    ye_indep_Teta = abs(phys["Pi"]["c_identity"] - points["r100_Teta"]["Pi"]["c_identity"]) / max(
        abs(phys["Pi"]["c_identity"]), 1e-30
    ) < 0.05

    H1 = bool(
        phys_T0["Pi"]["positive_definite"]
        and phys_T0["Pi"]["identity_like"]
        and phys_T0["Pi"]["rel_cI_to_pred"] < 0.15
    )
    H2_not_maxwell = (not phys["Pi"]["maxwell_like"]) and (not phys_T0["Pi"]["maxwell_like"])
    H2_not_unique = (not phys["Pi"]["usable_derived_kappa"]) and (not phys_T0["Pi"]["usable_derived_kappa"])
    H3 = bool(ye_indep_T0 and ye_indep_Teta)
    H4 = bool(gi_ok and wi_ok)
    control_ok = bool(
        control["Pi"]["identity_like"]
        and abs(control["Pi"]["c_identity"] + 1.0 / 12.0) / (1.0 / 12.0) < 0.15
    )

    # α_eff comparison only if usable
    compare_slice = None
    if phys["Pi"]["usable_derived_kappa"]:
        compare_slice = "rstar_Teta"
        kappa = phys["Pi"]["kappa_iso"]
        kappa_rem = phys["Pi"]["kappa_REM"]
    elif phys_T0["Pi"]["usable_derived_kappa"]:
        compare_slice = "rstar_T0"
        kappa = phys_T0["Pi"]["kappa_iso"]
        kappa_rem = phys_T0["Pi"]["kappa_REM"]
    else:
        kappa = None
        kappa_rem = None

    arf = {
        "ARF_comparison_performed": False,
        "reason": None,
        "R_alpha": R_ALPHA,
        "R_alpha_closed_form": "3/(64*phi) + 1/(79*phi**2)",
    }
    if compare_slice is None:
        arf["reason"] = (
            "Π_T about the π-flux vacuum is not a unique positive Maxwell "
            "coefficient at (r_*, T=η) or (r_*, T=0); 1/κ is not compared."
        )
    else:
        alpha_eff = 1.0 / kappa
        alpha_rem = 1.0 / kappa_rem
        rel_eff = abs(alpha_eff - R_ALPHA) / R_ALPHA
        rel_rem = abs(alpha_rem - R_ALPHA) / R_ALPHA
        le = look_elsewhere(alpha_eff)
        arf.update({
            "ARF_comparison_performed": True,
            "slice": compare_slice,
            "kappa_iso": kappa,
            "kappa_REM": kappa_rem,
            "alpha_eff": alpha_eff,
            "alpha_REM": alpha_rem,
            "rel_err_alpha_eff": rel_eff,
            "rel_err_alpha_REM": rel_rem,
            "match_alpha_eff": bool(rel_eff < 1e-4),
            "match_alpha_REM": bool(rel_rem < 1e-4),
            "look_elsewhere": le,
        })

    if H1 and H2_not_unique and H3 and H4 and control_ok:
        classification = "PROVED"
        note = (
            "About the π-flux + 4_5 vacuum the transverse kernel is positive "
            "definite and identity-like (c_I → +1/12 at T=0), not Maxwell-like; "
            "the leading piece is independent of y_even in the large-vev limit; "
            "the longitudinal WI holds. No derived unique κ, so no R_α comparison."
        )
    else:
        classification = "CONDITIONAL"
        note = (
            f"H1={H1} H2_not_maxwell={H2_not_maxwell} H2_not_unique={H2_not_unique} "
            f"H3={H3} H4={H4} control_ok={control_ok}"
        )

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "eta": ETA,
        "r_star": r_star,
        "R_alpha": R_ALPHA,
        "n_cycle": nT,
        "points": points,
        "control_A0_rstar_T0": control,
        "eps_0p05_rstar_T0": rec_eps["Pi"],
        "eps_rel_diff": float(eps_rel),
        "hypotheses": {
            "H1_T0_identity_plus_1_over_12": H1,
            "H2_not_maxwell_like": H2_not_maxwell,
            "H2_not_usable_kappa": H2_not_unique,
            "H3_large_vev_independent_of_ye": H3,
            "H4_WI_holds_about_pi": H4,
            "control_A0_recovers_minus_1_over_12": control_ok,
        },
        "large_vev_positive_definite_T0": large_vev_T0,
        "large_vev_positive_definite_Teta": bool(large_vev_Teta),
        "Meissner_positive_definite_about_pi_flux": bool(
            phys_T0["Pi"]["positive_definite"] and phys["Pi"]["positive_definite"]
        ),
        "Maxwell_like": bool(phys["Pi"]["maxwell_like"] or phys_T0["Pi"]["maxwell_like"]),
        "derived_unique_kappa": bool(compare_slice is not None),
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
        "meissner": results["Meissner_positive_definite_about_pi_flux"],
        "maxwell": results["Maxwell_like"],
        "eps_rel": float(eps_rel),
        "control_cI": control["Pi"]["c_identity"],
    }
    for k, rec in points.items():
        summary[k] = {
            "Emin": rec["Emin_bg"],
            "gi": rec["gauge_invariance_max_residual"],
            "wi_h": rec["WI_hessian_max_abs"],
            "lmin": rec["Pi"]["lambda_min_PiT"],
            "lmax": rec["Pi"]["lambda_max_PiT"],
            "n_neg": rec["Pi"]["n_neg"],
            "n_pos": rec["Pi"]["n_pos"],
            "cI": rec["Pi"]["c_identity"],
            "resid_I": rec["Pi"]["residual_identity"],
            "resid_M": rec["Pi"]["residual_maxwell"],
            "k_iso": rec["Pi"]["kappa_iso"],
            "k_spread": rec["Pi"]["kappa_gen_spread"],
            "k_minmax": rec["Pi"]["kappa_gen_minmax"],
            "posdef": rec["Pi"]["positive_definite"],
            "id_like": rec["Pi"]["identity_like"],
            "maxwell": rec["Pi"]["maxwell_like"],
            "usable": rec["Pi"]["usable_derived_kappa"],
            "rel_cI_pred": rec["Pi"]["rel_cI_to_pred"],
            "pred": rec["Pi"]["pred_tanh_over_12"],
        }
    print(json.dumps(sanitize(summary), indent=2))


if __name__ == "__main__":
    main()
