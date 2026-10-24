#!/usr/bin/env python3
"""Audit of the 'Q_ud is the midpoint of Q_u and Q_d' claim (18 Oct 2026). NumPy only."""
import numpy as np
rng = np.random.default_rng(7)
mu = np.array([2.16, 1270.0, 172690.0]); md = np.array([4.67, 93.4, 4180.0])          # the attachment's PDG values
s12, s13, s23, dl = np.sin(np.radians(13.04)), np.sin(np.radians(0.201)), np.sin(np.radians(2.38)), 1.20
c12, c13, c23 = np.sqrt(1-s12**2), np.sqrt(1-s13**2), np.sqrt(1-s23**2); e = np.exp(1j*dl)
V = np.array([[c12*c13, s12*c13, s13/e], [-s12*c23-c12*s23*s13*e, c12*c23-s12*s23*s13*e, s23*c13],
              [s12*s23-c12*c23*s13*e, -c12*s23-s12*c23*s13*e, c23*c13]])
def norm_ops(mu, md, W):
    Xu, Xd = np.diag(np.sqrt(mu)), W @ np.diag(np.sqrt(md)) @ W.conj().T
    return Xu/np.trace(Xu).real, Xd/np.trace(Xd).real
def stats(Hu, Hd):
    Qu, Qd, Qud = (np.trace(A@B).real for A, B in [(Hu, Hu), (Hd, Hd), (Hu, Hd)])
    return Qu, Qd, Qud, np.linalg.norm(Hu-Hd)**2
Hu, Hd = norm_ops(mu, md, V)
Qu, Qd, Qud, D2 = stats(Hu, Hd)
print(f"reproduced: Q_u = {Qu:.4f}, Q_d = {Qd:.4f}, Q_ud = {Qud:.4f}, midpoint = {(Qu+Qd)/2:.4f}, ||Xu^-Xd^||^2 = {D2:.4f}")
print(f"1) identity Q_ud = (Q_u+Q_d)/2 - ||Xu^-Xd^||^2/2 holds to {abs(Qud-((Qu+Qd)/2-D2/2)):.1e}: the 'midpoint' is algebra, not physics")
print(f"   normalised diagonals: up {np.round(np.real(np.diag(Hu)),3)}, down {np.round(np.real(np.diag(Hd)),3)}: both ~90% third generation")
c = np.linalg.norm(Hu@Hd - Hd@Hu)
print(f"2) commutator ||[Xu^, Xd^]|| = {c:.2e}: CKM misalignment is far too small to push Q_u up by 0.18")
Hu0, Hd0 = norm_ops(mu, md, np.eye(3))
print(f"3) aligned limit (V = I, operators commute): Q_u = {stats(Hu0,Hd0)[0]:.4f}, Q_d = {stats(Hu0,Hd0)[1]:.4f}"
      " -> commuting does NOT give 2/3")
gaps = []
for _ in range(20000):
    a = np.exp(rng.uniform(np.log(3), np.log(30), 2)); b = np.exp(rng.uniform(np.log(3), np.log(30), 2))
    su = np.array([1, a[0], a[0]*a[1]]); sd = np.array([1, b[0], b[0]*b[1]])
    q = stats(*norm_ops(su**2, sd**2, V)); gaps.append(abs(q[2] - (q[0]+q[1])/2))
gaps = np.array(gaps)
print(f"4) control: 20000 random hierarchical spectra (each step 3x-30x in sqrt-mass), same CKM:")
print(f"   |Q_ud - midpoint| median {np.median(gaps):.4f}; fraction at or below the quarks' {abs(Qud-(Qu+Qd)/2):.4f}: {np.mean(gaps <= abs(Qud-(Qu+Qd)/2)):.2f}")
Su, Sd = np.sqrt(mu).sum(), np.sqrt(md).sum()
vn = np.sum(np.sort(np.sqrt(mu)) * np.sort(np.sqrt(md)))            # von Neumann: max of Tr(Xu V Xd V+) over every unitary V
d2min = np.sum((np.sort(np.sqrt(mu))/Su - np.sort(np.sqrt(md))/Sd)**2)
cosf = lambda a, b, ab: (ab-1/3)/np.sqrt((a-1/3)*(b-1/3))
print("5) the attachment's table claims I_ud = 27,232 MeV, Q_ud = 0.7866, D^2 = 0.0071, cos = 0.99945")
print(f"   bound over ALL mixing matrices (perfect alignment): I_ud <= {vn:.1f} MeV, Q_ud <= {vn/(Su*Sd):.4f}, D^2 >= {d2min:.4f}")
print(f"   standard CKM: I_ud = {Qud*Su*Sd:.1f} MeV, Q_ud = {Qud:.4f}, D^2 = {D2:.4f}, traceless cos = {cosf(Qu, Qd, Qud):.5f}")
print(f"   traceless cos from the attachment's own Q values: {cosf(0.8489, 0.7314, 0.7866):.5f}  (above 1 is impossible)")
q = stats(Hu, Hu)
print(f"6) collinear counterexample X_d := X_u: det = {(q[0]-1/3)*(q[1]-1/3)-(q[2]-1/3)**2:.1e}, Q = {q[0]:.4f}  (claim: collinear forces 2/3)")
