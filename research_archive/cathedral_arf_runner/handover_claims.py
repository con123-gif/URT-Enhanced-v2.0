#!/usr/bin/env python3
"""Independent recomputation of the checkable numeric claims in the
2026-11-10 research handover (sections 3-7, 9, 10).

Imports nothing from the repository: stdlib (decimal, fractions) + numpy.
All five Platonic solids are built from coordinates; faces are found as
supporting planes; incidence matrices are oriented and checked (d1 d0 = 0).

A PASS means the stated number is what the stated formula/construction gives.
It says nothing about physical interpretation. Exit status 1 if any claim
mismatches; every claim is printed either way.
"""
from __future__ import annotations

import argparse
import itertools
import json
import math
import sys
from decimal import Decimal, getcontext
from fractions import Fraction

import numpy as np

getcontext().prec = 60
RESULTS: list[dict] = []

# Documented errata in the handover text. The check passes only if the set of
# mismatches equals this set exactly: a new mismatch fails, and so does an
# erratum that silently starts matching (the list must then be updated).
ERRATA = {
    "3.p5": "handover states 6.19613e-6; Δ²/(1+Δ²) = 6.196027670655e-6, as every repository file records",
}


def claim(cid, section, statement, stated, computed, ok, note=""):
    RESULTS.append(dict(id=cid, section=section, statement=statement, stated=str(stated),
                        computed=str(computed), verdict="PASS" if ok else "MISMATCH", note=note))


def close(stated, computed, rel=None, abs_=None):
    stated, computed = float(stated), float(computed)
    if abs_ is not None:
        return abs(stated - computed) <= abs_
    return abs(stated - computed) <= rel * abs(computed)


# ---------------------------------------------------------------- constants
def _atan_inv(x):
    x = Decimal(x); s = Decimal(0); t = 1 / x; n = 1; sign = 1; x2 = x * x
    while t / n > Decimal(10) ** -58:
        s += sign * t / n; t /= x2; n += 2; sign = -sign
    return s


PI = 16 * _atan_inv(5) - 4 * _atan_inv(239)          # Machin, 58 digits
PHI = (1 + Decimal(5).sqrt()) / 2
D_STAR = 80 * PI / (1053 * PHI)
DELTA = Decimal(3) / 20 - D_STAR
ETA = -DELTA.ln()
D2 = DELTA * DELTA


