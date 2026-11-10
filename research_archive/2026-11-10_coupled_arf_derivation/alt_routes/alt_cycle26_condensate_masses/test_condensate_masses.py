#!/usr/bin/env python3
"""Alt cycle 26: charged-fermion BdG masses from the cycle-25 vacuum."""
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
C_MASS = -(5.0 / 16.0) * DELTA_STAR ** 3 + (7.0 / 8.0) * np.pi * PHI
R_MASS = (3.0 / 35.0) * DELTA_STAR ** 2 - (4.0 / 51.0) * np.pi ** 3
G_STRICT = [1, 2, 3, 4, 5, 6, 8, 12, 13, 15, 16, 18, 20, 24, 30, 32, 50, 51, 60, 64, 80, 81, 90, 120, 190]
NUMS = [1, 2, 3, 4, 5, 7, 8, -1, -2, -3, -4, -5, -7, -8]

EVEN_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "even_adjacent_current_frame.npy")
ODD_FRAME = np.load(ROOT / "coupled_cycle11_counterexample_or_ray" / "odd_adjacent_current_frame.npy")


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


def pairing_matrix(frame, h, edges):
    w = frame.T @ np.asarray(h, dtype=float)
    M = np.zeros((12, 12))
    for e, (i, j) in enumerate(edges):
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
    pos = ev[n:]
    return np.maximum(pos, 0.0)


def distinct_with_mult(vals, atol=1e-8, rtol=1e-7):
    groups = []
    for v in vals:
        if not groups or abs(v - groups[-1][0]) > max(atol, rtol * abs(groups[-1][0])):
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
    atoms = np.asarray(atoms, dtype=float)
    nA = len(atoms)
    stats = {
        name: {"exact": 0, "rel_1e-6": 0, "rel_1e-4": 0, "rel_1e-3": 0,
               "nearest_rel": None, "nearest_desc": None, "n_pairs": 0}
        for name in targets
    }
    nearest = {name: (np.inf, None) for name in targets}
    tvals = {name: float(targets[name]) for name in targets}
    n_pairs = 0
    chunk = 400
    for start in range(nA):
        js_begin = start + 1
        while js_begin < nA:
            js_end = min(nA, js_begin + chunk)
            s = atoms[start] + atoms[js_begin:js_end]
            n_pairs += s.size
            for name, tgt in tvals.items():
                if abs(tgt) < 1e-30:
                    continue
                rel = np.abs(s - tgt) / abs(tgt)
                stats[name]["exact"] += int(np.sum(rel < 1e-14))
                stats[name]["rel_1e-6"] += int(np.sum(rel < 1e-6))
                stats[name]["rel_1e-4"] += int(np.sum(rel < 1e-4))
                stats[name]["rel_1e-3"] += int(np.sum(rel < 1e-3))
                jloc = int(np.argmin(rel))
                rmin = float(rel[jloc])
                j = js_begin + jloc
                if rmin < nearest[name][0]:
                    nearest[name] = (rmin, (descs[start], descs[j], float(s[jloc])))
            js_begin = js_end
    for name in targets:
        stats[name]["n_pairs"] = n_pairs
        stats[name]["nearest_rel"] = nearest[name][0]
        stats[name]["nearest_desc"] = nearest[name][1]
    stats["_n_atoms"] = nA
    return stats


