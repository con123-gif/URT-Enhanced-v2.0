"""Q91 (ACTIVE PROBLEM A, attempt A3 coefficient): does a quadratic form of the selected Q72 uniform-marginal
bridge B_{D0}, or any weighting of a variance-loss sequence, reproduce H + c Abar on the quartet isotypic V for a
single c?

Everything is exact: integers, Fractions, and the field K = Q(sqrt2, sqrt3) (basis 1, sqrt2, sqrt3, sqrt6; an
element is zero iff its four rational coordinates are zero).  No floats, nothing fitted, nothing random.

Objects (original): S_D (Q3 A5 twirl of Q2 in history coordinates, cathedral_engine.histories), the selected orbit 1
(Q64/Q65/Q72), the Q72 bridge (block-wise [[t,1-t],[1-t,t]] on rows {x, x+32} x columns {2x, 2x+1} with
t^2/(1-t)^2 = ad/bc), Reynolds = the A5 average over the 60 code rotations after pulling back through D, H_bits,
Abar_1 = Reynolds[(I-Q)^T(I-Q)], and the Q82 quartet projectors E_2, E_3, E_4 (V = E_2 + E_3 + E_4, quartet
multiplicities 1, 2, 1).

Part 1 (exact): on D0 the 32 bridge parameters are t in {(sqrt3-1)/2, (3sqrt2-2)/7, 1/4, 2/5}, all in (0, 1/2),
    each the unique positive root of t^2 bc = (1-t)^2 ad; B is doubly stochastic on the URT graph.
Part 2 (exact, D0): for F in {d_0^B, d_1^B, d_2^B, d_3^B, Abar^B}, d_n^B = Reynolds[(B^n)^T B^n - (B^{n+1})^T B^{n+1}]:
    (a) E_3 F E_2 = E_3 F E_4 = 0, but E_2 F E_4 != 0: every bridge form couples the Walsh-2 and Walsh-4 quartets,
        while every element of span{P_V, H, Abar_1} is Walsh-block-diagonal on V.  So no bridge form is in the
        K_c family on V.
    (b) even after pinching to the Walsh blocks, the Walsh-3 residual R_F != 0: the pinched form is not in the span
        either.  60 d_1^B != H on V (the Part-1 identity of Q86 does not transfer to the bridge).
    (c) the parity history w63 loses norm at every step under B (d_n^B(w63) > 0, n = 0..3), unlike Q (all in step 0).
Part 3 (THEOREM, exact rational, all 8 orbit-1 classes): for Q, the Walsh-3 traceless part T_n of every loss form
    d_n = G_n - G_{n+1} (n = 0..5) is Frobenius-orthogonal to the Walsh-3 traceless part T_A != 0 of Abar_1.
    Hence any real combination sum_n lambda_n d_n that lies in span{P_V, H, Abar_1} on V has Abar_1-coefficient 0:
    no weighting of the variance-loss sequence gives c != 0.  Since Abar_1 = I + G_1 - O with O = Reynolds[Q + Q^T],
    the whole c-direction on V is carried by the one-step overlap form O.
"""
from __future__ import annotations

import math
import runpy
import sys
from contextlib import redirect_stdout
from fractions import Fraction as Fr
from io import StringIO
from pathlib import Path

import numpy as np

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from cathedral_engine import histories as Hs              # noqa: E402
from cathedral_engine.certify import Certificate           # noqa: E402

N = 64
D0 = (0, 2, 4, 6, 10, 9)
PERMS = [np.array(p) for p in Hs.a5_on_codes()]

# ----------------------------------------------------------------------------- the field K = Q(sqrt2, sqrt3)
# product table on the basis (1, r2, r3, r6): (i, j) -> (k, integer factor)
MUL = {}
for i in range(4):
    MUL[(0, i)] = MUL[(i, 0)] = (i, 1)
MUL[(1, 1)] = (0, 2); MUL[(2, 2)] = (0, 3); MUL[(3, 3)] = (0, 6)
MUL[(1, 2)] = MUL[(2, 1)] = (3, 1); MUL[(1, 3)] = MUL[(3, 1)] = (2, 2); MUL[(2, 3)] = MUL[(3, 2)] = (1, 3)


