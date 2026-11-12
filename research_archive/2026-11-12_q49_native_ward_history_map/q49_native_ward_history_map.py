#!/usr/bin/env python3
"""Q49 [derive] -- what history map does the native 190/64/24 Ward source supply?

Exact part (stdlib Fractions and Q(sqrt5) pairs; runs everywhere):
  E1  icosahedral face incidence C, hidden projectors P3, P5, Ph, the 64x20 bit
      incidence M and the hidden history projector P8 = M Ph M^T / 2 (rational).
  E2  the original 2026-11-09 Haar overlap C24 (24x64) in Q(sqrt5): margins, rank 24.
  E3  ||B||^2, ||B P8||^2, ||B (1-P8)||^2 exactly (B = sqrt(1536) C24).
  E4  the uniform shift theta -> theta + pi/24 changes the charge-one clock spectrum.
Archive part (needs the 2026-11-07 joint-dynamics module, i.e. mpmath; runs on CI):
  N1  archive Uh Uh^T equals the exact P8.
  N2  the archive's own Schur history field y* has y*(1-P8) = 0.
  N3  full-action covariance under the integer large gauge alpha_j = 2 pi j/24, y* -> D^2 y*.
  N4  the pi/24 shift: history block covariant with D, cochain block energies change.
  N5  the 2026-11-09 source-pullback frame H spans a different 8-plane from Uh.
Exit code is non-zero on any failure.  No fitted inputs; no random matrices.
"""
from fractions import Fraction as Fr
from itertools import combinations
import contextlib
import importlib.util
import io
import math
import runpy
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
FWD = ROOT / "research_archive/2026-11-10_urt_arf_forward/forward"


class Q5:
    """a + b*sqrt(5) with rational a, b."""
    __slots__ = ("a", "b")

    def __init__(self, a=0, b=0):
        self.a = Fr(a)
        self.b = Fr(b)

    def __add__(s, o):
        o = o if isinstance(o, Q5) else Q5(o)
        return Q5(s.a + o.a, s.b + o.b)
    __radd__ = __add__

    def __neg__(s):
        return Q5(-s.a, -s.b)

    def __sub__(s, o):
        return s + (-(o if isinstance(o, Q5) else Q5(o)))

    def __rsub__(s, o):
        return Q5(o) - s

    def __mul__(s, o):
        o = o if isinstance(o, Q5) else Q5(o)
        return Q5(s.a * o.a + 5 * s.b * o.b, s.a * o.b + s.b * o.a)
    __rmul__ = __mul__

    def inv(s):
        n = s.a * s.a - 5 * s.b * s.b
        assert n != 0
        return Q5(s.a / n, -s.b / n)

    def __truediv__(s, o):
        o = o if isinstance(o, Q5) else Q5(o)
        return s * o.inv()

    def sign(s):
        a, b = s.a, s.b
        if a == 0 and b == 0:
            return 0
        if a >= 0 and b >= 0:
            return 1
        if a <= 0 and b <= 0:
            return -1
        # opposite signs: compare a^2 with 5 b^2
        if a > 0:
            return 1 if a * a > 5 * b * b else -1
        return 1 if 5 * b * b > a * a else -1

    def __eq__(s, o):
        o = o if isinstance(o, Q5) else Q5(o)
        return s.a == o.a and s.b == o.b

    def __hash__(s):
        return hash((s.a, s.b))

    def f(s):
        return float(s.a) + float(s.b) * math.sqrt(5)

    def __repr__(s):
        return f"({s.a}) + ({s.b})*sqrt5"


ZERO, ONE = Q5(0), Q5(1)
PHI = Q5(Fr(1, 2), Fr(1, 2))


def lt(x, y):
    return (y - x).sign() > 0