def constants():
    gamma, N = Fraction(1, 81), 13
    claim("3.delta_star_identity", "3", "δ⋆=(1-γ)π/(Nφ)=80π/(1053φ)", "80/1053",
          (1 - gamma) / N, (1 - gamma) / N == Fraction(80, 1053))
    claim("3.delta_star", "3", "δ⋆≈0.14751081015958", "0.14751081015958", f"{D_STAR:.17f}",
          close("0.14751081015958", D_STAR, abs_=5e-15))
    claim("3.Delta", "3", "Δ=3/20-δ⋆≈0.002489189840420", "0.002489189840420", f"{DELTA:.18f}",
          close("0.002489189840420", DELTA, abs_=5e-16))
    claim("3.eta_Delta", "3", "η_Δ=-lnΔ≈5.9957979867", "5.9957979867", f"{ETA:.13f}",
          close("5.9957979867", ETA, abs_=5e-11))
    p5 = D2 / (1 + D2)
    claim("3.p5", "3", "p5=Δ²/(1+Δ²)≈6.19613e-6", "6.19613e-6", f"{p5:.10e}",
          close("6.19613e-6", p5, abs_=5e-12),
          note="repository files (docs/, research_archive/) all record 6.196027670655e-6; the handover value is a transcription error")
    chi = 8 * ETA * (1 + D2) / (1 - D2)
    claim("3.chi35", "3", "χ35=8η(1+Δ²)/(1-Δ²)≈47.96697830", "47.96697830", f"{chi:.11f}",
          close("47.96697830", chi, abs_=5e-9))
    # rho_star: trace one, Gibbs/KMS form with beta=2 eta, H5=P5
    pa = float(1 / (4 * (1 + D2))); pb = float(D2 / (4 * (1 + D2)))
    rho = np.diag([pa] * 4 + [pb] * 4)
    claim("3.rho_trace", "3", "Tr ρ⋆ = 1", 1, float(np.trace(rho)), abs(np.trace(rho) - 1) < 1e-15)
    kms = math.exp(-2 * float(ETA))
    claim("3.kms_form", "3", "ρ⋆ ∝ exp(-β P5), β=2η_Δ ⇒ weight ratio e^{-β}=Δ²", f"{float(D2):.12e}",
          f"{kms:.12e}", close(D2, kms, rel=1e-12))
    # BKM stiffness from the Frechet derivative of log at rho_star, unit off-diagonal 3<->5 probe
    X = np.zeros((8, 8)); X[0, 4] = X[4, 0] = 1 / math.sqrt(2)

    def logm_sym(a):
        w, v = np.linalg.eigh(a)
        return (v * np.log(w)) @ v.T
    eps = 1e-10
    dlog = (logm_sym(rho + eps * X) - logm_sym(rho - eps * X)) / (2 * eps)
    bkm = float(np.trace(X @ dlog))
    claim("3.chi35_is_BKM", "3", "χ35 equals the BKM metric ⟨X,X⟩ for a unit visible↔hidden probe",
          f"{float(chi):.8f}", f"{bkm:.8f}", close(chi, bkm, rel=1e-5),
          note="finite-difference Fréchet derivative of log ρ⋆, ε=1e-10")


# ---------------------------------------------------------------- geometry
def solids():
    p = float(PHI); ip = 1 / p
    s = (-1, 1)
    return {
        "tetrahedron": [(1, 1, 1), (1, -1, -1), (-1, 1, -1), (-1, -1, 1)],
        "cube": list(itertools.product(s, s, s)),
        "octahedron": [v for i in range(3) for t in s for v in [tuple(t if j == i else 0 for j in range(3))]],
        "dodecahedron": list(itertools.product(s, s, s))
        + [(0, a * ip, b * p) for a in s for b in s]
        + [(a * ip, b * p, 0) for a in s for b in s]
        + [(a * p, 0, b * ip) for a in s for b in s],
        "icosahedron": [(0, a, b * p) for a in s for b in s]
        + [(a, b * p, 0) for a in s for b in s]
        + [(a * p, 0, b) for a in s for b in s],
    }


def complex_of(verts):
    V = np.array(verts, float); n = len(V)
    dist = np.linalg.norm(V[:, None] - V[None], axis=2)
    dmin = min(dist[i, j] for i in range(n) for j in range(i))
    edges = [(i, j) for i in range(n) for j in range(i + 1, n) if abs(dist[i, j] - dmin) < 1e-9]
    faces = set()
    for a, b, c in itertools.combinations(range(n), 3):
        nrm = np.cross(V[b] - V[a], V[c] - V[a])
        if np.linalg.norm(nrm) < 1e-9:
            continue
        side = (V - V[a]) @ nrm
        if np.all(side <= 1e-9) or np.all(side >= -1e-9):
            faces.add(tuple(sorted(np.where(abs(side) < 1e-9)[0])))
    faces = sorted(faces)
    # orient faces counter-clockwise about the outward normal
    oriented = []
    for f in faces:
        P = V[list(f)]; c = P.mean(0); out = c / np.linalg.norm(c)
        u = P[0] - c; u /= np.linalg.norm(u); w = np.cross(out, u)
        ang = [math.atan2((q - c) @ w, (q - c) @ u) for q in P]
        oriented.append([f[k] for k in np.argsort(ang)])
    eidx = {e: k for k, e in enumerate(edges)}
    d0 = np.zeros((len(edges), n))
    for k, (i, j) in enumerate(edges):
        d0[k, i], d0[k, j] = -1, 1
    d1 = np.zeros((len(oriented), len(edges)))
    for r, cyc in enumerate(oriented):
        for a, b in zip(cyc, cyc[1:] + cyc[:1]):
            d1[r, eidx[(min(a, b), max(a, b))]] = 1 if a < b else -1
    assert np.allclose(d1 @ d0, 0), "boundary of boundary must vanish"
    return V, edges, oriented, d0, d1


