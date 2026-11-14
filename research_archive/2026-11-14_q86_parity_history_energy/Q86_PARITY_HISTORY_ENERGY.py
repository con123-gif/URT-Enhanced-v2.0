"""Q86 (ACTIVE PROBLEM A, attempt A3 coefficient): does an original operator give the six-bit parity history w63
an energy relative to H_bits, and so fix c in K_c = H + c Abar?

Exact integer arithmetic throughout (numpy int64 / Python ints), except Part 2c, which executes the ORIGINAL
2026-11-07 ``direct_history_energy`` unmodified in float64 as a cross-check of the exact Part 2a/2b argument.

Conventions (cathedral_engine.histories): Q2[h,2h]=Q2[h,2h+1]=1, Q = Q2/2; ``code`` pulls a history-frame kernel
to axis codes through a signed dictionary D; the twirl sums over the 60 code rotations (Q3/Q64); X_i flips code
bit i; N = sum_i X_i; w0 = constant, w63(h) = (-1)^popcount(h).

Part 1 (THEOREM, all 768 classes): H_bits = 60 * Reynolds_A5[ Q^T (I - Q^T Q) Q ]  and  N = 12 Reynolds_A5[Q^T Q] - 6.
    In integers: 4 T1 - T2 = 16 H_bits and T1 = 20 (N + 6 I), T_n = sum_g code((Q2^n)^T Q2^n).
    So the two-flip energy is the A5-averaged second-step variance loss of the URT chain, ||Qf||^2 - ||Q^2 f||^2,
    and the first-step loss ||f||^2 - ||Qf||^2 averages to (6 - N)/12.  On orbit 1 the n-step Gram twirls G_n are
    Walsh-diagonal; the loss sequence d_n = G_n - G_{n+1} gives w63 the value 1 at n = 0 and 0 for n >= 1; H/60 = d_1.
Part 2 (OBSTRUCTION): tau = reflection exchanging w0/8 and w63/8 commutes with H_bits, fixes im U_h pointwise
    (P8 tau = P8) and acts on the history index only, so the original 7 Nov action is exactly tau-invariant:
    it gives w63 the energy of the constant (zero) and no source coupling.  Abar breaks tau (Abar w0 = 0,
    Abar w63 = w63), so the c-term is not in the original action.  2c executes the original function.
Part 3 (OBSTRUCTION): Q^n w63 = 0 = (Q^n)^T w63 for n = 1..6, the dictionary and the 60 code rotations send w63 to
    +-w63, hence every twirled n-step Dirichlet form Abar^(n)_D = Reynolds[(I-Q^n)^T (I-Q^n)] has w63 energy exactly 1,
    for all 768 classes (n = 1) and on orbit 1 for n = 1..6.  w63's chronology energy is the chronology's unit.
Part 4 (OBSTRUCTION, candidate (b)): on orbit 1, for n = 2, 3, 4 the n-step form restricted to the quartet isotypic V
    is not in span{P_V, H P_V, Abar_1 P_V}; for n = 5, 6 it is P_V.  So matching a multi-step generator to H on the
    hidden quartets fixes no c.
(Part 5, the 24-clock, is a one-line proof in the .md: the mass-a clock determinant 2r^48[T24(1+a/2r^2) - cos 2Theta]
    is strictly increasing in a >= 0, so the clock has no stationary mass; it inherits the history mass.)
"""
from __future__ import annotations

import sys
from fractions import Fraction as Fr
from pathlib import Path

import numpy as np

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from cathedral_engine import histories as Hs                          # noqa: E402
from cathedral_engine.certify import Certificate                       # noqa: E402
from cathedral_engine.geometry import icosahedron                      # noqa: E402
from cathedral_engine.provenance import load_definitions, original_path  # noqa: E402

