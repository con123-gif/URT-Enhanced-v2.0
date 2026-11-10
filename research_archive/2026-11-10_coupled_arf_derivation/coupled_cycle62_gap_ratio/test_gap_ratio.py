#!/usr/bin/env python3
"""Coupled cycle 62: ρ_10 = λ_min(Δ1_T)/λ_min(Δ0^+) as an ARF-type observable."""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import svd

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle62_gap_ratio")
sys.path.insert(0, str(ROOT / "coupled_cycle43_gauss_ir_projection"))
from test_gauss_ir_projection import (  # noqa: E402
    icosa_complex,
    hodge_operators,
    coexact_projector,
)

PRED_SHA = Path(OUT / "HASHES.txt").read_text().split()[-1].strip()
C18 = json.loads((ROOT / "coupled_cycle18_nambu_measure" / "results.json").read_text())

PHI = (1.0 + np.sqrt(5.0)) / 2.0
SQRT5 = np.sqrt(5.0)
PI = np.pi
E = np.e
GAMMA = 1.0 / 81.0
DELTA_STAR = 80.0 * PI / (1053.0 * PHI)
DELTA = 3.0 / 20.0 - DELTA_STAR
ETA = -np.log(DELTA)
R_ALPHA = 3.0 / (64.0 * PHI) + 1.0 / (79.0 * PHI ** 2)
C_MASS = -(5.0 / 16.0) * DELTA_STAR ** 3 + (7.0 / 8.0) * PI * PHI
R_MASS = (3.0 / 35.0) * DELTA_STAR ** 2 - (4.0 / 51.0) * PI ** 3
DELTA_DELTA = -(DELTA_STAR ** 3) / 63.0 - GAMMA / 40.0
D_EFF = DELTA_STAR + DELTA_DELTA
INV_ALPHA_DELTA_STAR = 137.0 + (DELTA_STAR ** 2) / (PI ** 2) + R_ALPHA
INV_ALPHA_DEFF = 137.0 + (D_EFF ** 2) / (PI ** 2) + R_ALPHA
C3 = float(C18["c3"])
C5 = float(C18["c5"])
C_EVEN = float(C18["c_even"])
REL = 1.0e-4


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


def rel_err(a, b):
    den = max(abs(b), 1e-30)
    return abs(a - b) / den


