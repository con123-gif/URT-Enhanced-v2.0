#!/usr/bin/env python3
"""Koide phase: pre-registered mechanisms P1-P6 (PHASE_PREREGISTRATION.md, sha256 014c3dfa...).

Q = 2/3 is taken as derived (50/50 coherent/exhaust split). Data enter only at comparison.
NumPy + SciPy only.
"""
import itertools
from fractions import Fraction
import numpy as np
from scipy.linalg import qr
from scipy.optimize import brentq, minimize_scalar

pi, r2 = np.pi, np.sqrt(2)
phi = (1 + 5 ** 0.5) / 2
dstar_cath = (80 / 81) * pi / (13 * phi)
Delta = 3 / 20 - 80 * pi / (1053 * phi)
me, rmu, mt, dmt, drmu = 0.51099895069, 206.7682827, 1776.93, 0.09, 4.6e-6


def sq(d, r=r2):                                       # k = 0 tau, 1 e, 2 mu
    return np.array([1 + r * np.cos(d + 2 * pi * k / 3) for k in range(3)])


def mu_e(d, r=r2):
    s = sq(d, r)
    return (s[2] / s[1]) ** 2


ds = brentq(lambda d: mu_e(d) - rmu, 0.2, 0.25, xtol=1e-16)
sds = abs(brentq(lambda d: mu_e(d) - rmu - drmu, 0.2, 0.25, xtol=1e-16) - ds)
arc = (1e-9, pi / 12 - 1e-9)
print("=" * 78)
print(f"TARGET  delta* = {ds:.12f} +- {sds:.1e}  (Q = 2/3); physical arc 0 < delta < pi/12 = {pi/12:.6f}")

# ---------------------------------------------------------------- structure
p = sq(ds) / 3
e3 = np.prod(p)
err = max(abs(np.prod(sq(d) / 3) - (r2 * np.cos(3 * d) - 1) / 54) for d in np.linspace(0, pi / 12, 101))
lep = np.sqrt([me, rmu * me, mt])
print("STRUCTURE")
print(f"   on the Koide circle sum p = 1 and sum p^2 = 2/3 are fixed, so every symmetric function of the weights")
print(f"   depends on delta only through e3 = p_e p_mu p_tau = (sqrt2 cos3delta - 1)/54   (max error {err:.0e})")
print(f"   phase target as one number: e3* = sqrt(m_e m_mu m_tau)/(sum sqrt m)^3 = {e3:.12f}"
      f"  (direct from data: {np.prod(lep)/lep.sum()**3:.9f})")
print(f"   electron: pi/12 - delta* = {pi/12-ds:.9f};  3 p_e = {3*p[1]:.9f}  -> the phase is the electron's share")

rows = []


def report(name, d, extra=""):
    z = (d - ds) / sds
    ok = abs(z) < 3
    rows.append((name, ok))
    print(f"   {name:58s} delta = {d:.9f}  {z:+.2e} sigma  {'PASS' if ok else 'FAIL'} {extra}")


print("=" * 78)
print("PRE-REGISTERED MECHANISMS")
# P1, P2
H = lambda w: -np.sum(w * np.log(w))
for lab, f in [("P1 max entropy of sqrt-mass weights", lambda d: -H(sq(d) / 3)),
               ("P2 max entropy of mass weights", lambda d: -H(sq(d) ** 2 / (sq(d) ** 2).sum()))]:
    grid = np.linspace(*arc, 200001)
    vals = np.array([f(d) for d in grid])
    i = np.argmin(vals)
    note = {0: "(arc end delta=0: m_e = m_mu)", len(grid) - 1: "(arc end delta=pi/12: m_e = 0)"}.get(i, "(interior)")
    report(lab, grid[i], note)
# P3
for lab, Om in [("icosahedron face", 4 * pi / 20), ("dodecahedron face", 4 * pi / 12),
                ("cube face (octant)", 4 * pi / 8), ("tetrahedron face", 4 * pi / 4)]:
    d = Om / 2 / 3
    report(f"P3 spin-1/2 Bargmann phase, {lab}", d, "" if d < pi / 12 else "(off the arc: a negative sqrt-mass)")


