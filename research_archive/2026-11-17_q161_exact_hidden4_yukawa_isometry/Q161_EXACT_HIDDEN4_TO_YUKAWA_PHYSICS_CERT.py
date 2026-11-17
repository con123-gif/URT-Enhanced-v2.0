#!/usr/bin/env python3
"""Exact original 20-face hidden 4_3 to 3x3 Yukawa-4 channel.
Includes original Q101 full-five downstream geometry (not a stand-in state),
proper A5 symmetry, 30 genuine frustrated ground words and actual mass test.
Physical Yukawa normalization and sector assignment NOT assumed proved.
"""
from itertools import product, combinations
import numpy as np, sympy as sp, networkx as nx, json, sys
rt=sp.sqrt(5);phi=(1+rt)/2
v=sp.Matrix([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
 +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
 +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
edges=[(i,j) for i,j in combinations(range(12),2) if
 sp.simplify(sum((v[i,k]-v[j,k])**2 for k in range(3)))==4]
faces=[f for f in combinations(range(12),3) if all(q in edges for q in combinations(f,2))]
assert (len(edges),len(faces))==(30,20)
C=sp.Matrix(20,12,lambda i,j:int(j in faces[i]))
L=sp.Matrix(20,20,lambda i,j:3 if i==j else
  -int(len(set(faces[i])&set(faces[j]))==2))
Ph=sp.eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*sp.eye(20)-L)/2;P5=Ph*(L-3*sp.eye(20))/2
assert P3.rank()==P5.rank()==4 and P3*P5==sp.zeros(20)
K=C.T*P3.multiply_elementwise(P5)*C
lo=(5-2*rt)/15;hi=(5+2*rt)/15
Plo=sp.simplify((K*K-hi*K)/(lo*(lo-hi)))
Phi=sp.simplify((K*K-lo*K)/(hi*(hi-lo)))
assert Plo.rank()==Phi.rank()==3
# Native oriented face circulation, one antisymmetric vertex 12x12 operator per face.
OO=[]
for i,j,k in faces:
 det=sp.det(sp.Matrix.vstack(v.row(i),v.row(j),v.row(k)))
 assert sp.simplify(det)!=0
 if det<0:j,k=k,j
 O=sp.zeros(12)
 for a,b in ((i,j),(j,k),(k,i)):
  O[a,b]+=1;O[b,a]-=1
 OO.append(O)
# G_ff'=Tr(Phi O_f^T Plo O_f') for the canonical 20-face->Yukawa operator.
# Row 0 is checked EXACTLY in Q(sqrt5); proper A5 is transitive on faces,
# so equivariance propagates the row to every row, proving G=(3/2)P3.
for j,O in enumerate(OO):
 G0j=sp.simplify(sp.trace(Phi*OO[0].T*Plo*O))
 assert sp.simplify(G0j-sp.Rational(3,2)*P3[0,j])==0,(j,G0j)
# Independent NUMERICAL all-entry Gram plus A5 Yukawa projector.
V=np.array(v,float); Cf=np.array(C,float);Pl3=V@np.linalg.inv(V.T@V)@V.T
opp={i:next(j for j in range(12) if np.linalg.norm(V[i]+V[j])<1e-10) for i in range(12)}
Popp=np.zeros((12,12));
for i,j in opp.items():Popp[i,j]=1
Pl=Pl3+(np.eye(12)+Popp)/2-np.ones((12,12))/12
assert np.linalg.norm(Pl@Pl-Pl)<1e-11
KL=np.array(K,float);values,U=np.linalg.eigh(KL)
Ul=U[:,(values>1e-8)&(values<.1)];Uh=U[:,values>.1]
assert Ul.shape==Uh.shape==(12,3)
T=np.stack([(Ul.T@np.array(O,float)@Uh).reshape(9,order='F') for O in OO],axis=1)
P3f=np.array(P3,float);P5f=np.array(P5,float)
assert np.linalg.norm(T.T@T-1.5*P3f)<1e-10
assert np.linalg.norm(T@P5f)<1e-10
G=nx.Graph();G.add_nodes_from(range(12));G.add_edges_from(edges)
allautom=list(nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter())
assert len(allautom)==120
perms=[]
for mapping in allautom:
 perm=tuple(mapping[i] for i in range(12))
 if np.linalg.det(V[list(perm[:3])]) * np.linalg.det(V[:3])>0: # first three vertices may be coplanar; use face instead
  pass
 # Use one genuinely oriented face and proper-orientation determinant.
 a,b,c=faces[0]
 if np.linalg.det(V[[perm[a],perm[b],perm[c]]])*np.linalg.det(V[[a,b,c]])>0:perms.append(perm)
assert len(perms)==60
P4=np.zeros((9,9));P5Y=np.zeros((9,9));maxcov=0
for perm in perms:
 P=np.zeros((12,12))
 for i,j in enumerate(perm):P[j,i]=1
 RL=Ul.T@P@Ul;RH=Uh.T@P@Uh
 o=np.arange(12);order=0
 while True:
  o=np.asarray(perm)[o];order+=1
  if np.array_equal(o,np.arange(12)):break
 assert order in (1,2,3,5)
 X=np.kron(RH,RL)
 P4+=(4/60)*{1:4,2:0,3:1,5:-1}[order]*X
 P5Y+=(5/60)*{1:5,2:1,3:-1,5:0}[order]*X
assert np.linalg.norm(P4@P4-P4)<1e-10
assert np.linalg.norm(P5Y@P5Y-P5Y)<1e-10
assert np.linalg.norm(P4+P5Y-np.eye(9))<1e-10
assert np.linalg.norm(T@T.T-1.5*P4)<1e-10
# Real Q101 hidden W: outward geometric axial 20-face skew matrix.
centres=np.asarray([sum(V[k] for k in face) for face in faces]);W=np.zeros((20,20))
for i in range(20):
 for j in range(20):
  chir=sum(V[k]@np.cross(centres[i],centres[j]) for k in set(faces[i])&set(faces[j]))
  if abs(chir)>1e-10:W[i,j]=np.sign(chir)
assert np.linalg.norm(W@W+15*(P3f+P5f))<1e-10
T5=T@W@P5f/np.sqrt(15)
assert np.linalg.norm(T5.T@T5-1.5*P5f)<1e-10
# Actual native 30-state frustrated ground orbit: Eouter=-6, M=4.
allY=[];source=[]
for mask in range(4096):
 s=np.array([1-2*((mask>>i)&1) for i in range(12)])
 if s.sum()!=4 or sum(s[i]*s[j] for i,j in edges)!=-6:continue
 f=(Cf@Pl@s)**2
 y5=(Ul.T@np.diag(Cf.T@f)@Uh).reshape(9,order='F')
 y43=T@(P3f@f);y45=T@(W@(P5f@f))/np.sqrt(15)
 assert np.linalg.norm(P4@y5)<1e-10 and np.linalg.norm(P5Y@y5-y5)<1e-10
 assert np.linalg.norm(P4@y43-y43)<1e-10 and np.linalg.norm(P4@y45-y45)<1e-10
 source.append((float(y5@y5),float(y43@y43),float(y45@y45),float(y43@y45)))
 allY.append(y5.reshape(3,3,order='F'))
assert len(allY)==30
assert np.max(abs(np.array(source)-np.array([276/125,48/5,16/5,0.])))<2e-11
Ymean=sum(allY)/30;Gmean=sum(Y.T@Y for Y in allY)/30
assert np.linalg.norm(Ymean)<1e-12
assert np.linalg.norm(Gmean-(92/125)*np.eye(3))<1e-12
m=np.sort(np.linalg.svd(allY[0],compute_uv=False))
assert abs(m[0]+m[1]-m[2])<1e-12
assert np.max([np.max(abs(np.sort(np.linalg.svd(Y,compute_uv=False))-m)) for Y in allY])<1e-11
# The original up/down generation tensor is identical, so without extra
# sector-dependent dynamics CKM is the identity, not a nonzero Cabibbo angle.
ratio01=float(m[0]/m[1]);ratio12=float(m[1]/m[2]);
result={'kind':'exact native downstream representation theorem and 30-ground source audit',
'full_machine':'Q101 original all-five 190 cochains, H64, 24-track remain upstream',
'Gram_hidden_4_to_Yukawa_4':'T^T T=(3/2) P_4_3, T T^T=(3/2) Pi_4',
'hidden_W_partner':'(T W P_4_5/sqrt15)^T(T W P_4_5/sqrt15)=(3/2)P_4_5',
'source_norms_square':[276/125,48/5,16/5],
'Y5_orbit_averaged_Gram':'(92/125) I_3',
'naive_mass_ratios':[ratio01,ratio12],
'physical_mass_Yukawa_normalization_derived':False,
'physical_CKM_predicted':False}
print('EXACT HIDDEN 4_3 -> YUKAWA 4 GRAM 3/2; ORIGINAL W 4_5 -> 4 GRAM 3/2')
print('30 ORIGINAL SOURCE NORMS Y5²,Y43²,Y45²,cross',source[0])
print('ORIGINAL Y5 CONSTRAINT m1/m2,m2/m3',ratio01,ratio12)
print('A5 30-GROUND COVARIANT AVERAGE <Y>=0, <Y^T Y>=92/125 I3')
print('FINISHED CONDITIONAL REPRESENTATION BRIDGE; Yukawa dynamics/observables NOT derived')
if len(sys.argv)>1:
 from pathlib import Path
 out=Path(sys.argv[1]);out.parent.mkdir(parents=True,exist_ok=True)
 out.write_text(json.dumps(result,indent=2))