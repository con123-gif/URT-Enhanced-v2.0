#!/usr/bin/env python3
"""Can the Cathedral Transform be modified to give Koide without fitting?  (18 Oct 2026)

Section 1: the transform rebuilt on the generation triangle (N = 3), formula unchanged otherwise.
Section 2: the only free knob (the twist) tested as a phase source, with a fit control.
Data enter only at the comparison step. NumPy + SciPy only.
"""
import numpy as np
from scipy.linalg import qr
from scipy.optimize import brentq

pi = np.pi
phi = (1 + 5 ** 0.5) / 2
dstar_cath = (80 / 81) * pi / (13 * phi)              # the transform's delta_star
rng = np.random.default_rng(20261018)


def phase(k):
    return np.exp(1j * pi * k / 2) if k < 4 else np.exp(2j * pi * (k - 4) / 5)


def transform(N, twist, phases=None):
    ph = [phase(k) for k in range(N)] if phases is None else phases
    raw = np.array([[np.exp(2j * pi * twist * k * n / N) * ph[k] for n in range(N)] for k in range(N)])
    return qr(raw.T)[0].T                               # rows psi_k: C_k = sum_n x_n psi_k(n)


def Q(lam):
    lam = np.asarray(lam, float)
    return (lam ** 2).sum() / lam.sum() ** 2


def lode(lam):
    t = np.asarray(lam, float) - np.mean(lam)
    return np.arccos(np.clip(np.sqrt(6) * (t ** 3).sum() / ((t ** 2).sum()) ** 1.5, -1, 1)) / 3


def koide(d):
    return np.array([1 + np.sqrt(2) * np.cos(d + 2 * pi * k / 3) for k in range(3)])


me, rmu, mt, dmt = 0.51099895069, 206.7682827, 1776.93, 0.09
x_lep = np.sqrt([mt, me, rmu * me])                     # sqrt-mass field on the 3 generation sites
Qm = Q(x_lep)
dQ = abs(Q(np.sqrt([mt + dmt, me, rmu * me])) - Qm)
dstar = brentq(lambda d: (koide(d)[2] / koide(d)[1]) ** 2 - rmu, 0.2, 0.25, xtol=1e-16)

print("=" * 78)
print("1) THE TRANSFORM ON THE GENERATION TRIANGLE  (N = 3, same formula: k = 0 coherent, k = 1,2 exhaust)")
J = np.ones((3, 3)) / 3
worst = 0.0
for t in [dstar_cath] + list(rng.uniform(0.01, 0.99, 2000)):
    for ph in [None, list(np.exp(2j * pi * rng.uniform(size=3)))]:
        U3 = transform(3, t, ph)
        Pcoh = np.outer(U3[0].conj(), U3[0])
        worst = max(worst, np.abs(Pcoh - J).max())
print(f"   coherent mode = uniform vector, exhaust = traceless plane, for every twist and every phi_k:"
      f" max error {worst:.1e}")
U3 = transform(3, dstar_cath)
err = 0.0
for _ in range(2000):
    x = rng.uniform(0.01, 3, 3)
    C = U3 @ x
    err = max(err, abs(abs(C[0]) ** 2 / (x @ x) - 1 / (3 * Q(x))))
print(f"   identity: coherent power fraction p = |C_0|^2 / sum|C_k|^2 = 1/(3Q)      max error {err:.1e}")
print("   so Q = 1/(3p):  Koide Q = 2/3  <=>  p = 1/2  (coherent power = exhaust power)")
pm = 1 / (3 * Qm)
print(f"   lepton field: p = {pm:.7f} +- {0.75*dQ:.1e}  ({(pm-0.5)/(0.75*dQ):+.2f} sigma from 1/2)")
print("   split rules:")
print("     per-sector max entropy (two sectors, H(p) maximal) : p = 1/2 -> Q = 2/3   Koide")
print("     per-mode equipartition (each of 3 modes equal)       : p = 1/3 -> Q = 1     one massive generation")
print("     (the 4:9 cosmology split is per-mode counting; on three sites that rule gives Q = 1, not 2/3)")
dd = np.linspace(0.01, pi / 12 - 0.01, 7)
pf = [abs((U3 @ koide(d))[0]) ** 2 / (koide(d) @ koide(d)) for d in dd]
print(f"   along the Koide family the split is the same for every phase: p = {min(pf):.15f} .. {max(pf):.15f}")
print("   => the triangle transform plus the 50/50 rule gives r = sqrt2 exactly, and leaves delta free")

print("=" * 78)
print("2) CAN THE TWIST FIX THE PHASE?")
print("   on the triangle: no. delta is a property of the field; twist and phi_k only rotate the exhaust basis.")
# 13-mode transform: tune the twist so an eigenphase lands on 3 delta*
grid = np.linspace(0.05, 1.0, 9501)


def eigph(t):
    return np.sort(np.abs(np.angle(np.linalg.eigvals(transform(13, t)))))


E = np.array([eigph(t) for t in grid])


def crossings(target):
    sols = []
    for j in range(13):
        f = E[:, j] - target
        for i in np.where(np.sign(f[:-1]) * np.sign(f[1:]) < 0)[0]:
            sols.append(grid[i])
    return sorted(sols)


tgt = 3 * dstar
sol = crossings(tgt)
near = min(sol, key=lambda s: abs(s - dstar_cath))
print(f"   13-mode transform: twist values where some |eigenphase| = 3 delta* = {tgt:.9f}: {len(sol)} of them in [0.05, 1]")
print(f"   nearest to delta_star = {dstar_cath:.6f} is {near:.6f} ({100*(near/dstar_cath-1):+.2f}%)")
counts = [len(crossings(r)) for r in rng.uniform(0.2, 3.0, 20)]
print(f"   control: 20 random targets in [0.2, 3] -> solutions per target {min(counts)}..{max(counts)}; every one is hit")
print("   => tuning the twist reaches delta* only as well as it reaches any number: that is a fit, not a derivation")

print("=" * 78)
print("SUMMARY")
print("   modification that works : transform on the generation triangle + 50/50 max-entropy split -> r = sqrt2 exactly")
print("   what it cannot do       : fix delta (flat); tuning the twist hits any target")
print("   conflict to resolve     : the 4:9 rule is per-mode; Koide needs per-sector. They cannot both be the rule.")
