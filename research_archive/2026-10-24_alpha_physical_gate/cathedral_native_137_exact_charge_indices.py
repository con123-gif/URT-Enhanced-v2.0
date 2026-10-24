#!/usr/bin/env python3
"""Independent exact-rational Cathedral Coulomb–chirality–matter trace certificate.
No experimental alpha or candidate formula input. The indices do NOT
themselves establish the physically normalized photon kinetic coefficient.
"""
import itertools,json,numpy as np,sympy as s
from fractions import Fraction as F
phi=(1+5**.5)/2
v=[]
for a,b in itertools.product((-1,1),repeat=2):
    v.extend(((0,a,b*phi),(a,b*phi,0),(b*phi,0,a)))
v=np.asarray(v,float)
edges={(i,j) for i,j in itertools.combinations(range(12),2)
       if abs(np.linalg.norm(v[i]-v[j])-2)<1e-9}
faces=[f for f in itertools.combinations(range(12),3)
       if all(tuple(sorted(x)) in edges for x in itertools.combinations(f,2))]
assert (len(v),len(edges),len(faces))==(12,30,20)
centres=[v[list(f)].sum(axis=0) for f in faces]
A=s.zeros(20);W=s.zeros(20)
for i in range(20):
    for j in range(20):
        if i==j:continue
        shared=set(faces[i])&set(faces[j])
        A[i,j]=int(len(shared)==2)
        orientation=sum(v[k]@np.cross(centres[i],centres[j]) for k in shared)
        W[i,j]=int(np.sign(orientation)) if abs(orientation)>1e-7 else 0
L=3*s.eye(20)-A
assert W==-W.T and L*s.ones(20,1)==s.zeros(20,1)
x=s.symbols('x')
expect=x*(x-2)**5*(x-3)**4*(x-5)**4*(x*x-6*x+4)**3
assert s.expand(L.charpoly(x).as_expr()-expect)==0
J=s.ones(20)/20
G=(L+J).inv()-J
P=-(W**2)/15
P3=P*(5*s.eye(20)-L)/2
P5=P*(L-3*s.eye(20))/2
assert P**2==P and s.trace(P3)==s.trace(P5)==4
assert (W**4+15*W**2)==s.zeros(20)
M=W.T*G*W
assert M==3*P3+5*P5
assert all(M[k,k]==s.Rational(8,5) for k in range(20))
assert s.trace(G)==s.Rational(137,15)
assert s.trace(P3*M)==12 and s.trace(P5*M)==20
assert s.trace((s.eye(20)-P)*G)==7
ql=[F(0),F(-1),F(-1),F(0)]
qq=[F(2,3)]*3+[F(-1,3)]*3+[F(2,3)]*3+[F(-1,3)]*3
assert 6*sum(q*q for q in ql)==12
assert 6*sum(q*q for q in qq)==20
print(json.dumps({'laplacian_characteristic_polynomial':str(s.factor(expect)),
'local_chiral_source_Coulomb_energy_twice':'8/5',
'photon_native_chiral_3_sector_index':12,'matter_lepton_charge_index':12,
'photon_native_chiral_5_sector_index':20,'matter_quark_charge_index':20,
'nonchiral_Coulomb_complement_index':105,
'integer_137':'15 Tr(L^+)=12+20+105=137',
'physical_alpha_derived':False},indent=2))