N = 64
D0 = (0, 2, 4, 6, 10, 9)
PERMS = [np.array(p) for p in Hs.a5_on_codes()]
I64 = np.eye(N, dtype=np.int64)
Q2 = Hs.Q2()
HB = Hs.hbits()
WT = [bin(m).count("1") for m in range(N)]
WAL = np.array([[Hs.walsh(m, y) for m in range(N)] for y in range(N)], dtype=np.int64)   # columns = characters
w0 = WAL[:, 0].copy(); w63 = WAL[:, 63].copy()
NOP = np.zeros((N, N), dtype=np.int64)
for s in range(N):
    for i in range(6):
        NOP[s, s ^ (1 << i)] += 1


def code(X, D):
    idx = np.array(Hs.dictionary_index(D))
    Y = np.zeros((N, N), dtype=np.int64)
    Y[np.ix_(idx, idx)] = X
    return Y


def twirl(A):
    return sum(A[np.ix_(p, p)] for p in PERMS)


def walsh_block_values(A):
    """A Walsh-diagonal? return {mask: diagonal value * 64} (exact)."""
    B = WAL.T @ A @ WAL
    off = B - np.diag(np.diag(B))
    return (not off.any()), np.diag(B)


Q2pow = {0: I64}
for n in range(1, 7):
    Q2pow[n] = Q2pow[n - 1] @ Q2                                          # = 2^n Q^n
GRAM = {n: Q2pow[n].T @ Q2pow[n] for n in range(1, 7)}                    # = 4^n (Q^n)^T Q^n


