#!/usr/bin/env python3
"""Coupled cycle 41: exactness of y_c(eta) = Delta * sqrt(c5 / chi)."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle41_yc_identity")
sys.path.insert(0, str(ROOT / "coupled_cycle18_nambu_measure"))
import test_nambu_measure as c18  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle33_critical_temperature"))
import test_critical_temperature as c33  # noqa: E402

PRED_SHA = "0054edca2048b55d59fb6b0916a3fd86fb2f54a13f4a99c7010bc149e35d3d7a"
PHI = (1.0 + np.sqrt(5.0)) / 2.0
DELTA = 3.0 / 20.0 - 80.0 * np.pi / (1053.0 * PHI)
C5 = float(c18.C5)
C_EVEN = DELTA ** 2 * C5
ETA = -np.log(DELTA)

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


def check_identity(yc, chi, tag):
    rhs = DELTA * np.sqrt(C5 / chi)
    rhs2 = np.sqrt(C_EVEN / chi)
    rel1 = abs(yc - rhs) / abs(yc)
    rel2 = abs(yc - rhs2) / abs(yc)
    rel12 = abs(rhs - rhs2) / abs(rhs)
    return {
        "y_c": float(yc),
        "chi": float(chi),
        "Delta_sqrt_c5_over_chi": float(rhs),
        "sqrt_ceven_over_chi": float(rhs2),
        "rel_yc_vs_Delta_formula": float(rel1),
        "rel_yc_vs_sqrt_ceven": float(rel2),
        "rel_two_rhs": float(rel12),
        "ok_1e12": bool(rel1 < 1e-12 and rel2 < 1e-12 and rel12 < 1e-14),
        "tag": tag,
    }


def main():
    stored_checks = {}
    all_ok = True
    for kin, rec in STORED.items():
        for Tname, chi_key, yc_key in (
            ("eta", "chi_Teta", "y_c_Teta"),
            ("T0", "chi_T0", "y_c_T0"),
        ):
            chk = check_identity(rec[yc_key], rec[chi_key], f"{kin}_{Tname}_stored")
            stored_checks[chk["tag"]] = chk
            all_ok = all_ok and chk["ok_1e12"]

    # Fresh recomputation on the icosahedral Laplacian, even channel, as in cycle 33
    sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
    from test_noether_identification import load_ops  # noqa: E402

    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for a in range(m):
            raw.add(tuple(sorted((int(f[a]), int(f[(a + 1) % m])))))
    edges = sorted(raw)
    K = c18.graph_laplacian(12, edges)
    c18_res = json.loads((ROOT / "coupled_cycle18_nambu_measure" / "results.json").read_text())
    hat_even = np.asarray(c18_res["even_hat"], dtype=float)
    hat_even = hat_even / np.linalg.norm(hat_even)
    Delta_unit = c18.pairing_matrix_12(c18.EVEN_FRAME, hat_even, edges)
    frob2 = float(np.sum(np.abs(Delta_unit) ** 2))

    fresh = {}
    for T, tag, s in ((ETA, "ico_eta_fresh", 1e-3), (0.0, "ico_T0_fresh", 1e-4)):
        chi, om, s_used = c33.chi_of(K, Delta_unit, T, s=s, stable=False)
        yc = float(np.sqrt(C_EVEN / chi)) if chi > 0 else None
        chk = check_identity(yc, chi, tag)
        chk["Omega_pair"] = float(om)
        chk["s_used"] = float(s_used)
        chk["frob2_Delta_unit"] = frob2
        fresh[tag] = chk
        all_ok = all_ok and chk["ok_1e12"]

    # Algebraic statement
    algebraic = {
        "definition_y_c": "sqrt(c_even / chi) whenever chi > 0",
        "definition_c_even": "Delta^2 * c5",
        "identity": "y_c(T) = Delta * sqrt(c5 / chi(T))",
        "exact_by_substitution": True,
        "c5": float(C5),
        "c_even": float(C_EVEN),
        "c_even_minus_Delta2_c5": float(C_EVEN - DELTA ** 2 * C5),
        "Delta": float(DELTA),
        "eta": float(ETA),
        "sqrt_c5_over_chi_eta_ico_stored": float(
            np.sqrt(C5 / STORED["ico"]["chi_Teta"])
        ),
        "meaning": (
            "y_c inherits its smallness from the rail gap Delta; "
            "sqrt(c5/chi) is an O(1) ratio of hidden kinetic to pairing bubble. "
            "This does not set y_even = Delta."
        ),
    }

    out = {
        "integrity": {"predeclaration_sha256": PRED_SHA},
        "algebraic": algebraic,
        "stored_checks": stored_checks,
        "fresh_checks": fresh,
        "H1_exact_identity": True,
        "H2_numerical_1e12": bool(all_ok),
        "H3_does_not_fix_y_even": True,
    }
    (OUT / "results.json").write_text(json.dumps(out, indent=2) + "\n")
    print(json.dumps({
        "H1": True,
        "H2": all_ok,
        "fresh_eta": fresh["ico_eta_fresh"]["rel_yc_vs_Delta_formula"],
        "stored_ok": {k: v["ok_1e12"] for k, v in stored_checks.items()},
        "sqrt_c5_over_chi_eta_ico": algebraic["sqrt_c5_over_chi_eta_ico_stored"],
    }, indent=2))


if __name__ == "__main__":
    main()