# P4
def phase_k(k):
    return np.exp(1j * pi * k / 2) if k < 4 else np.exp(2j * pi * (k - 4) / 5)


for L in (3, 13):
    raw = np.array([[np.exp(2j * pi * dstar_cath * k * n / L) * phase_k(k) for n in range(3)] for k in range(3)])
    Psi = qr(raw.T)[0].T

    def f(d, order):
        x = sq(d)[list(order)]
        C = Psi @ x
        return abs(C[1]) ** 2 - abs(C[2]) ** 2

    allroots = {}
    for order in itertools.permutations(range(3)):
        g = np.linspace(*arc, 20001)
        v = np.array([f(d, order) for d in g])
        allroots[order] = [brentq(f, g[i], g[i + 1], args=(order,), xtol=1e-15)
                           for i in np.where(np.sign(v[:-1]) * np.sign(v[1:]) < 0)[0]]
    gen = allroots[(1, 2, 0)]                          # sites 0,1,2 = e, mu, tau (generation order)
    if gen:
        for d in gen:
            report(f"P4 hierarchical max entropy, L={L}, sites (e,mu,tau)", d)
    else:
        rows.append((f"P4 L={L}", False))
        print(f"   P4 hierarchical max entropy, L={L}, sites (e,mu,tau)              no root on the physical arc  FAIL")
    other = sorted(r for o, rs in allroots.items() if o != (1, 2, 0) for r in rs)
    print(f"      other site orderings: roots {np.round(other, 6).tolist() if other else 'none'}"
          f"; nearest |delta - delta*| = {min([abs(r-ds) for r in other], default=np.nan):.2e}")
# P5
report("P5(i) 3 delta = Q with Q = 2/3", 2 / 9)


def mu_e_law(Qv):
    return mu_e(Qv / 3, np.sqrt(6 * Qv - 2))


Ql = brentq(lambda Qv: mu_e_law(Qv) - rmu, 0.6, 0.7, xtol=1e-16)
s = sq(Ql / 3, np.sqrt(6 * Ql - 2))
mt_law = me * (s[0] / s[1]) ** 2
zt = (mt_law - mt) / dmt
rows.append(("P5(ii)", abs(zt) < 3))
print(f"   P5(ii) 3 delta = Q, Q free: Q = {Ql:.10f} ({Ql-2/3:+.2e}), m_tau = {mt_law:.4f} MeV"
      f"  {zt:+.2f} sigma  {'PASS' if abs(zt)<3 else 'FAIL'}  (not a derivation: the law itself is assumed)")
# P6
P5w = Delta ** 2 / (1 + Delta ** 2)
d6 = (2 / 9) * (1 - (2 / (5 * pi)) * P5w)
report("P6 repo screening formula (2/9)(1 - (2/(5pi)) Delta^2/(1+Delta^2))", d6, "(numerical match)")
cstar = (1 - ds / (2 / 9)) / P5w
win = 3 * sds / ((2 / 9) * P5w)
vals = set()
for pn in range(1, 13):
    for qn in range(1, 13):
        if Fraction(pn, qn).denominator != qn:
            continue
        for a in range(-2, 3):
            for b in range(-2, 3):
                vals.add(round(pn / qn * pi ** a * phi ** b, 12))
vals = np.array(sorted(vals))
hits = vals[np.abs(vals - cstar) < win]
dens = np.sum((vals > 0.5 * cstar) & (vals < 2 * cstar)) / (1.5 * cstar)
print(f"   P6 look-elsewhere: needed coefficient c* = {cstar:.6f} +- {win:.6f} (3 sigma, {100*win/cstar:.2f}%)")
print(f"      {len(vals)} simple constants (p/q) pi^a phi^b; inside the window: {len(hits)} -> {np.round(hits, 6).tolist()}")
print(f"      expected chance hits from their density near c*: {dens*2*win:.2f}")
print("=" * 78)
npass = sum(ok for _, ok in rows)
print(f"RESULT: {npass} of {len(rows)} pre-registered entries pass; derivations among them: "
      f"{sum(ok for n, ok in rows if n.startswith(('P1','P2','P3','P4')))}")
