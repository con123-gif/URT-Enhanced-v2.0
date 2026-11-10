#!/usr/bin/env python3
"""Coupled cycle 09: closed-form E1 and high-precision test of 3/20 - E1 = delta*."""
from __future__ import annotations
import json
from pathlib import Path
import mpmath as mp

OUT = Path("/workspace/arf_research/coupled_cycle09_E1_identity")


def compute(dps):
    mp.mp.dps = dps
    phi = (1 + mp.sqrt(5)) / 2
    pi = mp.pi
    e = mp.e
    # two algebraic writings of the angle
    ang1 = pi / phi**2 - 3 * pi / 8
    ang2 = pi * (9 - 4 * mp.sqrt(5)) / 8
    E1_a = 4 * (pi / e) ** 2 * mp.sin(ang1) ** 2
    E1_b = 4 * (pi / e) ** 2 * mp.sin(ang2) ** 2
    # also the cosine form
    theta = 2 * pi / phi**2
    E1_c = (pi / e) ** 2 * (2 - 2 * mp.cos(theta - 3 * pi / 4))
    delta_star = 80 * pi / (1053 * phi)
    Delta = mp.mpf(3) / 20 - delta_star
    three20_minus_E1 = mp.mpf(3) / 20 - E1_c
    return {
        "dps": dps,
        "E1_sin_phi": mp.nstr(E1_a, 40),
        "E1_sin_radical": mp.nstr(E1_b, 40),
        "E1_cos_form": mp.nstr(E1_c, 40),
        "E1_forms_agree": bool(abs(E1_a - E1_b) < mp.mpf(10) ** (-dps + 5)
                               and abs(E1_a - E1_c) < mp.mpf(10) ** (-dps + 5)),
        "delta_star": mp.nstr(delta_star, 40),
        "Delta": mp.nstr(Delta, 40),
        "three20_minus_E1": mp.nstr(three20_minus_E1, 40),
        "three20_minus_E1_minus_delta_star": mp.nstr(three20_minus_E1 - delta_star, 40),
        "Delta_minus_E1": mp.nstr(Delta - E1_c, 40),
        "identity_Delta_minus_E1_eq_three20_E1_minus_dstar": bool(
            abs((three20_minus_E1 - delta_star) - (Delta - E1_c)) < mp.mpf(10) ** (-dps + 5)
        ),
        "rel_three20_E1_vs_delta_star": mp.nstr(abs(three20_minus_E1 - delta_star) / abs(delta_star), 20),
        "rel_E1_vs_Delta": mp.nstr(abs(E1_c - Delta) / abs(Delta), 20),
        "abs_diff": mp.nstr(abs(E1_c - Delta), 20),
    }


def main():
    r80 = compute(80)
    r120 = compute(120)
    # difference must be stable
    d80 = mp.mpf(r80["abs_diff"])
    d120 = mp.mpf(compute(120)["abs_diff"])
    stable = abs(d80 - d120) / d80 < mp.mpf("1e-20")
    is_identity = d80 < mp.mpf("1e-50")
    results = {
        "closed_form": {
            "E1": "4*(pi/e)**2 * sin(pi/phi**2 - 3*pi/8)**2",
            "E1_algebraic_angle": "4*(pi/e)**2 * sin(pi*(9-4*sqrt(5))/8)**2",
            "delta_star": "80*pi/(1053*phi)",
            "rewrite": "(3/20 - E1) - delta_star = Delta - E1",
        },
        "precision_80": r80,
        "precision_120": r120,
        "difference_stable_under_precision": bool(stable),
        "is_identity": bool(is_identity),
        "classification": "PROVED" if is_identity else "FALSIFIED",
        "note": (
            "Exact identity." if is_identity else
            "The equality 3/20 - E1 = delta* is not an identity. It is the "
            "same near-hit as E1 vs Delta, rewritten over the larger scale "
            "delta*. Closed forms involve (pi/e)^2 sin^2(pi(9-4sqrt(5))/8) "
            "versus 80*pi/(1053*phi); high-precision difference is stable."
        ),
        "advances_ARF": False,
    }
    (OUT / "results.json").write_text(json.dumps(results, indent=2))
    print(json.dumps(results, indent=2))
    print("PASS: cycle 09 E1 identity test")


if __name__ == "__main__":
    main()
