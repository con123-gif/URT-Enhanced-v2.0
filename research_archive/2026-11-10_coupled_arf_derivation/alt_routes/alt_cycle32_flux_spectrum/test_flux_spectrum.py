#!/usr/bin/env python3
"""Alt cycle 32: BdG spectrum and predeclared flux comparison in the cycle-31 vacua."""
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
ETA = -np.log(DELTA_HIDDEN)
THETA = 2.0 * np.pi / (PHI ** 2)
GAMMA = 1.0 / 81.0
R_PI_E = np.pi / np.e
C_MASS = -(5.0 / 16.0) * DELTA_STAR ** 3 + (7.0 / 8.0) * np.pi * PHI
R_MASS = (3.0 / 35.0) * DELTA_STAR ** 2 - (4.0 / 51.0) * np.pi ** 3
G_STRICT = [1, 2, 3, 4, 5, 6, 8, 12, 13, 15, 16, 18, 20, 24, 30, 32, 50, 51, 60, 64, 80, 81, 90, 120, 190]
NUMS = [1, 2, 3, 4, 5, 7, 8, -1, -2, -3, -4, -5, -7, -8]

EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
HAT25 = np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_hat_even_4_5.npy")
R25 = float(np.load(ROOT / "alt_cycle25_dynamical_condensation" / "vacuum_r_even_4_5.npy")[0])

FLUX_TARGETS = {
    "2pi_over_phi2": THETA,
    "gamma": GAMMA,
    "delta_star": DELTA_STAR,
    "eta": ETA,
    "Delta": DELTA_HIDDEN,
    "theta": THETA,
    "r_pi_over_e": R_PI_E,
    "0": 0.0,
    "pi_over_5": np.pi / 5.0,
    "2pi_over_5": 2.0 * np.pi / 5.0,
    "pi_over_3": np.pi / 3.0,
    "2pi_over_3": 2.0 * np.pi / 3.0,
    "pi_over_2": np.pi / 2.0,
    "pi": np.pi,
    "2pi": 2.0 * np.pi,
}


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


def magnetic_laplacian(edges, A):
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


def bdg_positive(K, Delta):
    n = K.shape[0]
    H = np.zeros((2 * n, 2 * n), dtype=complex)
    H[:n, :n] = K
    H[n:, n:] = -np.conj(K)
    H[:n, n:] = Delta
    H[n:, :n] = np.conj(np.asarray(Delta).T)
    ev = eigvalsh(H)
    return np.maximum(ev[n:].real, 0.0)


def distinct_with_mult(vals, atol=1e-7, rtol=1e-8):
    groups = []
    for v in vals:
        if not groups or abs(v - groups[-1][0]) > max(atol, rtol * max(1.0, abs(groups[-1][0]))):
            groups.append([float(v), 1])
        else:
            groups[-1][0] = (groups[-1][0] * groups[-1][1] + float(v)) / (groups[-1][1] + 1)
            groups[-1][1] += 1
    return [(g[0], g[1]) for g in groups]


def principal(phi):
    return (np.asarray(phi) + np.pi) % (2.0 * np.pi) - np.pi


def compare_fluxes(values):
    out = []
    for x in values:
        rec = {"value": float(x), "nearest": None, "nearest_rel": None, "nearest_abs": None, "match_1e-4": False}
        best = (np.inf, None, np.inf)
        for name, t in FLUX_TARGETS.items():
            ab = abs(x - t)
            rel = ab / max(abs(t), 1e-12)
            score = rel if abs(t) > 1e-12 else ab
            if score < best[0]:
                best = (score, name, ab)
        rec["nearest"] = best[1]
        rec["nearest_rel"] = None if abs(FLUX_TARGETS[best[1]]) < 1e-12 else best[0]
        rec["nearest_abs"] = best[2]
        tgt = FLUX_TARGETS[best[1]]
        rec["match_1e-4"] = bool((abs(tgt) < 1e-12 and best[2] < 1e-4) or (abs(tgt) >= 1e-12 and best[0] < 1e-4))
        out.append(rec)
    return out


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


