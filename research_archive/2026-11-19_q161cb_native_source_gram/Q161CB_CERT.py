#!/usr/bin/env python3
"""Exact native Q161ca five-solid harmonic moment Gram spectrum."""
from itertools import product
import sympy as S
phi=(1+S.sqrt(5))/2
solids=[
("tetrahedron",[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)]),
("cube",list(product((-1,1),repeat=3))),
("octahedron",[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)]),
("dodecahedron",list(product((-1,1),repeat=3))+[(0,a/phi,b*phi) for a,b in product((-1,1),repeat=2)]+[(a/phi,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b/phi) for a,b in product((-1,1),repeat=2)]),
("icosahedron",[(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])]
blocks=[]
for name,points in solids:
 a=S.Matrix(points);radius=S.simplify(sum(a[0,j]**2 for j in range(3)))
 assert all(S.simplify(sum(a[i,j]**2 for j in range(3))-radius)==0 for i in range(a.rows))
 x,y,z=[a[:,j]/S.sqrt(radius) for j in range(3)]
 mul=lambda u,v:u.multiply_elementwise(v)
 E=S.Matrix.hstack(x,y,z,(mul(x,x)-mul(y,y))/S.sqrt(2),(mul(x,x)+mul(y,y)-2*mul(z,z))/S.sqrt(6),S.sqrt(2)*mul(x,y),S.sqrt(2)*mul(x,z),S.sqrt(2)*mul(y,z))
 assert all(S.simplify(sum(E[:,j]))==0 for j in range(8))
 blocks.append(E)
 print(name,"rank",E.rank())
E=S.Matrix.vstack(*blocks)
G=S.simplify(E.T*E)
expected=S.diag(*([S.Rational(50,3)]*3+[S.Rational(94,15)]*2+[S.Rational(104,15)]*3))
for i,j in [(0,7),(1,6),(2,5)]:
 expected[i,j]=expected[j,i]=4*S.sqrt(6)/9
assert E.shape==(50,8) and G==expected
lam=S.Symbol("lambda")
assert S.factor(G.charpoly(lam).as_expr()-(lam-S.Rational(94,15))**2*(lam**2-S.Rational(118,5)*lam+S.Rational(3088,27))**3)==0
assert S.simplify(G.det())>0
print("Q161cb EXACT PASS: native 50x8 Gram and characteristic polynomial")
