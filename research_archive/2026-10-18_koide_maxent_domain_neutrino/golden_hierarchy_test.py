#!/usr/bin/env python3
"""Golden-ratio hierarchy candidates (GOLDEN_PREREGISTRATION.md, sha256 bd78f032...). NumPy + SciPy only."""
import numpy as np
from scipy.optimize import brentq
pi, r2 = np.pi, np.sqrt(2)
phi = (1 + 5**0.5) / 2
me, rmu, drmu, mt, dmt = 0.51099895069, 206.7682827, 4.6e-6, 1776.93, 0.09
rtm = mt / (rmu * me)
def sq(d): return np.array([1 + r2*np.cos(d + 2*pi*k/3) for k in range(3)])
def ratios(d): s = sq(d); return (s[2]/s[1])**2, me*(s[0]/s[1])**2
ds = brentq(lambda d: ratios(d)[0] - rmu, 0.2, 0.25, xtol=1e-16)
print(f"target: 3 delta* = {3*ds:.9f} rad = {np.degrees(3*ds):.6f} deg;  m_mu/m_e = {rmu}, m_tau/m_mu = {rtm:.4f}")
print("A) golden powers, no Koide")
for lab, r in [("m_mu/m_e", rmu), ("m_tau/m_mu", rtm), ("sqrt(m_mu/m_e)", np.sqrt(rmu)), ("sqrt(m_tau/m_mu)", np.sqrt(rtm))]:
    a = np.log(r) / np.log(phi); n = round(a)
    print(f"   {lab:17s} = phi^{a:.4f};  phi^{n} = {phi**n:9.3f}  ({100*(phi**n/r-1):+.1f}%)  FAIL")
print("B) golden phase on the Koide circle (Q = 2/3)")
ang = lambda u, v: np.arccos(abs(np.dot(u, v)) / np.linalg.norm(u) / np.linalg.norm(v))
v5 = np.array([0, 1, phi]); f3 = np.array([0, 1, phi]) + np.array([0, -1, phi]) + np.array([phi, 0, 1])
f3b = np.array([0, 1, phi]) + np.array([0, -1, phi]) + np.array([-phi, 0, 1])
cands = [("B1 pi/5", pi/5), ("B2 arctan(1/phi)", np.arctan(1/phi)), ("B3 arctan(1/phi^2)", np.arctan(1/phi**2)),
         ("B4 arccos(1/sqrt phi)", np.arccos(phi**-0.5)), ("B5 icosa 5-fold/3-fold", ang(v5, f3)),
         ("B6 icosa 3-fold/3-fold", ang(f3, f3b)), ("B7 arccos(1/(2 phi))", np.arccos(1/(2*phi))),
         ("B8 golden angle 2pi/phi^2", 2*pi/phi**2)]
for lab, t in cands:
    tf = t % (2*pi); tf = min(tf, 2*pi - tf)              # cos(3 delta) only depends on folded angle
    if not (0 < tf < pi/4):
        print(f"   {lab:28s} 3delta = {np.degrees(t):8.4f} deg -> off the physical window (0, 45 deg)  FAIL"); continue
    d = tf/3; rm, mtau = ratios(d)
    print(f"   {lab:28s} 3delta = {np.degrees(tf):8.4f} deg  m_mu/m_e = {rm:9.3f} ({(rm-rmu)/drmu:+.1e} sigma)"
          f"  m_tau = {mtau:8.2f} MeV  FAIL" if abs(rm-rmu) > 3*drmu else "  PASS")
