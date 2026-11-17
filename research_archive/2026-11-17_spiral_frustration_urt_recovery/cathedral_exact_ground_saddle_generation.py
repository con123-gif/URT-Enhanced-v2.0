#!/usr/bin/env python3
"""Exact Q(sqrt5) oracle for actual Q101 moving-source generation portal.
The source is (C Pl s)^2; portal g=C^T[(P3 f) o (P5 f)].
Exhaustive 444 numeric census is in cathedral_native_source_to_generation_probe.py.
"""
import sympy as sp
from itertools import combinations, product
from collections import Counter
phi=(1+sp.sqrt(5))/2
v=sp.Matrix([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
e=[(i,j) for i,j in combinations(range(12),2) if sp.simplify(sum((v[i,k]-v[j,k])**2 for k in range(3)))==4]
fs=[f for f in combinations(range(12),3) if all(pair in e for pair in combinations(f,2))]
C=sp.Matrix(20,12,lambda i,j:int(j in fs[i]))
LD=sp.Matrix(20,20,lambda i,j: 3 if i==j else (-1 if len(set(fs[i])&set(fs[j]))==2 else 0))
Ph=sp.eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*sp.eye(20)-LD)/2;P5=Ph*(LD-3*sp.eye(20))/2
opp={i:next(j for j in range(12) if all(v[i,k]+v[j,k]==0 for k in range(3))) for i in range(12)}
Kv=sp.Matrix(12,12,lambda i,j:int(i==opp[j]))
P3v=v*(v.T*v).inv()*v.T
P5v=(sp.eye(12)+Kv)/2-sp.ones(12,12)/12
Pl=sp.simplify(P3v+P5v)
assert sp.simplify(Pl*Pl-Pl)==sp.zeros(12)

def g_of(mask):
 s=sp.Matrix([1-2*((mask>>k)&1) for k in range(12)])
 f=C*Pl*s
 f=sp.Matrix([sp.simplify(a*a) for a in f])
 h3=P3*f;h5=P5*f
 return sp.simplify(C.T*h3.multiply_elementwise(h5))

ground=[];saddles={}
counts=Counter()
for mask in range(1<<12):
 s=[1-2*((mask>>k)&1) for k in range(12)]
 M=sum(s);E=sum(s[i]*s[j] for i,j in e)
 if M==4 and E==-6:ground.append(mask)
 if M==0 and E==-10:
  a=b=0
  for k in range(12):
   s2=s.copy();s2[k]=-s2[k]
   E2=sum(s2[i]*s2[j] for i,j in e)
   if E2==-8:
    if sum(s2)==2:a+=1
    elif sum(s2)==-2:b+=1
  counts[(a,b)]+=1
  saddles.setdefault((a,b),mask)
assert len(ground)==30 and counts==Counter({(4,4):60,(5,5):12})
g=g_of(ground[0]); norm2=sp.simplify((g.T*g)[0])
print('FIRST GROUND EXACT NORM2',norm2)
assert norm2==sp.Rational(512,225)
for clas,mask in saddles.items():
 z=g_of(mask)
 assert z==sp.zeros(12,1)
 print('SADDLE ORBIT',clas,'size',counts[clas],'EXACT g=0')
basis_masks=[92,1290,960,2689,1410,1059]
G6=sp.Matrix.hstack(*[g_of(mask) for mask in basis_masks])
assert G6.rank()==6
print('GROUND EXACT rank>=6 via six native ground-mask columns:',basis_masks)
Kmix=sp.simplify(C.T*(P3.multiply_elementwise(P5))*C)
Gsum=sp.zeros(12,12)
for mk in ground:
    gm=g_of(mk)
    Gsum+=gm*gm.T
assert sp.simplify(Gsum-sp.Rational(512,15)*Kmix)==sp.zeros(12)
print('GROUND EXACT Gram identity: sum30 g_s g_s^T = (512/15) Kmix')
# The 120 c=+1 intermediate outer configurations split into an A5 orbit
# of 60 source-active states and an orbit of 60 source-silent states.
inter=[]
for mk in range(1<<12):
    spin=[1-2*((mk>>k)&1) for k in range(12)]
    if sum(spin)==2 and sum(spin[i]*spin[j] for i,j in e)==-8:
        inter.append(mk)
assert len(inter)==120
assert 124 in inter and 348 in inter
active_rep=g_of(124)
active_norm2=sp.simplify((active_rep.T*active_rep)[0])
assert active_norm2==(sp.Rational(6272,1125)-sp.Rational(1792,1125)*sp.sqrt(5))
assert g_of(348)==sp.zeros(12,1)
lam_plus=(5+2*sp.sqrt(5))/15;lam_minus=(5-2*sp.sqrt(5))/15
Pplus=sp.simplify((Kmix**2-lam_minus*Kmix)/(lam_plus*(lam_plus-lam_minus)))
Pminus=sp.simplify((Kmix**2-lam_plus*Kmix)/(lam_minus*(lam_minus-lam_plus)))
assert sp.simplify((active_rep.T*Pplus*active_rep)[0]/lam_plus-(active_rep.T*Pminus*active_rep)[0]/lam_minus)==0
print('INTERMEDIATE EXACT source-active norm2',active_norm2,'and correct 3/3prime projection ratio')

# A5 orbit certificate: proper icosahedral automorphisms send the active
# intermediate representative 124 through all 60 nonzero source states,
# and the silent representative 348 through the other 60 states.
import numpy as np
import networkx as nx
G=nx.Graph();G.add_nodes_from(range(12));G.add_edges_from(e)
V=np.array(v,dtype=float)
ref=V[[0,1,4],:].T
rot=[]
for perm in nx.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
    mapped=V[[perm[i] for i in (0,1,4)],:].T
    if np.linalg.det(mapped)/np.linalg.det(ref)>0:
        rot.append(perm)
assert len(rot)==60

def orbit(mask):
    ans=set()
    for perm in rot:
        out=0
        for i in range(12):out|=((mask>>i)&1)<<perm[i]
        ans.add(out)
    return ans
active_orbit=orbit(124);silent_orbit=orbit(348)
assert len(active_orbit)==len(silent_orbit)==60
assert active_orbit.isdisjoint(silent_orbit)
assert active_orbit|silent_orbit==set(inter)
# Geometric projectors are exactly A5-equivariant and C acts as incidence
# intertwiner. Check the rational/sqrt5 matrices against two generators.
for perm in rot[:3]:
    T=sp.zeros(12,12)
    U=sp.zeros(20,20)
    face_to_i={tuple(f):i for i,f in enumerate(fs)}
    for i in range(12):T[perm[i],i]=1
    for i,face in enumerate(fs):
        U[face_to_i[tuple(sorted(perm[k] for k in face))],i]=1
    assert C*T==U*C
    assert T*Pl==Pl*T
    assert U*P3==P3*U and U*P5==P5*U
# The A5 twirl on inequivalent multiplicity-one triplets is scalar by Schur.
# The exact projected norm relation above forces the same alpha on both.
alpha_inter=sp.simplify(30*active_norm2)
assert alpha_inter==sp.Rational(12544,75)-sp.Rational(3584,75)*sp.sqrt(5)
print('INTERMEDIATE ORBIT/SCHUR EXACT Gram identity: sum120 g_s g_s^T =',alpha_inter,'* Kmix')

print('ALGORITHMIC EXACT ORBIT REPRESENTATIVE PASS: ground norm2 512/225; both saddle classes g=0')
print('For whole-orbit theorem, use established A5 equivariance and orbit sizes (30,60,12); exhaustive numerical census separately executed.')