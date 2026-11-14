#!/usr/bin/env python3
"""Q107: exact native Berry Chern number and local gauge stiffness.

Rebuild original Q106 golden-centred 30-configuration spin texture and Q101
whole-five 190/50/H64 hidden-current signs. Gauge action choice is CONDITIONAL.
"""
from pathlib import Path
from itertools import combinations
from collections import Counter
import math,runpy
import numpy as np
import sympy as sp
ROOT=Path(__file__).resolve().parents[2]
q106=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q106_exact_berry_wilson/Q106_EXACT_BERRY_SPECTRUM.py'))
q101=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py'))
rt=sp.sqrt(5)
def numeric(x):return float(x[0])+math.sqrt(5)*float(x[1])
n=np.array([[numeric(x) for x in z] for z in q106['ns']])
assert n.shape==(30,3) and np.max(abs(np.linalg.norm(n,axis=1)-1))<1e-12
links=set(q106['links']);assert len(links)==60
A=np.zeros((30,30),int)
for a,b in links:A[a,b]=A[b,a]=1
assert np.all(A.sum(axis=1)==4)
old={q101['minima'][i][0]:i for i in q101['parts'][0]}
assert set(old)==set(q106['masks'])
B=np.zeros((30,30),int)
for a,b in links:
    B[a,b]=int(q101['B'][old[q106['masks'][a]],old[q106['masks'][b]]])
    B[b,a]=-B[a,b]
assert np.array_equal(abs(B),A)
tri=[(a,b,c) for a,b,c in combinations(range(30),3)
     if A[a,b] and A[b,c] and A[c,a]]
assert len(tri)==20
def canon(t):
    w=list(t)
    return min(tuple(v[k:]+v[:k]) for v in (w,list(reversed(w))) for k in range(len(w)))
pent=set()
for a in range(30):
 for b in range(30):
  if not A[a,b]:continue
  for c in range(30):
   if c in (a,b) or not A[b,c]:continue
   for d in range(30):
    if d in (a,b,c) or not A[c,d]:continue
    for e in range(30):
     if e in (a,b,c,d) or not A[d,e] or not A[e,a]:continue
     v=(a,b,c,d,e)
     if any(A[v[k],v[(k+2)%5]] for k in range(5)):continue
     pent.add(canon(v))
assert len(pent)==12
faces=[]
for f in tri+sorted(pent):
    f=list(f)
    outward=sum((np.cross(n[f[k]],n[f[(k+1)%len(f)]])
                 for k in range(len(f))),np.zeros(3))
    signed_area=outward@n[f].sum(axis=0)
    assert abs(signed_area)>.1
    if signed_area<0:f=f[::-1]
    faces.append(f)
assert len(faces)==32 and 30-60+32==2
counts=Counter((f[k],f[(k+1)%len(f)]) for f in faces for k in range(len(f)))
assert len(counts)==120 and all(c==1 for c in counts.values())
assert all(counts[a,b]==counts[b,a]==1 for a,b in links)
pauli=np.array([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]])
P=(np.eye(2)+np.einsum('aj,jkl->akl',n,pauli))/2
z3=(7-3*rt+sp.I*(1+rt))/16
z5=(24-10*rt+sp.I*(5*rt-7))/64
for f in faces:
    mat=np.eye(2,dtype=complex)
    for i in f:mat=mat@P[i]
    assert abs(np.trace(mat)-complex(z3 if len(f)==3 else z5))<3e-13
    if len(f)==3:
        assert B[f[0],f[1]]*B[f[1],f[2]]*B[f[2],f[0]]==1
    else:
        assert sum(B[f[k],f[(k+1)%5]] for k in range(5))==-5