def main():
    prev_path = ROOT / "alt_cycle25_dynamical_condensation" / "results.json"
    prev = json.loads(prev_path.read_text())
    even = prev["channels"]["even_4_5"]
    odd = prev["channels"]["odd_4_3"]
    degenerate = bool(prev.get("sphere_essentially_degenerate", False))
    condensed = bool(even.get("y1_condenses_Teta")) and even.get("vacuum_hat") is not None
    stab = even.get("stabilizer_vector") or {}
    stab_name = stab.get("name")

    # Uniqueness criterion of the predeclaration
    unique_orbit = bool(
        condensed
        and not degenerate
        and stab_name in {"A4", "D3", "C3", "C2xC2", "C2", "1"}
    )

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
    K = graph_laplacian(12, edges)

    results = {
        "from_cycle25": {
            "even_condenses_at_y1": condensed,
            "odd_condenses_at_y1": bool(odd.get("y1_condenses_Teta")),
            "sphere_essentially_degenerate": degenerate,
            "even_stab": stab,
            "even_stab_ray": even.get("stabilizer_ray"),
            "even_y_c": even.get("y_c_Teta"),
            "odd_y_c": odd.get("y_c_Teta"),
            "vacuum_r": even.get("vacuum_r"),
            "classification_25": prev.get("classification"),
        },
        "unique_A5_orbit_of_vacua": unique_orbit,
        "comparison_performed": False,
        "C_mass": C_MASS,
        "R_mass": R_MASS,
        "abs_C_mass": abs(C_MASS),
        "abs_R_mass": abs(R_MASS),
        "abs_C_over_R": abs(C_MASS / R_MASS),
        "abs_R_over_C": abs(R_MASS / C_MASS),
    }

    spectra = {}
    if condensed:
        hat = np.asarray(even["vacuum_hat"], dtype=float)
        r = float(even["vacuum_r"])
        # Primary: y_even=1, y_odd=0
        Delta = pairing_matrix(EVEN_FRAME, 1.0 * r * hat, edges)
        E = bdg_positive_energies(K, Delta)
        groups = distinct_with_mult(E)
        mus = [g[0] for g in groups]
        spectra["primary_yeven1_yodd0"] = {
            "energies": E.tolist(),
            "distinct": [{"value": a, "mult": b} for a, b in groups],
            "n_distinct": len(groups),
            "n_positive_distinct": sum(1 for a, _ in groups if a > 1e-10),
            "hat": hat.tolist(),
            "r": r,
            "y_even": 1.0,
            "y_odd": 0.0,
        }
        # Large-vev diagnostic: singular values of the unit pairing matrix
        Mhat = pairing_matrix(EVEN_FRAME, hat, edges)
        sig = np.sort(np.linalg.svd(Mhat, compute_uv=False))[::-1]
        sig_groups = distinct_with_mult(sig)
        spectra["pairing_singular_values_of_unit_hat"] = {
            "sigma": sig.tolist(),
            "distinct": [{"value": a, "mult": b} for a, b in sig_groups],
            "n_distinct": len(sig_groups),
        }
        # If odd also condenses at y=1, report the mixed y_even=y_odd=1 spectrum too (diagnostic)
        if odd.get("y1_condenses_Teta") and odd.get("vacuum_hat") is not None:
            hat_o = np.asarray(odd["vacuum_hat"], dtype=float)
            r_o = float(odd["vacuum_r"])
            Delta_m = pairing_matrix(EVEN_FRAME, r * hat, edges) + pairing_matrix(ODD_FRAME, r_o * hat_o, edges)
            Em = bdg_positive_energies(K, Delta_m)
            spectra["mixed_y_even1_y_odd1"] = {
                "energies": Em.tolist(),
                "distinct": [{"value": a, "mult": b} for a, b in distinct_with_mult(Em)],
                "n_distinct": len(distinct_with_mult(Em)),
            }
        # Ratios among distinct positive values (always recorded as diagnostics)
        pos_mu = [m for m in mus if m > 1e-10]
        ratios = {}
        if len(pos_mu) >= 2:
            for i in range(len(pos_mu)):
                for j in range(i + 1, len(pos_mu)):
                    ratios[f"mu{i+1}_over_mu{j+1}"] = pos_mu[i] / pos_mu[j]
                    ratios[f"mu{j+1}_over_mu{i+1}"] = pos_mu[j] / pos_mu[i]
        if len(pos_mu) >= 3:
            m1, m2, m3 = pos_mu[0], pos_mu[1], pos_mu[2]
            ratios["lowest_three_mu2_over_mu1"] = m2 / m1
            ratios["lowest_three_mu3_over_mu1"] = m3 / m1
            ratios["lowest_three_mu3_over_mu2"] = m3 / m2
            ratios["koide_like"] = (m1 + m2 + m3) ** 2 / (m1 ** 2 + m2 ** 2 + m3 ** 2)
        spectra["primary_yeven1_yodd0"]["ratios"] = ratios
        spectra["primary_yeven1_yodd0"]["three_nondegenerate"] = bool(len(pos_mu) >= 3)
        results["recorded_ratios"] = ratios
        results["n_distinct_positive"] = len(pos_mu)
        results["three_nondegenerate_masses"] = bool(len(pos_mu) >= 3)
    else:
        results["recorded_ratios"] = {}
        results["n_distinct_positive"] = 0
        results["three_nondegenerate_masses"] = False
        results["skip_reason"] = "cycle 25 did not produce an even condensate at y=1"

    results["spectra"] = spectra

    # Comparison policy: only if unique orbit and at least one recorded ratio
    do_compare = bool(unique_orbit and results.get("recorded_ratios"))
    results["comparison_performed"] = do_compare
    if not do_compare:
        if condensed and degenerate:
            results["skip_reason"] = (
                "Ω is essentially flat on the hidden 4-sphere, so the condensate "
                "direction is a continuous modulus; no parameter-free spectrum."
            )
        elif condensed and not unique_orbit:
            results["skip_reason"] = (
                "Condensate exists but does not determine a unique A5-orbit "
                f"(stab={stab_name}, degenerate={degenerate})."
            )
        results["H3_no_comparison"] = True
        results["relative_errors_vs_ARFs"] = None
        results["T1_strict"] = None
        results["classification"] = "PROVED" if not condensed else "CONDITIONAL"
        results["classification_note"] = results.get("skip_reason", "no comparison")
    else:
        # Ratios were recorded above BEFORE this comparison block.
        arf = {
            "abs_C_mass": abs(C_MASS),
            "abs_R_mass": abs(R_MASS),
            "abs_C_over_R": abs(C_MASS / R_MASS),
            "abs_R_over_C": abs(R_MASS / C_MASS),
        }
        rel_err = {}
        for rname, rval in results["recorded_ratios"].items():
            rel_err[rname] = {an: abs(rval - av) / abs(av) for an, av in arf.items()}
            rel_err[rname]["any_within_1e-4"] = any(v < 1e-4 for v in rel_err[rname].values() if isinstance(v, float))
        results["relative_errors_vs_ARFs"] = rel_err
        targets = dict(arf)
        targets.update(results["recorded_ratios"])
        print("census T1 strict...")
        results["T1_strict"] = census_T1_against(targets)
        hit = any(rel_err[r]["any_within_1e-4"] for r in rel_err)
        results["any_ratio_within_1e-4_of_an_ARF"] = hit
        three = results["three_nondegenerate_masses"]
        if three and not hit:
            results["classification"] = "PROVED"
            results["classification_note"] = (
                "Unique-orbit BdG spectrum has three or more distinct positive "
                "values without new parameters; none of the recorded ratios "
                "matches |C_mass|, |R_mass| or their quotient at 1e-4."
            )
        elif three and hit:
            results["classification"] = "CONDITIONAL"
            results["classification_note"] = (
                "A numerical near-hit of an ARF by a recorded ratio is not a derivation; "
                "see relative_errors_vs_ARFs and T1_strict."
            )
        else:
            results["classification"] = "PROVED"
            results["classification_note"] = (
                "Unique-orbit spectrum does not contain three distinct positive masses."
            )

    results["hypotheses"] = {
        "H1_three_nondeg_without_new_params": bool(
            unique_orbit and results.get("three_nondegenerate_masses")
        ),
        "H2_stab_name": stab_name,
        "H3_comparison_skipped_if_no_unique_spectrum": (not do_compare),
    }

    out = ROOT / "alt_cycle26_condensate_masses" / "results.json"
    out.write_text(json.dumps(jsonable(results), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": results["classification"],
        "unique_orbit": unique_orbit,
        "comparison_performed": do_compare,
        "n_distinct_positive": results.get("n_distinct_positive"),
        "three_nondegenerate": results.get("three_nondegenerate_masses"),
        "stab": stab_name,
        "degenerate": degenerate,
        "ratios": results.get("recorded_ratios"),
        "note": results.get("classification_note"),
        "skip": results.get("skip_reason"),
    }), indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