with Certificate("Q86_parity_history_energy", __file__) as cert:
    ck = cert.check

    # ------------------------------------------------------------------ Part 1: H_bits is a native chronology form
    X0 = np.zeros((N, N), dtype=np.int64); X5 = np.zeros((N, N), dtype=np.int64)
    for h in range(N):
        X0[h, h ^ 1] = 1; X5[h, h ^ 32] = 1
    ck((GRAM[1] == 2 * (I64 + X0)).all(), "Q^T Q = (I + X_0)/2 (history frame; Q59 H1)")
    ck((Q2 @ Q2.T == 2 * (I64 + X5)).all(), "Q Q^T = (I + X_5)/2 (Q59 H1)")
    X1 = np.zeros((N, N), dtype=np.int64)
    for h in range(N):
        X1[h, h ^ 2] = 1
    ck((GRAM[2] == 4 * (I64 + X0) @ (I64 + X1)).all(), "(Q^2)^T Q^2 = (I + X_0)(I + X_1)/4")
    classes = Hs.a5_classes()
    ck(len(classes) == 768, "768 proper-A5 classes")
    bad1 = bad2 = 0
    for D in classes:
        T1 = twirl(code(GRAM[1], D)); T2 = twirl(code(GRAM[2], D))
        bad1 += not (4 * T1 - T2 == 16 * HB).all()
        bad2 += not (T1 == 20 * (NOP + 6 * I64)).all()
    ck(bad1 == 0, "16 H_bits = 4 T1 - T2 on all 768 classes, i.e. H_bits = 60 Reynolds[Q^T Q - (Q^2)^T Q^2]")
    ck(bad2 == 0, "T1 = 20 (N + 6I) on all 768 classes, i.e. Reynolds[Q^T Q] = (I + N/6)/2")
    cert.record("1 identity", "H_bits = 60 * Reynolds_A5[Q^T (I - Q^T Q) Q] = 60 (G_1 - G_2), every signed dictionary "
                "(768 classes, hence all 46,080); G_1 = (I + N/6)/2")
    # telescoping variance loss on orbit 1
    orbit1 = Hs.selected_orbit()["classes"]
    ck(D0 in orbit1 and len(orbit1) == 8, "orbit 1 = the 8 Q64-selected classes, D0 among them")
    gvals = {}
    for D in orbit1:
        for n in range(1, 7):
            diag, v = walsh_block_values(twirl(code(GRAM[n], D)))
            ck(diag, f"G_{n} Walsh-diagonal on {D}")
            gvals[(D, n)] = tuple(Fr(int(x), 64 * 60 * 4 ** n) for x in v)
    distinct = {n: len({gvals[(D, n)] for D in orbit1}) for n in range(1, 7)}
    ck(distinct[1] == distinct[2] == 1, "G_1, G_2 identical on the 8 classes (universal, Part 1)")
    w3 = set()
    for D in orbit1:
        G = {0: tuple(Fr(1) for _ in range(N)), **{n: gvals[(D, n)] for n in range(1, 7)}}
        d = {n: tuple(G[n][m] - G[n + 1][m] for m in range(N)) for n in range(6)}
        ck(all(d[0][m] == Fr(WT[m], 6) for m in range(N)), "d_0 = 1 - G_1 = k/6 on Walsh weight k (= (6-N)/12)")
        ck(all(d[1][m] == Fr(2 * WT[m] * (6 - WT[m]), 60) for m in range(N)), "d_1 = G_1 - G_2 = H/60")
        ck(d[0][63] == 1 and all(d[n][63] == 0 for n in range(1, 6)), "w63 loses all its norm in the first step only")
        ck(all(d[n][0] == 0 for n in range(6)), "the constant loses nothing")
        ck(all(sum(d[n][m] for n in range(6)) == (0 if m == 0 else 1) for m in range(N)), "sum_n d_n = I - P_0")
        ck(all(x >= 0 for n in range(6) for x in d[n]), "every d_n >= 0 (variance never grows)")
        w3 |= {d[2][m] for m in range(N) if WT[m] == 3}
    w3 = sorted(w3)
    ck(len(w3) == 2, "d_2 is dictionary-sensitive: two values on Walsh 3 (A5 is not 3-transitive on 6 axes)")
    cert.record("1 G_n classes", f"distinct G_n over the 8 orbit-1 classes, n = 1..6: {distinct}")
    cert.record("1 telescoping (orbit 1)", "d_0 = k/6, d_1 = H/60 = k(6-k)/30; w63: d_0 = 1, d_n = 0 (n >= 1); "
                f"d_2 on Walsh 3 takes {w3}")

    # ------------------------------------------------------------------ Part 2: tau symmetry of the original action
    u = w0 - w63                                                          # norm^2 = 128
    tau64 = 64 * I64 - np.outer(u, u)                                     # 64 tau; tau = I - 2 u u^T / (u^T u), u^T u = 128
    ck(int(u @ u) == 128, "u^T u = 128")
    ck((tau64 @ tau64 == 64 * 64 * I64).all() and (tau64 == tau64.T).all(), "tau is an orthogonal involution")
    ck((tau64 @ w0 == 64 * w63).all() and (tau64 @ w63 == 64 * w0).all(), "tau swaps w0 and w63")
    ck((tau64 @ HB == HB @ tau64).all(), "tau commutes with H_bits")
    ck((HB @ w0 == 0).all() and (HB @ w63 == 0).all(), "w0, w63 span the H_bits zero eigenspace (spectrum 0(2))")
    P8 = Hs.carrier_projectors()["P8"]                                    # = U_h U_h^T, exact rational
    P8w0 = [sum(P8[a][b] * int(w0[b]) for b in range(N)) for a in range(N)]
    P8w63 = [sum(P8[a][b] * int(w63[b]) for b in range(N)) for a in range(N)]
    ck(all(x == 0 for x in P8w0) and all(x == 0 for x in P8w63), "P8 w0 = P8 w63 = 0: im U_h is orthogonal to both")
    # hence tau P8 = P8 tau = P8 exactly (tau = I on (span{w0,w63})^perp, which contains im U_h)
    tauP8 = [[sum(Fr(int(tau64[a][k]), 64) * P8[k][b] for k in range(N)) for b in range(N)] for a in range(N)]
    ck(all(tauP8[a][b] == P8[a][b] for a in range(N) for b in range(N)), "tau P8 = P8: tau fixes im U_h pointwise")
    A1 = twirl(code((2 * I64 - Q2).T @ (2 * I64 - Q2), D0))             # 240 Abar_1(D0)
    ck((A1 @ w0 == 0).all() and (A1 @ w63 == 240 * w63).all(), "Abar w0 = 0, Abar w63 = w63")
    ck(not (tau64 @ A1 == A1 @ tau64).all(), "Abar breaks tau, so K_c = H + c Abar is tau-invariant only at c = 0")

    # 2c: the ORIGINAL 2026-11-07 history energy, executed unmodified (float64 cross-check)
    ico = icosahedron()
    Mf = np.array(Hs.M_matrix(), dtype=float)
    Ph = np.array([[float(x) for x in row] for row in ico["Ph"]])
    Uh = Mf @ Ph / np.sqrt(2.0)
    ck(np.abs(Uh.T @ Uh - Ph).max() < 1e-12, "U_h isometric on the hidden space (float)")
    r = np.pi / np.e; Delta = 3 / 20 - 80 * np.pi / (1053 * (1 + 5 ** 0.5) / 2)
    ns = load_definitions(original_path("joint_action_2026_11_07"), ["direct_history_energy"],
                          extra_globals={"np": np, "Hbits": HB.astype(float), "Uh": Uh, "r": r, "Delta": Delta, "N": 24})
    E = ns["direct_history_energy"]
    t = np.arange(24)[:, None]; hh = np.arange(N)[None, :]; f = np.arange(20)[None, :]
    y = np.cos(0.37 * t + 0.11 * hh * hh) + 1j * np.sin(0.23 * t * hh + 0.5)      # deterministic configuration
    h3 = np.cos(0.7 * t + 0.3 * f) * 0.1 + 0j; h5 = np.sin(0.4 * t - 0.2 * f) * 0.1 + 0j
    th = ((np.arange(24) % 5) - 2) / 37.0
    tauf = tau64.astype(float) / 64
    e1 = E(y, h3, h5, th); e2 = E(y @ tauf.T, h3, h5, th)
    ck(abs(e1 - e2) < 1e-9 * max(1.0, abs(e1)), f"original direct_history_energy(tau y) = (y): {e1!r} vs {e2!r}")
    # sanity: a reflection mixing w63 with a Walsh-2 mode is NOT a symmetry (the test can fail)
    v = (w63 - WAL[:, 3]).astype(float); rho = np.eye(N) - np.outer(v, v) / (v @ v)
    ck(abs(E(y @ rho.T, h3, h5, th) - e1) > 1e-6, "control: swapping w63 with a Walsh-2 mode changes the energy")
    cert.record("2 tau", "the original 190/64/24 action is invariant under w0 <-> w63; native w63 energy = 0 = "
                f"constant's, no source coupling (original function executed: {e1:.12f} both sides)")

    # ------------------------------------------------------------------ Part 3: Q2 never sees w63
    for n in range(1, 7):
        ck((Q2pow[n] @ w63 == 0).all() and (Q2pow[n].T @ w63 == 0).all(), f"Q^{n} w63 = 0 = (Q^{n})^T w63")
    ck((Q2pow[6] == np.ones((N, N), dtype=np.int64)).all(), "Q^6 = J/64")
    sgn_ok = True
    for D in classes:
        idx = np.array(Hs.dictionary_index(D)); cw = np.zeros(N, dtype=np.int64); cw[idx] = w63
        sgn_ok &= bool((cw == w63).all() or (cw == -w63).all())
    ck(sgn_ok, "every dictionary sends w63 to +-w63")
    ck(all((w63[p] == w63).all() or (w63[p] == -w63).all() for p in PERMS), "every code rotation sends w63 to +-w63")
    bad = 0
    for D in classes:
        A = twirl(code((2 * I64 - Q2).T @ (2 * I64 - Q2), D))
        bad += not ((A @ w63 == 240 * w63).all() and (A @ w0 == 0).all())
    ck(bad == 0, "Abar_1(D) w63 = w63 and Abar_1(D) w0 = 0 on all 768 classes")
    quart = {}
    for D in orbit1:
        for n in range(1, 7):
            Yn = (2 ** n) * I64 - Q2pow[n]
            A = twirl(code(Yn.T @ Yn, D))                                 # 60 * 4^n Abar_n
            ck((A @ w63 == 60 * 4 ** n * w63).all(), f"Abar_{n}({D}) w63 = w63")
            ck((A @ HB == HB @ A).all(), f"Abar_{n}({D}) commutes with H")
            quart[(D, n)] = A
    cert.record("3 Q2", "Q^n kills w63 on both sides (n = 1..6); every twirled n-step Dirichlet form gives w63 "
                "energy exactly 1 (768 classes for n = 1; orbit 1 for n = 1..6)")

    # ------------------------------------------------------------------ Part 4: candidate (b), multi-step matching on V
    import runpy
    from contextlib import redirect_stdout
    from io import StringIO
    with redirect_stdout(StringIO()):
        Z = runpy.run_path(str(ROOT / "research_archive/2026-11-13_q82_oriented_source_weights/"
                               "Q82_ORIENTED_SOURCE_WEIGHTS_CERTIFICATE.py"))
    Ek = Z["Ek"]                                                          # 960 E_k, quartet isotypic in Walsh k

    def qdata(A, sc):
        a2 = Fr(int(np.trace(Ek[2] @ A)), 960 * 4 * sc); a4 = Fr(int(np.trace(Ek[4] @ A)), 960 * 4 * sc)
        M3 = Ek[3] @ A
        s = Fr(int(np.trace(M3)), 960 * sc) / 4; q = Fr(int(np.trace(M3 @ M3)), 960 * 960 * sc * sc) / 4
        return a2, a4, s, 2 * q - s * s                                   # last = (lambda1 - lambda2)^2 on Walsh 3
    qall = {(D, n): qdata(quart[(D, n)], 60 * 4 ** n) for D in orbit1 for n in range(1, 7)}
    ck(all(qall[(D, n)] == qall[(D0, n)] for D in orbit1 for n in range(1, 7)),
       "quartet data of every Abar_n identical on the 8 orbit-1 classes")
    qd = {n: qall[(D0, n)] for n in range(1, 7)}
    ck(qd[1][:2] == (Fr(4, 3), Fr(3, 2)) and qd[1][2] == 3 and qd[1][3] == Fr(9, 100),
       "Abar_1 quartet data reproduce Q82: P5 4/3, dark 3/2, Walsh-3 pair 27/20, 33/20")
    a2, a4, _, del1 = qd[1]
    verdict = {}
    for n in range(2, 7):
        b2, b4, s, deln = qd[n]
        # in span{P_V, H P_V, Abar_1 P_V} => b2 - b4 = z (a2 - a4) and deln = z^2 del1 for one z
        in_span = (b2 - b4) ** 2 * del1 == (a2 - a4) ** 2 * deln
        verdict[n] = (in_span, b2, b4, deln)
    ck(all(not verdict[n][0] for n in (2, 3, 4)), "n = 2, 3, 4: n-step form on V is not in span{I, H, Abar_1}")
    ck(all(verdict[n][1:] == (1, 1, 0) and qd[n][2] == 2 for n in (5, 6)), "n = 5, 6: n-step form = P_V on V")
    cert.record("4 candidate (b)", {n: f"P5 {verdict[n][1]}, dark {verdict[n][2]}, W3 split^2 {verdict[n][3]}, "
                                       f"in span: {verdict[n][0]}" for n in range(2, 7)})
    cert.record("verdict", "no listed original operator fixes c: the original action gives w63 energy 0 (tau), every "
                "chronology gives it energy 1 in its own unit, the clock inherits the mass; c = relative weight of "
                "Reynolds[(I-Q)^T(I-Q)] against Reynolds[Q^T(I-Q^TQ)Q] = H/60, times 60")
