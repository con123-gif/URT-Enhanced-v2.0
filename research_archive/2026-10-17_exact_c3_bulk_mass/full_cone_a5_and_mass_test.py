#!/usr/bin/env python3
"""Reproduce 5-fold cone symmetry and actual coarse H64 C3 mass trace test.
No measured masses in construction; measurement numbers only printed as comparison.
"""
from pathlib import Path
import itertools, math, json
import numpy as np
from numpy.linalg import norm, eigh, eigvalsh
import cathedral_strict_64_closure as c
v,vc,edges,faces,ds,inc=c.icosahedron()
b1,b2,b3,outer,radial=c.real_tetrahedral_complex(faces)
D64=c.coarse_dirac(ds)
U0,U1,U2,U3=c.bases(v,vc,faces,ds[1],ds[2])
L=ds[2].T@ds[2]
lam,U=eigh(L)
H3=U[:,abs(lam-3)<1e-9];H5=U[:,abs(lam-5)<1e-9]
P3=H3@H3.T; P5=H5@H5.T
center=np.array([v[list(f)].sum(axis=0) for f in faces])
W=np.zeros((20,20))
for i in range(20):
 for j in range(20):
  z=sum(v[k]@np.cross(center[i],center[j]) for k in set(faces[i])&set(faces[j]))
  if abs(z)>1e-9:W[i,j]=np.sign(z)
assert norm(W@W+15*(P3+P5))<1e-9
Pzero=(5*P3+3*P5-1j*W)/8
assert norm((L+1j*W)@Pzero)<1e-9
# Exact C3 -> (1+3) of A4
rots=[]
for sign in itertools.product((-1,1),repeat=3):
 if np.prod(sign)<0:continue
 R=np.diag(sign)
 C3=np.roll(np.eye(3),1,axis=0)
 for k in range(3):rots.append(R@np.linalg.matrix_power(C3,k))
ftuples=[frozenset(f) for f in faces]
F=[]
for R in rots:
 pix=[]
 for x in v:
  ix=np.flatnonzero(norm(v-(R@x),axis=1)<1e-9)
  assert len(ix)==1
  pix.append(int(ix[0]))
 idx=[ftuples.index(frozenset(pix[j] for j in f)) for f in faces]
 perm=np.eye(20)[idx,:].T # incorrect? actual from old P[permf, range]=1 ; eye[permf,:].T gives yes
 F.append(perm)
A4mean=sum(F)/12
Psing=Pzero@A4mean@Pzero
Pgen=Pzero-Psing
assert abs(np.trace(Pgen)-3)<1e-9
TE=np.linalg.eigh(Pgen)[1][:,np.linalg.eigh(Pgen)[0]>.5]
# H64 actual mass response (choose z away from poles):
z=4.0
E=np.zeros((64,3),dtype=complex);E[43:63,:]=TE
charges,S,Y=c.species_data()
status=[]
for kind,charge in charges.items():
 M=c.dressed_64(D64,U1,U2,Y(charge))
 G=E.conj().T@np.linalg.solve(z*np.eye(64)-M,E)
 K=np.linalg.inv(G)
 a=(np.trace(K).real)/3
 anis=norm(K-a*np.eye(3))
 QQ=np.trace(K@K).real/np.trace(K).real**2
 status.append((kind,a,anis,QQ))
assert max(s[2] for s in status)<1e-10
# 5-fold rotation of original 3D cone
axis=v[0]/norm(v[0]); ang=2*np.pi/5
N=np.array([[0,-axis[2],axis[1]],[axis[2],0,-axis[0]],[-axis[1],axis[0],0]])
rot5=np.eye(3)*np.cos(ang)+np.sin(ang)*N+(1-np.cos(ang))*np.outer(axis,axis)
pix=[]
for x in v:
 ix=np.flatnonzero(norm(v-(rot5@x),axis=1)<1e-8)
 assert len(ix)==1,ix
 pix.append(int(ix[0])+1)
vertex_map={0:0, **{i+1:pix[i] for i in range(12)}}
tetra=sorted({(0,)+tuple(sorted(j+1 for j in f)) for f in faces})
simp1=sorted({q for t in tetra for q in itertools.combinations(t,2)})
simp2=sorted({q for t in tetra for q in itertools.combinations(t,3)})
simp3=tetra

def smap(items):
 idx={e:k for k,e in enumerate(items)}
 P=np.zeros((len(items),len(items)))
 for i,s in enumerate(items):
  ids=[vertex_map[j] for j in s]
  sorted_ids=tuple(sorted(ids))
  inversions=sum(ids[j]>ids[k] for j in range(len(ids)) for k in range(j+1,len(ids)))
  P[idx[sorted_ids],i]=(-1)**inversions
 return P
P0=np.zeros((13,13))
for i in range(13):P0[vertex_map[i],i]=1
P1=smap(simp1); P2=smap(simp2);P3cone=smap(simp3)
e1=norm(b1@P1-P0@b1)
e2=norm(b2@P2-P1@b2)
e3=norm(b3@P3cone-P2@b3)
L2full=b2.T@b2+b3@b3.T
Lerr=norm(L2full@P2-P2@L2full)
# face-augmented Schur equivariance consequence (assuming no unique source)
print('A5 fivefold fivefold vertex permutation index',pix)
print('Incidence equivariance residuals',e1,e2,e3,'L2 commutator',Lerr)
print('chiral zero projector rank A4 gen=',np.trace(Pgen).real)
print('coarse64 projected resolvent at z4:', status)
print('K analytic',((z*z-3)*(z*z-5))/(z*(z*z-17/4)))
assert max(e1,e2,e3,Lerr)<1e-11
out={'vertex_map':pix,'equivariance_b1':e1,'equivariance_b2':e2,'equivariance_b3':e3,'commutator_L2full':Lerr,'mass_schur_z4':status,'analytical_K_z4':((z*z-3)*(z*z-5))/(z*(z*z-17/4))}
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2))
