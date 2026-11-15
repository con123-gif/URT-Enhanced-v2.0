"""Q127 (ACTIVE PROBLEM A, attempt A3 after Q104): does the connection premise single out sigma_1?

Premise under test.  The clock covariant difference y_{t+1} - e^{2i theta} T y_t is a U(1) connection along the
24-clock; read it as a connection on the history bundle too, so T is unitary.  T must move a history only to a URT
successor (T[h,k] != 0 only for k in {2h, 2h+1} mod 64).  Add trivial history holonomy round the clock
(T^24 = I) and A5 compatibility through the dictionary.  Does this select sigma_1 without Q64/Q72 likelihoods?

Answer: no.  Exact statements certified here (integers and Fractions; float64 only where marked):

Part 1 (THEOREM, structure).  The predecessors of 2x and 2x+1 are exactly x and x+32.  Hence a URT-supported T is a
  direct sum of 32 blocks U_x (rows x, x+32 -> columns 2x, 2x+1), and T is unitary iff every U_x is in U(2).
  (a) T entrywise >= 0 (a doubly stochastic transport): U_x in {1, swap}, i.e. T = P_sigma_beta, the 2^32 lifts.
  (b) T Born-compatible with the URT kernel, |T[h,k]|^2 = Q[h,k] = 1/2: U_x has all moduli 1/sqrt2 (a 3-torus per
      block; 8 real sign patterns per block).  No permutation lift is Born-compatible: readings (a), (b) are disjoint.
Part 2 (THEOREM, holonomy).  sigma_0 (beta = 0) has order 6 and sigma_1 (beta = 1) order 12; the uniform real
  Walsh-Hadamard coin T_H = M/sqrt2 has M^12 = 64 I exactly, order 12.  All three have trivial 24-holonomy, so the
  holonomy premise does not separate them.  Census of the 2^16 complement-symmetric lifts (Fix I): order
  distribution: 1046 have order dividing 24, of which 977 have order exactly 24.  Under the stronger reading
  'the history closes only after the full 24-clock' (order exactly 24) sigma_0 and sigma_1 are both EXCLUDED; four of
  the eight uniform real coins have order exactly 24, the other four order 12.
Part 3 (THEOREM, A5 on all 768 classes, permutation reading).  sigma_0 and sigma_1 each commute with a C3 of
  rho_D(A5) on exactly 24 classes (disjoint), forming 3 + 3 of the 96 Q24 orbits; selected orbit 1 is a sigma_1
  orbit.  This reproduces Q61 S2 independently through the engine.  With holonomy added nothing changes: the premise
  set {unitary, >= 0, T^24 = I, maximal A5 commutant} leaves 6 orbits and two lifts, and picks sigma_1 only once the
  dictionary orbit is chosen (Q64/Q72).  T_H commutes with no nontrivial rho_D(a) on any class.
Part 4 (THEOREM, laws).  For every lift, w63^T P_beta w63 = 64 - 4|beta| (|beta| = popcount), and the A5 twirl keeps
  this Rayleigh quotient; so in the Q104 kernel the parity mass is r^2 [2 - 2 cos psi (1 - |beta|/16)].  For T_H it
  is r^2 (2 + sqrt2 cos psi) (w63^T M_H w63 = -64).  The trivial-holonomy transports give different history laws.
"""
from __future__ import annotations

import math
import sys
from collections import Counter
from pathlib import Path

import numpy as np

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from cathedral_engine import histories as Hs              # noqa: E402
from cathedral_engine.certify import Certificate           # noqa: E402

N = 64
PERMS = [tuple(p) for p in Hs.a5_on_codes()]
B1 = Hs.SIGMA1_BETA


def order_of(s):
    seen = [False] * N; L = 1
    for h in range(N):
        if not seen[h]:
            c = 0; x = h
            while not seen[x]:
                seen[x] = True; x = s[x]; c += 1
            L = L * c // math.gcd(L, c)
    return L


def block_matrix(blocks):
    """T from 32 integer 2x2 blocks: T[x + 32e, 2x + j] = blocks[x][e][j]."""
    T = np.zeros((N, N), dtype=np.int64)
    for x in range(32):
        for e in (0, 1):
            for j in (0, 1):
                T[x + 32 * e, (2 * x + j) % N] = blocks[x][e][j]
    return T


def pull_perm(s, D):
    idx = Hs.dictionary_index(D)
    out = [0] * N
    for h in range(N):
        out[idx[h]] = idx[s[h]]
    return out


def commutant_size_perm(s, D):
    c = pull_perm(s, D)
    return sum(1 for p in PERMS if all(c[p[h]] == p[c[h]] for h in range(N)))


def commutant_size_mat(T, D):
    idx = np.array(Hs.dictionary_index(D)); Y = np.zeros((N, N), dtype=np.int64); Y[np.ix_(idx, idx)] = T
    return sum(1 for p in PERMS if (Y[np.ix_(p, p)] == Y).all())