def spectrum_mults(evals, targets, tol=1e-9):
    return [int(np.sum(abs(evals - t) < tol)) for t in targets]


def geometry():
    tot = dict(V=0, E=0, F=0); tr2 = tr4 = 0.0; per_solid_8E = True
    data = {}
    for name, verts in solids().items():
        V, E, F, d0, d1 = complex_of(verts)
        data[name] = (V, E, F, d0, d1)
        tot["V"] += len(V); tot["E"] += len(E); tot["F"] += len(F)
        nv, ne, nf = len(V), len(E), len(F)
        D = np.zeros((nv + ne + nf,) * 2)
        D[nv:nv + ne, :nv] = d0; D[nv + ne:, nv:nv + ne] = d1
        D = D + D.T                                     # Hodge-Dirac d + d†
        D2m = D @ D
        t2, t4 = np.trace(D2m), np.trace(D2m @ D2m)
        per_solid_8E &= abs(t2 - 8 * ne) < 1e-9
        tr2 += t2; tr4 += t4
        assert len(V) - len(E) + len(F) == 2
    claim("4.sum_VEF", "4", "ΣV=50, ΣE=90, ΣF=50", "(50, 90, 50)", (tot["V"], tot["E"], tot["F"]),
          (tot["V"], tot["E"], tot["F"]) == (50, 90, 50))
    claim("4.cochain_dim", "4", "complete cochain dimension 190", 190, sum(tot.values()), sum(tot.values()) == 190)
    claim("4.tr_D2_8E", "4", "Tr D_P² = 8E for each solid; aggregate 720", 720, round(tr2, 9),
          per_solid_8E and abs(tr2 - 720) < 1e-9)
    claim("4.tr_D4", "4", "aggregate fourth moment Σ Tr D_P⁴ = 3456", 3456, round(tr4, 9), abs(tr4 - 3456) < 1e-9)

    V, E, F, d0, d1 = data["icosahedron"]
    L = d0.T @ d0
    ev = np.linalg.eigvalsh(L); r5 = math.sqrt(5)
    m = spectrum_mults(ev, [0, 5 - r5, 6, 5 + r5])
    claim("4.ico_laplacian", "4", "icosahedral Laplacian 0(1),(5-√5)(3),6(5),(5+√5)(3)", "[1, 3, 5, 3]", m, m == [1, 3, 5, 3])
    A = (np.abs(L) > 0).astype(float) - np.eye(12)
    L13 = np.zeros((13, 13)); L13[:12, :12] = np.diag(A.sum(1) + 1) - A
    L13[:12, 12] = L13[12, :12] = -1; L13[12, 12] = 12
    m13 = spectrum_mults(np.linalg.eigvalsh(L13), [0, 6 - r5, 7, 6 + r5, 13])
    claim("4.cell13_laplacian", "4", "centred 13-cell 0(1),(6-√5)(3),7(5),(6+√5)(3),13(1)", "[1, 3, 5, 3, 1]", m13,
          m13 == [1, 3, 5, 3, 1])
    C = np.zeros((20, 12))
    for i, f in enumerate(F):
        C[i, f] = 1
    rank = int(np.linalg.matrix_rank(C))
    Ph = np.eye(20) - C @ np.linalg.pinv(C)               # projector onto ker Cᵀ
    kdim = int(round(np.trace(Ph)))
    Lf = d1 @ d1.T                                       # face (dual-graph) Laplacian, 3I - A_dual
    hidden = np.linalg.eigvalsh(Ph @ Lf @ Ph)
    hm = spectrum_mults(hidden, [3, 5])
    claim("4.face_vertex_rank", "4", "20×12 face–vertex incidence has rank 12", 12, rank, rank == 12)
    claim("4.hidden_kernel", "4", "ker Cᵀ is 8-dim = 4 (eigenvalue 3) ⊕ 4 (eigenvalue 5)", "8 = [4, 4]",
          f"{kdim} = {hm}", kdim == 8 and hm == [4, 4])
    return data, Ph, Lf


