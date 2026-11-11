#!/usr/bin/env python3
"""Audit of the attached quark-sector claims (18 Oct 2026). NumPy only."""
import numpy as np
rng = np.random.default_rng(1)
Q = lambda X: np.trace(X @ X).real / np.trace(X).real ** 2
mu = np.array([2.16, 1273.0, 172570.0]); md = np.array([4.70, 93.5, 4183.0])     # PDG, MeV (scheme-dependent)
Xu, Xd = np.diag(np.sqrt(mu)), np.diag(np.sqrt(md))
s12, s13, s23, dl = np.sin(np.radians(13.04)), np.sin(np.radians(0.201)), np.sin(np.radians(2.38)), 1.20
c12, c13, c23 = np.sqrt(1-s12**2), np.sqrt(1-s13**2), np.sqrt(1-s23**2); e = np.exp(1j*dl)
V = np.array([[c12*c13, s12*c13, s13/e],
              [-s12*c23-c12*s23*s13*e, c12*c23-s12*s23*s13*e, s23*c13],
              [s12*s23-c12*c23*s13*e, -c12*s23-s12*c23*s13*e, c23*c13]])          # standard CKM parametrisation
print(f"CKM unitarity check: {np.abs(V.conj().T@V-np.eye(3)).max():.1e}")
print("1) Can CKM misalignment move Q_u or Q_d?")
dev = 0.0
for _ in range(10000):
    z = rng.normal(size=(3, 3)) + 1j*rng.normal(size=(3, 3)); W, _ = np.linalg.qr(z)
    dev = max(dev, abs(Q(W @ Xd @ W.conj().T) - Q(Xd)))
print(f"   Q_d = {Q(Xd):.6f}; after CKM rotation {Q(V@Xd@V.conj().T):.6f}; max change over 10000 random rotations {dev:.1e}")
print("   -> no. Q depends only on the spectrum; any rotation leaves it unchanged")
print("2) The attachment's joint object X_tot = X_u + V X_d V^dagger: does it sit at Q = 2/3?")
for lab, W in [("with CKM", V), ("aligned (V = I)", np.eye(3))]:
    Xt = Xu + W @ Xd @ W.conj().T
    print(f"   {lab:16s} Q_tot = {Q(Xt):.4f}   cross-trace Tr(X_u X_d) = {np.trace(Xu@W@Xd@W.conj().T).real:.1f}")
print("   -> 0.83, not 2/3: the data violate the condition the attachment builds on")
print("3) Natural joint max entropy (isospin-symmetric pair: trivial vs traceless over both operators)")
w = np.array([np.trace(Xu).real**2, np.trace(Xd).real**2]); q = np.array([Q(Xu), Q(Xd)])
print(f"   it requires sum_s (Tr X_s)^2 (Q_s - 2/3) = 0, i.e. weighted mean Q = 2/3 (deviations of opposite sign)")
print(f"   data: Q_u - 2/3 = {q[0]-2/3:+.4f}, Q_d - 2/3 = {q[1]-2/3:+.4f} (same sign); weighted mean Q = {np.dot(w,q)/w.sum():.4f}")
print("4) The quoted 'matches'")
dq = (q[1]-2/3)/(q[0]-2/3); kap = np.trace(Xd).real/np.trace(Xu).real
print(f"   Delta Q_d / Delta Q_u = {dq:.4f};  (Tr X_d/Tr X_u)^(3/4) = {kap**0.75:.4f};  sin theta_C = {abs(V[0,1]):.4f}")
print("   -> three different numbers; the attachment calls them a match")
