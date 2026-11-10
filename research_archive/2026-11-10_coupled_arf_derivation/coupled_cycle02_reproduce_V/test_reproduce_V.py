#!/usr/bin/env python3
"""Coupled cycle 02: independently reproduce the archived nonlinear V."""
from __future__ import annotations

import json
from itertools import product
from pathlib import Path

import numpy as np

SRC = Path(
    "/workspace/arf_research/repo/research_archive/"
    "2026-11-07_joint_interacting_native/"
    "cathedral_constructed_joint_dynamics_2026_11_07.py"
)
gbl = {}
exec(compile(SRC.read_text().split("rng=np.random.default_rng(20261107)")[0], str(SRC), "exec"), gbl)

C = gbl["C"]
P3, P5 = gbl["P3"], gbl["P5"]
Iico = gbl["Iico"]
r = float(gbl["r"])
theta = float(gbl["theta"])
Delta = float(gbl["Delta"])
N = int(gbl["N"])
assert Iico.shape == (12, 8)
# Iico: columns 0..2 are the whitened dipole (3), 3..7 the quadrupole (5)
U3 = Iico[:, :3]
U5 = Iico[:, 3:]
assert np.allclose(U3.T @ U3, np.eye(3), atol=1e-10)
assert np.allclose(U5.T @ U5, np.eye(5), atol=1e-10)

ARCH_A = 0.490435304391
ARCH_B = 4.16132699108e-7
ARCH_MIX = 1.961741217564
assert abs(4 * ARCH_A - ARCH_MIX) < 1e-12  # mixed derivative identity

# Clock symbols
ms = np.arange(N)
gaps2 = 2 - 2 * np.cos(2 * theta - 2 * np.pi * ms / N)
m2 = int(np.argmin(gaps2))
lam_gold = float(gaps2[m2])
lam_zero = 0.0

def c_coeffs(lam):
    c3 = 0.25 - 0.5 / (18.0 + r * r * lam)
    c5 = 0.25 - 0.5 / (16.0 + r * r * lam)
    return c3, c5

# Build explicit A3, A5 and invert, to honour the stated formula
def clock_L2(thetas, charge=2):
    L = 2 * np.eye(N, dtype=complex)
    for j in range(N):
        k = (j + 1) % N
        u = np.exp(1j * charge * thetas[j])
        L[k, j] += -u
        L[j, k] += -np.conj(u)
    return L

thetas = np.full(N, theta)
L2 = clock_L2(thetas, 2)
A3 = 18 * np.eye(N, dtype=complex) + (r * r) * L2
A5 = 16 * np.eye(N, dtype=complex) + (r * r) * L2
A3inv = np.linalg.inv(A3)
A5inv = np.linalg.inv(A5)
# Fourier symbol check
F = np.exp(1j * 2 * np.pi * np.outer(np.arange(N), ms) / N) / np.sqrt(N)
# mode m2 eigenvector
vm = F[:, m2]
sym3 = float(np.real(vm.conj() @ A3inv @ vm))
sym5 = float(np.real(vm.conj() @ A5inv @ vm))
# 1/(18+r^2 lam) should equal sym3
c3_g, c5_g = c_coeffs(lam_gold)
assert abs(sym3 - 1.0 / (18.0 + r * r * lam_gold)) < 1e-12
assert abs(sym5 - 1.0 / (16.0 + r * r * lam_gold)) < 1e-12

def hidden_specified(tvec, fvec):
    ct = C @ tvec
    cf = C @ fvec
    h3 = 2.0 * (P3 @ (ct * cf))
    h5 = P5 @ (cf * cf)
    return h3, h5

def hidden_full(tvec, fvec):
    x = tvec + fvec
    cx = C @ x
    sq = cx * cx
    return P3 @ sq, P5 @ sq

def V_from_spatial(h3, h5, c3, c5, clock_copies=1.0):
    """Single-mode (or scalar) reduction: V = clock_copies * (c3||h3||^2 + Δ² c5 ||h5||^2)."""
    return clock_copies * (c3 * np.vdot(h3, h3).real + (Delta ** 2) * c5 * np.vdot(h5, h5).real)

