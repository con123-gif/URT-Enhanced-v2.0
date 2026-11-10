#!/usr/bin/env python3
"""No-fit conditional A5 history Dirichlet spectral theorem; not physical ARFs."""
from itertools import permutations, combinations
from math import cos, pi
import numpy as np
import sympy as sp
import mpmath as mp
N=64
Q2=np.zeros((N,N),dtype=np.int64)
for h in range(N):Q2[h,2*h%N]=Q2[h,(2*h+1)%N]=1
Q=Q2/2
H=15*np.eye(N,dtype=np.int64)
for i,j in combinations(range(6),2):
 for h in range(N):H[h,h^(1<<i)^(1<<j)]-=1
A4=(2*np.eye(N,dtype=np.int64)-Q2).T@(2*np.eye(N,dtype=np.int64)-Q2)
A=A4/4;K=H+A
assert np.array_equal(H@Q2,Q2@H)
W=np.array([[(-1)**((h&m).bit_count()) for m in range(N)] for h in range(N)],dtype=np.int64)
assert np.array_equal(W.T@W,64*np.eye(N,dtype=np.int64))
Qw=W.T@Q@W/64
seen=set();counts={};pred=[0.]
for mask in range(1,64):
 bits=[i for i in range(6) if mask>>i&1]
 anchor=sum(1<<(i-min(bits)) for i in bits)
 if anchor in seen:continue
 L=6-(max(bits)-min(bits));chain=[anchor<<j for j in range(L)]
 assert all(c not in seen for c in chain)
 seen.update(chain);k=len(bits);counts[k,L]=counts.get((k,L),0)+1
 for j,c in enumerate(chain):
  expect=np.zeros(64)
  if j:expect[chain[j-1]]=1
  assert np.max(abs(Qw[:,c]-expect))<1e-12
 for j in range(1,L+1):pred.append(2*k*(6-k)+2-2*cos((2*j-1)*pi/(2*L+1)))
assert len(seen)==63
assert np.max(abs(np.sort(pred)-np.linalg.eigvalsh(K)))<1e-10
assert np.allclose(K@W[:,0],0) and np.allclose(K@W[:,63],W[:,63])
for L in range(1,7):
 M=sp.diag(*([1]+[2]*(L-1)))
 for j in range(L-1):M[j,j+1]=M[j+1,j]=-1
 z=sp.symbols('z');p=M.charpoly(z).as_expr()
 assert sp.expand(p-(-1)**L*(sp.chebyshevu(L,1-z/2)-sp.chebyshevu(L-1,1-z/2)))==0
def mul(p,q):return tuple(p[q[i]] for i in range(5))
def power(p,n):
 a=tuple(range(5))
 for _ in range(n):a=mul(a,p)
 return a
def order(p):return next(n for n in (1,2,3,5) if power(p,n)==tuple(range(5)))
G=[p for p in permutations(range(5)) if sum(p[i]>p[j] for i in range(5) for j in range(i+1,5))%2==0]
cyc=(1,2,3,4,0);C5={power(cyc,n) for n in range(5)}
cosets=sorted({frozenset(mul(g,h) for h in C5) for g in G},key=lambda c:min(c))
ix={c:i for i,c in enumerate(cosets)}
normal=[g for g in G if {mul(mul(g,h),tuple(g.index(i) for i in range(5))) for h in C5}==C5]
n=next(g for g in normal if g not in C5 and order(g)==2)
opp=[ix[frozenset(mul(mul(min(c),n),h) for h in C5)] for c in cosets]
pairs=[];used=set()
for i in range(12):
 if i not in used:pairs.append((i,opp[i]));used.update((i,opp[i]))
assert len(pairs)==6
states=[frozenset(pair[(h>>j)&1] for j,pair in enumerate(pairs)) for h in range(64)]
lookup={s:i for i,s in enumerate(states)}
perms64=[]
for g in G:
 p=[ix[frozenset(mul(g,h) for h in c)] for c in cosets]
 perms64.append(np.array([lookup[frozenset(p[i] for i in s)] for s in states]))
assert len({tuple(p) for p in perms64})==60
Abar240=np.zeros((64,64),dtype=np.int64)
Qbar120=np.zeros((64,64),dtype=np.int64)
P4_15=np.zeros((64,64),dtype=np.int64)
chi4={1:4,2:0,3:1,5:-1}
for g,p in zip(G,perms64):
 Abar240+=A4[np.ix_(p,p)]
 Qbar120+=Q2[np.ix_(p,p)]
 P4_15[p,np.arange(64)]+=chi4[order(g)]
