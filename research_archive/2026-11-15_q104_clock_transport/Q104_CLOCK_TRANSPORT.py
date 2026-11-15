"""Q104 (ACTIVE PROBLEM A, attempt A3): is a history transport along clock steps, y_{t+1} - e^{2i theta} T y_t,
forced by the joint 190/64/24 action?  Answer: no.  The three stated requirements admit every linear T, and the
native candidates give pairwise different history laws.  Closed-form clock-mode sums are given for each law.

Original objects only: the 2026-11-07 action (H_bits, U_h carrier, r = pi/e, theta = 2 pi/phi^2, the 24-clock),
the URT successor kernel Q, the Q64/Q72 selected lift sigma_1 (beta = 1 everywhere), the Q72 bridge B_{D0},
selected orbit 1, the A5 Reynolds average through the dictionary (as in Q86/Q91/Q92), and the Q82 quartet projectors.
Nothing is fitted and nothing is random.  Test configurations in Part 1 are deterministic trigonometric arrays.

Part 1 (THEOREM, any C-linear T_t on C^64, t-dependent allowed).  In the original action replace the clock term
    (1/2) r^2 sum_t |y_{t+1} - e^{2i theta_t} y_t|^2   by   (1/2) r^2 sum_t |y_{t+1} - e^{2i theta_t} T_t y_t|^2.
  (a) Clock-gauge covariance (charge 2 on y), small and large gauge: (D y')_t = e^{2i a_{t+1}} (D y)_t.
  (b) Q56 vacuum: K_T := 1_24 (x) H + r^2 D_T^* D_T >= 1_24 (x) H, hence for every carrier source b,
      <b, K_T^{-1} b> <= <b, (1 (x) H)^+ b> = |h3|^2/18 + Delta^2 |h5|^2/16, so the Schur term keeps
      V_4 >= (2/9)|h3|^2 + (7/32) Delta^2 |h5|^2 >= 0 and stays quartic-homogeneous; the Q56 radial argument applies
      verbatim: z = 0 is the unique stationary cochain and all currents vanish, for every T.
  (c) 24-periodicity: for t-independent T the clock Fourier modes decouple exactly, mode m giving
      |f - e^{i psi_m} T f|^2 with psi_m = 2 theta - 2 pi m/24.  No condition on T arises (Q^6 = J/64 is harmless).
  Checked numerically (float64) on the full 1536-dim kernel for T = I, Q, P_sigma1 and B_{D0}.
Part 2 (exact, all 8 orbit-1 classes): three native laws on the quartet isotypic V (multiplicity 4 each), weights
  (4,2,2,0) in all three, Reynolds-averaged forms Mbar_T = I + G_T - cos psi O_T - i sin psi W_T:
      T = I       : P5 16 + r^2 (2 - 2cos psi),  P3 18 + r^2 (2 - 2cos psi) (double),  dark 16 + r^2(2 - 2cos psi)
      T = Q       : Q92 law  P5 16 + r^2(5 - cos psi)/3, P3 18 + r^2[3/2 -+ sqrt(9+16 sin^2 psi)/20], dark 16 + r^2(8+cos psi)/6
      T = P_sigma1: P5 16 + r^2(2 - cos(psi)/2), P3 18 + r^2(2 -+ sin(psi)/2), dark 16 + r^2(2 + cos(psi)/2)
  (P_sigma1: G = I, O = 1/2, 0, -1/2 on Walsh-2/3/4 quartets, W = E_3 W E_3, W^2 = -(1/4) E_3, tr(G3 W) = 0.)
  Parity history: m63 = r^2 (2 - 2cos psi), r^2, r^2 (2 + 2cos psi).  On the URT segment T_l = (1-l) Q + l P_sigma1
  (doubly stochastic on the URT graph, l in [0,1]) m63 = r^2 (1 + 2 l cos psi + l^2) exactly: a continuous family.
  sigma_1^6 = complement, sigma_1^12 = id (so P_sigma1^24 = I), while (2Q)^6 = J (Q^24 = J/64, rank 1).
Part 3 (closed forms, checked in float64 against direct 64x64 inverses at all 24 native modes).  With
  F_N(A, x) := sum_{m=0}^{N-1} 1/(A - cos(x - 2 pi m/N)) = N sinh(N b) / (sinh b (cosh N b - cos N x)), cosh b = A > 1,
  and S_s(T) := sum_{m=0}^{23} tr(G_s K_T(psi_m)^{-1}), G_s = U_h P_s U_h^T:
      S_5(I) = (2/r^2) F_24(1 + 8/r^2, 2 theta)           S_3(I) = (2/r^2) F_24(1 + 9/r^2, 2 theta)
      S_5(Q) = (12/r^2) F_24(5 + 48/r^2, 2 theta)         S_3(Q) = (400 a/r^4) F_12(50 a^2/r^4 - 17/8, 4 theta + pi),
                                                                   a = 18 + 3 r^2/2
      S_5(P) = (8/r^2) F_24(4 + 32/r^2, 2 theta)          S_3(P) = (64 a'/r^4) F_12(8 a'^2/r^4 - 1, 4 theta + pi),
                                                                   a' = 18 + 2 r^2
  Every one depends on theta only through cos(48 theta), the gauge-invariant holonomy.
Part 4 (float64, D0): the Q72 bridge B_{D0} gives a fourth, different law (its parity Rayleigh quotient and mode sums
  differ from all three above).
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

N, NT = 64, 24
D0 = (0, 2, 4, 6, 10, 9)
PERMS = [np.array(p) for p in Hs.a5_on_codes()]

with redirect_stdout(StringIO()):
    Z = runpy.run_path(str(ROOT / "research_archive/2026-11-13_q82_oriented_source_weights/"
                           "Q82_ORIENTED_SOURCE_WEIGHTS_CERTIFICATE.py"))
E = {k: np.array(Z["Ek"][k], dtype=object) for k in (2, 3, 4)}        # 960 E_k (code coordinates)
G3n = np.array(Z["G3n"], dtype=object); G5n = np.array(Z["G5n"], dtype=object); dG = int(Z["dG"])
Q2 = np.array(Hs.Q2(), dtype=object)                                   # 2Q (history coordinates)
I = np.eye(N, dtype=np.int64).astype(object)
HB = np.array(Hs.hbits(), dtype=object)
w63 = np.array([(-1) ** bin(h).count("1") for h in range(N)], dtype=object)
w0 = np.ones(N, dtype=object)
SIG = Hs.sigma_lift(Hs.SIGMA1_BETA)
P = np.zeros((N, N), dtype=np.int64)
for h in range(N):
    P[h, SIG[h]] = 1
P = P.astype(object)


def twirl(X, D):
    """sum over the 60 code rotations of X pulled back through D (= 60 Reynolds[X])."""
    idx = np.array(Hs.dictionary_index(D))
    Y = np.zeros((N, N), dtype=object); Y[np.ix_(idx, idx)] = X
    return sum(Y[np.ix_(p, p)] for p in PERMS)


def pull(X, D):
    idx = np.array(Hs.dictionary_index(D))
    Y = np.zeros((N, N), dtype=X.dtype); Y[np.ix_(idx, idx)] = X
    return Y


def eq(X, Y):
    return bool((np.asarray(X, dtype=object) == np.asarray(Y, dtype=object)).all())


def trp(X, Y):
    return sum(int(a) for a in (np.asarray(X, dtype=object) * np.asarray(Y, dtype=object).T).ravel())


def F_N(Nn, A, x):
    b = math.acosh(A)
    return Nn * math.sinh(Nn * b) / (math.sinh(b) * (math.cosh(Nn * b) - math.cos(Nn * x)))


def bridge_D0():
    """Q72 uniform-marginal bridge on D0 (float64): blocks [[t,1-t],[1-t,t]], t/(1-t) = sqrt(ad/bc) (Q91 Part 1)."""
    S = Hs.twirled_chronology(D0)
    B = np.zeros((N, N))
    for x in range(32):
        a, b = float(S[x, 2 * x % N]), float(S[x, 2 * x % N | 1])
        c, d = float(S[x + 32, 2 * x % N]), float(S[x + 32, 2 * x % N | 1])
        s = math.sqrt(a * d / (b * c)); t = s / (1 + s)
        for e in (0, 1):
            for j in (0, 1):
                B[x + 32 * e, (2 * x + j) % N] = t if j == e else 1 - t
    return B


with Certificate("Q104_clock_transport", __file__) as cert:
    ck = cert.check
    phi = (1 + 5 ** 0.5) / 2; r = math.pi / math.e; theta = 2 * math.pi / phi ** 2; r2 = r * r
    orbit1 = Hs.selected_orbit()["classes"]
    ck(D0 in orbit1 and len(orbit1) == 8, "orbit 1 = 8 classes")
    for k in (2, 3, 4):
        ck(eq(E[k] @ E[k], 960 * E[k]), f"E_{k} idempotent")
    ck(eq(E[3] @ G3n, 960 * G3n) and eq(E[2] @ G5n, 960 * G5n), "P3 source in Walsh-3 quartet, P5 in Walsh-2")
    ck(eq(HB @ G3n, 18 * G3n) and eq(HB @ G5n, 16 * G5n), "H = 18 on the P3 carrier, 16 on the P5 carrier")

    # ================================================================ Part 2 (exact)
    ck(sorted(SIG) == list(range(N)), "sigma_1 is a bijection")
    ck(all(SIG[h] in Hs.succ(h) for h in range(N)), "sigma_1 is a lift of the URT successor rule")
    s = list(range(N))
    for k in range(1, 13):
        s = [SIG[x] for x in s]
        if k == 6:
            ck(s == [x ^ 63 for x in range(N)], "sigma_1^6 = complement (central inversion)")
    ck(s == list(range(N)), "sigma_1^12 = id, so P_sigma1^24 = I (trivial history holonomy round the 24-clock)")
    Q6 = Q2 @ Q2 @ Q2 @ Q2 @ Q2 @ Q2
    ck(eq(Q6, np.ones((N, N), dtype=np.int64).astype(object)), "(2Q)^6 = J: Q^24 = J/64 (rank-1 holonomy)")
    ck(eq(P @ w63, -w63) and eq(P.T @ w63, -w63), "P_sigma1 w63 = P_sigma1^T w63 = -w63")
    ck(not (Q2 @ w63).any() and not (Q2.T @ w63).any(), "Q w63 = Q^T w63 = 0")
    ck(eq(P @ w0, w0) and eq(Q2 @ w0, 2 * w0), "P w0 = Q w0 = w0")

    for D in orbit1:
        O = twirl(P + P.T, D); W = twirl(P - P.T, D); G = twirl(P.T @ P, D)       # 60 O_P, 60 W_P, 60 G_P
        ck(eq(G, 60 * I), f"{D}: G_P = I")
        for k in (2, 3, 4):
            ck(eq(O @ E[k], E[k] @ O), f"{D}: O_P commutes with E_{k}")
        ck(eq(E[2] @ O, 30 * E[2]) and not (E[3] @ O).any() and eq(E[4] @ O, -30 * E[4]),
           f"{D}: O_P = 1/2, 0, -1/2 on Walsh-2/3/4 quartets")
        ck(eq(W.T, -W) and eq(E[3] @ W @ E[3], 960 * 960 * W), f"{D}: W_P antisymmetric, W_P = E_3 W_P E_3")
        ck(eq(960 * (W @ W), -900 * E[3]), f"{D}: W_P^2 = -(1/4) E_3")
        ck(trp(G3n, W) == 0, f"{D}: tr(G3 W_P) = 0, so the P3 source splits 2 + 2")
        ck(trp(G5n, E[3]) == 0 and trp(G5n, E[4]) == 0 and trp(G3n, E[2]) == 0 and trp(G3n, E[4]) == 0,
           f"{D}: sources carry no weight on other blocks (weights 4, 2, 2, 0)")
        ck(eq(O @ w63, -120 * w63) and not (W @ w63).any(), f"{D}: O_P w63 = -2 w63, W_P w63 = 0")
        ck(eq(O @ w0, 120 * w0) and not (W @ w0).any(), f"{D}: O_P w0 = 2 w0")
        # URT segment T_l = (1-l) Q + l P, exact at l = p/q via 2q T = (q-p) 2Q + 2p P
        for (p_, q_) in ((0, 1), (1, 3), (1, 2), (2, 3), (1, 1)):
            T2q = (q_ - p_) * Q2 + 2 * p_ * P
            GT = twirl(T2q.T @ T2q, D); OT = twirl(T2q + T2q.T, D); WT = twirl(T2q - T2q.T, D)
            l = Fr(p_, q_)
            # Reynolds: (2q)^2 G_T, 2q O_T, 2q W_T (times 60)
            ck(eq(GT @ w63, int(60 * 4 * q_ * q_ * l * l) * w63), f"{D}, l={l}: G_T w63 = l^2 w63")
            ck(eq(OT @ w63, int(-60 * 2 * q_ * 2 * l) * w63) and not (WT @ w63).any(),
               f"{D}, l={l}: O_T w63 = -2l w63, W_T w63 = 0  ->  m63 = r^2(1 + 2 l cos psi + l^2)")
    cert.record("2 P_sigma1 law", "P5 16 + r^2(2 - cos psi/2); P3 18 + r^2(2 -+ sin psi/2); dark 16 + r^2(2 + cos psi/2); "
                "weights (4,2,2,0); parity r^2(2 + 2cos psi); sigma_1^12 = id")
    cert.record("2 URT segment", "T_l = (1-l)Q + l P_sigma1: parity mass r^2(1 + 2 l cos psi + l^2), l in [0,1]")

    # ================================================================ Part 1 (float64 on the full 24 x 64 kernel)
    Qf = np.array(Hs.Q2(), dtype=float) / 2
    Pf = np.array(P, dtype=float)
    Bf = bridge_D0()
    ck(np.allclose(Bf.sum(0), 1) and np.allclose(Bf.sum(1), 1), "B_{D0} doubly stochastic")
    Hf = np.array(Hs.hbits(), dtype=float)
    G3f = np.array(G3n, dtype=float) / dG; G5f = np.array(G5n, dtype=float) / dG
    Hplus = np.linalg.pinv(Hf)
    tt, hh = np.meshgrid(np.arange(NT), np.arange(N), indexing="ij")
    y = np.cos(0.37 * tt + 0.11 * hh * hh) + 1j * np.sin(0.23 * tt * hh + 0.5)        # deterministic test field
    th_link = theta + 0.3 * np.sin(np.arange(NT))                                     # deterministic link angles
    alpha_small = 0.7 * np.cos(1.3 * np.arange(NT))
    alpha_large = 2 * math.pi * np.arange(NT) / NT                                     # winding-one large gauge

    def clock_term(T, yy, th):
        return sum(np.vdot(v, v).real for v in
                   (yy[(t + 1) % NT] - np.exp(2j * th[t]) * (T @ yy[t]) for t in range(NT)))

    def D_op(T, th):
        Dm = np.zeros((NT * N, NT * N), dtype=complex)
        for t in range(NT):
            u = (t + 1) % NT
            Dm[t * N:(t + 1) * N, u * N:(u + 1) * N] += np.eye(N)
            Dm[t * N:(t + 1) * N, t * N:(t + 1) * N] -= np.exp(2j * th[t]) * T
        return Dm

    carrier = np.kron(np.eye(NT), G3f + G5f)
    for name, T in (("I", np.eye(N)), ("Q", pull(Qf, D0)), ("P_sigma1", pull(Pf, D0)), ("B_D0", pull(Bf, D0))):
        base = clock_term(T, y, th_link)
        for al in (alpha_small, alpha_large):
            yg = y * np.exp(2j * al)[:, None]
            thg = th_link + np.roll(al, -1) - al
            ck(abs(clock_term(T, yg, thg) - base) < 1e-9 * base, f"{name}: clock term gauge covariant")
        Dm = D_op(T, np.full(NT, theta))
        K = np.kron(np.eye(NT), Hf) + r2 * (Dm.conj().T @ Dm)
        ck(np.linalg.eigvalsh(K - np.kron(np.eye(NT), Hf)).min() > -1e-10, f"{name}: K_T >= 1 (x) H")
        Ki = np.linalg.inv(K)
        gap = carrier @ (np.kron(np.eye(NT), Hplus) - Ki) @ carrier
        ck(np.linalg.eigvalsh((gap + gap.conj().T) / 2).min() > -1e-10,
           f"{name}: on the carrier K_T^-1 <= (1 (x) H)^+  (Schur bound V_4 >= (2/9)|h3|^2 + (7/32)D^2|h5|^2)")
        # 24-periodic mode decomposition
        Fm = np.fft.fft(y, axis=0) / math.sqrt(NT)
        four = 0.0
        for m in range(NT):
            psi = 2 * theta - 2 * math.pi * m / NT
            v = Fm[m] - np.exp(1j * psi) * (T @ Fm[m]); four += np.vdot(v, v).real
        ck(abs(four - clock_term(T, y, np.full(NT, theta))) < 1e-9 * four, f"{name}: exact clock-mode decoupling")
    cert.record("1 admissibility", "I, Q, P_sigma1, B_D0 all keep clock-gauge covariance (small + large), "
                "K_T >= 1(x)H (Q56 vacuum argument intact) and exact 24-mode decoupling")

    # ================================================================ Part 3 (closed forms vs direct inverses)
    def rey(X, D):
        Y = pull(X.astype(complex), D)
        return sum(Y[np.ix_(p, p)] for p in PERMS) / 60

    a = 18 + 1.5 * r2; ap = 18 + 2 * r2
    closed = {
        "I": (2 / r2 * F_N(24, 1 + 8 / r2, 2 * theta), 2 / r2 * F_N(24, 1 + 9 / r2, 2 * theta)),
        "Q": (12 / r2 * F_N(24, 5 + 48 / r2, 2 * theta),
              400 * a / r2 ** 2 * F_N(12, 50 * a * a / r2 ** 2 - 17 / 8, 4 * theta + math.pi)),
        "P_sigma1": (8 / r2 * F_N(24, 4 + 32 / r2, 2 * theta),
                     64 * ap / r2 ** 2 * F_N(12, 8 * ap * ap / r2 ** 2 - 1, 4 * theta + math.pi)),
    }
    w63f = np.array(w63, dtype=float)
    for D in orbit1:
        for name, T in (("I", np.eye(N)), ("Q", Qf), ("P_sigma1", Pf)):
            Gm, Om, Wm = rey(T.T @ T, D), rey(T + T.T, D), rey(T - T.T, D)
            S5 = S3 = 0.0
            for m in range(NT):
                psi = 2 * theta - 2 * math.pi * m / NT
                K = Hf + r2 * (np.eye(N) + Gm - math.cos(psi) * Om - 1j * math.sin(psi) * Wm)
                Ki = np.linalg.inv(K)
                S5 += np.trace(G5f @ Ki).real; S3 += np.trace(G3f @ Ki).real
                m63 = np.vdot(w63f, K @ w63f).real / 64
                pred = {"I": 2 - 2 * math.cos(psi), "Q": 1.0, "P_sigma1": 2 + 2 * math.cos(psi)}[name]
                ck(abs(m63 - r2 * pred) < 1e-9, f"{D} {name}: parity mass at mode {m}")
            c5, c3 = closed[name]
            ck(abs(S5 - c5) < 1e-9 * c5 and abs(S3 - c3) < 1e-9 * c3, f"{D} {name}: closed-form mode sums")
    vals = {k: (round(v[0], 12), round(v[1], 12)) for k, v in closed.items()}
    ck(len({v for v in vals.values()}) == 3, "the three laws give three different mode-summed source traces")
    cert.record("3 mode sums (S_5, S_3), internal units", vals)
    cert.record("3 holonomy", f"cos(48 theta) = {math.cos(48 * theta):.12f}")

    # ================================================================ Part 4 (float64, D0): the bridge law
    Gm, Om, Wm = rey(Bf.T @ Bf, D0), rey(Bf + Bf.T, D0), rey(Bf - Bf.T, D0)
    S5 = S3 = 0.0; m63s = []
    for m in range(NT):
        psi = 2 * theta - 2 * math.pi * m / NT
        K = Hf + r2 * (np.eye(N) + Gm - math.cos(psi) * Om - 1j * math.sin(psi) * Wm)
        Ki = np.linalg.inv(K); S5 += np.trace(G5f @ Ki).real; S3 += np.trace(G3f @ Ki).real
        m63s.append(np.vdot(w63f, K @ w63f).real / 64 / r2)
    for name, (c5, c3) in closed.items():
        ck(abs(S5 - c5) > 1e-6 and abs(S3 - c3) > 1e-6, f"bridge law differs from the {name} law")
    m0 = m63s[0]; pm = 2 + 2 * math.cos(2 * theta); im_ = 2 - 2 * math.cos(2 * theta)
    ck(min(abs(m0 - 1), abs(m0 - pm), abs(m0 - im_)) > 1e-3, "bridge parity Rayleigh quotient differs at m = 0")
    cert.record("4 bridge (D0)", {"S_5": round(S5, 12), "S_3": round(S3, 12), "parity/r^2 at m=0": round(m0, 9)})
    cert.record("verdict", "OBSTRUCTION: gauge covariance (incl. large gauge), the Q56 vacuum and 24-periodicity hold "
                "for every linear transport T; T = I (the original action), Q, P_sigma1, B_D0 give four different "
                "history laws, and the URT segment (1-l)Q + l P_sigma1 a continuous family. The transport is not forced.")
