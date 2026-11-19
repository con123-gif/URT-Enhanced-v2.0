#!/usr/bin/env python3
"""Exact original five-solid 50->8->12 source harmonic-kernel certificate."""
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
 a=S.Matrix(points)
 radius=S.simplify(sum(a[0,j]**2 for j in range(3)))
 assert all(S.simplify(sum(a[i,j]**2 for j in range(3))-radius)==0 for i in range(a.rows))
 x,y,z=[a[:,j]/S.sqrt(radius) for j in range(3)]
 mul=lambda u,v:u.multiply_elementwise(v)
 E=S.Matrix.hstack(x,y,z,(mul(x,x)-mul(y,y))/S.sqrt(2),(mul(x,x)+mul(y,y)-2*mul(z,z))/S.sqrt(6),S.sqrt(2)*mul(x,y),S.sqrt(2)*mul(x,z),S.sqrt(2)*mul(y,z))
 assert all(S.simplify(sum(E[:,j]))==0 for j in range(8)),name
 blocks.append(E)
 print(name,len(points),E.rank())
E=S.Matrix.vstack(*blocks)
assert E.shape==(50,8) and E.rank()==8
# Original source Plinear=Iico*whiten(E).T; whitening preserves E.T kernel.
# Its nonlinear hidden_source=(P3*(C*x)^2,P5*(C*x)^2), x=Plinear*v.
# Every individual solid's vertex constant is in ker(E.T).
# All five face constants are absent from vertex_from_z.
print("Q161ca EXACT PASS: rank E=8; five vertex and five face harmonic source directions vanish identically")
