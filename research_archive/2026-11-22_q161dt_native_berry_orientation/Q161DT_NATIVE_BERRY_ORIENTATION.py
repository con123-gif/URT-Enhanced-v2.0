#!/usr/bin/env python3
"""Native Q124/Q125 contact-square orientation determinant over Q(phi)."""
from itertools import product,combinations
from collections import Counter
from math import sqrt
phi=(1+sqrt(5))/2
V=([((0,0),(a,0),(0,b)) for a,b in product((-1,1),repeat=2)]
 +[((a,0),(0,b),(0,0)) for a,b in product((-1,1),repeat=2)]
 +[((0,a),(0,0),(b,0)) for a,b in product((-1,1),repeat=2)])
def add(x,y):return (x[0]+y[0],x[1]+y[1])
def neg(x):return (-x[0],-x[1])
def mul(x,y):return (x[0]*y[0]+x[1]*y[1],x[0]*y[1]+x[1]*y[0]+x[1]*y[1])
def det(a,b,c):
 return add(add(mul(a[0],add(mul(b[1],c[2]),neg(mul(b[2],c[1])))),
  neg(mul(a[1],add(mul(b[0],c[2]),neg(mul(b[2],c[0])))))),
  mul(a[2],add(mul(b[0],c[1]),neg(mul(b[1],c[0])))))
xyz=[[a+b*phi for a,b in v] for v in V]
edges={(i,j) for i,j in combinations(range(12),2)
 if abs(sum((xyz[i][k]-xyz[j][k])**2 for k in range(3))-4)<1e-10}
assert len(edges)==30
states=set()
for mask in range(8192):
 s=[1-2*((mask>>i)&1) for i in range(12)]
 c=1-2*((mask>>12)&1)
 if sum(s[i]*s[j] for i,j in edges)+phi*c*sum(s)<-10+1e-10:
  states.add(mask)
assert len(states)==444
counts=Counter();total=0
for m in sorted(states):
 for a,b in combinations(range(12),2):
  ma=m^(1<<a);mb=m^(1<<b);mab=ma^(1<<b)
  if min(m,ma,mb,mab)!=m or not {ma,mb,mab}<=states:continue
  s=[1-2*((m>>i)&1) for i in range(12)]
  W=[(sum(s[i]*V[i][k][0] for i in range(12)),
      sum(s[i]*V[i][k][1] for i in range(12))) for k in range(3)]
  d=det(W,V[a],V[b])
  antipodal=all(abs(xyz[a][k]+xyz[b][k])<1e-10 for k in range(3))
  counts[('antipodal' if antipodal else 'nonantipodal',d==(0,0))]+=1
  total+=1
assert total==480
assert counts=={('antipodal',True):120,('nonantipodal',False):360},counts
print('Q161dt exact Q(phi) orientation determinants: 120 antipodal zero; 360 nonantipodal nonzero')
print('Scope: native Q124/Q125 axes; SU(2) Wilson holonomy not yet evaluated')