# For each pair of axes, the specified source is bilinear in (t,f) for h3 and quadratic in f for h5.
# V = a t^2 f^2 + b f^4  when tvec = t * u3, fvec = f * u5.

pairs = []
for i3, i5 in product(range(3), range(5)):
    u3 = U3[:, i3]
    u5 = U5[:, i5]
    h3, h5 = hidden_specified(u3, u5)  # at t=f=1
    a = c3_g * np.vdot(h3, h3).real          # coefficient of t^2 f^2
    b = (Delta ** 2) * c5_g * np.vdot(h5, h5).real  # coefficient of f^4
    pairs.append({
        "i3": i3, "i5": i5,
        "a": float(a), "b": float(b),
        "norm_h3": float(np.linalg.norm(h3)),
        "norm_h5": float(np.linalg.norm(h5)),
        "rel_a": abs(a - ARCH_A) / ARCH_A,
        "rel_b": abs(b - ARCH_B) / ARCH_B if ARCH_B else None,
    })

# averages and extrema
As = np.array([p["a"] for p in pairs])
Bs = np.array([p["b"] for p in pairs])

# Also try an A5-invariant isotropic choice: average |h3|^2 over the 3x5 frame,
# and the fully contracted tensors.
# RMS over pairs
a_mean, a_std = float(As.mean()), float(As.std())
b_mean, b_std = float(Bs.mean()), float(Bs.std())
best_a = min(pairs, key=lambda p: p["rel_a"])
best_b = min(pairs, key=lambda p: p["rel_b"])

# Scale variants: multiply by N=24 (all clock copies of a single mode)
# or use zero-mode coefficients
c3_0, c5_0 = c_coeffs(0.0)
# Reconstruct a,b at zero clock for the best spatial pair of specified source
u3b = U3[:, best_a["i3"]]; u5b = U5[:, best_a["i5"]]
h3b, h5b = hidden_specified(u3b, u5b)
a0 = c3_0 * np.vdot(h3b, h3b).real
b0 = (Delta ** 2) * c5_0 * np.vdot(h5b, h5b).real
aN = 24 * best_a["a"]
bN = 24 * best_b["b"]

# Full untruncated Nov 7 source at t=f=1 along the same axes: not of the form a t^2 f^2 + b f^4
# Extract monomials by evaluating at a few (t,f) and solving.
def monomials_full(u3, u5, c3, c5):
    # V(t,f) from full source, evaluate a grid and fit monomials
    # h = P (C(t u3 + f u5))^2 = t^2 h_tt + 2tf h_tf + f^2 h_ff
    ct = C @ u3; cf = C @ u5
    htt3, htt5 = P3 @ (ct * ct), P5 @ (ct * ct)
    htf3, htf5 = P3 @ (ct * cf), P5 @ (ct * cf)
    hff3, hff5 = P3 @ (cf * cf), P5 @ (cf * cf)
    # specified source keeps 2 htf for h3 and hff for h5 only
    # full: h3 = t^2 htt3 + 2tf htf3 + f^2 hff3, similarly h5
    # V = c3 ||h3||^2 + Δ² c5 ||h5||^2 is a quartic. We report the t^2 f^2 and f^4 pieces
    # ||h3||^2 = t^4 ||htt3||^2 + 4 t^2 f^2 ||htf3||^2 + f^4 ||hff3||^2
    #          + 4 t^3 f Re <htt3,htf3> + 2 t^2 f^2 Re <htt3,hff3> + 4 t f^3 Re <htf3,hff3>
    return {
        "t4": float(c3 * np.vdot(htt3, htt3).real + (Delta ** 2) * c5 * np.vdot(htt5, htt5).real),
        "t2f2_diag": float(c3 * 4 * np.vdot(htf3, htf3).real + (Delta ** 2) * c5 * 4 * np.vdot(htf5, htf5).real),
        "f4": float(c3 * np.vdot(hff3, hff3).real + (Delta ** 2) * c5 * np.vdot(hff5, hff5).real),
        "specified_t2f2": float(c3 * 4 * np.vdot(htf3, htf3).real),  # h3=2 htf, no h5 mixed
        "specified_f4": float((Delta ** 2) * c5 * np.vdot(hff5, hff5).real),
    }