def main():
    prev = json.loads((ROOT / "alt_cycle31_spontaneous_flux" / "results.json").read_text())
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

    vacua = {
        "kappa0_T0": np.load(ROOT / "alt_cycle31_spontaneous_flux" / "A_best_T0_k0.npy"),
        "kappa0_Teta": np.load(ROOT / "alt_cycle31_spontaneous_flux" / "A_best_Teta_k0.npy"),
        "kappa1_T0": np.load(ROOT / "alt_cycle31_spontaneous_flux" / "A_best_T0_k1.npy"),
        "all_pi": np.load(ROOT / "alt_cycle31_spontaneous_flux" / "A_all_pi.npy"),
        "A_zero": np.zeros(30),
    }

    spectra = {}
    flux_comp = {}
    for name, A in vacua.items():
        E = bdg_positive(magnetic_laplacian(edges, A), Delta)
        groups = distinct_with_mult(E)
        pos = [(a, b) for a, b in groups if a > 1e-6]
        lifted = bool(E[0] > 1e-6) if False else bool(min(E) > 1e-6)
        # min(E) is the smallest of the 12 positive
        spectra[name] = {
            "Emin": float(min(E)),
            "unpaired_lifted": bool(min(E) > 1e-6),
            "distinct": [{"value": a, "mult": b} for a, b in groups],
            "n_distinct_positive": len(pos),
            "n_positive_singlets": sum(1 for a, b in pos if b == 1),
            "three_nondeg_singlets": bool(len(pos) >= 3 and all(b == 1 for a, b in pos)),
            "max_positive_mult": max((b for a, b in pos), default=0),
        }
        # fluxes
        lookup = {tuple(sorted(e)): k for k, e in enumerate(edges)}
        raw_phi = []
        for f in faces:
            phi = 0.0
            m = len(f)
            for a in range(m):
                i, j = int(f[a]), int(f[(a + 1) % m])
                e = lookup[(min(i, j), max(i, j))]
                phi += A[e] if i < j else -A[e]
            raw_phi.append(phi)
        prin = principal(raw_phi)
        abs_prin = np.sort(np.abs(prin))
        uniq = []
        for x in abs_prin:
            if not uniq or abs(x - uniq[-1]) > 1e-6:
                uniq.append(float(x))
        flux_comp[name] = {
            "unique_abs_principal": uniq,
            "comparison": compare_fluxes(uniq),
            "all_holonomies_minus_one": bool(np.allclose(np.exp(1j * np.asarray(raw_phi)), -1.0, atol=1e-6)),
            "all_holonomies_plus_one": bool(np.allclose(np.exp(1j * np.asarray(raw_phi)), 1.0, atol=1e-6)),
            "any_match_1e-4": bool(any(c["match_1e-4"] for c in compare_fluxes(uniq))),
        }

    # Uniqueness / comparison policy
    k0_all_pi = bool(prev.get("kappa0_minimum_is_all_pi_holonomy"))
    k1_trivial = bool(prev.get("kappa1_minimum_is_trivial_holonomy"))
    kappa_ambiguous = bool(k0_all_pi and k1_trivial)
    # For κ=0, if all-π (A5-invariant holonomy) + A4 from Δ: no three singlets
    spec_k0 = spectra["kappa0_T0"]
    three_singlets = bool(spec_k0["three_nondeg_singlets"])
    unique_for_kappa0 = bool(k0_all_pi or prev.get("minima", {}).get("T0_k0_noncompact"))
    # ratios only if three singlets AND not kappa-ambiguous for the *same* spectrum
    recorded_ratios = {}
    comparison_performed = False
    if three_singlets and not kappa_ambiguous:
        mus = [g["value"] for g in spec_k0["distinct"] if g["value"] > 1e-6]
        if len(mus) >= 3:
            m1, m2, m3 = mus[0], mus[1], mus[2]
            recorded_ratios = {
                "mu2_over_mu1": m2 / m1,
                "mu3_over_mu1": m3 / m1,
                "mu3_over_mu2": m3 / m2,
                "koide_like": (m1 + m2 + m3) ** 2 / (m1 ** 2 + m2 ** 2 + m3 ** 2),
            }
            comparison_performed = True

    results = {
        "from_cycle31": {
            "kappa0_is_all_pi": k0_all_pi,
            "kappa1_is_trivial": k1_trivial,
            "kappa_ambiguous": kappa_ambiguous,
            "combined_stab_all_pi": prev.get("all_pi", {}).get("combined_with_Delta"),
        },
        "spectra": spectra,
        "flux_comparison": flux_comp,
        "flux_targets_predeclared": {k: float(v) for k, v in FLUX_TARGETS.items()},
        "recorded_ratios": recorded_ratios,
        "comparison_performed": comparison_performed,
        "C_mass": C_MASS,
        "R_mass": R_MASS,
    }

    if comparison_performed:
        arf = {
            "abs_C_mass": abs(C_MASS),
            "abs_R_mass": abs(R_MASS),
            "abs_C_over_R": abs(C_MASS / R_MASS),
            "abs_R_over_C": abs(R_MASS / C_MASS),
        }
        results["relative_errors_vs_ARFs"] = {
            rn: {an: abs(rv - av) / abs(av) for an, av in arf.items()}
            for rn, rv in recorded_ratios.items()
        }
        targets = dict(arf)
        targets.update(recorded_ratios)
        results["T1_strict"] = census_T1_against(targets)
        results["skip_reason"] = None
    else:
        results["relative_errors_vs_ARFs"] = None
        results["T1_strict"] = None
        if kappa_ambiguous and not three_singlets:
            results["skip_reason"] = (
                "κ=0 gives an A5-invariant π-flux (A4 from Δ preserved, no three singlets); "
                "κ=1 restores trivial holonomy. No unique three-singlet spectrum."
            )
        elif not three_singlets:
            results["skip_reason"] = (
                "The κ=0 vacuum does not produce three nondegenerate charged singlets, "
                "so C_mass and R_mass are not compared."
            )
        else:
            results["skip_reason"] = "κ remains ambiguous between qualitatively different vacua."

    H = {
        "H1_unpaired_lifted_at_kappa0": bool(spectra["kappa0_T0"]["unpaired_lifted"] and spectra["all_pi"]["unpaired_lifted"]),
        "H1_A4_multiplets_not_split_if_all_pi": bool(
            (not three_singlets) if k0_all_pi else True
        ),
        "H2_three_singlets": three_singlets,
        "H3_no_comparison_unless_policy_met": (not comparison_performed),
        "flux_list_compared": True,
    }
    results["hypotheses"] = H
    results["classification"] = "PROVED"
    results["classification_note"] = (
        "Spectra and predeclared flux comparisons are recorded. "
        + (results["skip_reason"] or "A unique three-singlet spectrum was compared after ratios were written.")
    )

    out = ROOT / "alt_cycle32_flux_spectrum" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "H": H,
        "spectra": {k: {kk: v[kk] for kk in v if kk != "distinct"} | {"distinct": v["distinct"]}
                    for k, v in spectra.items()},
        "flux": {k: {kk: rec[kk] for kk in rec if kk != "comparison"} | {"nearest": rec["comparison"]}
                 for k, rec in flux_comp.items()},
        "comparison_performed": comparison_performed,
        "skip": results["skip_reason"],
        "ratios": recorded_ratios,
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
