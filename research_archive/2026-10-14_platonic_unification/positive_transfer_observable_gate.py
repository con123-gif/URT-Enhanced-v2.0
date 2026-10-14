#!/usr/bin/env python3
"""Entropy-weighted 36->12 Platonic quadratic transfer / 13-centre test.
Run from repository root: python research_archive/2026-10-14_platonic_unification/positive_transfer_observable_gate.py
No empirical values enter the constructed transfer. Historical candidate
observables are only comparisons, not consequences of this transfer.
"""
import runpy
import numpy as np
from pathlib import Path
from scipy.linalg import expm

parent=Path(__file__).with_name("test_platonic_entropy_nonlinear.py")
q=runpy.run_path(str(parent))
C,P3,P5,L13=q["c"],q["p3"],q["p5"],q["l13"]
phi=(1+np.sqrt(5))/2
delta=3/20-80*np.pi/(1053*phi)
a=1/(4*(1+delta**2))
b=a*delta**2

def basis(P):
    vals,U=np.linalg.eigh(P)
    return U[:,vals>.5]

def same_sector(B):
    return C.T@np.column_stack([
      B[:,i]*B[:,j]*(np.sqrt(2) if i!=j else 1.)
      for i in range(4) for j in range(i,4)])

B3,B5=basis(P3),basis(P5)
S33,S55=same_sector(B3),same_sector(B5)
S35=C.T@np.column_stack([
  np.sqrt(2)*B3[:,i]*B5[:,j] for i in range(4) for j in range(4)])
F=np.column_stack([a*S33,np.sqrt(a*b)*S35,b*S55])
assert F.shape==(12,36)
K=F@F.T
T=F.T@F
assert np.linalg.eigvalsh(K).min()>0
assert np.linalg.eigvalsh(T).min()>-1e-12
assert np.linalg.matrix_rank(T,tol=1e-12)==12
assert np.allclose(np.linalg.eigvalsh(K),np.linalg.eigvalsh(T)[-12:],atol=1e-12)

s3=2*a*b*(5+2*np.sqrt(5))/15
s3p=2*a*b*(5-2*np.sqrt(5))/15
s5=3*a*a/25+b*b/3
s1=3*(a*a+b*b)
expected=sorted([s3p]*3+[s3]*3+[s5]*5+[s1])
assert np.allclose(np.linalg.eigvalsh(K),expected,atol=1e-12)
assert abs(s3/s3p-phi**6)<1e-10
assert np.linalg.norm((S33@S33.T)@(S35@S35.T)-
                      (S35@S35.T)@(S33@S33.T))<1e-12

J=np.vstack((np.zeros((1,12)),np.eye(12)))
for t in (0,.1,1):
    B=expm(-t*L13)@J@F
    assert np.linalg.matrix_rank(B,tol=1e-11)==12
    assert np.linalg.eigvalsh(B.T@B).min()>-1e-12
    print(f"t={t:g}, centre={float((B@B.T)[0,0]):.12g}, "
          f"trace={float(np.trace(B@B.T)):.12g}, rank=12")

P4=np.diag([1.]*4+[0.]*4)
P5loc=np.eye(8)-P4
plus=(P4+delta*P5loc)/np.sqrt(1+delta**2)
minus=(delta*P4+P5loc)/np.sqrt(1+delta**2)
assert np.allclose(plus.T@plus+minus.T@minus,np.eye(8))
rho=(P4+delta**2*P5loc)/(4*(1+delta**2))
assert np.allclose((plus.T@plus)/np.trace(plus.T@plus),rho)

# Historical numerics, no physical predictions from T:
alpha=137+(17572/1215)*delta-(9/65)*delta**2
sin2=3/13*(1+1/(162*np.pi))
vus=np.sqrt(8/159)
omega=6/19
print("PASS 36->12 positive Gram, exact phi^6, selected rho, centre heat.")
print("Eigenvalues 1,5,3,3prime:",s1,s5,s3,s3p)
print("Legacy numerics (not yet current/stress-derived):",
      "alpha^-1=",alpha,"MS sin²=",sin2,"Vus=",vus,"Omega_m=",omega)
