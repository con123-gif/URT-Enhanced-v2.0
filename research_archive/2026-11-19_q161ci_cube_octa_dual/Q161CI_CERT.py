#!/usr/bin/env python3
"""Q161ci exact cube+octahedron native 14x8 harmonic-source Gram certificate."""
from itertools import product
import sympy as S
solids=[("cube",list(product((-1,1),repeat=3))),
("octahedron",[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)])]
blocks=[]
for name,points in solids:
 a=S.Matrix(points)
 r=sum(a[0,j]**2 for j in range(3))
 x,y,z=[a[:,j]/S.sqrt(r) for j in range(3)]
 mul=lambda u,v:u.multiply_elementwise(v)
 E=S.Matrix.hstack(x,y,z,(mul(x,x)-mul(y,y))/S.sqrt(2),
 (mul(x,x)+mul(y,y)-2*mul(z,z))/S.sqrt(6),
 S.sqrt(2)*mul(x,y),S.sqrt(2)*mul(x,z),S.sqrt(2)*mul(y,z))
 assert all(S.simplify(sum(E[:,j]))==0 for j in range(8))
 blocks.append(E)
E=S.Matrix.vstack(*blocks)
G=S.simplify(E.T*E)
expected=S.diag(*([S.Rational(14,3)]*3+[S.Integer(2)]*2+[S.Rational(16,9)]*3))
assert E.shape==(14,8) and G==expected
lam=S.Symbol("lambda")
assert S.factor(G.charpoly(lam).as_expr()-(lam-S.Rational(14,3))**3*(lam-2)**2*(lam-S.Rational(16,9))**3)==0
assert G.det()==S.Rational(44957696,19683)
assert G.rank()==8
assert S.simplify(G.inv()*E.T*E)==S.eye(8)
assert S.Rational(14,3)/S.Rational(16,9)==S.Rational(21,8)
print("Q161ci EXACT PASS: 14x8, Gram diag(14/3 x3,2 x2,16/9 x3), determinant 44957696/19683, kappa2 21/8")
