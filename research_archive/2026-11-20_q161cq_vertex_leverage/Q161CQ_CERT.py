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
blocks=[]
for name,points in solids:
 a=S.Matrix(points)
 r=S.simplify(sum(a[0,j]**2 for j in range(3)))
 assert all(S.simplify(sum(a[i,j]**2 for j in range(3))-r)==0 for i in range(a.rows))
 x,y,z=[a[:,j]/S.sqrt(r) for j in range(3)]
 m=lambda u,v:u.multiply_elementwise(v)
 E=S.Matrix.hstack(x,y,z,(m(x,x)-m(y,y))/S.sqrt(2),(m(x,x)+m(y,y)-2*m(z,z))/S.sqrt(6),S.sqrt(2)*m(x,y),S.sqrt(2)*m(x,z),S.sqrt(2)*m(y,z))
 blocks.append(E)
E=S.Matrix.vstack(*blocks)
G=S.simplify(E.T*E)
assert E.shape==(50,8) and G.rank()==8
Ginv=G.inv()
expected=[
 {S.Rational(549,3860):4},
 {S.Rational(549,3860):4,S.Rational(669,3860):4},
 {S.Rational(15149,90710):6},
 {S.Rational(549,3860):4,S.Rational(89219,544260):12,S.Rational(669,3860):4},
 {S.Rational(29293,181420):12}
]
total=S.Integer(0)
for (name,_),block,want in zip(solids,blocks,expected):
 vals=[S.simplify((block.row(i)*Ginv*block.row(i).T)[0]) for i in range(block.rows)]
 assert all(0<v<1 for v in vals)
 got=dict(Counter(vals))
 assert got==want,(name,got,want)
 total+=sum(vals)
 print(name,got)
assert S.simplify(total-8)==0
print("Q161cq EXACT PASS: native five-solid vertex leverages, trace 8")
