#!/usr/bin/env python3
"""Q105 original moving 190/50/H64 -> actual charged 16/96 & v61 192 Wilson.
Original operators only; physical coupling/stiffness not claimed selected.
"""
from pathlib import Path
from itertools import combinations
import math,runpy,sys,importlib.util
import numpy as np
import sympy as sp
from scipy.linalg import expm,block_diag
ROOT=Path(__file__).resolve().parents[2]
r=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py'))
phi=r['phi'];V=r['v'];mi=r['minima'];ids=r['parts'][0]
B=r['B'].extract(ids,ids);A=B.multiply_elementwise(B)
assert len(ids)==30 and B.T==-B and A*sp.ones(30,1)==4*sp.ones(30,1)
n=[sp.simplify(phi/4*V.T*sp.Matrix(mi[k][1])) for k in ids]
d=(1-sp.sqrt(5))/4
for k,x in zip(ids,n):
    w=V.T*sp.Matrix(mi[k][1])
    assert sp.simplify((w.T*w)[0]-16/phi**2)==0
    assert sp.simplify((x.T*x)[0]-1)==0
for a,b in combinations(range(30),2):
    if A[a,b]:assert sp.simplify((n[a].T*n[b])[0]-d)==0
sigma=[sp.Matrix([[0,1],[1,0]]),sp.Matrix([[0,-sp.I],[sp.I,0]]),sp.diag(1,-1)]
Y=sp.diag(*([sp.Rational(1,6)]*6+[-sp.Rational(1,2)]*2+
            [sp.Rational(2,3)]*3+[-sp.Rational(1,3)]*3+[-1,0]))
W=[sp.diag(*([x/2]*4+[sp.zeros(1)]*8)) for x in sigma]
S=[sp.simplify(sum((v[k]*sigma[k] for k in range(3)),sp.zeros(2))) for v in n]
Q=[sp.simplify(Y+sum((v[k]*W[k] for k in range(3)),sp.zeros(16))) for v in n]
assert all(sp.simplify(sp.trace(q*q)-sp.Rational(16,3))==0 for q in Q)
for k in (0,7,15,29):
    assert sp.factor(Q[k].charpoly().as_expr()-(Y+W[2]).charpoly().as_expr())==0
s=np.array([np.array(x,complex) for x in S])
q=np.array([np.array(x,complex) for x in Q])
H=np.zeros((480,480),complex)
i,j=next((a,b) for a,b in combinations(range(30),2) if A[a,b])
unit=(sp.eye(2)+S[i]*S[j])/sp.sqrt(2*(1+d))
reverse=(sp.eye(2)+S[j]*S[i])/sp.sqrt(2*(1+d))
assert sp.simplify(sp.expand(unit*reverse-sp.eye(2)))==sp.zeros(2)
assert sp.simplify(sp.expand(S[i]*unit-unit*S[j]))==sp.zeros(2)
for a,b in combinations(range(30),2):
    if not A[a,b]:continue
    u=(np.eye(2)+s[a]@s[b])/math.sqrt(2*(1+float(d)))
    assert np.linalg.norm(u.conj().T@u-np.eye(2))<1e-11
    u16=block_diag(u,u,u,u,np.eye(8))
    assert np.linalg.norm(q[a]@u16-u16@q[b])<1e-11
    H[16*a:16*a+16,16*b:16*b+16]=u16
    H[16*b:16*b+16,16*a:16*a+16]=u16.conj().T
assert np.linalg.norm(H-H.conj().T)<1e-12
print('All 30 pure vacua and 60 SU2 charged16 transporters: PASS')
P=[(sp.eye(2)+x)/2 for x in S]
p=np.array([np.array(x,complex) for x in P])
tri=[t for t in combinations(range(30),3) if A[t[0],t[1]]*A[t[1],t[2]]*A[t[2],t[0]]]
assert len(tri)==20
for a,b,c in tri:
    z=int(B[a,b]*B[b,c]*B[c,a])
    assert abs(np.trace(p[a]@p[b]@p[c])-(7-3*math.sqrt(5)+1j*z*(1+math.sqrt(5)))/16)<2e-13
for z in (-1,1):
    a,b,c=next(x for x in tri if B[x[0],x[1]]*B[x[1],x[2]]*B[x[2],x[0]]==z)
    assert sp.simplify(sp.trace(P[a]*P[b]*P[c])-
         (7-3*sp.sqrt(5)+sp.I*z*(1+sp.sqrt(5)))/16)==0
