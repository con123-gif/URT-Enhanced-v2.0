#!/usr/bin/env python3
"""Conditional full 64-history 24-clock determinant including two H64 zero modes.
No fit; no ARF targets; explicitly assumes both zero-energy channels are integrated
as charge-two complex Gaussian histories, not removed as gauge/quotient modes.
"""
import mpmath as mp
mp.mp.dps=110
N=24;q=2;r=mp.pi/mp.e;phi=(1+mp.sqrt(5))/2
th=[mp.mpf(i%5-2)/37 for i in range(N)]
lam=[mp.mpf(i%7-3)/29 for i in range(N)]
Theta=sum(th);eye=mp.eye(N)
def trace(M):return sum(M[i,i] for i in range(N))
def matrix(t):
 T=mp.matrix(N)
 for i in range(N):T[i,(i+1)%N]=mp.exp(-1j*q*t[i])
 return T,r*r*(2*eye-T-T.transpose_conj())
T,A=matrix(th);G=A**-1
D0=4*r**(2*N)*mp.sin(Theta)**2
assert abs(mp.det(A)/D0-1)<mp.mpf('1e-80')
E=mp.matrix(N);E[0,1]=T[0,1]
A1=1j*q*r*r*(E-E.transpose_conj())
A2=q*q*r*r*(E+E.transpose_conj())
j=trace(G*A1);seagull=trace(G*A2);relax=trace(G*A1*G*A1)
assert abs(j-2*mp.cot(Theta))<mp.mpf('1e-75')
assert abs(seagull-relax+2/mp.sin(Theta)**2)<mp.mpf('1e-75')
# First and second pure-gauge Ward contacts: full finite gauge covariance.
L=mp.matrix(N)
for i in range(N):L[i,i]=lam[i]
Ap=1j*q*(L*A-A*L)
App=-q*q*(L*L*A-2*L*A*L+A*L*L)
assert abs(trace(G*Ap))<mp.mpf('1e-75')
assert abs(trace(G*App)-trace(G*Ap*G*Ap))<mp.mpf('1e-75')
thg=[th[i]+lam[(i+1)%N]-lam[i] for i in range(N)]
_,Ag=matrix(thg)
U=mp.matrix(N)
for i in range(N):U[i,i]=mp.exp(1j*q*lam[i])
assert max(abs(z) for z in Ag-U*A*U.transpose_conj())<mp.mpf('1e-80')
assert abs(mp.det(Ag)/D0-1)<mp.mpf('1e-80')
# Full H64: 2 zero + positive spectrum 10(12),16(30),18(20).
def massive_k(a,Th):
 x=1+mp.mpf(a)/(2*r*r);C=mp.chebyt(N,x)
 return q*q*(C*mp.cos(q*Th)-1)/(C-mp.cos(q*Th))**2
def massive_j(a,Th):
 x=1+mp.mpf(a)/(2*r*r);C=mp.chebyt(N,x)
 return q*mp.sin(q*Th)/(C-mp.cos(q*Th))
def pos_k(Th):return 12*massive_k(10,Th)+30*massive_k(16,Th)+20*massive_k(18,Th)
def pos_j(Th):return 12*massive_j(10,Th)+30*massive_j(16,Th)+20*massive_j(18,Th)
full_k=-4/mp.sin(Theta)**2+pos_k(Theta)
assert full_k<0
thgold=2*mp.pi/phi**2;gold=N*thgold
slope_full=N*(4*mp.cot(gold)+pos_j(gold))
assert abs(slope_full)>1
print('zero-sector det A0',mp.nstr(D0,28))
print('single-mode current',mp.nstr(j,28),'seagull',mp.nstr(seagull,28),'relax',mp.nstr(relax,28))
print('two zero-mode curvature',mp.nstr(-4/mp.sin(Theta)**2,28))
print('positive-62 curvature',mp.nstr(pos_k(Theta),28))
print('full-64 conditional curvature',mp.nstr(full_k,28))
print('golden uniform-angle slope full 64',mp.nstr(slope_full,28))
print('golden uniform-angle slope quotient 62',mp.nstr(N*pos_j(gold),28))
print('PASS direct nonuniform 24x24 determinant, first/second Ward contacts, gauge conjugation, full H64 comparison')
print('NOTE: conditional zero-mode integration; physical gauge quotient not decided; four ARFs OPEN')
