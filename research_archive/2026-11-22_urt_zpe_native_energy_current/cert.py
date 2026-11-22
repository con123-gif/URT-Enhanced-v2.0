"""Standalone URT-ZPE native energy current certificate, 2026-11-22.
Continuation of d58dd0911e9f3f80c8e7b5f706a52e8d982ac1a5.
For D_e=(1,-U), S_e=(1,+U), B_e=(1,-1), current
J_e=1/2 Weyl[p^T R(S_e^dag D_e) q].
With K_i=D^dag diag(A_i/2)D, A=|D|^2.T, P_i=site projector,
K_i-P_i L = -sum_e B_ei S_e^dag D_e/2.
Therefore dot h_i + sum_e B_ei J_e = 0 exactly.
In the eigenbasis W=diag(w), T=K_v/sqrt(w_m w_n)-P_v sqrt(w_m w_n).
F=S^dag diag(Bv/2)D transformed to that basis, J= sqrt(w_m/w_n)F_mn
plus its adjoint. J_mn=-(w_m+w_n)T_mn; spectral pair continuity.
This is a lattice energy conservation identity, NOT a full metric Ward
identity, physical stress tensor or derivation of G. Next: spatial stresses,
connection dynamics and constrained metric coupling. No Cathedral ARFs.
Local execution: OPENBLAS_NUM_THREADS=1 python cert.py, eight cases N=2,3,4,5
both phases passed, max spectral error 1.342e-15, max local error 4.450e-16.
New remote verification not yet claimed.
"""
import numpy as np
from itertools import product
from math import pi,sqrt
def run(n,f):
 m=n**3; src=[];dst=[];phase=[]
 for x,y,z in product(range(n),repeat=3):
  i=x+n*(y+n*z)
  for X,Y,Z,k in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
   if max(X,Y,Z)>=n:continue
   src.append(i);dst.append(X+n*(Y+n*Z));phase.append(np.exp(1j*f*k))
 r=np.arange(len(src)); D=np.zeros((len(r),m),complex); S=D.copy(); B=D.real.copy()
 D[r,src]=1;D[r,dst]=-np.array(phase);S[r,src]=1;S[r,dst]=phase;B[r,src]=1;B[r,dst]=-1
 A=abs(D).T**2;L=D.conj().T@D;lam,U=np.linalg.eigh(L);w=np.sqrt(lam); assert lam.min()>0
 err=0
 for i in range(m):
  K=(D.conj().T*(A[i]/2))@D; PL=np.zeros_like(L);PL[i]=L[i]
  div=(S.conj().T*(B[:,i]/2))@D
  err=max(err,np.max(abs(K-PL+div)))
 assert err<1e-12
 v=np.array([np.cos(pi*(x+.5)/n) for z,y,x in product(range(n),repeat=3)]);v/=np.linalg.norm(v)
 Pv=np.diag(v);Kv=(D.conj().T*(A.T@v/2))@D; F=(S.conj().T*((B@v)/2))@D
 P=U.conj().T@Pv@U;K=U.conj().T@Kv@U;F=U.conj().T@F@U
 ratio=np.sqrt(w[:,None]/w[None,:]); T=K/np.sqrt(w[:,None]*w[None,:])-P*np.sqrt(w[:,None]*w[None,:]); J=ratio*F+(ratio*F).conj().T
 ward=np.max(abs(J+(w[:,None]+w[None,:])*T));assert ward<1e-11
 c=sum(abs(T).ravel()**2)/4; flux=sum(abs(J).ravel()**2)/4
 assert abs(flux-np.sum(abs(T)**2*(w[:,None]+w[None,:])**2)/4)<1e-11
 rng=np.random.default_rng(146);q=rng.normal(size=m)+1j*rng.normal(size=m);p=rng.normal(size=m)+1j*rng.normal(size=m)
 dq=D@q;dp=D@p;Jedge=np.real(np.conj(S@p)*dq)/2
 dh=-np.real(np.conj(p)*(L@q))+A@np.real(np.conj(dq)*dp)/2
 assert np.max(abs(dh+B.T@Jedge))<1e-11
 print(f'N={n} phase={f:+.9f} sites={m} local_identity_error={err:.3e} spectral_identity_error={ward:.3e} energy_variance={c:.10g} divergence_variance={flux:.10g}')
if __name__=='__main__':
 theta=2*pi/((1+sqrt(5))/2)**2
 for n in (2,3,4,5):
  for f in (-theta,pi-theta):run(n,f)
 print('PASS: exact-form local continuity, pair spectral continuity, independent Hamilton-equation test')
