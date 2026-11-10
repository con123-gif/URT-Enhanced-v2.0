#!/usr/bin/env python3
"""No-fit 24-clock winding expansion, exact holonomy response and determinant Ward contacts.
Compares full positive 62-mode H64 Gaussian to 4_3+4_5 source-bright 8-mode Gaussian.
Uses frozen pi/e, Delta, q=2, masses 10,16,18, N=24. Not a physical ARF.
"""
import mpmath as mp
mp.mp.dps=140
N=24;q=2;r=mp.pi/mp.e;phi=(1+mp.sqrt(5))/2
Delta=mp.mpf(3)/20-80*mp.pi/(1053*phi)
ms=(10,18,16)
theta=[mp.mpf((i%5)-2)/37 for i in range(N)]
lam=[mp.mpf((i%7)-3)/29 for i in range(N)]
Theta=sum(theta)
I=mp.eye(N)

def trace(A):return sum(A[i,i] for i in range(N))
def build(a,phases):
 T=mp.matrix(N)
 for i in range(N):T[i,(i+1)%N]=mp.exp(-1j*q*phases[i])
 A=a*I+r*r*(2*I-T-T.transpose_conj())
 return T,A

def cheb(n,x):
 t0=mp.mpf(1);t1=x
 if n==0:return t0
 for _ in range(1,n):t0,t1=t1,2*x*t1-t0
 return t1

def U(n,x):
 u0=mp.mpf(1);u1=2*x
 if n==0:return u0
 for _ in range(1,n):u0,u1=u1,2*x*u1-u0
 return u1

def exact(a,Th):
 x=1+mp.mpf(a)/(2*r*r)
 T=cheb(N,x)
 D=2*r**(2*N)*(T-mp.cos(q*Th))
 j=q*mp.sin(q*Th)/(T-mp.cos(q*Th))
 k=q*q*(T*mp.cos(q*Th)-1)/(T-mp.cos(q*Th))**2
 trG=N*U(N-1,x)/(2*r*r*(T-mp.cos(q*Th)))
 t=(x-mp.sqrt(x*x-1))**N
 return D,j,k,trG,t

# Independent 24x24 determinants, traces and full local Ward contacts.
for a in ms:
 T,A=build(a,theta)
 D,j,k,trG,t=exact(a,Theta)
 G=A**-1
 assert abs(mp.det(A)/D-1)<mp.mpf('1e-75')
 assert abs(trace(G)-trG)<mp.mpf('1e-75')
 assert abs(mp.cosh(N*mp.acosh(1+mp.mpf(a)/(2*r*r)))-cheb(N,1+mp.mpf(a)/(2*r*r)))<mp.mpf('1e-55')
 # Two winding terms, with a rigorous geometric tail bound.
 S=-2*sum(t**w*mp.cos(q*w*Theta)/w for w in range(1,3))
 closed=mp.log(1-2*t*mp.cos(q*Theta)+t*t)
 assert abs(closed-S)<=t**3/(1-t)
 E=mp.matrix(N);E[0,1]=T[0,1]
 Eadj=E.transpose_conj()
 A1=1j*q*r*r*(E-Eadj)
 A2=q*q*r*r*(E+Eadj)
 directj=trace(G*A1)
 seagull=trace(G*A2)
 relax=trace(G*A1*G*A1)
 assert abs(directj-j)<mp.mpf('1e-74')
 assert abs(seagull-relax-k)<mp.mpf('1e-74')
 # Cross-link Hessian: no seagull, same holonomy Hessian.
 E7=mp.matrix(N);E7[7,8]=T[7,8]
 A7=1j*q*r*r*(E7-E7.transpose_conj())
 assert abs(-trace(G*A1*G*A7)-k)<mp.mpf('1e-74')
 # First and second pure-gauge Ward contacts: seagull and relaxation cancel.
 L=mp.matrix(N)
 for i in range(N):L[i,i]=lam[i]
 Ap=1j*q*(L*A-A*L)
 App=-q*q*(L*L*A-2*L*A*L+A*L*L)
 c1=trace(G*Ap)
 c2a=trace(G*App)
 c2b=trace(G*Ap*G*Ap)
 assert abs(c1)<mp.mpf('1e-73')
 assert abs(c2a-c2b)<mp.mpf('1e-73')
 phig=[theta[i]+lam[(i+1)%N]-lam[i] for i in range(N)]
 _,Ag=build(a,phig)
 Uphase=mp.matrix(N)
 for i in range(N):Uphase[i,i]=mp.exp(1j*q*lam[i])
 assert max(abs(v) for v in Ag-Uphase*A*Uphase.transpose_conj())<mp.mpf('1e-75')
 assert abs(mp.det(Ag)/D-1)<mp.mpf('1e-75')
 print('a',a,'winding t',mp.nstr(t,22),'det j',mp.nstr(j,22),'det k',mp.nstr(k,22))
 print('  seagull',mp.nstr(seagull,20),'relax',mp.nstr(relax,20),'difference',mp.nstr(seagull-relax,20))
 print('  Tr G',mp.nstr(trG,22),'Ward contacts',mp.nstr(c2a,18),mp.nstr(c2b,18))

# Source-bright quartet versus full positive H64: multiplicities must not be conflated.
F2=4*(exact(18,Theta)[2]+exact(16,Theta)[2])
F20=4*(exact(18,mp.mpf(0))[2]+exact(16,mp.mpf(0))[2])
F_full=12*exact(10,Theta)[2]+30*exact(16,Theta)[2]+20*exact(18,Theta)[2]
F_full0=12*exact(10,mp.mpf(0))[2]+30*exact(16,mp.mpf(0))[2]+20*exact(18,mp.mpf(0))[2]
F_full_half=12*exact(10,mp.pi/2)[2]+30*exact(16,mp.pi/2)[2]+20*exact(18,mp.pi/2)[2]
assert F_full0>0 and F_full_half<0
# Holonomy-only dependence means 24x24 link Hessian has rank one when F'' != 0.
nonzero_eig=N*F2
# This trace assumes identity covariance on each quartet: NOT the original source ensemble.
S_trace=4*exact(18,Theta)[3]+4*Delta**2*exact(16,Theta)[3]
theta_golden=2*mp.pi/phi**2
Theta_golden=N*theta_golden
full_golden_slope=N*(12*exact(10,Theta_golden)[1]+30*exact(16,Theta_golden)[1]+20*exact(18,Theta_golden)[1])
assert abs(full_golden_slope)>mp.mpf('1e-30')
print('golden uniform phase derivative of full H64 logdet',mp.nstr(full_golden_slope,24))
print('Delta',mp.nstr(Delta,22),'unit-covariance source trace',mp.nstr(S_trace,22))
print("source-bright F'' generic",mp.nstr(F2,24),'zero',mp.nstr(F20,24))
print("full positive H64 F'' generic",mp.nstr(F_full,24),'zero',mp.nstr(F_full0,24))
print("full H64 F'' at half-flux",mp.nstr(F_full_half,24),'negative despite A_m>0')
print('full/source-bright stiffness ratio',mp.nstr(F_full/F2,24))
print('single nonzero source-bright link-Hessian eigenvalue',mp.nstr(nonzero_eig,24),'23 exact nulls')
print('single nonzero full H64 link-Hessian eigenvalue',mp.nstr(N*F_full,24),'23 exact nulls')
print('PASS independent 24x24 determinants, inverse traces, winding expansion, two-link Hessians, all Ward contacts')
print('PHYSICAL ARFs: NONE DERIVED')
