#!/usr/bin/env python3
"""Exact free-bilinear verification of (W4) and (W5), not a Galois proof.

All pairing values on basis vectors are independent indeterminates.
Only bilinearity, equivariance and the two stated cocycle identities
are used in the expansions. No numerical samples or Lean execution.
"""
from __future__ import annotations

import json
from pathlib import Path

import sympy as sp

lam, mu = sp.symbols("lambda mu")


def vector(**coeffs):
    return {key: sp.sympify(value) for key, value in coeffs.items() if value}


def add(*vectors):
    result = {}
    for v in vectors:
        for key, value in v.items():
            result[key] = sp.expand(result.get(key, 0) + value)
    return {key: value for key, value in result.items() if value != 0}


def scale(c, v):
    return {key: sp.expand(c * value) for key, value in v.items()}


def pair(a, b):
    return sp.expand(sum(c * d * sp.Symbol("P_" + x + "__" + y)
                         for x, c in a.items() for y, d in b.items()))


def check():
    X, gX, phiX, W, gW = [vector(**{x: 1})
                          for x in ["X", "gX", "phiX", "W", "gW"]]
    Y, gY, ghY, phiY, gphiY = [vector(**{x: 1})
                               for x in ["Y", "gY", "ghY", "phiY", "gphiY"]]
    ag, gah, bg, gbh = [vector(**{x: 1})
                        for x in ["ag", "gah", "bg", "gbh"]]
    v, gv, ghv = sp.symbols("v gv ghv")

    # gE(h), E(gh), E(g), with a(gh)=a(g)+g a(h), likewise b.
    gEh = (lam * pair(gah, ghY) - mu * pair(gX, gbh)
           - pair(gX, add(ghY, scale(-1, gY))) + ghv - gv)
    Egh = (lam * pair(add(ag, gah), ghY)
           - mu * pair(X, add(bg, gbh))
           - pair(X, add(ghY, scale(-1, Y))) + ghv - v)
    Eg = (lam * pair(ag, gY) - mu * pair(X, bg)
          - pair(X, add(gY, scale(-1, Y))) + gv - v)
    Ag = add(gX, scale(-1, X), scale(lam, ag))
    gBh = add(ghY, scale(-1, gY), scale(mu, gbh))
    cup_rhs = lam * mu * pair(ag, gbh) - pair(Ag, gBh)
    cup_residual = sp.expand(gEh - Egh + Eg - cup_rhs)
    assert cup_residual == 0

    # phi(v)-v=P(W,D), with D=phiY-Y; g acts on both arguments.
    D, gD = add(phiY, scale(-1, Y)), add(gphiY, scale(-1, gY))
    phiEg_minus_Eg = (
        lam * pair(ag, gD) - mu * pair(add(phiX, scale(-1, X)), bg)
        - pair(phiX, add(gphiY, scale(-1, phiY)))
        + pair(X, add(gY, scale(-1, Y)))
        + pair(gW, gD) - pair(W, D)
    )
    Bg = add(gY, scale(-1, Y), scale(mu, bg))
    phiBg = add(gphiY, scale(-1, phiY), scale(mu, bg))
    frobenius_rhs = (
        pair(add(gW, scale(-1, W), scale(lam, ag)), gD)
        - pair(add(W, scale(-1, X)), Bg)
        - pair(add(phiX, scale(-1, W)), phiBg)
    )
    frobenius_residual = sp.expand(phiEg_minus_Eg - frobenius_rhs)
    assert frobenius_residual == 0

    # Two false changes must not survive the free-bilinear check.
    correction_differential = (
        -pair(gX, add(ghY, scale(-1, gY)))
        + pair(X, add(ghY, scale(-1, Y)))
        - pair(X, add(gY, scale(-1, Y)))
    )
    missing_correction = sp.expand(
        gEh - Egh + Eg - correction_differential - cup_rhs)
    wrong_phi_sign = sp.expand(
        phiEg_minus_Eg - 2 * (pair(gW, gD) - pair(W, D))
        - frobenius_rhs)
    assert missing_correction != 0
    assert wrong_phi_sign != 0

    return {
        "pin": "72fead102f663d5c7a407964a13dc0cf9d977207",
        "sympy": sp.__version__,
        "method": "exact free-bilinear polynomial expansion",
        "universal_identities": {
            "W4_cup_differential_residual": str(cup_residual),
            "W5_frobenius_residual": str(frobenius_residual),
        },
        "negative_controls_rejected": {
            "omitted_E_correction": True,
            "reversed_phi_v_equation": True,
        },
        "scope": "Algebra of W4/W5 only, under the stated cocycle/equivariance rules.",
        "Kisin_or_period_ring_inputs_verified": False,
        "continuity_or_cut_profiles_verified": False,
        "independent_human_audit": False,
        "native_Lean_execution": False,
        "RH_proof_verified": False,
    }


if __name__ == "__main__":
    report = check()
    dst = Path(__file__).with_name("2026-11-26_COMPACT_CUP_COCHAIN_CERT.json")
    dst.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))
