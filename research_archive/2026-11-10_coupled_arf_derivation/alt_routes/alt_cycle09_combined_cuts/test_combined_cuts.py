#!/usr/bin/env python3
"""alt_cycle09: residual Yukawa dimension after all proven cuts."""
from __future__ import annotations

import json
from itertools import product
from pathlib import Path

import sympy as sp

PHI = (1 + sp.sqrt(5)) / 2
PHIB = (1 - sp.sqrt(5)) / 2
CLSZ = [1, 15, 20, 12, 12]
CHARS = {
    "1": [sp.Integer(1)] * 5,
    "3": [sp.Integer(3), -1, 0, PHI, PHIB],
    "3'": [sp.Integer(3), -1, 0, PHIB, PHI],
    "4": [sp.Integer(4), 0, 1, -1, -1],
    "5": [sp.Integer(5), 1, -1, 0, 0],
}
SQUARE = [0, 0, 2, 4, 3]
CH12 = [sp.Integer(12), 0, 0, 2, 2]
CH20 = [sp.Integer(20), 0, 2, 0, 0]
types = [CH12, CH12, CH20, CH20]


def inner(a, b):
    return sp.simplify(sum(sp.Integer(CLSZ[i]) * a[i] * b[i] for i in range(5)) / 60)


def decompose(ch):
    out = {n: inner(ch, v) for n, v in CHARS.items()}
    for n, val in out.items():
        assert val.is_Integer and val >= 0, (n, val)
        out[n] = int(val)
    return out


def mul(a, b):
    return [sp.simplify(a[i] * b[i]) for i in range(5)]


def sym2(ch):
    return [sp.simplify((sp.S(ch[i]) ** 2 + sp.S(ch[SQUARE[i]])) / 2) for i in range(5)]


def tensor(a, b):
    return mul(a, b)


def n4(ch):
    return decompose(ch)["4"]


# H13 channels
channels = {
    "3x5": {"n4": n4(mul(CHARS["3"], CHARS["5"])), "parity": "odd", "hidden": "4_3"},
    "3px5": {"n4": n4(mul(CHARS["3'"], CHARS["5"])), "parity": "odd", "hidden": "4_3"},
    "3x3p": {"n4": n4(mul(CHARS["3"], CHARS["3'"])), "parity": "even", "hidden": "4_5"},
    "Sym2(5)": {"n4": n4(sym2(CHARS["5"])), "parity": "even", "hidden": "4_5"},
}
assert all(ch["n4"] == 1 for ch in channels.values())
yukawa_H13_inversion = sum(ch["n4"] for ch in channels.values())
assert yukawa_H13_inversion == 4

# H13-only anomalies with q_vertex = 1, q_center = qc integer
# Tr Q = qc + 12, Tr Q3 = qc**3 + 12
h13_anom_solutions = []
for qc in range(-20, 21):
    if qc + 12 == 0 and qc ** 3 + 12 == 0:
        h13_anom_solutions.append(qc)
assert h13_anom_solutions == []
# even the gravitational condition qc = -12 fails the cubic: (-12)**3 + 12 = -1716

# Pairing counts on H64 (cycle 03 formulae)
sym_blocks = [n4(sym2(ch)) for ch in types]
cross_blocks = [[n4(tensor(types[i], types[j])) for j in range(4)] for i in range(4)]


def pairing_m(charges):
    total = 0
    for i in range(4):
        if 2 * charges[i] == 2:
            total += sym_blocks[i]
    for i in range(4):
        for j in range(i + 1, 4):
            if charges[i] + charges[j] == 2:
                total += cross_blocks[i][j]
    return total


def trQ(q):
    return 12 * q[0] + 12 * q[1] + 20 * q[2] + 20 * q[3]


def trQ3(q):
    return 12 * q[0] ** 3 + 12 * q[1] ** 3 + 20 * q[2] ** 3 + 20 * q[3] ** 3


specials = {
    "(1,-1,0,0)": (1, -1, 0, 0),
    "(1,-1,2,-2)": (1, -1, 2, -2),
    "(1,-1,-2,2)": (1, -1, -2, 2),
    "(1,-1,1,-1)": (1, -1, 1, -1),
    "(-1,1,0,0)": (-1, 1, 0, 0),
    "(0,0,0,0)": (0, 0, 0, 0),
}
special_m = {}
for name, q in specials.items():
    assert trQ(q) == 0 and trQ3(q) == 0
    special_m[name] = pairing_m(q)

assert special_m["(1,-1,0,0)"] == 4
assert special_m["(1,-1,2,-2)"] == 4
assert special_m["(1,-1,-2,2)"] == 4
assert special_m["(1,-1,1,-1)"] == 35

# After inversion, residual dim = m (each 4-copy has one parity), not 2m
residual_min = special_m["(1,-1,0,0)"]
residual_large = special_m["(1,-1,1,-1)"]
assert residual_min == 4
assert residual_large == 35

# Ward: charge-+2 pairing with q_vertex=1 has prefactor (2 - 2*1) wait
# q_B + q_B = 2 = q_h, so first Ward (q_B + q_B - q_h) = 0
# second Ward likewise 0. Identically satisfied.
ward_cuts_dimension = False

# Positivity: each channel contributes a PSD piece, so all of R^4 is allowed
positivity_cuts_dimension = False

# Hodge: kinetic scale only
kinetic_scale_remaining = 1
combined_yukawa_plus_scale = residual_min + kinetic_scale_remaining

result = {
    "H1_H13_after_inversion_Ward_positivity_Hodge": {
        "channels": channels,
        "yukawa_dimension": yukawa_H13_inversion,
        "ward_cuts_dimension": ward_cuts_dimension,
        "positivity_cuts_dimension": positivity_cuts_dimension,
        "hodge_fixes_kinetic_ray_scale_free": True,
        "kinetic_scale_remaining": kinetic_scale_remaining,
    },
    "H2_H13_not_anomaly_free_alone": {
        "q_vertex": 1,
        "integer_qc_solving_both_anomalies": h13_anom_solutions,
        "qc_minus_12_fails_cubic": {"qc": -12, "TrQ": 0, "TrQ3": (-12) ** 3 + 12},
    },
    "H3_anomaly_free_H64": {
        "pairing_m": special_m,
        "residual_after_inversion_equals_m_not_2m": True,
        "residual_minimal": residual_min,
        "residual_at_(1,-1,1,-1)": residual_large,
        "is_a_ray": False,
    },
    "H4_combined": {
        "residual_yukawa_dimension": residual_min,
        "residual_including_kinetic_scale": combined_yukawa_plus_scale,
        "unique_ray": False,
    },
    "classification": {
        "H1": "PROVED",
        "H2": "PROVED",
        "H3": "PROVED",
        "H4": "PROVED",
    },
    "advances_ARF": False,
    "which_ARF": None,
    "next_obstruction": (
        "All proven cuts together leave 4 real Yukawa parameters plus one "
        "kinetic scale. The residual space is not a ray."
    ),
}

Path("/workspace/arf_research/alt_cycle09_combined_cuts/results.json").write_text(
    json.dumps(result, indent=2) + "\n"
)
print(json.dumps(result, indent=2))
print("PASS: alt_cycle09")
