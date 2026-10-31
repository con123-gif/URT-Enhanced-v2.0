#!/usr/bin/env python3
"""Where the Q = 2/3 rule applies, and what it predicts for neutrinos (18 Oct 2026).

Pre-registered in DOMAIN_PREREGISTRATION.md (sha256 3e111699ade3620b...). NumPy/SciPy only.
Data: CODATA 2022 (m_e, m_mu/m_e), PDG 2026 (m_tau), NuFIT 6.0 (arXiv:2410.05380),
JUNO first measurement (arXiv:2511.14593), DESI DR2 neutrino constraints (arXiv:2503.14744).
"""
import numpy as np
from scipy.optimize import brentq

trap = getattr(np, "trapezoid", None) or np.trapz


def Q(m, s=(1, 1, 1)):
    """Koide ratio on signed square roots."""
    m = np.asarray(m, float)
    return m.sum() / (np.sqrt(m) @ np.asarray(s, float)) ** 2


def lode3(m, s=(1, 1, 1)):
    """3*delta, basis-free: cos(3 delta) = sqrt6 Tr X~^3 / (Tr X~^2)^(3/2) on the signed sqrt-mass vector."""
    x = np.sqrt(np.asarray(m, float)) * np.asarray(s, float)
    if x.sum() < 0:
        x = -x                                   # an overall sign is not physical (mu > 0 convention)
    t = x - x.mean()
    return np.arccos(np.clip(np.sqrt(6) * (t ** 3).sum() / ((t ** 2).sum()) ** 1.5, -1, 1))


# ------------------------------------------------------------------------------------------------
print("=" * 88)
print("T1  DOMAIN CHECK - charged leptons: pole masses vs running (MS-bar) masses at M_Z, one-loop QED")
me, mmu, mtau, dmtau, MZ = 0.51099895069, 206.7682827 * 0.51099895069, 1776.93, 0.09, 91187.6
lep = np.array([me, mmu, mtau])
Qp = Q(lep)
dQp = abs(Q([me, mmu, mtau + dmtau]) - Qp)
nodes, inv = np.log([me, mtau, MZ]), [137.035999, 133.47, 127.95]       # approximate 1/alpha(mu)
alpha = lambda mu: 1.0 / np.interp(np.log(mu), nodes, inv)


def run_to_MZ(m):
    """m_bar(m) = m_pole (1 - alpha/pi); then dm/dln(mu) = -(3 alpha / 2 pi) m up to M_Z."""
    t = np.linspace(np.log(m), np.log(MZ), 4001)
    return m * (1 - alpha(m) / np.pi) * np.exp(-3 / (2 * np.pi) * trap(alpha(np.exp(t)), t))


lep_run = np.array([run_to_MZ(m) for m in lep])
Qr = Q(lep_run)
t1 = abs(Qp - 2 / 3) < 3 * dQp and abs(Qr - 2 / 3) > 10 * dQp
print(f"   pole masses      Q = {Qp:.8f} +- {dQp:.1e}   ({(Qp - 2/3)/dQp:+.2f} sigma from 2/3)")
print(f"   running at M_Z   m = {np.round(lep_run, 4)} MeV")
print(f"                    Q = {Qr:.6f}   misses 2/3 by {Qr - 2/3:+.2e} = {(Qr - 2/3)/dQp:.0f}x the pole error bar")
print(f"   T1: {'pass' if t1 else 'does not pass'} - the rule holds on the physical spectrum and not on running masses")

# ------------------------------------------------------------------------------------------------
print("=" * 88)
print("T2  NEUTRINOS - solve Q = 2/3 on signed sqrt-masses, both orderings, every sign pattern")
data = {
    "NuFIT 6.0 (with SK-atm)": dict(d21=(7.49e-5, 0.19e-5), d31=(2.513e-3, 0.020e-3), d32=(2.484e-3, 0.020e-3),
                                    s12=0.308, s13=0.02215),
    "JUNO d21 + NuFIT d31":    dict(d21=(7.50e-5, 0.12e-5), d31=(2.513e-3, 0.020e-3), d32=(2.484e-3, 0.020e-3),
                                    s12=0.3092, s13=0.02215),
    "NuFIT 6.0 (no SK-atm)":   dict(d21=(7.49e-5, 0.19e-5), d31=(2.534e-3, 0.024e-3), d32=(2.510e-3, 0.0245e-3),
                                    s12=0.307, s13=0.02195),
}
signs = [(1, 1, 1), (-1, 1, 1), (1, -1, 1), (1, 1, -1)]          # overall sign irrelevant


def masses(x, order, d21, d3):
    """(m1, m2, m3) by label; x = lightest mass."""
    if order == "NO":
        return np.array([x, np.sqrt(x * x + d21), np.sqrt(x * x + d3)])
    m2 = np.sqrt(x * x + d3)
    return np.array([np.sqrt(m2 * m2 - d21), m2, x])


def solve(order, d21, d3):
    out, xs = [], np.concatenate([[0.0], np.logspace(-7, 0.3, 6000)])
    for s in signs:
        f = lambda x: Q(masses(x, order, d21, d3), s) - 2 / 3
        v = np.array([f(x) for x in xs])
        for i in np.where(np.sign(v[:-1]) * np.sign(v[1:]) < 0)[0]:
            x0 = brentq(f, xs[i], xs[i + 1], xtol=1e-18, rtol=1e-15)
            out.append((s, x0, masses(x0, order, d21, d3)))
    return out


def m_beta(m, d):
    c13 = 1 - d["s13"]
    return np.sqrt((1 - d["s12"]) * c13 * m[0] ** 2 + d["s12"] * c13 * m[1] ** 2 + d["s13"] * m[2] ** 2)