# ---------------------------------------------------------------- E1 exact hidden carrier
def build_exact_carrier():
    # Vertex order exactly as verts['icosahedron'] in the 2026-11-07 module.
    V = []
    for a in (-1, 1):
        for b in (-1, 1):
            V.append((ZERO, Q5(a), b * PHI))
    for a in (-1, 1):
        for b in (-1, 1):
            V.append((Q5(a), b * PHI, ZERO))
    for a in (-1, 1):
        for b in (-1, 1):
            V.append((a * PHI, ZERO, Q5(b)))
    d2 = lambda p, q: sum(((x - y) * (x - y) for x, y in zip(p, q)), ZERO)
    adj = {(i, j) for i in range(12) for j in range(12) if i != j and d2(V[i], V[j]) == Q5(4)}
    assert len(adj) == 60  # 30 edges
    faces = sorted(t for t in combinations(range(12), 3)
                   if all((x, y) in adj for x, y in combinations(t, 2)))
    assert len(faces) == 20
    # antipodal pairs, chosen as in the archive (min remaining index first)
    pairs, rem = [], set(range(12))
    while rem:
        i = min(rem)
        j = next(k for k in rem - {i} if all((x + y) == ZERO for x, y in zip(V[i], V[k])))
        pairs.append((i, j))
        rem -= {i, j}
    Cf = [[Fr(1) if v in f else Fr(0) for v in range(12)] for f in faces]
    # Ph = 1 - C (C^T C)^{-1} C^T  (rational)
    CtC = [[sum(Cf[k][i] * Cf[k][j] for k in range(20)) for j in range(12)] for i in range(12)]
    inv = mat_inv(CtC)
    CinvCt = [[sum(Cf[a][i] * sum(inv[i][j] * Cf[b][j] for j in range(12)) for i in range(12))
               for b in range(20)] for a in range(20)]
    Ph = [[(Fr(1) if a == b else Fr(0)) - CinvCt[a][b] for b in range(20)] for a in range(20)]
    fadj = [[Fr(1) if a != b and len(set(faces[a]) & set(faces[b])) == 2 else Fr(0)
             for b in range(20)] for a in range(20)]
    Lf = [[(3 if a == b else 0) - fadj[a][b] for b in range(20)] for a in range(20)]
    I20 = [[Fr(int(a == b)) for b in range(20)] for a in range(20)]
    P3 = mm(Ph, [[(5 * I20[a][b] - Lf[a][b]) / 2 for b in range(20)] for a in range(20)])
    P5 = mm(Ph, [[(Lf[a][b] - 3 * I20[a][b]) / 2 for b in range(20)] for a in range(20)])
    for P in (P3, P5, Ph):
        assert mm(P, P) == P
    assert sum(P3[i][i] for i in range(20)) == 4 and sum(P5[i][i] for i in range(20)) == 4
    assert mm(P3, P5) == [[Fr(0)] * 20 for _ in range(20)]
    assert [[P3[a][b] + P5[a][b] for b in range(20)] for a in range(20)] == Ph
    M = [[Fr(0)] * 20 for _ in range(64)]
    for s in range(64):
        chosen = {pairs[i][(s >> i) & 1] for i in range(6)}
        for k, f in enumerate(faces):
            if set(f) <= chosen:
                M[s][k] = Fr(1)
    Mt = [list(r) for r in zip(*M)]
    # U_h = M Ph / sqrt2 is a partial isometry onto Ph:  Ph M^T M Ph / 2 = Ph
    assert mm(mm(Ph, mm(Mt, M)), Ph) == [[2 * x for x in r] for r in Ph]
    MPh = mm(M, Ph)
    P8 = [[x / 2 for x in r] for r in mm(MPh, Mt)]
    assert mm(P8, P8) == P8
    assert all(P8[i][j] == P8[j][i] for i in range(64) for j in range(64))
    assert sum(P8[i][i] for i in range(64)) == 8
    return dict(V=V, faces=faces, pairs=pairs, Ph=Ph, P3=P3, P5=P5, M=M, P8=P8)


def mm(A, B):
    Bt = list(zip(*B))
    return [[sum((a * b for a, b in zip(r, c)), Fr(0)) for c in Bt] for r in A]


def mat_inv(A):
    n = len(A)
    W = [list(map(Fr, r)) + [Fr(int(i == j)) for j in range(n)] for i, r in enumerate(A)]
    for c in range(n):
        p = next(r for r in range(c, n) if W[r][c] != 0)
        W[c], W[p] = W[p], W[c]
        pv = W[c][c]
        W[c] = [x / pv for x in W[c]]
        for r in range(n):
            if r != c and W[r][c] != 0:
                fct = W[r][c]
                W[r] = [x - fct * y for x, y in zip(W[r], W[c])]
    return [r[n:] for r in W]


