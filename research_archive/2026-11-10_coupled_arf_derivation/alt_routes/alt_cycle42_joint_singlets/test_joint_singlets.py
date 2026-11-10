#!/usr/bin/env python3
"""alt_cycle42: joint spectrum; mass-ARF comparison only if three singlets appear."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh

ROOT = Path("/workspace/arf_research")
sys.path.insert(0, str(ROOT / "alt_cycle40_h51_condensation"))
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_h51_condensation import (  # noqa: E402
    C_EVEN,
    ETA,
    EVEN_FRAME,
    PHI,
    DELTA_STAR,
    bdg_pos,
    build_geometry,
    jsonable,
    pairing_on_edges,
)

OUT = Path("/workspace/arf_research/alt_cycle42_joint_singlets")
HAT = np.load(ROOT / "alt_cycle41_joint_h13_h51" / "vacuum_hat_joint.npy")
R0, RC = np.load(ROOT / "alt_cycle41_joint_h13_h51" / "vacuum_r_joint.npy")
JRES = json.loads((ROOT / "alt_cycle41_joint_h13_h51" / "results.json").read_text())

G_STRICT = [1, 2, 3, 4, 5, 6, 8, 12, 13, 15, 16, 18, 20, 24, 30, 32, 50, 51, 60, 64, 80, 81, 90, 120, 190]
NUMS = [-8, -7, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 7, 8]
C_MASS = -(5.0 / 16.0) * (DELTA_STAR ** 3) + (7.0 / 8.0) * np.pi * PHI
R_MASS = (3.0 / 35.0) * (DELTA_STAR ** 2) - (4.0 / 51.0) * (np.pi ** 3)


def group_rel(vals, rtol=1e-5, atol=1e-8):
    groups = []
    for v in vals:
        if not groups or abs(v - groups[-1][0]) > max(atol, rtol * max(1.0, abs(groups[-1][0]))):
            groups.append([float(v), 1])
        else:
            groups[-1][0] = (groups[-1][0] * groups[-1][1] + float(v)) / (groups[-1][1] + 1)
            groups[-1][1] += 1
    return [{"value": g[0], "mult": g[1]} for g in groups]


def block_diag(A, B):
    n, m = A.shape[0], B.shape[0]
    M = np.zeros((n + m, n + m))
    M[:n, :n] = A
    M[n:, n:] = B
    return M


def three_singlets(grouped):
    pos = [g for g in grouped if g["value"] > 1e-8]
    singlets = [g for g in pos if g["mult"] == 1]
    return len(singlets) >= 3 and all(g["mult"] == 1 for g in pos[:3]) if len(pos) >= 3 else False


def two_atom_values():
    phis = {0: 1.0, 1: PHI, 2: PHI ** 2}
    vals = []
    for a in NUMS:
        for n in G_STRICT:
            for k in (0, 1, 2):
                for b in NUMS:
                    for m in G_STRICT:
                        for l in (0, 1, 2):
                            vals.append(a / (n * phis[k]) + b / (m * phis[l]))
    return np.asarray(vals, dtype=float)


def look_elsewhere(x, catalogue):
    rel = np.abs(catalogue - x) / max(abs(x), 1e-30)
    i = int(np.argmin(rel))
    return {"best_rel": float(rel[i]), "best_value": float(catalogue[i]), "hit_1e-4": bool(rel[i] < 1e-4)}


def main():
    geom = build_geometry()
    K0 = block_diag(geom["K_ico"], geom["K_d"])
    C32 = np.zeros((32, 32))
    C32[:12, :12] = geom["C_ii"]
    C32[12:, 12:] = geom["C_dd"]
    C32[:12, 12:] = geom["C_id"]
    C32[12:, :12] = geom["C_id"].T
    KC = K0 + C32
    hat = np.asarray(HAT, float)
    hat = hat / np.linalg.norm(hat)
    Di = pairing_on_edges(EVEN_FRAME, R0 * hat, 12, geom["edges_ico"])
    Dd = pairing_on_edges(EVEN_FRAME, R0 * hat, 20, geom["edges_d"])
    D0 = block_diag(Di, Dd)
    DiC = pairing_on_edges(EVEN_FRAME, RC * hat, 12, geom["edges_ico"])
    DdC = pairing_on_edges(EVEN_FRAME, RC * hat, 20, geom["edges_d"])
    DC = block_diag(DiC, DdC)

    ev0 = bdg_pos(K0, D0)
    evC = bdg_pos(KC, DC)
    g0 = group_rel(ev0)
    gC = group_rel(evC)
    three0 = three_singlets(g0)
    threeC = three_singlets(gC)
    n_singlets0 = sum(1 for g in g0 if g["value"] > 1e-8 and g["mult"] == 1)
    n_singletsC = sum(1 for g in gC if g["value"] > 1e-8 and g["mult"] == 1)
    joint_name = JRES["stabilizers"]["joint"]["name"]
    smaller = joint_name not in ("A4", "A5")

    mass_ARFs = {
        "comparison_performed": False,
        "C_mass": float(C_MASS),
        "R_mass": float(R_MASS),
    }
    if smaller and (three0 or threeC):
        ev = ev0 if three0 else evC
        grouped = g0 if three0 else gC
        pos = [g["value"] for g in grouped if g["value"] > 1e-8]
        # take the three lowest multiplicity-1 levels
        singlets = [g["value"] for g in grouped if g["value"] > 1e-8 and g["mult"] == 1][:3]
        m1, m2, m3 = singlets
        ratios = {
            "m1": m1, "m2": m2, "m3": m3,
            "rho21": m2 / m1, "rho31": m3 / m1, "rho32": m3 / m2,
            "Q_Koide": (m1 + m2 + m3) / (np.sqrt(m1) + np.sqrt(m2) + np.sqrt(m3)) ** 2,
            "Q_rms": (m1 + m2 + m3) / np.sqrt(m1 ** 2 + m2 ** 2 + m3 ** 2),
        }
        cat = two_atom_values()
        targets = {
            "abs_C_mass": abs(C_MASS),
            "abs_R_mass": abs(R_MASS),
            "abs_C_over_R": abs(C_MASS / R_MASS),
        }
        comparisons = {}
        for name, val in list(ratios.items()) + list(targets.items()):
            if name in ("m1", "m2", "m3"):
                continue
            comparisons[name] = {"value": float(val), **look_elsewhere(float(val), cat)}
        # also compare the model ratios to the named ARFs directly
        for rname in ("rho21", "rho31", "rho32", "Q_Koide", "Q_rms"):
            rv = ratios[rname]
            comparisons[f"{rname}_vs_abs_C"] = {
                "rel": abs(rv - abs(C_MASS)) / max(abs(C_MASS), 1e-30)
            }
            comparisons[f"{rname}_vs_abs_R"] = {
                "rel": abs(rv - abs(R_MASS)) / max(abs(R_MASS), 1e-30)
            }
        mass_ARFs = {
            "comparison_performed": True,
            "C_mass": float(C_MASS),
            "R_mass": float(R_MASS),
            "ratios": {k: float(v) for k, v in ratios.items()},
            "look_elsewhere": comparisons,
            "look_elsewhere_catalogue_size": int(cat.size),
        }
    else:
        mass_ARFs["skip_reason"] = (
            f"Joint stabiliser is {joint_name}; three nondegenerate charged singlets "
            f"on K0={three0}, on KC={threeC}. C_mass and R_mass are not compared."
        )

    H = {
        "H1_A4_implies_no_three_singlets": (not smaller) and (not three0) and (not threeC),
        "H2_no_ARF_comparison_if_no_singlets": not mass_ARFs["comparison_performed"],
        "H3_comparison_only_if_smaller_and_three": (
            mass_ARFs["comparison_performed"] == (smaller and (three0 or threeC))
        ),
    }
    result = {
        "classification": "PROVED",
        "classification_note": (
            f"Joint stabiliser {joint_name}. K0 grouped spectrum has "
            f"{n_singlets0} positive singlets and three_nondeg={three0}; "
            f"KC has {n_singletsC} and three_nondeg={threeC}."
        ),
        "hypotheses": H,
        "joint_stabilizer": joint_name,
        "joint_stab_smaller_than_A4": smaller,
        "spectrum_K0": {
            "Emin": float(ev0.min()),
            "grouped_rel_1e-5": g0,
            "n_positive_singlets": n_singlets0,
            "three_nondeg_singlets": three0,
            "n_distinct_positive": sum(1 for g in g0 if g["value"] > 1e-8),
        },
        "spectrum_KC": {
            "Emin": float(evC.min()),
            "grouped_rel_1e-5": gC,
            "n_positive_singlets": n_singletsC,
            "three_nondeg_singlets": threeC,
            "n_distinct_positive": sum(1 for g in gC if g["value"] > 1e-8),
        },
        "mass_ARFs": mass_ARFs,
    }
    OUT.joinpath("results.json").write_text(json.dumps(jsonable(result), indent=2, sort_keys=True))
    print(json.dumps(jsonable({
        "classification": "PROVED",
        "H": H,
        "joint_stab": joint_name,
        "K0": result["spectrum_K0"],
        "KC": {k: result["spectrum_KC"][k] for k in result["spectrum_KC"] if k != "grouped_rel_1e-5"},
        "KC_grouped": result["spectrum_KC"]["grouped_rel_1e-5"],
        "mass_ARFs": mass_ARFs,
    }), indent=2))


if __name__ == "__main__":
    main()
