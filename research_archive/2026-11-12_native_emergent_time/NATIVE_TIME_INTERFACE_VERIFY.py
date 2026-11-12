#!/usr/bin/env python3
"""Native H64 / 24-fibre / modular-time audit, 12 Nov 2026.

Uses the EXACT archived named Cathedral operators (no synthetic matrices).
The phase-bin clock dictionary is CONDITIONAL; this is not physical seconds.
Independent sandbox reconstruction was executed before this archive-integrated check.
"""
from pathlib import Path
from fractions import Fraction
import contextlib
import io
import runpy
import numpy as np
import sympy as sp

ROOT = Path(__file__).resolve().parents[2]
ARCH = ROOT / "research_archive/2026-11-10_urt_arf_forward/forward"

def load(name):
    with contextlib.redirect_stdout(io.StringIO()):
        return runpy.run_path(str(ARCH / name))

m = load("cathedral_constructed_joint_dynamics_2026_11_07.py")
clock = load("URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py")
source = load("URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py")
P3, P5 = m["P3"], m["P5"]
Uh, Hb = m["Uh"], m["Hbits"]
B = clock["B"]
Delta = m["Delta"]
eta = -np.log(Delta)
assert np.linalg.norm(m["Eglobal"].T @ m["Eglobal"] - np.eye(8)) < 1e-12
assert np.linalg.norm(Hb @ Uh @ P3 - 18 * Uh @ P3) < 1e-10
assert np.linalg.norm(Hb @ Uh @ P5 - 16 * Uh @ P5) < 1e-10
assert np.linalg.norm(Uh.T @ Uh - (P3 + P5)) < 1e-11

R3, R5 = source["R3"], source["R5"]
c3, c5 = source["coef3"], source["coef5"]
H = (R3 / np.sqrt(c3) + R5 / np.sqrt(c5)) / 8
assert np.linalg.norm(H.T @ H - (P3 + P5)) < 1e-12
T = H.T @ B.T @ B @ H
assert np.linalg.eigvalsh(T).min() > -1e-12
assert np.linalg.eigvalsh(T).max() < 1 + 1e-12
cross = P3 @ T @ P5
cross_norm = np.linalg.norm(cross, "fro")
assert abs(cross_norm - 0.1478126046742381) < 1e-10
Lhid = 3 * P3 + 5 * P5
comm = np.linalg.norm(Lhid @ T - T @ Lhid, "fro")
assert abs(comm - 2 * np.sqrt(2) * cross_norm) < 1e-10
assert abs(comm - 0.41807718044000053) < 1e-10

u_all, sing, v_all = np.linalg.svd(cross)
u = P3 @ u_all[:, 0]
v = P5 @ v_all[0, :]
u /= np.linalg.norm(u)
v /= np.linalg.norm(v)
sigma = sing[0]
mean = (u @ T @ u + v @ T @ v) / 2
assert abs(sigma - 0.12592580988966356) < 1e-10
assert abs(sigma / mean - 0.45983415026166446) < 1e-10
for t in [0.0, 0.2, 1.0, 2.0, 3.0]:
    psi = (u + np.exp(2j * t) * v) / np.sqrt(2)
    assert abs(float(np.vdot(psi, T @ psi).real) - (mean + sigma * np.cos(2*t))) < 1e-10

# Crucially: rebuild the exact hidden projectors from the INTEGER incidence,
# not a floating approximation or rational guesses.
C = sp.Matrix(np.rint(m["C"]).astype(int).tolist())
L = sp.Matrix(np.rint(m["Lface"]).astype(int).tolist())
Ph = sp.eye(20) - C * (C.T*C).inv() * C.T
p3 = Ph * (5*sp.eye(20) - L)/2
p5 = Ph * (L - 3*sp.eye(20))/2
M = sp.Matrix(np.rint(m["M"]).astype(int).tolist())
assert np.linalg.norm(np.asarray(p3).astype(float) - P3) < 1e-12
assert np.linalg.norm(np.asarray(p5).astype(float) - P5) < 1e-12
Q = sp.zeros(64,64)
for h in range(64):
    Q[h, (2*h) % 64] += sp.Rational(1,2)
    Q[h, (2*h) % 64 + 1] += sp.Rational(1,2)
assert Q**6 == sp.ones(64,64)/64
assert sp.ones(1,64) * M * Ph == sp.zeros(1,20)

# Uh = M Ph / sqrt(2).  Radical drops out of all quadratic expressions.
A = Ph * M.T * Q * M * Ph / 2
J = Ph * M.T * Q.T * Q * M * Ph / 2
assert p3*A*p5 == sp.zeros(20,20)
assert p5*A*p3 == sp.zeros(20,20)
assert sp.trace(p3 * (J-A.T*A) * p3) == sp.Rational(34,25)
assert sp.trace(p5 * (J-A.T*A) * p5) == sp.Rational(436,225)
assert (p3*A*p3).rank() == 3
assert (p5*A*p5).rank() == 4

print("EXACT rational: Q^6=J/64; two hidden-sector Q contacts vanish")
print("EXACT rational leakage squares: P3=34/25, P5=436/225")
print("Native source-clock cross sector norm:", cross_norm)
print("Native modular/hidden-energy commutator:", comm)
print("Conditional optimal phase fringe visibility:", float(sigma/mean))
print("STATUS: finite internal/conditional only; no physical seconds or metric derived")
