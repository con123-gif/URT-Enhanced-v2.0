"""Cathedral scalar-to-spin2 physical derivative-order gate, 16 Oct 2026.

The fiveplet is a real spin-2/STF spatial tensor. A single scalar potential
can only generate an equivariant spin-2 tensor at SECOND derivative order.
This script verifies the symbol, rank, and absence of isotropic stress in
the TT wave sector. No dimensional G or mass-current coupling is fitted.

Run: python cathedral_scalar_spin2_derivative_gate.py
"""
from math import pi,sqrt,log
import numpy as np
phi=(1+sqrt(5))/2
delta=3/20-80*pi/(1053*phi)
eta=-log(delta)
chi=8*eta*(1+delta*delta)/(1-delta*delta)
I=np.eye(3)
rng=np.random.default_rng(20261016)
def TT(A,k):
    n=k/np.linalg.norm(k)
    P=I-n[:,None]*n[None,:]
    return P@A@P-.5*P*np.trace(P@A)
STF=[
  np.diag([1.,-1.,0]),
  np.diag([1.,1.,-2.]),
  np.array([[0,1,0],[1,0,0],[0,0,0.]]),
  np.array([[0,0,1],[0,0,0],[1,0,0.]]),
  np.array([[0,0,0],[0,0,1],[0,1,0.]])
]
residuals=[]
for _ in range(100):
    k=rng.normal(size=3)
    k2=k@k
    Q=np.outer(k,k)-(k2/3)*I
    residuals.append(abs(np.linalg.norm(Q)**2-(2/3)*k2*k2))
    assert np.allclose(TT(I,k),0,atol=1e-13)
    assert np.allclose(TT(np.outer(k,k),k),0,atol=1e-13)
    C=np.column_stack([k@T for T in STF])
    images=np.column_stack([TT(T,k).ravel() for T in STF])
    assert np.linalg.matrix_rank(C,tol=1e-11)==3
    assert np.linalg.matrix_rank(images,tol=1e-11)==2

assert max(residuals)<1e-12
for K in (.1,.2,.4,.8,1.6):
    O_stf=(2*chi/3)*K**4
    O_scalar=chi*K**2
    assert np.isclose(O_stf/O_scalar,(2/3)*K*K)

print("PASS 100 random modes: STF Hessian norm = (2/3) k^4 |phi|^2")
print("PASS: physical wavevector leaves rank-2 TT spin-2 modes")
print("PASS: isotropic scalar stress has zero transverse-traceless projection")
print("chi35=",chi)
print("STF-Hessian-derived scalar symbol=(2/3) chi35 |k|^4")
print("Different scalar-gradient symbol=chi35 |k|^2; requires a separately derived scalar/coframe map")
print("If scalar action were kappa |grad(phi)|^2/2 - g rho phi:")
print("   G_eff = g^2/(4 pi kappa), not determined by chi35 alone")