with Certificate("Q127_unitary_connection", __file__) as cert:
    ck = cert.check

    # ============================================================ Part 1: structure of URT-supported unitaries
    pred = {k: sorted(h for h in range(N) if k in Hs.succ(h)) for k in range(N)}
    ck(all(pred[k] == [(k // 2) % 32, (k // 2) % 32 + 32] for k in range(N)),
       "predecessors of 2x, 2x+1 are exactly x, x+32: URT support = 32 disjoint 2x2 blocks")
    ck(all(set(Hs.succ(x)) == set(Hs.succ(x + 32)) for x in range(32)), "rows x and x+32 share successors {2x, 2x+1}")
    # (a) nonnegative unitary blocks are permutation matrices; the block of sigma_beta is 1 or swap by beta(x)
    for beta in (0, B1, 0x5A5A5A5A, 0x0F0F00FF):
        s = Hs.sigma_lift(beta)
        for x in range(32):
            b = (beta >> x) & 1
            ck(s[x] == 2 * x + b and s[x + 32] == 2 * x + (1 - b), f"lift {hex(beta)}: block {x} is 1 or swap")
    ck(len({Hs.sigma_lift(b) for b in range(0, 1 << 32, 0x01010101)}) == 256, "distinct beta give distinct lifts (probe)")
    # (b) Born compatibility: |U|^2 = 1/2 everywhere.  Real such U are the 8 matrices (+-1 +-1; +-1 -+1)/sqrt2 up to
    # orthogonality; enumerate all sign patterns of integer M with M M^T = 2 I.
    real_coins = [((a, b), (c, d)) for a in (1, -1) for b in (1, -1) for c in (1, -1) for d in (1, -1)
                  if a * c + b * d == 0]
    ck(len(real_coins) == 8, "exactly 8 real Born-compatible 2x2 coins (entries +-1/sqrt2)")
    ck(all(abs(u[e][j]) == 1 for u in real_coins for e in (0, 1) for j in (0, 1)), "coins have all |entries|^2 = 1/2")
    ck(all(sorted(abs(v) for row in u for v in row) != [0, 0, 1, 1] for u in real_coins),
       "no coin is a permutation block: Born reading and doubly-stochastic reading are disjoint")
    Q2 = np.array(Hs.Q2(), dtype=np.int64)
    ck((Q2 == block_matrix([((1, 1), (1, 1))] * 32)).all(), "2Q = all-ones blocks, so |T|^2 = Q means |U_x|^2 = J/2")
    MH = block_matrix([((1, 1), (1, -1))] * 32)
    ck((MH @ MH.T == 2 * np.eye(N, dtype=np.int64)).all(), "T_H = M_H/sqrt2 is orthogonal")
    ck(((MH * MH) == Q2).all(), "T_H is Born-compatible: |T_H|^2 = Q")
    ck(np.linalg.matrix_rank(Q2.astype(float)) == 32, "Q itself is not unitary (rank 32)")
    cert.record("1 structure", "URT-supported unitaries = U(2)^32 blocks; >= 0 -> 2^32 lifts; |T|^2 = Q -> coin tori; disjoint")

    # ============================================================ Part 2: holonomy round the 24-clock
    s0, s1 = Hs.sigma_lift(0), Hs.sigma_lift(B1)
    ck(order_of(s0) == 6 and order_of(s1) == 12, "sigma_0 has order 6, sigma_1 order 12: both P^24 = I")
    Mk = np.eye(N, dtype=np.int64)
    for k in range(1, 13):
        Mk = Mk @ MH
        if k < 12:
            ck(not (k % 2 == 0 and (Mk == 2 ** (k // 2) * np.eye(N, dtype=np.int64)).all()), f"T_H^{k} != I")
    ck((Mk == 64 * np.eye(N, dtype=np.int64)).all(), "M_H^12 = 64 I exactly: T_H^12 = I, trivial 24-holonomy")
    coin_orders = {}
    for u in real_coins:
        M = block_matrix([u] * 32); Mk = np.eye(N, dtype=np.int64); o = None
        for k in range(1, 49):
            Mk = Mk @ M
            if k % 2 == 0 and (Mk == 2 ** (k // 2) * np.eye(N, dtype=np.int64)).all():
                o = k; break
        coin_orders[str(u)] = o
    cert.record("2 uniform real coin orders (None = no order <= 48)", coin_orders)
    # census over Fix I (complement-symmetric lifts: beta(x) = beta(x ^ 31)), 2^16 lifts
    Ig = [h ^ 63 for h in range(N)]
    orders = Counter(); div24 = exact24 = 0; withs = set()
    for k in range(1 << 16):
        beta = 0
        for i in range(16):
            if (k >> i) & 1:
                beta |= (1 << i) | (1 << (i ^ 31))
        s = Hs.sigma_lift(beta)
        if k in (0, 1, 0xFFFF, 0x1234):
            ck(all(s[Ig[h]] == Ig[s[h]] for h in range(N)), f"Fix I parametrisation ({hex(k)})")
        o = order_of(s); orders[o] += 1
        if 24 % o == 0:
            div24 += 1; withs.add(beta)
        if o == 24:
            exact24 += 1
    ck(sum(orders.values()) == 1 << 16, "census covers all 2^16 complement-symmetric lifts")
    ck(0 in withs and B1 in withs, "sigma_0 and sigma_1 are among the trivial-holonomy lifts")
    ck(div24 > 2, "trivial 24-holonomy leaves more than the two C3-selected lifts")
    ck(exact24 > 0, "some complement-symmetric lifts have order exactly 24")
    ck(div24 == 1046 and exact24 == 977 and orders[6] == 1 and orders[8] == 2 and orders[12] == 66,
       "Fix I census: order | 24 for 1046 lifts (6: 1, 8: 2, 12: 66, 24: 977)")
    cert.record("2 Fix I census", {"distinct orders": len(orders), "max order": max(orders),
                                   "order | 24": div24, "order = 24": exact24})

    # ============================================================ Part 3: A5 compatibility on all 768 classes
    classes = Hs.a5_classes()
    orb_of = {}
    for i, o in enumerate(Hs.q24_orbits()):
        for D in o:
            orb_of[D] = i
    c0 = {D: commutant_size_perm(s0, D) for D in classes}
    c1 = {D: commutant_size_perm(s1, D) for D in classes}
    ck(set(c0.values()) <= {1, 3} and set(c1.values()) <= {1, 3}, "commutants of sigma_0, sigma_1 are trivial or C3")
    E0 = {D for D in classes if c0[D] == 3}; E1 = {D for D in classes if c1[D] == 3}
    ck(len(E0) == 24 and len(E1) == 24 and not (E0 & E1), "C3 commutes with sigma_0 on 24 classes, sigma_1 on 24, disjoint")
    O0 = {orb_of[D] for D in E0}; O1 = {orb_of[D] for D in E1}
    ck(len(O0) == 3 and len(O1) == 3, "they form 3 + 3 Q24 orbits (Q61 S2 reproduced)")
    ck(all(sum(1 for D in Hs.q24_orbits()[i] if D in E) == 8 for E, Os in ((E0, O0), (E1, O1)) for i in Os),
       "each such orbit is wholly sigma_0 or wholly sigma_1")
    orbit1 = Hs.selected_orbit()["classes"]
    ck(set(orbit1) <= E1, "selected orbit 1 is one of the three sigma_1 orbits")
    cH = Counter(commutant_size_mat(MH, D) for D in classes)
    ck(cH == Counter({1: 768}), "T_H commutes with no nontrivial rho_D(a) on any of the 768 classes")
    cert.record("3 A5", {"sigma_0 C3 orbits": sorted(O0), "sigma_1 C3 orbits": sorted(O1),
                         "orbit 1 index": orb_of[orbit1[0]], "T_H commutant sizes": dict(cH)})

    # ============================================================ Part 4: parity laws
    w63 = np.array([(-1) ** bin(h).count("1") for h in range(N)], dtype=np.int64)
    for beta in (0, B1, 0x0000FFFF, 0x13579BDF, 0x80000001):
        P = np.zeros((N, N), dtype=np.int64)
        for h, k in enumerate(Hs.sigma_lift(beta)):
            P[h, k] = 1
        pc = bin(beta).count("1")
        ck(int(w63 @ P @ w63) == 64 - 4 * pc, f"w63^T P w63 = 64 - 4|beta| for beta = {hex(beta)}")
        for D in orbit1[:2]:
            idx = np.array(Hs.dictionary_index(D)); Y = np.zeros((N, N), dtype=np.int64); Y[np.ix_(idx, idx)] = P + P.T
            tw = sum(Y[np.ix_(p, p)] for p in PERMS)
            ck(int(w63 @ tw @ w63) == 60 * 2 * (64 - 4 * pc), f"A5 twirl keeps the parity Rayleigh quotient ({hex(beta)}, {D})")
    ck(int(w63 @ MH @ w63) == -64, "w63^T M_H w63 = -64: T_H parity mass r^2 (2 + sqrt2 cos psi)")
    for D in orbit1[:2]:
        idx = np.array(Hs.dictionary_index(D)); Y = np.zeros((N, N), dtype=np.int64); Y[np.ix_(idx, idx)] = MH + MH.T
        tw = sum(Y[np.ix_(p, p)] for p in PERMS)
        ck(int(w63 @ tw @ w63) == 60 * 2 * (-64), f"A5 twirl keeps the T_H parity Rayleigh quotient ({D})")
    ck(order_of(Hs.sigma_lift(0)) != 24 and order_of(Hs.sigma_lift(B1)) != 24,
       "neither C3-selected lift has order exactly 24")
    cert.record("4 parity laws (m63 / r^2)", "I: 2-2cos psi | Q: 1 | lift beta: 2 - 2cos psi (1 - |beta|/16) "
                "(sigma_0: 2-2cos psi, sigma_1: 2+2cos psi) | T_H: 2 + sqrt2 cos psi")
    cert.record("verdict", "OBSTRUCTION: unitary URT transports are U(2)^32; trivial 24-holonomy keeps sigma_0, sigma_1, "
                "T_H and many more lifts; A5 compatibility gives sigma_0 on 3 and sigma_1 on 3 Q24 orbits. sigma_1 is "
                "singled out only after the dictionary orbit is selected (Q64/Q72). The Q104 P_sigma1 law is not forced.")
