#!/usr/bin/env python3
"""Coupled cycle 48: structural Rayleigh of named Hodge metrics vs ell(ell+1)=2.

No new fermion kernel. No conversion factor is selected.
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

import numpy as np
from numpy.linalg import eigvalsh
from scipy.linalg import eigh

ROOT = Path("/workspace/arf_research")
OUT = Path("/workspace/arf_research/coupled_cycle48_coframe_conversion")
sys.path.insert(0, str(ROOT / "coupled_cycle10_noether_identification"))
from test_noether_identification import load_ops  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle43_gauss_ir_projection"))
import test_gauss_ir_projection as c43  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle44_refinement_continuum"))
import test_refinement_continuum as c44  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle47_hodge_weightings"))
import test_hodge_weightings as c47  # noqa: E402
sys.path.insert(0, str(ROOT / "coupled_cycle25_piflux_kernel"))
import test_piflux_kernel as c25  # noqa: E402

PRED_SHA = "713ed33e7b65985dfadcab4c008a624e9906ddd60963aff13563fac4bce195b2"
CONTINUUM_LMIN = 2.0  # ell(ell+1) for ell=1 coexact 1-forms on the unit sphere
KINDS = ["G_comb", "G_sph_dec", "G_euc_dec", "G_sph_circ", "G_euc_circ"]


def main():
    ops = load_ops()
    ico = ops["geom"]["icosahedron"]
    orig_pts = np.asarray(ico["points"], dtype=float)
    orig_pts = orig_pts / float(np.linalg.norm(orig_pts[0]))
    orig_faces = [tuple(int(x) for x in f) for f in ico["faces"]]

    table = {}
    for n in (1, 2, 3):
        verts, faces, edges = c44.frequency_subdivide(orig_pts, orig_faces, n)
        nV, nE, nF = len(verts), len(edges), len(faces)
        d0, d1, _, _ = c43.hodge_operators(nV, edges, faces)
        table[str(n)] = {}
        for kind in KINDS:
            if kind == "G_comb":
                mu = (np.ones(nV), np.ones(nE), np.ones(nF))
                reason = None
            else:
                mu, reason = c47.build_stars(verts, edges, faces, kind)
            rec = {"defined": mu is not None, "reason": reason}
            if mu is not None:
                mu0, mu1, mu2 = mu
                Delta0, M, Delta1 = c47.weighted_hodge(d0, d1, mu0, mu1, mu2)
                trans, rank = c47.coexact_basis_weighted(d0, mu1)
                MT = trans.T @ M @ trans
                MT = 0.5 * (MT + MT.T)
                G = trans.T @ np.diag(mu1) @ trans
                G = 0.5 * (G + G.T)
                # geometric Rayleigh ev of (M, *1) on coexact space
                gev = eigh(MT, G, eigvals_only=True)
                ev_coord = eigvalsh(MT)
                rec.update({
                    "nT": int(trans.shape[1]),
                    "rayleigh_min": float(gev.min()),
                    "rayleigh_max": float(gev.max()),
                    "coord_lambda_min_M": float(ev_coord.min()),
                    "continuum_target": CONTINUUM_LMIN,
                    "rel_err_to_2": float(abs(gev.min() - CONTINUUM_LMIN) / CONTINUUM_LMIN),
                })
            table[str(n)][kind] = rec
            print(n, kind, rec.get("rayleigh_min"), rec.get("rel_err_to_2"), rec.get("reason"))

    # does any single kind have a unique sequence approaching 2 (Cauchy toward 2)?
    approach = {}
    for kind in KINDS:
        vals = [table[str(n)][kind].get("rayleigh_min") for n in (1, 2, 3)]
        if any(v is None for v in vals):
            approach[kind] = {"defined": False, "values": vals, "appears_to_approach_2": False}
            continue
        errs = [abs(v - CONTINUUM_LMIN) / CONTINUUM_LMIN for v in vals]
        # last error smaller than first, and all finite
        appears = bool(errs[2] < errs[0] and errs[2] < errs[1] or (errs[2] < errs[0] and errs[1] < errs[0]))
        # don't invent a limit: record raw
        approach[kind] = {
            "defined": True,
            "values": vals,
            "rel_err": errs,
            "monotonic_err_decrease": bool(errs[0] > errs[1] > errs[2]),
            "last_err_lt_first": bool(errs[2] < errs[0]),
        }
    out = {
        "pred_sha": PRED_SHA,
        "continuum_lmin_S2": CONTINUUM_LMIN,
        "table": table,
        "approach": approach,
        "note": "No Jacobian Z is selected from these sequences.",
    }
    (OUT / "results.json").write_text(json.dumps(c25.sanitize(out), indent=2, sort_keys=True))
    print(json.dumps(c25.sanitize(approach), indent=2))


if __name__ == "__main__":
    main()
