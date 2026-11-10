#!/usr/bin/env python3
"""No-fit pi/phi/e Schur-dressed C3 edge-pair response, exact Ward contacts.
Conditional composite-pair kernel only; no physical H13+H51 pole/ARF.
"""
from pathlib import Path
import contextlib,io,runpy
import numpy as np
import sympy as s
with contextlib.redirect_stdout(io.StringIO()):
    a=runpy.run_path(str(Path(__file__).with_name('URT_ANTIPODAL_C3_CLOCK_MATTER_2026_11_10.py')))
V=np.array(a['V'],float);T5=np.array(a['Te5'],float)
Q5=T5@T5.T
assert np.linalg.norm(Q5@Q5-Q5)<1e-12 and abs(np.trace(Q5)-4)<1e-12
r=float(s.pi/s.E);phi=(1+s.sqrt(5))/2
Delta=float(s.Rational(3,20)-80*s.pi/(1053*phi));q=2;N=24
rng=np.random.default_rng(20261110)
theta=rng.uniform(-.7,.7,N);lam=rng.uniform(-.4,.4,N)
def make(t):
    T=np.zeros((N,N),complex)
    for i in range(N):T[i,(i+1)%N]=np.exp(-1j*q*t[i])
    T8=np.linalg.matrix_power(T,8)
    A=16*np.eye(N)+r*r*(2*np.eye(N)-T-T.conj().T)
    return T8,A,np.linalg.inv(A)
T8,A,G=make(theta)
assert np.linalg.norm(G@T8-T8@G)<1e-12
B=Delta**2*(G@T8)
H=np.kron(B,Q5)
assert np.linalg.norm(H@H.conj().T-H.conj().T@H)<1e-12
assert np.linalg.matrix_rank(H,tol=1e-14)==96
Theta=sum(theta)
k=(2*np.pi*np.arange(N)-q*Theta)/N
den=16+r*r*(2-2*np.cos(k))
xi=Delta**2*np.exp(8j*k)/den
assert abs(np.trace(B)-sum(xi))<1e-12
assert abs(np.trace(B@B)-sum(xi*xi))<1e-12
x=1+8/r**2
Dclock=2*(r*r)**N*float(s.chebyshevt(N,s.Symbol('x')).subs('x',x)-np.cos(q*Theta))
assert abs(np.linalg.det(A)/Dclock-1)<1e-11
pred_det=Delta**(2*N)*np.exp(-1j*q*8*Theta)/Dclock
assert abs(np.linalg.det(B)/pred_det-1)<1e-10
from scipy.optimize import linear_sum_assignment
cost=abs(np.linalg.eigvals(B)[:,None]-xi[None,:]);rows,cols=linear_sum_assignment(cost)
assert max(cost[rows,cols])<1e-13
L=np.diag(lam)
A1=1j*q*(L@A-A@L)
A2=-q*q*(L@L@A-2*L@A@L+A@L@L)
G1=-G@A1@G
G2=2*G@A1@G@A1@G-G@A2@G
T81=1j*q*(L@T8-T8@L)
T82=-q*q*(L@L@T8-2*L@T8@L+T8@L@L)
B1=Delta**2*(G1@T8+G@T81)
B2=Delta**2*(G2@T8+2*G1@T81+G@T82)
assert np.linalg.norm(B1-1j*q*(L@B-B@L))<1e-12
assert np.linalg.norm(B2+q*q*(L@L@B-2*L@B@L+B@L@L))<1e-12
dg=np.roll(lam,-1)-lam;h=2e-4
Tp,Ap,Gp=make(theta+h*dg);Tm,Am,Gm=make(theta-h*dg)
Bp=Delta**2*(Gp@Tp);Bm=Delta**2*(Gm@Tm)
assert np.linalg.norm((Bp-Bm)/(2*h)-B1)<1e-7
assert np.linalg.norm((Bp+Bm-2*B)/h**2-B2)<1e-6
U=np.diag(np.exp(1j*q*lam));Tg,Ag,Gg=make(theta+dg)
assert np.linalg.norm(Delta**2*(Gg@Tg)-U@B@U.conj().T)<1e-12
K=np.kron(B+B.conj().T,Q5)
K1=np.kron(B1+B1.conj().T,Q5)
K2=np.kron(B2+B2.conj().T,Q5)
Lbig=np.kron(L,np.eye(30))
b=rng.normal(size=720)+1j*rng.normal(size=720)
b1=1j*q*Lbig@b;b2=-q*q*Lbig@Lbig@b
first=2*np.vdot(b1,K@b).real+np.vdot(b,K1@b).real
contacts=[2*np.vdot(b2,K@b).real,2*np.vdot(b1,K@b1).real,
          4*np.vdot(b1,K1@b).real,np.vdot(b,K2@b).real]
assert abs(first)<1e-12 and abs(sum(contacts))<1e-12
print('PASS original pi/phi/e Schur 4_5 and 24-clock C3 response')
print('PASS 96 source modes, Fourier spectrum, exact Chebyshev determinant')
print('PASS inverse-Schur relaxation + Wilson + mixed contacts and finite differences')
print('PASS full first/second conditional pair Ward; residual',sum(contacts))
print('Delta=',Delta,'range |xi|=',min(abs(xi)),max(abs(xi)))
print('OPEN physical H13+H51 vertex, fermion-loop pole and four ARFs')