# EXACT phase identity. z3,z5 both first-quadrant with imag>real,
# hence pi/4<alpha3,alpha5<pi/2. The product below has exactly
# negative imaginary part; 5alpha3+3alpha5 in (2pi,4pi) must be 7pi/2.
product=sp.expand_complex(z3**5*z5**3)
assert sp.simplify(sp.re(product))==0
assert sp.simplify(sp.im(product)-78125*(-1525+682*rt)/1073741824)==0
assert 682**2*5<1525**2
assert all(float(sp.re(z))>0 and float(sp.im(z))>float(sp.re(z))
           for z in (z3,z5))
a3=np.angle(complex(z3));a5=np.angle(complex(z5))
assert abs(5*a3+3*a5-7*math.pi/2)<1e-12
flux=np.array([a3 if len(f)==3 else a5 for f in faces])
assert abs(flux.sum()-14*math.pi)<1e-11
Chern=round(flux.sum()/(2*math.pi));assert Chern==7
# Opposite local spin projector I-P conjugates all Berry phases.
for f in faces:
    mat=np.eye(2,dtype=complex)
    for i in f:mat=mat@(np.eye(2)-P[i])
    assert abs(np.trace(mat)-np.conj(complex(z3 if len(f)==3 else z5)))<3e-13
print('EXACT Berry first Chern lattice number +7, opposite projector -7: PASS')
print('Triangle/pentagon principal phases:',a3,a5)
# Original 30-vertex/60-edge/32-face oriented sphere chain complex.
edges=sorted(links);index={e:i for i,e in enumerate(edges)}
D=np.zeros((60,32),int);boundary=np.zeros((30,60),int)
for (a,b),i in index.items():boundary[a,i]-=1;boundary[b,i]+=1
for j,f in enumerate(faces):
    for k in range(len(f)):
        a,b=f[k],f[(k+1)%len(f)]
        D[index[min(a,b),max(a,b)],j]+=1 if a<b else -1
assert np.array_equal(boundary@D,np.zeros((30,32),int))
assert np.array_equal(D@np.ones(32),np.zeros(60))
assert np.linalg.matrix_rank(boundary)==29 and np.linalg.matrix_rank(D)==31
# Explicit premise S=Σ(1-cos F) for a compact unit-electron U1.
# On the convex chart |F|<pi/2 with Chern=7, strict convexity and
# Jensen uniquely select F=14pi/32=7pi/16.
grad=D@np.sin(flux)
assert np.linalg.norm(grad)>1e-3  # raw Berry flux is NOT Wilson stationary
mean=7*math.pi/16
delta=mean-flux
assert abs(delta.sum())<1e-11
edge_shift=np.linalg.lstsq(D.T,delta,rcond=None)[0]
assert np.max(abs(D.T@edge_shift-delta))<1e-10
uniform=flux+D.T@edge_shift
assert np.linalg.norm(D@np.sin(uniform))<1e-10
S=lambda ff:float(np.sum(1-np.cos(ff)))
assert S(uniform)<S(flux)
c=math.cos(mean)
assert abs(c-math.sin(math.pi/16))<1e-14
H=c*(D@D.T)
spectrum=np.linalg.eigvalsh(H)
assert sum(spectrum>1e-8)==31 and sum(abs(spectrum)<1e-8)==29
# Same topology, charge, Ward, locality, no empirical inputs, but a
# different admissible action S2=Σ[(1-cos F)+(1-cos F)^2].
c2=c+2*(math.sin(mean)**2+(1-c)*c)
assert c2>c and abs(c2/c-1)>1
# S2''(F)=2+3cos(F)-4cos(F)^2>0 for cos(F)∈(0,1).
print('Original V=30 E=60 F=32, rank d=31, gauge nullity=29: PASS')
print('Convex-branch Wilson vacuum face flux 7pi/16, geometric stiffness',c)
print('Second zero-fit positive local gauge action stiffness',c2,
      'ratio',c2/c)
print('Not a physical 4D alpha: action and real-spacetime join NOT selected')
print('Q107 EXACT CHERN/WILSON-NORMALISATION CERTIFICATE: PASS')