for p in perms64:assert np.array_equal(Abar240[np.ix_(p,p)],Abar240)
assert np.array_equal(Abar240@H,H@Abar240)
assert np.array_equal(P4_15@P4_15,15*P4_15)
assert np.array_equal(P4_15@Abar240,Abar240@P4_15)
assert np.array_equal(Abar240@W[:,0],np.zeros(64,dtype=np.int64))
assert np.array_equal(Abar240@W[:,63],240*W[:,63])
V14400=60*Abar240-(120*np.eye(64,dtype=np.int64)-Qbar120).T@(120*np.eye(64,dtype=np.int64)-Qbar120)
assert np.trace(V14400)==427680 and np.linalg.eigvalsh(V14400.astype(float))[0]>-1e-8
KW=W.T@(240*H+Abar240)@W
PW=W.T@P4_15@W
assert np.all(KW%64==0) and np.all(PW%64==0)
KW//=64;PW//=64
z=sp.symbols('z')
expected={
 0:z,
 1:(z*z-5680*z+8033600)**3,
 2:(z-4304)**5*(z-4256)**4*(z-4176)**6,
 3:(z-4728)**6*(z-4692)**4*(z-4668)**4*(z-4632)**6,
 4:(z-4192)**5*(z-4168)**4*(z-4128)**6,
 5:(z*z-5360*z+7181120)**3,
 6:z-240}
for k in range(7):
 ids=[m for m in range(64) if m.bit_count()==k]
 a=sp.Matrix(KW[np.ix_(ids,ids)].tolist())
 assert sp.expand(a.charpoly(z).as_expr()-expected[k])==0
 if k in (2,3,4):
  p=sp.Matrix(PW[np.ix_(ids,ids)].tolist())
  rank=int(sp.trace(p)/15)
  assert rank=={2:4,3:8,4:4}[k]
  s1=sp.Rational(sp.trace(p*a),15*240*4)
  s2=sp.Rational(sp.trace(p*a*a),15*240**2*4)
  if k==3:assert sp.expand(z*z-s1*z+(s1*s1-s2)/2-(z-sp.Rational(391,20))*(z-sp.Rational(389,20)))==0
  else:assert s1=={2:sp.Rational(266,15),4:sp.Rational(521,30)}[k]
assert abs(np.linalg.eigvalsh(H+Abar240/240)[1]-1)<1e-10
r=pi/np.e;theta=np.array([(t%5-2)/37 for t in range(24)])
lam=np.array([(t*t%11)/17 for t in range(24)])
T=np.zeros((24,24),complex);Tp=T.copy()
for t in range(24):
 T[t,(t+1)%24]=np.exp(-2j*theta[t])
 Tp[t,(t+1)%24]=np.exp(-2j*(theta[t]+lam[(t+1)%24]-lam[t]))
D=np.diag(np.exp(2j*lam));assert np.max(abs(Tp-D@T@D.conj().T))<1e-13
L2=2*np.eye(24)-T-T.conj().T
for energy in (0.,1.,16.):
 M=energy*np.eye(24)+r*r*L2;R=np.linalg.inv(M);Z=np.diag(lam)
 J=2j*(Z@M-M@Z);C=Z@M-M@Z;Wcontact=-4*(Z@C-C@Z)
 assert abs(np.trace(R@J))<1e-7
 assert abs(np.trace(R@Wcontact)-np.trace(R@J@R@J))<1e-7
mp.mp.dps=65;rr=mp.pi/mp.e;th=-mp.mpf(2)/37;root5=mp.sqrt(5)
levels=[(mp.mpf(1),1),((71+2*root5)/6,3),((71-2*root5)/6,3),((335+2*root5)/30,3),((335-2*root5)/30,3)]
levels +=[(mp.mpf(269)/15,5),(mp.mpf(266)/15,4),(mp.mpf(87)/5,6),(mp.mpf(262)/15,5),(mp.mpf(521)/30,4),(mp.mpf(86)/5,6)]
levels +=[(mp.mpf(197)/10,6),(mp.mpf(391)/20,4),(mp.mpf(389)/20,4),(mp.mpf(193)/10,6)]
assert sum(mult for _,mult in levels)==63
fpos=mp.mpf(0)
for energy,mult in levels:
 c=mp.cosh(24*mp.acosh(1+energy/(2*rr*rr)));u=mp.cos(2*th)
 fpos+=mult*4*(c*u-1)/(c-u)**2
fzero=-2/mp.sin(th)**2
print('A5 quartet energies: 266/15, 389/20, 391/20, 521/30')
print('history gap: 1; Tr K: 1054; frame variance Tr V: 297/10')
print('24-clock conditional Fpos:',mp.nstr(fpos,30),'Fzero:',mp.nstr(fzero,30))
print('PASS exact Walsh chains, 60 A5 rotations, all 7 characteristic polynomials, quartet projector, temporal Ward contacts')
