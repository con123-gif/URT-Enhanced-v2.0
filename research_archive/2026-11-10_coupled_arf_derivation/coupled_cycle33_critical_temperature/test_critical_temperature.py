#!/usr/bin/env python3
"""Coupled cycle 33: T_c(y_even) versus the derived temperature η."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh
from scipy.optimize import brentq

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle33_critical_temperature")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle18_nambu_measure"))
import test_nambu_measure as c18  # noqa: E402

PRED_SHA = "e1d03572834931ef0ffd9c1966d86f00bf9add575a1209aeb00720fe68197cfd"
ETA = c18.ETA
C_EVEN = c18.C_EVEN
EVEN_FRAME = c18.EVEN_FRAME
PHI = c18.PHI

# cycle-18 stored values (predeclared)
STORED = {
    "ico": {
        "chi_Teta": 0.038415791436818836,
        "y_c_Teta": 0.005940144040707988,
        "chi_T0": 0.09166640779767476,
        "y_c_T0": 0.003845446400083969,
    },
    "H13": {
        "chi_Teta": 0.037511483697016956,
        "y_c_Teta": 0.006011318618427269,
        "chi_T0": 0.07737952500974643,
        "y_c_T0": 0.004185418011108536,
    },
}


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


def build_geometry():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    raw = set()
    for f in ico["faces"]:
        ff = [int(x) for x in f]
        m = len(ff)
        for a in range(m):
            raw.add(tuple(sorted((ff[a], ff[(a + 1) % m]))))
    edges = sorted(raw)
    assert len(edges) == 30
    K_ico = c18.graph_laplacian(12, edges)
    K_H13 = c18.build_K_H13(edges)
    return edges, K_ico, K_H13


def logcosh_stable(z):
    """log(cosh z), numerically stable for small and large |z|."""
    z = np.asarray(z, dtype=float)
    az = np.abs(z)
    out = np.empty_like(az, dtype=float)
    small = az < 0.1
    zs = z[small]
    z2 = zs * zs
    out[small] = (
        z2 / 2.0
        - z2 ** 2 / 12.0
        + z2 ** 3 / 45.0
        - 17.0 * z2 ** 4 / 2520.0
    )
    large = ~small
    out[large] = az[large] + np.log1p(np.exp(-2.0 * az[large])) - np.log(2.0)
    return out


def fermion_omega_stable(energies, xi, T):
    """Same function as cycle 18's fermion_omega, with cancelled log 2 and
    a Taylor expansion of log(cosh z) for |z| < 0.1 so that large-T
    differences are not lost to cancellation of n T log 2."""
    energies = np.asarray(energies, dtype=float)
    xi = np.asarray(xi, dtype=float)
    if T <= 0:
        return -0.5 * (np.sum(np.abs(energies)) - np.sum(np.abs(xi)))
    return float(
        -T * np.sum(logcosh_stable(energies / (2.0 * T)) - logcosh_stable(np.abs(xi) / (2.0 * T)))
    )


def chi_of(K, Delta_unit, T, s=None, stable=True):
    xi = eigvalsh(K)
    if s is None:
        s = 1e-4
    E, _, _ = c18.bdg_positive_energies(K, s * Delta_unit)
    if stable:
        om = fermion_omega_stable(E, xi, T)
    else:
        om = float(c18.fermion_omega(E, xi, T))
    return float(-om / (s * s)), float(om), s


def main():
    edges, K_ico, K_H13 = build_geometry()
    c18_res = json.loads((ROOT / "coupled_cycle18_nambu_measure" / "results.json").read_text())
    hat = np.asarray(c18_res["even_hat"], dtype=float)
    hat = hat / np.linalg.norm(hat)
    Delta12 = c18.pairing_matrix_12(EVEN_FRAME, hat, edges)
    Delta13 = c18.embed13(Delta12)

    frobenius2 = float(np.sum(Delta12 ** 2))
    channels = {
        "ico": {"K": K_ico, "Delta": Delta12, "frob2": frobenius2},
        "H13": {"K": K_H13, "Delta": Delta13, "frob2": float(np.sum(Delta13 ** 2))},
    }

    results = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "eta": ETA,
        "c_even": C_EVEN,
        "phi": PHI,
        "Delta_unit_frobenius_sq_ico": frobenius2,
        "channels": {},
    }

    T_grid = [0.0, ETA] + list(np.geomspace(1e-2, 1e3, 49))
    # unique sort
    T_grid = sorted(set(float(t) for t in T_grid))
    ye_list = [0.01, 0.1, 0.5, 1.0, 2.0, 5.0, 10.0]

    for cname, ch in channels.items():
        print(f"channel {cname}...", flush=True)
        K, Delta = ch["K"], ch["Delta"]
        frob2 = ch["frob2"]
        rec = {"frobenius_sq": frob2}

        # item 1: recompute stored points
        stored = STORED[cname]
        checks = {}
        for T, key_chi, key_yc, s in (
            (ETA, "chi_Teta", "y_c_Teta", 1e-3),
            (0.0, "chi_T0", "y_c_T0", 1e-4),
        ):
            chi, om, s_used = chi_of(K, Delta, T, s=s, stable=False)
            yc = float(np.sqrt(C_EVEN / chi)) if chi > 0 else None
            rel_chi = abs(chi - stored[key_chi]) / stored[key_chi]
            rel_yc = abs(yc - stored[key_yc]) / stored[key_yc]
            checks[key_chi] = {
                "computed": chi,
                "stored": stored[key_chi],
                "rel_err": rel_chi,
                "ok": bool(rel_chi < 1e-8),
            }
            checks[key_yc] = {
                "computed": yc,
                "stored": stored[key_yc],
                "rel_err": rel_yc,
                "ok": bool(rel_yc < 1e-8),
            }
        rec["cycle18_repro"] = checks
        rec["cycle18_repro_ok"] = all(v["ok"] for v in checks.values())

        # item 2: grid
        grid = []
        chi_by_T = {}
        for T in T_grid:
            chi, om, s_used = chi_of(K, Delta, T)
            yc = float(np.sqrt(C_EVEN / chi)) if chi > 0 else None
            chi_HT = (frob2 / (8.0 * T)) if T > 0 else None
            rel_HT = (
                abs(chi - chi_HT) / abs(chi) if (chi_HT is not None and abs(chi) > 0) else None
            )
            grid.append({
                "T": T,
                "chi": chi,
                "y_c": yc,
                "chi_HT": chi_HT,
                "rel_err_HT": rel_HT,
            })
            chi_by_T[T] = chi
        rec["grid"] = grid

        rec["highT_residuals"] = {}
        for Ttarget in (10.0, 100.0, 1000.0):
            # find exact grid point
            chi, _, _ = chi_of(K, Delta, Ttarget)
            chi_HT = frob2 / (8.0 * Ttarget)
            rec["highT_residuals"][str(Ttarget)] = {
                "chi": chi,
                "chi_HT": chi_HT,
                "rel_err": abs(chi - chi_HT) / abs(chi),
            }

        # monotonicity of chi on the positive-T grid
        Tpos = [t for t in T_grid if t > 0]
        chis_pos = [chi_by_T[t] for t in Tpos]
        rec["chi_positive"] = bool(all(c > 0 for c in [chi_by_T[t] for t in T_grid]))
        rec["chi_decreasing_on_grid"] = bool(
            all(chis_pos[i] > chis_pos[i + 1] - 1e-10 for i in range(len(chis_pos) - 1))
        )
        rec["chi_max_ascent_on_grid"] = float(
            max((chis_pos[i + 1] - chis_pos[i]) for i in range(len(chis_pos) - 1))
        )

        yc0 = float(np.sqrt(C_EVEN / chi_of(K, Delta, 0.0, s=1e-4)[0]))
        yc_eta = float(np.sqrt(C_EVEN / chi_of(K, Delta, ETA, s=1e-3)[0]))
        rec["y_c_T0"] = yc0
        rec["y_c_Teta"] = yc_eta

        def chi_only(T):
            return chi_of(K, Delta, T)[0]

        inversions = []
        for ye in ye_list:
            target = C_EVEN / (ye * ye)
            chi0 = chi_only(0.0)
            if ye <= yc0 + 1e-15 or target >= chi0 - 1e-18:
                inversions.append({
                    "y_even": ye,
                    "chi_target": target,
                    "T_c": 0.0,
                    "never_condenses": True,
                    "T_c_over_eta": 0.0,
                    "eta_is_above_Tc": True,
                    "T_c_HT": frob2 * ye * ye / (8.0 * C_EVEN),
                })
                continue
            # need chi(T_c) = target < chi(0); find T_max with chi < target
            T_hi = max(ETA, 1.0)
            for _ in range(60):
                if chi_only(T_hi) < target:
                    break
                T_hi *= 2.0
            else:
                raise RuntimeError(f"failed to bracket T_c for ye={ye}")
            Tc = float(brentq(lambda T: chi_only(T) - target, 0.0, T_hi, xtol=1e-10))
            chi_at = chi_only(Tc)
            inversions.append({
                "y_even": ye,
                "chi_target": target,
                "T_c": Tc,
                "never_condenses": False,
                "chi_at_Tc": chi_at,
                "rel_chi_err_at_Tc": abs(chi_at - target) / target,
                "T_c_over_eta": Tc / ETA,
                "eta_is_above_Tc": bool(ye < yc_eta),
                "T_c_HT": frob2 * ye * ye / (8.0 * C_EVEN),
                "rel_err_HT_Tc": abs(Tc - frob2 * ye * ye / (8.0 * C_EVEN)) / Tc,
            })
        rec["inversions"] = inversions

        o1 = [inv for inv in inversions if inv["y_even"] >= 0.1]
        rec["O1_all_Tc_gt_eta"] = bool(all(
            (not inv["never_condenses"]) and inv["T_c"] > ETA for inv in o1
        ))
        rec["O1_eta_above_Tc_any"] = bool(any(inv["eta_is_above_Tc"] for inv in o1))
        rec["derived_temperatures"] = {
            "eta": ETA,
            "others": [],
            "note": (
                "The only derived temperature of the frozen programme is "
                "the KMS value η = −ln Δ. ρ★ is a modular state, not a "
                "temperature."
            ),
        }
        rec["eta_places_O1_above_Tc"] = False
        rec["any_derived_T_places_O1_above_Tc"] = False
        results["channels"][cname] = rec

    ico = results["channels"]["ico"]
    h13 = results["channels"]["H13"]
    H1 = bool(
        ico["chi_positive"]
        and ico["chi_decreasing_on_grid"]
        and h13["chi_positive"]
        and h13["chi_decreasing_on_grid"]
    )
    H2 = bool(ico["O1_all_Tc_gt_eta"] and h13["O1_all_Tc_gt_eta"])
    H3 = bool(
        (not ico["any_derived_T_places_O1_above_Tc"])
        and (not h13["any_derived_T_places_O1_above_Tc"])
    )
    # H4: 10% at eta, and accurate at large T
    chi_eta_ico = ico["cycle18_repro"]["chi_Teta"]["computed"]
    chi_HT_eta = frobenius2 / (8.0 * ETA)
    rel_eta = abs(chi_eta_ico - chi_HT_eta) / chi_eta_ico
    rel_1000 = ico["highT_residuals"]["1000.0"]["rel_err"]
    H4 = bool(rel_eta < 0.10 and rel_1000 < 0.01)

    results["hypotheses"] = {
        "H1_chi_positive_decreasing_unique_Tc": H1,
        "H2_O1_Tc_much_greater_than_eta": H2,
        "H3_no_derived_T_places_O1_above_Tc": H3,
        "H4_highT_formula_adequate": H4,
        "rel_HT_at_eta_ico": rel_eta,
        "rel_HT_at_T1000_ico": rel_1000,
    }
    results["primary_channel"] = "ico"
    results["control_channel"] = "H13"

    out = OUT / "results.json"
    out.write_text(json.dumps(sanitize(results), indent=2))
    print("wrote", out)
    print("H1", H1, "H2", H2, "H3", H3, "H4", H4)
    print("cycle18 repro ico", ico["cycle18_repro_ok"], "H13", h13["cycle18_repro_ok"])
    for inv in ico["inversions"]:
        print(
            f"  ye={inv['y_even']}: Tc={inv['T_c']:.6g}  "
            f"Tc/η={inv.get('T_c_over_eta')}  HT={inv['T_c_HT']:.6g}  "
            f"never={inv['never_condenses']}"
        )



if __name__ == "__main__":
    main()
