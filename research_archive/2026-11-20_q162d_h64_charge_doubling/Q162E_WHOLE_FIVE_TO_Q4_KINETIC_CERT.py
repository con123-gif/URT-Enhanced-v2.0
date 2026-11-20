#!/usr/bin/env python3
"""Q162e — ORIGINAL five-solid source kinetic -> original nonlinear hidden charge4.
A genuine 50-vertex all-five edge-gradient is pushed through the existing
Q101 50->8->12->20->H64 map. 60 original frustrated spin vacua, common A4.
The gradient clock is a DECLARED dimensionless dynamics, not a physical
Yukawa or quantum time; physical Q96 local Ward/Planck scale OPEN.
"""
from pathlib import Path
import math,runpy,itertools
import numpy as np
from scipy.linalg import eigh
from scipy.spatial.distance import cdist

root=Path(__file__).resolve().parent
d=runpy.run_path(str(root/'Q162D_NATIVE_Q4_H64_CLOCK_CERT.py'))
phi=d['phi'];Delta=d['Delta']
C=d['C'];P3=d['P3'];P5=d['P5'];Ph=d['Ph']
Uh=d['Uh'];original_v=d['v'];ground=[(mask,s,int(np.sum(s))) for mask,s in d['ground']];Pl=d['Pl']
pairs=list(itertools.product((-1,1),repeat=2))
solids={
 'tetrahedron':[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],
 'cube':list(itertools.product((-1,1),repeat=3)),
 'octahedron':[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],
 'dodecahedron':list(itertools.product((-1,1),repeat=3))
   +[(0,a/phi,b*phi) for a,b in pairs]
   +[(a/phi,b*phi,0) for a,b in pairs]
   +[(a*phi,0,b/phi) for a,b in pairs],
 'icosahedron':[(0,a,b*phi) for a,b in pairs]
   +[(a,b*phi,0) for a,b in pairs]
   +[(a*phi,0,b) for a,b in pairs]}
def unit(x):
 x=np.asarray(x,float)
 return x/np.linalg.norm(x,axis=1)[:,None]
def moments(x):
 x,y,z=x.T
 return np.stack([x,y,z,(x*x-y*y)/math.sqrt(2),
     (x*x+y*y-2*z*z)/math.sqrt(6),math.sqrt(2)*x*y,
     math.sqrt(2)*x*z,math.sqrt(2)*y*z],axis=1)
def invsqrt(G):
 ew,U=eigh(G)
 assert ew.min()>0
 return (U/np.sqrt(ew))@U.T

# Genuine original five-solid Eraw and one unweighted edge Dirichlet K.
E=np.vstack([moments(unit(vertices)) for vertices in solids.values()])
assert E.shape==(50,8)
G=E.T@E;Gr=invsqrt(G)
K=np.zeros((8,8))
edge_total=0
expected_edges={'tetrahedron':6,'cube':12,'octahedron':12,
                'dodecahedron':30,'icosahedron':30}
for name,vertices in solids.items():
 xyz=unit(vertices);w=moments(xyz);dist=cdist(xyz,xyz)
 shortest=np.min(dist[np.triu_indices(len(xyz),1)])
 edges=[(i,j) for i,j in itertools.combinations(range(len(xyz)),2)
        if abs(dist[i,j]-shortest)<1e-8]
 assert len(edges)==expected_edges[name]
 edge_total+=len(edges)
 for i,j in edges:
  dw=w[i]-w[j]
  K+=np.outer(dw,dw)
assert edge_total==90

# Original 12-contact chart is the whitened ORIGINAL ico harmonic block;
# the full-50 whitening Eglobal gives v50=Eglobal Iico.T s.
Iraw=moments(unit(solids['icosahedron']))
Iico=Iraw@invsqrt(Iraw.T@Iraw)
assert np.linalg.norm(Iico@Iico.T-Pl)<1e-11
kin=Gr@K@Gr
expected=[2.06532099246945]*3+[3.69291069876384]*3+[4.29787234042553]*2
assert np.max(abs(np.linalg.eigvalsh(kin)-np.array(sorted(expected))))<1e-7

def derivative(s):
 z=Iico.T@s
 zt=-kin@z
 x=Iico@z
 xt=Iico@zt
 f=(C@x)**2
 ft=2*(C@x)*(C@xt)
 u=P3@f+Delta*(P5@f)
 ut=P3@ft+Delta*(P5@ft)
 q=Ph@(u*u)
 qt=Ph@(2*u*ut)
 return z,zt,u,ut,q,qt
results=[]
for mask,s,M in ground:
 z,zt,u,ut,q,qt=derivative(s)
 rate2=2*np.vdot(u,ut).real / np.vdot(u,u).real
 rate4=2*np.vdot(q,qt).real / np.vdot(q,q).real
 assert abs(rate4-2*rate2)<1e-9
 assert np.linalg.norm(qt)>1e-8
 results.append((mask,int(M),rate2,rate4))
results=np.asarray(results,float)
rate2=results[:,2];rate4=results[:,3]
centers=[(-12.747669375272),(-12.351761140940),(-11.296778573217)]
assert all(sum(abs(rate2-c)<1e-8)==n for c,n
           in zip(centers,(12,24,24)))
assert all(sum(abs(rate4-2*c)<2e-8)==n for c,n
           in zip(centers,(12,24,24)))
# Exactly five orbit+inversion pairs (six A4 proper orbits) total:
# sizes 6,6,12,12,12,12. Verify original common proper A4 permutations.
maps=[]
for t in range(3):
 P=np.roll(np.eye(3),-t,axis=1)
 for a,b in pairs:
  R=np.diag([a,b,a*b])@P
  m=[int(np.argmin(np.linalg.norm(original_v-R@v,axis=1)))
     for v in original_v]
  assert len(set(m))==12
  assert max(np.linalg.norm(original_v[m[i]]-R@v)
             for i,v in enumerate(original_v))<1e-10
  maps.append(m)
lookup={tuple(s.astype(int)):(mask,int(M),float(rate2[i]))
        for i,(mask,s,M) in enumerate(ground)}
remaining=set(lookup)
orbits=[]
while remaining:
 s0=next(iter(remaining))
 orbit=set()
 for m in maps:
  x=np.zeros(12,int)
  for i in range(12):x[m[i]]=s0[i]
  orbit.add(tuple(x))
 assert orbit<=set(lookup)
 vals=np.array([lookup[x][2] for x in orbit])
 assert vals.max()-vals.min()<1e-10
 remaining-=orbit
 orbits.append((len(orbit),float(vals[0])))
assert sorted(n for n,_ in orbits)==[6,6,12,12,12,12]
# Original nonlinear face-square derivative checked by symmetric finite diff.
for mask,s,M in ground[::10]:
 z,zt,u,ut,q,qt=derivative(s)
 eps=1e-6
 def q_of(t):
  x=Iico@(z+t*zt)
  f=(C@x)**2
  h=P3@f+Delta*(P5@f)
  return Ph@(h*h)
 assert np.linalg.norm((q_of(eps)-q_of(-eps))/(2*eps)-qt)<1e-8
print('Q162e 190/50->8->12->20->H64 actual five-solid kinetic')
print('Q162e 3 distinct original source decay classes 12/24/24')
print('Q162e charge2 rates',centers,'charge4 rates',[2*x for x in centers])
print('Q162e native A4 orbits',sorted(orbits))
print('Q162e PASS, conditional source dynamics / physical Q96 Ward OPEN')