# ---------------------------------------------------------------- E2 exact Haar overlap
def build_overlap():
    alpha = Q5(Fr(3, 2), Fr(-1, 2))  # phi^-2
    assert alpha * PHI * PHI == ONE
    C = [[ZERO] * 64 for _ in range(24)]
    for j in range(24):
        a = Q5(Fr(j, 24)) + alpha
        b = Q5(Fr(j + 1, 24)) + alpha
        for h in range(64):
            for k in range(3):
                c, d = Q5(Fr(h, 64) + k), Q5(Fr(h + 1, 64) + k)
                lo = a if lt(c, a) else c
                hi = b if lt(b, d) else d
                if lt(lo, hi):
                    C[j][h] = C[j][h] + (hi - lo)
    for j in range(24):
        assert sum(C[j], ZERO) == Q5(Fr(1, 24))
    for h in range(64):
        assert sum((C[j][h] for j in range(24)), ZERO) == Q5(Fr(1, 64))
    return C


def rank_q5(A):
    W = [list(r) for r in A]
    rows, cols, rk = len(W), len(W[0]), 0
    for c in range(cols):
        p = next((r for r in range(rk, rows) if not W[r][c] == ZERO), None)
        if p is None:
            continue
        W[rk], W[p] = W[p], W[rk]
        pinv = W[rk][c].inv()
        W[rk] = [x * pinv for x in W[rk]]
        for r in range(rows):
            if r != rk and not W[r][c] == ZERO:
                fct = W[r][c]
                W[r] = [x - fct * y for x, y in zip(W[r], W[rk])]
        rk += 1
    return rk


def exact_part():
    car = build_exact_carrier()
    P8 = car["P8"]
    print("E1 exact: P3,P5 rank-4 hidden projectors; U_h=M Ph/sqrt2 partial isometry;"
          " P8=M Ph M^T/2 rational projector of trace 8")
    C = build_overlap()
    rk = rank_q5(C)
    assert rk == 24
    print("E2 exact: Haar overlap C24 in Q(sqrt5), rows 1/24, columns 1/64, rank 24 over Q(sqrt5)")
    P8q = [[Q5(x) for x in r] for r in P8]
    nB = Q5(0)
    for r in C:
        for x in r:
            nB = nB + x * x
    n8 = Q5(0)
    for r in C:
        w = [sum((P8q[a][b] * r[b] for b in range(64) if P8[a][b] != 0), ZERO) for a in range(64)]
        n8 = n8 + sum((r[a] * w[a] for a in range(64)), ZERO)
    nB, n8 = 1536 * nB, 1536 * n8
    nperp = nB - n8
    assert n8.sign() > 0 and nperp.sign() > 0 and lt(n8, nperp)
    frac = (nperp / nB)
    print("E3 exact: ||B||_F^2       =", nB, "=", nB.f())
    print("          ||B P8||_F^2    =", n8, "=", n8.f())
    print("          ||B(1-P8)||_F^2 =", nperp, "=", nperp.f())
    print("          fraction of ||B||^2 outside the hidden history carrier =", frac.f())
    # E4: theta = 2 pi phi^-2; x = 24 theta/(2 pi) = 24 phi^-2.
    x = 24 * Q5(Fr(3, 2), Fr(-1, 2))
    assert x == Q5(36, -12) and x.b != 0          # irrational: theta/pi not in Q
    # '+' branch: theta+pi/24-2pi m/24 = theta-2pi m'/24 (mod 2pi) needs 1/2 in Z: impossible.
    # '-' branch needs 2x + 1/2 in Z, impossible since (2x+1/2) has sqrt5-part -24 != 0.
    assert (2 * x + Q5(Fr(1, 2))).b != 0
    d0 = x - 9                                      # distance of x to nearest integer
    d1 = Q5(10) - (x + Q5(Fr(1, 2)))                # shifted distance
    for d in (d0, d1):
        assert lt(ZERO, d) and lt(d, Q5(Fr(1, 2)))
    assert lt(d0, d1)
    # check they are the nearest-integer distances
    assert lt(d0, 1 - d0) and lt(d1, 1 - d1)
    print("E4 exact: 24 theta/2pi = 36-12 sqrt5 (irrational). Charge-1 clock spectra at theta and"
          " theta+pi/24 differ as multisets; nearest-mode offsets",
          d0, "=", round(d0.f(), 12), "vs", d1, "=", round(d1.f(), 12))
    return car, C, dict(nB=nB, n8=n8, nperp=nperp)


