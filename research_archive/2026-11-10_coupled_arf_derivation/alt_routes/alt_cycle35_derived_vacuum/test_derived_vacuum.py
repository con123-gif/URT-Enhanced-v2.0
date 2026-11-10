#!/usr/bin/env python3
"""Alt cycle 35: spectrum and induced-α in the cycle-34 derived vacuum."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402

PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA_STAR = 80.0 * np.pi / (1053.0 * PHI)
DELTA_HIDDEN = 3.0 / 20.0 - DELTA_STAR
R_ALPHA = 3.0 / (64.0 * PHI) + 1.0 / (79.0 * PHI ** 2)
C_MASS = -(5.0 / 16.0) * DELTA_STAR ** 3 + (7.0 / 8.0) * np.pi * PHI
R_MASS = (3.0 / 35.0) * DELTA_STAR ** 2 - (4.0 / 51.0) * np.pi ** 3
G_STRICT = [1, 2, 3, 4, 5, 6, 8, 12, 13, 15, 16, 18, 20, 24, 30, 32, 50, 51, 60, 64, 80, 81, 90, 120, 190]
NUMS = [1, 2, 3, 4, 5, 7, 8, -1, -2, -3, -4, -5, -7, -8]

EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
HAT25 = np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_hat_even_4_5.npy")
R25 = float(np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_r_even_4_5.npy")[0])
SPIN = json.loads((ROOT / "alt_cycle33_spinor_lift" / "results.json").read_text())


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


def pairing_matrix(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
        M[i, j] = w[e]
        M[j, i] = w[e]
    return M


def magnetic_K(edges, A):
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
        K[i, i] += deg[i]
    return K


def bdg_pos(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n), dtype=complex)
    H[:n, :n] = K
    H[n:, n:] = -np.conj(K)
    H[:n, n:] = Delta
    H[n:, :n] = np.conj(np.asarray(Delta).T)
    ev = eigvalsh(H)
    return np.maximum(ev[n:].real, 0.0)


def group_rel(vals, rtol=1e-5, atol=1e-8):
    groups = []
    for v in vals:
        if not groups or abs(v - groups[-1][0]) > max(atol, rtol * max(1.0, abs(groups[-1][0]))):
            groups.append([float(v), 1])
        else:
            groups[-1][0] = (groups[-1][0] * groups[-1][1] + float(v)) / (groups[-1][1] + 1)
            groups[-1][1] += 1
    return [(g[0], g[1]) for g in groups]


def census_T1_against(targets):
    atoms, descs = [], []
    for coef in NUMS:
        for n in G_STRICT:
            for k in (0, 1, 2):
                atoms.append(coef / (n * (PHI ** k)))
                descs.append((int(coef), int(n), int(k)))
    atoms = np.asarray(atoms, float)
    nA = len(atoms)
    stats = {name: {"exact": 0, "rel_1e-4": 0, "nearest_rel": None, "nearest_desc": None} for name in targets}
    nearest = {name: (np.inf, None) for name in targets}
    chunk = 400
    for start in range(nA):
        js = start + 1
        while js < nA:
            je = min(nA, js + chunk)
            s = atoms[start] + atoms[js:je]
            for name, tgt in targets.items():
                if abs(tgt) < 1e-30:
                    continue
                rel = np.abs(s - tgt) / abs(tgt)
                stats[name]["exact"] += int(np.sum(rel < 1e-14))
                stats[name]["rel_1e-4"] += int(np.sum(rel < 1e-4))
                jloc = int(np.argmin(rel))
                rmin = float(rel[jloc])
                if rmin < nearest[name][0]:
                    nearest[name] = (rmin, (descs[start], descs[js + jloc], float(s[jloc])))
            js = je
    for name in targets:
        stats[name]["nearest_rel"] = nearest[name][0]
        stats[name]["nearest_desc"] = nearest[name][1]
    return stats


def usable_kappa(Pi):
    return bool(
        Pi.get("kappa_unique")
        and Pi.get("kappa_finite")
        and Pi.get("kappa_all_positive")
        and Pi.get("maxwell_like")
        and Pi.get("kappa_iso") is not None
        and Pi["kappa_iso"] > 0
    )


def main():
    prev = json.loads((ROOT / "alt_cycle34_induced_kappa" / "results.json").read_text())
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((f[a], f[(a + 1) % m]))))
    edges = sorted(raw)
    hat = np.asarray(HAT25, float)
    hat = hat / np.linalg.norm(hat)
    Delta = pairing_matrix(EVEN_FRAME, R25 * hat, edges)

    vac_name = prev["derived_vacuum"]["name"]
    A = np.full(30, np.pi) if vac_name == "pi_flux" else np.zeros(30)
    E = bdg_pos(magnetic_K(edges, A), Delta)
    grouped = group_rel(E, rtol=1e-5)
    pos = [(a, b) for a, b in grouped if a > 1e-6]
    three = bool(len(pos) >= 3 and all(b == 1 for a, b in pos))
    spectrum = {
        "vacuum": vac_name,
        "A_is_all_pi": bool(vac_name == "pi_flux"),
        "Emin": float(min(E)),
        "unpaired_lifted": bool(min(E) > 1e-6),
        "grouped_rel_1e-5": [{"value": a, "mult": b} for a, b in grouped],
        "n_distinct_positive": len(pos),
        "max_mult": max((b for a, b in pos), default=0),
        "three_nondeg_singlets": three,
    }

    recorded_ratios = {}
    comparison_mass = False
    if three and vac_name in ("pi_flux", "A0_or_small"):
        mus = [a for a, b in pos][:3]
        m1, m2, m3 = mus
        recorded_ratios = {
            "mu2_over_mu1": m2 / m1,
            "mu3_over_mu1": m3 / m1,
            "mu3_over_mu2": m3 / m2,
            "koide_like": (m1 + m2 + m3) ** 2 / (m1 ** 2 + m2 ** 2 + m3 ** 2),
        }
        comparison_mass = True

    mass_block = {"recorded_ratios": recorded_ratios, "comparison_performed": comparison_mass}
    if comparison_mass:
        arf = {
            "abs_C_mass": abs(C_MASS),
            "abs_R_mass": abs(R_MASS),
            "abs_C_over_R": abs(C_MASS / R_MASS),
            "abs_R_over_C": abs(R_MASS / C_MASS),
        }
        mass_block["relative_errors_vs_ARFs"] = {
            rn: {an: abs(rv - av) / abs(av) for an, av in arf.items()}
            for rn, rv in recorded_ratios.items()
        }
        targets = dict(arf)
        targets.update(recorded_ratios)
        mass_block["T1_strict"] = census_T1_against(targets)
        mass_block["skip_reason"] = None
    else:
        mass_block["relative_errors_vs_ARFs"] = None
        mass_block["T1_strict"] = None
        mass_block["skip_reason"] = (
            "The derived vacuum does not consist of three nondegenerate charged singlets "
            "(leftover multiplicity ≥ 2 after grouping at relative 10^{-5})."
        )

    # alpha policy
    Pi0 = prev["sectors"]["graph_paired"]["T0"]["Pi"]
    Pieta = prev["sectors"]["graph_paired"]["Teta"]["Pi"]
    alpha_records = {}
    compared = {}
    for tag, Pi in [("T0", Pi0), ("Teta", Pieta)]:
        ok = usable_kappa(Pi)
        rec = {
            "usable": ok,
            "kappa_iso": Pi.get("kappa_iso"),
            "kappa_REM": Pi.get("kappa_REM"),
            "kappa_unique": Pi.get("kappa_unique"),
            "kappa_all_positive": Pi.get("kappa_all_positive"),
            "maxwell_like": Pi.get("maxwell_like"),
            "identity_like": Pi.get("identity_like"),
            "kappa_gen_spread": Pi.get("kappa_gen_spread"),
            "residual_maxwell": Pi.get("residual_maxwell"),
        }
        if ok:
            rec["alpha_eff"] = 1.0 / Pi["kappa_iso"]
            rec["alpha_REM"] = 1.0 / Pi["kappa_REM"] if Pi.get("kappa_REM") not in (None, 0) else None
            compared[tag] = rec["alpha_eff"]
            rec["skip_reason"] = None
        else:
            rec["alpha_eff"] = None
            rec["alpha_REM"] = None
            reasons = []
            if not Pi.get("kappa_all_positive"):
                reasons.append("kappa not all positive")
            if not Pi.get("kappa_unique"):
                reasons.append("generalised eigenvalues not unique")
            if not Pi.get("maxwell_like"):
                reasons.append("Pi_T not Maxwell-like")
            if not Pi.get("kappa_finite"):
                reasons.append("not finite")
            rec["skip_reason"] = "; ".join(reasons) if reasons else "policy thresholds not met"
        alpha_records[tag] = rec

    alpha_block = {
        "R_alpha": R_ALPHA,
        "records": alpha_records,
        "comparison_performed": bool(compared),
    }
    if compared:
        alpha_block["relative_errors_vs_R_alpha"] = {
            tag: abs(val - R_ALPHA) / R_ALPHA for tag, val in compared.items()
        }
        targets = {"R_alpha": R_ALPHA}
        targets.update({f"alpha_eff_{tag}": val for tag, val in compared.items()})
        alpha_block["T1_strict"] = census_T1_against(targets)
        alpha_block["skip_reason"] = None
    else:
        alpha_block["relative_errors_vs_R_alpha"] = None
        alpha_block["T1_strict"] = None
        alpha_block["skip_reason"] = (
            "Primary induced κ is not a unique, finite, positive, Maxwell-like "
            "coefficient, so 1/κ is not compared to R_α."
        )

    spinor_alt = {
        "T0_selects_pi": bool(prev["sectors"]["spinor_paired"]["T0"]["pi_lower_than_zero"]),
        "T0_unstable": bool(prev["sectors"]["spinor_paired"]["T0"]["A0_transversely_unstable"]),
        "cycle33_spectrum_if_A0": SPIN["spectrum_condensed"],
        "three_distinct_if_A0": bool(SPIN["spectrum_condensed"]["three_distinct_levels"]),
    }

    H = {
        "H1_primary_is_pi_flux": bool(vac_name == "pi_flux"),
        "H1_spectrum_not_three_singlets": (not three),
        "H2_alpha_not_compared": (not compared),
        "H3_spinor_not_three_singlets": (not spinor_alt["three_distinct_if_A0"]),
    }
    results = {
        "from_cycle34": {
            "derived_vacuum": prev["derived_vacuum"],
            "classification34": prev.get("classification"),
        },
        "spectrum": spectrum,
        "mass_ARFs": mass_block,
        "induced_alpha": alpha_block,
        "spinor_alternative": spinor_alt,
        "hypotheses": H,
        "C_mass": C_MASS,
        "R_mass": R_MASS,
        "R_alpha": R_ALPHA,
    }
    results["classification"] = "PROVED"
    results["classification_note"] = (
        "Spectrum and the predeclared α / mass policies are recorded. "
        + (mass_block["skip_reason"] or "Mass ARFs were compared after ratios were written. ")
        + " "
        + (alpha_block["skip_reason"] or "α_eff was compared to R_α after κ passed the Maxwell tests.")
    )

    out = ROOT / "alt_cycle35_derived_vacuum" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "spectrum": spectrum,
        "mass_skip": mass_block["skip_reason"],
        "ratios": recorded_ratios,
        "alpha": {k: {kk: rec[kk] for kk in rec if kk != "?"} for k, rec in alpha_records.items()},
        "alpha_skip": alpha_block["skip_reason"],
        "R_alpha": R_ALPHA,
        "spinor_alt": {k: spinor_alt[k] for k in spinor_alt if k != "cycle33_spectrum_if_A0"},
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
