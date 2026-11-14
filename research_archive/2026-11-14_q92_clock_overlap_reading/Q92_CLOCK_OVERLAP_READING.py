"""Q92 (ACTIVE PROBLEM A, attempt A3): the original clock Dirichlet term under the reading
"one clock step carries one URT history step".

Reading (stated, not derived): in the 2026-11-07 action the clock term is (1/2) r^2 sum_t |y_{t+1} - e^{2i theta} y_t|^2
(y_t in C^64, t mod 24, r = pi/e, theta = 2 pi/phi^2; `direct_history_energy`).  Under the reading, the history
moves one URT step with each clock step, i.e. the covariant difference becomes y_{t+1} - e^{2i theta} Q y_t.
On the clock Fourier mode y_t = e^{2 pi i m t/24} f this is |f - e^{i psi_m} Q f|^2 with
psi_m = 2 theta - 2 pi m/24, a Hermitian form f^* M(psi) f,
    M(psi) = I + Q^T Q - cos(psi)(Q + Q^T) - i sin(psi)(Q - Q^T).
A5-averaged through a selected dictionary (Reynolds, as in Q86/Q91), the history kernel of mode m is
    K(psi) = H + r^2 Mbar(psi),   Mbar(psi) = I + G_1 - cos(psi) O - i sin(psi) W,
with G_1 = Reynolds[Q^T Q], O = Reynolds[Q + Q^T], W = Reynolds[Q - Q^T].
(The literal substitution y_{t+1} -> Q y_t in one tick gives the same family with psi = -2 theta.)

Everything below is exact (integers / Fractions) on all 8 orbit-1 classes, except Part 5 (float64 cross-checks).

Part 1  W (the A5-averaged chronology current) lives entirely inside the Walsh-3 quartet block: E_3 W E_3 = W.
        O, G_1 commute with E_2, E_3, E_4; O = 1/3, -1/6 and G_1 = 2/3, 1/3 on the Walsh-2/-4 quartets, G_1 = 1/2 on
        Walsh 3.  With A := E_3 O E_3 (traceless):  A^2 = (9/400) E_3,  W^2 = -(1/16) E_3,  AW + WA = 0.
Part 2  Spectrum of K(psi) on the quartet isotypic V (each value with multiplicity 4):
            P5 (Walsh 2): 16 + r^2 (5 - cos psi)/3
            P3 pair     : 18 + r^2 [3/2 -+ sqrt(9 + 16 sin^2 psi)/20]
            dark (W 4)  : 16 + r^2 (8 + cos psi)/6
        and K(psi) w63 = r^2 w63 (parity history, every psi), K(psi) w0 = r^2 (2 - 2 cos psi) w0.
Part 3  Source weights tr(Pi_branch U_h P_s U_h^T) are exactly (4, 2, 2, 0) at every psi: tr(G3 A) = 0 and
        tr(G3 W) = 0, so the P3 source splits 2 + 2 on the two (psi-dependent, complex) Walsh-3 branches.
Part 4  K(psi)|_V lies in span_C{P_V, H, Abar_1} iff psi = 0 mod 2 pi, and then K = H + r^2 Abar_1, i.e. c = r^2.
        At the native golden holonomy no clock mode has psi_m = 0 mod 2 pi (48/phi^2 = 96 - 48 phi is irrational).
Part 5  float64: the Fourier identity of the reading's clock term on the original Q, and the Part-2 spectrum and
        Part-3 weights by direct diagonalisation of K(psi_m) on D0 at all 24 native modes.
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

with redirect_stdout(StringIO()):
    Z = runpy.run_path(str(ROOT / "research_archive/2026-11-13_q82_oriented_source_weights/"
                           "Q82_ORIENTED_SOURCE_WEIGHTS_CERTIFICATE.py"))
E = {k: np.array(Z["Ek"][k], dtype=object) for k in (2, 3, 4)}       # 960 E_k (code coordinates)
G3n = np.array(Z["G3n"], dtype=object); G5n = np.array(Z["G5n"], dtype=object); dG = int(Z["dG"])  # dG * U_h P_s U_h^T
Q2 = np.array(Hs.Q2(), dtype=object)                                  # 2Q
I = np.eye(N, dtype=np.int64).astype(object)
HB = np.array(Hs.hbits(), dtype=object)
w63 = np.array([(-1) ** bin(h).count("1") for h in range(N)], dtype=object)
w0 = np.ones(N, dtype=object)


def twirl(X, D):
    """sum over the 60 code rotations of X pulled back through D (= 60 Reynolds[X])."""
    idx = np.array(Hs.dictionary_index(D))
    Y = np.zeros((N, N), dtype=object); Y[np.ix_(idx, idx)] = X
    return sum(Y[np.ix_(p, p)] for p in PERMS)


def eq(X, Y):
    return bool((np.asarray(X, dtype=object) == np.asarray(Y, dtype=object)).all())


def trp(X, Y):
    return sum(int(a) for a in (np.asarray(X, dtype=object) * np.asarray(Y, dtype=object).T).ravel())


with Certificate("Q92_clock_overlap_reading", __file__) as cert:
    ck = cert.check
    orbit1 = Hs.selected_orbit()["classes"]
    ck(D0 in orbit1 and len(orbit1) == 8, "orbit 1 = 8 classes")
    for k in (2, 3, 4):
        ck(eq(E[k] @ E[k], 960 * E[k]), f"E_{k} idempotent")
    ck(eq(E[3] @ G3n, 960 * G3n) and eq(E[2] @ G5n, 960 * G5n), "P3 source inside Walsh-3 quartet, P5 inside Walsh-2")
    ck(Fr(trp(E[3], G3n), 960 * dG) == 4 and Fr(trp(E[2], G5n), 960 * dG) == 4, "tr U_h P_s U_h^T = 4")
    Hsc = {2: 16, 3: 18, 4: 16}
    for k in (2, 3, 4):
        ck(eq(HB @ E[k], Hsc[k] * E[k]) and eq(E[k] @ HB, Hsc[k] * E[k]), f"H = {Hsc[k]} on quartet block {k}")
    ck(not (HB @ w63).any() and not (HB @ w0).any(), "H w0 = H w63 = 0")

    summary = None
    for D in orbit1:
        O = twirl(Q2 + Q2.T, D)                       # 120 O
        W = twirl(Q2 - Q2.T, D)                       # 120 W
        G = twirl(Q2.T @ Q2, D)                       # 240 G_1
        A1 = twirl((2 * I - Q2).T @ (2 * I - Q2), D)  # 240 Abar_1
        # ---------------- Part 1
        ck(eq(W.T, -W) and eq(O.T, O) and eq(G.T, G), f"{D}: W antisymmetric, O and G_1 symmetric")
        ck(eq(E[3] @ W @ E[3], 960 * 960 * W), f"{D}: W = E_3 W E_3 (current only on the Walsh-3 quartet)")
        ck(W.any(), f"{D}: W != 0")
        for k in (2, 3, 4):
            ck(eq(O @ E[k], E[k] @ O) and eq(G @ E[k], E[k] @ G), f"{D}: O, G_1 commute with E_{k}")
        ck(eq(E[2] @ O, 40 * E[2]) and eq(E[4] @ O, -20 * E[4]), f"{D}: O = 1/3, -1/6 on Walsh-2/-4 quartets")
        ck(eq(E[2] @ G, 160 * E[2]) and eq(E[3] @ G, 120 * E[3]) and eq(E[4] @ G, 80 * E[4]),
           f"{D}: G_1 = 2/3, 1/2, 1/3 on Walsh-2/-3/-4 quartets")
        ck(eq(A1, 240 * I + G - 2 * O), f"{D}: Abar_1 = I + G_1 - O")
        A = E[3] @ O                                  # 960*120 A,  A = E_3 O E_3
        ck(sum(A[i, i] for i in range(N)) == 0, f"{D}: tr A = 0")
        # A^2 = (9/400) E_3:  (960*120)^2 * 9/400 / 960 * (960 E_3)
        ck(eq(400 * (A @ A), 9 * 960 * 120 * 120 * E[3]), f"{D}: A^2 = (9/400) E_3")
        ck(eq(16 * 960 * (W @ W), -120 * 120 * E[3]), f"{D}: W^2 = -(1/16) E_3")
        ck(not (A @ W + W @ A).any(), f"{D}: A W + W A = 0")
        # ---------------- Part 2: parity and constant histories
        ck(not (O @ w63).any() and not (W @ w63).any() and not (G @ w63).any(), f"{D}: O, W, G_1 annihilate w63")
        ck(eq(O @ w0, 240 * w0) and not (W @ w0).any() and eq(G @ w0, 240 * w0), f"{D}: O w0 = 2 w0, W w0 = 0, G_1 w0 = w0")
        # ---------------- Part 3: source weights
        ck(trp(G3n, A) == 0, f"{D}: tr(G3 A) = 0")
        ck(trp(G3n, W) == 0, f"{D}: tr(G3 W) = 0")
        ck(trp(G5n, E[3]) == 0 and trp(G5n, E[4]) == 0 and trp(G3n, E[2]) == 0 and trp(G3n, E[4]) == 0,
           f"{D}: sources have no weight on the other blocks")
        # ---------------- Part 4 inputs: T_{Abar_1} = -A != 0; G_1 is scalar on Walsh 3 but 2/3 != 1/3 on Walsh 2/4
        ck(A.any(), f"{D}: A = -T_{{Abar_1}} != 0")
        data = (Fr(2, 3), Fr(1, 3), Fr(1, 3), Fr(-1, 6))
        summary = data if summary is None else summary
        ck(summary == data, "identical quartet data on all 8 classes")
    cert.record("1 structure", "all 8 orbit-1 classes: W = E3 W E3; A^2 = 9/400 E3, W^2 = -1/16 E3, AW + WA = 0; "
                "O = 1/3, -1/6 and G_1 = 2/3, 1/3 on Walsh-2/-4; G_1 = 1/2 on Walsh 3")
    cert.record("2 spectrum on V", "P5 16 + r^2(5 - cos psi)/3; P3 18 + r^2[3/2 -+ sqrt(9 + 16 sin^2 psi)/20]; "
                "dark 16 + r^2(8 + cos psi)/6; parity r^2; constant r^2(2 - 2cos psi)")
    cert.record("3 weights", "(4, 2, 2, 0) at every psi")

    # ---------------- Part 4: span membership.  Proof steps (each input checked above):
    # K = S + iT with S real symmetric, T = -r^2 sin(psi) W real antisymmetric.  span_C of real symmetric matrices
    # has antisymmetric part 0, so membership needs sin(psi) W|_V = 0, i.e. sin psi = 0 (W != 0 on V).
    # Real part: S = H + r^2[(1 - cos psi)(I + G_1) + cos psi Abar_1].  If (1 - cos psi) != 0 then G_1|_V would be in
    # span{P_V, H, Abar_1}: its Walsh-3 traceless part is 0 = gamma T_{Abar_1} forces gamma = 0, and then the Walsh-2 and
    # Walsh-4 values (P_V, H give equal values 1, 16 on both) would agree, but G_1 gives 2/3 != 1/3.  So cos psi = 1.
    ck(Fr(2, 3) != Fr(1, 3), "G_1 separates Walsh 2 from Walsh 4; P_V and H do not")
    # psi = 0: Mbar = Abar_1 exactly (I + G_1 - O), so K(0) = H + r^2 Abar_1.
    # Golden holonomy: psi_m = 2 theta - 2 pi m/24 = 0 mod 2 pi iff 24*2theta/(2pi) = 48/phi^2 is an integer;
    # 1/phi^2 = 2 - phi, so 48/phi^2 = 96 - 48 phi, irrational because phi = (1 + sqrt5)/2 and 5 is not a square.
    ck(all(k * k != 5 for k in range(3)), "5 is not a perfect square (phi irrational)")
    cert.record("4 span", "K(psi)|_V in span_C{P_V, H, Abar_1} iff psi = 0 mod 2pi, then c = r^2 = (pi/e)^2; "
                "no native golden clock mode has psi_m = 0")

    # ---------------- Part 5: float64 cross-checks
    phi = (1 + 5 ** 0.5) / 2; r = math.pi / math.e; theta = 2 * math.pi / phi ** 2
    Qf = np.array(Hs.Q2(), dtype=float) / 2
    # 5a: reading's clock term vs its Fourier form, deterministic test vectors (no Cathedral operator replaced)
    tt, hh = np.meshgrid(np.arange(24), np.arange(N), indexing="ij")
    y = np.cos(0.37 * tt + 0.11 * hh * hh) + 1j * np.sin(0.23 * tt * hh + 0.5)
    direct = sum(np.vdot(v, v).real for v in (y[(t + 1) % 24] - np.exp(2j * theta) * (Qf @ y[t]) for t in range(24)))
    F = np.fft.fft(y, axis=0) / np.sqrt(24)          # F[m] = (1/sqrt24) sum_t e^{-2pi i m t/24} y_t
    four = 0.0
    for m in range(24):
        f = F[m]; psi = 2 * theta - 2 * math.pi * m / 24
        Mm = np.eye(N) + Qf.T @ Qf - np.exp(1j * psi) * Qf - np.exp(-1j * psi) * Qf.T
        four += np.vdot(f, Mm @ f).real
    ck(abs(direct - four) < 1e-9 * max(1.0, direct), "reading's clock term = sum_m f_m^* M(psi_m) f_m")
    # 5b: spectrum and weights at all 24 native modes on D0
    idx = np.array(Hs.dictionary_index(D0))

    def rey(X):
        Y = np.zeros((N, N), dtype=complex); Y[np.ix_(idx, idx)] = X
        return sum(Y[np.ix_(p, p)] for p in PERMS) / 60

    Gf, Of, Wf = rey(Qf.T @ Qf), rey(Qf + Qf.T), rey(Qf - Qf.T)
    Ef = {k: np.array(E[k], dtype=float) / 960 for k in (2, 3, 4)}
    G3f = np.array(G3n, dtype=float) / dG
    Hf = np.array(Hs.hbits(), dtype=float)
    worst, rows = 0.0, []
    for m in range(24):
        psi = 2 * theta - 2 * math.pi * m / 24
        K = Hf + r * r * (np.eye(N) + Gf - math.cos(psi) * Of - 1j * math.sin(psi) * Wf)
        ck(np.abs(K - K.conj().T).max() < 1e-12, "K Hermitian")
        lam = math.sqrt(9 + 16 * math.sin(psi) ** 2) / 20
        pred = {2: [16 + r * r * (5 - math.cos(psi)) / 3],
                4: [16 + r * r * (8 + math.cos(psi)) / 6],
                3: [18 + r * r * (1.5 - lam), 18 + r * r * (1.5 + lam)]}
        for k in (2, 4):
            ev = np.linalg.eigvalsh(Ef[k] @ K @ Ef[k])[-4:]
            worst = max(worst, np.abs(ev - pred[k][0]).max())
        ev, vec = np.linalg.eigh(Ef[3] @ K @ Ef[3])
        top = ev[-8:]; V3 = vec[:, -8:]
        worst = max(worst, np.abs(top[:4] - pred[3][0]).max(), np.abs(top[4:] - pred[3][1]).max())
        wts = [np.trace(V3[:, s].conj().T @ G3f @ V3[:, s]).real for s in (slice(0, 4), slice(4, 8))]
        ck(abs(wts[0] - 2) < 1e-9 and abs(wts[1] - 2) < 1e-9, f"P3 weights 2, 2 at mode {m}")
        ck(abs(np.vdot(w63.astype(float), K @ w63.astype(float)).real / 64 - r * r) < 1e-9, "parity energy r^2")
        rows.append((m, round(psi % (2 * math.pi), 6), round(pred[2][0], 6), round(pred[3][0], 6),
                     round(pred[3][1], 6), round(pred[4][0], 6)))
    ck(worst < 1e-9, f"Part-2 spectrum matches direct diagonalisation at all 24 modes (max err {worst:.1e})")
    ck(min(abs(math.remainder(2 * theta - 2 * math.pi * m / 24, 2 * math.pi)) for m in range(24)) > 0.05,
       "no native mode near psi = 0 (float64 illustration of Part 4)")
    cert.record("5 float64 (m, psi, P5, P3-, P3+, dark) for m = 0, 1, 23", [rows[0], rows[1], rows[23]])
    cert.record("verdict", "under the reading the clock term fixes the overlap weight: K(0) = H + (pi/e)^2 Abar_1, "
                "but the native golden holonomy excludes psi = 0; at every native mode the law is the psi-family above "
                "with weights (4,2,2,0) and parity mass (pi/e)^2")