def kmul(a, b):
    out = [Fr(0)] * 4
    for i in range(4):
        if a[i]:
            for j in range(4):
                if b[j]:
                    k, f = MUL[(i, j)]
                    out[k] += f * a[i] * b[j]
    return tuple(out)


def ksub(a, b):
    return tuple(x - y for x, y in zip(a, b))


def kzero(a):
    return all(x == 0 for x in a)


ONE = (Fr(1), Fr(0), Fr(0), Fr(0))


class KM:
    """Matrix over K: (1/den) * sum_i C[i] * basis_i, C[i] integer object arrays."""

    def __init__(self, C, den):
        self.C, self.den = [np.asarray(c, dtype=object) for c in C], int(den)

    @staticmethod
    def rational(M, den=1):
        M = np.asarray(M, dtype=object)
        z = np.zeros(M.shape, dtype=object)
        return KM([M, z, z.copy(), z.copy()], den)

    def __matmul__(self, other):
        out = [np.zeros((self.C[0].shape[0], other.C[0].shape[1]), dtype=object) for _ in range(4)]
        for i in range(4):
            if not self.C[i].any():
                continue
            for j in range(4):
                if not other.C[j].any():
                    continue
                k, f = MUL[(i, j)]
                out[k] = out[k] + f * (self.C[i] @ other.C[j])
        return KM(out, self.den * other.den)

    def T(self):
        return KM([c.T for c in self.C], self.den)

    def scale(self, den):                                          # same matrix, written over denominator den
        assert den % self.den == 0
        return KM([c * (den // self.den) for c in self.C], den)

    def __sub__(self, other):
        d = self.den * other.den
        return KM([a * other.den - b * self.den for a, b in zip(self.C, other.C)], d)

    def __add__(self, other):
        d = self.den * other.den
        return KM([a * other.den + b * self.den for a, b in zip(self.C, other.C)], d)

    def kscale(self, a):                                           # multiply by a in K (Fraction coordinates)
        den = 1
        for x in a:
            den = den * x.denominator // math.gcd(den, x.denominator)
        ai = [int(x * den) for x in a]
        out = [np.zeros(self.C[0].shape, dtype=object) for _ in range(4)]
        for i in range(4):
            for j in range(4):
                if ai[i] and self.C[j].any():
                    k, f = MUL[(i, j)]
                    out[k] = out[k] + f * ai[i] * self.C[j]
        return KM(out, self.den * den)

    def iszero(self):
        return all(not c.any() for c in self.C)

    def trace(self):
        return tuple(Fr(int(np.trace(c)), self.den) for c in self.C)

    def entry(self, a, b):
        return tuple(Fr(int(c[a, b]), self.den) for c in self.C)


def code(X: KM, D) -> KM:
    idx = np.array(Hs.dictionary_index(D))
    out = []
    for c in X.C:
        Y = np.zeros((N, N), dtype=object); Y[np.ix_(idx, idx)] = c; out.append(Y)
    return KM(out, X.den)


def reynolds(X: KM, D) -> KM:
    """60 * Reynolds (the sum over the 60 code rotations), so the true Reynolds is this over 60."""
    Y = code(X, D)
    return KM([sum(c[np.ix_(p, p)] for p in PERMS) for c in Y.C], Y.den)


with redirect_stdout(StringIO()):
    Z = runpy.run_path(str(ROOT / "research_archive/2026-11-13_q82_oriented_source_weights/"
                           "Q82_ORIENTED_SOURCE_WEIGHTS_CERTIFICATE.py"))
Ek = {k: KM.rational(Z["Ek"][k], 960) for k in (2, 3, 4)}           # E_k = Ek[k]/960, exact rational projectors
I64 = np.eye(N, dtype=np.int64)
Q2 = Hs.Q2()
HB = Hs.hbits()

with Certificate("Q91_bridge_loss_sequence", __file__) as cert:
    ck = cert.check
    for k in (2, 3, 4):
        P = Ek[k]
        ck(((P @ P).scale(960 * 960) - P.scale(960 * 960)).iszero(), f"E_{k} idempotent")
    ck((Ek[2] @ Ek[4]).iszero() and (Ek[2] @ Ek[3]).iszero() and (Ek[3] @ Ek[4]).iszero(), "E_k mutually orthogonal")
    ck([Ek[k].trace()[0] for k in (2, 3, 4)] == [4, 8, 4], "quartet ranks 4, 8, 4 (multiplicities 1, 2, 1)")

    # -------------------------------------------------------------------- Part 1: the bridge on D0, exactly
    S = Hs.twirled_chronology(D0)
    T_OF = {Fr(1, 3): (Fr(-1, 2), Fr(0), Fr(1, 2), Fr(0)),            # s = 1/sqrt3 -> t = (sqrt3 - 1)/2
            Fr(2, 9): (Fr(-2, 7), Fr(3, 7), Fr(0), Fr(0)),            # s = sqrt2/3 -> t = (3 sqrt2 - 2)/7
            Fr(1, 9): (Fr(1, 4), Fr(0), Fr(0), Fr(0)),                # s = 1/3     -> t = 1/4
            Fr(4, 9): (Fr(2, 5), Fr(0), Fr(0), Fr(0))}                # s = 2/3     -> t = 2/5
    tx, census = [], {}
    for x in range(32):
        a, b = int(S[x, 2 * x % N]), int(S[x, 2 * x % N | 1])
        c, d = int(S[x + 32, 2 * x % N]), int(S[x + 32, 2 * x % N | 1])
        ck(min(a, b, c, d) > 0, "positive URT block")
        rho = Fr(a * d, b * c)
        ck(rho in T_OF, f"block cross ratio {rho} in the four-value list")
        t = T_OF[rho]; u = ksub(ONE, t)
        ck(kzero(ksub(kmul(kmul(t, t), (Fr(b * c),) + (Fr(0),) * 3), kmul(kmul(u, u), (Fr(a * d),) + (Fr(0),) * 3))),
           "t^2 bc = (1-t)^2 ad exactly")
        tx.append(t); census[rho] = census.get(rho, 0) + 1
    # 0 < t < 1/2: (sqrt3-1)/2 < 1/2 iff 3 < 4;  (3sqrt2-2)/7 < 1/2 iff 72 < 121;  both > 0 since 3 > 1, 18 > 4
    ck(3 < 4 and 3 > 1 and 72 < 121 and 18 > 4, "0 < t < 1/2 for both irrational values (squared comparisons)")
    ck(Fr(0) < Fr(1, 4) < Fr(1, 2) and Fr(0) < Fr(2, 5) < Fr(1, 2), "0 < 1/4, 2/5 < 1/2")
    # for t > 0 the root of t^2 bc = (1-t)^2 ad with t/(1-t) > 0 is unique, so these are the Q72 bridge values
    DEN = 140
    C = [np.zeros((N, N), dtype=object) for _ in range(4)]
    for x in range(32):
        t = tx[x]; u = ksub(ONE, t)
        for e in (0, 1):
            h = x + 32 * e
            for j in (0, 1):
                v = t if j == e else u
                for i in range(4):
                    C[i][h, (2 * x + j) % N] += int(v[i] * DEN)
                    ck(v[i] * DEN == int(v[i] * DEN), "denominator 140")
    B = KM(C, DEN)
    ones = KM.rational(np.ones((N, 1), dtype=np.int64))
    ck(((B @ ones) - ones).iszero() and ((B.T() @ ones) - ones).iszero(), "B doubly stochastic (uniform marginals)")
    supp = {(h, (2 * h + j) % N) for h in range(N) for j in (0, 1)}
    ck(all((h, k) in supp for h in range(N) for k in range(N) if any(c[h, k] for c in B.C)), "B on the URT graph")
    cert.record("1 bridge", {"(sqrt3-1)/2": census[Fr(1, 3)], "(3sqrt2-2)/7": census[Fr(2, 9)],
                             "1/4": census[Fr(1, 9)], "2/5": census[Fr(4, 9)]})

    # -------------------------------------------------------------------- Part 2: bridge forms on V
    Id = KM.rational(I64)
    Bp = {0: Id}
    for n in range(1, 5):
        Bp[n] = Bp[n - 1] @ B
    Gram = {n: Bp[n].T() @ Bp[n] for n in range(5)}
    forms = {f"d_{n}^B": Gram[n] - Gram[n + 1] for n in range(4)}
    IB = Id - B
    forms["Abar^B"] = IB.T() @ IB
    forms = {k: reynolds(v, D0) for k, v in forms.items()}              # all 60 x Reynolds
    A1 = reynolds(KM.rational((2 * I64 - Q2).T @ (2 * I64 - Q2)), D0)  # 240 Abar_1
    Hk = KM.rational(HB)

    def quart(F):
        """exact pinched quartet data: f2, f4 (scalars on the Walsh-2/4 quartets) and the Walsh-3 block."""
        f2 = tuple(x / 4 for x in (Ek[2] @ F).trace()); f4 = tuple(x / 4 for x in (Ek[4] @ F).trace())
        return f2, f4, Ek[3] @ F @ Ek[3]

    a2, a4, M3A = quart(A1)
    a2 = tuple(x / 240 for x in a2); a4 = tuple(x / 240 for x in a4)
    ck(a2 == (Fr(4, 3), 0, 0, 0) and a4 == (Fr(3, 2), 0, 0, 0), "Abar_1 quartet scalars 4/3, 3/2 (Q82)")
    trA = tuple(x / 240 for x in M3A.trace())
    ck(trA == (12, 0, 0, 0), "Abar_1 Walsh-3 trace = 4 * 27/20 + 4 * 33/20 = 12 (Q82)")
    ck((Ek[2] @ A1 @ Ek[4]).iszero(), "Abar_1 does not couple Walsh 2 and Walsh 4 (Walsh-diagonal)")
    ck((Ek[2] @ Hk @ Ek[4]).iszero(), "H does not couple Walsh 2 and Walsh 4")

    def pinched_residual(F, sc):
        """R_F = E3 F E3 - g E3 A1 E3 - s E3 with g = (f2 - f4)/(a2 - a4), s from the trace; F = sc * form."""
        f2, f4, M3 = quart(F)
        f2 = tuple(x / sc for x in f2); f4 = tuple(x / sc for x in f4)
        g = tuple(x / (a2[0] - a4[0]) for x in ksub(f2, f4))                      # a2 - a4 = -1/6, rational
        M3F = KM([c for c in M3.C], M3.den * sc)
        M3a = KM([c for c in M3A.C], M3A.den * 240)
        tr = ksub(M3F.trace(), kmul(g, M3a.trace()))
        s = tuple(x / 8 for x in tr)
        R = M3F - M3a.kscale(g) - Ek[3].kscale(s)
        return R, f2, f4, g

    out = {}
    for name, F in forms.items():
        c32 = Ek[3] @ F @ Ek[2]; c34 = Ek[3] @ F @ Ek[4]; c24 = Ek[2] @ F @ Ek[4]
        ck(c32.iszero() and c34.iszero(), f"{name}: no Walsh-3 <-> Walsh-2/4 coupling (C-parity)")
        fro = (c24 @ c24.T()).trace()
        ck(not kzero(fro), f"{name}: E_2 F E_4 != 0 exactly (Walsh-2/4 quartet coupling)")
        R, f2, f4, g = pinched_residual(F, 60)
        ck(not R.iszero(), f"{name}: pinched Walsh-3 residual R_F != 0, so not in span{{P_V, H, Abar_1}} even pinched")
        out[name] = {"f2": f2, "f4": f4, "|E2 F E4|^2 (x60^2)": fro}
    # 60 d_1^B vs H: on V, H is 16 on Walsh 2 and 4
    f2 = out["d_1^B"]["f2"]
    ck(not kzero(ksub(tuple(60 * x for x in f2), (Fr(16), 0, 0, 0))), "60 d_1^B != H on the Walsh-2 quartet")
    for name in ("d_1^B", "Abar^B"):
        cert.record(f"2 {name}", {k: tuple(str(x) for x in v) for k, v in out[name].items()})
    # control: the same test accepts the Q forms that are in the span
    Gq1 = reynolds(KM.rational(Q2.T @ Q2), D0); Gq2 = reynolds(KM.rational((Q2 @ Q2).T @ (Q2 @ Q2)), D0)
    dq1 = KM([4 * a - b for a, b in zip(Gq1.C, Gq2.C)], 1)              # 960 (G_1 - G_2) = 960 d_1
    Rq, _, _, gq = pinched_residual(dq1, 960)
    ck(Rq.iszero() and kzero(gq), "control: Q's d_1 = H/60 passes the test with Abar-coefficient 0")
    RA, _, _, gA = pinched_residual(A1, 240)
    ck(RA.iszero() and gA == ONE, "control: Abar_1 itself passes with coefficient 1")
    # (c) parity history under the bridge
    w63 = KM.rational(np.array([[(-1) ** bin(h).count("1")] for h in range(N)], dtype=np.int64))
    nw = {}
    for n in range(5):
        v = Bp[n] @ w63
        nw[n] = tuple(x / 64 for x in (v.T() @ v).trace())
    for n in range(4):
        ck(not kzero(ksub(nw[n], nw[n + 1])), f"w63 loses norm at bridge step {n} (d_{n}^B(w63) > 0 by contraction)")
    cert.record("2c w63", {"||B w63||^2/64": tuple(str(x) for x in nw[1]),
                           "note": "Q: 0 after one step; bridge: positive loss at every step n = 0..3"})

    # -------------------------------------------------------------------- Part 3: the Q loss sequence never carries c
    Q2pow = {0: I64}
    for n in range(1, 7):
        Q2pow[n] = Q2pow[n - 1] @ Q2
    E3 = Z["Ek"][3]                                                       # 960 E_3, integer
    orbit1 = Hs.selected_orbit()["classes"]
    ck(D0 in orbit1 and len(orbit1) == 8, "orbit 1 = 8 classes")

    def twirl_int(X, D):
        idx = np.array(Hs.dictionary_index(D)); Y = np.zeros((N, N), dtype=np.int64); Y[np.ix_(idx, idx)] = X
        return sum(Y[np.ix_(p, p)] for p in PERMS)

    def tl3(F, sc):
        """traceless Walsh-3 part of F/sc, as an exact Fraction matrix (object array)."""
        M = np.array(E3 @ F @ E3, dtype=object)
        trv = Fr(int(np.trace(M)), 960 * 960 * sc)
        return np.array([[Fr(int(M[a, b]), 960 * 960 * sc) for b in range(N)] for a in range(N)], dtype=object) \
            - trv / 8 * np.array(E3, dtype=object) / 960

    def frob(X, Y):
        return sum(X[a, b] * Y[a, b] for a in range(N) for b in range(N))

    rows = {}
    for D in orbit1:
        Gn = {n: twirl_int(Q2pow[n].T @ Q2pow[n], D) for n in range(7)}    # 60 * 4^n G_n
        A1D = twirl_int((2 * I64 - Q2).T @ (2 * I64 - Q2), D)
        TA = tl3(A1D, 240)
        nTA = frob(TA, TA)
        ck(nTA > 0, f"T_A != 0 on {D}")
        for n in range(6):
            dn = 4 * Gn[n] - Gn[n + 1]                                     # 60 * 4^(n+1) d_n
            Tn = tl3(dn, 60 * 4 ** (n + 1))
            ip = frob(Tn, TA)
            ck(ip == 0, f"<T_{n}, T_A> = 0 on {D}")
            rows[(D, n)] = frob(Tn, Tn)
        Oform = twirl_int(Q2 + Q2.T, D)                                    # 120 O
        # 240 Abar_1 = 240 I + 240 G_1 - 240 O, with Gn[1] = 240 G_1 and Oform = 120 O
        ck((A1D == 240 * I64 + Gn[1] - 2 * Oform).all(), f"Abar_1 = I + G_1 - Reynolds[Q + Q^T] on {D}")
    ck(all(rows[(D, n)] == 0 for D in orbit1 for n in (0, 1, 4, 5)), "T_n = 0 for n = 0, 1, 4, 5")
    ck(all(rows[(D, n)] > 0 for D in orbit1 for n in (2, 3)), "T_2, T_3 != 0 but orthogonal to T_A")
    cert.record("3 theorem", "on all 8 orbit-1 classes the Walsh-3 traceless part of every Q loss form d_n (n=0..5) is "
                "orthogonal to that of Abar_1; any combination sum lambda_n d_n inside span{P_V, H, Abar_1} on V has "
                "Abar-coefficient 0, i.e. c = 0; the c-direction is carried by O = Reynolds[Q + Q^T]")
    cert.record("verdict", "no bridge form (d_0..3^B, Abar^B) lies in the K_c family on V (Walsh-2/4 coupling and a "
                "pinched Walsh-3 residual, both exactly nonzero); no weighting of Q's variance-loss sequence gives c != 0")