# ---------------------------------------------------------------- archive part (CI)
def archive_part(car, C24, norms):
    import numpy as np
    with contextlib.redirect_stdout(io.StringIO()):
        m = runpy.run_path(str(FWD / "cathedral_constructed_joint_dynamics_2026_11_07.py"))
    Uh, P3, P5, Delta = m["Uh"], m["P3"], m["P5"], m["Delta"]
    theta, r, N = m["theta"], m["r"], m["N"]
    assert N == 24
    P8 = np.array([[float(x) for x in row] for row in car["P8"]])
    assert np.max(abs(Uh @ Uh.T - P8)) < 1e-12
    assert list(map(tuple, m["geom"]["icosahedron"]["faces"])) and \
        sorted(tuple(sorted(f)) for f in m["geom"]["icosahedron"]["faces"]) == car["faces"]
    assert [tuple(p) for p in m["pairs"]] == car["pairs"]
    print("N1 archive: Uh Uh^T == exact P8 (max dev < 1e-12); faces and antipodal pairs agree")

    # deterministic configuration: one charge-1 Bloch mode m1=9 of the all-five collective
    # vertex vector Eglobal @ 1_8 (no random numbers).
    geom, names = m["geom"], m["names"]
    v50 = m["Eglobal"] @ np.ones(8) / np.sqrt(8)
    z = np.zeros((N, 190), complex)
    jj = np.arange(N)
    for name in names:
        g = geom[name]
        z[:, g["offset"]:g["offset"] + g["V"]] = (0.05 * np.exp(2j * np.pi * 9 * jj / N)[:, None]
                                                  * v50[g["v_offset"]:g["v_offset"] + g["V"]])
    thetas = np.full(N, theta)
    Veff, y, Vs, h3, h5 = m["reduced_action"](z, thetas)
    assert np.linalg.norm(y) > 1e-6
    assert np.linalg.norm(y @ (np.eye(64) - P8)) < 1e-12 * np.linalg.norm(y)
    print("N2 archive: Schur history field y* (norm %.6g) satisfies ||y*(1-P8)|| < 1e-12 ||y*||"
          % np.linalg.norm(y))

    # integer large gauge: alpha_j = 2 pi j / 24  (single valued for charge 1)
    alpha = 2 * np.pi * jj / N
    th1 = thetas + np.roll(alpha, -1) - alpha
    assert np.max(abs(np.exp(1j * th1) - np.exp(1j * (theta + 2 * np.pi / N)))) < 1e-12
    S0 = m["full_action"](z, y, thetas)
    zg, yg = z * np.exp(1j * alpha)[:, None], y * np.exp(2j * alpha)[:, None]
    assert abs(m["full_action"](zg, yg, th1) - S0) < 1e-9 * max(1, abs(S0))
    _, y1, _, _, _ = m["reduced_action"](zg, th1)
    D = np.exp(1j * np.pi * jj / 12)              # GPT's D_jj = exp(i pi j/12)
    assert np.linalg.norm(y1 - (D ** 2)[:, None] * y) < 1e-12 * np.linalg.norm(y)
    print("N3 archive: theta->theta+2pi/24 with z->e^{i alpha}z is an exact symmetry of the full"
          " action; y* -> D^2 y*")

    # half shift pi/24: history block alone covariant with D
    th_half = thetas + np.pi / N
    eh = m["direct_history_energy"]
    e0 = eh(y, h3, h5, thetas)
    e1 = eh(D[:, None] * y, D[:, None] * h3, D[:, None] * h5, th_half)
    assert abs(e1 - e0) < 1e-10 * max(1, abs(e0))
    # cochain block: Bloch product states e^{2 pi i m j/24} kappa are exact eigenstates of the
    # charge-1 quadratic form; build kappa = lowest eigenvector of the site operator K.
    K = np.zeros((190, 190))
    for name in names:
        g = geom[name]
        o, nv, ne, nf = g["offset"], g["V"], g["E"], g["F"]
        K[o:o + nv, o:o + nv] += g["b1"] @ g["b1"].T
        K[o + nv:o + nv + ne, o + nv:o + nv + ne] += g["b2"] @ g["b2"].T
        K[o + nv + ne:o + nv + ne + nf, o + nv + ne:o + nv + ne + nf] += g["b2"].T @ g["b2"]
    K += m["Cbridge"]
    w, U = np.linalg.eigh(K)
    kap = U[:, 0]
    spec = {}
    for lab, th in (("theta", thetas), ("theta+pi/24", th_half)):
        vals = []
        for mm_ in range(N):
            zz = np.exp(2j * np.pi * mm_ * jj / N)[:, None] * kap[None, :]
            ell = 2 - 2 * np.cos(th[0] - 2 * np.pi * mm_ / N)
            pred = 0.5 * N * (w[0] + r * r * ell)
            got = m["geom_energy"](zz, th)
            assert abs(got - pred) < 1e-9 * max(1, pred)
            vals.append(ell)
        spec[lab] = sorted(vals)
    d0 = 27 - 12 * math.sqrt(5)
    d1 = 12 * math.sqrt(5) - 26.5
    assert abs(spec["theta"][0] - (2 - 2 * math.cos(2 * math.pi * d0 / N))) < 1e-12
    assert abs(spec["theta+pi/24"][0] - (2 - 2 * math.cos(2 * math.pi * d1 / N))) < 1e-12
    gap = min(abs(a - b) for a in spec["theta"] for b in spec["theta+pi/24"])
    assert gap > 1e-4
    lo0 = 0.5 * (w[0] + r * r * spec["theta"][0])
    lo1 = 0.5 * (w[0] + r * r * spec["theta+pi/24"][0])
    print("N4 archive: pi/24 shift: history block invariant with D (|dE| < 1e-10); cochain block"
          " not: lowest per-site charge-1 energy %.12f -> %.12f; no charge-1 clock eigenvalue"
          " survives (min separation %.3g)" % (lo0, lo1, gap))

    # N5: the 2026-11-09 source-pullback hidden frame H
    with contextlib.redirect_stdout(io.StringIO()):
        src = runpy.run_path(str(FWD / "URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py"))
    R3, R5 = src["R3"], src["R5"]
    H = (R3 / np.sqrt(src["coef3"]) + R5 / np.sqrt(src["coef5"])) / 8
    assert np.linalg.norm(H.T @ H - (P3 + P5)) < 1e-12
    PH = H @ H.T
    ov = float(np.trace(PH @ P8))
    assert 0.5 < ov < 7.5
    print("N5 archive: pullback frame H vs history embedding Uh: tr(P_H P8) = %.12f (8 = equal"
          " planes); ||P_H - P8||_F = %.12f" % (ov, np.linalg.norm(PH - P8)))
    # B composed with the native carrier versus the conditional readout A0 = B H
    B = np.sqrt(1536) * np.array([[x.f() for x in row] for row in C24])
    assert abs(np.sum(B * B) - norms["nB"].f()) < 1e-9
    assert abs(np.sum((B @ P8) ** 2) - norms["n8"].f()) < 1e-9
    print("N5 archive: float B reproduces the exact E3 norms (|dev| < 1e-9)")


def main():
    car, C24, norms = exact_part()
    if importlib.util.find_spec("mpmath") is None:
        print("ARCHIVE PART SKIPPED: mpmath absent, the 2026-11-07 module cannot be imported here;"
              " N1-N5 run on CI only")
    else:
        archive_part(car, C24, norms)
    print("THEOREM/OBSTRUCTION (Q49): native Schur history field y*=(G3 h3+Delta G5 h5)Uh^T is"
          " charge-2 covariant but lives on the 8-dim hidden history carrier; no gauge or frame"
          " transport D B of the Haar dictionary equals any y*; ||DB-y*||_F^2 >= ||B(1-P8)||_F^2.")
    print("STATUS: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING; no gate closed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