# ---------------------------------------------------------------- histories
def histories(data, Ph, Lf):
    # Q^6 = J/64 exactly
    Q = [[Fraction(0)] * 64 for _ in range(64)]
    for h in range(64):
        Q[h][(2 * h) % 64] += Fraction(1, 2); Q[h][(2 * h + 1) % 64] += Fraction(1, 2)

    def mul(A, B):
        Bt = list(zip(*B))
        return [[sum(a * b for a, b in zip(row, col) if a and b) for col in Bt] for row in A]
    P = Q
    for _ in range(5):
        P = mul(P, Q)
    q6 = all(x == Fraction(1, 64) for row in P for x in row)
    claim("5.Q6_J64", "5", "Q⁶ = J/64 exactly (64-history doubling transfer)", "J/64", "J/64" if q6 else "≠ J/64", q6)
    # F_a(x)=2x+a mod 1 is conjugate to doubling by y=x+a
    a = 1 / float(PHI) ** 2; xs = np.random.default_rng(0).random(1000)
    conj = np.max(np.abs(((2 * xs + a) % 1 + a) % 1 - (2 * ((xs + a) % 1)) % 1))
    claim("5.translation_conjugacy", "5", "y=x+a conjugates F_a to y↦2y mod 1", 0, f"{conj:.1e}", conj < 1e-12)

    # H64 = 15 I - sum_{i<j} X_i X_j on six bits
    def X(i):
        M = np.zeros((64, 64))
        for h in range(64):
            M[h ^ (1 << i), h] = 1
        return M
    Xs = [X(i) for i in range(6)]
    H64 = 15 * np.eye(64) - sum(Xs[i] @ Xs[j] for i in range(6) for j in range(i + 1, 6))
    m = spectrum_mults(np.linalg.eigvalsh(H64), [0, 10, 16, 18])
    claim("6.H64_spectrum", "6", "H64 spectrum 0(2),10(12),16(30),18(20)", "[2, 12, 30, 20]", m, m == [2, 12, 30, 20])

    # hidden embedding U_h: antipodal pairs -> bits; history picks one vertex per pair
    V, E, F, d0, d1 = data["icosahedron"]
    pairs, remain = [], set(range(12))
    while remain:
        i = min(remain); j = min(remain - {i}, key=lambda k: np.linalg.norm(V[i] + V[k]))
        pairs.append((i, j)); remain -= {i, j}
    M = np.zeros((64, 20))
    for s in range(64):
        chosen = {pairs[i][(s >> i) & 1] for i in range(6)}
        for k, f in enumerate(F):
            if set(f) <= chosen:
                M[s, k] = 1
    U = M @ Ph / math.sqrt(2)
    P3 = Ph @ (5 * np.eye(20) - Lf) / 2; P5 = Ph @ (Lf - 3 * np.eye(20)) / 2
    iso = np.linalg.norm(U.T @ U - Ph)
    r3 = np.linalg.norm(H64 @ U @ P3 - 18 * U @ P3); r5 = np.linalg.norm(H64 @ U @ P5 - 16 * U @ P5)
    claim("6.Uh_isometry", "6", "U_hᵀU_h = P_hidden (isometric hidden embedding)", 0, f"{iso:.1e}", iso < 1e-12)
    claim("6.intertwining_P3", "6", "H64 U_h P3 = 18 U_h P3", 0, f"{r3:.1e}", r3 < 1e-12)
    claim("6.intertwining_P5", "6", "H64 U_h P5 = 16 U_h P5", 0, f"{r5:.1e}", r5 < 1e-12)


