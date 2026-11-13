#!/usr/bin/env python3
"""Q79: exact original icosahedral face-source quadratic weights by vertex-pair orbit."""
import itertools
import sympy as s
from itertools import combinations
phi=(1+s.sqrt(5))/2
v=[(0,a,b*phi) for a,b in itertools.product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in itertools.product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in itertools.product((-1,1),repeat=2)]
def dist2(i,j):return s.simplify(sum((v[i][k]-v[j][k])**2 for k in range(3)))
edge={(i,j) for i,j in combinations(range(12),2) if dist2(i,j)==4}
faces=[t for t in combinations(range(12),3) if all(tuple(sorted((i,j))) in edge for i,j in combinations(t,2))]
assert len(faces)==20 and len(edge)==30
C=s.zeros(20,12)
for f,t in enumerate(faces):
 for i in t:C[f,i]=1
Ph=s.eye(20)-C*(C.T*C).inv()*C.T
L=s.zeros(20)
for i in range(20):
 L[i,i]=3
 for j in range(20):
  if i!=j and len(set(faces[i])&set(faces[j]))==2:L[i,j]=-1
P3=Ph*(5*s.eye(20)-L)/2
P5=Ph*(L-3*s.eye(20))/2
assert P3*P3==P3 and P5*P5==P5 and P3*P5==s.zeros(20)
assert s.trace(P3)==s.trace(P5)==4
# Native Nov7 hidden_source: h_s=P_s[(C x)⊙²].
vals={};counts={}
for i,j in combinations(range(12),2):
 z=C[:,i]+C[:,j];f=z.multiply_elementwise(z)
 h3=P3*f;h5=P5*f
 typ='edge' if (i,j) in edge else ('antipodal' if all(s.simplify(v[i][k]+v[j][k])==0 for k in range(3)) else 'other')
 vals.setdefault(typ,set()).add((s.simplify((h3.T*h3)[0]),s.simplify((h5.T*h5)[0])))
 counts[typ]=counts.get(typ,0)+1
assert counts=={'other':30,'edge':30,'antipodal':6}
assert vals=={'other':{(s.S.Zero,s.S.Zero)},'edge':{(s.Rational(8,5),s.Rational(8,15))},'antipodal':{(s.S.Zero,s.S.Zero)}}
# Single-vertex impulses vanish because (C e_i)^2=C e_i and P_h C=0.
for i in range(12):
 z=C[:,i]
 assert Ph*z.multiply_elementwise(z)==s.zeros(20,1)
print('Q79_EXACT_NATIVE_SOURCE_ORBITS',counts)
print('Q79_EDGE_HIDDEN_WEIGHTS',(s.Rational(8,5),s.Rational(8,15)))
print('Q79_NATIVE_NONLINEAR_SOURCE_PASS')