def main():
    points, faces, edges = icosa_complex()
    nV = 12
    d0, d1, Delta0, Delta1 = hodge_operators(nV, edges, faces)
    P_T_full, trans, *_ = coexact_projector(d0, Delta0)
    # λ_min(Δ0^+): Fiedler of unweighted 0-form Laplacian
    ev0 = np.linalg.eigvalsh(0.5 * (Delta0 + Delta0.T))
    pos0 = ev0[ev0 > 1e-10]
    lam0 = float(pos0.min())
    # λ_min(Δ1_T): lowest eigenvalue of Δ1 on the coexact subspace
    G = trans.T @ Delta1 @ trans
    G = 0.5 * (G + G.T)
    ev1 = np.linalg.eigvalsh(G)
    pos1 = ev1[ev1 > 1e-10]
    lam1 = float(pos1.min())
    rho_op = lam1 / lam0

    closed = (3.0 - SQRT5) / (5.0 - SQRT5)
    # algebraic simplifications, declared as closed forms of the observable
    closed_forms = {
        "(3-sqrt5)/(5-sqrt5)": closed,
        "(5-sqrt5)/10": (5.0 - SQRT5) / 10.0,
        "1/(phi*sqrt5)": 1.0 / (PHI * SQRT5),
    }
    # check they agree
    form_agree = all(rel_err(closed_forms[k], closed) < 1e-14 for k in closed_forms)
    op_agrees = rel_err(rho_op, closed) < 1e-12

    # T1 targets
    t1 = {
        "Delta_delta": DELTA_DELTA,
        "abs_Delta_delta": abs(DELTA_DELTA),
        "R_alpha": R_ALPHA,
        "abs_R_alpha": abs(R_ALPHA),
        "C_mass": C_MASS,
        "abs_C_mass": abs(C_MASS),
        "R_mass": R_MASS,
        "abs_R_mass": abs(R_MASS),
        "inv_alpha_delta_star": INV_ALPHA_DELTA_STAR,
        "inv_alpha_deff": INV_ALPHA_DEFF,
    }
    t1_hits = []
    for name, val in t1.items():
        err = rel_err(rho_op, val)
        if err < REL:
            t1_hits.append({"name": name, "value": val, "rel_err": err})

    # T2 named scalars (reported individually; also in LE)
    t2 = {
        "gamma": GAMMA,
        "Delta": DELTA,
        "delta_star": DELTA_STAR,
        "eta": ETA,
        "3/20": 3.0 / 20.0,
        "1/12": 1.0 / 12.0,
        "1/81": 1.0 / 81.0,
        "1/phi": 1.0 / PHI,
        "1/phi**2": 1.0 / PHI ** 2,
        "1/phi**3": 1.0 / PHI ** 3,
        "1/phi**4": 1.0 / PHI ** 4,
        "1/phi**5": 1.0 / PHI ** 5,
        "1/phi**6": 1.0 / PHI ** 6,
        "phi": PHI,
        "phi**2": PHI ** 2,
        "phi**3": PHI ** 3,
        "phi**4": PHI ** 4,
        "phi**5": PHI ** 5,
        "phi**6": PHI ** 6,
        "(3-sqrt5)/2": (3.0 - SQRT5) / 2.0,
        "3-sqrt5": 3.0 - SQRT5,
        "2/phi**2": 2.0 / PHI ** 2,
    }
    t2_hits = []
    for name, val in t2.items():
        err = rel_err(rho_op, val)
        if err < REL:
            t2_hits.append({"name": name, "value": val, "rel_err": err})

    # Look-elsewhere catalogue
    B = {
        "gamma": GAMMA, "Delta": DELTA, "delta_star": DELTA_STAR, "eta": ETA,
        "3/20": 3.0 / 20.0, "1/12": 1.0 / 12.0, "1/81": GAMMA,
        "phi": PHI, "1/phi": 1.0 / PHI, "1/phi2": 1.0 / PHI ** 2,
        "1/phi3": 1.0 / PHI ** 3, "1/phi4": 1.0 / PHI ** 4,
        "1/phi5": 1.0 / PHI ** 5, "1/phi6": 1.0 / PHI ** 6,
        "phi2": PHI ** 2, "phi3": PHI ** 3, "phi4": PHI ** 4,
        "phi5": PHI ** 5, "phi6": PHI ** 6,
        "(3-sqrt5)/2": (3.0 - SQRT5) / 2.0, "3-sqrt5": 3.0 - SQRT5,
        "2/phi2": 2.0 / PHI ** 2,
        "5-sqrt5": 5.0 - SQRT5, "5+sqrt5": 5.0 + SQRT5, "6": 6.0,
        "3-sqrt5_gap": 3.0 - SQRT5, "7": 7.0, "6-sqrt5": 6.0 - SQRT5,
        "6+sqrt5": 6.0 + SQRT5, "13": 13.0, "10": 10.0, "4": 4.0, "2": 2.0,
        "c3": C3, "c5": C5, "c_even": C_EVEN,
        "pi": PI, "e": E,
    }
    for n in (1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 16, 18, 20, 24, 30, 31, 32,
              35, 40, 51, 60, 63, 64, 79, 80, 81):
        B[str(n)] = float(n)

    # unique values
    exprs = {}  # value_key -> list of expressions (cap examples)
    def add(expr, val):
        if not np.isfinite(val):
            return
        key = round(float(val), 12)  # cluster
        exprs.setdefault(key, [])
        if len(exprs[key]) < 8:
            if expr not in exprs[key]:
                exprs[key].append(expr)

    items = list(B.items())
    for name, x in items:
        add(name, x)
        if abs(x) > 1e-30:
            add(f"1/({name})", 1.0 / x)
        add(f"({name})**2", x * x)
    # pairs
    for i, (n1, x) in enumerate(items):
        for n2, y in items:
            if abs(y) > 1e-30:
                add(f"({n1})/({n2})", x / y)
                add(f"({n2})/({n1})", y / x)
            add(f"({n1})+({n2})", x + y)
            add(f"|{n1}-{n2}|", abs(x - y))
            add(f"({n1})*({n2})", x * y)

    n_expr = sum(len(v) for v in exprs.values())
    n_distinct = len(exprs)
    le_hits = []
    for key, ex in exprs.items():
        err = rel_err(rho_op, key)
        if err < REL:
            # skip tautological definition-like writings that use both 3-sqrt5 and 5-sqrt5
            le_hits.append({"value": key, "rel_err": err, "n_expr": len(ex), "examples": ex[:6]})

    # unique structural T1 role? none predeclared beyond comparison; require unique T1 hit
    unique_t1_structural = bool(len(t1_hits) == 1)
    # we did not claim a unique structural role in the pred unless a unique T1 hit
    # AND a unique role; none was assigned a priori, so even a unique T1 hit would
    # be CONDITIONAL. Expected: no T1 hit.
    H1 = bool(op_agrees and form_agree)
    H2 = bool(len(t1_hits) == 0 or not unique_t1_structural)
    # If there is no T1 hit, H2 holds (not a unique structural ARF id).
    if len(t1_hits) == 0:
        H2 = True
        arf_status = "no T1 hit at 1e-4"
    elif unique_t1_structural:
        H2 = False  # would require reviewing a role; pred said derivation needs a unique role we did not assign
        arf_status = "unexpected unique T1 hit; not promoted (no unique structural role preassigned)"
    else:
        H2 = True
        arf_status = "multiple or non-unique T1 hits; look-elsewhere"
    H3 = bool(H1 and H2)
    classification = "PROVED" if H3 else ("CONDITIONAL" if H1 else "OPEN")

    out = {
        "lambda_min_Delta0_plus": lam0,
        "lambda_min_Delta1_T": lam1,
        "rho_10_operator": rho_op,
        "closed_forms": closed_forms,
        "operator_agrees_with_closed_form": op_agrees,
        "closed_forms_agree": form_agree,
        "relative_op_vs_closed": rel_err(rho_op, closed),
        "T1_targets": t1,
        "T1_hits": t1_hits,
        "T2_hits": t2_hits,
        "look_elsewhere": {
            "n_expressions_stored": n_expr,
            "n_distinct_values": n_distinct,
            "n_hits": len(le_hits),
            "hits": le_hits,
        },
        "arf_status": arf_status,
        "unique_T1_structural_identification": False,
        "hypotheses": {"H1": H1, "H2": H2, "H3": H3},
        "classification": classification,
        "advances_physical_ARF": False,
        "integrity": {"predeclaration_sha256": PRED_SHA},
    }
    (OUT / "results.json").write_text(json.dumps(sanitize(out), indent=2) + "\n")
    print(json.dumps(sanitize({
        "classification": classification,
        "rho_op": rho_op,
        "closed": closed,
        "forms": closed_forms,
        "op_agrees": op_agrees,
        "T1_hits": t1_hits,
        "T2_hits": t2_hits,
        "LE_n_hits": len(le_hits),
        "LE_examples": le_hits[:12],
        "n_distinct": n_distinct,
        "H1": H1, "H2": H2,
        "lam0": lam0, "lam1": lam1,
    }), indent=2))


if __name__ == "__main__":
    main()