# ---------------------------------------------------------------- A5 source resolvent
def resolvent():
    a = [Fraction(266, 15), Fraction(389, 20), Fraction(391, 20), Fraction(521, 30)]
    w = [4, 2, 2, 0]
    ok = True
    for z in [Fraction(k, 7) for k in range(1, 12)]:
        g = sum(wi / (z - ai) for ai, wi in zip(a, w))
        closed = 20 * (2400 * z * z - 91480 * z + 871257) / ((15 * z - 266) * (20 * z - 391) * (20 * z - 389))
        ok &= g == closed
    claim("7.resolvent_closed_form", "7", "G(z)=20(2400z²-91480z+871257)/((15z-266)(20z-391)(20z-389))",
          "identity", "identity at 11 rational points" if ok else "fails", ok)
    mom = [sum(wi * ai ** k for ai, wi in zip(a, w)) for k in range(3)]
    claim("7.moments", "7", "source moments m0,m1,m2 = 8, 2234/15, 500201/180", "8, 2234/15, 500201/180",
          ", ".join(map(str, mom)), mom == [8, Fraction(2234, 15), Fraction(500201, 180)])
    claim("7.dark_pole", "7", "fourth pole 521/30 carries zero source weight", 0, w[3], w[3] == 0)


# ---------------------------------------------------------------- alpha polynomial, N-throat
def alpha_and_throat():
    ainv = 137 + Decimal(17572) / 1215 * DELTA - Decimal(9) / 65 * D2
    claim("9.alpha_inverse_polynomial", "9", "137+(17572/1215)Δ-(9/65)Δ²≈137.035999178", "137.035999178",
          f"{ainv:.12f}", close("137.035999178", ainv, abs_=5e-10),
          note="value of the stated polynomial only; the linear coefficient is not derived")
    nstar = 1 + 1 / D2
    claim("10.N_star", "10", "N⋆=1+Δ⁻²≈161,393", "161393", f"{nstar:.4f}", close("161393", nstar, abs_=1.0),
          note="exact 161393.73; the handover truncates rather than rounds")
    pc = 1 / (1 + (nstar - 1) * D2)
    claim("10.N_star_equal_split", "10", "at N=N⋆ the common/relative probabilities are both 1/2", "0.5",
          f"{pc:.15f}", close("0.5", pc, abs_=1e-30))


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("--json"); args = ap.parse_args()
    constants()
    data, Ph, Lf = geometry()
    histories(data, Ph, Lf)
    resolvent()
    alpha_and_throat()
    for r in RESULTS:
        if r["verdict"] == "MISMATCH" and r["id"] in ERRATA:
            r["verdict"] = "ERRATUM"
    bad = [r["id"] for r in RESULTS if r["verdict"] != "PASS"]
    for r in RESULTS:
        print(f"{r['verdict']:8s} §{r['section']:<3s} {r['id']:30s} stated={r['stated']:<24s} computed={r['computed']}"
              + (f"   [{r['note']}]" if r["note"] else ""))
    n_ok = sum(r["verdict"] == "PASS" for r in RESULTS)
    print(f"\n{n_ok}/{len(RESULTS)} handover claims reproduced; documented errata: {sorted(ERRATA)}")
    print("Scope: arithmetic and finite geometry as stated. Physical interpretation is not tested here.")
    unexpected = sorted(set(bad) - set(ERRATA)); stale = sorted(set(ERRATA) - set(bad))
    if unexpected:
        print("NEW MISMATCH(ES):", unexpected)
    if stale:
        print("ERRATA NOW MATCHING (update ERRATA):", stale)
    if args.json:
        with open(args.json, "w") as f:
            json.dump({"claims": RESULTS, "errata": ERRATA, "unexpected": unexpected, "stale_errata": stale}, f, indent=2)
    return 1 if unexpected or stale else 0


if __name__ == "__main__":
    sys.exit(main())
