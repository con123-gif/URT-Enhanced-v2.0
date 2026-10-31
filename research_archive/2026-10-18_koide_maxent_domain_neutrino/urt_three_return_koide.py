#!/usr/bin/env python3
"""The URT's own three-return as the Koide generation cycle (URT_PHASE_PREREGISTRATION.md, sha256 96c06e83...).

URT dynamics from the repo: logistic map at r_URT = 3.84167378699470935954 (framework_core.engine_invariants).
NumPy only. Data enter only at the comparison.
"""
import numpy as np
from numpy.polynomial import Polynomial as P

r_URT = 3.84167378699470935954
phi = (1 + 5 ** 0.5) / 2
d_star = (80 / 81) * np.pi / (13 * phi)


def Q(x):
    x = np.asarray(x, float)
    return (x ** 2).sum() / x.sum() ** 2


def lode(x):
    t = np.asarray(x, float) - np.mean(x)
    return np.arccos(np.clip(np.sqrt(6) * (t ** 3).sum() / ((t ** 2).sum()) ** 1.5, -1, 1)) / 3


def brannen(x):
    x = np.asarray(x, float)
    c1 = np.sum(x * np.exp(-2j * np.pi * np.arange(3) / 3)) / 3
    return 2 * abs(c1) / x.mean(), lode(x)


me, rmu, mt, dmt = 0.51099895069, 206.7682827, 1776.93, 0.09
lep, lep2 = np.sqrt([me, rmu * me, mt]), np.sqrt([me, rmu * me, mt + dmt])
Qm, dQ, Dm, dD = Q(lep), abs(Q(lep2) - Q(lep)), lode(lep), abs(lode(lep2) - lode(lep))


def three_cycles(r):
    f = P([0, r, -r])
    g = f(f(f)) - P([0, 1])
    roots = [z.real for z in g.roots() if abs(z.imag) < 1e-9 and -1e-12 < z.real < 1 + 1e-12]
    fixed = [0.0, 1 - 1 / r]
    pts = sorted(z for z in roots if min(abs(z - p) for p in fixed) > 1e-7)
    cycles = []
    while pts:
        x = pts.pop(0)
        orb = [x, f(x), f(f(x))]
        pts = [p for p in pts if min(abs(p - o) for o in orb) > 1e-7]
        mult = np.prod([r * (1 - 2 * o) for o in orb])
        cycles.append((orb, mult))
    return cycles


rows = []


def judge(name, x, as_mass=False):
    x = np.sqrt(x) if as_mass else np.asarray(x, float)
    q, d = Q(x), lode(x)
    ok = abs(q - Qm) < 3 * dQ and abs(d - Dm) < 3 * dD
    rows.append(ok)
    eps, th = brannen(x)
    print(f"   {name:46s} Q = {q:.6f} ({(q-Qm)/dQ:+.0f} sigma)  delta = {d:.6f} ({(d-Dm)/dD:+.0f} sigma)"
          f"  eps = {eps:.5f}  {'PASS' if ok else 'FAIL'}")


print("=" * 78)
print(f"URT map: f(x) = r x (1-x), r_URT = {r_URT:.17f};  delta_star = {d_star:.12f}")
print(f"targets: Q = {Qm:.8f} +- {dQ:.1e}, delta = {Dm:.8f} +- {dD:.1e}; Koide needs eps = sqrt2 = 1.41421")
x = 0.5
for _ in range(200000):
    x = r_URT * x * (1 - x)
six = [x]
for _ in range(5):
    six.append(r_URT * six[-1] * (1 - six[-1]))
print(f"stable 6-cycle (orbit order): {np.round(six, 9).tolist()}")
print(f"   lowest point vs delta_star: {min(six)-d_star:+.1e}")
cyc = three_cycles(r_URT)
for orb, mult in cyc:
    kind = "parent of the URT 6-cycle (doubled)" if mult < -1 else "saddle partner"
    print(f"period-3 orbit, {kind}: {np.round(orb, 9).tolist()}  multiplier {mult:+.4f}")
print("=" * 78)
print("PRE-REGISTERED TESTS")
for orb, mult in cyc:
    tag = "parent" if mult < -1 else "saddle"
    judge(f"U1 period-3 orbit ({tag}) as sqrt-masses", orb)
    judge(f"U2 period-3 orbit ({tag}) as masses", orb, as_mass=True)
judge("U3 6-cycle even-step three-cycle as sqrt-masses", six[0::2])
judge("U3 6-cycle odd-step three-cycle as sqrt-masses", six[1::2])
print("=" * 78)
print("CONTROL: period-3 orbits across the whole period-3 window")
lo, hi = 1 + np.sqrt(8) + 1e-9, 3.857
qs, ds_, near = [], [], []
for r in np.linspace(lo, hi, 4001):
    for orb, mult in three_cycles(r):
        qs.append(Q(orb)); ds_.append(lode(orb))
        near.append((abs(Q(orb) - 2 / 3), r, Q(orb), lode(orb)))
best = min(near)
print(f"   as sqrt-masses: Q ranges {min(qs):.4f}..{max(qs):.4f}; delta ranges {min(ds_):.4f}..{max(ds_):.4f}")
print(f"   closest approach to Q = 2/3 anywhere in the window: Q = {best[2]:.4f} at r = {best[1]:.5f}")
print("=" * 78)
print(f"RESULT: {sum(rows)} of {len(rows)} pass")