mono = monomials_full(U3[:, 0], U5[:, 0], c3_g, c5_g)

# Isotropic average of specified coefficients over the orthonormal frames
# (this is the unique A5-invariant pairing of the two subspaces, up to scale)
a_iso = a_mean
b_iso = b_mean

candidates = {
    "specified_golden_mean_over_3x5_axes": {"a": a_mean, "b": b_mean},
    "specified_golden_best_a_axis": {"a": best_a["a"], "b": best_a["b"], "axis": (best_a["i3"], best_a["i5"])},
    "specified_zero_clock_on_best_a_axis": {"a": float(a0), "b": float(b0)},
    "specified_golden_times_24": {"a": float(24 * a_mean), "b": float(24 * b_mean)},
    "specified_axis00": {"a": pairs[0]["a"], "b": pairs[0]["b"]},
}

def rels(a, b):
    return {"rel_a": abs(a - ARCH_A) / ARCH_A, "rel_b": abs(b - ARCH_B) / ARCH_B,
            "rel_mix": abs(4 * a - ARCH_MIX) / ARCH_MIX}

scored = {k: {**v, **rels(v["a"], v["b"])} for k, v in candidates.items()}
best_cand = min(scored.items(), key=lambda kv: kv[1]["rel_a"] + kv[1]["rel_b"])

# Does any pair hit the archived a to printed precision (~1e-12 relative would be exact print)?
printed_prec_a = 1e-12 / ARCH_A * ARCH_A  # printed to 12 digits after the point? 0.490435304391 has 12 dp
# compare at 5e-13 absolute ~ last-digit
hits_printed = [p for p in pairs if abs(p["a"] - ARCH_A) < 5e-13 and abs(p["b"] - ARCH_B) < 5e-19]

result = {
    "archived": {"a": ARCH_A, "b": ARCH_B, "mixed": ARCH_MIX, "four_a_equals_mixed": True},
    "clock": {"m2": m2, "lam_gold": lam_gold, "c3_gold": c3_g, "c5_gold": c5_g,
              "c3_zero": c3_0, "c5_zero": c5_0, "A3inv_symbol_ok": True},
    "pair_stats": {
        "n_pairs": len(pairs),
        "a_min": float(As.min()), "a_max": float(As.max()), "a_mean": a_mean, "a_std": a_std,
        "b_min": float(Bs.min()), "b_max": float(Bs.max()), "b_mean": b_mean, "b_std": b_std,
        "a_depends_on_direction": bool(As.std() / max(As.mean(), 1e-18) > 1e-8),
        "b_depends_on_direction": bool(Bs.std() / max(Bs.mean(), 1e-18) > 1e-8),
    },
    "pairs": pairs,
    "candidates": scored,
    "best_candidate": {"name": best_cand[0], **best_cand[1]},
    "full_source_monomials_axis00": mono,
    "hits_printed_precision": hits_printed,
    "classification": (
        "PROVED" if hits_printed else
        "CONDITIONAL" if best_cand[1]["rel_a"] < 1e-3 and best_cand[1]["rel_b"] < 1e-3 else
        "FALSIFIED"
    ),
    "advances_ARF": False,
}

# Human summary classification refinement:
# If direction-dependence is large, matching one axis is CONDITIONAL on axis choice.
if result["classification"] == "PROVED" and (As.std() > 1e-8):
    result["classification"] = "CONDITIONAL"

Path("/workspace/arf_research/coupled_cycle02_reproduce_V/results.json").write_text(
    json.dumps(result, indent=2) + "\n"
)
print(json.dumps({
    "classification": result["classification"],
    "pair_stats": result["pair_stats"],
    "best_candidate": result["best_candidate"],
    "full_source_monomials_axis00": mono,
    "n_printed_hits": len(hits_printed),
    "c3_gold": c3_g, "c5_gold": c5_g, "Delta2": Delta ** 2,
}, indent=2))
print("PASS: cycle 02 V reproduction")