def can(t):
    return min(tuple(v[k:]+v[:k]) for v in (t,list(reversed(t))) for k in range(5))
pent=set()
for a in range(30):
 for b in range(30):
  if not A[a,b]:continue
  for c in range(30):
   if c in (a,b) or not A[b,c]:continue
   for d0 in range(30):
    if d0 in (a,b,c) or not A[c,d0]:continue
    for e in range(30):
     if e in (a,b,c,d0) or not A[d0,e] or not A[e,a]:continue
     v=[a,b,c,d0,e]
     if any(A[v[k],v[(k+2)%5]] for k in range(5)):continue
     pent.add(can(v))
assert len(pent)==12
reps={}
for v in pent:
    z=sum(int(B[v[k],v[(k+1)%5]]) for k in range(5))
    assert abs(z)==5
    val=np.eye(2,dtype=complex)
    for k in v:val=val@p[k]
    assert abs(np.trace(val)-(24-10*math.sqrt(5)+1j*(z/5)*(7-5*math.sqrt(5)))/64)<2e-13
    reps[z]=v
for z in (-5,5):
    val=sp.eye(2)
    for k in reps[z]:val=val*P[k]
    assert sp.simplify(sp.trace(val)-(24-10*sp.sqrt(5)+sp.I*(z/5)*(7-5*sp.sqrt(5)))/64)==0
print('All 20 triangle and 12 pentagon Berry holonomies, two exact signs: PASS')
lam=np.array([.1*math.sin((k+1)*math.sqrt(5)) for k in range(30)])
O=block_diag(*[lam[k]*q[k] for k in range(30)])
J=1j*(O@H-H@O)
K=-(O@(O@H-H@O)-(O@H-H@O)@O)
e=3e-4
G=block_diag(*[expm(1j*e*lam[k]*q[k]) for k in range(30)])
Hp=G@H@G.conj().T;Hm=G.conj().T@H@G
assert np.linalg.norm((Hp-Hm)/(2*e)-J)<1e-6
assert np.linalg.norm((Hp+Hm-2*H)/e**2-K)<1e-5
assert abs(np.trace(Hp@Hp)-np.trace(H@H))<1e-9
print('Actual 480 moving charged matrix first/second Ward: PASS')
source=ROOT/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
assert source.is_file(),source
spec=importlib.util.spec_from_file_location('q105_v61',source)
v61=importlib.util.module_from_spec(spec);sys.modules[spec.name]=v61
spec.loader.exec_module(v61)
gamma,g5=v61.gamma_matrices()
assert len(v61.SITES)==48 and len(v61.DIRECTIONS)==11
G5=np.kron(np.eye(48),g5);I=np.eye(192,dtype=complex)
def hw(x):
    return G5@(v61.wilson_operator_from_links(np.exp(1j*x.reshape(48,11)))-
          float(v61.M_EXACT)*I)
H0=hw(np.zeros(528))
assert np.linalg.norm(H0-H0.conj().T)<1e-11
omega=.13*np.sin(.3*np.arange(48)+1)
inc=np.zeros((528,48))
for a,site in enumerate(v61.SITES):
 for k,step in enumerate(v61.DIRECTIONS):
    b=v61.SITE_INDEX[v61.periodic_shift(site,step)]
    inc[11*a+k,a]=1;inc[11*a+k,b]-=1
grad=inc@omega
for charge in (-1.,-2/3,-1/3,0.,1/3,2/3,1.):
    t=.19;Ht=hw(t*charge*grad)
    G=np.diag(np.exp(1j*t*charge*np.repeat(omega,4)))
    assert np.linalg.norm(Ht-G@H0@G.conj().T)<1e-10
    O=np.diag(charge*np.repeat(omega,4))
    D1=1j*(O@H0-H0@O)
    D2=-(O@(O@H0-H0@O)-(O@H0-H0@O)@O)
    eps=3e-4
    Hp=hw(eps*charge*grad);Hm=hw(-eps*charge*grad)
    assert np.linalg.norm((Hp-Hm)/(2*eps)-D1)<1e-6
    assert np.linalg.norm((Hp+Hm-2*H0)/eps**2-D2)<1e-5
print('Real v61 192x192 Wilson 528 links, 7 actual charge sectors: both Ward orders PASS')
print('Model conditional; physical Maxwell stiffness/Yukawa poles/ARFs OPEN')
print('Q105 native broken-charge/Wilson: PASS')
