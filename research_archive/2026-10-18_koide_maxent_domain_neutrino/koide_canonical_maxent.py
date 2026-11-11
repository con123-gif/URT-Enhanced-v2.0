#!/usr/bin/env python3
"""Eliminating the per-sector/per-mode choice: canonical decomposition + maximum entropy (18 Oct 2026).

Claim tested: for three identical generations, the only basis-free decomposition of the sqrt-mass operator
is trace (+) traceless, so max entropy has exactly two outcomes and gives Q = 2/3 with no choice.
NumPy only.
"""
import numpy as np

rng = np.random.default_rng(20261018)


def haar_u(n):
    z = (rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))) / np.sqrt(2)
    q, r = np.linalg.qr(z)
    return q * (np.diag(r) / np.abs(np.diag(r)))


def herm(n):
    a = rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))
    return (a + a.conj().T) / 2


print("=" * 78)
print("1) HOW MANY BASIS-FREE SECTORS? (number of irreducible pieces = mean of |character|^2)")
s = np.mean([abs(np.trace(haar_u(3))) ** 4 for _ in range(400000)])
print(f"   U(3) flavour rotations acting on the 3x3 sqrt-mass operator: E|Tr U|^4 = {s:.4f}  -> 2 pieces (trace, traceless)")
perm = [np.eye(3)[list(p)] for p in [(0, 1, 2), (1, 2, 0), (2, 0, 1), (0, 2, 1), (2, 1, 0), (1, 0, 2)]]
chi = [np.trace(P) for P in perm]
print(f"   S3 relabelling of the 3 generations: mean chi^2 = {np.mean(np.square(chi)):.4f} -> 2 pieces (democratic, standard)")
print(f"   Z3 alone over the complex numbers: mean chi^2 = {np.mean(np.square(chi[:3])):.4f} -> 3 pieces"
      " (but for a real sqrt-mass vector the two non-trivial ones are complex conjugates: P_w = P_wbar always)")

print("=" * 78)
print("2) IS A PER-MODE SPLIT BASIS-FREE? (rotate generations, recompute)")
X = herm(3) + 3 * np.eye(3)
gm = []                                                  # orthonormal basis of traceless Hermitian 3x3 (Gell-Mann/sqrt2)
for (i, j) in [(0, 1), (0, 2), (1, 2)]:
    E = np.zeros((3, 3), complex); E[i, j] = E[j, i] = 1 / np.sqrt(2); gm.append(E)
    E = np.zeros((3, 3), complex); E[i, j], E[j, i] = -1j / np.sqrt(2), 1j / np.sqrt(2); gm.append(E)
gm.append(np.diag([1, -1, 0]) / np.sqrt(2)); gm.append(np.diag([1, 1, -2]) / np.sqrt(6))
modes, sectors = [], []
for _ in range(2000):
    U = haar_u(3)
    Y = U @ X @ U.conj().T
    tr = abs(np.trace(Y)) ** 2 / 3
    comps = [abs(np.trace(g @ Y)) ** 2 for g in gm]
    tot = tr + sum(comps)
    modes.append(comps[0] / tot)
    sectors.append(tr / tot)
print(f"   power fraction in one traceless mode: ranges {min(modes):.4f} .. {max(modes):.4f} under flavour rotation  (not basis-free)")
print(f"   power fraction in the trace sector:  ranges {min(sectors):.12f} .. {max(sectors):.12f}  (basis-free)")
print("   => for one configuration, the only basis-free data are the two sector powers; per-mode counting does not exist")

print("=" * 78)
print("3) MAX ENTROPY ON THE ONLY BASIS-FREE DATA")
p = np.linspace(1e-6, 1 - 1e-6, 1000001)
H = -(p * np.log(p) + (1 - p) * np.log(1 - p))
pb = p[np.argmax(H)]
print(f"   maximum of H(p, 1-p) at p = {pb:.6f}  ->  Q = 1/(3p) = {1/(3*pb):.6f}  (exact identity Q = 1/(3p))")
me, mmu, mt, dmt = 0.51099895069, 206.7682827 * 0.51099895069, 1776.93, 0.09
sq = np.sqrt([me, mmu, mt])
frac = (sq.sum() ** 2 / 3) / (me + mmu + mt)
frac2 = (np.sqrt([me, mmu, mt + dmt]).sum() ** 2 / 3) / (me + mmu + mt + dmt)
print(f"   leptons: democratic part of the sqrt-mass amplitude carries {frac:.7f} +- {abs(frac2-frac):.1e} of the total mass")

print("=" * 78)
print("4) SAME PRINCIPLE, A STATE INSTEAD OF A CONFIGURATION (your 4:9)")
rho = np.eye(13) / 13                                    # maximum-entropy state on 13 modes
P4 = np.diag([1] * 4 + [0] * 9)
print(f"   max-entropy state on the 13-mode shell, weight of the 4-mode sector = {np.trace(rho @ P4):.6f} = 4/13")
print("   a state's basis-free data are sector traces (weights by dimension); a configuration's are sector powers")
print("   (one weight per irreducible sector). One principle, two kinds of object: 4:9 and Koide do not conflict.")

print("=" * 78)
print("5) TEST: THE SAME RULE APPLIED TO QUARKS (PDG masses, MeV; scheme-dependent)")
for lab, m in [("u, c, t", [2.16, 1273.0, 172570.0]), ("d, s, b", [4.70, 93.5, 4183.0]),
               ("e, mu, tau", [me, mmu, mt])]:
    m = np.array(m)
    Q = m.sum() / np.sqrt(m).sum() ** 2
    print(f"   {lab:11s} Q = {Q:.4f}   democratic fraction = {1/(3*Q):.4f}")
print("   the rule holds for leptons only; quarks need a reason it does not apply to them")
