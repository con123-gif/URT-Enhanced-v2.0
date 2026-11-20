#!/usr/bin/env python3
"""Exact native Q161ca/Q161cb five-solid vertex leverage."""
from itertools import product
from collections import Counter
import sympy as S

phi=(1+S.sqrt(5))/2
solids=[
 ('tetrahedron',[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)]),
 ('cube',list(product((-1,1),repeat=3))),
 ('octahedron',[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)]),
 ('dodecahedron',list(product((-1,1),repeat=3))+[(0,S.Integer(a)/phi,b*phi) for a,b in product((-1,1),repeat=2)]+[(S.Integer(a)/phi,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,S.Integer(b)/phi) for a,b in product((-1,1),repeat=2)]),
 ('icosahedron',[(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
]

# Original five-solid unit linear harmonics: exact cubic source tensor.
T={(i,j,k):S.Integer(0) for i,j,k in product(range(3),repeat=3)}
for name,points in solids:
 a=S.Matrix(points)
 r=S.simplify(sum(a[0,j]**2 for j in range(3)))
 assert all(S.simplify(sum(a[v,j]**2 for j in range(3))-r)==0 for v in range(a.rows))
 x=a/S.sqrt(r)
 for i,j,k in product(range(3),repeat=3):
  val=S.simplify(sum(x[v,i]*x[v,j]*x[v,k] for v in range(x.rows)))
  if name!='tetrahedron': assert val==0,(name,i,j,k,val)
  T[i,j,k]+=val
for i,j,k in product(range(3),repeat=3):
 expected=4/(3*S.sqrt(3)) if sorted((i,j,k))==[0,1,2] else S.Integer(0)
 assert S.simplify(T[i,j,k]-expected)==0,(i,j,k,T[i,j,k])
print('Q161ct EXACT PASS: native five-solid odd cubic has six nonzero xyz permutations = 4*sqrt(3)/9; other 21 zero')
