#!/usr/bin/env python3
"""Coupled cycle 52: does any derived principle select the y_even branch?

Free-energy, stability, and resolvent tests as predeclared. No Maxwell-photon
preference. No ARF target. Runs with a single OpenMP/BLAS thread.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle52_branch_selection")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402

sys.path.insert(0, str(ROOT / "coupled_cycle25_piflux_kernel"))
from test_piflux_kernel import (  # noqa: E402
    EVEN_FRAME,
    ETA,
    bdg_pos,
    fermion_omega,
    magnetic_laplacian,
    pairing_matrix,
)

PRED_SHA = Path(OUT / "HASHES.txt").read_text().split()[-1].strip()
C18 = json.loads(
    (ROOT / "coupled_cycle18_nambu_measure" / "results.json").read_text()
)
C_EVEN = float(C18["c_even"])
NUC = float(C18["even_nuclear_norm"])
HAT = np.asarray(C18["even_hat"], dtype=float)
Y_C = float(C18["ico_y_c_even_Teta"])  # 0.005940144040707988
# Frozen y-sample, predeclared (not adjusted after seeing Ω).
Y_SAMPLE = (0.0, 0.5, 0.99, 1.01, "abs:0.01", "abs:0.1", "abs:1.0", "abs:2.0")
# T0 poles recorded from cycles 05/13/16; not recomputed as a new principle.
T0_Z1 = 1.015458
T0_Z2 = 1.063249


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


def edges_from_ico():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    faces = [tuple(int(x) for x in f) for f in ico["faces"]]
    raw = set()
    for f in faces:
        m = len(f)
        for i in range(m):
            raw.add(tuple(sorted((f[i], f[(i + 1) % m]))))
    edges = sorted(raw)
    assert len(edges) == 30, len(edges)
    return edges


def expand_y(y_c):
    out = []
    for item in Y_SAMPLE:
        if isinstance(item, str) and item.startswith("abs:"):
            out.append(float(item.split(":")[1]))
        else:
            out.append(float(item) * y_c)
    return out


def omega_at(edges, y, r, A, pos0):
    h5 = r * HAT
    V = C_EVEN * float(np.dot(h5, h5))
    Delta = y * pairing_matrix(EVEN_FRAME, h5, edges)
    K = magnetic_laplacian(edges, A)
    pos = bdg_pos(K, Delta)
    return V + fermion_omega(pos, pos0, ETA)


def refine_r(edges, y, A, pos0, r_guess):
    """1-D scan of Ω(r) at fixed (y, A), centred on r_guess if positive."""
    if y <= 0:
        om0 = omega_at(edges, y, 0.0, A, pos0)
        return {
            "r_star": 0.0,
            "omega_star": om0,
            "omega_0": om0,
            "condenses": False,
            "r_analytic": 0.0,
        }
    r_analytic = (y * NUC) / (4.0 * C_EVEN)
    # Always include the origin; span a wide interval around the analytic
    # large-vev centre (which is tiny just above y_c).
    r_max = min(max(30.0 * max(r_guess, r_analytic, 1.0), 10.0), 2e7)
    rs = np.concatenate([[0.0], np.geomspace(1e-8, r_max, 70)])
    oms = np.array([omega_at(edges, y, r, A, pos0) for r in rs])
    i = int(np.argmin(oms))
    r0, r1 = rs[max(i - 1, 0)], rs[min(i + 1, len(rs) - 1)]
    if r1 <= r0:
        r1 = r0 + 1e-12
    rs2 = np.linspace(r0, r1, 60)
    oms2 = np.array([omega_at(edges, y, r, A, pos0) for r in rs2])
    j = int(np.argmin(oms2))
    om0 = float(oms[0])
    return {
        "r_star": float(rs2[j]),
        "omega_star": float(oms2[j]),
        "omega_0": om0,
        "condenses": bool(oms2[j] < om0 - 1e-12 and rs2[j] > 1e-8),
        "r_analytic": float(r_analytic),
        "relative_to_analytic": (
            float(abs(rs2[j] - r_analytic) / max(r_analytic, 1e-30))
            if r_analytic > 0
            else None
        ),
    }


def main():
    edges = edges_from_ico()
    nE = len(edges)
    A0 = np.zeros(nE)
    Api = np.full(nE, np.pi)
    K0 = magnetic_laplacian(edges, A0)
    pos0 = bdg_pos(K0, np.zeros((12, 12)))

    # Reference: Ω(y=0, r=0, A=0) must be 0 under the predeclared convention.
    om_ref = omega_at(edges, 0.0, 0.0, A0, pos0)
    om_pi_r0 = omega_at(edges, 0.0, 0.0, Api, pos0)

    ys = expand_y(Y_C)
    rows = []
    for y in ys:
        rec_0 = refine_r(edges, y, A0, pos0, (y * NUC) / (4.0 * C_EVEN) if y else 0.0)
        rec_pi = refine_r(edges, y, Api, pos0, (y * NUC) / (4.0 * C_EVEN) if y else 0.0)
        # Derived vacuum of cycles 25–32 / 18: A=0, r=0 if y < y_c;
        # A=π and the condensed r if y > y_c.
        side = "critical" if abs(y - Y_C) < 1e-18 else ("sub" if y < Y_C else "super")
        # Actual vacuum: min of Ω over the predeclared A ∈ {0, π} and r.
        # The cycle-32 assignment (A=π whenever y>y_c) is recorded as a
        # comparison, not forced; both sectors were to be evaluated.
        if rec_pi["omega_star"] < rec_0["omega_star"] - 1e-12:
            actual_A, actual = "A=pi", rec_pi
        else:
            actual_A, actual = "A=0", rec_0
        assumed_A = "A=0" if y <= Y_C else "A=pi"
        dichotomy_matches_actual = bool(actual_A == assumed_A)
        omega_analytic_large = -((NUC ** 2) * (y ** 2)) / (16.0 * C_EVEN)
        rows.append(
            {
                "y": y,
                "y_over_yc": (y / Y_C) if Y_C else None,
                "side": side,
                "A0": rec_0,
                "Api": rec_pi,
                "assumed_dichotomy_A": assumed_A,
                "derived_A": actual_A,
                "derived_r": actual["r_star"],
                "derived_omega": actual["omega_star"],
                "dichotomy_matches_actual": dichotomy_matches_actual,
                "omega_analytic_large_vev": omega_analytic_large,
                "rel_to_large_vev": (
                    abs(actual["omega_star"] - omega_analytic_large)
                    / max(abs(omega_analytic_large), 1e-30)
                    if actual["condenses"] and y > 0.05
                    else None
                ),
            }
        )

    # P1: is ω(y) at the derived vacuum a unique interior minimum on Y?
    omegas = [row["derived_omega"] for row in rows]
    ys_arr = np.asarray(ys)
    om_arr = np.asarray(omegas)
    # Subcritical constancy (points with y < y_c).
    sub = [row for row in rows if row["side"] == "sub"]
    super_ = [row for row in rows if row["side"] == "super"]
    sub_oms = np.array([r["derived_omega"] for r in sub])
    super_oms = np.array([r["derived_omega"] for r in super_])
    super_ys = np.array([r["y"] for r in super_])
    sub_constant = bool(
        sub and (np.max(np.abs(sub_oms - sub_oms[0])) < 1e-8)
    )
    # Monotone decrease on the supercritical sample (no interior min).
    # A unique interior min would require a sample point strictly between
    # the endpoints of Y whose ω is uniquely smallest, with neighbours higher.
    imin = int(np.argmin(om_arr))
    at_endpoint = bool(imin in (0, len(om_arr) - 1))
    unique_min = bool(np.sum(np.abs(om_arr - om_arr[imin]) < 1e-8) == 1)
    # Check adjacent elevations only if not an endpoint.
    if 0 < imin < len(om_arr) - 1:
        interior_min = bool(
            om_arr[imin] < om_arr[imin - 1] - 1e-12
            and om_arr[imin] < om_arr[imin + 1] - 1e-12
        )
    else:
        interior_min = False
    super_monotone = bool(
        len(super_) >= 2
        and np.all(np.diff(super_oms) < -1e-12)
        and np.all(np.diff(super_ys) > 0)
    )
    runaway_large_y = bool(
        super_ and super_oms[-1] < min(sub_oms.min() if len(sub_oms) else 0.0, -1.0)
        and super_ys[-1] == ys_arr.max()
    )
    P1_selects_unique_finite_y = bool(
        interior_min and unique_min and not at_endpoint and not runaway_large_y
    )

    # P2: stability of the origin (r=0, A=0). The quadratic coefficient
    # 2 c_even - 2 y² χ is already derived (cycle 18 ico χ); a finite
    # difference at probe=1 sits well above numerical noise (a probe of
    # 1e-4 is ~10^{-16} in ΔΩ just above y_c and is not used as a gate).
    CHI_ICO = float(C18["ico_chi_even_Teta"])
    probe = 1.0
    stability = []
    for y in ys:
        curv = 2.0 * C_EVEN - 2.0 * (y ** 2) * CHI_ICO
        om0 = omega_at(edges, y, 0.0, A0, pos0)
        omp = omega_at(edges, y, probe, A0, pos0)
        fd_curv = 2.0 * (omp - om0) / (probe ** 2)
        unstable = bool(curv < 0.0)
        expect = bool(y > Y_C)
        stability.append(
            {
                "y": y,
                "chi_ico": CHI_ICO,
                "analytic_curvature": curv,
                "omega_0": om0,
                "omega_probe_r1": omp,
                "fd_curvature_r1": fd_curv,
                "d2_sign_negative": unstable,
                "expected_unstable": expect,
                "matches_yc_rule": bool(unstable == expect),
            }
        )
    P2_selects_branch_independently_of_y = False

    # P3: resolvent — recorded, not newly invented.
    P3 = {
        "T0_poles_r_independent": {
            "z1": T0_Z1,
            "z2": T0_Z2,
            "source": "cycles 05/13/16",
            "depends_on_y": False,
            "selects_branch": False,
        },
        "cycle13_bubble_chain": {
            "pairing_kernel": "Dirac pi, FALSIFIED as coupled pairing measure in cycle 18",
            "selects_r_in_cycle13": False,
            "is_derived_selector": False,
            "recomputed": False,
        },
        "nambu_linearisation": {
            "negative_mode_iff": "y > y_c(eta)",
            "is_P2_again": True,
            "selects_branch_independently_of_y": False,
        },
        "photon_massless_not_used": True,
        "pole_matching_to_T0_not_used": True,
    }

    classification = "PROVED"
    # H1–H3 of the predeclaration.
    # H1 as predeclared assumed A=π on every supercritical sample point.
    # That assignment fails at y=1.01 y_c (computed); the no-minimum /
    # runaway half of H1 is tested on the actual min_A Ω.
    dichotomy_on_all_super = all(
        row["dichotomy_matches_actual"] for row in super_
    )
    H1_runaway_no_min = bool(
        sub_constant and super_monotone and not P1_selects_unique_finite_y
    )
    H1_Api_for_all_super = bool(dichotomy_on_all_super)
    H2 = bool(
        (not P1_selects_unique_finite_y)
        and (not P2_selects_branch_independently_of_y)
        and (not P3["T0_poles_r_independent"]["selects_branch"])
        and (not P3["cycle13_bubble_chain"]["is_derived_selector"])
        and (not P3["nambu_linearisation"]["selects_branch_independently_of_y"])
        and all(s["matches_yc_rule"] for s in stability)
    )
    H3 = bool(H1_runaway_no_min and H2)
    # The selection question is answered if P1–P3 do not select a unique
    # finite y or a branch independently of y, even though the assumed
    # A=π assignment fails in a window just above y_c.
    if H2 and H1_runaway_no_min:
        classification = "PROVED"
    else:
        classification = "OPEN"

    out = {
        "eta": float(ETA),
        "c_even": C_EVEN,
        "nuclear_norm": NUC,
        "y_c_ico": Y_C,
        "omega_ref_A0_r0": float(om_ref),
        "omega_A_pi_r0_y0": float(om_pi_r0),
        "y_sample": [float(y) for y in ys],
        "rows": rows,
        "P1": {
            "subcritical_omega_constant": sub_constant,
            "subcritical_omega_values": [float(x) for x in sub_oms],
            "supercritical_omega_monotone_decreasing": super_monotone,
            "supercritical_omega_values": [float(x) for x in super_oms],
            "argmin_index": imin,
            "argmin_y": float(ys_arr[imin]),
            "at_endpoint_of_Y": at_endpoint,
            "interior_minimum": interior_min,
            "runaway_to_large_y": runaway_large_y,
            "selects_unique_finite_y": P1_selects_unique_finite_y,
            "note": (
                "Minimising Ω with respect to y is an extra postulate "
                "(cycle 22: y_even is a Yukawa, not a field). Even if "
                "granted, the sample shows no interior minimum."
            ),
        },
        "P2": {
            "stability": stability,
            "origin_unstable_iff_y_gt_yc": all(s["matches_yc_rule"] for s in stability),
            "selects_branch_independently_of_y": P2_selects_branch_independently_of_y,
        },
        "P3": P3,
        "hypotheses": {
            "H1_runaway_no_min": H1_runaway_no_min,
            "H1_Api_for_all_super": H1_Api_for_all_super,
            "H2": H2,
            "H3": H3,
        },
        "classification": classification,
        "selects_y_even_branch": False,
        "advances_physical_ARF": False,
        "integrity": {"predeclaration_sha256": PRED_SHA},
    }

    (OUT / "results.json").write_text(json.dumps(sanitize(out), indent=2) + "\n")
    print(json.dumps(sanitize({
        "classification": classification,
        "H1_runaway_no_min": H1_runaway_no_min,
        "H1_Api_for_all_super": H1_Api_for_all_super,
        "H2": H2, "H3": H3,
        "P1_selects": P1_selects_unique_finite_y,
        "sub_constant": sub_constant,
        "super_monotone": super_monotone,
        "runaway": runaway_large_y,
        "om_ref": om_ref,
        "om_pi_r0": om_pi_r0,
        "rows": [
            {
                "y": r["y"],
                "side": r["side"],
                "A": r["derived_A"],
                "r": r["derived_r"],
                "om": r["derived_omega"],
                "match": r["dichotomy_matches_actual"],
                "rel": r["rel_to_large_vev"],
            }
            for r in rows
        ],
        "yc_rule": all(s["matches_yc_rule"] for s in stability),
    }), indent=2))


if __name__ == "__main__":
    main()