sols = {}
for name, d in data.items():
    print(f"   {name}")
    for order, d3 in [("NO", d["d31"][0]), ("IO", d["d32"][0])]:
        found = solve(order, d["d21"][0], d3)
        if not found:
            print(f"     {order}: no solution")
        for s, x0, m in found:
            sols[(name, order)] = (s, m)
            print(f"     {order} signs {str(s):12s} lightest {x0*1e3:8.4f} meV | m = {np.round(m*1e3, 4)} meV | "
                  f"sum {m.sum()*1e3:7.3f} meV | m_beta {m_beta(m, d)*1e3:5.2f} meV | 3delta {lode3(m, s):.4f}")
print("   (no all-positive solution exists in either ordering: Q = 2/3 forces one negative Dirac eigenvalue)")

# ------------------------------------------------------------------------------------------------
print("=" * 88)
print("T3  COSMOLOGY - DESI DR2 + CMB: sum < 64.2 meV (LambdaCDM, 95%); 53 meV (Feldman-Cousins); 163 meV (w0waCDM)")
floor = np.sqrt(data["NuFIT 6.0 (with SK-atm)"]["d21"][0]) + np.sqrt(data["NuFIT 6.0 (with SK-atm)"]["d31"][0])
for (name, order), (s, m) in sols.items():
    S = m.sum() * 1e3
    print(f"   {name:24s} {order}: sum {S:7.3f} meV -> LambdaCDM {'allowed' if S < 64.2 else 'excluded'}, "
          f"FC {'allowed' if S < 53 else 'excluded'}, w0waCDM {'allowed' if S < 163 else 'excluded'}")
print(f"   oscillation floor for NO (m1 = 0): {floor*1e3:.3f} meV - the NO solution sits "
      f"{(sols[('NuFIT 6.0 (with SK-atm)', 'NO')][1].sum() - floor)*1e3:.2f} meV above it")
t3 = any(m.sum() * 1e3 < 64.2 for (_, _), (_, m) in sols.items())
print(f"   T3: {'pass' if t3 else 'does not pass'} - surviving ordering: "
      f"{sorted({o for (n, o), (s, m) in sols.items() if m.sum()*1e3 < 64.2})}")

# ------------------------------------------------------------------------------------------------
print("=" * 88)
print("T4  PHASE RELATION (Brannen 2006 hypothesis): 3 delta_nu = 3 delta_e + pi/4")
mt_exact = brentq(lambda mt: Q([me, mmu, mt]) - 2 / 3, 1700, 1850, xtol=1e-13)
b_e = lode3([me, mmu, mt_exact])
b_nu = b_e + np.pi / 4
v = 1 + np.sqrt(2) * np.cos(b_nu / 3 + 2 * np.pi * np.arange(3) / 3)      # signed sqrt-masses, units of mu
mm = np.sort(v ** 2)
R_pred = (mm[1] ** 2 - mm[0] ** 2) / (mm[2] ** 2 - mm[0] ** 2)
print(f"   3 delta_e = {b_e:.9f}  (Q = 2/3 exact, m_tau = {mt_exact:.5f} MeV)  ->  predicted 3 delta_nu = {b_nu:.6f}")
print(f"   predicted signed sqrt-masses (units of mu): {np.round(np.sort(v), 5)}  Q = {Q(v**2, np.sign(v)):.12f}")
print(f"   -> one negative eigenvalue, on the lightest state; normal ordering")
print(f"   predicted R = dm2_21 / dm2_31 = {R_pred:.6f}")
pulls = []
for name, d in data.items():
    (a, sa), (b, sb) = d["d21"], d["d31"]
    R, sR = a / b, (a / b) * np.hypot(sa / a, sb / b)
    s, m = sols[(name, "NO")]
    b_data = lode3(m, s)
    eps = 1e-3 * a                                                        # sensitivity of 3 delta_nu to dm2_21
    s2, m2_ = solve("NO", a + eps, b)[0][0], solve("NO", a + eps, b)[0][2]
    db = (lode3(m2_, s2) - b_data) / eps
    sb_data = abs(db) * np.hypot(sa, sb * a / b)                          # error on 3 delta_nu from both splittings
    pulls.append((R_pred - R) / sR)
    print(f"   {name:24s} R = {R:.6f} +- {sR:.6f}  pull {pulls[-1]:+.2f} sigma | 3delta_nu(data) = {b_data:.4f} +- "
          f"{sb_data:.4f} vs {b_nu:.4f} | relation needs dm2_21 = {R_pred*b*1e5:.3f}e-5 (measured {a*1e5:.2f} +- {sa*1e5:.2f})")
t4 = all(abs(p) < 3 for p in pulls)
print(f"   T4: {'pass' if t4 else 'does not pass'} at the 3-sigma standard (largest pull {max(pulls, key=abs):+.2f} sigma)")

# ------------------------------------------------------------------------------------------------
print("=" * 88)
print("CHECKS - substitute the solutions back")
for (name, order), (s, m) in sols.items():
    d = data[name]
    d3 = d["d31"][0] if order == "NO" else d["d32"][0]
    big = (m[2] ** 2 - m[0] ** 2) if order == "NO" else (m[1] ** 2 - m[2] ** 2)
    print(f"   {name:24s} {order}: Q - 2/3 = {Q(m, s) - 2/3:+.1e} | dm2_21 {(m[1]**2 - m[0]**2)/d['d21'][0] - 1:+.1e} | "
          f"dm2_3l {big/d3 - 1:+.1e}  (relative)")
